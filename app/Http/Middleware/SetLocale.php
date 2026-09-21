<?php

namespace App\Http\Middleware;

use App\Support\Locales;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

/** Resolves the request's language: the signed-in user's saved preference, else the guest's session pick, else Arabic. */
class SetLocale
{
    public function handle(Request $request, Closure $next): Response
    {
        $locale = Auth::check() && Auth::user()->locale
            ? Auth::user()->locale
            : session('locale');

        if (! $locale || ! Locales::isSupported($locale)) {
            $locale = Locales::DEFAULT;
        }

        App::setLocale($locale);

        return $next($request);
    }
}
