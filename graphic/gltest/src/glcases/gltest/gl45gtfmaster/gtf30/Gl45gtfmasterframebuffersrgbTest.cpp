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
#include "../Gl45gtfmasterBaseFunc.h"
#include "../ActsGl45gtfmaster0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl45gtfmaster0001TestSuite, TestCase_001322,
    "GTF-GL45.gtf30.GL3Tests.framebuffer_srgb.framebuffer_srgb_initial_state");

static SHRINK_HWTEST_SF(ActsGl45gtfmaster0001TestSuite, TestCase_001323,
    "GTF-GL45.gtf30.GL3Tests.framebuffer_srgb.framebuffer_srgb_default_encoding");

static SHRINK_HWTEST_SF(ActsGl45gtfmaster0001TestSuite, TestCase_001324,
    "GTF-GL45.gtf30.GL3Tests.framebuffer_srgb.framebuffer_srgb_default_encoding_fbo");

static SHRINK_HWTEST_SF(ActsGl45gtfmaster0001TestSuite, TestCase_001325,
    "GTF-GL45.gtf30.GL3Tests.framebuffer_srgb.framebuffer_srgb_api");

static SHRINK_HWTEST_SF(ActsGl45gtfmaster0001TestSuite, TestCase_001326,
    "GTF-GL45.gtf30.GL3Tests.framebuffer_srgb.framebuffer_srgb_draw");
