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

#include <termios.h>
#include "test.h"

/**
 * @tc.name      : Cfgetospeed0100
 * @tc.desc      : Verify that information about the output baud rate is obtained.
 * @tc.level     : Level 0
 */
void Cfgetospeed0100(void)
{
    struct termios t = {};
    int result = cfsetospeed(&t, B1200);
    if (result != 0) {
        t_error("%s cfsetospeed failed\n", __func__);
    }

    speed_t ret = cfgetospeed(&t);
    if (ret != static_cast<speed_t>(B1200)) {
        t_error("%s cfgetospeed failed\n", __func__);
    }
}

static int CfgetospeedTestWithArgs(int argc, char* argv[])
{
    Cfgetospeed0100();
    return T_STATUS;
}

int CfgetospeedTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return CfgetospeedTestWithArgs(1, libcArgvStub);
}
