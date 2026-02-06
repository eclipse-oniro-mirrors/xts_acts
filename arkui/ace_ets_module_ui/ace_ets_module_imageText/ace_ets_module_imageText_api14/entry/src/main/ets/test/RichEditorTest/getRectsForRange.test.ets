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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function getRectsForRangeTest() {
  describe('getRectsForRangeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("getRectsForRangeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/getRectsForRange",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getRectsForRangeTest state pages: " + JSON.stringify(pages));
        if (!("getRectsForRange" == pages.name)) {
          console.info("get getRectsForRangeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push getRectsForRangeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getRectsForRangeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    getRectsForRangeTest_0010
     * @tc.name      getRectsForRangeTest_0010
     * @tc.desc      test_getRectsForRange
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getRectsForRangeTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('getRectsForRangeTest_0010 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('getRectsForRange_Key'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('getRectsForRange_Key');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getRectsForRangeTest_0010] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('getRectsForRange successful');
      console.info('[getRectsForRangeTest_0010] END');
      done();
    });
  })
}
