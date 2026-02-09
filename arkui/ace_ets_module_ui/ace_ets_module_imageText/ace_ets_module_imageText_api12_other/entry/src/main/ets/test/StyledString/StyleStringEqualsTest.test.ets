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


export default function StyleStringEqualsTest() {
  describe('StyleStringEqualsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("StyleStringEqualsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/StyleStringEqualsTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StyleStringEqualsTest state pages:" + JSON.stringify(pages));
        if (!("StyleStringEqualsTest" == pages.name)) {
          console.info("get StyleStringEqualsTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
          console.info("push StyleStringEqualsTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StyleStringEqualsTest page error:" + err);
      }
      console.info("StyleStringEqualsTest beforeEach end");
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await driver.delayMs(500)
      console.info("StyleStringEqualsTest after each called");
    });
    afterAll(async ()=>{
      AppStorage.delete('equalsResult1')
      AppStorage.delete('equalsResult2')
    })
    /**
     * @tc.name   StyleStringEqualsTest_0100
     * @tc.number StyleStringEqualsTest_0100
     * @tc.desc   Test Equals function in StyleString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StyleStringEqualsTest_0100', Level.LEVEL2, async (done: Function) => {
      // Test stop
      console.info('[StyleStringEqualsTest_0100] START');
      let driver = Driver.create();
      await driver.delayMs(500)
      let Equals1 = await driver.findComponent(ON.id("Equals1"));
      await driver.delayMs(500)
      await Equals1.click()
      await driver.delayMs(500)
      expect(AppStorage.get('equalsResult1')).assertTrue()
      console.info('[StyleStringEqualsTest_0100] END');
      done();
    });
    /**
     * @tc.name   StyleStringEqualsTest_0200
     * @tc.number StyleStringEqualsTest_0200
     * @tc.desc   Test Equals function in StyleString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StyleStringEqualsTest_0200', Level.LEVEL2, async (done: Function) => {
      // Test stop
      console.info('[StyleStringEqualsTest_0200] START');
      let driver = Driver.create();
      await driver.delayMs(500)
      let Equals2 = await driver.findComponent(ON.id("Equals2"));
      await driver.delayMs(500)
      await Equals2.click()
      await driver.delayMs(500)
      expect(AppStorage.get('equalsResult2')).assertFalse()
      console.info('[StyleStringEqualsTest_0200] END');
      done();
    });
  })
}
