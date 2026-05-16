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
#include "../ActsDeqpgles310025TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024625,
        "dEQP-GLES31.functional.program_inte",
        "rface_query.buffer_variable.random.0");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024626,
        "dEQP-GLES31.functional.program_inte",
        "rface_query.buffer_variable.random.1");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024627,
        "dEQP-GLES31.functional.program_inte",
        "rface_query.buffer_variable.random.2");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024628,
        "dEQP-GLES31.functional.program_inte",
        "rface_query.buffer_variable.random.3");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024629,
        "dEQP-GLES31.functional.program_inte",
        "rface_query.buffer_variable.random.4");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024630,
        "dEQP-GLES31.functional.program_inte",
        "rface_query.buffer_variable.random.5");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024631,
        "dEQP-GLES31.functional.program_inte",
        "rface_query.buffer_variable.random.6");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024632,
        "dEQP-GLES31.functional.program_inte",
        "rface_query.buffer_variable.random.7");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024633,
        "dEQP-GLES31.functional.program_inte",
        "rface_query.buffer_variable.random.8");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024634,
        "dEQP-GLES31.functional.program_inte",
        "rface_query.buffer_variable.random.9");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024635,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.10");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024636,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.11");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024637,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.12");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024638,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.13");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024639,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.14");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024640,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.15");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024641,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.16");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024642,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.17");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024643,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.18");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024644,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.19");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024645,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.20");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024646,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.21");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024647,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.22");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024648,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.23");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024649,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.24");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024650,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.25");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024651,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.26");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024652,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.27");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024653,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.28");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024654,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.29");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024655,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.30");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024656,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.31");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024657,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.32");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024658,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.33");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024659,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.34");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024660,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.35");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024661,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.36");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024662,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.37");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024663,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.38");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024664,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.39");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024665,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.40");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024666,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.41");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024667,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.42");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024668,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.43");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024669,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.44");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024670,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.45");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024671,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.46");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024672,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.47");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024673,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.48");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024674,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.49");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024675,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.50");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024676,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.51");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024677,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.52");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024678,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.53");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024679,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.54");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024680,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.55");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024681,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.56");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024682,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.57");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024683,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.58");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024684,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.59");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024685,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.60");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024686,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.61");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024687,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.62");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024688,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.63");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024689,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.64");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024690,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.65");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024691,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.66");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024692,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.67");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024693,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.68");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024694,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.69");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024695,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.70");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024696,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.71");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024697,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.72");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024698,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.73");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024699,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.74");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024700,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.75");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024701,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.76");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024702,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.77");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024703,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.78");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024704,
        "dEQP-GLES31.functional.program_inter",
        "face_query.buffer_variable.random.79");
