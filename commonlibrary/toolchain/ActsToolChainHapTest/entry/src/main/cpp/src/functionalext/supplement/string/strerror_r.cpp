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

#define BUFSIZE 1024
const int32_t INVALID_PARAM = 1;

/**
 * @tc.name      : StrerrorR0100
 * @tc.desc      : Verify strerror_r process success
 * @tc.level     : Level 0
 */
void StrerrorR0100(void)
{
    char src[BUFSIZE] = "StrerrorR0100";
    int32_t ret = strerror_r(EDOM, src, BUFSIZE);
    EXPECT_EQ("StrerrorR0100", ret, 0);
}

/**
 * @tc.name      : StrerrorR0200
 * @tc.desc      : Verify strerror_r process success when thrid param is 0
 * @tc.level     : Level 1
 */
void StrerrorR0200(void)
{
    char src[BUFSIZE] = "Strcasecmp0200";
    int32_t ret = strerror_r(EDOM, src, 0);
    EXPECT_EQ("StrerrorR0200", ret, ERANGE);
}

/**
 * @tc.name      : StrerrorR0300
 * @tc.desc      : Verify strerror_r process success when thrid param is 1
 * @tc.level     : Level 1
 */
void StrerrorR0300(void)
{
    char src[BUFSIZE] = "StrerrorR0300";
    int32_t ret = strerror_r(EDOM, src, INVALID_PARAM);
    EXPECT_EQ("StrerrorR0300", ret, ERANGE);
}

static int StrerrorRTestImpl(void)
{
    StrerrorR0100();
    StrerrorR0200();
    StrerrorR0300();
    return T_STATUS;
}

int StrerrorRTest(void)
{
    return StrerrorRTestImpl();
}
