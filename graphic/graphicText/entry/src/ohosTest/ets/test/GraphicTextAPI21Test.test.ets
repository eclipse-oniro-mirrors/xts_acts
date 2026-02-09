/**
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
import router from '@ohos.router';
import { UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import { MessageManager, Callback } from '../MainAbility/utils/MessageManager';
import { text, drawing, common2D } from "@kit.ArkGraphics2D"

export default function GraphicTextAPI21Test() {
  describe('GraphicTextAPI21Test', () => {
    beforeEach(async (done: Function) => {
      done();
    });

    /**
     * @tc.name   graphicTextAPI21Test_0100
     * @tc.number graphicTextAPI21Test_0100
     * @tc.desc   runMetrics and LineMetrics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI21Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg  = "====testLineMetricsTest_0100===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
          fontWidth: text.FontWidth.SEMI_EXPANDED,
          heightOnly: true,
          heightScale: 2.0,
          lineHeightMaximum: 20,
          lineHeightMinimum: 1,
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
        let arrLineMetrc: Array<text.LineMetrics> =  paragraph.getLineMetrics();
        let arrRunMetrics: Map<number,text.RunMetrics> = arrLineMetrc[0].runMetrics;
        let arr: number[] = [];
        for (let key of arrRunMetrics.keys()) {
          arr.push(key);
        }
        let textStyle: text.TextStyle | undefined = arrRunMetrics.get(arr[arr.length -1])?.textStyle;
        console.info('www data textStyle ' + JSON.stringify(textStyle));
        console.info('www data textStyle fontWidth ' + JSON.stringify(textStyle?.fontWidth));
        console.info('www data textStyle lineHeightMaximum ' + JSON.stringify(textStyle?.lineHeightMaximum));
        console.info('www data textStyle lineHeightMinimum ' + JSON.stringify(textStyle?.lineHeightMinimum));
        console.info('www data textStyle lineHeightStyle ' + JSON.stringify(textStyle?.lineHeightStyle));
        expect(textStyle?.fontWidth !== undefined).assertTrue();
        expect(textStyle?.lineHeightMaximum !== undefined).assertTrue();
        expect(textStyle?.lineHeightMinimum !== undefined).assertTrue();
        expect(textStyle?.lineHeightStyle !== undefined).assertTrue();
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

  })
}

