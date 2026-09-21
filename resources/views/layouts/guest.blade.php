<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}" dir="{{ \App\Support\Locales::direction() }}" class="h-full">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#059669" />
    <title>{{ __($title ?? 'تسجيل الدخول') }} · JadPro</title>
    <link rel="icon" href="/favicon.ico" sizes="any">
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    @livewireStyles
</head>
<body class="h-full bg-ink-50 font-sans text-ink-800 antialiased">
    <div class="absolute top-4 end-4 flex items-center gap-1 text-xs">
        @foreach (\App\Support\Locales::LABELS as $code => $label)
            <a href="{{ route('lang.switch', $code) }}"
                class="px-2 py-1 rounded-lg font-semibold {{ app()->getLocale() === $code ? 'bg-brand-600 text-white' : 'text-ink-500 hover:bg-ink-100' }}">{{ $label }}</a>
        @endforeach
    </div>
    <div class="min-h-full flex flex-col items-center justify-center px-4 py-10">
        <div class="mb-8 flex items-center gap-3">
            <span class="inline-flex items-center justify-center w-11 h-11 rounded-xl bg-brand-600 text-white font-extrabold text-xl shrink-0">J</span>
            <div class="leading-tight text-start">
                <p class="font-extrabold text-xl tracking-wide text-ink-900">JadPro</p>
                <p class="text-[11px] text-ink-500">{{ __('منصة تسيير مراكز التكوين') }}</p>
            </div>
        </div>

        <div class="w-full {{ $maxWidth ?? 'max-w-sm' }} card p-6 sm:p-8">
            {{ $slot }}
        </div>

        <p class="mt-6 text-xs text-ink-400">© {{ date('Y') }} JadPro — {{ __('جميع الحقوق محفوظة') }}. {{ __('صُنع بواسطة') }} IAM Agency</p>
    </div>

    <x-toast-container />
    @livewireScripts
</body>
</html>
