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
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import text from "@ohos.graphics.text"
import image from '@ohos.multimedia.image';
import type drawing from '@ohos.graphics.drawing';
import type common2D from '@ohos.graphics.common2D';
import Utils from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function TextParagraphTest() {
  describe("TextParagraphTest", (): void => {
    let globalFontCollection: text.FontCollection | undefined;
    let globalTextStyle: text.TextStyle | undefined;
    let globalParagraphStyle: text.ParagraphStyle | undefined;
    let globalStructStyle: text.StrutStyle;
    let globalCanvas: drawing.Canvas | undefined;
    let checkFontStyle: text.FontStyle | undefined;
    let globalParagraph: text.Paragraph | undefined;

    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeEach start');
      try {
        globalFontCollection = text.FontCollection.getGlobalInstance()
        globalFontCollection?.loadFontSync('myFamilyName', 'file:///system/fonts/HarmonyOS_Sans.ttf')
        let myFontFamily: Array<string> = ["myFamilyName"]
        let myColor: common2D.Color = { 
          alpha: 255, 
          red: 255, 
          green: 0, 
          blue: 0 
        };

        let fontFeatures: Array<text.FontFeature> = new Array<text.FontFeature>(2);
        fontFeatures[0] = { name: "liga", value: 1 };
        fontFeatures[1] = { name: "liga2", value: 2 };
        let fontVariation: Array<text.FontVariation> = new Array<text.FontVariation>(2);
        fontVariation[0] = { axis: "axis", value: 1 };
        fontVariation[1] = { axis: "axis2", value: 2 };
        let textShadows: Array<text.TextShadow> = new Array<text.TextShadow>(2);
        let point1: common2D.Point = { x: 11, y: 12 };
        let point2: common2D.Point = { x: 2, y: 4 };
        textShadows[0] = {
          color: myColor,
          point: point1, blurRadius: 12
        };
        textShadows[1] = {
          color: myColor,
          point: point2, blurRadius: 14
        };
        let backgroundRect: text.RectStyle = {
          color: myColor,
          leftTopRadius: 10,
          rightTopRadius: 20,
          rightBottomRadius: 30,
          leftBottomRadius: 40
        };
        let decoration: text.Decoration = {
          color: myColor,
          textDecoration: text.TextDecorationType.UNDERLINE,
          decorationStyle: text.TextDecorationStyle.DOTTED,
          decorationThicknessScale: 12
        }

        globalTextStyle = {
          decoration: decoration,
          color: myColor,
          fontWeight: text.FontWeight.W700,
          fontStyle: text.FontStyle.OBLIQUE,
          baseline: text.TextBaseline.ALPHABETIC,
          fontFamilies: myFontFamily,
          fontSize: 32,
          letterSpacing: 33,
          wordSpacing: 24,
          heightScale: 13,
          halfLeading: false,
          heightOnly: true,
          ellipsis: "...",
          ellipsisMode: text.EllipsisMode.END,
          locale: "zh-cn",
          baselineShift: 13,
          fontFeatures: fontFeatures,
          textShadows: textShadows,
          fontVariations: fontVariation,
          backgroundRect: backgroundRect,
        };
        checkFontStyle = globalTextStyle?.fontStyle ?? text.FontStyle.NORMAL;
        if (checkFontStyle == text.FontStyle.OBLIQUE) {
          checkFontStyle = text.FontStyle.ITALIC
        }

        globalStructStyle = {
          fontStyle: text.FontStyle.OBLIQUE,
          fontWidth: text.FontWidth.SEMI_CONDENSED,
          fontWeight: text.FontWeight.W400,
          fontSize: 12,
          height: 15,
          leading: 2,
          forceHeight: true,
          enabled: false,
          heightOverride: true,
          halfLeading: false,
        }

        let textTab: text.TextTab = { alignment: text.TextAlign.START, location: 512 }

        globalParagraphStyle = {
          textStyle: globalTextStyle!,
          textDirection: text.TextDirection.RTL,
          align: text.TextAlign.JUSTIFY,
          wordBreak: text.WordBreak.BREAK_ALL,
          maxLines: 10,
          breakStrategy: text.BreakStrategy.BALANCED,
          strutStyle: globalStructStyle,
          textHeightBehavior: text.TextHeightBehavior.DISABLE_LAST_ASCENT,
          tab: textTab
        };

        let paragraphBuilder = new text.ParagraphBuilder(globalParagraphStyle!, globalFontCollection!);
        expect(paragraphBuilder !== undefined).assertTrue();
        paragraphBuilder.pushStyle(globalTextStyle!);
        paragraphBuilder.addText('The quick brown fox jumps over the lazy dog.');
        globalParagraph = paragraphBuilder.build();
        expect(globalParagraph !== undefined).assertTrue();
        
        const opts: image.InitializationOptions = {
          size: { width: 480, height: 360 },
          editable: true,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
        };
        let pixelMap : image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap == null ){
          console.info('www data create image.createPixelMapSync failed');
          return;
        }
        console.info('www data create image.createPixelMapSync success');
        globalCanvas = new drawing.Canvas(pixelMap);
        expect(globalCanvas !== undefined).assertTrue();
      } catch (err) {
        hilog.error(domain, tag, `Failed in ParagraphTest init global params. Cause:${JSON.stringify(err)}`);
      }
    })

    /**
     * @tc.name   testCreateParagraphStatic
     * @tc.number testCreateParagraphStatic
     * @tc.desc   To test create a paragraph.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateParagraphStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let paragraphBuilder = new text.ParagraphBuilder(globalParagraphStyle!, globalFontCollection!)
          expect(paragraphBuilder !== undefined).assertTrue()
          paragraphBuilder.pushStyle(globalTextStyle!);
          paragraphBuilder.addText("Hello World!");
          let paragraph = paragraphBuilder.build();
          expect(paragraph !== undefined).assertTrue()
          done()
        } catch (err) {
          hilog.error(domain, tag, `Failed in create a paragraph. Cause:${JSON.stringify(err)}`);
          expect().assertFail();
          done()
        }
      })

    /**
     * @tc.name   testGetMaxWidthStatic
     * @tc.number testGetMaxWidthStatic
     * @tc.desc   To test method getMaxWidth for paragraph.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMaxWidthStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          globalParagraph?.layoutSync(100);
          let maxWidth = globalParagraph!.getMaxWidth();
          expect(maxWidth).assertEqual(100);
          done();
        } catch (err) {
          hilog.error(domain, tag, `Failed in getMaxWidth. Cause:${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetHeightStatic
     * @tc.number testGetHeightStatic
     * @tc.desc   To test method getHeight for paragraph.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetHeightStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          globalParagraph?.layoutSync(100);
          let height = globalParagraph!.getHeight();
          expect(height).assertEqual(4068);
          done();
        } catch (err) {
          hilog.error(domain, tag, `Failed in getHeight. Cause:${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetLongestLineStatic_001
     * @tc.number testGetLongestLineStatic_001
     * @tc.desc   To test method getLongestLine for paragraph.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetLongestLineStatic_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          globalParagraph?.layoutSync(100);
          let longestLine = globalParagraph!.getLongestLine();
          expect(Math.round(longestLine * 100) / 100).assertEqual(163.51);
          done();
        } catch (err) {
          hilog.error(domain, tag, `Failed in getLongestLine. Cause:${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetLongestLineWithIndentStatic
     * @tc.number testGetLongestLineWithIndentStatic
     * @tc.desc   To test method getLongestLineWithIndent for paragraph.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetLongestLineWithIndentStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          globalParagraph?.layoutSync(100);
          let width = globalParagraph!.getLongestLineWithIndent();
          expect(Math.round(width * 100) / 100).assertEqual(163.51);
          done();
        } catch (err) {
          hilog.error(domain, tag, `Failed in getLongestLineWithIndent. Cause:${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetMinIntrinsicWidthStatic
     * @tc.number testGetMinIntrinsicWidthStatic
     * @tc.desc   To test method getMinIntrinsicWidth for paragraph.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMinIntrinsicWidthStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          globalParagraph?.layoutSync(100);
          let width = globalParagraph!.getMinIntrinsicWidth();
          expect(Math.round(width * 100) / 100).assertEqual(257.22);
          done();
        } catch (err) {
          hilog.error(domain, tag, `Failed in getMinIntrinsicWidth. Cause:${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetMaxIntrinsicWidthStatic
     * @tc.number testGetMaxIntrinsicWidthStatic
     * @tc.desc   To test method getMaxIntrinsicWidth for paragraph.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMaxIntrinsicWidthStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          globalParagraph?.layoutSync(100);
          let width = globalParagraph!.getMaxIntrinsicWidth();
          expect(Math.round(width * 100) / 100).assertEqual(2302.72);
          done();
        } catch (err) {
          hilog.error(domain, tag, `Failed in getMaxIntrinsicWidth. Cause:${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetAlphabeticBaselineStatic
     * @tc.number testGetAlphabeticBaselineStatic
     * @tc.desc   To test method getAlphabeticBaseline for paragraph.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetAlphabeticBaselineStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          globalParagraph?.layoutSync(100);
          let alphabeticBaseline = globalParagraph!.getAlphabeticBaseline();
          expect(Math.round(alphabeticBaseline * 100) / 100).assertEqual(303.39);
          done();
        } catch (err) {
          hilog.error(domain, tag, `Failed in getAlphabeticBaseline. Cause:${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetRectsForRangeStatic
     * @tc.number testGetRectsForRangeStatic
     * @tc.desc   To test method getRectsForRange for paragraph.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetRectsForRangeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          globalParagraph?.layoutSync(100);
          let range: text.Range = { start: 0, end: 10 };
          let boxArray: Array<text.TextBox> = 
            globalParagraph!.getRectsForRange(range, text.RectWidthStyle.TIGHT, text.RectHeightStyle.MAX);
          for (let i = 0; i < boxArray.length; i++) {
            hilog.info(domain, tag, `TEXT_LOG RectsForRange [${i}]: ${JSON.stringify(boxArray[i])}`);
          }
          done();
        } catch (err) {
          hilog.error(domain, tag, `Failed in getRectsForRange. Cause:${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetRectsForPlaceholdersStatic
     * @tc.number testGetRectsForPlaceholdersStatic
     * @tc.desc   To test method getRectsForPlaceholders for paragraph.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetRectsForPlaceholdersStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          globalParagraph?.layoutSync(100);
          let placeHolders: Array<text.TextBox> = globalParagraph!.getRectsForPlaceholders();
          for(let i = 0; i < placeHolders.length; i++){
            const item = placeHolders[i];
            hilog.info(domain, tag, 'Text_LOG RectsForPlaceholders:%{public}s', JSON.stringify(item));
          }
          done();
        } catch (err) {
          hilog.error(domain, tag, `Failed in getRectsForPlaceholders. Cause:${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetGlyphPositionAtCoordinateStatic
     * @tc.number testGetGlyphPositionAtCoordinateStatic
     * @tc.desc   To test method getGlyphPositionAtCoordinate for paragraph.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGlyphPositionAtCoordinateStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          globalParagraph?.layoutSync(100);
          let position: text.PositionWithAffinity = globalParagraph!.getGlyphPositionAtCoordinate(10, 1);
          console.info('www data GlyphPositionAtCoordinate ' + JSON.stringify(position));
          done();
        } catch (err) {
          hilog.error(domain, tag, `Failed in getGlyphPositionAtCoordinate. Cause:${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetLongestLineStatic
     * @tc.number testGetLongestLineStatic
     * @tc.desc   To test method getLongestLine for paragraph.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetLongestLineStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let paragraphBuilder = new text.ParagraphBuilder(globalParagraphStyle!, globalFontCollection!)
          expect(paragraphBuilder !== undefined).assertTrue()
          paragraphBuilder.pushStyle(globalTextStyle!);
          paragraphBuilder.addText("Hello World!");
          let paragraph = paragraphBuilder.build();
          expect(paragraph !== undefined).assertTrue()
          paragraph.layoutSync(100);
          let longestLine = paragraph.getLongestLine();
          console.info('www data lxt ' + JSON.stringify(longestLine));
          done();
        } catch (err) {
          hilog.error(domain, tag, `Failed in getLongestLine. Cause:${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetLineMetricsStatic
     * @tc.number testGetLineMetricsStatic
     * @tc.desc   To test method getLineMetrics for paragraph.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetLineMetricsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          hilog.error(0x0000, 'Text', 'MM_LOG print maxLines: %{public}f', globalParagraphStyle!.maxLines);
          let paragraphBuilder = new text.ParagraphBuilder(globalParagraphStyle!, globalFontCollection!)
          expect(paragraphBuilder !== undefined).assertTrue()
          paragraphBuilder.pushStyle(globalTextStyle!);
          paragraphBuilder.addText("The quick brown fox jumps over the lazy dog.");
          let paragraph = paragraphBuilder.build();
          expect(paragraph !== undefined).assertTrue()
          paragraph.layoutSync(100);
          let lineMetrics: Array<text.LineMetrics> = paragraph.getLineMetrics();
          console.info('www data lxt ' + JSON.stringify(lineMetrics))
          console.info('www data lxt ' + JSON.stringify(lineMetrics.length))

          let preBaseLine: number = 0;
          let preHeight: number = 0;
          let tempHeight: number = 0;
          for (let i = 0; i < lineMetrics.length; i++) {
            const item = lineMetrics[i];
            hilog.error(0x0000, 'Text', 'MM_LOG line metrics info [%{public}d] data: %{public}s', i,
              JSON.stringify(item));
            if (i == 0) {
              preHeight = item.ascent;
            }
            expect(Math.round(item.ascent * 100) / 100).assertEqual(303.39)
            expect(Math.round(item.descent * 100) / 100).assertEqual(112.61)
            if (i == 9) {
              expect(item.height).assertEqual(324)
            } else {
              expect(item.height).assertEqual(416)
            }
            expect(Math.round((item.baseline - preBaseLine))).assertEqual(Math.round(preHeight

            ))
            expect(item.lineNumber).assertEqual(i)
            expect(item.topHeight).assertEqual(tempHeight)

            tempHeight += item.height;
            preHeight = item.height;
            preBaseLine = item.baseline;
            let runMetrics: Map<int, text.RunMetrics> = item.runMetrics;
            runMetrics.forEach((value, key) => {
              let textStyle: text.TextStyle = value.textStyle;
              let fontMetrics: drawing.FontMetrics = value.fontMetrics;
              hilog.error(0x0000, 'Text', 'MM_LOG run metrics textStyle data: %{public}s', JSON.stringify(textStyle));
              hilog.error(0x0000, 'Text', 'MM_LOG run metrics fontMetrics data: %{public}s', JSON.stringify(fontMetrics));
              if (textStyle.decoration && globalTextStyle!.decoration) {
                expect(textStyle.decoration?.textDecoration).assertEqual(globalTextStyle!.decoration?.textDecoration)
                expect(textStyle.decoration?.decorationStyle).assertEqual(globalTextStyle!.decoration?.decorationStyle)
              }
              expect(textStyle.fontWeight).assertEqual(globalTextStyle!.fontWeight)
              expect(textStyle.fontStyle).assertEqual(checkFontStyle!)
              expect(textStyle.baseline).assertEqual(globalTextStyle!.baseline)
              expect(textStyle.fontFamilies?.length ?? 0).assertEqual(2)
              expect(textStyle.fontSize).assertEqual(globalTextStyle!.fontSize)
              expect(textStyle.letterSpacing).assertEqual(globalTextStyle!.letterSpacing)
              expect(textStyle.wordSpacing).assertEqual(globalTextStyle!.wordSpacing)
              expect(textStyle.heightScale).assertEqual(globalTextStyle!.heightScale)
              expect(textStyle.halfLeading).assertEqual(globalTextStyle!.halfLeading)
              expect(textStyle.ellipsis).assertEqual("")
              expect(textStyle.ellipsisMode).assertEqual(globalTextStyle!.ellipsisMode)
              expect(textStyle.locale).assertEqual(globalTextStyle!.locale)
              expect(textStyle.baselineShift).assertEqual(globalTextStyle!.baselineShift)
              expect(textStyle.fontFeatures?.length?? 0).assertEqual(globalTextStyle!.fontFeatures?.length?? 0)
              expect(textStyle.textShadows?.length?? 0).assertEqual(globalTextStyle!.textShadows?.length?? 0)
              if (textStyle.backgroundRect && globalTextStyle!.backgroundRect) {
                expect(textStyle.backgroundRect?.leftTopRadius).assertEqual(globalTextStyle!.backgroundRect?.leftTopRadius)
                expect(textStyle.backgroundRect?.rightTopRadius).assertEqual(globalTextStyle!.backgroundRect?.rightTopRadius)
                expect(textStyle.backgroundRect?.rightBottomRadius).assertEqual(globalTextStyle!.backgroundRect?.rightBottomRadius)
                expect(textStyle.backgroundRect?.leftBottomRadius).assertEqual(globalTextStyle!.backgroundRect?.leftBottomRadius)
              }
              if ((Math.round(fontMetrics.ascent * 100) / 100) == -29.70) {
                expect(Math.round(fontMetrics.ascent * 100) / 100).assertEqual(-29.70)
                expect(Math.round(fontMetrics.descent * 100) / 100).assertEqual(7.81)
                expect(Math.round(fontMetrics.top * 100) / 100).assertEqual(-33.79)
                expect(Math.round(fontMetrics.bottom * 100) / 100).assertEqual(8.67)
                expect(Math.round(fontMetrics.leading * 100) / 100).assertEqual(0)
              } else if ((Math.round(fontMetrics.ascent * 100) / 100) == -29.65) {
                expect(Math.round(fontMetrics.ascent * 100) / 100).assertEqual(-29.65)
                expect(Math.round(fontMetrics.descent * 100) / 100).assertEqual(7.93)
                expect(Math.round(fontMetrics.top * 100) / 100).assertEqual(-29.65)
                expect(Math.round(fontMetrics.bottom * 100) / 100).assertEqual(7.93)
                expect(Math.round(fontMetrics.leading * 100) / 100).assertEqual(0)
              } else {
                hilog.error(0x0000, 'Text', 'MM_LOG fontMetrics.ascent: %{public}d',
                  (Math.round(fontMetrics.ascent * 100) / 100));
                expect().assertFail();
              }
            });
          }
          done()
        } catch (err) {
          hilog.error(domain, tag, `Failed in getLineMetrics. Cause:${JSON.stringify(err)}`);
          expect().assertFail();
          done()
        }
      })

    /**
     * @tc.name   testGetLineMetricsAtStatic
     * @tc.number testGetLineMetricsAtStatic
     * @tc.desc   To test method getLineMetricsAt for paragraph.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetLineMetricsAtStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          hilog.error(0x0000, 'Text', 'MM_LOG print maxLines: %{public}f', globalParagraphStyle!.maxLines);
          let paragraphBuilder = new text.ParagraphBuilder(globalParagraphStyle!, globalFontCollection!)
          expect(paragraphBuilder !== undefined).assertTrue()
          paragraphBuilder.pushStyle(globalTextStyle!);
          paragraphBuilder.addText("The quick brown fox jumps over the lazy dog.");
          let paragraph = paragraphBuilder.build();
          expect(paragraph !== undefined).assertTrue()
          paragraph.layoutSync(100);
          let lineMetrics: text.LineMetrics | undefined = paragraph.getLineMetrics(2);
          if (lineMetrics !== undefined) {
            expect(lineMetrics?.startIndex).assertEqual(2)
            expect(lineMetrics?.endIndex).assertEqual(3)
            console.info('www data lxt 111' + JSON.stringify(lineMetrics));
            console.info('www data lxt 111' + lineMetrics);
            hilog.error(0x0000, 'Text', 'MM_LOG one line metrics info data: %{public}s', JSON.stringify(lineMetrics));
            expect(Math.round(Number(lineMetrics?.ascent ?? 0) * 100) / 100).assertEqual(303.39)
            expect(Math.round(Number(lineMetrics?.descent ?? 0) * 100) / 100).assertEqual(112.61)
            expect(lineMetrics?.height).assertEqual(416)
            expect(Math.round(Number(lineMetrics?.width ?? 0) * 100) / 100).assertEqual(50.50)
            expect(Math.round(Number(lineMetrics?.left ?? 0) * 100) / 100).assertEqual(49.50)
            expect(Math.round(Number(lineMetrics?.baseline ?? 0) * 100) / 100).assertEqual(1135.39)
            expect(lineMetrics?.lineNumber).assertEqual(2)
            expect(lineMetrics?.topHeight).assertEqual(832)

            let runMetrics: Map<int, text.RunMetrics> | undefined = lineMetrics?.runMetrics;
            if (runMetrics != undefined) {
              runMetrics.forEach((value, key) => {
                let textStyle: text.TextStyle = value.textStyle;
                let fontMetrics: drawing.FontMetrics = value.fontMetrics;
                hilog.error(0x0000, 'Text', 'MM_LOG run metrics textStyle data: %{public}s', JSON.stringify(textStyle));
                hilog.error(0x0000, 'Text', 'MM_LOG run metrics fontMetrics data: %{public}s',
                  JSON.stringify(fontMetrics));

                if (textStyle.decoration && globalTextStyle!.decoration) {
                  expect(textStyle.decoration?.textDecoration).assertEqual(globalTextStyle!.decoration?.textDecoration)
                  expect(textStyle.decoration?.decorationStyle).assertEqual(globalTextStyle!.decoration?.decorationStyle)
                }
                expect(textStyle.fontWeight).assertEqual(globalTextStyle!.fontWeight)
                expect(textStyle.fontStyle).assertEqual(checkFontStyle!)
                expect(textStyle.baseline).assertEqual(globalTextStyle!.baseline)
                expect(textStyle.fontFamilies?.length ?? 0).assertEqual(2)
                expect(textStyle.fontSize).assertEqual(globalTextStyle!.fontSize)
                expect(textStyle.letterSpacing).assertEqual(globalTextStyle!.letterSpacing)
                expect(textStyle.wordSpacing).assertEqual(globalTextStyle!.wordSpacing)
                expect(textStyle.heightScale).assertEqual(globalTextStyle!.heightScale)
                expect(textStyle.halfLeading).assertEqual(globalTextStyle!.halfLeading)
                expect(textStyle.ellipsis).assertEqual("")
                expect(textStyle.ellipsisMode).assertEqual(globalTextStyle!.ellipsisMode)
                expect(textStyle.locale).assertEqual(globalTextStyle!.locale)
                expect(textStyle.baselineShift).assertEqual(globalTextStyle!.baselineShift)
                expect(textStyle.fontFeatures?.length?? 0).assertEqual(globalTextStyle!.fontFeatures?.length?? 0)
                expect(textStyle.textShadows?.length?? 0).assertEqual(globalTextStyle!.textShadows?.length?? 0)
                if (textStyle.backgroundRect && globalTextStyle!.backgroundRect) {
                  expect(textStyle.backgroundRect?.leftTopRadius).assertEqual(globalTextStyle!.backgroundRect?.leftTopRadius)
                  expect(textStyle.backgroundRect?.rightTopRadius).assertEqual(globalTextStyle!.backgroundRect?.rightTopRadius)
                  expect(textStyle.backgroundRect?.rightBottomRadius).assertEqual(globalTextStyle!.backgroundRect?.rightBottomRadius)
                  expect(textStyle.backgroundRect?.leftBottomRadius).assertEqual(globalTextStyle!.backgroundRect?.leftBottomRadius)
                }
                expect(Math.round(fontMetrics.ascent * 100) / 100).assertEqual(-29.70)
                expect(Math.round(fontMetrics.descent * 100) / 100).assertEqual(7.81)
                expect(Math.round(fontMetrics.top * 100) / 100).assertEqual(-33.79)
                expect(Math.round(fontMetrics.bottom * 100) / 100).assertEqual(8.67)
                expect(Math.round(fontMetrics.leading * 100) / 100).assertEqual(0)
              })
            }
          }

          done()
        } catch (err) {
          hilog.error(domain, tag, `Failed in getLineMetricsAt. Cause:${JSON.stringify(err)}`);
          expect().assertFail();
          done()
        }
      })

    /**
     * @tc.name   testPaintStatic
     * @tc.number testPaintStatic
     * @tc.desc   To test method paint for paragraph.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPaintStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          hilog.error(0x0000, 'Text', 'MM_LOG print maxLines: %{public}f', globalParagraphStyle!.maxLines);
          let paragraphBuilder = new text.ParagraphBuilder(globalParagraphStyle!, globalFontCollection!)
          expect(paragraphBuilder !== undefined).assertTrue()
          paragraphBuilder.pushStyle(globalTextStyle!);
          paragraphBuilder.addText("The quick brown fox jumps over the lazy dog.");
          let paragraph = paragraphBuilder.build();
          expect(paragraph !== undefined).assertTrue()
          paragraph.layoutSync(100);
          paragraph.paint(globalCanvas!, 0, 0);
          done()
        } catch (err) {
          hilog.error(domain, tag, `Failed in getLineMetricsAt. Cause:${JSON.stringify(err)}`);
          expect().assertFail();
          done()
        }
      })

    /**
     * @tc.name   testPaintOnPathStatic_01
     * @tc.number testPaintOnPathStatic_01
     * @tc.desc   To test method paintOnPath for paragraph.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPaintOnPathStatic_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          hilog.error(0x0000, 'Text', 'MM_LOG print maxLines: %{public}f', globalParagraphStyle!.maxLines);
          let paragraphBuilder = new text.ParagraphBuilder(globalParagraphStyle!, globalFontCollection!)
          expect(paragraphBuilder !== undefined).assertTrue()
          console.info('www data text ', 1111)
          paragraphBuilder.pushStyle(globalTextStyle!);
          console.info('www data text ', 2222)
          paragraphBuilder.addText("The quick brown fox jumps over the lazy dog.");
          console.info('www data text ', 3333)
          let paragraph = paragraphBuilder.build();
          console.info('www data text ', 4444)
          expect(paragraph !== undefined).assertTrue()
          paragraph.layoutSync(100);
          console.info('www data text ', 5555)
          done()
        } catch (err) {
          hilog.error(domain, tag, `Failed in getLineMetricsAt. Cause:${JSON.stringify(err)}`);
          expect().assertFail();
          done()
        }
      })
  })

}