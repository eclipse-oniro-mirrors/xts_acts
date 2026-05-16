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

#ifndef ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_COLOR_FILTER_TEST_H
#define ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_COLOR_FILTER_TEST_H

namespace OHOS {
namespace Rosen {
namespace Drawing {
// ColorFilter CreateBlendMode related functions
int TestColorFilterCreateBlendModeNormal();
int TestColorFilterCreateBlendModeNULL();
int TestColorFilterCreateBlendModeMultipleCalls();
int TestColorFilterCreateBlendModeAbnormal();
int TestColorFilterCreateBlendModeMaximum();

// ColorFilter CreateCompose related functions
int TestColorFilterCreateComposeNormal();
int TestColorFilterCreateComposeNULL();
int TestColorFilterCreateComposeMultipleCalls();

// ColorFilter CreateMatrix related functions
int TestColorFilterCreateMatrixNormal();
int TestColorFilterCreateMatrixNULL();
int TestColorFilterCreateMatrixAbnormal();
int TestColorFilterCreateMatrixMultipleCalls();

// ColorFilter CreateLinearToSrgbGamma related functions
int TestColorFilterCreateLinearToSrgbGammaNormal();
int TestColorFilterCreateLinearToSrgbGammaMultipleCalls();

// ColorFilter CreateSrgbGammaToLinear related functions
int TestColorFilterCreateSrgbGammaToLinearNormal();
int TestColorFilterCreateSrgbGammaToLinearMultipleCalls();

// ColorFilter CreateLuma related functions
int TestColorFilterCreateLumaNormal();
int TestColorFilterCreateLumaMultipleCalls();

// ColorFilter Destroy related functions
int TestColorFilterDestroyNormal();
int TestColorFilterDestroyNULL();

// ColorFilter CreateLighting related functions
int TestColorFilterCreateLightingNormal();
int TestColorFilterCreateLightingNULL();
int TestColorFilterCreateLightingAbnormal();
int TestColorFilterCreateLightingMultipleCalls();
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

#endif // ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_COLOR_FILTER_TEST_H
