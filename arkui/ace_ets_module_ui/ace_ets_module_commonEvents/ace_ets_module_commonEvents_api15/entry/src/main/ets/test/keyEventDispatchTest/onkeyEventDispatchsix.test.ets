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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function onkeyEventDispatchTest6() {
  describe('onkeyEventDispatchTest6', () => {
    beforeEach(async (done: Function) => {
      console.info("onkeyEventDispatchTest6 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/keyEventDispatchTest/onkeyEventDispatch06",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onkeyEventDispatchTest6 state pages: " + JSON.stringify(pages));
        if (!("nkeyEventDispatch04" == pages.name)) {
          console.info("get keyEventDispatchTest06 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push keyEventDispatchTest04 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push keyEventDispatchTest04 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_ACE_ACTION_EVEVENT_COMMEVENT_KEYEVENT_DISPATCH_0270
     * @tc.name   SUB_ACE_ACTION_EVEVENT_COMMEVENT_KEYEVENT_DISPATCH_0270
     * @tc.desc   test the onkeyEventDispatch tab key focus when parent component set onKeyEventDispatch event and undefined
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('SUB_ACE_ACTION_EVEVENT_COMMEVENT_KEYEVENT_DISPATCH_0270', 0, async (done: Function) => {
      console.info('[onkeyEventDispatchTest6_0100] START');
      let driver: Driver = Driver.create();
      await driver.triggerKey(2049);
      await CommonFunc.sleep(2000);

      // firt button component response
      let strJson1 = getInspectorByKey('childkey');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[SUB_ACE_ACTION_EVEVENT_COMMEVENT_KEYEVENT_DISPATCH_0270] obj is: " + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('childTrigger');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(2000);
      
       // two button component response
      let strJson2 = getInspectorByKey('keykey');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[SUB_ACE_ACTION_EVEVENT_COMMEVENT_KEYEVENT_DISPATCH_0270] obj is: " + obj1.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('keyTrigger');

      console.info('SUB_ACE_ACTION_EVEVENT_COMMEVENT_KEYEVENT_DISPATCH_0270] END');
      done();
    });
  })
}