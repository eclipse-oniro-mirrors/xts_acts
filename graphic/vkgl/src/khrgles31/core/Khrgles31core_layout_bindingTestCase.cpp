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
#include "../Khrgles31BaseFunc.h"
#include "../ActsKhrgles310001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000769,
        "KHR-GLES31.core.layout_binding.sampler",
        "2D_layout_binding_texture_ComputeShader");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000770,
        "KHR-GLES31.core.layout_binding.sampler",
        "3D_layout_binding_texture_ComputeShader");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000771,
        "KHR-GLES31.core.layout_binding.sampler2DA",
        "rray_layout_binding_texture_ComputeShader");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000772,
        "KHR-GLES31.core.layout_binding.image2D",
        "_layout_binding_imageLoad_ComputeShader");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000773,
        "KHR-GLES31.core.layout_binding.atomic_u",
        "int_layout_binding_atomic_ComputeShader");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000774,
        "KHR-GLES31.core.layout_binding.bloc",
        "k_layout_binding_block_ComputeShader");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000775,
        "KHR-GLES31.core.layout_binding.buffer_",
        "layout_binding_atomicAdd_ComputeShader");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000776,
        "KHR-GLES31.core.layout_binding.sampler2",
        "D_layout_binding_texture_FragmentShader");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000777,
        "KHR-GLES31.core.layout_binding.sampler3",
        "D_layout_binding_texture_FragmentShader");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000778,
        "KHR-GLES31.core.layout_binding.sampler2DA",
        "rray_layout_binding_texture_FragmentShader");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000779,
        "KHR-GLES31.core.layout_binding.image2D_",
        "layout_binding_imageLoad_FragmentShader");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000780,
        "KHR-GLES31.core.layout_binding.atomic_u",
        "int_layout_binding_atomic_FragmentShader");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000781,
        "KHR-GLES31.core.layout_binding.block",
        "_layout_binding_block_FragmentShader");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000782,
        "KHR-GLES31.core.layout_binding.buffer_",
        "layout_binding_atomicAdd_FragmentShader");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000783,
        "KHR-GLES31.core.layout_binding.sampler",
        "2D_layout_binding_texture_VertexShader");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000784,
        "KHR-GLES31.core.layout_binding.sampler",
        "3D_layout_binding_texture_VertexShader");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000785,
        "KHR-GLES31.core.layout_binding.sampler2D",
        "Array_layout_binding_texture_VertexShader");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000786,
        "KHR-GLES31.core.layout_binding.image2D",
        "_layout_binding_imageLoad_VertexShader");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000787,
        "KHR-GLES31.core.layout_binding.atomic_",
        "uint_layout_binding_atomic_VertexShader");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000788,
        "KHR-GLES31.core.layout_binding.bloc",
        "k_layout_binding_block_VertexShader");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000789,
        "KHR-GLES31.core.layout_binding.buffer",
        "_layout_binding_atomicAdd_VertexShader");
