/*
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include <climits>
#include <gtest/gtest.h>
#include "../UboBaseFunc.h"
#include "../ActsUbo0008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCSinglebufsingleinstance, "dEQP-VK.ubo.link_by_binding.single_buf_single_instance*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCSinglebufinstancearray, "dEQP-VK.ubo.link_by_binding.single_buf_instance_array*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCPerblockbufsingleinstance, "dEQP-VK.ubo.link_by_binding.per_block_buf_single_instance*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCPerblockbufinstancearray, "dEQP-VK.ubo.link_by_binding.per_block_buf_instance_array*");
