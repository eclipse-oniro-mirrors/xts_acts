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

#include "span_onclick_test.h"
#include "../manager/plugin_manager.h"
#include "span_component.h"
#include "text_component.h"
#include <string>

namespace ArkUICapiTest {

napi_value SpanOnClickTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SpanOnClickTest", "CreateNativeNode");

    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = {0};
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SpanOnClickTest", "GetContext env or info is null");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto text = new TextComponent();
    text->SetWidth(SIZE_100);
    text->SetHeight(SIZE_100);
    text->SetBackgroundColor(COLOR_GREEN);
    text->SetId("SpanClickText");
    auto Span = new SpanComponent();
    Span->SetWidth(SIZE_200);
    Span->SetHeight(SIZE_200);
    Span->SetBorderWidth(SIZE_10);
    Span->SetMargin(SIZE_10);
    Span->SetSpanContent("123456");
    Span->SetId("onSpanClick");
    Span->RegisterOnClick([text]() { text->SetBackgroundColor(COLOR_RED); });
    nodeAPI->addChild(column, text->GetComponent());
    nodeAPI->addChild(text->GetComponent(), Span->GetComponent());

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "AltTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
}