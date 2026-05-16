/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import arkuiCapiTest from 'libarkuicapigen.so'

export default function arkuiNativeCapiStyledString() {
  describe('StyledString (styled_string)', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(50);
      done();
    });

    /**
     * @tc.number  TestArkUICapi_238
     * @tc.name    TestArkUICapi_238
     * @tc.desc    Case: TestArkUICapi_238. API: OH_ARKUI_STYLEDSTRINGKEY_UNSPECIFIED. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_238', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_238()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_239
     * @tc.name    TestArkUICapi_239
     * @tc.desc    Case: TestArkUICapi_239. API: OH_ARKUI_STYLEDSTRINGKEY_FONT. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_239', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_239()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_240
     * @tc.name    TestArkUICapi_240
     * @tc.desc    Case: TestArkUICapi_240. API: OH_ARKUI_STYLEDSTRINGKEY_DECORATION. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_240', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_240()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_241
     * @tc.name    TestArkUICapi_241
     * @tc.desc    Case: TestArkUICapi_241. API: OH_ARKUI_STYLEDSTRINGKEY_BASELINE_OFFSET. Note: non-ASCII details are
     *             in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_241', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_241()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_242
     * @tc.name    TestArkUICapi_242
     * @tc.desc    Case: TestArkUICapi_242. API: OH_ARKUI_STYLEDSTRINGKEY_LETTER_SPACING. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_242', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_242()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_243
     * @tc.name    TestArkUICapi_243
     * @tc.desc    Case: TestArkUICapi_243. API: OH_ARKUI_STYLEDSTRINGKEY_TEXT_SHADOW. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_243', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_243()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_244
     * @tc.name    TestArkUICapi_244
     * @tc.desc    Case: TestArkUICapi_244. API: OH_ARKUI_STYLEDSTRINGKEY_LINE_HEIGHT. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_244', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_244()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_245
     * @tc.name    TestArkUICapi_245
     * @tc.desc    Case: TestArkUICapi_245. API: OH_ARKUI_STYLEDSTRINGKEY_BACKGROUND_COLOR. Note: non-ASCII details are
     *             in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_245', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_245()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_246
     * @tc.name    TestArkUICapi_246
     * @tc.desc    Case: TestArkUICapi_246. API: OH_ARKUI_STYLEDSTRINGKEY_URL. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_246', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_246()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_247
     * @tc.name    TestArkUICapi_247
     * @tc.desc    Case: TestArkUICapi_247. API: OH_ARKUI_STYLEDSTRINGKEY_GESTURE. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_247', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_247()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_248
     * @tc.name    TestArkUICapi_248
     * @tc.desc    Case: TestArkUICapi_248. API: OH_ARKUI_STYLEDSTRINGKEY_PARAGRAPH_STYLE. Note: non-ASCII details are
     *             in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_248', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_248()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_249
     * @tc.name    TestArkUICapi_249
     * @tc.desc    Case: TestArkUICapi_249. API: OH_ARKUI_STYLEDSTRINGKEY_IMAGE. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_249', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_249()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_250
     * @tc.name    TestArkUICapi_250
     * @tc.desc    Case: TestArkUICapi_250. API: OH_ARKUI_STYLEDSTRINGKEY_CUSTOM_SPAN. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_250', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_250()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_251
     * @tc.name    TestArkUICapi_251
     * @tc.desc    Case: TestArkUICapi_251. API: OH_ARKUI_STYLEDSTRINGKEY_USER_DATA. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_251', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_251()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_252
     * @tc.name    TestArkUICapi_252
     * @tc.desc    Case: TestArkUICapi_252. API: OH_ArkUI_StyledString_Descriptor_CreateWithString. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_252', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_252()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_253
     * @tc.name    TestArkUICapi_253
     * @tc.desc    Case: TestArkUICapi_253. API: OH_ArkUI_StyledString_Descriptor_CreateWithImageAttachment,
     *             OH_ArkUI_ImageAttachment. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_253', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_253()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_254
     * @tc.name    TestArkUICapi_254
     * @tc.desc    Case: TestArkUICapi_254. API: OH_ArkUI_StyledString_Descriptor_CreateWithCustomSpan. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_254', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_254()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_255
     * @tc.name    TestArkUICapi_255
     * @tc.desc    Case: TestArkUICapi_255. API: OH_ArkUI_StyledString_Descriptor_GetLength,
     *             ArkUI_StyledString_Descriptor, OH_ArkUI_StyledString_Descriptor_Create, ARKUI_ERROR_CODE_NO_ERROR.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_255', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_255()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_256
     * @tc.name    TestArkUICapi_256
     * @tc.desc    Case: TestArkUICapi_256. API: OH_ArkUI_StyledString_Descriptor_GetString,
     *             ArkUI_StyledString_Descriptor, OH_ArkUI_StyledString_Descriptor_Create, ARKUI_ERROR_CODE_NO_ERROR.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_256', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_256()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_257
     * @tc.name    TestArkUICapi_257
     * @tc.desc    Case: TestArkUICapi_257. API: OH_ArkUI_StyledString_Descriptor_IsEqual,
     *             ArkUI_StyledString_Descriptor, OH_ArkUI_StyledString_Descriptor_Create, ARKUI_ERROR_CODE_NO_ERROR.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_257', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_257()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_258
     * @tc.name    TestArkUICapi_258
     * @tc.desc    Case: TestArkUICapi_258. API: OH_ArkUI_StyledString_Descriptor_SubStyledString,
     *             ArkUI_StyledString_Descriptor, OH_ArkUI_StyledString_Descriptor_Create, ARKUI_ERROR_CODE_NO_ERROR.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_258', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_258()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_259
     * @tc.name    TestArkUICapi_259
     * @tc.desc    Case: TestArkUICapi_259. API: OH_ArkUI_StyledString_Descriptor_GetStyles,
     *             ArkUI_StyledString_Descriptor, OH_ArkUI_StyledStringKey, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_StyledString_Descriptor_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_259', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_259()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_260
     * @tc.name    TestArkUICapi_260
     * @tc.desc    Case: TestArkUICapi_260. API: OH_ArkUI_StyledString_Descriptor_FromHtml,
     *             ArkUI_StyledString_Descriptor, OH_ArkUI_StyledString_Descriptor_Create, ARKUI_ERROR_CODE_NO_ERROR.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_260', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_260()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_261
     * @tc.name    TestArkUICapi_261
     * @tc.desc    Case: TestArkUICapi_261. API: OH_ArkUI_StyledString_Descriptor_ReplaceString,
     *             ArkUI_StyledString_Descriptor, OH_ArkUI_StyledString_Descriptor_Create, ARKUI_ERROR_CODE_NO_ERROR.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_261', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_261()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_262
     * @tc.name    TestArkUICapi_262
     * @tc.desc    Case: TestArkUICapi_262. API: OH_ArkUI_StyledString_Descriptor_InsertString,
     *             ArkUI_StyledString_Descriptor, OH_ArkUI_StyledString_Descriptor_Create, ARKUI_ERROR_CODE_NO_ERROR.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_262', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_262()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_263
     * @tc.name    TestArkUICapi_263
     * @tc.desc    Case: TestArkUICapi_263. API: OH_ArkUI_StyledString_Descriptor_RemoveString,
     *             ArkUI_StyledString_Descriptor, OH_ArkUI_StyledString_Descriptor_Create, ARKUI_ERROR_CODE_NO_ERROR.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_263', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_263()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_264
     * @tc.name    TestArkUICapi_264
     * @tc.desc    Case: TestArkUICapi_264. API: OH_ArkUI_StyledString_Descriptor_ReplaceStyle,
     *             ArkUI_StyledString_Descriptor, OH_ArkUI_SpanStyle, OH_ArkUI_StyledString_Descriptor_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_264', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_264()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_265
     * @tc.name    TestArkUICapi_265
     * @tc.desc    Case: TestArkUICapi_265. API: OH_ArkUI_StyledString_Descriptor_SetStyle,
     *             ArkUI_StyledString_Descriptor, OH_ArkUI_SpanStyle, OH_ArkUI_StyledString_Descriptor_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_265', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_265()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_266
     * @tc.name    TestArkUICapi_266
     * @tc.desc    Case: TestArkUICapi_266. API: OH_ArkUI_StyledString_Descriptor_RemoveStyle,
     *             ArkUI_StyledString_Descriptor, OH_ArkUI_StyledStringKey, OH_ArkUI_StyledString_Descriptor_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_266', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_266()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_267
     * @tc.name    TestArkUICapi_267
     * @tc.desc    Case: TestArkUICapi_267. API: OH_ArkUI_StyledString_Descriptor_ClearStyles,
     *             ArkUI_StyledString_Descriptor, OH_ArkUI_StyledString_Descriptor_Create, ARKUI_ERROR_CODE_NO_ERROR.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_267', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_267()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_268
     * @tc.name    TestArkUICapi_268
     * @tc.desc    Case: TestArkUICapi_268. API: OH_ArkUI_StyledString_Descriptor_ReplaceStyledString,
     *             ArkUI_StyledString_Descriptor, OH_ArkUI_StyledString_Descriptor_Create, ARKUI_ERROR_CODE_NO_ERROR.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_268', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_268()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_269
     * @tc.name    TestArkUICapi_269
     * @tc.desc    Case: TestArkUICapi_269. API: OH_ArkUI_StyledString_Descriptor_InsertStyledString,
     *             ArkUI_StyledString_Descriptor, OH_ArkUI_StyledString_Descriptor_Create, ARKUI_ERROR_CODE_NO_ERROR.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_269', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_269()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_270
     * @tc.name    TestArkUICapi_270
     * @tc.desc    Case: TestArkUICapi_270. API: OH_ArkUI_StyledString_Descriptor_AppendStyledString,
     *             ArkUI_StyledString_Descriptor, OH_ArkUI_StyledString_Descriptor_Create, ARKUI_ERROR_CODE_NO_ERROR.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_270', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_270()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_271
     * @tc.name    TestArkUICapi_271
     * @tc.desc    Case: TestArkUICapi_271. API: OH_ArkUI_StyledString_Descriptor_InvalidateCustomSpan,
     *             ArkUI_StyledString_Descriptor, OH_ArkUI_StyledString_Descriptor_Create, ARKUI_ERROR_CODE_NO_ERROR.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_271', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_271()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_272
     * @tc.name    TestArkUICapi_272
     * @tc.desc    Case: TestArkUICapi_272. API: OH_ARKUI_SUPERSCRIPTSTYLE_NORMAL. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_272', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_272()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_273
     * @tc.name    TestArkUICapi_273
     * @tc.desc    Case: TestArkUICapi_273. API: OH_ARKUI_SUPERSCRIPTSTYLE_SUPERSCRIPT. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_273', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_273()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_274
     * @tc.name    TestArkUICapi_274
     * @tc.desc    Case: TestArkUICapi_274. API: OH_ARKUI_SUPERSCRIPTSTYLE_SUBSCRIPT. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_274', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_274()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_275
     * @tc.name    TestArkUICapi_275
     * @tc.desc    Case: TestArkUICapi_275. API: OH_ArkUI_TextStyle_Create. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_275', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_275()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_276
     * @tc.name    TestArkUICapi_276
     * @tc.desc    Case: TestArkUICapi_276. API: OH_ArkUI_TextStyle_Destroy, OH_ArkUI_TextStyle_Create. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_276', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_276()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_277
     * @tc.name    TestArkUICapi_277
     * @tc.desc    Case: TestArkUICapi_277. API: OH_ArkUI_TextStyle_SetFontColor, OH_ArkUI_TextStyle,
     *             OH_ArkUI_TextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_277', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_277()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_278
     * @tc.name    TestArkUICapi_278
     * @tc.desc    Case: TestArkUICapi_278. API: OH_ArkUI_TextStyle_GetFontColor, OH_ArkUI_TextStyle,
     *             OH_ArkUI_TextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_278', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_278()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_279
     * @tc.name    TestArkUICapi_279
     * @tc.desc    Case: TestArkUICapi_279. API: OH_ArkUI_TextStyle_SetFontFamily, OH_ArkUI_TextStyle,
     *             OH_ArkUI_TextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_279', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_279()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_280
     * @tc.name    TestArkUICapi_280
     * @tc.desc    Case: TestArkUICapi_280. API: OH_ArkUI_TextStyle_GetFontFamily, OH_ArkUI_TextStyle,
     *             OH_ArkUI_TextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_280', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_280()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_281
     * @tc.name    TestArkUICapi_281
     * @tc.desc    Case: TestArkUICapi_281. API: OH_ArkUI_TextStyle_SetFontSize, OH_ArkUI_TextStyle,
     *             OH_ArkUI_TextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_281', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_281()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_282
     * @tc.name    TestArkUICapi_282
     * @tc.desc    Case: TestArkUICapi_282. API: OH_ArkUI_TextStyle_GetFontSize, OH_ArkUI_TextStyle,
     *             OH_ArkUI_TextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_282', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_282()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_283
     * @tc.name    TestArkUICapi_283
     * @tc.desc    Case: TestArkUICapi_283. API: OH_ArkUI_TextStyle_SetFontWeight, OH_ArkUI_TextStyle,
     *             OH_ArkUI_TextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_283', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_283()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_284
     * @tc.name    TestArkUICapi_284
     * @tc.desc    Case: TestArkUICapi_284. API: OH_ArkUI_TextStyle_GetFontWeight, OH_ArkUI_TextStyle,
     *             OH_ArkUI_TextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_284', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_284()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_285
     * @tc.name    TestArkUICapi_285
     * @tc.desc    Case: TestArkUICapi_285. API: OH_ArkUI_TextStyle_SetFontStyle, OH_ArkUI_TextStyle, ArkUI_FontStyle,
     *             OH_ArkUI_TextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_285', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_285()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_286
     * @tc.name    TestArkUICapi_286
     * @tc.desc    Case: TestArkUICapi_286. API: OH_ArkUI_TextStyle_GetFontStyle, OH_ArkUI_TextStyle, ArkUI_FontStyle,
     *             OH_ArkUI_TextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_286', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_286()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_287
     * @tc.name    TestArkUICapi_287
     * @tc.desc    Case: TestArkUICapi_287. API: OH_ArkUI_TextStyle_SetStrokeWidth, OH_ArkUI_TextStyle,
     *             OH_ArkUI_TextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_287', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_287()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_288
     * @tc.name    TestArkUICapi_288
     * @tc.desc    Case: TestArkUICapi_288. API: OH_ArkUI_TextStyle_GetStrokeWidth, OH_ArkUI_TextStyle,
     *             OH_ArkUI_TextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_288', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_288()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_289
     * @tc.name    TestArkUICapi_289
     * @tc.desc    Case: TestArkUICapi_289. API: OH_ArkUI_TextStyle_SetStrokeColor, OH_ArkUI_TextStyle,
     *             OH_ArkUI_TextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_289', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_289()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_290
     * @tc.name    TestArkUICapi_290
     * @tc.desc    Case: TestArkUICapi_290. API: OH_ArkUI_TextStyle_GetStrokeColor, OH_ArkUI_TextStyle,
     *             OH_ArkUI_TextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_290', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_290()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_291
     * @tc.name    TestArkUICapi_291
     * @tc.desc    Case: TestArkUICapi_291. API: OH_ArkUI_TextStyle_SetSuperscript, OH_ArkUI_TextStyle,
     *             OH_ArkUI_SuperscriptStyle, OH_ArkUI_TextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_291', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_291()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_292
     * @tc.name    TestArkUICapi_292
     * @tc.desc    Case: TestArkUICapi_292. API: OH_ArkUI_TextStyle_GetSuperscript, OH_ArkUI_TextStyle,
     *             OH_ArkUI_SuperscriptStyle, OH_ArkUI_TextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_292', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_292()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_293
     * @tc.name    TestArkUICapi_293
     * @tc.desc    Case: TestArkUICapi_293. API: OH_ArkUI_SpanStyle_Create. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_293', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_293()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_294
     * @tc.name    TestArkUICapi_294
     * @tc.desc    Case: TestArkUICapi_294. API: OH_ArkUI_SpanStyle_Destroy, OH_ArkUI_SpanStyle_Create. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_294', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_294()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_295
     * @tc.name    TestArkUICapi_295
     * @tc.desc    Case: TestArkUICapi_295. API: OH_ArkUI_SpanStyle_GetStyledKey, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_StyledStringKey, OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_295', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_295()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_296
     * @tc.name    TestArkUICapi_296
     * @tc.desc    Case: TestArkUICapi_296. API: OH_ArkUI_SpanStyle_SetStart, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_296', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_296()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_297
     * @tc.name    TestArkUICapi_297
     * @tc.desc    Case: TestArkUICapi_297. API: OH_ArkUI_SpanStyle_GetStart, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_297', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_297()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_298
     * @tc.name    TestArkUICapi_298
     * @tc.desc    Case: TestArkUICapi_298. API: OH_ArkUI_SpanStyle_SetLength, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_298', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_298()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_299
     * @tc.name    TestArkUICapi_299
     * @tc.desc    Case: TestArkUICapi_299. API: OH_ArkUI_SpanStyle_GetLength, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_299', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_299()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_300
     * @tc.name    TestArkUICapi_300
     * @tc.desc    Case: TestArkUICapi_300. API: OH_ArkUI_SpanStyle_SetTextStyle, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_TextStyle, OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are
     *             in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_300', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_300()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_301
     * @tc.name    TestArkUICapi_301
     * @tc.desc    Case: TestArkUICapi_301. API: OH_ArkUI_SpanStyle_GetTextStyle, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_TextStyle, OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are
     *             in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_301', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_301()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_302
     * @tc.name    TestArkUICapi_302
     * @tc.desc    Case: TestArkUICapi_302. API: OH_ArkUI_SpanStyle_SetParagraphStyle, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_ParagraphStyle, OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_302', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_302()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_303
     * @tc.name    TestArkUICapi_303
     * @tc.desc    Case: TestArkUICapi_303. API: OH_ArkUI_SpanStyle_GetParagraphStyle, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_ParagraphStyle, OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_303', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_303()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_304
     * @tc.name    TestArkUICapi_304
     * @tc.desc    Case: TestArkUICapi_304. API: OH_ArkUI_SpanStyle_SetGestureStyle, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_GestureStyle, OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_304', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_304()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_305
     * @tc.name    TestArkUICapi_305
     * @tc.desc    Case: TestArkUICapi_305. API: OH_ArkUI_SpanStyle_GetGestureStyle, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_GestureStyle, OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_305', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_305()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_306
     * @tc.name    TestArkUICapi_306
     * @tc.desc    Case: TestArkUICapi_306. API: OH_ArkUI_SpanStyle_SetTextShadowStyle, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_TextShadowStyle, OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_306', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_306()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_307
     * @tc.name    TestArkUICapi_307
     * @tc.desc    Case: TestArkUICapi_307. API: OH_ArkUI_SpanStyle_GetTextShadowStyle, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_TextShadowStyle, OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_307', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_307()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_308
     * @tc.name    TestArkUICapi_308
     * @tc.desc    Case: TestArkUICapi_308. API: OH_ArkUI_SpanStyle_SetDecorationStyle, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_DecorationStyle, OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_308', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_308()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_309
     * @tc.name    TestArkUICapi_309
     * @tc.desc    Case: TestArkUICapi_309. API: OH_ArkUI_SpanStyle_GetDecorationStyle, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_DecorationStyle, OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_309', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_309()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_310
     * @tc.name    TestArkUICapi_310
     * @tc.desc    Case: TestArkUICapi_310. API: OH_ArkUI_SpanStyle_SetBaselineOffsetStyle, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_BaselineOffsetStyle, OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_310', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_310()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_311
     * @tc.name    TestArkUICapi_311
     * @tc.desc    Case: TestArkUICapi_311. API: OH_ArkUI_SpanStyle_GetBaselineOffsetStyle, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_BaselineOffsetStyle, OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_311', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_311()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_312
     * @tc.name    TestArkUICapi_312
     * @tc.desc    Case: TestArkUICapi_312. API: OH_ArkUI_SpanStyle_SetLetterSpacingStyle, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_LetterSpacingStyle, OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_312', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_312()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_313
     * @tc.name    TestArkUICapi_313
     * @tc.desc    Case: TestArkUICapi_313. API: OH_ArkUI_SpanStyle_GetLetterSpacingStyle, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_LetterSpacingStyle, OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_313', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_313()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_314
     * @tc.name    TestArkUICapi_314
     * @tc.desc    Case: TestArkUICapi_314. API: OH_ArkUI_SpanStyle_SetLineHeightStyle, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_LineHeightStyle, OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_314', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_314()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_315
     * @tc.name    TestArkUICapi_315
     * @tc.desc    Case: TestArkUICapi_315. API: OH_ArkUI_SpanStyle_GetLineHeightStyle, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_LineHeightStyle, OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_315', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_315()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_316
     * @tc.name    TestArkUICapi_316
     * @tc.desc    Case: TestArkUICapi_316. API: OH_ArkUI_SpanStyle_SetUrlStyle, OH_ArkUI_SpanStyle, OH_ArkUI_UrlStyle,
     *             OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_316', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_316()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_317
     * @tc.name    TestArkUICapi_317
     * @tc.desc    Case: TestArkUICapi_317. API: OH_ArkUI_SpanStyle_GetUrlStyle, OH_ArkUI_SpanStyle, OH_ArkUI_UrlStyle,
     *             OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_317', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_317()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_318
     * @tc.name    TestArkUICapi_318
     * @tc.desc    Case: TestArkUICapi_318. API: OH_ArkUI_SpanStyle_SetBackgroundColorStyle, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_BackgroundColorStyle, OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_318', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_318()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_319
     * @tc.name    TestArkUICapi_319
     * @tc.desc    Case: TestArkUICapi_319. API: OH_ArkUI_SpanStyle_GetBackgroundColorStyle, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_BackgroundColorStyle, OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_319', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_319()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_320
     * @tc.name    TestArkUICapi_320
     * @tc.desc    Case: TestArkUICapi_320. API: OH_ArkUI_SpanStyle_SetUserDataSpan, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_UserDataSpan, OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_320', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_320()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_321
     * @tc.name    TestArkUICapi_321
     * @tc.desc    Case: TestArkUICapi_321. API: OH_ArkUI_SpanStyle_GetUserDataSpan, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_UserDataSpan, OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_321', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_321()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_322
     * @tc.name    TestArkUICapi_322
     * @tc.desc    Case: TestArkUICapi_322. API: OH_ArkUI_SpanStyle_SetCustomSpan, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_CustomSpan, OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_322', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_322()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_323
     * @tc.name    TestArkUICapi_323
     * @tc.desc    Case: TestArkUICapi_323. API: OH_ArkUI_SpanStyle_GetCustomSpan, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_CustomSpan, OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_323', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_323()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_324
     * @tc.name    TestArkUICapi_324
     * @tc.desc    Case: TestArkUICapi_324. API: OH_ArkUI_SpanStyle_SetImageAttachment, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_ImageAttachment, OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_324', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_324()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_325
     * @tc.name    TestArkUICapi_325
     * @tc.desc    Case: TestArkUICapi_325. API: OH_ArkUI_SpanStyle_GetImageAttachment, OH_ArkUI_SpanStyle,
     *             OH_ArkUI_ImageAttachment, OH_ArkUI_SpanStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_325', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_325()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_326
     * @tc.name    TestArkUICapi_326
     * @tc.desc    Case: TestArkUICapi_326. API: OH_ArkUI_LeadingMarginSpanDrawInfo_Create. Note: non-ASCII details are
     *             in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_326', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_326()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_327
     * @tc.name    TestArkUICapi_327
     * @tc.desc    Case: TestArkUICapi_327. API: OH_ArkUI_LeadingMarginSpanDrawInfo_Destroy,
     *             OH_ArkUI_LeadingMarginSpanDrawInfo_Create. Note: non-ASCII details are in the workbook and native C++
     *             comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_327', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_327()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_328
     * @tc.name    TestArkUICapi_328
     * @tc.desc    Case: TestArkUICapi_328. API: OH_ArkUI_LeadingMarginSpanDrawInfo_SetX,
     *             OH_ArkUI_LeadingMarginSpanDrawInfo, OH_ArkUI_LeadingMarginSpanDrawInfo_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_328', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_328()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_329
     * @tc.name    TestArkUICapi_329
     * @tc.desc    Case: TestArkUICapi_329. API: OH_ArkUI_LeadingMarginSpanDrawInfo_GetX,
     *             OH_ArkUI_LeadingMarginSpanDrawInfo, OH_ArkUI_LeadingMarginSpanDrawInfo_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_329', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_329()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_330
     * @tc.name    TestArkUICapi_330
     * @tc.desc    Case: TestArkUICapi_330. API: OH_ArkUI_LeadingMarginSpanDrawInfo_SetTop,
     *             OH_ArkUI_LeadingMarginSpanDrawInfo, OH_ArkUI_LeadingMarginSpanDrawInfo_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_330', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_330()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_331
     * @tc.name    TestArkUICapi_331
     * @tc.desc    Case: TestArkUICapi_331. API: OH_ArkUI_LeadingMarginSpanDrawInfo_GetTop,
     *             OH_ArkUI_LeadingMarginSpanDrawInfo, OH_ArkUI_LeadingMarginSpanDrawInfo_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_331', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_331()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_332
     * @tc.name    TestArkUICapi_332
     * @tc.desc    Case: TestArkUICapi_332. API: OH_ArkUI_LeadingMarginSpanDrawInfo_SetBottom,
     *             OH_ArkUI_LeadingMarginSpanDrawInfo, OH_ArkUI_LeadingMarginSpanDrawInfo_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_332', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_332()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_333
     * @tc.name    TestArkUICapi_333
     * @tc.desc    Case: TestArkUICapi_333. API: OH_ArkUI_LeadingMarginSpanDrawInfo_GetBottom,
     *             OH_ArkUI_LeadingMarginSpanDrawInfo, OH_ArkUI_LeadingMarginSpanDrawInfo_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_333', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_333()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_334
     * @tc.name    TestArkUICapi_334
     * @tc.desc    Case: TestArkUICapi_334. API: OH_ArkUI_LeadingMarginSpanDrawInfo_SetBaseline,
     *             OH_ArkUI_LeadingMarginSpanDrawInfo, OH_ArkUI_LeadingMarginSpanDrawInfo_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_334', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_334()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_335
     * @tc.name    TestArkUICapi_335
     * @tc.desc    Case: TestArkUICapi_335. API: OH_ArkUI_LeadingMarginSpanDrawInfo_GetBaseline,
     *             OH_ArkUI_LeadingMarginSpanDrawInfo, OH_ArkUI_LeadingMarginSpanDrawInfo_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_335', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_335()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_336
     * @tc.name    TestArkUICapi_336
     * @tc.desc    Case: TestArkUICapi_336. API: OH_ArkUI_LeadingMarginSpanDrawInfo_SetTextDirection,
     *             OH_ArkUI_LeadingMarginSpanDrawInfo, ArkUI_TextDirection, OH_ArkUI_LeadingMarginSpanDrawInfo_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_336', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_336()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_337
     * @tc.name    TestArkUICapi_337
     * @tc.desc    Case: TestArkUICapi_337. API: OH_ArkUI_LeadingMarginSpanDrawInfo_GetTextDirection,
     *             OH_ArkUI_LeadingMarginSpanDrawInfo, ArkUI_TextDirection, OH_ArkUI_LeadingMarginSpanDrawInfo_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_337', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_337()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_338
     * @tc.name    TestArkUICapi_338
     * @tc.desc    Case: TestArkUICapi_338. API: OH_ArkUI_LeadingMarginSpanDrawInfo_SetStart,
     *             OH_ArkUI_LeadingMarginSpanDrawInfo, OH_ArkUI_LeadingMarginSpanDrawInfo_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_338', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_338()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_339
     * @tc.name    TestArkUICapi_339
     * @tc.desc    Case: TestArkUICapi_339. API: OH_ArkUI_LeadingMarginSpanDrawInfo_GetStart,
     *             OH_ArkUI_LeadingMarginSpanDrawInfo, OH_ArkUI_LeadingMarginSpanDrawInfo_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_339', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_339()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_340
     * @tc.name    TestArkUICapi_340
     * @tc.desc    Case: TestArkUICapi_340. API: OH_ArkUI_LeadingMarginSpanDrawInfo_SetEnd,
     *             OH_ArkUI_LeadingMarginSpanDrawInfo, OH_ArkUI_LeadingMarginSpanDrawInfo_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_340', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_340()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_341
     * @tc.name    TestArkUICapi_341
     * @tc.desc    Case: TestArkUICapi_341. API: OH_ArkUI_LeadingMarginSpanDrawInfo_GetEnd,
     *             OH_ArkUI_LeadingMarginSpanDrawInfo, OH_ArkUI_LeadingMarginSpanDrawInfo_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_341', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_341()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_342
     * @tc.name    TestArkUICapi_342
     * @tc.desc    Case: TestArkUICapi_342. API: OH_ArkUI_LeadingMarginSpanDrawInfo_SetFirst,
     *             OH_ArkUI_LeadingMarginSpanDrawInfo, OH_ArkUI_LeadingMarginSpanDrawInfo_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_342', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_342()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_343
     * @tc.name    TestArkUICapi_343
     * @tc.desc    Case: TestArkUICapi_343. API: OH_ArkUI_LeadingMarginSpanDrawInfo_GetFirst,
     *             OH_ArkUI_LeadingMarginSpanDrawInfo, OH_ArkUI_LeadingMarginSpanDrawInfo_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_343', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_343()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_344
     * @tc.name    TestArkUICapi_344
     * @tc.desc    Case: TestArkUICapi_344. API: OH_ArkUI_ParagraphStyle_Create. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_344', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_344()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_345
     * @tc.name    TestArkUICapi_345
     * @tc.desc    Case: TestArkUICapi_345. API: OH_ArkUI_ParagraphStyle_Destroy, OH_ArkUI_ParagraphStyle_Create. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_345', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_345()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_346
     * @tc.name    TestArkUICapi_346
     * @tc.desc    Case: TestArkUICapi_346. API: OH_ArkUI_ParagraphStyle_SetTextAlign, OH_ArkUI_ParagraphStyle,
     *             ArkUI_TextAlignment, OH_ArkUI_ParagraphStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_346', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_346()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_347
     * @tc.name    TestArkUICapi_347
     * @tc.desc    Case: TestArkUICapi_347. API: OH_ArkUI_ParagraphStyle_GetTextAlign, OH_ArkUI_ParagraphStyle,
     *             ArkUI_TextAlignment, OH_ArkUI_ParagraphStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_347', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_347()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_348
     * @tc.name    TestArkUICapi_348
     * @tc.desc    Case: TestArkUICapi_348. API: OH_ArkUI_ParagraphStyle_SetTextIndent, OH_ArkUI_ParagraphStyle,
     *             OH_ArkUI_ParagraphStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_348', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_348()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_349
     * @tc.name    TestArkUICapi_349
     * @tc.desc    Case: TestArkUICapi_349. API: OH_ArkUI_ParagraphStyle_GetTextIndent, OH_ArkUI_ParagraphStyle,
     *             OH_ArkUI_ParagraphStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_349', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_349()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_350
     * @tc.name    TestArkUICapi_350
     * @tc.desc    Case: TestArkUICapi_350. API: OH_ArkUI_ParagraphStyle_SetMaxLines, OH_ArkUI_ParagraphStyle,
     *             OH_ArkUI_ParagraphStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_350', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_350()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_351
     * @tc.name    TestArkUICapi_351
     * @tc.desc    Case: TestArkUICapi_351. API: OH_ArkUI_ParagraphStyle_GetMaxLines, OH_ArkUI_ParagraphStyle,
     *             OH_ArkUI_ParagraphStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_351', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_351()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_352
     * @tc.name    TestArkUICapi_352
     * @tc.desc    Case: TestArkUICapi_352. API: OH_ArkUI_ParagraphStyle_SetOverflow, OH_ArkUI_ParagraphStyle,
     *             ArkUI_TextOverflow, OH_ArkUI_ParagraphStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_352', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_352()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_353
     * @tc.name    TestArkUICapi_353
     * @tc.desc    Case: TestArkUICapi_353. API: OH_ArkUI_ParagraphStyle_GetOverflow, OH_ArkUI_ParagraphStyle,
     *             ArkUI_TextOverflow, OH_ArkUI_ParagraphStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_353', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_353()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_354
     * @tc.name    TestArkUICapi_354
     * @tc.desc    Case: TestArkUICapi_354. API: OH_ArkUI_ParagraphStyle_SetWordBreak, OH_ArkUI_ParagraphStyle,
     *             ArkUI_WordBreak, OH_ArkUI_ParagraphStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_354', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_354()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_355
     * @tc.name    TestArkUICapi_355
     * @tc.desc    Case: TestArkUICapi_355. API: OH_ArkUI_ParagraphStyle_GetWordBreak, OH_ArkUI_ParagraphStyle,
     *             ArkUI_WordBreak, OH_ArkUI_ParagraphStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_355', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_355()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_356
     * @tc.name    TestArkUICapi_356
     * @tc.desc    Case: TestArkUICapi_356. API: OH_ArkUI_ParagraphStyle_SetLeadingMarginPixelMap,
     *             OH_ArkUI_ParagraphStyle, OH_PixelmapNative, OH_ArkUI_ParagraphStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_356', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_356()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_357
     * @tc.name    TestArkUICapi_357
     * @tc.desc    Case: TestArkUICapi_357. API: OH_ArkUI_ParagraphStyle_GetLeadingMarginPixelMap,
     *             OH_ArkUI_ParagraphStyle, OH_PixelmapNative, OH_ArkUI_ParagraphStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_357', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_357()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_358
     * @tc.name    TestArkUICapi_358
     * @tc.desc    Case: TestArkUICapi_358. API: OH_ArkUI_ParagraphStyle_SetLeadingMarginWidth, OH_ArkUI_ParagraphStyle,
     *             OH_ArkUI_ParagraphStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_358', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_358()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_359
     * @tc.name    TestArkUICapi_359
     * @tc.desc    Case: TestArkUICapi_359. API: OH_ArkUI_ParagraphStyle_GetLeadingMarginWidth, OH_ArkUI_ParagraphStyle,
     *             OH_ArkUI_ParagraphStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_359', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_359()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_360
     * @tc.name    TestArkUICapi_360
     * @tc.desc    Case: TestArkUICapi_360. API: OH_ArkUI_ParagraphStyle_SetLeadingMarginHeight,
     *             OH_ArkUI_ParagraphStyle, OH_ArkUI_ParagraphStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_360', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_360()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_361
     * @tc.name    TestArkUICapi_361
     * @tc.desc    Case: TestArkUICapi_361. API: OH_ArkUI_ParagraphStyle_GetLeadingMarginHeight,
     *             OH_ArkUI_ParagraphStyle, OH_ArkUI_ParagraphStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_361', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_361()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_362
     * @tc.name    TestArkUICapi_362
     * @tc.desc    Case: TestArkUICapi_362. API: OH_ArkUI_ParagraphStyle_SetParagraphSpacing, OH_ArkUI_ParagraphStyle,
     *             OH_ArkUI_ParagraphStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_362', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_362()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_363
     * @tc.name    TestArkUICapi_363
     * @tc.desc    Case: TestArkUICapi_363. API: OH_ArkUI_ParagraphStyle_GetParagraphSpacing, OH_ArkUI_ParagraphStyle,
     *             OH_ArkUI_ParagraphStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_363', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_363()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_364
     * @tc.name    TestArkUICapi_364
     * @tc.desc    Case: TestArkUICapi_364. API: OH_ArkUI_ParagraphStyle_SetTextVerticalAlign, OH_ArkUI_ParagraphStyle,
     *             ArkUI_TextVerticalAlignment, OH_ArkUI_ParagraphStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_364', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_364()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_365
     * @tc.name    TestArkUICapi_365
     * @tc.desc    Case: TestArkUICapi_365. API: OH_ArkUI_ParagraphStyle_GetTextVerticalAlign, OH_ArkUI_ParagraphStyle,
     *             ArkUI_TextVerticalAlignment, OH_ArkUI_ParagraphStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_365', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_365()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_366
     * @tc.name    TestArkUICapi_366
     * @tc.desc    Case: TestArkUICapi_366. API: OH_ArkUI_ParagraphStyle_RegisterOnDrawLeadingMarginCallback. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_366', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_366()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_367
     * @tc.name    TestArkUICapi_367
     * @tc.desc    Case: TestArkUICapi_367. API: OH_ArkUI_ParagraphStyle_RegisterOnGetLeadingMarginCallback,
     *             OH_ArkUI_ParagraphStyle, OH_ArkUI_ParagraphStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_367', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_367()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_368
     * @tc.name    TestArkUICapi_368
     * @tc.desc    Case: TestArkUICapi_368. API: OH_ArkUI_ParagraphStyle_SetTextDirection, OH_ArkUI_ParagraphStyle,
     *             ArkUI_TextDirection, OH_ArkUI_ParagraphStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_368', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_368()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_369
     * @tc.name    TestArkUICapi_369
     * @tc.desc    Case: TestArkUICapi_369. API: OH_ArkUI_ParagraphStyle_GetTextDirection, OH_ArkUI_ParagraphStyle,
     *             ArkUI_TextDirection, OH_ArkUI_ParagraphStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_369', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_369()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_370
     * @tc.name    TestArkUICapi_370
     * @tc.desc    Case: TestArkUICapi_370. API: OH_ArkUI_GestureStyle_Create. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_370', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_370()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_371
     * @tc.name    TestArkUICapi_371
     * @tc.desc    Case: TestArkUICapi_371. API: OH_ArkUI_GestureStyle_Destroy, OH_ArkUI_GestureStyle_Create. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_371', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_371()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_372
     * @tc.name    TestArkUICapi_372
     * @tc.desc    Case: TestArkUICapi_372. API: OH_ArkUI_GestureStyle_RegisterOnClickCallback, OH_ArkUI_GestureStyle,
     *             ArkUI_NodeEvent, OH_ArkUI_GestureStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are
     *             in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_372', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_372()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_373
     * @tc.name    TestArkUICapi_373
     * @tc.desc    Case: TestArkUICapi_373. API: OH_ArkUI_GestureStyle_RegisterOnLongPressCallback,
     *             OH_ArkUI_GestureStyle, ArkUI_GestureEvent, OH_ArkUI_GestureStyle_Create, ARKUI_ERROR_CODE_NO_ERROR.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_373', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_373()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_374
     * @tc.name    TestArkUICapi_374
     * @tc.desc    Case: TestArkUICapi_374. API: OH_ArkUI_GestureStyle_RegisterOnTouchCallback, OH_ArkUI_GestureStyle,
     *             ArkUI_NodeEvent, OH_ArkUI_GestureStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are
     *             in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_374', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_374()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_375
     * @tc.name    TestArkUICapi_375
     * @tc.desc    Case: TestArkUICapi_375. API: OH_ArkUI_TextShadowStyle_Create. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_375', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_375()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_376
     * @tc.name    TestArkUICapi_376
     * @tc.desc    Case: TestArkUICapi_376. API: OH_ArkUI_TextShadowStyle_Destroy, OH_ArkUI_TextShadowStyle_Create.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_376', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_376()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_377
     * @tc.name    TestArkUICapi_377
     * @tc.desc    Case: TestArkUICapi_377. API: OH_ArkUI_TextShadowStyle_SetTextShadow, OH_ArkUI_TextShadowStyle,
     *             OH_ArkUI_ShadowOptions, OH_ArkUI_TextShadowStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_377', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_377()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_378
     * @tc.name    TestArkUICapi_378
     * @tc.desc    Case: TestArkUICapi_378. API: OH_ArkUI_TextShadowStyle_GetTextShadow, OH_ArkUI_TextShadowStyle,
     *             OH_ArkUI_ShadowOptions, OH_ArkUI_TextShadowStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_378', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_378()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_379
     * @tc.name    TestArkUICapi_379
     * @tc.desc    Case: TestArkUICapi_379. API: OH_ArkUI_DecorationStyle_Create. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_379', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_379()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_380
     * @tc.name    TestArkUICapi_380
     * @tc.desc    Case: TestArkUICapi_380. API: OH_ArkUI_DecorationStyle_Destroy, OH_ArkUI_DecorationStyle_Create.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_380', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_380()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_381
     * @tc.name    TestArkUICapi_381
     * @tc.desc    Case: TestArkUICapi_381. API: OH_ArkUI_DecorationStyle_SetTextDecorationType,
     *             OH_ArkUI_DecorationStyle, ArkUI_TextDecorationType, OH_ArkUI_DecorationStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_381', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_381()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_382
     * @tc.name    TestArkUICapi_382
     * @tc.desc    Case: TestArkUICapi_382. API: OH_ArkUI_DecorationStyle_GetTextDecorationType,
     *             OH_ArkUI_DecorationStyle, ArkUI_TextDecorationType, OH_ArkUI_DecorationStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_382', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_382()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_383
     * @tc.name    TestArkUICapi_383
     * @tc.desc    Case: TestArkUICapi_383. API: OH_ArkUI_DecorationStyle_SetColor, OH_ArkUI_DecorationStyle,
     *             OH_ArkUI_DecorationStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_383', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_383()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_384
     * @tc.name    TestArkUICapi_384
     * @tc.desc    Case: TestArkUICapi_384. API: OH_ArkUI_DecorationStyle_GetColor, OH_ArkUI_DecorationStyle,
     *             OH_ArkUI_DecorationStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_384', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_384()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_385
     * @tc.name    TestArkUICapi_385
     * @tc.desc    Case: TestArkUICapi_385. API: OH_ArkUI_DecorationStyle_SetTextDecorationStyle,
     *             OH_ArkUI_DecorationStyle, ArkUI_TextDecorationStyle, OH_ArkUI_DecorationStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_385', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_385()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_386
     * @tc.name    TestArkUICapi_386
     * @tc.desc    Case: TestArkUICapi_386. API: OH_ArkUI_DecorationStyle_GetTextDecorationStyle,
     *             OH_ArkUI_DecorationStyle, ArkUI_TextDecorationStyle, OH_ArkUI_DecorationStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_386', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_386()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_387
     * @tc.name    TestArkUICapi_387
     * @tc.desc    Case: TestArkUICapi_387. API: OH_ArkUI_DecorationStyle_SetThicknessScale, OH_ArkUI_DecorationStyle,
     *             OH_ArkUI_DecorationStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_387', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_387()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_388
     * @tc.name    TestArkUICapi_388
     * @tc.desc    Case: TestArkUICapi_388. API: OH_ArkUI_DecorationStyle_GetThicknessScale, OH_ArkUI_DecorationStyle,
     *             OH_ArkUI_DecorationStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_388', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_388()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_389
     * @tc.name    TestArkUICapi_389
     * @tc.desc    Case: TestArkUICapi_389. API: OH_ArkUI_DecorationStyle_SetEnableMultiType, OH_ArkUI_DecorationStyle,
     *             OH_ArkUI_DecorationStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_389', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_389()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_390
     * @tc.name    TestArkUICapi_390
     * @tc.desc    Case: TestArkUICapi_390. API: OH_ArkUI_DecorationStyle_GetEnableMultiType, OH_ArkUI_DecorationStyle,
     *             OH_ArkUI_DecorationStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_390', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_390()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_391
     * @tc.name    TestArkUICapi_391
     * @tc.desc    Case: TestArkUICapi_391. API: OH_ArkUI_BaselineOffsetStyle_Create. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_391', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_391()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_392
     * @tc.name    TestArkUICapi_392
     * @tc.desc    Case: TestArkUICapi_392. API: OH_ArkUI_BaselineOffsetStyle_Destroy,
     *             OH_ArkUI_BaselineOffsetStyle_Create. Note: non-ASCII details are in the workbook and native C++
     *             comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_392', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_392()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_393
     * @tc.name    TestArkUICapi_393
     * @tc.desc    Case: TestArkUICapi_393. API: OH_ArkUI_BaselineOffsetStyle_SetBaselineOffset,
     *             OH_ArkUI_BaselineOffsetStyle, OH_ArkUI_BaselineOffsetStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_393', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_393()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_394
     * @tc.name    TestArkUICapi_394
     * @tc.desc    Case: TestArkUICapi_394. API: OH_ArkUI_BaselineOffsetStyle_GetBaselineOffset,
     *             OH_ArkUI_BaselineOffsetStyle, OH_ArkUI_BaselineOffsetStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_394', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_394()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_395
     * @tc.name    TestArkUICapi_395
     * @tc.desc    Case: TestArkUICapi_395. API: OH_ArkUI_LetterSpacingStyle_Create. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_395', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_395()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_396
     * @tc.name    TestArkUICapi_396
     * @tc.desc    Case: TestArkUICapi_396. API: OH_ArkUI_LetterSpacingStyle_Destroy,
     *             OH_ArkUI_LetterSpacingStyle_Create. Note: non-ASCII details are in the workbook and native C++
     *             comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_396', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_396()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_397
     * @tc.name    TestArkUICapi_397
     * @tc.desc    Case: TestArkUICapi_397. API: OH_ArkUI_LetterSpacingStyle_SetLetterSpacing,
     *             OH_ArkUI_LetterSpacingStyle, OH_ArkUI_LetterSpacingStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_397', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_397()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_398
     * @tc.name    TestArkUICapi_398
     * @tc.desc    Case: TestArkUICapi_398. API: OH_ArkUI_LetterSpacingStyle_GetLetterSpacing,
     *             OH_ArkUI_LetterSpacingStyle, OH_ArkUI_LetterSpacingStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_398', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_398()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_399
     * @tc.name    TestArkUICapi_399
     * @tc.desc    Case: TestArkUICapi_399. API: OH_ArkUI_LineHeightStyle_Create. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_399', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_399()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_400
     * @tc.name    TestArkUICapi_400
     * @tc.desc    Case: TestArkUICapi_400. API: OH_ArkUI_LineHeightStyle_Destroy, OH_ArkUI_LineHeightStyle_Create.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_400', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_400()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_401
     * @tc.name    TestArkUICapi_401
     * @tc.desc    Case: TestArkUICapi_401. API: OH_ArkUI_LineHeightStyle_SetLineHeight, OH_ArkUI_LineHeightStyle,
     *             OH_ArkUI_LineHeightStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_401', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_401()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_402
     * @tc.name    TestArkUICapi_402
     * @tc.desc    Case: TestArkUICapi_402. API: OH_ArkUI_LineHeightStyle_GetLineHeight, OH_ArkUI_LineHeightStyle,
     *             OH_ArkUI_LineHeightStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_402', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_402()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_403
     * @tc.name    TestArkUICapi_403
     * @tc.desc    Case: TestArkUICapi_403. API: OH_ArkUI_BackgroundColorStyle_Create. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_403', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_403()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_404
     * @tc.name    TestArkUICapi_404
     * @tc.desc    Case: TestArkUICapi_404. API: OH_ArkUI_BackgroundColorStyle_Destroy,
     *             OH_ArkUI_BackgroundColorStyle_Create. Note: non-ASCII details are in the workbook and native C++
     *             comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_404', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_404()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_405
     * @tc.name    TestArkUICapi_405
     * @tc.desc    Case: TestArkUICapi_405. API: OH_ArkUI_BackgroundColorStyle_SetColor, OH_ArkUI_BackgroundColorStyle,
     *             OH_ArkUI_BackgroundColorStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_405', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_405()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_406
     * @tc.name    TestArkUICapi_406
     * @tc.desc    Case: TestArkUICapi_406. API: OH_ArkUI_BackgroundColorStyle_GetColor, OH_ArkUI_BackgroundColorStyle,
     *             OH_ArkUI_BackgroundColorStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_406', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_406()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_407
     * @tc.name    TestArkUICapi_407
     * @tc.desc    Case: TestArkUICapi_407. API: OH_ArkUI_BackgroundColorStyle_SetRadius, OH_ArkUI_BackgroundColorStyle,
     *             OH_ArkUI_BackgroundColorStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_407', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_407()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_408
     * @tc.name    TestArkUICapi_408
     * @tc.desc    Case: TestArkUICapi_408. API: OH_ArkUI_BackgroundColorStyle_GetRadius, OH_ArkUI_BackgroundColorStyle,
     *             OH_ArkUI_BackgroundColorStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_408', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_408()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_409
     * @tc.name    TestArkUICapi_409
     * @tc.desc    Case: TestArkUICapi_409. API: OH_ArkUI_UrlStyle_Create. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_409', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_409()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_410
     * @tc.name    TestArkUICapi_410
     * @tc.desc    Case: TestArkUICapi_410. API: OH_ArkUI_UrlStyle_Destroy, OH_ArkUI_UrlStyle_Create. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_410', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_410()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_411
     * @tc.name    TestArkUICapi_411
     * @tc.desc    Case: TestArkUICapi_411. API: OH_ArkUI_UrlStyle_SetUrl, OH_ArkUI_UrlStyle, OH_ArkUI_UrlStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_411', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_411()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_412
     * @tc.name    TestArkUICapi_412
     * @tc.desc    Case: TestArkUICapi_412. API: OH_ArkUI_UrlStyle_GetUrl, OH_ArkUI_UrlStyle, OH_ArkUI_UrlStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_412', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_412()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_413
     * @tc.name    TestArkUICapi_413
     * @tc.desc    Case: TestArkUICapi_413. API: OH_ArkUI_UserDataSpan_Create. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_413', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_413()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_414
     * @tc.name    TestArkUICapi_414
     * @tc.desc    Case: TestArkUICapi_414. API: OH_ArkUI_UserDataSpan_Destroy, OH_ArkUI_UserDataSpan_Create. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_414', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_414()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_415
     * @tc.name    TestArkUICapi_415
     * @tc.desc    Case: TestArkUICapi_415. API: OH_ArkUI_UserDataSpan_SetUserData, OH_ArkUI_UserDataSpan,
     *             OH_ArkUI_UserDataSpan_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_415', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_415()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_416
     * @tc.name    TestArkUICapi_416
     * @tc.desc    Case: TestArkUICapi_416. API: OH_ArkUI_UserDataSpan_GetUserData, OH_ArkUI_UserDataSpan,
     *             OH_ArkUI_UserDataSpan_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_416', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_416()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_417
     * @tc.name    TestArkUICapi_417
     * @tc.desc    Case: TestArkUICapi_417. API: OH_ArkUI_CustomSpan_Create. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_417', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_417()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_418
     * @tc.name    TestArkUICapi_418
     * @tc.desc    Case: TestArkUICapi_418. API: OH_ArkUI_CustomSpan_Destroy, OH_ArkUI_CustomSpan_Create. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_418', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_418()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_419
     * @tc.name    TestArkUICapi_419
     * @tc.desc    Case: TestArkUICapi_419. API: OH_ArkUI_CustomSpan_RegisterOnMeasureCallback, OH_ArkUI_CustomSpan,
     *             ArkUI_CustomSpanMetrics, OH_ArkUI_CustomSpan_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_419', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_419()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_420
     * @tc.name    TestArkUICapi_420
     * @tc.desc    Case: TestArkUICapi_420. API: OH_ArkUI_CustomSpan_RegisterOnDrawCallback, OH_ArkUI_CustomSpan,
     *             ArkUI_DrawContext, ArkUI_CustomSpanDrawInfo, OH_ArkUI_CustomSpan_Create, ARKUI_ERROR_CODE_NO_ERROR.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_420', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_420()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_421
     * @tc.name    TestArkUICapi_421
     * @tc.desc    Case: TestArkUICapi_421. API: OH_ArkUI_ImageAttachment_Create. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_421', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_421()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_422
     * @tc.name    TestArkUICapi_422
     * @tc.desc    Case: TestArkUICapi_422. API: OH_ArkUI_ImageAttachment_Destroy, OH_ArkUI_ImageAttachment_Create.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_422', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_422()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_423
     * @tc.name    TestArkUICapi_423
     * @tc.desc    Case: TestArkUICapi_423. API: OH_ArkUI_ImageAttachment_SetPixelMap, OH_ArkUI_ImageAttachment,
     *             OH_PixelmapNative, OH_ArkUI_ImageAttachment_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_423', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_423()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_424
     * @tc.name    TestArkUICapi_424
     * @tc.desc    Case: TestArkUICapi_424. API: OH_ArkUI_ImageAttachment_GetPixelMap, OH_ArkUI_ImageAttachment,
     *             OH_PixelmapNative, OH_ArkUI_ImageAttachment_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_424', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_424()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_425
     * @tc.name    TestArkUICapi_425
     * @tc.desc    Case: TestArkUICapi_425. API: OH_ArkUI_ImageAttachment_SetResource, OH_ArkUI_ImageAttachment,
     *             OH_ArkUI_ImageAttachment_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_425', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_425()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_426
     * @tc.name    TestArkUICapi_426
     * @tc.desc    Case: TestArkUICapi_426. API: OH_ArkUI_ImageAttachment_GetResource, OH_ArkUI_ImageAttachment,
     *             OH_ArkUI_ImageAttachment_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_426', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_426()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_427
     * @tc.name    TestArkUICapi_427
     * @tc.desc    Case: TestArkUICapi_427. API: OH_ArkUI_ImageAttachment_SetSizeWidth, OH_ArkUI_ImageAttachment,
     *             OH_ArkUI_ImageAttachment_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_427', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_427()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_428
     * @tc.name    TestArkUICapi_428
     * @tc.desc    Case: TestArkUICapi_428. API: OH_ArkUI_ImageAttachment_GetSizeWidth, OH_ArkUI_ImageAttachment,
     *             OH_ArkUI_ImageAttachment_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_428', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_428()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_429
     * @tc.name    TestArkUICapi_429
     * @tc.desc    Case: TestArkUICapi_429. API: OH_ArkUI_ImageAttachment_SetSizeHeight, OH_ArkUI_ImageAttachment,
     *             OH_ArkUI_ImageAttachment_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_429', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_429()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_430
     * @tc.name    TestArkUICapi_430
     * @tc.desc    Case: TestArkUICapi_430. API: OH_ArkUI_ImageAttachment_GetSizeHeight, OH_ArkUI_ImageAttachment,
     *             OH_ArkUI_ImageAttachment_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_430', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_430()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_431
     * @tc.name    TestArkUICapi_431
     * @tc.desc    Case: TestArkUICapi_431. API: OH_ArkUI_ImageAttachment_SetVerticalAlign, OH_ArkUI_ImageAttachment,
     *             ArkUI_ImageSpanAlignment, OH_ArkUI_ImageAttachment_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_431', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_431()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_432
     * @tc.name    TestArkUICapi_432
     * @tc.desc    Case: TestArkUICapi_432. API: OH_ArkUI_ImageAttachment_GetVerticalAlign, OH_ArkUI_ImageAttachment,
     *             ArkUI_ImageSpanAlignment, OH_ArkUI_ImageAttachment_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_432', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_432()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_433
     * @tc.name    TestArkUICapi_433
     * @tc.desc    Case: TestArkUICapi_433. API: OH_ArkUI_ImageAttachment_SetObjectFit, OH_ArkUI_ImageAttachment,
     *             ArkUI_ObjectFit, OH_ArkUI_ImageAttachment_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_433', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_433()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_434
     * @tc.name    TestArkUICapi_434
     * @tc.desc    Case: TestArkUICapi_434. API: OH_ArkUI_ImageAttachment_GetObjectFit, OH_ArkUI_ImageAttachment,
     *             ArkUI_ObjectFit, OH_ArkUI_ImageAttachment_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_434', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_434()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_435
     * @tc.name    TestArkUICapi_435
     * @tc.desc    Case: TestArkUICapi_435. API: OH_ArkUI_ImageAttachment_SetMargin, OH_ArkUI_ImageAttachment,
     *             ArkUI_Margin, OH_ArkUI_ImageAttachment_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are
     *             in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_435', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_435()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_436
     * @tc.name    TestArkUICapi_436
     * @tc.desc    Case: TestArkUICapi_436. API: OH_ArkUI_ImageAttachment_GetMargin, OH_ArkUI_ImageAttachment,
     *             ArkUI_Margin, OH_ArkUI_ImageAttachment_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are
     *             in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_436', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_436()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_437
     * @tc.name    TestArkUICapi_437
     * @tc.desc    Case: TestArkUICapi_437. API: OH_ArkUI_ImageAttachment_SetPadding, OH_ArkUI_ImageAttachment,
     *             ArkUI_Margin, OH_ArkUI_ImageAttachment_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are
     *             in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_437', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_437()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_438
     * @tc.name    TestArkUICapi_438
     * @tc.desc    Case: TestArkUICapi_438. API: OH_ArkUI_ImageAttachment_GetPadding, OH_ArkUI_ImageAttachment,
     *             ArkUI_Margin, OH_ArkUI_ImageAttachment_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are
     *             in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_438', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_438()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_439
     * @tc.name    TestArkUICapi_439
     * @tc.desc    Case: TestArkUICapi_439. API: OH_ArkUI_ImageAttachment_SetBorderRadiuses, OH_ArkUI_ImageAttachment,
     *             OH_ArkUI_ImageAttachment_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_439', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_439()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_440
     * @tc.name    TestArkUICapi_440
     * @tc.desc    Case: TestArkUICapi_440. API: OH_ArkUI_ImageAttachment_GetBorderRadiuses, OH_ArkUI_ImageAttachment,
     *             OH_ArkUI_ImageAttachment_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_440', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_440()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_441
     * @tc.name    TestArkUICapi_441
     * @tc.desc    Case: TestArkUICapi_441. API: OH_ArkUI_ImageAttachment_SetColorFilter, OH_ArkUI_ImageAttachment,
     *             OH_ArkUI_ImageAttachment_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_441', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_441()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_442
     * @tc.name    TestArkUICapi_442
     * @tc.desc    Case: TestArkUICapi_442. API: OH_ArkUI_ImageAttachment_GetColorFilter, OH_ArkUI_ImageAttachment,
     *             OH_ArkUI_ImageAttachment_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_442', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_442()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_443
     * @tc.name    TestArkUICapi_443
     * @tc.desc    Case: TestArkUICapi_443. API: OH_ArkUI_ImageAttachment_SetDrawingColorFilter,
     *             OH_ArkUI_ImageAttachment, OH_Drawing_ColorFilter, OH_ArkUI_ImageAttachment_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_443', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_443()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_444
     * @tc.name    TestArkUICapi_444
     * @tc.desc    Case: TestArkUICapi_444. API: OH_ArkUI_ImageAttachment_GetDrawingColorFilter,
     *             OH_ArkUI_ImageAttachment, OH_Drawing_ColorFilter, OH_ArkUI_ImageAttachment_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_444', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_444()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_445
     * @tc.name    TestArkUICapi_445
     * @tc.desc    Case: TestArkUICapi_445. API: OH_ArkUI_ImageAttachment_SetSyncLoad, OH_ArkUI_ImageAttachment,
     *             OH_ArkUI_ImageAttachment_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_445', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_445()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_446
     * @tc.name    TestArkUICapi_446
     * @tc.desc    Case: TestArkUICapi_446. API: OH_ArkUI_ImageAttachment_GetSyncLoad, OH_ArkUI_ImageAttachment,
     *             OH_ArkUI_ImageAttachment_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_446', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_446()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_447
     * @tc.name    TestArkUICapi_447
     * @tc.desc    Case: TestArkUICapi_447. API: OH_ArkUI_ImageAttachment_SetSupportSvg, OH_ArkUI_ImageAttachment,
     *             OH_ArkUI_ImageAttachment_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_447', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_447()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_448
     * @tc.name    TestArkUICapi_448
     * @tc.desc    Case: TestArkUICapi_448. API: OH_ArkUI_ImageAttachment_GetSupportSvg, OH_ArkUI_ImageAttachment,
     *             OH_ArkUI_ImageAttachment_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_448', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_448()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_449
     * @tc.name    TestArkUICapi_449
     * @tc.desc    Case: TestArkUICapi_449. API: OH_ArkUI_TextEditorChangeEvent_GetRangeBefore,
     *             OH_ArkUI_TextEditorChangeEvent. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_449', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_449()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_450
     * @tc.name    TestArkUICapi_450
     * @tc.desc    Case: TestArkUICapi_450. API: OH_ArkUI_TextEditorChangeEvent_GetReplacementStyledString,
     *             OH_ArkUI_TextEditorChangeEvent, ArkUI_StyledString_Descriptor. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_450', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_450()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_451
     * @tc.name    TestArkUICapi_451
     * @tc.desc    Case: TestArkUICapi_451. API: OH_ArkUI_TextEditorChangeEvent_GetPreviewStyledString,
     *             OH_ArkUI_TextEditorChangeEvent, ArkUI_StyledString_Descriptor. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_451', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_451()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_452
     * @tc.name    TestArkUICapi_452
     * @tc.desc    Case: TestArkUICapi_452. API: OH_ArkUI_TextLayoutManager_GetCharacterPositionAtCoordinate,
     *             ArkUI_TextLayoutManager, OH_Drawing_PositionAndAffinity, ARKUI_ERROR_CODE_PARAM_INVALID,
     *             NODE_TEXT_LAYOUT_MANAGER. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_452', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_452()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_453
     * @tc.name    TestArkUICapi_453
     * @tc.desc    Case: TestArkUICapi_453. API: OH_ArkUI_TextLayoutManager_GetGlyphRangeForCharacterRange,
     *             ArkUI_TextLayoutManager, OH_Drawing_Range, ARKUI_ERROR_CODE_PARAM_INVALID, NODE_TEXT_LAYOUT_MANAGER.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_453', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_453()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_454
     * @tc.name    TestArkUICapi_454
     * @tc.desc    Case: TestArkUICapi_454. API: OH_ArkUI_TextLayoutManager_GetCharacterRangeForGlyphRange,
     *             ArkUI_TextLayoutManager, OH_Drawing_Range, ARKUI_ERROR_CODE_PARAM_INVALID, NODE_TEXT_LAYOUT_MANAGER.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_454', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_454()).assertEqual(0)
      done()
    })

  });
}
