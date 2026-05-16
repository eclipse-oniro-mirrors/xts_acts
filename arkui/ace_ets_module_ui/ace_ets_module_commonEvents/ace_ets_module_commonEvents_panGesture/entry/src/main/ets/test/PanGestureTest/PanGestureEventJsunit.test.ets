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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';

export default function PanGestureEventJsunit() {
  describe('PanGestureEventJsunit', () => {
      beforeEach(async (done: Function) => {
config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
	done();
});
    beforeAll(async (done: Function) => {
      console.info("PanGestureEventJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PanGesture/PanGestureEvent',
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

    /**
     * @tc.name   PanGestureEventJsunit_0100
     * @tc.number PanGestureEventJsunit_0100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PanGestureEventJsunit_0100', Level.LEVEL0, async (done: Function) => {
      // Get the information of the GestureEvent
      console.info('[PanGestureEventJsunit_0100] START');
      let driver = await UiDriver.create()
      await CommonFunc.sleep(500);
      let colum = CommonFunc.getComponentRectOnScreen('PanGestureEvent_column_id');
      let top = colum.top
      let bottom = colum.bottom
      let left = colum.left
      let right = colum.right
      await driver.swipe(Math.round(left + (colum.right - colum.left)/2), Math.round((top + bottom) / 2),
        Math.round(right - (colum.right - colum.left)*0.1), Math.round((top + bottom) / 2));
      await CommonFunc.sleep(2000);
      let textComponent = await driver.findComponent(BY.key('velocityX'));
      let text = await textComponent.getText();
      await CommonFunc.sleep(1000);
      expect(text == "0").assertFalse();
      console.info('[PanGestureEventJsunit_0100] END');
      done();
    });

    /**
     * @tc.name   PanGestureEventJsunit_0200
     * @tc.number PanGestureEventJsunit_0200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PanGestureEventJsunit_0200', Level.LEVEL0, async (done: Function) => {
      // Get the information of the GestureEvent
      console.info('[PanGestureEventJsunit_0200] START');
      let driver = await UiDriver.create()
      await CommonFunc.sleep(500);
      let colum = CommonFunc.getComponentRectOnScreen('PanGestureEvent_column_id');
      let top = colum.top
      let bottom = colum.bottom
      let left = colum.left
      let right = colum.right
      await driver.swipe(Math.round(left + (colum.right - colum.left)/2), Math.round((top + bottom) / 2),
        Math.round(right - (colum.right - colum.left)*0.1), Math.round((top + bottom) / 2));
      await CommonFunc.sleep(2000);
      let textComponent = await driver.findComponent(BY.key('velocityY'));
      let text = await textComponent.getText();
      await CommonFunc.sleep(1000);
      expect(text == "0").assertFalse();
      console.info('[PanGestureEventJsunit_0200] END');
      done();
    });

    /**
     * @tc.name   PanGestureEventJsunit_0300
     * @tc.number PanGestureEventJsunit_0300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PanGestureEventJsunit_0300', Level.LEVEL0, async (done: Function) => {
      // Get the information of the GestureEvent
      console.info('[PanGestureEventJsunit_0300] START');
      let driver = await UiDriver.create()
      await CommonFunc.sleep(500);
      let colum = CommonFunc.getComponentRectOnScreen('PanGestureEvent_column_id');
      let top = colum.top
      let bottom = colum.bottom
      let left = colum.left
      let right = colum.right
      await driver.swipe(Math.round(left + (colum.right - colum.left)/2), Math.round((top + bottom) / 2),
        Math.round(right - (colum.right - colum.left)*0.1), Math.round((top + bottom) / 2));
      await CommonFunc.sleep(2000);
       let textComponent = await driver.findComponent(BY.key('velocity'));
      let text = await textComponent.getText();
      await CommonFunc.sleep(1000);
      expect(text == "0").assertFalse();
      console.info('[PanGestureEventJsunit_0300] END');
      done();
    });
  })
}