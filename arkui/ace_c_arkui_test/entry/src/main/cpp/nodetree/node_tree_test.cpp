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
#include "../manager/plugin_manager.h"
#include "attributesetting/node_model.h"
#define ARKUI_ERROR_CODE_NOT_SUPPROTED_FOR_ARKTS_NODE 106103

namespace ArkUICapiTest {

static napi_value TestNodeTree001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_200}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_HEIGHT, &value_item);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_HEIGHT)->value[PARAM_0].f32, PARAM_200);

    NAPI_END;
}

static napi_value TestNodeTree002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(column, button);
    nodeAPI->disposeNode(button);
    button = nullptr;
    ASSERT_OBJ(button, nullptr);

    NAPI_END;
}

static napi_value TestNodeTree003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto ret = nodeAPI->addChild(column, button);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_OBJ(nodeAPI->getFirstChild(column), button);

    NAPI_END;
}

static napi_value TestNodeTree004(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(column, button);
    auto ret = nodeAPI->removeChild(column, button);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_OBJ(nodeAPI->getFirstChild(column), nullptr);

    NAPI_END;
}

static napi_value TestNodeTree005(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button0 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(column, button0);
    nodeAPI->insertChildAfter(column, button1, button0);
    auto ret = nodeAPI->removeAllChildren(column);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_OBJ(nodeAPI->getFirstChild(column), nullptr);

    NAPI_END;
}

static napi_value TestNodeTree006(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button0 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->insertChildAt(column, button0, PARAM_0);
    auto ret = nodeAPI->insertChildAfter(column, button1, button0);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_OBJ(nodeAPI->getChildAt(column, PARAM_1), button1);

    NAPI_END;
}

static napi_value TestNodeTree007(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button0 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->insertChildAt(column, button1, PARAM_0);
    auto ret = nodeAPI->insertChildBefore(column, button0, button1);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_OBJ(nodeAPI->getChildAt(column, PARAM_0), button0);

    NAPI_END;
}

static napi_value TestNodeTree008(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button0 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto ret = nodeAPI->insertChildAt(column, button0, PARAM_0);
    nodeAPI->insertChildAt(column, button1, PARAM_1);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_OBJ(nodeAPI->getFirstChild(column), button0);

    NAPI_END;
}

static napi_value TestNodeTree009(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(column, button);
    ASSERT_OBJ(nodeAPI->getParent(button), column);

    NAPI_END;
}

static napi_value TestNodeTree010(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);

    ASSERT_EQ(nodeAPI->addChild(column, nullptr), INVALID_PARAM);

    NAPI_END;
}

static napi_value TestNodeTree011(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(column, button);
    
    ASSERT_EQ(nodeAPI->removeChild(nullptr, nullptr), INVALID_PARAM);

    NAPI_END;
}

static napi_value TestNodeTree012(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button0 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(column, button0);
    nodeAPI->insertChildAfter(column, button1, button0);

    ASSERT_EQ(nodeAPI->removeAllChildren(nullptr), INVALID_PARAM);

    NAPI_END;
}

static napi_value TestNodeTree013(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button0 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->insertChildAt(column, button0, PARAM_0);

    ASSERT_EQ(nodeAPI->insertChildAfter(nullptr, nullptr, nullptr), INVALID_PARAM);

    NAPI_END;
}

static napi_value TestNodeTree014(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button0 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->insertChildAt(column, button1, PARAM_0);

    ASSERT_EQ(nodeAPI->insertChildBefore(nullptr, nullptr, nullptr), INVALID_PARAM);

    NAPI_END;
}

static napi_value TestNodeTree015(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button0 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    auto button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);

    ASSERT_EQ(nodeAPI->insertChildAt(nullptr, nullptr, PARAM_0), INVALID_PARAM);

    NAPI_END;
}

static napi_value TestNodeTree016(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto ret = nodeAPI->createNode(static_cast<ArkUI_NodeType>(PARAM_NEGATIVE_1));
    ASSERT_OBJ(ret, nullptr);

    NAPI_END;
}

static napi_value TestNodeTree017(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(column, button);
    button = nullptr;
    ASSERT_OBJ(nodeAPI->getParent(button), nullptr);

    NAPI_END;
}

static napi_value TestNodeTree018(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto abnormalNode = new ArkUI_Node({PARAM_NEGATIVE_1, nullptr});
    ASSERT_EQ(nodeAPI->addChild(abnormalNode, abnormalNode), ARKUI_ERROR_CODE_NOT_SUPPROTED_FOR_ARKTS_NODE);

    NAPI_END;
}

static napi_value TestNodeTree019(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto abnormalNode = new ArkUI_Node({PARAM_NEGATIVE_1, nullptr});
    ASSERT_EQ(nodeAPI->removeChild(abnormalNode, abnormalNode), ARKUI_ERROR_CODE_NOT_SUPPROTED_FOR_ARKTS_NODE);

    NAPI_END;
}

static napi_value TestNodeTree020(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto abnormalNode = new ArkUI_Node({PARAM_NEGATIVE_1, nullptr});
    ASSERT_EQ(nodeAPI->insertChildAfter(abnormalNode, abnormalNode, nullptr),
        ARKUI_ERROR_CODE_NOT_SUPPROTED_FOR_ARKTS_NODE);

    NAPI_END;
}

static napi_value TestNodeTree021(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto abnormalNode = new ArkUI_Node({PARAM_NEGATIVE_1, nullptr});
    ASSERT_EQ(nodeAPI->insertChildBefore(abnormalNode, abnormalNode, nullptr),
        ARKUI_ERROR_CODE_NOT_SUPPROTED_FOR_ARKTS_NODE);

    NAPI_END;
}

static napi_value TestNodeTree022(napi_env env, napi_callback_info info)
{
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto abnormalNode = new ArkUI_Node({PARAM_NEGATIVE_1, nullptr});
    ASSERT_EQ(nodeAPI->insertChildAt(abnormalNode, abnormalNode, PARAM_0),
        ARKUI_ERROR_CODE_NOT_SUPPROTED_FOR_ARKTS_NODE);

    NAPI_END;
}
} // namespace ArkUICapiTest