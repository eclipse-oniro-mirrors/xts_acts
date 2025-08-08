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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';


export default function atomicservicenavigationTest() {
  describe('atomicservicenavigationTest', () => {
    beforeEach(async (done: Function) => {
      console.info("atomicservicenavigationTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/atomicservicenavigation/AtomicServiceNavigationTest',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get atomicservicenavigationTest state pages: " + JSON.stringify(pages));
        if (!('AtomicServiceNavigation' == pages.name)) {
          console.info("get atomicservicenavigationTest pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push atomicservicenavigationTest page result successful");
        }
      }
      catch (err) {
        console.error("push atomicservicenavigationTest page error: " + err);
        expect().assertFail();
      }
      await Utils.sleep(1000);
      console.info('atomicservicenavigationTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('chipDirectionTest after each called');
    });

    /**
     * @tc.number atomicservicenavigation
     * @tc.name atomicservicenavigationTest_0100
     * @tc.desc Test atomicservicenavigation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('atomicservicenavigationTest_0100', 0, async (done: Function) => {
      console.info('[atomicservicenavigationTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 查看atomicservicenavigationTest是否存在以下入口。
      let tab1 = await driver.findComponent(ON.text("主题"));
      expect(tab1 !== null).assertTrue();
      console.info('[atomicservicenavigationTest_0100] END');
      done();
    });
  })
}