/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import text from "@ohos.graphics.text";
import common2D from '@ohos.graphics.common2D';
import drawing from '@ohos.graphics.drawing';
import { $rawfile, Resource } from '@ohos.arkui.component';
import image from '@ohos.multimedia.image';

export default function GraphicTextAPIAdd01() {

  describe('GraphicTextAPIAdd01', () => {
    beforeAll(() => {
    })

    /**
     * @tc.name   GraphicTextAPIAdd01Static_0100
     * @tc.number GraphicTextAPIAdd01Static_0100
     * @tc.desc   test loadFontSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd01Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          fontCollection.loadFontSync('', $rawfile('test.ttf'));
          console.info('www data success to do GraphicTextAPIAdd01Static_0100');
        } catch (err) {
          console.error(`www data Failed to do GraphicTextAPIAdd01Static_0100, error: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
        }
        fontCollection.unloadFontSync('');
        done();
    })

    /**
     * @tc.name   GraphicTextAPIAdd01Static_0200
     * @tc.number GraphicTextAPIAdd01Static_0200
     * @tc.desc   test loadFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd01Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          await fontCollection.loadFont('', $rawfile('test.ttf'));
          console.info('www data success to do GraphicTextAPIAdd01Static_0200');
        } catch (err) {
          console.error(`www data Failed to do GraphicTextAPIAdd01Static_0200, error: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
        }
        await fontCollection.unloadFont('');
        done();
      })

    /**
     * @tc.name   GraphicTextAPIAdd01Static_0300
     * @tc.number GraphicTextAPIAdd01Static_0300
     * @tc.desc   test loadFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd01Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          await fontCollection.loadFont('family', '');
          console.info('www data success to do GraphicTextAPIAdd01Static_0300');
        } catch (err) {
          console.error(`www data Failed to do GraphicTextAPIAdd01Static_0300, error: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
        }
        fontCollection.unloadFontSync('family');
        done();
      })

    /**
     * @tc.name   GraphicTextAPIAdd01Static_0400
     * @tc.number GraphicTextAPIAdd01Static_0400
     * @tc.desc   test loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd01Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        try {
          fontCollection.loadFontSyncWithCheck('', $rawfile('test.ttf'), 0);
          console.info('www data success to do GraphicTextAPIAdd01Static_0400');
        } catch (e) {
          console.error(`www data Failed to do GraphicTextAPIAdd01Static_0400, error: ${JSON.stringify(e)} `);
          expect(false).assertTrue();;
        }
        fontCollection.unloadFontSync('');
        done();
    })

    /**
     * @tc.name   GraphicTextAPIAdd01Static_0500
     * @tc.number GraphicTextAPIAdd01Static_0500
     * @tc.desc   test loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd01Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        try {
          fontCollection.loadFontSyncWithCheck('family', '', 0);
          console.info('www data success to do GraphicTextAPIAdd01Static_0500');
          expect(false).assertTrue();
        } catch (e) {
          console.error(`www data Failed to do GraphicTextAPIAdd01Static_0500, error: ${e}, ${e.code} `);
          expect(e.code).assertEqual(25900001);
        }
        fontCollection.unloadFontSync('family');
        done();
      })

    /**
     * @tc.name   GraphicTextAPIAdd01Static_0600
     * @tc.number GraphicTextAPIAdd01Static_0600
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd01Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        try {
          await fontCollection.loadFontWithCheck('', $rawfile('test.ttf'), 0);
          console.info('www data success to do GraphicTextAPIAdd01Static_0600');
        } catch (e) {
          console.error(`www data Failed to do GraphicTextAPIAdd01Static_0600, error: ${JSON.stringify(e)} `);
          expect(false).assertTrue();;
        }
        fontCollection.unloadFontSync('');
        done();
      })

    /**
     * @tc.name   GraphicTextAPIAdd01Static_0700
     * @tc.number GraphicTextAPIAdd01Static_0700
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd01Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        try {
          await fontCollection.loadFontWithCheck('family', '', 0);
          console.info('www data success to do GraphicTextAPIAdd01Static_0700');
          expect(false).assertTrue();
        } catch (e) {
          console.error(`www data Failed to do GraphicTextAPIAdd01Static_0700, error: ${e}, ${e.code} `);
          expect(e.code).assertEqual(25900001);
        }
        fontCollection.unloadFontSync('family');
        done();
      })

    /**
     * @tc.name   GraphicTextAPIAdd01Static_0800
     * @tc.number GraphicTextAPIAdd01Static_0800
     * @tc.desc   test getRectsForRange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd01Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        try {
          fontCollection.loadFontSync('Clock_01', 'file:///system/fonts/HarmonyClock_01.ttf')
          let fontFamilies: Array<string> = ["Clock_01"]
          let myTextStyle: text.TextStyle = {
            fontFamilies: fontFamilies
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          let range: text.Range = { start: 0, end: 1};
          let rects1 = paragraph.getRectsForRange(range, text.RectWidthStyle.MAX,
            text.RectHeightStyle.INCLUDE_LINE_SPACE_MIDDLE);
          console.info('www data success to do GraphicTextAPIAdd01Static_0800 rects1 ', rects1.length);
          fontCollection.unloadFontSync('Clock_01');
          expect(rects1.length).assertLarger(0);

          let rects2 = paragraph.getRectsForRange(range, text.RectWidthStyle.MAX,
            text.RectHeightStyle.INCLUDE_LINE_SPACE_TOP);
          console.info('www data success to do GraphicTextAPIAdd01Static_0800 rects2 ', rects2.length);
          fontCollection.unloadFontSync('Clock_01');
          expect(rects2.length).assertLarger(0);

          let rects3 = paragraph.getRectsForRange(range, text.RectWidthStyle.MAX,
            text.RectHeightStyle.INCLUDE_LINE_SPACE_BOTTOM);
          console.info('www data success to do GraphicTextAPIAdd01Static_0800 rects3 ', rects3.length);
          fontCollection.unloadFontSync('Clock_01');
          expect(rects3.length).assertLarger(0);

          let rects4 = paragraph.getRectsForRange(range, text.RectWidthStyle.MAX,
            text.RectHeightStyle.STRUT);
          console.info('www data success to do GraphicTextAPIAdd01Static_0800 rects4 ', rects4.length);
          fontCollection.unloadFontSync('Clock_01');
          expect(rects4.length).assertLarger(0);
          fontCollection.unloadFontSync('Clock_01');
          done();
        } catch (e) {
          console.error(`www data Failed to do GraphicTextAPIAdd01Static_0800, error: ${e}, ${e.code} `);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd01Static_0900
     * @tc.number GraphicTextAPIAdd01Static_0900
     * @tc.desc   test getGlyphPositionAtCoordinate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd01Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        try {
          fontCollection.loadFontSync('Clock_01', 'file:///system/fonts/HarmonyClock_01.ttf')
          let fontFamilies: Array<string> = ["Clock_01"]
          let myTextStyle: text.TextStyle = {
            fontFamilies: fontFamilies
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraphBuilder.addText('123456');
          paragraph.layoutSync(600);
          let positionWithAffinity = paragraph.getGlyphPositionAtCoordinate(0, 0);
          console.info('www data success in GraphicTextAPIAdd01Static_0900 ', positionWithAffinity.position);
          console.info('www data success in GraphicTextAPIAdd01Static_0900 ', positionWithAffinity.affinity);
          expect(positionWithAffinity.position).assertEqual(0);
          expect(positionWithAffinity.affinity).assertEqual(text.Affinity.DOWNSTREAM);
          fontCollection.unloadFontSync('Clock_01');
          done();
        } catch (e) {
          console.error(`www data Failed to do GraphicTextAPIAdd01Static_0900, error: ${e}, ${e.code} `);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd01Static_1000
     * @tc.number GraphicTextAPIAdd01Static_1000
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd01Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        try {
          fontCollection.loadFontSync('Clock_01', 'file:///system/fonts/HarmonyClock_01.ttf')
          let fontFamilies: Array<string> = ["Clock_01"]
          let myTextStyle: text.TextStyle = {
            fontFamilies: fontFamilies
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraphBuilder.addText('123456');
          paragraph.layoutSync(600);
          let wordRange = paragraph.getWordBoundary(0);
          console.info('www data success in GraphicTextAPIAdd01Static_1000 ', wordRange.start, wordRange.end);
          expect(wordRange.start).assertEqual(0);
          expect(wordRange.end).assertEqual(0);
          fontCollection.unloadFontSync('Clock_01');
          done();
        } catch (e) {
          console.error(`www data Failed to do GraphicTextAPIAdd01Static_1000, error: ${e}, ${e.code} `);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd01Static_1100
     * @tc.number GraphicTextAPIAdd01Static_1100
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd01Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        try {
          fontCollection.loadFontSync('Clock_01', 'file:///system/fonts/HarmonyClock_01.ttf')
          let fontFamilies: Array<string> = ["Clock_01"]
          let myTextStyle: text.TextStyle = {
            fontFamilies: fontFamilies
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraphBuilder.addText('123456');
          paragraph.layoutSync(600);
          let rang = paragraph.getActualTextRange(0, false);
          console.info('www data success in GraphicTextAPIAdd01Static_1100 ', rang.start, rang.end);
          expect(rang.start).assertEqual(0);
          expect(rang.end).assertEqual(0);
          fontCollection.unloadFontSync('Clock_01');
          done();
        } catch (e) {
          console.error(`www data Failed to do GraphicTextAPIAdd01Static_1100, error: ${e}, ${e.code} `);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd01Static_1200
     * @tc.number GraphicTextAPIAdd01Static_1200
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd01Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          fontCollection.loadFontSync('Clock_01', 'file:///system/fonts/HarmonyClock_01.ttf')
          let fontFamilies: Array<string> = ["Clock_01"]
          let myTextStyle: text.TextStyle = {
            fontFamilies: fontFamilies
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
            compressHeadPunctuation: false,
            includeFontPadding: true,
            fallbackLineSpacing: false
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          let lines = paragraph.getTextLines();
          let lineMetrics =  paragraph.getLineMetrics(0);
          console.info('www data success in GraphicTextAPIAdd01Static_1200 ', lineMetrics?.startIndex);
          console.info('www data success in GraphicTextAPIAdd01Static_1200 ', lineMetrics?.endIndex);
          console.info('www data success in GraphicTextAPIAdd01Static_1200 ', lineMetrics?.ascent);
          console.info('www data success in GraphicTextAPIAdd01Static_1200 ', lineMetrics?.descent);
          console.info('www data success in GraphicTextAPIAdd01Static_1200 ', lineMetrics?.height);
          console.info('www data success in GraphicTextAPIAdd01Static_1200 ', lineMetrics?.width);
          console.info('www data success in GraphicTextAPIAdd01Static_1200 ', lineMetrics?.left);
          console.info('www data success in GraphicTextAPIAdd01Static_1200 ', lineMetrics?.baseline);
          console.info('www data success in GraphicTextAPIAdd01Static_1200 ', lineMetrics?.lineNumber);
          console.info('www data success in GraphicTextAPIAdd01Static_1200 ', lineMetrics?.topHeight);
          console.info('www data success in GraphicTextAPIAdd01Static_1200 ', lineMetrics?.runMetrics);
          expect(lineMetrics?.startIndex).assertEqual(0);
          expect(lineMetrics?.endIndex).assertEqual(39);
          expect(lineMetrics?.ascent).assertLarger(0);
          expect(lineMetrics?.descent).assertLarger(0);
          expect(lineMetrics?.height).assertLarger(0);
          expect(lineMetrics?.width).assertLarger(0);
          expect(lineMetrics?.left).assertEqual(0);
          expect(lineMetrics?.baseline).assertLarger(0);
          expect(lineMetrics?.lineNumber).assertEqual(0);
          expect(lineMetrics?.topHeight).assertEqual(0);
          expect(lineMetrics?.runMetrics !== undefined).assertTrue();
          fontCollection.unloadFontSync('Clock_01');
          done();
        } catch (e) {
          console.error(`www data Failed to do GraphicTextAPIAdd01Static_1200, error: ${e}, ${e.code} `);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd01Static_1300
     * @tc.number GraphicTextAPIAdd01Static_1300
     * @tc.desc   text updateDecoration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd01Static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd01Static_1300===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let fontFamilies: Array<string> = ["Clock_01"]
          let myTextStyle: text.TextStyle = {
            fontFamilies: fontFamilies,
            badgeType: text.TextBadgeType.TEXT_BADGE_NONE
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
            autoSpace: true,
            trailingSpaceOptimized: true
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText('123456');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.updateDecoration({
            textDecoration: text.TextDecorationType.NONE,
            color: { alpha: 255, red: 255, green: 0, blue: 0 },
            decorationStyle: text.TextDecorationStyle.SOLID,
            decorationThicknessScale: 2.0,
          });
          paragraph.updateDecoration({
            textDecoration: text.TextDecorationType.NONE,
            color: { alpha: 255, red: 255, green: 0, blue: 0 },
            decorationStyle: text.TextDecorationStyle.DOUBLE,
            decorationThicknessScale: 2.0,
          });
          paragraph.layoutSync(600);
          fontCollection.unloadFontSync('Clock_01');
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd01Static_1400
     * @tc.number GraphicTextAPIAdd01Static_1400
     * @tc.desc   text addText ‘’
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd01Static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd01Static_1400===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let fontFamilies: Array<string> = ["Clock_01"]
          let myTextStyle: text.TextStyle = {
            fontFamilies: fontFamilies,
            badgeType: text.TextBadgeType.TEXT_BADGE_NONE
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
            autoSpace: true,
            trailingSpaceOptimized: true
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.addText('');
            console.info('www data GraphicTextAPIAdd01Static_1400 success addText');
          } catch(err){
            console.info('www data GraphicTextAPIAdd01Static_1400 failed to addText', err, err.code);
            expect(false).assertTrue();
          }
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          fontCollection.unloadFontSync('Clock_01');
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd01Static_1500
     * @tc.number GraphicTextAPIAdd01Static_1500
     * @tc.desc   test getTextRange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd01Static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          fontCollection.loadFontSync('Clock_01', 'file:///system/fonts/HarmonyClock_01.ttf')
          let fontFamilies: Array<string> = ["Clock_01"]
          let myTextStyle: text.TextStyle = {
            fontFamilies: fontFamilies
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
            compressHeadPunctuation: false,
            includeFontPadding: true,
            fallbackLineSpacing: false
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let lineTypeset: text.LineTypeset = paragraphBuilder.buildLineTypeset();
          console.info('www data GraphicTextAPIAdd01Static_1500 getLineBreak ', lineTypeset.getLineBreak(20,100));
          let textLine: text.TextLine = lineTypeset.createLine(1,20);
          let range = textLine.getTextRange();
          console.info('www data GraphicTextAPIAdd01Static_1500 range.start ', range.start);
          console.info('www data GraphicTextAPIAdd01Static_1500 range.end ', range.end);
          expect(range.start).assertEqual(0);
          expect(range.end).assertEqual(30);
          fontCollection.unloadFontSync('Clock_01');
          done();
        } catch (e) {
          console.error(`www data Failed to do GraphicTextAPIAdd01Static_1500, error: ${e}, ${e.code} `);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd01Static_1600
     * @tc.number GraphicTextAPIAdd01Static_1600
     * @tc.desc   test createTruncatedLine
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd01Static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          fontCollection.loadFontSync('Clock_01', 'file:///system/fonts/HarmonyClock_01.ttf')
          let fontFamilies: Array<string> = ["Clock_01"]
          let myTextStyle: text.TextStyle = {
            fontFamilies: fontFamilies
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
            compressHeadPunctuation: false,
            includeFontPadding: true,
            fallbackLineSpacing: false
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let lineTypeset: text.LineTypeset = paragraphBuilder.buildLineTypeset();
          console.info('www data GraphicTextAPIAdd01Static_1600 getLineBreak ', lineTypeset.getLineBreak(20,100));
          let textLine: text.TextLine = lineTypeset.createLine(1,20);
          let truncatedTextLine1 = textLine.createTruncatedLine(10, text.EllipsisMode.MIDDLE, '');
          console.info('www data GraphicTextAPIAdd01Static_1600 range.start ', truncatedTextLine1);
          console.info('www data GraphicTextAPIAdd01Static_1600 range.start ', truncatedTextLine1?.getGlyphCount());
          expect(truncatedTextLine1).assertUndefined();
          let truncatedTextLine2 = textLine.createTruncatedLine(10, text.EllipsisMode.MIDDLE, ' ');
          console.info('www data GraphicTextAPIAdd01Static_1600 range.start ', truncatedTextLine2);
          console.info('www data GraphicTextAPIAdd01Static_1600 range.start ', truncatedTextLine2?.getGlyphCount());
          expect(truncatedTextLine2).assertUndefined();
          fontCollection.unloadFontSync('Clock_01');
          done();
        } catch (e) {
          console.error(`www data Failed to do GraphicTextAPIAdd01Static_1600, error: ${e}, ${e.code} `);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd01Static_1700
     * @tc.number GraphicTextAPIAdd01Static_1700
     * @tc.desc   test getTypographicBounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd01Static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let fontFamilies: Array<string> = ["Clock_01"]
          let myTextStyle: text.TextStyle = {
            fontFamilies: fontFamilies
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
            compressHeadPunctuation: false,
            includeFontPadding: true,
            fallbackLineSpacing: false
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let lineTypeset: text.LineTypeset = paragraphBuilder.buildLineTypeset();
          let textLine: text.TextLine = lineTypeset.createLine(1,20);
          let bounds = textLine.getTypographicBounds();
          console.info('www data GraphicTextAPIAdd01Static_1700 bounds ',
            bounds.ascent, bounds.descent, bounds.leading, bounds.width);
          expect(bounds.ascent).assertLessOrEqual(0);
          expect(bounds.descent).assertLargerOrEqual(0);
          expect(bounds.leading).assertLargerOrEqual(0);
          expect(bounds.width).assertLargerOrEqual(0);
          fontCollection.unloadFontSync('Clock_01');
          done();
        } catch (e) {
          console.error(`www data Failed to do GraphicTextAPIAdd01Static_1700, error: ${e}, ${e.code} `);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd01Static_2000
     * @tc.number GraphicTextAPIAdd01Static_2000
     * @tc.desc   test getTrailingSpaceWidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd01Static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = new text.FontCollection();
        fontCollection.unloadFontSync('Clock_01');
        try {
          let fontFamilies: Array<string> = ["Clock_01"]
          let myTextStyle: text.TextStyle = {
            fontFamilies: fontFamilies
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
            compressHeadPunctuation: false,
            includeFontPadding: true,
            fallbackLineSpacing: false
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf  ";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          let lines = paragraph.getTextLines();
          let trailingSpaceWidth  = lines[0].getTrailingSpaceWidth();
          console.info('www data GraphicTextAPIAdd01Static_2000 trailingSpaceWidth  ', trailingSpaceWidth);
          expect(trailingSpaceWidth).assertLarger(0);
          let point: common2D.Point = { x: 15.0, y: 2.0 };
          let stringIndexForPosition = lines[0].getStringIndexForPosition(point);
          console.info('www data GraphicTextAPIAdd01Static_2000 getStringIndexForPosition  ', stringIndexForPosition);
          expect(stringIndexForPosition).assertLargerOrEqual(0);
          let stringIndex = lines[0].getOffsetForStringIndex(1);
          console.info('www data GraphicTextAPIAdd01Static_2000 getOffsetForStringIndex  ', stringIndex);
          expect(stringIndex).assertLarger(0);
          let alignmentOffset = lines[0].getAlignmentOffset(0.5, 500);
          console.info('www data GraphicTextAPIAdd01Static_2000 getAlignmentOffset  ', alignmentOffset);
          expect(alignmentOffset).assertLarger(0);
          fontCollection.unloadFontSync('Clock_01');
          done();
        } catch (e) {
          console.error(`www data GraphicTextAPIAdd01Static_2000 Failed, error: ${e}, ${e.code} `);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd01Static_2100
     * @tc.number GraphicTextAPIAdd01Static_2100
     * @tc.desc   test getTypographicBounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd01Static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          fontCollection.loadFontSync('Clock_01', $rawfile('test.ttf'));
          let fontFamilies: Array<string> = ["Clock_01"]
          let myTextStyle: text.TextStyle = {
            fontFamilies: fontFamilies
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
            compressHeadPunctuation: false,
            includeFontPadding: true,
            fallbackLineSpacing: false
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf  ";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          let lines = paragraph.getTextLines();
          let runs = lines[0].getGlyphRuns();

          let glyphsCount = runs[0].getGlyphCount();
          let glyphs = runs[0].getGlyphs();
          let glyphsEnum = runs[0].getGlyphs({start:0, end:2});
          let position = runs[0].getPositions();
          let positionEnum = runs[0].getPositions({start:1, end:2});
          let offsets = runs[0].getOffsets();
          console.info('www data GraphicTextAPIAdd01Static_2100 glyphsCount ', glyphsCount);
          console.info('www data GraphicTextAPIAdd01Static_2100 glyphs ', glyphs);
          console.info('www data GraphicTextAPIAdd01Static_2100 glyphsEnum ', glyphsEnum);
          console.info('www data GraphicTextAPIAdd01Static_2100 glyphsEnum ', typeof(glyphsEnum));
          console.info('www data GraphicTextAPIAdd01Static_2100 position ', position);
          console.info('www data GraphicTextAPIAdd01Static_2100 positionEnum ', positionEnum);
          console.info('www data GraphicTextAPIAdd01Static_2100 offsets ', offsets);
          expect(glyphsCount).assertEqual(2);
          expect(glyphs[0]).assertEqual(15483);
          expect(glyphs[1]).assertEqual(23301);
          // expect(glyphsEnum[0]).assertEqual(15483);
          // expect(glyphsEnum[1]).assertEqual(23301);
          // expect(position).assertEqual();
          // expect(glyphsCount).assertEqual();
          // expect(glyphsCount).assertEqual();

          let runRange = runs[0].getStringRange();
          console.info('www data GraphicTextAPIAdd01Static_2100 runRange', runRange.start, runRange.end);
          expect(runRange.start).assertEqual(0);
          expect(runRange.end).assertEqual(2);

          let bounds = lines[0].getTypographicBounds();
          console.info('www data GraphicTextAPIAdd01Static_2100 runRange',
            bounds.ascent, bounds.descent, bounds.leading, bounds.width);
          expect(bounds.ascent).assertLessOrEqual(0);
          expect(bounds.descent).assertLargerOrEqual(0);
          expect(bounds.leading).assertLargerOrEqual(0);
          expect(bounds.width).assertLargerOrEqual(0);
          // let imageBounds = lines[0].getImageBounds();
          // console.info('www data GraphicTextAPIAdd01Static_2100 runRange', imageBounds);
          fontCollection.unloadFontSync('Clock_01');
          done();
        } catch (e) {
          console.error(`www data Failed to do GraphicTextAPIAdd01Static_2100, error: ${e}, ${e.code} `);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd01Static_2200
     * @tc.number GraphicTextAPIAdd01Static_2200
     * @tc.desc   test getTrailingSpaceWidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd01Static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let fontFamilies: Array<string> = ["Clock_01"]
          let myTextStyle: text.TextStyle = {
            fontFamilies: fontFamilies
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
            compressHeadPunctuation: false,
            includeFontPadding: true,
            fallbackLineSpacing: false
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf  ";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          let lines = paragraph.getTextLines();
          let trailingSpaceWidth  = lines[0].getTrailingSpaceWidth();
          console.info('www data GraphicTextAPIAdd01Static_2200 trailingSpaceWidth  ', trailingSpaceWidth);
          expect(trailingSpaceWidth).assertLarger(0);
          let point: common2D.Point = { x: 15.0, y: 2.0 };
          let stringIndexForPosition = lines[0].getStringIndexForPosition(point);
          console.info('www data GraphicTextAPIAdd01Static_2200 getStringIndexForPosition  ', stringIndexForPosition);
          expect(stringIndexForPosition).assertLargerOrEqual(0);
          let stringIndex = lines[0].getOffsetForStringIndex(1);
          console.info('www data GraphicTextAPIAdd01Static_2200 getOffsetForStringIndex  ', stringIndex);
          expect(stringIndex).assertLarger(0);
          let alignmentOffset = lines[0].getAlignmentOffset(0.5, 500);
          console.info('www data GraphicTextAPIAdd01Static_2200 getAlignmentOffset  ', alignmentOffset);
          expect(alignmentOffset).assertLarger(0);
          fontCollection.unloadFontSync('Clock_01');
          done();
        } catch (e) {
          console.error(`www data GraphicTextAPIAdd01Static_2200 Failed, error: ${e}, ${e.code} `);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd01Static_2300
     * @tc.number GraphicTextAPIAdd01Static_2300
     * @tc.desc   test getSystemFontFullNamesByType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicTextAPIAdd01Static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd01Static_2300====";
        let fontCollection = text.FontCollection.getGlobalInstance();
        fontCollection.unloadFontSync('myFamilyName');
        fontCollection.unloadFontSync('myFamilyName0');
        fontCollection.unloadFontSync('test');
        let fontType:text.SystemFontType = text.SystemFontType.GENERIC;

        let fontTypeNums = await text.getSystemFontFullNamesByType(text.SystemFontType.ALL);
        console.info(msg + fontTypeNums);
        console.info(msg + fontTypeNums.length);
        expect(fontTypeNums.length > 0).assertTrue();

        let fontTypeNums1 = await text.getSystemFontFullNamesByType(text.SystemFontType.STYLISH);
        console.info(msg + fontTypeNums1);
        console.info(msg + fontTypeNums1.length);
        expect(fontTypeNums1.length == 0).assertTrue();

        let fontTypeNums2 = await text.getSystemFontFullNamesByType(text.SystemFontType.INSTALLED);
        console.info(msg + fontTypeNums2);
        console.info(msg + fontTypeNums2.length);
        expect(fontTypeNums2.length == 0).assertTrue();
        done();
      })

    /**
     * @tc.name   GraphicTextAPIAdd01Static_2400
     * @tc.number GraphicTextAPIAdd01Static_2400
     * @tc.desc   test getFontDescriptorByFullName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicTextAPIAdd01Static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd01Static_2400====";
        let fontCollection = text.FontCollection.getGlobalInstance();
        fontCollection.unloadFontSync('myFamilyName');
        fontCollection.unloadFontSync('myFamilyName0');
        fontCollection.unloadFontSync('test');
        let fontType:text.SystemFontType = text.SystemFontType.GENERIC;
        try {
          await text.getFontDescriptorByFullName('HarmonyOS Sans', text.SystemFontType.ALL)
            .then((fontDescriptor: text.FontDescriptor)=>{
              console.info(msg + JSON.stringify(fontDescriptor));
              expect(fontDescriptor.path === '/system/fonts/HarmonyOS_Sans.ttf').assertTrue();
              expect(fontDescriptor.postScriptName === 'HarmonyOS_Sans').assertTrue();
              expect(fontDescriptor.fullName === 'HarmonyOS Sans').assertTrue();
              expect(fontDescriptor.fontFamily === 'HarmonyOS Sans').assertTrue();
              expect(fontDescriptor.fontSubfamily === 'Regular').assertTrue();
              expect(fontDescriptor.weight === text.FontWeight.W400).assertTrue();
              expect(fontDescriptor.width === 5).assertTrue();
              expect(fontDescriptor.italic === 0).assertTrue();
              expect(fontDescriptor.monoSpace === false).assertTrue();
              expect(fontDescriptor.symbolic === false).assertTrue();
              expect(fontDescriptor.localPostscriptName === 'HarmonyOS_Sans').assertTrue();
              expect(fontDescriptor.localFullName === 'HarmonyOS Sans').assertTrue();
              expect(fontDescriptor.localFamilyName === 'HarmonyOS Sans').assertTrue();
              expect(fontDescriptor.localSubFamilyName === 'Regular').assertTrue();
              expect(fontDescriptor.version === 'Version 2.040').assertTrue();
              expect(fontDescriptor.manufacture === 'Hanyi Fonts').assertTrue();
              expect(fontDescriptor.copyright === 'Copyright 2021-2024 Huawei Device Co., Ltd. All Rights Reserved.')
                .assertTrue();
              expect(fontDescriptor.trademark === '').assertTrue();
              expect(fontDescriptor.license === '').assertTrue();
              expect(fontDescriptor.index === 0).assertTrue();
            });
          await text.getFontDescriptorByFullName('clock', text.SystemFontType.STYLISH)
            .then((fontDescriptor: text.FontDescriptor)=>{
              console.info(msg + JSON.stringify(fontDescriptor));
              expect(false).assertTrue();
            }).catch((err: Error) => {
              console.info(msg + 'error ' + JSON.stringify(err));
            });
          await text.getFontDescriptorByFullName('clock', text.SystemFontType.INSTALLED)
            .then((fontDescriptor: text.FontDescriptor)=>{
              console.info(msg + JSON.stringify(fontDescriptor));
              expect(false).assertTrue();
            }).catch((err: Error) => {
              console.info(msg + 'error ' + JSON.stringify(err));
            });
          // console.info(msg + desc3.length);
          await text.getFontDescriptorByFullName('clock', text.SystemFontType.CUSTOMIZED)
            .then((fontDescriptor: text.FontDescriptor)=>{
              console.info(msg + JSON.stringify(fontDescriptor));
              expect(false).assertTrue();
            }).catch((err: Error) => {
              console.info(msg + 'error ' + JSON.stringify(err));
            });
          // console.info(msg + desc4.length);
        } catch(err){
          console.info(msg + err);
        }
        done();
      })

    /**
     * @tc.name   GraphicTextAPIAdd01Static_2500
     * @tc.number GraphicTextAPIAdd01Static_2500
     * @tc.desc   test getFontDescriptorsFromPath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicTextAPIAdd01Static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd01Static_2500====";
        await text.getFontDescriptorsFromPath("")
          .then((fontFullDescriptors: Array<text.FontDescriptor>) => {
            console.info(msg + 'www data fontFullDescriptors ', fontFullDescriptors.length);
            expect(fontFullDescriptors.length == 0).assertTrue();
          })
        done();
      })

    /**
     * @tc.name   GraphicTextAPIAdd01Static_2600
     * @tc.number GraphicTextAPIAdd01Static_2600
     * @tc.desc   test isFontSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicTextAPIAdd01Static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd01Static_2600===="
        let isSupported = text.isFontSupported('');
        console.info(msg + " is font supported: " + isSupported);
        expect(isSupported).assertFalse();
        done();
    })

    /**
     * @tc.name   GraphicTextAPIAdd01Static_2700
     * @tc.number GraphicTextAPIAdd01Static_2700
     * @tc.desc   test isFontSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicTextAPIAdd01Static_2700',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd01Static_2700===="
        await text.getFontUnicodeSet('', 0).then((unicodeSet:Array<int>) => {
          for (let index = 0; index < unicodeSet.length; index++) {
            console.info(msg, unicodeSet[index].toString())
          }
          console.info(msg, unicodeSet.length)
          expect(unicodeSet.length).assertEqual(0);
        })
        done();
      })

    /**
     * @tc.name   GraphicTextAPIAdd01Static_2800
     * @tc.number GraphicTextAPIAdd01Static_2800
     * @tc.desc   test getFontCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicTextAPIAdd01Static_2800',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd01Static_2800===="
        let fontCount = text.getFontCount('');
        console.info(msg + ' fontCount', fontCount);
        expect(fontCount).assertEqual(0);
        done();
      })


    /**
     * @tc.name   GraphicTextAPIAdd01Static_2900
     * @tc.number GraphicTextAPIAdd01Static_2900
     * @tc.desc   test getFontPathsByType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicTextAPIAdd01Static_2900',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====GraphicTextAPIAdd01Static_2900===="
        let fontList1 = text.getFontPathsByType(text.SystemFontType.GENERIC);
        console.info(msg + 'www data fontList', fontList1.length);
        let fontList2 = text.getFontPathsByType(text.SystemFontType.STYLISH);
        console.info(msg + 'www data fontList', fontList2.length);
        let fontList3 = text.getFontPathsByType(text.SystemFontType.INSTALLED);
        console.info(msg + 'www data fontList', fontList3.length);
        expect(fontList1.length).assertLargerOrEqual(0);
        expect(fontList2.length).assertLargerOrEqual(0);
        expect(fontList3.length).assertLargerOrEqual(0);
        done();
      })






  })
}
