<?php

namespace App\Http\Controllers;

use App\Models\Enrollment;
use App\Models\Student;
use App\Support\Analytics;

class ReportsController extends Controller
{
    public function index()
    {
        Enrollment::rolloverDue();

        $month = Analytics::monthLabel(now());
        $collection = Analytics::collectionRate();
        $expenses = Analytics::expensesThisMonth()['stats'];
        $salaries = Analytics::salaryTotals();
        $attendance = Analytics::attendanceThisMonth();

        $enrollmentsThisMonth = Enrollment::whereYear('date', now()->year)->whereMonth('date', now()->month)->count();

        $sections = [
            ['title' => __('تقارير الطلاب'), 'icon' => 'users', 'tone' => 'brand', 'stats' => [
                __('إجمالي الطلاب') => Student::count(),
                __('تسجيلات جديدة (شهرياً)') => $enrollmentsThisMonth,
                __('معدل الاستمرارية') => Analytics::retentionRate().'%',
            ]],
            ['title' => __('التسجيلات'), 'icon' => 'clipboard-list', 'tone' => 'blue', 'stats' => [
                __('هذا الشهر') => $enrollmentsThisMonth,
                __('إجمالي التسجيلات') => Enrollment::count(),
                __('متوسط قيمة التسجيل') => mad(Analytics::averageEnrollmentValue()),
            ]],
            ['title' => __('الإيرادات'), 'icon' => 'banknote', 'tone' => 'violet', 'stats' => [
                __('إيرادات :month', ['month' => $month]) => mad(Analytics::revenueThisMonth()),
                __('نسبة التحصيل') => $collection['rate'].'%',
                __('مبالغ متبقية') => mad($collection['remaining']),
            ]],
            ['title' => __('المصاريف'), 'icon' => 'receipt', 'tone' => 'rose', 'stats' => [
                __('مصاريف :month', ['month' => $month]) => mad($expenses['total_this_month']),
                __('أكبر فئة') => __($expenses['biggest_category']),
                __('المعدل اليومي') => mad($expenses['avg_daily']),
            ]],
            ['title' => __('أجور الأساتذة'), 'icon' => 'wallet', 'tone' => 'amber', 'stats' => [
                __('إجمالي الأجور') => mad($salaries['total']),
                __('المدفوع') => mad($salaries['paid']),
                __('المتبقي') => mad($salaries['remaining']),
            ]],
            ['title' => __('الحضور'), 'icon' => 'calendar-check', 'tone' => 'teal', 'stats' => [
                __('معدل الحضور العام') => $attendance['rate'].'%',
                __('حالات الغياب') => $attendance['absences'],
                __('حالات التأخر') => $attendance['lateness'],
            ]],
        ];

        return view('reports.index', [
            'sections' => $sections,
            'revenue' => Analytics::revenueByMonth(6),
        ]);
    }
}
