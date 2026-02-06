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
#include "postFrame/post_frame_callback_test.h"
#include "swiper/swiper_onselect_test.h"
#include "swiper/swiper_test.h"
#include "text/text_immutablf_font_weight.cpp"
#include "textArea/textArea_letter_spacing.h"
#include "textinput/textinput_wordbreak_test.cpp"
#include "button/button_type_test.cpp"
#include "textpicker/textpicker_columnwidths_test.h"
#include "drag/drag_test.h"
#include "move/node_util_move_test.h"
#include "timePicker/time_picker_test.h"

namespace {
    //定义 Native 方法签名，冒号”:“ 左边为方法入参，后边为接口返回值，无返回值则不写。 特殊的类型需要对接口进行反汇编获取具体的类型
    const char *testSignature = "C{arkui.Content.Content}:";
    //定义 Native 方法数组，内为arkts侧需要用到的C方法。参数1是arkts接口，参数3是映射的对应C接口。
    std::array methods = {
        ani_native_function {"textImmutablfFontWeight_001", ":d", reinterpret_cast<void *>(ArkUIAniTest::textImmutablfFontWeight_001)},
        ani_native_function {"textImmutablfFontWeight_002", ":d", reinterpret_cast<void *>(ArkUIAniTest::textImmutablfFontWeight_002)},
        ani_native_function {"textImmutablfFontWeight_003", ":d", reinterpret_cast<void *>(ArkUIAniTest::textImmutablfFontWeight_003)},
        ani_native_function {"textImmutablfFontWeight_004", ":d", reinterpret_cast<void *>(ArkUIAniTest::textImmutablfFontWeight_004)},
        ani_native_function {"textImmutablfFontWeight_005", ":d", reinterpret_cast<void *>(ArkUIAniTest::textImmutablfFontWeight_005)},
        ani_native_function {"textImmutablfFontWeight_006", ":d", reinterpret_cast<void *>(ArkUIAniTest::textImmutablfFontWeight_006)},
        ani_native_function {"textImmutablfFontWeight_007", ":d", reinterpret_cast<void *>(ArkUIAniTest::textImmutablfFontWeight_007)},
        ani_native_function {"textImmutablfFontWeight_008", ":d", reinterpret_cast<void *>(ArkUIAniTest::textImmutablfFontWeight_008)},
        ani_native_function {"textImmutablfFontWeight_009", ":d", reinterpret_cast<void *>(ArkUIAniTest::textImmutablfFontWeight_009)},
        ani_native_function {"textImmutablfFontWeight_010", ":d", reinterpret_cast<void *>(ArkUIAniTest::textImmutablfFontWeight_010)},
        ani_native_function {"textImmutablfFontWeight_011", ":d", reinterpret_cast<void *>(ArkUIAniTest::textImmutablfFontWeight_011)},
        ani_native_function {"textImmutablfFontWeight_012", ":d", reinterpret_cast<void *>(ArkUIAniTest::textImmutablfFontWeight_012)},
        ani_native_function {"textImmutablfFontWeight_013", ":d", reinterpret_cast<void *>(ArkUIAniTest::textImmutablfFontWeight_013)},
        ani_native_function {"textImmutablfFontWeight_014", ":d", reinterpret_cast<void *>(ArkUIAniTest::textImmutablfFontWeight_014)},
        ani_native_function {"textImmutablfFontWeight_015", ":d", reinterpret_cast<void *>(ArkUIAniTest::textImmutablfFontWeight_015)},
        ani_native_function {"textImmutablfFontWeight_016", ":d", reinterpret_cast<void *>(ArkUIAniTest::textImmutablfFontWeight_016)},
       
        ani_native_function {"testTextInputWordBreak001", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextInputWordBreak001)},
        ani_native_function {"testTextInputWordBreak002", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextInputWordBreak002)},
        ani_native_function {"testTextInputWordBreak003", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextInputWordBreak003)},
        ani_native_function {"testTextInputWordBreak004", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextInputWordBreak004)},
        ani_native_function {"testTextInputWordBreak005", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextInputWordBreak005)},
        ani_native_function {"testTextInputWordBreak006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestTextInputWordBreak006)},
        ani_native_function {"testPostFrameCallback", testSignature, reinterpret_cast<void *>(ArkUIAniTest::PostFrameCallbackTest::testPostFrameCallback001)},
        ani_native_function {"swiperAutoPlayTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::SwiperTest::swiperAutoPlayTest)},
        ani_native_function {"swiperOnSelectTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::SwiperOnSelectTest::CreateNativeNode)},
        ani_native_function {"textAreaLetterSpacing001", "C{arkui.Content.Content}:", reinterpret_cast<void *>(ArkUIAniTest::TextAreaLetterSpacing::textAreaLetterSpacing001)},
        ani_native_function {"textInputLetterSpacing002", "C{arkui.Content.Content}:", reinterpret_cast<void *>(ArkUIAniTest::TextAreaLetterSpacing::textInputLetterSpacing002)},
    
        ani_native_function {"testButtonType006", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonType006)},
        ani_native_function {"testButtonType007", ":d", reinterpret_cast<void *>(ArkUIAniTest::TestButtonType007)},
    
        ani_native_function {"textPickerColumnWidths", testSignature, reinterpret_cast<void *>(ArkUIAniTest::TextPickerTest::TextPickerColumnWidths)},
    
        ani_native_function {"TestDragStartDataLoading001", testSignature, reinterpret_cast<void *>(ArkUIAniTest::DragTest::TestDragStartDataLoading001)},
        ani_native_function {"TestDragDisableDropDataPrefetch002", testSignature, reinterpret_cast<void *>(ArkUIAniTest::DragTest::TestDragDisableDropDataPrefetch002)},
        ani_native_function {"GetResult", ":C{std.core.Array}", reinterpret_cast<void *>(ArkUIAniTest::DragTest::GetResult)},
        ani_native_function {"TestDragCancelDataLoading003", "C{arkui.Content.Content}C{@ohos.arkui.UIContext.UIContext}:", reinterpret_cast<void *>(ArkUIAniTest::DragTest::TestDragCancelDataLoading003)}, // 参数和内容对不上
        ani_native_function {"testNodeUtilMove001", testSignature, reinterpret_cast<void *>(ArkUIAniTest::NodeUtilMoveTest::testNodeUtilMove001)},
        ani_native_function {"timePickerTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::TimePickerTest::TimePickerTestEnableCascade)},
   
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