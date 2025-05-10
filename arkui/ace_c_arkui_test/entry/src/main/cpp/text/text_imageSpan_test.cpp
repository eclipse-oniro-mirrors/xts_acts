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

static napi_value textImageSpanTest001(napi_env env, napi_callback_info info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);
    ArkUI_AttributeItem itemSrc = {nullptr, 0, "resource/media/icon.png"};
    auto ret1 = nodeAPI->setAttribute(imageSpan, NODE_IMAGE_SRC, &itemSrc);
    ArkUI_NumberValue value[] = {-1};
    ArkUI_AttributeItem item = {value, 1};
    auto ret2 = nodeAPI->setAttribute(imageSpan, NODE_HEIGHT, &item);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, 401);
    NAPI_END;
}

} // namespace ArkUICapiTest
