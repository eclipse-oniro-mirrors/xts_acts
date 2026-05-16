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

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000025,
        "KHR-Single-GLES32.subgroups.builtin_mas",
        "k_var.framebuffer.subgroupeqmask_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000026,
        "KHR-Single-GLES32.subgroups.builtin_mask",
        "_var.framebuffer.subgroupeqmask_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000027,
        "KHR-Single-GLES32.subgroups.builtin_mask_v",
        "ar.framebuffer.subgroupeqmask_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000028,
        "KHR-Single-GLES32.subgroups.builtin_mask",
        "_var.framebuffer.subgroupeqmask_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000029,
        "KHR-Single-GLES32.subgroups.builtin_mas",
        "k_var.framebuffer.subgroupgemask_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000030,
        "KHR-Single-GLES32.subgroups.builtin_mask",
        "_var.framebuffer.subgroupgemask_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000031,
        "KHR-Single-GLES32.subgroups.builtin_mask_v",
        "ar.framebuffer.subgroupgemask_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000032,
        "KHR-Single-GLES32.subgroups.builtin_mask",
        "_var.framebuffer.subgroupgemask_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000033,
        "KHR-Single-GLES32.subgroups.builtin_mas",
        "k_var.framebuffer.subgroupgtmask_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000034,
        "KHR-Single-GLES32.subgroups.builtin_mask",
        "_var.framebuffer.subgroupgtmask_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000035,
        "KHR-Single-GLES32.subgroups.builtin_mask_v",
        "ar.framebuffer.subgroupgtmask_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000036,
        "KHR-Single-GLES32.subgroups.builtin_mask",
        "_var.framebuffer.subgroupgtmask_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000037,
        "KHR-Single-GLES32.subgroups.builtin_mas",
        "k_var.framebuffer.subgrouplemask_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000038,
        "KHR-Single-GLES32.subgroups.builtin_mask",
        "_var.framebuffer.subgrouplemask_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000039,
        "KHR-Single-GLES32.subgroups.builtin_mask_v",
        "ar.framebuffer.subgrouplemask_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000040,
        "KHR-Single-GLES32.subgroups.builtin_mask",
        "_var.framebuffer.subgrouplemask_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000041,
        "KHR-Single-GLES32.subgroups.builtin_mas",
        "k_var.framebuffer.subgroupltmask_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000042,
        "KHR-Single-GLES32.subgroups.builtin_mask",
        "_var.framebuffer.subgroupltmask_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000043,
        "KHR-Single-GLES32.subgroups.builtin_mask_v",
        "ar.framebuffer.subgroupltmask_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000044,
        "KHR-Single-GLES32.subgroups.builtin_mask",
        "_var.framebuffer.subgroupltmask_geometry");
