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
#include "../ImageBaseFunc.h"
#include "../ActsImage0017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsImage0017TS, TCCoherent1dR32f, "dEQP-VK.image.qualifiers.coherent.1d.r32f*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCoherent1dR32ui, "dEQP-VK.image.qualifiers.coherent.1d.r32ui*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCoherent1dR32i, "dEQP-VK.image.qualifiers.coherent.1d.r32i*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCoherent1darrayR32f, "dEQP-VK.image.qualifiers.coherent.1d_array.r32f*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCoherent1darrayR32ui, "dEQP-VK.image.qualifiers.coherent.1d_array.r32ui*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCoherent1darrayR32i, "dEQP-VK.image.qualifiers.coherent.1d_array.r32i*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCoherent2dR32f, "dEQP-VK.image.qualifiers.coherent.2d.r32f*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCoherent2dR32ui, "dEQP-VK.image.qualifiers.coherent.2d.r32ui*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCoherent2dR32i, "dEQP-VK.image.qualifiers.coherent.2d.r32i*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCoherent2darrayR32f, "dEQP-VK.image.qualifiers.coherent.2d_array.r32f*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCoherent2darrayR32ui, "dEQP-VK.image.qualifiers.coherent.2d_array.r32ui*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCoherent2darrayR32i, "dEQP-VK.image.qualifiers.coherent.2d_array.r32i*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCoherent3dR32f, "dEQP-VK.image.qualifiers.coherent.3d.r32f*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCoherent3dR32ui, "dEQP-VK.image.qualifiers.coherent.3d.r32ui*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCoherent3dR32i, "dEQP-VK.image.qualifiers.coherent.3d.r32i*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCoherentCubeR32f, "dEQP-VK.image.qualifiers.coherent.cube.r32f*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCoherentCubeR32ui, "dEQP-VK.image.qualifiers.coherent.cube.r32ui*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCoherentCubeR32i, "dEQP-VK.image.qualifiers.coherent.cube.r32i*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCoherentCubearrayR32f, "dEQP-VK.image.qualifiers.coherent.cube_array.r32f*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCoherentCubearrayR32ui, "dEQP-VK.image.qualifiers.coherent.cube_array.r32ui*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCoherentCubearrayR32i, "dEQP-VK.image.qualifiers.coherent.cube_array.r32i*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCoherentBufferR32f, "dEQP-VK.image.qualifiers.coherent.buffer.r32f*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCoherentBufferR32ui, "dEQP-VK.image.qualifiers.coherent.buffer.r32ui*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCoherentBufferR32i, "dEQP-VK.image.qualifiers.coherent.buffer.r32i*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCVolatile1dR32f, "dEQP-VK.image.qualifiers.volatile.1d.r32f*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCVolatile1dR32ui, "dEQP-VK.image.qualifiers.volatile.1d.r32ui*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCVolatile1dR32i, "dEQP-VK.image.qualifiers.volatile.1d.r32i*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCVolatile1darrayR32f, "dEQP-VK.image.qualifiers.volatile.1d_array.r32f*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCVolatile1darrayR32ui, "dEQP-VK.image.qualifiers.volatile.1d_array.r32ui*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCVolatile1darrayR32i, "dEQP-VK.image.qualifiers.volatile.1d_array.r32i*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCVolatile2dR32f, "dEQP-VK.image.qualifiers.volatile.2d.r32f*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCVolatile2dR32ui, "dEQP-VK.image.qualifiers.volatile.2d.r32ui*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCVolatile2dR32i, "dEQP-VK.image.qualifiers.volatile.2d.r32i*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCVolatile2darrayR32f, "dEQP-VK.image.qualifiers.volatile.2d_array.r32f*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCVolatile2darrayR32ui, "dEQP-VK.image.qualifiers.volatile.2d_array.r32ui*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCVolatile2darrayR32i, "dEQP-VK.image.qualifiers.volatile.2d_array.r32i*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCVolatile3dR32f, "dEQP-VK.image.qualifiers.volatile.3d.r32f*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCVolatile3dR32ui, "dEQP-VK.image.qualifiers.volatile.3d.r32ui*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCVolatile3dR32i, "dEQP-VK.image.qualifiers.volatile.3d.r32i*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCVolatileCubeR32f, "dEQP-VK.image.qualifiers.volatile.cube.r32f*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCVolatileCubeR32ui, "dEQP-VK.image.qualifiers.volatile.cube.r32ui*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCVolatileCubeR32i, "dEQP-VK.image.qualifiers.volatile.cube.r32i*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCVolatileCubearrayR32f, "dEQP-VK.image.qualifiers.volatile.cube_array.r32f*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCVolatileCubearrayR32ui, "dEQP-VK.image.qualifiers.volatile.cube_array.r32ui*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCVolatileCubearrayR32i, "dEQP-VK.image.qualifiers.volatile.cube_array.r32i*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCVolatileBufferR32f, "dEQP-VK.image.qualifiers.volatile.buffer.r32f*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCVolatileBufferR32ui, "dEQP-VK.image.qualifiers.volatile.buffer.r32ui*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCVolatileBufferR32i, "dEQP-VK.image.qualifiers.volatile.buffer.r32i*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCRestrict1d, "dEQP-VK.image.qualifiers.restrict.1d*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCRestrict1darray, "dEQP-VK.image.qualifiers.restrict.1d_array*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCRestrict2d, "dEQP-VK.image.qualifiers.restrict.2d*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCRestrict2darray, "dEQP-VK.image.qualifiers.restrict.2d_array*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCRestrict3d, "dEQP-VK.image.qualifiers.restrict.3d*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCRestrictCube, "dEQP-VK.image.qualifiers.restrict.cube*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCRestrictCubearray, "dEQP-VK.image.qualifiers.restrict.cube_array*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCRestrictBuffer, "dEQP-VK.image.qualifiers.restrict.buffer*");