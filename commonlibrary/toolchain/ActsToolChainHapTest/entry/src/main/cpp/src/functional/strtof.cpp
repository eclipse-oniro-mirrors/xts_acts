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
 
#include <cstdio>
#include <cstdlib>
#include <cmath>
#include "test.h"

template<typename T, size_t N>
static inline constexpr size_t ArrayLength(const T (&)[N])
{
    return N;
}

static struct GTestData {
    char *s;
    float f;
} g_testData[] = {
    {".7006492321624085354618647916449580656401309709382578858785341419448955413429303e-45", 0},
    // 2^-126 + 2^-150 - eps
    {".1175494420887210724209590083408724842314472120785184615334540294131831453944281e-37", 0x1p-126},
    // 2^-126 + 2^-150 + eps
    {".1175494420887210724209590083408724842314472120785184615334540294131831453944282e-37", 0x1.000002p-126},
    // 2^128 - 2^103 - eps
    {"340282356779733661637539395458142568447.9999999999999999999", 0x1.fffffep127},
    // 2^128 - 2^103
    {"340282356779733661637539395458142568448", INFINITY},
    {"10.0", 10.0},
    {"1.0e2", 100.0},
    {"0x1.0p3", 8.0},
};

static int StrtofTestImpl(void)
{
    int i;
    float x;
    char *p;

    for (i = 0; i < ArrayLength(g_testData); i++) {
        x = strtof(g_testData[i].s, &p);
        if (x != g_testData[i].f) {
            t_error("strtof(\"%s\") want %a got %a\n", g_testData[i].s, g_testData[i].f, x);
        }
    }
    return g_tStatus;
}

int StrtofTest(void)
{
    return StrtofTestImpl();
}
