/*
* Copyright (c) 2026 Huawei Device Co., Ltd.
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

static napi_value MotionPathOptionsCreate(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "MotionPathOptionsCreate", "MotionPathOptionsCreate start");
    ArkUI_MotionPathOptions *pathOptions = OH_ArkUI_MotionPathOptions_Create();
    ASSERT_NOTNULL(pathOptions);
    if (pathOptions) {
        OH_ArkUI_MotionPathOptions_Dispose(pathOptions);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init",
                        "CXX OH_ArkUI_MotionPathOptions_Dispose  success!");
    }
    NAPI_END;
}

static napi_value MotionPathOptionsPath(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "MotionPathOptionsPath", "MotionPathOptionsPath start");
    ArkUI_MotionPathOptions *pathOptions = OH_ArkUI_MotionPathOptions_Create();

    auto res1 = OH_ArkUI_MotionPathOptions_SetPath(NULL, "M start.x start.y L300 200 L300 500 L300 200 Lend.x end.y");
    ASSERT_EQ(res1, ARKUI_ERROR_CODE_PARAM_INVALID);
   
    auto res2 = OH_ArkUI_MotionPathOptions_SetPath(pathOptions, "M start.x start.y L300 200 L300 500 L300 200 Lend.x end.y");
    ASSERT_EQ(res2, ARKUI_ERROR_CODE_NO_ERROR);
    if (pathOptions) {
        OH_ArkUI_MotionPathOptions_Dispose(pathOptions);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init",
                        "CXX OH_ArkUI_MotionPathOptions_Dispose  success!");
    }
    NAPI_END;
}

static napi_value MotionPathOptionsFrom(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "MotionPathOptionsFrom", "MotionPathOptionsFrom start");
    ArkUI_MotionPathOptions *pathOptions = OH_ArkUI_MotionPathOptions_Create();
    auto res1 = OH_ArkUI_MotionPathOptions_SetFrom(NULL, 0.0);
    ASSERT_EQ(res1, ARKUI_ERROR_CODE_PARAM_INVALID);

    auto res2 = OH_ArkUI_MotionPathOptions_SetFrom(pathOptions, 0.0);
    ASSERT_EQ(res2, ARKUI_ERROR_CODE_NO_ERROR);

    auto res3 = OH_ArkUI_MotionPathOptions_SetFrom(pathOptions, -2);
    ASSERT_EQ(res3, ARKUI_ERROR_CODE_PARAM_OUT_OF_RANGE);
    if (pathOptions) {
        OH_ArkUI_MotionPathOptions_Dispose(pathOptions);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init",
                        "CXX OH_ArkUI_MotionPathOptions_Dispose  success!");
    }
    NAPI_END;
}

static napi_value MotionPathOptionsTo(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "MotionPathOptionsTo", "MotionPathOptionsTo start");
    ArkUI_MotionPathOptions *pathOptions = OH_ArkUI_MotionPathOptions_Create();
    auto res1 = OH_ArkUI_MotionPathOptions_SetTo(NULL, 1.0);
    ASSERT_EQ(res1, ARKUI_ERROR_CODE_PARAM_INVALID);

    auto res2 = OH_ArkUI_MotionPathOptions_SetTo(pathOptions, 1.0);
    ASSERT_EQ(res2, ARKUI_ERROR_CODE_NO_ERROR);

    auto res3 = OH_ArkUI_MotionPathOptions_SetTo(pathOptions, -2);
    ASSERT_EQ(res3, ARKUI_ERROR_CODE_PARAM_OUT_OF_RANGE);
    if (pathOptions) {
        OH_ArkUI_MotionPathOptions_Dispose(pathOptions);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init",
                        "CXX OH_ArkUI_MotionPathOptions_Dispose  success!");
    }
    NAPI_END;
}

static napi_value MotionPathOptionsRotatable(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "MotionPathOptionsRotatable", "MotionPathOptionsRotatable start");
    ArkUI_MotionPathOptions *pathOptions = OH_ArkUI_MotionPathOptions_Create();
    auto res1 = OH_ArkUI_MotionPathOptions_SetRotatable(NULL, 1.0);
    ASSERT_EQ(res1, ARKUI_ERROR_CODE_PARAM_INVALID);

    auto res2 = OH_ArkUI_MotionPathOptions_SetRotatable(pathOptions, false);
    ASSERT_EQ(res2, ARKUI_ERROR_CODE_NO_ERROR);
    if (pathOptions) {
        OH_ArkUI_MotionPathOptions_Dispose(pathOptions);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init",
                        "CXX OH_ArkUI_MotionPathOptions_Dispose  success!");
    }
    NAPI_END;
}

static napi_value GetMotionPathOptions(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "MotionPathOptionsGet", "MotionPathOptionsGet start");
    ArkUI_MotionPathOptions *pathOptions = OH_ArkUI_MotionPathOptions_Create();
    int32_t length = 200;
    char *path = new char[length];
    int32_t writeLength = 0;
    float from = 0;
    float to = 0;
    bool rotatable = false;

    auto res0 = OH_ArkUI_MotionPathOptions_GetPath(pathOptions, path, length, &writeLength);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ygl", "MotionPathOptions_GetPath res0 %{public}d",
                 res0);
    auto res1 = OH_ArkUI_MotionPathOptions_GetFrom(pathOptions, &from);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ygl", "MotionPathOptions_GetPath res1 %{public}d",
                 res1);
    auto res2 = OH_ArkUI_MotionPathOptions_GetTo(pathOptions, &to);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ygl", "MotionPathOptions_GetPath res2 %{public}d",
                 res2);
    auto res3 = OH_ArkUI_MotionPathOptions_GetRotatable(pathOptions, &rotatable);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ygl", "MotionPathOptions_GetPath res3 %{public}d",
                 res3);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Print",
                 "ygl path is %{public}s, from is %{public}f, to is %{public}f, rotatable is %{public}d", path, from,
                 to, rotatable);
    ASSERT_EQ(res0, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(res1, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(res2, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(res3, ARKUI_ERROR_CODE_NO_ERROR);
    if (pathOptions) {
        OH_ArkUI_MotionPathOptions_Dispose(pathOptions);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init",
                        "CXX OH_ArkUI_MotionPathOptions_Dispose  success!");
    }
    NAPI_END;
}

static napi_value GetMotionPathOptionsInvalid(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetMotionPathOptionsInvalid", "GetMotionPathOptionsInvalid start");
    ArkUI_MotionPathOptions *pathOptions = OH_ArkUI_MotionPathOptions_Create();
    int32_t length = 0;
    char *path = new char[length];
    int32_t writeLength = 0;
    float from = 0;
    float to = 0;
    bool rotatable = false;

    auto res0 = OH_ArkUI_MotionPathOptions_GetPath(pathOptions, path, length, &writeLength);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ygl", "GetMotionPathOptionsInvalid res0 %{public}d",
                 res0);
    auto res1 = OH_ArkUI_MotionPathOptions_GetFrom(nullptr, &from);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ygl", "GetMotionPathOptionsInvalid res1 %{public}d",
                 res1);
    auto res2 = OH_ArkUI_MotionPathOptions_GetTo(nullptr, &to);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ygl", "GetMotionPathOptionsInvalid res2 %{public}d",
                 res2);
    auto res3 = OH_ArkUI_MotionPathOptions_GetRotatable(nullptr, &rotatable);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ygl", "GetMotionPathOptionsInvalid res3 %{public}d",
                 res3);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Print",
                 "ygl path is %{public}s, from is %{public}f, to is %{public}f, rotatable is %{public}d", path, from,
                 to, rotatable);
    ASSERT_EQ(res0, ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(res1, ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(res2, ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(res3, ARKUI_ERROR_CODE_PARAM_INVALID);
    if (pathOptions) {
        OH_ArkUI_MotionPathOptions_Dispose(pathOptions);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init",
                        "CXX OH_ArkUI_MotionPathOptions_Dispose  success!");
    }
    NAPI_END;
}

static napi_value GetPathBufferSizeError(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetPathBufferSizeError", "GetPathBufferSizeError start");
    ArkUI_MotionPathOptions *pathOptions = OH_ArkUI_MotionPathOptions_Create();
    OH_ArkUI_MotionPathOptions_SetPath(pathOptions,
                                    "M 200 100 C 250 50 350 50 400 100 C 450 150 450 250 400 300 C "
                                    "350 350 250 350 200 300 C 150 250 150 150 200 100");
    int32_t length = 10;
    char *path = new char[length];
    int32_t writeLength = 0;
    float from = 0;
    float to = 0;
    bool rotatable = false;

    auto res0 = OH_ArkUI_MotionPathOptions_GetPath(pathOptions, path, length, &writeLength);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ygl", "GetPathBufferSizeError res0 %{public}d",
                 res0);
    ASSERT_EQ(res0, ARKUI_ERROR_CODE_BUFFER_SIZE_ERROR);
    if (pathOptions) {
        OH_ArkUI_MotionPathOptions_Dispose(pathOptions);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init",
                        "CXX OH_ArkUI_MotionPathOptions_Dispose  success!");
    }
    NAPI_END;
}

static napi_value MotionPathNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "MotionPathNode", "MotionPathNode start");

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto motionPathButton = nodeAPI->createNode(ARKUI_NODE_BUTTON);

    ArkUI_MotionPathOptions *pathOptions = OH_ArkUI_MotionPathOptions_Create();
    ArkUI_AttributeItem pathItem = {.object = pathOptions};
    nodeAPI->setAttribute(motionPathButton, NODE_MOTION_PATH, &pathItem);

    ASSERT_NOTNULL(pathOptions);
    if (pathOptions) {
        OH_ArkUI_MotionPathOptions_Dispose(pathOptions);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init",
                        "OH_ArkUI_MotionPathOptions_Dispose  success!");
    }
    NAPI_END;
}

} // namespace ArkUICapiTest