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
#include "nodeutilstest/NodeUtilsTest.h"
#include <arkui/native_node.h>

static ArkUI_NodeHandle g_handle = nullptr;
static int32_t g_nodeutilsresult1 = 2;
static int32_t g_nodeutilsresult2 = 2;
static int32_t g_nodeutilsresult3 = 2;
static ArkUI_NodeCustomEvent* g_customevent;
static ArkUI_NativeNodeAPI_1 *g_nodeAPI = nullptr;
namespace NodeUtilsTest {
napi_value GetLayoutSizeTest_001(napi_env env, napi_callback_info info)
{
    ArkUI_IntSize size;
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_nodeAPI);
    // 创建指定类型的节点
    auto component = g_nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    int result = OH_ArkUI_NodeUtils_GetLayoutSize(component, &size);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetLayoutSizeTest_002(napi_env env, napi_callback_info info)
{
    int result = OH_ArkUI_NodeUtils_GetLayoutSize(g_handle, nullptr);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetLayoutPositionTest_001(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_nodeAPI);
    // 创建指定类型的节点
    auto g_handle = g_nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    ArkUI_IntOffset localOffset;
    int result = OH_ArkUI_NodeUtils_GetLayoutPosition(g_handle, &localOffset);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetLayoutPositionTest_002(napi_env env, napi_callback_info info)
{
    ArkUI_IntOffset localOffset;
    int result = OH_ArkUI_NodeUtils_GetLayoutPosition(g_handle, &localOffset);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetLayoutPositionInWindowTest_001(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_nodeAPI);
    // 创建指定类型的节点
    auto g_handle = g_nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_IntOffset globalOffset;
    int result = OH_ArkUI_NodeUtils_GetLayoutPositionInWindow(g_handle, &globalOffset);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetLayoutPositionInWindowTest_002(napi_env env, napi_callback_info info)
{
    ArkUI_IntOffset globalOffset;
    int result = OH_ArkUI_NodeUtils_GetLayoutPositionInWindow(g_handle, &globalOffset);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetLayoutPositionInScreenTest_001(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_nodeAPI);
    // 创建指定类型的节点
    auto g_handle = g_nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_IntOffset screenOffset;
    int result = OH_ArkUI_NodeUtils_GetLayoutPositionInScreen(g_handle, &screenOffset);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetLayoutPositionInScreenTest_002(napi_env env, napi_callback_info info)
{
    ArkUI_IntOffset screenOffset;
    int result = OH_ArkUI_NodeUtils_GetLayoutPositionInScreen(g_handle, &screenOffset);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}
napi_value GetLayoutPositionInGlobalDisplayTest_001(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_nodeAPI);
    // 创建指定类型的节点
    auto g_handle = g_nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_IntOffset offset;
    int result = OH_ArkUI_NodeUtils_GetLayoutPositionInGlobalDisplay(g_handle, &offset);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetLayoutPositionInGlobalDisplayTest_002(napi_env env, napi_callback_info info)
{
    ArkUI_IntOffset offset;
    int result = OH_ArkUI_NodeUtils_GetLayoutPositionInGlobalDisplay(nullptr, &offset);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}
napi_value GetPositionWithTranslateInWindowTest_001(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_nodeAPI);
    // 创建指定类型的节点
    auto g_handle = g_nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_IntOffset translateOffset;
    int result = OH_ArkUI_NodeUtils_GetPositionWithTranslateInWindow(g_handle, &translateOffset);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetPositionWithTranslateInWindowTest_002(napi_env env, napi_callback_info info)
{
    ArkUI_IntOffset translateOffset;
    int result = OH_ArkUI_NodeUtils_GetPositionWithTranslateInWindow(g_handle, &translateOffset);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetPositionWithTranslateInScreenTest_001(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_nodeAPI);
    // 创建指定类型的节点
    auto g_handle = g_nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_IntOffset translateOffset;
    int result = OH_ArkUI_NodeUtils_GetPositionWithTranslateInScreen(g_handle, &translateOffset);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetPositionWithTranslateInScreenTest_002(napi_env env, napi_callback_info info)
{
    ArkUI_IntOffset translateOffset;
    int result = OH_ArkUI_NodeUtils_GetPositionWithTranslateInScreen(g_handle, &translateOffset);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetCustomPropertyTest_001(napi_env env, napi_callback_info info)
{
    const char* button;
    ArkUI_CustomProperty* handle;
    int result = OH_ArkUI_NodeUtils_GetCustomProperty(g_handle, button, &handle);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetActiveChildrenInfoTest_001(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_nodeAPI);
    // 创建指定类型的节点
    auto g_handle = g_nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto text = g_nodeAPI->createNode(ARKUI_NODE_TEXT);
    g_nodeAPI->addChild(g_handle, text);
    ArkUI_ActiveChildrenInfo* handle;
    int result = OH_ArkUI_NodeUtils_GetActiveChildrenInfo(g_handle, &handle);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetActiveChildrenInfoTest_002(napi_env env, napi_callback_info info)
{
    ArkUI_ActiveChildrenInfo* handle;
    int result = OH_ArkUI_NodeUtils_GetActiveChildrenInfo(g_handle, &handle);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value MoveToTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_nodeAPI);
    // 创建指定类型的节点
    auto g_handle = g_nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    g_nodeAPI->removeAllChildren(g_handle);
    ArkUI_NodeHandle node = nullptr;
    int result = OH_ArkUI_NodeUtils_MoveTo(g_handle, 0, 0);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SetCrossLanguageOptionTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_nodeAPI);
    // 创建指定类型的节点
    auto g_handle = g_nodeAPI->createNode(ARKUI_NODE_TEXT);
    g_nodeAPI->disposeNode(g_handle);
    auto g_option = OH_ArkUI_CrossLanguageOption_Create();
    OH_ArkUI_CrossLanguageOption_SetAttributeSettingStatus(g_option, true);
    int result = OH_ArkUI_NodeUtils_SetCrossLanguageOption(g_handle, g_option);
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value SetCrossLanguageOptionTest_002(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    ArkUI_NodeHandle g_handle = nullptr;
    auto g_option = OH_ArkUI_CrossLanguageOption_Create();
    OH_ArkUI_CrossLanguageOption_SetAttributeSettingStatus(g_option, true);
    int result = OH_ArkUI_NodeUtils_SetCrossLanguageOption(g_handle, g_option);
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetCrossLanguageOptionTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_nodeAPI);
    // 创建指定类型的节点
    auto g_handle = g_nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    g_nodeAPI->removeAllChildren(g_handle);
    auto g_option = OH_ArkUI_CrossLanguageOption_Create();
    OH_ArkUI_CrossLanguageOption_SetAttributeSettingStatus(g_option, true);
    int result = OH_ArkUI_NodeUtils_GetCrossLanguageOption(g_handle, g_option);
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetCrossLanguageOptionTest_002(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    ArkUI_NodeHandle g_handle = nullptr;
    auto g_option = OH_ArkUI_CrossLanguageOption_Create();
    OH_ArkUI_CrossLanguageOption_SetAttributeSettingStatus(g_option, true);
    int result = OH_ArkUI_NodeUtils_GetCrossLanguageOption(g_handle, g_option);
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}
}