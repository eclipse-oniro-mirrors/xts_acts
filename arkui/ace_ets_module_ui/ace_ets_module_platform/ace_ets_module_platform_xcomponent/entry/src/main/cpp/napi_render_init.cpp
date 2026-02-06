/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <hilog/log.h>
#include "common/common.h"
#include "XComponent/XComponentSurfaceConfigTest.h"
#include "XComponent/XComponentKeyMouseEventTest.h"
#include "XComponent/NodeXComponentTest.h"
#include "XComponent/NodeContentTest.h"

namespace NativeXComponentSample {

// 在napi_init.cpp文件中，Init方法注册接口函数，从而将封装的C++方法传递出来，供ArkTS侧调用
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    // 向ArkTS侧暴露接口
    napi_property_descriptor desc[] = {
        {"ChangeColor", nullptr, XComponentSurfaceConfigTest::ChangeColor,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetSurfaceId", nullptr, XComponentSurfaceConfigTest::SetSurfaceId,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ChangeSurface", nullptr, XComponentSurfaceConfigTest::ChangeSurface,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetXComponentStatus", nullptr, XComponentSurfaceConfigTest::GetXComponentStatus,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DrawPattern", nullptr, XComponentSurfaceConfigTest::DrawPattern,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DestroySurface", nullptr, XComponentSurfaceConfigTest::DestroySurface,
            nullptr, nullptr, nullptr, napi_default, nullptr},
    
        {"bindNode", nullptr, XComponentSurfaceConfigTest::BindNode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"unbindNode", nullptr, XComponentSurfaceConfigTest::UnbindNode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"drawStar", nullptr, XComponentSurfaceConfigTest::DrawStar, nullptr, nullptr, nullptr, napi_default, nullptr},

        {"TestSetSurfaceConfigErrorCode001", nullptr, XComponentSurfaceConfigTest::TestSetSurfaceConfigErrorCode001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestSetSurfaceConfigErrorCode002", nullptr, XComponentSurfaceConfigTest::TestSetSurfaceConfigErrorCode002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestSurfaceConfigCreateReturnNoNullptr", nullptr, XComponentSurfaceConfigTest::TestSurfaceConfigCreateReturnNoNullptr,
         nullptr, nullptr, nullptr, napi_default, nullptr},

        {"CreateKeyMouseEventNativeRoot", nullptr, XComponentKeyMouseEventTest::CreateKeyMouseEventNativeRoot,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getKeyStr", nullptr, XComponentKeyMouseEventTest::GetKeyString, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getIndicatorStr", nullptr, XComponentKeyMouseEventTest::GetIndicatorString, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getMouseStr", nullptr, XComponentKeyMouseEventTest::GetMouseString, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetExtraMouseEventInfoErrorCode_01", nullptr, XComponentKeyMouseEventTest::TestGetExtraMouseEventInfoErrorCode_01,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetExtraMouseEventInfoErrorCode_02", nullptr, XComponentKeyMouseEventTest::TestGetExtraMouseEventInfoErrorCode_02,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetMouseEventModifierKeyStatesErrorCode_01", nullptr, XComponentKeyMouseEventTest::TestGetMouseEventModifierKeyStatesErrorCode_01,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetMouseEventModifierKeyStatesErrorCode_02", nullptr, XComponentKeyMouseEventTest::TestGetMouseEventModifierKeyStatesErrorCode_02,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetKeyEventModifierKeyStatesErrorCode_01", nullptr, XComponentKeyMouseEventTest::TestGetKeyEventModifierKeyStatesErrorCode_01,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetKeyEventModifierKeyStatesErrorCode_02", nullptr, XComponentKeyMouseEventTest::TestGetKeyEventModifierKeyStatesErrorCode_02,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetKeyEventNumLockStateErrorCode_01", nullptr, XComponentKeyMouseEventTest::TestGetKeyEventNumLockStateErrorCode_01,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetKeyEventNumLockStateErrorCode_02", nullptr, XComponentKeyMouseEventTest::TestGetKeyEventNumLockStateErrorCode_02,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetKeyEventCapsLockStateErrorCode_01", nullptr, XComponentKeyMouseEventTest::TestGetKeyEventCapsLockStateErrorCode_01,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetKeyEventCapsLockStateErrorCode_02", nullptr, XComponentKeyMouseEventTest::TestGetKeyEventCapsLockStateErrorCode_02,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetKeyEventScrollLockStateErrorCode_01", nullptr, XComponentKeyMouseEventTest::TestGetKeyEventScrollLockStateErrorCode_01,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetKeyEventScrollLockStateErrorCode_02", nullptr, XComponentKeyMouseEventTest::TestGetKeyEventScrollLockStateErrorCode_02,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestRegisterKeyEventCallbackWithResult_01", nullptr, XComponentKeyMouseEventTest::TestRegisterKeyEventCallbackWithResult_01,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestRegisterKeyEventCallbackWithResult_02", nullptr, XComponentKeyMouseEventTest::TestRegisterKeyEventCallbackWithResult_02,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetTouchPointErrorCode_01", nullptr, XComponentKeyMouseEventTest::TestGetTouchPointErrorCode_01,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetTouchPointErrorCode_02", nullptr, XComponentKeyMouseEventTest::TestGetTouchPointErrorCode_02,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestRegisterUIInputEventCallbackErrorCode_01", nullptr, XComponentKeyMouseEventTest::TestRegisterUIInputEventCallbackErrorCode_01,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestRegisterUIInputEventCallbackErrorCode_02", nullptr, XComponentKeyMouseEventTest::TestRegisterUIInputEventCallbackErrorCode_02,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestRegisterOnTouchInterceptCallbackErrorCode_01", nullptr, XComponentKeyMouseEventTest::TestRegisterOnTouchInterceptCallbackErrorCode_01,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestRegisterOnTouchInterceptCallbackErrorCode_02", nullptr, XComponentKeyMouseEventTest::TestRegisterOnTouchInterceptCallbackErrorCode_02,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetNativeAccessibilityProviderErrorCode_01", nullptr, XComponentKeyMouseEventTest::TestGetNativeAccessibilityProviderErrorCode_01,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetNativeAccessibilityProviderErrorCode_02", nullptr, XComponentKeyMouseEventTest::TestGetNativeAccessibilityProviderErrorCode_02,
         nullptr, nullptr, nullptr, napi_default, nullptr},

        {"TestAttachNativeRootNodeErrorCode001", nullptr, NodeXComponentTest::TestAttachNativeRootNodeErrorCode001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestAttachNativeRootNodeErrorCode002", nullptr, NodeXComponentTest::TestAttachNativeRootNodeErrorCode002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetNativeXComponentReturnNull", nullptr, NodeXComponentTest::TestGetNativeXComponentReturnNull,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestSurfaceHolderCreateReturnNull", nullptr, NodeXComponentTest::TestSurfaceHolderCreateReturnNull,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestSurfaceHolderGetUserDataReturnNull", nullptr, NodeXComponentTest::TestSurfaceHolderGetUserDataReturnNull,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestSurfaceCallbackCreateReturnNull", nullptr, NodeXComponentTest::TestSurfaceCallbackCreateReturnNull,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestXComponentGetNativeWindowReturnNull", nullptr, NodeXComponentTest::TestXComponentGetNativeWindowReturnNull,
         nullptr, nullptr, nullptr, napi_default, nullptr},

        {"CreateNodeContentTestNativeRoot", nullptr, NodeContentTest::CreateNodeContentTestNativeRoot,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NodeContentEventGetEventType", nullptr, NodeContentTest::NodeContentEventGetEventType,
         nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

// 编写接口的描述信息，根据实际需要可以修改对应参数
static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    // 入口函数
    .nm_register_func = Init, // 指定加载对应模块时的回调函数
    // 模块名称
    .nm_modname =
        "nativerender", // 指定模块名称，对于XComponent相关开发，这个名称必须和ArkTS侧XComponent中libraryname的值保持一致
    .nm_priv = ((void *)0),
    .reserved = {0},
};
} // namespace NativeXComponentSample

// __attribute__((constructor))修饰的方法由系统自动调用，使用Node-API接口napi_module_register()传入模块描述信息进行模块注册
extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&NativeXComponentSample::demoModule);
}