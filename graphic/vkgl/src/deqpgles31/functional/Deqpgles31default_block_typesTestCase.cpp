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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310021TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020174,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_size.default_block.types.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020175,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.array_size.default_block.types.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020176,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_size.default_block.types.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020177,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_size.default_block.types.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020178,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_size.default_block.types.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020179,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_size.default_block.types.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020180,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_size.default_block.types.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020181,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_size.default_block.types.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020182,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_size.default_block.types.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020183,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_size.default_block.types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020184,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.array_size.default_block.types.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020185,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_size.default_block.types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020186,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.array_size.default_block.types.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020187,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_size.default_block.types.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020188,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.array_size.default_block.types.sampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020189,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.array_size.default_block.types.sampler_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020190,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.array_size.default_block.types.sampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020191,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.array_size.default_block.types.sampler_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020192,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.array_size.default_block.types.sampler_2d_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020193,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.array_size.default_block.types.isampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020194,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.array_size.default_block.types.usampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020195,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.array_size.default_block.types.sampler_2d_ms");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020196,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.array_size.default_block.types.isampler_2d_ms");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020197,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.array_size.default_block.types.image_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020198,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.array_size.default_block.types.iimage_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020199,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.array_size.default_block.types.uimage_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020200,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.array_size.default_block.types.atomic_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020259,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.array_stride.default_block.types.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020260,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_stride.default_block.types.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020261,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.array_stride.default_block.types.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020262,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.array_stride.default_block.types.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020263,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.array_stride.default_block.types.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020264,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.array_stride.default_block.types.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020265,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.array_stride.default_block.types.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020266,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.array_stride.default_block.types.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020267,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.array_stride.default_block.types.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020268,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.array_stride.default_block.types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020269,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.array_stride.default_block.types.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020270,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.array_stride.default_block.types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020271,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.array_stride.default_block.types.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020272,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.array_stride.default_block.types.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020273,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.array_stride.default_block.types.sampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020274,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.array_stride.default_block.types.sampler_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020275,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.array_stride.default_block.types.sampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020276,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.array_stride.default_block.types.sampler_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020277,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.array_stride.default_block.types.sampler_2d_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020278,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.array_stride.default_block.types.isampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020279,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.array_stride.default_block.types.usampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020280,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.array_stride.default_block.types.sampler_2d_ms");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020281,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.array_stride.default_block.types.isampler_2d_ms");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020282,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.array_stride.default_block.types.image_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020283,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.array_stride.default_block.types.iimage_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020284,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.array_stride.default_block.types.uimage_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020285,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.array_stride.default_block.types.atomic_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020840,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.default_block.types.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020841,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.default_block.types.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020842,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.default_block.types.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020843,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.default_block.types.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020844,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.default_block.types.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020845,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.default_block.types.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020846,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.default_block.types.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020847,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.default_block.types.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020848,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.default_block.types.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020849,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.default_block.types.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020850,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.default_block.types.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020851,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.default_block.types.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020852,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.default_block.types.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020853,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.default_block.types.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020854,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.default_block.types.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020855,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.default_block.types.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020856,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.default_block.types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020857,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.offset.default_block.types.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020858,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.offset.default_block.types.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020859,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.offset.default_block.types.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020860,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.default_block.types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020861,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.offset.default_block.types.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020862,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.offset.default_block.types.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020863,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.offset.default_block.types.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020864,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.default_block.types.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020865,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.offset.default_block.types.sampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020866,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.offset.default_block.types.sampler_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020867,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.offset.default_block.types.sampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020868,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.offset.default_block.types.sampler_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020869,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.offset.default_block.types.sampler_2d_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020870,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.offset.default_block.types.sampler_cube_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020871,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.offset.default_block.types.sampler_2d_array_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020872,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.offset.default_block.types.isampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020873,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.offset.default_block.types.isampler_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020874,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.offset.default_block.types.isampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020875,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.offset.default_block.types.isampler_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020876,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.offset.default_block.types.usampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020877,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.offset.default_block.types.usampler_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020878,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.offset.default_block.types.usampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020879,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.offset.default_block.types.usampler_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020880,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.offset.default_block.types.sampler_2d_ms");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020881,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.offset.default_block.types.isampler_2d_ms");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020882,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.offset.default_block.types.usampler_2d_ms");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020883,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.offset.default_block.types.image_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020884,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.offset.default_block.types.image_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020885,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.offset.default_block.types.image_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020886,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.offset.default_block.types.image_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020887,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.offset.default_block.types.iimage_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020888,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.offset.default_block.types.iimage_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020889,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.offset.default_block.types.iimage_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020890,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.offset.default_block.types.iimage_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020891,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.offset.default_block.types.uimage_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020892,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.offset.default_block.types.uimage_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020893,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.offset.default_block.types.uimage_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020894,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.offset.default_block.types.uimage_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020895,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.offset.default_block.types.atomic_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021418,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.default_block.types.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021419,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.default_block.types.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021420,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.default_block.types.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021421,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.default_block.types.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021422,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.default_block.types.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021423,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.default_block.types.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021424,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.default_block.types.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021425,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.default_block.types.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021426,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.default_block.types.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021427,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.default_block.types.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021428,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.default_block.types.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021429,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.default_block.types.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021430,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.default_block.types.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021431,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.default_block.types.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021432,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.default_block.types.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021433,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.default_block.types.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021434,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.default_block.types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021435,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.type.default_block.types.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021436,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.type.default_block.types.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021437,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.type.default_block.types.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021438,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.default_block.types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021439,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.type.default_block.types.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021440,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.type.default_block.types.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021441,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.type.default_block.types.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021442,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.default_block.types.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021443,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.type.default_block.types.sampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021444,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.type.default_block.types.sampler_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021445,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.type.default_block.types.sampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021446,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.type.default_block.types.sampler_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021447,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.type.default_block.types.sampler_2d_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021448,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.type.default_block.types.sampler_cube_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021449,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.type.default_block.types.sampler_2d_array_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021450,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.type.default_block.types.isampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021451,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.type.default_block.types.isampler_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021452,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.type.default_block.types.isampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021453,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.type.default_block.types.isampler_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021454,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.type.default_block.types.usampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021455,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.type.default_block.types.usampler_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021456,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.type.default_block.types.usampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021457,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.type.default_block.types.usampler_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021458,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.type.default_block.types.sampler_2d_ms");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021459,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.type.default_block.types.isampler_2d_ms");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021460,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.type.default_block.types.usampler_2d_ms");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021461,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.type.default_block.types.image_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021462,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.type.default_block.types.image_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021463,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.type.default_block.types.image_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021464,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.type.default_block.types.image_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021465,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.type.default_block.types.iimage_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021466,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.type.default_block.types.iimage_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021467,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.type.default_block.types.iimage_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021468,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.type.default_block.types.iimage_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021469,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.type.default_block.types.uimage_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021470,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.type.default_block.types.uimage_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021471,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.type.default_block.types.uimage_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021472,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.type.default_block.types.uimage_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021473,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.type.default_block.types.atomic_uint");
