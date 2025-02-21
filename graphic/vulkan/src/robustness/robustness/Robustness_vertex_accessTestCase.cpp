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
#include "../RobustnessBaseFunc.h"
#include "../ActsRobustness0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32uintDrawVertexoutofbounds, "dEQP-VK.robustness.vertex_access.r32_uint.draw.vertex_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32uintDrawVertexincomplete, "dEQP-VK.robustness.vertex_access.r32_uint.draw.vertex_incomplete*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32uintDrawInstanceoutofbounds, "dEQP-VK.robustness.vertex_access.r32_uint.draw.instance_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32uintDrawindexedLastindexoutofbounds, "dEQP-VK.robustness.vertex_access.r32_uint.draw_indexed.last_index_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32uintDrawindexedIndicesoutofbounds, "dEQP-VK.robustness.vertex_access.r32_uint.draw_indexed.indices_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32uintDrawindexedTriangleoutofbounds, "dEQP-VK.robustness.vertex_access.r32_uint.draw_indexed.triangle_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32sintDrawVertexoutofbounds, "dEQP-VK.robustness.vertex_access.r32_sint.draw.vertex_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32sintDrawVertexincomplete, "dEQP-VK.robustness.vertex_access.r32_sint.draw.vertex_incomplete*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32sintDrawInstanceoutofbounds, "dEQP-VK.robustness.vertex_access.r32_sint.draw.instance_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32sintDrawindexedLastindexoutofbounds, "dEQP-VK.robustness.vertex_access.r32_sint.draw_indexed.last_index_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32sintDrawindexedIndicesoutofbounds, "dEQP-VK.robustness.vertex_access.r32_sint.draw_indexed.indices_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32sintDrawindexedTriangleoutofbounds, "dEQP-VK.robustness.vertex_access.r32_sint.draw_indexed.triangle_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32sfloatDrawVertexoutofbounds, "dEQP-VK.robustness.vertex_access.r32_sfloat.draw.vertex_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32sfloatDrawVertexincomplete, "dEQP-VK.robustness.vertex_access.r32_sfloat.draw.vertex_incomplete*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32sfloatDrawInstanceoutofbounds, "dEQP-VK.robustness.vertex_access.r32_sfloat.draw.instance_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32sfloatDrawindexedLastindexoutofbounds, "dEQP-VK.robustness.vertex_access.r32_sfloat.draw_indexed.last_index_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32sfloatDrawindexedIndicesoutofbounds, "dEQP-VK.robustness.vertex_access.r32_sfloat.draw_indexed.indices_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32sfloatDrawindexedTriangleoutofbounds, "dEQP-VK.robustness.vertex_access.r32_sfloat.draw_indexed.triangle_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32uintDrawVertexoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32_uint.draw.vertex_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32uintDrawVertexincomplete, "dEQP-VK.robustness.vertex_access.r32g32_uint.draw.vertex_incomplete*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32uintDrawInstanceoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32_uint.draw.instance_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32uintDrawindexedLastindexoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32_uint.draw_indexed.last_index_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32uintDrawindexedIndicesoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32_uint.draw_indexed.indices_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32uintDrawindexedTriangleoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32_uint.draw_indexed.triangle_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32sintDrawVertexoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32_sint.draw.vertex_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32sintDrawVertexincomplete, "dEQP-VK.robustness.vertex_access.r32g32_sint.draw.vertex_incomplete*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32sintDrawInstanceoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32_sint.draw.instance_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32sintDrawindexedLastindexoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32_sint.draw_indexed.last_index_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32sintDrawindexedIndicesoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32_sint.draw_indexed.indices_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32sintDrawindexedTriangleoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32_sint.draw_indexed.triangle_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32sfloatDrawVertexoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32_sfloat.draw.vertex_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32sfloatDrawVertexincomplete, "dEQP-VK.robustness.vertex_access.r32g32_sfloat.draw.vertex_incomplete*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32sfloatDrawInstanceoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32_sfloat.draw.instance_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32sfloatDrawindexedLastindexoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32_sfloat.draw_indexed.last_index_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32sfloatDrawindexedIndicesoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32_sfloat.draw_indexed.indices_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32sfloatDrawindexedTriangleoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32_sfloat.draw_indexed.triangle_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32uintDrawVertexoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32_uint.draw.vertex_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32uintDrawVertexincomplete, "dEQP-VK.robustness.vertex_access.r32g32b32_uint.draw.vertex_incomplete*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32uintDrawInstanceoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32_uint.draw.instance_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32uintDrawindexedLastindexoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32_uint.draw_indexed.last_index_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32uintDrawindexedIndicesoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32_uint.draw_indexed.indices_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32uintDrawindexedTriangleoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32_uint.draw_indexed.triangle_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32sintDrawVertexoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32_sint.draw.vertex_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32sintDrawVertexincomplete, "dEQP-VK.robustness.vertex_access.r32g32b32_sint.draw.vertex_incomplete*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32sintDrawInstanceoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32_sint.draw.instance_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32sintDrawindexedLastindexoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32_sint.draw_indexed.last_index_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32sintDrawindexedIndicesoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32_sint.draw_indexed.indices_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32sintDrawindexedTriangleoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32_sint.draw_indexed.triangle_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32sfloatDrawVertexoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32_sfloat.draw.vertex_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32sfloatDrawVertexincomplete, "dEQP-VK.robustness.vertex_access.r32g32b32_sfloat.draw.vertex_incomplete*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32sfloatDrawInstanceoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32_sfloat.draw.instance_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32sfloatDrawindexedLastindexoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32_sfloat.draw_indexed.last_index_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32sfloatDrawindexedIndicesoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32_sfloat.draw_indexed.indices_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32sfloatDrawindexedTriangleoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32_sfloat.draw_indexed.triangle_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32a32uintDrawVertexoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32a32_uint.draw.vertex_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32a32uintDrawVertexincomplete, "dEQP-VK.robustness.vertex_access.r32g32b32a32_uint.draw.vertex_incomplete*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32a32uintDrawInstanceoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32a32_uint.draw.instance_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32a32uintDrawindexedLastindexoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32a32_uint.draw_indexed.last_index_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32a32uintDrawindexedIndicesoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32a32_uint.draw_indexed.indices_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32a32uintDrawindexedTriangleoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32a32_uint.draw_indexed.triangle_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32a32sintDrawVertexoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32a32_sint.draw.vertex_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32a32sintDrawVertexincomplete, "dEQP-VK.robustness.vertex_access.r32g32b32a32_sint.draw.vertex_incomplete*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32a32sintDrawInstanceoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32a32_sint.draw.instance_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32a32sintDrawindexedLastindexoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32a32_sint.draw_indexed.last_index_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32a32sintDrawindexedIndicesoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32a32_sint.draw_indexed.indices_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32a32sintDrawindexedTriangleoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32a32_sint.draw_indexed.triangle_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32a32sfloatDrawVertexoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32a32_sfloat.draw.vertex_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32a32sfloatDrawVertexincomplete, "dEQP-VK.robustness.vertex_access.r32g32b32a32_sfloat.draw.vertex_incomplete*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32a32sfloatDrawInstanceoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32a32_sfloat.draw.instance_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32a32sfloatDrawindexedLastindexoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32a32_sfloat.draw_indexed.last_index_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32a32sfloatDrawindexedIndicesoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32a32_sfloat.draw_indexed.indices_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR32g32b32a32sfloatDrawindexedTriangleoutofbounds, "dEQP-VK.robustness.vertex_access.r32g32b32a32_sfloat.draw_indexed.triangle_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR64uintDrawVertexoutofbounds, "dEQP-VK.robustness.vertex_access.r64_uint.draw.vertex_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR64uintDrawVertexincomplete, "dEQP-VK.robustness.vertex_access.r64_uint.draw.vertex_incomplete*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR64uintDrawInstanceoutofbounds, "dEQP-VK.robustness.vertex_access.r64_uint.draw.instance_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR64uintDrawindexedLastindexoutofbounds, "dEQP-VK.robustness.vertex_access.r64_uint.draw_indexed.last_index_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR64uintDrawindexedIndicesoutofbounds, "dEQP-VK.robustness.vertex_access.r64_uint.draw_indexed.indices_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR64uintDrawindexedTriangleoutofbounds, "dEQP-VK.robustness.vertex_access.r64_uint.draw_indexed.triangle_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR64sintDrawVertexoutofbounds, "dEQP-VK.robustness.vertex_access.r64_sint.draw.vertex_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR64sintDrawVertexincomplete, "dEQP-VK.robustness.vertex_access.r64_sint.draw.vertex_incomplete*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR64sintDrawInstanceoutofbounds, "dEQP-VK.robustness.vertex_access.r64_sint.draw.instance_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR64sintDrawindexedLastindexoutofbounds, "dEQP-VK.robustness.vertex_access.r64_sint.draw_indexed.last_index_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR64sintDrawindexedIndicesoutofbounds, "dEQP-VK.robustness.vertex_access.r64_sint.draw_indexed.indices_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCR64sintDrawindexedTriangleoutofbounds, "dEQP-VK.robustness.vertex_access.r64_sint.draw_indexed.triangle_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCA2b10g10r10unormpack32DrawVertexoutofbounds, "dEQP-VK.robustness.vertex_access.a2b10g10r10_unorm_pack32.draw.vertex_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCA2b10g10r10unormpack32DrawVertexincomplete, "dEQP-VK.robustness.vertex_access.a2b10g10r10_unorm_pack32.draw.vertex_incomplete*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCA2b10g10r10unormpack32DrawInstanceoutofbounds, "dEQP-VK.robustness.vertex_access.a2b10g10r10_unorm_pack32.draw.instance_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCA2b10g10r10unormpack32DrawindexedLastindexoutofbounds, "dEQP-VK.robustness.vertex_access.a2b10g10r10_unorm_pack32.draw_indexed.last_index_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCA2b10g10r10unormpack32DrawindexedIndicesoutofbounds, "dEQP-VK.robustness.vertex_access.a2b10g10r10_unorm_pack32.draw_indexed.indices_out_of_bounds*");
static SHRINK_HWTEST_F(ActsRobustness0001TS, TCA2b10g10r10unormpack32DrawindexedTriangleoutofbounds, "dEQP-VK.robustness.vertex_access.a2b10g10r10_unorm_pack32.draw_indexed.triangle_out_of_bounds*");