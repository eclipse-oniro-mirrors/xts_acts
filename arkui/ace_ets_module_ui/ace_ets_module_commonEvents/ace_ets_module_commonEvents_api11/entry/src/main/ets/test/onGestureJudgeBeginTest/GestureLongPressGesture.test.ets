/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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


export default function GestureLongPressGesture() {
  describe('GestureLongPressGesture', () => {
    beforeEach(async (done: Function) => {
      console.info("GestureLongPressGesture beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onGestureJudgeBegin/GestureLongPressGesture',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GestureLongPressGesture state pages: " + JSON.stringify(pages));
        if (!("GestureLongPressGesture" == pages.name)) {
          console.info("get GestureLongPressGesture state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push GestureLongPressGesture success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GestureLongPressGesture page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    GestureLongPressGesture_0100
     * @tc.name    GestureLongPressGesture_0100
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type : 
     * @tc.size :
     */
    it('GestureLongPressGesture_0100', 0, async (done: Function) => {
      console.info('GestureLongPressGesture_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('GestureLongPressGesture'));
      await button.longClick();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('GestureLongPressGesture');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GestureLongPressGesture_0100] component obj is: " + JSON.stringify(obj));
      console.info("[GestureLongPressGesture_0100] title: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual('Gesture is GestureLongPressGesture');
      console.info('[GestureLongPressGesture_0100] END');
      done();
    });


  })
}

