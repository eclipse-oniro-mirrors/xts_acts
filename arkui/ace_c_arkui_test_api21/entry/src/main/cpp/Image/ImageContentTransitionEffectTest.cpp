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

namespace ArkUICapiTest {

static napi_value TestImageContentTransitionEffect001(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    ArkUI_ContentTransitionEffect* contentTransitionEffect = OH_ArkUI_ContentTransitionEffect_Create(1);
    ArkUI_AttributeItem ContentTransitionTypeItem = {.object = contentTransitionEffect};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_CONTENT_TRANSITION, &ContentTransitionTypeItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_CONTENT_TRANSITION)->value[PARAM_0].i32, 1);
    NAPI_END;
}

static napi_value TestImageContentTransitionEffect002(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    ArkUI_ContentTransitionEffect* contentTransitionEffect = OH_ArkUI_ContentTransitionEffect_Create(0);
    ArkUI_AttributeItem ContentTransitionTypeItem = {.object = contentTransitionEffect};
    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_CONTENT_TRANSITION, &ContentTransitionTypeItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_IMAGE_CONTENT_TRANSITION)->value[PARAM_0].i32, 0);
    NAPI_END;
}

} // namespace ArkUICapiTest