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
#include "../ImageBaseFunc.h"
#include "../ActsImage0020TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsImage0020TS, TC128bitcompressedformatcubemap, "dEQP-VK.image.sample_texture.128_bit_compressed_format_cubemap*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC64bitcompressedformatcubemap, "dEQP-VK.image.sample_texture.64_bit_compressed_format_cubemap*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC64bitcompressedformattwosamplerscubemap, "dEQP-VK.image.sample_texture.64_bit_compressed_format_two_samplers_cubemap*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC128bitcompressedformattwosamplerscubemap, "dEQP-VK.image.sample_texture.128_bit_compressed_format_two_samplers_cubemap*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC64bitcompressedformat, "dEQP-VK.image.sample_texture.64_bit_compressed_format*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC64bitcompressedformattwosamplers, "dEQP-VK.image.sample_texture.64_bit_compressed_format_two_samplers*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC128bitcompressedformat, "dEQP-VK.image.sample_texture.128_bit_compressed_format*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC128bitcompressedformattwosamplers, "dEQP-VK.image.sample_texture.128_bit_compressed_format_two_samplers*");