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

interface TextRunData {
  glyphCount: int;
  glyphs: Array<int>;
  positions: Array<common2D.Point>;
  offSets: Array<common2D.Point>;
  stringIndices: Array<int>;
  stringRange: text.Range;
  typographicBounds: text.TypographicBounds;
  imageBounds: common2D.Rect;
}

let textLineRunExpectData: Array<Array<TextRunData>> = [
  [// line 0
    {
      // run 0
      "glyphCount": 9,
      "glyphs": [140, 258, 228, 2, 328, 346, 262, 218, 280],
      "positions": [{"y":0,"x":0},{"y":0,"x":52.39},{"y":0,"x":104.72},{"y":0,"x":155.54},{"y":0,"x":221.18},
        {"y":0,"x":274.31},{"y":0,"x":326.64},{"y":0,"x":368.18},{"y":0,"x":417.22}],
      "offSets": [{ "x": 0, "y": 0 }, { "x": 0, "y": 0 }, { "x": 0, "y": 0 }, { "x": 0, "y": 0 }, { "x": 0, "y": 0 },
        { "x": 0, "y": 0 }, { "x": 0, "y": 0 }, { "x": 0, "y": 0 }, { "x": 0, "y": 0 }],
      "stringIndices": [0],
      "stringRange": { "start": 0, "end": 9 },
      "typographicBounds": {
        "ascent": -16.70,
        "descent": 20.81,
        "leading": 0,
        "width": 565.64
      },
      "imageBounds": {
        "left": 5,
        "top": 8,
        "right": 440.22,
        "bottom": 41
      },
    }
  ],
  [// line 1
    {
      // run 0
      "glyphCount": 9,
      "glyphs": [217, 329, 300, 371, 292, 2, 249, 300, 376],
      "positions": [{"y":0,"x":533.74},{"y":0,"x":586.87},{"y":0,"x":632.58},{"y":0,"x":684.26},{"y":0,"x":743.57},
        {"y":0,"x":795.90},{"y":0,"x":861.54},{"y":0,"x":905.93},{"y":0,"x":957.42}],
      "offSets": [{ "x": 0, "y": 0 }, { "x": 0, "y": 0 }, { "x": 0, "y": 0 }, { "x": 0, "y": 0 }, { "x": 0, "y": 0 },
        { "x": 0, "y": 0 }, { "x": 0, "y": 0 }, { "x": 0, "y": 0 }, { "x": 0, "y": 0 }],
      "stringIndices": [10],
      "stringRange": { "start": 10, "end": 9 },
      "typographicBounds": {
        "ascent": -16.70,
        "descent": 20.81,
        "leading": 0,
        "width": 565.64
      },
      "imageBounds": {
        "left": 2,
        "top": 1,
        "right": 445.68,
        "bottom": 27
      },
    }
  ],
  [// line 2
    {
      // run 0
      "glyphCount": 9,
      "glyphs": [276, 346, 290, 326, 333, 2, 300, 370, 228],
      "positions": [{"y":0,"x":1073.28},{"y":0,"x":1114.79},{"y":0,"x":1167.12},{"y":0,"x":1228.06},
        {"y":0,"x":1281.18},{"y":0,"x":1329.16},{"y":0,"x":1394.80},{"y":0,"x":1446.49},{"y":0,"x":1497.02}],
      "offSets": [{ "x": 0, "y": 0 }, { "x": 0, "y": 0 }, { "x": 0, "y": 0 }, { "x": 0, "y": 0 }, { "x": 0, "y": 0 },
        { "x": 0, "y": 0 }, { "x": 0, "y": 0 }, { "x": 0, "y": 0 }, { "x": 0, "y": 0 }],
      "stringIndices": [20],
      "stringRange": { "start": 20, "end": 9 },
      "typographicBounds": {
        "ascent": -16.70,
        "descent": 20.81,
        "leading": 0,
        "width": 500
      },
      "imageBounds": {
        "left": -7,
        "top": 8,
        "right": 443.74,
        "bottom": 41
      },
    }
  ],
  [// line 3
    {
      // run 0
      "glyphCount": 9,
      "glyphs": [329, 2, 341, 258, 228, 2, 284, 189, 385],
      "positions": [{"y":0,"x":1547.85},{"y":0,"x":1594.58},{"y":0,"x":1660.22},{"y":0,"x":1706.72},
        {"y":0,"x":1759.05},{"y":0,"x":1809.87},{"y":0,"x":1875.51},{"y":0,"x":1917.09},{"y":0,"x":1968.10}],
      "offSets": [{ "x": 0, "y": 0 }, { "x": 0, "y": 0 }, { "x": 0, "y": 0 }, { "x": 0, "y": 0 }, { "x": 0, "y": 0 },
        { "x": 0, "y": 0 }, { "x": 0, "y": 0 }, { "x": 0, "y": 0 }, { "x": 0, "y": 0 }],
      "stringIndices": [29],
      "stringRange": { "start": 29, "end": 9 },
      "typographicBounds": {
        "ascent": -16.70,
        "descent": 20.81,
        "leading": 0,
        "width": 500
      },
      "imageBounds": {
        "left": 2,
        "top": 1,
        "right": 439.26,
        "bottom": 27
      },
    }
  ],
  [// line 4
    {
      // run 0
      "glyphCount": 1,
      "glyphs": [766],
      "positions": [{ "x": 1611, "y": 0 }],
      "offSets": [{ "x": 0, "y": 0 }],
      "stringIndices": [38],
      "stringRange": { "start": 38, "end": 1 },
      "typographicBounds": {
        "ascent": -16.70,
        "descent": 20.81,
        "leading": 0,
        "width": 41.42
      },
      "imageBounds": {
        "left": 184.44,
        "top": 1,
        "right": 191.44,
        "bottom": 7
      },
    },
    {
      // run 1
      "glyphCount": 5,
      "glyphs": [377, 2, 224, 300, 250],
      "positions": [{"y":0,"x":2016.56},{"y":0,"x":2067.74},{"y":0,"x":2133.38},{"y":0,"x":2186.51},
        {"y":0,"x":2238.74}],
      "offSets": [{ "x": 0, "y": 0 }, { "x": 0, "y": 0 }, { "x": 0, "y": 0 }, { "x": 0, "y": 0 }, { "x": 0, "y": 0 }],
      "stringIndices": [39],
      "stringRange": { "start": 39, "end": 5 },
      "typographicBounds": {
        "ascent": -16.70,
        "descent": 20.81,
        "leading": 0,
        "width": 275.14
      },
      "imageBounds": {
        "left": 290.50,
        "top": 8,
        "right": 471.82,
        "bottom": 41
      },
    }
  ],
]


