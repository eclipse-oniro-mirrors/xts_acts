/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

#include <cstdint>
#include <cstdlib>
#include <cstring>
#include "functionalext.h"

namespace {
void* LibcRealloc(void* p, size_t newSize, size_t oldSizeWhenNonNull)
{
    if (p == nullptr) {
        return std::malloc(newSize);
    }
    if (newSize == 0U) {
        std::free(p);
        return std::malloc(0);
    }
    void* q = std::malloc(newSize);
    if (q == nullptr) {
        return nullptr;
    }
    const size_t copyLen = (oldSizeWhenNonNull < newSize) ? oldSizeWhenNonNull : newSize;
    if (copyLen != 0U) {
        std::memcpy(q, p, copyLen);
    }
    std::free(p);
    return q;
}
} // namespace

const int32_t RELLOCTLEN = 100;
const int32_t INVALIDLEN = -100;

/**
 * @tc.name:      Realloc0100
 * @tc.desc:      Verify realloc process success when first args is null second args is 50.
 * @tc.level:     level 0.
 */
void Realloc0100(void)
{
    void* ret = LibcRealloc(nullptr, static_cast<size_t>(RELLOCTLEN), 0U);
    EXPECT_PTRNE("Realloc0100", ret, nullptr);
}

/**
 * @tc.name:      Realloc0200
 * @tc.desc:      Verify realloc process success when first args is null second args is 0.
 * @tc.level:     level 2
 */
void Realloc0200(void)
{
    void* ret = LibcRealloc(nullptr, 0U, 0U);
    EXPECT_PTRNE("Realloc0200", ret, nullptr);
}

/**
 * @tc.name:      Realloc0300
 * @tc.desc:      Verify realloc process fail when first args is null second args is -100.
 * @tc.level:     level 2.
 */
void Realloc0300(void)
{
    void* ret = LibcRealloc(nullptr, static_cast<size_t>(INVALIDLEN), 0U);
    EXPECT_PTREQ("Realloc0300", ret, nullptr);
}

/**
 * @tc.name:      Realloc0400
 * @tc.desc:      Verify realloc process success when first args is not null second args is 200
 * @tc.level:     level 0.
 */
void Realloc0400(void)
{
    char* cptr = static_cast<char*>(std::malloc(static_cast<size_t>(RELLOCTLEN)));
    void* ret = LibcRealloc(cptr, static_cast<size_t>(RELLOCTLEN + RELLOCTLEN), static_cast<size_t>(RELLOCTLEN));
    EXPECT_PTRNE("Realloc0400", ret, nullptr);
}

/**
 * @tc.name:      Realloc0500
 * @tc.desc:      Verify realloc process success when first args is not null second args is 100
 * @tc.level:     level  1.
 */
void Realloc0500(void)
{
    char* cptr = static_cast<char*>(std::malloc(static_cast<size_t>(RELLOCTLEN)));
    void* ret = LibcRealloc(cptr, static_cast<size_t>(RELLOCTLEN), static_cast<size_t>(RELLOCTLEN));
    EXPECT_PTRNE("Realloc0500", ret, nullptr);
}

/**
 * @tc.name:      Realloc0600
 * @tc.desc:      Verify realloc process success when first args is not null second args is 50
 * @tc.level:     level 1.
 */
void Realloc0600(void)
{
    char* cptr = static_cast<char*>(std::malloc(static_cast<size_t>(RELLOCTLEN)));
    void* ret = LibcRealloc(cptr, static_cast<size_t>(RELLOCTLEN / 2), static_cast<size_t>(RELLOCTLEN));
    EXPECT_PTRNE("Realloc0600", ret, nullptr);
}

static int ReallocTestImpl(void)
{
    Realloc0100();
    Realloc0200();
    Realloc0300();
    Realloc0400();
    Realloc0500();
    Realloc0600();
    return T_STATUS;
}

int ReallocTest(void)
{
    return ReallocTestImpl();
}
