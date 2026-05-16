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

#include <info/application_target_sdk_version.h>

#include <cstring>
#include <test.h>

// val1 == val2
static void EXPECT_EQ(int a, int b)
{
    if (a != b) {
        t_error("failed %d != %d \n", a, b);
    }
}
typedef void (*TEST_FUN)(void);

/**
 * @tc.name      : set_application_target_sdk_version
 * @tc.desc      : test the function of set_application_target_sdk_version.
 * @tc.level     : Level 0
 */

static void SetApplicationTargetSdkVersion0010(void)
{
    set_application_target_sdk_version(SDK_VERSION_7);
    int target = get_application_target_sdk_version();
    EXPECT_EQ(target, SDK_VERSION_7);
}

/**
 * @tc.name      : get_application_target_sdk_version
 * @tc.desc      : test the function of get_application_target_sdk_version.
 * @tc.level     : Level 0
 */
static void GetApplicationTargetSdkVersion0010(void)
{
    set_application_target_sdk_version(SDK_VERSION_8);
    int target = get_application_target_sdk_version();
    EXPECT_EQ(target, SDK_VERSION_8);
}

/**
 * @tc.name      : set_application_target_sdk_version
 * @tc.desc      : test the function of set_application_target_sdk_version.
 * @tc.level     : Level 0
 */
static void SetApplicationTargetSdkVersion0020(void)
{
    set_application_target_sdk_version(0);
    int target = get_application_target_sdk_version();
    EXPECT_EQ(target, SDK_VERSION_FUTURE);
}

namespace {
TEST_FUN g_gFunArray[] = { SetApplicationTargetSdkVersion0010,
                           GetApplicationTargetSdkVersion0010,
                           SetApplicationTargetSdkVersion0020 };
}

int ApplicationTargetSdkVersionTestTest(void)
{
    int origin = get_application_target_sdk_version();
    int num = sizeof(g_gFunArray) / sizeof(g_gFunArray[0]);
    for (int pos = 0; pos < num; ++pos) {
        g_gFunArray[pos]();
    }
    set_application_target_sdk_version(origin);

    return T_STATUS;
}