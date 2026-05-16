/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../MainAbility/common/Common';
const SLEEP_TIME = 1000;

export default function GridScrollBarWidthTest() {
  describe('GridScrollBarWidthTest', () => {
    beforeEach(async (done: Function) => {
      console.info("GridScrollBarWidthTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GridScrollBarWidth',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridScrollBarWidthTest state success " + JSON.stringify(pages));
        if (!("GridScrollBarWidth" == pages.name)) {
          console.info("get GridScrollBarWidthTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push GridScrollBarWidthTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridScrollBarWidthTest page error: " + err);
      }
      done()
    });

    /**
     * @tc.number SUB_ARKUI_SCROLLBARWIDTH_TEST_0100
     * @tc.name   SUB_ARKUI_SCROLLBARWIDTH_TEST_0100
     * @tc.desc   Set the value return 50.00vp.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('SUB_ARKUI_SCROLLBARWIDTH_TEST_0100', Level.LEVEL0, async (done: Function) => {
      let driver = Driver.create();
      let oriBtn = await driver.findComponent(ON.id('changeGridScrollBarWidthValue0'));
      await oriBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('gridScrollBarWidth');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SUB_ARKUI_SCROLLBARWIDTH_TEST_0100] component obj is: " + JSON.stringify(obj));
      console.info("[SUB_ARKUI_SCROLLBARWIDTH_TEST_0100 001] scrollBarWidth: " + JSON.stringify(obj.$attrs.scrollBarWidth));
      expect(obj.$attrs.scrollBarWidth).assertEqual('50.00vp');
      console.info('[SUB_ARKUI_SCROLLBARWIDTH_TEST_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_SCROLLBARWIDTH_TEST_0200
     * @tc.name   SUB_ARKUI_SCROLLBARWIDTH_TEST_0200
     * @tc.desc   Set the value return 4.00vp.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('SUB_ARKUI_SCROLLBARWIDTH_TEST_0200', Level.LEVEL0, async (done: Function) => {
      let driver = Driver.create();
      let oriBtn = await driver.findComponent(ON.id('changeGridScrollBarWidthValue1'));
      await oriBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('gridScrollBarWidth');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SUB_ARKUI_SCROLLBARWIDTH_TEST_0200 002] scrollBarWidth: " + JSON.stringify(obj.$attrs.scrollBarWidth));
      expect(obj.$attrs.scrollBarWidth).assertEqual('4.00vp');
      console.info('[SUB_ARKUI_SCROLLBARWIDTH_TEST_0200] END');
      done();
    });
  })
}