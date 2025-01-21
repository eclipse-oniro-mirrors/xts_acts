/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';


export default function PanGestureEventJsunit() {
  describe('PanGestureEventJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("PanGestureEventJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PanGestureEvent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PanGestureEventJsunit state pages: " + JSON.stringify(pages));
        if (!("PanGestureEvent" == pages.name)) {
          console.info("get PanGestureEventJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push PanGestureEventJsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PanGestureEventJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('PanGestureEventJsunit_0100', 0, async (done: Function) => {
      // Get the information of the GestureEvent
      console.info('[PanGestureEventJsunit_0100] START');
      let driver = await UiDriver.create()
      await driver.swipe(200, 400, 400, 400);
      await CommonFunc.sleep(500);
      let textComponent = await driver.findComponent(BY.key('velocityX'));
      let text = await textComponent.getText();
      await CommonFunc.sleep(1000);
      expect(text == "0").assertFalse();
      console.info('[PanGestureEventJsunit_0100] END');
      done();
    });

    it('PanGestureEventJsunit_0200', 0, async (done: Function) => {
      // Get the information of the GestureEvent
      console.info('[PanGestureEventJsunit_0200] START');
      let driver = await UiDriver.create()
      await driver.swipe(200, 400, 400, 400);
      await CommonFunc.sleep(500);
      let textComponent = await driver.findComponent(BY.key('velocityY'));
      let text = await textComponent.getText();
      await CommonFunc.sleep(1000);
      expect(text == "0").assertFalse();
      console.info('[PanGestureEventJsunit_0200] END');
      done();
    });

    it('PanGestureEventJsunit_0300', 0, async (done: Function) => {
      // Get the information of the GestureEvent
      console.info('[PanGestureEventJsunit_0300] START');
      let driver = await UiDriver.create()
      await driver.swipe(200, 400, 400, 400);
      await CommonFunc.sleep(500);
       let textComponent = await driver.findComponent(BY.key('velocity'));
      let text = await textComponent.getText();
      await CommonFunc.sleep(1000);
      expect(text == "0").assertFalse();
      console.info('[PanGestureEventJsunit_0300] END');
      done();
    });
  })
}
