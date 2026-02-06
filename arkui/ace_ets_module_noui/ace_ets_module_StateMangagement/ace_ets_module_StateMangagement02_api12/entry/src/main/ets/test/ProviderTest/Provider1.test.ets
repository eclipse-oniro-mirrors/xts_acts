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
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
export default function Provider1Test() {
  describe('Provider1Test', () => {
    beforeEach(async (done: Function) => {
      console.info("Provider1Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Provider/Provider1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Provider1Test state pages: " + JSON.stringify(pages));
        if (!("Provider1" == pages.name)) {
          console.info("get Provider1Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Provider1Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Provider1Test page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    Provider1Test_0100
     * @tc.name      Provider1Test_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Provider1Test_0100', Level.LEVEL0, async (done: Function) => {
      console.info('Provider1Test_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('parent'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('parent_1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Provider1Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('变量名和变量名重名：reviewVotes(41)');

      strJson = getInspectorByKey('parent_2');
      obj = JSON.parse(strJson);
      console.info("[Provider1Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('别名和变量名匹配：reviewVotes(41)');

      strJson = getInspectorByKey('parent_3');
      obj = JSON.parse(strJson);
      console.info("[Provider1Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('变量名和别名重名：reviewVotes(41)');

      console.info('[Provider1Test_0100] END');
      done();
    });
    /**
     * @tc.number    Provider1Test_0200
     * @tc.name      Provider1Test_0200
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Provider1Test_0200', Level.LEVEL0, async (done: Function) => {
      console.info('Provider1Test_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('Child1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Child1_1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Provider1Test_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('别名和变量名重名：reviewVotes(12)');

      strJson = getInspectorByKey('Child1_2');
      obj = JSON.parse(strJson);
      console.info("[Provider1Test_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('别名和变量名重名：reviewVotes(12)');

      strJson = getInspectorByKey('Child1_3');
      obj = JSON.parse(strJson);
      console.info("[Provider1Test_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('同组件内变量名和别名重名：reviewVotes(12)');


      console.info('[Provider1Test_0200] END');
      done();
    });
    /**
     * @tc.number    Provider1Test_0300
     * @tc.name      Provider1Test_0300
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Provider1Test_0300', Level.LEVEL0, async (done: Function) => {
      console.info('Provider1Test_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('Child2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Child2_1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Provider1Test_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('只有alias重名：reviewVotes(23)');

      strJson = getInspectorByKey('Child2_2');
      obj = JSON.parse(strJson);
      console.info("[Provider1Test_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('优先别名匹配：reviewVotes(23)');

      console.info('[Provider1Test_0300] END');
      done();
    });
    /**
     * @tc.number    Provider1Test_0400
     * @tc.name      Provider1Test_0400
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('Provider1Test_0400', Level.LEVEL0, async (done: Function) => {
      console.info('Provider1Test_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('GrandSon'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Child1_1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Provider1Test_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('别名和变量名重名：reviewVotes(16)');

      strJson = getInspectorByKey('Child1_2');
      obj = JSON.parse(strJson);
      console.info("[Provider1Test_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('别名和变量名重名：reviewVotes(16)');

      strJson = getInspectorByKey('Child1_3');
      obj = JSON.parse(strJson);
      console.info("[Provider1Test_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('同组件内变量名和别名重名：reviewVotes(16)');

      strJson = getInspectorByKey('Child2_1');
      obj = JSON.parse(strJson);
      console.info("[Provider1Test_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('只有alias重名：reviewVotes(27)');

      strJson = getInspectorByKey('Child2_2');
      obj = JSON.parse(strJson);
      console.info("[Provider1Test_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('优先别名匹配：reviewVotes(27)');

      strJson = getInspectorByKey('GrandSon_1');
      obj = JSON.parse(strJson);
      console.info("[Provider1Test_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('别名和变量名都重名：reviewVotes(4)');

      strJson = getInspectorByKey('GrandSon_2');
      obj = JSON.parse(strJson);
      console.info("[Provider1Test_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('只有变量名重名：reviewVotes(4)');

      strJson = getInspectorByKey('parent_1');
      obj = JSON.parse(strJson);
      console.info("[Provider1Test_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('变量名和变量名重名：reviewVotes(49)');

      strJson = getInspectorByKey('parent_2');
      obj = JSON.parse(strJson);
      console.info("[Provider1Test_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('别名和变量名匹配：reviewVotes(49)');

      strJson = getInspectorByKey('parent_3');
      obj = JSON.parse(strJson);
      console.info("[Provider1Test_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('变量名和别名重名：reviewVotes(45)');

      console.info('[Provider1Test_0400] END');
      done();
    });
  })
}

