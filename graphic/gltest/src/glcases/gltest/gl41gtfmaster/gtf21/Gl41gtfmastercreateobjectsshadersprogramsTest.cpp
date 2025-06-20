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
#include "../Gl41gtfmasterBaseFunc.h"
#include "../ActsGl41gtfmaster0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl41gtfmaster0001TestSuite, TestCase_001073,
    "GTF-GL41.gtf21.GL2Tests.create_objects_shaders_programs.create_program_objects");

static SHRINK_HWTEST_SF(ActsGl41gtfmaster0001TestSuite, TestCase_001074,
    "GTF-GL41.gtf21.GL2Tests.create_objects_shaders_programs.create_vertex_shader_objects");

static SHRINK_HWTEST_SF(ActsGl41gtfmaster0001TestSuite, TestCase_001075,
    "GTF-GL41.gtf21.GL2Tests.create_objects_shaders_programs.create_fragment_shader_objects");

static SHRINK_HWTEST_SF(ActsGl41gtfmaster0001TestSuite, TestCase_001076,
    "GTF-GL41.gtf21.GL2Tests.create_objects_shaders_programs.create_invalid_shader_objects");
