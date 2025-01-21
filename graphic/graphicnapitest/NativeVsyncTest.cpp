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
#include <gtest/gtest.h>
#include "native_vsync.h"
#include <thread>
#include "graphic_error_code.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
class NativeVsyncTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();

    static inline OH_NativeVSync *native_vsync = nullptr;
};

void NativeVsyncTest::SetUpTestCase() {}

void NativeVsyncTest::TearDownTestCase() {}

static void OnVSync(long long timestamp, void *data) {}

namespace {
/*
 * @tc.name: OH_NativeVSync_Create001
 * @tc.desc: test for call OH_NativeVSync_Create by abnormal input and check ret
 * @tc.size : MediumTest
 * @tc.type : Function
 * @tc.Level: Level 2
 */
HWTEST_F(NativeVsyncTest, OH_NativeVSync_Create001, Function | MediumTest | Level2) {
    ASSERT_EQ(OH_NativeVSync_Create(nullptr, 0), nullptr);
}

/*
 * @tc.name: OH_NativeVSync_Create002
 * @tc.desc: test for call OH_NativeVSync_Create by abnormal input and check ret
 * @tc.size : MediumTest
 * @tc.type : Function
 * @tc.Level: Level 2
 */
HWTEST_F(NativeVsyncTest, OH_NativeVSync_Create002, Function | MediumTest | Level2) {
    char name[] = "test";
    native_vsync = OH_NativeVSync_Create(name, sizeof(name));
    ASSERT_NE(native_vsync, nullptr);
}

/*
 * @tc.name: OH_NativeVSync_RequestFrame001
 * @tc.desc: test for call OH_NativeVSync_RequestFrame by abnormal input and check ret
 * @tc.size : MediumTest
 * @tc.type : Function
 * @tc.Level: Level 2
 */
HWTEST_F(NativeVsyncTest, OH_NativeVSync_RequestFrame001, Function | MediumTest | Level2) {
    ASSERT_NE(OH_NativeVSync_RequestFrame(nullptr, nullptr, nullptr), 0);
}

/*
 * @tc.name: OH_NativeVSync_RequestFrame002
 * @tc.desc: test for call OH_NativeVSync_RequestFrame by abnormal input and check ret
 * @tc.size : MediumTest
 * @tc.type : Function
 * @tc.Level: Level 2
 */
HWTEST_F(NativeVsyncTest, OH_NativeVSync_RequestFrame002, Function | MediumTest | Level2) {
    ASSERT_NE(OH_NativeVSync_RequestFrame(native_vsync, nullptr, nullptr), 0);
}

/*
 * @tc.name: OH_NativeVSync_RequestFrame003
 * @tc.desc: test for call OH_NativeVSync_RequestFrame by abnormal input and check ret
 * @tc.size : MediumTest
 * @tc.type : Function
 * @tc.Level: Level 2
 */
HWTEST_F(NativeVsyncTest, OH_NativeVSync_RequestFrame003, Function | MediumTest | Level2) {
    OH_NativeVSync_FrameCallback callback = OnVSync;
    ASSERT_EQ(OH_NativeVSync_RequestFrame(native_vsync, callback, nullptr), 0);
}

/*
 * @tc.name: OH_NativeVSync_Destroy001
 * @tc.desc: test for call OH_NativeVSync_Destroy by abnormal input and check ret
 * @tc.size : MediumTest
 * @tc.type : Function
 * @tc.Level: Level 2
 */
HWTEST_F(NativeVsyncTest, OH_NativeVSync_Destroy001, Function | MediumTest | Level2) {
    OH_NativeVSync_Destroy(nullptr);
}

/*
 * @tc.name: OH_NativeVSync_Destroy002
 * @tc.desc: test for call OH_NativeVSync_Destroy by abnormal input and check ret
 * @tc.size : MediumTest
 * @tc.type : Function
 * @tc.Level: Level 2
 */
HWTEST_F(NativeVsyncTest, OH_NativeVSync_Destroy002, Function | MediumTest | Level2) {
    OH_NativeVSync_Destroy(native_vsync);
}
/*
 * @tc.name: OH_NativeVSync_RequestFrameWithMultiCallbackNormal
 * @tc.desc: test for call OH_NativeVSync_RequestFrameWithMultiCallback by abnormal input and check ret
 * @tc.size : MediumTest
 * @tc.type : Function
 * @tc.Level: Level 2
 */
HWTEST_F(NativeVsyncTest, OH_NativeVSync_RequestFrameWithMultiCallbackNormal, Function | MediumTest | Level2) {
    char name[] = "test";
    native_vsync = OH_NativeVSync_Create(name, sizeof(name));
    ASSERT_NE(native_vsync, nullptr);
    OH_NativeVSync_FrameCallback callback = OnVSync;
    auto *data = new std::string("hello");
    OH_NativeVSync_RequestFrame(native_vsync, callback, data);
    int ret = OH_NativeVSync_RequestFrameWithMultiCallback(native_vsync, callback, data);
    OH_NativeVSync_RequestFrame(native_vsync, callback, nullptr);
    int ret1 = OH_NativeVSync_RequestFrameWithMultiCallback(native_vsync, callback, data);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    ASSERT_EQ(ret1, NATIVE_ERROR_OK);
    for (int i = 0; i < 5; i++) {
        int ret2 = OH_NativeVSync_RequestFrameWithMultiCallback(native_vsync, callback, data);
        std::this_thread::sleep_for(std::chrono::milliseconds(1));
        ASSERT_EQ(ret2, NATIVE_ERROR_OK);
    }
    for (int i = 0; i < 5; i++) {
        int ret3 = OH_NativeVSync_RequestFrameWithMultiCallback(native_vsync, callback, data + i);
        std::this_thread::sleep_for(std::chrono::milliseconds(1));
        ASSERT_EQ(ret3, NATIVE_ERROR_OK);
    }
    for (int i = 0; i < 100; i++) {
        int ret100 = OH_NativeVSync_RequestFrameWithMultiCallback(native_vsync, callback, data);
        std::this_thread::sleep_for(std::chrono::milliseconds(1));
        ASSERT_EQ(ret100, NATIVE_ERROR_OK);
    }
    for (int i = 0; i < 1000; i++) {
        int ret1000 = OH_NativeVSync_RequestFrameWithMultiCallback(native_vsync, callback, data);
        std::this_thread::sleep_for(std::chrono::milliseconds(1));
        ASSERT_EQ(ret1000, NATIVE_ERROR_OK);
    }
    OH_NativeVSync_Destroy(native_vsync);
}
/*
 * @tc.name: OH_NativeVSync_RequestFrameWithMultiCallbackAbnormal
 * @tc.desc: test for call OH_NativeVSync_RequestFrameWithMultiCallback by abnormal input and check ret
 * @tc.size : MediumTest
 * @tc.type : Function
 * @tc.Level: Level 3
 */
HWTEST_F(NativeVsyncTest, OH_NativeVSync_RequestFrameWithMultiCallbackAbnormal, Function | MediumTest | Level3) {
    char name[] = "test";
    native_vsync = OH_NativeVSync_Create(name, sizeof(name));
    ASSERT_NE(native_vsync, nullptr);
    OH_NativeVSync_FrameCallback callback = OnVSync;
    auto *data = new std::string("hello");
    int ret3 = OH_NativeVSync_RequestFrameWithMultiCallback(nullptr, callback, data);
    ASSERT_EQ(ret3, NATIVE_ERROR_INVALID_ARGUMENTS);
    int ret4 = OH_NativeVSync_RequestFrameWithMultiCallback(0, callback, data);
    ASSERT_EQ(ret4, NATIVE_ERROR_INVALID_ARGUMENTS);
    int ret5 = OH_NativeVSync_RequestFrameWithMultiCallback(native_vsync, nullptr, data);
    ASSERT_EQ(ret5, NATIVE_ERROR_INVALID_ARGUMENTS);
    int ret6 = OH_NativeVSync_RequestFrameWithMultiCallback(native_vsync, 0, data);
    ASSERT_EQ(ret6, NATIVE_ERROR_INVALID_ARGUMENTS);
    int ret7 = OH_NativeVSync_RequestFrameWithMultiCallback(native_vsync, callback, nullptr);
    ASSERT_EQ(ret7, NATIVE_ERROR_OK);
    int ret8 = OH_NativeVSync_RequestFrameWithMultiCallback(native_vsync, callback, 0);
    ASSERT_EQ(ret8, NATIVE_ERROR_OK);
    OH_NativeVSync_Destroy(native_vsync);
}
} // namespace
} // namespace Rosen
} // namespace OHOS