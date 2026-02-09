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

namespace ArkUICapiTest {

void printfUserDataFunc(void* data) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "printfUserDataFunc", "printfUserDataFunc");
    return;
}

napi_value LayoutCallbackOnNodeHandleTest::LayoutCallbackOnNodeHandleTest_a(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutCallbackOnNodeHandleTest_a", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    char data[12] = "user data";
    auto ret = OH_ArkUI_RegisterLayoutCallbackOnNodeHandle(nullptr, data, printfUserDataFunc);
    
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value LayoutCallbackOnNodeHandleTest::LayoutCallbackOnNodeHandleTest_a1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutCallbackOnNodeHandleTest_a1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    char data[12] = "user data";
    auto ret = OH_ArkUI_RegisterLayoutCallbackOnNodeHandle(nodeHandle, data, printfUserDataFunc);
    
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value LayoutCallbackOnNodeHandleTest::LayoutCallbackOnNodeHandleTest_b(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutCallbackOnNodeHandleTest_b", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    char data[12] = "user data";
    auto ret = OH_ArkUI_RegisterDrawCallbackOnNodeHandle(nullptr, data, printfUserDataFunc);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value LayoutCallbackOnNodeHandleTest::LayoutCallbackOnNodeHandleTest_b1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutCallbackOnNodeHandleTest_b1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    char data[12] = "user data";
    auto ret = OH_ArkUI_RegisterDrawCallbackOnNodeHandle(nodeHandle, data, printfUserDataFunc);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
napi_value LayoutCallbackOnNodeHandleTest::LayoutCallbackOnNodeHandleTest_c(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutCallbackOnNodeHandleTest_c", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    char data[12] = "user data";
    auto ret = OH_ArkUI_UnregisterLayoutCallbackOnNodeHandle(nullptr);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value LayoutCallbackOnNodeHandleTest::LayoutCallbackOnNodeHandleTest_c1(napi_env env, napi_callback_info info)
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

napi_value LayoutCallbackOnNodeHandleTest::LayoutCallbackOnNodeHandleTest_d(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LayoutCallbackOnNodeHandleTest_d", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    char data[12] = "user data";
    auto ret = OH_ArkUI_UnregisterDrawCallbackOnNodeHandle(nullptr);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value LayoutCallbackOnNodeHandleTest::LayoutCallbackOnNodeHandleTest_d1(napi_env env, napi_callback_info info)
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
 void napi_finalize_func(napi_env env,void* finalize_data,void* finalize_hint){
    return;
 }

napi_value LayoutCallbackOnNodeHandleTest::NapiWrapEnhanceTest_d(napi_env env, napi_callback_info info)
{
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    napi_value testClass = nullptr;
    napi_define_class(
        env, "NapiWrapEnhanceTestClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);

            return thisVar;
        },
        nullptr, 0, nullptr, &testClass);

    napi_value instanceValue = nullptr;
    napi_new_instance(env, testClass, 0, nullptr, &instanceValue);

    const char* testStr = "napi_wrap_enhance_test";
    size_t size = sizeof(*testStr) / sizeof(char);
    napi_ref result = nullptr;
    auto ret = napi_wrap_enhance(env, instanceValue, (void*)testStr, 
                                [](napi_env env, void* data, void* hint) {}, false, nullptr, size, &result);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "NapiWrapEnhanceTest_d", "napi_wrap_enhance ret:%{public}d", (int)ret);
    ASSERT_EQ((int)ret, 0);
    NAPI_END;
}

napi_value LayoutCallbackOnNodeHandleTest::NapiWrapEnhanceTest_d1(napi_env env, napi_callback_info info)
{
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    napi_value testClass = nullptr;
    napi_define_class(
        env, "NapiWrapEnhanceTestClass", NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisVar = nullptr;
            napi_get_cb_info(env, info, nullptr, nullptr, &thisVar, nullptr);

            return thisVar;
        },
        nullptr, 0, nullptr, &testClass);

    napi_value instanceValue = nullptr;
    napi_new_instance(env, testClass, 0, nullptr, &instanceValue);

    const char* testStr = nullptr;
    size_t size = sizeof(*testStr) / sizeof(char);
    napi_ref result = nullptr;
    auto ret = napi_wrap_enhance(env, instanceValue, (void*)testStr, 
                                [](napi_env env, void* data, void* hint) {}, false, nullptr, size, &result);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "NapiWrapEnhanceTest_d1", "napi_wrap_enhance ret:%{public}d", (int)ret);
    ASSERT_NE((int)ret, 0);
    NAPI_END;
}
} // namespace ArkUICapiTest