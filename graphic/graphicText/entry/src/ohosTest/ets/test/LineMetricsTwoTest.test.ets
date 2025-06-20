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

export default function LineMetricsTwoTest() {
  describe('LineMetricsTwoTest', () => {
    beforeEach(async (done: Function) => {
      let beforeEachMsg = " ====beforeEach===="
      console.info(beforeEachMsg + " 1 ");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LineMetricsTwo',
      }
      let result = await router.push(options);
      console.info(beforeEachMsg + " 2 ");
      await CommonFunc.sleep(5000);
      done();
    });

    /**
     * @tc.number    : SUB_BASIC_XTS_GRAPHICTEXT_API_0100
     * @tc.name      : testLineMetricsTest_2
     * @tc.desc      : api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */

    it('testLineMetricsTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "====testLineMetricsTest_2===="
      console.info('testLineMetricsTest_2 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('LineMetrics_4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('LineMetrics_1');
      let strJson2 = getInspectorByKey('LineMetrics_2');
      let strJson3 = getInspectorByKey('LineMetrics_3');
      let strJson5 = getInspectorByKey('LineMetrics_5');
      let strJson6 = getInspectorByKey('LineMetrics_6');
      let strJson7 = getInspectorByKey('LineMetrics_7');
      let strJson8 = getInspectorByKey('LineMetrics_8');
      let strJson9 = getInspectorByKey('LineMetrics_9');
      let strJson10 = getInspectorByKey('LineMetrics_10');
      let strJson11 = getInspectorByKey('LineMetrics_11');
      let obj1: ESObject = JSON.parse(strJson1);
      let obj2: ESObject = JSON.parse(strJson2);
      let obj3: ESObject = JSON.parse(strJson3);
      let obj5: ESObject = JSON.parse(strJson5);
      let obj6: ESObject = JSON.parse(strJson6);
      let obj7: ESObject = JSON.parse(strJson7);
      let obj8: ESObject = JSON.parse(strJson8);
      let obj9: ESObject = JSON.parse(strJson9);
      let obj10: ESObject = JSON.parse(strJson10);
      let obj11: ESObject = JSON.parse(strJson11);
      expect(obj1.$attrs.content).assertEqual('1');
      expect(obj2.$attrs.content).assertEqual('7');
      expect(obj3.$attrs.content).assertEqual('10');
      expect(obj5.$attrs.content).assertEqual('5');
      expect(obj6.$attrs.content).assertEqual('6');
      expect(obj7.$attrs.content).assertEqual('6');
      expect(obj8.$attrs.content).assertEqual('6');
      expect(obj9.$attrs.content).assertEqual('6');
      expect(obj10.$attrs.content).assertEqual('6');
      expect(obj11.$attrs.content).assertEqual('6');
      console.log(msg + " obj5.$attrs.content: " + obj5.$attrs.content)
      console.log(msg + " obj6.$attrs.content: " + obj6.$attrs.content)
      console.info('[LineMetricsTest_0200] END');
      expect(true).assertTrue()
      done();
    });

    /**
     * @tc.number    : SUB_BASIC_XTS_GRAPHICTEXT_API_0100
     * @tc.name      : testLineMetricsTest_0100
     * @tc.desc      : runMetrics and LineMetrics
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testLineMetricsTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg  = "====testLineMetricsTest_0100===="
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
        let arrLineMetrc: Array<text.LineMetrics> =  paragraph.getLineMetrics();
        let arrRunMetrics: Map<number,text.RunMetrics> = arrLineMetrc[0].runMetrics;
        let arr: number[] = [];
        for (let key of arrRunMetrics.keys()) {
          arr.push(key);
        }
        let textStyle: text.TextStyle | undefined = arrRunMetrics.get(arr[arr.length -1])?.textStyle;
        expect(3).assertEqual(textStyle?.fontWeight);
        let fontMetrics: drawing.FontMetrics | undefined = arrRunMetrics.get(arr[arr.length -1])?.fontMetrics;
        let maxNum = fontMetrics?.maxCharWidth;
        expect(true).assertTrue();
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_XTS_GRAPHICTEXT_API_0200
     * @tc.name      : testLineMetricsTest_0200
     * @tc.desc      : test maxCharWidth
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testLineMetricsTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg  = "====testLineMetricsTest_0200===="
      let font = new drawing.Font();
      try {
        let metrics = font.getMetrics();
        let max = metrics.maxCharWidth;
        expect(true).assertTrue();
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_XTS_GRAPHICTEXT_API_0300
     * @tc.name      : testLineMetricsTest_0300
     * @tc.desc      : api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testLineMetricsTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg  = "====testLineMetricsTest_0300===="
      let font = new drawing.Font();
      try {
        let str = 'error';
        const myTypeface = drawing.Typeface.makeFromFile(str);
        font.setTypeface(myTypeface);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(msg + 'test error' + err);
        expect(err.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_XTS_GRAPHICTEXT_API_0400
     * @tc.name      : testLineMetricsTest_0400
     * @tc.desc      : api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testLineMetricsTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg  = "====testLineMetricsTest_0400===="
      try {
        let path: drawing.Path = new drawing.Path();
        path.moveTo(10, 20);
        let iter: drawing.PathIterator = new drawing.PathIterator(path);
        let verbStr: Array<string> = ["MOVE", "LINE", "QUAD", "CONIC", "CUBIC", "CLOSE", "DONE"];
        let pointCount: Array<number> = [1,2,3,4,4,0,0]; //1,2,3,3.5,4,0,0
        let points: Array<common2D.Point> = [{x: 0, y: 0}, {x: 0, y: 0}, {x: 0, y: 0}, {x: 0, y: 0}];
        let offset = 2;
        let verb = iter.next(points, offset);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(msg + 'test error' + err);
        expect(err.code == 401).assertTrue();
        done();
      }
    })
  })
}

