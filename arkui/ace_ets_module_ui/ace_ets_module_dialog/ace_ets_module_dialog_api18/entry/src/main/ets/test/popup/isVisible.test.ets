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

export default function isVisible() {
  describe('isVisible', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popup/isVisible',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get isVisible state success ' + JSON.stringify(pages));
        if (!('isVisible' == pages.name)) {
          console.info('get isVisible state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info('push isVisible page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push isVisible page error ' + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      if (AppStorage.get('isVisible') != undefined) {
        AppStorage.delete('isVisible')
      }
      await CommonFunc.sleep(1000);
      console.info("customDialogLevelOrder after each called");
    });

    /**
     * @tc.name   isVisible_0100
     * @tc.number SUB_ACE_isVisible_0100
     * @tc.desc   To test PopupStateChangeParam isVisible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isVisible_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('isVisible_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('popup'));
      await button.click();
      await CommonFunc.sleep(1000);
      let isVisible:boolean =  AppStorage.get('isVisible') as boolean
      console.log(isVisible + 'event.isVisible')
      expect(isVisible).assertTrue()
      await button.click();
      await CommonFunc.sleep(1000);
      isVisible =  AppStorage.get('isVisible') as boolean
      expect(isVisible).assertFalse()
      console.info('isVisible_0100 END');
      done();
    });
  })
}