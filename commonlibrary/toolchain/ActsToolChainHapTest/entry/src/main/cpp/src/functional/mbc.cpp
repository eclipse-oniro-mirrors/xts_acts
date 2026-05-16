/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <clocale>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cwchar>
#include <langinfo.h>
#include "test.h"

/*
 * f = function call to test (or any expression)
 * x = expected result
 * m = message to print on failure
 *
 * Reset pointer `pst` is always `&st` here (even when `f` uses `&st2`): the original libc-test macro
 * always zeroed `st` before each check so `st2` keeps partial conversion state across mbrtowc →
 * mbsrtowcs. Passing `&st2` as `pst` would clear the wrong object and break resume cases.
 */
#define t(f, x, m, pst)                                                                            \
    do {                                                                                           \
        int tmp;                                                                                   \
        *(pst) = mbstate_t{};                                                                      \
        (void)((tmp = (f)) == (x) || t_error("%s failed (%s) got %d want %d\n", #f, m, tmp, (x))); \
    } while (0)
#define TCHAR(f, x, m, pst)                                                                                \
    do {                                                                                                   \
        int tmp;                                                                                           \
        *(pst) = mbstate_t{};                                                                              \
        (void)((tmp = (f)) == (x) || t_error("%s failed (%s) got 0x%04x want 0x%04x\n", #f, m, tmp, (x))); \
    } while (0)

static void MbcTestMbsrtowcsCases(const char*& cs, mbstate_t& st, wchar_t* wcs)
{
    t(mbsrtowcs(wcs, (cs = "abcdef", &cs), 3, &st), 3, "wrong semantics for wcs buf len", &st);
    t(mbsrtowcs(wcs, (cs = "abcdef", &cs), 8, &st), 6, "wrong semantics for wcs buf len", &st);
    t(mbsrtowcs(nullptr, (cs = "abcdef", &cs), 2, &st), 6, "wrong semantics for nullptr wcs", &st);
}

static void MbcTestUtf8IllegalAndBoundaryCases(mbstate_t& st, wchar_t& wc)
{
    t(mbrtowc(&wc, "\x80", 1, &st), -1, "failed to catch error", &st);
    t(mbrtowc(&wc, "\xc0", 1, &st), -1, "failed to catch illegal initial", &st);
    t(mbrtowc(&wc, "\xc0\x80", 2, &st), -1, "aliasing nul", &st);
    t(mbrtowc(&wc, "\xc0\xaf", 2, &st), -1, "aliasing slash", &st);
    t(mbrtowc(&wc, "\xe0\x80\xaf", 3, &st), -1, "aliasing slash", &st);
    t(mbrtowc(&wc, "\xf0\x80\x80\xaf", 4, &st), -1, "aliasing slash", &st);
    t(mbrtowc(&wc, "\xf8\x80\x80\x80\xaf", 5, &st), -1, "aliasing slash", &st);
    t(mbrtowc(&wc, "\xfc\x80\x80\x80\x80\xaf", 6, &st), -1, "aliasing slash", &st);
    t(mbrtowc(&wc, "\xe0\x82\x80", 3, &st), -1, "aliasing U+0080", &st);
    t(mbrtowc(&wc, "\xe0\x9f\xbf", 3, &st), -1, "aliasing U+07FF", &st);
    t(mbrtowc(&wc, "\xf0\x80\xa0\x80", 4, &st), -1, "aliasing U+0800", &st);
    t(mbrtowc(&wc, "\xf0\x8f\xbf\xbd", 4, &st), -1, "aliasing U+FFFD", &st);
    t(mbrtowc(&wc, "\xed\xa0\x80", 3, &st), -1, "failed to catch surrogate", &st);
    t(mbrtowc(&wc, "\xef\xbf\xbe", 3, &st), 3, "failed to accept U+FFFE", &st);
    t(mbrtowc(&wc, "\xef\xbf\xbf", 3, &st), 3, "failed to accept U+FFFF", &st);
    t(mbrtowc(&wc, "\xf4\x8f\xbf\xbe", 4, &st), 4, "failed to accept U+10FFFE", &st);
    t(mbrtowc(&wc, "\xf4\x8f\xbf\xbf", 4, &st), 4, "failed to accept U+10FFFF", &st);
}

static void MbcTestUtf8ResumeCases(const char*& cs, mbstate_t& st, mbstate_t& st2, wchar_t& wc, wchar_t* wcs)
{
    t(mbrtowc(&wc, "\xc2\x80", 2, &st), 2, "wrong length", &st);
    TCHAR((mbrtowc(&wc, "\xc2\x80", 2, &st), wc), 0x80, "wrong char", &st);
    t(mbrtowc(&wc, "\xe0\xa0\x80", 3, &st), 3, "wrong length", &st);
    TCHAR((mbrtowc(&wc, "\xe0\xa0\x80", 3, &st), wc), 0x800, "wrong char", &st);
    t(mbrtowc(&wc, "\xf0\x90\x80\x80", 4, &st), 4, "wrong length", &st);
    TCHAR((mbrtowc(&wc, "\xf0\x90\x80\x80", 4, &st), wc), 0x10000, "wrong char", &st);
    st2 = mbstate_t{};
    t(mbrtowc(&wc, "\xc2", 1, &st2), -2, "failed to accept initial byte", &st);
    t(mbrtowc(&wc, "\x80", 1, &st2), 1, "failed to resume", &st);
    TCHAR(wc, 0x80, "wrong char", &st);
    st2 = mbstate_t{};
    t(mbrtowc(&wc, "\xc2", 1, &st2), -2, "failed to accept initial byte", &st);
    t(mbsrtowcs(wcs,
                (cs = "\xa0"
                      "abc",
                 &cs),
                32,
                &st2),
      4,
      "failed to resume",
      &st);
    TCHAR(wcs[0], 0xa0, "wrong char", &st);
    TCHAR(wcs[1], 'a', "wrong char", &st);
    t(!cs, 1, "wrong final position", &st);
}

static int MbcTestImpl(void)
{
    const char* cs;
    mbstate_t st;
    mbstate_t st2;
    wchar_t wc;
    wchar_t wcs[32];

    (void)(setlocale(LC_CTYPE, "en_US.UTF-8") || setlocale(LC_CTYPE, "en_GB.UTF-8") ||
           setlocale(LC_CTYPE, "en.UTF-8") || setlocale(LC_CTYPE, "POSIX.UTF-8") || setlocale(LC_CTYPE, "C.UTF-8") ||
           setlocale(LC_CTYPE, "UTF-8") || setlocale(LC_CTYPE, ""));
    MbcTestMbsrtowcsCases(cs, st, wcs);

    if (strcmp(nl_langinfo(CODESET), "UTF-8")) {
        return t_error("cannot set UTF-8 locale for test (codeset=%s)\n", nl_langinfo(CODESET));
    }
    MbcTestUtf8IllegalAndBoundaryCases(st, wc);
    MbcTestUtf8ResumeCases(cs, st, st2, wc, wcs);
    return T_STATUS;
}

int MbcTest(void)
{
    return MbcTestImpl();
}
