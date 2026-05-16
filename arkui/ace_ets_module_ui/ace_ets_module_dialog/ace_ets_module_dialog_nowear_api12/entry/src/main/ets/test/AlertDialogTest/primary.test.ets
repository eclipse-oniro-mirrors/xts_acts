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

export default function primary() {
  describe('primary', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AlertDialog/primary',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get primary state success ' + JSON.stringify(pages));
        if (!('primary' == pages.name)) {
          console.info('get primary state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info('push primary page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push primary page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   primary_0100
     * @tc.number SUB_ACE_primary_0100
     * @tc.desc   To test the primary:true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('primary_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('primary_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('primary1'));
      await button.click();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2054);
      console.info('primary_0100 Enter');
      await CommonFunc.sleep(1500);
      let button1 = await driver.findComponent(ON.text('按钮1'));
      expect(button1 == null).assertTrue()
      // await button1.click();
      await CommonFunc.sleep(1000);
      console.info('primary_0100 END');
      done();
    });

    /**
     * @tc.name   primary_0200
     * @tc.number SUB_ACE_primary_0200
     * @tc.desc   To test the primary:fasle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('primary_0200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('primary_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('primary2'));
      await button.click();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2054);
      console.info('primary_0200 Enter');
      await CommonFunc.sleep(1500);
      let button1 = await driver.findComponent(ON.text('按钮1'));
      expect(button1 != null).assertTrue()
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('primary_0200 END');
      done();
    });
    
  })
}