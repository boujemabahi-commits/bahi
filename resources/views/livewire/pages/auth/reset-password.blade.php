<?php

use App\Models\User;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Str;
use Illuminate\Validation\Rules\Password as PasswordRule;
use Livewire\Attributes\Layout;
use Livewire\Volt\Component;

new #[Layout('layouts.guest', ['title' => 'إعادة تعيين كلمة المرور'])] class extends Component
{
    public string $token = '';

    public string $email = '';

    public string $password = '';

    public string $password_confirmation = '';

    public function mount(string $token): void
    {
        $this->token = $token;
        $this->email = request()->string('email');
    }

    public function resetPassword(): void
    {
        $this->validate([
            'email' => ['required', 'string', 'email'],
            'password' => ['required', 'string', 'confirmed', PasswordRule::defaults()],
        ]);

        $status = Password::reset(
            $this->only('email', 'password', 'password_confirmation', 'token'),
            function (User $user) {
                $user->forceFill(['password' => $this->password])->save();

                event(new PasswordReset($user));
            }
        );

        if ($status !== Password::PASSWORD_RESET) {
            $this->addError('email', __('الرابط غير صالح أو انتهت صلاحيته. اطلب رابطاً جديداً.'));

            return;
        }

        session()->flash('status', __('تم تحديث كلمة المرور بنجاح. يمكنك الآن تسجيل الدخول.'));

        $this->redirectRoute('login', navigate: false);
    }
}; ?>

<div>
    <h1 class="text-lg font-bold text-ink-900 mb-1">{{ __('إعادة تعيين كلمة المرور') }}</h1>
    <p class="text-sm text-ink-500 mb-6">{{ __('اختر كلمة مرور جديدة لحسابك') }}</p>

    <x-auth-session-status class="mb-4" :status="session('status')" />

    <form wire:submit="resetPassword" class="space-y-4">
        <div>
            <label for="email" class="block text-sm font-semibold text-ink-700 mb-1.5">{{ __('البريد الإلكتروني') }}</label>
            <div class="relative">
                <span class="absolute inset-y-0 start-0 flex items-center ps-3 text-ink-400">
                    <x-icon name="mail" class="w-4 h-4" />
                </span>
                <input wire:model="email" id="email" type="email" name="email" required autofocus
                    class="input" placeholder="you@example.com" />
            </div>
            <x-input-error :messages="$errors->get('email')" class="mt-1.5 text-xs text-red-600" />
        </div>

        <div>
            <label for="password" class="block text-sm font-semibold text-ink-700 mb-1.5">{{ __('كلمة المرور الجديدة') }}</label>
            <div class="relative">
                <span class="absolute inset-y-0 start-0 flex items-center ps-3 text-ink-400">
                    <x-icon name="lock" class="w-4 h-4" />
                </span>
                <input wire:model="password" id="password" type="password" name="password" required autocomplete="new-password"
                    class="input" placeholder="••••••••" />
            </div>
            <x-input-error :messages="$errors->get('password')" class="mt-1.5 text-xs text-red-600" />
        </div>

        <div>
            <label for="password_confirmation" class="block text-sm font-semibold text-ink-700 mb-1.5">{{ __('تأكيد كلمة المرور') }}</label>
            <div class="relative">
                <span class="absolute inset-y-0 start-0 flex items-center ps-3 text-ink-400">
                    <x-icon name="lock" class="w-4 h-4" />
                </span>
                <input wire:model="password_confirmation" id="password_confirmation" type="password" name="password_confirmation" required autocomplete="new-password"
                    class="input" placeholder="••••••••" />
            </div>
            <x-input-error :messages="$errors->get('password_confirmation')" class="mt-1.5 text-xs text-red-600" />
        </div>

        <button type="submit" class="btn-primary w-full justify-center" wire:loading.attr="disabled" wire:target="resetPassword">
            <span wire:loading.remove wire:target="resetPassword">{{ __('تحديث كلمة المرور') }}</span>
            <span wire:loading wire:target="resetPassword">{{ __('جارٍ التحديث...') }}</span>
        </button>
    </form>
</div>
