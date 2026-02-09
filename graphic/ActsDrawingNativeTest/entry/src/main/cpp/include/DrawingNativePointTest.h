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

#ifndef ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_POINT_TEST_H
#define ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_POINT_TEST_H

namespace OHOS {
namespace Rosen {
namespace Drawing {
// Point Create related functions
int TestPointCreateNormal();
int TestPointCreateNull();
int TestPointCreateAbnormal();
int TestPointCreateMaximum();
int TestPointCreateMultipleCalls();

// Point Destroy related functions
int TestPointDestroyNormal();
int TestPointDestroyNull();

// Point GetX related functions
int TestPointGetXNormal();
int TestPointGetXNull();
int TestPointGetXMultipleCalls();

// Point GetY related functions
int TestPointGetYNormal();
int TestPointGetYNull();
int TestPointGetYMultipleCalls();

// Point Set related functions
int TestPointSetNormal();
int TestPointSetNull();
int TestPointSetMultipleCalls();
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

#endif // ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_POINT_TEST_H
