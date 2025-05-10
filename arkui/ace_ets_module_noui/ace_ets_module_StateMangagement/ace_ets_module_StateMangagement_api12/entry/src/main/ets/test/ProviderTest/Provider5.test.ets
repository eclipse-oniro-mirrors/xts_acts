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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
export default function Provider5Test() {
  describe('Provider5Test', () => {
    beforeEach(async (done: Function) => {
      console.info("Provider5Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Provider/Provider5',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Provider5Test state pages: " + JSON.stringify(pages));
        if (!("Provider5" == pages.name)) {
          console.info("get Provider5Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Provider5Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Provider5Test page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    Provider5
     * @tc.name      Provider5Test_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Provider5Test_0100', 0, async (done: Function) => {
      console.info('Provider5Test_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Provider5Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('varObject name: Jack0 age: 24');

      strJson = getInspectorByKey('text3');
      obj = JSON.parse(strJson);
      console.info("[Provider5Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('varObject name: Jack0 age: 24');

      console.info('[Provider5Test_0100] END');
      done();
    });
    /**
     * @tc.number    Provider5
     * @tc.name      Provider5Test_0200
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Provider5Test_0200', 0, async (done: Function) => {
      console.info('Provider5Test_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Provider5Test_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('varOnceObject name: Tom0 age: 25');

      strJson = getInspectorByKey('text4');
      obj = JSON.parse(strJson);
      console.info("[Provider5Test_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('varOnceObject name: Tom0 age: 25');

      console.info('[Provider5Test_0200] END');
      done();
    });
    /**
     * @tc.number    Provider5
     * @tc.name      Provider5Test_0300
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Provider5Test_0300', 0, async (done: Function) => {
      console.info('Provider5Test_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Provider5Test_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('varOnceObject name: Lucy age: 18');

      strJson = getInspectorByKey('text4');
      obj = JSON.parse(strJson);
      console.info("[Provider5Test_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('varOnceObject name: Lucy age: 18');

      console.info('[Provider5Test_0300] END');
      done();
    });
    /**
     * @tc.number    Provider5
     * @tc.name      Provider5Test_0400
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Provider5Test_0400', 0, async (done: Function) => {
      console.info('Provider5Test_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Provider5Test_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('varObject name: Jack01 age: 24');

      strJson = getInspectorByKey('text3');
      obj = JSON.parse(strJson);
      console.info("[Provider5Test_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('varObject name: Jack01 age: 24');

      console.info('[Provider5Test_0400] END');
      done();
    });
    /**
     * @tc.number    Provider5
     * @tc.name      Provider5Test_0500
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Provider5Test_0500', 0, async (done: Function) => {
      console.info('Provider5Test_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button5'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Provider5Test_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('varOnceObject name: Lucy1 age: 18');

      strJson = getInspectorByKey('text4');
      obj = JSON.parse(strJson);
      console.info("[Provider5Test_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('varOnceObject name: Lucy1 age: 18');

      console.info('[Provider5Test_0500] END');
      done();
    });
  })
}

