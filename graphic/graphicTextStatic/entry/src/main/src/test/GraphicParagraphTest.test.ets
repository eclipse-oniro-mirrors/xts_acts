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
import { $rawfile, Resource } from '@ohos.arkui.component';
import image from '@ohos.multimedia.image';
import drawing from '@ohos.graphics.drawing';

export default function GraphicParagraphTest() {

  describe('GraphicParagraphTest', () => {

    /**
     * @tc.name   testForceReuseRasterResultTrueStatic
     * @tc.number SUB_GRAPHIC_Paragraph_forceReuseRasterResultTrueStatic_0100
     * @tc.desc   Test Paragraph forceReuseRasterResult with true value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testForceReuseRasterResultTrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testForceReuseRasterResultTrueStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试强制复用光栅化结果');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          const color: ArrayBuffer = new ArrayBuffer(160000);
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 200, width: 200 } }
          let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
          let canvas: drawing.Canvas = new drawing.Canvas(pixelMap);

          paragraph.forceReuseRasterResult(true);
          paragraph.paint(canvas, 10, 10);

          console.info(msgStr + ' paint success with forceReuseRasterResult true');
          console.info(msgStr + ' end');
          await pixelMap.release();
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testForceReuseRasterResultFalseStatic
     * @tc.number SUB_GRAPHIC_Paragraph_forceReuseRasterResultFalseStatic_0200
     * @tc.desc   Test Paragraph forceReuseRasterResult with false value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testForceReuseRasterResultFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testForceReuseRasterResultFalseStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试允许更新光栅化结果');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          const color: ArrayBuffer = new ArrayBuffer(160000);
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 200, width: 200 } }
          let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
          let canvas: drawing.Canvas = new drawing.Canvas(pixelMap);

          paragraph.forceReuseRasterResult(false);
          paragraph.paint(canvas, 10, 10);

          console.info(msgStr + ' paint success with forceReuseRasterResult false');
          console.info(msgStr + ' end');
          await pixelMap.release();
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testPunctuationOverflowTrueStatic
     * @tc.number SUB_GRAPHIC_Paragraph_punctuationOverflowTrueStatic_0100
     * @tc.desc   Test ParagraphStyle punctuationOverflow property set to true and verify via getParagraphStyle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPunctuationOverflowTrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testPunctuationOverflowTrueStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            punctuationOverflow: true
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试标点溢出功能启用');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let resultStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          expect(resultStyle.punctuationOverflow).assertTrue();
          console.info(msgStr + ' punctuationOverflow is true');
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testPunctuationOverflowFalseStatic
     * @tc.number SUB_GRAPHIC_Paragraph_punctuationOverflowFalseStatic_0200
     * @tc.desc   Test ParagraphStyle punctuationOverflow property set to false and verify via getParagraphStyle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPunctuationOverflowFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testPunctuationOverflowFalseStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            punctuationOverflow: false
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试标点溢出功能禁用');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let resultStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          expect(resultStyle.punctuationOverflow).assertFalse();
          console.info(msgStr + ' punctuationOverflow is false');
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testPunctuationOverflowUndefinedStatic
     * @tc.number SUB_GRAPHIC_Paragraph_punctuationOverflowUndefinedStatic_0300
     * @tc.desc   Test ParagraphStyle punctuationOverflow property with undefined value and verify via getParagraphStyle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPunctuationOverflowUndefinedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testPunctuationOverflowUndefinedStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试标点溢出功能未设置');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let resultStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' punctuationOverflow is undefined', resultStyle.punctuationOverflow);
          expect(resultStyle.punctuationOverflow).assertEqual(false);
          console.info(msgStr + ' punctuationOverflow is undefined');
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testPunctuationOverflowExplicitUndefinedStatic
     * @tc.number SUB_GRAPHIC_Paragraph_punctuationOverflowExplicitUndefinedStatic_0400
     * @tc.desc   Test ParagraphStyle punctuationOverflow property explicitly set to undefined and verify via getParagraphStyle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPunctuationOverflowExplicitUndefinedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testPunctuationOverflowExplicitUndefinedStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            punctuationOverflow: undefined
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试标点溢出功能显式设置为undefined');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let resultStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' punctuationOverflow is undefined', resultStyle.punctuationOverflow);
          expect(resultStyle.punctuationOverflow).assertEqual(false);
          console.info(msgStr + ' punctuationOverflow is explicitly set to undefined');
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })
      
  })
}