export default function TextRunTest() {
  describe("TextRunTest", (): void => {
    let globalFontCollection: text.FontCollection;
    let globalTextStyle: text.TextStyle;
    let globalParagraphStyle: text.ParagraphStyle;
    let globalStructStyle: text.StrutStyle;
    let globalCanvas: drawing.Canvas | undefined;
    let checkFontStyle: text.FontStyle;
    let globalParagraph: text.Paragraph | undefined;

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

        let fontFeatures: Array<text.FontFeature> = [];
        fontFeatures.push({ name: "liga", value: 1 } as text.FontFeature);
        fontFeatures.push({ name: "liga2", value: 2 } as text.FontFeature);
        let fontVariation: Array<text.FontVariation> = [];
        fontVariation.push({ axis: "axis", value: 1 } as text.FontVariation);
        fontVariation.push({ axis: "axis2", value: 2 } as text.FontVariation);
        let textShadows: Array<text.TextShadow> = [];
        let point1: common2D.Point = { x: 11, y: 12 };
        let point2: common2D.Point = { x: 2, y: 4 };
        textShadows.push({
          color: myColor,
          point: point1, blurRadius: 12
        } as text.TextShadow);
        textShadows.push({
          color: myColor,
          point: point2, blurRadius: 14
        } as text.TextShadow);
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
     * @tc.name   testGetGlyphRunsStatic
     * @tc.number testGetGlyphRunsStatic
     * @tc.desc   To test method getGlyphRuns desc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGlyphRunsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          globalParagraph?.layoutSync(500);

          let range: text.Range = { start: 0, end: 1 };

          let textLines: Array<text.TextLine> = globalParagraph!.getTextLines();
          let length = textLines.length;
          for (let i = 0; i < length; i++) {
            let textLine: text.TextLine = textLines[i];
            let runs: Array<text.Run> = textLine.getGlyphRuns();
            for (let j = 0; j < runs.length; j++) {
              console.info('www data lxt text ', 1111111111111);
              const run: text.Run = runs[j];
              hilog.info(domain, tag, 'TEXT_LOG run [%{public}d %{public}d] getGlyphCount :%{public}d', i, j,
                run.getGlyphCount());
              hilog.info(domain, tag, 'TEXT_LOG run [%{public}d %{public}d] getGlyphs :%{public}s', i, j,
                JSON.stringify(run.getGlyphs()));
              hilog.info(domain, tag, 'TEXT_LOG run [%{public}d %{public}d] getGlyphs by range :%{public}s', i, j,
                JSON.stringify(run.getGlyphs(range)));
              hilog.info(domain, tag, 'TEXT_LOG run [%{public}d %{public}d] getPositions :%{public}s', i, j,
                JSON.stringify(run.getPositions()));
              hilog.info(domain, tag, 'TEXT_LOG run [%{public}d %{public}d] getPositions by range :%{public}s', i, j,
                JSON.stringify(run.getPositions(range)));
              hilog.info(domain, tag, 'TEXT_LOG run [%{public}d %{public}d] getOffsets :%{public}s', i, j,
                JSON.stringify(run.getOffsets()));
              hilog.info(domain, tag, 'TEXT_LOG run [%{public}d %{public}d] getFont :%{public}s', i, j,
                JSON.stringify(run.getFont()));
              run.paint(globalCanvas!, 0, 0);
              let indices: Array<int> | undefined = run.getStringIndices(range);
              if (indices) {
                hilog.info(domain, tag, 'TEXT_LOG indices size: %{public}d ', indices.length);
                hilog.info(domain, tag, 'TEXT_LOG run [%{public}d %{public}d] getStringIndices: %{public}s ', i, j,
                  JSON.stringify(indices));
              }
              hilog.info(domain, tag, 'TEXT_LOG run [%{public}d %{public}d] getStringRange :%{public}s', i, j,
                JSON.stringify(run.getStringRange()));
              hilog.info(domain, tag, 'TEXT_LOG run [%{public}d %{public}d] getTypographicBounds :%{public}s', i, j,
                JSON.stringify(run.getTypographicBounds()));
              hilog.info(domain, tag, 'TEXT_LOG run [%{public}d %{public}d] getImageBounds :%{public}s', i, j,
                JSON.stringify(run.getImageBounds()));

              expect(run.getGlyphCount()).assertEqual(textLineRunExpectData[i][j].glyphCount);
              let glyphs: Array<int> = run.getGlyphs();
              for (let m = 0; m < glyphs.length; m++) {
                expect(glyphs[m]).assertEqual(textLineRunExpectData[i][j].glyphs[m]);
              }
              let rangeGlyphs: Array<int> | undefined = run.getGlyphs(range);
              if (rangeGlyphs) {
                for (let m = 0; m < rangeGlyphs.length; m++) {
                  expect(rangeGlyphs[m]).assertEqual(textLineRunExpectData[i][j].glyphs[m]);
                }
              }
              let positions: Array<common2D.Point> = run.getPositions();
              for (let m = 0; m < positions.length; m++) {
                expect(Math.round(positions[m].x * 100) / 100).assertEqual(textLineRunExpectData[i][j].positions[m].x);
                expect(Math.round(positions[m].y * 100) / 100).assertEqual(textLineRunExpectData[i][j].positions[m].y);
              }
              let rangePositions: Array<common2D.Point> | undefined = run.getPositions(range);
              if (rangePositions) {
                for (let m = 0; m < rangePositions.length; m++) {
                  expect(Math.round(rangePositions[m].x * 100) / 100)
                    .assertEqual(textLineRunExpectData[i][j].positions[m].x);
                  expect(Math.round(rangePositions[m].y * 100) / 100)
                    .assertEqual(textLineRunExpectData[i][j].positions[m].y);
                }
              }
              let offsets: Array<common2D.Point> = run.getOffsets();
              let stringIndices: Array<int> | undefined = run.getStringIndices(range);
              if (stringIndices) {
                for (let m = 0; m < stringIndices.length; m++) {
                  expect(stringIndices[m]).assertEqual(textLineRunExpectData[i][j].stringIndices[m]);
                }
              }
              expect(run.getStringRange().start).assertEqual(textLineRunExpectData[i][j].stringRange.start);
              expect(run.getStringRange().end).assertEqual(textLineRunExpectData[i][j].stringRange.end);
              expect(Math.round(run.getTypographicBounds().ascent * 100) / 100)
                .assertEqual(textLineRunExpectData[i][j].typographicBounds.ascent);
              expect(Math.round(run.getTypographicBounds().descent * 100) / 100)
                .assertEqual(textLineRunExpectData[i][j].typographicBounds.descent);
              expect(Math.round(run.getTypographicBounds().leading * 100) / 100)
                .assertEqual(textLineRunExpectData[i][j].typographicBounds.leading);
              expect(Math.round(run.getTypographicBounds().width * 100) / 100)
                .assertEqual(textLineRunExpectData[i][j].typographicBounds.width);

              expect(Math.round(run.getImageBounds().left * 100) / 100)
                .assertEqual(textLineRunExpectData[i][j].imageBounds.left);
              expect(Math.round(run.getImageBounds().top * 100) / 100)
                .assertEqual(textLineRunExpectData[i][j].imageBounds.top);
              expect(Math.round(run.getImageBounds().right * 100) / 100)
                .assertEqual(textLineRunExpectData[i][j].imageBounds.right);
              expect(Math.round(run.getImageBounds().bottom * 100) / 100)
                .assertEqual(textLineRunExpectData[i][j].imageBounds.bottom);
            }
          }
          done();
        } catch (err) {
          hilog.error(domain, tag, `Failed in getGlyphRuns. Cause:${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })

  })
}