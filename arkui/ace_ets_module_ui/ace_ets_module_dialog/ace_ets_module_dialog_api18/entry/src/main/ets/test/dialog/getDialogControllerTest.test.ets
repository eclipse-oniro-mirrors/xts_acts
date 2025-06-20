/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level,Size,TestType } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function getDialogControllerTest() {
  describe('getDialogControllerTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialog/getDialogControllerTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get getDialogControllerTest state success ' + JSON.stringify(pages));
        if (!('getDialogControllerTestApi' == pages.name)) {
          console.info('get getDialogControllerTest state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info('push getDialogControllerTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push getDialogControllerTest page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.number SUB_ACE_getDialogControllerTest_0100
     * @tc.name getDialogControllerTest_0100
     * @tc.desc To test the getDialogController interface.
     * @tc.level: Level 0
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
    */
    it('getDialogControllerTest_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('getDialogControllerTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('custom'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('custom'));
      expect(button1 != null).assertTrue()
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('getDialogControllerTest_0100 END');
      done();
    });
  })
}