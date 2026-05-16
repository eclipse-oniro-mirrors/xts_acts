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

#include <csignal>
#include "functionalext.h"

const int SUCCESS = 0;
const int FAILED = -1;

/**
 * @tc.name      : Signal0100
 * @tc.desc      : The parameters are normal Verify that the capture signal is successful.
 * @tc.level     : Level 0
 */
void Signal0100(void)
{
    struct sigaction act = {};
    struct sigaction oldact;
    int ret = sigaction(SIGILL, &act, &oldact);
    EXPECT_EQ("Signal0100", ret, SUCCESS);
}

/**
 * @tc.name      : Signal0200
 * @tc.desc      : Parameter exception Failed to validate capture signal.
 * @tc.level     : Level 2
 */
void Signal0200(void)
{
    struct sigaction act = {};
    struct sigaction oldact;
    int ret = sigaction(-1, &act, &oldact);
    EXPECT_EQ("Signal0200", ret, FAILED);
}

static int SigactionTestImpl(int argc, char* argv[])
{
    Signal0100();
    Signal0200();

    return T_STATUS;
}

int SigactionTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return SigactionTestImpl(1, libcArgvStub);
}
