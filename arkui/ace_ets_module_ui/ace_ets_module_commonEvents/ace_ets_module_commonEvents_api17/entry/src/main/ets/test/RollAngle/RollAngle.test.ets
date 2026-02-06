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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function RollAngle() {
  describe('RollAngle', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RollAngle/RollAngle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get RollAngle state pages: ' + JSON.stringify(pages));
        if (!('RollAngle' == pages.name)) {
          console.info('get RollAngle state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push RollAngle success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push RollAngle page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('RollAngle after each called');
    });

    /**
     * @tc.number RollAngle_0010
     * @tc.name RollAngle
     * @tc.desc api
     * @tc.level: Level 0
     * @tc.type :
     * @tc.size :
     */
    it('RollAngle_0100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) => {
      console.info('[RollAngle_0100] START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('Touch'));
      await button.click();
      await CommonFunc.sleep(3000);

      // test the child component response
      let strJson = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[RollAngle_0100] strJson is: ' + strJson);
      console.info('[RollAngle_0100] RollAngle obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).not().assertEqual('undefined');

      console.info('[RollAngle_0100] END')
      done();
    });
  })
}