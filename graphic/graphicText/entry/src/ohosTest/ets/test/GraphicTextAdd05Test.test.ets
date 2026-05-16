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

const LOG_PREFIX = 'www data GraphicTextAdd05Test';

export default function GraphicTextAdd05Test() {
  describe('GraphicTextAdd05Test', () => {

    let pixelMap: image.PixelMap | undefined = undefined;
    
    beforeAll(async () => {
      try {
        const color: ArrayBuffer = new ArrayBuffer(160000);
        const opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 200, width: 200 } };
        pixelMap = image.createPixelMapSync(color, opts);
        console.info(`${LOG_PREFIX} create pixelmap success`);
      } catch (err) {
        console.error(`${LOG_PREFIX} create pixelmap error`, JSON.stringify(err));
      }
    });

    /**
     * @tc.name   runPaintCanvasNull401
     * @tc.number runTest_001
     * @tc.desc   Run paint canvas parameter null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('runPaintCanvasNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          const runs: text.Run[] = lines[0].getGlyphRuns();
          
          if (pixelMap) {
            const canvas: drawing.Canvas = new drawing.Canvas(pixelMap);
            runs[0].paint(null, 0, 0);
          }
          
          console.info(`${LOG_PREFIX} runPaintCanvasNull401 success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} runPaintCanvasNull401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   runPaintCanvasUndefined401
     * @tc.number runTest_002
     * @tc.desc   Run paint canvas parameter undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('runPaintCanvasUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          const runs: text.Run[] = lines[0].getGlyphRuns();
          
          if (pixelMap) {
            const canvas: drawing.Canvas = new drawing.Canvas(pixelMap);
            runs[0].paint(undefined, 0, 0);
          }
          
          console.info(`${LOG_PREFIX} runPaintCanvasUndefined401 success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} runPaintCanvasUndefined401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   runPaintXNull401
     * @tc.number runTest_003
     * @tc.desc   Run paint x parameter null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('runPaintXNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          const runs: text.Run[] = lines[0].getGlyphRuns();
          
          if (pixelMap) {
            const canvas: drawing.Canvas = new drawing.Canvas(pixelMap);
            runs[0].paint(canvas, null, 0);
          }
          
          console.info(`${LOG_PREFIX} runPaintXNull401 success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} runPaintXNull401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   runPaintXUndefined401
     * @tc.number runTest_004
     * @tc.desc   Run paint x parameter undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('runPaintXUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          const runs: text.Run[] = lines[0].getGlyphRuns();
          
          if (pixelMap) {
            const canvas: drawing.Canvas = new drawing.Canvas(pixelMap);
            runs[0].paint(canvas, undefined, 0);
          }
          
          console.info(`${LOG_PREFIX} runPaintXUndefined401 success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} runPaintXUndefined401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   runPaintYNull401
     * @tc.number runTest_005
     * @tc.desc   Run paint y parameter null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('runPaintYNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          const runs: text.Run[] = lines[0].getGlyphRuns();
          
          if (pixelMap) {
            const canvas: drawing.Canvas = new drawing.Canvas(pixelMap);
            runs[0].paint(canvas, 0, null);
          }
          
          console.info(`${LOG_PREFIX} runPaintYNull401 success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} runPaintYNull401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   runPaintYUndefined401
     * @tc.number runTest_006
     * @tc.desc   Run paint y parameter undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('runPaintYUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          const runs: text.Run[] = lines[0].getGlyphRuns();
          
          if (pixelMap) {
            const canvas: drawing.Canvas = new drawing.Canvas(pixelMap);
            runs[0].paint(canvas, 0, undefined);
          }
          
          console.info(`${LOG_PREFIX} runPaintYUndefined401 success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} runPaintYUndefined401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   runPaintNormal
     * @tc.number runTest_007
     * @tc.desc   Run paint normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('runPaintNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          const runs: text.Run[] = lines[0].getGlyphRuns();
          
          if (pixelMap) {
            const canvas: drawing.Canvas = new drawing.Canvas(pixelMap);
            runs[0].paint(canvas, 50, 50);
          }
          
          console.info(`${LOG_PREFIX} runPaintNormal success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} runPaintNormal error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   runGetImageBoundsNormal
     * @tc.number runTest_008
     * @tc.desc   Run getImageBounds normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('runGetImageBoundsNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          const runs: text.Run[] = lines[0].getGlyphRuns();
          const bounds: common2D.Rect = runs[0].getImageBounds();
          
          console.info(`${LOG_PREFIX} runGetImageBoundsNormal success left=${bounds.left} top=${bounds.top} right=`
            + `${bounds.right} bottom=${bounds.bottom}`);
          expect(bounds !== undefined).assertTrue();
          expect(bounds.left !== undefined).assertTrue();
          expect(bounds.top !== undefined).assertTrue();
          expect(bounds.right !== undefined).assertTrue();
          expect(bounds.bottom !== undefined).assertTrue();
          expect(typeof bounds.left === 'number').assertTrue();
          expect(typeof bounds.top === 'number').assertTrue();
          expect(typeof bounds.right === 'number').assertTrue();
          expect(typeof bounds.bottom === 'number').assertTrue();
          expect(bounds.left < bounds.right).assertTrue();
          expect(bounds.top < bounds.bottom).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} runGetImageBoundsNormal error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   runGetImageBoundsLeftProperty
     * @tc.number runTest_009
     * @tc.desc   Run getImageBounds left property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('runGetImageBoundsLeftProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          const runs: text.Run[] = lines[0].getGlyphRuns();
          const bounds: common2D.Rect = runs[0].getImageBounds();
          
          console.info(`${LOG_PREFIX} runGetImageBoundsLeftProperty success left=${bounds.left}`);
          expect(bounds.left !== undefined).assertTrue();
          expect(typeof bounds.left === 'number').assertTrue();
          expect(bounds.left >= 0).assertTrue();
          expect(Number.isInteger(bounds.left)).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} runGetImageBoundsLeftProperty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   runGetImageBoundsTopProperty
     * @tc.number runTest_010
     * @tc.desc   Run getImageBounds top property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('runGetImageBoundsTopProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          const runs: text.Run[] = lines[0].getGlyphRuns();
          const bounds: common2D.Rect = runs[0].getImageBounds();
          
          console.info(`${LOG_PREFIX} runGetImageBoundsTopProperty success top=${bounds.top}`);
          expect(bounds.top !== undefined).assertTrue();
          expect(typeof bounds.top === 'number').assertTrue();
          expect(bounds.top >= 0).assertTrue();
          expect(Number.isInteger(bounds.top)).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} runGetImageBoundsTopProperty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   runGetImageBoundsRightProperty
     * @tc.number runTest_011
     * @tc.desc   Run getImageBounds right property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('runGetImageBoundsRightProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          const runs: text.Run[] = lines[0].getGlyphRuns();
          const bounds: common2D.Rect = runs[0].getImageBounds();
          
          console.info(`${LOG_PREFIX} runGetImageBoundsRightProperty success `, JSON.stringify(bounds));
          expect(bounds.right !== undefined).assertTrue();
          expect(typeof bounds.right === 'number').assertTrue();
          expect(bounds.right >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} runGetImageBoundsRightProperty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   runGetImageBoundsBottomProperty
     * @tc.number runTest_012
     * @tc.desc   Run getImageBounds bottom property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('runGetImageBoundsBottomProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          const runs: text.Run[] = lines[0].getGlyphRuns();
          const bounds: common2D.Rect = runs[0].getImageBounds();
          
          console.info(`${LOG_PREFIX} runGetImageBoundsBottomProperty success bottom=${bounds.bottom}`);
          expect(bounds.bottom !== undefined).assertTrue();
          expect(typeof bounds.bottom === 'number').assertTrue();
          expect(bounds.bottom >= 0).assertTrue();
          expect(Number.isInteger(bounds.bottom)).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} runGetImageBoundsBottomProperty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   runGetImageBoundsEmptyText
     * @tc.number runTest_013
     * @tc.desc   Run getImageBounds empty text test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('runGetImageBoundsEmptyText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          console.info(`${LOG_PREFIX} runGetImageBoundsEmptyText success   111`);
          const lines: text.TextLine[] = paragraph.getTextLines();
          console.info(`${LOG_PREFIX} runGetImageBoundsEmptyText success   222`);
          const runs: text.Run[] = lines[0].getGlyphRuns();
          console.info(`${LOG_PREFIX} runGetImageBoundsEmptyText success   333`);
          const bounds: common2D.Rect = runs[0].getImageBounds();
          console.info(`${LOG_PREFIX} runGetImageBoundsEmptyText success   444`, JSON.stringify(bounds));
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} runGetImageBoundsEmptyText error `, JSON.stringify(err));
          expect(err.code).assertUndefined();
          done();
        }
      });

    /**
     * @tc.name   runGetImageBoundsLongText
     * @tc.number runTest_014
     * @tc.desc   Run getImageBounds long text test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('runGetImageBoundsLongText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          const longText = 'This is a very long text with many words to test the getImageBounds method properly and ' +
            'ensure it works correctly with large amounts of text content and provides accurate boundary measurements.';
          paragraphBuilder.addText(longText);
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const lines: text.TextLine[] = paragraph.getTextLines();
          const runs: text.Run[] = lines[0].getGlyphRuns();
          const bounds: common2D.Rect = runs[0].getImageBounds();
          
          console.info(`${LOG_PREFIX} runGetImageBoundsLongText success left=${bounds.left} right=${bounds.right} `
            + `bottom=${bounds.bottom} width=${bounds.right - bounds.left}`);
          expect(bounds !== undefined).assertTrue();
          expect(bounds.left >= 0).assertTrue();
          expect(bounds.top >= 0).assertTrue();
          expect(bounds.right > bounds.left).assertTrue();
          expect(bounds.bottom >= 0).assertTrue();
          expect(bounds.right - bounds.left > 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} runGetImageBoundsLongText error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   runGetImageBoundsWithSpaces
     * @tc.number runTest_015
     * @tc.desc   Run getImageBounds with spaces test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('runGetImageBoundsWithSpaces', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('  Text with spaces  ');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const lines: text.TextLine[] = paragraph.getTextLines();
          const runs: text.Run[] = lines[0].getGlyphRuns();
          const bounds: common2D.Rect = runs[0].getImageBounds();
          
          console.info(`${LOG_PREFIX} runGetImageBoundsWithSpaces success left=${bounds.left} top=${bounds.top} right=`
            + `${bounds.right} bottom=${bounds.bottom}`);
          expect(bounds !== undefined).assertTrue();
          expect(bounds.left !== undefined).assertTrue();
          expect(bounds.top !== undefined).assertTrue();
          expect(bounds.right !== undefined).assertTrue();
          expect(bounds.bottom !== undefined).assertTrue();
          expect(bounds.right - bounds.left > 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} runGetImageBoundsWithSpaces error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   runGetAdvancesRangeNull401
     * @tc.number runTest_016
     * @tc.desc   Run getAdvances range parameter null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('runGetAdvancesRangeNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          const runs: text.Run[] = lines[0].getGlyphRuns();
          const advances: common2D.Point[] = runs[0].getAdvances(null);
          
          console.info(`${LOG_PREFIX} runGetAdvancesRangeNull401 success advances=${JSON.stringify(advances)}`);
          expect(advances === undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} runGetAdvancesRangeNull401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   runGetAdvancesRangeUndefined401
     * @tc.number runTest_017
     * @tc.desc   Run getAdvances range parameter undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('runGetAdvancesRangeUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          const runs: text.Run[] = lines[0].getGlyphRuns();
          const advances: common2D.Point[] = runs[0].getAdvances(undefined);
          
          console.info(`${LOG_PREFIX} runGetAdvancesRangeUndefined401 success advances=${JSON.stringify(advances)}`);
          expect(advances === undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} runGetAdvancesRangeUndefined401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   runGetAdvancesNormal
     * @tc.number runTest_018
     * @tc.desc   Run getAdvances normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('runGetAdvancesNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          const runs: text.Run[] = lines[0].getGlyphRuns();
          const range: text.Range = { start: 0, end: runs[0].getGlyphCount() };
          const advances: common2D.Point[] = runs[0].getAdvances(range);
          
          console.info(`${LOG_PREFIX} runGetAdvancesNormal success advances=${JSON.stringify(advances)} count=`
            + `${advances.length}`)
          expect(advances !== undefined).assertTrue();
          expect(advances.length > 0).assertTrue();
          expect(Array.isArray(advances)).assertTrue();
          expect(advances.length === runs[0].getGlyphCount()).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} runGetAdvancesNormal error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   runGetAdvancesPartialRange
     * @tc.number runTest_019
     * @tc.desc   Run getAdvances partial range test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('runGetAdvancesPartialRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          const runs: text.Run[] = lines[0].getGlyphRuns();
          const range: text.Range = { start: 0, end: 5 };
          const advances: common2D.Point[] = runs[0].getAdvances(range);
          
          console.info(`${LOG_PREFIX} runGetAdvancesPartialRange success advances=${JSON.stringify(advances)} count=`
            + `${advances.length}`);
          expect(advances !== undefined).assertTrue();
          expect(advances.length > 0).assertTrue();
          expect(advances.length <= 5).assertTrue();
          expect(advances.length === range.end).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} runGetAdvancesPartialRange error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   runGetAdvancesPointTypes
     * @tc.number runTest_020
     * @tc.desc   Run getAdvances point types test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('runGetAdvancesPointTypes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          const runs: text.Run[] = lines[0].getGlyphRuns();
          const range: text.Range = { start: 0, end: runs[0].getGlyphCount() };
          const advances: common2D.Point[] = runs[0].getAdvances(range);
          
          console.info(`${LOG_PREFIX} runGetAdvancesPointTypes success advances=${JSON.stringify(advances)}`);
          expect(advances !== undefined).assertTrue();
          expect(advances.length > 0).assertTrue();
          expect(Array.isArray(advances)).assertTrue();
          advances.forEach((point, index) => {
            expect(point.x !== undefined).assertTrue();
            expect(point.y !== undefined).assertTrue();
            expect(typeof point.x === 'number').assertTrue();
            expect(typeof point.y === 'number').assertTrue();
          });
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} runGetAdvancesPointTypes error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   paintCanvasNull401
     * @tc.number textLineTest_001
     * @tc.desc   TextLine paint canvas parameter null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('paintCanvasNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          if (pixelMap) {
            const canvas: drawing.Canvas = new drawing.Canvas(pixelMap);
            lines[0].paint(null, 0, 0);
          }
          console.info(`${LOG_PREFIX} paintCanvasNull401 success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} paintCanvasNull401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   paintCanvasUndefined401
     * @tc.number textLineTest_002
     * @tc.desc   TextLine paint canvas parameter undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('paintCanvasUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          if (pixelMap) {
            const canvas: drawing.Canvas = new drawing.Canvas(pixelMap);
            lines[0].paint(undefined, 0, 0);
          }
          console.info(`${LOG_PREFIX} paintCanvasUndefined401 success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} paintCanvasUndefined401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   paintXNull401
     * @tc.number textLineTest_003
     * @tc.desc   TextLine paint x parameter null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('paintXNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          if (pixelMap) {
            const canvas: drawing.Canvas = new drawing.Canvas(pixelMap);
            lines[0].paint(canvas, null, 0);
          }
          console.info(`${LOG_PREFIX} paintXNull401 success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} paintXNull401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   paintXUndefined401
     * @tc.number textLineTest_004
     * @tc.desc   TextLine paint x parameter undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('paintXUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          if (pixelMap) {
            const canvas: drawing.Canvas = new drawing.Canvas(pixelMap);
            lines[0].paint(canvas, undefined, 0);
          }
          console.info(`${LOG_PREFIX} paintXUndefined401 success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} paintXUndefined401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   paintYNull401
     * @tc.number textLineTest_005
     * @tc.desc   TextLine paint y parameter null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('paintYNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          if (pixelMap) {
            const canvas: drawing.Canvas = new drawing.Canvas(pixelMap);
            lines[0].paint(canvas, 0, null);
          }
          console.info(`${LOG_PREFIX} paintYNull401 success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} paintYNull401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   paintYUndefined401
     * @tc.number textLineTest_006
     * @tc.desc   TextLine paint y parameter undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('paintYUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          if (pixelMap) {
            const canvas: drawing.Canvas = new drawing.Canvas(pixelMap);
            lines[0].paint(canvas, 0, undefined);
          }
          console.info(`${LOG_PREFIX} paintYUndefined401 success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} paintYUndefined401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   createTruncatedLineEllipsisEmpty
     * @tc.number textLineTest_007
     * @tc.desc   TextLine createTruncatedLine ellipsis empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('createTruncatedLineEllipsisEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text with very long content');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const lines: text.TextLine[] = paragraph.getTextLines();
          const truncatedLine: text.TextLine = lines[0].createTruncatedLine(100, text.EllipsisMode.END, '');
          
          console.info(`${LOG_PREFIX} createTruncatedLineEllipsisEmpty success`, JSON.stringify(truncatedLine));
          expect(truncatedLine !== undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} createTruncatedLineEllipsisEmpty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   createTruncatedLineEllipsisNull401
     * @tc.number textLineTest_008
     * @tc.desc   TextLine createTruncatedLine ellipsis null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createTruncatedLineEllipsisNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          const truncatedLine: text.TextLine = lines[0].createTruncatedLine(100, text.EllipsisMode.END, null);
          
          console.info(`${LOG_PREFIX} createTruncatedLineEllipsisNull401 success`, JSON.stringify(truncatedLine));
          expect(truncatedLine).assertUndefined();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} createTruncatedLineEllipsisNull401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   createTruncatedLineEllipsisUndefined401
     * @tc.number textLineTest_009
     * @tc.desc   TextLine createTruncatedLine ellipsis undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createTruncatedLineEllipsisUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          const truncatedLine: text.TextLine = lines[0].createTruncatedLine(100, text.EllipsisMode.END, undefined);
          
          console.info(`${LOG_PREFIX} createTruncatedLineEllipsisUndefined401 success`, JSON.stringify(truncatedLine));
          expect(truncatedLine).assertUndefined();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} createTruncatedLineEllipsisUndefined401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   createTruncatedLineEllipsisModeStart
     * @tc.number textLineTest_010
     * @tc.desc   TextLine createTruncatedLine ellipsisMode START test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('createTruncatedLineEllipsisModeStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT, maxLines: 1 };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text with very long content');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const lines: text.TextLine[] = paragraph.getTextLines();
          const truncatedLine: text.TextLine = lines[0].createTruncatedLine(100, text.EllipsisMode.START, '...');
          
          console.info(`${LOG_PREFIX} createTruncatedLineEllipsisModeStart success`, JSON.stringify(truncatedLine));
          expect(truncatedLine !== undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} createTruncatedLineEllipsisModeStart error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   createTruncatedLineEllipsisModeMiddle
     * @tc.number textLineTest_011
     * @tc.desc   TextLine createTruncatedLine ellipsisMode MIDDLE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('createTruncatedLineEllipsisModeMiddle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT, maxLines: 1 };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text with very long content');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const lines: text.TextLine[] = paragraph.getTextLines();
          const truncatedLine: text.TextLine = lines[0].createTruncatedLine(100, text.EllipsisMode.MIDDLE, '...');
          
          console.info(`${LOG_PREFIX} createTruncatedLineEllipsisModeMiddle success`, JSON.stringify(truncatedLine));
          expect(truncatedLine).assertUndefined();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} createTruncatedLineEllipsisModeMiddle error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   createTruncatedLineEllipsisModeEnd
     * @tc.number textLineTest_012
     * @tc.desc   TextLine createTruncatedLine ellipsisMode END test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('createTruncatedLineEllipsisModeEnd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text with very long content');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const lines: text.TextLine[] = paragraph.getTextLines();
          const truncatedLine: text.TextLine = lines[0].createTruncatedLine(100, text.EllipsisMode.END, '...');
          
          console.info(`${LOG_PREFIX} createTruncatedLineEllipsisModeEnd success`, JSON.stringify(truncatedLine));
          expect(truncatedLine !== undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} createTruncatedLineEllipsisModeEnd error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getAlignmentOffsetAlignmentFactorNull401
     * @tc.number textLineTest_013
     * @tc.desc   TextLine getAlignmentOffset alignmentFactor parameter null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAlignmentOffsetAlignmentFactorNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          const offset: number = lines[0].getAlignmentOffset(null, 500);
          
          console.info(`${LOG_PREFIX} getAlignmentOffsetAlignmentFactorNull401 success `, offset);
          expect(offset === undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getAlignmentOffsetAlignmentFactorNull401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getAlignmentOffsetAlignmentFactorUndefined401
     * @tc.number textLineTest_014
     * @tc.desc   TextLine getAlignmentOffset alignmentFactor parameter undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAlignmentOffsetAlignmentFactorUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          const offset: number = lines[0].getAlignmentOffset(undefined, 500);
          
          console.info(`${LOG_PREFIX} getAlignmentOffsetAlignmentFactorUndefined401 success `, offset);
          expect(offset === undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getAlignmentOffsetAlignmentFactorUndefined401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getAlignmentOffsetNormal
     * @tc.number textLineTest_015
     * @tc.desc   TextLine getAlignmentOffset normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getAlignmentOffsetNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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

          const lines: text.TextLine[] = paragraph.getTextLines();
          const offset: number = lines[0].getAlignmentOffset(0.5, 500);
          
          console.info(`${LOG_PREFIX} getAlignmentOffsetNormal success `, offset);
          expect(typeof offset === 'number').assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getAlignmentOffsetNormal error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getLineMetricsAdd05
     * @tc.number getLineMetricsAdd05
     * @tc.desc   TextLine getLineMetrics normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getLineMetricsAdd05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg  = "====getLineMetricsAdd05===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        console.info('www data arrLineMetric ', 11111);
        let lineMetrics: text.LineMetrics | undefined =  paragraph.getLineMetrics(0);
        console.info('www data arrLineMetric ', JSON.stringify(lineMetrics));
        expect(lineMetrics?.startIndex).assertEqual(0);
        expect(lineMetrics?.endIndex).assertEqual(39);
        expect(lineMetrics?.ascent).assertLargerOrEqual(0);
        expect(lineMetrics?.descent).assertLargerOrEqual(0);
        expect(lineMetrics?.height).assertLarger(0);
        expect(lineMetrics?.width).assertLarger(0);
        expect(lineMetrics?.left).assertEqual(0);
        expect(lineMetrics?.baseline).assertLarger(0);
        expect(lineMetrics?.lineNumber).assertEqual(0);
        expect(lineMetrics?.topHeight).assertEqual(0);
        expect(lineMetrics?.runMetrics !== undefined).assertTrue();
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   getImageBoundsAdd05
     * @tc.number getImageBoundsAdd05
     * @tc.desc   run getImageBounds normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getImageBoundsAdd05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const LOG_PREFIX = 'www data ';
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          const longText = 'This is a very long text with many words to test the getImageBounds method properly and ' +
            'ensure it works correctly with large amounts of text content and provides accurate boundary measurements.';
          paragraphBuilder.addText(longText);
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const lines: text.TextLine[] = paragraph.getTextLines();
          const runs: text.Run[] = lines[0].getGlyphRuns();
          const bounds: common2D.Rect = runs[0].getImageBounds();

          console.info(`${LOG_PREFIX} getImageBoundsAdd05 error `, JSON.stringify(bounds));

          console.info(`${LOG_PREFIX} getImageBoundsAdd05 success left=${bounds.left} right=${bounds.right} `
            + `bottom=${bounds.bottom} width=${bounds.right - bounds.left}`);
          expect(bounds.left).assertEqual(0);
          expect(bounds.top).assertLargerOrEqual(0);
          expect(bounds.right).assertLarger(0);
          expect(bounds.bottom).assertLarger(0);
          expect(bounds.right > bounds.left).assertLarger(0);
          expect(bounds.right - bounds.left > 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getImageBoundsAdd05 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });
      
    /**
     * @tc.name   getFontDescriptorByFullNameAdd05
     * @tc.number getFontDescriptorByFullNameAdd05
     * @tc.desc   text getFontDescriptorByFullName test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getFontDescriptorByFullNameAdd05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function)=> {
        let msg = "====www data testGetSystemFontFullNamesByType===="
        console.info(msg + ' begin ');
        let fontType:text.SystemFontType = text.SystemFontType.GENERIC
        try{
          let promiseFontType = text.getSystemFontFullNamesByType(fontType)
          promiseFontType.then((data:Array<string>) => {
            console.info(msg + ` then font list size: ${data.length}`)
            console.info(msg + ' data[0] = ' + data[0])
            let promise = text.getFontDescriptorByFullName(data[0], fontType)
            promise.then((fontDescriptor: text.FontDescriptor) => {
              console.log(msg + ' Succeed in text.getFontDescriptorByFullName  ' + JSON.stringify(fontDescriptor) )
              console.log(msg + ' Succeed in text.getFontDescriptorByFullName  ' + fontDescriptor )
              console.info(msg + ` desc: ${JSON.stringify(fontDescriptor)}`)
              expect(fontDescriptor.path).assertEqual('/system/fonts/HarmonyOS_Sans.ttf');
              expect(fontDescriptor.postScriptName).assertEqual('HarmonyOS_Sans');
              expect(fontDescriptor.fullName).assertEqual('HarmonyOS Sans');
              expect(fontDescriptor.fontFamily).assertEqual('HarmonyOS Sans');
              expect(fontDescriptor.fontSubfamily).assertEqual('Regular');
              expect(fontDescriptor.weight).assertEqual(3);
              expect(fontDescriptor.width).assertEqual(5);
              expect(fontDescriptor.italic).assertEqual(0);
              expect(fontDescriptor.monoSpace).assertFalse();
              expect(fontDescriptor.symbolic).assertFalse();
              expect(fontDescriptor.localPostscriptName).assertEqual('HarmonyOS_Sans');
              expect(fontDescriptor.localFullName).assertEqual('HarmonyOS Sans');
              expect(fontDescriptor.localFamilyName).assertEqual('HarmonyOS Sans');
              expect(fontDescriptor.localSubFamilyName).assertEqual('Regular');
              expect(fontDescriptor.version).assertEqual('Version 2.040');
              expect(fontDescriptor.manufacture).assertEqual('Hanyi Fonts');
              expect(fontDescriptor.copyright).assertEqual('Copyright 2021-2024 Huawei Device Co., Ltd. All Rights Reserved.');
              expect(fontDescriptor.trademark).assertEqual('');
              expect(fontDescriptor.license).assertEqual('');
              expect(fontDescriptor.index).assertEqual(0);
              done()
            }).catch((error: BusinessError) => {
              console.error(msg + ` Failed to get fontDescriptor by fullName, error: ${JSON.stringify(error)}`);
              expect().assertFail();
              done()
            });
          }).catch((error: BusinessError) => {
            console.error(`Failed to get font fullNames by type, error: ${JSON.stringify(error)}`);
          });
        } catch(err){
          console.info(msg + ' Failed in text.getSystemFontFullNamesByType.  Cause: ' + JSON.stringify(err));
          console.info(msg + ' Failed in text.getSystemFontFullNamesByType.  Cause: ' + err);
          expect().assertFail();
          done()
        }
      })
      
    /**
     * @tc.name   getFontDescriptorsFromPathAdd05
     * @tc.number getFontDescriptorsFromPathAdd05
     * @tc.desc   text getFontDescriptorsFromPath test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getFontDescriptorsFromPathAdd05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const LOG_PREFIX = 'www data ';
        try {
          const descriptors: text.FontDescriptor[] = await text.getFontDescriptorsFromPath('');
          console.info(`${LOG_PREFIX} getFontDescriptorsFromPathAdd05 success`, JSON.stringify(descriptors));
          expect(descriptors.length == 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getFontDescriptorsFromPathAdd05 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });
    
    /**
     * @tc.name   getFontUnicodeSetAdd05
     * @tc.number getFontUnicodeSetAdd05
     * @tc.desc   text getFontUnicodeSet test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getFontUnicodeSetAdd05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const LOG_PREFIX = 'www data ';
        try {
          const unicodeSet: number[] = await text.getFontUnicodeSet('', 0);
          console.info(`${LOG_PREFIX} getFontUnicodeSetAdd05 success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getFontUnicodeSetAdd05 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getFontCountAdd05
     * @tc.number getFontCountAdd05
     * @tc.desc   text getFontCount test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getFontCountAdd05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const LOG_PREFIX = 'www data ';
        try {
          const count: number = text.getFontCount('');
          console.info(`${LOG_PREFIX} getFontCountAdd05 success`);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getFontCountAdd05 error `, JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   testGraphicTextAdd05_getRectsForRange
     * @tc.number testGraphicTextAdd05_getRectsForRange
     * @tc.desc   getRectsForRange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGraphicTextAdd05_getRectsForRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function)=> {
      let msg  = "====www data testGraphicTextAdd05_getRectsForRange===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        let range: text.Range = { start: 0, end: 1};
        let rects = paragraph.getRectsForRange(range, text.RectWidthStyle.TIGHT,
          text.RectHeightStyle.INCLUDE_LINE_SPACE_MIDDLE);
        console.info(msg + 'rects success ', JSON.stringify(rects))
        expect(rects.length > 0).assertTrue();
        done();
      } catch(err){
        console.info(msg + 'rects error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testGraphicTextAdd05_createTruncatedLine
     * @tc.number testGraphicTextAdd05_createTruncatedLine
     * @tc.desc   test createTruncatedLine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGraphicTextAdd05_createTruncatedLine', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text with very long content');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const lines: text.TextLine[] = paragraph.getTextLines();
          const truncatedLine1: text.TextLine = lines[0].createTruncatedLine(100,text.EllipsisMode.MULTILINE_START,'');
          console.info(`${LOG_PREFIX} createTruncatedLineEllipsisEmpty success`, JSON.stringify(truncatedLine1));
          expect(truncatedLine1 !== undefined).assertTrue();
          const truncatedLine2: text.TextLine = lines[0].createTruncatedLine(100,text.EllipsisMode.MULTILINE_MIDDLE,'');
          console.info(`${LOG_PREFIX} createTruncatedLineEllipsisEmpty success`, JSON.stringify(truncatedLine2));
          expect(truncatedLine2).assertUndefined();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} createTruncatedLineEllipsisEmpty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

  })
}

