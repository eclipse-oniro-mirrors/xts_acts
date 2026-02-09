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

export default function showDotIndicator() {
  describe('showDotIndicator', () => {
    beforeEach(async (done: Function) => {
      console.info("showDotIndicator beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Indicator/showDotIndicator",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get showDotIndicator state pages:" + JSON.stringify(pages));
        if (!("showDotIndicator" == pages.name)) {
          console.info("get showDotIndicator pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push showDotIndicator page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push showDotIndicator page error:" + err);
      }
      console.info("showDotIndicator beforeEach end");
      done();
    });

    /**
     * @tc.name   showDotIndicator_0100
     * @tc.number showDotIndicator_001
     * @tc.desc   Flip to the specified page.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showDotIndicator_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[showDotIndicator_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await driver.assertComponentExist(ON.text('2'));
      let btn1: Component = await driver.findComponent(ON.id('indicator_showNext'));
      await btn1.click();
      await CommonFunc.sleep(1500);
      await driver.assertComponentExist(ON.text('3'));

      let btn2: Component = await driver.findComponent(ON.id('indicator_showPrevious'));
      await btn2.click();
      await CommonFunc.sleep(1500);
      await driver.assertComponentExist(ON.text('2'));

      let btn3: Component = await driver.findComponent(ON.id('indicator_changeIndex'));
      await btn3.click();
      expect(btn3 !== null).assertTrue();
      await CommonFunc.sleep(1500);
      await driver.assertComponentExist(ON.text('4'));

      console.info('[showDotIndicator_0100] END');
      done();
    });
  })
}
