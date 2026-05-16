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

#ifndef ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_TEXT_BLOB_TEST_H
#define ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_TEXT_BLOB_TEST_H

namespace OHOS {
namespace Rosen {
namespace Drawing {
// Common SetUp and TearDown functions declaration
void DrawingNativeTextBlobTestSetUp();
void DrawingNativeTextBlobTestTearDown();

// TextBlobBuilder Create/Destroy related functions
int TestTextBlobBuilderCreateDestroyNormal();
int TestTextBlobBuilderCreateDestroyNull();
int TestTextBlobBuilderCreateDestroyMultipleCalls();

// TextBlob CreateFromText related functions
int TestTextBlobCreateFromTextNormal();
int TestTextBlobCreateFromTextNull();
int TestTextBlobCreateFromTextMultipleCalls();
int TestTextBlobCreateFromTextAbnormal();

// TextBlob CreateFromPosText related functions
int TestTextBlobCreateFromPosTextNormal();
int TestTextBlobCreateFromPosTextNull();
int TestTextBlobCreateFromPosTextMultipleCalls();
int TestTextBlobCreateFromPosTextAbnormal();

// TextBlob CreateFromString related functions
int TestTextBlobCreateFromStringNormal();
int TestTextBlobCreateFromStringNull();
int TestTextBlobCreateFromStringMultipleCalls();
int TestTextBlobCreateFromStringAbnormal();

// TextBlob GetBounds related functions
int TestTextBlobGetBoundsNormal();
int TestTextBlobGetBoundsNull();
int TestTextBlobGetBoundsMultipleCalls();
int TestTextBlobGetBoundsAbnormal();

// TextBlob UniqueID related functions
int TestTextBlobUniqueIDNormal();
int TestTextBlobUniqueIDNull();
int TestTextBlobUniqueIDMultipleCalls();

// TextBlobBuilder AllocRunPos related functions
int TestTextBlobBuilderAllocRunPosNormal();
int TestTextBlobBuilderAllocRunPosNull();
int TestTextBlobBuilderAllocRunPosMultipleCalls();

// TextBlobBuilder Make related functions
int TestTextBlobBuilderMakeNormal();
int TestTextBlobBuilderMakeNull();
int TestTextBlobBuilderMakeMultipleCalls();

// TextBlob Destroy related functions
int TestTextBlobDestroyNormal();
int TestTextBlobDestroyNull();
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

#endif // ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_TEXT_BLOB_TEST_H
