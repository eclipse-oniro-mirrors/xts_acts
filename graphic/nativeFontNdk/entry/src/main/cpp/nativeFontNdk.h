/*
 * Copyright (c) 2024-2026 Huawei Device Co., Ltd.
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

#ifndef NATIVEFONTNDK_USELESS_H
#define NATIVEFONTNDK_USELESS_H

#include <string>
#include <fstream>
#include <filesystem>
#include <js_native_api.h>
#include "napi/native_api.h"
#include "hilog/log.h"
#include "native_common.h"
#include "native_drawing/drawing_bitmap.h"
#include "native_drawing/drawing_brush.h"
#include "native_drawing/drawing_canvas.h"
#include "native_drawing/drawing_color.h"
#include "native_drawing/drawing_font.h"
#include "native_drawing/drawing_font_collection.h"
#include "native_drawing/drawing_path.h"
#include "native_drawing/drawing_point.h"
#include "native_drawing/drawing_pen.h"
#include "native_drawing/drawing_rect.h"
#include "native_drawing/drawing_text_run.h"
#include "native_drawing/drawing_text_declaration.h"
#include "native_drawing/drawing_text_typography.h"
#include "native_drawing/drawing_text_font_descriptor.h"
#include "native_drawing/drawing_text_line.h"
#include "native_drawing/drawing_text_lineTypography.h"
#include "native_drawing/drawing_register_font.h"

// cpp1中的用例
napi_value OHDrawingMatchFontDescriptors001(napi_env env, napi_callback_info info);
napi_value OHDrawingMatchFontDescriptors002(napi_env env, napi_callback_info info);
napi_value OHDrawingMatchFontDescriptors003(napi_env env, napi_callback_info info);
napi_value OHDrawingMatchFontDescriptors004(napi_env env, napi_callback_info info);
napi_value OHDrawingMatchFontDescriptors005(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontDescriptorByFullName001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontDescriptorByFullName002(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontDescriptorByFullName003(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontDescriptorByFullName004(napi_env env, napi_callback_info info);
napi_value OHDrawingGetSystemFontFullNamesByType001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetSystemFontFullNamesByType002(napi_env env, napi_callback_info info);
napi_value OHDrawingGetSystemFontFullNamesByType003(napi_env env, napi_callback_info info);
napi_value OHDrawingGetSystemFontFullNamesByType004(napi_env env, napi_callback_info info);
napi_value OHDrawingGetSystemFontFullNameByIndex001(napi_env env, napi_callback_info info);
napi_value OHDrawingCreateLineTypography001(napi_env env, napi_callback_info info);
napi_value OHDrawingCreateLineTypography002(napi_env env, napi_callback_info info);
napi_value OHDrawingCreateLineTypography003(napi_env env, napi_callback_info info);
napi_value OHDrawingCreateLineTypography004(napi_env env, napi_callback_info info);
napi_value OHDrawingLineTypographyGetLineBreak001(napi_env env, napi_callback_info info);
napi_value OHDrawingLineTypographyGetLineBreak002(napi_env env, napi_callback_info info);
napi_value OHDrawingLineTypographyGetLineBreak003(napi_env env, napi_callback_info info);
napi_value OHDrawingLineTypographyGetLineBreak004(napi_env env, napi_callback_info info);
napi_value OHDrawingLineTypographyGetLineBreak005(napi_env env, napi_callback_info info);
napi_value OHDrawingLineTypographyCreateLine001(napi_env env, napi_callback_info info);
napi_value OHDrawingLineTypographyCreateLine002(napi_env env, napi_callback_info info);
napi_value OHDrawingLineTypographyCreateLine003(napi_env env, napi_callback_info info);
napi_value OHDrawingLineTypographyCreateLine004(napi_env env, napi_callback_info info);
napi_value OHDrawingLineTypographyCreateLine005(napi_env env, napi_callback_info info);
napi_value OHDrawingLineTypographyCreateLine006(napi_env env, napi_callback_info info);
napi_value OHDrawingFontGetBounds001(napi_env env, napi_callback_info info);
napi_value OHDrawingFontGetBounds002(napi_env env, napi_callback_info info);
napi_value OHDrawingFontGetBounds003(napi_env env, napi_callback_info info);
napi_value OHDrawingRectDestroyArray001(napi_env env, napi_callback_info info);

// cpp2中的用例
napi_value OHDrawingFontGetPathForGlyph001(napi_env env, napi_callback_info info);
napi_value OHDrawingFontGetPathForGlyph002(napi_env env, napi_callback_info info);
napi_value OHDrawingFontGetPathForGlyph003(napi_env env, napi_callback_info info);
napi_value OHDrawingFontGetPathForGlyph004(napi_env env, napi_callback_info info);
napi_value OHDrawingRectGetArraySize001(napi_env env, napi_callback_info info);
napi_value OHDrawingRectGetArraySize002(napi_env env, napi_callback_info info);
napi_value OHDrawingRectGetArrayElement001(napi_env env, napi_callback_info info);
napi_value OHDrawingCreateTextTab001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetTextTabAlignment001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetTextTabLocation001(napi_env env, napi_callback_info info);
napi_value OHDrawingFontGetTextPath001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetDrawingArraySize001(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyGetTextLines001(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyGetTextLines002(napi_env env, napi_callback_info info);
napi_value OHDrawingDestroyTextLine001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetTextLineByIndex001(napi_env env, napi_callback_info info);
napi_value OHDrawingTextLineGetTextRange001(napi_env env, napi_callback_info info);
napi_value OHDrawingTextLineGetGlyphRuns001(napi_env env, napi_callback_info info);
napi_value OHDrawingDestroyRuns001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetRunByIndex001(napi_env env, napi_callback_info info);
napi_value OHDrawingTextLinePaint001(napi_env env, napi_callback_info info);
napi_value OHDrawingTextLineCreateTruncatedLine001(napi_env env, napi_callback_info info);
napi_value OHDrawingTextLineGetTypographicBounds001(napi_env env, napi_callback_info info);
napi_value OHDrawingTextLineGetImageBounds001(napi_env env, napi_callback_info info);
napi_value OHDrawingTextLineGetTrailingSpaceWidth001(napi_env env, napi_callback_info info);
napi_value OHDrawingTextLineGetStringIndexForPosition001(napi_env env, napi_callback_info info);
napi_value OHDrawingTextLineGetOffsetForStringIndex001(napi_env env, napi_callback_info info);
napi_value OHDrawingTextLineGetAlignmentOffset001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetRunGlyphCount001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetRunStringRange001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetRunTypographicBounds001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetRunStringIndicesByIndex001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetRunImageBounds001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetRunGlyphsByIndex001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetRunPositions001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontCollectionGlobalInstance001(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTextStyleBadgeType001(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTextStyleBadgeType002(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyHandlerAddEncodedText001(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyHandlerAddEncodedText002(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyHandlerAddEncodedText003(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyHandlerAddEncodedText004(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyHandlerAddEncodedText005(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyHandlerAddEncodedText006(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyHandlerAddEncodedText007(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyHandlerAddEncodedText008(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyHandlerAddEncodedText009(napi_env env, napi_callback_info info);
napi_value OHDrawingGetRun001(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTypographyStyleAttributeDouble001(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTypographyStyleAttributeInt001(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTextStyleAttributeDouble001(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTextStyleAttributeDouble002(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTextStyleAttributeDouble003(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTextStyleAttributeDouble004(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTextStyleAttributeInt001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontFullDescriptorsFromPath001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontFullDescriptorsFromPath002(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontFullDescriptorsFromPath003(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontFullDescriptorAttributeString001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontFullDescriptorAttributeString002(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontFullDescriptorAttributeString003(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontFullDescriptorByIndex001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontFullDescriptorAttributeInt001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontFullDescriptorAttributeInt002(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontFullDescriptorFromStream001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontFullDescriptorFromStream002(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontFullDescriptorFromStream003(napi_env env, napi_callback_info info);

// cpp3中的用例
napi_value OHDrawingTypographyIsEllipsized001(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyIsEllipsized002(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyIsEllipsized003(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyIsLineUnlimited001(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyIsLineUnlimited002(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyIsLineUnlimited003(napi_env env, napi_callback_info info);
napi_value OHDrawingFontParserGetFontByName001(napi_env env, napi_callback_info info);
napi_value OHDrawingCreateFontDescriptor001(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyGetLineTextRange001(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyGetLineTextRange002(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyGetLineTextRange003(napi_env env, napi_callback_info info);
napi_value OHDrawingTextVerticalAlignment001(napi_env env, napi_callback_info info);
napi_value OHDrawingTextVerticalAlignment002(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTypographyStyleAttributeInt002(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTypographyStyleAttributeDouble002(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTypographyStyleAttributeDouble003(napi_env env, napi_callback_info info);
napi_value OHDrawingGetTextStyleAttributeInt001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetRunGlyphAdvanceByIndex001(napi_env env, napi_callback_info info);
napi_value OHDrawingLineTypographyCreateLine007(napi_env env, napi_callback_info info);
napi_value OHDrawingUnregisterFont001(napi_env env, napi_callback_info info);
napi_value OHDrawingFontStyleSetGetStyle001(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyStyleIsHintEnabled001(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyStyleIsHintEnabled002(napi_env env, napi_callback_info info);
napi_value OHDrawingGetSystemFontConfigInfo001(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTypographyStyleAttributeDouble007(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTypographyStyleAttributeInt005(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTextStyleAttributeInt002(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTextStyleAttributeInt003(napi_env env, napi_callback_info info);
napi_value OHDrawingGetTextStyleAttributeInt002(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTypographyStyleAttributeDouble004(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTypographyStyleAttributeDouble005(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTypographyStyleAttributeDouble006(napi_env env, napi_callback_info info);
napi_value OHDrawingGetTypographyStyleAttributeDouble001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetTypographyStyleAttributeInt001(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTypographyStyleAttributeInt003(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTypographyStyleAttributeInt004(napi_env env, napi_callback_info info);
napi_value OHDrawingGetTextStyleAttributeDouble001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetTypographyStyleAttributeInt002(napi_env env, napi_callback_info info);
napi_value OHDrawingGetTypographyStyleAttributeInt003(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyStyleGetStrutStyle001(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyTextlineStyleGetFontWeight001(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyTextlineStyleGetFontStyle001(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyGetTextAlign001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetTextTabAlignment002(napi_env env, napi_callback_info info);

// cpp4中的用例
napi_value OHDrawingTextStyleGetFontMetrics001(napi_env env, napi_callback_info info);
napi_value OHDrawingTextStyleGetFontMetrics002(napi_env env, napi_callback_info info);
napi_value OHDrawingTextStyleGetFontMetrics003(napi_env env, napi_callback_info info);
napi_value OHDrawingTextStyleGetFontMetrics004(napi_env env, napi_callback_info info);
napi_value OHDrawingTextStyleGetFontMetrics005(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyGetLineInfo001(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyGetLineInfo002(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyGetLineInfo003(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyGetLineInfo004(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyGetLineInfo005(napi_env env, napi_callback_info info);
napi_value OHDrawingTextStyleGetShadowWithIndex001(napi_env env, napi_callback_info info);
napi_value OHDrawingTextStyleGetShadowWithIndex002(napi_env env, napi_callback_info info);
napi_value OHDrawingTextStyleGetShadowWithIndex003(napi_env env, napi_callback_info info);
napi_value OHDrawingTextStyleGetShadowWithIndex004(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyTextGetHeightBehavior001(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyTextGetHeightBehavior002(napi_env env, napi_callback_info info);
napi_value OHDrawingTextStyleGetDecorationStyle001(napi_env env, napi_callback_info info);
napi_value OHDrawingTextStyleGetDecorationStyle002(napi_env env, napi_callback_info info);
napi_value OHDrawingTextStyleGetFontWeight001(napi_env env, napi_callback_info info);
napi_value OHDrawingTextStyleGetFontWeight002(napi_env env, napi_callback_info info);
napi_value OHDrawingTextStyleGetFontStyle001(napi_env env, napi_callback_info info);
napi_value OHDrawingTextStyleGetFontStyle002(napi_env env, napi_callback_info info);
napi_value OHDrawingTextStyleGetBaseline001(napi_env env, napi_callback_info info);
napi_value OHDrawingTextStyleGetBaseline002(napi_env env, napi_callback_info info);
napi_value OHDrawingTextStyleGetHalfLeading001(napi_env env, napi_callback_info info);
napi_value OHDrawingTextStyleGetHalfLeading002(napi_env env, napi_callback_info info);
napi_value OHDrawingTextStyleIsPlaceholder001(napi_env env, napi_callback_info info);
napi_value OHDrawingTextStyleIsPlaceholder002(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyStyleGetEffectiveAlignment001(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyStyleGetEffectiveAlignment002(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyDidExceedMaxLines001(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyDidExceedMaxLines002(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyDidExceedMaxLines003(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyGetRectsForRange001(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyGetGlyphPositionAtCoordinate001(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyGetGlyphPositionAtCoordinate002(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyGetGlyphPositionAtCoordinateWithCluster001(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyGetWordBoundary001(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyGetLineMetricsAt001(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyGetLineMetricsAt002(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyGetLineMetricsAt003(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyGetLineMetricsAt004(napi_env env, napi_callback_info info);

// cpp5中的用例
napi_value OHDrawingSetTextStyleAttributeInt004(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyDidExceedMaxLines004(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyStyleGetEffectiveAlignment003(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTextStyleAttributeDouble005(napi_env env, napi_callback_info info);
napi_value OHDrawingIsFontSupportedFromPath001(napi_env env, napi_callback_info info);
napi_value OHDrawingIsFontSupportedFromPath002(napi_env env, napi_callback_info info);
napi_value OHDrawingIsFontSupportedFromPath003(napi_env env, napi_callback_info info);
napi_value OHDrawingIsFontSupportedFromPath004(napi_env env, napi_callback_info info);
napi_value OHDrawingIsFontSupportedFromBuffer001(napi_env env, napi_callback_info info);
napi_value OHDrawingIsFontSupportedFromBuffer002(napi_env env, napi_callback_info info);
napi_value OHDrawingIsFontSupportedFromBuffer003(napi_env env, napi_callback_info info);
napi_value OHDrawingIsFontSupportedFromBuffer004(napi_env env, napi_callback_info info);
napi_value OHDrawingIsFontSupportedFromBuffer005(napi_env env, napi_callback_info info);
napi_value OHDrawingIsFontSupportedFromBuffer006(napi_env env, napi_callback_info info);
napi_value OHDrawingIsFontSupportedFromBuffer007(napi_env env, napi_callback_info info);
napi_value OHDrawingIsFontSupportedFromBuffer008(napi_env env, napi_callback_info info);
napi_value OHDrawingErrorFileNotFound001(napi_env env, napi_callback_info info);
napi_value OHDrawingRegisterFontByIndex001(napi_env env, napi_callback_info info);
napi_value OHDrawingRegisterFontByIndex002(napi_env env, napi_callback_info info);
napi_value OHDrawingRegisterFontByIndex003(napi_env env, napi_callback_info info);
napi_value OHDrawingRegisterFontByIndex004(napi_env env, napi_callback_info info);
napi_value OHDrawingRegisterFontByIndex005(napi_env env, napi_callback_info info);
napi_value OHDrawingRegisterFontByIndex006(napi_env env, napi_callback_info info);
napi_value OHDrawingRegisterFontByIndex007(napi_env env, napi_callback_info info);
napi_value OHDrawingRegisterFontByIndex008(napi_env env, napi_callback_info info);
napi_value OHDrawingRegisterFontByIndex009(napi_env env, napi_callback_info info);
napi_value OHDrawingRegisterFontByIndex010(napi_env env, napi_callback_info info);
napi_value OHDrawingRegisterFontBufferByIndex001(napi_env env, napi_callback_info info);
napi_value OHDrawingRegisterFontBufferByIndex002(napi_env env, napi_callback_info info);
napi_value OHDrawingRegisterFontBufferByIndex003(napi_env env, napi_callback_info info);
napi_value OHDrawingRegisterFontBufferByIndex004(napi_env env, napi_callback_info info);
napi_value OHDrawingRegisterFontBufferByIndex005(napi_env env, napi_callback_info info);
napi_value OHDrawingRegisterFontBufferByIndex006(napi_env env, napi_callback_info info);
napi_value OHDrawingRegisterFontBufferByIndex007(napi_env env, napi_callback_info info);
napi_value OHDrawingRegisterFontBufferByIndex008(napi_env env, napi_callback_info info);
napi_value OHDrawingRegisterFontBufferByIndex009(napi_env env, napi_callback_info info);
napi_value OHDrawingRegisterFontBufferByIndex010(napi_env env, napi_callback_info info);
napi_value FullDescriptorAttrSLocalPostscriptName001(napi_env env, napi_callback_info info);
napi_value FullDescriptorAttrSLocalPostscriptName002(napi_env env, napi_callback_info info);
napi_value FullDescriptorAttrSLocalFullName001(napi_env env, napi_callback_info info);
napi_value FullDescriptorAttrSLocalFullName002(napi_env env, napi_callback_info info);
napi_value FullDescriptorAttrSLocalFamilyName001(napi_env env, napi_callback_info info);
napi_value FullDescriptorAttrSLocalSubFamilyName001(napi_env env, napi_callback_info info);
napi_value FullDescriptorAttrSVersion001(napi_env env, napi_callback_info info);
napi_value FullDescriptorAttrSVersion002(napi_env env, napi_callback_info info);
napi_value FullDescriptorAttrSManufacture001(napi_env env, napi_callback_info info);
napi_value FullDescriptorAttrSCopyright001(napi_env env, napi_callback_info info);
napi_value FullDescriptorAttrSTrademark001(napi_env env, napi_callback_info info);
napi_value FullDescriptorAttrSLicense001(napi_env env, napi_callback_info info);
napi_value FullDescriptorAttrIIndex001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontUnicodeArrayFromFile001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontUnicodeArrayFromFile002(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontUnicodeArrayFromFile003(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontUnicodeArrayFromFile004(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontUnicodeArrayFromFile005(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontPathsByType001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontPathsByType002(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontPathsByType003(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontUnicodeArrayFromBuffer001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontUnicodeArrayFromBuffer002(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontCountFromFile001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontCountFromFile002(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontCountFromBuffer001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontCountFromBuffer002(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTypographyStyleAttributeBool001(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTypographyStyleAttributeBool002(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTypographyStyleAttributeBool003(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTypographyStyleAttributeBool004(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTypographyStyleAttributeBool005(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTypographyStyleAttributeBool006(napi_env env, napi_callback_info info);
napi_value OHDrawingGetTypographyStyleAttributeBool001(napi_env env, napi_callback_info info);
napi_value OHDrawingGetTypographyStyleAttributeBool002(napi_env env, napi_callback_info info);
napi_value OHDrawingGetTypographyStyleAttributeBool003(napi_env env, napi_callback_info info);
napi_value OHDrawingGetTypographyStyleAttributeBool004(napi_env env, napi_callback_info info);
napi_value OHDrawingGetTypographyStyleAttributeBool005(napi_env env, napi_callback_info info);
napi_value OHDrawingDestroyPositionAndAffinity001(napi_env env, napi_callback_info info);
napi_value OHDrawingDestroyPositionAndAffinity002(napi_env env, napi_callback_info info);
// cpp6
napi_value OHDrawingTextStyleAddFontVariation001(napi_env env, napi_callback_info info);
napi_value OHDrawingTextStyleAddFontVariation002(napi_env env, napi_callback_info info);
napi_value OHDrawingTextStyleAddFontVariationWithNormalization001(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyLayoutWithConstraintsWithBuffer0100(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyLayoutWithConstraintsWithBuffer0200(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyLayoutWithConstraintsWithBuffer0300(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyLayoutWithConstraintsWithBuffer0400(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyLayoutWithConstraintsWithBuffer0500(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyLayoutWithConstraintsWithBuffer0600(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyLayoutWithConstraintsWithBuffer0700(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyLayoutWithConstraintsWithBuffer0800(napi_env env, napi_callback_info info);
napi_value OHDrawingReleaseArrayBuffer0100(napi_env env, napi_callback_info info);
napi_value OHDrawingReleaseArrayBuffer0200(napi_env env, napi_callback_info info);
napi_value OHDrawingReleaseArrayBuffer0300(napi_env env, napi_callback_info info);
napi_value OHDrawingReleaseArrayBuffer0400(napi_env env, napi_callback_info info);
napi_value OHDrawingReleaseArrayBuffer0500(napi_env env, napi_callback_info info);
napi_value OHDrawingReleaseArrayBuffer0600(napi_env env, napi_callback_info info);
napi_value OHDrawingReleaseArrayBuffer0700(napi_env env, napi_callback_info info);
// cpp7
napi_value OHDrawingGetFontFullDescriptorAttributeArray0100(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontFullDescriptorAttributeArray0200(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontVariationAxisAttributeStr0100(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontVariationAxisAttributeStr0200(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontVariationInstanceByIndex0100(napi_env env, napi_callback_info info);
napi_value OHDrawingDestroyFontVariationInstance0100(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontVariationInstanceAttributeStr0100(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontVariationInstanceCoordinate0100(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontFullDescriptorByFullName0100(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontVariationAxisAttributeDouble0100(napi_env env, napi_callback_info info);
napi_value OHDrawingGetFontVariationAxisAttributeInt0100(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyLayoutWithConstraintsWithBuffer0900(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyLayoutWithConstraintsWithBuffer1000(napi_env env, napi_callback_info info);
napi_value OHDrawingTextStyleAddFontVariationWithNormalization0100(napi_env env, napi_callback_info info);
napi_value OHDrawingTextStyleAddFontVariationWithNormalization0200(napi_env env, napi_callback_info info);
napi_value OHDrawingTextStyleAddFontVariationWithNormalization0300(napi_env env, napi_callback_info info);
napi_value OHDrawingTextStyleAddFontVariationWithNormalization0400(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyGetCharacterRangeForGlyphRangeWithBuffer0100(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyGetGlyphRangeForCharacterRangeWithBuffer0100(napi_env env, napi_callback_info info);
napi_value OHDrawingTypographyGetCharacterPositionAtCoordinateWithBuffer0100(napi_env env, napi_callback_info info);
napi_value OHEllipsisModalMultilineHead0100(napi_env env, napi_callback_info info);
napi_value OHTextStyleAttriFontEdging0100(napi_env env, napi_callback_info info);
napi_value OHDrawingReleaseRangeBuffer0100(napi_env env, napi_callback_info info);
napi_value OHDrawingFontFullDescriptorAttributeId0100(napi_env env, napi_callback_info info);
napi_value OHDrawingFontFullDescriptorAttributeId0200(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTypographyStyleAttributeDoubleArray0100(napi_env env, napi_callback_info info);
napi_value OHDrawingGetTypographyStyleAttributeDoubleArray0100(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTypographyStyleAttributeDoubleArray0200(napi_env env, napi_callback_info info);
napi_value OHDrawingGetTypographyStyleAttributeDoubleArray0200(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTypographyStyleAttributeDoubleArray0300(napi_env env, napi_callback_info info);
napi_value OHDrawingGetTypographyStyleAttributeDoubleArray0300(napi_env env, napi_callback_info info);
napi_value OHDrawingGetTypographyStyleAttributeDoubleArray0400(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTypographyStyleAttributeDoubleArray0400(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTypographyStyleAttributeDoubleArray0500(napi_env env, napi_callback_info info);
napi_value OHDrawingGetTypographyStyleAttributeDoubleArray0500(napi_env env, napi_callback_info info);
napi_value OHDrawingGetTypographyStyleAttributeDoubleArray0600(napi_env env, napi_callback_info info);
napi_value OHDrawingGetTypographyStyleAttributeDoubleArray0700(napi_env env, napi_callback_info info);
napi_value OHDrawingGetTypographyStyleAttributeDoubleArray0800(napi_env env, napi_callback_info info);
napi_value OHDrawingGetTypographyStyleAttributeDoubleArray0900(napi_env env, napi_callback_info info);
napi_value OHDrawingSetTypographyStyleAttributeDoubleFirstLineHeadIndent0100(napi_env env, napi_callback_info info);

#endif // NATIVEFONTNDK_USELESS_H