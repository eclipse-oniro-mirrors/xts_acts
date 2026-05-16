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

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000056,
        "KHR-Single-GLES32.subgroups.basic",
        ".framebuffer.subgroupelect_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000057,
        "KHR-Single-GLES32.subgroups.basic.",
        "framebuffer.subgroupelect_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000058,
        "KHR-Single-GLES32.subgroups.basic.fr",
        "amebuffer.subgroupelect_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000059,
        "KHR-Single-GLES32.subgroups.basic.",
        "framebuffer.subgroupelect_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000060,
        "KHR-Single-GLES32.subgroups.basic.f",
        "ramebuffer.subgroupbarrier_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000061,
        "KHR-Single-GLES32.subgroups.basic.",
        "framebuffer.subgroupbarrier_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000062,
        "KHR-Single-GLES32.subgroups.basic.f",
        "ramebuffer.subgroupbarrier_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000063,
        "KHR-Single-GLES32.subgroups.basic.fra",
        "mebuffer.subgroupbarrier_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000064,
        "KHR-Single-GLES32.subgroups.basic.f",
        "ramebuffer.subgroupbarrier_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000065,
        "KHR-Single-GLES32.subgroups.basic.fram",
        "ebuffer.subgroupmemorybarrier_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000066,
        "KHR-Single-GLES32.subgroups.basic.fra",
        "mebuffer.subgroupmemorybarrier_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000067,
        "KHR-Single-GLES32.subgroups.basic.fram",
        "ebuffer.subgroupmemorybarrier_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000068,
        "KHR-Single-GLES32.subgroups.basic.frameb",
        "uffer.subgroupmemorybarrier_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000069,
        "KHR-Single-GLES32.subgroups.basic.fram",
        "ebuffer.subgroupmemorybarrier_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000070,
        "KHR-Single-GLES32.subgroups.basic.framebu",
        "ffer.subgroupmemorybarrierbuffer_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000071,
        "KHR-Single-GLES32.subgroups.basic.frameb",
        "uffer.subgroupmemorybarrierbuffer_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000072,
        "KHR-Single-GLES32.subgroups.basic.framebu",
        "ffer.subgroupmemorybarrierbuffer_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000073,
        "KHR-Single-GLES32.subgroups.basic.framebuff",
        "er.subgroupmemorybarrierbuffer_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000074,
        "KHR-Single-GLES32.subgroups.basic.framebu",
        "ffer.subgroupmemorybarrierbuffer_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000075,
        "KHR-Single-GLES32.subgroups.basic.frameb",
        "uffer.subgroupmemorybarrierimage_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000076,
        "KHR-Single-GLES32.subgroups.basic.frame",
        "buffer.subgroupmemorybarrierimage_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000077,
        "KHR-Single-GLES32.subgroups.basic.framebu",
        "ffer.subgroupmemorybarrierimage_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000078,
        "KHR-Single-GLES32.subgroups.basic.framebuf",
        "fer.subgroupmemorybarrierimage_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000079,
        "KHR-Single-GLES32.subgroups.basic.frameb",
        "uffer.subgroupmemorybarrierimage_geometry");
