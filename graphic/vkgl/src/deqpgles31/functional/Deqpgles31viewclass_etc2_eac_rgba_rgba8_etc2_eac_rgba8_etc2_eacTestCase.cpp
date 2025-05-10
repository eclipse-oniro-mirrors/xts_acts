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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310034TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033147,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_etc2_",
        "eac_rgba.rgba8_etc2_eac_rgba8_etc2_eac.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033148,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_etc2",
        "_eac_rgba.rgba8_etc2_eac_rgba8_etc2_eac.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033149,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_etc2",
        "_eac_rgba.rgba8_etc2_eac_rgba8_etc2_eac.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033150,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_etc",
        "2_eac_rgba.rgba8_etc2_eac_rgba8_etc2_eac.cubemap_to_cubemap");
