/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';


export default function TextMenuItemIdEqualsTest() {
  describe('TextMenuItemIdEqualsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextMenuItemIdEqualsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextMenuItemIdEqualsTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextMenuItemIdEqualsTest state pages:" + JSON.stringify(pages));
        if (!("TextMenuItemIdEqualsTest" == pages.name)) {
          console.info("get TextMenuItemIdEqualsTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
          console.info("push TextMenuItemIdEqualsTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextMenuItemIdEqualsTest page error:" + err);
      }
      console.info("TextMenuItemIdEqualsTest beforeEach end");
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await driver.delayMs(500)
      console.info("TextMenuItemIdEqualsTest after each called");
    });
    afterAll(async ()=>{
      AppStorage.delete('TextMenuItemIdEquals1')
      AppStorage.delete('TextMenuItemIdEquals2')
    })
    /**
     * @tc.name   TextMenuItemIdEqualsTest_0100
     * @tc.number TextMenuItemIdEqualsTest_0100
     * @tc.desc   Test Equals function in StyleString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdEqualsTest_0100', Level.LEVEL2, async (done: Function) => {
      // Test stop
      console.info('[TextMenuItemIdEqualsTest_0100] START');
      let driver = Driver.create();
      await driver.delayMs(500)
      let Text2 = await driver.findComponent(ON.id("TextEditMenuOptions2"));
      await driver.delayMs(500)
      await Text2.longClick()
      await driver.delayMs(500)
      await driver.triggerKey(2070)
      await driver.delayMs(500)
      expect(AppStorage.get('TextMenuItemIdEquals2')).assertFalse()
      console.info('[TextMenuItemIdEqualsTest_0100] END');
      done();
    });
    /**
     * @tc.name   TextMenuItemIdEqualsTest_0200
     * @tc.number TextMenuItemIdEqualsTest_0200
     * @tc.desc   Test Equals function in StyleString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdEqualsTest_0200', Level.LEVEL2, async (done: Function) => {
      // Test stop
      console.info('[TextMenuItemIdEqualsTest_0200] START');
      let driver = Driver.create();
      await driver.delayMs(500)
      let Text1 = await driver.findComponent(ON.id("TextEditMenuOptions1"));
      await driver.delayMs(500)
      await Text1.longClick()
      await driver.delayMs(500)
      await driver.triggerKey(2070)
      await driver.delayMs(500)
      expect(AppStorage.get('TextMenuItemIdEquals1')).assertTrue()
      console.info('[TextMenuItemIdEqualsTest_0200] END');
      done();
    });
  })
}
