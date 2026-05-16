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
#include <arkui/native_node.h>

namespace ArkUICapiTest {

static napi_value TestRegisterCommonEvent001(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    auto callback = [](ArkUI_NodeEvent *event) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "kkk callback: By Common callback");
    };

    auto ret1 = OH_ArkUI_NativeModule_RegisterCommonEvent(button, NODE_ON_CLICK_EVENT, button, callback);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RegisterCommonEvent ret1=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_NativeModule_RegisterCommonEvent(button, NODE_TOUCH_EVENT, button, callback);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RegisterCommonEvent  ret2=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret3 = OH_ArkUI_NativeModule_RegisterCommonEvent(button, NODE_EVENT_ON_APPEAR, button, callback);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RegisterCommonEvent  ret3=%{public}d", ret3);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret4 = OH_ArkUI_NativeModule_RegisterCommonEvent(button, NODE_EVENT_ON_DISAPPEAR, button, callback);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RegisterCommonEvent  ret4=%{public}d", ret4);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret5 = OH_ArkUI_NativeModule_RegisterCommonEvent(button, NODE_ON_KEY_EVENT, button, callback);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RegisterCommonEvent  ret5=%{public}d", ret5);
    ASSERT_EQ(ret5, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret6 = OH_ArkUI_NativeModule_RegisterCommonEvent(button, NODE_ON_FOCUS, button, callback);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RegisterCommonEvent  ret6=%{public}d", ret6);
    ASSERT_EQ(ret6, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret7 = OH_ArkUI_NativeModule_RegisterCommonEvent(button, NODE_ON_BLUR, button, callback);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RegisterCommonEvent  ret1=%{public}d", ret7);
    ASSERT_EQ(ret7, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret8 = OH_ArkUI_NativeModule_RegisterCommonEvent(button, NODE_ON_HOVER, button, callback);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RegisterCommonEvent  ret8=%{public}d", ret8);
    ASSERT_EQ(ret8, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret9 = OH_ArkUI_NativeModule_RegisterCommonEvent(button, NODE_ON_MOUSE, button, callback);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RegisterCommonEvent  ret9=%{public}d", ret9);
    ASSERT_EQ(ret9, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret10 = OH_ArkUI_NativeModule_RegisterCommonEvent(button, NODE_ON_SIZE_CHANGE, button, callback);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RegisterCommonEvent  ret10=%{public}d", ret10);
    ASSERT_EQ(ret10, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret11 = OH_ArkUI_NativeModule_RegisterCommonEvent(button, NODE_ON_TOUCH_INTERCEPT, button, callback);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RegisterCommonEvent  ret11=%{public}d", ret11);
    ASSERT_EQ(ret11, ARKUI_ERROR_CODE_NODE_UNSUPPORTED_EVENT_TYPE);
    auto ret12 = OH_ArkUI_NativeModule_RegisterCommonEvent(nullptr, NODE_ON_CLICK_EVENT, button, callback);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RegisterCommonEvent  ret12=%{public}d", ret12);
    ASSERT_EQ(ret12, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value TestRegisterCommonEvent002(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    auto callback = [](ArkUI_NodeEvent *event) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "kkk callback: By Common callback");
    };

    OH_ArkUI_NativeModule_RegisterCommonEvent(button, NODE_ON_CLICK_EVENT, button, callback);
    OH_ArkUI_NativeModule_RegisterCommonEvent(button, NODE_TOUCH_EVENT, button, callback);
    OH_ArkUI_NativeModule_RegisterCommonEvent(button, NODE_EVENT_ON_APPEAR, button, callback);
    OH_ArkUI_NativeModule_RegisterCommonEvent(button, NODE_EVENT_ON_DISAPPEAR, button, callback);
    OH_ArkUI_NativeModule_RegisterCommonEvent(button, NODE_ON_KEY_EVENT, button, callback);
    OH_ArkUI_NativeModule_RegisterCommonEvent(button, NODE_ON_FOCUS, button, callback);
    OH_ArkUI_NativeModule_RegisterCommonEvent(button, NODE_ON_BLUR, button, callback);
    OH_ArkUI_NativeModule_RegisterCommonEvent(button, NODE_ON_HOVER, button, callback);
    OH_ArkUI_NativeModule_RegisterCommonEvent(button, NODE_ON_MOUSE, button, callback);
    OH_ArkUI_NativeModule_RegisterCommonEvent(button, NODE_ON_SIZE_CHANGE, button, callback);
    OH_ArkUI_NativeModule_RegisterCommonEvent(button, NODE_ON_TOUCH_INTERCEPT, button, callback);

    auto ret1 = OH_ArkUI_NativeModule_UnregisterCommonEvent(button, NODE_ON_CLICK_EVENT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "UnregisterCommonEvent ret1=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);

    auto ret2 = OH_ArkUI_NativeModule_UnregisterCommonEvent(button, NODE_TOUCH_EVENT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "UnregisterCommonEvent  ret2=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);

    auto ret3 = OH_ArkUI_NativeModule_UnregisterCommonEvent(button, NODE_EVENT_ON_APPEAR);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "UnregisterCommonEvent  ret3=%{public}d", ret3);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_NO_ERROR);

    auto ret4 = OH_ArkUI_NativeModule_UnregisterCommonEvent(button, NODE_EVENT_ON_DISAPPEAR);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "UnregisterCommonEvent  ret4=%{public}d", ret4);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_NO_ERROR);

    auto ret5 = OH_ArkUI_NativeModule_UnregisterCommonEvent(button, NODE_ON_KEY_EVENT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "UnregisterCommonEvent  ret5=%{public}d", ret5);
    ASSERT_EQ(ret5, ARKUI_ERROR_CODE_NO_ERROR);

    auto ret6 = OH_ArkUI_NativeModule_UnregisterCommonEvent(button, NODE_ON_FOCUS);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "UnregisterCommonEvent  ret6=%{public}d", ret6);
    ASSERT_EQ(ret6, ARKUI_ERROR_CODE_NO_ERROR);

    auto ret7 = OH_ArkUI_NativeModule_UnregisterCommonEvent(button, NODE_ON_BLUR);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "UnregisterCommonEvent  ret1=%{public}d", ret7);
    ASSERT_EQ(ret7, ARKUI_ERROR_CODE_NO_ERROR);

    auto ret8 = OH_ArkUI_NativeModule_UnregisterCommonEvent(button, NODE_ON_HOVER);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "UnregisterCommonEvent  ret8=%{public}d", ret8);
    ASSERT_EQ(ret8, ARKUI_ERROR_CODE_NO_ERROR);

    auto ret9 = OH_ArkUI_NativeModule_UnregisterCommonEvent(button, NODE_ON_MOUSE);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "UnregisterCommonEvent  ret9=%{public}d", ret9);
    ASSERT_EQ(ret9, ARKUI_ERROR_CODE_NO_ERROR);

    auto ret10 = OH_ArkUI_NativeModule_UnregisterCommonEvent(button, NODE_ON_SIZE_CHANGE);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "UnregisterCommonEvent  ret10=%{public}d", ret10);
    ASSERT_EQ(ret10, ARKUI_ERROR_CODE_NO_ERROR);

    auto ret11 = OH_ArkUI_NativeModule_UnregisterCommonEvent(button, NODE_ON_TOUCH_INTERCEPT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "UnregisterCommonEvent  ret11=%{public}d", ret11);
    ASSERT_EQ(ret11, ARKUI_ERROR_CODE_NODE_UNSUPPORTED_EVENT_TYPE);

    auto ret12 = OH_ArkUI_NativeModule_UnregisterCommonEvent(nullptr, NODE_ON_CLICK_EVENT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "UnregisterCommonEvent  ret12=%{public}d", ret12);
    ASSERT_EQ(ret12, ARKUI_ERROR_CODE_PARAM_INVALID);

    NAPI_END;
}

static napi_value TestRegisterCommonEvent003(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    auto callback = [](ArkUI_NodeEvent *event) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "kkk callback: By Common callback");
    };
    
    float staticArray[5] = {0.1f, 0.2f, 0.3f, 0.4f, 0.5f};
    auto ret1 = OH_ArkUI_NativeModule_RegisterCommonVisibleAreaApproximateChangeEvent(button,
        staticArray, 2, 50, nullptr, callback);
    auto ret2 = OH_ArkUI_NativeModule_RegisterCommonVisibleAreaApproximateChangeEvent(nullptr,
        staticArray, 2, 50, nullptr, callback);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_INVALID);
    auto ret3 = OH_ArkUI_NativeModule_UnregisterCommonVisibleAreaApproximateChangeEvent(button);
    auto ret4 = OH_ArkUI_NativeModule_UnregisterCommonVisibleAreaApproximateChangeEvent(nullptr);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

} // namespace ArkUICapiTest