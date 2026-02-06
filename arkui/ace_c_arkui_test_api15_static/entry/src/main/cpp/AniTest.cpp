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
#include "arkui/native_type.h"
#include "arkui/native_node_ani.h"
#include "hilog/log.h"
#include "common/common.h"
#include "manager/plugin_manager.h"
#include "visual/visual_backDropBlur_test.cpp"
#include "listItemGroup/list_item_group_test.h"
#include "checkboxgroup/checkboxgroup_group_test.h"
#include "checkboxgroup/checkboxgroup_selectall_test.h"
#include "checkbox/checkbox_group_test.h"
#include "node/node_handle_by_id_test.h"
#include "window/get_window_info_test.h"
#include "progress/progress_linear_style_test.h"
#include "lazyForEach/lazyforeach_expand_mode_test.h"
#include "focusControl/focus_Control.h"
#include "list/list_test.h"
#include "listScrollTo/list_scroll_to_test.h"
#include "gesturetouchcancel/gesture_cancel.h"
#include "gestureRecognizer/gestureRecognizer.h"
#include "eventInfo/eventInfo.h"
#include "snapShot/snap_shot.h"
#include "snapShot/container.h"
#include "swiper/swiper_change_index_test.h"


namespace {
    //定义 Native 方法签名，冒号”:“ 左边为方法入参，后边为接口返回值，无返回值则不写。 特殊的类型需要对接口进行反汇编获取具体的类型
    const char *testSignature = "C{arkui.Content.Content}:";
    //定义 Native 方法数组，内为arkts侧需要用到的C方法。参数1是arkts接口，参数3是映射的对应C接口。
    std::array<ani_native_function, 35> methods = {
        ani_native_function {"columnBackDropBlurTest001", ":d", reinterpret_cast<void *>(ArkUIAniTest::columnBackDropBlurTest001)},
        ani_native_function {"testListItemGroupNodeAdapter001", ":d", reinterpret_cast<void *>(ArkUIAniTest::ListItemGroupTest::TestListItemGroupNodeAdapter001)},
        ani_native_function {"testListItemGroupNodeAdapter002", ":d", reinterpret_cast<void *>(ArkUIAniTest::ListItemGroupTest::TestListItemGroupNodeAdapter002)},
        ani_native_function {"testListItemGroupNodeAdapter003", ":d", reinterpret_cast<void *>(ArkUIAniTest::ListItemGroupTest::TestListItemGroupNodeAdapter003)},
        ani_native_function {"testNodeHandleById", testSignature, reinterpret_cast<void *>(ArkUIAniTest::NodeHandleByIdTest::testNodeHandleById001)},
        ani_native_function {"checkboxGroupGroupTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CheckboxGroupGroupTest::CreateNativeNode)},
        ani_native_function {"checkboxGroupSelectAllTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CheckboxGroupSelectAllTest::CreateNativeNode)},
        ani_native_function {"checkboxGroupTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::CheckboxGroupTest::CreateNativeNode)},
        ani_native_function {"testGetWindowInfo", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GetWindowInfoTest::testGetWindowInfo001)},
        ani_native_function {"testHostWindowInfoGetName", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GetWindowInfoTest::testHostWindowInfoGetName002)},
        ani_native_function {"testHostWindowInfoDestroy", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GetWindowInfoTest::testHostWindowInfoDestroy003)},
        ani_native_function {"testProgressLinearStyle", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ProgressLinearStyleTest::ProgressLinearStyleTest001)},
        ani_native_function {"testLazyForEachExpandMode001", testSignature, reinterpret_cast<void *>(ArkUIAniTest::LazyForEachExpandModeTest::testLazyForEachExpandMode001)},
        ani_native_function {"testLazyForEachExpandMode002", testSignature, reinterpret_cast<void *>(ArkUIAniTest::LazyForEachExpandModeTest::testLazyForEachExpandMode002)},
        ani_native_function {"testLazyForEachExpandMode003", testSignature, reinterpret_cast<void *>(ArkUIAniTest::LazyForEachExpandModeTest::testLazyForEachExpandMode003)},
        ani_native_function {"testLazyForEachExpandMode004", testSignature, reinterpret_cast<void *>(ArkUIAniTest::LazyForEachExpandModeTest::testLazyForEachExpandMode004)},
        ani_native_function {"testLazyForEachExpandMode005", testSignature, reinterpret_cast<void *>(ArkUIAniTest::LazyForEachExpandModeTest::testLazyForEachExpandMode005)},
        ani_native_function {"testLazyForEachExpandMode006", testSignature, reinterpret_cast<void *>(ArkUIAniTest::LazyForEachExpandModeTest::testLazyForEachExpandMode006)},
        ani_native_function {"testLazyForEachExpandMode007", testSignature, reinterpret_cast<void *>(ArkUIAniTest::LazyForEachExpandModeTest::testLazyForEachExpandMode007)},
        ani_native_function {"testLazyForEachExpandMode008", testSignature, reinterpret_cast<void *>(ArkUIAniTest::LazyForEachExpandModeTest::testLazyForEachExpandMode008)},
        ani_native_function {"testLazyForEachExpandMode009", testSignature, reinterpret_cast<void *>(ArkUIAniTest::LazyForEachExpandModeTest::testLazyForEachExpandMode009)},
        ani_native_function {"FocusControlTest_001", testSignature, reinterpret_cast<void *>(ArkUIAniTest::FocusControlTest::FocusControlTest_001)},
        ani_native_function {"FocusControlTest_002", testSignature, reinterpret_cast<void *>(ArkUIAniTest::FocusControlTest::FocusControlTest_002)},
        ani_native_function {"listTestCallback", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListTest::ListCaseTest)},
        ani_native_function {"listScrollToTestCallback", testSignature, reinterpret_cast<void *>(ArkUIAniTest::ListScrollToTest::ListScrollToIndexTest)},
        ani_native_function {"gesturecancelTest", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GestureInterfaceCancelTest::CreateNativeNode)},
        ani_native_function {"TestGestureRecognizerFinger001", testSignature, reinterpret_cast<void *>(ArkUIAniTest::GestureRecognizerTest::TestGestureRecognizerFinger001)},
        ani_native_function {"TestEventInfoGetPressedTime001", testSignature, reinterpret_cast<void *>(ArkUIAniTest::EventInfoTest::TestEventInfoGetPressedTime001)},
        ani_native_function {"snapShotTest001", testSignature, reinterpret_cast<void *>(ArkUIAniTest::Manager::CreateNativeNode)},
    
        ani_native_function {"GetTouchEventData", ":C{entry.src.main.ets.pages.gestureCancel.TouchEventData.TouchEventData}", reinterpret_cast<void *>(ArkUIAniTest::GestureInterfaceCancelTest::GetTouchEventData)},
        
        ani_native_function {"TestGestureRecognizerGetResult", ":C{std.core.Array}", reinterpret_cast<void *>(ArkUIAniTest::GestureRecognizerTest::GetResult)},
        ani_native_function {"TestEventInfoGetResultTouch", ":C{std.core.Array}", reinterpret_cast<void *>(ArkUIAniTest::EventInfoTest::GetResultTouch)},
        ani_native_function {"TestEventInfoGetResultMove", ":C{std.core.Array}", reinterpret_cast<void *>(ArkUIAniTest::EventInfoTest::GetResultMove)},
        ani_native_function {"TestsnapShotetResult", ":C{std.core.Array}", reinterpret_cast<void *>(ArkUIAniTest::Manager::GetResult)},
    
        ani_native_function {"testSwiperChangeIndex", testSignature, reinterpret_cast<void *>(ArkUIAniTest::SwiperChangeIndexTest::SwiperChangeIndex)}
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
    if (ANI_OK != env->Class_BindNativeMethods(cls, methods.data(), methods.size())) {
        OH_LOG_INFO(LOG_APP, " Class_BindNativeMethods Failed -> 63");
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