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


export default function atomicservicewebTest() {
  describe('AtomicServiceWebTest', () => {
    beforeEach(async (done: Function) => {
      console.info("AtomicServiceWebTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/atomicserviceweb/AtomicServiceWebTest',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AtomicServiceWebTest state pages: " + JSON.stringify(pages));
        if (!('AtomicServiceWeb' == pages.name)) {
          console.info("get AtomicServiceWebTest pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push AtomicServiceWebTest page result successful");
        }
      }
      catch (err) {
        console.error("push AtomicServiceWebTest page error: " + err);
        expect().assertFail();
      }
      await Utils.sleep(1000);
      console.info('AtomicServiceWebTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('AtomicServiceWebTest after each called');
    });

    /**
     * @tc.number AtomicServiceWeb
     * @tc.name AtomicServiceWebTest_0100
     * @tc.desc Test AtomicServiceWeb
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('AtomicServiceWebTest_0100', 0, async (done: Function) => {
      console.info('[AtomicServiceWebTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 查看AtomicServiceWebTest是否存在以下入口。
      let tab1 = await driver.findComponent(ON.text("发送消息"));
      expect(tab1 !== null).assertTrue();
      console.info('[AtomicServiceWebTest_0100] END');
      done();
    });
  })
}