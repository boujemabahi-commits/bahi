<?php

namespace App\Support;

/** The 3 languages the app is available in. */
class Locales
{
    public const SUPPORTED = ['ar', 'fr', 'en'];

    public const DEFAULT = 'ar';

    public const LABELS = [
        'ar' => 'العربية',
        'fr' => 'Français',
        'en' => 'English',
    ];

    public const RTL = ['ar'];

    public static function isSupported(string $locale): bool
    {
        return in_array($locale, self::SUPPORTED, true);
    }

    public static function direction(?string $locale = null): string
    {
        return in_array($locale ?? app()->getLocale(), self::RTL, true) ? 'rtl' : 'ltr';
    }
}
