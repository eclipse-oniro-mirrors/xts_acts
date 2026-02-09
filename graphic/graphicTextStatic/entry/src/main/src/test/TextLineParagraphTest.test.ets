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

function printOptionalArrayLog<T>(name: string, arr: Array<T> | undefined){
  if(arr){
    printArrayLog(name, arr);
  }
}

function printArrayLog<T>(name: string, arr: Array<T>){
  for (let i = 0; i < arr.length; i++){
    let item = arr[i];
    if(typeof item === "int" || typeof item === "double"){
      hilog.info(domain, tag, 'TEXT_LOG %{public}s [%{public}d %{public}d] : %{public}d', name, item as number);
    } else {
      hilog.info(domain, tag, 'TEXT_LOG %{public}s [%{public}d %{public}d] : %{public}s', name, JSON.stringify(item));
    }
  }
}

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

let textLineExpectData:TextLineData = { // 0
  "glyphCount": 40,
  "textRange": {"start":0, "end":40},
  "typographicBounds": {"ascent":-303.39,"descent":112.61,"leading":0,"width":2106.82},
  "imageBounds": {"left":1,"top":9,"right":2078.39,"bottom":44},
  "trailingSpaceWidth": 0,
  "stringIndexForPosition": 1,
  "offsetForStringIndex": 220.13,
  "alignmentOffset": 0,
  "enumerateCaretOffsets": [0,0,1]
}

export default function TextLineParagraphTest() {
  describe("TextLineParagraphTest", (): void => {
    let globalFontCollection: text.FontCollection;
    let globalTextStyle: text.TextStyle;
    let globalParagraphStyle: text.ParagraphStyle;
    let globalStructStyle: text.StrutStyle;
    let globalCanvas: drawing.Canvas | undefined;
    let checkFontStyle: text.FontStyle;
    let globalParagraphBuilder: text.ParagraphBuilder | undefined;

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

        globalParagraphBuilder = new text.ParagraphBuilder(globalParagraphStyle, globalFontCollection)
        expect(globalParagraphBuilder !== undefined).assertTrue()
        globalParagraphBuilder?.pushStyle(globalTextStyle);
        globalParagraphBuilder?.addText('The quick brown fox jumps over the lazy dog.');
        
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
        hilog.error(domain, tag, `Failed in TextTextLineTest init global params. Cause:${JSON.stringify(err)}`);
      }
    })

    /**
     * @tc.name   testCreateLineParagraphStatic
     * @tc.number testCreateLineParagraphStatic
     * @tc.desc   To test metchod create line paragraph for paragraph.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateLineParagraphStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let lineTypeset: text.LineTypeset = globalParagraphBuilder!.buildLineTypeset();
          hilog.info(domain, tag, 'TEXT_LOG lineTypeset getLineBreak:%{public}d', lineTypeset.getLineBreak(20,100));
          let textLine: text.TextLine = lineTypeset.createLine(1,40);
          let point: common2D.Point = {
            x: 50,
            y: 135,
          }
          hilog.info(domain, tag, 'TEXT_LOG textLine getGlyphCount : %{public}d', textLine.getGlyphCount());
          hilog.info(domain, tag, 'TEXT_LOG textLine getTextRange : %{public}s',
            JSON.stringify(textLine.getTextRange()));
          hilog.info(domain, tag, 'TEXT_LOG textLine getGlyphRuns : %{public}s',
            JSON.stringify(textLine.getGlyphRuns()));
          hilog.info(domain, tag, 'TEXT_LOG textLine getTypographicBounds : %{public}s',
            JSON.stringify(textLine.getTypographicBounds()));
          hilog.info(domain, tag, 'TEXT_LOG textLine getImageBounds : %{public}s',
            JSON.stringify(textLine.getImageBounds()));
          hilog.info(domain, tag, 'TEXT_LOG textLine getTrailingSpaceWidth : %{public}s',
            JSON.stringify(textLine.getTrailingSpaceWidth()));
          hilog.info(domain, tag, 'TEXT_LOG textLine getStringIndexForPosition : %{public}d',
            textLine.getStringIndexForPosition(point));
          hilog.info(domain, tag, 'TEXT_LOG textLine getOffsetForStringIndex : %{public}d',
            textLine.getOffsetForStringIndex(4));
          hilog.info(domain, tag, 'TEXT_LOG textLine getAlignmentOffset : %{public}d',
            textLine.getAlignmentOffset(1, 2));
          textLine.enumerateCaretOffsets((offset: double, index: int, leadingEdge: boolean) => {
            hilog.info(domain, tag, 'TEXT_LOG textLine enumerateCaretOffsets : %{public}d %{public}d %{public}s',
            offset,
            index, leadingEdge ? "true" : "false");
            return true;
          });
          expect(textLine.getGlyphCount()).assertEqual(textLineExpectData.glyphCount);
          let textRange: text.Range = textLine.getTextRange();
          expect(textRange.start).assertEqual(textLineExpectData.textRange.start);
          expect(textRange.end).assertEqual(textLineExpectData.textRange.end);
          textLine.paint(globalCanvas!,0,0);
          textLine.createTruncatedLine(4, text.EllipsisMode.START, "...");
          let bounds: text.TypographicBounds = textLine.getTypographicBounds();
          expect(Math.round(bounds.ascent * 100) / 100).assertEqual(textLineExpectData.typographicBounds.ascent);
          expect(Math.round(bounds.descent * 100) / 100).assertEqual(textLineExpectData.typographicBounds.descent);
          expect(Math.round(bounds.leading * 100) / 100).assertEqual(textLineExpectData.typographicBounds.leading);
          expect(Math.round(bounds.width * 100) / 100).assertEqual(textLineExpectData.typographicBounds.width);
          let rect: common2D.Rect = textLine.getImageBounds();
          expect(Math.round(rect.left * 100) / 100).assertEqual(textLineExpectData.imageBounds.left);
          expect(Math.round(rect.top * 100) / 100).assertEqual(textLineExpectData.imageBounds.top);
          expect(Math.round(rect.right * 100) / 100).assertEqual(textLineExpectData.imageBounds.right);
          expect(Math.round(rect.bottom * 100) / 100).assertEqual(textLineExpectData.imageBounds.bottom);
          expect(Math.round(textLine.getTrailingSpaceWidth() * 1000000) / 1000000).assertEqual(textLineExpectData.trailingSpaceWidth);
          expect(textLine.getStringIndexForPosition(point)).assertEqual(textLineExpectData.stringIndexForPosition);
          expect(Math.round(textLine.getOffsetForStringIndex(4) * 100) / 100).assertEqual(textLineExpectData.offsetForStringIndex);
          textLine.enumerateCaretOffsets((offset: double, index: int, leadingEdge: boolean) => {
            expect(Math.round(offset * 100) / 100).assertEqual(textLineExpectData.enumerateCaretOffsets[0]);
            expect(Math.round(index * 100) / 100).assertEqual(textLineExpectData.enumerateCaretOffsets[1]);
            expect(leadingEdge ? 1 : 0).assertEqual(textLineExpectData.enumerateCaretOffsets[2]);
            return true;
          })
          expect(Math.round(textLine.getAlignmentOffset(1, 2) * 100) / 100).assertEqual(textLineExpectData.alignmentOffset);
          done();
        } catch (err) {
          let error = err as BusinessError;
          hilog.error(domain, tag, `Failed in getGlyphRuns. Cause:${JSON.stringify(error)}`);
          expect().assertFail();
          done()
        }
      })
  })
}