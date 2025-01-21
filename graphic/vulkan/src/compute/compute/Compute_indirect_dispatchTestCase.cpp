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
#include "../ComputeBaseFunc.h"
#include "../ActsCompute0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsCompute0001TS, TCUploadbufferSingleinvocation, "dEQP-VK.compute.indirect_dispatch.upload_buffer.single_invocation*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCUploadbufferMultiplegroups, "dEQP-VK.compute.indirect_dispatch.upload_buffer.multiple_groups*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCUploadbufferMultiplegroupsmultipleinvocations, "dEQP-VK.compute.indirect_dispatch.upload_buffer.multiple_groups_multiple_invocations*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCUploadbufferSmalloffset, "dEQP-VK.compute.indirect_dispatch.upload_buffer.small_offset*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCUploadbufferLargeoffset, "dEQP-VK.compute.indirect_dispatch.upload_buffer.large_offset*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCUploadbufferLargeoffsetmultipleinvocations, "dEQP-VK.compute.indirect_dispatch.upload_buffer.large_offset_multiple_invocations*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCUploadbufferEmptycommand, "dEQP-VK.compute.indirect_dispatch.upload_buffer.empty_command*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCUploadbufferMultidispatch, "dEQP-VK.compute.indirect_dispatch.upload_buffer.multi_dispatch*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCUploadbufferMultidispatchreusecommand, "dEQP-VK.compute.indirect_dispatch.upload_buffer.multi_dispatch_reuse_command*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCGenincomputeSingleinvocation, "dEQP-VK.compute.indirect_dispatch.gen_in_compute.single_invocation*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCGenincomputeMultiplegroups, "dEQP-VK.compute.indirect_dispatch.gen_in_compute.multiple_groups*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCGenincomputeMultiplegroupsmultipleinvocations, "dEQP-VK.compute.indirect_dispatch.gen_in_compute.multiple_groups_multiple_invocations*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCGenincomputeSmalloffset, "dEQP-VK.compute.indirect_dispatch.gen_in_compute.small_offset*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCGenincomputeLargeoffset, "dEQP-VK.compute.indirect_dispatch.gen_in_compute.large_offset*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCGenincomputeLargeoffsetmultipleinvocations, "dEQP-VK.compute.indirect_dispatch.gen_in_compute.large_offset_multiple_invocations*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCGenincomputeEmptycommand, "dEQP-VK.compute.indirect_dispatch.gen_in_compute.empty_command*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCGenincomputeMultidispatch, "dEQP-VK.compute.indirect_dispatch.gen_in_compute.multi_dispatch*");
static SHRINK_HWTEST_F(ActsCompute0001TS, TCGenincomputeMultidispatchreusecommand, "dEQP-VK.compute.indirect_dispatch.gen_in_compute.multi_dispatch_reuse_command*");