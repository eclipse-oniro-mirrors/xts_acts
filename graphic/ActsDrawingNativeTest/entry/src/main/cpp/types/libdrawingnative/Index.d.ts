/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

// Canvas DrawRecordCmd related functions
export const DrawingCanvasDrawRecordCmd: (caseName: number) => number;

// RecordCmd Destroy related functions
export const DrawingRecordCmdDestroy: (caseName: number) => number;

// RecordCmdUtils BeginRecording related functions
export const DrawingRecordCmdUtilsBeginRecording: (caseName: number) => number;

// RecordCmdUtils Destroy related functions
export const DrawingRecordCmdUtilsDestroy: (caseName: number) => number;

// RecordCmdUtils FinishRecording related functions
export const DrawingRecordCmdUtilsFinishRecording: (caseName: number) => number;

// Canvas DrawSingleCharacterWithFeatures related functions
export const DrawingCanvasDrawSingleChaWithFeatures: (caseName: number) => number;

// Memory Stream related functions
export const DrawingMemoryStream: (caseName: number) => number;

// Point Create related functions
export const DrawingPointCreate: (caseName: number) => number;

// Point Destroy related functions
export const DrawingPointDestroy: (caseName: number) => number;

// Point GetSet related functions
export const DrawingPointGetSet: (caseName: number) => number;

// Region Basic Operations related functions
export const DrawingRegionBasicOperations: (caseName: number) => number;

// Region Contains related functions
export const DrawingRegionQueryOperations: (caseName: number) => number;

// Region Part2 Empty/GetBoundary/GetBounds/IsComplex/IsEmpty/IsRect related functions
export const DrawingRegionPart2QueryOperations: (caseName: number) => number;

// Region Advanced Operations related functions
export const DrawingRegionAdvancedOperations: (caseName: number) => number;

// Path Effect related functions
export const DrawingPathEffect: (caseName: number) => number;

// Path Iterator related functions
export const DrawingPathIterator: (caseName: number) => number;

// Path Basic related functions
export const DrawingPathBasic: (caseName: number) => number;

// Path Relative related functions
export const DrawingPathRelative: (caseName: number) => number;

// Path Add Shape related functions
export const DrawingPathAddShape: (caseName: number) => number;

// Path Part2 Add related functions
export const DrawingPathPart2Add: (caseName: number) => number;

// Path Part2 Transform related functions
export const DrawingPathPart2Transform: (caseName: number) => number;

// Path Part2 Get/Set related functions
export const DrawingPathPart2GetSet: (caseName: number) => number;

// Path Part3 Query related functions
export const DrawingPathPart3Query: (caseName: number) => number;

// Path Part4 InverseFillType related functions
export const DrawingPathPart4InverseFillType: (caseName: number) => number;

// Path Part3 Transform related functions
export const DrawingPathPart3Transform: (caseName: number) => number;

// Path Part3 Advanced related functions
export const DrawingPathPart3Advanced: (caseName: number) => number;

// Canvas Destroy related functions
export const DrawingCanvasDestroy: (caseName: number) => number;

// Canvas Bind related functions
export const DrawingCanvasBind: (caseName: number) => number;

// Canvas Save related functions
export const DrawingCanvasSave: (caseName: number) => number;

// Canvas SaveLayer related functions
export const DrawingCanvasSaveLayer: (caseName: number) => number;

// Canvas Restore related functions
export const DrawingCanvasRestore: (caseName: number) => number;

// Canvas RestoreToCount related functions
export const DrawingCanvasRestoreToCount: (caseName: number) => number;

// Canvas DrawLine related functions
export const DrawingCanvasDrawLine: (caseName: number) => number;

// Canvas DrawPath related functions
export const DrawingCanvasDrawPath: (caseName: number) => number;

// Canvas Attach related functions
export const DrawingCanvasAttach: (caseName: number) => number;

// Canvas Detach related functions
export const DrawingCanvasDetach: (caseName: number) => number;

