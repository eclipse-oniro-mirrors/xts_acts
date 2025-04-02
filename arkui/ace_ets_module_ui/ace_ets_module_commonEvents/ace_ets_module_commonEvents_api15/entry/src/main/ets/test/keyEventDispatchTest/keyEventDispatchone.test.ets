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


export default function keyEventDispatchTest() {
  describe('keyEventDispatchTest', () => {
    beforeEach(async (done: Function) => {
      console.info("keyEventDispatchTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/keyEventDispatchTest/keyEventDispatchTest01",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get keyEventDispatchTest state pages: " + JSON.stringify(pages));
        if (!("keyEventDispatchTest01" == pages.name)) {
          console.info("get keyEventDispatchTest01 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push keyEventDispatchTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push keyEventDispatchTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number keyEventDispatchTest_0100
     * @tc.name   keyEventDispatchTest_0100
     * @tc.desc   test the onKeyEvent api16 CallBack data  when trigger 'TAB' key
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('keyEventDispatchTest_0100', 0, async (done: Function) => {
      console.info('[keyEventDispatchTest_0100] START');
      let driver: Driver = Driver.create();
      await driver.triggerKey(2049);
      await CommonFunc.sleep(2000);
      // test the  keyEvent.type
      let strJson = getInspectorByKey('keyEvent0');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[keyEventDispatchTest_0100] obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('0');
      let strJson1 = getInspectorByKey('keyEvent1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[keyEventDispatchTest_0100] obj is: " + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('1');

      // test the keyCode
      let strJson2 = getInspectorByKey('keyEvent2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[keyEventDispatchTest_0100] obj is: " + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('2049');

      // test key source
      let strJson3 = getInspectorByKey('keyEvent3');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[keyEventDispatchTest_0100] obj is: " + obj3.$attrs.content);
      expect(obj3.$attrs.content).assertEqual('4');

      // test keyText
      let strJson5 = getInspectorByKey('keyEvent5');
      let obj5: ESObject = JSON.parse(strJson5);
      console.info("[keyEventDispatchTest_0500] obj is: " + obj5.$attrs.content);
      expect(obj5.$attrs.content).assertEqual("KEYCODE_TAB");

      // test metaKey
      let strJson6 = getInspectorByKey('keyEvent6');
      let obj6: ESObject = JSON.parse(strJson6);
      console.info("[keyEventDispatchTest_0600] obj is: " + obj6.$attrs.content);
      expect(obj6.$attrs.content).assertEqual("0");

      // test timestamp
      let strJson7 = getInspectorByKey('keyEvent7');
      let obj7: ESObject = JSON.parse(strJson7);
      console.info("[keyEventDispatchTest_0700] obj is: " + obj7.$attrs.content);
      expect(Number(obj7.$attrs.content) > 0).assertTrue();

      // test intentionCode
      let strJson8 = getInspectorByKey('keyEvent8');
      let obj8: ESObject = JSON.parse(strJson8);
      console.info("[keyEventDispatchTest_0800] obj is: " + obj8.$attrs.content);
      expect(obj8.$attrs.content).assertEqual("-1");

      console.info('[keyEventDispatchTest_0100] END');
      done();
    });
  })
}