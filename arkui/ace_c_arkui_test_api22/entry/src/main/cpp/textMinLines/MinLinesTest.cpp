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

#include "MinLinesTest.h"
#include "../manager/PluginManagerTest.h"
#include <string>
#include <arkui/drag_and_drop.h>
#include <arkui/native_dialog.h>

namespace ArkUICapiTest {
    static ArkUI_NodeHandle text = nullptr;
    static ArkUI_NodeHandle text_1 = nullptr;
    static ArkUI_NodeHandle text_2 = nullptr;
    static ArkUI_NodeHandle text_3 = nullptr;
    static ArkUI_NodeHandle text_4 = nullptr;
    static int32_t g_min5 = 5;

static ArkUI_NodeHandle CreateTextTest(int32_t data, const char* id)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto minLines = data;
    auto testId = id;
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem item0;
    item0.string = "你好,我是XTS测试文本,测试接口NODE_TEXT_MIN_LINES";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &item0);
    
    ArkUI_NumberValue value1[] = {{.i32 = minLines}};
    ArkUI_AttributeItem item1 = {value1, sizeof(value1)/ sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_TEXT_MIN_LINES, &item1);

    ArkUI_NumberValue value2[] = {10};
    ArkUI_AttributeItem item2 = {value2, sizeof(value2) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_MARGIN, &item2);
    
    ArkUI_NumberValue value3[] = {{.u32 = 0xFFFFC0CB}};
    ArkUI_AttributeItem item3 = {value3, sizeof(value3)/ sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_BACKGROUND_COLOR, &item3);

    ArkUI_AttributeItem item4 = {.string = testId};
    nodeAPI->setAttribute(text, NODE_ID, &item4);

    auto content = nodeAPI->getAttribute(text, NODE_TEXT_MIN_LINES)->value[0].i32;
    if (content == 1) {
        item0.string = "1";
        nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &item0);
    } else if (content == g_min5) {
        item0.string = "5";
        nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &item0);
    } else if (content == 0) {
        item0.string = "0";
        nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &item0);
    };
    return text;
}

napi_value MinLinesTest::CreateNativeNode(napi_env env, napi_callback_info info)
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

    text = CreateTextTest(1, "test1");
    text_1 = CreateTextTest(0, "test2");
    text_2 = CreateTextTest(g_min5, "test3");
    text_3 = CreateTextTest(NULL, "test4");
    text_4 = CreateTextTest(neg2, "test5");
    nodeAPI->addChild(column, text);
    nodeAPI->addChild(column, text_1);
    nodeAPI->addChild(column, text_2);
    nodeAPI->addChild(column, text_3);
    nodeAPI->addChild(column, text_4);
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