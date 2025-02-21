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
#include "../ActsImage0017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsImage0017TS, TCR32g32b32a32uintReadMatchedsignNormalprecision, "dEQP-VK.image.extend_operands_spirv1p4.r32g32b32a32_uint.read.matched_sign.normal_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR16g16b16a16uintReadMatchedsignRelaxedprecision, "dEQP-VK.image.extend_operands_spirv1p4.r16g16b16a16_uint.read.matched_sign.relaxed_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR16g16b16a16uintWriteMatchedsignNormalprecision, "dEQP-VK.image.extend_operands_spirv1p4.r16g16b16a16_uint.write.matched_sign.normal_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR8g8b8a8uintReadMatchedsignRelaxedprecision, "dEQP-VK.image.extend_operands_spirv1p4.r8g8b8a8_uint.read.matched_sign.relaxed_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR8g8b8a8uintWriteMatchedsignNormalprecision, "dEQP-VK.image.extend_operands_spirv1p4.r8g8b8a8_uint.write.matched_sign.normal_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR16g16b16a16sintReadMatchedsignRelaxedprecision, "dEQP-VK.image.extend_operands_spirv1p4.r16g16b16a16_sint.read.matched_sign.relaxed_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR16g16b16a16sintReadMismatchedsignNormalprecision, "dEQP-VK.image.extend_operands_spirv1p4.r16g16b16a16_sint.read.mismatched_sign.normal_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR16g16b16a16sintReadMismatchedsignRelaxedprecision, "dEQP-VK.image.extend_operands_spirv1p4.r16g16b16a16_sint.read.mismatched_sign.relaxed_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR16g16b16a16sintWriteMatchedsignNormalprecision, "dEQP-VK.image.extend_operands_spirv1p4.r16g16b16a16_sint.write.matched_sign.normal_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR8g8b8a8sintReadMatchedsignRelaxedprecision, "dEQP-VK.image.extend_operands_spirv1p4.r8g8b8a8_sint.read.matched_sign.relaxed_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR8g8b8a8sintReadMismatchedsignNormalprecision, "dEQP-VK.image.extend_operands_spirv1p4.r8g8b8a8_sint.read.mismatched_sign.normal_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR8g8b8a8sintReadMismatchedsignRelaxedprecision, "dEQP-VK.image.extend_operands_spirv1p4.r8g8b8a8_sint.read.mismatched_sign.relaxed_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR8g8b8a8sintWriteMatchedsignNormalprecision, "dEQP-VK.image.extend_operands_spirv1p4.r8g8b8a8_sint.write.matched_sign.normal_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCA2b10g10r10uintpack32ReadMatchedsignRelaxedprecision, "dEQP-VK.image.extend_operands_spirv1p4.a2b10g10r10_uint_pack32.read.matched_sign.relaxed_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCA2b10g10r10uintpack32WriteMatchedsignNormalprecision, "dEQP-VK.image.extend_operands_spirv1p4.a2b10g10r10_uint_pack32.write.matched_sign.normal_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR16g16uintReadMatchedsignRelaxedprecision, "dEQP-VK.image.extend_operands_spirv1p4.r16g16_uint.read.matched_sign.relaxed_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR16g16uintWriteMatchedsignNormalprecision, "dEQP-VK.image.extend_operands_spirv1p4.r16g16_uint.write.matched_sign.normal_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR16uintReadMatchedsignRelaxedprecision, "dEQP-VK.image.extend_operands_spirv1p4.r16_uint.read.matched_sign.relaxed_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR16uintWriteMatchedsignNormalprecision, "dEQP-VK.image.extend_operands_spirv1p4.r16_uint.write.matched_sign.normal_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR8g8uintReadMatchedsignRelaxedprecision, "dEQP-VK.image.extend_operands_spirv1p4.r8g8_uint.read.matched_sign.relaxed_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR8g8uintWriteMatchedsignNormalprecision, "dEQP-VK.image.extend_operands_spirv1p4.r8g8_uint.write.matched_sign.normal_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR8uintReadMatchedsignRelaxedprecision, "dEQP-VK.image.extend_operands_spirv1p4.r8_uint.read.matched_sign.relaxed_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR8uintWriteMatchedsignNormalprecision, "dEQP-VK.image.extend_operands_spirv1p4.r8_uint.write.matched_sign.normal_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR16g16sintReadMatchedsignRelaxedprecision, "dEQP-VK.image.extend_operands_spirv1p4.r16g16_sint.read.matched_sign.relaxed_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR16g16sintReadMismatchedsignNormalprecision, "dEQP-VK.image.extend_operands_spirv1p4.r16g16_sint.read.mismatched_sign.normal_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR16g16sintReadMismatchedsignRelaxedprecision, "dEQP-VK.image.extend_operands_spirv1p4.r16g16_sint.read.mismatched_sign.relaxed_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR16g16sintWriteMatchedsignNormalprecision, "dEQP-VK.image.extend_operands_spirv1p4.r16g16_sint.write.matched_sign.normal_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR16sintReadMatchedsignRelaxedprecision, "dEQP-VK.image.extend_operands_spirv1p4.r16_sint.read.matched_sign.relaxed_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR16sintReadMismatchedsignNormalprecision, "dEQP-VK.image.extend_operands_spirv1p4.r16_sint.read.mismatched_sign.normal_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR16sintReadMismatchedsignRelaxedprecision, "dEQP-VK.image.extend_operands_spirv1p4.r16_sint.read.mismatched_sign.relaxed_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR16sintWriteMatchedsignNormalprecision, "dEQP-VK.image.extend_operands_spirv1p4.r16_sint.write.matched_sign.normal_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR8g8sintReadMatchedsignRelaxedprecision, "dEQP-VK.image.extend_operands_spirv1p4.r8g8_sint.read.matched_sign.relaxed_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR8g8sintReadMismatchedsignNormalprecision, "dEQP-VK.image.extend_operands_spirv1p4.r8g8_sint.read.mismatched_sign.normal_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR8g8sintReadMismatchedsignRelaxedprecision, "dEQP-VK.image.extend_operands_spirv1p4.r8g8_sint.read.mismatched_sign.relaxed_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR8g8sintWriteMatchedsignNormalprecision, "dEQP-VK.image.extend_operands_spirv1p4.r8g8_sint.write.matched_sign.normal_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR8sintReadMatchedsignRelaxedprecision, "dEQP-VK.image.extend_operands_spirv1p4.r8_sint.read.matched_sign.relaxed_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR8sintReadMismatchedsignNormalprecision, "dEQP-VK.image.extend_operands_spirv1p4.r8_sint.read.mismatched_sign.normal_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR8sintReadMismatchedsignRelaxedprecision, "dEQP-VK.image.extend_operands_spirv1p4.r8_sint.read.mismatched_sign.relaxed_precision*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCR8sintWriteMatchedsignNormalprecision, "dEQP-VK.image.extend_operands_spirv1p4.r8_sint.write.matched_sign.normal_precision*");