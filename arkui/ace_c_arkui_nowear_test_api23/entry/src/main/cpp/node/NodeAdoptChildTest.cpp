/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "common/common.h"
#include "../manager/PluginManagerTest.h"
#include <arkui/native_render.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>
#include <hilog/log.h>

namespace ArkUICapiTest {

static napi_value TestNodeAdoptChild001(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle Text1;
    ArkUI_NodeHandle column1;
    if (Text1 == nullptr) {
        auto result1 = OH_ArkUI_NativeModule_AdoptChild(column1, Text1);
        ASSERT_EQ(result1, ARKUI_ERROR_CODE_NODE_CAN_NOT_BE_ADOPTED);
    } else if (column1 == nullptr) {
        auto result1 = OH_ArkUI_NativeModule_AdoptChild(column1, Text1);
        ASSERT_EQ(result1, ARKUI_ERROR_CODE_NODE_CAN_NOT_ADOPT_TO);
    } else {
        auto result2 = OH_ArkUI_NativeModule_AdoptChild(column1, Text1);
        ASSERT_EQ(result2, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    }
    NAPI_END;
}

static napi_value TestNodeAdoptChild002(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle Text2;
    ArkUI_RenderNodeHandle handle2;
    if (handle2 == nullptr) {
        auto result = OH_ArkUI_RenderNodeUtils_GetRenderNode(Text2, &handle2);
        ASSERT_EQ(result, ARKUI_ERROR_CODE_PARAM_INVALID);
    } else {
        auto result = OH_ArkUI_RenderNodeUtils_GetRenderNode(Text2, &handle2);
        ASSERT_EQ(result, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    }
    NAPI_END;
}

static napi_value TestNodeAdoptChild003(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle Text3;
    ArkUI_NodeHandle column3;
    if (Text3 == nullptr || column3 == nullptr) {
        auto result = OH_ArkUI_NativeModule_RemoveAdoptedChild(column3, Text3);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "NodeAdoptChild003 result1=%{public}d", result);
        ASSERT_EQ(result, ARKUI_ERROR_CODE_NODE_IS_NOT_IN_ADOPTED_CHILDREN);
    } else {
        auto result = OH_ArkUI_NativeModule_RemoveAdoptedChild(column3, Text3);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "NodeAdoptChild003 result2=%{public}d", result);
        ASSERT_EQ(result, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    }
    NAPI_END;
}

static napi_value TestNodeAdoptChild004(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    auto result = OH_ArkUI_NativeModule_AdoptChild(column, Text);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);

    // 测试点2：异常挂载
    ArkUI_NodeHandle Text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    nodeAPI->addChild(column, Text1);
    result = OH_ArkUI_NativeModule_AdoptChild(column, Text1);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NODE_HAS_PARENT);
    
    result = OH_ArkUI_NativeModule_AdoptChild(Text, nullptr);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NODE_CAN_NOT_BE_ADOPTED);
    
    ArkUI_NodeHandle Text2 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    result = OH_ArkUI_NativeModule_AdoptChild(nullptr, Text2);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NODE_CAN_NOT_ADOPT_TO);

    NAPI_END;
}

static napi_value TestNodeAdoptChild005(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    auto result = OH_ArkUI_NativeModule_AdoptChild(column, Text);

    result = OH_ArkUI_NativeModule_RemoveAdoptedChild(column, Text);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);

    ArkUI_NodeHandle Text2 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    result = OH_ArkUI_NativeModule_RemoveAdoptedChild(column, Text2);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NODE_IS_NOT_IN_ADOPTED_CHILDREN);

    NAPI_END;
}

static napi_value TestNodeAdoptChild006(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);

    auto result = OH_ArkUI_NativeModule_AdoptChild(column, Text);

    ArkUI_RenderNodeHandle handle;
    result = OH_ArkUI_RenderNodeUtils_GetRenderNode(nullptr, &handle);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_NOT_ADOPTED_NODE);

    ArkUI_NodeHandle Text2 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    result = OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, nullptr);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_PARAM_INVALID);

    result = OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &handle);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TestNodeAdoptChild007(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);

    auto result = nodeAPI->addChild(column, Text);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NODE_IS_ADOPTED);
    
    NAPI_END;
}

