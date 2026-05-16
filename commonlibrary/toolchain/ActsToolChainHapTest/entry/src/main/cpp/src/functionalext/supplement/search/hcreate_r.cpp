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

/**
 * @tc.name      : HcreateR0100
 * @tc.desc      : Verify hcreate_r process success
 * @tc.level     : Level 0
 */
void HcreateR0100(void)
{
    struct hsearch_data hData = {};
    int ret;
    EXPECT_NE("HcreateR0100", hcreate_r(SIZE, &hData), 0);
    hdestroy_r(&hData);
}

/**
 * @tc.name      : HcreateR0200
 * @tc.desc      : Verify hcreate_r process fail
 * @tc.level     : Level 2
 */
void HcreateR0200(void)
{
    struct hsearch_data hData = {};
    EXPECT_EQ("HcreateR0200", hcreate_r(-1, &hData), 0);
}

static int HcreateRTestImpl(void)
{
    HcreateR0100();
    HcreateR0200();
    return T_STATUS;
}

int HcreateRTest(void)
{
    return HcreateRTestImpl();
}
