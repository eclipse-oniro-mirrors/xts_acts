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

static napi_value TestCustomComponentGetPreviousSibling001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto button2 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto button3 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto button4 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(column, button1);
    nodeAPI->addChild(column, button2);
    nodeAPI->addChild(column, button3);
    nodeAPI->addChild(column, button4);
    auto button = nodeAPI->getChildAt(column, PARAM_1);
    auto previousButton = nodeAPI->getPreviousSibling(button);
    ASSERT_OBJ(previousButton, button1);
    NAPI_END;
}
static napi_value TestCustomComponentGetPreviousSibling002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto button2 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto button3 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto button4 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(column, button1);
    nodeAPI->addChild(column, button2);
    nodeAPI->addChild(column, button3);
    nodeAPI->addChild(column, button4);
    auto button = nodeAPI->getChildAt(column, PARAM_0);
    auto previousButton = nodeAPI->getPreviousSibling(button);
    ASSERT_OBJ(previousButton, nullptr);
    NAPI_END;
}
static napi_value TestCustomComponentGetPreviousSibling003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto button2 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto button3 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto button4 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(column, button1);
    nodeAPI->addChild(column, button2);
    nodeAPI->addChild(column, button3);
    nodeAPI->addChild(column, button4);
    auto button = nodeAPI->getChildAt(column, PARAM_3);
    auto previousButton = nodeAPI->getPreviousSibling(button);
    ASSERT_OBJ(previousButton, button3);
    NAPI_END;
}
} // namespace ArkUICapiTest
