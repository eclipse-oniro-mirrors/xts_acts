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
#include "../KhrglesextBaseFunc.h"
#include "../ActsKhrglesext0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000129,
        "KHR-GLESEXT.geometry_shad",
        "er.layered_fbo.layered_fbo");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000130,
        "KHR-GLESEXT.geometry_shader.lay",
        "ered_fbo.layered_fbo_attachments");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000131,
        "KHR-GLESEXT.geometry_shader.laye",
        "red_fbo.fb_texture_invalid_target");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000132,
        "KHR-GLESEXT.geometry_shader.layered_",
        "fbo.fb_texture_no_fbo_bound_to_target");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000133,
        "KHR-GLESEXT.geometry_shader.layere",
        "d_fbo.fb_texture_invalid_attachment");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000134,
        "KHR-GLESEXT.geometry_shader.laye",
        "red_fbo.fb_texture_invalid_value");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000135,
        "KHR-GLESEXT.geometry_shader.layered",
        "_fbo.fb_texture_invalid_level_number");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000136,
        "KHR-GLESEXT.geometry_shader.layered_fbo.fb",
        "_texture_argument_refers_to_buffer_texture");
