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

#ifndef ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_RECT_TEST_H
#define ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_RECT_TEST_H

namespace OHOS {
namespace Rosen {
namespace Drawing {

// Rect Create/Destroy/Copy/Intersect/Join related functions (9 functions)
int TestRectCreateNormal();
int TestRectIntersectNormal();
int TestRectIntersectNull();
int TestRectJoinNormal();
int TestRectJoinNull();
int TestRectCopyNormal();
int TestRectCopyNull();
int TestRectDestroyNormal();
int TestRectDestroyNull();

// Rect Set/Get Left/Top/Right/Bottom related functions (24 functions)
int TestRectSetLeftNormal();
int TestRectSetLeftNull();
int TestRectSetLeftAbnormal();
int TestRectSetLeftMultipleCalls();
int TestRectSetTopNormal();
int TestRectSetTopNull();
int TestRectSetTopAbnormal();
int TestRectSetTopMultipleCalls();
int TestRectSetRightNormal();
int TestRectSetRightNull();
int TestRectSetRightAbnormal();
int TestRectSetRightMultipleCalls();
int TestRectSetBottomNormal();
int TestRectSetBottomNull();
int TestRectSetBottomAbnormal();
int TestRectSetBottomMultipleCalls();
int TestRectGetLeftNormal();
int TestRectGetLeftNull();
int TestRectGetTopNormal();
int TestRectGetTopNull();
int TestRectGetRightNormal();
int TestRectGetRightNull();
int TestRectGetBottomNormal();
int TestRectGetBottomNull();

// Rect GetWidth/GetHeight/Inset/Contains/SetEmpty/IsEmpty/Offset/OffsetTo/Sort/Union related functions (32 functions)
int TestRectGetHeightNormal();
int TestRectGetHeightNull();
int TestRectGetWidthNormal();
int TestRectGetWidthNull();
int TestRectGetWidthBoundary();
int TestRectInsetNormal();
int TestRectInsetAbNormal();
int TestRectInsetNull();
int TestRectInsetCalls();
int TestRectContainsNormal();
int TestRectContainsNull();
int TestRectContainsCalls();
int TestRectSetEmptyNormal();
int TestRectSetEmptyNull();
int TestRectSetEmptyMultipleCalls();
int TestRectIsEmptyNormal();
int TestRectIsEmptyNull();
int TestRectIsEmptyMultipleCalls();
int TestRectOffsetNormal();
int TestRectOffsetNull();
int TestRectOffsetAbnormal();
int TestRectOffsetMultipleCalls();
int TestRectOffsetToNormal();
int TestRectOffsetToNull();
int TestRectOffsetToAbnormal();
int TestRectOffsetToMultipleCalls();
int TestRectSortNormal();
int TestRectSortNull();
int TestRectSortMultipleCalls();
int TestRectUnionNormal();
int TestRectUnionNull();
int TestRectUnionMultipleCalls();
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

#endif // ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_RECT_TEST_H
