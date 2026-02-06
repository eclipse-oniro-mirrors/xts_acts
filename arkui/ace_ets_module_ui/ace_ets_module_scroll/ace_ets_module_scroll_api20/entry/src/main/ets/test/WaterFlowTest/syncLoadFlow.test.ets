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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function syncLoadFlow() {
  describe('syncLoadFlow', () => {
    beforeEach(async (done: Function) => {
      console.info("syncLoadFlow beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/syncLoadFlow",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get syncLoadFlow state pages:" + JSON.stringify(pages));
        if (!("syncLoadFlow" == pages.name)) {
          console.info("get syncLoadFlow pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push syncLoadFlow page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push syncLoadFlow page error:" + err);
      }
      console.info("syncLoadFlow beforeEach end");
      done();
    });

    /**
     * @tc.number    syncLoadFlow_001
     * @tc.name      syncLoadFlow_0100
     * @tc.desc      Asynchronous loading of WaterFlow sub components.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('syncLoadFlow_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[syncLoadFlow_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('flow_syncLoad');
      console.info("[syncLoadFlow_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[syncLoadFlow_0100] syncLoad: " + JSON.stringify(JSON.parse(strJson).$attrs.syncLoad));
      expect(JSON.parse(strJson).$attrs.syncLoad).assertEqual(false);
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('flow_syncLoad_scrollTo'));
      await btn1.click();
      await CommonFunc.sleep(2000);
      await driver.assertComponentExist(ON.text('N50'));
      console.info('[syncLoadFlow_0100] END');
      done();
    });

    /**
     * @tc.number    syncLoadFlow_002
     * @tc.name      syncLoadFlow_0200
     * @tc.desc      Synchronize loading of WaterFlow sub components.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('syncLoadFlow_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[syncLoadFlow_0200] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('flow_syncLoad_true'));
      await btn1.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('flow_syncLoad');
      console.info("[syncLoadFlow_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[syncLoadFlow_0200] syncLoad: " + JSON.stringify(JSON.parse(strJson).$attrs.syncLoad));
      expect(JSON.parse(strJson).$attrs.syncLoad).assertEqual(true);
      let btn2: Component = await driver.findComponent(ON.id('flow_syncLoad_scrollTo'));
      await btn2.click();
      await CommonFunc.sleep(2000);
      await driver.assertComponentExist(ON.text('N50'));
      console.info('[syncLoadFlow_0200] END');
      done();
    });
  })
}
