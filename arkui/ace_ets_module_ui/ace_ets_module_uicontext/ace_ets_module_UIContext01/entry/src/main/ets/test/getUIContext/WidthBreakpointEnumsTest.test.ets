/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { ResolveStrategy } from '@ohos.arkui.UIContext';

export default function WidthBreakpointEnumsTest() {
  describe('WidthBreakpointEnumsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("WidthBreakpointEnumsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getUIContext/WidthBreakpointEnumsTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WidthBreakpointEnumsTest state pages:" + JSON.stringify(pages));
        let result = await router.pushUrl(options);
        if (!("gestureEventTest" == pages.name)) {
          console.info("get WidthBreakpointEnumsTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push WidthBreakpointEnumsTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WidthBreakpointEnumsTest page error:" + err);
      }
      console.info("WidthBreakpointEnumsTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("WidthBreakpointEnumsTest after each called");
    });

    /**
     * @tc.name   WidthBreakpointEnumsTest_0100
     * @tc.number WidthBreakpointEnumsTest_0100
     * @tc.desc   WidthBreakpointEnums Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WidthBreakpointEnumsTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('WidthBreakpointEnumsTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[WidthBreakpointEnumsTest_0100] WIDTH_XS is:' + WidthBreakpoint.WIDTH_XS);
      expect(WidthBreakpoint.WIDTH_XS).assertEqual(0);

      console.info('[WidthBreakpointEnumsTest_0100] WIDTH_MD is:' + WidthBreakpoint.WIDTH_MD);
      expect(WidthBreakpoint.WIDTH_MD).assertEqual(2);

      console.info('[WidthBreakpointEnumsTest_0100] WIDTH_LG is:' + WidthBreakpoint.WIDTH_LG);
      expect(WidthBreakpoint.WIDTH_LG).assertEqual(3);

      console.info('[WidthBreakpointEnumsTest_0100] WIDTH_XL is:' + WidthBreakpoint.WIDTH_XL);
      expect(WidthBreakpoint.WIDTH_XL).assertEqual(4);

      console.info('[WidthBreakpointEnumsTest_0100] HEIGHT_MD is:' + HeightBreakpoint.HEIGHT_MD);
      expect(HeightBreakpoint.HEIGHT_MD).assertEqual(1);

      console.info('[WidthBreakpointEnumsTest_0100] HEIGHT_LG is:' + HeightBreakpoint.HEIGHT_LG);
      expect(HeightBreakpoint.HEIGHT_LG).assertEqual(2);
      console.info('[WidthBreakpointEnumsTest_0100] END');
      done();
    });

    /**
     * @tc.name   ImageSizeEnumsTest_0200
     * @tc.number ImageSizeEnumsTest_0200
     * @tc.desc   ImageSizeEnums Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageSizeEnumsTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('ImageSizeEnumsTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      console.info('[ImageSizeEnumsTest_0200] FILL is:' + ImageSize.FILL);
      expect(ImageSize.FILL).assertEqual(3);
      console.info('[ImageSizeEnumsTest_0200] END');
      done();
    });
  })
}