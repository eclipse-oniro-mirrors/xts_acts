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
 
export default function FrameNodeConvertPositionErrorCodeTest() {
  describe('FrameNodeConvertPositionErrorCodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("FrameNodeConvertPositionErrorCodeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/FrameNodeMethod/FrameNodeConvertPositionErrorCode",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FrameNodeConvertPositionErrorCode state pages:" + JSON.stringify(pages));
        if (!("FrameNodeConvertPositionErrorCode" == pages.name)) {
          console.info("get FrameNodeConvertPositionErrorCode pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FrameNodeConvertPositionErrorCode page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FrameNodeConvertPositionErrorCode page error:" + err);
      }
      console.info("FrameNodeConvertPositionErrorCode beforeEach end");
      done();
    });

    /**
     * @tc.name   SUB_ACE_API_FrameNodeConvertPositionErrorCodeTest_0100
     * @tc.number FrameNodeConvertPositionErrorCodeTest_0100
     * @tc.desc   frameNode convertPositionErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FrameNodeConvertPositionErrorCodeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[FrameNodeConvertPositionErrorCodeTest_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();

      let btn1: Component = await driver.findComponent(ON.id('FrameWindowErrorCode_100028'));
      await btn1.click();
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('ConvertPositionErrorCode');
     
      let btn2: Component = await driver.findComponent(ON.id('ErrorCodeReset'));
      await btn2.click();
      await CommonFunc.sleep(1000);
      let btn3: Component = await driver.findComponent(ON.id('ToWindowErrorCode_100028'));
      await btn3.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('ConvertPositionErrorCode');
      
      let btn4: Component = await driver.findComponent(ON.id('FrameWindowErrorCode_100026'));
      await btn4.click();
      await CommonFunc.sleep(1000);
      let strJson3 = getInspectorByKey('ConvertPositionErrorCode');
      
      let btn5: Component = await driver.findComponent(ON.id('ErrorCodeReset'));
      await btn5.click();
      await CommonFunc.sleep(1000);
      let btn6: Component = await driver.findComponent(ON.id('ToWindowErrorCode_100026'));
      await btn6.click();
      await CommonFunc.sleep(1000);
      let strJson4 = getInspectorByKey('ConvertPositionErrorCode');

      expect(JSON.parse(strJson1).$attrs.content).assertEqual('100028');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('100028');
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('100026');
      expect(JSON.parse(strJson4).$attrs.content).assertEqual('100026');

      console.info('[FrameNodeConvertPositionErrorCodeTest_0100] END');
      done();
    });
 
  })
}