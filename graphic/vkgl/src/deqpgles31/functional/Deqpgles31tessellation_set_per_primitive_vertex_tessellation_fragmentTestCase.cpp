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
#include "../ActsDeqpgles310026TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025006,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.tessellatio",
        "n_set_per_primitive.vertex_tessellation_fragment.default_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025007,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.tes",
        "sellation_set_per_primitive.vertex_tessellation_fragment.fbo");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025046,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.tessellation_",
        "set_per_primitive.vertex_tessellation_fragment.default_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025047,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.tesse",
        "llation_set_per_primitive.vertex_tessellation_fragment.fbo");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025086,
        "dEQP-GLES31.functional.primitive_bounding_box.points.tessellation_",
        "set_per_primitive.vertex_tessellation_fragment.default_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025087,
        "dEQP-GLES31.functional.primitive_bounding_box.points.tesse",
        "llation_set_per_primitive.vertex_tessellation_fragment.fbo");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025126,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.tessellatio",
        "n_set_per_primitive.vertex_tessellation_fragment.default_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025127,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.tes",
        "sellation_set_per_primitive.vertex_tessellation_fragment.fbo");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025166,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.tessellati",
        "on_set_per_primitive.vertex_tessellation_fragment.default_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025167,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.te",
        "ssellation_set_per_primitive.vertex_tessellation_fragment.fbo");
