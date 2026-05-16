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

#ifndef ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_REGION_TEST_H
#define ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_REGION_TEST_H

namespace OHOS {
namespace Rosen {
namespace Drawing {
// Region Basic Operations related functions (Create/Destroy/SetRect/SetPath/Copy/Op/Translate)
int TestRegionCreateNormal();
int TestRegionCreateMoreTimes();
int TestRegionDestroyNormal();
int TestRegionDestroyNull();
int TestRegionSetRectResultTrue();
int TestRegionSetRectRegionNull();
int TestRegionSetRectRectNull();
int TestRegionSetRectResultFalse();
int TestRegionSetPathResultTrue();
int TestRegionSetPathRegionNull();
int TestRegionSetPathResultFalse();
int TestRegionCopyNormal();
int TestRegionCopyNull();
int TestRegionCopyAbnormal();
int TestRegionCopyMultipleCalls();
int TestRegionOpNormal();
int TestRegionOpRegionNull();
int TestRegionOpMultipleCalls();
int TestRegionTranslateNormal();
int TestRegionTranslateNull();
int TestRegionTranslateMultipleCalls();

// Region Query Operations related functions (Contains/Empty/GetBoundary/GetBounds/IsComplex/IsEmpty/IsRect)
int TestRegionContainsInRange();
int TestRegionContainsXvalueNotInRange();
int TestRegionContainsYvalueNotInRange();
int TestRegionContainsAllNotInRange();
int TestRegionContainsRegionNull();
int TestRegionEmptyNormal();
int TestRegionEmptyNull();
int TestRegionEmptyCalls();
int TestRegionGetBoundaryNormal();
int TestRegionGetBoundaryNull();
int TestRegionGetBoundaryMultipleCalls();
int TestRegionGetBoundsNormal();
int TestRegionGetBoundsNull();
int TestRegionGetBoundsMultipleCalls();
int TestRegionIsComplexNormal();
int TestRegionIsComplexNull();
int TestRegionIsComplexMultipleCalls();
int TestRegionIsEmptyNormal();
int TestRegionIsEmptyNull();
int TestRegionIsEmptyMultipleCalls();
int TestRegionIsRectNormal();
int TestRegionIsRectNull();
int TestRegionIsRectMultipleCalls();

// Region Advanced Operations related functions (QuickContains/QuickReject)
int TestRegionQuickContainsNormal();
int TestRegionQuickContainsNull();
int TestRegionQuickContainsAbnormal();
int TestRegionQuickContainsMultipleCalls();
int TestRegionQuickRejectNormal();
int TestRegionQuickRejectNull();
int TestRegionQuickRejectAbnormal();
int TestRegionQuickRejectMultipleCalls();
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

#endif // ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_REGION_TEST_H
