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

#include <cstdlib>
#include <cstring>
#include "functionalext.h"

/**
 * @tc.name      : Strcoll0100
 * @tc.desc      : Verify strcoll process success when fist string equal second stirng
 * @tc.level     : Level 0
 */
void Strcoll0100(void)
{
    int32_t ret = strcoll("aBcDeF", "aBcDeF");
    EXPECT_EQ("Strcoll0100", ret, 0);
}

/**
 * @tc.name      : Strcoll0200
 * @tc.desc      : Verify strcoll process success when fist string less than second stirng
 * @tc.level     : Level 1
 */
void Strcoll0200(void)
{
    int32_t ret = strcoll("", "AbCdEf");
    EXPECT_LT("Strcoll0200", ret, 0);
}

/**
 * @tc.name      : Strcoll0300
 * @tc.desc      : Verify strcoll process success when fist string more than second stirng
 * @tc.level     : Level 1
 */
void Strcoll0300(void)
{
    int32_t ret = strcoll("AbCdEf", "");
    EXPECT_MT("Strcoll0300", ret, 0);
}

/**
 * @tc.name      : Strcoll0400
 * @tc.desc      : Verify strcoll process success when fist string is null second stirng is null
 * @tc.level     : Level 1
 */
void Strcoll0400(void)
{
    int32_t ret = strcoll("", "");
    EXPECT_EQ("Strcoll0400", ret, 0);
}

static int StrcollTestImpl(void)
{
    Strcoll0100();
    Strcoll0200();
    Strcoll0300();
    Strcoll0400();
    return T_STATUS;
}

int StrcollTest(void)
{
    return StrcollTestImpl();
}
