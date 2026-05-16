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

#include "functionalext.h"

/**
 * @tc.name      : Ctermid0100
 * @tc.desc      : Verify the PATH name of the control terminal that gets the current process (parameter valid)
 * @tc.level     : Level 0
 */
void Ctermid0100(void)
{
    char buf[BUFSIZ];
    char* result = ctermid(buf);
    EXPECT_EQ("Ctermid0100", buf, result);
    EXPECT_STREQ("Ctermid0100", result, "/dev/tty");
}

/**
 * @tc.name      : Ctermid0200
 * @tc.desc      : Verify the default pathname of the control terminal that got the current process
 *                 (the s parameter is invalid)
 * @tc.level     : Level 1
 */
void Ctermid0200(void)
{
    char* result = ctermid(nullptr);
    EXPECT_STREQ("Ctermid0200", result, "/dev/tty");
}

static int CtermidTestWithArgs(int argc, char* argv[])
{
    Ctermid0100();
    Ctermid0200();
    return T_STATUS;
}

int CtermidTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return CtermidTestWithArgs(1, libcArgvStub);
}
