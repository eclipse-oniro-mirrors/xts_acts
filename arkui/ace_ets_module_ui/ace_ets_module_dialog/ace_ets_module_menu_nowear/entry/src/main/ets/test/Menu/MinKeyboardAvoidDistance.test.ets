/*
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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function MinKeyboardAvoidDistance() {
  describe('MinKeyboardAvoidDistance', () => {
    beforeEach(async (done: Function) => {
      console.info("MinKeyboardAvoidDistance beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/MinKeyboardAvoidDistance',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MinKeyboardAvoidDistance state pages:" + JSON.stringify(pages));
        if (!("MinKeyboardAvoidDistance" == pages.name)) {
          console.info("get MinKeyboardAvoidDistance pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push MinKeyboardAvoidDistance page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MinKeyboardAvoidDistance page error:" + err);
      }
      console.info("MinKeyboardAvoidDistance beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   MinKeyboardAvoidDistance_0100
     * @tc.number MinKeyboardAvoidDistance_0100
     * @tc.desc   Test keyboardAvoidMode MenuKeyboardAvoidMode.TRANSLATE_AND_RESIZE and minKeyboardAvoidDistance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MinKeyboardAvoidDistance_0100', Level.LEVEL2, async (done: Function) => {
      console.info('MinKeyboardAvoidDistance_0100 START');
      await CommonFunc.sleep(1000);
      if (globalThis.winLeft == 0) {
        let driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let button = await driver.findComponent(ON.id('showMenuId'));
        await button.click();
        console.info('[MinKeyboardAvoidDistance_0100] button click'); 
        await CommonFunc.sleep(1000);
        let menuItemContent5 = await driver.findComponent(ON.text('5MenuItemContent'));
        expect(menuItemContent5 !== null ).assertTrue();
        await CommonFunc.sleep(3000);
        let menuItemContent52 = await driver.findComponent(ON.text('5MenuItemContent'));
        expect(menuItemContent52 !== null ).assertTrue();
        await CommonFunc.sleep(1000);
      }
      console.info('MinKeyboardAvoidDistance_0100 END');
      done();
    });

  })
}