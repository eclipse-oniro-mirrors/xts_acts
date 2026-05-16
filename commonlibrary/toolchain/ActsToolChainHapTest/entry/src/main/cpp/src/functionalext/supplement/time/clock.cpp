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

#include <ctime>
#include <sys/time.h>
#include "functionalext.h"

/**
 * @tc.name      : Clock0100
 * @tc.desc      : Can get the time used by the processor clock.
 * @tc.level     : Level 0
 */
void Clock0100(void)
{
    EXPECT_TRUE("Clock0100", clock() > 0);
}

static int ClockTestWithArgs(int argc, char* argv[])
{
    Clock0100();
    return T_STATUS;
}

int ClockTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return ClockTestWithArgs(1, libcArgvStub);
}
