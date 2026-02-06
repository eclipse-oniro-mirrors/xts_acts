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

#include <arkui/native_interface.h>


#include "arkui/native_node.h"
#include "common/common.h"
#include "ani/ani.h"

namespace ArkUIAniTest {
#define SIZE_1000 1000
#define SIZE_100000 100000

static auto SetChildrenMainSize(ArkUI_NodeHandle list, ArkUI_ListChildrenMainSize* object)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_AttributeItem item = {};
    item.object = object;
    auto ret = nodeAPI->setAttribute(list, NODE_LIST_CHILDREN_MAIN_SIZE, &item);
    return ret;
}

static ani_double TestListChildrenMainSize001(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    auto ret = SetChildrenMainSize(list, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize001",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestListChildrenMainSize002(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto obj = nullptr;
    auto ret = SetChildrenMainSize(list, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize002",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestListChildrenMainSize003(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    OH_ArkUI_ListChildrenMainSizeOption_Dispose(obj);
    auto ret = SetChildrenMainSize(list, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize003",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestListChildrenMainSize004(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    auto ret1 = OH_ArkUI_ListChildrenMainSizeOption_SetDefaultMainSize(obj, PARAM_10);
    auto ret2 = OH_ArkUI_ListChildrenMainSizeOption_GetDefaultMainSize(obj);
    auto ret = SetChildrenMainSize(list, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize004",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize004",
        "ret1 = %{public}d, ret2 = %{public}f", ret1, ret2);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, PARAM_10);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestListChildrenMainSize005(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    auto ret1 = OH_ArkUI_ListChildrenMainSizeOption_SetDefaultMainSize(obj, SIZE_100000);
    auto ret2 = OH_ArkUI_ListChildrenMainSizeOption_GetDefaultMainSize(obj);
    auto ret = SetChildrenMainSize(list, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize005",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize005",
        "ret1 = %{public}d, ret2 = %{public}f", ret1, ret2);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, SIZE_100000);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestListChildrenMainSize006(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    auto ret1 = OH_ArkUI_ListChildrenMainSizeOption_SetDefaultMainSize(obj, PARAM_0);
    auto ret2 = OH_ArkUI_ListChildrenMainSizeOption_GetDefaultMainSize(obj);
    auto ret = SetChildrenMainSize(list, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize006",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize006",
        "ret1 = %{public}d, ret2 = %{public}f", ret1, ret2);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, PARAM_0);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestListChildrenMainSize007(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    auto ret1 = OH_ArkUI_ListChildrenMainSizeOption_SetDefaultMainSize(obj, PARAM_NEGATIVE_100);
    auto ret2 = OH_ArkUI_ListChildrenMainSizeOption_GetDefaultMainSize(obj);
    auto ret = SetChildrenMainSize(list, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize007",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize007",
        "ret1 = %{public}d, ret2 = %{public}f", ret1, ret2);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_EQ(ret2, PARAM_0);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestListChildrenMainSize008(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto obj = nullptr;
    auto ret1 = OH_ArkUI_ListChildrenMainSizeOption_SetDefaultMainSize(obj, PARAM_10);
    auto ret2 = OH_ArkUI_ListChildrenMainSizeOption_GetDefaultMainSize(obj);
    auto ret = SetChildrenMainSize(list, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize008",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize008",
        "ret1 = %{public}d, ret2 = %{public}f", ret1, ret2);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_EQ(ret2, PARAM_NEGATIVE_1);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestListChildrenMainSize009(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    OH_ArkUI_ListChildrenMainSizeOption_Resize(obj, PARAM_NEGATIVE_1);
    auto ret = SetChildrenMainSize(list, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize009",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestListChildrenMainSize010(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    OH_ArkUI_ListChildrenMainSizeOption_Resize(obj, PARAM_0);
    auto ret = SetChildrenMainSize(list, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize010",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestListChildrenMainSize011(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    OH_ArkUI_ListChildrenMainSizeOption_Resize(obj, PARAM_10);
    auto ret = SetChildrenMainSize(list, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize011",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestListChildrenMainSize012(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto obj = nullptr;
    OH_ArkUI_ListChildrenMainSizeOption_Resize(obj, PARAM_10);
    auto ret = SetChildrenMainSize(list, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize012",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestListChildrenMainSize013(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    auto ret1 = OH_ArkUI_ListChildrenMainSizeOption_UpdateSize(obj, PARAM_0, PARAM_0);
    auto ret2 = OH_ArkUI_ListChildrenMainSizeOption_GetMainSize(obj, PARAM_0);
    auto ret = SetChildrenMainSize(list, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize013",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize013",
        "ret1 = %{public}d, ret2 = %{public}f", ret1, ret2);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, PARAM_0);
    NAPI_END;
}

static ani_double TestListChildrenMainSize014(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    auto ret1 = OH_ArkUI_ListChildrenMainSizeOption_UpdateSize(obj, PARAM_10, PARAM_10);
    auto ret2 = OH_ArkUI_ListChildrenMainSizeOption_GetMainSize(obj, PARAM_10);
    auto ret = SetChildrenMainSize(list, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize014",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize014",
        "ret1 = %{public}d, ret2 = %{public}f", ret1, ret2);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_EQ(ret2, PARAM_NEGATIVE_1);
    NAPI_END;
}

static ani_double TestListChildrenMainSize015(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    auto ret1 = OH_ArkUI_ListChildrenMainSizeOption_UpdateSize(obj, PARAM_NEGATIVE_1, PARAM_10);
    auto ret2 = OH_ArkUI_ListChildrenMainSizeOption_GetMainSize(obj, PARAM_NEGATIVE_1);
    auto ret = SetChildrenMainSize(list, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize015",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize015",
        "ret1 = %{public}d, ret2 = %{public}f", ret1, ret2);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_EQ(ret2, PARAM_NEGATIVE_1);
    NAPI_END;
}

static ani_double TestListChildrenMainSize016(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    auto ret1 = OH_ArkUI_ListChildrenMainSizeOption_UpdateSize(obj, PARAM_10, PARAM_NEGATIVE_1);
    auto ret2 = OH_ArkUI_ListChildrenMainSizeOption_GetMainSize(obj, PARAM_10);
    auto ret = SetChildrenMainSize(list, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize016",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize016",
        "ret1 = %{public}d, ret2 = %{public}f", ret1, ret2);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_EQ(ret2, PARAM_NEGATIVE_1);
    NAPI_END;
}

static ani_double TestListChildrenMainSize017(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    auto ret1 = OH_ArkUI_ListChildrenMainSizeOption_UpdateSize(obj, SIZE_100000, PARAM_10);
    auto ret2 = OH_ArkUI_ListChildrenMainSizeOption_GetMainSize(obj, SIZE_100000);
    auto ret = SetChildrenMainSize(list, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize017",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize017",
        "ret1 = %{public}d, ret2 = %{public}f", ret1, ret2);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_EQ(ret2, PARAM_NEGATIVE_1);
    NAPI_END;
}

static ani_double TestListChildrenMainSize018(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    auto ret1 = OH_ArkUI_ListChildrenMainSizeOption_Splice(obj, PARAM_0, PARAM_10, PARAM_0);
    auto ret = SetChildrenMainSize(list, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize018",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize018", "ret1 = %{public}d", ret1);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, SUCCESS);
    NAPI_END;
}

static ani_double TestListChildrenMainSize019(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    auto ret1 = OH_ArkUI_ListChildrenMainSizeOption_Splice(obj, PARAM_NEGATIVE_1, PARAM_10, PARAM_0);
    auto ret = SetChildrenMainSize(list, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize019",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize019", "ret1 = %{public}d", ret1);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestListChildrenMainSize020(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    auto ret1 = OH_ArkUI_ListChildrenMainSizeOption_Splice(obj, SIZE_100000, PARAM_10, PARAM_0);
    auto ret = SetChildrenMainSize(list, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize020",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize020", "ret1 = %{public}d", ret1);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestListChildrenMainSize021(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    auto ret1 = OH_ArkUI_ListChildrenMainSizeOption_Splice(obj, PARAM_0, PARAM_0, PARAM_0);
    auto ret = SetChildrenMainSize(list, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize021",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize021", "ret1 = %{public}d", ret1);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, SUCCESS);
    NAPI_END;
}

static ani_double TestListChildrenMainSize022(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    auto ret1 = OH_ArkUI_ListChildrenMainSizeOption_Splice(obj, PARAM_0, PARAM_NEGATIVE_1, PARAM_0);
    auto ret = SetChildrenMainSize(list, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize022",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize022", "ret1 = %{public}d", ret1);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestListChildrenMainSize023(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    auto ret1 = OH_ArkUI_ListChildrenMainSizeOption_Splice(obj, PARAM_0, SIZE_100000, PARAM_0);
    auto ret = SetChildrenMainSize(list, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize023",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize023", "ret1 = %{public}d", ret1);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, SUCCESS);
    NAPI_END;
}

static ani_double TestListChildrenMainSize024(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    auto ret1 = OH_ArkUI_ListChildrenMainSizeOption_Splice(obj, PARAM_0, PARAM_0, PARAM_10);
    auto ret = SetChildrenMainSize(list, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize024",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize024", "ret1 = %{public}d", ret1);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, SUCCESS);
    NAPI_END;
}

static ani_double TestListChildrenMainSize025(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    auto ret1 = OH_ArkUI_ListChildrenMainSizeOption_Splice(obj, PARAM_0, PARAM_0, PARAM_NEGATIVE_1);
    auto ret = SetChildrenMainSize(list, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize025",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize025", "ret1 = %{public}d", ret1);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestListChildrenMainSize026(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    auto ret1 = OH_ArkUI_ListChildrenMainSizeOption_Splice(obj, PARAM_0, PARAM_0, SIZE_100000);
    auto ret = SetChildrenMainSize(list, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize026",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListChildrenMainSize026", "ret1 = %{public}d,", ret1);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, SUCCESS);
    NAPI_END;
}
} // namespace ArkUIAniTest