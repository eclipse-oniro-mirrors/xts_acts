/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "swiperIndicator.h"
#include "../manager/plugin_manager.h"
#include <arkui/native_interface_focus.h>
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_key_event.h>
#include <arkui/ui_input_event.h>
#include <string>
#include "ani/ani.h"

#include <arkui/drag_and_drop.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>

namespace ArkUICapiTest {


ani_int SwiperIndicatorTest::SwiperIndicatorTest_a(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperIndicatorTest_a", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperIndicator *indicator = OH_ArkUI_SwiperIndicator_Create(ARKUI_SWIPER_INDICATOR_TYPE_DOT);
    OH_ArkUI_SwiperIndicator_SetSpace(indicator, 4.7f);
    auto ret = OH_ArkUI_SwiperIndicator_GetSpace(indicator);
    
    ASSERT_EQ(ret, 4.7f);
    NAPI_END;
}

ani_int SwiperIndicatorTest::SwiperIndicatorTest_a1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperIndicatorTest_a1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperIndicator *indicator = nullptr;
    OH_ArkUI_SwiperIndicator_SetSpace(indicator, 4.7f);
    auto ret = OH_ArkUI_SwiperIndicator_GetSpace(indicator);
    
    ASSERT_EQ(ret, 8.0f);
    NAPI_END;
}
ani_int SwiperIndicatorTest::SwiperIndicatorTest_b(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperIndicatorTest_b", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperIndicator *indicator = OH_ArkUI_SwiperIndicator_Create(ARKUI_SWIPER_INDICATOR_TYPE_DOT);
    
    OH_ArkUI_SwiperIndicator_SetIgnoreSizeOfBottom(indicator, 47);
    auto ret = OH_ArkUI_SwiperIndicator_GetIgnoreSizeOfBottom(indicator);
    ASSERT_EQ(ret, 47);
    NAPI_END;
}

ani_int SwiperIndicatorTest::SwiperIndicatorTest_b1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperIndicatorTest_b1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperIndicator *indicator = nullptr;
    
    OH_ArkUI_SwiperIndicator_SetIgnoreSizeOfBottom(indicator, 47);
    auto ret = OH_ArkUI_SwiperIndicator_GetIgnoreSizeOfBottom(indicator);
    ASSERT_EQ(ret, 0);
    NAPI_END;
}
} // namespace ArkUICapiTest