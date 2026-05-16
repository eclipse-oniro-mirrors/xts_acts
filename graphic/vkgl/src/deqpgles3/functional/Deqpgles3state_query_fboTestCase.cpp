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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30044TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043198,
        "dEQP-GLES3.functional.state_query.fbo",
        ".draw_framebuffer_default_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043199,
        "dEQP-GLES3.functional.state_query.fbo",
        ".read_framebuffer_default_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043200,
        "dEQP-GLES3.functional.state_query",
        ".fbo.framebuffer_attachment_object");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043201,
        "dEQP-GLES3.functional.state_query.fbo",
        ".framebuffer_attachment_texture_level");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043202,
        "dEQP-GLES3.functional.state_query.fbo.fra",
        "mebuffer_attachment_texture_cube_map_face");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043203,
        "dEQP-GLES3.functional.state_query.fbo",
        ".framebuffer_attachment_texture_layer");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043204,
        "dEQP-GLES3.functional.state_query.fbo",
        ".framebuffer_attachment_color_encoding");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043205,
        "dEQP-GLES3.functional.state_query.fbo",
        ".framebuffer_attachment_component_type");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043206,
        "dEQP-GLES3.functional.state_query.fbo",
        ".framebuffer_attachment_x_size_initial");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043207,
        "dEQP-GLES3.functional.state_query.f",
        "bo.framebuffer_attachment_x_size_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043208,
        "dEQP-GLES3.functional.state_query.fbo",
        ".framebuffer_attachment_x_size_texture");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043209,
        "dEQP-GLES3.functional.state_query.fbo.frame",
        "buffer_unspecified_attachment_color_encoding");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043210,
        "dEQP-GLES3.functional.state_query.fbo.frame",
        "buffer_unspecified_attachment_component_type");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043211,
        "dEQP-GLES3.functional.state_query.fbo.fra",
        "mebuffer_unspecified_attachment_x_size_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043212,
        "dEQP-GLES3.functional.state_query.fbo.frame",
        "buffer_unspecified_attachment_x_size_texture");
