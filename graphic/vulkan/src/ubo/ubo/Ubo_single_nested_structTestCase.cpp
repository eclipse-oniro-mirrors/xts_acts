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
#include "../ActsUbo0007TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferStd140vertex, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.std140_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferStd140fragment, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.std140_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferStd140both, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.std140_both*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferStd140vertexcompaccess, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.std140_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferStd140fragmentcompaccess, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.std140_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferStd140bothcompaccess, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.std140_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferStd140instancearrayvertex, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.std140_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferStd140instancearrayfragment, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.std140_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferStd140instancearrayboth, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.std140_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferStd140instancearrayvertexcompaccess, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.std140_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferStd140instancearrayfragmentcompaccess, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.std140_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferStd140instancearraybothcompaccess, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.std140_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferStd430vertex, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.std430_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferStd430fragment, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.std430_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferStd430both, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.std430_both*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferStd430vertexcompaccess, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.std430_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferStd430fragmentcompaccess, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.std430_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferStd430bothcompaccess, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.std430_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferStd430instancearrayvertex, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.std430_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferStd430instancearrayfragment, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.std430_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferStd430instancearrayboth, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.std430_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferStd430instancearrayvertexcompaccess, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.std430_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferStd430instancearrayfragmentcompaccess, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.std430_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferStd430instancearraybothcompaccess, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.std430_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferScalarvertex, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.scalar_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferScalarfragment, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.scalar_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferScalarboth, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.scalar_both*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferScalarvertexcompaccess, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.scalar_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferScalarfragmentcompaccess, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.scalar_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferScalarbothcompaccess, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.scalar_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferScalarinstancearrayvertex, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.scalar_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferScalarinstancearrayfragment, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.scalar_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferScalarinstancearrayboth, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.scalar_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferScalarinstancearrayvertexcompaccess, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.scalar_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferScalarinstancearrayfragmentcompaccess, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.scalar_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSPerblockbufferScalarinstancearraybothcompaccess, "dEQP-VK.ubo.single_nested_struct.per_block_buffer.scalar_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSSinglebufferStd140instancearrayvertex, "dEQP-VK.ubo.single_nested_struct.single_buffer.std140_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSSinglebufferStd140instancearrayfragment, "dEQP-VK.ubo.single_nested_struct.single_buffer.std140_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSSinglebufferStd140instancearrayboth, "dEQP-VK.ubo.single_nested_struct.single_buffer.std140_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSSinglebufferStd140instancearrayvertexcompaccess, "dEQP-VK.ubo.single_nested_struct.single_buffer.std140_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSSinglebufferStd140instancearrayfragmentcompaccess, "dEQP-VK.ubo.single_nested_struct.single_buffer.std140_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSSinglebufferStd140instancearraybothcompaccess, "dEQP-VK.ubo.single_nested_struct.single_buffer.std140_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSSinglebufferStd430instancearrayvertex, "dEQP-VK.ubo.single_nested_struct.single_buffer.std430_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSSinglebufferStd430instancearrayfragment, "dEQP-VK.ubo.single_nested_struct.single_buffer.std430_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSSinglebufferStd430instancearrayboth, "dEQP-VK.ubo.single_nested_struct.single_buffer.std430_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSSinglebufferStd430instancearrayvertexcompaccess, "dEQP-VK.ubo.single_nested_struct.single_buffer.std430_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSSinglebufferStd430instancearrayfragmentcompaccess, "dEQP-VK.ubo.single_nested_struct.single_buffer.std430_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSSinglebufferStd430instancearraybothcompaccess, "dEQP-VK.ubo.single_nested_struct.single_buffer.std430_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSSinglebufferScalarinstancearrayvertex, "dEQP-VK.ubo.single_nested_struct.single_buffer.scalar_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSSinglebufferScalarinstancearrayfragment, "dEQP-VK.ubo.single_nested_struct.single_buffer.scalar_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSSinglebufferScalarinstancearrayboth, "dEQP-VK.ubo.single_nested_struct.single_buffer.scalar_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSSinglebufferScalarinstancearrayvertexcompaccess, "dEQP-VK.ubo.single_nested_struct.single_buffer.scalar_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSSinglebufferScalarinstancearrayfragmentcompaccess, "dEQP-VK.ubo.single_nested_struct.single_buffer.scalar_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSSinglebufferScalarinstancearraybothcompaccess, "dEQP-VK.ubo.single_nested_struct.single_buffer.scalar_instance_array_both_comp_access*");
