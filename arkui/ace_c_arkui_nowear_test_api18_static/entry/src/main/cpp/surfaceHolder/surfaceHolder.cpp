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

#include "surfaceHolder.h"
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



ani_int SurfaceHolderTest::SurfaceHolderTest_a(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SurfaceHolderTest_a", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto ret = OH_ArkUI_SurfaceHolder_Create(nodeHandle);
    int check = ((ret == nullptr) ? 1 : 0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SurfaceHolderTest_a", "check %{public}d", check);
    ASSERT_EQ(check, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int SurfaceHolderTest::SurfaceHolderTest_a1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SurfaceHolderTest_a1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nullptr;
    auto ret = OH_ArkUI_SurfaceHolder_Create(nodeHandle);
    int check = ((ret == nullptr) ? 1 : 0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SurfaceHolderTest_a1", "check %{public}d", check);
    ASSERT_EQ(check, 1);
    NAPI_END;
}
ani_int SurfaceHolderTest::SurfaceHolderTest_b(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SurfaceHolderTest_b", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto node = OH_ArkUI_SurfaceHolder_Create(nodeHandle);
    OH_ArkUI_SurfaceHolder_Dispose(node);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SurfaceHolderTest_b", "ret void");
    NAPI_END;
}

ani_int SurfaceHolderTest::SurfaceHolderTest_c(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SurfaceHolderTest_c", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto node = OH_ArkUI_SurfaceHolder_Create(nodeHandle);
    char data[12] = "user data";
    auto ret = OH_ArkUI_SurfaceHolder_SetUserData(node, (void*)data);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    void* getData = OH_ArkUI_SurfaceHolder_GetUserData(node);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SurfaceHolderTest_c", "get %{public}s", (char*)getData);
    ASSERT_STREQ((char*)getData, data);
    NAPI_END;
}

ani_int SurfaceHolderTest::SurfaceHolderTest_c1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SurfaceHolderTest_c1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto node = nullptr;
    char data[12] = "user data";
    auto ret = OH_ArkUI_SurfaceHolder_SetUserData(node, (void*)data);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID); 
    void* getData = OH_ArkUI_SurfaceHolder_GetUserData(node);
    int check = 1;
    if(getData == nullptr) {
        check = 0;
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SurfaceHolderTest_c1", "get %{public}s", (char*)getData);
    }
    ASSERT_EQ(check, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
ani_int SurfaceHolderTest::SurfaceHolderTest_d(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SurfaceHolderTest_d", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_SurfaceCallback_Create();
    int check = ((ret == nullptr) ? ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SurfaceHolderTest_d", "check %{public}d", check);
    ASSERT_EQ(check, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_SurfaceCallback_Dispose(ret);
    NAPI_END;
}

void onSurfaceCreatedTest(OH_ArkUI_SurfaceHolder* surfaceHolder){
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "onSurfaceCreatedTest", "onSurfaceCreatedTest");
}
void onSurfaceChangedTest(OH_ArkUI_SurfaceHolder* surfaceHolder, uint64_t width, uint64_t height){
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "onSurfaceChangedTest", "onSurfaceChangedTest");
}

typedef struct OH_ArkUI_SurfaceCallback_ {
    /** Called when the surface is created. */
    void (*OnSurfaceCreated)(OH_ArkUI_SurfaceHolder* holder);
    /** Called when the surface is changed. */
    void (*OnSurfaceChanged)(OH_ArkUI_SurfaceHolder* holder, uint64_t width, uint64_t height);
    /** Called when the surface is destroyed. */
    void (*OnSurfaceDestroyed)(OH_ArkUI_SurfaceHolder* holder);
}OH_ArkUI_SurfaceCallback_;

ani_int SurfaceHolderTest::SurfaceHolderTest_e(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SurfaceHolderTest_e", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto node = OH_ArkUI_SurfaceCallback_Create();
    OH_ArkUI_SurfaceCallback_SetSurfaceCreatedEvent(node, onSurfaceCreatedTest);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SurfaceHolderTest_e", "ret %{public}p, point: %{public}p",
                 ((OH_ArkUI_SurfaceCallback_*)node)->OnSurfaceCreated, onSurfaceCreatedTest);
    int check = (((OH_ArkUI_SurfaceCallback_*)node)->OnSurfaceCreated == onSurfaceCreatedTest) ? 0 : 1;
    ASSERT_EQ(check, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int SurfaceHolderTest::SurfaceHolderTest_e1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SurfaceHolderTest_e1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto node = nullptr;
    OH_ArkUI_SurfaceCallback_SetSurfaceCreatedEvent(node, onSurfaceCreatedTest);
    
    int check = (node == nullptr) ? 0 : 1;
    ASSERT_EQ(check, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
ani_int SurfaceHolderTest::SurfaceHolderTest_f(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SurfaceHolderTest_f", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto node = OH_ArkUI_SurfaceCallback_Create();
    OH_ArkUI_SurfaceCallback_SetSurfaceChangedEvent(node, onSurfaceChangedTest);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SurfaceHolderTest_f", "ret %{public}p, point: %{public}p",
                 ((OH_ArkUI_SurfaceCallback_*)node)->OnSurfaceChanged, onSurfaceChangedTest);
    int check = (((OH_ArkUI_SurfaceCallback_*)node)->OnSurfaceChanged == onSurfaceChangedTest) ? 0 : 1;
    ASSERT_EQ(check, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int SurfaceHolderTest::SurfaceHolderTest_f1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SurfaceHolderTest_f1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto node = nullptr;
    OH_ArkUI_SurfaceCallback_SetSurfaceChangedEvent(node, onSurfaceChangedTest);
    
    int check = (node == nullptr) ? 0 : 1;
    ASSERT_EQ(check, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
void onSurfaceDestroyedTest(OH_ArkUI_SurfaceHolder* surfaceHolder){
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "onSurfaceDestroyedTest", "onSurfaceDestroyedTest");
}
ani_int SurfaceHolderTest::SurfaceHolderTest_g(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SurfaceHolderTest_g", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto node = OH_ArkUI_SurfaceCallback_Create();
    OH_ArkUI_SurfaceCallback_SetSurfaceDestroyedEvent(node, onSurfaceDestroyedTest);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SurfaceHolderTest_g", "ret %{public}p, point: %{public}p",
                 ((OH_ArkUI_SurfaceCallback_*)node)->OnSurfaceDestroyed, onSurfaceDestroyedTest);
    int check = (((OH_ArkUI_SurfaceCallback_*)node)->OnSurfaceDestroyed == onSurfaceDestroyedTest) ? 0 : 1;
    ASSERT_EQ(check, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int SurfaceHolderTest::SurfaceHolderTest_g1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SurfaceHolderTest_g1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto node = nullptr;
    OH_ArkUI_SurfaceCallback_SetSurfaceDestroyedEvent(node, onSurfaceDestroyedTest);
    
    int check = (node == nullptr) ? 0 : 1;
    ASSERT_EQ(check, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
ani_int SurfaceHolderTest::SurfaceHolderTest_h(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SurfaceHolderTest_h", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto node = OH_ArkUI_SurfaceHolder_Create(nodeHandle);

    auto callback_node = OH_ArkUI_SurfaceCallback_Create();
    int ret = OH_ArkUI_SurfaceHolder_AddSurfaceCallback(node, callback_node);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SurfaceHolderTest_h", "AddSurfaceCallback ret %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);


    ret = OH_ArkUI_SurfaceHolder_RemoveSurfaceCallback(node, callback_node);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SurfaceHolderTest_h", "RemoveSurfaceCallback ret %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int SurfaceHolderTest::SurfaceHolderTest_h1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SurfaceHolderTest_h1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto node = nullptr;

    auto callback_node = OH_ArkUI_SurfaceCallback_Create();
    int ret = OH_ArkUI_SurfaceHolder_AddSurfaceCallback(node, callback_node);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SurfaceHolderTest_h1", "AddSurfaceCallback ret %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);


    ret = OH_ArkUI_SurfaceHolder_RemoveSurfaceCallback(node, callback_node);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SurfaceHolderTest_h1", "RemoveSurfaceCallback ret %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

} // namespace ArkUICapiTest