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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function localizedButtonPaddingTest() {
  describe('localizedButtonPaddingTest', () => {
    beforeEach(async (done: Function) => {
      console.info("localizedButtonPaddingTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButton/localizedButtonPadding",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get localizedButtonPaddingTest state pages: " + JSON.stringify(pages));
        if (!("localizedButtonPadding" == pages.name)) {
          console.info("get localizedButtonPaddingTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push localizedButtonPaddingTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push localizedButtonPaddingTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    localizedButtonPaddingTest_0100
     * @tc.name      localizedButtonPaddingTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('localizedButtonPaddingTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info('localizedButtonPaddingTest_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('localizedButtonPadding_start'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let mBtn = getInspectorByKey('localizedButtonPadding_start');
      console.info("[localizedButtonPaddingTest_0100] attrs is: " + JSON.stringify(JSON.parse(mBtn).$attrs));
      expect(JSON.parse(mBtn).$attrs.label).assertEqual('start:{"unit":1,"value":20}');
      console.info('[localizedButtonPaddingTest_0100] END');
      done();
    });
    /**
     * @tc.number    localizedButtonPaddingTest_0200
     * @tc.name      localizedButtonPaddingTest_0200
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('localizedButtonPaddingTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info('localizedButtonPaddingTest_0200 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('localizedButtonPadding_end'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let mBtn2 = getInspectorByKey('localizedButtonPadding_end');
      console.info("[localizedButtonPaddingTest_0200] attrs is: " + JSON.stringify(JSON.parse(mBtn2).$attrs));
      expect(JSON.parse(mBtn2).$attrs.label).assertEqual('end:{"unit":1,"value":10}');
      console.info('[localizedButtonPaddingTest_0200] END');
      done();
    });
  })
}
