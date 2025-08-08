/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#endif // NATIVEFONTNDK_USELESS_H