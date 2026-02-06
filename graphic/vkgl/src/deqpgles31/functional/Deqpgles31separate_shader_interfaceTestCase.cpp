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
#include "../ActsDeqpgles310018TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017690,
        "dEQP-GLES31.functional.separate_shader.inter",
        "face.same_name_vertex_smooth_fragment_smooth");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017691,
        "dEQP-GLES31.functional.separate_shader.interf",
        "ace.same_name_vertex_smooth_fragment_centroid");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017692,
        "dEQP-GLES31.functional.separate_shad",
        "er.interface.same_name_vertex_smooth");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017693,
        "dEQP-GLES31.functional.separate_shader.int",
        "erface.same_name_vertex_flat_fragment_flat");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017694,
        "dEQP-GLES31.functional.separate_shader.interf",
        "ace.same_name_vertex_centroid_fragment_smooth");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017695,
        "dEQP-GLES31.functional.separate_shader.interfa",
        "ce.same_name_vertex_centroid_fragment_centroid");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017696,
        "dEQP-GLES31.functional.separate_shade",
        "r.interface.same_name_vertex_centroid");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017697,
        "dEQP-GLES31.functional.separate_shade",
        "r.interface.same_name_fragment_smooth");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017698,
        "dEQP-GLES31.functional.separate_shader",
        ".interface.same_name_fragment_centroid");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017699,
        "dEQP-GLES31.functional.separa",
        "te_shader.interface.same_name");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017700,
        "dEQP-GLES31.functional.separate_shader.interfa",
        "ce.same_location_vertex_smooth_fragment_smooth");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017701,
        "dEQP-GLES31.functional.separate_shader.interfac",
        "e.same_location_vertex_smooth_fragment_centroid");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017702,
        "dEQP-GLES31.functional.separate_shader",
        ".interface.same_location_vertex_smooth");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017703,
        "dEQP-GLES31.functional.separate_shader.inter",
        "face.same_location_vertex_flat_fragment_flat");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017704,
        "dEQP-GLES31.functional.separate_shader.interfac",
        "e.same_location_vertex_centroid_fragment_smooth");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017705,
        "dEQP-GLES31.functional.separate_shader.interface",
        ".same_location_vertex_centroid_fragment_centroid");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017706,
        "dEQP-GLES31.functional.separate_shader.",
        "interface.same_location_vertex_centroid");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017707,
        "dEQP-GLES31.functional.separate_shader.",
        "interface.same_location_fragment_smooth");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017708,
        "dEQP-GLES31.functional.separate_shader.i",
        "nterface.same_location_fragment_centroid");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017709,
        "dEQP-GLES31.functional.separate",
        "_shader.interface.same_location");
