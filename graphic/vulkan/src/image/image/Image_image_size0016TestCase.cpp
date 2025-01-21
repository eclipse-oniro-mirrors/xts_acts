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

static SHRINK_HWTEST_F(ActsImage0017TS, TC1dReadonly32, "dEQP-VK.image.image_size.1d.readonly_32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC1dReadonly12, "dEQP-VK.image.image_size.1d.readonly_12*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC1dReadonly1, "dEQP-VK.image.image_size.1d.readonly_1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC1dReadonly7, "dEQP-VK.image.image_size.1d.readonly_7*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC1dWriteonly32, "dEQP-VK.image.image_size.1d.writeonly_32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC1dWriteonly12, "dEQP-VK.image.image_size.1d.writeonly_12*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC1dWriteonly1, "dEQP-VK.image.image_size.1d.writeonly_1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC1dWriteonly7, "dEQP-VK.image.image_size.1d.writeonly_7*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC1dReadonlywriteonly32, "dEQP-VK.image.image_size.1d.readonly_writeonly_32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC1dReadonlywriteonly12, "dEQP-VK.image.image_size.1d.readonly_writeonly_12*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC1dReadonlywriteonly1, "dEQP-VK.image.image_size.1d.readonly_writeonly_1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC1dReadonlywriteonly7, "dEQP-VK.image.image_size.1d.readonly_writeonly_7*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC1darrayReadonly32x32, "dEQP-VK.image.image_size.1d_array.readonly_32x32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC1darrayReadonly12x34, "dEQP-VK.image.image_size.1d_array.readonly_12x34*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC1darrayReadonly1x1, "dEQP-VK.image.image_size.1d_array.readonly_1x1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC1darrayReadonly7x1, "dEQP-VK.image.image_size.1d_array.readonly_7x1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC1darrayWriteonly32x32, "dEQP-VK.image.image_size.1d_array.writeonly_32x32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC1darrayWriteonly12x34, "dEQP-VK.image.image_size.1d_array.writeonly_12x34*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC1darrayWriteonly1x1, "dEQP-VK.image.image_size.1d_array.writeonly_1x1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC1darrayWriteonly7x1, "dEQP-VK.image.image_size.1d_array.writeonly_7x1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC1darrayReadonlywriteonly32x32, "dEQP-VK.image.image_size.1d_array.readonly_writeonly_32x32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC1darrayReadonlywriteonly12x34, "dEQP-VK.image.image_size.1d_array.readonly_writeonly_12x34*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC1darrayReadonlywriteonly1x1, "dEQP-VK.image.image_size.1d_array.readonly_writeonly_1x1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC1darrayReadonlywriteonly7x1, "dEQP-VK.image.image_size.1d_array.readonly_writeonly_7x1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC2dReadonly32x32, "dEQP-VK.image.image_size.2d.readonly_32x32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC2dReadonly12x34, "dEQP-VK.image.image_size.2d.readonly_12x34*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC2dReadonly1x1, "dEQP-VK.image.image_size.2d.readonly_1x1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC2dReadonly7x1, "dEQP-VK.image.image_size.2d.readonly_7x1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC2dWriteonly32x32, "dEQP-VK.image.image_size.2d.writeonly_32x32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC2dWriteonly12x34, "dEQP-VK.image.image_size.2d.writeonly_12x34*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC2dWriteonly1x1, "dEQP-VK.image.image_size.2d.writeonly_1x1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC2dWriteonly7x1, "dEQP-VK.image.image_size.2d.writeonly_7x1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC2dReadonlywriteonly32x32, "dEQP-VK.image.image_size.2d.readonly_writeonly_32x32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC2dReadonlywriteonly12x34, "dEQP-VK.image.image_size.2d.readonly_writeonly_12x34*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC2dReadonlywriteonly1x1, "dEQP-VK.image.image_size.2d.readonly_writeonly_1x1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC2dReadonlywriteonly7x1, "dEQP-VK.image.image_size.2d.readonly_writeonly_7x1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC2darrayReadonly32x32x32, "dEQP-VK.image.image_size.2d_array.readonly_32x32x32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC2darrayReadonly12x34x56, "dEQP-VK.image.image_size.2d_array.readonly_12x34x56*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC2darrayReadonly1x1x1, "dEQP-VK.image.image_size.2d_array.readonly_1x1x1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC2darrayReadonly7x1x1, "dEQP-VK.image.image_size.2d_array.readonly_7x1x1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC2darrayWriteonly32x32x32, "dEQP-VK.image.image_size.2d_array.writeonly_32x32x32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC2darrayWriteonly12x34x56, "dEQP-VK.image.image_size.2d_array.writeonly_12x34x56*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC2darrayWriteonly1x1x1, "dEQP-VK.image.image_size.2d_array.writeonly_1x1x1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC2darrayWriteonly7x1x1, "dEQP-VK.image.image_size.2d_array.writeonly_7x1x1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC2darrayReadonlywriteonly32x32x32, "dEQP-VK.image.image_size.2d_array.readonly_writeonly_32x32x32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC2darrayReadonlywriteonly12x34x56, "dEQP-VK.image.image_size.2d_array.readonly_writeonly_12x34x56*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC2darrayReadonlywriteonly1x1x1, "dEQP-VK.image.image_size.2d_array.readonly_writeonly_1x1x1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC2darrayReadonlywriteonly7x1x1, "dEQP-VK.image.image_size.2d_array.readonly_writeonly_7x1x1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC3dReadonly32x32x32, "dEQP-VK.image.image_size.3d.readonly_32x32x32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC3dReadonly12x34x56, "dEQP-VK.image.image_size.3d.readonly_12x34x56*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC3dReadonly1x1x1, "dEQP-VK.image.image_size.3d.readonly_1x1x1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC3dReadonly7x1x1, "dEQP-VK.image.image_size.3d.readonly_7x1x1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC3dWriteonly32x32x32, "dEQP-VK.image.image_size.3d.writeonly_32x32x32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC3dWriteonly12x34x56, "dEQP-VK.image.image_size.3d.writeonly_12x34x56*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC3dWriteonly1x1x1, "dEQP-VK.image.image_size.3d.writeonly_1x1x1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC3dWriteonly7x1x1, "dEQP-VK.image.image_size.3d.writeonly_7x1x1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC3dReadonlywriteonly32x32x32, "dEQP-VK.image.image_size.3d.readonly_writeonly_32x32x32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC3dReadonlywriteonly12x34x56, "dEQP-VK.image.image_size.3d.readonly_writeonly_12x34x56*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC3dReadonlywriteonly1x1x1, "dEQP-VK.image.image_size.3d.readonly_writeonly_1x1x1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC3dReadonlywriteonly7x1x1, "dEQP-VK.image.image_size.3d.readonly_writeonly_7x1x1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCubeReadonly32x32x6, "dEQP-VK.image.image_size.cube.readonly_32x32x6*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCubeReadonly12x12x6, "dEQP-VK.image.image_size.cube.readonly_12x12x6*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCubeReadonly1x1x6, "dEQP-VK.image.image_size.cube.readonly_1x1x6*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCubeReadonly7x7x6, "dEQP-VK.image.image_size.cube.readonly_7x7x6*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCubeWriteonly32x32x6, "dEQP-VK.image.image_size.cube.writeonly_32x32x6*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCubeWriteonly12x12x6, "dEQP-VK.image.image_size.cube.writeonly_12x12x6*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCubeWriteonly1x1x6, "dEQP-VK.image.image_size.cube.writeonly_1x1x6*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCubeWriteonly7x7x6, "dEQP-VK.image.image_size.cube.writeonly_7x7x6*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCubeReadonlywriteonly32x32x6, "dEQP-VK.image.image_size.cube.readonly_writeonly_32x32x6*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCubeReadonlywriteonly12x12x6, "dEQP-VK.image.image_size.cube.readonly_writeonly_12x12x6*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCubeReadonlywriteonly1x1x6, "dEQP-VK.image.image_size.cube.readonly_writeonly_1x1x6*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCubeReadonlywriteonly7x7x6, "dEQP-VK.image.image_size.cube.readonly_writeonly_7x7x6*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCubearrayReadonly32x32x12, "dEQP-VK.image.image_size.cube_array.readonly_32x32x12*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCubearrayReadonly12x12x12, "dEQP-VK.image.image_size.cube_array.readonly_12x12x12*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCubearrayReadonly1x1x12, "dEQP-VK.image.image_size.cube_array.readonly_1x1x12*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCubearrayReadonly7x7x12, "dEQP-VK.image.image_size.cube_array.readonly_7x7x12*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCubearrayWriteonly32x32x12, "dEQP-VK.image.image_size.cube_array.writeonly_32x32x12*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCubearrayWriteonly12x12x12, "dEQP-VK.image.image_size.cube_array.writeonly_12x12x12*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCubearrayWriteonly1x1x12, "dEQP-VK.image.image_size.cube_array.writeonly_1x1x12*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCubearrayWriteonly7x7x12, "dEQP-VK.image.image_size.cube_array.writeonly_7x7x12*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCubearrayReadonlywriteonly32x32x12, "dEQP-VK.image.image_size.cube_array.readonly_writeonly_32x32x12*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCubearrayReadonlywriteonly12x12x12, "dEQP-VK.image.image_size.cube_array.readonly_writeonly_12x12x12*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCubearrayReadonlywriteonly1x1x12, "dEQP-VK.image.image_size.cube_array.readonly_writeonly_1x1x12*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCCubearrayReadonlywriteonly7x7x12, "dEQP-VK.image.image_size.cube_array.readonly_writeonly_7x7x12*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCBufferReadonly32, "dEQP-VK.image.image_size.buffer.readonly_32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCBufferReadonly12, "dEQP-VK.image.image_size.buffer.readonly_12*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCBufferReadonly1, "dEQP-VK.image.image_size.buffer.readonly_1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCBufferReadonly7, "dEQP-VK.image.image_size.buffer.readonly_7*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCBufferWriteonly32, "dEQP-VK.image.image_size.buffer.writeonly_32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCBufferWriteonly12, "dEQP-VK.image.image_size.buffer.writeonly_12*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCBufferWriteonly1, "dEQP-VK.image.image_size.buffer.writeonly_1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCBufferWriteonly7, "dEQP-VK.image.image_size.buffer.writeonly_7*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCBufferReadonlywriteonly32, "dEQP-VK.image.image_size.buffer.readonly_writeonly_32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCBufferReadonlywriteonly12, "dEQP-VK.image.image_size.buffer.readonly_writeonly_12*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCBufferReadonlywriteonly1, "dEQP-VK.image.image_size.buffer.readonly_writeonly_1*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCBufferReadonlywriteonly7, "dEQP-VK.image.image_size.buffer.readonly_writeonly_7*");