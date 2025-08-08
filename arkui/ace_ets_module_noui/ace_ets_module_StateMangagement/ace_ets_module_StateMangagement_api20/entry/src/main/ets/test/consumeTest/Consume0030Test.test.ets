/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function Consume0030Test() {
  describe('Consume0030Test', () => {
    beforeEach(async (done: Function) => {
      console.info("Consume0030Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/consume/Consume0030",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("Consume0030" == pages.name)) {
          console.info("get Consume0030Test pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Consume0030Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Consume0030Test page error:" + err);
      }
      console.info("Consume0030Test beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Consume0030Test after each called");
    });

    /**
     * @tc.number Consume0030Test_001
     * @tc.name Consume0030Test_001
     * @tc.desc Persistently store UI related data
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('Consume0030Test_001', Level.LEVEL1, async (done: Function) => {
      console.info('[Consume0030Test_001] START');
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvConsume0030'));
      console.info("[Consume0030Test_001] obj content: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('10');
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(getInspectorByKey('tvChildConsume0030'));
      console.info("[Consume0030Test_001] obj1 content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('10');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnConsume0030"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      obj = JSON.parse(getInspectorByKey('tvConsume0030'));
      console.info("[Consume0030Test_001] obj content: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('11');
      await CommonFunc.sleep(1000);
      obj1 = JSON.parse(getInspectorByKey('tvChildConsume0030'));
      console.info("[Consume0030Test_001] obj1 content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('11');
      await CommonFunc.sleep(1000);
      let btn1: Component = await driver.findComponent(ON.id("btnChildConsume0030"));
      await CommonFunc.sleep(1000);
      await btn1.click();
      await CommonFunc.sleep(1000);
      obj = JSON.parse(getInspectorByKey('tvConsume0030'));
      console.info("[Consume0030Test_001] obj content: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('12');
      await CommonFunc.sleep(1000);
      obj1 = JSON.parse(getInspectorByKey('tvChildConsume0030'));
      console.info("[Consume0030Test_001] obj1 content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('12');
      await CommonFunc.sleep(1000);
      done();
    });
  })
}
