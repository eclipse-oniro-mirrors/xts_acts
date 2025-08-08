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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function componentSnapshot() {
  describe('componentSnapshot', () => {
    beforeEach(async (done: Function) => {
      console.info('componentSnapshot beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/componentSnapshot/componentSnapshot',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get componentSnapshot state pages: ' + JSON.stringify(pages));
        if (!('componentSnapshot' == pages.name)) {
          console.info('get componentSnapshot state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push componentSnapshot success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push componentSnapshot page error: ' + err);
        expect().assertFail();
      }
      done();
    });

        /**
     * @tc.number componentSnapshot_0100
     * @tc.name   componentSnapshot_0100
     * @tc.desc   test the componentSnapshot 
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('componentSnapshot_0100', 0, async (done: Function) => {
      console.info('[componentSnapshot_0100] START');
      let driver: Driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('button1'));
      await button1.click();
      await CommonFunc.sleep(2000);

      // test the child component response
      let strJson = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[componentSnapshot_0100] strJson is: ' + strJson);
      console.info('[componentSnapshot_0100] componentSnapshot obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('suc');

      console.info('[componentSnapshot_0100] END');
      done();
    });
  })
}