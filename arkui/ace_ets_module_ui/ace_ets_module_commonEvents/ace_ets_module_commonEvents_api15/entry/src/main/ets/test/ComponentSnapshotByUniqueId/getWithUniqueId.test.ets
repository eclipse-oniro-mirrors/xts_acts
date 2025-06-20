/*
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

import {describe, beforeAll, beforeEach, afterEach, it, expect} from "@ohos/hypium"
import {UiComponent, UiDriver, Component, Driver, ON, BY } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function defaultFocus() {

  describe('getWithUniqueId', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ComponentSnapshotByUniqueId/getWithUniqueId',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getWithUniqueId state pages: " + JSON.stringify(pages));
        if (!("getWithUniqueId" == pages.name)) {
          console.info("get getWithUniqueId state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push getWithUniqueId success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getWithUniqueId page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("defaultFocus after each called");
    });

    /**
     * @tc.number    getWithUniqueId_0001
     * @tc.name      getWithUniqueId_0001
     * @tc.desc      test getWithUniqueId with scale param
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getWithUniqueId_0001', 0, async (done: Function) => {
      console.info('getWithUniqueId_0001 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      console.info("[getWithUniqueId_0001] attrs is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[getWithUniqueId_0001] content is: " + JSON.stringify(JSON.parse(strJson).$attrs.content));

      let snapshotScaleButton = await driver.findComponent(ON.id('snapshotScale'));
      await snapshotScaleButton.click();
      await CommonFunc.sleep(500);

      let snapshotButton = await driver.findComponent(ON.id('UniqueId_getSnapshot'));
      await snapshotButton.click();
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('resultText');
      expect(JSON.parse(strJson).$attrs.content).assertEqual('UniqueId_getSnapshot_success');
      await CommonFunc.sleep(1000);
      console.info('[getWithUniqueId_0001] END');
      done();
    });
    /**
     * @tc.number    getWithUniqueId_0002
     * @tc.name      getWithUniqueId_0002
     * @tc.desc      test getSyncWithUniqueId with scale param
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getWithUniqueId_0002', 0, async (done: Function) => {
      console.info('getWithUniqueId_0002 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      console.info("[getWithUniqueId_0002] attrs is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[getWithUniqueId_0002] content is: " + JSON.stringify(JSON.parse(strJson).$attrs.content));

      let snapshotButton = await driver.findComponent(ON.id('UniqueId_getSyncSnapshot'));
      await snapshotButton.click();
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('resultText');
      expect(JSON.parse(strJson).$attrs.content).assertEqual('UniqueId_getSyncSnapshot_success');
      await CommonFunc.sleep(1000);
      console.info('[getWithUniqueId_0002] END');
      done();
    });

    /**
     * @tc.number    getWithUniqueId_0003
     * @tc.name      getWithUniqueId_0003
     * @tc.desc      test getWithUniqueId with waitUntilRenderFinished param
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getWithUniqueId_0003', 0, async (done: Function) => {
      console.info('getWithUniqueId_0003 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      console.info("[getWithUniqueId_0003] attrs is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[getWithUniqueId_0003] content is: " + JSON.stringify(JSON.parse(strJson).$attrs.content));

      let snapshotWaitButton = await driver.findComponent(ON.id('snapshotWait'));
      await snapshotWaitButton.click();
      await CommonFunc.sleep(500);

      let snapshotButton = await driver.findComponent(ON.id('UniqueId_getSnapshot'));
      await snapshotButton.click();
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('resultText');
      expect(JSON.parse(strJson).$attrs.content).assertEqual('UniqueId_getSnapshot_success');
      await CommonFunc.sleep(1000);
      console.info('[getWithUniqueId_0003] END');
      done();
    });

    /**
     * @tc.number    getWithUniqueId_0004
     * @tc.name      getWithUniqueId_0004
     * @tc.desc      test getSyncWithUniqueId with waitUntilRenderFinished param
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getWithUniqueId_0004', 0, async (done: Function) => {
      console.info('getWithUniqueId_0004 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      console.info("[getWithUniqueId_0004] attrs is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[getWithUniqueId_0004] content is: " + JSON.stringify(JSON.parse(strJson).$attrs.content));

      let snapshotButton = await driver.findComponent(ON.id('UniqueId_getSyncSnapshot'));
      await snapshotButton.click();
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('resultText');
      expect(JSON.parse(strJson).$attrs.content).assertEqual('UniqueId_getSyncSnapshot_success');
      await CommonFunc.sleep(1000);
      console.info('[getWithUniqueId_0004] END');
      done();
    });

  })
}