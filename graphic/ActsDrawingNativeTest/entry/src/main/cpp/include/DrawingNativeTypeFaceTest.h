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

#ifndef ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_TYPE_FACE_TEST_H
#define ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_TYPE_FACE_TEST_H

namespace OHOS {
namespace Rosen {
namespace Drawing {

// Typeface CreateDefault related functions
int TestTypefaceCreateDefaultNormal();
int TestTypefaceCreateDefaultNull();

// Typeface CreateFromFile related functions
int TestTypefaceCreateFromFileNormal();
int TestTypefaceCreateFromFileNull();

// Typeface CreateFromStream related functions
int TestTypefaceCreateFromStreamNormal();
int TestTypefaceCreateFromStreamNull();

// Typeface CreateDestroy related functions
int TestTypefaceCreateDestroyNormal();
int TestTypefaceCreateDestroyNull();

// Typeface CreateFromFileWithArguments related functions
int TestTypefaceCreateFromFileWithArugumentsNormal();
int TestTypefaceCreateFromFileWithArugumentsNull();
int TestTypefaceCreateFromFileWithArugumentsAbnormal();
int TestTypefaceCreateFromFileWithArugumentsMultipleCalls();

// Typeface CreateFromCurrent related functions
int TestTypefaceCreateFromCurrentNormal();
int TestTypefaceCreateFromCurrentNull();
int TestTypefaceCreateFromCurrentMultipleCalls();

// Typeface IsBold related functions
int TestTypefaceIsBoldNormal();
int TestTypefaceIsBoldNull();
int TestTypefaceIsBoldMultipleCalls();

// Typeface IsItalic related functions
int TestTypefaceIsItalicNormal();
int TestTypefaceIsItalicNull();
int TestTypefaceIsItalicMultipleCalls();
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

#endif // ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_TYPE_FACE_TEST_H
