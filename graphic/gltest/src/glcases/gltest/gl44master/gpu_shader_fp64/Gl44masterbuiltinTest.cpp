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
#include "../Gl44masterBaseFunc.h"
#include "../ActsGl44master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004543,
    "KHR-GL44.gpu_shader_fp64.builtin.abs_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004544,
    "KHR-GL44.gpu_shader_fp64.builtin.abs_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004545,
    "KHR-GL44.gpu_shader_fp64.builtin.abs_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004546,
    "KHR-GL44.gpu_shader_fp64.builtin.abs_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004547,
    "KHR-GL44.gpu_shader_fp64.builtin.abs_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004548,
    "KHR-GL44.gpu_shader_fp64.builtin.abs_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004549,
    "KHR-GL44.gpu_shader_fp64.builtin.abs_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004550,
    "KHR-GL44.gpu_shader_fp64.builtin.abs_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004551,
    "KHR-GL44.gpu_shader_fp64.builtin.abs_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004552,
    "KHR-GL44.gpu_shader_fp64.builtin.abs_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004553,
    "KHR-GL44.gpu_shader_fp64.builtin.abs_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004554,
    "KHR-GL44.gpu_shader_fp64.builtin.abs_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004555,
    "KHR-GL44.gpu_shader_fp64.builtin.abs_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004556,
    "KHR-GL44.gpu_shader_fp64.builtin.ceil_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004557,
    "KHR-GL44.gpu_shader_fp64.builtin.ceil_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004558,
    "KHR-GL44.gpu_shader_fp64.builtin.ceil_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004559,
    "KHR-GL44.gpu_shader_fp64.builtin.ceil_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004560,
    "KHR-GL44.gpu_shader_fp64.builtin.ceil_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004561,
    "KHR-GL44.gpu_shader_fp64.builtin.ceil_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004562,
    "KHR-GL44.gpu_shader_fp64.builtin.ceil_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004563,
    "KHR-GL44.gpu_shader_fp64.builtin.ceil_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004564,
    "KHR-GL44.gpu_shader_fp64.builtin.ceil_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004565,
    "KHR-GL44.gpu_shader_fp64.builtin.ceil_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004566,
    "KHR-GL44.gpu_shader_fp64.builtin.ceil_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004567,
    "KHR-GL44.gpu_shader_fp64.builtin.ceil_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004568,
    "KHR-GL44.gpu_shader_fp64.builtin.ceil_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004569,
    "KHR-GL44.gpu_shader_fp64.builtin.clamp_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004570,
    "KHR-GL44.gpu_shader_fp64.builtin.clamp_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004571,
    "KHR-GL44.gpu_shader_fp64.builtin.clamp_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004572,
    "KHR-GL44.gpu_shader_fp64.builtin.clamp_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004573,
    "KHR-GL44.gpu_shader_fp64.builtin.clamp_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004574,
    "KHR-GL44.gpu_shader_fp64.builtin.clamp_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004575,
    "KHR-GL44.gpu_shader_fp64.builtin.clamp_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004576,
    "KHR-GL44.gpu_shader_fp64.builtin.clamp_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004577,
    "KHR-GL44.gpu_shader_fp64.builtin.clamp_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004578,
    "KHR-GL44.gpu_shader_fp64.builtin.clamp_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004579,
    "KHR-GL44.gpu_shader_fp64.builtin.clamp_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004580,
    "KHR-GL44.gpu_shader_fp64.builtin.clamp_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004581,
    "KHR-GL44.gpu_shader_fp64.builtin.clamp_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004582,
    "KHR-GL44.gpu_shader_fp64.builtin.clamp_against_scalar_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004583,
    "KHR-GL44.gpu_shader_fp64.builtin.clamp_against_scalar_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004584,
    "KHR-GL44.gpu_shader_fp64.builtin.clamp_against_scalar_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004585,
    "KHR-GL44.gpu_shader_fp64.builtin.clamp_against_scalar_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004586,
    "KHR-GL44.gpu_shader_fp64.builtin.clamp_against_scalar_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004587,
    "KHR-GL44.gpu_shader_fp64.builtin.clamp_against_scalar_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004588,
    "KHR-GL44.gpu_shader_fp64.builtin.clamp_against_scalar_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004589,
    "KHR-GL44.gpu_shader_fp64.builtin.clamp_against_scalar_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004590,
    "KHR-GL44.gpu_shader_fp64.builtin.clamp_against_scalar_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004591,
    "KHR-GL44.gpu_shader_fp64.builtin.clamp_against_scalar_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004592,
    "KHR-GL44.gpu_shader_fp64.builtin.clamp_against_scalar_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004593,
    "KHR-GL44.gpu_shader_fp64.builtin.clamp_against_scalar_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004594,
    "KHR-GL44.gpu_shader_fp64.builtin.clamp_against_scalar_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004595,
    "KHR-GL44.gpu_shader_fp64.builtin.cross_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004596,
    "KHR-GL44.gpu_shader_fp64.builtin.cross_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004597,
    "KHR-GL44.gpu_shader_fp64.builtin.cross_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004598,
    "KHR-GL44.gpu_shader_fp64.builtin.cross_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004599,
    "KHR-GL44.gpu_shader_fp64.builtin.cross_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004600,
    "KHR-GL44.gpu_shader_fp64.builtin.cross_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004601,
    "KHR-GL44.gpu_shader_fp64.builtin.cross_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004602,
    "KHR-GL44.gpu_shader_fp64.builtin.cross_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004603,
    "KHR-GL44.gpu_shader_fp64.builtin.cross_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004604,
    "KHR-GL44.gpu_shader_fp64.builtin.cross_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004605,
    "KHR-GL44.gpu_shader_fp64.builtin.cross_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004606,
    "KHR-GL44.gpu_shader_fp64.builtin.cross_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004607,
    "KHR-GL44.gpu_shader_fp64.builtin.cross_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004608,
    "KHR-GL44.gpu_shader_fp64.builtin.determinant_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004609,
    "KHR-GL44.gpu_shader_fp64.builtin.determinant_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004610,
    "KHR-GL44.gpu_shader_fp64.builtin.determinant_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004611,
    "KHR-GL44.gpu_shader_fp64.builtin.determinant_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004612,
    "KHR-GL44.gpu_shader_fp64.builtin.determinant_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004613,
    "KHR-GL44.gpu_shader_fp64.builtin.determinant_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004614,
    "KHR-GL44.gpu_shader_fp64.builtin.determinant_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004615,
    "KHR-GL44.gpu_shader_fp64.builtin.determinant_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004616,
    "KHR-GL44.gpu_shader_fp64.builtin.determinant_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004617,
    "KHR-GL44.gpu_shader_fp64.builtin.determinant_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004618,
    "KHR-GL44.gpu_shader_fp64.builtin.determinant_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004619,
    "KHR-GL44.gpu_shader_fp64.builtin.determinant_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004620,
    "KHR-GL44.gpu_shader_fp64.builtin.determinant_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004621,
    "KHR-GL44.gpu_shader_fp64.builtin.distance_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004622,
    "KHR-GL44.gpu_shader_fp64.builtin.distance_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004623,
    "KHR-GL44.gpu_shader_fp64.builtin.distance_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004624,
    "KHR-GL44.gpu_shader_fp64.builtin.distance_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004625,
    "KHR-GL44.gpu_shader_fp64.builtin.distance_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004626,
    "KHR-GL44.gpu_shader_fp64.builtin.distance_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004627,
    "KHR-GL44.gpu_shader_fp64.builtin.distance_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004628,
    "KHR-GL44.gpu_shader_fp64.builtin.distance_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004629,
    "KHR-GL44.gpu_shader_fp64.builtin.distance_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004630,
    "KHR-GL44.gpu_shader_fp64.builtin.distance_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004631,
    "KHR-GL44.gpu_shader_fp64.builtin.distance_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004632,
    "KHR-GL44.gpu_shader_fp64.builtin.distance_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004633,
    "KHR-GL44.gpu_shader_fp64.builtin.distance_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004634,
    "KHR-GL44.gpu_shader_fp64.builtin.dot_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004635,
    "KHR-GL44.gpu_shader_fp64.builtin.dot_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004636,
    "KHR-GL44.gpu_shader_fp64.builtin.dot_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004637,
    "KHR-GL44.gpu_shader_fp64.builtin.dot_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004638,
    "KHR-GL44.gpu_shader_fp64.builtin.dot_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004639,
    "KHR-GL44.gpu_shader_fp64.builtin.dot_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004640,
    "KHR-GL44.gpu_shader_fp64.builtin.dot_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004641,
    "KHR-GL44.gpu_shader_fp64.builtin.dot_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004642,
    "KHR-GL44.gpu_shader_fp64.builtin.dot_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004643,
    "KHR-GL44.gpu_shader_fp64.builtin.dot_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004644,
    "KHR-GL44.gpu_shader_fp64.builtin.dot_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004645,
    "KHR-GL44.gpu_shader_fp64.builtin.dot_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004646,
    "KHR-GL44.gpu_shader_fp64.builtin.dot_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004647,
    "KHR-GL44.gpu_shader_fp64.builtin.equal_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004648,
    "KHR-GL44.gpu_shader_fp64.builtin.equal_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004649,
    "KHR-GL44.gpu_shader_fp64.builtin.equal_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004650,
    "KHR-GL44.gpu_shader_fp64.builtin.equal_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004651,
    "KHR-GL44.gpu_shader_fp64.builtin.equal_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004652,
    "KHR-GL44.gpu_shader_fp64.builtin.equal_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004653,
    "KHR-GL44.gpu_shader_fp64.builtin.equal_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004654,
    "KHR-GL44.gpu_shader_fp64.builtin.equal_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004655,
    "KHR-GL44.gpu_shader_fp64.builtin.equal_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004656,
    "KHR-GL44.gpu_shader_fp64.builtin.equal_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004657,
    "KHR-GL44.gpu_shader_fp64.builtin.equal_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004658,
    "KHR-GL44.gpu_shader_fp64.builtin.equal_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004659,
    "KHR-GL44.gpu_shader_fp64.builtin.equal_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004660,
    "KHR-GL44.gpu_shader_fp64.builtin.faceforward_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004661,
    "KHR-GL44.gpu_shader_fp64.builtin.faceforward_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004662,
    "KHR-GL44.gpu_shader_fp64.builtin.faceforward_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004663,
    "KHR-GL44.gpu_shader_fp64.builtin.faceforward_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004664,
    "KHR-GL44.gpu_shader_fp64.builtin.faceforward_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004665,
    "KHR-GL44.gpu_shader_fp64.builtin.faceforward_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004666,
    "KHR-GL44.gpu_shader_fp64.builtin.faceforward_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004667,
    "KHR-GL44.gpu_shader_fp64.builtin.faceforward_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004668,
    "KHR-GL44.gpu_shader_fp64.builtin.faceforward_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004669,
    "KHR-GL44.gpu_shader_fp64.builtin.faceforward_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004670,
    "KHR-GL44.gpu_shader_fp64.builtin.faceforward_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004671,
    "KHR-GL44.gpu_shader_fp64.builtin.faceforward_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004672,
    "KHR-GL44.gpu_shader_fp64.builtin.faceforward_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004673,
    "KHR-GL44.gpu_shader_fp64.builtin.floor_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004674,
    "KHR-GL44.gpu_shader_fp64.builtin.floor_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004675,
    "KHR-GL44.gpu_shader_fp64.builtin.floor_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004676,
    "KHR-GL44.gpu_shader_fp64.builtin.floor_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004677,
    "KHR-GL44.gpu_shader_fp64.builtin.floor_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004678,
    "KHR-GL44.gpu_shader_fp64.builtin.floor_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004679,
    "KHR-GL44.gpu_shader_fp64.builtin.floor_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004680,
    "KHR-GL44.gpu_shader_fp64.builtin.floor_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004681,
    "KHR-GL44.gpu_shader_fp64.builtin.floor_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004682,
    "KHR-GL44.gpu_shader_fp64.builtin.floor_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004683,
    "KHR-GL44.gpu_shader_fp64.builtin.floor_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004684,
    "KHR-GL44.gpu_shader_fp64.builtin.floor_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004685,
    "KHR-GL44.gpu_shader_fp64.builtin.floor_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004686,
    "KHR-GL44.gpu_shader_fp64.builtin.fma_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004687,
    "KHR-GL44.gpu_shader_fp64.builtin.fma_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004688,
    "KHR-GL44.gpu_shader_fp64.builtin.fma_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004689,
    "KHR-GL44.gpu_shader_fp64.builtin.fma_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004690,
    "KHR-GL44.gpu_shader_fp64.builtin.fma_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004691,
    "KHR-GL44.gpu_shader_fp64.builtin.fma_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004692,
    "KHR-GL44.gpu_shader_fp64.builtin.fma_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004693,
    "KHR-GL44.gpu_shader_fp64.builtin.fma_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004694,
    "KHR-GL44.gpu_shader_fp64.builtin.fma_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004695,
    "KHR-GL44.gpu_shader_fp64.builtin.fma_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004696,
    "KHR-GL44.gpu_shader_fp64.builtin.fma_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004697,
    "KHR-GL44.gpu_shader_fp64.builtin.fma_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004698,
    "KHR-GL44.gpu_shader_fp64.builtin.fma_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004699,
    "KHR-GL44.gpu_shader_fp64.builtin.fract_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004700,
    "KHR-GL44.gpu_shader_fp64.builtin.fract_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004701,
    "KHR-GL44.gpu_shader_fp64.builtin.fract_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004702,
    "KHR-GL44.gpu_shader_fp64.builtin.fract_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004703,
    "KHR-GL44.gpu_shader_fp64.builtin.fract_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004704,
    "KHR-GL44.gpu_shader_fp64.builtin.fract_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004705,
    "KHR-GL44.gpu_shader_fp64.builtin.fract_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004706,
    "KHR-GL44.gpu_shader_fp64.builtin.fract_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004707,
    "KHR-GL44.gpu_shader_fp64.builtin.fract_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004708,
    "KHR-GL44.gpu_shader_fp64.builtin.fract_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004709,
    "KHR-GL44.gpu_shader_fp64.builtin.fract_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004710,
    "KHR-GL44.gpu_shader_fp64.builtin.fract_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004711,
    "KHR-GL44.gpu_shader_fp64.builtin.fract_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004712,
    "KHR-GL44.gpu_shader_fp64.builtin.frexp_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004713,
    "KHR-GL44.gpu_shader_fp64.builtin.frexp_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004714,
    "KHR-GL44.gpu_shader_fp64.builtin.frexp_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004715,
    "KHR-GL44.gpu_shader_fp64.builtin.frexp_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004716,
    "KHR-GL44.gpu_shader_fp64.builtin.frexp_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004717,
    "KHR-GL44.gpu_shader_fp64.builtin.frexp_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004718,
    "KHR-GL44.gpu_shader_fp64.builtin.frexp_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004719,
    "KHR-GL44.gpu_shader_fp64.builtin.frexp_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004720,
    "KHR-GL44.gpu_shader_fp64.builtin.frexp_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004721,
    "KHR-GL44.gpu_shader_fp64.builtin.frexp_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004722,
    "KHR-GL44.gpu_shader_fp64.builtin.frexp_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004723,
    "KHR-GL44.gpu_shader_fp64.builtin.frexp_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004724,
    "KHR-GL44.gpu_shader_fp64.builtin.frexp_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004725,
    "KHR-GL44.gpu_shader_fp64.builtin.greaterthan_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004726,
    "KHR-GL44.gpu_shader_fp64.builtin.greaterthan_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004727,
    "KHR-GL44.gpu_shader_fp64.builtin.greaterthan_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004728,
    "KHR-GL44.gpu_shader_fp64.builtin.greaterthan_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004729,
    "KHR-GL44.gpu_shader_fp64.builtin.greaterthan_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004730,
    "KHR-GL44.gpu_shader_fp64.builtin.greaterthan_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004731,
    "KHR-GL44.gpu_shader_fp64.builtin.greaterthan_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004732,
    "KHR-GL44.gpu_shader_fp64.builtin.greaterthan_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004733,
    "KHR-GL44.gpu_shader_fp64.builtin.greaterthan_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004734,
    "KHR-GL44.gpu_shader_fp64.builtin.greaterthan_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004735,
    "KHR-GL44.gpu_shader_fp64.builtin.greaterthan_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004736,
    "KHR-GL44.gpu_shader_fp64.builtin.greaterthan_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004737,
    "KHR-GL44.gpu_shader_fp64.builtin.greaterthan_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004738,
    "KHR-GL44.gpu_shader_fp64.builtin.greaterthanequal_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004739,
    "KHR-GL44.gpu_shader_fp64.builtin.greaterthanequal_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004740,
    "KHR-GL44.gpu_shader_fp64.builtin.greaterthanequal_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004741,
    "KHR-GL44.gpu_shader_fp64.builtin.greaterthanequal_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004742,
    "KHR-GL44.gpu_shader_fp64.builtin.greaterthanequal_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004743,
    "KHR-GL44.gpu_shader_fp64.builtin.greaterthanequal_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004744,
    "KHR-GL44.gpu_shader_fp64.builtin.greaterthanequal_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004745,
    "KHR-GL44.gpu_shader_fp64.builtin.greaterthanequal_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004746,
    "KHR-GL44.gpu_shader_fp64.builtin.greaterthanequal_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004747,
    "KHR-GL44.gpu_shader_fp64.builtin.greaterthanequal_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004748,
    "KHR-GL44.gpu_shader_fp64.builtin.greaterthanequal_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004749,
    "KHR-GL44.gpu_shader_fp64.builtin.greaterthanequal_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004750,
    "KHR-GL44.gpu_shader_fp64.builtin.greaterthanequal_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004751,
    "KHR-GL44.gpu_shader_fp64.builtin.inverse_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004752,
    "KHR-GL44.gpu_shader_fp64.builtin.inverse_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004753,
    "KHR-GL44.gpu_shader_fp64.builtin.inverse_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004754,
    "KHR-GL44.gpu_shader_fp64.builtin.inverse_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004755,
    "KHR-GL44.gpu_shader_fp64.builtin.inverse_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004756,
    "KHR-GL44.gpu_shader_fp64.builtin.inverse_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004757,
    "KHR-GL44.gpu_shader_fp64.builtin.inverse_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004758,
    "KHR-GL44.gpu_shader_fp64.builtin.inverse_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004759,
    "KHR-GL44.gpu_shader_fp64.builtin.inverse_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004760,
    "KHR-GL44.gpu_shader_fp64.builtin.inverse_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004761,
    "KHR-GL44.gpu_shader_fp64.builtin.inverse_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004762,
    "KHR-GL44.gpu_shader_fp64.builtin.inverse_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004763,
    "KHR-GL44.gpu_shader_fp64.builtin.inverse_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004764,
    "KHR-GL44.gpu_shader_fp64.builtin.inversesqrt_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004765,
    "KHR-GL44.gpu_shader_fp64.builtin.inversesqrt_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004766,
    "KHR-GL44.gpu_shader_fp64.builtin.inversesqrt_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004767,
    "KHR-GL44.gpu_shader_fp64.builtin.inversesqrt_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004768,
    "KHR-GL44.gpu_shader_fp64.builtin.inversesqrt_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004769,
    "KHR-GL44.gpu_shader_fp64.builtin.inversesqrt_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004770,
    "KHR-GL44.gpu_shader_fp64.builtin.inversesqrt_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004771,
    "KHR-GL44.gpu_shader_fp64.builtin.inversesqrt_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004772,
    "KHR-GL44.gpu_shader_fp64.builtin.inversesqrt_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004773,
    "KHR-GL44.gpu_shader_fp64.builtin.inversesqrt_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004774,
    "KHR-GL44.gpu_shader_fp64.builtin.inversesqrt_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004775,
    "KHR-GL44.gpu_shader_fp64.builtin.inversesqrt_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004776,
    "KHR-GL44.gpu_shader_fp64.builtin.inversesqrt_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004777,
    "KHR-GL44.gpu_shader_fp64.builtin.ldexp_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004778,
    "KHR-GL44.gpu_shader_fp64.builtin.ldexp_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004779,
    "KHR-GL44.gpu_shader_fp64.builtin.ldexp_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004780,
    "KHR-GL44.gpu_shader_fp64.builtin.ldexp_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004781,
    "KHR-GL44.gpu_shader_fp64.builtin.ldexp_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004782,
    "KHR-GL44.gpu_shader_fp64.builtin.ldexp_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004783,
    "KHR-GL44.gpu_shader_fp64.builtin.ldexp_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004784,
    "KHR-GL44.gpu_shader_fp64.builtin.ldexp_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004785,
    "KHR-GL44.gpu_shader_fp64.builtin.ldexp_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004786,
    "KHR-GL44.gpu_shader_fp64.builtin.ldexp_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004787,
    "KHR-GL44.gpu_shader_fp64.builtin.ldexp_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004788,
    "KHR-GL44.gpu_shader_fp64.builtin.ldexp_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004789,
    "KHR-GL44.gpu_shader_fp64.builtin.ldexp_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004790,
    "KHR-GL44.gpu_shader_fp64.builtin.lessthan_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004791,
    "KHR-GL44.gpu_shader_fp64.builtin.lessthan_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004792,
    "KHR-GL44.gpu_shader_fp64.builtin.lessthan_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004793,
    "KHR-GL44.gpu_shader_fp64.builtin.lessthan_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004794,
    "KHR-GL44.gpu_shader_fp64.builtin.lessthan_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004795,
    "KHR-GL44.gpu_shader_fp64.builtin.lessthan_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004796,
    "KHR-GL44.gpu_shader_fp64.builtin.lessthan_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004797,
    "KHR-GL44.gpu_shader_fp64.builtin.lessthan_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004798,
    "KHR-GL44.gpu_shader_fp64.builtin.lessthan_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004799,
    "KHR-GL44.gpu_shader_fp64.builtin.lessthan_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004800,
    "KHR-GL44.gpu_shader_fp64.builtin.lessthan_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004801,
    "KHR-GL44.gpu_shader_fp64.builtin.lessthan_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004802,
    "KHR-GL44.gpu_shader_fp64.builtin.lessthan_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004803,
    "KHR-GL44.gpu_shader_fp64.builtin.lessthanequal_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004804,
    "KHR-GL44.gpu_shader_fp64.builtin.lessthanequal_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004805,
    "KHR-GL44.gpu_shader_fp64.builtin.lessthanequal_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004806,
    "KHR-GL44.gpu_shader_fp64.builtin.lessthanequal_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004807,
    "KHR-GL44.gpu_shader_fp64.builtin.lessthanequal_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004808,
    "KHR-GL44.gpu_shader_fp64.builtin.lessthanequal_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004809,
    "KHR-GL44.gpu_shader_fp64.builtin.lessthanequal_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004810,
    "KHR-GL44.gpu_shader_fp64.builtin.lessthanequal_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004811,
    "KHR-GL44.gpu_shader_fp64.builtin.lessthanequal_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004812,
    "KHR-GL44.gpu_shader_fp64.builtin.lessthanequal_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004813,
    "KHR-GL44.gpu_shader_fp64.builtin.lessthanequal_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004814,
    "KHR-GL44.gpu_shader_fp64.builtin.lessthanequal_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004815,
    "KHR-GL44.gpu_shader_fp64.builtin.lessthanequal_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004816,
    "KHR-GL44.gpu_shader_fp64.builtin.length_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004817,
    "KHR-GL44.gpu_shader_fp64.builtin.length_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004818,
    "KHR-GL44.gpu_shader_fp64.builtin.length_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004819,
    "KHR-GL44.gpu_shader_fp64.builtin.length_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004820,
    "KHR-GL44.gpu_shader_fp64.builtin.length_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004821,
    "KHR-GL44.gpu_shader_fp64.builtin.length_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004822,
    "KHR-GL44.gpu_shader_fp64.builtin.length_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004823,
    "KHR-GL44.gpu_shader_fp64.builtin.length_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004824,
    "KHR-GL44.gpu_shader_fp64.builtin.length_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004825,
    "KHR-GL44.gpu_shader_fp64.builtin.length_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004826,
    "KHR-GL44.gpu_shader_fp64.builtin.length_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004827,
    "KHR-GL44.gpu_shader_fp64.builtin.length_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004828,
    "KHR-GL44.gpu_shader_fp64.builtin.length_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004829,
    "KHR-GL44.gpu_shader_fp64.builtin.matrixcompmult_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004830,
    "KHR-GL44.gpu_shader_fp64.builtin.matrixcompmult_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004831,
    "KHR-GL44.gpu_shader_fp64.builtin.matrixcompmult_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004832,
    "KHR-GL44.gpu_shader_fp64.builtin.matrixcompmult_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004833,
    "KHR-GL44.gpu_shader_fp64.builtin.matrixcompmult_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004834,
    "KHR-GL44.gpu_shader_fp64.builtin.matrixcompmult_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004835,
    "KHR-GL44.gpu_shader_fp64.builtin.matrixcompmult_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004836,
    "KHR-GL44.gpu_shader_fp64.builtin.matrixcompmult_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004837,
    "KHR-GL44.gpu_shader_fp64.builtin.matrixcompmult_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004838,
    "KHR-GL44.gpu_shader_fp64.builtin.matrixcompmult_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004839,
    "KHR-GL44.gpu_shader_fp64.builtin.matrixcompmult_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004840,
    "KHR-GL44.gpu_shader_fp64.builtin.matrixcompmult_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004841,
    "KHR-GL44.gpu_shader_fp64.builtin.matrixcompmult_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004842,
    "KHR-GL44.gpu_shader_fp64.builtin.max_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004843,
    "KHR-GL44.gpu_shader_fp64.builtin.max_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004844,
    "KHR-GL44.gpu_shader_fp64.builtin.max_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004845,
    "KHR-GL44.gpu_shader_fp64.builtin.max_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004846,
    "KHR-GL44.gpu_shader_fp64.builtin.max_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004847,
    "KHR-GL44.gpu_shader_fp64.builtin.max_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004848,
    "KHR-GL44.gpu_shader_fp64.builtin.max_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004849,
    "KHR-GL44.gpu_shader_fp64.builtin.max_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004850,
    "KHR-GL44.gpu_shader_fp64.builtin.max_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004851,
    "KHR-GL44.gpu_shader_fp64.builtin.max_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004852,
    "KHR-GL44.gpu_shader_fp64.builtin.max_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004853,
    "KHR-GL44.gpu_shader_fp64.builtin.max_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004854,
    "KHR-GL44.gpu_shader_fp64.builtin.max_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004855,
    "KHR-GL44.gpu_shader_fp64.builtin.max_against_scalar_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004856,
    "KHR-GL44.gpu_shader_fp64.builtin.max_against_scalar_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004857,
    "KHR-GL44.gpu_shader_fp64.builtin.max_against_scalar_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004858,
    "KHR-GL44.gpu_shader_fp64.builtin.max_against_scalar_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004859,
    "KHR-GL44.gpu_shader_fp64.builtin.max_against_scalar_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004860,
    "KHR-GL44.gpu_shader_fp64.builtin.max_against_scalar_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004861,
    "KHR-GL44.gpu_shader_fp64.builtin.max_against_scalar_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004862,
    "KHR-GL44.gpu_shader_fp64.builtin.max_against_scalar_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004863,
    "KHR-GL44.gpu_shader_fp64.builtin.max_against_scalar_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004864,
    "KHR-GL44.gpu_shader_fp64.builtin.max_against_scalar_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004865,
    "KHR-GL44.gpu_shader_fp64.builtin.max_against_scalar_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004866,
    "KHR-GL44.gpu_shader_fp64.builtin.max_against_scalar_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004867,
    "KHR-GL44.gpu_shader_fp64.builtin.max_against_scalar_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004868,
    "KHR-GL44.gpu_shader_fp64.builtin.min_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004869,
    "KHR-GL44.gpu_shader_fp64.builtin.min_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004870,
    "KHR-GL44.gpu_shader_fp64.builtin.min_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004871,
    "KHR-GL44.gpu_shader_fp64.builtin.min_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004872,
    "KHR-GL44.gpu_shader_fp64.builtin.min_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004873,
    "KHR-GL44.gpu_shader_fp64.builtin.min_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004874,
    "KHR-GL44.gpu_shader_fp64.builtin.min_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004875,
    "KHR-GL44.gpu_shader_fp64.builtin.min_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004876,
    "KHR-GL44.gpu_shader_fp64.builtin.min_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004877,
    "KHR-GL44.gpu_shader_fp64.builtin.min_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004878,
    "KHR-GL44.gpu_shader_fp64.builtin.min_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004879,
    "KHR-GL44.gpu_shader_fp64.builtin.min_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004880,
    "KHR-GL44.gpu_shader_fp64.builtin.min_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004881,
    "KHR-GL44.gpu_shader_fp64.builtin.min_against_scalar_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004882,
    "KHR-GL44.gpu_shader_fp64.builtin.min_against_scalar_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004883,
    "KHR-GL44.gpu_shader_fp64.builtin.min_against_scalar_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004884,
    "KHR-GL44.gpu_shader_fp64.builtin.min_against_scalar_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004885,
    "KHR-GL44.gpu_shader_fp64.builtin.min_against_scalar_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004886,
    "KHR-GL44.gpu_shader_fp64.builtin.min_against_scalar_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004887,
    "KHR-GL44.gpu_shader_fp64.builtin.min_against_scalar_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004888,
    "KHR-GL44.gpu_shader_fp64.builtin.min_against_scalar_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004889,
    "KHR-GL44.gpu_shader_fp64.builtin.min_against_scalar_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004890,
    "KHR-GL44.gpu_shader_fp64.builtin.min_against_scalar_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004891,
    "KHR-GL44.gpu_shader_fp64.builtin.min_against_scalar_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004892,
    "KHR-GL44.gpu_shader_fp64.builtin.min_against_scalar_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004893,
    "KHR-GL44.gpu_shader_fp64.builtin.min_against_scalar_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004894,
    "KHR-GL44.gpu_shader_fp64.builtin.mix_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004895,
    "KHR-GL44.gpu_shader_fp64.builtin.mix_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004896,
    "KHR-GL44.gpu_shader_fp64.builtin.mix_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004897,
    "KHR-GL44.gpu_shader_fp64.builtin.mix_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004898,
    "KHR-GL44.gpu_shader_fp64.builtin.mix_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004899,
    "KHR-GL44.gpu_shader_fp64.builtin.mix_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004900,
    "KHR-GL44.gpu_shader_fp64.builtin.mix_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004901,
    "KHR-GL44.gpu_shader_fp64.builtin.mix_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004902,
    "KHR-GL44.gpu_shader_fp64.builtin.mix_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004903,
    "KHR-GL44.gpu_shader_fp64.builtin.mix_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004904,
    "KHR-GL44.gpu_shader_fp64.builtin.mix_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004905,
    "KHR-GL44.gpu_shader_fp64.builtin.mix_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004906,
    "KHR-GL44.gpu_shader_fp64.builtin.mix_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004907,
    "KHR-GL44.gpu_shader_fp64.builtin.mod_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004908,
    "KHR-GL44.gpu_shader_fp64.builtin.mod_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004909,
    "KHR-GL44.gpu_shader_fp64.builtin.mod_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004910,
    "KHR-GL44.gpu_shader_fp64.builtin.mod_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004911,
    "KHR-GL44.gpu_shader_fp64.builtin.mod_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004912,
    "KHR-GL44.gpu_shader_fp64.builtin.mod_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004913,
    "KHR-GL44.gpu_shader_fp64.builtin.mod_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004914,
    "KHR-GL44.gpu_shader_fp64.builtin.mod_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004915,
    "KHR-GL44.gpu_shader_fp64.builtin.mod_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004916,
    "KHR-GL44.gpu_shader_fp64.builtin.mod_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004917,
    "KHR-GL44.gpu_shader_fp64.builtin.mod_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004918,
    "KHR-GL44.gpu_shader_fp64.builtin.mod_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004919,
    "KHR-GL44.gpu_shader_fp64.builtin.mod_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004920,
    "KHR-GL44.gpu_shader_fp64.builtin.mod_against_scalar_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004921,
    "KHR-GL44.gpu_shader_fp64.builtin.mod_against_scalar_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004922,
    "KHR-GL44.gpu_shader_fp64.builtin.mod_against_scalar_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004923,
    "KHR-GL44.gpu_shader_fp64.builtin.mod_against_scalar_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004924,
    "KHR-GL44.gpu_shader_fp64.builtin.mod_against_scalar_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004925,
    "KHR-GL44.gpu_shader_fp64.builtin.mod_against_scalar_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004926,
    "KHR-GL44.gpu_shader_fp64.builtin.mod_against_scalar_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004927,
    "KHR-GL44.gpu_shader_fp64.builtin.mod_against_scalar_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004928,
    "KHR-GL44.gpu_shader_fp64.builtin.mod_against_scalar_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004929,
    "KHR-GL44.gpu_shader_fp64.builtin.mod_against_scalar_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004930,
    "KHR-GL44.gpu_shader_fp64.builtin.mod_against_scalar_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004931,
    "KHR-GL44.gpu_shader_fp64.builtin.mod_against_scalar_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004932,
    "KHR-GL44.gpu_shader_fp64.builtin.mod_against_scalar_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004933,
    "KHR-GL44.gpu_shader_fp64.builtin.modf_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004934,
    "KHR-GL44.gpu_shader_fp64.builtin.modf_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004935,
    "KHR-GL44.gpu_shader_fp64.builtin.modf_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004936,
    "KHR-GL44.gpu_shader_fp64.builtin.modf_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004937,
    "KHR-GL44.gpu_shader_fp64.builtin.modf_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004938,
    "KHR-GL44.gpu_shader_fp64.builtin.modf_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004939,
    "KHR-GL44.gpu_shader_fp64.builtin.modf_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004940,
    "KHR-GL44.gpu_shader_fp64.builtin.modf_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004941,
    "KHR-GL44.gpu_shader_fp64.builtin.modf_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004942,
    "KHR-GL44.gpu_shader_fp64.builtin.modf_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004943,
    "KHR-GL44.gpu_shader_fp64.builtin.modf_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004944,
    "KHR-GL44.gpu_shader_fp64.builtin.modf_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004945,
    "KHR-GL44.gpu_shader_fp64.builtin.modf_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004946,
    "KHR-GL44.gpu_shader_fp64.builtin.normalize_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004947,
    "KHR-GL44.gpu_shader_fp64.builtin.normalize_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004948,
    "KHR-GL44.gpu_shader_fp64.builtin.normalize_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004949,
    "KHR-GL44.gpu_shader_fp64.builtin.normalize_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004950,
    "KHR-GL44.gpu_shader_fp64.builtin.normalize_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004951,
    "KHR-GL44.gpu_shader_fp64.builtin.normalize_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004952,
    "KHR-GL44.gpu_shader_fp64.builtin.normalize_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004953,
    "KHR-GL44.gpu_shader_fp64.builtin.normalize_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004954,
    "KHR-GL44.gpu_shader_fp64.builtin.normalize_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004955,
    "KHR-GL44.gpu_shader_fp64.builtin.normalize_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004956,
    "KHR-GL44.gpu_shader_fp64.builtin.normalize_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004957,
    "KHR-GL44.gpu_shader_fp64.builtin.normalize_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004958,
    "KHR-GL44.gpu_shader_fp64.builtin.normalize_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004959,
    "KHR-GL44.gpu_shader_fp64.builtin.notequal_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004960,
    "KHR-GL44.gpu_shader_fp64.builtin.notequal_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004961,
    "KHR-GL44.gpu_shader_fp64.builtin.notequal_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004962,
    "KHR-GL44.gpu_shader_fp64.builtin.notequal_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004963,
    "KHR-GL44.gpu_shader_fp64.builtin.notequal_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004964,
    "KHR-GL44.gpu_shader_fp64.builtin.notequal_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004965,
    "KHR-GL44.gpu_shader_fp64.builtin.notequal_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004966,
    "KHR-GL44.gpu_shader_fp64.builtin.notequal_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004967,
    "KHR-GL44.gpu_shader_fp64.builtin.notequal_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004968,
    "KHR-GL44.gpu_shader_fp64.builtin.notequal_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004969,
    "KHR-GL44.gpu_shader_fp64.builtin.notequal_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004970,
    "KHR-GL44.gpu_shader_fp64.builtin.notequal_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004971,
    "KHR-GL44.gpu_shader_fp64.builtin.notequal_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004972,
    "KHR-GL44.gpu_shader_fp64.builtin.outerproduct_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004973,
    "KHR-GL44.gpu_shader_fp64.builtin.outerproduct_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004974,
    "KHR-GL44.gpu_shader_fp64.builtin.outerproduct_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004975,
    "KHR-GL44.gpu_shader_fp64.builtin.outerproduct_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004976,
    "KHR-GL44.gpu_shader_fp64.builtin.outerproduct_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004977,
    "KHR-GL44.gpu_shader_fp64.builtin.outerproduct_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004978,
    "KHR-GL44.gpu_shader_fp64.builtin.outerproduct_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004979,
    "KHR-GL44.gpu_shader_fp64.builtin.outerproduct_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004980,
    "KHR-GL44.gpu_shader_fp64.builtin.outerproduct_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004981,
    "KHR-GL44.gpu_shader_fp64.builtin.outerproduct_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004982,
    "KHR-GL44.gpu_shader_fp64.builtin.outerproduct_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004983,
    "KHR-GL44.gpu_shader_fp64.builtin.outerproduct_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004984,
    "KHR-GL44.gpu_shader_fp64.builtin.outerproduct_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004985,
    "KHR-GL44.gpu_shader_fp64.builtin.packdouble2x32_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004986,
    "KHR-GL44.gpu_shader_fp64.builtin.packdouble2x32_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004987,
    "KHR-GL44.gpu_shader_fp64.builtin.packdouble2x32_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004988,
    "KHR-GL44.gpu_shader_fp64.builtin.packdouble2x32_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004989,
    "KHR-GL44.gpu_shader_fp64.builtin.packdouble2x32_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004990,
    "KHR-GL44.gpu_shader_fp64.builtin.packdouble2x32_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004991,
    "KHR-GL44.gpu_shader_fp64.builtin.packdouble2x32_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004992,
    "KHR-GL44.gpu_shader_fp64.builtin.packdouble2x32_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004993,
    "KHR-GL44.gpu_shader_fp64.builtin.packdouble2x32_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004994,
    "KHR-GL44.gpu_shader_fp64.builtin.packdouble2x32_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004995,
    "KHR-GL44.gpu_shader_fp64.builtin.packdouble2x32_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004996,
    "KHR-GL44.gpu_shader_fp64.builtin.packdouble2x32_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004997,
    "KHR-GL44.gpu_shader_fp64.builtin.packdouble2x32_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004998,
    "KHR-GL44.gpu_shader_fp64.builtin.reflect_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_004999,
    "KHR-GL44.gpu_shader_fp64.builtin.reflect_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005000,
    "KHR-GL44.gpu_shader_fp64.builtin.reflect_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005001,
    "KHR-GL44.gpu_shader_fp64.builtin.reflect_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005002,
    "KHR-GL44.gpu_shader_fp64.builtin.reflect_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005003,
    "KHR-GL44.gpu_shader_fp64.builtin.reflect_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005004,
    "KHR-GL44.gpu_shader_fp64.builtin.reflect_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005005,
    "KHR-GL44.gpu_shader_fp64.builtin.reflect_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005006,
    "KHR-GL44.gpu_shader_fp64.builtin.reflect_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005007,
    "KHR-GL44.gpu_shader_fp64.builtin.reflect_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005008,
    "KHR-GL44.gpu_shader_fp64.builtin.reflect_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005009,
    "KHR-GL44.gpu_shader_fp64.builtin.reflect_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005010,
    "KHR-GL44.gpu_shader_fp64.builtin.reflect_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005011,
    "KHR-GL44.gpu_shader_fp64.builtin.refract_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005012,
    "KHR-GL44.gpu_shader_fp64.builtin.refract_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005013,
    "KHR-GL44.gpu_shader_fp64.builtin.refract_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005014,
    "KHR-GL44.gpu_shader_fp64.builtin.refract_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005015,
    "KHR-GL44.gpu_shader_fp64.builtin.refract_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005016,
    "KHR-GL44.gpu_shader_fp64.builtin.refract_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005017,
    "KHR-GL44.gpu_shader_fp64.builtin.refract_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005018,
    "KHR-GL44.gpu_shader_fp64.builtin.refract_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005019,
    "KHR-GL44.gpu_shader_fp64.builtin.refract_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005020,
    "KHR-GL44.gpu_shader_fp64.builtin.refract_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005021,
    "KHR-GL44.gpu_shader_fp64.builtin.refract_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005022,
    "KHR-GL44.gpu_shader_fp64.builtin.refract_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005023,
    "KHR-GL44.gpu_shader_fp64.builtin.refract_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005024,
    "KHR-GL44.gpu_shader_fp64.builtin.round_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005025,
    "KHR-GL44.gpu_shader_fp64.builtin.round_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005026,
    "KHR-GL44.gpu_shader_fp64.builtin.round_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005027,
    "KHR-GL44.gpu_shader_fp64.builtin.round_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005028,
    "KHR-GL44.gpu_shader_fp64.builtin.round_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005029,
    "KHR-GL44.gpu_shader_fp64.builtin.round_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005030,
    "KHR-GL44.gpu_shader_fp64.builtin.round_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005031,
    "KHR-GL44.gpu_shader_fp64.builtin.round_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005032,
    "KHR-GL44.gpu_shader_fp64.builtin.round_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005033,
    "KHR-GL44.gpu_shader_fp64.builtin.round_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005034,
    "KHR-GL44.gpu_shader_fp64.builtin.round_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005035,
    "KHR-GL44.gpu_shader_fp64.builtin.round_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005036,
    "KHR-GL44.gpu_shader_fp64.builtin.round_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005037,
    "KHR-GL44.gpu_shader_fp64.builtin.roundeven_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005038,
    "KHR-GL44.gpu_shader_fp64.builtin.roundeven_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005039,
    "KHR-GL44.gpu_shader_fp64.builtin.roundeven_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005040,
    "KHR-GL44.gpu_shader_fp64.builtin.roundeven_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005041,
    "KHR-GL44.gpu_shader_fp64.builtin.roundeven_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005042,
    "KHR-GL44.gpu_shader_fp64.builtin.roundeven_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005043,
    "KHR-GL44.gpu_shader_fp64.builtin.roundeven_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005044,
    "KHR-GL44.gpu_shader_fp64.builtin.roundeven_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005045,
    "KHR-GL44.gpu_shader_fp64.builtin.roundeven_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005046,
    "KHR-GL44.gpu_shader_fp64.builtin.roundeven_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005047,
    "KHR-GL44.gpu_shader_fp64.builtin.roundeven_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005048,
    "KHR-GL44.gpu_shader_fp64.builtin.roundeven_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005049,
    "KHR-GL44.gpu_shader_fp64.builtin.roundeven_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005050,
    "KHR-GL44.gpu_shader_fp64.builtin.sign_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005051,
    "KHR-GL44.gpu_shader_fp64.builtin.sign_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005052,
    "KHR-GL44.gpu_shader_fp64.builtin.sign_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005053,
    "KHR-GL44.gpu_shader_fp64.builtin.sign_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005054,
    "KHR-GL44.gpu_shader_fp64.builtin.sign_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005055,
    "KHR-GL44.gpu_shader_fp64.builtin.sign_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005056,
    "KHR-GL44.gpu_shader_fp64.builtin.sign_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005057,
    "KHR-GL44.gpu_shader_fp64.builtin.sign_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005058,
    "KHR-GL44.gpu_shader_fp64.builtin.sign_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005059,
    "KHR-GL44.gpu_shader_fp64.builtin.sign_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005060,
    "KHR-GL44.gpu_shader_fp64.builtin.sign_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005061,
    "KHR-GL44.gpu_shader_fp64.builtin.sign_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005062,
    "KHR-GL44.gpu_shader_fp64.builtin.sign_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005063,
    "KHR-GL44.gpu_shader_fp64.builtin.smoothstep_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005064,
    "KHR-GL44.gpu_shader_fp64.builtin.smoothstep_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005065,
    "KHR-GL44.gpu_shader_fp64.builtin.smoothstep_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005066,
    "KHR-GL44.gpu_shader_fp64.builtin.smoothstep_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005067,
    "KHR-GL44.gpu_shader_fp64.builtin.smoothstep_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005068,
    "KHR-GL44.gpu_shader_fp64.builtin.smoothstep_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005069,
    "KHR-GL44.gpu_shader_fp64.builtin.smoothstep_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005070,
    "KHR-GL44.gpu_shader_fp64.builtin.smoothstep_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005071,
    "KHR-GL44.gpu_shader_fp64.builtin.smoothstep_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005072,
    "KHR-GL44.gpu_shader_fp64.builtin.smoothstep_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005073,
    "KHR-GL44.gpu_shader_fp64.builtin.smoothstep_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005074,
    "KHR-GL44.gpu_shader_fp64.builtin.smoothstep_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005075,
    "KHR-GL44.gpu_shader_fp64.builtin.smoothstep_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005076,
    "KHR-GL44.gpu_shader_fp64.builtin.smoothstep_against_scalar_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005077,
    "KHR-GL44.gpu_shader_fp64.builtin.smoothstep_against_scalar_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005078,
    "KHR-GL44.gpu_shader_fp64.builtin.smoothstep_against_scalar_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005079,
    "KHR-GL44.gpu_shader_fp64.builtin.smoothstep_against_scalar_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005080,
    "KHR-GL44.gpu_shader_fp64.builtin.smoothstep_against_scalar_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005081,
    "KHR-GL44.gpu_shader_fp64.builtin.smoothstep_against_scalar_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005082,
    "KHR-GL44.gpu_shader_fp64.builtin.smoothstep_against_scalar_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005083,
    "KHR-GL44.gpu_shader_fp64.builtin.smoothstep_against_scalar_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005084,
    "KHR-GL44.gpu_shader_fp64.builtin.smoothstep_against_scalar_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005085,
    "KHR-GL44.gpu_shader_fp64.builtin.smoothstep_against_scalar_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005086,
    "KHR-GL44.gpu_shader_fp64.builtin.smoothstep_against_scalar_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005087,
    "KHR-GL44.gpu_shader_fp64.builtin.smoothstep_against_scalar_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005088,
    "KHR-GL44.gpu_shader_fp64.builtin.smoothstep_against_scalar_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005089,
    "KHR-GL44.gpu_shader_fp64.builtin.sqrt_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005090,
    "KHR-GL44.gpu_shader_fp64.builtin.sqrt_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005091,
    "KHR-GL44.gpu_shader_fp64.builtin.sqrt_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005092,
    "KHR-GL44.gpu_shader_fp64.builtin.sqrt_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005093,
    "KHR-GL44.gpu_shader_fp64.builtin.sqrt_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005094,
    "KHR-GL44.gpu_shader_fp64.builtin.sqrt_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005095,
    "KHR-GL44.gpu_shader_fp64.builtin.sqrt_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005096,
    "KHR-GL44.gpu_shader_fp64.builtin.sqrt_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005097,
    "KHR-GL44.gpu_shader_fp64.builtin.sqrt_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005098,
    "KHR-GL44.gpu_shader_fp64.builtin.sqrt_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005099,
    "KHR-GL44.gpu_shader_fp64.builtin.sqrt_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005100,
    "KHR-GL44.gpu_shader_fp64.builtin.sqrt_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005101,
    "KHR-GL44.gpu_shader_fp64.builtin.sqrt_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005102,
    "KHR-GL44.gpu_shader_fp64.builtin.step_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005103,
    "KHR-GL44.gpu_shader_fp64.builtin.step_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005104,
    "KHR-GL44.gpu_shader_fp64.builtin.step_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005105,
    "KHR-GL44.gpu_shader_fp64.builtin.step_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005106,
    "KHR-GL44.gpu_shader_fp64.builtin.step_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005107,
    "KHR-GL44.gpu_shader_fp64.builtin.step_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005108,
    "KHR-GL44.gpu_shader_fp64.builtin.step_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005109,
    "KHR-GL44.gpu_shader_fp64.builtin.step_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005110,
    "KHR-GL44.gpu_shader_fp64.builtin.step_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005111,
    "KHR-GL44.gpu_shader_fp64.builtin.step_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005112,
    "KHR-GL44.gpu_shader_fp64.builtin.step_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005113,
    "KHR-GL44.gpu_shader_fp64.builtin.step_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005114,
    "KHR-GL44.gpu_shader_fp64.builtin.step_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005115,
    "KHR-GL44.gpu_shader_fp64.builtin.step_against_scalar_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005116,
    "KHR-GL44.gpu_shader_fp64.builtin.step_against_scalar_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005117,
    "KHR-GL44.gpu_shader_fp64.builtin.step_against_scalar_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005118,
    "KHR-GL44.gpu_shader_fp64.builtin.step_against_scalar_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005119,
    "KHR-GL44.gpu_shader_fp64.builtin.step_against_scalar_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005120,
    "KHR-GL44.gpu_shader_fp64.builtin.step_against_scalar_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005121,
    "KHR-GL44.gpu_shader_fp64.builtin.step_against_scalar_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005122,
    "KHR-GL44.gpu_shader_fp64.builtin.step_against_scalar_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005123,
    "KHR-GL44.gpu_shader_fp64.builtin.step_against_scalar_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005124,
    "KHR-GL44.gpu_shader_fp64.builtin.step_against_scalar_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005125,
    "KHR-GL44.gpu_shader_fp64.builtin.step_against_scalar_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005126,
    "KHR-GL44.gpu_shader_fp64.builtin.step_against_scalar_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005127,
    "KHR-GL44.gpu_shader_fp64.builtin.step_against_scalar_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005128,
    "KHR-GL44.gpu_shader_fp64.builtin.transpose_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005129,
    "KHR-GL44.gpu_shader_fp64.builtin.transpose_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005130,
    "KHR-GL44.gpu_shader_fp64.builtin.transpose_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005131,
    "KHR-GL44.gpu_shader_fp64.builtin.transpose_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005132,
    "KHR-GL44.gpu_shader_fp64.builtin.transpose_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005133,
    "KHR-GL44.gpu_shader_fp64.builtin.transpose_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005134,
    "KHR-GL44.gpu_shader_fp64.builtin.transpose_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005135,
    "KHR-GL44.gpu_shader_fp64.builtin.transpose_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005136,
    "KHR-GL44.gpu_shader_fp64.builtin.transpose_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005137,
    "KHR-GL44.gpu_shader_fp64.builtin.transpose_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005138,
    "KHR-GL44.gpu_shader_fp64.builtin.transpose_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005139,
    "KHR-GL44.gpu_shader_fp64.builtin.transpose_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005140,
    "KHR-GL44.gpu_shader_fp64.builtin.transpose_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005141,
    "KHR-GL44.gpu_shader_fp64.builtin.trunc_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005142,
    "KHR-GL44.gpu_shader_fp64.builtin.trunc_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005143,
    "KHR-GL44.gpu_shader_fp64.builtin.trunc_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005144,
    "KHR-GL44.gpu_shader_fp64.builtin.trunc_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005145,
    "KHR-GL44.gpu_shader_fp64.builtin.trunc_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005146,
    "KHR-GL44.gpu_shader_fp64.builtin.trunc_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005147,
    "KHR-GL44.gpu_shader_fp64.builtin.trunc_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005148,
    "KHR-GL44.gpu_shader_fp64.builtin.trunc_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005149,
    "KHR-GL44.gpu_shader_fp64.builtin.trunc_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005150,
    "KHR-GL44.gpu_shader_fp64.builtin.trunc_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005151,
    "KHR-GL44.gpu_shader_fp64.builtin.trunc_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005152,
    "KHR-GL44.gpu_shader_fp64.builtin.trunc_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005153,
    "KHR-GL44.gpu_shader_fp64.builtin.trunc_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005154,
    "KHR-GL44.gpu_shader_fp64.builtin.unpackdouble2x32_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005155,
    "KHR-GL44.gpu_shader_fp64.builtin.unpackdouble2x32_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005156,
    "KHR-GL44.gpu_shader_fp64.builtin.unpackdouble2x32_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005157,
    "KHR-GL44.gpu_shader_fp64.builtin.unpackdouble2x32_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005158,
    "KHR-GL44.gpu_shader_fp64.builtin.unpackdouble2x32_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005159,
    "KHR-GL44.gpu_shader_fp64.builtin.unpackdouble2x32_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005160,
    "KHR-GL44.gpu_shader_fp64.builtin.unpackdouble2x32_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005161,
    "KHR-GL44.gpu_shader_fp64.builtin.unpackdouble2x32_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005162,
    "KHR-GL44.gpu_shader_fp64.builtin.unpackdouble2x32_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005163,
    "KHR-GL44.gpu_shader_fp64.builtin.unpackdouble2x32_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005164,
    "KHR-GL44.gpu_shader_fp64.builtin.unpackdouble2x32_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005165,
    "KHR-GL44.gpu_shader_fp64.builtin.unpackdouble2x32_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005166,
    "KHR-GL44.gpu_shader_fp64.builtin.unpackdouble2x32_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005167,
    "KHR-GL44.gpu_shader_fp64.builtin.isnan_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005168,
    "KHR-GL44.gpu_shader_fp64.builtin.isnan_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005169,
    "KHR-GL44.gpu_shader_fp64.builtin.isnan_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005170,
    "KHR-GL44.gpu_shader_fp64.builtin.isnan_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005171,
    "KHR-GL44.gpu_shader_fp64.builtin.isnan_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005172,
    "KHR-GL44.gpu_shader_fp64.builtin.isnan_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005173,
    "KHR-GL44.gpu_shader_fp64.builtin.isnan_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005174,
    "KHR-GL44.gpu_shader_fp64.builtin.isnan_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005175,
    "KHR-GL44.gpu_shader_fp64.builtin.isnan_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005176,
    "KHR-GL44.gpu_shader_fp64.builtin.isnan_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005177,
    "KHR-GL44.gpu_shader_fp64.builtin.isnan_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005178,
    "KHR-GL44.gpu_shader_fp64.builtin.isnan_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005179,
    "KHR-GL44.gpu_shader_fp64.builtin.isnan_dmat4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005180,
    "KHR-GL44.gpu_shader_fp64.builtin.isinf_double");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005181,
    "KHR-GL44.gpu_shader_fp64.builtin.isinf_dvec2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005182,
    "KHR-GL44.gpu_shader_fp64.builtin.isinf_dvec3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005183,
    "KHR-GL44.gpu_shader_fp64.builtin.isinf_dvec4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005184,
    "KHR-GL44.gpu_shader_fp64.builtin.isinf_dmat2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005185,
    "KHR-GL44.gpu_shader_fp64.builtin.isinf_dmat2x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005186,
    "KHR-GL44.gpu_shader_fp64.builtin.isinf_dmat2x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005187,
    "KHR-GL44.gpu_shader_fp64.builtin.isinf_dmat3x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005188,
    "KHR-GL44.gpu_shader_fp64.builtin.isinf_dmat3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005189,
    "KHR-GL44.gpu_shader_fp64.builtin.isinf_dmat3x4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005190,
    "KHR-GL44.gpu_shader_fp64.builtin.isinf_dmat4x2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005191,
    "KHR-GL44.gpu_shader_fp64.builtin.isinf_dmat4x3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_005192,
    "KHR-GL44.gpu_shader_fp64.builtin.isinf_dmat4");
