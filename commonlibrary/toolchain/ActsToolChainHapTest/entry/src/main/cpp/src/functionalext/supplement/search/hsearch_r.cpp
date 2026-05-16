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

#include <search.h>
#include "functionalext.h"

const size_t SIZE = 2;
static char* g_data[] = { "HsearchR0100", "HsearchR0200" };

/**
 * @tc.name      : HsearchR0100
 * @tc.desc      : Verify hsearch_r process success
 * @tc.level     : Level 0
 */
void HsearchR0100(void)
{
    struct hsearch_data hData = {};
    int ret;
    EXPECT_NE("HsearchR0100", hcreate_r(SIZE, &hData), 0);
    ENTRY e;
    ENTRY* ep;
    for (int i = 0; i < SIZE; i++) {
        e.key = g_data[i];
        e.data = reinterpret_cast<void*>(&i);
        ret = hsearch_r(e, ENTER, &ep, &hData);
        EXPECT_NE("HsearchR0100", ret, 0);
    }
    hdestroy_r(&hData);
}

/**
 * @tc.name      : HsearchR0200
 * @tc.desc      : Verify hsearch_r process success
 * @tc.level     : Level 2
 */
void HsearchR0200(void)
{
    struct hsearch_data hData = {};
    int ret;
    EXPECT_NE("HsearchR0200", hcreate_r(SIZE, &hData), 0);
    ENTRY e;
    ENTRY* ep;
    for (int i = 0; i < SIZE; i++) {
        e.key = g_data[i];
        ret = hsearch_r(e, FIND, &ep, &hData);
        EXPECT_EQ("HsearchR0200", ret, 0);
    }
    hdestroy_r(&hData);
}

static int HsearchRTestImpl(void)
{
    HsearchR0100();
    HsearchR0200();
    return T_STATUS;
}

int HsearchRTest(void)
{
    return HsearchRTestImpl();
}
