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
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils'
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from "../../MainAbility/utils/Common"

export default function ScreenOnVisibleRequestFullWindow() {
  describe('ScreenOnVisibleRequestFullWindow', () => {
    beforeAll(async () => {
      console.info("ScreenOnVisibleRequestFullWindow beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AppStorageTest/ScreenOnVisibleRequestFullWindow',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ScreenOnVisibleRequestFullWindow state success " + JSON.stringify(pages));
        if (!("ScreenOnVisibleRequestFullWindow" == pages.name)) {
          console.info("get ScreenOnVisibleRequestFullWindow state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push ScreenOnVisibleRequestFullWindow page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ScreenOnVisibleRequestFullWindow page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("ScreenOnVisibleRequestFullWindow after each called");
    });

    /**
     * @tc.name   ScreenOnVisibleRequestFullWindow_0100
     * @tc.number ScreenOnVisibleRequestFullWindow_0100
     * @tc.desc   screenOnVisible test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ScreenOnVisibleRequestFullWindow_0100', Level.LEVEL2, async(done: Function) => {
      console.info("ScreenOnVisibleRequestFullWindow_0100 START")
      let driver = Driver.create()
      await CommonFunc.sleep(1000)
      let button = await driver.findComponent(ON.id("btn_screenOnVisible_id"))
      await button.click()
      await CommonFunc.sleep(1000)
      expect(AppStorage.get('ScreenOnVisibleFalse')).assertEqual('success');
      AppStorage.delete('ScreenOnVisibleFalse');
      expect(AppStorage.get('screenOnVisibleNull')).assertEqual('success');
      AppStorage.delete('screenOnVisibleNull');
      expect(AppStorage.get('screenOnVisibleUndefined')).assertEqual('success');
      AppStorage.delete('screenOnVisibleUndefined');
      console.info("[ScreenOnVisibleRequestFullWindow_0100] END")
      done()
    });

    /**
     * @tc.name   ScreenOnVisibleRequestFullWindow_0200
     * @tc.number ScreenOnVisibleRequestFullWindow_0200
     * @tc.desc   requestFullWindow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ScreenOnVisibleRequestFullWindow_0200', Level.LEVEL2, async(done: Function) => {
      console.info("ScreenOnVisibleRequestFullWindow_0200 START")
      let driver = Driver.create()
      await CommonFunc.sleep(1000)
      let button = await driver.findComponent(ON.id("btn_requestFullWindow_id"))
      await button.click()
      await CommonFunc.sleep(1000)
      expect(AppStorage.get('requestFullWindowNull')).assertEqual('success');
      AppStorage.delete('requestFullWindowNull');
      expect(AppStorage.get('requestFullWindowUndefined')).assertEqual('success');
      AppStorage.delete('requestFullWindowUndefined');
      console.info("[ScreenOnVisibleRequestFullWindow_0200] END")
      done()
    });
  })
}