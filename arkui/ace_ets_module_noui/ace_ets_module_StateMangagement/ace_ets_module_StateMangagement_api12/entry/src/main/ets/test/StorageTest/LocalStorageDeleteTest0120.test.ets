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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
import { UiComponent, Driver, Component, UiWindow, ON, UIElementInfo } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function LocalStorageDeleteTest0120() {
  describe('LocalStorageDeleteTest0120', () => {
    beforeEach(async (done: Function) => {
      console.info("LocalStorageDeleteTest0120 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Storage/LocalStorageDelete0120',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LocalStorageDeleteTest0120 state pages: " + JSON.stringify(pages));
        if (!("LocalStorageDelete0120" == pages.name)) {
          console.info("get LocalStorageDeleteTest0120 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(1000);
          console.info("push LocalStorageDeleteTest0120 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LocalStorageDeleteTest0120 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number: SUB_ACE_BASIC_ETS_REF_0100
     * @tc.name: LocalStorageDeleteTest0120_0100
     * @tc.desc: aceEtsTest_ref
     * @tc.level: Level 0
     * @tc.type:
     * @tc.size:
     */
    it('LocalStorageDeleteTest0120_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('LocalStorageDeleteTest0120001 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id("btnDel"));
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(getInspectorByKey('tvIsDel'));
      console.info("[LocalStorageDeleteTest0120001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual("true");
      console.info('LocalStorageDeleteTest0120_0100 END');
    });
  })
}