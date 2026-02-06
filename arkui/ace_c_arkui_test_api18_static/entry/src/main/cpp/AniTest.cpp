/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "ani/ani.h"
#include <array>
#include <iostream>
#include "arkui/native_node_ani.h"
#include "hilog/log.h"
#include "common/common.h"
#include "gestureRecognizer/GestureInterrupterTest.h"
#include "datepicker/datepicker_test.h"
#include "datepicker/datePicker_enableHapticFeedback_test.h"
#include "ExpectedFrameRateRange/ExpectedFrameRateRange_callback_test.h"
#include "swiper/swiper_dot_indicator_test.cpp"
#include "swiper/swiper_arrowStyle_test.cpp"
#include "swiper/swiper_indicator_test.h"
#include "textpicker/textPicker_enableHapticFeedback_test.h"
#include "visibleAreaEventOptions/visibleAreaEventOptions.h"

namespace {
    //定义 Native 方法签名，冒号”:“ 左边为方法入参，后边为接口返回值，无返回值则不写。 特殊的类型需要对接口进行反汇编获取具体的类型
    const char *testSignature = ":d";
    //定义 Native 方法数组，内为arkts侧需要用到的C方法。参数1是arkts接口，参数3是映射的对应C接口。
    std::array methods = {
        ani_native_function {"TestGestureInterrupter", "C{arkui.Content.Content}:C{std.core.Array}", reinterpret_cast<void *>(ArkUIAniTest::GestureInterrupterTest::TestGestureInterrupter)},
        ani_native_function {"datePickerEnableHapticFeedback", "C{arkui.Content.Content}:", reinterpret_cast<void *>(ArkUIAniTest::DatePickerEnableTest::DatePickerEnableHapticFeedback)},
        ani_native_function {"testDatePickerMode", "C{arkui.Content.Content}:", reinterpret_cast<void *>(ArkUIAniTest::DatePickerTest::DatePickerModeTest)},
        ani_native_function {"testExpectedFrameRateRangeCallback", "C{arkui.Content.Content}:", reinterpret_cast<void *>(ArkUIAniTest::ExpectedFrameRateRangeCallbackTest::testExpectedFrameRateRangeCallback001)},
        ani_native_function {"testSwiperArrowStyle001", testSignature, reinterpret_cast<void *>(ArkUIAniTest::TestSwiperArrowStyle001)},
        ani_native_function {"testSwiperArrowStyle002", testSignature, reinterpret_cast<void *>(ArkUIAniTest::TestSwiperArrowStyle002)},
        ani_native_function {"testSwiperArrowStyle003", testSignature, reinterpret_cast<void *>(ArkUIAniTest::TestSwiperArrowStyle003)},
        ani_native_function {"testSwiperArrowStyle004", testSignature, reinterpret_cast<void *>(ArkUIAniTest::TestSwiperArrowStyle004)},
        ani_native_function {"testSwiperArrowStyle005", testSignature, reinterpret_cast<void *>(ArkUIAniTest::TestSwiperArrowStyle005)},
        ani_native_function {"testSwiperArrowStyle006", testSignature, reinterpret_cast<void *>(ArkUIAniTest::TestSwiperArrowStyle006)},
        ani_native_function {"testSwiperDigitIndicator001", testSignature, reinterpret_cast<void *>(ArkUIAniTest::TestSwiperDigitIndicator001)},
        ani_native_function {"testSwiperDigitIndicator002", testSignature, reinterpret_cast<void *>(ArkUIAniTest::TestSwiperDigitIndicator002)},
        ani_native_function {"testSwiperDigitIndicator003", testSignature, reinterpret_cast<void *>(ArkUIAniTest::TestSwiperDigitIndicator003)},
        ani_native_function {"testSwiperDigitIndicator004", testSignature, reinterpret_cast<void *>(ArkUIAniTest::TestSwiperDigitIndicator004)},
        ani_native_function {"testSwiperDigitIndicator005", testSignature, reinterpret_cast<void *>(ArkUIAniTest::TestSwiperDigitIndicator005)},
        ani_native_function {"testSwiperDigitIndicator006", testSignature, reinterpret_cast<void *>(ArkUIAniTest::TestSwiperDigitIndicator006)},
        ani_native_function {"testSwiperDigitIndicator007", testSignature, reinterpret_cast<void *>(ArkUIAniTest::TestSwiperDigitIndicator007)},
        ani_native_function {"testSwiperDigitIndicator008", testSignature, reinterpret_cast<void *>(ArkUIAniTest::TestSwiperDigitIndicator008)},
        ani_native_function {"swiperIndicatorTest", "C{arkui.Content.Content}:", reinterpret_cast<void *>(ArkUIAniTest::SwiperIndicatorTest::CreateNativeNode)},
        ani_native_function {"textPickerEnableHapticFeedback", "C{arkui.Content.Content}:", reinterpret_cast<void *>(ArkUIAniTest::TextPickerEnableHapticFeedbackTest::TextPickerEnableHapticFeedback)},
        ani_native_function {"DragEndPendingTest_001", ":C{std.core.Array}", reinterpret_cast<void *>(ArkUIAniTest::VisibleAreaEventOptionsTest::DragEndPendingTest_001)},
        ani_native_function {"VisibleAreaEventOptionsTest_a", ":i", reinterpret_cast<void *>(ArkUIAniTest::VisibleAreaEventOptionsTest::VisibleAreaEventOptionsTest_a)},
        ani_native_function {"VisibleAreaEventOptionsTest_b", ":i", reinterpret_cast<void *>(ArkUIAniTest::VisibleAreaEventOptionsTest::VisibleAreaEventOptionsTest_b)},
        ani_native_function {"VisibleAreaEventOptionsTest_c", ":i", reinterpret_cast<void *>(ArkUIAniTest::VisibleAreaEventOptionsTest::VisibleAreaEventOptionsTest_c)},
        ani_native_function {"VisibleAreaEventOptionsTest_d", ":i", reinterpret_cast<void *>(ArkUIAniTest::VisibleAreaEventOptionsTest::VisibleAreaEventOptionsTest_d)},
    };
}

