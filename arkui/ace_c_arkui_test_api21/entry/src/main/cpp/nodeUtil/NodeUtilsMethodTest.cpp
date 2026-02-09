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
#include <arkui/native_type.h>

static ArkUI_NativeNodeAPI_1 *g_nodeAPI = nullptr;

#define NUMBER_106103 106103
#define NUMBER_106104 106104
#define NUMBER_106105 106105
#define NUMBER_106206 106206

#define NUMBER_106207 106207
#define NUMBER_106208 106208
#define NUMBER_106209 106209
#define NUMBER_106210 106210
#define NUMBER_106406 106406
#define NUMBER_106407 106407
#define NUMBER_106408 106408

namespace ArkUICapiTest {

static napi_value TestMethodReturnValue001(napi_env env, napi_callback_info info)
{
    auto uniqueId = 0;
    ArkUI_NodeHandle node;
    auto ret20 = OH_ArkUI_NodeUtils_GetNodeHandleByUniqueId(uniqueId, &node);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "RenderNodeErrorCode008 ret19=%{public}d", ret20);
    
    ASSERT_EQ(ret20, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    NAPI_END;
}

static napi_value TestMethodReturnValue002(napi_env env, napi_callback_info info)
{
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_nodeAPI);
    auto text2 = g_nodeAPI->createNode(ARKUI_NODE_TEXT);
    auto result1 = OH_ArkUI_NodeUtils_GetNodeHandleByUniqueId(1000000, &text2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestMethodReturn result1=%{public}d", result1);
    auto result2 = OH_ArkUI_NodeUtils_GetNodeHandleByUniqueId(1000001, &text2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "TestMethodReturn result2=%{public}d", result2);
    
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}


static napi_value TestMethodReturnValue003(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto ret3 = OH_ArkUI_NodeCustomEvent_GetDrawContextInDraw(nullptr);
    ASSERT_OBJ(ret3, nullptr);
    NAPI_END;
}

static napi_value TestMethodReturnValue004(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto *canvas1 = OH_ArkUI_DrawContext_GetCanvas(nullptr);
    ASSERT_OBJ(canvas1, nullptr);
    NAPI_END;
}

static napi_value TestMethodReturnValue005(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto ret = nodeAPI->version;
    ASSERT_NE(ret, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk nodeAPI->version ret=%{public}d", ret);
    NAPI_END;
}

static napi_value TestMethodReturnValue006(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NodeAdapterHandle adapter = OH_ArkUI_NodeAdapter_Create();
    ASSERT_OBJ_NE(adapter, nullptr);
    NAPI_END;
}

static napi_value TestNodeErrorCode001(napi_env env, napi_callback_info info)
{
    ASSERT_EQ(ARKUI_ERROR_CODE_ARKTS_NODE_NOT_SUPPORTED, NUMBER_106103);
    NAPI_END;
}

static napi_value TestNodeErrorCode002(napi_env env, napi_callback_info info)
{
    ASSERT_EQ(ARKUI_ERROR_CODE_ADAPTER_NOT_BOUND, NUMBER_106104);
    NAPI_END;
}

static napi_value TestNodeErrorCode003(napi_env env, napi_callback_info info)
{
    ASSERT_EQ(ARKUI_ERROR_CODE_ADAPTER_EXIST, NUMBER_106105);
    NAPI_END;
}

static napi_value TestNodeErrorCode004(napi_env env, napi_callback_info info)
{
    ASSERT_EQ(ARKUI_ERROR_CODE_NODE_IS_ADOPTED, NUMBER_106206);
    NAPI_END;
}

static napi_value TestNodeErrorCode005(napi_env env, napi_callback_info info)
{
    ASSERT_EQ(ARKUI_ERROR_CODE_NODE_HAS_PARENT, NUMBER_106207);
    NAPI_END;
}

static napi_value TestNodeErrorCode006(napi_env env, napi_callback_info info)
{
    ASSERT_EQ(ARKUI_ERROR_CODE_NODE_CAN_NOT_BE_ADOPTED, NUMBER_106208);
    NAPI_END;
}

static napi_value TestNodeErrorCode007(napi_env env, napi_callback_info info)
{
    ASSERT_EQ(ARKUI_ERROR_CODE_NODE_CAN_NOT_ADOPT_TO, NUMBER_106209);
    NAPI_END;
}

static napi_value TestNodeErrorCode008(napi_env env, napi_callback_info info)
{
    ASSERT_EQ(ARKUI_ERROR_CODE_NODE_IS_NOT_IN_ADOPTED_CHILDREN, NUMBER_106210);
    NAPI_END;
}

static napi_value TestNodeErrorCode009(napi_env env, napi_callback_info info)
{
    ASSERT_EQ(ARKUI_ERROR_CODE_RENDER_IS_FROM_FRAME_NODE, NUMBER_106406);
    NAPI_END;
}

static napi_value TestNodeErrorCode010(napi_env env, napi_callback_info info)
{
    ASSERT_EQ(ARKUI_ERROR_CODE_RENDER_HAS_INVALID_FRAME_NODE, NUMBER_106407);
    NAPI_END;
}

static napi_value TestNodeErrorCode011(napi_env env, napi_callback_info info)
{
    ASSERT_EQ(ARKUI_ERROR_CODE_RENDER_NOT_ADOPTED_NODE, NUMBER_106408);
    NAPI_END;
}

} // namespace ArkUICapiTest