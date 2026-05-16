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

#include <cstring>
#include "common/common.h"
#include "ani/ani.h"

#define NUM_0 0
#define NUM_1 1

namespace ArkUIAniTest {

static ani_double TestRelativeContaineBarrierOption001(ani_env* env, ani_object info)
{
    const char* barrierId = "BarrierOption";
    auto barrier = OH_ArkUI_BarrierOption_Create(NUM_1);
    OH_ArkUI_BarrierOption_SetId(barrier, barrierId, NUM_0);

    auto ret = OH_ArkUI_BarrierOption_GetId(barrier, NUM_0);
    if (::strcmp(ret, barrierId) != NUM_0) {
        ani_int errorResult = PARAM_NEGATIVE_1;                                                                          \
        return errorResult;
    }

    OH_ArkUI_BarrierOption_Dispose(barrier);

    NAPI_END;
}

static ani_double TestRelativeContaineBarrierOption002(ani_env* env, ani_object info)
{
    auto barrier = OH_ArkUI_BarrierOption_Create(NUM_1);
    OH_ArkUI_BarrierOption_SetDirection(barrier, ARKUI_BARRIER_DIRECTION_BOTTOM, NUM_0);
    
    ASSERT_EQ(OH_ArkUI_BarrierOption_GetDirection(barrier, NUM_0), ARKUI_BARRIER_DIRECTION_BOTTOM);

    OH_ArkUI_BarrierOption_Dispose(barrier);

    NAPI_END;
}

static ani_double TestRelativeContaineBarrierOption003(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    
    ArkUI_AttributeItem textItem = {};
    textItem.string = "Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &textItem);
    ArkUI_AttributeItem textItemId = {.string = "text"};
    nodeAPI->setAttribute(text, NODE_ID, &textItemId);
    
    auto barrier = OH_ArkUI_BarrierOption_Create(NUM_1);
    OH_ArkUI_BarrierOption_SetReferencedId(barrier, "text", NUM_0);
    
    char text1[] = "text";
    auto ret = OH_ArkUI_BarrierOption_GetReferencedId(barrier, NUM_0, NUM_0);
    if (::strcmp(ret, text1) != NUM_0) {
        ani_int errorResult = PARAM_NEGATIVE_1;                                                                          \
        return errorResult;
    }
    ASSERT_EQ(OH_ArkUI_BarrierOption_GetReferencedIdSize(barrier, NUM_0), NUM_1);

    OH_ArkUI_BarrierOption_Dispose(barrier);

    NAPI_END;
}

} // namespace ArkUIAniTest
