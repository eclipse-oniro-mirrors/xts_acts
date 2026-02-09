/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common';
import { MouseButton } from '@kit.TestKit';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

export default function MouseEventWindowTest() {
  describe('MouseEventWindowTest', () => {
    beforeEach(async (done: Function) => {
      console.info('MouseEventWindow beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MouseEvent/MouseEventWindow',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get MouseEventWindow state pages:' + JSON.stringify(pages));
        if (!('MouseEventWindow' == pages.name)) {
          console.info('get MouseEventWindow state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push MouseEventWindow page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push MouseEventWindow page error:' + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('MouseEventWindow after each called');
    });

    /**
     * @tc.name   MouseEventWindow_0100
     * @tc.number MouseEventWindow_0100
     * @tc.desc   for test ENTER_WINDOW,LEAVE_WINDOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MouseEventWindow_0100', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(500);
      console.info('MouseEventWindow_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let mouseButton = await driver.findComponent(ON.id('mouseButton'));
      let rect = await mouseButton.getBoundsCenter();
      await driver.mouseClick({ x: rect.x, y: rect.y }, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(2000);

      let text = await driver.findComponent(ON.id('mouseText'));
      await text.click();
      await CommonFunc.sleep(2000);

      await driver.mouseClick({ x: rect.x, y: rect.y }, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(2000);
      expect(AppStorage.get('ENTER_WINDOW')).assertEqual(MouseAction.ENTER_WINDOW);
      expect(MouseAction.ENTER_WINDOW).assertEqual(4);
      await text.click();
      await CommonFunc.sleep(2000);
      expect(AppStorage.get('LEAVE_WINDOW')).assertEqual(MouseAction.LEAVE_WINDOW);
      expect(MouseAction.LEAVE_WINDOW).assertEqual(5);
      console.info('[MouseEventWindow_0100] END');
      done();
    });
  })
}