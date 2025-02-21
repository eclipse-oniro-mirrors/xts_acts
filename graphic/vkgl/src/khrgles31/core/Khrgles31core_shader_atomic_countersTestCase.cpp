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

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000060,
        "KHR-GLES31.core.shader_atomic_c",
        "ounters.basic-buffer-operations");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000061,
        "KHR-GLES31.core.shader_atomi",
        "c_counters.basic-buffer-state");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000062,
        "KHR-GLES31.core.shader_atomi",
        "c_counters.basic-buffer-bind");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000063,
        "KHR-GLES31.core.shader_atomi",
        "c_counters.basic-program-max");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000064,
        "KHR-GLES31.core.shader_atomic",
        "_counters.basic-program-query");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000065,
        "KHR-GLES31.core.shader_atomi",
        "c_counters.basic-usage-simple");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000066,
        "KHR-GLES31.core.shader_atomic_",
        "counters.basic-usage-no-offset");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000067,
        "KHR-GLES31.core.shader_ato",
        "mic_counters.basic-usage-fs");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000068,
        "KHR-GLES31.core.shader_ato",
        "mic_counters.basic-usage-vs");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000069,
        "KHR-GLES31.core.shader_ato",
        "mic_counters.basic-usage-cs");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000070,
        "KHR-GLES31.core.shader_atomic",
        "_counters.basic-glsl-built-in");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000071,
        "KHR-GLES31.core.shader_atomic_co",
        "unters.advanced-usage-multi-stage");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000072,
        "KHR-GLES31.core.shader_atomic_count",
        "ers.advanced-usage-draw-update-draw");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000073,
        "KHR-GLES31.core.shader_atomic_cou",
        "nters.advanced-usage-many-counters");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000074,
        "KHR-GLES31.core.shader_atomic_counter",
        "s.advanced-usage-multidim-array-medium");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000075,
        "KHR-GLES31.core.shader_atomic_counter",
        "s.advanced-usage-multidim-array-large");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000076,
        "KHR-GLES31.core.shader_atomic_coun",
        "ters.advanced-usage-switch-programs");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000077,
        "KHR-GLES31.core.shader_atomi",
        "c_counters.advanced-usage-ubo");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000078,
        "KHR-GLES31.core.shader_atomic_coun",
        "ters.advanced-usage-many-draw-calls");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000079,
        "KHR-GLES31.core.shader_atomic_count",
        "ers.advanced-usage-many-draw-calls2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000080,
        "KHR-GLES31.core.shader_atomic_coun",
        "ters.advanced-usage-many-dispatches");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000081,
        "KHR-GLES31.core.shader_at",
        "omic_counters.negative-api");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000082,
        "KHR-GLES31.core.shader_ato",
        "mic_counters.negative-glsl");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000083,
        "KHR-GLES31.core.shader_ato",
        "mic_counters.negative-ssbo");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000084,
        "KHR-GLES31.core.shader_at",
        "omic_counters.negative-ubo");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000085,
        "KHR-GLES31.core.shader_atom",
        "ic_counters.negative-uniform");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000086,
        "KHR-GLES31.core.shader_ato",
        "mic_counters.negative-array");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000087,
        "KHR-GLES31.core.shader_atomic",
        "_counters.negative-arithmetic");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000088,
        "KHR-GLES31.core.shader_atomic_",
        "counters.negative-unsized-array");
