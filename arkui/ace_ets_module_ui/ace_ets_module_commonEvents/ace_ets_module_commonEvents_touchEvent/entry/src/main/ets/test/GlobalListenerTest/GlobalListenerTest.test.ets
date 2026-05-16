/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';
import { UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection,
  MouseButton, WindowMode, PointerMatrix, Rect } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { KeyCode } from '@kit.InputKit';

export default function GlobalListenerTest() {
  describe('GlobalListenerTest', () => {
    beforeEach(async (done: Function) => {
      console.info("GetUIContextTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/globalListener/GlobalListenerTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GlobalListenerTest state pages:" + JSON.stringify(pages));
        if (!("GlobalListenerTest" == pages.name)) {
          console.info("get GlobalListenerTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GlobalListenerTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GlobalListenerTest page error:" + err);
      }
      console.info("GlobalListenerTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("GlobalListenerTest after each called");
    });

    /**
     * @tc.number    SUB_ACE_ARKUI_GLOBALLISTENER_0100
     * @tc.name      SUB_ACE_ARKUI_GLOBALLISTENER_0100
     * @tc.desc      test touch globalListener
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_GLOBALLISTENER_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_GLOBALLISTENER_0100] START');
      await Utils.sleep(100);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('listenTest'));
      await btn.click();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('listenTouch');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[SUB_ACE_ARKUI_GLOBALLISTENER_0100] globalListener: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('listenTouchType=1');
      console.info('[SUB_ACE_ARKUI_GLOBALLISTENER_0100] END');
      done();
    })

    /**
     * @tc.number    SUB_ACE_ARKUI_GLOBALLISTENER_0200
     * @tc.name      SUB_ACE_ARKUI_GLOBALLISTENER_0200
     * @tc.desc      test mouse globalListener
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_GLOBALLISTENER_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_GLOBALLISTENER_0200] START');
      await Utils.sleep(100);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('listenTest'));
      let rect = await btn.getBounds();
      let centerX = Math.round((rect.left + rect.right) / 2);
      let centerY = Math.round((rect.top + rect.bottom) / 2);
      await driver.mouseClick({ x: centerX, y: centerY }, MouseButton.MOUSE_BUTTON_RIGHT);
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('listenMouse');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[SUB_ACE_ARKUI_GLOBALLISTENER_0200] globalListener: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('listenButton=2,Action=2');
      console.info('[SUB_ACE_ARKUI_GLOBALLISTENER_0200] END');
      done();
    })

    /**
     * @tc.number    SUB_ACE_ARKUI_GLOBALLISTENER_0300
     * @tc.name      SUB_ACE_ARKUI_GLOBALLISTENER_0300
     * @tc.desc      test key globalListener
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_GLOBALLISTENER_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_GLOBALLISTENER_0300] START');
      await Utils.sleep(100);
      let driver = await Driver.create()
      await driver.triggerKey(KeyCode.KEYCODE_TAB);
      await Utils.sleep(2000);
      let strJson1 = getInspectorByKey('listenKey');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[SUB_ACE_ARKUI_GLOBALLISTENER_0300] globalListener: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('listenKeyType=1');
      console.info('[SUB_ACE_ARKUI_GLOBALLISTENER_0300] END');
      done();
    })
  })
}