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
#include "NodeXComponentTest.h"
#include<arkui/native_interface.h>
#include <arkui/native_node.h>
#include <hilog/log.h>
#include <string>

namespace NativeXComponentSample {

napi_value NodeXComponentTest::TestAttachNativeRootNodeErrorCode001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "NodeXComponentTest", "TestAttachNativeRootNodeErrorCode001");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = {0};
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeXComponentTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {480};
    ArkUI_AttributeItem item = {value, 1};
    value[0].f32 = 200;
    nodeAPI->setAttribute(column, NODE_WIDTH, &item); // 200
    nodeAPI->setAttribute(column, NODE_HEIGHT, &item); // 200
    value[0].u32 = 0xFFFF0000; // 红色
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &item);

    ArkUI_NodeHandle xcNode = nullptr;
    OH_ArkUI_NodeUtils_GetAttachedNodeHandleById(xComponentID, &xcNode);
    OH_NativeXComponent* nativeXComponent = OH_NativeXComponent_GetNativeXComponent(xcNode);

    auto ret1 = OH_NativeXComponent_AttachNativeRootNode(nativeXComponent, column);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "wds", "TestAttachNativeRootNodeErrorCode001 Attach: %{public}d", ret1);

    auto ret2 = OH_NativeXComponent_DetachNativeRootNode(nativeXComponent, column);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "wds", "TestAttachNativeRootNodeErrorCode001 Detach: %{public}d", ret2);

    ASSERT_EQ(ret1, OH_NATIVEXCOMPONENT_RESULT_SUCCESS);
    ASSERT_EQ(ret2, OH_NATIVEXCOMPONENT_RESULT_SUCCESS);

    NAPI_END;
}

napi_value NodeXComponentTest::TestAttachNativeRootNodeErrorCode002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_XCOMPONENT);

    int32_t ret1 = OH_NativeXComponent_AttachNativeRootNode(nullptr, column);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "wds", "TestAttachNativeRootNodeErrorCode002 Attach: %{public}d", ret1);

    int32_t ret2 = OH_NativeXComponent_DetachNativeRootNode(nullptr, column);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "wds", "TestAttachNativeRootNodeErrorCode002 Detach: %{public}d", ret2);

    ASSERT_EQ(ret1, OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER);
    ASSERT_EQ(ret2, OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER);

    NAPI_END;
}

napi_value NodeXComponentTest::TestGetNativeXComponentReturnNull(napi_env env, napi_callback_info info)
{
    OH_NativeXComponent* nativeXComponent = OH_NativeXComponent_GetNativeXComponent(nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "wds", "TestGetNativeXComponentReturnNull: %{public}p", nativeXComponent);

    ASSERT_OBJ(nativeXComponent, nullptr);

    NAPI_END;
}

napi_value NodeXComponentTest::TestSurfaceHolderCreateReturnNull(napi_env env, napi_callback_info info)
{
    OH_ArkUI_SurfaceHolder *holder = OH_ArkUI_SurfaceHolder_Create(nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "wds", "TestSurfaceHolderCreateReturnNull: %{public}p", holder);

    ASSERT_OBJ(holder, nullptr);

    NAPI_END;
}

napi_value NodeXComponentTest::TestSurfaceHolderGetUserDataReturnNull(napi_env env, napi_callback_info info)
{
    void* render = OH_ArkUI_SurfaceHolder_GetUserData(nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "wds", "TestSurfaceHolderGetUserDataReturnNull: %{public}p", render);

    ASSERT_OBJ(render, nullptr);

    NAPI_END;
}

napi_value NodeXComponentTest::TestSurfaceCallbackCreateReturnNull(napi_env env, napi_callback_info info)
{
    OH_ArkUI_SurfaceCallback* callback = OH_ArkUI_SurfaceCallback_Create();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "wds", "TestSurfaceCallbackCreateReturnNull: %{public}p", callback);

    ASSERT_OBJ_NE(callback, nullptr);

    NAPI_END;
}

napi_value NodeXComponentTest::TestXComponentGetNativeWindowReturnNull(napi_env env, napi_callback_info info)
{
    OHNativeWindow* window = OH_ArkUI_XComponent_GetNativeWindow(nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "wds", "TestXComponentGetNativeWindowReturnNull: %{public}p", window);

    ASSERT_OBJ(window, nullptr);

    NAPI_END;
}

} // namespace NativeXComponentSample