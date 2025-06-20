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


export default function keyEventDispatchTest6() {
  describe('keyEventDispatchTest6', () => {
    beforeEach(async (done: Function) => {
      console.info("keyEventDispatchTest6 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/keyEventDispatchTest/keyEventDispatchTest06",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get keyEventDispatchTest6 state pages: " + JSON.stringify(pages));
        if (!("keyEventDispatchTest06" == pages.name)) {
          console.info("get keyEventDispatchTest06 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push keyEventDispatchTest06 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push keyEventDispatchTest06 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number keyEventDispatchTest6_0100
     * @tc.name   keyEventDispatchTest6_0100
     * @tc.desc   test the onKeyEvent api16 CallBack  child & parent component response when child component return undefined and  child component return undefined when trigger 'TAB' key 
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('keyEventDispatchTest6_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[keyEventDispatchTest6_0100] START');
      let driver: Driver = Driver.create();
      await driver.triggerKey(2049);
      await CommonFunc.sleep(2000);

      // test the  child component response
      let strJson = getInspectorByKey('childText6');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[keyEventDispatchTest6_0100] obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('childResponse');

      // parent component not response
      let strJson1 = getInspectorByKey('parentText6');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[keyEventDispatchTest6_010] obj is: " + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('parentResponse');

      console.info('[keyEventDispatchTest6_0100] END');
      done();
    });
  })
}