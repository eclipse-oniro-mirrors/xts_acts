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

#include <cerrno>
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <search.h>
#include "test.h"

namespace {
constexpr size_t K_HCREATE_INVALID_SIZE = static_cast<size_t>(-1);
constexpr size_t K_HSEARCH_BUCKET_COUNT = 13U;
constexpr int K_HSEARCH_VAL0 = 0;
constexpr int K_HSEARCH_VAL1 = 1;
constexpr int K_HSEARCH_VAL2 = 2;
constexpr int K_HSEARCH_VAL3 = 3;
constexpr int K_HSEARCH_VAL4 = 4;
constexpr int K_HSEARCH_VAL5 = 5;
constexpr int K_HSEARCH_VAL6 = 6;
constexpr int K_HSEARCH_VAL7 = 7;
constexpr int K_HSEARCH_VAL8 = 8;
constexpr int K_HSEARCH_VAL9 = 9;
constexpr int K_HSEARCH_VAL10 = 10;
constexpr intptr_t K_HSEARCH_WANT7 = 7;
constexpr intptr_t K_HSEARCH_WANT10 = 10;
} // namespace

static ENTRY* HsearchSet(const char* key, int value)
{
    ENTRY in = { .key = const_cast<char*>(key), .data = reinterpret_cast<void*>(static_cast<uintptr_t>(value)) };
    ENTRY* out = hsearch(in, ENTER);
    if (!out || strcmp(out->key, key) != 0) {
        t_error("hsearch ENTER %s %d failed\n", key, value);
    }
    return out;
}

static ENTRY* HsearchGet(const char* key)
{
    ENTRY in = { .key = const_cast<char*>(key), .data = nullptr };
    return hsearch(in, FIND);
}

static intptr_t HsearchData(const ENTRY* e)
{
    return reinterpret_cast<intptr_t>(e->data);
}

static int SearchHsearchTestImpl()
{
    ENTRY* e;

    if (hcreate(K_HCREATE_INVALID_SIZE) || errno != ENOMEM) {
        t_error("hcreate((size_t)-1) should fail with ENOMEM got %s\n", strerror(errno));
    }
    if (!hcreate(K_HSEARCH_BUCKET_COUNT)) {
        t_error("hcreate(%zu) failed\n", K_HSEARCH_BUCKET_COUNT);
    }
    e = HsearchSet("", K_HSEARCH_VAL0);
    e = HsearchSet("a", K_HSEARCH_VAL1);
    e = HsearchSet("b", K_HSEARCH_VAL2);
    e = HsearchSet("abc", K_HSEARCH_VAL3);
    e = HsearchSet("cd", K_HSEARCH_VAL4);
    e = HsearchSet("e", K_HSEARCH_VAL5);
    e = HsearchSet("ef", K_HSEARCH_VAL6);
    e = HsearchSet("g", K_HSEARCH_VAL7);
    e = HsearchSet("h", K_HSEARCH_VAL8);
    e = HsearchSet("iiiiiiiiii", K_HSEARCH_VAL9);
    if (!HsearchGet("a")) {
        t_error("hsearch FIND a failed\n");
    }
    if (HsearchGet("c")) {
        t_error("hsearch FIND c should fail\n");
    }
    e = HsearchSet("g", K_HSEARCH_VAL10);
    if (e && HsearchData(e) != K_HSEARCH_WANT7) {
        t_error("hsearch ENTER g 10 returned data %d, wanted 7\n", HsearchData(e));
    }
    e = HsearchSet("g", K_HSEARCH_VAL10);
    if (e && HsearchData(e) != K_HSEARCH_WANT7) {
        t_error("hsearch ENTER g 10 returned data %d, wanted 7\n", HsearchData(e));
    }
    e = HsearchSet("j", K_HSEARCH_VAL10);
    if (e && HsearchData(e) != K_HSEARCH_WANT10) {
        t_error("hsearch ENTER j 10 returned data %d, wanted 10\n", HsearchData(e));
    }
    hdestroy();
    return T_STATUS;
}

int SearchHsearchTest(void)
{
    return SearchHsearchTestImpl();
}
