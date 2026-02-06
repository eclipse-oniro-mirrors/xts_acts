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
import image from "@ohos.multimedia.image";
import drawing from "@ohos.graphics.drawing";
import { buildParagraph } from '../model/Utils';
import common2D from '@ohos.graphics.common2D';

export default function GraphicTextClass() {

  describe('GraphicTextClass', () => {
    let pixel: image.PixelMap | undefined;
    let myColor: common2D.Color | undefined;
    beforeAll(async () => {
      myColor = { alpha: 255, red: 255, green: 0, blue: 0 };
      const color: ArrayBuffer = new ArrayBuffer(40000);
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: {
          height: 100, width: 100//100为创建的PixelMap的宽高
        }
      }
      pixel = image.createPixelMapSync(color, opts);
    })

    /**
     * @tc.name   testLayoutSyncStatic
     * @tc.number testLayoutSyncStatic
     * @tc.desc   To test Paragraph layoutSyncSync interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLayoutSyncStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let msg = "testLayoutSync"
      console.info(msg + 'begin');
      let paragraph: text.Paragraph = buildParagraph();
      try {
        paragraph.layoutSync(100);
      } catch (err) {
        console.info(msg + 'layoutSync error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testPaintStatic_02
     * @tc.number testPaintStatic_02
     * @tc.desc   To test Paragraph Paint interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPaintStatic_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const msg = 'testCanvasConstructorNormalStatic';
        let canvas = new drawing.Canvas(pixel!)
        expect(true).assertTrue();
        let paragraph: text.Paragraph = buildParagraph();
        try {
          paragraph.paint(canvas, 10, 10);
          console.info(msg + 'canvasConstructor successed');
          expect(true).assertTrue();
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + `canvasConstructor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
        done();
    })

    /**
     * @tc.name   testPaintOnPathStatic_02
     * @tc.number testPaintOnPathStatic_02
     * @tc.desc   To test Paragraph Paint interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPaintOnPathStatic_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const msg = 'testCanvasConstructorNormalStatic';
        let canvas = new drawing.Canvas(pixel!)
        expect(true).assertTrue();
        let paragraph: text.Paragraph = buildParagraph();
        let path = new drawing.Path();
        try {
          paragraph.paintOnPath(canvas, path, 0, 0);
          console.info(msg + 'canvasConstructor successed');
          expect(true).assertTrue();
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + `canvasConstructor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testParagraphBuilder_AonstructorAndAddTextStatic
     * @tc.number testParagraphBuilder_AonstructorAndAddTextStatic
     * @tc.desc   Constructs a ParagraphBuilder object and calls its methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParagraphBuilder_AonstructorAndAddTextStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let msg = "testParagraphBuilder_AonstructorAndAddText"
      console.info(msg + 'begin');
      let myTextStyle: text.TextStyle = {
        color : myColor!,
        fontSize: 66,
      };

      let myTextStyleTwo: text.TextStyle = {
        color : myColor!,
        fontSize : 33,
      };
      let myParagraphStyle: text.ParagraphStyle = {
        textStyle : myTextStyle,
        align: text.TextAlign.JUSTIFY,
      };
      let fontCollection = new text.FontCollection();
      let paragraphGraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
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
      done();
    })

    /**
     * @tc.name   testGetLongestLineStatic_01
     * @tc.number testGetLongestLineStatic_01
     * @tc.desc   To test Paragraph GetLongestLine interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetLongestLineStatic_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
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
      done();
    })

    /**
     * @tc.name   testPlaceholderSpanStatic
     * @tc.number testPlaceholderSpanStatic
     * @tc.desc   test for PlaceholderSpan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPlaceholderSpanStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let msg = "testPlaceholderSpanStatic"
      console.info(msg + 'begin');
      let myTextStyle: text.TextStyle = {
        color: {
          alpha: 255,
          red: 0,
          green: 0,
          blue: 255
        },
        fontSize: 66,
      };
      let myParagraphStyle: text.ParagraphStyle = {
        textStyle: myTextStyle,
        align: text.TextAlign.JUSTIFY,
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
      paragraphGraphBuilder.addPlaceholder(myPlaceholderSpan);
      paragraphGraphBuilder.addText("123456789验证文字相关123456789验证文字相关12345678");
      let paragraph = paragraphGraphBuilder.build();
      paragraph.layoutSync(200);
      let ideographicBaseline = paragraph.getIdeographicBaseline();
      let wordRange = paragraph.getWordBoundary(1);
      let lineCount = paragraph.getLineCount();
      let lineHeight = paragraph.getLineHeight(1);
      let lineWidth = paragraph.getLineWidth(1);
      let didExceed = paragraph.didExceedMaxLines();
      let rang = paragraph.getActualTextRange(1, true);
      let placeholderRects = paragraph.getRectsForPlaceholders();
      console.info('www data paragraph ideographicBaseline ', ideographicBaseline);
      console.info('www data paragraph wordRange ', wordRange.start, wordRange.end);
      console.info('www data paragraph lineCount ', lineCount);
      console.info('www data paragraph lineHeight ', lineHeight);
      console.info('www data paragraph lineWidth ', lineWidth);
      console.info('www data paragraph didExceed ', didExceed);
      console.info('www data paragraph rang ', rang);
      console.info('www data paragraph placeholderRects ', placeholderRects);
      expect(Math.floor(ideographicBaseline)).assertEqual(77);
      expect(wordRange.start).assertEqual(1);
      expect(wordRange.end).assertEqual(10);
    })

    /**
     * @tc.name   testLineTypesetStatic
     * @tc.number testLineTypesetStatic
     * @tc.desc   test for LineTypeset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLineTypesetStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let msg = "testLineTypesetStatic"
      console.info(msg + 'begin');
      let myTextStyle: text.TextStyle = {
        color: {
          alpha: 255,
          red: 0,
          green: 0,
          blue: 255
        },
        fontSize: 66,
      };
      let myParagraphStyle: text.ParagraphStyle = {
        textStyle: myTextStyle,
        align: text.TextAlign.JUSTIFY,
      };
      let fontCollection = new text.FontCollection();
      let paragraphGraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
      paragraphGraphBuilder.addText("123456789验证文字相关123456789验证文字相关12345678");
      let lineTypeset = paragraphGraphBuilder.buildLineTypeset();
      let startIndex = 0;
      let width = 100.0;
      let count = lineTypeset.getLineBreak(startIndex, width);
      let lineObj: text.TextLine = lineTypeset.createLine(startIndex, count);
      console.info('www data LineTypeset count ', count);
      console.info('www data LineTypeset line ', lineObj);
      expect(count).assertEqual(2);
      expect(lineObj !== undefined).assertTrue();
    })

    /**
     * @tc.name   testLayoutStatic
     * @tc.number testLayoutStatic
     * @tc.desc   test for Layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLayoutStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let msg = "testLayoutStatic"
      console.info(msg + 'begin');
      let myTextStyle: text.TextStyle = {
        color: {
          alpha: 255,
          red: 0,
          green: 0,
          blue: 255
        },
        fontSize: 66,
      };
      let myParagraphStyle: text.ParagraphStyle = {
        textStyle: myTextStyle,
        align: text.TextAlign.JUSTIFY,
      };
      let fontCollection = new text.FontCollection();
      let paragraphGraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
      paragraphGraphBuilder.addText("123456789验证文字相关123456789验证文字相关12345678");
      let paragraph = paragraphGraphBuilder.build();
      paragraph.layout(200);
      expect(paragraph !== undefined).assertTrue();
    })

    /**
     * @tc.name   testAddSymbolStatic
     * @tc.number testAddSymbolStatic
     * @tc.desc   test for addSymbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddSymbolStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let msg = "testAddSymbolStatic"
        console.info(msg + 'begin');
        let myTextStyle: text.TextStyle = {
          color: {
            alpha: 255,
            red: 0,
            green: 0,
            blue: 255
          },
          fontSize: 66,
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          align: text.TextAlign.JUSTIFY,
        };
        let fontCollection = new text.FontCollection();
        let paragraphGraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        paragraphGraphBuilder.addSymbol(0xF0000);
        paragraphGraphBuilder.addText("123456789验证文字相关123456789验证文字相关12345678");
        let paragraph = paragraphGraphBuilder.build();
        paragraph.layoutSync(200);
        expect(paragraph !== undefined).assertTrue();
        done();
      })

    /**
     * @tc.name   testGetFullNameStatic
     * @tc.number testGetFullNameStatic
     * @tc.desc   test for Layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetFullNameStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        let msg = "www data testGetFullNameStatic "
        console.info(msg + 'www data begin');
        let fontType: text.SystemFontType = text.SystemFontType.GENERIC;
        console.info(msg + 111);
        try {
          let fullNames = await text.getSystemFontFullNamesByType(fontType);
          console.info(msg + JSON.stringify(fullNames))
          expect(fullNames !== undefined).assertTrue();
          expect(fullNames.length > 0).assertTrue();
        } catch (err){
          console.info(msg + err);
        }
        try {
          let fontDescriptor = await text.getFontDescriptorByFullName("HarmonyOS Sans", fontType);
          console.info(msg + JSON.stringify(fontDescriptor))
          expect(fontDescriptor !== undefined).assertTrue();
          expect(Object.keys(fontDescriptor).length > 0).assertTrue();
          console.info('www data 00000 ', Object.keys(fontDescriptor).length)
        } catch (err){
          console.info(msg + err);
        }
        try {
          let fontDescriptors = await text.matchFontDescriptors({
            weight: text.FontWeight.W400,
          })
          console.info(msg + JSON.stringify(fontDescriptors))
          expect(fontDescriptors !== undefined).assertTrue();
          expect(fontDescriptors.length > 0).assertTrue();
        } catch (err){
          console.info(msg + err);
        }
      })

  })
}
