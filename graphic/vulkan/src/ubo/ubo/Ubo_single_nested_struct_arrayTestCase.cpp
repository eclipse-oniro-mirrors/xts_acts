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
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferStd140vertex, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.std140_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferStd140fragment, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.std140_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferStd140both, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.std140_both*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferStd140vertexcompaccess, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.std140_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferStd140fragmentcompaccess, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.std140_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferStd140bothcompaccess, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.std140_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferStd140instancearrayvertex, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.std140_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferStd140instancearrayfragment, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.std140_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferStd140instancearrayboth, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.std140_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferStd140instancearrayvertexcompaccess, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.std140_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferStd140instancearrayfragmentcompaccess, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.std140_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferStd140instancearraybothcompaccess, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.std140_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferStd430vertex, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.std430_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferStd430fragment, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.std430_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferStd430both, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.std430_both*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferStd430vertexcompaccess, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.std430_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferStd430fragmentcompaccess, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.std430_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferStd430bothcompaccess, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.std430_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferStd430instancearrayvertex, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.std430_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferStd430instancearrayfragment, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.std430_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferStd430instancearrayboth, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.std430_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferStd430instancearrayvertexcompaccess, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.std430_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferStd430instancearrayfragmentcompaccess, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.std430_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferStd430instancearraybothcompaccess, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.std430_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferScalarvertex, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.scalar_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferScalarfragment, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.scalar_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferScalarboth, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.scalar_both*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferScalarvertexcompaccess, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.scalar_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferScalarfragmentcompaccess, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.scalar_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferScalarbothcompaccess, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.scalar_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferScalarinstancearrayvertex, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.scalar_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferScalarinstancearrayfragment, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.scalar_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferScalarinstancearrayboth, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.scalar_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferScalarinstancearrayvertexcompaccess, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.scalar_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferScalarinstancearrayfragmentcompaccess, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.scalar_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSAPerblockbufferScalarinstancearraybothcompaccess, "dEQP-VK.ubo.single_nested_struct_array.per_block_buffer.scalar_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSASinglebufferStd140instancearrayvertex, "dEQP-VK.ubo.single_nested_struct_array.single_buffer.std140_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSASinglebufferStd140instancearrayfragment, "dEQP-VK.ubo.single_nested_struct_array.single_buffer.std140_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSASinglebufferStd140instancearrayboth, "dEQP-VK.ubo.single_nested_struct_array.single_buffer.std140_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSASinglebufferStd140instancearrayvertexcompaccess, "dEQP-VK.ubo.single_nested_struct_array.single_buffer.std140_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSASinglebufferStd140instancearrayfragmentcompaccess, "dEQP-VK.ubo.single_nested_struct_array.single_buffer.std140_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSASinglebufferStd140instancearraybothcompaccess, "dEQP-VK.ubo.single_nested_struct_array.single_buffer.std140_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSASinglebufferStd430instancearrayvertex, "dEQP-VK.ubo.single_nested_struct_array.single_buffer.std430_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSASinglebufferStd430instancearrayfragment, "dEQP-VK.ubo.single_nested_struct_array.single_buffer.std430_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSASinglebufferStd430instancearrayboth, "dEQP-VK.ubo.single_nested_struct_array.single_buffer.std430_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSASinglebufferStd430instancearrayvertexcompaccess, "dEQP-VK.ubo.single_nested_struct_array.single_buffer.std430_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSASinglebufferStd430instancearrayfragmentcompaccess, "dEQP-VK.ubo.single_nested_struct_array.single_buffer.std430_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSASinglebufferStd430instancearraybothcompaccess, "dEQP-VK.ubo.single_nested_struct_array.single_buffer.std430_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSASinglebufferScalarinstancearrayvertex, "dEQP-VK.ubo.single_nested_struct_array.single_buffer.scalar_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSASinglebufferScalarinstancearrayfragment, "dEQP-VK.ubo.single_nested_struct_array.single_buffer.scalar_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSASinglebufferScalarinstancearrayboth, "dEQP-VK.ubo.single_nested_struct_array.single_buffer.scalar_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSASinglebufferScalarinstancearrayvertexcompaccess, "dEQP-VK.ubo.single_nested_struct_array.single_buffer.scalar_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSASinglebufferScalarinstancearrayfragmentcompaccess, "dEQP-VK.ubo.single_nested_struct_array.single_buffer.scalar_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0007TS, TCSNSASinglebufferScalarinstancearraybothcompaccess, "dEQP-VK.ubo.single_nested_struct_array.single_buffer.scalar_instance_array_both_comp_access*");
