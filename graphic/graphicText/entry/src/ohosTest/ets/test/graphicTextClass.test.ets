/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { RenderNode, DrawContext } from "@ohos.arkui.node"
import drawing from "@ohos.graphics.drawing"
import common2D from "@ohos.graphics.common2D"
import image from "@ohos.multimedia.image"
import text from "@ohos.graphics.text"
import { UiDriver, BY, ON, PointerMatrix } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';
import buffer from '@ohos.buffer';
import {buildParagraph} from './utils';
import { display } from '@kit.ArkUI';

function sleep(time: number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve();
    }, time);
  });
}

export default function graphicTextClass() {
  describe('graphic_text_class_test', ()=> {
    console.log('describe graphic_text_class_test start!!!')

    let pixel:image.PixelMap;

    beforeAll(async ()=> {
      const color: ArrayBuffer = new ArrayBuffer(40000); // 40000为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 100, width: 100//100为创建的PixelMap的宽高
        }
      }
      pixel = await image.createPixelMap(color, opts);
    })
    /**
     * @tc.name   testlayoutSync
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_001
     * @tc.desc   To test Paragraph layoutSyncSync interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testlayoutSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testlayoutSync"
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      try {
          paragraph.layoutSync(100);
        } catch (err) {
        console.info(msg + 'layoutSync error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPaint
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_002
     * @tc.desc   To test Paragraph Paint interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPaint', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testPaint"
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      let paragraph: text.Paragraph = buildParagraph();
      try {
          paragraph.paint(canvas, 10, 10);
        } catch (err) {
        console.info(msg + 'paint error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testGetMaxWidth
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_003
     * @tc.desc   To test Paragraph GetMaxWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMaxWidth', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testGetMaxWidth"
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      try {
          let width = paragraph.getMaxWidth();
          expect(width != null).assertTrue();
        } catch (err) {
        console.info(msg + 'getMaxWidth error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testGetHeight
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_004
     * @tc.desc   To test Paragraph GetHeight interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetHeight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testGetHeight"
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      try {
          let height = paragraph.getHeight();
          expect(height != null).assertTrue();
        } catch (err) {
        console.info(msg + 'getHeight error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testGetLongestLine
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_005
     * @tc.desc   To test Paragraph GetLongestLine interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetLongestLine', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testGetLongestLine"
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      try {
          let line = paragraph.getLongestLine();
          expect(line != null).assertTrue();
        } catch (err) {
        console.info(msg + 'getLongestLine error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetMinIntrinsicWidth
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_006
     * @tc.desc   To test Paragraph GetMinIntrinsicWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMinIntrinsicWidth', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testGetMinIntrinsicWidth"
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      try {
          let width = paragraph.getMinIntrinsicWidth();
          expect(width != null).assertTrue();
        } catch (err) {
        console.info(msg + 'getMinIntrinsicWidth error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testGetMaxIntrinsicWidth
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_007
     * @tc.desc   To test Paragraph GetMaxIntrinsicWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMaxIntrinsicWidth', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testGetMaxIntrinsicWidth"
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      try {
          let width = paragraph.getMaxIntrinsicWidth();
          expect(width != null).assertTrue();
        } catch (err) {
        console.info(msg + 'getMaxIntrinsicWidth error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testGetAlphabeticBaseline
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_008
     * @tc.desc   To test Paragraph GetAlphabeticBaseline interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetAlphabeticBaseline', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testGetAlphabeticBaseline"
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      try {
          let baseline = paragraph.getAlphabeticBaseline();
          expect(baseline != null).assertTrue();
        } catch (err) {
        console.info(msg + 'getAlphabeticBaseline error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testGetIdeographicBaseline
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_009
     * @tc.desc   To test Paragraph GetIdeographicBaseline interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetIdeographicBaseline', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testGetIdeographicBaseline"
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      try {
          let baseline = paragraph.getIdeographicBaseline();
          expect(baseline != null).assertTrue();
        } catch (err) {
        console.info(msg + 'getIdeographicBaseline error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testGetRectsForRange
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_010
     * @tc.desc   To test Paragraph GetRectsForRange interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetRectsForRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testGetRectsForRange"
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      let range :text.Range = {start : 10,end: 50};
      let wstyle = text.RectWidthStyle.TIGHT;
      let hstyle = text.RectHeightStyle.TIGHT;
      try {
          let rects : Array<text.TextBox> = paragraph.getRectsForRange(range,wstyle,hstyle);
          expect(rects != null).assertTrue();
        } catch (err) {
        console.info(msg + 'getRectsForRange error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testGetRectsForPlaceholders
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_011
     * @tc.desc   To test Paragraph GetRectsForPlaceholders interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetRectsForPlaceholders', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testGetRectsForPlaceholders"
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      try {
          let rects : Array<text.TextBox> = paragraph.getRectsForPlaceholders();
          expect(rects != null).assertTrue();
        } catch (err) {
        console.info(msg + 'getRectsForPlaceholders error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testGetGlyphPositionAtCoordinate
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_012
     * @tc.desc   To To test Paragraph GetGlyphPositionAtCoordinate interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGlyphPositionAtCoordinate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testGetGlyphPositionAtCoordinate"
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      try {
          let positionWithAffinity = paragraph.getGlyphPositionAtCoordinate(10,10);
          expect(positionWithAffinity != null).assertTrue();
        } catch (err) {
        console.info(msg + 'getGlyphPositionAtCoordinate error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testGetWordBoundary
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_013
     * @tc.desc   To test Paragraph GetWordBoundary interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetWordBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testGetWordBoundary"
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      try {
          let range:text.Range = paragraph.getWordBoundary(10);
          expect(range != null).assertTrue();
        } catch (err) {
        console.info(msg + 'getWordBoundary error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testGetLineCount
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_014
     * @tc.desc   To test Paragraph GetLineCount interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetLineCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testGetLineCount"
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      try {
          let linecount = paragraph.getLineCount();
          expect(linecount != null).assertTrue();
        } catch (err) {
        console.info(msg + 'getLineCount error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testGetLineHeight
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_015
     * @tc.desc   To test Paragraph GetLineHeight interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetLineHeight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testGetLineHeight"
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      try {
          let height = paragraph.getLineHeight(1);
          expect(height != null).assertTrue();
        } catch (err) {
        console.info(msg + 'getLineHeight error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testGetLineWidth
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_016
     * @tc.desc   To test Paragraph GetLineWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetLineWidth', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testGetLineWidth"
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      try {
          let width = paragraph.getLineWidth(1);
          expect(width != null).assertTrue();
        } catch (err) {
        console.info(msg + 'getLineWidth error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDidExceedMaxLines
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_017
     * @tc.desc   To test Paragraph DidExceedMaxLines interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDidExceedMaxLines', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testDidExceedMaxLines"
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      try {
          let did = paragraph.didExceedMaxLines();
          expect(did != null).assertTrue();
        } catch (err) {
        console.info(msg + 'didExceedMaxLines error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testTextLine_GetGlyphCount
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_018
     * @tc.desc   test TextLine GlyphCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextLine_GetGlyphCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testText_GetGlyphCount"
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      let textTitle = "123";
      let paragraph: text.Paragraph = buildParagraph();
      paragraph.layoutSync(200);
      paragraph.paint(canvas, 0, 0);
      let textLines: Array<text.TextLine> = paragraph.getTextLines();
      let length = textLines.length;
      for (let i = 0; i < length; i++) {
        let textLine: text.TextLine = textLines[i];
        try {
           expect(textLine.getGlyphCount()).assertEqual(textTitle.length);
           console.info(msg + 'getGlyphCount successed second');
        } catch (err) {
          console.info(msg + 'getGlyphCount error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
      
    })
    /**
     * @tc.name   testTextLine_GetTextRange
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_019
     * @tc.desc   test TextLine GetTextRange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextLine_GetTextRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testTextLine_GetTextRange"
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      let textTitle = "123";
      let paragraph: text.Paragraph = buildParagraph();
      paragraph.layoutSync(200);
      paragraph.paint(canvas, 0, 0);
      let textLines: Array<text.TextLine> = paragraph.getTextLines();
      let length = textLines.length;
      for (let i = 0; i < length; i++) {
        let textLine: text.TextLine = textLines[i];
        try {
           expect(0).assertEqual(textLine.getTextRange().start);
           console.info(msg + 'getTextRange successed second');
        } catch (err) {
          console.info(msg + 'getGlyphCount error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
      
    })
    /**
     * @tc.name   testTextLine_Paint
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_020
     * @tc.desc   test TextLine Paint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextLine_Paint', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testTextLine_Paint"
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      let textTitle = "123";
      let paragraph: text.Paragraph = buildParagraph();
      paragraph.layoutSync(200);
      paragraph.paint(canvas, 0, 0);
      let textLines: Array<text.TextLine> = paragraph.getTextLines();
      let length = textLines.length;
      for (let i = 0; i < length; i++) {
        let textLine: text.TextLine = textLines[i];
        try {
           textLine.paint(canvas,textLine.getTextRange().start, textLine.getTextRange().end);
           console.info(msg + 'paint successed second');
        } catch (err) {
          console.info(msg + 'paint error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   testParagraphBuilder_AonstructorAndAddText
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_021
     * @tc.desc   Constructs a ParagraphBuilder object and calls its methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParagraphBuilder_AonstructorAndAddText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testParagraphBuilder_AonstructorAndAddText"
      console.info(msg + 'begin');
      let myTextStyle: text.TextStyle = {
        color : {alpha: 255, red: 0, green: 0, blue: 255},
        fontSize: 66,
      };

      let myTextStyleTwo: text.TextStyle = {
        color : {alpha: 255, red: 255, green: 0, blue: 0},
        fontSize : 33,
      };
      let myParagraphStyle: text.ParagraphStyle = {
        textStyle : myTextStyle,
        align: 3,
      };
      let myPlaceholderSpan: text.PlaceholderSpan = {
        width: 22,
        height: 33,
        align: text.PlaceholderAlignment.ABOVE_BASELINE,
        baseline: text.TextBaseline.ALPHABETIC,
        baselineOffset: 66
      };
      let fontCollection = new text.FontCollection();
      let paragraphGraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
      try {
        paragraphGraphBuilder.addPlaceholder(myPlaceholderSpan);
        console.info(msg + 'addPlaceholder successed');
      } catch (err) {
        console.info(msg + 'addPlaceholder error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        paragraphGraphBuilder.pushStyle(myTextStyle);
        console.info(msg + 'pushStyle successed');
      } catch (err) {
        console.info(msg + 'first pushStyle error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        paragraphGraphBuilder.addText("123666");
        console.info(msg + 'addText successed first');
      } catch (err) {
        console.info(msg + 'first addText error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        paragraphGraphBuilder.pushStyle(myTextStyleTwo);
        console.info(msg + 'pushStyle successed second');
      } catch (err) {
        console.info(msg + 'second pushStyle error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        paragraphGraphBuilder.popStyle();
        console.info(msg + 'popStyle successed');
      } catch (err) {
        console.info(msg + 'popStyle error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        paragraphGraphBuilder.addText("1235555");
        console.info(msg + 'addText successed first');
      } catch (err) {
        console.info(msg + 'second addText error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        let paragraph = paragraphGraphBuilder.build();
        console.info(msg + 'build successed');
      } catch (err) {
        console.info(msg + 'build error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testTexRun_GetGlyphCount
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_022
     * @tc.desc   To test Run GetGlyphCount interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTexRun_GetGlyphCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = 'testTextRun_GetGlyphCount';
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      let textTitle = "123";
      let paragraph: text.Paragraph = buildParagraph();
      paragraph.layoutSync(200);
      let textLines : Array<text.TextLine> = paragraph.getTextLines();
      let length = textLines.length;
      for(let i = 0 ; i < length ; i++) {
        let textLine: text.TextLine = textLines[i];
        textLine.paint(canvas, 0, (i + 1) * 20);
        let runs: Array<text.Run> = textLine.getGlyphRuns();
        let runslength = runs.length;
        for (let j = 0; j < runslength; j++) {
          let run: text.Run = runs[j];
          try {
            expect(run.getGlyphCount()).assertEqual(3);
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
        }
      }
    })

    /**
     * @tc.name   testTextRun_GetGlyphs
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_023
     * @tc.desc   To test Run GetGlyphs interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextRun_GetGlyphs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = 'testTextRun_GetGlyphs';
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel);
      let textTitle = "123";
      let paragraph: text.Paragraph = buildParagraph();
      let textLines : Array<text.TextLine> = paragraph.getTextLines();
      let length = textLines.length;
      for(let i =0 ; i < length ; i++) {
        let textLine: text.TextLine = textLines[i];
        textLine.paint(canvas, 0, (i + 1) * 20);
        let runs: Array<text.Run> = textLine.getGlyphRuns();
        let runslength = runs.length;
        for (let j = 0; j < runslength; j++) {
          let run: text.Run = runs[j];
          try {
            expect(run.getGlyphs()).assertEqual(3);
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
        }
      }
    })

    /**
     * @tc.name   testTextRun_GetPositions
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_024
     * @tc.desc   To test Run GetPositions interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextRun_GetPositions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = 'testTextRun_GetPositions';
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      let textTitle = "123";
      let paragraph: text.Paragraph = buildParagraph();
      let textLines : Array<text.TextLine> = paragraph.getTextLines();
      let length = textLines.length;
      for(let i =0 ; i < length ; i++) {
        let textLine: text.TextLine = textLines[i];
        textLine.paint(canvas, 0, (i + 1) * 20);
        let runs: Array<text.Run> = textLine.getGlyphRuns();
        let runslength = runs.length;
        for (let j = 0; j < runslength; j++) {
          let run: text.Run = runs[j];
          try {
            expect(run.getPositions().length).assertEqual(3);
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
        }
      }
    })

    /**
     * @tc.name   testTextRun_GetOffsets
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_025
     * @tc.desc   To test Run GetOffsets interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextRun_GetOffsets', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = 'testTextRun_GetOffsets';
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      let textTitle = "123";
      let paragraph: text.Paragraph = buildParagraph();
      let textLines : Array<text.TextLine> = paragraph.getTextLines();
      let length = textLines.length;
      for(let i =0 ; i < length ; i++) {
        let textLine: text.TextLine = textLines[i];
        textLine.paint(canvas, 0, (i + 1) * 20);
        let runs: Array<text.Run> = textLine.getGlyphRuns();
        let runslength = runs.length;
        for (let j = 0; j < runslength; j++) {
          let run: text.Run = runs[j];
          try {
            expect(run.getOffsets().length).assertEqual(3);
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
        }
      }
    })

    /**
     * @tc.name   testTextRun_GetFont
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_026
     * @tc.desc   To test Run GetFont interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextRun_GetFont', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = 'testTextRun_GetFont';
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      let textTitle = "123";
      let paragraph: text.Paragraph = buildParagraph();
      let textLines : Array<text.TextLine> = paragraph.getTextLines();
      let length = textLines.length;
      for(let i =0 ; i < length ; i++) {
        let textLine: text.TextLine = textLines[i];
        textLine.paint(canvas, 0, (i + 1) * 20);
        let runs: Array<text.Run> = textLine.getGlyphRuns();
        let runslength = runs.length;
        for (let j = 0; j < runslength; j++) {
          let run: text.Run = runs[j];
          try {
            run.getFont();
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
        }
      }
    })

    /**
     * @tc.name   testTextRun_Paint
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_027
     * @tc.desc   To test Run Paint interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextRun_Paint', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = 'testTextRun_Paint';
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      let textTitle = "123";
      let paragraph: text.Paragraph = buildParagraph();
      let textLines : Array<text.TextLine> = paragraph.getTextLines();
      let length = textLines.length;
      for(let i =0 ; i < length ; i++) {
        let textLine: text.TextLine = textLines[i];
        let runs: Array<text.Run> = textLine.getGlyphRuns();
        let runslength = runs.length;
        for (let j = 0; j < runslength; j++) {
          let run: text.Run = runs[j];
          try {
            run.paint(canvas, 0, j * 20);
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
        }
      }
    })

    /**
     * @tc.name   testTextRun_GetGlyphs
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_028
     * @tc.desc   To test Run GetGlyphs interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextRun_GetGlyphs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = 'testTextRun_GetGlyphs';
      console.info(msg + 'begin');
      let textTitle = "123";
      let paragraph: text.Paragraph = buildParagraph();
      paragraph.layoutSync(200);
      let textLines : Array<text.TextLine> = paragraph.getTextLines();
      let length = textLines.length;
      for(let i = 0; i < length; i++) {
        let textLine: text.TextLine = textLines[i];
        let runs: Array<text.Run> = textLine.getGlyphRuns();
        let runslength = runs.length;
        for (let j = 0; j < runslength; j++) {
          let run: text.Run = runs[j];
          try {
            expect(run.getGlyphs({start:-1, end:1})).assertEqual(undefined);
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
          try {
            expect(run.getGlyphs({start:-1, end:-20})).assertEqual(undefined);
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
          try {
            expect(run.getGlyphs({start:0, end:1}).length).assertEqual(1);
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
          try {
            expect(run.getGlyphs(null)).assertEqual(undefined);
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
          try {
            expect(run.getGlyphs(undefined)).assertEqual(undefined);
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
          try {
            expect(run.getGlyphs({start:0, end:0}).length).assertEqual(3);
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
        }
      }
    })

    /**
     * @tc.name   testTextRun_GetPositions
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_029
     * @tc.desc   To test Run GetPositions interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextRun_GetPositions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = 'testTextRun_GetPositions';
      console.info(msg + 'begin');
      let textTitle = "123";
      let paragraph: text.Paragraph = buildParagraph();
      paragraph.layoutSync(200);
      let textLines : Array<text.TextLine> = paragraph.getTextLines();
      let length = textLines.length;
      for(let i = 0; i < length; i++) {
        let textLine: text.TextLine = textLines[i];
        let runs: Array<text.Run> = textLine.getGlyphRuns();
        let runslength = runs.length;
        for (let j = 0; j < runslength; j++) {
          let run: text.Run = runs[j];
          try {
              expect(run.getPositions({start:0, end:3}).length).assertEqual(3);
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
          try {
            expect(run.getPositions({start:0, end:30}).length).assertEqual(3);
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
          try {
            expect(run.getPositions({start:0, end:0}).length).assertEqual(3);
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
          try {
            expect(run.getPositions({start:-1, end:-2})).assertEqual(undefined);
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
          try {
            expect(run.getPositions(null)).assertEqual(undefined);
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
          try {
            expect(run.getPositions(undefined)).assertEqual(undefined);
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
        }
      }
    })

    /**
     * @tc.name   testTextRun_getStringIndices
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_030
     * @tc.desc   To test Run getStringIndices interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextRun_getStringIndices', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=>{
      let msg = 'testTextRun_getStringIndices';
      console.info(msg + 'begin');
      let textTitle = "123";
      let paragraph: text.Paragraph = buildParagraph();
      paragraph.layoutSync(200);
      let textLines : Array<text.TextLine> = paragraph.getTextLines();
      let length = textLines.length;
      for(let i = 0; i < length; i++) {
        let textLine: text.TextLine = textLines[i];
        let runs: Array<text.Run> = textLine.getGlyphRuns();
        let runslength = runs.length;
        for (let j = 0; j < runslength; j++) {
          let run: text.Run = runs[j];
          try {
            expect(run.getStringIndices().length).assertEqual(3);
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
          try {
            expect(run.getStringIndices({start:0, end:1}).length).assertEqual(1);
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
          try {
            expect(run.getStringIndices({start:0, end:0}).length).assertEqual(3);
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
          try {
            expect(run.getStringIndices({start:0, end:30}).length).assertEqual(3);
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
          try {
            expect(run.getStringIndices({start:-1, end:-1})).assertEqual(undefined);
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
          try {
            expect(run.getStringIndices(null)).assertEqual(undefined);
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
          try {
            expect(run.getStringIndices(undefined)).assertEqual(undefined);
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
        }
      }
    })

    /**
     * @tc.name   testTextRun_getStringRange
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_031
     * @tc.desc   To test Run getStringRange interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextRun_getStringRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = 'testTextRun_getStringRange';
      console.info(msg + 'begin');
      let textTitle = "123";
      let paragraph: text.Paragraph = buildParagraph();
      paragraph.layoutSync(200);
      let textLines : Array<text.TextLine> = paragraph.getTextLines();
      let length = textLines.length;
      for(let i = 0; i < length; i++) {
        let textLine: text.TextLine = textLines[i];
        let runs: Array<text.Run> = textLine.getGlyphRuns();
        let runslength = runs.length;
        for (let j = 0; j < runslength; j++) {
          let run: text.Run = runs[j];
          try {
            let stringRange:text.Range = run.getStringRange();
            expect(stringRange.start).assertEqual(0);
            expect(stringRange.end).assertEqual(3);
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
        }
      }
    })

    /**
     * @tc.name   testTextRun_getImageBounds
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_032
     * @tc.desc   To test Run getImageBounds interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextRun_getImageBounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = 'testTextRun_getImageBounds';
      console.info(msg + 'begin');
      let textTitle = "123";
      let paragraph: text.Paragraph = buildParagraph();
      paragraph.layoutSync(200);
      let textLines : Array<text.TextLine> = paragraph.getTextLines();
      let length = textLines.length;
      for(let i = 0; i < length; i++) {
        let textLine: text.TextLine = textLines[i];
        let runs: Array<text.Run> = textLine.getGlyphRuns();
        let runslength = runs.length;
        for (let j = 0; j < runslength; j++) {
          let run: text.Run = runs[j];
          let bounds:common2D.Rect = run.getImageBounds();
          try {
            expect(bounds.right > bounds.left).assertTrue();
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
          try {
            expect(bounds.bottom > bounds.top).assertTrue();
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
        }
      }
    })

    /**
     * @tc.name   testTextRun_getTypographicBounds
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_033
     * @tc.desc   To test Run getTypographicBounds interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextRun_getTypographicBounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = 'testTextRun_getTypographicBounds';
      console.info(msg + 'begin');
      let textTitle = "123";
      let paragraph: text.Paragraph = buildParagraph();
      paragraph.layoutSync(200);
      let textLines : Array<text.TextLine> = paragraph.getTextLines();
      let length = textLines.length;
      for(let i = 0; i < length; i++) {
        let textLine: text.TextLine = textLines[i];
        let runs: Array<text.Run> = textLine.getGlyphRuns();
        let runslength = runs.length;
        for (let j = 0; j < runslength; j++) {
          let run: text.Run = runs[j];
          let bounds:text.TypographicBounds = run.getTypographicBounds();
          try {
            expect(bounds.ascent < 0).assertTrue();
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
          try {
            expect(bounds.descent > 0).assertTrue();
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
          try {
            expect(bounds.leading >= 0).assertTrue();
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
          try {
            expect(bounds.width > 0).assertTrue();
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
        }
      }
    })

    /**
     * @tc.name   testlayoutByPromise_1
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_0034
     * @tc.desc   To test Paragraph layoutAsync interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testlayoutByPromise_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testlayoutByPromise_1 "
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      await paragraph.layout(100).then((data) => {
        console.log(msg + `layout success !  ${JSON.stringify(data)}`);
      }).catch((error: BusinessError) => {
        console.log(msg + `layout failed ! error: ${JSON.stringify(error, ['code', 'message'])}`);
        expect(false).assertTrue();
      });
    })

    /**
     * @tc.name   testlayoutByPromise_2
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_0035
     * @tc.desc   To test Paragraph layoutAsync interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testlayoutByPromise_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testlayoutByPromise_2 "
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      await paragraph.layout(-100).then((data) => {
        console.log(msg + `layout success !  ${JSON.stringify(data)}`);
        expect(false).assertTrue();
      }).catch((error: BusinessError) => {
        console.log(msg + `layout failed ! error: ${JSON.stringify(error, ['code', 'message'])}`);
        expect(error.code).assertEqual(401);
      });
    })

    /**
     * @tc.name   testlayoutByPromise_3
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_0036
     * @tc.desc   To test Paragraph layoutAsync interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testlayoutByPromise_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testlayoutByPromise_3 "
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      await paragraph.layout(null).then((data) => {
        console.log(msg + `layout success !  ${JSON.stringify(data)}`);
        expect(false).assertTrue();
      }).catch((error: BusinessError) => {
        console.log(msg + `layout failed ! error: ${JSON.stringify(error, ['code', 'message'])}`);
        expect(error.code).assertEqual(401);
      });
    })

    /**
     * @tc.name   testlayoutByPromise_4
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_0037
     * @tc.desc   To test Paragraph layoutAsync interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testlayoutByPromise_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testlayoutByPromise_4 "
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      await paragraph.layout(undefined).then((data) => {
        console.info(msg + `layout success !  ${JSON.stringify(data)}`);
        expect(false).assertTrue();
      }).catch((error: BusinessError) => {
        console.error(msg + `layout failed ! error: ${JSON.stringify(error, ['code', 'message'])}`);
        expect(error.code).assertEqual(401);
      });
    })

    /**
     * @tc.name   testlayoutByPromise_5
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_0038
     * @tc.desc   To test Paragraph layoutAsync interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testlayoutByPromise_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testlayoutByPromise_5 "
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      await paragraph.layout(110.05).then((data) => {
        console.log(msg + `layout success !  ${JSON.stringify(data)}`);
      }).catch((error: BusinessError) => {
        console.log(msg + `layout failed ! error: ${JSON.stringify(error, ['code', 'message'])}`);
        expect(false).assertTrue();
      });
    })

    /**
     * @tc.name   testlayoutByPromise_6
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_0039
     * @tc.desc   To test Paragraph layoutAsync interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testlayoutByPromise_6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testlayoutByPromise_6 "
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      await paragraph.layout(Number.MAX_VALUE).then((data) => {
        console.log(msg + `layout success !  ${JSON.stringify(data)}`);
      }).catch((error: BusinessError) => {
        console.log(msg + `layout failed ! error: ${JSON.stringify(error, ['code', 'message'])}`);
        expect(false).assertTrue();
      });
    })

    /**
     * @tc.name   testlayoutByPromise_7
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_0040
     * @tc.desc   To test Paragraph layoutAsync interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testlayoutByPromise_7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testlayoutByPromise_7 "
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      await paragraph.layout(Number.MIN_VALUE).then((data) => {
        console.log(msg + `layout success !  ${JSON.stringify(data)}`);
      }).catch((error: BusinessError) => {
        console.log(msg + `layout failed ! error: ${JSON.stringify(error, ['code', 'message'])}`);
        expect(false).assertTrue();
      });
    })

    /**
     * @tc.name   testlayoutByPromise_8
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_0041
     * @tc.desc   To test Paragraph layoutAsync interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testlayoutByPromise_8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testlayoutByPromise_8 "
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      await paragraph.layout(Number.MAX_SAFE_INTEGER).then((data) => {
        console.log(msg + `layout success !  ${JSON.stringify(data)}`);
      }).catch((error: BusinessError) => {
        console.log(msg + `layout failed ! error: ${JSON.stringify(error, ['code', 'message'])}`);
        expect(false).assertTrue();
      });
    })

    /**
     * @tc.name   testlayoutByPromise_9
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_0042
     * @tc.desc   To test Paragraph layoutAsync interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testlayoutByPromise_9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testlayoutByPromise_9 "
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      await paragraph.layout(Number.MIN_SAFE_INTEGER).then((data) => {
        console.log(msg + `layout success !  ${JSON.stringify(data)}`);
        expect(false).assertTrue();
      }).catch((error: BusinessError) => {
        console.error(msg + `layout failed ! error: ${JSON.stringify(error, ['code', 'message'])}`);
        expect(error.code).assertEqual(401);
      });
    })

    /**
     * @tc.name   testLineTypeset_BuildLineTypeset_1
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_043
     * @tc.desc   Constructs a LineTypeset object test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLineTypeset_BuildLineTypeset_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testParagraphBuilder_BuildLineTypeset_1"
      console.info(msg + 'begin');
      let textStyle: text.TextStyle = {
        color : {alpha: 255, red: 0, green: 0, blue: 255},
        fontSize: 66,
      };
      let paragraphStyle: text.ParagraphStyle = {
        textStyle : textStyle,
        align: 3,
      };
      let fontCollection = new text.FontCollection();
      let paragraphGraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
      let str : string = "123456";
      try {
        paragraphGraphBuilder.addText(str);
        console.info(msg + 'addText successed first');
      } catch (err) {
        console.info(msg + 'second addText error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        let lineTypeset = paragraphGraphBuilder.buildLineTypeset();
        console.info(msg + 'build LineTypeset successed');
        try {
          let count = lineTypeset.getLineBreak(0, 800);
          if (count != str.length) {
            console.info(msg + 'getLineBreak return error value');
            expect().assertFail();
          }
        } catch (err) {
          console.info(msg + 'getLineBreak error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          lineTypeset.createLine(0, str.length);
        } catch (err) {
          console.info(msg + 'build LineTypeset error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      } catch (err) {
        console.info(msg + 'build LineTypeset error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLineTypeset_BuildLineTypeset_2
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_044
     * @tc.desc   getLineBreak interface abnormal parameter test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLineTypeset_BuildLineTypeset_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testParagraphBuilder_BuildLineTypeset_2"
      console.info(msg + 'begin');
      let textStyle: text.TextStyle = {
        color : {alpha: 255, red: 0, green: 0, blue: 255},
        fontSize: 66,
      };
      let paragraphStyle: text.ParagraphStyle = {
        textStyle : textStyle,
        align: 3,
      };
      let fontCollection = new text.FontCollection();
      let paragraphGraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
      let str : string = "123456";
      try {
        paragraphGraphBuilder.addText(str);
        console.info(msg + 'addText successed first');
      } catch (err) {
        console.info(msg + 'second addText error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      let lineTypeset = paragraphGraphBuilder.buildLineTypeset();
      console.info(msg + 'build LineTypeset successed');
      try {
        let count = lineTypeset.getLineBreak(null, 800);
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'getLineBreak error cause: ' + JSON.stringify(err));
        expect().not().assertFail();
      }

      try {
        let count = lineTypeset.getLineBreak(undefined, 800);
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'getLineBreak error cause: ' + JSON.stringify(err));
        expect().not().assertFail();
      }
    })

    /**
     * @tc.name   testLineTypeset_BuildLineTypeset_3
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_045
     * @tc.desc   getLineBreak interface parameter test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLineTypeset_BuildLineTypeset_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testParagraphBuilder_BuildLineTypeset_3"
      console.info(msg + 'begin');
      let textStyle: text.TextStyle = {
        color : {alpha: 255, red: 0, green: 0, blue: 255},
        fontSize: 66,
      };
      let paragraphStyle: text.ParagraphStyle = {
        textStyle : textStyle,
        align: 3,
      };
      let fontCollection = new text.FontCollection();
      let paragraphGraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
      let str : string = "123456";
      try {
        paragraphGraphBuilder.addText(str);
        console.info(msg + 'addText successed first');
      } catch (err) {
        console.info(msg + 'second addText error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      let lineTypeset = paragraphGraphBuilder.buildLineTypeset();
      console.info(msg + 'build LineTypeset successed');
      try {
        let count = lineTypeset.getLineBreak(-10, 800);
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'getLineBreak error cause: ' + JSON.stringify(err));
        expect().not().assertFail();
      }

      try {
        let count = lineTypeset.getLineBreak(0, -10);
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'getLineBreak error cause: ' + JSON.stringify(err));
        expect().not().assertFail();
      }

      try {
        let count = lineTypeset.getLineBreak(Number.MIN_VALUE, Number.MAX_VALUE);
        expect(count).assertEqual(str.length);
      } catch (err) {
        console.info(msg + 'getLineBreak error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }

      try {
        let count = lineTypeset.getLineBreak(Number.MAX_VALUE, Number.MIN_VALUE);
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'getLineBreak error cause: ' + JSON.stringify(err));
        expect().not().assertFail();
      }

      try {
        let count = lineTypeset.getLineBreak(1.23, Number.MAX_VALUE);
        expect(count).assertEqual(str.length - 1);
      } catch (err) {
        console.info(msg + 'getLineBreak error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLineTypeset_BuildLineTypeset_4
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_046
     * @tc.desc   getLineBreak interface parameter test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLineTypeset_BuildLineTypeset_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testParagraphBuilder_BuildLineTypeset_4"
      console.info(msg + 'begin');
      let textStyle: text.TextStyle = {
        color : {alpha: 255, red: 0, green: 0, blue: 255},
        fontSize: 66,
      };
      let paragraphStyle: text.ParagraphStyle = {
        textStyle : textStyle,
        align: 3,
      };
      let fontCollection = new text.FontCollection();
      let paragraphGraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
      let str : string = "123456";
      try {
        paragraphGraphBuilder.addText(str);
        console.info(msg + 'addText successed first');
      } catch (err) {
        console.info(msg + 'second addText error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      let lineTypeset = paragraphGraphBuilder.buildLineTypeset();
      console.info(msg + 'build LineTypeset successed');
      try {
        let count = lineTypeset.getLineBreak(0, display.getDefaultDisplaySync().width);
        expect(count).assertEqual(str.length);
      } catch (err) {
        console.info(msg + 'getLineBreak error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }

      try {
        let count = lineTypeset.getLineBreak(3, display.getDefaultDisplaySync().width);
        expect(count).assertEqual(str.length - 3);
      } catch (err) {
        console.info(msg + 'getLineBreak error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLineTypeset_BuildLineTypeset_5
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_047
     * @tc.desc   getLineBreak interface parameter test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLineTypeset_BuildLineTypeset_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testLineTypeset_BuildLineTypeset_5"
      console.info(msg + 'begin');
      let textStyle: text.TextStyle = {
        color : {alpha: 255, red: 0, green: 0, blue: 255},
        fontSize: 66,
      };
      let paragraphStyle: text.ParagraphStyle = {
        textStyle : textStyle,
        align: 3,
      };
      let fontCollection = new text.FontCollection();
      let paragraphGraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
      let str : string = "123456";
      try {
        paragraphGraphBuilder.addText(str);
        console.info(msg + 'addText successed first');
      } catch (err) {
        console.info(msg + 'second addText error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      let lineTypeset = paragraphGraphBuilder.buildLineTypeset();
      console.info(msg + 'build LineTypeset successed');
      try {
        let count = lineTypeset.getLineBreak(0, null);
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'getLineBreak error cause: ' + JSON.stringify(err));
        expect().not().assertFail();
      }

      try {
        let count = lineTypeset.getLineBreak(0, undefined);
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'getLineBreak error cause: ' + JSON.stringify(err));
        expect().not().assertFail();
      }
    })

    /**
     * @tc.name   testLineTypeset_BuildLineTypeset_6
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_048
     * @tc.desc   Constructs a LineTypeset object test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLineTypeset_BuildLineTypeset_6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testLineTypeset_BuildLineTypeset_6"
      console.info(msg + 'begin');
      let textStyle: text.TextStyle = {
        color : {alpha: 255, red: 0, green: 0, blue: 255},
        fontSize: 66,
      };
      let paragraphStyle: text.ParagraphStyle = {
        textStyle : textStyle,
        align: 3,
      };
      let fontCollection = new text.FontCollection();
      let paragraphGraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
      let str : string = "123456";
      try {
        paragraphGraphBuilder.addText(str);
        console.info(msg + 'addText successed first');
      } catch (err) {
        console.info(msg + 'second addText error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      let lineTypeset = paragraphGraphBuilder.buildLineTypeset();
      console.info(msg + 'build LineTypeset successed');
      try {
        let line = lineTypeset.createLine(0, str.length);
        expect(6).assertEqual(line.getGlyphCount());
      } catch (err) {
        console.info(msg + 'getLineBreak error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }

      try {
        let line = lineTypeset.createLine(1, 5);
        expect(5).assertEqual(line.getGlyphCount());
      } catch (err) {
        console.info(msg + 'getLineBreak error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLineTypeset_BuildLineTypeset_7
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_049
     * @tc.desc   createLine interface parameter test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLineTypeset_BuildLineTypeset_7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testLineTypeset_BuildLineTypeset_7"
      console.info(msg + 'begin');
      let textStyle: text.TextStyle = {
        color : {alpha: 255, red: 0, green: 0, blue: 255},
        fontSize: 66,
      };
      let paragraphStyle: text.ParagraphStyle = {
        textStyle : textStyle,
        align: 3,
      };
      let fontCollection = new text.FontCollection();
      let paragraphGraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
      let str : string = "123456";
      try {
        paragraphGraphBuilder.addText(str);
        console.info(msg + 'addText successed first');
      } catch (err) {
        console.info(msg + 'second addText error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      let lineTypeset = paragraphGraphBuilder.buildLineTypeset();
      console.info(msg + 'build LineTypeset successed');
      try {
        lineTypeset.createLine(-10, str.length);
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'getLineBreak error cause: ' + JSON.stringify(err));
        expect().not().assertFail();
      }

      try {
        lineTypeset.createLine(0, -10);
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'getLineBreak error cause: ' + JSON.stringify(err));
        expect().not().assertFail();
      }

      try {
        let line = lineTypeset.createLine(Number.MIN_VALUE, Number.MAX_VALUE);
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'getLineBreak error cause: ' + JSON.stringify(err));
        expect().not().assertFail();
      }

      try {
        let line = lineTypeset.createLine(Number.MAX_VALUE, Number.MIN_VALUE);
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'getLineBreak error cause: ' + JSON.stringify(err));
        expect().not().assertFail();
      }

      try {
        let line = lineTypeset.createLine(1.23, str.length);
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'getLineBreak error cause: ' + JSON.stringify(err));
        expect().not().assertFail();
      }
    })

    /**
     * @tc.name   testLineTypeset_BuildLineTypeset_8
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_050
     * @tc.desc   createLine interface parameter test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLineTypeset_BuildLineTypeset_8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = "testLineTypeset_BuildLineTypeset_7"
      console.info(msg + 'begin');
      let textStyle: text.TextStyle = {
        color : {alpha: 255, red: 0, green: 0, blue: 255},
        fontSize: 66,
      };
      let paragraphStyle: text.ParagraphStyle = {
        textStyle : textStyle,
        align: 3,
      };
      let fontCollection = new text.FontCollection();
      let paragraphGraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
      let str : string = "123456";
      try {
        paragraphGraphBuilder.addText(str);
        console.info(msg + 'addText successed first');
      } catch (err) {
        console.info(msg + 'second addText error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      let lineTypeset = paragraphGraphBuilder.buildLineTypeset();
      console.info(msg + 'build LineTypeset successed');
      try {
        lineTypeset.createLine(null, str.length);
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'getLineBreak error cause: ' + JSON.stringify(err));
        expect().not().assertFail();
      }

      try {
        lineTypeset.createLine(undefined, str.length);
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'getLineBreak error cause: ' + JSON.stringify(err));
        expect().not().assertFail();
      }

      try {
        lineTypeset.createLine(0, null);
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'getLineBreak error cause: ' + JSON.stringify(err));
        expect().not().assertFail();
      }

      try {
        lineTypeset.createLine(0, undefined);
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'getLineBreak error cause: ' + JSON.stringify(err));
        expect().not().assertFail();
      }
    })

    /**
     * @tc.name   testTextLine_CreateTruncatedLine
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_051
     * @tc.desc   To test Line CreateTruncatedLine interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextLine_CreateTruncatedLine', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = 'testTextLine_CreateTruncatedLine';
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      let textTitle = "123";
      let paragraph: text.Paragraph = buildParagraph();
      paragraph.layoutSync(200);
      let textLines : Array<text.TextLine> = paragraph.getTextLines();
      let length = textLines.length;
      for (let i = 0; i < length; i++) {
        let textLine: text.TextLine = textLines[i];

        let truncatedTextLine = textLine.createTruncatedLine(100, text.EllipsisMode.START, "...");
        try {
          truncatedTextLine.paint(canvas, 0, 100);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        truncatedTextLine = textLine.createTruncatedLine(50, text.EllipsisMode.END, "...");
        try {
          truncatedTextLine.paint(canvas, 0, 100);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        truncatedTextLine = textLine.createTruncatedLine(50, text.EllipsisMode.MIDDLE, "...");
        try {
          expect(truncatedTextLine).assertEqual(undefined);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        truncatedTextLine = textLine.createTruncatedLine(-50, text.EllipsisMode.END, "...");
        try {
          expect(truncatedTextLine).assertEqual(undefined);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        truncatedTextLine = textLine.createTruncatedLine(null, text.EllipsisMode.START, "...");
        try {
          expect(truncatedTextLine).assertEqual(undefined);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        truncatedTextLine = textLine.createTruncatedLine(100, null, "...");
        try {
          expect(truncatedTextLine).assertEqual(undefined);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        truncatedTextLine = textLine.createTruncatedLine(100, text.EllipsisMode.START, null);
        try {
          expect(truncatedTextLine).assertEqual(undefined);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        truncatedTextLine = textLine.createTruncatedLine(undefined, text.EllipsisMode.END, "...");
        try {
          expect(truncatedTextLine).assertEqual(undefined);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        truncatedTextLine = textLine.createTruncatedLine(100, undefined, "...");
        try {
          expect(truncatedTextLine).assertEqual(undefined);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        truncatedTextLine = textLine.createTruncatedLine(100, text.EllipsisMode.START, undefined);
        try {
          expect(truncatedTextLine).assertEqual(undefined);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   testTextLine_GetTypographicBounds
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_052
     * @tc.desc   To test Line GetTypographicBounds interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextLine_GetTypographicBounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = 'testTextLine_GetTypographicBounds';
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      let textTitle = "123";
      let paragraph: text.Paragraph = buildParagraph();
      paragraph.layoutSync(200);
      let textLines : Array<text.TextLine> = paragraph.getTextLines();
      let length = textLines.length;
      for (let i = 0; i < length; i++) {
        let textLine: text.TextLine = textLines[i];

        let bounds = textLine.getTypographicBounds();
        try {
          expect(bounds.ascent < 0).assertTrue();
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          expect(bounds.descent).assertLargerOrEqual(0);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          expect(bounds.leading).assertLargerOrEqual(0);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          expect(bounds.width).assertLarger(0);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   testTextLine_GetImageBounds
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_053
     * @tc.desc   To test Line GetImageBounds interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextLine_GetImageBounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = 'testTextLine_GetImageBounds';
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      let textTitle = "123";
      let paragraph: text.Paragraph = buildParagraph();
      paragraph.layoutSync(200);
      let textLines : Array<text.TextLine> = paragraph.getTextLines();
      let length = textLines.length;
      for (let i = 0; i < length; i++) {
        let textLine: text.TextLine = textLines[i];

        let bounds = textLine.getImageBounds();
        try {
          expect(bounds.left).assertLargerOrEqual(0);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          expect(bounds.top).assertLargerOrEqual(0);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          expect(bounds.right).assertLarger(bounds.left);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          expect(bounds.bottom).assertLarger(bounds.top);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   testTextLine_GetTrailingSpaceWidth
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_054
     * @tc.desc   To test Line GetTrailingSpaceWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextLine_GetTrailingSpaceWidth', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = 'testTextLine_GetTrailingSpaceWidth';
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      let textTitle = "123";
      let paragraph: text.Paragraph = buildParagraph();
      paragraph.layoutSync(200);
      let textLines : Array<text.TextLine> = paragraph.getTextLines();
      let length = textLines.length;
      for (let i = 0; i < length; i++) {
        let textLine: text.TextLine = textLines[i];

        let width = textLine.getTrailingSpaceWidth();
        try {
          expect(width).assertEqual(0);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   testTextLine_GetStringIndexForPosition
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_055
     * @tc.desc   To test Line GetStringIndexForPosition interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextLine_GetStringIndexForPosition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = 'testTextLine_GetStringIndexForPosition';
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      let textTitle = "123";
      let paragraph: text.Paragraph = buildParagraph();
      paragraph.layoutSync(200);
      let textLines : Array<text.TextLine> = paragraph.getTextLines();
      let length = textLines.length;
      for (let i = 0; i < length; i++) {
        let textLine: text.TextLine = textLines[i];

        let point : common2D.Point = { x: 0.0, y: 2.0 };
        let index = textLine.getStringIndexForPosition(point);
        try {
          expect(index).assertEqual(0.0);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        point.x = 20.0;
        index = textLine.getStringIndexForPosition(point);
        try {
          expect(index).assertEqual(2);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        point.x = -2.0;
        index = textLine.getStringIndexForPosition(point);
        try {
          expect(index).assertEqual(0.0);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        index = textLine.getStringIndexForPosition(null);
        try {
          expect(index).assertEqual(undefined);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        index = textLine.getStringIndexForPosition(undefined);
        try {
          expect(index).assertEqual(undefined);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   testTextLine_GetOffsetForStringIndex
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_056
     * @tc.desc   To test Line GetOffsetForStringIndex interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextLine_GetOffsetForStringIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = 'testTextLine_GetOffsetForStringIndex';
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      let textTitle = "123";
      let paragraph: text.Paragraph = buildParagraph();
      paragraph.layoutSync(200);
      let textLines : Array<text.TextLine> = paragraph.getTextLines();
      let length = textLines.length;
      for (let i = 0; i < length; i++) {
        let textLine: text.TextLine = textLines[i];

        let offset = textLine.getOffsetForStringIndex(0);
        try {
          expect(offset).assertEqual(0.0);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        offset = textLine.getOffsetForStringIndex(1);
        try {
          expect(offset).assertEqual(12);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        offset = textLine.getOffsetForStringIndex(-2);
        try {
          expect(offset).assertEqual(0.0);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        offset = textLine.getOffsetForStringIndex(null);
        try {
          expect(offset).assertEqual(undefined);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        offset = textLine.getOffsetForStringIndex(undefined);
        try {
          expect(offset).assertEqual(undefined);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   testTextLine_EnumerateCaretOffsets
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_057
     * @tc.desc   To test Line EnumerateCaretOffsets interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextLine_EnumerateCaretOffsets', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = 'testTextLine_EnumerateCaretOffsets';
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      let textTitle = "123";
      let paragraph: text.Paragraph = buildParagraph();
      paragraph.layoutSync(200);
      let textLines : Array<text.TextLine> = paragraph.getTextLines();
      let length = textLines.length;
      for (let i = 0; i < length; i++) {
        let textLine: text.TextLine = textLines[i];

        textLine.enumerateCaretOffsets((offset: number, index: number, leadingEdge: boolean) : boolean => {
          try {
            expect(index).assertLessOrEqual(1);
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
          try {
            if (index == 0 && leadingEdge == true) {
              expect(offset).assertEqual(0.0);
            }

            if (offset == 12 && index == 0) {
              expect(leadingEdge).assertEqual(false);
            }
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
          return index > 0;
        });
        try {
          textLine.enumerateCaretOffsets(null);
        } catch (err) {
          try {
            expect(err.message).assertEqual("Invalid params.");
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
        }
        try {
          textLine.enumerateCaretOffsets(undefined);
        } catch (err) {
          try {
            expect(err.message).assertEqual("Invalid params.");
          } catch (err) {
            console.info(msg + JSON.stringify(err));
            expect().assertFail();
          }
        }
      }
    })

    /**
     * @tc.name   testTextLine_GetAlignmentOffset
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_058
     * @tc.desc   To test Line GetAlignmentOffset interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextLine_GetAlignmentOffset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ()=> {
      let msg = 'testTextLine_GetAlignmentOffset';
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      let textTitle = "123";
      let paragraph: text.Paragraph = buildParagraph();
      paragraph.layoutSync(200);
      let textLines : Array<text.TextLine> = paragraph.getTextLines();
      let length = textLines.length;
      for (let i = 0; i < length; i++) {
        let textLine: text.TextLine = textLines[i];

        let offset = textLine.getAlignmentOffset(0.0, 300);
        try {
          expect(offset).assertEqual(0.0);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        offset = textLine.getAlignmentOffset(0.5, 300);
        try {
          expect(offset).assertLarger(0.0);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        offset = textLine.getAlignmentOffset(2, 10);
        try {
          expect(offset).assertEqual(0.0);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        offset = textLine.getAlignmentOffset(-2, 300);
        try {
          expect(offset).assertEqual(0.0);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        offset = textLine.getAlignmentOffset(null, 20);
        try {
          expect(offset).assertEqual(undefined);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        offset = textLine.getAlignmentOffset(2.0, null);
        try {
          expect(offset).assertEqual(undefined);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        offset = textLine.getAlignmentOffset(2.0, undefined);
        try {
          expect(offset).assertEqual(undefined);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
        offset = textLine.getAlignmentOffset(null, 20);
        try {
          expect(offset).assertEqual(undefined);
        } catch (err) {
          console.info(msg + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
  })
}