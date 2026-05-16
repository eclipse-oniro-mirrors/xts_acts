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
export default function V1PropObservedTest() {
  describe('V1PropObservedTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/uiutils/PropObserved',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get V1PropObservedTest state pages: ' + JSON.stringify(pages));
        if (!('V1PropObservedTest' == pages.name)) {
          console.info('get V1PropObservedTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push V1PropObservedTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push V1PropObservedTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('V1PropObservedTest after each called');
    });
    /**
     * @tc.name   V1PropObservedTest_0010
     * @tc.number V1PropObservedTest_0010
     * @tc.desc   V1ObservedTest test succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('V1PropObservedTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('V1PropObservedTest_0010 START');
      await CommonFunc.sleep(2000);
      let driver = await Driver.create();
      let btn: Component = await driver.findComponent(ON.id('PropTest'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let text_6 = await (await driver.findComponent(ON.id('PropText'))).getText();
      console.info("[V1PropObservedTest_0010] component text_6: " + text_6);
      await CommonFunc.sleep(1000);
      expect(text_6).assertEqual('@Prop true ');
      done();
    });
  })
}