static ani_status bindCase(ani_vm *vm, const char *clsName)
{
    ani_env *env;
    OH_LOG_INFO(LOG_APP, " GetEnv strat -> 44");
    //获取环境变量
    if (ANI_OK != vm->GetEnv(ANI_VERSION_1, &env)) {
        std::cerr << "Unsupported ANI_VERSION_1" << std::endl;
        OH_LOG_INFO(LOG_APP, " GetEnv Failed -> 47");
        return (ani_status)9;
    }
    OH_LOG_INFO(LOG_APP, " GetEnv end -> 50");

    ani_class cls{};
    //根据传入的ets侧绑定类的路径查找C侧的实现
    OH_LOG_INFO(LOG_APP, " FindClass start -> 53");
    if (ANI_OK != env->FindClass(clsName, &cls)) {
        OH_LOG_INFO(LOG_APP, " FindClass Failed -> 55");
        std::cerr << "Not found '" << clsName << "'" << std::endl;
        return (ani_status)2;
    }
    OH_LOG_INFO(LOG_APP, " FindClass end -> 53");

    OH_LOG_INFO(LOG_APP, " Class_BindNativeMethods start -> 61");
    //将查询到的C侧接口实现与ets侧接口进行绑定
    ani_status status = env->Class_BindNativeMethods(cls, methods.data(), methods.size());
    if (ANI_OK != status) {
        OH_LOG_INFO(LOG_APP, " Class_BindNativeMethods Failed -> 63  status: %{public}d ",status);
        std::cerr << "Cannot bind native methods to '" << clsName << "'" << std::endl;
        return (ani_status)3;
    };
    OH_LOG_INFO(LOG_APP, " Class_BindNativeMethods end -> 67");
    return ANI_OK;
}

ANI_EXPORT ani_status ANI_Constructor(ani_vm *vm, uint32_t *result)
{
    OH_LOG_INFO(LOG_APP, " bindCase strat -> 73");
    std::cout << "testTag : entering libentry.so's ANI_Constructor" << std::endl;
    //触发绑定接口，参数2“entry.src.main.ets.pages.LibUtil.LibUtil” 为ets侧绑定类的路径，需要追踪到类名，中间用"."隔开，不能用“/”
    bindCase(vm, "entry.src.main.ets.pages.LibUtil.LibUtil");
    OH_LOG_INFO(LOG_APP, " bindCase end -> 76");
    *result = ANI_VERSION_1;
    OH_LOG_INFO(LOG_APP, " bindCase end -> 78");
    return ANI_OK;
}