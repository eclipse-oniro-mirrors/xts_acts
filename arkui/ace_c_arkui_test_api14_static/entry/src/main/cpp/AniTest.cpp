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
#include "arkui/native_type.h"
#include "common/common.h"
#include "manager/plugin_manager.h"
#include "customproperty/custom_property_test.h"
#include "keyEvent/keyEvent_GetType.h"
#include "keyEvent/keyEvent_GetKeyCode.h"
#include "keyEvent/keyEvent_GetDeviceId.h"
#include "keyEvent/keyEvent_GetKeyIntensionCode.h"
#include "keyEvent/keyEvent_GetKeySource.h"
#include "keyEvent/keyEvent_GetKeyText.h"
#include "keyEvent/keyEvent_GetPressedKeys.h"
#include "keyEvent/keyEvent_GetUnicode.h"
#include "keyEvent/keyEvent_SetConsumed.h"
#include "keyEvent/keyEvent_StopPropagation.h"
#include "scrollSize/scroll_size_test.h"
#include "xcomponent/xcomponent_test.cpp"
#include "tabStop/tabStop.cpp"

namespace {
    //定义 Native 方法签名，冒号”:“ 左边为方法入参，后边为接口返回值，无返回值则不写。 特殊的类型需要对接口进行反汇编获取具体的类型
    const char *testSignature = "C{arkui.Content.Content}:";
    //定义 Native 方法数组，内为arkts侧需要用到的C方法。参数1是arkts接口，参数3是映射的对应C接口。
    std::array<ani_native_function, 24> methods = {
        ani_native_function {"testNativeXComponent_RegisterKeyEventCallbackWithResult001", ":i", reinterpret_cast<void *>(ArkUICapiTest::testNativeXComponent_RegisterKeyEventCallbackWithResult001)},
        ani_native_function {"tabStop_001", ":i", reinterpret_cast<void *>(ArkUICapiTest::tabStop_001)},
        ani_native_function {"testGetCustomProperty", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomPropertyTest::testGetCustomProperty001)},
        ani_native_function {"testGetParentInPageTree", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomPropertyTest::testGetParentInPageTree002)},
        ani_native_function {"testGetActiveChildrenInfo", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomPropertyTest::testGetActiveChildrenInfo003)},
        ani_native_function {"testGetCurrentPageRootNode", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomPropertyTest::testGetCurrentPageRootNode004)},
        ani_native_function {"testIsCreatedByNDK", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomPropertyTest::testIsCreatedByNDK005)},
        ani_native_function {"testGetNodeType", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomPropertyTest::testGetNodeType006)},
        ani_native_function {"testCustomPropertyDestroy", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomPropertyTest::testCustomPropertyDestroy007)},
        ani_native_function {"testCustomPropertyGetStringValue", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomPropertyTest::testCustomPropertyGetStringValue008)},
        ani_native_function {"testActiveChildrenInfoDestroy", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomPropertyTest::testActiveChildrenInfoDestroy009)},
        ani_native_function {"testActiveChildrenInfoGetNodeByIndex", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomPropertyTest::testActiveChildrenInfoGetNodeByIndex010)},
        ani_native_function {"testActiveChildrenInfoGetCount", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomPropertyTest::testActiveChildrenInfoGetCount011)},
        ani_native_function {"KeyEventGetTypeTest_001", testSignature, reinterpret_cast<void *>(ArkUICapiTest::KeyEventGetTypeTest::KeyEventGetTypeTest_001)},
        ani_native_function {"KeyEventGetKeyCodeTest_001", testSignature, reinterpret_cast<void *>(ArkUICapiTest::KeyEventGetKeyCodeTest::KeyEventGetKeyCodeTest_001)},
        ani_native_function {"KeyEventGetKeyTextTest_001", testSignature, reinterpret_cast<void *>(ArkUICapiTest::KeyEventGetKeyTextTest::KeyEventGetKeyTextTest_001)},
        ani_native_function {"KeyEventGetKeySourceTest_001", testSignature, reinterpret_cast<void *>(ArkUICapiTest::KeyEventGetKeySourceTest::KeyEventGetKeySourceTest_001)},
        ani_native_function {"KeyEventGetGetDeviceIdTest_001", testSignature, reinterpret_cast<void *>(ArkUICapiTest::KeyEventGetGetDeviceIdTest::KeyEventGetGetDeviceIdTest_001)},
        ani_native_function {"KeyEventStopPropagationTest_001", testSignature, reinterpret_cast<void *>(ArkUICapiTest::KeyEventStopPropagationTest::KeyEventStopPropagationTest_001)},
        ani_native_function {"KeyEventGetPressedKeysTest_001", testSignature, reinterpret_cast<void *>(ArkUICapiTest::KeyEventGetPressedKeysTest::KeyEventGetPressedKeysTest_001)},
        ani_native_function {"KeyEventGetKeyIntensionCodeTest_001", testSignature, reinterpret_cast<void *>(ArkUICapiTest::KeyEventGetKeyIntensionCodeTest::KeyEventGetKeyIntensionCodeTest_001)},
        ani_native_function {"KeyEventGetUnicodeTest_001", testSignature, reinterpret_cast<void *>(ArkUICapiTest::KeyEventGetUnicodeTest::KeyEventGetUnicodeTest_001)},
        ani_native_function {"KeyEventSetConsumedTest_001", testSignature, reinterpret_cast<void *>(ArkUICapiTest::KeyEventSetConsumedTest::KeyEventSetConsumedTest_001)},
        ani_native_function {"testGetScrollSizeTest001", testSignature, reinterpret_cast<void *>(ArkUICapiTest::ScrollSizeTest::testGetScrollSizeTest001)},
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