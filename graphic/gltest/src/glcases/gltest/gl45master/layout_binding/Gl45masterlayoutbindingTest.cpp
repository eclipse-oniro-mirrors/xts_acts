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
#include "../Gl45masterBaseFunc.h"
#include "../ActsGl45master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007766,
    "KHR-GL45.layout_binding.sampler2D_layout_binding_texture_ComputeShader");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007767,
    "KHR-GL45.layout_binding.sampler3D_layout_binding_texture_ComputeShader");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007768,
    "KHR-GL45.layout_binding.sampler2DArray_layout_binding_texture_ComputeShader");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007769,
    "KHR-GL45.layout_binding.image2D_layout_binding_imageLoad_ComputeShader");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007770,
    "KHR-GL45.layout_binding.atomic_uint_layout_binding_atomic_ComputeShader");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007771,
    "KHR-GL45.layout_binding.block_layout_binding_block_ComputeShader");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007772,
    "KHR-GL45.layout_binding.buffer_layout_binding_atomicAdd_ComputeShader");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007773,
    "KHR-GL45.layout_binding.sampler2D_layout_binding_texture_FragmentShader");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007774,
    "KHR-GL45.layout_binding.sampler3D_layout_binding_texture_FragmentShader");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007775,
    "KHR-GL45.layout_binding.sampler2DArray_layout_binding_texture_FragmentShader");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007776,
    "KHR-GL45.layout_binding.image2D_layout_binding_imageLoad_FragmentShader");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007777,
    "KHR-GL45.layout_binding.atomic_uint_layout_binding_atomic_FragmentShader");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007778,
    "KHR-GL45.layout_binding.block_layout_binding_block_FragmentShader");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007779,
    "KHR-GL45.layout_binding.buffer_layout_binding_atomicAdd_FragmentShader");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007780,
    "KHR-GL45.layout_binding.sampler2D_layout_binding_texture_VertexShader");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007781,
    "KHR-GL45.layout_binding.sampler3D_layout_binding_texture_VertexShader");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007782,
    "KHR-GL45.layout_binding.sampler2DArray_layout_binding_texture_VertexShader");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007783,
    "KHR-GL45.layout_binding.image2D_layout_binding_imageLoad_VertexShader");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007784,
    "KHR-GL45.layout_binding.atomic_uint_layout_binding_atomic_VertexShader");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007785,
    "KHR-GL45.layout_binding.block_layout_binding_block_VertexShader");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007786,
    "KHR-GL45.layout_binding.buffer_layout_binding_atomicAdd_VertexShader");
