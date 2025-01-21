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


export default function GestureReject() {
  describe('GestureReject', () => {
    beforeEach(async (done: Function) => {
      console.info("GestureReject beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onGestureJudgeBegin/GestureReject',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GestureReject state pages: " + JSON.stringify(pages));
        if (!("GestureReject" == pages.name)) {
          console.info("get GestureReject state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push GestureReject success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GestureReject page error: " + err);
        expect().assertFail();
      }
      done();
    });
   /**
     * @tc.number    GestureReject_0100
     * @tc.name    GestureReject_0100
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type : 
     * @tc.size :
     */
    it('GestureReject_0100', 0, async (done: Function) => {
      console.info('GestureReject_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('GestureReject'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('GestureReject');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GestureReject_0100] component obj is: " + JSON.stringify(obj));
      console.info("[GestureReject_0100] title: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual('Gesture is REJECT');
      console.info('[GestureReject_0100] END');
      done();
    });


  })
}

