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
#include "common/common.h"
#include "ani/ani.h"

namespace ArkUIAniTest {
static void CreateRefreshingComponent(ArkUI_NativeNodeAPI_1* nodeAPI, ArkUI_NodeHandle& refreshingComponent)
{
    // clip
    ArkUI_NumberValue clip_value[] = { { .i32 = 1 } };
    ArkUI_AttributeItem clip_item = { clip_value, sizeof(clip_value) / sizeof(ArkUI_NumberValue) };
    refreshingComponent = nodeAPI->createNode(ARKUI_NODE_STACK);
    nodeAPI->setAttribute(refreshingComponent, NODE_CLIP, &clip_item);

    auto row = nodeAPI->createNode(ARKUI_NODE_ROW);
    // process height
    ArkUI_NumberValue height_value[] = { { .f32 = 32 } };
    ArkUI_AttributeItem height_item = { height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue) };

    // margin
    ArkUI_NumberValue margin_value[] = { { .f32 = 5 } };
    ArkUI_AttributeItem margin_item = { margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue) };

    auto loadingProgress = nodeAPI->createNode(ARKUI_NODE_LOADING_PROGRESS);
    nodeAPI->setAttribute(loadingProgress, NODE_HEIGHT, &height_item);

    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem LABEL_Item = { .string = "refreshing..." };
    ArkUI_NumberValue fontSize[] = { 16 };
    ArkUI_AttributeItem Font_Item = { fontSize, 1 };
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &LABEL_Item);
    nodeAPI->setAttribute(text, NODE_TEXT_FONT, &Font_Item);
    nodeAPI->setAttribute(text, NODE_MARGIN, &margin_item);

    nodeAPI->addChild(refreshingComponent, row);
    nodeAPI->addChild(row, text);
}
static ani_double TestRefreshContent001(ani_env* env, ani_object info)
{
    NAPI_START(refresh, ARKUI_NODE_REFRESH);
    ArkUI_NodeHandle refreshingComponent;
    CreateRefreshingComponent(nodeAPI, refreshingComponent);
    ArkUI_AttributeItem refreshingComponent_item { .object = refreshingComponent };
    auto ret = nodeAPI->setAttribute(refresh, NODE_REFRESH_CONTENT, &refreshingComponent_item);
    ASSERT_EQ(ret, SUCCESS);
    auto ret1 = nodeAPI->resetAttribute(refresh, NODE_REFRESH_CONTENT);
    ASSERT_EQ(ret1, SUCCESS);
    NAPI_END;
}

static ani_double TestRefreshContent002(ani_env* env, ani_object info)
{
    NAPI_START(refresh, ARKUI_NODE_REFRESH);
    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(refresh, NODE_REFRESH_CONTENT, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}
} // namespace ArkUIAniTest