/**
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
import { BusinessError } from '@ohos.base';
import text from "@ohos.graphics.text";
import image from '@ohos.multimedia.image';

export default function GraphicTextAPI21Test() {
  describe('GraphicTextAPI21Test', () => {

    /**
     * @tc.name   graphicTextAPI21TestStatic_0100
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_PROPERTY_0100
     * @tc.desc   Test TextStyle Property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI21TestStatic_0100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====graphicTextAPI21TestStatic_0100===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
          heightOnly: true,
          heightScale: 2.0,
          lineHeightMaximum: 21,
          lineHeightMinimum: 3,
          lineHeightStyle: text.LineHeightStyle.FONT_SIZE,
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          lineSpacing: 15,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        let arrLineMetric: Array<text.LineMetrics> =  paragraph.getLineMetrics();
        let arrRunMetrics: Map<int,text.RunMetrics> = arrLineMetric[0].runMetrics;
        let arr: number[] = [];
        for (let key of arrRunMetrics.keys()) {
          arr.push(key);
        }
        arrRunMetrics.forEach((value, key) => {
          let textStyle = value.textStyle;
          console.info(msg + 'www data lineHeightMaximum ', textStyle.lineHeightMaximum);
          console.info(msg + 'www data lineHeightMinimum ', textStyle.lineHeightMinimum);
          console.info(msg + 'www data lineHeightStyle ', textStyle.lineHeightStyle);
          expect(textStyle.lineHeightMaximum == 21).assertTrue();
          expect(textStyle.lineHeightMinimum == 3).assertTrue();
          expect(textStyle.lineHeightStyle).assertEqual(text.LineHeightStyle.FONT_SIZE);
        })
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   graphicTextAPI21TestStatic_0200
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_createTruncatedLine_0100
     * @tc.desc   Test createTruncatedLine
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI21TestStatic_0200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====graphicTextAPI21TestStatic_0200===="
      const color: ArrayBuffer = new ArrayBuffer(40000);
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: image.PixelMapFormat.BGRA_8888,
        size: {
          height: 100, width: 100
        }
      }
      let pixel = await image.createPixelMap(color, opts);
      let fontCollection = new text.FontCollection();
      let myTextStyle: text.TextStyle = {
        color : {alpha: 255, red: 255, green: 0, blue: 0}
      };
      let myParagraphStyle: text.ParagraphStyle = {
        textStyle : myTextStyle
      };
      let myPlaceholderSpan: text.PlaceholderSpan = {
        width: 12,
        height: 21,
        align: text.PlaceholderAlignment.ABOVE_BASELINE,
        baseline: text.TextBaseline.ALPHABETIC,
        baselineOffset: 66
      };
      let ParagraphGraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
      ParagraphGraphBuilder.addText("123");
      let paragraph: text.Paragraph = ParagraphGraphBuilder.build();
      paragraph.layoutSync(600);
      let textLines : Array<text.TextLine> = paragraph.getTextLines();
      let length = textLines.length;
      for (let i = 0; i < length; i++) {
        let textLine: text.TextLine = textLines[i];
        let truncatedTextLine = textLine.createTruncatedLine(-50, text.EllipsisMode.END, "...");
        console.info('www data truncatedTextLine ', truncatedTextLine)
        expect(truncatedTextLine == undefined).assertTrue();
      }
      done();
    })

  })
}

