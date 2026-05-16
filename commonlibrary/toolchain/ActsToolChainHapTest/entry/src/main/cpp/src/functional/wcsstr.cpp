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

#include <cwchar>
#include "test.h"

namespace {
constexpr int K_WANT_STR_PLUS0 = 0;
constexpr int K_WANT_STR_PLUS1 = 1;
constexpr int K_WANT_STR_PLUS2 = 2;
constexpr int K_WANT_STR_PLUS3 = 3;
constexpr int K_WANT_STR_PLUS4 = 4;
constexpr int K_WANT_STR_PLUS8 = 8;
} // namespace

static void CheckWcsstrNotFound(const wchar_t* s, const wchar_t* sub)
{
    wchar_t* p = const_cast<wchar_t*>(s);
    wchar_t* q = wcsstr(p, sub);
    if (q != nullptr) {
        t_error("wcsstr(%ls,%ls) returned str+%d, wanted nullptr\n", s, sub, q - p);
    }
}

static void CheckWcsstrFoundAt(const wchar_t* s, const wchar_t* sub, int n)
{
    wchar_t* p = const_cast<wchar_t*>(s);
    wchar_t* q = wcsstr(p, sub);
    if (q == nullptr) {
        t_error("wcsstr(%ls,%ls) returned 0, wanted str+%d\n", s, sub, n);
    } else if (q - p != n) {
        t_error("wcsstr(%ls,%ls) returned str+%d, wanted str+%d\n", s, sub, q - p, n);
    }
}

static int WcsstrTestImpl(void)
{
    CheckWcsstrNotFound(L"", L"a");
    CheckWcsstrNotFound(L"a", L"aa");
    CheckWcsstrNotFound(L"a", L"b");
    CheckWcsstrNotFound(L"aa", L"ab");
    CheckWcsstrNotFound(L"aa", L"aaa");
    CheckWcsstrNotFound(L"abba", L"aba");
    CheckWcsstrNotFound(L"abc abc", L"abcd");
    CheckWcsstrNotFound(L"0-1-2-3-4-5-6-7-8-9", L"-3-4-56-7-8-");
    CheckWcsstrNotFound(L"0-1-2-3-4-5-6-7-8-9", L"-3-4-5+6-7-8-");
    CheckWcsstrNotFound(L"_ _ _\xff_ _ _", L"_\x7f_");
    CheckWcsstrNotFound(L"_ _ _\x7f_ _ _", L"_\xff_");
    CheckWcsstrFoundAt(L"", L"", K_WANT_STR_PLUS0);
    CheckWcsstrFoundAt(L"abcd", L"", K_WANT_STR_PLUS0);
    CheckWcsstrFoundAt(L"abcd", L"a", K_WANT_STR_PLUS0);
    CheckWcsstrFoundAt(L"abcd", L"b", K_WANT_STR_PLUS1);
    CheckWcsstrFoundAt(L"abcd", L"c", K_WANT_STR_PLUS2);
    CheckWcsstrFoundAt(L"abcd", L"d", K_WANT_STR_PLUS3);
    CheckWcsstrFoundAt(L"abcd", L"ab", K_WANT_STR_PLUS0);
    CheckWcsstrFoundAt(L"abcd", L"bc", K_WANT_STR_PLUS1);
    CheckWcsstrFoundAt(L"abcd", L"cd", K_WANT_STR_PLUS2);
    CheckWcsstrFoundAt(L"ababa", L"baba", K_WANT_STR_PLUS1);
    CheckWcsstrFoundAt(L"ababab", L"babab", K_WANT_STR_PLUS1);
    CheckWcsstrFoundAt(L"abababa", L"bababa", K_WANT_STR_PLUS1);
    CheckWcsstrFoundAt(L"abababab", L"bababab", K_WANT_STR_PLUS1);
    CheckWcsstrFoundAt(L"ababababa", L"babababa", K_WANT_STR_PLUS1);
    CheckWcsstrFoundAt(L"abbababab", L"bababa", K_WANT_STR_PLUS2);
    CheckWcsstrFoundAt(L"abbababab", L"ababab", K_WANT_STR_PLUS3);
    CheckWcsstrFoundAt(L"abacabcabcab", L"abcabcab", K_WANT_STR_PLUS4);
    CheckWcsstrFoundAt(L"nanabanabanana", L"aba", K_WANT_STR_PLUS3);
    CheckWcsstrFoundAt(L"nanabanabanana", L"ban", K_WANT_STR_PLUS4);
    CheckWcsstrFoundAt(L"nanabanabanana", L"anab", K_WANT_STR_PLUS1);
    CheckWcsstrFoundAt(L"nanabanabanana", L"banana", K_WANT_STR_PLUS8);
    CheckWcsstrFoundAt(L"_ _\xff_ _", L"_\xff_", K_WANT_STR_PLUS2);
    return T_STATUS;
}

int WcsstrTest(void)
{
    return WcsstrTestImpl();
}
