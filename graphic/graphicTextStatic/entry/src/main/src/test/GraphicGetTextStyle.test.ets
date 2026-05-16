/*
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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import text from "@ohos.graphics.text";
import common2D from '@ohos.graphics.common2D';
import drawing from '@ohos.graphics.drawing';
import image from '@ohos.multimedia.image';
import { $rawfile, Resource } from '@ohos.arkui.component';

export default function GraphicGetTextStyle() {

  describe('GraphicGetTextStyle', () => {

    beforeAll(() => {
    })

    /**
     * @tc.name   testRunGetTextStyleStatic_0100
     * @tc.number SUB_GRAPHIC_Run_getTextStyle_static_0100
     * @tc.desc   Test Run.getTextStyle() returns valid TextStyle with correct fontSize.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunGetTextStyleStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testRunGetTextStyleStatic_0100===="
        console.info(msgStr + ' begin');
        let fontFamilies: Array<string> = ["text_test"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
          color: { alpha: 255, red: 255, green: 0, blue: 0 },
          fontSize: 20.0
        };
        try {
          console.info(msgStr + ' step1: create FontCollection');
          let fontCollection: text.FontCollection = new text.FontCollection();
          fontCollection.loadFontSync('text_test', $rawfile('test.ttf'));
          console.info(msgStr + ' step2: create ParagraphStyle');
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle
          };
          console.info(msgStr + ' step3: create ParagraphBuilder');
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          console.info(msgStr + ' step4: addText');
          paragraphBuilder.addText('Hello World');
          console.info(msgStr + ' step5: build Paragraph');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          console.info(msgStr + ' step6: layout Paragraph');
          await paragraph.layout(500);

          console.info(msgStr + ' step7: getTextLines');
          let textLines: Array<text.TextLine> = paragraph.getTextLines();
          console.info(msgStr + ' textLines length: ' + textLines.length);
          expect(textLines.length).assertLarger(0);

          console.info(msgStr + ' step8: getGlyphRuns');
          let runs: Array<text.Run> = textLines[0].getGlyphRuns();
          console.info(msgStr + ' runs length: ' + runs.length);
          expect(runs.length).assertLarger(0);

          console.info(msgStr + ' step9: getTextStyle');
          let runTextStyle: text.TextStyle = runs[0].getTextStyle();
          console.info(msgStr + ' runTextStyle is undefined: ' + (runTextStyle == undefined));
          expect(runTextStyle != undefined).assertTrue();
          console.info(msgStr + ' runTextStyle fontSize: ' + runTextStyle.fontSize);
          expect(runTextStyle.fontSize).assertEqual(20.0);
          console.info(msgStr + ' end');
          fontCollection.unloadFontSync('text_test');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testRunGetTextStyleColorStatic_0200
     * @tc.number SUB_GRAPHIC_Run_getTextStyleColor_static_0200
     * @tc.desc   Test Run.getTextStyle() returns correct color attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunGetTextStyleColorStatic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testRunGetTextStyleColorStatic_0200===="
        console.info(msgStr + ' begin');
        let fontFamilies: Array<string> = ["text_test"]
        let expectedColor: common2D.Color = { alpha: 255, red: 0, green: 128, blue: 255 };
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
          color: expectedColor,
          fontSize: 18.0
        };
        try {
          console.info(msgStr + ' step1: create FontCollection');
          let fontCollection: text.FontCollection = new text.FontCollection();
          fontCollection.loadFontSync('text_test', $rawfile('test.ttf'));
          console.info(msgStr + ' step2: create ParagraphStyle');
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle
          };
          console.info(msgStr + ' step3: create ParagraphBuilder');
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          console.info(msgStr + ' step4: addText');
          paragraphBuilder.addText('测试颜色属性');
          console.info(msgStr + ' step5: build Paragraph');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          console.info(msgStr + ' step6: layout Paragraph');
          await paragraph.layout(500);

          console.info(msgStr + ' step7: getTextLines');
          let textLines: Array<text.TextLine> = paragraph.getTextLines();
          console.info(msgStr + ' textLines length: ' + textLines.length);
          expect(textLines.length).assertLarger(0);

          console.info(msgStr + ' step8: getGlyphRuns');
          let runs: Array<text.Run> = textLines[0].getGlyphRuns();
          console.info(msgStr + ' runs length: ' + runs.length);
          expect(runs.length).assertLarger(0);

          console.info(msgStr + ' step9: getTextStyle');
          let runTextStyle: text.TextStyle = runs[0].getTextStyle();
          expect(runTextStyle != undefined).assertTrue();
          console.info(msgStr + ' runTextStyle color: ' + JSON.stringify(runTextStyle.color));
          expect(runTextStyle.color?.alpha).assertEqual(255);
          expect(runTextStyle.color?.red).assertEqual(0);
          expect(runTextStyle.color?.green).assertEqual(128);
          expect(runTextStyle.color?.blue).assertEqual(255);
          console.info(msgStr + ' end');
          fontCollection.unloadFontSync('text_test');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testRunGetTextStyleFontStatic_0300
     * @tc.number SUB_GRAPHIC_Run_getTextStyleFont_static_0300
     * @tc.desc   Test Run.getTextStyle() returns correct fontWeight, fontStyle, fontWidth, baseline.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunGetTextStyleFontStatic_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testRunGetTextStyleFontStatic_0300===="
        console.info(msgStr + ' begin');
        let fontFamilies: Array<string> = ["text_test"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
          fontWeight: text.FontWeight.W700,
          fontStyle: text.FontStyle.ITALIC,
          fontWidth: text.FontWidth.EXPANDED,
          baseline: text.TextBaseline.IDEOGRAPHIC,
          fontSize: 24.0
        };
        try {
          console.info(msgStr + ' step1: create FontCollection');
          let fontCollection: text.FontCollection = new text.FontCollection();
          fontCollection.loadFontSync('text_test', $rawfile('test.ttf'));
          console.info(msgStr + ' step2: create ParagraphStyle');
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle
          };
          console.info(msgStr + ' step3: create ParagraphBuilder');
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          console.info(msgStr + ' step4: addText');
          paragraphBuilder.addText('字体样式测试');
          console.info(msgStr + ' step5: build Paragraph');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          console.info(msgStr + ' step6: layout Paragraph');
          await paragraph.layout(500);

          console.info(msgStr + ' step7: getTextLines');
          let textLines: Array<text.TextLine> = paragraph.getTextLines();
          console.info(msgStr + ' textLines length: ' + textLines.length);
          expect(textLines.length).assertLarger(0);

          console.info(msgStr + ' step8: getGlyphRuns');
          let runs: Array<text.Run> = textLines[0].getGlyphRuns();
          console.info(msgStr + ' runs length: ' + runs.length);
          expect(runs.length).assertLarger(0);

          console.info(msgStr + ' step9: getTextStyle');
          let runTextStyle: text.TextStyle = runs[0].getTextStyle();
          expect(runTextStyle != undefined).assertTrue();
          console.info(msgStr + ' fontWeight: ' + runTextStyle.fontWeight);
          console.info(msgStr + ' fontStyle: ' + runTextStyle.fontStyle);
          console.info(msgStr + ' fontWidth: ' + runTextStyle.fontWidth);
          console.info(msgStr + ' baseline: ' + runTextStyle.baseline);
          expect(runTextStyle.fontWeight).assertEqual(text.FontWeight.W700);
          expect(runTextStyle.fontStyle).assertEqual(text.FontStyle.ITALIC);
          expect(runTextStyle.fontWidth).assertEqual(text.FontWidth.EXPANDED);
          expect(runTextStyle.baseline).assertEqual(text.TextBaseline.IDEOGRAPHIC);
          console.info(msgStr + ' end');
          fontCollection.unloadFontSync('text_test');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testRunGetTextStyleSpacingStatic_0400
     * @tc.number SUB_GRAPHIC_Run_getTextStyleSpacing_static_0400
     * @tc.desc   Test Run.getTextStyle() returns correct letterSpacing, wordSpacing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunGetTextStyleSpacingStatic_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testRunGetTextStyleSpacingStatic_0400===="
        console.info(msgStr + ' begin');
        let fontFamilies: Array<string> = ["text_test"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
          letterSpacing: 5.0,
          wordSpacing: 10.0,
          fontSize: 16.0
        };
        try {
          console.info(msgStr + ' step1: create FontCollection');
          let fontCollection: text.FontCollection = new text.FontCollection();
          fontCollection.loadFontSync('text_test', $rawfile('test.ttf'));
          console.info(msgStr + ' step2: create ParagraphStyle');
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle
          };
          console.info(msgStr + ' step3: create ParagraphBuilder');
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          console.info(msgStr + ' step4: addText');
          paragraphBuilder.addText('Hello World Test');
          console.info(msgStr + ' step5: build Paragraph');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          console.info(msgStr + ' step6: layout Paragraph');
          await paragraph.layout(500);

          console.info(msgStr + ' step7: getTextLines');
          let textLines: Array<text.TextLine> = paragraph.getTextLines();
          console.info(msgStr + ' textLines length: ' + textLines.length);
          expect(textLines.length).assertLarger(0);

          console.info(msgStr + ' step8: getGlyphRuns');
          let runs: Array<text.Run> = textLines[0].getGlyphRuns();
          console.info(msgStr + ' runs length: ' + runs.length);
          expect(runs.length).assertLarger(0);

          console.info(msgStr + ' step9: getTextStyle');
          let runTextStyle: text.TextStyle = runs[0].getTextStyle();
          expect(runTextStyle != undefined).assertTrue();
          console.info(msgStr + ' letterSpacing: ' + runTextStyle.letterSpacing);
          console.info(msgStr + ' wordSpacing: ' + runTextStyle.wordSpacing);
          expect(runTextStyle.letterSpacing).assertEqual(5.0);
          expect(runTextStyle.wordSpacing).assertEqual(10.0);
          console.info(msgStr + ' end');
          fontCollection.unloadFontSync('text_test');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testRunGetTextStyleFontFamiliesStatic_0500
     * @tc.number SUB_GRAPHIC_Run_getTextStyleFontFamilies_static_0500
     * @tc.desc   Test Run.getTextStyle() returns correct fontFamilies attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunGetTextStyleFontFamiliesStatic_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testRunGetTextStyleFontFamiliesStatic_0500===="
        console.info(msgStr + ' begin');
        let expectedFamilies: Array<string> = ["text_test"];
        let myTextStyle: text.TextStyle = {
          fontFamilies: expectedFamilies,
          fontSize: 16.0
        };
        try {
          console.info(msgStr + ' step1: create FontCollection');
          let fontCollection: text.FontCollection = new text.FontCollection();
          fontCollection.loadFontSync('text_test', $rawfile('test.ttf'));
          console.info(msgStr + ' step2: create ParagraphStyle');
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle
          };
          console.info(msgStr + ' step3: create ParagraphBuilder');
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          console.info(msgStr + ' step4: addText');
          paragraphBuilder.addText('字体家族测试');
          console.info(msgStr + ' step5: build Paragraph');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          console.info(msgStr + ' step6: layout Paragraph');
          await paragraph.layout(500);

          console.info(msgStr + ' step7: getTextLines');
          let textLines: Array<text.TextLine> = paragraph.getTextLines();
          console.info(msgStr + ' textLines length: ' + textLines.length);
          expect(textLines.length).assertLarger(0);

          console.info(msgStr + ' step8: getGlyphRuns');
          let runs: Array<text.Run> = textLines[0].getGlyphRuns();
          console.info(msgStr + ' runs length: ' + runs.length);
          expect(runs.length).assertLarger(0);

          console.info(msgStr + ' step9: getTextStyle');
          let runTextStyle: text.TextStyle = runs[0].getTextStyle();
          expect(runTextStyle != undefined).assertTrue();
          console.info(msgStr + ' fontFamilies: ' + JSON.stringify(runTextStyle.fontFamilies));
          expect(runTextStyle.fontFamilies != undefined).assertTrue();
          expect(runTextStyle.fontFamilies?.length).assertLarger(0);
          console.info(msgStr + ' end');
          fontCollection.unloadFontSync('text_test');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testRunGetTextStyleBadgeStatic_0600
     * @tc.number SUB_GRAPHIC_Run_getTextStyleBadge_static_0600
     * @tc.desc   Test Run.getTextStyle() returns correct badgeType attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunGetTextStyleBadgeStatic_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testRunGetTextStyleBadgeStatic_0600===="
        console.info(msgStr + ' begin');
        let fontFamilies: Array<string> = ["text_test"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
          badgeType: text.TextBadgeType.TEXT_SUPERSCRIPT,
          fontSize: 16.0
        };
        try {
          console.info(msgStr + ' step1: create FontCollection');
          let fontCollection: text.FontCollection = new text.FontCollection();
          fontCollection.loadFontSync('text_test', $rawfile('test.ttf'));
          console.info(msgStr + ' step2: create ParagraphStyle');
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle
          };
          console.info(msgStr + ' step3: create ParagraphBuilder');
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          console.info(msgStr + ' step4: addText');
          paragraphBuilder.addText('上标测试');
          console.info(msgStr + ' step5: build Paragraph');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          console.info(msgStr + ' step6: layout Paragraph');
          await paragraph.layout(500);

          console.info(msgStr + ' step7: getTextLines');
          let textLines: Array<text.TextLine> = paragraph.getTextLines();
          console.info(msgStr + ' textLines length: ' + textLines.length);
          expect(textLines.length).assertLarger(0);

          console.info(msgStr + ' step8: getGlyphRuns');
          let runs: Array<text.Run> = textLines[0].getGlyphRuns();
          console.info(msgStr + ' runs length: ' + runs.length);
          expect(runs.length).assertLarger(0);

          console.info(msgStr + ' step9: getTextStyle');
          let runTextStyle: text.TextStyle = runs[0].getTextStyle();
          expect(runTextStyle != undefined).assertTrue();
          console.info(msgStr + ' badgeType: ' + runTextStyle.badgeType);
          expect(runTextStyle.badgeType).assertEqual(text.TextBadgeType.TEXT_SUPERSCRIPT);
          console.info(msgStr + ' end');
          fontCollection.unloadFontSync('text_test');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testRunGetTextStyleLocaleStatic_0700
     * @tc.number SUB_GRAPHIC_Run_getTextStyleLocale_static_0700
     * @tc.desc   Test Run.getTextStyle() returns correct locale attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunGetTextStyleLocaleStatic_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testRunGetTextStyleLocaleStatic_0700===="
        console.info(msgStr + ' begin');
        let fontFamilies: Array<string> = ["text_test"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
          locale: 'en-Latn',
          fontSize: 16.0
        };
        try {
          console.info(msgStr + ' step1: create FontCollection');
          let fontCollection: text.FontCollection = new text.FontCollection();
          fontCollection.loadFontSync('text_test', $rawfile('test.ttf'));
          console.info(msgStr + ' step2: create ParagraphStyle');
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle
          };
          console.info(msgStr + ' step3: create ParagraphBuilder');
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          console.info(msgStr + ' step4: addText');
          paragraphBuilder.addText('Locale test');
          console.info(msgStr + ' step5: build Paragraph');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          console.info(msgStr + ' step6: layout Paragraph');
          await paragraph.layout(500);

          console.info(msgStr + ' step7: getTextLines');
          let textLines: Array<text.TextLine> = paragraph.getTextLines();
          console.info(msgStr + ' textLines length: ' + textLines.length);
          expect(textLines.length).assertLarger(0);

          console.info(msgStr + ' step8: getGlyphRuns');
          let runs: Array<text.Run> = textLines[0].getGlyphRuns();
          console.info(msgStr + ' runs length: ' + runs.length);
          expect(runs.length).assertLarger(0);

          console.info(msgStr + ' step9: getTextStyle');
          let runTextStyle: text.TextStyle = runs[0].getTextStyle();
          expect(runTextStyle != undefined).assertTrue();
          console.info(msgStr + ' locale: ' + runTextStyle.locale);
          expect(runTextStyle.locale).assertEqual('en-Latn');
          console.info(msgStr + ' end');
          fontCollection.unloadFontSync('text_test');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testRunGetTextStyleLineHeightStatic_0800
     * @tc.number SUB_GRAPHIC_Run_getTextStyleLineHeight_static_0800
     * @tc.desc   Test Run.getTextStyle() returns correct lineHeightMaximum, lineHeightMinimum, lineHeightStyle, heightScale, halfLeading, heightOnly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunGetTextStyleLineHeightStatic_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testRunGetTextStyleLineHeightStatic_0800===="
        console.info(msgStr + ' begin');
        let fontFamilies: Array<string> = ["text_test"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
          lineHeightMaximum: 50.0,
          lineHeightMinimum: 20.0,
          lineHeightStyle: text.LineHeightStyle.FONT_HEIGHT,
          heightScale: 1.5,
          halfLeading: true,
          heightOnly: true,
          fontSize: 16.0
        };
        try {
          console.info(msgStr + ' step1: create FontCollection');
          let fontCollection: text.FontCollection = new text.FontCollection();
          fontCollection.loadFontSync('text_test', $rawfile('test.ttf'));
          console.info(msgStr + ' step2: create ParagraphStyle');
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle
          };
          console.info(msgStr + ' step3: create ParagraphBuilder');
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          console.info(msgStr + ' step4: addText');
          paragraphBuilder.addText('行高属性测试');
          console.info(msgStr + ' step5: build Paragraph');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          console.info(msgStr + ' step6: layout Paragraph');
          await paragraph.layout(500);

          console.info(msgStr + ' step7: getTextLines');
          let textLines: Array<text.TextLine> = paragraph.getTextLines();
          console.info(msgStr + ' textLines length: ' + textLines.length);
          expect(textLines.length).assertLarger(0);

          console.info(msgStr + ' step8: getGlyphRuns');
          let runs: Array<text.Run> = textLines[0].getGlyphRuns();
          console.info(msgStr + ' runs length: ' + runs.length);
          expect(runs.length).assertLarger(0);

          console.info(msgStr + ' step9: getTextStyle');
          let runTextStyle: text.TextStyle = runs[0].getTextStyle();
          expect(runTextStyle != undefined).assertTrue();
          console.info(msgStr + ' lineHeightMaximum: ' + runTextStyle.lineHeightMaximum);
          console.info(msgStr + ' lineHeightMinimum: ' + runTextStyle.lineHeightMinimum);
          console.info(msgStr + ' lineHeightStyle: ' + runTextStyle.lineHeightStyle);
          console.info(msgStr + ' heightScale: ' + runTextStyle.heightScale);
          console.info(msgStr + ' halfLeading: ' + runTextStyle.halfLeading);
          console.info(msgStr + ' heightOnly: ' + runTextStyle.heightOnly);
          expect(runTextStyle.lineHeightMaximum).assertEqual(50.0);
          expect(runTextStyle.lineHeightMinimum).assertEqual(20.0);
          expect(runTextStyle.lineHeightStyle).assertEqual(text.LineHeightStyle.FONT_HEIGHT);
          expect(runTextStyle.heightScale).assertEqual(1.5);
          expect(runTextStyle.halfLeading).assertTrue();
          expect(runTextStyle.heightOnly).assertTrue();
          console.info(msgStr + ' end');
          fontCollection.unloadFontSync('text_test');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testRunGetTextStyleEllipsisStatic_0900
     * @tc.number SUB_GRAPHIC_Run_getTextStyleEllipsis_static_0900
     * @tc.desc   Test Run.getTextStyle() returns correct ellipsis, ellipsisMode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunGetTextStyleEllipsisStatic_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testRunGetTextStyleEllipsisStatic_0900===="
        console.info(msgStr + ' begin');
        let fontFamilies: Array<string> = ["text_test"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
          ellipsis: '...',
          ellipsisMode: text.EllipsisMode.END,
          fontSize: 16.0,
        };
        try {
          console.info(msgStr + ' step1: create FontCollection');
          let fontCollection: text.FontCollection = new text.FontCollection();
          fontCollection.loadFontSync('text_test', $rawfile('test.ttf'));
          console.info(msgStr + ' step2: create ParagraphStyle');
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
            maxLines: 1,
          };
          console.info(msgStr + ' step3: create ParagraphBuilder');
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          console.info(msgStr + ' step4: addText');
          paragraphBuilder.addText('这是一段很长的文本用于测试省略号功能是否正常生效这是一段很长的文本用于测试省略号功能是否正常生效这是一段很长的文本用于测试省略号功能是否正常生效这是一段很长的文本用于测试省略号功能是否正常生效');
          console.info(msgStr + ' step5: build Paragraph');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          console.info(msgStr + ' step6: layout Paragraph');
          await paragraph.layout(100);

          console.info(msgStr + ' step7: getTextLines');
          let textLines: Array<text.TextLine> = paragraph.getTextLines();
          console.info(msgStr + ' textLines length: ' + textLines.length);
          expect(textLines.length).assertLarger(0);

          console.info(msgStr + ' step8: getGlyphRuns');
          let runs: Array<text.Run> = textLines[0].getGlyphRuns();
          console.info(msgStr + ' runs length: ' + runs.length);
          expect(runs.length).assertLarger(0);

          console.info(msgStr + ' step9: getTextStyle');
          let runTextStyle: text.TextStyle = runs[0].getTextStyle();
          expect(runTextStyle != undefined).assertTrue();
          console.info(msgStr + ' ellipsis: ' + runTextStyle.ellipsis);
          console.info(msgStr + ' ellipsisMode: ' + runTextStyle.ellipsisMode);
          expect(runTextStyle.ellipsisMode).assertEqual(text.EllipsisMode.END); // 默认值END
          console.info(msgStr + ' end');
          fontCollection.unloadFontSync('text_test');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testRunGetTextStyleDecorationStatic_1000
     * @tc.number SUB_GRAPHIC_Run_getTextStyleDecoration_static_1000
     * @tc.desc   Test Run.getTextStyle() returns correct decoration, baselineShift.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunGetTextStyleDecorationStatic_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testRunGetTextStyleDecorationStatic_1000===="
        console.info(msgStr + ' begin');
        let fontFamilies: Array<string> = ["text_test"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
          decoration: {
            textDecoration: text.TextDecorationType.UNDERLINE,
            color: { alpha: 255, red: 255, green: 0, blue: 0 },
            decorationStyle: text.TextDecorationStyle.SOLID,
            decorationThicknessScale: 1.5
          },
          baselineShift: 5.0,
          fontSize: 16.0
        };
        try {
          console.info(msgStr + ' step1: create FontCollection');
          let fontCollection: text.FontCollection = new text.FontCollection();
          fontCollection.loadFontSync('text_test', $rawfile('test.ttf'));
          console.info(msgStr + ' step2: create ParagraphStyle');
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle
          };
          console.info(msgStr + ' step3: create ParagraphBuilder');
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          console.info(msgStr + ' step4: addText');
          paragraphBuilder.addText('装饰线测试');
          console.info(msgStr + ' step5: build Paragraph');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          console.info(msgStr + ' step6: layout Paragraph');
          await paragraph.layout(500);

          console.info(msgStr + ' step7: getTextLines');
          let textLines: Array<text.TextLine> = paragraph.getTextLines();
          console.info(msgStr + ' textLines length: ' + textLines.length);
          expect(textLines.length).assertLarger(0);

          console.info(msgStr + ' step8: getGlyphRuns');
          let runs: Array<text.Run> = textLines[0].getGlyphRuns();
          console.info(msgStr + ' runs length: ' + runs.length);
          expect(runs.length).assertLarger(0);

          console.info(msgStr + ' step9: getTextStyle');
          let runTextStyle: text.TextStyle = runs[0].getTextStyle();
          expect(runTextStyle != undefined).assertTrue();
          console.info(msgStr + ' decoration: ' + JSON.stringify(runTextStyle.decoration));
          console.info(msgStr + ' baselineShift: ' + runTextStyle.baselineShift);
          expect(runTextStyle.decoration != undefined).assertTrue();
          expect(runTextStyle.decoration?.textDecoration).assertEqual(text.TextDecorationType.UNDERLINE);
          expect(runTextStyle.decoration?.decorationStyle).assertEqual(text.TextDecorationStyle.SOLID);
          expect(runTextStyle.decoration?.decorationThicknessScale).assertEqual(1.5);
          expect(runTextStyle.baselineShift).assertEqual(5.0);
          console.info(msgStr + ' end');
          fontCollection.unloadFontSync('text_test');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testRunGetTextStyleFontFeaturesStatic_1100
     * @tc.number SUB_GRAPHIC_Run_getTextStyleFontFeatures_static_1100
     * @tc.desc   Test Run.getTextStyle() returns correct fontFeatures, fontVariations, fontEdging.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunGetTextStyleFontFeaturesStatic_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testRunGetTextStyleFontFeaturesStatic_1100===="
        console.info(msgStr + ' begin');
        let fontFamilies: Array<string> = ["text_test"]
        let myTextStyle: text.TextStyle = {
          fontFeatures: [{ name: 'liga', value: 1 }],
          fontVariations: [{ axis: 'wght', value: 400.0, isNormalized: false }],
          fontEdging: drawing.FontEdging.ANTI_ALIAS,
          fontSize: 16.0,
          fontFamilies: fontFamilies
        };
        try {
          console.info(msgStr + ' step1: create FontCollection');
          let fontCollection: text.FontCollection = new text.FontCollection();
          fontCollection.loadFontSync('text_test', $rawfile('test.ttf'));
          // fontCollection.loadFontSync('text_test', 'file:///system/fonts/NotoSerifThai[wdth,wght].ttf');
          console.info(msgStr + ' step2: create ParagraphStyle');
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle
          };
          console.info(msgStr + ' step3: create ParagraphBuilder');
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          console.info(msgStr + ' step4: addText');
          paragraphBuilder.addText('字体特性测试');
          console.info(msgStr + ' step5: build Paragraph');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          console.info(msgStr + ' step6: layout Paragraph');
          await paragraph.layout(500);

          console.info(msgStr + ' step7: getTextLines');
          let textLines: Array<text.TextLine> = paragraph.getTextLines();
          console.info(msgStr + ' textLines length: ' + textLines.length);
          expect(textLines.length).assertLarger(0);

          console.info(msgStr + ' step8: getGlyphRuns');
          let runs: Array<text.Run> = textLines[0].getGlyphRuns();
          console.info(msgStr + ' runs length: ' + runs.length);
          expect(runs.length).assertLarger(0);

          console.info(msgStr + ' step9: getTextStyle');
          let runTextStyle: text.TextStyle = runs[0].getTextStyle();
          expect(runTextStyle != undefined).assertTrue();
          console.info(msgStr + ' fontFeatures: ' + JSON.stringify(runTextStyle.fontFeatures));
          console.info(msgStr + ' fontVariations: ' + JSON.stringify(runTextStyle.fontVariations));
          console.info(msgStr + ' fontEdging: ' + runTextStyle.fontEdging);
          expect(runTextStyle.fontFeatures != undefined).assertTrue();
          expect(runTextStyle.fontFeatures?.length).assertLarger(0);
          expect(runTextStyle.fontEdging).assertEqual(drawing.FontEdging.ANTI_ALIAS);
          console.info(msgStr + ' end');
          fontCollection.unloadFontSync('text_test');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testRunGetTextStyleVisualStatic_1200
     * @tc.number SUB_GRAPHIC_Run_getTextStyleVisual_static_1200
     * @tc.desc   Test Run.getTextStyle() returns correct textShadows, backgroundRect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunGetTextStyleVisualStatic_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testRunGetTextStyleVisualStatic_1200===="
        console.info(msgStr + ' begin');
        let fontFamilies: Array<string> = ["text_test"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
          textShadows: [{
            color: { alpha: 128, red: 0, green: 0, blue: 0 },
            point: { x: 2.0, y: 2.0 },
            blurRadius: 3.0
          }],
          backgroundRect: {
            color: { alpha: 50, red: 200, green: 200, blue: 200 },
            leftTopRadius: 5.0,
            rightTopRadius: 5.0,
            rightBottomRadius: 5.0,
            leftBottomRadius: 5.0
          },
          fontSize: 16.0
        };
        try {
          console.info(msgStr + ' step1: create FontCollection');
          let fontCollection: text.FontCollection = new text.FontCollection();
          fontCollection.loadFontSync('text_test', $rawfile('test.ttf'));
          console.info(msgStr + ' step2: create ParagraphStyle');
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle
          };
          console.info(msgStr + ' step3: create ParagraphBuilder');
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          console.info(msgStr + ' step4: addText');
          paragraphBuilder.addText('视觉效果测试');
          console.info(msgStr + ' step5: build Paragraph');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          console.info(msgStr + ' step6: layout Paragraph');
          await paragraph.layout(500);

          console.info(msgStr + ' step7: getTextLines');
          let textLines: Array<text.TextLine> = paragraph.getTextLines();
          console.info(msgStr + ' textLines length: ' + textLines.length);
          expect(textLines.length).assertLarger(0);

          console.info(msgStr + ' step8: getGlyphRuns');
          let runs: Array<text.Run> = textLines[0].getGlyphRuns();
          console.info(msgStr + ' runs length: ' + runs.length);
          expect(runs.length).assertLarger(0);

          console.info(msgStr + ' step9: getTextStyle');
          let runTextStyle: text.TextStyle = runs[0].getTextStyle();
          expect(runTextStyle != undefined).assertTrue();
          console.info(msgStr + ' textShadows: ' + JSON.stringify(runTextStyle.textShadows));
          console.info(msgStr + ' backgroundRect: ' + JSON.stringify(runTextStyle.backgroundRect));
          expect(runTextStyle.textShadows != undefined).assertTrue();
          expect(runTextStyle.textShadows?.length).assertLarger(0);
          expect(runTextStyle.backgroundRect != undefined).assertTrue();
          expect(runTextStyle.backgroundRect?.leftTopRadius).assertEqual(5.0);
          expect(runTextStyle.backgroundRect?.rightTopRadius).assertEqual(5.0);
          expect(runTextStyle.backgroundRect?.rightBottomRadius).assertEqual(5.0);
          expect(runTextStyle.backgroundRect?.leftBottomRadius).assertEqual(5.0);
          console.info(msgStr + ' end');
          fontCollection.unloadFontSync('text_test');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testFontTypefacesSetStatic
     * @tc.number SUB_GRAPHIC_Paragraph_fontTypefacesSetStatic_0100
     * @tc.desc   Test TextStyle fontTypefaces property set with valid typeface array and verify via getTextStyle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontTypefacesSetStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testFontTypefacesSetStatic===="
        console.info(msgStr + ' begin');
        let fontFamilies: Array<string> = ["fontTypefaces_test"];
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          fontCollection.loadFontSync('fontTypefaces_test', $rawfile('test.ttf'));
          const typeface = drawing.Typeface.makeFromRawFile($rawfile('test.ttf')) as drawing.Typeface;
          let textStyle: text.TextStyle = {
            fontFamilies: fontFamilies,
            fontSize: 16.0,
            fontTypefaces: [typeface]
          };
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: textStyle,
            wordBreak: text.WordBreak.BREAK_WORD
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试字体类型面设置');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let textLines: Array<text.TextLine> = paragraph.getTextLines();
          expect(textLines.length).assertLarger(0);
          let runs: Array<text.Run> = textLines[0].getGlyphRuns();
          expect(runs.length).assertLarger(0);

          let runTextStyle: text.TextStyle = runs[0].getTextStyle();
          expect(runTextStyle.fontTypefaces != undefined).assertTrue();
          expect(runTextStyle.fontTypefaces!.length).assertEqual(1);
          console.info(msgStr + ' fontTypefaces is set with length: ' + runTextStyle.fontTypefaces!.length);
          console.info(msgStr + ' end');
          fontCollection.unloadFontSync('fontTypefaces_test');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testFontTypefacesUndefinedStatic
     * @tc.number SUB_GRAPHIC_Paragraph_fontTypefacesUndefinedStatic_0200
     * @tc.desc   Test TextStyle fontTypefaces property with undefined value and verify via getTextStyle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontTypefacesUndefinedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testFontTypefacesUndefinedStatic===="
        console.info(msgStr + ' begin');
        let fontFamilies: Array<string> = ["fontTypefaces_undef_test"];
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          fontCollection.loadFontSync('fontTypefaces_undef_test', $rawfile('test.ttf'));

          let textStyle: text.TextStyle = {
            fontFamilies: fontFamilies,
            fontSize: 16.0
          };
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: textStyle,
            wordBreak: text.WordBreak.BREAK_WORD
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试字体类型面未设置');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let textLines: Array<text.TextLine> = paragraph.getTextLines();
          expect(textLines.length).assertLarger(0);
          let runs: Array<text.Run> = textLines[0].getGlyphRuns();
          expect(runs.length).assertLarger(0);

          let runTextStyle: text.TextStyle = runs[0].getTextStyle();
          expect(runTextStyle.fontTypefaces!.length).assertEqual(0);
          console.info(msgStr + ' fontTypefaces is undefined');
          console.info(msgStr + ' end');
          fontCollection.unloadFontSync('fontTypefaces_undef_test');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testFontTypefacesEmptyArrayStatic
     * @tc.number SUB_GRAPHIC_Paragraph_fontTypefacesEmptyArrayStatic_0300
     * @tc.desc   Test TextStyle fontTypefaces property set with empty array and verify via getTextStyle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontTypefacesEmptyArrayStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testFontTypefacesEmptyArrayStatic===="
        console.info(msgStr + ' begin');
        let fontFamilies: Array<string> = ["fontTypefaces_empty_test"];
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          fontCollection.loadFontSync('fontTypefaces_empty_test', $rawfile('test.ttf'));

          let textStyle: text.TextStyle = {
            fontFamilies: fontFamilies,
            fontSize: 16.0,
            fontTypefaces: []
          };
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: textStyle,
            wordBreak: text.WordBreak.BREAK_WORD
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试字体类型面空数组');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let textLines: Array<text.TextLine> = paragraph.getTextLines();
          expect(textLines.length).assertLarger(0);
          let runs: Array<text.Run> = textLines[0].getGlyphRuns();
          expect(runs.length).assertLarger(0);

          let runTextStyle: text.TextStyle = runs[0].getTextStyle();
          expect(runTextStyle.fontTypefaces != undefined).assertTrue();
          expect(runTextStyle.fontTypefaces!.length).assertEqual(0);
          console.info(msgStr + ' fontTypefaces is empty array with length: ' + runTextStyle.fontTypefaces!.length);
          console.info(msgStr + ' end');
          fontCollection.unloadFontSync('fontTypefaces_empty_test');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

  })
}
