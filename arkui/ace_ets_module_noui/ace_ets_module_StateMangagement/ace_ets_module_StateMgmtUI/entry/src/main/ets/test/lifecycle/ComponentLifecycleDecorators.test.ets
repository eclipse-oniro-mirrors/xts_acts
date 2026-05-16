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
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
export default function componentLifecycleDecoratorsTest() {
  describe('componentLifecycleDecoratorsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ComponentLifecycleDecorators beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/lifecycle/ComponentLifecycleDecorators",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ComponentLifecycleDecorators state pages:" + JSON.stringify(pages));
        if (!("ComponentLifecycleDecorators" == pages.name)) {
          console.info("get ComponentLifecycleDecorators pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ComponentLifecycleDecorators page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ComponentLifecycleDecorators page error:" + err);
      }
      console.info("ComponentLifecycleDecorators beforeEach end");
      done();
    });

    afterEach(() => {
      hilog.info(0x0000, 'ComponentLifecycleDecorators', 'afterEach: test case finished');
    });

    afterAll(async () => {
      AppStorage.delete('ComponentActiveKey');
      AppStorage.delete('ComponentInactiveKey');
      hilog.info(0x0000, 'ComponentLifecycleDecorators', 'afterAll: all tests finished');
    });


    /**
     * @tc.name   SUB_ARKUI_COMPONENTLIFECYCLE_COMPONENTINACTIVE_0100
     * @tc.number SUB_ARKUI_COMPONENTLIFECYCLE_COMPONENTINACTIVE_0100
     * @tc.desc   Test @ComponentInactive decorator triggers when component becomes inactive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_COMPONENTLIFECYCLE_COMPONENTINACTIVE_0100', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'ComponentLifecycleDecorators', 'componentInactive_0100 START');
      let driver = Driver.create();
      let scrollBtn = await driver.findComponent(ON.id('scrollToIndexBtn'));
      await scrollBtn.click();
      await CommonFunc.sleep(1000);
      let inactiveTextComp = await driver.findComponent(ON.id('inactiveText'));
      let inactiveText = await inactiveTextComp.getText();
      hilog.info(0x0000, 'ComponentLifecycleDecorators', 'inactiveText: ' + inactiveText);
      let storageValueInactive = AppStorage.get<string>('ComponentInactiveKey');
      let storageValueActive = AppStorage.get<string>('ComponentActiveKey');
      hilog.info(0x0000, 'ComponentLifecycleDecorators', 'storageValue: ' + storageValueInactive);
      expect(storageValueInactive).assertEqual('InactiveItem0')
      expect(storageValueActive).assertEqual('ActiveItem6')
      hilog.info(0x0000, 'ComponentLifecycleDecorators', 'componentInactive_0100 END');
    });

  });
}