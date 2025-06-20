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
#include "../Gl43masterBaseFunc.h"
#include "../ActsGl43master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005863,
    "KHR-GL43.explicit_uniform_location.uniform-loc");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005864,
    "KHR-GL43.explicit_uniform_location.uniform-loc-nondecimal");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005865,
    "KHR-GL43.explicit_uniform_location.uniform-loc-all-stages");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005866,
    "KHR-GL43.explicit_uniform_location.uniform-loc-multiple-uniforms");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005867,
    "KHR-GL43.explicit_uniform_location.uniform-loc-types-mix");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005868,
    "KHR-GL43.explicit_uniform_location.uniform-loc-types-mat");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005869,
    "KHR-GL43.explicit_uniform_location.uniform-loc-types-structs");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005870,
    "KHR-GL43.explicit_uniform_location.uniform-loc-types-samplers");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005871,
    "KHR-GL43.explicit_uniform_location.uniform-loc-arrays-nonspaced");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005872,
    "KHR-GL43.explicit_uniform_location.uniform-loc-arrays-spaced");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005873,
    "KHR-GL43.explicit_uniform_location.uniform-loc-arrays-of-arrays");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005874,
    "KHR-GL43.explicit_uniform_location.uniform-loc-mix-with-implicit");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005875,
    "KHR-GL43.explicit_uniform_location.uniform-loc-mix-with-implicit2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005876,
    "KHR-GL43.explicit_uniform_location.uniform-loc-mix-with-implicit3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005877,
    "KHR-GL43.explicit_uniform_location.uniform-loc-mix-with-implicit-max");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005878,
    "KHR-GL43.explicit_uniform_location.uniform-loc-mix-with-implicit-max-array");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005879,
    "KHR-GL43.explicit_uniform_location.uniform-loc-implicit-in-some-stages");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005880,
    "KHR-GL43.explicit_uniform_location.uniform-loc-implicit-in-some-stages2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005881,
    "KHR-GL43.explicit_uniform_location.uniform-loc-implicit-in-some-stages3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005882,
    "KHR-GL43.explicit_uniform_location.uniform-loc-negative-compile-non-number-literal");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005883,
    "KHR-GL43.explicit_uniform_location.uniform-loc-negative-compile-nonconst-loc");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005884,
    "KHR-GL43.explicit_uniform_location.uniform-loc-negative-link-location-reused1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005885,
    "KHR-GL43.explicit_uniform_location.uniform-loc-negative-link-location-reused2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005886,
    "KHR-GL43.explicit_uniform_location.uniform-loc-negative-link-max-location");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005887,
    "KHR-GL43.explicit_uniform_location.uniform-loc-negative-link-max-num-of-locations");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005888,
    "KHR-GL43.explicit_uniform_location.subroutine-loc");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005889,
    "KHR-GL43.explicit_uniform_location.subroutine-loc-nondecimal");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005890,
    "KHR-GL43.explicit_uniform_location.subroutine-loc-all-stages");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005891,
    "KHR-GL43.explicit_uniform_location.subroutine-loc-arrays");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005892,
    "KHR-GL43.explicit_uniform_location.subroutine-loc-arrays-mix");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005893,
    "KHR-GL43.explicit_uniform_location.subroutine-loc-mix-with-implicit");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005894,
    "KHR-GL43.explicit_uniform_location.subroutine-loc-negative-compilation-non-number-literal");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005895,
    "KHR-GL43.explicit_uniform_location.subroutine-loc-negative-compilation-nonconst-loc");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005896,
    "KHR-GL43.explicit_uniform_location.subroutine-loc-negative-link-location-reused1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005897,
    "KHR-GL43.explicit_uniform_location.subroutine-loc-negative-link-location-max-location");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005898,
    "KHR-GL43.explicit_uniform_location.subroutine-loc-negative-link-max-num-of-locations");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005899,
    "KHR-GL43.explicit_uniform_location.subroutine-index");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005900,
    "KHR-GL43.explicit_uniform_location.subroutine-index-nondecimal");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005901,
    "KHR-GL43.explicit_uniform_location.subroutine-index-loc");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005902,
    "KHR-GL43.explicit_uniform_location.subroutine-index-non-continuous");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005903,
    "KHR-GL43.explicit_uniform_location.subroutine-index-multiple-uniforms");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005904,
    "KHR-GL43.explicit_uniform_location.subroutine-index-all-stages");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005905,
    "KHR-GL43.explicit_uniform_location.subroutine-index-mix-implicit");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005906,
    "KHR-GL43.explicit_uniform_location.subroutine-index-negative-compilation-non-number-literal");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005907,
    "KHR-GL43.explicit_uniform_location.subroutine-index-negative-compilation-nonconst-index");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005908,
    "KHR-GL43.explicit_uniform_location.subroutine-index-negative-link-index-reused");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005909,
    "KHR-GL43.explicit_uniform_location.subroutine-index-negative-link-location-maxindex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005910,
    "KHR-GL43.explicit_uniform_location.subroutine-index-negative-link-max-num-of-indices");
