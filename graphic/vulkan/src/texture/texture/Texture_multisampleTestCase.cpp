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
#include "../TextureBaseFunc.h"
#include "../ActsTexture0010TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;
static  SHRINK_HWTEST_F(ActsTexture0010TS, TCAtomicStorageimager32i, "dEQP-VK.texture.multisample.atomic.storage_image_r32i*");
static  SHRINK_HWTEST_F(ActsTexture0010TS, TCAtomicStorageimager32ui, "dEQP-VK.texture.multisample.atomic.storage_image_r32ui*");
static  SHRINK_HWTEST_F(ActsTexture0010TS, TCInvalidsampleindexSamplecount2, "dEQP-VK.texture.multisample.invalid_sample_index.sample_count_2*");
static  SHRINK_HWTEST_F(ActsTexture0010TS, TCInvalidsampleindexSamplecount4, "dEQP-VK.texture.multisample.invalid_sample_index.sample_count_4*");
static  SHRINK_HWTEST_F(ActsTexture0010TS, TCInvalidsampleindexSamplecount8, "dEQP-VK.texture.multisample.invalid_sample_index.sample_count_8*");
static  SHRINK_HWTEST_F(ActsTexture0010TS, TCInvalidsampleindexSamplecount16, "dEQP-VK.texture.multisample.invalid_sample_index.sample_count_16*");
static  SHRINK_HWTEST_F(ActsTexture0010TS, TCInvalidsampleindexSamplecount32, "dEQP-VK.texture.multisample.invalid_sample_index.sample_count_32*");
static  SHRINK_HWTEST_F(ActsTexture0010TS, TCInvalidsampleindexSamplecount64, "dEQP-VK.texture.multisample.invalid_sample_index.sample_count_64*");
