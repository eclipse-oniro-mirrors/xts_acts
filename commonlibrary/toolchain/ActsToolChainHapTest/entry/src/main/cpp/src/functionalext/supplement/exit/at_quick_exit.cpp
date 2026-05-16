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

#include <cstdlib>
#include "functionalext.h"

namespace {
constexpr int K_MAX_QUICK_EXIT_REGISTRATIONS = 32;
} // namespace

void F1() {}
void F2() {}

/**
 * @tc.name      : AtQuickExit0100
 * @tc.desc      : Verify that the function pointed to can be registered (the number of registrations
 *                 is less than 32).
 * @tc.level     : Level 0
 */
void AtQuickExit0100(void)
{
    int result = at_quick_exit(F1);
    quick_exit(0);
    EXPECT_EQ("AtQuickExit0100", result, 0);
}

/**
 * @tc.name      : AtQuickExit0200
 * @tc.desc      : Verify that the pointed function cannot be registered (the number of registrations
 *                 is greater than 32).
 * @tc.level     : Level 2
 */
void AtQuickExit0200(void)
{
    int result;
    for (int i = 0; i < K_MAX_QUICK_EXIT_REGISTRATIONS; i++) {
        (void)at_quick_exit(F2);
    }
    result = at_quick_exit(F2);
    quick_exit(0);
    EXPECT_EQ("AtQuickExit0200", result, -1);
}

static int AtQuickExitTestWithArgs(int argc, char* argv[])
{
    AtQuickExit0100();
    AtQuickExit0200();
    return T_STATUS;
}

int AtQuickExitTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return AtQuickExitTestWithArgs(1, libcArgvStub);
}
