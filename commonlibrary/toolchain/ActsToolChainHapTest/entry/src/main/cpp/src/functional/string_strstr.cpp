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

#include <cstring>
#include "test.h"

namespace {
constexpr int K_WANT_STR_PLUS0 = 0;
constexpr int K_WANT_STR_PLUS1 = 1;
constexpr int K_WANT_STR_PLUS2 = 2;
constexpr int K_WANT_STR_PLUS3 = 3;
constexpr int K_WANT_STR_PLUS4 = 4;
constexpr int K_WANT_STR_PLUS8 = 8;
} // namespace

static void CheckStrstrNotFound(const char* s, const char* sub)
{
    char* p = const_cast<char*>(s);
    char* q = strstr(p, sub);
    if (q != nullptr) {
        t_error("strstr(%s,%s) returned str+%d, wanted nullptr\n", s, sub, q - p);
    }
}

static void CheckStrstrFoundAt(const char* s, const char* sub, int n)
{
    char* p = const_cast<char*>(s);
    char* q = strstr(p, sub);
    if (q == nullptr) {
        t_error("strstr(%s,%s) returned 0, wanted str+%d\n", s, sub, n);
    } else if (q - p != n) {
        t_error("strstr(%s,%s) returned str+%d, wanted str+%d\n", s, sub, q - p, n);
    }
}

static int StringStrstrTestImpl(void)
{
    CheckStrstrNotFound("", "a");
    CheckStrstrNotFound("a", "aa");
    CheckStrstrNotFound("a", "b");
    CheckStrstrNotFound("aa", "ab");
    CheckStrstrNotFound("aa", "aaa");
    CheckStrstrNotFound("abba", "aba");
    CheckStrstrNotFound("abc abc", "abcd");
    CheckStrstrNotFound("0-1-2-3-4-5-6-7-8-9", "-3-4-56-7-8-");
    CheckStrstrNotFound("0-1-2-3-4-5-6-7-8-9", "-3-4-5+6-7-8-");
    CheckStrstrNotFound("_ _ _\xff_ _ _", "_\x7f_");
    CheckStrstrNotFound("_ _ _\x7f_ _ _", "_\xff_");
    CheckStrstrFoundAt("", "", K_WANT_STR_PLUS0);
    CheckStrstrFoundAt("abcd", "", K_WANT_STR_PLUS0);
    CheckStrstrFoundAt("abcd", "a", K_WANT_STR_PLUS0);
    CheckStrstrFoundAt("abcd", "b", K_WANT_STR_PLUS1);
    CheckStrstrFoundAt("abcd", "c", K_WANT_STR_PLUS2);
    CheckStrstrFoundAt("abcd", "d", K_WANT_STR_PLUS3);
    CheckStrstrFoundAt("abcd", "ab", K_WANT_STR_PLUS0);
    CheckStrstrFoundAt("abcd", "bc", K_WANT_STR_PLUS1);
    CheckStrstrFoundAt("abcd", "cd", K_WANT_STR_PLUS2);
    CheckStrstrFoundAt("ababa", "baba", K_WANT_STR_PLUS1);
    CheckStrstrFoundAt("ababab", "babab", K_WANT_STR_PLUS1);
    CheckStrstrFoundAt("abababa", "bababa", K_WANT_STR_PLUS1);
    CheckStrstrFoundAt("abababab", "bababab", K_WANT_STR_PLUS1);
    CheckStrstrFoundAt("ababababa", "babababa", K_WANT_STR_PLUS1);
    CheckStrstrFoundAt("abbababab", "bababa", K_WANT_STR_PLUS2);
    CheckStrstrFoundAt("abbababab", "ababab", K_WANT_STR_PLUS3);
    CheckStrstrFoundAt("abacabcabcab", "abcabcab", K_WANT_STR_PLUS4);
    CheckStrstrFoundAt("nanabanabanana", "aba", K_WANT_STR_PLUS3);
    CheckStrstrFoundAt("nanabanabanana", "ban", K_WANT_STR_PLUS4);
    CheckStrstrFoundAt("nanabanabanana", "anab", K_WANT_STR_PLUS1);
    CheckStrstrFoundAt("nanabanabanana", "banana", K_WANT_STR_PLUS8);
    CheckStrstrFoundAt("_ _\xff_ _", "_\xff_", K_WANT_STR_PLUS2);
    return T_STATUS;
}

int StringStrstrTest(void)
{
    return StringStrstrTestImpl();
}
