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

static ani_double TestLazyForEachGetAllItems002(ani_env* env, ani_object info)
{
    ArkUI_NodeHandle** items = nullptr;
    uint32_t size;
    auto ret = OH_ArkUI_NodeAdapter_GetAllItems(nullptr, items, &size);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestLazyForEachGetAllItems003(ani_env* env, ani_object info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);
    ArkUI_NodeAdapterHandle adapter = OH_ArkUI_NodeAdapter_Create();
    ArkUI_AttributeItem adapterItem { .object = adapter };
    nodeAPI->setAttribute(grid, NODE_GRID_NODE_ADAPTER, &adapterItem);
    auto gridItem = nodeAPI->createNode(ARKUI_NODE_GRID_ITEM);
    nodeAPI->addChild(grid, gridItem);
    uint32_t size;
    auto ret = OH_ArkUI_NodeAdapter_GetAllItems(adapter, nullptr, &size);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_NodeAdapter_Dispose(adapter);
    NAPI_END;
}

} // namespace ArkUIAniTest