// Canvas Part2 DrawPixelMapRect related functions
export const DrawingCanvasDrawPixelMapRect: (caseName: number) => number;

// Canvas Part2 DrawBackground related functions
export const DrawingCanvasDrawBackground: (caseName: number) => number;

// Canvas Part2 DrawRegion related functions
export const DrawingCanvasDrawRegion: (caseName: number) => number;

// Canvas Part2 DrawPoints related functions
export const DrawingCanvasDrawPoints: (caseName: number) => number;

// Canvas Part2 DrawBitmap related functions
export const DrawingCanvasDrawBitmap: (caseName: number) => number;

// Canvas Part2 DrawBitmapRect related functions
export const DrawingCanvasDrawBitmapRect: (caseName: number) => number;

// Canvas Part2 DrawRect related functions
export const DrawingCanvasDrawRect: (caseName: number) => number;

// Canvas Part2 DrawCircle related functions
export const DrawingCanvasDrawCircle: (caseName: number) => number;

// Canvas Part3 DrawOval related functions
export const DrawingCanvasDrawOval: (caseName: number) => number;

// Canvas Part3 DrawArc related functions
export const DrawingCanvasDrawArc: (caseName: number) => number;

// Canvas Part3 DrawRoundRect related functions
export const DrawingCanvasDrawRoundRect: (caseName: number) => number;

// Canvas Part3 DrawTextBlob related functions
export const DrawingCanvasDrawTextBlob: (caseName: number) => number;

// Canvas Part3 ClipRect related functions
export const DrawingCanvasClipRect: (caseName: number) => number;

// Canvas Part3 ClipRoundRect related functions
export const DrawingCanvasClipRoundRect: (caseName: number) => number;

// Canvas Part3 ClipPath related functions
export const DrawingCanvasClipPath: (caseName: number) => number;

// Canvas Part3 Rotate related functions
export const DrawingCanvasRotate: (caseName: number) => number;

// Canvas Part3 Translate related functions
export const DrawingCanvasTranslate: (caseName: number) => number;

// Canvas Part3 Scale related functions
export const DrawingCanvasScale: (caseName: number) => number;

// Canvas Part4 Skew related functions
export const DrawingCanvasSkew: (caseName: number) => number;

// Canvas Part4 GetWidth/GetHeight related functions
export const DrawingCanvasGetWidthHeight: (caseName: number) => number;

// Canvas Part4 GetLocalClipBounds related functions
export const DrawingCanvasGetLocalClipBounds: (caseName: number) => number;

// Canvas Part4 ConcatMatrix related functions
export const DrawingCanvasConcatMatrix: (caseName: number) => number;

// Canvas Part4 DrawShadow related functions
export const DrawingCanvasDrawShadow: (caseName: number) => number;

// Canvas Part4 Clear related functions
export const DrawingCanvasClear: (caseName: number) => number;

// Canvas Part4 SetMatrix related functions
export const DrawingCanvasSetMatrix: (caseName: number) => number;

// Canvas Part4 ResetMatrix related functions
export const DrawingCanvasResetMatrix: (caseName: number) => number;

// Canvas Part4 DrawImageRect related functions
export const DrawingCanvasDrawImageRect: (caseName: number) => number;

// Canvas Part4 DrawVertices related functions
export const DrawingCanvasDrawVertices: (caseName: number) => number;

// Canvas Part4 ReadPixels related functions
export const DrawingCanvasReadPixels: (caseName: number) => number;

// Canvas Part4 ReadPixelsToBitmap related functions
export const DrawingCanvasReadPixelsToBitmap: (caseName: number) => number;

// Canvas Part4 DrawSingleCharacter related functions
export const DrawingCanvasDrawSingleCharacter: (caseName: number) => number;

// Canvas Part4 DrawPoint related functions
export const DrawingCanvasDrawPoint: (caseName: number) => number;

// Canvas Part4 DrawColor related functions
export const DrawingCanvasDrawColor: (caseName: number) => number;

// Canvas Part4 IsClipEmpty related functions
export const DrawingCanvasIsClipEmpty: (caseName: number) => number;

