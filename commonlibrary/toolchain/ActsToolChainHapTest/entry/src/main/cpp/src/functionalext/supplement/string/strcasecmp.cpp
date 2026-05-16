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
 * @tc.name      : Strcasecmp0100
 * @tc.desc      : Verify strcasecmp process success when fist string equal second stirng
 * @tc.level     : Level 0
 */
void Strcasecmp0100(void)
{
    int32_t ret = strcasecmp("aBcDeF", "AbCdEf");
    EXPECT_EQ("Strcasecmp0100", ret, 0);
}

/**
 * @tc.name      : Strcasecmp0200
 * @tc.desc      : Verify strcasecmp process success when fist string less than second stirng
 * @tc.level     : Level 1
 */
void Strcasecmp0200(void)
{
    int32_t ret = strcasecmp("", "AbCdEf");
    EXPECT_LT("Strcasecmp0200", ret, 0);
}

/**
 * @tc.name      : Strcasecmp0300
 * @tc.desc      : Verify strcasecmp process success when fist string more than second stirng
 * @tc.level     : Level 1
 */
void Strcasecmp0300(void)
{
    int32_t ret = strcasecmp("AbCdEf", "");
    EXPECT_MT("Strcasecmp0300", ret, 0);
}

/**
 * @tc.name      : Strcasecmp0400
 * @tc.desc      : Verify strcasecmp process success when fist string is null second stirng is null
 * @tc.level     : Level 1
 */
void Strcasecmp0400(void)
{
    int32_t ret = strcasecmp("", "");
    EXPECT_EQ("Strcasecmp0400", ret, 0);
}

static int StrcasecmpTestImpl(void)
{
    Strcasecmp0100();
    Strcasecmp0200();
    Strcasecmp0300();
    Strcasecmp0400();
    return T_STATUS;
}

int StrcasecmpTest(void)
{
    return StrcasecmpTestImpl();
}
