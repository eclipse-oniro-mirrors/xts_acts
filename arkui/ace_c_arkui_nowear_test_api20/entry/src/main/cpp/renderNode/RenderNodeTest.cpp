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
#include <arkui/native_render.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>
#include <hilog/log.h>

namespace ArkUICapiTest {

static napi_value TestRenderNode001(napi_env env, napi_callback_info info)
{
    // 节点初始化
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rootRenderNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto result = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rootRenderNode);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    auto rsNodeFirstChild = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto rsNodeSecondChild = OH_ArkUI_RenderNodeUtils_CreateNode();

    // 节点结构初始化
    result = OH_ArkUI_RenderNodeUtils_AddChild(rootRenderNode, rsNodeFirstChild);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_RenderNodeUtils_InsertChildAfter(rootRenderNode, rsNodeSecondChild, rsNodeSecondChild);

    // 节点结构验证
    int count = 0;
    ArkUI_RenderNodeHandle nodeTemp;
    result = OH_ArkUI_RenderNodeUtils_GetChild(rootRenderNode, 1, &nodeTemp);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    result = OH_ArkUI_RenderNodeUtils_GetFirstChild(rootRenderNode, &nodeTemp);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    result = OH_ArkUI_RenderNodeUtils_GetNextSibling(rsNodeFirstChild, &nodeTemp);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    result = OH_ArkUI_RenderNodeUtils_GetPreviousSibling(rsNodeSecondChild, &nodeTemp);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    ArkUI_RenderNodeHandle* nodeList;
    OH_ArkUI_RenderNodeUtils_GetChildren(rootRenderNode, &nodeList, &count);
    ASSERT_EQ(count, 2); // expect 2 children
    result = OH_ArkUI_RenderNodeUtils_GetChildrenCount(rootRenderNode, &count);
    ASSERT_EQ(count, 2); // expect 2 children

    // 节点结构验证结束，开始销毁
    result = OH_ArkUI_RenderNodeUtils_RemoveChild(rootRenderNode, rsNodeSecondChild);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    result = OH_ArkUI_RenderNodeUtils_ClearChildren(rootRenderNode);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_RenderNodeUtils_GetChildrenCount(rootRenderNode, &count);
    ASSERT_EQ(count, 0);
    result = OH_ArkUI_RenderNodeUtils_DisposeNode(rootRenderNode);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TestRenderNode002(napi_env env, napi_callback_info info)
{
    // 节点初始化
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rootRenderNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto result = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rootRenderNode);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    ArkUI_RenderContentModifierHandle modifier = OH_ArkUI_RenderNodeUtils_CreateContentModifier();
    result = OH_ArkUI_RenderNodeUtils_AttachContentModifier(rootRenderNode, modifier);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);

    // 测试 float property
    ArkUI_FloatPropertyHandle property = OH_ArkUI_RenderNodeUtils_CreateFloatProperty(0.5f);  // set value=0.5f
    float value = 0.0f;
    result = OH_ArkUI_RenderNodeUtils_GetFloatPropertyValue(property, &value);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(value, 0.5f);  // expect value equals to 0.5f
    result = OH_ArkUI_RenderNodeUtils_SetFloatPropertyValue(property, 1.5f);  // set value=1.5f
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    result = OH_ArkUI_RenderNodeUtils_GetFloatPropertyValue(property, &value);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(value, 1.5f);  // expect value equals to 1.5f
    result = OH_ArkUI_RenderNodeUtils_AttachFloatProperty(modifier, property);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);

    // float property 验证结束，开始销毁
    OH_ArkUI_RenderNodeUtils_DisposeFloatProperty(property);
    OH_ArkUI_RenderNodeUtils_DisposeContentModifier(modifier);
    result = OH_ArkUI_RenderNodeUtils_DisposeNode(rootRenderNode);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TestRenderNode003(napi_env env, napi_callback_info info)
{
    // 节点初始化
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_RenderContentModifierHandle modifier = OH_ArkUI_RenderNodeUtils_CreateContentModifier();
    ArkUI_Vector2PropertyHandle property = OH_ArkUI_RenderNodeUtils_CreateVector2Property(0.5f, 0.5f);  // set x, y=0.5f

    // 测试 Vector2Property
    float x = 0.0f;
    float y = 0.0f;
    auto result = OH_ArkUI_RenderNodeUtils_GetVector2PropertyValue(property, &x, &y);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(x, 0.5f);  // expect x equals to 0.5f
    ASSERT_EQ(y, 0.5f);  // expect y equals to 0.5f
    result = OH_ArkUI_RenderNodeUtils_SetVector2PropertyValue(property, 1.5f, 1.5f);  // set x, y=1.5f
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    result = OH_ArkUI_RenderNodeUtils_GetVector2PropertyValue(property, &x, &y);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(x, 1.5f);  // expect x equals to 1.5f
    ASSERT_EQ(y, 1.5f);  // expect y equals to 1.5f
    result = OH_ArkUI_RenderNodeUtils_AttachVector2Property(modifier, property);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);

    // float property 验证结束，开始销毁
    OH_ArkUI_RenderNodeUtils_DisposeVector2Property(property);
    OH_ArkUI_RenderNodeUtils_DisposeContentModifier(modifier);
    NAPI_END;
}