// Canvas Part4 GetImageInfo related functions
export const DrawingCanvasGetImageInfo: (caseName: number) => number;

// Canvas Part4 ClipRegion related functions
export const DrawingCanvasClipRegion: (caseName: number) => number;

// Canvas Part5 QuickRejectPath related functions
export const DrawingCanvasQuickRejectPath: (caseName: number) => number;

// Canvas Part5 QuickRejectRect related functions
export const DrawingCanvasQuickRejectRect: (caseName: number) => number;

// Canvas Part5 DrawArcWithCenter related functions
export const DrawingCanvasDrawArcWithCenter: (caseName: number) => number;

// Canvas Part5 DrawNestedRoundRect related functions
export const DrawingCanvasDrawNestedRoundRect: (caseName: number) => number;

// Canvas Part5 DrawPixelMapNine related functions
export const DrawingCanvasDrawPixelMapNine: (caseName: number) => number;

// Canvas Part5 CreateWithPixelMap related functions
export const DrawingCanvasCreateWithPixelMap: (caseName: number) => number;

// Canvas Part5 DrawPixelMapRectConstraint related functions
export const DrawingCanvasDrawPixelMapRectConstraint: (caseName: number) => number;

// Canvas Part5 DrawPixelMapMesh related functions
export const DrawingCanvasDrawPixelMapMesh: (caseName: number) => number;

// ColorFilter CreateBlendMode related functions
export const DrawingColorFilterCreateBlendMode: (caseName: number) => number;

// ColorFilter CreateCompose related functions
export const DrawingColorFilterCreateCompose: (caseName: number) => number;

// ColorFilter CreateMatrix related functions
export const DrawingColorFilterCreateMatrix: (caseName: number) => number;

// ColorFilter CreateLinearToSrgbGamma related functions
export const DrawingColorFilterCreateLinearToSrgbGamma: (caseName: number) => number;

// ColorFilter CreateSrgbGammaToLinear related functions
export const DrawingColorFilterCreateSrgbGammaToLinear: (caseName: number) => number;

// ColorFilter CreateLuma related functions
export const DrawingColorFilterCreateLuma: (caseName: number) => number;

// ColorFilter Destroy related functions
export const DrawingColorFilterDestroy: (caseName: number) => number;

// ColorFilter CreateLighting related functions
export const DrawingColorFilterCreateLighting: (caseName: number) => number;

// ColorSpace CreateSrgb related functions
export const DrawingColorSpaceCreateSrgb: (caseName: number) => number;

// ColorSpace Destroy related functions
export const DrawingColorSpaceDestroy: (caseName: number) => number;

// ColorSpace CreateSrgbLinear related functions
export const DrawingColorSpaceCreateSrgbLinear: (caseName: number) => number;

// Color SetArgb related functions
export const DrawingColorSetArgb: (caseName: number) => number;

// Filter Create/Destroy related functions
export const DrawingFilterCreateDestroy: (caseName: number) => number;

// Filter SetImageFilter related functions
export const DrawingFilterSetImageFilter: (caseName: number) => number;

// Filter SetMaskFilter related functions
export const DrawingFilterSetMaskFilter: (caseName: number) => number;

// Filter SetColorFilter related functions
export const DrawingFilterSetColorFilter: (caseName: number) => number;

// Font Create/Destroy related functions
export const DrawingFontCreateDestroy: (caseName: number) => number;

// Font SetBaselineSnap related functions
export const DrawingFontSetBaselineSnap: (caseName: number) => number;

// Font SetSubpixel related functions
export const DrawingFontSetSubpixel: (caseName: number) => number;

// Font SetForceAutoHinting related functions
export const DrawingFontSetForceAutoHinting: (caseName: number) => number;

// Font SetTypeface related functions
export const DrawingFontSetTypeface: (caseName: number) => number;

// Font SetTextSize related functions
export const DrawingFontSetTextSize: (caseName: number) => number;

