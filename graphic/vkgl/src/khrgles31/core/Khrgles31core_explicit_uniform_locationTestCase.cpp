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
#include "../ActsKhrgles310003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002131,
        "KHR-GLES31.core.explicit_u",
        "niform_location.uniform-loc");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002132,
        "KHR-GLES31.core.explicit_uniform",
        "_location.uniform-loc-nondecimal");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002133,
        "KHR-GLES31.core.explicit_uniform",
        "_location.uniform-loc-all-stages");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002134,
        "KHR-GLES31.core.explicit_uniform_lo",
        "cation.uniform-loc-multiple-uniforms");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002135,
        "KHR-GLES31.core.explicit_unifor",
        "m_location.uniform-loc-types-mix");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002136,
        "KHR-GLES31.core.explicit_unifor",
        "m_location.uniform-loc-types-mat");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002137,
        "KHR-GLES31.core.explicit_uniform_",
        "location.uniform-loc-types-structs");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002138,
        "KHR-GLES31.core.explicit_uniform_l",
        "ocation.uniform-loc-types-samplers");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002139,
        "KHR-GLES31.core.explicit_uniform_lo",
        "cation.uniform-loc-arrays-nonspaced");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002140,
        "KHR-GLES31.core.explicit_uniform_",
        "location.uniform-loc-arrays-spaced");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002141,
        "KHR-GLES31.core.explicit_uniform_lo",
        "cation.uniform-loc-arrays-of-arrays");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002142,
        "KHR-GLES31.core.explicit_uniform_lo",
        "cation.uniform-loc-mix-with-implicit");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002143,
        "KHR-GLES31.core.explicit_uniform_loc",
        "ation.uniform-loc-mix-with-implicit2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002144,
        "KHR-GLES31.core.explicit_uniform_loc",
        "ation.uniform-loc-mix-with-implicit3");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002145,
        "KHR-GLES31.core.explicit_uniform_loca",
        "tion.uniform-loc-mix-with-implicit-max");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002146,
        "KHR-GLES31.core.explicit_uniform_locatio",
        "n.uniform-loc-mix-with-implicit-max-array");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002147,
        "KHR-GLES31.core.explicit_uniform_locat",
        "ion.uniform-loc-implicit-in-some-stages");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002148,
        "KHR-GLES31.core.explicit_uniform_locati",
        "on.uniform-loc-implicit-in-some-stages2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002149,
        "KHR-GLES31.core.explicit_uniform_locati",
        "on.uniform-loc-implicit-in-some-stages3");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002150,
        "KHR-GLES31.core.explicit_uniform_location.un",
        "iform-loc-negative-compile-non-number-literal");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002151,
        "KHR-GLES31.core.explicit_uniform_location",
        ".uniform-loc-negative-compile-nonconst-loc");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002152,
        "KHR-GLES31.core.explicit_uniform_location.",
        "uniform-loc-negative-link-location-reused1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002153,
        "KHR-GLES31.core.explicit_uniform_location.",
        "uniform-loc-negative-link-location-reused2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002154,
        "KHR-GLES31.core.explicit_uniform_locatio",
        "n.uniform-loc-negative-link-max-location");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002155,
        "KHR-GLES31.core.explicit_uniform_location.un",
        "iform-loc-negative-link-max-num-of-locations");
