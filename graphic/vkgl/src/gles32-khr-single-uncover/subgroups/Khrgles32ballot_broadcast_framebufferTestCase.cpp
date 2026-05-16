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
#include "../Khrgles32BaseFunc.h"
#include "../ActsGles32KhrSingleUncover0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000320,
        "KHR-Single-GLES32.subgroups.ballot_broadca",
        "st.framebuffer.subgroupbroadcast_intvertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000321,
        "KHR-Single-GLES32.subgroups.ballot_broadcas",
        "t.framebuffer.subgroupbroadcast_inttess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000322,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.",
        "framebuffer.subgroupbroadcast_inttess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000323,
        "KHR-Single-GLES32.subgroups.ballot_broadcas",
        "t.framebuffer.subgroupbroadcast_intgeometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000324,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcastfirst_intvertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000325,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcastfirst_inttess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000326,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fr",
        "amebuffer.subgroupbroadcastfirst_inttess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000327,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.",
        "framebuffer.subgroupbroadcastfirst_intgeometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000328,
        "KHR-Single-GLES32.subgroups.ballot_broadcas",
        "t.framebuffer.subgroupbroadcast_ivec2vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000329,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_ivec2tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000330,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcast_ivec2tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000331,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_ivec2geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000332,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.",
        "framebuffer.subgroupbroadcastfirst_ivec2vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000333,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fr",
        "amebuffer.subgroupbroadcastfirst_ivec2tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000334,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fra",
        "mebuffer.subgroupbroadcastfirst_ivec2tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000335,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcastfirst_ivec2geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000336,
        "KHR-Single-GLES32.subgroups.ballot_broadcas",
        "t.framebuffer.subgroupbroadcast_ivec3vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000337,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_ivec3tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000338,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcast_ivec3tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000339,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_ivec3geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000340,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.",
        "framebuffer.subgroupbroadcastfirst_ivec3vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000341,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fr",
        "amebuffer.subgroupbroadcastfirst_ivec3tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000342,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fra",
        "mebuffer.subgroupbroadcastfirst_ivec3tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000343,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcastfirst_ivec3geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000344,
        "KHR-Single-GLES32.subgroups.ballot_broadcas",
        "t.framebuffer.subgroupbroadcast_ivec4vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000345,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_ivec4tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000346,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcast_ivec4tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000347,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_ivec4geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000348,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.",
        "framebuffer.subgroupbroadcastfirst_ivec4vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000349,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fr",
        "amebuffer.subgroupbroadcastfirst_ivec4tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000350,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fra",
        "mebuffer.subgroupbroadcastfirst_ivec4tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000351,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcastfirst_ivec4geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000352,
        "KHR-Single-GLES32.subgroups.ballot_broadca",
        "st.framebuffer.subgroupbroadcast_uintvertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000353,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_uinttess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000354,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.",
        "framebuffer.subgroupbroadcast_uinttess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000355,
        "KHR-Single-GLES32.subgroups.ballot_broadcas",
        "t.framebuffer.subgroupbroadcast_uintgeometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000356,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.",
        "framebuffer.subgroupbroadcastfirst_uintvertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000357,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcastfirst_uinttess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000358,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fra",
        "mebuffer.subgroupbroadcastfirst_uinttess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000359,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcastfirst_uintgeometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000360,
        "KHR-Single-GLES32.subgroups.ballot_broadcas",
        "t.framebuffer.subgroupbroadcast_uvec2vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000361,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_uvec2tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000362,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcast_uvec2tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000363,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_uvec2geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000364,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.",
        "framebuffer.subgroupbroadcastfirst_uvec2vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000365,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fr",
        "amebuffer.subgroupbroadcastfirst_uvec2tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000366,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fra",
        "mebuffer.subgroupbroadcastfirst_uvec2tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000367,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcastfirst_uvec2geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000368,
        "KHR-Single-GLES32.subgroups.ballot_broadcas",
        "t.framebuffer.subgroupbroadcast_uvec3vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000369,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_uvec3tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000370,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcast_uvec3tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000371,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_uvec3geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000372,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.",
        "framebuffer.subgroupbroadcastfirst_uvec3vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000373,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fr",
        "amebuffer.subgroupbroadcastfirst_uvec3tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000374,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fra",
        "mebuffer.subgroupbroadcastfirst_uvec3tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000375,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcastfirst_uvec3geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000376,
        "KHR-Single-GLES32.subgroups.ballot_broadcas",
        "t.framebuffer.subgroupbroadcast_uvec4vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000377,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_uvec4tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000378,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcast_uvec4tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000379,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_uvec4geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000380,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.",
        "framebuffer.subgroupbroadcastfirst_uvec4vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000381,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fr",
        "amebuffer.subgroupbroadcastfirst_uvec4tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000382,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fra",
        "mebuffer.subgroupbroadcastfirst_uvec4tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000383,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcastfirst_uvec4geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000384,
        "KHR-Single-GLES32.subgroups.ballot_broadcas",
        "t.framebuffer.subgroupbroadcast_floatvertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000385,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_floattess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000386,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcast_floattess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000387,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_floatgeometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000388,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.",
        "framebuffer.subgroupbroadcastfirst_floatvertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000389,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fr",
        "amebuffer.subgroupbroadcastfirst_floattess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000390,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fra",
        "mebuffer.subgroupbroadcastfirst_floattess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000391,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcastfirst_floatgeometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000392,
        "KHR-Single-GLES32.subgroups.ballot_broadca",
        "st.framebuffer.subgroupbroadcast_vec2vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000393,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_vec2tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000394,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.",
        "framebuffer.subgroupbroadcast_vec2tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000395,
        "KHR-Single-GLES32.subgroups.ballot_broadcas",
        "t.framebuffer.subgroupbroadcast_vec2geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000396,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.",
        "framebuffer.subgroupbroadcastfirst_vec2vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000397,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcastfirst_vec2tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000398,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fra",
        "mebuffer.subgroupbroadcastfirst_vec2tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000399,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcastfirst_vec2geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000400,
        "KHR-Single-GLES32.subgroups.ballot_broadca",
        "st.framebuffer.subgroupbroadcast_vec3vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000401,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_vec3tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000402,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.",
        "framebuffer.subgroupbroadcast_vec3tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000403,
        "KHR-Single-GLES32.subgroups.ballot_broadcas",
        "t.framebuffer.subgroupbroadcast_vec3geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000404,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.",
        "framebuffer.subgroupbroadcastfirst_vec3vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000405,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcastfirst_vec3tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000406,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fra",
        "mebuffer.subgroupbroadcastfirst_vec3tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000407,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcastfirst_vec3geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000408,
        "KHR-Single-GLES32.subgroups.ballot_broadca",
        "st.framebuffer.subgroupbroadcast_vec4vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000409,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_vec4tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000410,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.",
        "framebuffer.subgroupbroadcast_vec4tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000411,
        "KHR-Single-GLES32.subgroups.ballot_broadcas",
        "t.framebuffer.subgroupbroadcast_vec4geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000412,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.",
        "framebuffer.subgroupbroadcastfirst_vec4vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000413,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcastfirst_vec4tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000414,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fra",
        "mebuffer.subgroupbroadcastfirst_vec4tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000415,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcastfirst_vec4geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000416,
        "KHR-Single-GLES32.subgroups.ballot_broadcas",
        "t.framebuffer.subgroupbroadcast_doublevertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000417,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.",
        "framebuffer.subgroupbroadcast_doubletess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000418,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcast_doubletess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000419,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_doublegeometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000420,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcastfirst_doublevertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000421,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fr",
        "amebuffer.subgroupbroadcastfirst_doubletess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000422,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fram",
        "ebuffer.subgroupbroadcastfirst_doubletess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000423,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fr",
        "amebuffer.subgroupbroadcastfirst_doublegeometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000424,
        "KHR-Single-GLES32.subgroups.ballot_broadcas",
        "t.framebuffer.subgroupbroadcast_dvec2vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000425,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_dvec2tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000426,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcast_dvec2tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000427,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_dvec2geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000428,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.",
        "framebuffer.subgroupbroadcastfirst_dvec2vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000429,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fr",
        "amebuffer.subgroupbroadcastfirst_dvec2tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000430,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fra",
        "mebuffer.subgroupbroadcastfirst_dvec2tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000431,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcastfirst_dvec2geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000432,
        "KHR-Single-GLES32.subgroups.ballot_broadcas",
        "t.framebuffer.subgroupbroadcast_dvec3vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000433,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_dvec3tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000434,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcast_dvec3tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000435,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_dvec3geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000436,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.",
        "framebuffer.subgroupbroadcastfirst_dvec3vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000437,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fr",
        "amebuffer.subgroupbroadcastfirst_dvec3tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000438,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fra",
        "mebuffer.subgroupbroadcastfirst_dvec3tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000439,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcastfirst_dvec3geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000440,
        "KHR-Single-GLES32.subgroups.ballot_broadcas",
        "t.framebuffer.subgroupbroadcast_dvec4vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000441,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_dvec4tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000442,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcast_dvec4tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000443,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_dvec4geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000444,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.",
        "framebuffer.subgroupbroadcastfirst_dvec4vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000445,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fr",
        "amebuffer.subgroupbroadcastfirst_dvec4tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000446,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fra",
        "mebuffer.subgroupbroadcastfirst_dvec4tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000447,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcastfirst_dvec4geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000448,
        "KHR-Single-GLES32.subgroups.ballot_broadca",
        "st.framebuffer.subgroupbroadcast_boolvertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000449,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_booltess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000450,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.",
        "framebuffer.subgroupbroadcast_booltess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000451,
        "KHR-Single-GLES32.subgroups.ballot_broadcas",
        "t.framebuffer.subgroupbroadcast_boolgeometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000452,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.",
        "framebuffer.subgroupbroadcastfirst_boolvertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000453,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcastfirst_booltess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000454,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fra",
        "mebuffer.subgroupbroadcastfirst_booltess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000455,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcastfirst_boolgeometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000456,
        "KHR-Single-GLES32.subgroups.ballot_broadcas",
        "t.framebuffer.subgroupbroadcast_bvec2vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000457,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_bvec2tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000458,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcast_bvec2tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000459,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_bvec2geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000460,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.",
        "framebuffer.subgroupbroadcastfirst_bvec2vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000461,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fr",
        "amebuffer.subgroupbroadcastfirst_bvec2tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000462,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fra",
        "mebuffer.subgroupbroadcastfirst_bvec2tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000463,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcastfirst_bvec2geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000464,
        "KHR-Single-GLES32.subgroups.ballot_broadcas",
        "t.framebuffer.subgroupbroadcast_bvec3vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000465,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_bvec3tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000466,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcast_bvec3tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000467,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_bvec3geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000468,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.",
        "framebuffer.subgroupbroadcastfirst_bvec3vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000469,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fr",
        "amebuffer.subgroupbroadcastfirst_bvec3tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000470,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fra",
        "mebuffer.subgroupbroadcastfirst_bvec3tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000471,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcastfirst_bvec3geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000472,
        "KHR-Single-GLES32.subgroups.ballot_broadcas",
        "t.framebuffer.subgroupbroadcast_bvec4vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000473,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_bvec4tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000474,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcast_bvec4tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000475,
        "KHR-Single-GLES32.subgroups.ballot_broadcast",
        ".framebuffer.subgroupbroadcast_bvec4geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000476,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.",
        "framebuffer.subgroupbroadcastfirst_bvec4vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000477,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fr",
        "amebuffer.subgroupbroadcastfirst_bvec4tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000478,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.fra",
        "mebuffer.subgroupbroadcastfirst_bvec4tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000479,
        "KHR-Single-GLES32.subgroups.ballot_broadcast.f",
        "ramebuffer.subgroupbroadcastfirst_bvec4geometry");
