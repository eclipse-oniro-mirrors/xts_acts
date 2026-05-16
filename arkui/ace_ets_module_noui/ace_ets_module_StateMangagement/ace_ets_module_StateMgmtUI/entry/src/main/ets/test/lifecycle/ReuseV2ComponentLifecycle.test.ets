/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';


export default function reuseV2ComponentLifecycleTest() {
  describe('reuseV2ComponentLifecycleTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ReuseV2ComponentLifecycle beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/lifecycle/ReuseV2ComponentLifecycle",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ReuseV2ComponentLifecycle state pages:" + JSON.stringify(pages));
        if (!("ReuseV2ComponentLifecycle" == pages.name)) {
          console.info("get ReuseV2ComponentLifecycle pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ReuseV2ComponentLifecycle page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ReuseV2ComponentLifecycle page error:" + err);
      }
      console.info("ReuseV2ComponentLifecycle beforeEach end");
      done();
    });

    afterEach(() => {
      hilog.info(0x0000, 'ReuseV2ComponentLifecycle', 'afterEach: test case finished');
    });

    afterAll(async () => {
      AppStorage.delete('ReuseV2ActiveKey');
      AppStorage.delete('ReuseV2InactiveKey');
      hilog.info(0x0000, 'ReuseV2ComponentLifecycle', 'afterAll: all tests finished');
    });



    /**
     * @tc.name   SUB_ARKUI_REUSEV2_COMPONENTINACTIVE_0100
     * @tc.number SUB_ARKUI_REUSEV2_COMPONENTINACTIVE_0100
     * @tc.desc   Test @ComponentInactive triggers when @ReusableV2 component becomes inactive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_REUSEV2_COMPONENTINACTIVE_0100', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'ReuseV2ComponentLifecycle', 'reuseV2ComponentInactive_0100 START');
      let driver = Driver.create();
      let changeBtn = await driver.findComponent(ON.id('changeBtnV2'));
      await changeBtn.click();
      await CommonFunc.sleep(1000);
      let text = AppStorage.get<string>('ReuseV2InactiveKey')
      hilog.info(0x0000, 'ReuseV2ComponentLifecycle', 'inactiveText: ' + text);
      expect(text).assertEqual('Inactive');
      hilog.info(0x0000, 'ReuseV2ComponentLifecycle', 'reuseV2ComponentInactive_0100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_REUSEV2_COMPONENTACTIVE_0100
     * @tc.number SUB_ARKUI_REUSEV2_COMPONENTACTIVE_0100
     * @tc.desc   Test @ComponentActive triggers when @ReusableV2 component becomes active
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_REUSEV2_COMPONENTACTIVE_0100', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'ReuseV2ComponentLifecycle', 'reuseV2ComponentActive_0100 START');
      let driver = Driver.create();
      let changeBtn = await driver.findComponent(ON.id('changeBtnV2'));
      await changeBtn.click();
      await CommonFunc.sleep(1000);
      let text = AppStorage.get<string>('ReuseV2ActiveKey')
      hilog.info(0x0000, 'ReuseV2ComponentLifecycle', 'activeText: ' + text);
      expect(text).assertEqual('Active')
      hilog.info(0x0000, 'ReuseV2ComponentLifecycle', 'reuseV2ComponentActive_0100 END');
    });
  });
}