/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include <sched.h>
#include "functionalext.h"

/*
 * @tc.name      : SchedYield0100
 * @tc.desc      : Verify sched_yield process success
 * @tc.level     : Level 0
 */
void SchedYield0100(void)
{
    int ret = sched_yield();
    EXPECT_EQ("SchedYield0100", ret, 0);
}

static int SchedYieldTestImpl(int argc, char* argv[])
{
    SchedYield0100();
    return T_STATUS;
}

int SchedYieldTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return SchedYieldTestImpl(1, libcArgvStub);
}
