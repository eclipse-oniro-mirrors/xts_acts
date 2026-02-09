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

#include "layoutCallbackOnNodeHandle.h"
#include "../manager/plugin_manager.h"
#include <arkui/native_interface_focus.h>
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_key_event.h>
#include <arkui/ui_input_event.h>
#include <string>

#include <arkui/drag_and_drop.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>
#include "napi/native_api.h"
#include "ani/ani.h"

namespace ArkUICapiTest {

void printfUserDataFunc(void* data) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "printfUserDataFunc", "printfUserDataFunc");
    return;
}

ani_int LayoutCallbackOnNodeHandleTest::LayoutCallbackOnNodeHandleTest_a(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutCallbackOnNodeHandleTest_a", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    char data[12] = "user data";
    auto ret = OH_ArkUI_RegisterLayoutCallbackOnNodeHandle(nullptr, data, printfUserDataFunc);
    
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

ani_int LayoutCallbackOnNodeHandleTest::LayoutCallbackOnNodeHandleTest_a1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutCallbackOnNodeHandleTest_a1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    char data[12] = "user data";
    auto ret = OH_ArkUI_RegisterLayoutCallbackOnNodeHandle(nodeHandle, data, printfUserDataFunc);
    
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int LayoutCallbackOnNodeHandleTest::LayoutCallbackOnNodeHandleTest_b(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutCallbackOnNodeHandleTest_b", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    char data[12] = "user data";
    auto ret = OH_ArkUI_RegisterDrawCallbackOnNodeHandle(nullptr, data, printfUserDataFunc);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

ani_int LayoutCallbackOnNodeHandleTest::LayoutCallbackOnNodeHandleTest_b1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutCallbackOnNodeHandleTest_b1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    char data[12] = "user data";
    auto ret = OH_ArkUI_RegisterDrawCallbackOnNodeHandle(nodeHandle, data, printfUserDataFunc);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
ani_int LayoutCallbackOnNodeHandleTest::LayoutCallbackOnNodeHandleTest_c(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutCallbackOnNodeHandleTest_c", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    char data[12] = "user data";
    auto ret = OH_ArkUI_UnregisterLayoutCallbackOnNodeHandle(nullptr);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

ani_int LayoutCallbackOnNodeHandleTest::LayoutCallbackOnNodeHandleTest_c1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutCallbackOnNodeHandleTest_c1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    char data[12] = "user data";
    OH_ArkUI_RegisterLayoutCallbackOnNodeHandle(nodeHandle, data, printfUserDataFunc);
    auto ret = OH_ArkUI_UnregisterLayoutCallbackOnNodeHandle(nodeHandle);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int LayoutCallbackOnNodeHandleTest::LayoutCallbackOnNodeHandleTest_d(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutCallbackOnNodeHandleTest_d", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    char data[12] = "user data";
    auto ret = OH_ArkUI_UnregisterDrawCallbackOnNodeHandle(nullptr);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

ani_int LayoutCallbackOnNodeHandleTest::LayoutCallbackOnNodeHandleTest_d1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutCallbackOnNodeHandleTest_d1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    char data[12] = "user data";
    OH_ArkUI_RegisterDrawCallbackOnNodeHandle(nodeHandle, data, printfUserDataFunc);
    auto ret = OH_ArkUI_UnregisterDrawCallbackOnNodeHandle(nodeHandle);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
 void napi_finalize_func(ani_env* env,void* finalize_data,void* finalize_hint){
    return;
 }

} // namespace ArkUICapiTest