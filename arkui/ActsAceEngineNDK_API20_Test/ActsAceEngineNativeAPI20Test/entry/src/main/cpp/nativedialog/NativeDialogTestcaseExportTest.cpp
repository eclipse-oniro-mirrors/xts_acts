/*
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

#include "NativeDialogTestcase.h"
#include <vector>

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    std::vector<napi_property_descriptor> desc;
    desc.push_back(XL("ArkUILevelModeEmbedded", ArkUILevelModeEmbedded));
    desc.push_back(XL("ArkUIImmersiveModeExtend", ArkUIImmersiveModeExtend));
    desc.push_back(XL("ArkUIRegisterOnWillDismissWithUserData", ArkUIRegisterOnWillDismissWithUserData));
    desc.push_back(XL("ArkUINativeDialogAPI1", ArkUINativeDialogAPI1));
    desc.push_back(XL("ArkUISetKeyboardAvoidDistance", ArkUISetKeyboardAvoidDistance));
    desc.push_back(XL("ArkUINativeDialogAPI2", ArkUINativeDialogAPI2));
    desc.push_back(XL("ArkUISetLevelOrder", ArkUISetLevelOrder));
    desc.push_back(XL("ArkUIRegisterOnWillAppear", ArkUIRegisterOnWillAppear));
    desc.push_back(XL("ArkUIRegisterOnDidAppear", ArkUIRegisterOnDidAppear));
    desc.push_back(XL("ArkUIRegisterOnWillDisappear", ArkUIRegisterOnWillDisappear));
    desc.push_back(XL("ArkUIRegisterOnDidDisappear", ArkUIRegisterOnDidDisappear));
    desc.push_back(XL("ArkUISetFocusable", ArkUISetFocusable));
    napi_define_properties(env, exports, desc.size(), desc.data());
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "nativedialog",
    .nm_priv = ((void *)0),
    .reserved = {0}
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }