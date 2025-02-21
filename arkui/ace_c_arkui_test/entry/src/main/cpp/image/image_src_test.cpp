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

#define FIRST_MIDDLE_VALUE "./resources/base/media/icon.png"
#define SECOND_MIDDLE_VALUE                                                                                            \
    "https://gitee.com/openharmony/docs/raw/master/zh-cn/application-dev/"                                             \
    "reference/apis-arkui/arkui-ts/figures/edgewidths.png"

namespace ArkUICapiTest {

static napi_value TestImageSrc001(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    const char *value = FIRST_MIDDLE_VALUE;
    ArkUI_AttributeItem valueItem = {};
    valueItem.string = value;

    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_SRC, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(image, NODE_IMAGE_SRC)->string, value);
    NAPI_END;
}

static napi_value TestImageSrc002(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    const char *value = SECOND_MIDDLE_VALUE;
    ArkUI_AttributeItem valueItem = {};
    valueItem.string = value;

    auto ret = nodeAPI->setAttribute(image, NODE_IMAGE_SRC, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(image, NODE_IMAGE_SRC)->string, value);
    NAPI_END;
}

} // namespace ArkUICapiTest
