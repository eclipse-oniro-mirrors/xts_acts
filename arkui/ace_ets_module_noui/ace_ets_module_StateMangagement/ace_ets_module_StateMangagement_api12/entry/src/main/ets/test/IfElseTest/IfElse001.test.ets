/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import { UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager,Callback } from '../../MainAbility/common/MessageManager';

export default function IfElse001Test() {
  describe('IfElse001Test', () => {
    beforeEach(async (done: Function) => {
      console.info("IfElse001Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/IfElse/IfElse001',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get IfElse001Test state pages: " + JSON.stringify(pages));
        if (!("IfElse001" == pages.name)) {
          console.info("get IfElse001Test state pages.name: " + JSON.stringify(pages.name));
          let result = router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push IfElse001Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push IfElse001Test page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    IfElse001
     * @tc.name      IfElse001Test_01
     * @tc.desc      api
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('IfElse001Test_01', 0, async (done: Function) => {
      console.info('IfElse001Test_01 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text01 = await driver.findComponent(ON.id('if_else_001_01'));
      expect(await text01.getText()).assertEqual('value: 10, value小于20');
      let text02 = await driver.findComponent(ON.id('if_else_001_02'));
      expect(await text02.getText()).assertEqual('value: 100, value大于20');
      let text03 = await driver.findComponent(ON.id('if_else_001_03'));
      expect(await text03.getText()).assertEqual('value: 100, value大于20，小于1000');

      console.info('[IfElse001Test_01] END');
      done();
    });
  })
}