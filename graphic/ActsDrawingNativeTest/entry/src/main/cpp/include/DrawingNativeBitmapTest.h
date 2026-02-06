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

#ifndef ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_BITMAP_TEST_H
#define ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_BITMAP_TEST_H

namespace OHOS {
namespace Rosen {
namespace Drawing {
// Common SetUp and TearDown functions
void DrawingNativeBitmapTestSetUp();
void DrawingNativeBitmapTestTearDown();

// Bitmap related functions
int TestBitmapDestroyNormal();
int TestBitmapDestroyNull();
int TestBitmapCreateFromPixelsNormal();
int TestBitmapCreateFromPixelsNull();
int TestBitmapCreateFromPixelsMismatch();
int TestBitmapCreateFromPixelsAbnormal();
int TestBitmapCreateFromPixelsVeryBig();
int TestBitmapCreateFromPixelsBoundary();
int TestBitmapBuildNormal();
int TestBitmapBuildNull();
int TestBitmapBuildMultipleCalls();
int TestBitmapBuildBoundary();
int TestBitmapGetXXNormal();
int TestBitmapGetXXNull();
int TestBitmapGetXXInputDestroyed();
int TestBitmapGetXXBoundary();
int TestBitmapReadPixelsNormal();
int TestBitmapReadPixelsNull();
int TestBitmapReadPixelsInputDestroyed();
int TestBitmapReadPixelsMismatch();
int TestBitmapReadPixelsBoundary();
int TestBitmapBuildMaximum();
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

#endif // ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_BITMAP_TEST_H
