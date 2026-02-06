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

#include "LineHeightTest.h"
#include "../manager/PluginManagerTest.h"
#include <string>
#include <arkui/drag_and_drop.h>
#include <arkui/native_dialog.h>

namespace ArkUICapiTest {
static ArkUI_NodeHandle text_1 = nullptr;
static float g_lineHeightMultiple = 6;
static float g_maxLineHeight = 5;
static float g_minLineHeight = 3;

static ArkUI_NodeHandle CreateLineHeightTest(float lineHeightMultiple, float maxLIneHeight,
                                             float minLIneHeight, const char *id)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto testId = id;
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem item0;
    item0.string = "TextLineHeightTest";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &item0);

    ArkUI_NumberValue lineHeightvalue1[] = {{.f32 = lineHeightMultiple}};
    ArkUI_AttributeItem lineHeightItem1 = {lineHeightvalue1, sizeof(lineHeightvalue1) /
        sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_TEXT_LINE_HEIGHT_MULTIPLE, &lineHeightItem1);

    ArkUI_NumberValue lineHeightvalue2[] = {{.f32 = maxLIneHeight}};
    ArkUI_AttributeItem lineHeightItem2 = {lineHeightvalue2, sizeof(lineHeightvalue2) /
        sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_TEXT_MAX_LINE_HEIGHT, &lineHeightItem2);

    ArkUI_NumberValue lineHeightvalue3[] = {{.f32 = minLIneHeight}};
    ArkUI_AttributeItem lineHeightItem3 = {lineHeightvalue3, sizeof(lineHeightvalue3) /
        sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_TEXT_MIN_LINE_HEIGHT, &lineHeightItem3);

    ArkUI_NumberValue value2[] = {10};
    ArkUI_AttributeItem item2 = {value2, sizeof(value2) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_MARGIN, &item2);

    ArkUI_NumberValue value3[] = {{.u32 = 0xFFFFC0CB}};
    ArkUI_AttributeItem item3 = {value3, sizeof(value3) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_BACKGROUND_COLOR, &item3);

    ArkUI_AttributeItem item4 = {.string = testId};
    nodeAPI->setAttribute(text, NODE_ID, &item4);

    return text;
}

napi_value LineHeightTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    static int32_t neg2 = -2;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragEventGetDisplayIdTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventGetDisplayIdTest", "GetContext is null");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    text_1 = CreateLineHeightTest(g_lineHeightMultiple, g_maxLineHeight, g_minLineHeight, "testLineHeight1");
    nodeAPI->addChild(column, text_1);
    std::string id(xComponentID);
    OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
} // namespace ArkUICapiTest