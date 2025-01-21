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
#include "../ActsUbo0005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferStd140vertex, "dEQP-VK.ubo.single_struct.per_block_buffer.std140_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferStd140fragment, "dEQP-VK.ubo.single_struct.per_block_buffer.std140_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferStd140both, "dEQP-VK.ubo.single_struct.per_block_buffer.std140_both*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferStd140vertexcompaccess, "dEQP-VK.ubo.single_struct.per_block_buffer.std140_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferStd140fragmentcompaccess, "dEQP-VK.ubo.single_struct.per_block_buffer.std140_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferStd140bothcompaccess, "dEQP-VK.ubo.single_struct.per_block_buffer.std140_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferStd140instancearrayvertex, "dEQP-VK.ubo.single_struct.per_block_buffer.std140_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferStd140instancearrayfragment, "dEQP-VK.ubo.single_struct.per_block_buffer.std140_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferStd140instancearrayboth, "dEQP-VK.ubo.single_struct.per_block_buffer.std140_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferStd140instancearrayvertexcompaccess, "dEQP-VK.ubo.single_struct.per_block_buffer.std140_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferStd140instancearrayfragmentcompaccess, "dEQP-VK.ubo.single_struct.per_block_buffer.std140_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferStd140instancearraybothcompaccess, "dEQP-VK.ubo.single_struct.per_block_buffer.std140_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferStd430vertex, "dEQP-VK.ubo.single_struct.per_block_buffer.std430_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferStd430fragment, "dEQP-VK.ubo.single_struct.per_block_buffer.std430_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferStd430both, "dEQP-VK.ubo.single_struct.per_block_buffer.std430_both*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferStd430vertexcompaccess, "dEQP-VK.ubo.single_struct.per_block_buffer.std430_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferStd430fragmentcompaccess, "dEQP-VK.ubo.single_struct.per_block_buffer.std430_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferStd430bothcompaccess, "dEQP-VK.ubo.single_struct.per_block_buffer.std430_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferStd430instancearrayvertex, "dEQP-VK.ubo.single_struct.per_block_buffer.std430_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferStd430instancearrayfragment, "dEQP-VK.ubo.single_struct.per_block_buffer.std430_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferStd430instancearrayboth, "dEQP-VK.ubo.single_struct.per_block_buffer.std430_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferStd430instancearrayvertexcompaccess, "dEQP-VK.ubo.single_struct.per_block_buffer.std430_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferStd430instancearrayfragmentcompaccess, "dEQP-VK.ubo.single_struct.per_block_buffer.std430_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferStd430instancearraybothcompaccess, "dEQP-VK.ubo.single_struct.per_block_buffer.std430_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferScalarvertex, "dEQP-VK.ubo.single_struct.per_block_buffer.scalar_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferScalarfragment, "dEQP-VK.ubo.single_struct.per_block_buffer.scalar_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferScalarboth, "dEQP-VK.ubo.single_struct.per_block_buffer.scalar_both*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferScalarvertexcompaccess, "dEQP-VK.ubo.single_struct.per_block_buffer.scalar_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferScalarfragmentcompaccess, "dEQP-VK.ubo.single_struct.per_block_buffer.scalar_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferScalarbothcompaccess, "dEQP-VK.ubo.single_struct.per_block_buffer.scalar_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferScalarinstancearrayvertex, "dEQP-VK.ubo.single_struct.per_block_buffer.scalar_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferScalarinstancearrayfragment, "dEQP-VK.ubo.single_struct.per_block_buffer.scalar_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferScalarinstancearrayboth, "dEQP-VK.ubo.single_struct.per_block_buffer.scalar_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferScalarinstancearrayvertexcompaccess, "dEQP-VK.ubo.single_struct.per_block_buffer.scalar_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferScalarinstancearrayfragmentcompaccess, "dEQP-VK.ubo.single_struct.per_block_buffer.scalar_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSPerblockbufferScalarinstancearraybothcompaccess, "dEQP-VK.ubo.single_struct.per_block_buffer.scalar_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSSinglebufferStd140instancearrayvertex, "dEQP-VK.ubo.single_struct.single_buffer.std140_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSSinglebufferStd140instancearrayfragment, "dEQP-VK.ubo.single_struct.single_buffer.std140_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSSinglebufferStd140instancearrayboth, "dEQP-VK.ubo.single_struct.single_buffer.std140_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSSinglebufferStd140instancearrayvertexcompaccess, "dEQP-VK.ubo.single_struct.single_buffer.std140_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSSinglebufferStd140instancearrayfragmentcompaccess, "dEQP-VK.ubo.single_struct.single_buffer.std140_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSSinglebufferStd140instancearraybothcompaccess, "dEQP-VK.ubo.single_struct.single_buffer.std140_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSSinglebufferStd430instancearrayvertex, "dEQP-VK.ubo.single_struct.single_buffer.std430_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSSinglebufferStd430instancearrayfragment, "dEQP-VK.ubo.single_struct.single_buffer.std430_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSSinglebufferStd430instancearrayboth, "dEQP-VK.ubo.single_struct.single_buffer.std430_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSSinglebufferStd430instancearrayvertexcompaccess, "dEQP-VK.ubo.single_struct.single_buffer.std430_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSSinglebufferStd430instancearrayfragmentcompaccess, "dEQP-VK.ubo.single_struct.single_buffer.std430_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSSinglebufferStd430instancearraybothcompaccess, "dEQP-VK.ubo.single_struct.single_buffer.std430_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSSinglebufferScalarinstancearrayvertex, "dEQP-VK.ubo.single_struct.single_buffer.scalar_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSSinglebufferScalarinstancearrayfragment, "dEQP-VK.ubo.single_struct.single_buffer.scalar_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSSinglebufferScalarinstancearrayboth, "dEQP-VK.ubo.single_struct.single_buffer.scalar_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSSinglebufferScalarinstancearrayvertexcompaccess, "dEQP-VK.ubo.single_struct.single_buffer.scalar_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSSinglebufferScalarinstancearrayfragmentcompaccess, "dEQP-VK.ubo.single_struct.single_buffer.scalar_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0005TS, TCSSSinglebufferScalarinstancearraybothcompaccess, "dEQP-VK.ubo.single_struct.single_buffer.scalar_instance_array_both_comp_access*");