static napi_value TestNodeAdoptChild008(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);

    auto result = nodeAPI->insertChildAt(column, Text, 0);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NODE_IS_ADOPTED);
    NAPI_END;
}

static napi_value TestNodeAdoptChild009(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);

    auto result = nodeAPI->insertChildAfter(column, Text, Custom);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NODE_IS_ADOPTED);
    NAPI_END;
}

static napi_value TestNodeAdoptChild010(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);

    auto result = nodeAPI->insertChildBefore(column, Text, Custom);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NODE_IS_ADOPTED);
    NAPI_END;
}

static napi_value TestNodeAdoptChild011(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);

    auto result = OH_ArkUI_NodeUtils_MoveTo(Text, column, 1);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NODE_IS_ADOPTED);
    NAPI_END;
}

static napi_value TestNodeAdoptChild012(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    auto result = OH_ArkUI_RenderNodeUtils_ClearChildren(adoptRSNode);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild013(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);

    ArkUI_RenderNodeHandle childRs;
    auto result = OH_ArkUI_RenderNodeUtils_GetChild(adoptRSNode, 0, &childRs);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild014(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    ArkUI_RenderNodeHandle childRs;
    OH_ArkUI_RenderNodeUtils_GetChild(adoptRSNode, 0, &childRs);
    
    auto result = OH_ArkUI_RenderNodeUtils_RemoveChild(adoptRSNode, adoptRSNode);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild015(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNodeRoot);
    
    auto result = OH_ArkUI_RenderNodeUtils_AddChild(adoptRSNode, rsNodeRoot);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild016(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNodeRoot);
    
    ArkUI_RenderNodeHandle rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto result = OH_ArkUI_RenderNodeUtils_InsertChildAfter(adoptRSNode, rsNodeRoot, rsNode);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild017(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    ArkUI_RenderNodeHandle* rsChildren;
    int32_t count = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetChildren(adoptRSNode, &rsChildren, &count);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild018(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    ArkUI_RenderNodeHandle childRs;
    OH_ArkUI_RenderNodeUtils_GetChild(adoptRSNode, 0, &childRs);

    auto result = OH_ArkUI_RenderNodeUtils_GetFirstChild(adoptRSNode, &childRs);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild019(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);

    int32_t count = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetChildrenCount(adoptRSNode, &count);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild020(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);

    auto result = OH_ArkUI_RenderNodeUtils_SetBackgroundColor(adoptRSNode, 0xFF0000FF);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild021(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);

    uint32_t backgroundColor = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetBackgroundColor(adoptRSNode, &backgroundColor);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild022(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);

    float opacity = 0;
    auto result = OH_ArkUI_RenderNodeUtils_SetOpacity(adoptRSNode, opacity);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild023(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);

    float opacity = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetOpacity(adoptRSNode, &opacity);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild024(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    int32_t getSizeWidth = 0;
    int32_t getSizeHeight = 0;
    auto result = OH_ArkUI_RenderNodeUtils_SetSize(adoptRSNode, getSizeWidth, getSizeHeight);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild025(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    int32_t getSizeWidth = 0;
    int32_t getSizeHeight = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetSize(adoptRSNode, &getSizeWidth, &getSizeHeight);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild026(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    int32_t setPositionX = 0;
    int32_t setPositionY = 0;
    auto result = OH_ArkUI_RenderNodeUtils_SetPosition(adoptRSNode, setPositionX, setPositionY);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild027(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    int32_t setPositionX = 0;
    int32_t setPositionY = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetPosition(adoptRSNode, &setPositionX, &setPositionY);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild028(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    float setPivotX = 0;
    float setPivotY = 0;
    auto result = OH_ArkUI_RenderNodeUtils_SetPivot(adoptRSNode, setPivotX, setPivotY);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild029(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    float setPivotX = 0;
    float setPivotY = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetPivot(adoptRSNode, &setPivotX, &setPivotY);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild030(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    float setScaleX = 0;
    float setScaleY = 0;
    auto result = OH_ArkUI_RenderNodeUtils_SetScale(adoptRSNode, setScaleX, setScaleY);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild031(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    float setScaleX = 0;
    float setScaleY = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetScale(adoptRSNode, &setScaleX, &setScaleY);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild032(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    float setTranslationX = 0;
    float setTranslationY = 0;
    auto result = OH_ArkUI_RenderNodeUtils_SetTranslation(adoptRSNode, setTranslationX, setTranslationY);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild033(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    float setTranslationX = 0;
    float setTranslationY = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetTranslation(adoptRSNode, &setTranslationX, &setTranslationY);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}
    
static napi_value TestNodeAdoptChild034(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    float setRotationX = 0;
    float setRotationY = 0;
    float setRotationZ = 0;
    auto result = OH_ArkUI_RenderNodeUtils_SetRotation(adoptRSNode, setRotationX, setRotationY, setRotationZ);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}
    
static napi_value TestNodeAdoptChild035(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    float setRotationX = 0;
    float setRotationY = 0;
    float setRotationZ = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetRotation(adoptRSNode, &setRotationX, &setRotationY, &setRotationZ);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}
    
static napi_value TestNodeAdoptChild036(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    float matrix[] = {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1};
    auto result = OH_ArkUI_RenderNodeUtils_SetTransform(adoptRSNode, matrix);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}
    
static napi_value TestNodeAdoptChild037(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    auto result = OH_ArkUI_RenderNodeUtils_SetShadowColor(adoptRSNode, 0xFFFF00FF);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}
    
static napi_value TestNodeAdoptChild038(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    uint32_t shadowColor = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetShadowColor(adoptRSNode, &shadowColor);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild039(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    int32_t shadowOffsetX = 0;
    int32_t shadowOffsetY = 0;
    auto result = OH_ArkUI_RenderNodeUtils_SetShadowOffset(adoptRSNode, shadowOffsetX, shadowOffsetY);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild040(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    int32_t shadowOffsetX = 0;
    int32_t shadowOffsetY = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetShadowOffset(adoptRSNode, &shadowOffsetX, &shadowOffsetY);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}
    
static napi_value TestNodeAdoptChild041(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    float alpha = 0;
    auto result = OH_ArkUI_RenderNodeUtils_SetShadowAlpha(adoptRSNode, alpha);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}
    
static napi_value TestNodeAdoptChild042(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    float alpha = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetShadowAlpha(adoptRSNode, &alpha);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}
    
static napi_value TestNodeAdoptChild043(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    float elevation = 0;
    auto result = OH_ArkUI_RenderNodeUtils_SetShadowElevation(adoptRSNode, elevation);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}
    
static napi_value TestNodeAdoptChild044(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    float elevation = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetShadowElevation(adoptRSNode, &elevation);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}
    
static napi_value TestNodeAdoptChild045(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    float radius = 0;
    auto result = OH_ArkUI_RenderNodeUtils_SetShadowRadius(adoptRSNode, radius);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild046(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    float radius = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetShadowRadius(adoptRSNode, &radius);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}
    
static napi_value TestNodeAdoptChild047(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    auto styleOption = OH_ArkUI_RenderNodeUtils_CreateNodeBorderStyleOption();
    auto result = OH_ArkUI_RenderNodeUtils_SetBorderStyle(adoptRSNode, styleOption);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}
    
static napi_value TestNodeAdoptChild048(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    auto styleOption = OH_ArkUI_RenderNodeUtils_CreateNodeBorderStyleOption();
    auto result = OH_ArkUI_RenderNodeUtils_GetBorderStyle(adoptRSNode, &styleOption);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}
    
static napi_value TestNodeAdoptChild049(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    auto widthOption = OH_ArkUI_RenderNodeUtils_CreateNodeBorderWidthOption();
    auto result = OH_ArkUI_RenderNodeUtils_SetBorderWidth(adoptRSNode, widthOption);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}
    
static napi_value TestNodeAdoptChild050(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    auto widthOption = OH_ArkUI_RenderNodeUtils_CreateNodeBorderWidthOption();
    auto result = OH_ArkUI_RenderNodeUtils_GetBorderWidth(adoptRSNode, &widthOption);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}
    
static napi_value TestNodeAdoptChild051(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    auto colorOption = OH_ArkUI_RenderNodeUtils_CreateNodeBorderColorOption();
    auto result = OH_ArkUI_RenderNodeUtils_SetBorderColor(adoptRSNode, colorOption);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}
    
static napi_value TestNodeAdoptChild052(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    auto colorOption = OH_ArkUI_RenderNodeUtils_CreateNodeBorderColorOption();
    auto result = OH_ArkUI_RenderNodeUtils_GetBorderColor(adoptRSNode, &colorOption);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}
    
static napi_value TestNodeAdoptChild053(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    auto radiusOption = OH_ArkUI_RenderNodeUtils_CreateNodeBorderRadiusOption();
    auto result = OH_ArkUI_RenderNodeUtils_SetBorderRadius(adoptRSNode, radiusOption);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild054(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    auto radiusOption = OH_ArkUI_RenderNodeUtils_CreateNodeBorderRadiusOption();
    auto result = OH_ArkUI_RenderNodeUtils_GetBorderRadius(adoptRSNode, &radiusOption);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild055(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    auto result = OH_ArkUI_RenderNodeUtils_SetMarkNodeGroup(adoptRSNode, true);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}
    
static napi_value TestNodeAdoptChild056(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    int32_t x = 0;
    int32_t y = 0;
    int32_t width = 0;
    int32_t height = 0;
    auto result = OH_ArkUI_RenderNodeUtils_SetBounds(adoptRSNode, x, y, width, height);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}
    
static napi_value TestNodeAdoptChild057(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    int32_t x = 0;
    int32_t y = 0;
    int32_t width = 0;
    int32_t height = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetBounds(adoptRSNode, &x, &y, &width, &height);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
} 

static napi_value TestNodeAdoptChild058(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    int32_t x = 0;
    int32_t y = 0;
    int32_t width = 0;
    int32_t height = 0;
    auto result = OH_ArkUI_RenderNodeUtils_SetDrawRegion(adoptRSNode, x, y, width, height);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild059(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    auto result = OH_ArkUI_RenderNodeUtils_SetClipToFrame(adoptRSNode, true);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild060(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    int32_t clipToFrame = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetClipToFrame(adoptRSNode, &clipToFrame);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild061(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    auto result = OH_ArkUI_RenderNodeUtils_SetClipToBounds(adoptRSNode, true);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild062(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    int32_t clipToBounds = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetClipToBounds(adoptRSNode, &clipToBounds);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild063(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    auto modifier = OH_ArkUI_RenderNodeUtils_CreateContentModifier();
    auto result = OH_ArkUI_RenderNodeUtils_AttachContentModifier(adoptRSNode, modifier);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild064(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    auto rectShape = OH_ArkUI_RenderNodeUtils_CreateRectShapeOption();
    auto mask = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromRectShape(rectShape);
    
    auto result = OH_ArkUI_RenderNodeUtils_SetMask(adoptRSNode, mask);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild065(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    auto rectShape = OH_ArkUI_RenderNodeUtils_CreateRectShapeOption();
    auto clip = OH_ArkUI_RenderNodeUtils_CreateRenderNodeClipOptionFromRectShape(rectShape);
    
    auto result = OH_ArkUI_RenderNodeUtils_SetClip(adoptRSNode, clip);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild066(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    
    OH_ArkUI_NativeModule_RemoveAdoptedChild(Custom, Text);
    auto result = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, adoptRSNode);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_HAS_INVALID_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild067(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNodeRoot);
    
    OH_ArkUI_NativeModule_RemoveAdoptedChild(Custom, Text);
    auto result = OH_ArkUI_RenderNodeUtils_AddChild(rsNodeRoot, adoptRSNode);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_HAS_INVALID_FRAME_NODE);
    NAPI_END;
}

static napi_value TestNodeAdoptChild068(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NativeModule_AdoptChild(Custom, Text);
    ArkUI_RenderNodeHandle adoptRSNode;
    OH_ArkUI_RenderNodeUtils_GetRenderNode(Text, &adoptRSNode);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNodeRoot);
    ArkUI_RenderNodeHandle rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();

    OH_ArkUI_NativeModule_RemoveAdoptedChild(Custom, Text);
    auto result = OH_ArkUI_RenderNodeUtils_InsertChildAfter(rsNodeRoot, adoptRSNode, rsNode);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_RENDER_HAS_INVALID_FRAME_NODE);
    NAPI_END;
}

} // namespace ArkUICapiTest