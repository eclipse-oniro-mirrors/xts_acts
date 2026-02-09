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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it,  Level } from '@ohos/hypium';
import router from '@system.router';
import { Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import { ArcButtonStatus, ArcButtonStyleMode, ArcButtonPosition, LevelMode, promptAction } from '@kit.ArkUI';

interface optionsObj {
  uri: string
}

export default function ChipOnClose() {
  describe('acrButtonProgressTest', () => {
    beforeAll(async () => {
      console.info("beforeAll case");
    });
    beforeEach(async (done: Function) => {
      console.info("search_caret beforeEach start");
      let options: optionsObj = {
        uri: 'MainAbility/pages/ArcButton/acrButtonProgressTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get acrButtonProgressTest state pages: " + JSON.stringify(pages));
        if (!("acrButtonProgressTest" == pages.name)) {
          console.info("get acrButtonProgressTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push acrButtonProgressTest page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push acrButtonProgressTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      console.info("afterEach case");
    });

    afterAll(async () => {
      console.info("afterAll case");
    });

    /**
     * @tc.name   arcButtonProgress_0100
     * @tc.number arcButtonProgress_0100
     * @tc.desc   test arcButtonProgress value 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('arcButtonProgress_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('arcButtonProgress_0100 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('setValue'))
      await button.click()
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('progressValue');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      console.info("arcButtonProgress_0100 attrs: " + JSON.stringify(obj1.$attrs));
      console.info("arcButtonProgress_0100 attrs: " + JSON.stringify(obj1.$attrs.content));  //"Top button value:0"
      let value1 = JSON.stringify(obj1.$attrs.content).replace(/"/g, '').split(':')[1]
      expect(value1).assertEqual('0');
      await button.click()
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('progressValue');
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      let value2 = JSON.stringify(obj2.$attrs.content).replace(/"/g, '').split(':')[1]
      expect(value2).assertEqual('100');
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(5000);
      await button.click()
      console.info('arcButtonProgress_0100 END');
      done();
    });

    /**
     * @tc.name   arcButtonProgress_0200
     * @tc.number arcButtonProgress_0200
     * @tc.desc   test arcButtonProgress total 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('arcButtonProgress_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('arcButtonProgress_0200 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('setTotal'))
      await button.click()
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('progressTotal');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      console.info("arcButtonProgress_0200 attrs: " + JSON.stringify(obj1.$attrs));
      console.info("arcButtonProgress_0200 attrs: " + JSON.stringify(obj1.$attrs.content));
      let total1 = JSON.stringify(obj1.$attrs.content).replace(/"/g, '').split(':')[1]
      //expect(total1).assertEqual('-1');
      await button.click()
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('progressTotal');
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      let total2 = JSON.stringify(obj2.$attrs.content).replace(/"/g, '').split(':')[1]
      expect(total2).assertEqual('0');
      await button.click()
      await CommonFunc.sleep(1000);
      let strJson3 = getInspectorByKey('progressTotal');
      let obj3: Record<string, ESObject> = JSON.parse(strJson3);
      let total3 = JSON.stringify(obj3.$attrs.content).replace(/"/g, '').split(':')[1]
      expect(total3).assertEqual('2147483647');
      await button.click()
      await CommonFunc.sleep(5000);
      let strJson4 = getInspectorByKey('progressTotal');
      let obj4: Record<string, ESObject> = JSON.parse(strJson4);
      let total4 = JSON.stringify(obj4.$attrs.content).replace(/"/g, '').split(':')[1]
      expect(total4).assertEqual('2147483648');
      console.info('arcButtonProgress_0200 END');
      done();
    });

    /**
     * @tc.name   arcButtonProgress_0300
     * @tc.number arcButtonProgress_0300
     * @tc.desc   test arcButtonProgress color 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('arcButtonProgress_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('arcButtonProgress_0300 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('setColor'))
      await button.click()
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('progressColor');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      console.info("arcButtonProgress_0300 attrs: " + JSON.stringify(obj1.$attrs));
      console.info("arcButtonProgress_0300 attrs: " + JSON.stringify(obj1.$attrs.content));
      let color1 = JSON.stringify(obj1.$attrs.content).replace(/"/g, '').split(':')[1]
      expect(color1).assertEqual('6710886');
      await button.click()
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('progressColor');
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      let color2 = JSON.stringify(obj2.$attrs.content).replace(/"/g, '').split(':')[1]
      expect(color2).assertEqual('#ffffffff');
      await button.click()
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(5000);
      let strJson4 = getInspectorByKey('progressColor');
      let obj4: Record<string, ESObject> = JSON.parse(strJson4);
      let color4 = JSON.stringify(obj4.$attrs.content).replace(/"/g, '').split(':')[1]
      expect(color4).assertEqual('#ad4685');
      console.info('arcButtonProgress_0300 END');
      done();
    });
   
  })
}