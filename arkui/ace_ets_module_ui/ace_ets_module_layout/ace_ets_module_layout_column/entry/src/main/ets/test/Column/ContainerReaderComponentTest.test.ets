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

import CommonFunc, { RectValue } from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function ContainerReaderComponentTest() {
  describe('ContainerReaderComponentTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ContainerReaderComponentTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/ContainerReaderComponent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ContainerReaderComponent state pages:" + JSON.stringify(pages));
        if (!("ColumnMatchParent" == pages.name)) {
          console.info("get ContainerReaderComponent pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ContainerReaderComponent page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ContainerReaderComponent page error:" + err);
      }
      console.info("ContainerReaderComponent beforeEach end");
      done();
    });
    afterEach(async () => {
    });


    /**
     * @tc.name   ContainerReaderComponentTest_0100
     * @tc.number SUB_ARKUI_API_ContainerReaderComponentTest_0100
     * @tc.desc   CanvasAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ContainerReaderComponentTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ContainerReaderComponentTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id('ContainerReaderComponentChange1'));
      await button1.click();
      await Utils.sleep(2000)

      let button2 = await driver.findComponent(ON.id('ContainerReaderComponentChange2'));
      await button2.click();
      await Utils.sleep(2000)

      let button3 = await driver.findComponent(ON.id('ContainerReaderComponentChange3'));
      await button3.click();
      await Utils.sleep(2000)

      let button4 = await driver.findComponent(ON.id('ContainerReaderComponentChange4'));
      await button4.click();
      await Utils.sleep(2000)

      let button5 = await driver.findComponent(ON.id('ContainerReaderComponentChangeNull'));
      await button5.click();
      await Utils.sleep(2000)

      let button6 = await driver.findComponent(ON.id('ContainerReaderComponentChangeUndefined'));
      await button6.click();
      await Utils.sleep(2000)

      let strJson1 = getInspectorByKey('ContainerReaderComponent');
      console.info("[ContainerReaderComponentTest_0100] width is: " + JSON.parse(strJson1).$attrs.width);
      console.info("[ContainerReaderComponentTest_0100] width is: " + Math.floor(Math.abs(parseFloat(JSON.parse(strJson1).$attrs.width))));
      console.info("[ContainerReaderComponentTest_0100] height is: " + JSON.parse(strJson1).$attrs.height);
      console.info("[ContainerReaderComponentTest_0100] height is: " + Math.floor(Math.abs(parseFloat(JSON.parse(strJson1).$attrs.height))));
      
      expect(Math.floor(Math.abs(parseFloat(JSON.parse(strJson1).$attrs.width) - 200)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(parseFloat(JSON.parse(strJson1).$attrs.height) - 130)) <= 1).assertTrue();

      expect(WidthBreakpoint.WIDTH_XS).assertEqual(0);
      expect(WidthBreakpoint.WIDTH_SM).assertEqual(1);
      expect(WidthBreakpoint.WIDTH_MD).assertEqual(2);
      expect(WidthBreakpoint.WIDTH_LG).assertEqual(3);
      expect(WidthBreakpoint.WIDTH_XL).assertEqual(4);

      expect(HeightBreakpoint.HEIGHT_SM).assertEqual(0);
      expect(HeightBreakpoint.HEIGHT_MD).assertEqual(1);
      expect(HeightBreakpoint.HEIGHT_LG).assertEqual(2);

      console.info('[ContainerReaderComponentTest_0100] END');
      done();
    });
  })
}