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

export default function NonUICallBackTest() {
  describe('NonUICallBackTest', () => {
    beforeEach(async (done: Function) => {
      console.info("NonUICallBackTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Zhuang/NonUICallBack",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("NonUICallBack" == pages.name)) {
          console.info("get NonUICallBackTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NonUICallBackTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NonUICallBackTest page error:" + err);
      }
      console.info("NonUICallBackTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("NonUICallBackTest after each called");
    });

    /**
     * @tc.number NonUICallBackTest_001
     * @tc.name NonUICallBackTest_001
     * @tc.desc Persistently store UI related data
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('NonUICallBackTest_001', Level.LEVEL2, async (done: Function) => {
      console.info('[NonUICallBackTest_001] START');
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvNonUICallBack'));
      console.info("[NonUICallBackTest_001] obj content: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('aboutToAppear');
      console.info('[NonUICallBackTest_001] END');
      done();
    });

    /**
     * @tc.number NonUICallBackTest_002
     * @tc.name NonUICallBackTest_002
     * @tc.desc Persistently store UI related data
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('NonUICallBackTest_002', Level.LEVEL2, async (done: Function) => {
      console.info('[NonUICallBackTest_002] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnNonUICallBackClick0"));
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvNonUICallBack'));
      console.info("[NonUICallBackTest_002] obj content: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Polygon');
      console.info('[NonUICallBackTest_002] END');
      done();
    });

    /**
     * @tc.number NonUICallBackTest_003
     * @tc.name NonUICallBackTest_003
     * @tc.desc Persistently store UI related data
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('NonUICallBackTest_003', Level.LEVEL2, async (done: Function) => {
      console.info('[NonUICallBackTest_003] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnNonUICallBackClick1"));
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvNonUICallBack'));
      console.info("[NonUICallBackTest_003] obj content: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('fontColor');
      console.info('[NonUICallBackTest_003] END');
      done();
    });

    /**
     * @tc.number NonUICallBackTest_004
     * @tc.name NonUICallBackTest_004
     * @tc.desc Persistently store UI related data
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('NonUICallBackTest_004', Level.LEVEL2, async (done: Function) => {
      console.info('[NonUICallBackTest_004] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnNonUICallBackClick2"));
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvNonUICallBack'));
      console.info("[NonUICallBackTest_004] obj content: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Column');
      console.info('[NonUICallBackTest_004] END');
      done();
    });
  })
}
