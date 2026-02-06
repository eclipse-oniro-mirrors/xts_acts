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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, MouseButton} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';


export default function mouseEventTest() {
  describe('mouseEvent', () => {
    beforeEach(async (done: Function) => {
      console.info('mouseEvent beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/EventItem/Mouse',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get mouseEvent state pages: ' + JSON.stringify(pages));
        if (!('Mouse' == pages.name)) {
          console.info('get mouseEvent state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push mouseEvent success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push mouseEvent page error: ' + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   Mouse1_0100
     * @tc.number Mouse1_0100
     * @tc.desc   To test the new item of MouseEvent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Mouse1_0100', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('Mouse1_0100 START');
      let areaObj = CommonFunc.getComponentRectOnScreen('mouse');
      let areaHeight = areaObj.bottom - areaObj.top
      let areaWidth = areaObj.right - areaObj.left
      let mouseX = Math.round(areaObj.left + areaWidth * 0.5)
      let mouseY = Math.round(areaObj.top + areaHeight * 0.5)
      let driver = await Driver.create();
      await driver.mouseClick({x: mouseX, y: mouseY}, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('value');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[Mouse1_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[Mouse1_0100] title: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('0,0,0,1');
      console.info('[Mouse1_0100] END');
      done();
    });
  })
}

