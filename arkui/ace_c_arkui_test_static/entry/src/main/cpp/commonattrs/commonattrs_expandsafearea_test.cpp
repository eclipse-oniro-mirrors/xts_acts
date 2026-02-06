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

static ani_double TestCommonAttrsExpandSafeArea001(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    uint32_t safeAreaType = ARKUI_SAFE_AREA_TYPE_SYSTEM;
    uint32_t safeAreaEdge = ARKUI_SAFE_AREA_EDGE_TOP;
    ArkUI_NumberValue value[] = {{.u32 = safeAreaType}, {.u32 = safeAreaEdge}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_EXPAND_SAFE_AREA, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_EXPAND_SAFE_AREA)->value[PARAM_0].u32, safeAreaType);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_EXPAND_SAFE_AREA)->value[PARAM_1].u32, safeAreaEdge);
    NAPI_END;
}

static ani_double TestCommonAttrsExpandSafeArea002(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    uint32_t safeAreaType = PARAM_0;
    uint32_t safeAreaEdge = PARAM_0;
    ArkUI_NumberValue value[] = {{.u32 = safeAreaType}, {.u32 = safeAreaEdge}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_EXPAND_SAFE_AREA, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    
    NAPI_END;
}

static ani_double TestCommonAttrsExpandSafeArea003(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    uint32_t safeAreaType = PARAM_5;
    uint32_t safeAreaEdge = PARAM_9;
    ArkUI_NumberValue value[] = {{.u32 = safeAreaType}, {.u32 = safeAreaEdge}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_EXPAND_SAFE_AREA, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCommonAttrsExpandSafeArea004(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    uint32_t safeAreaType = ARKUI_SAFE_AREA_TYPE_CUTOUT;
    uint32_t safeAreaEdge = ARKUI_SAFE_AREA_EDGE_BOTTOM;
    ArkUI_NumberValue value[] = {{.u32 = safeAreaType}, {.u32 = safeAreaEdge}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_EXPAND_SAFE_AREA, &valueItem);
    auto ret = nodeAPI->resetAttribute(column, NODE_EXPAND_SAFE_AREA);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

} // namespace ArkUIAniTest