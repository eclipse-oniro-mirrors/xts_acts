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

#include <sys/resource.h>
#include <unistd.h>
#include "functionalext.h"

/**
 * @tc.name      : Prlimit0100
 * @tc.desc      : Set the heap size of the process, and re-get the heap size value of the process
 * @tc.level     : Level 0
 */
void Prlimit0100(void)
{
    static const unsigned long long lim = 4;
    struct rlimit newLimit = { .rlim_cur = lim, .rlim_max = lim };

    struct rlimit oldLimit = { .rlim_cur = 0, .rlim_max = 0 };

    int ret = prlimit(getpid(), RLIMIT_STACK, &newLimit, nullptr);
    EXPECT_EQ("Prlimit0100", ret, CMPFLAG);
    ret = prlimit(getpid(), RLIMIT_STACK, nullptr, &oldLimit);
    EXPECT_EQ("Prlimit0100", ret, CMPFLAG);
    EXPECT_LONGLONGEQ("Prlimit0100", oldLimit.rlim_cur, lim);
    EXPECT_LONGLONGEQ("Prlimit0100", oldLimit.rlim_max, lim);
}

/**
 * @tc.name      : Prlimit0200
 * @tc.desc      : An illegal parameter was passed in, setting the process limit parameter failed
 * @tc.level     : Level 2
 */
void Prlimit0200(void)
{
    static const unsigned long long lim = 4;
    struct rlimit newLimit = { .rlim_cur = lim, .rlim_max = lim };

    int ret = prlimit(getpid(), -1, &newLimit, nullptr);
    EXPECT_EQ("Prlimit0200", ret, ERREXPECT);

    newLimit.rlim_cur = lim + 1;
    ret = prlimit(getpid(), RLIMIT_STACK, &newLimit, nullptr);
    EXPECT_EQ("Prlimit0200", ret, ERREXPECT);
}

static int PrlimitTestImpl(void)
{
    Prlimit0100();
    Prlimit0200();

    return T_STATUS;
}

int PrlimitTest(void)
{
    return PrlimitTestImpl();
}
