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
#include "../ActsKhrgles310002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001964,
        "KHR-GLES31.core.comput",
        "e_shader.simple-compute");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001965,
        "KHR-GLES31.core.comput",
        "e_shader.one-work-group");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001966,
        "KHR-GLES31.core.compu",
        "te_shader.resource-ubo");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001967,
        "KHR-GLES31.core.compute",
        "_shader.resource-texture");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001968,
        "KHR-GLES31.core.comput",
        "e_shader.resource-image");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001969,
        "KHR-GLES31.core.compute_sha",
        "der.resource-atomic-counter");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001970,
        "KHR-GLES31.core.compute",
        "_shader.resource-uniform");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001971,
        "KHR-GLES31.core.compute_",
        "shader.built-in-variables");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001972,
        "KHR-GLES31.core.c",
        "ompute_shader.max");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001973,
        "KHR-GLES31.core.compute",
        "_shader.work-group-size");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001974,
        "KHR-GLES31.core.compute",
        "_shader.build-separable");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001975,
        "KHR-GLES31.core.comput",
        "e_shader.shared-simple");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001976,
        "KHR-GLES31.core.comput",
        "e_shader.shared-struct");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001977,
        "KHR-GLES31.core.compute_",
        "shader.dispatch-indirect");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001978,
        "KHR-GLES31.core.compute_s",
        "hader.sso-compute-pipeline");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001979,
        "KHR-GLES31.core.comp",
        "ute_shader.sso-case2");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001980,
        "KHR-GLES31.core.comp",
        "ute_shader.sso-case3");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001981,
        "KHR-GLES31.core.compu",
        "te_shader.atomic-case1");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001982,
        "KHR-GLES31.core.compu",
        "te_shader.atomic-case2");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001983,
        "KHR-GLES31.core.compu",
        "te_shader.atomic-case3");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001984,
        "KHR-GLES31.core.comp",
        "ute_shader.copy-image");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001985,
        "KHR-GLES31.core.compute",
        "_shader.pipeline-pre-vs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001986,
        "KHR-GLES31.core.compute_shad",
        "er.pipeline-gen-draw-commands");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001987,
        "KHR-GLES31.core.compute_sh",
        "ader.pipeline-compute-chain");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001988,
        "KHR-GLES31.core.compute",
        "_shader.pipeline-post-fs");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001989,
        "KHR-GLES31.core.compute_",
        "shader.pipeline-post-xfb");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001990,
        "KHR-GLES31.core.compute",
        "_shader.shared-indexing");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001991,
        "KHR-GLES31.core.comp",
        "ute_shader.shared-max");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001992,
        "KHR-GLES31.core.comput",
        "e_shader.resources-max");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001993,
        "KHR-GLES31.core.compute_sh",
        "ader.work-group-size-usage");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001994,
        "KHR-GLES31.core.compute_sh",
        "ader.api-no-active-program");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001995,
        "KHR-GLES31.core.compute_s",
        "hader.api-work-group-count");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001996,
        "KHR-GLES31.core.compu",
        "te_shader.api-indirect");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001997,
        "KHR-GLES31.core.compu",
        "te_shader.api-program");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001998,
        "KHR-GLES31.core.compute_sha",
        "der.glsl-compile-time-errors");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001999,
        "KHR-GLES31.core.compute_sh",
        "ader.glsl-link-time-errors");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_002000,
        "KHR-GLES31.core.compute_",
        "shader.api-attach-shader");
