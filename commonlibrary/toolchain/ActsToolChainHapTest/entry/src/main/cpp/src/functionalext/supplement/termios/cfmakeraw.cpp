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

#include <algorithm>
#include <termios.h>
#include "test.h"

/**
 * @tc.name      : Cfmakeraw0100
 * @tc.desc      : Verify that the terminal is set to raw mode.
 * @tc.level     : Level 0
 */
void Cfmakeraw0100(void)
{
    struct termios t;
    std::fill_n(reinterpret_cast<unsigned char*>(&t), sizeof(t), static_cast<unsigned char>(0xff));
    cfmakeraw(&t);

    if ((t.c_iflag & (IGNBRK | BRKINT | PARMRK | ISTRIP | INLCR | IGNCR | ICRNL | IXON)) != 0U) {
        t_error("%s t.c_iflag failed\n", __func__);
    }
    if ((t.c_oflag & OPOST) != 0U) {
        t_error("%s t.c_oflag failed\n", __func__);
    }
    if ((t.c_lflag & (ECHO | ECHONL | ICANON | ISIG | IEXTEN)) != 0U) {
        t_error("%s t.c_lflag failed\n", __func__);
    }
    if ((t.c_cflag & PARENB) != 0U) {
        t_error("%s t.c_cflag failed\n", __func__);
    }
    if (static_cast<int>(t.c_cflag & CSIZE) != CS8) {
        t_error("%s t.c_cflag failed\n", __func__);
    }
    if (t.c_cc[VMIN] != 1) {
        t_error("%s t.c_cc[VMIN] failed\n", __func__);
    }
    if (t.c_cc[VTIME] != 0) {
        t_error("%s t.c_cc[VTIME] failed\n", __func__);
    }
}

static int CfmakerawTestWithArgs(int argc, char* argv[])
{
    Cfmakeraw0100();
    return T_STATUS;
}

int CfmakerawTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return CfmakerawTestWithArgs(1, libcArgvStub);
}
