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
#include "../ActsDeqpgles310013TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012619,
        "dEQP-GLES31.functional.te",
        "xture.format.buffer.r8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012620,
        "dEQP-GLES31.functional.tex",
        "ture.format.buffer.r8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012621,
        "dEQP-GLES31.functional.tex",
        "ture.format.buffer.r16f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012622,
        "dEQP-GLES31.functional.text",
        "ure.format.buffer.r16f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012623,
        "dEQP-GLES31.functional.tex",
        "ture.format.buffer.r32f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012624,
        "dEQP-GLES31.functional.text",
        "ure.format.buffer.r32f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012625,
        "dEQP-GLES31.functional.tex",
        "ture.format.buffer.r8i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012626,
        "dEQP-GLES31.functional.tex",
        "ture.format.buffer.r8i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012627,
        "dEQP-GLES31.functional.tex",
        "ture.format.buffer.r16i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012628,
        "dEQP-GLES31.functional.text",
        "ure.format.buffer.r16i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012629,
        "dEQP-GLES31.functional.tex",
        "ture.format.buffer.r32i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012630,
        "dEQP-GLES31.functional.text",
        "ure.format.buffer.r32i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012631,
        "dEQP-GLES31.functional.tex",
        "ture.format.buffer.r8ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012632,
        "dEQP-GLES31.functional.text",
        "ure.format.buffer.r8ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012633,
        "dEQP-GLES31.functional.text",
        "ure.format.buffer.r16ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012634,
        "dEQP-GLES31.functional.text",
        "ure.format.buffer.r16ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012635,
        "dEQP-GLES31.functional.text",
        "ure.format.buffer.r32ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012636,
        "dEQP-GLES31.functional.text",
        "ure.format.buffer.r32ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012637,
        "dEQP-GLES31.functional.tex",
        "ture.format.buffer.rg8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012638,
        "dEQP-GLES31.functional.tex",
        "ture.format.buffer.rg8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012639,
        "dEQP-GLES31.functional.text",
        "ure.format.buffer.rg16f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012640,
        "dEQP-GLES31.functional.text",
        "ure.format.buffer.rg16f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012641,
        "dEQP-GLES31.functional.text",
        "ure.format.buffer.rg32f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012642,
        "dEQP-GLES31.functional.text",
        "ure.format.buffer.rg32f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012643,
        "dEQP-GLES31.functional.tex",
        "ture.format.buffer.rg8i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012644,
        "dEQP-GLES31.functional.text",
        "ure.format.buffer.rg8i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012645,
        "dEQP-GLES31.functional.text",
        "ure.format.buffer.rg16i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012646,
        "dEQP-GLES31.functional.text",
        "ure.format.buffer.rg16i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012647,
        "dEQP-GLES31.functional.text",
        "ure.format.buffer.rg32i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012648,
        "dEQP-GLES31.functional.text",
        "ure.format.buffer.rg32i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012649,
        "dEQP-GLES31.functional.text",
        "ure.format.buffer.rg8ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012650,
        "dEQP-GLES31.functional.text",
        "ure.format.buffer.rg8ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012651,
        "dEQP-GLES31.functional.text",
        "ure.format.buffer.rg16ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012652,
        "dEQP-GLES31.functional.textu",
        "re.format.buffer.rg16ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012653,
        "dEQP-GLES31.functional.text",
        "ure.format.buffer.rg32ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012654,
        "dEQP-GLES31.functional.textu",
        "re.format.buffer.rg32ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012655,
        "dEQP-GLES31.functional.text",
        "ure.format.buffer.rgba8_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012656,
        "dEQP-GLES31.functional.text",
        "ure.format.buffer.rgba8_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012657,
        "dEQP-GLES31.functional.textu",
        "re.format.buffer.rgba16f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012658,
        "dEQP-GLES31.functional.textu",
        "re.format.buffer.rgba16f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012659,
        "dEQP-GLES31.functional.textu",
        "re.format.buffer.rgba32f_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012660,
        "dEQP-GLES31.functional.textu",
        "re.format.buffer.rgba32f_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012661,
        "dEQP-GLES31.functional.text",
        "ure.format.buffer.rgba8i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012662,
        "dEQP-GLES31.functional.textu",
        "re.format.buffer.rgba8i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012663,
        "dEQP-GLES31.functional.textu",
        "re.format.buffer.rgba16i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012664,
        "dEQP-GLES31.functional.textu",
        "re.format.buffer.rgba16i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012665,
        "dEQP-GLES31.functional.textu",
        "re.format.buffer.rgba32i_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012666,
        "dEQP-GLES31.functional.textu",
        "re.format.buffer.rgba32i_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012667,
        "dEQP-GLES31.functional.textu",
        "re.format.buffer.rgba8ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012668,
        "dEQP-GLES31.functional.textu",
        "re.format.buffer.rgba8ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012669,
        "dEQP-GLES31.functional.textu",
        "re.format.buffer.rgba16ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012670,
        "dEQP-GLES31.functional.textur",
        "e.format.buffer.rgba16ui_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012671,
        "dEQP-GLES31.functional.textu",
        "re.format.buffer.rgba32ui_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012672,
        "dEQP-GLES31.functional.textur",
        "e.format.buffer.rgba32ui_npot");
