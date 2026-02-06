/*
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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium'
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function customKeyboardSearchTest() {
  describe('customKeyboardSearchTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomKeyboard/search',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get customKeyboardSearchTest state pages: ' + JSON.stringify(pages));
        if (!('shaderStyle' == pages.name)) {
          console.info('get customKeyboardSearchTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push customKeyboardSearchTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push customKeyboardSearchTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('CustomKeyboardTest after each called');
    });

    /**
     * @tc.number    customKeyboardSearchTest_0010
     * @tc.name      customKeyboardSearchTest_0010
     * @tc.desc      The Search component supports custom keyboards. Expected: The button's text content is 'delete'.
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('customKeyboardSearchTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[customKeyboardSearchTest_0010] START');

      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('BtnDelete'));
      let text = await button.getText();
      
      console.info('[customKeyboardSearchTest_0010] textContent: ' + text);
      expect(text).assertEqual('delete');

      console.info('[customKeyboardSearchTest_0010] END');
      done();
    });
  })
}