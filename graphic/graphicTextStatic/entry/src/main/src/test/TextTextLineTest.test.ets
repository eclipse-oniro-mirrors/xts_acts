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

interface TextLineData {
  glyphCount: int;
  textRange: text.Range;
  typographicBounds: text.TypographicBounds;
  imageBounds: common2D.Rect;
  trailingSpaceWidth: double;
  stringIndexForPosition: int;
  offsetForStringIndex: double;
  alignmentOffset: double;
  enumerateCaretOffsets: Array<int>;
}

let textLineExpectData: Array<TextLineData> = [
  {
    // 0
    "glyphCount": 9,
    "textRange": { "start": 0, "end": 9 },
    "typographicBounds": {
      "ascent": -303.39,
      "descent": 112.61,
      "leading": 0,
      "width": 565.64
    },
    "imageBounds": {
      "left": 4,
      "top": 8,
      "right": 472.90,
      "bottom": 41
    },
    "trailingSpaceWidth": 65.640015,
    "stringIndexForPosition": 1,
    "offsetForStringIndex": 218.88,
    "alignmentOffset": 0,
    "enumerateCaretOffsets": [0, 0, 1]
  },
  {
    // 1
    "glyphCount": 9,
    "textRange": { "start": 10, "end": 19 },
    "typographicBounds": {
      "ascent": -303.39,
      "descent": 112.61,
      "leading": 0,
      "width": 565.64
    },
    "imageBounds": {
      "left": 1,
      "top": 1,
      "right": 472.10,
      "bottom": 28
    },
    "trailingSpaceWidth": 65.640015,
    "stringIndexForPosition": 11,
    "offsetForStringIndex": 0,
    "alignmentOffset": 0,
    "enumerateCaretOffsets": [0, 10, 1]
  },
  {
    // 2
    "glyphCount": 9,
    "textRange": { "start": 20, "end": 29 },
    "typographicBounds": {
      "ascent": -303.39,
      "descent": 112.61,
      "leading": 0,
      "width": 500.00
    },
    "imageBounds": {
      "left": -7,
      "top": 9,
      "right": 469.50,
      "bottom": 42
    },
    "trailingSpaceWidth": 0.000122,
    "stringIndexForPosition": 21,
    "offsetForStringIndex": 0,
    "alignmentOffset": 0,
    "enumerateCaretOffsets": [0, 20, 1]
  },
  {
    // 3
    "glyphCount": 9,
    "textRange": { "start": 29, "end": 38 },
    "typographicBounds": {
      "ascent": -303.39,
      "descent": 112.61,
      "leading": 0,
      "width": 500.00
    },
    "imageBounds": {
      "left": 1,
      "top": 1,
      "right": 470.83,
      "bottom": 27
    },
    "trailingSpaceWidth": 0.000061,
    "stringIndexForPosition": 30,
    "offsetForStringIndex": 0,
    "alignmentOffset": 0,
    "enumerateCaretOffsets": [0, 29, 1]
  },
  {
    // 4
    "glyphCount": 6,
    "textRange": { "start": 38, "end": 44 },
    "typographicBounds": {
      "ascent": -303.39,
      "descent": 112.61,
      "leading": 0,
      "width": 312.43
    },
    "imageBounds": {
      "left": -3,
      "top": 9,
      "right": 279.04,
      "bottom": 43
    },
    "trailingSpaceWidth": 0.000061,
    "stringIndexForPosition": 39,
    "offsetForStringIndex": 0,
    "alignmentOffset": 0,
    "enumerateCaretOffsets": [0, 38, 1]
  },
]

