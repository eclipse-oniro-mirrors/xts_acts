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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager,Callback } from '../../MainAbility/common/MessageManager';

export default function IfElse005Test() {
  describe('IfElse005Test', () => {
    beforeEach(async (done: Function) => {
      console.info("IfElse005Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/IfElse/IfElse005',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get IfElse005Test state pages: " + JSON.stringify(pages));
        if (!("IfElse005" == pages.name)) {
          console.info("get IfElse005Test state pages.name: " + JSON.stringify(pages.name));
          let result = router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push IfElse005Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push IfElse005Test page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    IfElse005Test_01
     * @tc.name      IfElse005Test_01
     * @tc.desc      api
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('IfElse005Test_01', Level.LEVEL0, async (done: Function) => {
      console.info('[IfElse005Test_01] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('btn'));
      let text: ESObject = JSON.parse(getInspectorByKey('text'));
      expect(text.$attrs.content).assertEqual('this.flag = false.');
      await btn.click();
      await CommonFunc.sleep(1000);
      text = JSON.parse(getInspectorByKey('text'));
      expect(text.$attrs.content).assertEqual('this.flag = true.');
      await btn.click();
      await CommonFunc.sleep(1000);
      text = JSON.parse(getInspectorByKey('text'));
      expect(text.$attrs.content).assertEqual('this.flag = false.');
      console.info('[IfElse005Test_01] END');
      done();
    });
  })
}