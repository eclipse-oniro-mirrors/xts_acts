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

export default function syncLoadList() {
  describe('syncLoadList', () => {
    beforeEach(async (done: Function) => {
      console.info("syncLoadList beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/syncLoadList",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get syncLoadList state pages:" + JSON.stringify(pages));
        if (!("syncLoadList" == pages.name)) {
          console.info("get syncLoadList pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push syncLoadList page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push syncLoadList page error:" + err);
      }
      console.info("syncLoadList beforeEach end");
      done();
    });

    /**
     * @tc.number    syncLoadList_001
     * @tc.name      syncLoadList_0100
     * @tc.desc      Asynchronous loading of List sub components.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('syncLoadList_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[syncLoadList_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('list_syncLoad');
      console.info("[syncLoadList_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[syncLoadList_0100] syncLoad: " + JSON.stringify(JSON.parse(strJson).$attrs.syncLoad));
      expect(JSON.parse(strJson).$attrs.syncLoad).assertEqual(false);
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('list_syncLoad_scrollTo'));
      await btn1.click();
      await CommonFunc.sleep(2000);
      await driver.assertComponentExist(ON.text('图片50'));
      console.info('[syncLoadList_0100] END');
      done();
    });

    /**
     * @tc.number    syncLoadList_002
     * @tc.name      syncLoadList_0200
     * @tc.desc      Synchronize loading of List sub components.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('syncLoadList_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[syncLoadList_0200] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('list_syncLoad_true'));
      await btn1.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('list_syncLoad');
      console.info("[syncLoadList_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[syncLoadList_0200] syncLoad: " + JSON.stringify(JSON.parse(strJson).$attrs.syncLoad));
      expect(JSON.parse(strJson).$attrs.syncLoad).assertEqual(true);
      let btn2: Component = await driver.findComponent(ON.id('list_syncLoad_scrollTo'));
      await btn2.click();
      await CommonFunc.sleep(2000);
      await driver.assertComponentExist(ON.text('图片50'));
      console.info('[syncLoadList_0200] END');
      done();
    });
  })
}