export default function TextTextLineTest() {
  describe("TextTextLineTest", (): void => {
    let globalFontCollection: text.FontCollection;
    let globalTextStyle: text.TextStyle;
    let globalParagraphStyle: text.ParagraphStyle;
    let globalStructStyle: text.StrutStyle;
    let globalCanvas: drawing.Canvas;
    let checkFontStyle: text.FontStyle;
    let globalParagraph: text.Paragraph;

    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeEach start');
      try {
        globalFontCollection = text.FontCollection.getGlobalInstance()
        globalFontCollection.loadFontSync('myFamilyName', 'file:///system/fonts/HarmonyOS_Sans.ttf')
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
          textStyle: globalTextStyle,
          textDirection: text.TextDirection.RTL,
          align: text.TextAlign.JUSTIFY,
          wordBreak: text.WordBreak.BREAK_ALL,
          maxLines: 10,
          breakStrategy: text.BreakStrategy.BALANCED,
          strutStyle: globalStructStyle,
          textHeightBehavior: text.TextHeightBehavior.DISABLE_LAST_ASCENT,
          tab: textTab
        };

        let paragraphBuilder = new text.ParagraphBuilder(globalParagraphStyle, globalFontCollection);
        expect(paragraphBuilder !== undefined).assertTrue();
        paragraphBuilder.pushStyle(globalTextStyle);
        paragraphBuilder.addText('The quick brown fox jumps over the lazy dog.');
        globalParagraph = paragraphBuilder.build();
        expect(globalParagraph !== undefined).assertTrue();

        const opts: image.InitializationOptions = {
          size: { width: 480, height: 360 },
          editable: true,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
        };
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        if (pixelMap == null) {
          console.info('www data create image.createPixelMapSync failed');
          return;
        }
        console.info('www data create image.createPixelMapSync success');
        globalCanvas = new drawing.Canvas(pixelMap);
        expect(globalCanvas !== undefined).assertTrue();
      } catch (err) {
        hilog.error(domain, tag, `Failed in TextTextLineTest init global params. Cause:${JSON.stringify(err)}`);
      }
    })

    /**
     * @tc.name   testGetTextLinesStatic
     * @tc.number testGetTextLinesStatic
     * @tc.desc   To test method getTextLine font paragraph.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTextLinesStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('www data textLine 000 ')
        try {
          globalParagraph.layoutSync(500);
          console.info('www data textLine 11111 ')

          let point: common2D.Point = {
            x: 50,
            y: 135,
          }
          console.info('www data textLine 22222 ')

          let textLines: Array<text.TextLine> = globalParagraph.getTextLines();
          console.info('www data textLine 33333 ' + JSON.stringify(textLines))
          let length = textLines.length;
          console.info('www data textLine 44444 ' + length)
          for (let i = 0; i < length; i++) {
            console.info('www data textLine 55555 ' + i)

            let textLine: text.TextLine = textLines[i];
            hilog.info(domain, tag, 'TEXT_LOG textLine [%{public}d] getGlyphCount : %{public}d', i,
              textLine.getGlyphCount());
            hilog.info(domain, tag, 'TEXT_LOG textLine [%{public}d] getTextRange : %{public}s', i,
              JSON.stringify(textLine.getTextRange()));
            hilog.info(domain, tag, 'TEXT_LOG textLine [%{public}d] getGlyphRuns : %{public}s', i,
              JSON.stringify(textLine.getGlyphRuns()));
            hilog.info(domain, tag, 'TEXT_LOG textLine [%{public}d] getTypographicBounds : %{public}s', i,
              JSON.stringify(textLine.getTypographicBounds()));
            hilog.info(domain, tag, 'TEXT_LOG textLine [%{public}d] getImageBounds : %{public}s', i,
              JSON.stringify(textLine.getImageBounds()));
            hilog.info(domain, tag, 'TEXT_LOG textLine [%{public}d] getTrailingSpaceWidth : %{public}s', i,
              JSON.stringify(textLine.getTrailingSpaceWidth()));
            hilog.info(domain, tag, 'TEXT_LOG textLine [%{public}d] getStringIndexForPosition : %{public}d', i,
              textLine.getStringIndexForPosition(point));
            hilog.info(domain, tag, 'TEXT_LOG textLine [%{public}d] getOffsetForStringIndex : %{public}d', i,
              textLine.getOffsetForStringIndex(4));
            hilog.info(domain, tag, 'TEXT_LOG textLine [%{public}d] getAlignmentOffset : %{public}d', i,
              textLine.getAlignmentOffset(1, 2));

            textLine.enumerateCaretOffsets((offset: double, index: int, leadingEdge: boolean) => {
              hilog.info(domain, tag, 'TEXT_LOG textLine enumerateCaretOffsets : %{public}d %{public}d %{public}s',
                offset,
                index, leadingEdge ? "true" : "false");
              return true;
            })

            console.info('www data data ', i + '   ', textLine.getGlyphCount())
            console.info('www data data ', i + '   ', textLineExpectData[i].glyphCount)

            expect(textLine.getGlyphCount()).assertEqual(textLineExpectData[i].glyphCount);
            let textRange: text.Range = textLine.getTextRange();
            expect(textRange.start).assertEqual(textLineExpectData[i].textRange.start);
            expect(textRange.end).assertEqual(textLineExpectData[i].textRange.end);
            textLine.paint(globalCanvas, 0, 0);
            textLine.createTruncatedLine(4, text.EllipsisMode.START, "...");
            let bounds: text.TypographicBounds = textLine.getTypographicBounds();
            expect(Math.round(bounds.ascent * 100) / 100).assertEqual(textLineExpectData[i].typographicBounds.ascent);
            expect(Math.round(bounds.descent * 100) / 100).assertEqual(textLineExpectData[i].typographicBounds.descent);
            expect(Math.round(bounds.leading * 100) / 100).assertEqual(textLineExpectData[i].typographicBounds.leading);
            expect(Math.round(bounds.width * 100) / 100).assertEqual(textLineExpectData[i].typographicBounds.width);

            let rect: common2D.Rect = textLine.getImageBounds();
            expect(Math.round(rect.left * 100) / 100).assertEqual(textLineExpectData[i].imageBounds.left);
            expect(Math.round(rect.top * 100) / 100).assertEqual(textLineExpectData[i].imageBounds.top);
            expect(Math.round(rect.right * 100) / 100).assertEqual(textLineExpectData[i].imageBounds.right);
            expect(Math.round(rect.bottom * 100) / 100).assertEqual(textLineExpectData[i].imageBounds.bottom);
            expect(Math.round(textLine.getTrailingSpaceWidth() * 1000000) / 1000000)
              .assertEqual(textLineExpectData[i].trailingSpaceWidth);
            expect(textLine.getStringIndexForPosition(point)).assertEqual(textLineExpectData[i].stringIndexForPosition);
            expect(Math.round(textLine.getOffsetForStringIndex(4) * 100) / 100)
              .assertEqual(textLineExpectData[i].offsetForStringIndex);

            textLine.enumerateCaretOffsets((offset: double, index: int, leadingEdge: boolean) => {
              expect(Math.round(offset * 100) / 100).assertEqual(textLineExpectData[i].enumerateCaretOffsets[0]);
              expect(Math.round(index * 100) / 100).assertEqual(textLineExpectData[i].enumerateCaretOffsets[1]);
              expect(leadingEdge ? 1 : 0).assertEqual(textLineExpectData[i].enumerateCaretOffsets[2]);
              console.info('www data textLine 11111')
              return true;
            })

            expect(Math.round(textLine.getAlignmentOffset(1, 2) * 100) / 100)
              .assertEqual(textLineExpectData[i].alignmentOffset);
          }
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.error(domain, tag, `www data Failed in getMaxWidth. Cause:${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })
  })
}