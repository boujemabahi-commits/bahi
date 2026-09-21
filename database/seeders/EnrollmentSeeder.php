<?php

namespace Database\Seeders;

use App\Models\Enrollment;
use App\Models\Student;
use App\Models\Tenant;
use Illuminate\Database\Seeder;

/**
 * One enrollment per seeded student, derived the same way Phase 1's
 * Mock\Enrollments did: price from the course, a repeating discount pattern,
 * and paid/remaining/status consistent with the student's financial_status.
 */
class EnrollmentSeeder extends Seeder
{
    protected array $discounts = [0, 0, 50, 0, 100, 0, 0, 150];

    /** Most students pay monthly; a few are on a multi-month pack. */
    protected array $durations = [1, 1, 1, 3, 1, 1, 6, 1, 1, 1, 3, 12];

    public function run(): void
    {
        Tenant::all()->each(function (Tenant $tenant) {
            Student::withoutGlobalScopes()
                ->where('tenant_id', $tenant->id)
                ->with('course')
                ->orderBy('id')
                ->get()
                ->each(function (Student $student, int $i) use ($tenant) {
                    $duration = $this->durations[$i % count($this->durations)];
                    $price = (int) ($student->course?->price ?? 900) * $duration;
                    $discount = $this->discounts[$i % count($this->discounts)];
                    $net = $price - $discount;

                    $paid = (int) round($net * match ($student->financial_status) {
                        'مؤدي' => 1.0,
                        'جزئي' => 0.5,
                        default => 0.0,
                    });

                    $settled = Enrollment::settle($price, $discount, $paid);

                    // Paid-up students are due again later this month / next month;
                    // partial and unpaid ones are already past their due date.
                    $dueDate = $settled['status'] === 'مكتمل'
                        ? today()->addDays(1 + ($i % (28 * $duration)))
                        : today()->subDays(1 + ($i % 20));

                    Enrollment::create([
                        'tenant_id' => $tenant->id,
                        'student_id' => $student->id,
                        'course_id' => $student->course_id,
                        'group_id' => $student->group_id,
                        'date' => $student->registered_at,
                        'due_date' => $dueDate,
                        'price' => $price,
                        'discount' => $discount,
                        'duration_months' => $duration,
                    ] + $settled);
                });
        });
    }
}
