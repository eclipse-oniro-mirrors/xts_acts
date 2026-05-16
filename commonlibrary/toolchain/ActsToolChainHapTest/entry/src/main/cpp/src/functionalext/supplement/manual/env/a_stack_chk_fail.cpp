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

#include <csignal>
#include <cstdlib>
#include <dlfcn.h>
#include "functionalext.h"

using StackChkFailFunc = void (*)();
constexpr const char* STACK_CHK_FAIL_SYMBOL = "__stack_chk_fail";

const int32_t INIT_LEN = 0;
const int32_t INCREASE_LEN = 1;
static int32_t g_flag = 0;

static void Killfunc(int signu)
{
    switch (signu) {
        case SIGILL:
            g_flag++;
            EXPECT_EQ("AStackChkFail0100 exception", g_flag, INCREASE_LEN);
            exit(0);
        case SIGSEGV:
            g_flag++;
            EXPECT_EQ("AStackChkFail0100 exception", g_flag, INCREASE_LEN);
            exit(0);
        default:
            break;
    }
    return;
}

/**
 * @tc.name      : AStackChkFail0100
 * @tc.desc      : Verify stack check fail process success
 * @tc.level     : Level 0
 */
void AStackChkFail0100(void)
{
    StackChkFailFunc stackChkFail = reinterpret_cast<StackChkFailFunc>(dlsym(RTLD_DEFAULT, STACK_CHK_FAIL_SYMBOL));
    if (stackChkFail == nullptr) {
        t_error("%s dlsym __stack_chk_fail failed\n", __func__);
        return;
    }
    struct sigaction act;
    struct sigaction oldact;
    act.sa_handler = Killfunc;
    act.sa_flags = 0;
    sigaction(SIGILL, &act, &oldact);
    sigaction(SIGSEGV, &act, &oldact);
    stackChkFail();
    EXPECT_EQ("AStackChkFail0100", g_flag, INCREASE_LEN);
}

int AStackChkFailTestCompat(void)
{
    AStackChkFail0100();
    return T_STATUS;
}
