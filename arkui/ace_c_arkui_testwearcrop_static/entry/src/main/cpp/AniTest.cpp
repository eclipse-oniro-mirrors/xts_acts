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
#include "manager/plugin_manager.h"
#include "calendarpicker/calendarpicker_onchange_test.h"
#include "calendarpicker/calendarpicker_enabled_test.h"
#include "textarea/textarea_onpaste_test.h"
#include "textinput/textinput_oncut_test.h"
#include "textinput/textinput_onpaste_test.h"
#include "textinput/textinput_method_test.h"
#include "calendarpicker/calendarpicker_edgealign_test.cpp"
#include "calendarpicker/calendarpicker_textstyle_test.cpp"
#include "calendarpicker/calendarpicker_width_test.cpp"
#include "calendarpicker/calendarpicker_hintradius_test.cpp"
#include "calendarpicker/calendarpicker_selecteddate_test.cpp"


namespace {
    //定义 Native 方法签名，冒号”:“ 左边为方法入参，后边为接口返回值，无返回值则不写。 特殊的类型需要对接口进行反汇编获取具体的类型
    const char *testSignature = "C{arkui.Content.Content}:";
    //定义 Native 方法数组，内为arkts侧需要用到的C方法。参数1是arkts接口，参数3是映射的对应C接口。
    std::array methods = {
        ani_native_function {"testCalendarPickerHintRadius001", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerHintRadius001)},
        ani_native_function {"testCalendarPickerHintRadius002", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerHintRadius002)},
        ani_native_function {"testCalendarPickerHintRadius003", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerHintRadius003)},
        ani_native_function {"testCalendarPickerHintRadius004", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerHintRadius004)},
        ani_native_function {"testCalendarPickerHintRadius005", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerHintRadius005)},
        ani_native_function {"testCalendarPickerHintRadius006", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerHintRadius006)},
        ani_native_function {"testCalendarPickerHintRadius007", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerHintRadius007)},
        ani_native_function {"testCalendarPickerEdgeAlign001", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerEdgeAlign001)},
        ani_native_function {"testCalendarPickerEdgeAlign002", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerEdgeAlign002)},
        ani_native_function {"testCalendarPickerEdgeAlign003", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerEdgeAlign003)},
        ani_native_function {"testCalendarPickerEdgeAlign004", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerEdgeAlign004)},
        ani_native_function {"testCalendarPickerEdgeAlign005", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerEdgeAlign005)},
        ani_native_function {"testCalendarPickerTextStyle001", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerTextStyle001)},
        ani_native_function {"testCalendarPickerTextStyle002", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerTextStyle002)},
        ani_native_function {"testCalendarPickerTextStyle003", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerTextStyle003)},
        ani_native_function {"testCalendarPickerTextStyle004", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerTextStyle004)},
        ani_native_function {"testCalendarPickerTextStyle005", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerTextStyle005)},
        ani_native_function {"testCalendarPickerTextStyle006", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerTextStyle006)},
        ani_native_function {"testCalendarPickerTextStyle007", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerTextStyle007)},
        ani_native_function {"testCalendarPickerTextStyle008", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerTextStyle008)},
        ani_native_function {"testCalendarPickerTextStyle009", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerTextStyle009)},
        ani_native_function {"testCalendarPickerTextStyle010", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerTextStyle010)},
        ani_native_function {"testCalendarPickerTextStyle011", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerTextStyle011)},
        ani_native_function {"testCalendarPickerTextStyle012", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerTextStyle012)},
        ani_native_function {"testCalendarPickerTextStyle013", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerTextStyle013)},
        ani_native_function {"testCalendarPickerTextStyle014", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerTextStyle014)},
        ani_native_function {"testCalendarPickerTextStyle015", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerTextStyle015)},
        ani_native_function {"testCalendarPickerTextStyle016", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerTextStyle016)},
        ani_native_function {"testCalendarPickerWidth001", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerWidth001)},
        ani_native_function {"testCalendarPickerWidth002", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerWidth002)},
        ani_native_function {"testCalendarPickerWidth003", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerWidth003)},
        ani_native_function {"testCalendarPickerSelectedDate001", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerSelectedDate001)},
        ani_native_function {"testCalendarPickerSelectedDate002", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerSelectedDate002)},
        ani_native_function {"testCalendarPickerSelectedDate003", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerSelectedDate003)},
        ani_native_function {"testCalendarPickerSelectedDate004", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerSelectedDate004)},
        ani_native_function {"testCalendarPickerSelectedDate005", ":i", reinterpret_cast<void *>(ArkUICapiTest::TestCalendarPickerSelectedDate005)},
        ani_native_function {"calendarPickerOnChangeTest", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CalendarPickerOnChangeTest::CreateNativeNode)},
        ani_native_function {"calendarPickerEnabledTest", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CalendarPickerEnabledTest::CreateNativeNode)},
        ani_native_function {"textAreaOnPasteTest", testSignature, reinterpret_cast<void *>(ArkUICapiTest::TextAreaOnPasteTest::CreateNativeNode)},
        ani_native_function {"textInputOnCutTest", testSignature, reinterpret_cast<void *>(ArkUICapiTest::TextInputOnCutTest::CreateNativeNode)},
        ani_native_function {"textInputOnPasteTest", testSignature, reinterpret_cast<void *>(ArkUICapiTest::TextInputOnPasteTest::CreateNativeNode)},
        ani_native_function {"InputMethodTest001", testSignature, reinterpret_cast<void *>(ArkUICapiTest::TextInputMethodTest::InputMethodTest001)},
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