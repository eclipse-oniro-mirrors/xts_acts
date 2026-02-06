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
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';


export default function interstitialdialogactionTest() {
  describe('interstitialdialogactionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("interstitialdialogactionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/interstitialdialogaction/InterstitialDialogActionTest',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get interstitialdialogactionTest state pages: " + JSON.stringify(pages));
        if (!('interstitialdialogaction' == pages.name)) {
          console.info("get interstitialdialogactionTest pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push interstitialdialogactionTest page result successful");
        }
      }
      catch (err) {
        console.error("push interstitialdialogactionTest page error: " + err);
        expect().assertFail();
      }
      await Utils.sleep(1000);
      console.info('interstitialdialogactionTest beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('interstitialdialogaction after each called');
    });

    /**
     * @tc.name   interstitialdialogactionTest_0100
     * @tc.number interstitialdialogaction
     * @tc.desc   Test interstitialdialogaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('interstitialdialogactionTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[interstitialdialogactionTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 查看interstitialdialogactionTest是否存在以下入口。
      let tab1 = await driver.findComponent(ON.text("show dialog 1"));
      expect(tab1 !== null).assertTrue();
      console.info('[interstitialdialogactionTest_0100] END');
      done();
    });
  })
}