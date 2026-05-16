/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <cstddef>
#include "functionalext.h"
#include "strops.h"
#include "test.h"

namespace {
constexpr size_t K_STRLWC_TMP_BUF_SIZE = 4U;
constexpr size_t K_STRLWC_TMP_NULL_INDEX = 3U;
constexpr size_t K_EXPECTED_STRLIST_SIZE = 2U;
} // namespace

typedef void (*TEST_FUN)(void);

/**
 * @tc.name      : StropsTest0010
 * @tc.desc      : strlwc test args null
 * @tc.level     : Level 2
 */
void StropsTest0010(void)
{
    char* str = nullptr;
    strlwc(str);
    EXPECT_EQ(__FUNCTION__, str, nullptr);
}

/**
 * @tc.name      : StropsTest0020
 * @tc.desc      : test strlwc with normal input
 * @tc.level     : Level 0
 */
void StropsTest0020(void)
{
    char tmp[K_STRLWC_TMP_BUF_SIZE] = "Abc";
    tmp[K_STRLWC_TMP_NULL_INDEX] = '\0';
    strlwc(tmp);

    EXPECT_EQ(__FUNCTION__, strcmp(tmp, "abc"), 0);
}

/**
 * @tc.name      : StropsTest0030
 * @tc.desc      : strlist_set test arg is nullptr
 * @tc.level     : Level 2
 */
void StropsTest0030(void)
{
    char* str = nullptr;
    strlist_set(nullptr, nullptr);

    EXPECT_EQ(__FUNCTION__, str, nullptr);
}

/**
 * @tc.name      : StropsTest0040
 * @tc.desc      : test strlist_set with normal input
 * @tc.level     : Level 0
 */
void StropsTest0040(void)
{
    strlist list;
    list.size = 1;
    list.num = 1;
    strlist_set(&list, "abc");

    EXPECT_EQ(__FUNCTION__, list.size, K_EXPECTED_STRLIST_SIZE);
}

/**
 * @tc.name      : StropsTest0050
 * @tc.desc      : strtrim test arg is nullptr
 * @tc.level     : Level 2
 */
void StropsTest0050(void)
{
    size_t ret = strtrim(nullptr);
    EXPECT_EQ(__FUNCTION__, ret, 0);
}

TEST_FUN g_gFunArray[] = { StropsTest0010, StropsTest0020, StropsTest0030, StropsTest0040, StropsTest0050 };

static int UnittestLdsoStropsTestImpl(void)
{
    int num = sizeof(g_gFunArray) / sizeof(g_gFunArray[0]);
    for (int pos = 0; pos < num; ++pos) {
        g_gFunArray[pos]();
    }

    return T_STATUS;
}

int UnittestLdsoStropsTest(void)
{
    return UnittestLdsoStropsTestImpl();
}
