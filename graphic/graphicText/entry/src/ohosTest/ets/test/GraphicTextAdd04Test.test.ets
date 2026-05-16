/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium"
import { text, drawing, common2D } from "@kit.ArkGraphics2D"
import image from "@ohos.multimedia.image"

const LOG_PREFIX = 'www data GraphicTextAdd04Test';

export default function GraphicTextAdd04Test() {
  describe('GraphicTextAdd04Test', () => {

    /**
     * @tc.name   getRectsForRangeRangeNull401
     * @tc.number paragraphMethodsTest_001
     * @tc.desc   Paragraph getRectsForRange range parameter null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getRectsForRangeRangeNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const rects = paragraph.getRectsForRange(null, text.RectWidthStyle.TIGHT, text.RectHeightStyle.TIGHT);
          console.info(`${LOG_PREFIX} getRectsForRangeRangeNull401 success `, rects);
          expect(rects === undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getRectsForRangeRangeNull401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getRectsForRangeRangeUndefined401
     * @tc.number paragraphMethodsTest_002
     * @tc.desc   Paragraph getRectsForRange range parameter undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getRectsForRangeRangeUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const rects = paragraph.getRectsForRange(undefined, text.RectWidthStyle.TIGHT, text.RectHeightStyle.TIGHT);
          console.info(`${LOG_PREFIX} getRectsForRangeRangeUndefined401 success `, rects);
          expect(rects === undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getRectsForRangeRangeUndefined401 error `, err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getRectsForRangeWidthStyleMax
     * @tc.number paragraphMethodsTest_003
     * @tc.desc   Paragraph getRectsForRange widthStyle MAX test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getRectsForRangeWidthStyleMax', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const range: text.Range = { start: 0, end: 4 };
          const rects = paragraph.getRectsForRange(range, text.RectWidthStyle.MAX, text.RectHeightStyle.TIGHT);
          console.info(`${LOG_PREFIX} getRectsForRangeWidthStyleMax success `, rects);
          expect(rects !== undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getRectsForRangeWidthStyleMax error `, err);
          expect(true).assertFail();
          done();
        }
      });

    /**
     * @tc.name   getRectsForRangeHeightStyleMax
     * @tc.number paragraphMethodsTest_004
     * @tc.desc   Paragraph getRectsForRange heightStyle MAX test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getRectsForRangeHeightStyleMax', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const range: text.Range = { start: 0, end: 4 };
          const rects = paragraph.getRectsForRange(range, text.RectWidthStyle.TIGHT, text.RectHeightStyle.MAX);
          console.info(`${LOG_PREFIX} getRectsForRangeHeightStyleMax success `, rects);
          expect(rects !== undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getRectsForRangeHeightStyleMax error `, err);
          expect(true).assertFail();
          done();
        }
      });

    /**
     * @tc.name   getRectsForRangeHeightStyleIncludeLineSpaceMiddle
     * @tc.number paragraphMethodsTest_005
     * @tc.desc   Paragraph getRectsForRange heightStyle INCLUDE_LINE_SPACE_MIDDLE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getRectsForRangeHeightStyleIncludeLineSpaceMiddle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const range: text.Range = { start: 0, end: 4 };
          const rects = paragraph.getRectsForRange(
            range, text.RectWidthStyle.TIGHT, text.RectHeightStyle.INCLUDE_LINE_SPACE_MIDDLE
          );
          console.info(`${LOG_PREFIX} getRectsForRangeHeightStyleIncludeLineSpaceMiddle success `, rects);
          expect(rects !== undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getRectsForRangeHeightStyleIncludeLineSpaceMiddle error `, err);
          expect(true).assertFail();
          done();
        }
      });

    /**
     * @tc.name   getRectsForRangeHeightStyleIncludeLineSpaceTop
     * @tc.number paragraphMethodsTest_006
     * @tc.desc   Paragraph getRectsForRange heightStyle INCLUDE_LINE_SPACE_TOP test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getRectsForRangeHeightStyleIncludeLineSpaceTop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const range: text.Range = { start: 0, end: 4 };
          const rects = paragraph.getRectsForRange(
            range, text.RectWidthStyle.TIGHT, text.RectHeightStyle.INCLUDE_LINE_SPACE_TOP
          );
          console.info(`${LOG_PREFIX} getRectsForRangeHeightStyleIncludeLineSpaceTop success `, rects);
          expect(rects !== undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getRectsForRangeHeightStyleIncludeLineSpaceTop error `, err);
          expect(true).assertFail();
          done();
        }
      });

    /**
     * @tc.name   getRectsForRangeHeightStyleIncludeLineSpaceBottom
     * @tc.number paragraphMethodsTest_007
     * @tc.desc   Paragraph getRectsForRange heightStyle INCLUDE_LINE_SPACE_BOTTOM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getRectsForRangeHeightStyleIncludeLineSpaceBottom', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const range: text.Range = { start: 0, end: 4 };
          const rects = paragraph.getRectsForRange(
            range, text.RectWidthStyle.TIGHT, text.RectHeightStyle.INCLUDE_LINE_SPACE_BOTTOM
          );
          console.info(`${LOG_PREFIX} getRectsForRangeHeightStyleIncludeLineSpaceBottom success `, rects);
          expect(rects !== undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getRectsForRangeHeightStyleIncludeLineSpaceBottom error `, err);
          expect(true).assertFail();
          done();
        }
      });

    /**
     * @tc.name   getRectsForRangeHeightStyleStrut
     * @tc.number paragraphMethodsTest_008
     * @tc.desc   Paragraph getRectsForRange heightStyle STRUT test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getRectsForRangeHeightStyleStrut', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const range: text.Range = { start: 0, end: 4 };
          const rects = paragraph.getRectsForRange(range, text.RectWidthStyle.TIGHT, text.RectHeightStyle.STRUT);
          console.info(`${LOG_PREFIX} getRectsForRangeHeightStyleStrut success `, rects);
          expect(rects !== undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getRectsForRangeHeightStyleStrut error `, err);
          expect(true).assertFail();
          done();
        }
      });

    /**
     * @tc.name   getGlyphPositionAtCoordinateXNull401
     * @tc.number paragraphMethodsTest_009
     * @tc.desc   Paragraph getGlyphPositionAtCoordinate x parameter null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getGlyphPositionAtCoordinateXNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const result = paragraph.getGlyphPositionAtCoordinate(null, 10);
          console.info(`${LOG_PREFIX} getGlyphPositionAtCoordinateXNull401 success `, result);
          expect(result === undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getGlyphPositionAtCoordinateXNull401 error `, err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getGlyphPositionAtCoordinateXUndefined401
     * @tc.number paragraphMethodsTest_010
     * @tc.desc   Paragraph getGlyphPositionAtCoordinate x parameter undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getGlyphPositionAtCoordinateXUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const result = paragraph.getGlyphPositionAtCoordinate(undefined, 10);
          console.info(`${LOG_PREFIX} getGlyphPositionAtCoordinateXUndefined401 success `, result);
          expect(result === undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getGlyphPositionAtCoordinateXUndefined401 error `, err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getGlyphPositionAtCoordinateYNull401
     * @tc.number paragraphMethodsTest_011
     * @tc.desc   Paragraph getGlyphPositionAtCoordinate y parameter null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getGlyphPositionAtCoordinateYNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const result = paragraph.getGlyphPositionAtCoordinate(10, null);
          console.info(`${LOG_PREFIX} getGlyphPositionAtCoordinateYNull401 success `, result);
          expect(result === undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getGlyphPositionAtCoordinateYNull401 error `, err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getGlyphPositionAtCoordinateYUndefined401
     * @tc.number paragraphMethodsTest_012
     * @tc.desc   Paragraph getGlyphPositionAtCoordinate y parameter undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getGlyphPositionAtCoordinateYUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const result = paragraph.getGlyphPositionAtCoordinate(10, undefined);
          console.info(`${LOG_PREFIX} getGlyphPositionAtCoordinateYUndefined401 success `, result);
          expect(result === undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getGlyphPositionAtCoordinateYUndefined401 error `, err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getWordBoundaryOffsetNull401
     * @tc.number paragraphMethodsTest_013
     * @tc.desc   Paragraph getWordBoundary offset parameter null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getWordBoundaryOffsetNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const result = paragraph.getWordBoundary(null);
          console.info(`${LOG_PREFIX} getWordBoundaryOffsetNull401 success `, result);
          expect(result === undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getWordBoundaryOffsetNull401 error `, err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getWordBoundaryOffsetUndefined401
     * @tc.number paragraphMethodsTest_014
     * @tc.desc   Paragraph getWordBoundary offset parameter undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getWordBoundaryOffsetUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const result = paragraph.getWordBoundary(undefined);
          console.info(`${LOG_PREFIX} getWordBoundaryOffsetUndefined401 success `, result);
          expect(result === undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getWordBoundaryOffsetUndefined401 error `, err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getLineHeightLineNull401
     * @tc.number paragraphMethodsTest_015
     * @tc.desc   Paragraph getLineHeight line parameter null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getLineHeightLineNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const result = paragraph.getLineHeight(null);
          console.info(`${LOG_PREFIX} getLineHeightLineNull401 success `, result);
          expect(result === undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getLineHeightLineNull401 error `, err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getLineHeightLineUndefined401
     * @tc.number paragraphMethodsTest_016
     * @tc.desc   Paragraph getLineHeight line parameter undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getLineHeightLineUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const result = paragraph.getLineHeight(undefined);
          console.info(`${LOG_PREFIX} getLineHeightLineUndefined401 success `, result);
          expect(result === undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getLineHeightLineUndefined401 error `, err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getLineWidthLineNull401
     * @tc.number paragraphMethodsTest_017
     * @tc.desc   Paragraph getLineWidth line parameter null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getLineWidthLineNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const result = paragraph.getLineWidth(null);
          console.info(`${LOG_PREFIX} getLineWidthLineNull401 success `, result);
          expect(result === undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getLineWidthLineNull401 error `, err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getLineWidthLineUndefined401
     * @tc.number paragraphMethodsTest_018
     * @tc.desc   Paragraph getLineWidth line parameter undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getLineWidthLineUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const result = paragraph.getLineWidth(undefined);
          console.info(`${LOG_PREFIX} getLineWidthLineUndefined401 success `, result);
          expect(result === undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getLineWidthLineUndefined401 error `, err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getActualTextRangeLineNumberNull401
     * @tc.number paragraphMethodsTest_019
     * @tc.desc   Paragraph getActualTextRange lineNumber parameter null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getActualTextRangeLineNumberNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const result = paragraph.getActualTextRange(null, true);
          console.info(`${LOG_PREFIX} getActualTextRangeLineNumberNull401 success `, result);
          expect(result === undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getActualTextRangeLineNumberNull401 error `, err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getActualTextRangeLineNumberUndefined401
     * @tc.number paragraphMethodsTest_020
     * @tc.desc   Paragraph getActualTextRange lineNumber parameter undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getActualTextRangeLineNumberUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const result = paragraph.getActualTextRange(undefined, true);
          console.info(`${LOG_PREFIX} getActualTextRangeLineNumberUndefined401 success `, result);
          expect(result === undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getActualTextRangeLineNumberUndefined401 error `, err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getActualTextRangeIncludeSpacesFalse
     * @tc.number paragraphMethodsTest_021
     * @tc.desc   Paragraph getActualTextRange includeSpaces false test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getActualTextRangeIncludeSpacesFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const range = paragraph.getActualTextRange(0, false);
          console.info(`${LOG_PREFIX} getActualTextRangeIncludeSpacesFalse success `, range);
          expect(range !== undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getActualTextRangeIncludeSpacesFalse error `, err);
          expect(true).assertFail();
          done();
        }
      });

    /**
     * @tc.name   getLineMetricsLineNumberNull401
     * @tc.number paragraphMethodsTest_022
     * @tc.desc   Paragraph getLineMetrics lineNumber parameter null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getLineMetricsLineNumberNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const result = paragraph.getLineMetrics(null);
          console.info(`${LOG_PREFIX} getLineMetricsLineNumberNull401 success `, result);
          expect(result === undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getLineMetricsLineNumberNull401 error `, err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getLineMetricsLineNumberUndefined401
     * @tc.number paragraphMethodsTest_023
     * @tc.desc   Paragraph getLineMetrics lineNumber parameter undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getLineMetricsLineNumberUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const result = paragraph.getLineMetrics(undefined);
          console.info(`${LOG_PREFIX} getLineMetricsLineNumberUndefined401 success `, result);
          expect(result === undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getLineMetricsLineNumberUndefined401 error `, err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   updateColorColorNull401
     * @tc.number paragraphMethodsTest_024
     * @tc.desc   Paragraph updateColor color parameter null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateColorColorNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          paragraph.updateColor(null);
          console.info(`${LOG_PREFIX} updateColorColorNull401 success `, 1111);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} updateColorColorNull401 error `, JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   updateColorColorUndefined401
     * @tc.number paragraphMethodsTest_025
     * @tc.desc   Paragraph updateColor color parameter undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateColorColorUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          paragraph.updateColor(undefined);
          console.info(`${LOG_PREFIX} updateColorColorUndefined401 success `, 1111);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} updateColorColorUndefined401 error `, JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        }
      });
    /**
     * @tc.name   paragraphPaintOnPathCanvasNull
     * @tc.number paragraphPaintOnPathTest_001
     * @tc.desc   Paragraph paintOnPath canvas parameter null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('paragraphPaintOnPathCanvasNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      try {
        const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
        const textStyle: text.TextStyle = { fontSize: 20 };
        const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
        paragraphBuilder.pushStyle(textStyle);
        paragraphBuilder.addText('Test Text');
        const paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(200);
        
        const path: drawing.Path = new drawing.Path();
        path.arcTo(20, 20, 180, 180, 180, 90);
        
        paragraph.paintOnPath(null, path, 0, 0);
        console.info(`${LOG_PREFIX} paragraphPaintOnPathCanvasNull `, 1111);
        done();
      } catch (err) {
        console.info(`${LOG_PREFIX} paragraphPaintOnPathCanvasNull `, JSON.stringify(err));
        expect(true).assertFail();
        done();
      }
    });

    /**
     * @tc.name   paragraphPaintOnPathCanvasUndefined
     * @tc.number paragraphPaintOnPathTest_002
     * @tc.desc   Paragraph paintOnPath canvas parameter undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('paragraphPaintOnPathCanvasUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      try {
        const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
        const textStyle: text.TextStyle = { fontSize: 20 };
        const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
        paragraphBuilder.pushStyle(textStyle);
        paragraphBuilder.addText('Test Text');
        const paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(200);
        
        const path: drawing.Path = new drawing.Path();
        path.arcTo(20, 20, 180, 180, 180, 90);
        
        paragraph.paintOnPath(undefined, path, 0, 0);
        console.info(`${LOG_PREFIX} paragraphPaintOnPathCanvasUndefined `, 1111);
        done();
      } catch (err) {
        console.info(`${LOG_PREFIX} paragraphPaintOnPathCanvasUndefined `, JSON.stringify(err));
        expect(true).assertFail();
        done();
      }
    });

    /**
     * @tc.name   paragraphPaintOnPathPathNull401
     * @tc.number paragraphPaintOnPathTest_003
     * @tc.desc   Paragraph paintOnPath path parameter null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('paragraphPaintOnPathPathNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      try {
        const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
        const textStyle: text.TextStyle = { fontSize: 20 };
        const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
        paragraphBuilder.pushStyle(textStyle);
        paragraphBuilder.addText('Test Text');
        const paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(200);
        
        const color: ArrayBuffer = new ArrayBuffer(160000);
        const opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 200, width: 200 } };
        const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
        const canvas: drawing.Canvas = new drawing.Canvas(pixelMap);
        
        paragraph.paintOnPath(canvas, null, 0, 0);
        console.info(`${LOG_PREFIX} paragraphPaintOnPathPathNull401 `, 1111);
        expect(true).assertFail();
        done();
      } catch (err) {
        console.info(`${LOG_PREFIX} paragraphPaintOnPathPathNull401 `, JSON.stringify(err));
        expect(Number(err.code) === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   paragraphPaintOnPathPathUndefined401
     * @tc.number paragraphPaintOnPathTest_004
     * @tc.desc   Paragraph paintOnPath path parameter undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('paragraphPaintOnPathPathUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      try {
        const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
        const textStyle: text.TextStyle = { fontSize: 20 };
        const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
        paragraphBuilder.pushStyle(textStyle);
        paragraphBuilder.addText('Test Text');
        const paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(200);
        
        const color: ArrayBuffer = new ArrayBuffer(160000);
        const opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 200, width: 200 } };
        const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
        const canvas: drawing.Canvas = new drawing.Canvas(pixelMap);
        
        paragraph.paintOnPath(canvas, undefined, 0, 0);
        console.info(`${LOG_PREFIX} paragraphPaintOnPathPathUndefined401 `, 1111);
        expect(true).assertFail();
        done();
      } catch (err) {
        console.info(`${LOG_PREFIX} paragraphPaintOnPathPathUndefined401 `, JSON.stringify(err));
        expect(Number(err.code) === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   paragraphPaintOnPathHOffsetNull
     * @tc.number paragraphPaintOnPathTest_005
     * @tc.desc   Paragraph paintOnPath hOffset parameter null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('paragraphPaintOnPathHOffsetNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      try {
        const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
        const textStyle: text.TextStyle = { fontSize: 20 };
        const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
        paragraphBuilder.pushStyle(textStyle);
        paragraphBuilder.addText('Test Text');
        const paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(200);
        
        const color: ArrayBuffer = new ArrayBuffer(160000);
        const opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 200, width: 200 } };
        const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
        const canvas: drawing.Canvas = new drawing.Canvas(pixelMap);
        const path: drawing.Path = new drawing.Path();
        path.arcTo(20, 20, 180, 180, 180, 90);
        
        paragraph.paintOnPath(canvas, path, null, 0);
        console.info(`${LOG_PREFIX} paragraphPaintOnPathHOffsetNull `, 1111);
        done();
      } catch (err) {
        console.info(`${LOG_PREFIX} paragraphPaintOnPathHOffsetNull `, JSON.stringify(err));
        expect(true).assertFail();
        done();
      }
    });

    /**
     * @tc.name   paragraphPaintOnPathHOffsetUndefined
     * @tc.number paragraphPaintOnPathTest_006
     * @tc.desc   Paragraph paintOnPath hOffset parameter undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('paragraphPaintOnPathHOffsetUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      try {
        const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
        const textStyle: text.TextStyle = { fontSize: 20 };
        const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
        paragraphBuilder.pushStyle(textStyle);
        paragraphBuilder.addText('Test Text');
        const paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(200);
        
        const color: ArrayBuffer = new ArrayBuffer(160000);
        const opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 200, width: 200 } };
        const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
        const canvas: drawing.Canvas = new drawing.Canvas(pixelMap);
        const path: drawing.Path = new drawing.Path();
        path.arcTo(20, 20, 180, 180, 180, 90);
        
        paragraph.paintOnPath(canvas, path, undefined, 0);
        console.info(`${LOG_PREFIX} paragraphPaintOnPathHOffsetUndefined `, 1111);
        done();
      } catch (err) {
        console.info(`${LOG_PREFIX} paragraphPaintOnPathHOffsetUndefined `, JSON.stringify(err));
        expect(true).assertFail();
        done();
      }
    });

    /**
     * @tc.name   paragraphPaintOnPathVOffsetNull
     * @tc.number paragraphPaintOnPathTest_007
     * @tc.desc   Paragraph paintOnPath vOffset parameter null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('paragraphPaintOnPathVOffsetNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      try {
        const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
        const textStyle: text.TextStyle = { fontSize: 20 };
        const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
        paragraphBuilder.pushStyle(textStyle);
        paragraphBuilder.addText('Test Text');
        const paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(200);
        
        const color: ArrayBuffer = new ArrayBuffer(160000);
        const opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 200, width: 200 } };
        const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
        const canvas: drawing.Canvas = new drawing.Canvas(pixelMap);
        const path: drawing.Path = new drawing.Path();
        path.arcTo(20, 20, 180, 180, 180, 90);
        
        paragraph.paintOnPath(canvas, path, 0, null);
        console.info(`${LOG_PREFIX} paragraphPaintOnPathVOffsetNull `, 1111);
        done();
      } catch (err) {
        console.info(`${LOG_PREFIX} paragraphPaintOnPathVOffsetNull `, JSON.stringify(err));
        expect(true).assertFail();
        done();
      }
    });

    /**
     * @tc.name   paragraphPaintOnPathVOffsetUndefined
     * @tc.number paragraphPaintOnPathTest_008
     * @tc.desc   Paragraph paintOnPath vOffset parameter undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('paragraphPaintOnPathVOffsetUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      try {
        const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
        const textStyle: text.TextStyle = { fontSize: 20 };
        const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
        paragraphBuilder.pushStyle(textStyle);
        paragraphBuilder.addText('Test Text');
        const paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(200);
        
        const color: ArrayBuffer = new ArrayBuffer(160000);
        const opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 200, width: 200 } };
        const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
        const canvas: drawing.Canvas = new drawing.Canvas(pixelMap);
        const path: drawing.Path = new drawing.Path();
        path.arcTo(20, 20, 180, 180, 180, 90);
        
        paragraph.paintOnPath(canvas, path, 0, undefined);
        console.info(`${LOG_PREFIX} paragraphPaintOnPathVOffsetUndefined `, 1111);
        done();
      } catch (err) {
        console.info(`${LOG_PREFIX} paragraphPaintOnPathVOffsetUndefined `, JSON.stringify(err));
        expect(true).assertFail();
        done();
      }
    });
    /**
     * @tc.name   getGlyphPositionAtCoordinateNormal
     * @tc.number paragraphReturnValueTest_001
     * @tc.desc   Paragraph getGlyphPositionAtCoordinate normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getGlyphPositionAtCoordinateNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Hello World');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const positionWithAffinity: text.PositionWithAffinity = paragraph.getGlyphPositionAtCoordinate(10, 10);
          
          console.info(`${LOG_PREFIX} getGlyphPositionAtCoordinateNormal success position=`
            + `${positionWithAffinity.position} affinity=${positionWithAffinity.affinity}`);
          expect(positionWithAffinity !== undefined).assertTrue();
          expect(typeof positionWithAffinity.position === 'number').assertTrue();
          expect(positionWithAffinity.position >= 0).assertTrue();
          expect(Number.isInteger(positionWithAffinity.position)).assertTrue();
          expect(typeof positionWithAffinity.affinity === 'number').assertTrue();
          expect([text.Affinity.UPSTREAM,text.Affinity.DOWNSTREAM].includes(positionWithAffinity.affinity)).assertTrue()
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getGlyphPositionAtCoordinateNormal error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getGlyphPositionAtCoordinatePositionProperty
     * @tc.number paragraphReturnValueTest_002
     * @tc.desc   Paragraph getGlyphPositionAtCoordinate position property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getGlyphPositionAtCoordinatePositionProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const positionWithAffinity: text.PositionWithAffinity = paragraph.getGlyphPositionAtCoordinate(0, 0);
          
          console.info(`${LOG_PREFIX} getGlyphPositionAtCoordinatePositionProperty success position=`,
            positionWithAffinity.position);
          expect(positionWithAffinity.position !== undefined).assertTrue();
          expect(typeof positionWithAffinity.position === 'number').assertTrue();
          expect(positionWithAffinity.position >= 0).assertTrue();
          expect(Number.isInteger(positionWithAffinity.position)).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getGlyphPositionAtCoordinatePositionProperty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getGlyphPositionAtCoordinateAffinityProperty
     * @tc.number paragraphReturnValueTest_003
     * @tc.desc   Paragraph getGlyphPositionAtCoordinate affinity property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getGlyphPositionAtCoordinateAffinityProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const positionWithAffinity: text.PositionWithAffinity = paragraph.getGlyphPositionAtCoordinate(0, 0);
          
          console.info(`${LOG_PREFIX} getGlyphPositionAtCoordinateAffinityProperty success affinity=`,
            positionWithAffinity.affinity);
          expect(positionWithAffinity.affinity !== undefined).assertTrue();
          expect(typeof positionWithAffinity.affinity === 'number').assertTrue();
          expect([text.Affinity.UPSTREAM,text.Affinity.DOWNSTREAM].includes(positionWithAffinity.affinity)).assertTrue()
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getGlyphPositionAtCoordinateAffinityProperty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getGlyphPositionAtCoordinateXZero
     * @tc.number paragraphReturnValueTest_004
     * @tc.desc   Paragraph getGlyphPositionAtCoordinate x zero test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getGlyphPositionAtCoordinateXZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const positionWithAffinity: text.PositionWithAffinity = paragraph.getGlyphPositionAtCoordinate(0, 0);
          
          console.info(`${LOG_PREFIX} getGlyphPositionAtCoordinateXZero success position=`,
            positionWithAffinity.position);
          expect(positionWithAffinity.position === 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getGlyphPositionAtCoordinateXZero error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getGlyphPositionAtCoordinateYZero
     * @tc.number paragraphReturnValueTest_005
     * @tc.desc   Paragraph getGlyphPositionAtCoordinate y zero test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getGlyphPositionAtCoordinateYZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const positionWithAffinity: text.PositionWithAffinity = paragraph.getGlyphPositionAtCoordinate(0, 0);
          
          console.info(`${LOG_PREFIX} getGlyphPositionAtCoordinateYZero success position=`,
            positionWithAffinity.position);
          expect(positionWithAffinity.position === 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getGlyphPositionAtCoordinateYZero error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getWordBoundaryNormal
     * @tc.number paragraphReturnValueTest_006
     * @tc.desc   Paragraph getWordBoundary normal test.
     @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getWordBoundaryNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Hello World');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const range: text.Range = paragraph.getWordBoundary(0);
          
          console.info(`${LOG_PREFIX} getWordBoundaryNormal success start=${range.start} end=${range.end}`);
          expect(range !== undefined).assertTrue();
          expect(typeof range.start === 'number').assertTrue();
          expect(typeof range.end === 'number').assertTrue();
          expect(range.start >= 0).assertTrue();
          expect(range.end > range.start).assertTrue();
          expect(Number.isInteger(range.start)).assertTrue();
          expect(Number.isInteger(range.end)).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getWordBoundaryNormal error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getWordBoundaryStartProperty
     * @tc.number paragraphReturnValueTest_007
     * @tc.desc   Paragraph getWordBoundary start property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getWordBoundaryStartProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Hello World');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const range: text.Range = paragraph.getWordBoundary(0);
          
          console.info(`${LOG_PREFIX} getWordBoundaryStartProperty success start=${range.start}`);
          expect(range.start !== undefined).assertTrue();
          expect(typeof range.start === 'number').assertTrue();
          expect(range.start >= 0).assertTrue();
          expect(Number.isInteger(range.start)).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getWordBoundaryStartProperty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getWordBoundaryEndProperty
     * @tc.number paragraphReturnValueTest_008
     * @tc.desc   Paragraph getWordBoundary end property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getWordBoundaryEndProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Hello World');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const range: text.Range = paragraph.getWordBoundary(0);
          
          console.info(`${LOG_PREFIX} getWordBoundaryEndProperty success end=${range.end}`);
          expect(range.end !== undefined).assertTrue();
          expect(typeof range.end === 'number').assertTrue();
          expect(range.end > 0).assertTrue();
          expect(Number.isInteger(range.end)).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getWordBoundaryEndProperty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getActualTextRangeNormal
     * @tc.number paragraphReturnValueTest_009
     * @tc.desc   Paragraph getActualTextRange normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getActualTextRangeNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Hello World');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const range: text.Range = paragraph.getActualTextRange(0, true);
          
          console.info(`${LOG_PREFIX} getActualTextRangeNormal success start=${range.start} end=${range.end}`);
          expect(range !== undefined).assertTrue();
          expect(typeof range.start === 'number').assertTrue();
          expect(typeof range.end === 'number').assertTrue();
          expect(range.start >= 0).assertTrue();
          expect(range.end > range.start).assertTrue();
          expect(Number.isInteger(range.start)).assertTrue();
          expect(Number.isInteger(range.end)).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getActualTextRangeNormal error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getActualTextRangeStartProperty
     * @tc.number paragraphReturnValueTest_010
     * @tc.desc   Paragraph getActualTextRange start property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getActualTextRangeStartProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Hello World');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const range: text.Range = paragraph.getActualTextRange(0, true);
          
          console.info(`${LOG_PREFIX} getActualTextRangeStartProperty success start=${range.start}`);
          expect(range.start !== undefined).assertTrue();
          expect(typeof range.start === 'number').assertTrue();
          expect(range.start >= 0).assertTrue();
          expect(Number.isInteger(range.start)).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getActualTextRangeStartProperty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getActualTextRangeEndProperty
     * @tc.number paragraphReturnValueTest_011
     * @tc.desc   Paragraph getActualTextRange end property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getActualTextRangeEndProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Hello World');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const range: text.Range = paragraph.getActualTextRange(0, true);
          
          console.info(`${LOG_PREFIX} getActualTextRangeEndProperty success end=${range.end}`);
          expect(range.end !== undefined).assertTrue();
          expect(typeof range.end === 'number').assertTrue();
          expect(range.end > 0).assertTrue();
          expect(Number.isInteger(range.end)).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getActualTextRangeEndProperty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getLineMetricsNormal
     * @tc.number paragraphReturnValueTest_012
     * @tc.desc   Paragraph getLineMetrics normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getLineMetricsNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Hello World');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const lineMetricsArray: text.LineMetrics[] = paragraph.getLineMetrics();
          
          console.info(`${LOG_PREFIX} getLineMetricsNormal success count=${lineMetricsArray.length}`);
          expect(lineMetricsArray !== undefined).assertTrue();
          expect(Array.isArray(lineMetricsArray)).assertTrue();
          expect(lineMetricsArray.length > 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getLineMetricsNormal error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getLineMetricsStartIndexProperty
     * @tc.number paragraphReturnValueTest_013
     * @tc.desc   Paragraph getLineMetrics startIndex property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getLineMetricsStartIndexProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Hello World');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const lineMetricsArray: text.LineMetrics[] = paragraph.getLineMetrics();
          
          console.info(`${LOG_PREFIX} getLineMetricsStartIndexProperty success startIndex= `,
            lineMetricsArray[0].startIndex);
          expect(lineMetricsArray.length > 0).assertTrue();
          expect(lineMetricsArray[0].startIndex !== undefined).assertTrue();
          expect(typeof lineMetricsArray[0].startIndex === 'number').assertTrue();
          expect(lineMetricsArray[0].startIndex >= 0).assertTrue();
          expect(Number.isInteger(lineMetricsArray[0].startIndex)).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getLineMetricsStartIndexProperty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getLineMetricsEndIndexProperty
     * @tc.number paragraphReturnValueTest_014
     * @tc.desc   Paragraph getLineMetrics endIndex property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getLineMetricsEndIndexProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Hello World');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const lineMetricsArray: text.LineMetrics[] = paragraph.getLineMetrics();
          
          console.info(`${LOG_PREFIX} getLineMetricsEndIndexProperty success endIndex=${lineMetricsArray[0].endIndex}`);
          expect(lineMetricsArray.length > 0).assertTrue();
          expect(lineMetricsArray[0].endIndex !== undefined).assertTrue();
          expect(typeof lineMetricsArray[0].endIndex === 'number').assertTrue();
          expect(lineMetricsArray[0].endIndex > 0).assertTrue();
          expect(Number.isInteger(lineMetricsArray[0].endIndex)).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getLineMetricsEndIndexProperty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getLineMetricsAscentProperty
     * @tc.number paragraphReturnValueTest_015
     * @tc.desc   Paragraph getLineMetrics ascent property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getLineMetricsAscentProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Hello World');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const lineMetricsArray: text.LineMetrics[] = paragraph.getLineMetrics();
          
          console.info(`${LOG_PREFIX} getLineMetricsAscentProperty success ascent=${lineMetricsArray[0].ascent}`);
          expect(lineMetricsArray.length > 0).assertTrue();
          expect(lineMetricsArray[0].ascent !== undefined).assertTrue();
          expect(typeof lineMetricsArray[0].ascent === 'number').assertTrue();
          expect(lineMetricsArray[0].ascent >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getLineMetricsAscentProperty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getLineMetricsDescentProperty
     * @tc.number paragraphReturnValueTest_016
     * @tc.desc   Paragraph getLineMetrics descent property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getLineMetricsDescentProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Hello World');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const lineMetricsArray: text.LineMetrics[] = paragraph.getLineMetrics();
          
          console.info(`${LOG_PREFIX} getLineMetricsDescentProperty success descent=${lineMetricsArray[0].descent}`);
          expect(lineMetricsArray.length > 0).assertTrue();
          expect(lineMetricsArray[0].descent !== undefined).assertTrue();
          expect(typeof lineMetricsArray[0].descent === 'number').assertTrue();
          expect(lineMetricsArray[0].descent >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getLineMetricsDescentProperty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getLineMetricsWithAffinityTrue
     * @tc.number paragraphReturnValueTest_017
     * @tc.desc   Paragraph getGlyphPositionAtCoordinate affinity UPSTREAM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getLineMetricsWithAffinityTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Hello World');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          const positionWithAffinity: text.PositionWithAffinity = paragraph.getGlyphPositionAtCoordinate(10, 10);
          console.info(`${LOG_PREFIX} getLineMetricsWithAffinityTrue success affinity=${positionWithAffinity.affinity}`)
          expect(positionWithAffinity.affinity).assertEqual(text.Affinity.UPSTREAM);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getLineMetricsWithAffinityTrue error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getLineMetricsWithAffinityFalse
     * @tc.number paragraphReturnValueTest_018
     * @tc.desc   Paragraph getGlyphPositionAtCoordinate affinity DOWNSTREAM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     @tc.level  LEVEL1
     */
    it('getLineMetricsWithAffinityFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Z');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          const positionWithAffinity: text.PositionWithAffinity = paragraph.getGlyphPositionAtCoordinate(0, 0);
          console.info(`${LOG_PREFIX} getLineMetricsWithAffinityFalse success affinity=`,positionWithAffinity.affinity)
          expect(positionWithAffinity.affinity).assertEqual(text.Affinity.DOWNSTREAM);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getLineMetricsWithAffinityFalse error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

  })
}

