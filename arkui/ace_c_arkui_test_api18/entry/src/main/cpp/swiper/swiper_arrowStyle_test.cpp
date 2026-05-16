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
#include "../manager/plugin_manager.h"

namespace ArkUICapiTest {

static napi_value TestSwiperArrowStyle001(napi_env env, napi_callback_info info)
{
    ArkUI_SwiperArrowStyle* arrowStyle = OH_ArkUI_SwiperArrowStyle_Create();

    OH_ArkUI_SwiperArrowStyle_SetShowBackground(arrowStyle, 1);
    OH_ArkUI_SwiperArrowStyle_SetBackgroundSize(arrowStyle, 25);
    OH_ArkUI_SwiperArrowStyle_SetBackgroundColor(arrowStyle, COLOR_BLUE);

    ASSERT_EQ(OH_ArkUI_SwiperArrowStyle_GetShowBackground(arrowStyle), 1);
    ASSERT_EQ(OH_ArkUI_SwiperArrowStyle_GetBackgroundSize(arrowStyle), 25);
    ASSERT_EQ(OH_ArkUI_SwiperArrowStyle_GetBackgroundColor(arrowStyle), COLOR_BLUE);

    OH_ArkUI_SwiperArrowStyle_Destroy(arrowStyle);

    NAPI_END;
}

static napi_value TestSwiperArrowStyle002(napi_env env, napi_callback_info info)
{
    ArkUI_SwiperArrowStyle* arrowStyle = OH_ArkUI_SwiperArrowStyle_Create();

    OH_ArkUI_SwiperArrowStyle_SetShowSidebarMiddle(arrowStyle, 0);

    ASSERT_EQ(OH_ArkUI_SwiperArrowStyle_GetShowSidebarMiddle(arrowStyle), 0);

    OH_ArkUI_SwiperArrowStyle_Destroy(arrowStyle);

    NAPI_END;
}

static napi_value TestSwiperArrowStyle003(napi_env env, napi_callback_info info)
{
    ArkUI_SwiperArrowStyle* arrowStyle = OH_ArkUI_SwiperArrowStyle_Create();

    OH_ArkUI_SwiperArrowStyle_SetArrowSize(arrowStyle, 25);
    OH_ArkUI_SwiperArrowStyle_SetArrowColor(arrowStyle, COLOR_BLACK);

    ASSERT_EQ(OH_ArkUI_SwiperArrowStyle_GetArrowSize(arrowStyle), 25);
    ASSERT_EQ(OH_ArkUI_SwiperArrowStyle_GetArrowColor(arrowStyle), COLOR_BLACK);

    OH_ArkUI_SwiperArrowStyle_Destroy(arrowStyle);

    NAPI_END;
}

static napi_value TestSwiperArrowStyle004(napi_env env, napi_callback_info info)
{
    ArkUI_SwiperArrowStyle* arrowStyle = OH_ArkUI_SwiperArrowStyle_Create();

    OH_ArkUI_SwiperArrowStyle_SetShowBackground(arrowStyle, 3);
    OH_ArkUI_SwiperArrowStyle_SetBackgroundSize(arrowStyle, -10);
    OH_ArkUI_SwiperArrowStyle_SetBackgroundColor(arrowStyle, 0xAFEEEE);

    auto iRet = OH_ArkUI_SwiperArrowStyle_GetShowBackground(arrowStyle);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "zlc", "GetShowBackground = %{public}d", iRet);
    ASSERT_EQ(OH_ArkUI_SwiperArrowStyle_GetShowBackground(arrowStyle), iRet);
    
    auto fRet = OH_ArkUI_SwiperArrowStyle_GetBackgroundSize(arrowStyle);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "zlc", "GetBackgroundSize = %{public}f", fRet);
    ASSERT_EQ(OH_ArkUI_SwiperArrowStyle_GetBackgroundSize(arrowStyle), fRet);
    
    auto uRet = OH_ArkUI_SwiperArrowStyle_GetBackgroundColor(arrowStyle);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "zlc", "GetBackgroundColor = %{public}u", uRet);
    ASSERT_EQ(OH_ArkUI_SwiperArrowStyle_GetBackgroundColor(arrowStyle), uRet);

    OH_ArkUI_SwiperArrowStyle_Destroy(arrowStyle);

    NAPI_END;
}

static napi_value TestSwiperArrowStyle005(napi_env env, napi_callback_info info)
{
    ArkUI_SwiperArrowStyle* arrowStyle = OH_ArkUI_SwiperArrowStyle_Create();
    OH_ArkUI_SwiperArrowStyle_SetShowSidebarMiddle(arrowStyle, 3);
    
    auto iRet = OH_ArkUI_SwiperArrowStyle_GetShowSidebarMiddle(arrowStyle);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "zlc", "GetShowSidebarMiddle = %{public}d", iRet);
    ASSERT_EQ(OH_ArkUI_SwiperArrowStyle_GetShowSidebarMiddle(arrowStyle), iRet);

    OH_ArkUI_SwiperArrowStyle_Destroy(arrowStyle);

    NAPI_END;
}

static napi_value TestSwiperArrowStyle006(napi_env env, napi_callback_info info)
{
    ArkUI_SwiperArrowStyle* arrowStyle = OH_ArkUI_SwiperArrowStyle_Create();

    OH_ArkUI_SwiperArrowStyle_SetArrowSize(arrowStyle, -10);
    OH_ArkUI_SwiperArrowStyle_SetArrowColor(arrowStyle, 0xFFFF0000);

    auto fRet = OH_ArkUI_SwiperArrowStyle_GetArrowSize(arrowStyle);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "zlc", "GetArrowSize = %{public}f", fRet);
    ASSERT_EQ(OH_ArkUI_SwiperArrowStyle_GetArrowSize(arrowStyle), fRet);
    
    auto uRet = OH_ArkUI_SwiperArrowStyle_GetArrowColor(arrowStyle);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "zlc", "GetArrowColor = %{public}u", uRet);
    ASSERT_EQ(OH_ArkUI_SwiperArrowStyle_GetArrowColor(arrowStyle), uRet);

    OH_ArkUI_SwiperArrowStyle_Destroy(arrowStyle);

    NAPI_END;
}
} // namespace ArkUICapiTest
