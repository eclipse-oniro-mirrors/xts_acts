/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#ifndef ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_ROUND_RECT_TEST_H
#define ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_ROUND_RECT_TEST_H

namespace OHOS {
namespace Rosen {
namespace Drawing {
// Common SetUp and TearDown functions
void DrawingNativeRoundRectTestSetUp();
void DrawingNativeRoundRectTestTearDown();

// RoundRect Create related functions (5 functions)
int TestRoundRectCreateNormal();
int TestRoundRectCreateNull();
int TestRoundRectCreateAbnormal();
int TestRoundRectCreateMaximum();
int TestRoundRectCreateMultipleCalls();

// RoundRect SetGetCorner related functions (6 functions)
int TestRoundRectSetGetCornerNormal();
int TestRoundRectSetGetCornerNull();
int TestRoundRectSetGetCornerAbnormal();
int TestRoundRectSetGetCornerMaximum();
int TestRoundRectSetGetCornerMultipleCalls();
int TestRoundRectGetCornerWhenNoSet();

// RoundRect Destroy/Offset/Copy related functions (8 functions)
int TestRoundRectDestroyNormal();
int TestRoundRectDestroyNull();
int TestRoundRectOffsetNormal();
int TestRoundRectOffsetNull();
int TestRoundRectOffsetMultipleCalls();
int TestRoundRectCopyNormal();
int TestRoundRectCopyNull();
int TestRoundRectCopyMultipleCalls();
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

#endif // ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_ROUND_RECT_TEST_H
