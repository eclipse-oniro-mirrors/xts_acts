/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "ani/ani.h"

namespace ArkUIAniTest {

static ani_double TestLazyForEachSetUserData001(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t value = 0;
    auto ret = nodeAPI->setUserData(list, &value);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(*((int32_t*)(nodeAPI->getUserData(list))), value);
    NAPI_END;
}

static ani_double TestLazyForEachSetUserData002(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t value = 0;
    auto ret = nodeAPI->setUserData(nullptr, &value);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestLazyForEachSetUserData003(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto ret = nodeAPI->setUserData(list, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

} // namespace ArkUIAniTest