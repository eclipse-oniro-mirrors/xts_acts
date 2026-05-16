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
#include "customdialog/customdialog_test.cpp"
#include "customdialog/customdialog_background.cpp"
#include "textpicker/text_picker_range_test.h"
#include "customdialog/customdialog1_test.h"

namespace {
    //定义 Native 方法签名，冒号”:“ 左边为方法入参，后边为接口返回值，无返回值则不写。 特殊的类型需要对接口进行反汇编获取具体的类型
    const char *testSignature = "C{arkui.Content.Content}:";
    //定义 Native 方法数组，内为arkts侧需要用到的C方法。参数1是arkts接口，参数3是映射的对应C接口。
    std::array<ani_native_function, 23> methods = {
        ani_native_function {"testTextPickerRange", testSignature, reinterpret_cast<void *>(ArkUICapiTest::TextPickerRangeTest::CreateNativeNode)},
        ani_native_function {"CustomDialogTest1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest1::customDialogAttrsTest)},
        ani_native_function {"testCustomDialog001", ":d", reinterpret_cast<void *>(ArkUICapiTest::TestCustomDialog001)},
        ani_native_function {"testCustomDialog002", ":d", reinterpret_cast<void *>(ArkUICapiTest::TestCustomDialog002)},
        ani_native_function {"testCustomDialogWidth", ":d", reinterpret_cast<void *>(ArkUICapiTest::TestCustomDialogWidth)},
        ani_native_function {"testCustomDialogHeight", ":d", reinterpret_cast<void *>(ArkUICapiTest::TestCustomDialogHeight)},
        ani_native_function {"testCustomDialogBorderWidth", ":d", reinterpret_cast<void *>(ArkUICapiTest::TestCustomDialogBorderWidth)},
        ani_native_function {"testCustomDialogBorderColor", ":d", reinterpret_cast<void *>(ArkUICapiTest::TestCustomDialogBorderColor)},
        ani_native_function {"testCustomDialogBorderStyle", ":d", reinterpret_cast<void *>(ArkUICapiTest::TestCustomDialogBorderStyle)},
        ani_native_function {"testCustomDialogShadow", ":d", reinterpret_cast<void *>(ArkUICapiTest::TestCustomDialogShadow)},
        ani_native_function {"testCustomDialogCustomShadow", ":d", reinterpret_cast<void *>(ArkUICapiTest::TestCustomDialogCustomShadow)},
        ani_native_function {"testCustomDialogBackgroundBlurStyle", ":d", reinterpret_cast<void *>(ArkUICapiTest::TestCustomDialogBackgroundBlurStyle)},
        ani_native_function {"testCustomDialogKeyboardAvoidMode", ":d", reinterpret_cast<void *>(ArkUICapiTest::TestCustomDialogKeyboardAvoidMode)},
        ani_native_function {"testCustomDialogEnableHoverMode", ":d", reinterpret_cast<void *>(ArkUICapiTest::TestCustomDialogEnableHoverMode)},
        ani_native_function {"testCustomDialogHoverModeArea", ":d", reinterpret_cast<void *>(ArkUICapiTest::TestCustomDialogHoverModeArea)},
        ani_native_function {"testCustomDialogLevelMode", ":d", reinterpret_cast<void *>(ArkUICapiTest::TestCustomDialogLevelMode)},
        ani_native_function {"testCustomDialogLevelUniqueId", ":d", reinterpret_cast<void *>(ArkUICapiTest::TestCustomDialogLevelUniqueId)},
        ani_native_function {"testCustomDialogImmersiveMode", ":d", reinterpret_cast<void *>(ArkUICapiTest::TestCustomDialogImmersiveMode)},
        ani_native_function {"testCustomDialogBackgroundColor", ":d", reinterpret_cast<void *>(ArkUICapiTest::TestCustomDialogBackgroundColor)},
        ani_native_function {"testCustomDialogCornerRadius", ":d", reinterpret_cast<void *>(ArkUICapiTest::TestCustomDialogCornerRadius)},
        ani_native_function {"testCustomModalMode", ":d", reinterpret_cast<void *>(ArkUICapiTest::TestCustomModalMode)},
        ani_native_function {"testCustomAutoCancel", ":d", reinterpret_cast<void *>(ArkUICapiTest::TestCustomAutoCancel)},
        ani_native_function {"testCustomMask", ":d", reinterpret_cast<void *>(ArkUICapiTest::TestCustomMask)},
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