static napi_value TestRenderNode004(napi_env env, napi_callback_info info)
{
    // 节点初始化
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_RenderContentModifierHandle modifier = OH_ArkUI_RenderNodeUtils_CreateContentModifier();
    ArkUI_FloatAnimatablePropertyHandle property =
        OH_ArkUI_RenderNodeUtils_CreateFloatAnimatableProperty(0.5f);  // set value=0.5f

    // 测试 FloatAnimatableProperty
    float value = 0.0f;
    auto result = OH_ArkUI_RenderNodeUtils_GetFloatAnimatablePropertyValue(property, &value);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(value, 0.5f);  // expect value equals to 0.5f
    result = OH_ArkUI_RenderNodeUtils_SetFloatAnimatablePropertyValue(property, 1.5f);  // set value=1.5f
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    result = OH_ArkUI_RenderNodeUtils_GetFloatAnimatablePropertyValue(property, &value);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(value, 1.5f);  // expect value equals to 1.5f
    result = OH_ArkUI_RenderNodeUtils_AttachFloatAnimatableProperty(modifier, property);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);

    // FloatAnimatableProperty 验证结束，开始销毁
    OH_ArkUI_RenderNodeUtils_DisposeFloatAnimatableProperty(property);
    OH_ArkUI_RenderNodeUtils_DisposeContentModifier(modifier);
    NAPI_END;
}

static napi_value TestRenderNode005(napi_env env, napi_callback_info info)
{
    // 节点初始化
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_RenderContentModifierHandle modifier = OH_ArkUI_RenderNodeUtils_CreateContentModifier();
    ArkUI_ColorPropertyHandle property =
        OH_ArkUI_RenderNodeUtils_CreateColorProperty(0xFF0000FF);  // set value=0xFF0000FF
    
    // 测试 ColorProperty
    uint32_t value = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetColorPropertyValue(property, &value);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    result = OH_ArkUI_RenderNodeUtils_SetColorPropertyValue(property, 0xFF00FF00);  // set value=0xFF00FF00
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    result = OH_ArkUI_RenderNodeUtils_GetColorPropertyValue(property, &value);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    result = OH_ArkUI_RenderNodeUtils_AttachColorProperty(modifier, property);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);

    // ColorProperty 验证结束，开始销毁
    OH_ArkUI_RenderNodeUtils_DisposeColorProperty(property);
    OH_ArkUI_RenderNodeUtils_DisposeContentModifier(modifier);
    NAPI_END;
}

static napi_value TestRenderNode006(napi_env env, napi_callback_info info)
{
    // 节点初始化
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_RenderContentModifierHandle modifier = OH_ArkUI_RenderNodeUtils_CreateContentModifier();
    ArkUI_Vector2AnimatablePropertyHandle property =
        OH_ArkUI_RenderNodeUtils_CreateVector2AnimatableProperty(0.5f, 0.5f);  // set x, y=0.5f

    // 测试 Vector2AnimatableProperty
    float x = 0.0f;
    float y = 0.0f;
    auto result = OH_ArkUI_RenderNodeUtils_GetVector2AnimatablePropertyValue(property, &x, &y);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(x, 0.5f);  // expect x equals to 0.5f
    ASSERT_EQ(y, 0.5f);  // expect y equals to 0.5f
    result = OH_ArkUI_RenderNodeUtils_SetVector2AnimatablePropertyValue(property, 1.5f, 1.5f);  // set x, y=1.5f
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    result = OH_ArkUI_RenderNodeUtils_GetVector2AnimatablePropertyValue(property, &x, &y);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(x, 1.5f);  // expect x equals to 1.5f
    ASSERT_EQ(y, 1.5f);  // expect y equals to 1.5f
    result = OH_ArkUI_RenderNodeUtils_AttachVector2AnimatableProperty(modifier, property);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);

    // Vector2AnimatableProperty 验证结束，开始销毁
    OH_ArkUI_RenderNodeUtils_DisposeVector2AnimatableProperty(property);
    OH_ArkUI_RenderNodeUtils_DisposeContentModifier(modifier);
    NAPI_END;
}

static napi_value TestRenderNode007(napi_env env, napi_callback_info info)
{
    // 节点初始化
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_RenderContentModifierHandle modifier = OH_ArkUI_RenderNodeUtils_CreateContentModifier();
    ArkUI_ColorAnimatablePropertyHandle property =
        OH_ArkUI_RenderNodeUtils_CreateColorAnimatableProperty(0xFF0000FF);  // set value=0xFF0000FF

    // 测试 ColorAnimatableProperty
    uint32_t value = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetColorAnimatablePropertyValue(property, &value);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    result = OH_ArkUI_RenderNodeUtils_SetColorAnimatablePropertyValue(property, 0xFF00FF00);  // set value=0xFF00FF00
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    result = OH_ArkUI_RenderNodeUtils_GetColorAnimatablePropertyValue(property, &value);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    result = OH_ArkUI_RenderNodeUtils_AttachColorAnimatableProperty(modifier, property);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);

    // ColorAnimatableProperty 验证结束，开始销毁
    OH_ArkUI_RenderNodeUtils_DisposeColorAnimatableProperty(property);
    OH_ArkUI_RenderNodeUtils_DisposeContentModifier(modifier);
    NAPI_END;
}

static napi_value TestRenderNode008(napi_env env, napi_callback_info info)
{
    // 节点初始化
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto contentModifier = OH_ArkUI_RenderNodeUtils_CreateContentModifier();
    static bool drawCallbackCalled = false;
    auto drawCallback = [](ArkUI_DrawContext* context, void* userData) {
        drawCallbackCalled = true;
    };

    // 设置 ContentModifier 的 onDraw 回调
    int userData = 123;
    auto result = OH_ArkUI_RenderNodeUtils_SetContentModifierOnDraw(contentModifier, &userData, drawCallback);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);

    // 销毁 ContentModifier
    OH_ArkUI_RenderNodeUtils_DisposeContentModifier(contentModifier);
    NAPI_END;
}
} // namespace ArkUICapiTest