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
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function onkeyEventDispatchTest7() {
  describe('onkeyEventDispatchTest7', () => {
    beforeEach(async (done: Function) => {
      console.info("onkeyEventDispatchTest7 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/keyEventDispatchTest/onkeyEventDispatch07",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onkeyEventDispatchTest7 state pages: " + JSON.stringify(pages));
        if (!("onkeyEventDispatch07" == pages.name)) {
          console.info("get keyEventDispatchTest07 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push onkeyEventDispatch07 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onkeyEventDispatch07 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_ACTION_EVEVENT_COMMEVENT_KEYEVENT_DISPATCH_0290
     * @tc.number SUB_ACE_ACTION_EVEVENT_COMMEVENT_KEYEVENT_DISPATCH_0290
     * @tc.desc   test the dispatchKeyEvent  when  dispatch event through "Context().dispatchKeyEvent" with exsit key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_ACTION_EVEVENT_COMMEVENT_KEYEVENT_DISPATCH_0290', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_ACTION_EVEVENT_COMMEVENT_KEYEVENT_DISPATCH_0290] START');
      let driver: Driver = Driver.create();
      await driver.triggerKey(2049);
      await CommonFunc.sleep(2000);

      // the key event reponse 
      let strJson1 = getInspectorByKey('kkey');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[SUB_ACE_ACTION_EVEVENT_COMMEVENT_KEYEVENT_DISPATCH_0290] obj is: " + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual("keyTrigger");


      let strJson2 = getInspectorByKey('disPatchKey');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[SUB_ACE_ACTION_EVEVENT_COMMEVENT_KEYEVENT_DISPATCH_0290] obj is: " + obj1.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('distrue');

      expect(AppStorage.get('keyResponse')).assertEqual(true);
      expect(AppStorage.get('kkey')).assertEqual(false);

      console.info('SUB_ACE_ACTION_EVEVENT_COMMEVENT_KEYEVENT_DISPATCH_0290] END');
      done();
    });
  })
}