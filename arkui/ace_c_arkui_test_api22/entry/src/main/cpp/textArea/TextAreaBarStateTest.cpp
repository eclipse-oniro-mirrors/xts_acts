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

#include "TextAreaBarStateTest.h"
#include "../manager/PluginManagerTest.h"
#include <string>
#include <arkui/drag_and_drop.h>
#include <arkui/native_dialog.h>

namespace ArkUICapiTest {
static ArkUI_NodeHandle textArea_1 = nullptr;
static ArkUI_NodeHandle textArea_2 = nullptr;
static ArkUI_NodeHandle textArea_3 = nullptr;
static ArkUI_NodeHandle textArea_4 = nullptr;
static int_least32_t g_barStateUndefined = 4;

static ArkUI_NodeHandle CreateTextAreaBarStateTest(int_least32_t barState, const char *id)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto testId = id;
    auto textArea = nodeAPI->createNode(ARKUI_NODE_TEXT_AREA);
    ArkUI_AttributeItem item0;
    item0.string = "123\n123\n123";
    nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_TEXT, &item0);

    ArkUI_NumberValue maxLinesValue[] = {{.i32 = 2}};
    ArkUI_AttributeItem maxLinesItem = {maxLinesValue, sizeof(maxLinesValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_MAX_LINES, &maxLinesItem);

    ArkUI_NumberValue barStateValue[] = {{.i32 = barState}};
    ArkUI_AttributeItem barStateItem = {barStateValue, sizeof(barStateValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_BAR_STATE, &barStateItem);

    ArkUI_NumberValue value2[] = {2};
    ArkUI_AttributeItem item2 = {value2, sizeof(value2) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textArea, NODE_MARGIN, &item2);

    ArkUI_NumberValue value3[] = {{.u32 = 0xFFFFC0CB}};
    ArkUI_AttributeItem item3 = {value3, sizeof(value3) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textArea, NODE_BACKGROUND_COLOR, &item3);

    ArkUI_AttributeItem item4 = {.string = testId};
    nodeAPI->setAttribute(textArea, NODE_ID, &item4);

    return textArea;
}

napi_value TextAreaBarStateTest::CreateNativeNode(napi_env env, napi_callback_info info)
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

    textArea_1 = CreateTextAreaBarStateTest(ARKUI_BAR_STATE_OFF, "areaTest1");
    textArea_2 = CreateTextAreaBarStateTest(ARKUI_BAR_STATE_AUTO, "areaTest2");
    textArea_3 = CreateTextAreaBarStateTest(ARKUI_BAR_STATE_ON, "areaTest3");
    textArea_4 = CreateTextAreaBarStateTest(g_barStateUndefined, "areaTest4");
    nodeAPI->addChild(column, textArea_1);
    nodeAPI->addChild(column, textArea_2);
    nodeAPI->addChild(column, textArea_3);
    nodeAPI->addChild(column, textArea_4);
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