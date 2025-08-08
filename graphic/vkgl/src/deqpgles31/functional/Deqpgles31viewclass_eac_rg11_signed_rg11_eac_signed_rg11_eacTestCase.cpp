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

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033111,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_eac_",
        "rg11.signed_rg11_eac_signed_rg11_eac.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033112,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_eac",
        "_rg11.signed_rg11_eac_signed_rg11_eac.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033113,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_eac",
        "_rg11.signed_rg11_eac_signed_rg11_eac.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033114,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_ea",
        "c_rg11.signed_rg11_eac_signed_rg11_eac.cubemap_to_cubemap");
