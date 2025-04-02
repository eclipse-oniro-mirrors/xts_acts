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
import router from '@ohos.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';



export default function ObserverApi() {
  describe('ObserverApi', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/observer/ObserverApi',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ObserverApi state success " + JSON.stringify(pages));
        if (!("ObserverApi" == pages.name)) {
          console.info("get ObserverApi state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ObserverApi page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ObserverApi page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ObserverApi after each called");
    });

    /*
     * @tc.number      ObserverApi_001
     * @tc.name        ObserverApi_001
     * @tc.desc        Navigation RouterPageState test
     * @tc.level       Level 2
     */
    it('ObserverApi_001', 0, async (done: Function) => {
      console.info('[ObserverApi_001] START');
      await CommonFunc.sleep(1000);

      let driver= Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('ObserverApi_ObserverOn'));
      await btn1.click()
      await CommonFunc.sleep(2000);
      console.info("[ObserverApi_001] btn1")

      let btn2 = await driver.findComponent(ON.id('ObserverApi_pushToPageTwo'));
      await btn2.click()
      await CommonFunc.sleep(2000);
      console.info("[ObserverApi_001] btn2")

      let btn3 = await driver.findComponent(ON.id('ObserverApi2_getText'));
      await btn3.click()
      await CommonFunc.sleep(2000);
      console.info("[ObserverApi_001] btn3")

      let strJson = getInspectorByKey('ObserverApi2_text');
      let obj: ESObject = JSON.parse(strJson);
      await CommonFunc.sleep(1000);
      console.info("[ObserverApi_001] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('HideAppearShow');

      let btn4 = await driver.findComponent(ON.id('ObserverApi2_backToPageOne'));
      await btn4.click()
      await CommonFunc.sleep(2000);
      console.info("[ObserverApi_001] btn4")

      let btn5 = await driver.findComponent(ON.id('ObserverApi_getText1'));
      await btn5.click()
      await CommonFunc.sleep(2000);
      console.info("[ObserverApi_001] btn5")

      let strJson2 = getInspectorByKey('ObserverApi_text1');
      let obj2: ESObject = JSON.parse(strJson2);
      await CommonFunc.sleep(1000);
      console.info("[ObserverApi_001] obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('Disappear');

      let btn6 = await driver.findComponent(ON.id('ObserverApi_ObserverOff'));
      await btn6.click()
      await CommonFunc.sleep(2000);

      console.info('[ObserverApi_001] END');
      done();

    });


    /*
     * @tc.number      ObserverApi_002
     * @tc.name        ObserverApi_002
     * @tc.desc        Navigation RouterPageState2 test
     * @tc.level       Level 2
     */
    it('ObserverApi_002', 0, async (done: Function) => {
      console.info('[ObserverApi_002] START');
      await CommonFunc.sleep(1000);

      let driver= Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('ObserverApi_ObserverOn'));
      await btn1.click()
      await CommonFunc.sleep(2000);
      console.info("[ObserverApi_002] btn1")

      let btn2 = await driver.findComponent(ON.id('ObserverApi_pushToPageTwo'));
      await btn2.click()
      await CommonFunc.sleep(2000);
      console.info("[ObserverApi_002] btn2")

      await driver.pressBack()
      await CommonFunc.sleep(2000);
      console.info("[ObserverApi_002] btn3")

      let btn4 = await driver.findComponent(ON.id('ObserverApi_getText2'));
      await btn4.click()
      await CommonFunc.sleep(2000);
      console.info("[ObserverApi_002] btn4")

      let strJson = getInspectorByKey('ObserverApi_text2');
      let obj: ESObject = JSON.parse(strJson);
      await CommonFunc.sleep(1000);
      console.info("[ObserverApi_001] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Back');

      let btn5 = await driver.findComponent(ON.id('ObserverApi_ObserverOff'));
      await btn5.click()
      await CommonFunc.sleep(2000);

      console.info('[ObserverApi_002] END');
      done();

    });

  })
}



