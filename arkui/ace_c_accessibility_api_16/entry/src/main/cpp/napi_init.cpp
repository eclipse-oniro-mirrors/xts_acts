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

#include "napi/native_api.h"
#include "NativeEntry.h"


EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    // 绑定Native侧的创建组件和销毁组件。
    napi_property_descriptor desc[] = {
        // 注册布局回调
        {"verifyingTheLayoutCallbackFunction", nullptr, NativeModule::verifyingTheLayoutCallbackFunction, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        // 注册布局回调-给1个组件设置100个回调函数
        {"verifyingTheLayoutAndDrawCallbackFunction100", nullptr,
         NativeModule::verifyingTheLayoutAndDrawCallbackFunction100, nullptr, nullptr, nullptr, napi_default, nullptr},
        // 注册布局回调-给3000个组件设置回调函数
        {"verifyingTheLayoutCallbackFunction3000", nullptr,
         NativeModule::verifyingTheLayoutCallbackFunction3000, nullptr, nullptr, nullptr, napi_default, nullptr},
        // 关闭布局回调
        {"verifyTheDeregistrationLayoutCallbackFunction", nullptr,
         NativeModule::verifyTheDeregistrationLayoutCallbackFunction, nullptr, nullptr, nullptr, napi_default, nullptr},
        // 注册绘制回调
        {"verifyRegisterDrawCallback", nullptr, NativeModule::verifyRegisterDrawCallback, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        // 注销绘制回调
        {"verifyUnregisterDrawCallback", nullptr, NativeModule::verifyUnregisterDrawCallback, nullptr, nullptr, nullptr,
         napi_default, nullptr},

        {"createNativeRoots", nullptr, NativeModule::CreateNativeRoots, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"destroyNativeRoot", nullptr, NativeModule::DestroyNativeRoot, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"destroyNativeRoots", nullptr, NativeModule::DestroyNativeRoots, nullptr, nullptr, nullptr, napi_default,
         nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }