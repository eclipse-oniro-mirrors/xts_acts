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

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000053,
        "KHR-GLES31.core.texture_storage_multisample.Functio",
        "nalTests.multisampled_fbo_to_singlesampled_fbo_blit");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000054,
        "KHR-GLES31.core.texture_storage_multisample.Funct",
        "ionalTests.blitting_multisampled_depth_attachment");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000055,
        "KHR-GLES31.core.texture_storage_multisample.Functi",
        "onalTests.blitting_multisampled_integer_attachment");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000056,
        "KHR-GLES31.core.texture_storage_multisample.Functi",
        "onalTests.blitting_to_multisampled_fbo_is_forbidden");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000057,
        "KHR-GLES31.core.texture_storage_multisample.FunctionalTests.verif",
        "y_sample_masking_for_non_integer_color_renderable_internalformats");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000058,
        "KHR-GLES31.core.texture_storage_multisample.Fu",
        "nctionalTests.texture_size_in_fragment_shaders");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000059,
        "KHR-GLES31.core.texture_storage_multisample.F",
        "unctionalTests.texture_size_in_vertex_shaders");
