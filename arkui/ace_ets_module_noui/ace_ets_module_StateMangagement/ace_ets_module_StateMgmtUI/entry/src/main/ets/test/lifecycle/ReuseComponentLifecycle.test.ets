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

export default function reuseComponentLifecycleTest() {
  describe('reuseComponentLifecycleTest', () => {

    beforeEach(async (done: Function) => {
      console.info("ReuseComponentLifecycle beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/lifecycle/ReuseComponentLifecycle",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ReuseComponentLifecycle state pages:" + JSON.stringify(pages));
        if (!("ReuseComponentLifecycle" == pages.name)) {
          console.info("get ReuseComponentLifecycle pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ReuseComponentLifecycle page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ReuseComponentLifecycle page error:" + err);
      }
      console.info("ReuseComponentLifecycle beforeEach end");
      done();
    });

    afterEach(() => {
      hilog.info(0x0000, 'ReuseComponentLifecycle', 'afterEach: test case finished');
    });

    afterAll(async () => {
      hilog.info(0x0000, 'ReuseComponentLifecycle', 'afterAll: all tests finished');
    });



    /**
     * @tc.name   SUB_ARKUI_REUSE_COMPONENTINACTIVE_0100
     * @tc.number SUB_ARKUI_REUSE_COMPONENTINACTIVE_0100
     * @tc.desc   Test @ComponentInactive triggers when @Reusable component becomes inactive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_REUSE_COMPONENTINACTIVE_0100', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'ReuseComponentLifecycle', 'reuseComponentInactive_0100 START');
      let driver = Driver.create();
      let changeBtn = await driver.findComponent(ON.id('changeBtn'));
      await changeBtn.click();
      await CommonFunc.sleep(1000);
      let inactiveText = await driver.findComponent(ON.id('inactiveText'));
      let text = await inactiveText.getText();
      hilog.info(0x0000, 'ReuseComponentLifecycle', 'inactiveText: ' + text);
      expect(text.includes('Inactive')).assertTrue();
      hilog.info(0x0000, 'ReuseComponentLifecycle', 'reuseComponentInactive_0100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_REUSE_COMPONENTACTIVE_0100
     * @tc.number SUB_ARKUI_REUSE_COMPONENTACTIVE_0100
     * @tc.desc   Test @ComponentActive triggers when @Reusable component becomes active
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_REUSE_COMPONENTACTIVE_0100', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'ReuseComponentLifecycle', 'reuseComponentActive_0100 START');
      let driver = Driver.create();
      let changeBtn = await driver.findComponent(ON.id('changeBtn'));
      await changeBtn.click();
      await CommonFunc.sleep(1000);
      let activeText = await driver.findComponent(ON.id('activeText'));
      let text = await activeText.getText();
      hilog.info(0x0000, 'ReuseComponentLifecycle', 'activeText: ' + text);
      expect(text.includes('Active')).assertTrue();
      hilog.info(0x0000, 'ReuseComponentLifecycle', 'reuseComponentActive_0100 END');
    });

  });
}