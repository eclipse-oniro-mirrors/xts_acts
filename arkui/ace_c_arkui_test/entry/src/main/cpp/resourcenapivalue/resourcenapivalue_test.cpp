/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "resourcenapivalue_test.h"

#include <arkui/native_node_napi.h>
#include <cstdint>
#include <string>

#include "../manager/plugin_manager.h"

static ArkUI_RouterPageState state;

namespace ArkUICapiTest {

napi_value ResourceNapiValueTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ResourceNapiValueTest", "CreateNativeNode");

    size_t argc = PARAM_2;
    napi_value args[PARAM_2] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ResourceNapiValueTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_DrawableDescriptor* descriptor = nullptr;
    OH_ArkUI_GetDrawableDescriptorFromResourceNapiValue(env, args[1], &descriptor);
    auto column = new ColumnComponent();
    auto column1 = std::make_shared<ColumnComponent>();
    column1->SetWidth(SIZE_100);
    column1->SetHeight(SIZE_100);
    column1->SetId("Column");
    if (descriptor != nullptr) {
        column1->SetBackgroundColor(COLOR_GREEN);
    } else {
        column1->SetBackgroundColor(COLOR_RED);
    }
    column->AddChild(column1);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RequirementPanGestureTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
} // namespace ArkUICapiTest
