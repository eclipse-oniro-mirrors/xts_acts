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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';
import { text, drawing, common2D } from "@kit.ArkGraphics2D"

export default function LineMetricsTest() {
  describe('LineMetricsTest', ()=> {
    beforeEach(async (done:Function)=> {
      console.info("LineMetricsTest beforeEach start");
      let options :router.RouterOptions= {
        url: 'MainAbility/pages/LineMetrics',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LineMetricsTest state pages: " + JSON.stringify(pages));
        if (!("LineMetrics" == pages.name)) {
          console.info("get LineMetricsTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(5000);
          console.info("push LineMetricsTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LineMetricsTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    LineMetrics
     * @tc.name      LineMetricsTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('LineMetricsTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      console.info('LineMetricsTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('LineMetrics_4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('LineMetrics_1');
      let strJson2 = getInspectorByKey('LineMetrics_2');
      let strJson3 = getInspectorByKey('LineMetrics_3');
      let obj1:ESObject = JSON.parse(strJson1);
      let obj2:ESObject = JSON.parse(strJson2);
      let obj3:ESObject = JSON.parse(strJson3);
      expect(obj1.$attrs.content).assertEqual('1');
      expect(obj2.$attrs.content).assertEqual('7');
      expect(obj3.$attrs.content).assertEqual('10');
      console.info('[LineMetricsTest_0100] END');
      done();
    });

    /**
     * @tc.number    : SUB_BASIC_XTS_GRAPHICTEXT_API_0100
     * @tc.name      : LineMetricsTest_0200
     * @tc.desc      : runMetrics and LineMetrics
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('LineMetricsTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg  = "====testLineMetricsTest_0200===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        let lineMetrics: text.LineMetrics | undefined =  paragraph.getLineMetrics(0);
        expect(lineMetrics?.startIndex != null).assertTrue();
        expect(lineMetrics?.endIndex == 39).assertTrue();
        expect(lineMetrics?.ascent != null).assertTrue();
        expect(lineMetrics?.descent != null).assertTrue();
        expect(lineMetrics?.height != null).assertTrue();
        expect(lineMetrics?.width != null).assertTrue();
        expect(lineMetrics?.left != null).assertTrue();
        expect(lineMetrics?.baseline != null).assertTrue();
        expect(lineMetrics?.lineNumber != null).assertTrue();
        expect(lineMetrics?.topHeight != null).assertTrue();
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })
  })
}

