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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';


export default function LongPressGesture3() {
  describe('LongPressGesture3', () => {
    beforeEach(async (done: Function) => {
      console.info("LongPressGesture3 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LongPressGesture/LongPressGesture3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LongPressGesture3 state pages: " + JSON.stringify(pages));
        if (!("LongPressGesture3" == pages.name)) {
          console.info("get LongPressGesture3 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push LongPressGesture3 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LongPressGesture3 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0350
    * @tc.name  : LongPressGesture3_0100
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('LongPressGesture3_0100', 0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('LongPressGesture3_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('LongPress5');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LongPressGesture3_0100] component obj is: " + JSON.stringify(obj));
      console.info("[LongPressGesture3_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('PinchGesture center:(0.5,0.5)');
      console.info('[LongPressGesture3_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0360
    * @tc.name  : LongPressGesture3_0200
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('LongPressGesture3_0200', 0, async (done: Function) => {
      console.info('LongPressGesture3_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let Column = await driver.findComponent(ON.id('LongPressGesture3'));
      await Column.longClick();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('LongPress6');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LongPressGesture3_0200] component obj is: " + JSON.stringify(obj));
      console.info("[LongPressGesture3_0200] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('LongPress onAction:2');
      console.info('[LongPressGesture3_0200] END');
      done();
    });

  })
}

