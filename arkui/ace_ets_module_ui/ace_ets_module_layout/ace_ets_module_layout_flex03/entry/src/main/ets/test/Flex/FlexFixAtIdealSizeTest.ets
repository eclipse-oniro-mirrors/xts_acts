/*
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

import CommonFunc, { RectValue } from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function FlexFixAtIdealSizeTest() {
  describe('FlexFixAtIdealSizeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("FlexFixAtIdealSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/FlexFixAtIdealSizePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FlexFixAtIdealSizeTest state pages:" + JSON.stringify(pages));
        if (!("FlexFixAtIdealSizePage" == pages.name)) {
          console.info("get FlexFixAtIdealSizeTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FlexFixAtIdealSizeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexFixAtIdealSizeTest page error:" + err);
      }
      console.info("FlexFixAtIdealSizeTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });
    
    /**
     * @tc.name   FlexFixAtIdealSizeTest_0100
     * @tc.number FlexFixAtIdealSizeTest_0100
     * @tc.desc   FlexFixAtIdealSizeTest_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FlexFixAtIdealSizeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[FlexFixAtIdealSizeTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('FlexFixAtIdealSizePage_Flex');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[FlexFixAtIdealSizeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[FlexFixAtIdealSizeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);

      let flex: RectValue = CommonFunc.getComponentRect('FlexFixAtIdealSizePage_Flex');
      let flex_width = flex.right - flex.left;
      let flex_height = flex.bottom - flex.top;
      console.info("[FlexFixAtIdealSizeTest_0100] flex_width is: " + flex_width);
      console.info("[FlexFixAtIdealSizeTest_0100] flex_height is: " + flex_height);

      expect(Math.floor(Math.abs(flex_width - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(flex_height - vp2px(50))) <= 1).assertTrue();

      let button = await driver.findComponent(ON.id('FlexFixAtIdealSizePage_Btn'));
      await button.click();
      console.info("[FlexFixAtIdealSizeTest_0100] change width=160，height=120");
      await Utils.sleep(1000)

      strJson = getInspectorByKey('FlexFixAtIdealSizePage_Flex');
      obj = JSON.parse(strJson);
      console.info("[FlexFixAtIdealSizeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[FlexFixAtIdealSizeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);

      flex = CommonFunc.getComponentRect('FlexFixAtIdealSizePage_Flex');
      flex_width = flex.right - flex.left;
      flex_height = flex.bottom - flex.top;
      console.info("[FlexFixAtIdealSizeTest_0100] flex_width is: " + flex_width);
      console.info("[FlexFixAtIdealSizeTest_0100] flex_height is: " + flex_height);

      expect(Math.floor(Math.abs(flex_width - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(flex_height - vp2px(100))) <= 1).assertTrue();

      console.info('[FlexFixAtIdealSizeTest_0100] END');
      done();
    });

  })
}