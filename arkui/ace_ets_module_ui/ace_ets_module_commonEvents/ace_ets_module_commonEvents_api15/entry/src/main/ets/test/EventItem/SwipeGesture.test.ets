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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';

export default function swipeGestureEventTest() {
  describe('swipeGestureEvent', () => {
    beforeEach(async (done: Function) => {
      console.info('swipeGestureEvent beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/EventItem/SwipeGesture',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get swipeGestureEvent state pages: ' + JSON.stringify(pages));
        if (!('SwipeGesture' == pages.name)) {
          console.info('get swipeGestureEvent state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push swipeGestureEvent success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push swipeGestureEvent page error: ' + err);
        expect().assertFail();
      }
      done();
    });
    
    /* *
    * @tc.number
    * @tc.name  : SwipeGesture1_0100
    * @tc.desc  : To test the new item of GestureEvent.
    * @tc.level : Level 2
    */
    it('SwipeGesture1_0100', Level.LEVEL0, async (done: Function) => {
      console.info('SwipeGesture1_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let colum = CommonFunc.getComponentRectOnScreen('SwipeGesture1');
      let top = colum.top
      let left = colum.left
      await driver.swipe(Math.round(globalThis.winLeft + 100), Math.round(top + 100), Math.round(globalThis.winLeft + 500), Math.round(top + 500), 600)
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('value');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SwipeGesture1_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[SwipeGesture1_0100] title: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('0');
      console.info('[SwipeGesture1_0100] END');
      done();
    });

  })
}

