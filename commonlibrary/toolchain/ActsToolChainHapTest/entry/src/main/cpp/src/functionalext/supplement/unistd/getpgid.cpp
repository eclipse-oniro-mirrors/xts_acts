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

#include <unistd.h>
#include "functionalext.h"

#define TEST_POSITIVE_PID 9999999
#define TEST_NEGTIVE_PID (-100)

/**
 * @tc.name      : Getpgid0100
 * @tc.desc      : Get process groupid
 * @tc.level     : Level 0
 */
void Getpgid0100(void)
{
    pid_t pid = getpgid(0);
    EXPECT_TRUE("Getpgid0100", pid >= 0);
    pid = getpgid(TEST_POSITIVE_PID);
    EXPECT_EQ("Getpgid0100", pid, -1);
    pid = getpgid(TEST_NEGTIVE_PID);
    EXPECT_EQ("Getpgid0100", pid, -1);
}

static int GetpgidTestImpl(void)
{
    Getpgid0100();
    return T_STATUS;
}

int GetpgidTest(void)
{
    return GetpgidTestImpl();
}
