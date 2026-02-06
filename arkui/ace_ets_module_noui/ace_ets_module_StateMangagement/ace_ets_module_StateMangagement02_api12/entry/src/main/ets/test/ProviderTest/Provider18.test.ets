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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ProviderTestJsunit18() {
  describe('ProviderTestJsunit18', () => {
    beforeEach(async (done: Function) => {
      console.info("ProviderTestJsunit18 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Provider/Provider18",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ProviderTestJsunit18 state pages:" + JSON.stringify(pages));
        if (!("Provider18" == pages.name)) {
          console.info("get ProviderTestJsunit18 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ProviderTestJsunit18 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ProviderTestJsunit18 page error:" + err);
      }
      console.info("ProviderTestJsunit18 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ProviderTestJsunit18 after each called");
    });
    /**
     * @tc.name   Provider18Test_0100
     * @tc.number Provider18Test_0100
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Provider18Test_0100', Level.LEVEL0, async (done: Function) => {
      console.info('Provider18Test_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btnParent'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strBut = getInspectorByKey('btnParent');
      let strText = getInspectorByKey('tvChild1');
      let objBut: ESObject = JSON.parse(strBut);
      let objText: ESObject = JSON.parse(strText);
      console.info("[Provider18Test_0100] component objBut is: " + JSON.stringify(objBut));
      console.info("[Provider18Test_0100] component objText is: " + JSON.stringify(objText));
      expect(objBut.$attrs.label).assertEqual('parent (51) +1');
      expect(objText.$attrs.content).assertEqual('reviewVotes(41)');
      console.info('[Provider18Test_0100] END');
      done();
    });
    /**
     * @tc.name   Provider18Test_0200
     * @tc.number Provider18Test_0200
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Provider18Test_0200', Level.LEVEL0, async (done: Function) => {
      console.info('Provider18Test_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btnChild'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strBut = getInspectorByKey('btnChild');
      let strText = getInspectorByKey('tvChild1');
      let strText1 = getInspectorByKey('tvChild2');
      let strText2 = getInspectorByKey('tvChild3');
      let strText3 = getInspectorByKey('tvChild4');
      let objBut: ESObject = JSON.parse(strBut);
      let objText: ESObject = JSON.parse(strText);
      let objText1: ESObject = JSON.parse(strText1);
      let objText2: ESObject = JSON.parse(strText2);
      let objText3: ESObject = JSON.parse(strText3);
      console.info("[Provider18Test_0200] component objBut is: " + JSON.stringify(objBut));
      console.info("[Provider18Test_0200] component objText is: " + JSON.stringify(objText));
      console.info("[Provider18Test_0200] component objText1 is: " + JSON.stringify(objText1));
      console.info("[Provider18Test_0200] component objText2 is: " + JSON.stringify(objText2));
      console.info("[Provider18Test_0200] component objText3 is: " + JSON.stringify(objText3));
      expect(objText.$attrs.content).assertEqual('reviewVotes(45)');
      expect(objText1.$attrs.content).assertEqual('reviewVotes(64)');
      expect(objText2.$attrs.content).assertEqual('reviewVotes(64)');
      expect(objText3.$attrs.content).assertEqual('reviewVotes(64)');
      console.info('[Provider18Test_0200] END');
      done();
    });
    /**
     * @tc.name   Provider18Test_0300
     * @tc.number Provider18Test_0300
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Provider18Test_0300', Level.LEVEL0, async (done: Function) => {
      console.info('Provider18Test_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('tvChild2'));
      await text.click();
      await CommonFunc.sleep(1000);
      let strText1 = getInspectorByKey('tvChild2');
      let strText2 = getInspectorByKey('tvChild3');
      let strText3 = getInspectorByKey('tvChild4');
      let objText1: ESObject = JSON.parse(strText1);
      let objText2: ESObject = JSON.parse(strText2);
      let objText3: ESObject = JSON.parse(strText3);
      console.info("[Provider18Test_0300] component objText1 is: " + JSON.stringify(objText1));
      console.info("[Provider18Test_0300] component objText2 is: " + JSON.stringify(objText2));
      console.info("[Provider18Test_0300] component objText3 is: " + JSON.stringify(objText3));
      expect(objText1.$attrs.content).assertEqual('reviewVotes(65)');
      expect(objText2.$attrs.content).assertEqual('reviewVotes(65)');
      expect(objText3.$attrs.content).assertEqual('reviewVotes(65)');
      console.info('[Provider18Test_0300] END');
      done();
    });
    /**
     * @tc.name   Provider18Test_0400
     * @tc.number Provider18Test_0400
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Provider18Test_0400', Level.LEVEL0, async (done: Function) => {
      console.info('Provider18Test_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('tvChild3'));
      await text.click();
      await CommonFunc.sleep(1000);
      let strText1 = getInspectorByKey('tvChild2');
      let strText2 = getInspectorByKey('tvChild3');
      let strText3 = getInspectorByKey('tvChild4');
      let objText1: ESObject = JSON.parse(strText1);
      let objText2: ESObject = JSON.parse(strText2);
      let objText3: ESObject = JSON.parse(strText3);
      console.info("[Provider18Test_0400] component objText1 is: " + JSON.stringify(objText1));
      console.info("[Provider18Test_0400] component objText2 is: " + JSON.stringify(objText2));
      console.info("[Provider18Test_0400] component objText3 is: " + JSON.stringify(objText3));
      expect(objText1.$attrs.content).assertEqual('reviewVotes(66)');
      expect(objText2.$attrs.content).assertEqual('reviewVotes(66)');
      expect(objText3.$attrs.content).assertEqual('reviewVotes(66)');
      console.info('[Provider18Test_0400] END');
      done();
    });
    /**
     * @tc.name   Provider18Test_0500
     * @tc.number Provider18Test_0500
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Provider18Test_0500', Level.LEVEL0, async (done: Function) => {
      console.info('Provider18Test_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('tvChild4'));
      await text.click();
      await CommonFunc.sleep(1000);
      let strText1 = getInspectorByKey('tvChild2');
      let strText2 = getInspectorByKey('tvChild3');
      let strText3 = getInspectorByKey('tvChild4');
      let objText1: ESObject = JSON.parse(strText1);
      let objText2: ESObject = JSON.parse(strText2);
      let objText3: ESObject = JSON.parse(strText3);
      console.info("[Provider18Test_0500] component objText1 is: " + JSON.stringify(objText1));
      console.info("[Provider18Test_0500] component objText2 is: " + JSON.stringify(objText2));
      console.info("[Provider18Test_0500] component objText3 is: " + JSON.stringify(objText3));
      expect(objText1.$attrs.content).assertEqual('reviewVotes(67)');
      expect(objText2.$attrs.content).assertEqual('reviewVotes(67)');
      expect(objText3.$attrs.content).assertEqual('reviewVotes(67)');
      console.info('[Provider18Test_0500] END');
      done();
    });
  })
}
