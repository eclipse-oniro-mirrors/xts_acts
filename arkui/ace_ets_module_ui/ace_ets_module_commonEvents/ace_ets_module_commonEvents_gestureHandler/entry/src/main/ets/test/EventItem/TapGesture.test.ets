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

export default function tapGestureEventTest() {
  describe('tapGestureEvent', () => {
    beforeEach(async (done: Function) => {
      console.info('tapGestureEvent beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/EventItem/TapGesture',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get tapGestureEvent state pages: ' + JSON.stringify(pages));
        if (!('TapGesture' == pages.name)) {
          console.info('get tapGestureEvent state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push tapGestureEvent success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push tapGestureEvent page error: ' + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   TapGesture1_0100
     * @tc.number TapGesture1_0100
     * @tc.desc   To test the new item of GestureEvent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TapGesture1_0100', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('TapGesture1_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let Column = await driver.findComponent(ON.id('TapGesture1'));
      await Column.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('value');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TapGesture1_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[TapGesture1_0100] title: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('0');
      console.info('[TapGesture1_0100] END');
      done();
    });

  })
}