// Font CountText related functions
export const DrawingFontCountText: (caseName: number) => number;

// Font TextToGlyphs related functions
export const DrawingFontTextToGlyphs: (caseName: number) => number;

// Font GetWidths related functions
export const DrawingFontGetWidths: (caseName: number) => number;

// Font SetLinearText related functions
export const DrawingFontSetLinearText: (caseName: number) => number;

// Font SetTextSkewX related functions
export const DrawingFontSetTextSkewX: (caseName: number) => number;

// Font SetFakeBoldText related functions
export const DrawingFontSetFakeBoldText: (caseName: number) => number;

// Font SetScaleX related functions
export const DrawingFontSetScaleX: (caseName: number) => number;

// Font SetHinting related functions
export const DrawingFontSetHinting: (caseName: number) => number;

// Font SetEmbeddedBitmaps related functions
export const DrawingFontSetEmbeddedBitmaps: (caseName: number) => number;

// Font SetEdging related functions
export const DrawingFontSetEdging: (caseName: number) => number;

// Font MeasureSingleCharacter related functions
export const DrawingFontMeasureSingleCharacter: (caseName: number) => number;

// Font Measuretext related functions
export const DrawingFontMeasuretext: (caseName: number) => number;

// FontArguments Create related functions
export const DrawingFontArgumentsCreate: (caseName: number) => number;

// FontArguments AddVariation related functions
export const DrawingFontArgumentsAddVariation: (caseName: number) => number;

// FontArguments Destroy related functions
export const DrawingFontArgumentsDestroy: (caseName: number) => number;

// Font SetThemeFontFollowed related functions
export const DrawingFontSetThemeFontFollowed: (caseName: number) => number;

// Font IsThemeFontFollowed related functions
export const DrawingFontIsThemeFontFollowed: (caseName: number) => number;

// Font GetMetrics Part2 related functions
export const DrawingFontGetMetricsPart2: (caseName: number) => number;

// Font MeasureTextWithBrushOrPen related functions
export const DrawingFontMeasureTextWithBrushOrPen: (caseName: number) => number;

// Font GetWidthsBounds related functions
export const DrawingFontGetWidthsBounds: (caseName: number) => number;

// Font GetPos related functions
export const DrawingFontGetPos: (caseName: number) => number;

// Font GetSpacing related functions
export const DrawingFontGetSpacing: (caseName: number) => number;

// Font MeasureSingleChaWithFeatures related functions
export const DrawingFontMeasureSingleChaWithFeatures: (caseName: number) => number;

// Font Features related functions
export const DrawingFontFeatures: (caseName: number) => number;

// GpuContext related functions
export const DrawingGpuContext: (caseName: number) => number;

// ImageFilter related functions
export const DrawingImageFilter: (caseName: number) => number;

// Image related functions
export const DrawingImage: (caseName: number) => number;

// Lattice related functions
export const DrawingLattice: (caseName: number) => number;

// MaskFilter related functions
export const DrawingMaskFilter: (caseName: number) => number;

// Matrix related functions
export const DrawingMatrixCreate: (caseName: number) => number;
export const DrawingMatrixTransform: (caseName: number) => number;
export const DrawingMatrixOperation: (caseName: number) => number;

// Matrix Part2 related functions
export const DrawingMatrixPart2Transform: (caseName: number) => number;
export const DrawingMatrixPart2MapQuery: (caseName: number) => number;
export const DrawingMatrixPart2Set: (caseName: number) => number;

// Matrix Part3 related functions
export const DrawingMatrixPart3: (caseName: number) => number;

// Bitmap related functions
export const DrawingBitmap: (caseName: number) => number;

// Brush Create/Destroy related functions
export const DrawingBrushCreateDestroy: (caseName: number) => number;

// Brush AntiAlias related functions
export const DrawingBrushAntiAlias: (caseName: number) => number;

// Brush Color related functions
export const DrawingBrushColor: (caseName: number) => number;

// Brush Alpha related functions
export const DrawingBrushAlpha: (caseName: number) => number;

