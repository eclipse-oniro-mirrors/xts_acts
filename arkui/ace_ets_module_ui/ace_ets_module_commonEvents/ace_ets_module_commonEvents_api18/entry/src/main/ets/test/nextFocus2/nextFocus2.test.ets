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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function nextFocus2() {
  describe('Button', () => {
    beforeEach(async (done: Function) => {
      console.info('Button beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/nextFocus2/nextFocus2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get Button state pages: ' + JSON.stringify(pages));
        if (!('Button' == pages.name)) {
          console.info('get Button state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push Button success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push Button page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number Button_0101
     * @tc.name   Button_0101
     * @tc.desc   test whether the nextFocus is effective
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('Button_0101', 0, async (done: Function) => {
      console.info('[Button_0101] START');
      let driver: Driver = Driver.create();
      await driver.triggerKey(2049);
      await CommonFunc.sleep(2000);
      await driver.triggerKey(2012);
      await CommonFunc.sleep(2000);
      await driver.triggerKey(2013);
      await CommonFunc.sleep(2000);
      await driver.triggerKey(2014);
      await CommonFunc.sleep(2000);
      await driver.triggerKey(2015);
      await CommonFunc.sleep(2000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(2000);
      await driver.triggerCombineKeys(2047,2049);
      await CommonFunc.sleep(2000);

      // test the child component response
      let strJson = getInspectorByKey('a7');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[Button_0101] obj is: ' + obj.$attrs.label);
      expect(obj.$attrs.label).assertEqual('suc');
      console.info('[Button_0101] END');
      done();
    });
  })
}