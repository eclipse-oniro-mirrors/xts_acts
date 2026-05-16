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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import text from "@ohos.graphics.text";
import common2D from '@ohos.graphics.common2D';

export default function GraphicTextNewAPI() {

  describe('GraphicTextNewAPI', () => {
    let myColor: common2D.Color;
    beforeAll(() => {
      myColor = { alpha: 255, red: 255, green: 0, blue: 0 };
    })

    /**
     * @tc.name   graphicTextNewAPIStatic_0100
     * @tc.number graphicTextNewAPIStatic_0100
     * @tc.desc   text newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextNewAPIStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====graphicTextNewAPIStatic_0100===="
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
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.updateColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        paragraph.updateDecoration({
          textDecoration: text.TextDecorationType.OVERLINE,
          color: { alpha: 255, red: 255, green: 0, blue: 0 },
          decorationStyle: text.TextDecorationStyle.WAVY,
          decorationThicknessScale: 2.0,
        });
        paragraph.layoutSync(600);
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   graphicTextNewAPIStatic_0200
     * @tc.number graphicTextNewAPIStatic_0200
     * @tc.desc   text newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextNewAPIStatic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====graphicTextNewAPIStatic_0200===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
          badgeType: text.TextBadgeType.TEXT_SUPERSCRIPT
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          autoSpace: false,
          trailingSpaceOptimized: false
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.updateColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        paragraph.updateDecoration({
          textDecoration: text.TextDecorationType.LINE_THROUGH,
          color: { alpha: 255, red: 255, green: 0, blue: 0 },
          decorationStyle: text.TextDecorationStyle.DOTTED,
          decorationThicknessScale: 1.0,
        });
        paragraph.layoutSync(600);
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   graphicTextNewAPIStatic_0300
     * @tc.number graphicTextNewAPIStatic_0300
     * @tc.desc   text newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextNewAPIStatic_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====graphicTextNewAPIStatic_0300===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
          badgeType: text.TextBadgeType.TEXT_SUBSCRIPT
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          autoSpace: true,
          trailingSpaceOptimized: false
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.updateColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        paragraph.updateDecoration({
          textDecoration: text.TextDecorationType.UNDERLINE,
          color: { alpha: 255, red: 255, green: 0, blue: 0 },
          decorationStyle: text.TextDecorationStyle.DASHED,
          decorationThicknessScale: 1.5,
        });
        paragraph.layoutSync(600);
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   graphicTextNewAPIStatic_0400
     * @tc.number graphicTextNewAPIStatic_0400
     * @tc.desc   text newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextNewAPIStatic_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====graphicTextNewAPIStatic_0400===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        try {
          text.setTextHighContrast(text.TextHighContrast.TEXT_FOLLOW_SYSTEM_HIGH_CONTRAST);
        } catch (err) {
          console.info('www data test error ' + msg + err);
          expect().assertFail();
        }
        paragraph.layoutSync(600);
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   graphicTextNewAPIStatic_0500
     * @tc.number graphicTextNewAPIStatic_0500
     * @tc.desc   text newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextNewAPIStatic_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====graphicTextNewAPIStatic_0500===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        try {
          text.setTextHighContrast(text.TextHighContrast.TEXT_APP_DISABLE_HIGH_CONTRAST);
        } catch (err) {
          console.info('www data test error ' + msg + err);
          expect().assertFail();
        }
        paragraph.layoutSync(600);
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   graphicTextNewAPIStatic_0600
     * @tc.number graphicTextNewAPIStatic_0600
     * @tc.desc   text newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextNewAPIStatic_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====graphicTextNewAPIStatic_0600===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          verticalAlign: text.TextVerticalAlign.TOP,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        try {
          text.setTextHighContrast(text.TextHighContrast.TEXT_APP_ENABLE_HIGH_CONTRAST);
        } catch (err) {
          console.info('www data test error ' + msg + err);
          expect().assertFail();
        }
        paragraph.layoutSync(600);
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   graphicTextNewAPIStatic_0700
     * @tc.number graphicTextNewAPIStatic_0700
     * @tc.desc   text newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextNewAPIStatic_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====graphicTextNewAPIStatic_0700===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          verticalAlign: text.TextVerticalAlign.CENTER,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        try {
          text.setTextUndefinedGlyphDisplay(text.TextUndefinedGlyphDisplay.USE_TOFU);
        } catch (err) {
          console.info('www data test error ' + msg + err);
          expect().assertFail();
        }
        paragraph.layoutSync(600);
        let lines: Array<text.TextLine> = paragraph.getTextLines();
        let length = lines.length;
        for(let i =0 ; i < length ; i++) {
          let runs: Array<text.Run> = lines[i].getGlyphRuns();
          let x: number = 0;
          let y: number = 0;
          for (let j = 0; j < runs.length; j++) {
            let glyphs = runs[j].getGlyphs();
            let font = runs[j].getFont();
            try {
              let textDirection = runs[0].getTextDirection();
              expect(textDirection).assertEqual(text.TextDirection.LTR);
            } catch (err) {
              console.info(msg + JSON.stringify(err));
              expect().assertFail();
            }
            try {
              let advancesRange1 = runs[0].getAdvances({start:0, end:10});
              expect(advancesRange1?.length).assertLarger(0);
              let advancesRange2 = runs[0].getAdvances({start:10, end:10});
              expect(advancesRange2?.length == 0).assertTrue();
              let advancesRange3 = runs[0].getAdvances({start:0, end:-10});
              expect(advancesRange3).assertEqual(undefined);
            } catch (err) {
              console.info(msg + JSON.stringify(err));
              expect().assertFail();
            }
            try {
              let advancesRange = runs[0].getAdvances({start:-1, end:2});
              expect(advancesRange).assertEqual(undefined);
            } catch (err) {
              console.info(msg + JSON.stringify(err));
              expect().assertFail();
            }

          }
        }
        try {
          fontCollection.unloadFontSync('custom');
        } catch (err) {
          console.info('www data test error ' + msg + err);
          expect().assertFail();
        }
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   graphicTextNewAPIStatic_0800
     * @tc.number graphicTextNewAPIStatic_0800
     * @tc.desc   text newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextNewAPIStatic_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====graphicTextNewAPIStatic_0800===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          verticalAlign: text.TextVerticalAlign.BOTTOM,
          textDirection: text.TextDirection.RTL
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "سىناق تېكىستى";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        try {
          text.setTextUndefinedGlyphDisplay(text.TextUndefinedGlyphDisplay.USE_DEFAULT);
        } catch (err) {
          console.info('www data test error ' + msg + err);
          expect().assertFail();
        }
        paragraph.layoutSync(600);
        let lines: Array<text.TextLine> = paragraph.getTextLines();
        let length = lines.length;
        for(let i =0 ; i < length ; i++) {
          let runs: Array<text.Run> = lines[i].getGlyphRuns();
          let x: number = 0;
          let y: number = 0;
          for (let j = 0; j < runs.length; j++) {
            let glyphs = runs[j].getGlyphs();
            let font = runs[j].getFont();
            try {
              let textDirection = runs[0].getTextDirection();
              expect(textDirection).assertEqual(text.TextDirection.RTL);
            } catch (err) {
              console.info(msg + JSON.stringify(err));
              expect().assertFail();
            }
            try {
              let advancesRange = runs[0].getAdvances({start:0, end:-10});
              expect(advancesRange).assertEqual(undefined);
            } catch (err) {
              console.info(msg + JSON.stringify(err));
              expect().assertFail();
            }

          }
        }
        try {
          fontCollection.unloadFont('custom');
        } catch (err) {
          console.info('www data test error ' + msg + err);
          expect().assertFail();
        }
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   graphicTextNewAPIStatic_0900
     * @tc.number graphicTextNewAPIStatic_0900
     * @tc.desc   text newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextNewAPIStatic_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====graphicTextNewAPIStatic_0900===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          verticalAlign: text.TextVerticalAlign.BASELINE,
        }
        let myPlaceholderSpan: text.PlaceholderSpan = {
          width: 22,
          height: 33,
          align: text.PlaceholderAlignment.FOLLOW_PARAGRAPH,
          baseline: text.TextBaseline.ALPHABETIC,
          baselineOffset: 66
        };
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        paragraphBuilder.addPlaceholder(myPlaceholderSpan);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        try {
          text.setTextUndefinedGlyphDisplay(text.TextUndefinedGlyphDisplay.USE_DEFAULT);
        } catch (err) {
          console.info('www data test error ' + msg + err);
          expect().assertFail();
        }
        paragraph.layoutSync(600);
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testTextReturnValue_0100
     * @tc.number testTextReturnValue_0100
     * @tc.desc   testTextReturnValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextReturnValue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====testTextReturnValue_0100===="
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
        let range1: text.Range = { start: 0, end: 1};
        let rects1 = paragraph.getRectsForRange(range1, text.RectWidthStyle.TIGHT, text.RectHeightStyle.TIGHT);
        console.info('www data rects 111 ', JSON.stringify(rects1))
        expect(rects1.length > 0).assertTrue();
        let range2: text.Range = { start: 0, end: 0};
        let rects2 = paragraph.getRectsForRange(range2, text.RectWidthStyle.TIGHT, text.RectHeightStyle.TIGHT);
        console.info('www data rects 222 ', JSON.stringify(rects2))
        expect(rects2.length == 0).assertTrue();
        let placeholderRects = paragraph.getRectsForPlaceholders();
        expect(placeholderRects.length == 0).assertTrue();
        let didExceed = paragraph.didExceedMaxLines();
        expect(didExceed == false).assertTrue();
        let lines = paragraph.getTextLines();
        expect(lines.length > 0).assertTrue();
        let arrLineMetric =  paragraph.getLineMetrics();
        expect(arrLineMetric.length > 0).assertTrue();
        let lineMetrics =  paragraph.getLineMetrics(0);
        expect(lineMetrics != undefined).assertTrue();
        let runs = lines[0].getGlyphRuns();
        expect(runs.length > 0).assertTrue();
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testTextReturnValue_0200
     * @tc.number testTextReturnValue_0200
     * @tc.desc   testTextReturnValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextReturnValue_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====testTextReturnValue_0200===="
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
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        let lines = paragraph.getTextLines();
        console.info('www data lines ', JSON.stringify(lines));
        expect(lines.length == 0).assertTrue();
        let arrLineMetric =  paragraph.getLineMetrics();
        console.info('www data arrLineMetric ', JSON.stringify(arrLineMetric));
        expect(arrLineMetric.length == 0).assertTrue();
        let lineMetrics =  paragraph.getLineMetrics(0);
        console.info('www data lineMetrics ', JSON.stringify(lineMetrics));
        expect(lineMetrics == undefined).assertTrue();
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testTextReturnValue_0300
     * @tc.number testTextReturnValue_0300
     * @tc.desc   testTextReturnValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextReturnValue_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====testTextReturnValue_0300===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
          fontSize: 50,
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          maxLines: 1,
        }
        let myPlaceholderSpan: text.PlaceholderSpan = {
          width: 100,
          height: 100,
          align: text.PlaceholderAlignment.FOLLOW_PARAGRAPH,
          baseline: text.TextBaseline.ALPHABETIC,
          baselineOffset: 100
        };
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        paragraphBuilder.addPlaceholder(myPlaceholderSpan);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf_测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        let placeholderRects = paragraph.getRectsForPlaceholders();
        expect(placeholderRects.length > 0).assertTrue();
        let didExceed = paragraph.didExceedMaxLines();
        expect(didExceed == true).assertTrue();
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testTextReturnValue_0400
     * @tc.number testTextReturnValue_0400
     * @tc.desc   testTextReturnValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextReturnValue_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====testTextReturnValue_0400====";
      let fontCollection = text.FontCollection.getGlobalInstance();
      fontCollection.unloadFontSync('myFamilyName');
      fontCollection.unloadFontSync('myFamilyName0');
      fontCollection.unloadFontSync('test');
      let fontType:text.SystemFontType = text.SystemFontType.GENERIC;
      let fontTypeNums = await text.getSystemFontFullNamesByType(fontType);
      console.info(msg + fontTypeNums);
      console.info(msg + fontTypeNums.length);
      expect(fontTypeNums.length > 0).assertTrue();
      let fontTypeNums1 = await text.getSystemFontFullNamesByType(text.SystemFontType.CUSTOMIZED);
      expect(fontTypeNums1.length == 0).assertTrue();
      let fontDescriptor1 = await text.matchFontDescriptors({
        weight: text.FontWeight.W400,
      })
      console.info(msg + fontDescriptor1.length);
      expect(fontDescriptor1.length > 0).assertTrue();
      let fontDescriptor2 = await text.matchFontDescriptors({
        path: '/test_xts',
        postScriptName: 'AaAa'
      })
      console.info(msg + JSON.stringify(fontDescriptor2));
      expect(fontDescriptor2.length == 0).assertTrue();
      done();
    })

    /**
     * @tc.name   testTextReturnValue_0500
     * @tc.number testTextReturnValue_0500
     * @tc.desc   testTextReturnValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextReturnValue_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====testTextReturnValue_0500====";
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
          fontSize: 50,
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          maxLines: 1,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        let lines =  paragraph.getTextLines();
        let runs = lines[0].getGlyphRuns();
        console.info('www data runs ' + JSON.stringify(runs));
        expect(runs.length > 0).assertTrue();
        let glphy1 = runs[0].getGlyphs();
        console.info('www data glphy1 ' + JSON.stringify(glphy1));
        expect(glphy1.length > 0).assertTrue();
        let glphy2 = runs[0].getGlyphs({start: 0, end: 1});
        console.info('www data glphy2 ' + JSON.stringify(glphy2));
        expect(glphy2?.length).assertLarger(0);
        let glphy3 = runs[0].getGlyphs({start: 0, end: 0});
        console.info('www data glphy3 ' + JSON.stringify(glphy3));
        expect(glphy3?.length).assertLarger(0);
        let glphy4 = runs[0].getGlyphs({start: 0, end: -1});
        console.info('www data glphy4 ' + JSON.stringify(glphy4));
        expect(glphy4 == undefined).assertTrue();
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testTextReturnValue_0600
     * @tc.number testTextReturnValue_0600
     * @tc.desc   testTextReturnValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextReturnValue_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====testTextReturnValue_0600====";
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
          fontSize: 50,
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          maxLines: 1,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        let lines =  paragraph.getTextLines();
        let runs = lines[0].getGlyphRuns();
        console.info('www data runs ' + JSON.stringify(runs));
        expect(runs.length > 0).assertTrue();
        let position1 = runs[0].getPositions();
        console.info('www data position1 ' + JSON.stringify(position1));
        expect(position1.length > 0).assertTrue();
        let position2 = runs[0].getPositions({start: 0, end: 1});
        console.info('www data position2 ' + JSON.stringify(position2));
        expect(position2?.length).assertLarger(0);
        let position3 = runs[0].getPositions({start: 0, end: 0});
        console.info('www data position3 ' + JSON.stringify(position3));
        expect(position3?.length).assertLarger(0);
        let position4 = runs[0].getPositions({start: 0, end: -1});
        console.info('www data position4 ' + JSON.stringify(position4));
        expect(position4 == undefined).assertTrue();
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testTextReturnValue_0700
     * @tc.number testTextReturnValue_0700
     * @tc.desc   testTextReturnValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextReturnValue_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====testTextReturnValue_0700====";
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
          fontSize: 50,
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          maxLines: 1,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        let lines =  paragraph.getTextLines();
        let runs = lines[0].getGlyphRuns();
        console.info('www data runs ' + JSON.stringify(runs));
        expect(runs.length > 0).assertTrue();
        let offset = runs[0].getOffsets();
        console.info('www data offset ' + JSON.stringify(offset));
        expect(offset.length > 0).assertTrue();
        let indices = runs[0].getStringIndices(); // 获取渲染块全部字符索引
        console.info('www data indices ' + JSON.stringify(indices));
        let indicesRange1 = runs[0].getStringIndices({start:1, end:2}); // 获取渲染块从起始位置1开始, 长度为2范围内的字符索引
        console.info('www data indicesRange1 ' + JSON.stringify(indicesRange1));
        expect(indicesRange1?.length).assertLarger(0);
        let indicesRange2 = runs[0].getStringIndices({start:-1, end:2}); // -1是非法参数，将返回undefined
        console.info('www data indicesRange2 ' + JSON.stringify(indicesRange2));
        expect(indicesRange2 == undefined).assertTrue();
        let indicesRange3 = runs[0].getStringIndices({start:0, end:-10}); // -10是非法参数，将返回undefined
        console.info('www data indicesRange3 ' + JSON.stringify(indicesRange3));
        expect(indicesRange3 == undefined).assertTrue();
        let indicesUndefined = runs[0].getStringIndices(undefined); // undefined是非法参数，将返回undefined
        console.info('www data indicesUndefined ' + JSON.stringify(indicesUndefined));
        expect(indicesUndefined == undefined).assertTrue();
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

  })
}
