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

export default function Consumer0130Test() {
  describe('Consumer0130Test', () => {
    beforeEach(async (done: Function) => {
      console.info("Consumer0130Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/consumer/Consumer0130",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("Consumer0130" == pages.name)) {
          console.info("get Consumer0130Test pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Consumer0130Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Consumer0130Test page error:" + err);
      }
      console.info("Consumer0130Test beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Consumer0130Test after each called");
    });

    /**
     * @tc.number Consumer0130Test
     * @tc.name Consumer0130Test_001
     * @tc.desc Persistently store UI related data
     * @tc.level Level 3
     * @tc.type
     * @tc.size
     */
    it('Consumer0130Test_001', Level.LEVEL3, async (done: Function) => {
      console.info('[Consumer0130Test_001] START');
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvChildConsumer0130'));
      console.info("[Consumer0130Test_001] obj content: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('undefined');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnChildConsumer0130"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(getInspectorByKey('tvChildConsumer0130'));
      console.info("[Consumer0130Test_001] obj1 content: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('ArkUI');
      console.info('[Consumer0130Test_001] END');
      done();
    });
  })
}