// Brush ShaderEffect related functions
export const DrawingBrushShaderEffect: (caseName: number) => number;

// Brush ShadowLayer related functions
export const DrawingBrushShadowLayer: (caseName: number) => number;

// Brush Filter related functions
export const DrawingBrushFilter: (caseName: number) => number;

// Brush BlendMode related functions
export const DrawingBrushBlendMode: (caseName: number) => number;

// Brush Reset related functions
export const DrawingBrushReset: (caseName: number) => number;

// Brush GetFloat related functions
export const DrawingBrushGetFloat: (caseName: number) => number;

// Brush SetColor4f related functions
export const DrawingBrushSetColor4f: (caseName: number) => number;

// Pen CreateDestroy related functions
export const DrawingPenCreateDestroy: (caseName: number) => number;
// Pen AntiAlias related functions
export const DrawingPenAntiAlias: (caseName: number) => number;
// Pen Color related functions
export const DrawingPenColor: (caseName: number) => number;
// Pen Alpha related functions
export const DrawingPenAlpha: (caseName: number) => number;
// Pen Width related functions
export const DrawingPenWidth: (caseName: number) => number;
// Pen MiterLimit related functions
export const DrawingPenMiterLimit: (caseName: number) => number;
// Pen Cap related functions
export const DrawingPenCap: (caseName: number) => number;
// Pen Join related functions
export const DrawingPenJoin: (caseName: number) => number;
// Pen Effects related functions
export const DrawingPenEffects: (caseName: number) => number;
// Pen Filter related functions
export const DrawingPenFilter: (caseName: number) => number;
// Pen BlendMode related functions
export const DrawingPenBlendMode: (caseName: number) => number;
// Pen GetFillPath related functions
export const DrawingPenGetFillPath: (caseName: number) => number;
// Pen Reset related functions
export const DrawingPenReset: (caseName: number) => number;
// Pen GetFloat related functions
export const DrawingPenGetFloat: (caseName: number) => number;
// Pen SetColor4f related functions
export const DrawingPenSetColor4f: (caseName: number) => number;

// PixelMap related functions
export const DrawingPixelMap: (caseName: number) => number;

// Rect Create/Destroy/Copy/Intersect/Join related functions
export const DrawingRectCreateDestroyIntersectJoin: (caseName: number) => number;
// Rect Set/Get Left/Top/Right/Bottom related functions
export const DrawingRectSetGetLeftTopRightBottom: (caseName: number) => number;
// Rect GetWidth/GetHeight related functions
export const DrawingRectOtherOperations: (caseName: number) => number;
// Rect Part2 Inset/Contains/SetEmpty/IsEmpty/Offset/OffsetTo/Sort/Union related functions
export const DrawingRectPart2OtherOperations: (caseName: number) => number;

// RoundRect related functions
export const DrawingRoundRect: (caseName: number) => number;

// SamplingOptions related functions
export const DrawingSamplingOptions: (caseName: number) => number;

// ShadowLayer related functions
export const DrawingShadowLayer: (caseName: number) => number;

// ShaderEffect Create Gradient related functions
export const DrawingShaderEffectCreateGradient: (caseName: number) => number;

// ShaderEffect Create Special related functions
export const DrawingShaderEffectCreateSpecial: (caseName: number) => number;

// ShaderEffect Destroy related functions
export const DrawingShaderEffectDestroy: (caseName: number) => number;

// RenderSurface related functions
export const DrawingSurface: (caseName: number) => number;

// TextBlobBuilder related functions
export const DrawingTextBlobBuilder: (caseName: number) => number;

// TextBlob Create related functions
export const DrawingTextBlobCreate: (caseName: number) => number;

// TextBlob Other operations related functions
export const DrawingTextBlobOther: (caseName: number) => number;

// Typeface Create related functions
export const DrawingTypefaceCreate: (caseName: number) => number;

// Typeface IsBold/IsItalic related functions
export const DrawingTypefaceIsBoldItalic: (caseName: number) => number;