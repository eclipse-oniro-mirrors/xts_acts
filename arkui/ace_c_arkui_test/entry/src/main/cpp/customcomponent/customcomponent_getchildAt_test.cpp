/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "common/common.h"

namespace ArkUICapiTest {

static napi_value TestCustomComponentGetChildAt001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(column, button1);
    auto button2 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(column, button2);
    auto button3 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(column, button3);
    auto node = nodeAPI->getChildAt(column, 0);
    ASSERT_OBJ(node, button1);
    NAPI_END;
}
static napi_value TestCustomComponentGetChildAt002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(column, button1);
    auto button2 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(column, button2);
    auto button3 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(column, button3);
    auto node = nodeAPI->getChildAt(column, -1);
    ASSERT_OBJ(node, nullptr);
    NAPI_END;
}
static napi_value TestCustomComponentGetChildAt003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(column, button1);
    auto button2 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(column, button2);
    auto button3 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(column, button3);
    auto node = nodeAPI->getChildAt(column, 2);
    ASSERT_OBJ(node, button3);
    NAPI_END;
}
static napi_value TestCustomComponentGetChildAt004(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(column, button1);
    auto button2 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(column, button2);
    auto button3 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(column, button3);
    auto node = nodeAPI->getChildAt(column, 3);
    ASSERT_OBJ(node, nullptr);
    NAPI_END;
}
} // namespace ArkUICapiTest
