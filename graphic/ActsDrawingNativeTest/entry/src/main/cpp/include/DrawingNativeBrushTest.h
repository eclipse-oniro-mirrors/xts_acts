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

#ifndef ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_BRUSH_TEST_H
#define ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_BRUSH_TEST_H

namespace OHOS {
namespace Rosen {
namespace Drawing {
// Common SetUp and TearDown functions
void DrawingNativeBrushTestSetUp();
void DrawingNativeBrushTestTearDown();

// Brush related functions
int TestBrushCreateNormal();
int TestBrushCopyNormal();
int TestBrushCopyNull();
int TestBrushCopyInputDestroyed();
int TestBrushCopyMultipleCalls();
int TestBrushDestroyNormal();
int TestBrushDestroyNull();
int TestBrushIsAntiAliasNormal();
int TestBrushIsAntiAliasNull();
int TestBrushSetAntiAliasNormal();
int TestBrushSetAntiAliasNull();
int TestBrushGetColorNormal();
int TestBrushGetColorNull();
int TestBrushSetColorNormal();
int TestBrushSetColorNull();
int TestBrushSetColorAbnormal();
int TestBrushSetColorMaximum();
int TestBrushGetAlphaNormal();
int TestBrushGetAlphaNull();
int TestBrushSetAlphaNormal();
int TestBrushSetAlphaNull();
int TestBrushSetAlphaAbnormal();
int TestBrushSetAlphaMaximum();
int TestBrushSetShaderEffectNormal();
int TestBrushSetShaderEffectNull();
int TestBrushSetShadowLayerNormal();
int TestBrushSetShadowLayerNull();
int TestBrushSetFilterNormal();
int TestBrushSetFilterNull();
int TestBrushGetFilterNormal();
int TestBrushGetFilterNull();
int TestBrushSetBlendModeNormal();
int TestBrushSetBlendModeNull();
int TestBrushResetNormal();
int TestBrushResetNull();
int TestBrushGetAlphaFloatNormal();
int TestBrushGetAlphaFloatAbnormal();
int TestBrushGetRedFloatNormal();
int TestBrushGetRedFloatAbnormal();
int TestBrushGetGreenFloatNormal();
int TestBrushGetGreenFloatAbnormal();
int TestBrushGetBlueFloatNormal();
int TestBrushGetBlueFloatAbnormal();
int TestBrushSetColor4fNormal();
int TestBrushSetColor4fNull();
int TestBrushSetColor4fAbnormal();
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

#endif // ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_BRUSH_TEST_H
