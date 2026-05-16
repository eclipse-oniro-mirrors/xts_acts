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

// commit: b7bfb5c3a8330002250f304cb5deb522fa054eae
// fix iconv conversions for iso88592-iso885916
#include <cstdint>
#include <cstring>
#include <iconv.h>
#include "test.h"

namespace {
constexpr int K_BYTE_VALUE_COUNT = 256;
constexpr int K_BYTE_MAX_VALUE = 255;
} // namespace

static void FillAllCodepoints(char* allCodepoints)
{
    for (int i = 0; i < K_BYTE_VALUE_COUNT; i++) {
        allCodepoints[i] = static_cast<char>(K_BYTE_MAX_VALUE - i);
    }
}

static void IconvRoundtripOneCharset(const char* charset, const char* allCodepoints)
{
    iconv_t there = iconv_open("UTF-8", charset);
    if (there == reinterpret_cast<iconv_t>(static_cast<uintptr_t>(-1))) {
        return;
    }
    iconv_t andback = iconv_open(charset, "UTF-8");
    if (andback == reinterpret_cast<iconv_t>(static_cast<uintptr_t>(-1))) {
        iconv_close(there);
        return;
    }
    char u8buf[1024];
    char buf[K_BYTE_VALUE_COUNT];
    char* inPtr1 = const_cast<char*>(allCodepoints);
    size_t inLeft1 = K_BYTE_VALUE_COUNT;
    char* outPtr1 = u8buf;
    size_t outLeft1 = sizeof u8buf;
    int r1 = iconv(there, &inPtr1, &inLeft1, &outPtr1, &outLeft1);
    size_t u8len = sizeof u8buf - outLeft1;
    char* inPtr2 = u8buf;
    size_t inLeft2 = u8len;
    char* outPtr2 = buf;
    size_t outLeft2 = sizeof buf;
    int r2 = iconv(andback, &inPtr2, &inLeft2, &outPtr2, &outLeft2);
    if (r1) {
        t_error("got %d converting from %s\n", r1, charset);
    }
    if (r2) {
        t_error("got %d converting back to %s\n", r2, charset);
    }
    if (memcmp(allCodepoints, buf, sizeof buf)) {
        t_error("round trip corrupted %s characters\n", charset);
    }
    iconv_close(there);
    iconv_close(andback);
}

static int IconvRoundtripsTestImpl(void)
{
    static char* testCharsets[] = { "iso-8859-1",  "iso-8859-2",  "iso-8859-4",  "iso-8859-5",
                                    "iso-8859-9",  "iso-8859-10", "iso-8859-13", "iso-8859-14",
                                    "iso-8859-15", "iso-8859-16", nullptr };
    char allCodepoints[K_BYTE_VALUE_COUNT];
    FillAllCodepoints(allCodepoints);
    for (int i = 0; testCharsets[i]; i++) {
        IconvRoundtripOneCharset(testCharsets[i], allCodepoints);
    }

    return T_STATUS;
}

int IconvRoundtripsTest(void)
{
    return IconvRoundtripsTestImpl();
}
