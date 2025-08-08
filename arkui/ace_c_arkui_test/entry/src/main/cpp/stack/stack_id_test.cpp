/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "common/common.h"

namespace ArkUICapiTest {

static napi_value TestStackId001(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    const char *id = "FirstStack";

    ArkUI_AttributeItem id_item = {};
    id_item.string = id;
    auto ret = nodeAPI->setAttribute(stack, NODE_ID, &id_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(stack, NODE_ID)->string, id);
    NAPI_END;
}

} // namespace ArkUICapiTest
