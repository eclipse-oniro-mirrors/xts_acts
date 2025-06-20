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
#include "../Gl42gtfmasterBaseFunc.h"
#include "../ActsGl42gtfmaster0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001598,
    "GTF-GL42.gtf33.GL3Tests.explicit_attrib_location.explicit_attrib_location_basic");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001599,
    "GTF-GL42.gtf33.GL3Tests.explicit_attrib_location.explicit_attrib_location_pipeline");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001600,
    "GTF-GL42.gtf33.GL3Tests.explicit_attrib_location.explicit_attrib_location_integer_constants");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001601,
    "GTF-GL42.gtf33.GL3Tests.explicit_attrib_location.explicit_attrib_location_layout_priority");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001602,
    "GTF-GL42.gtf33.GL3Tests.explicit_attrib_location.explicit_attrib_location_input_types");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001603,
    "GTF-GL42.gtf33.GL3Tests.explicit_attrib_location.explicit_attrib_location_input_types_double");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001604,
    "GTF-GL42.gtf33.GL3Tests.explicit_attrib_location.explicit_attrib_location_output_types");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001605,
    "GTF-GL42.gtf33.GL3Tests.explicit_attrib_location.explicit_attrib_location_room");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001606,
    "GTF-GL42.gtf33.GL3Tests.explicit_attrib_location.explicit_attrib_location_multiple_shaders");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001607,
    "GTF-GL42.gtf33.GL3Tests.explicit_attrib_location.explicit_attrib_location_one_shader");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001608,
    "GTF-GL42.gtf33.GL3Tests.explicit_attrib_location.explicit_attrib_location_vertex_input_aliased");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001609,
    "GTF-GL42.gtf33.GL3Tests.explicit_attrib_location.explicit_attrib_location_restore_locations");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001610,
    "GTF-GL42.gtf33.GL3Tests.explicit_attrib_location.explicit_attrib_location_greater_than_max");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001611,
    "GTF-GL42.gtf33.GL3Tests.explicit_attrib_location.explicit_attrib_location_array_max");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001612,
    "GTF-GL42.gtf33.GL3Tests.explicit_attrib_location.explicit_attrib_location_array_max_double");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001613,
    "GTF-GL42.gtf33.GL3Tests.explicit_attrib_location.explicit_attrib_location_not_integer");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001614,
    "GTF-GL42.gtf33.GL3Tests.explicit_attrib_location.explicit_attrib_location_overlapping_ranges");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001615,
    "GTF-GL42.gtf33.GL3Tests.explicit_attrib_location.explicit_attrib_location_not_consistent_locations");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001616,
    "GTF-GL42.gtf33.GL3Tests.explicit_attrib_location.explicit_attrib_location_no_room");
