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

export default function FlexWrapContentTest() {
  describe('FlexWrapContentTest', () => {
    beforeEach(async (done: Function) => {
      console.info("FlexWrapContentTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/FlexWrapContent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FlexWrapContentTest state pages:" + JSON.stringify(pages));
        if (!("FlexWrapContentTest" == pages.name)) {
          console.info("get FlexWrapContentTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FlexWrapContentTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexWrapContentTest page error:" + err);
      }
      console.info("FlexWrapContentTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    
     /**
      * @tc.name   FlexWrapContentTest_0100
      * @tc.number FlexWrapContentTest_0100
      * @tc.desc   FlexWrapContentTest_0100
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('FlexWrapContentTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[FlexWrapContentTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let Flex_Actual1: RectValue = CommonFunc.getComponentRect('FlexWrapContent1');
      let Flex_Actual_Width1 = Flex_Actual1.right - Flex_Actual1.left;
      let Flex_Actual_Height1 = Flex_Actual1.bottom - Flex_Actual1.top;
      let strJson1 = getInspectorByKey('FlexWrapContent1');

      console.info('Flex_Actual_Width1:' + JSON.stringify(Flex_Actual_Width1));
      console.info('Flex_Actual_Height1:' + JSON.stringify(Flex_Actual_Height1));
      console.info('Flex_width1:' + JSON.stringify(JSON.parse(strJson1).$attrs.width));
      console.info('Flex_height1:' + JSON.stringify(JSON.parse(strJson1).$attrs.height));

      let button = await driver.findComponent(ON.id('FlexButton1'));
      await button.click();
      await Utils.sleep(2000)

      let Flex_Actual2: RectValue = CommonFunc.getComponentRect('FlexWrapContent1');
      let Flex_Actual_Width2 = Flex_Actual2.right - Flex_Actual2.left;
      let Flex_Actual_Height2 = Flex_Actual2.bottom - Flex_Actual2.top;
      let strJson2 = getInspectorByKey('FlexWrapContent1');

      console.info('Flex_Actual_Width2:' + JSON.stringify(Flex_Actual_Width2));
      console.info('Flex_Actual_Height2:' + JSON.stringify(Flex_Actual_Height2));
      console.info('Flex_width2:' + JSON.stringify(JSON.parse(strJson2).$attrs.width));
      console.info('Flex_height2:' + JSON.stringify(JSON.parse(strJson2).$attrs.height));

      expect(JSON.parse(strJson1).$attrs.width).assertEqual('50.00vp');
      expect(JSON.parse(strJson1).$attrs.height).assertEqual('50.00vp');
      expect(Math.floor(Math.abs(Flex_Actual_Width1 - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Flex_Actual_Height1 - vp2px(50))) <= 1).assertTrue();

      expect(JSON.parse(strJson2).$attrs.width).assertEqual('150.00vp');
      expect(JSON.parse(strJson2).$attrs.height).assertEqual('100.00vp');
      expect(Math.floor(Math.abs(Flex_Actual_Width2 - vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Flex_Actual_Height2 - vp2px(100))) <= 1).assertTrue();

      console.info('[FlexWrapContentTest_0100] END');
      done();
    });

  })
}