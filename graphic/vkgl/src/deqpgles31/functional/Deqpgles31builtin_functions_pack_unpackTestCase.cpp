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
#include "../ActsDeqpgles310001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000973,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.pack_unpack.packsnorm4x8_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000974,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.pack_unpack.packsnorm4x8_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000975,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.pack_unpack.packsnorm4x8_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000976,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.pack_unpack.packsnorm4x8_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000977,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.pack_unpack.packsnorm4x8_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000978,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.pack_unpack.packsnorm4x8_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000979,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.pack_unpack.packsnorm4x8_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000980,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.pack_unpack.packsnorm4x8_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000981,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.pack_unpack.packsnorm4x8_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000982,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.pack_unpack.packsnorm4x8_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000983,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.pack_unpack.packsnorm4x8_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000984,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.pack_unpack.packsnorm4x8_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000985,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.pack_unpack.packsnorm4x8_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000986,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.pack_unpack.packsnorm4x8_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000987,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.pack_unpack.packsnorm4x8_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000988,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.pack_unpack.packsnorm4x8_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000989,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.pack_unpack.packsnorm4x8_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000990,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.pack_unpack.packsnorm4x8_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000991,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.pack_unpack.unpacksnorm4x8_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000992,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.pack_unpack.unpacksnorm4x8_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000993,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.pack_unpack.unpacksnorm4x8_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000994,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.pack_unpack.unpacksnorm4x8_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000995,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.pack_unpack.unpacksnorm4x8_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000996,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.pack_unpack.unpacksnorm4x8_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000997,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.pack_unpack.packunorm4x8_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000998,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.pack_unpack.packunorm4x8_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000999,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.pack_unpack.packunorm4x8_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001000,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.pack_unpack.packunorm4x8_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001001,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.pack_unpack.packunorm4x8_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001002,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.pack_unpack.packunorm4x8_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001003,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.pack_unpack.packunorm4x8_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001004,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.pack_unpack.packunorm4x8_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001005,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.pack_unpack.packunorm4x8_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001006,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.pack_unpack.packunorm4x8_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001007,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.pack_unpack.packunorm4x8_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001008,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.pack_unpack.packunorm4x8_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001009,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.pack_unpack.packunorm4x8_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001010,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.pack_unpack.packunorm4x8_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001011,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.pack_unpack.packunorm4x8_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001012,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.pack_unpack.packunorm4x8_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001013,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.pack_unpack.packunorm4x8_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001014,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.pack_unpack.packunorm4x8_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001015,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.pack_unpack.unpackunorm4x8_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001016,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.pack_unpack.unpackunorm4x8_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001017,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.pack_unpack.unpackunorm4x8_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001018,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.pack_unpack.unpackunorm4x8_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001019,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.pack_unpack.unpackunorm4x8_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001020,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.pack_unpack.unpackunorm4x8_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001021,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.pack_unpack.packsnorm2x16_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001022,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.pack_unpack.packsnorm2x16_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001023,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.pack_unpack.packsnorm2x16_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001024,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.pack_unpack.packsnorm2x16_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001025,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.pack_unpack.packsnorm2x16_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001026,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.pack_unpack.packsnorm2x16_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001027,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.pack_unpack.unpacksnorm2x16_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001028,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.pack_unpack.unpacksnorm2x16_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001029,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.pack_unpack.packunorm2x16_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001030,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.pack_unpack.packunorm2x16_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001031,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.pack_unpack.packunorm2x16_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001032,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.pack_unpack.packunorm2x16_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001033,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.pack_unpack.packunorm2x16_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001034,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.pack_unpack.packunorm2x16_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001035,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.pack_unpack.unpackunorm2x16_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001036,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.pack_unpack.unpackunorm2x16_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001037,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.pack_unpack.packhalf2x16_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001038,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.pack_unpack.packhalf2x16_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001039,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.pack_unpack.unpackhalf2x16_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_001040,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.pack_unpack.unpackhalf2x16_compute");
