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
#include "manager/PluginManagerTest.h"
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include <arkui/native_animate.h>
#include <arkui/native_gesture.h>
#include <arkui/native_node_napi.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include "arkui/native_interface.h"

namespace ArkUICapiTest {

static napi_value NodeSwiperItemFillpolocyTest(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    auto ret1 = nodeAPI->getAttribute(swiper, NODE_SWIPER_ITEMFILLPOLICY);
    ArkUI_NumberValue value[] = {0};
    ArkUI_AttributeItem item = {value, 1};
    value[0].i32 = PARAM_2;
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_ITEMFILLPOLICY, &item);
    ASSERT_EQ(ret, SUCCESS);
    ret1 = nodeAPI->getAttribute(swiper, NODE_SWIPER_ITEMFILLPOLICY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "hzq NODE_SWIPER_ITEMFILLPOLICY ", "%{public}d",
        ret1->value[0].i32);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_ITEMFILLPOLICY)->value[PARAM_0].i32,
        PARAM_2);
    NAPI_END;
}

} // namespace ArkUICapiTest