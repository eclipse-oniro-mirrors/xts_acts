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


export default function onkeyEventDispatchTest4() {
  describe('onkeyEventDispatchTest4', () => {
    beforeEach(async (done: Function) => {
      console.info("onkeyEventDispatchTest4 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/keyEventDispatchTest/onkeyEventDispatch04",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onkeyEventDispatchTest4 state pages: " + JSON.stringify(pages));
        if (!("nkeyEventDispatch04" == pages.name)) {
          console.info("get keyEventDispatchTest04 state pages.name: " + JSON.stringify(pages.name));
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
     * @tc.number onkeyEventDispatchTest4_0100
     * @tc.name   onkeyEventDispatchTest4_0100
     * @tc.desc   test the onkeyEventDispatch tab key focus when parent component set onKeyEventDispatch event
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('onkeyEventDispatchTest4_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[onkeyEventDispatchTest4_0100] START');
      let driver: Driver = Driver.create();
      await driver.triggerKey(2049);
      await CommonFunc.sleep(2000);

      // test the child component response
      let strJson = getInspectorByKey('tabChild');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[onkeyEventDispatchTest4_0100] obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('');

      // parent component response
      let strJson1 = getInspectorByKey('tabParent');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[onkeyEventDispatchTest4_010] obj is: " + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('parentTab');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(2000);
      
       // tab key focus
      let strJson2 = getInspectorByKey('tabChild');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[onkeyEventDispatchTest4_0100] obj is: " + obj1.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('');

      console.info('[onkeyEventDispatchTest4_0100] END');
      done();
    });
  })
}