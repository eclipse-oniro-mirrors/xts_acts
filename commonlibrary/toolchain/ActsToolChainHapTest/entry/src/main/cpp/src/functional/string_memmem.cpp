/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *	http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/* Enable GNU extensions
 * This is a standard feature test macro, not a user-defined identifier.
 * Required for memmem() function which is a GNU extension.
 */
#ifndef _GNU_SOURCE
#endif
#include <cstring>
#include "test.h"

struct MemmemTestParams {
    const char *s;
    const char *tail;
    const char *sub;
    const char *sExpr;
    const char *tailExpr;
    const char *subExpr;
};

static inline void TestMemmemNotFound(const struct MemmemTestParams *params)
{
    const char *p = params->tail;
    const void *q = memmem(p, strlen(params->s), params->sub, strlen(params->sub));
    if (q) {
        t_error("memmem(%s %s, %d, %s, %d) returned str+%d, wanted 0\n",
            params->sExpr, params->tailExpr, static_cast<int>(strlen(params->s)),
            params->subExpr, static_cast<int>(strlen(params->sub)),
            static_cast<int>(static_cast<const char *>(q) - p));
    }
}

static inline void TestMemmemFound(const char *s, const char *sub, int n, const char *sExpr, const char *subExpr)
{
    const char *p = s;
    const void *q = memmem(p, strlen(p), sub, strlen(sub));
    if (q == nullptr) {
        t_error("memmem(%s,%s) returned 0, wanted str+%d\n", sExpr, subExpr, n);
    } else if ((static_cast<const char *>(q) - p) != n) {
        t_error("memmem(%s,%s) returned str+%d, wanted str+%d\n",
            sExpr, subExpr, static_cast<int>(static_cast<const char *>(q) - p), n);
    }
}

#define N(s, tail, sub) do { \
    struct MemmemTestParams params = {s, s tail, sub, #s, #tail, #sub}; \
    TestMemmemNotFound(&params); \
} while (0)
#define T(s, sub, n) TestMemmemFound(s, sub, n, #s, #sub)

static int StringMemmemTestImpl(void)
{
    N("", "a", "a");
    N("a", "a", "aa");
    N("a", "b", "b");
    N("aa", "b", "ab");
    N("aa", "a", "aaa");
    N("aba", "b", "bab");
    N("abba", "b", "bab");
    N("abba", "ba", "aba");
    N("abc abc", "d", "abcd");
    N("0-1-2-3-4-5-6-7-8-9", "", "-3-4-56-7-8-");
    N("0-1-2-3-4-5-6-7-8-9", "", "-3-4-5+6-7-8-");
    N("_ _ _\xff_ _ _", "\x7f_", "_\x7f_");
    N("_ _ _\x7f_ _ _", "\xff_", "_\xff_");

    T("", "", 0);
    T("abcd", "", 0);
    T("abcd", "a", 0);
    T("abcd", "b", 1);
    T("abcd", "c", 2);
    T("abcd", "d", 3);
    T("abcd", "ab", 0);
    T("abcd", "bc", 1);
    T("abcd", "cd", 2);
    T("ababa", "baba", 1);
    T("ababab", "babab", 1);
    T("abababa", "bababa", 1);
    T("abababab", "bababab", 1);
    T("ababababa", "babababa", 1);
    T("abbababab", "bababa", 2);
    T("abbababab", "ababab", 3);
    T("abacabcabcab", "abcabcab", 4);
    T("nanabanabanana", "aba", 3);
    T("nanabanabanana", "ban", 4);
    T("nanabanabanana", "anab", 1);
    T("nanabanabanana", "banana", 8);
    T("_ _\xff_ _", "_\xff_", 2);

    return g_tStatus;
}

int StringMemmemTest(void)
{
    return StringMemmemTestImpl();
}

