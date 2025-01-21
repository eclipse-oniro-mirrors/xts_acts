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
#include "../ActsUbo0006TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferStd140vertex, "dEQP-VK.ubo.single_struct_array.per_block_buffer.std140_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferStd140fragment, "dEQP-VK.ubo.single_struct_array.per_block_buffer.std140_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferStd140both, "dEQP-VK.ubo.single_struct_array.per_block_buffer.std140_both*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferStd140vertexcompaccess, "dEQP-VK.ubo.single_struct_array.per_block_buffer.std140_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferStd140fragmentcompaccess, "dEQP-VK.ubo.single_struct_array.per_block_buffer.std140_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferStd140bothcompaccess, "dEQP-VK.ubo.single_struct_array.per_block_buffer.std140_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferStd140instancearrayvertex, "dEQP-VK.ubo.single_struct_array.per_block_buffer.std140_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferStd140instancearrayfragment, "dEQP-VK.ubo.single_struct_array.per_block_buffer.std140_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferStd140instancearrayboth, "dEQP-VK.ubo.single_struct_array.per_block_buffer.std140_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferStd140instancearrayvertexcompaccess, "dEQP-VK.ubo.single_struct_array.per_block_buffer.std140_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferStd140instancearrayfragmentcompaccess, "dEQP-VK.ubo.single_struct_array.per_block_buffer.std140_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferStd140instancearraybothcompaccess, "dEQP-VK.ubo.single_struct_array.per_block_buffer.std140_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferStd430vertex, "dEQP-VK.ubo.single_struct_array.per_block_buffer.std430_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferStd430fragment, "dEQP-VK.ubo.single_struct_array.per_block_buffer.std430_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferStd430both, "dEQP-VK.ubo.single_struct_array.per_block_buffer.std430_both*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferStd430vertexcompaccess, "dEQP-VK.ubo.single_struct_array.per_block_buffer.std430_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferStd430fragmentcompaccess, "dEQP-VK.ubo.single_struct_array.per_block_buffer.std430_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferStd430bothcompaccess, "dEQP-VK.ubo.single_struct_array.per_block_buffer.std430_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferStd430instancearrayvertex, "dEQP-VK.ubo.single_struct_array.per_block_buffer.std430_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferStd430instancearrayfragment, "dEQP-VK.ubo.single_struct_array.per_block_buffer.std430_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferStd430instancearrayboth, "dEQP-VK.ubo.single_struct_array.per_block_buffer.std430_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferStd430instancearrayvertexcompaccess, "dEQP-VK.ubo.single_struct_array.per_block_buffer.std430_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferStd430instancearrayfragmentcompaccess, "dEQP-VK.ubo.single_struct_array.per_block_buffer.std430_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferStd430instancearraybothcompaccess, "dEQP-VK.ubo.single_struct_array.per_block_buffer.std430_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferScalarvertex, "dEQP-VK.ubo.single_struct_array.per_block_buffer.scalar_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferScalarfragment, "dEQP-VK.ubo.single_struct_array.per_block_buffer.scalar_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferScalarboth, "dEQP-VK.ubo.single_struct_array.per_block_buffer.scalar_both*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferScalarvertexcompaccess, "dEQP-VK.ubo.single_struct_array.per_block_buffer.scalar_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferScalarfragmentcompaccess, "dEQP-VK.ubo.single_struct_array.per_block_buffer.scalar_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferScalarbothcompaccess, "dEQP-VK.ubo.single_struct_array.per_block_buffer.scalar_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferScalarinstancearrayvertex, "dEQP-VK.ubo.single_struct_array.per_block_buffer.scalar_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferScalarinstancearrayfragment, "dEQP-VK.ubo.single_struct_array.per_block_buffer.scalar_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferScalarinstancearrayboth, "dEQP-VK.ubo.single_struct_array.per_block_buffer.scalar_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferScalarinstancearrayvertexcompaccess, "dEQP-VK.ubo.single_struct_array.per_block_buffer.scalar_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferScalarinstancearrayfragmentcompaccess, "dEQP-VK.ubo.single_struct_array.per_block_buffer.scalar_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSAPerblockbufferScalarinstancearraybothcompaccess, "dEQP-VK.ubo.single_struct_array.per_block_buffer.scalar_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSASinglebufferStd140instancearrayvertex, "dEQP-VK.ubo.single_struct_array.single_buffer.std140_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSASinglebufferStd140instancearrayfragment, "dEQP-VK.ubo.single_struct_array.single_buffer.std140_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSASinglebufferStd140instancearrayboth, "dEQP-VK.ubo.single_struct_array.single_buffer.std140_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSASinglebufferStd140instancearrayvertexcompaccess, "dEQP-VK.ubo.single_struct_array.single_buffer.std140_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSASinglebufferStd140instancearrayfragmentcompaccess, "dEQP-VK.ubo.single_struct_array.single_buffer.std140_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSASinglebufferStd140instancearraybothcompaccess, "dEQP-VK.ubo.single_struct_array.single_buffer.std140_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSASinglebufferStd430instancearrayvertex, "dEQP-VK.ubo.single_struct_array.single_buffer.std430_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSASinglebufferStd430instancearrayfragment, "dEQP-VK.ubo.single_struct_array.single_buffer.std430_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSASinglebufferStd430instancearrayboth, "dEQP-VK.ubo.single_struct_array.single_buffer.std430_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSASinglebufferStd430instancearrayvertexcompaccess, "dEQP-VK.ubo.single_struct_array.single_buffer.std430_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSASinglebufferStd430instancearrayfragmentcompaccess, "dEQP-VK.ubo.single_struct_array.single_buffer.std430_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSASinglebufferStd430instancearraybothcompaccess, "dEQP-VK.ubo.single_struct_array.single_buffer.std430_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSASinglebufferScalarinstancearrayvertex, "dEQP-VK.ubo.single_struct_array.single_buffer.scalar_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSASinglebufferScalarinstancearrayfragment, "dEQP-VK.ubo.single_struct_array.single_buffer.scalar_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSASinglebufferScalarinstancearrayboth, "dEQP-VK.ubo.single_struct_array.single_buffer.scalar_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSASinglebufferScalarinstancearrayvertexcompaccess, "dEQP-VK.ubo.single_struct_array.single_buffer.scalar_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSASinglebufferScalarinstancearrayfragmentcompaccess, "dEQP-VK.ubo.single_struct_array.single_buffer.scalar_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0006TS, TCSSASinglebufferScalarinstancearraybothcompaccess, "dEQP-VK.ubo.single_struct_array.single_buffer.scalar_instance_array_both_comp_access*");
