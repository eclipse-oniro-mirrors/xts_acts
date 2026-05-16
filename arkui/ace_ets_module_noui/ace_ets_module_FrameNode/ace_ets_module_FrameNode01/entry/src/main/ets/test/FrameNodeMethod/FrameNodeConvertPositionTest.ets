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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
 
export default function FrameNodeConvertPositionTest() {
  describe('FrameNodeConvertPositionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("FrameNodeConvertPositionTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/FrameNodeMethod/FrameNodeConvertPosition",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FrameNodeConvertPosition state pages:" + JSON.stringify(pages));
        if (!("FrameNodeConvertPosition" == pages.name)) {
          console.info("get FrameNodeConvertPosition pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FrameNodeConvertPosition page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FrameNodeConvertPosition page error:" + err);
      }
      console.info("FrameNodeConvertPosition beforeEach end");
      done();
    });

    /**
     * @tc.name   SUB_ACE_API_FrameNodeConvertPositionTest_0100
     * @tc.number FrameNodeConvertPositionTest_0100
     * @tc.desc   frameNode convertPosition 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FrameNodeConvertPositionTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[FrameNodeConvertPosition_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();

      let btn1: Component = await driver.findComponent(ON.id('SetResult_0'));
      await btn1.click();
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('getToWindowPostion');
      let strJson2 = getInspectorByKey('getFromWindowPostion');
      console.info("[FrameNodeConvertPositionTest_0100] getToWindowPostion is: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      console.info("[FrameNodeConvertPositionTest_0100] getFromWindowPostion is: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));

      let btn2: Component = await driver.findComponent(ON.id('SetResult_10'));
      await btn2.click();
      await CommonFunc.sleep(1000);

      let strJson3 = getInspectorByKey('getToWindowPostion');
      let strJson4 = getInspectorByKey('getFromWindowPostion');
      console.info("[FrameNodeConvertPositionTest_0100] getToWindowPostion is: " + JSON.stringify(JSON.parse(strJson3).$attrs.content));
      console.info("[FrameNodeConvertPositionTest_0100] getFromWindowPostion is: " + JSON.stringify(JSON.parse(strJson4).$attrs.content));

      expect(JSON.parse(strJson1).$attrs.content).assertEqual('{"x":0,"y":0}');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('{"x":0,"y":0}');
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('{"x":10,"y":10}');
      expect(JSON.parse(strJson4).$attrs.content).assertEqual('{"x":10,"y":10}');

      console.info('[FrameNodeConvertPositionTest_0100] END');
      done();
    });
 
  })
}