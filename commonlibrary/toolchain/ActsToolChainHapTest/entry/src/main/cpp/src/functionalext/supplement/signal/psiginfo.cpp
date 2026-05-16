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

/**
 * @tc.name      : Psiginfo0100
 * @tc.desc      : Pass the normal parameters, the function call is successful,
 *                 and the message is output in the console
 * @tc.level     : Level 0
 */
void Psiginfo0100(void)
{
    errno = 0;
    siginfo_t info{};
    info.si_signo = SIGUSR1;
    psiginfo(&info, "SIGUSR1");
    EXPECT_EQ("Psiginfo0100", errno, CMPFLAG);
}

/**
 * @tc.name      : Psiginfo0200
 * @tc.desc      : Invalid parameters are passed in, the function call succeeds,
 *                 and a message is output to the console
 * @tc.level     : Level 0
 */
void Psiginfo0200(void)
{
    errno = 0;
    siginfo_t info{};
    info.si_signo = SIGUSR1;
    psiginfo(&info, nullptr);
    EXPECT_EQ("Psiginfo0200", errno, CMPFLAG);
}

/**
 * @tc.name      : Psiginfo0300
 * @tc.desc      : Invalid parameters are passed in, the function call succeeds,
 *                 and a message is output to the console
 * @tc.level     : Level 2
 */
void Psiginfo0300(void)
{
    errno = 0;
    siginfo_t info{};
    info.si_signo = -1;
    psiginfo(&info, nullptr);
    EXPECT_EQ("Psiginfo0300", errno, CMPFLAG);
}

static int PsiginfoTestImpl(void)
{
    Psiginfo0100();
    Psiginfo0200();
    Psiginfo0300();
    return T_STATUS;
}

int PsiginfoTest(void)
{
    return PsiginfoTestImpl();
}
