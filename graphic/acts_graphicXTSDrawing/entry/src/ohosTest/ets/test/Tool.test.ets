/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';

export default function toolTest() {
  describe('DrawingTsToolTest', () => {
    const DEFAULT = 0;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {

    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TOOL_0100
     * @tc.name      : testMakeColorFromResourceColorNormal01
     * @tc.desc      : Test for testMakeColorFromResourceColorNormal01.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testMakeColorFromResourceColorNormal01', DEFAULT, () => {
      const msg = 'testMakeColorFromResourceColorNormal01';
      try {
        let color1: common2D.Color = drawing.Tool.makeColorFromResourceColor(Color.Orange);
        console.info(msg + ' makeColorFromResourceColor Color.Orange successed');
        expect(color1 != null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor Color.Orange errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color2: common2D.Color = drawing.Tool.makeColorFromResourceColor(0xff0000);
        console.info(msg + ' makeColorFromResourceColor 0xff0000 successed');
        expect(color2 != null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor 0xff0000 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color3: common2D.Color = drawing.Tool.makeColorFromResourceColor(0x5500ff00);
        console.info(msg + ' makeColorFromResourceColor 0x5500ff00 successed');
        expect(color3 != null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor 0x5500ff00 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color4: common2D.Color = drawing.Tool.makeColorFromResourceColor("#0223fa");
        console.info(msg + ' makeColorFromResourceColor #0223fa successed');
        expect(color4 != null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor #0223fa errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color5: common2D.Color = drawing.Tool.makeColorFromResourceColor("#ffaca5e5");
        console.info(msg + ' makeColorFromResourceColor #ffaca5e5 successed');
        expect(color5 != null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor #ffaca5e5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color6: common2D.Color = drawing.Tool.makeColorFromResourceColor("#1f0");
        console.info(msg + ' makeColorFromResourceColor #1f0 successed');
        expect(color6 != null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor #1f0 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color7: common2D.Color = drawing.Tool.makeColorFromResourceColor("#5ff0");
        console.info(msg + ' makeColorFromResourceColor #5ff0 successed');
        expect(color7 != null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor #5ff0 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color8: common2D.Color = drawing.Tool.makeColorFromResourceColor('rgb(255, 100, 255)');
        console.info(msg + ' makeColorFromResourceColor rgb(255, 100, 255) successed');
        expect(color8 != null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor rgb(255, 100, 255) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color9: common2D.Color = drawing.Tool.makeColorFromResourceColor('rgba(255, 100, 255, 0.20)');
        console.info(msg + ' makeColorFromResourceColor rgba(255, 100, 255, 0.20) successed');
        expect(color9 != null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor rgba(255, 100, 255, 0.20) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color10: common2D.Color = drawing.Tool.makeColorFromResourceColor($r('sys.color.ohos_id_color_button_normal'));
        console.info(msg + ' makeColorFromResourceColor sys.color.ohos_id_color_button_normal successed');
        expect(color10 != null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor sys.color.ohos_id_color_button_normal errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color10: common2D.Color = drawing.Tool.makeColorFromResourceColor($r('app.color.appColorTest1'));
        console.info(msg + ' makeColorFromResourceColor app.color.appColorTest1 successed');
        expect(color10 != null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor app.color.appColorTest1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TOOL_0200
     * @tc.name      : testMakeColorFromResourceColorNormal02
     * @tc.desc      : Test for testMakeColorFromResourceColorNormal02.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testMakeColorFromResourceColorNormal02', DEFAULT, () => {
      const msg = 'testMakeColorFromResourceColorNormal02';
      try {
        let color1: common2D.Color = drawing.Tool.makeColorFromResourceColor(0x5500ff005500ff005500ff005500ff005500ff005500ff005500ff005500ff00);
        console.info(msg + ' makeColorFromResourceColor long string successed');
        expect(color1 != null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor long string errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color2: common2D.Color = drawing.Tool.makeColorFromResourceColor(255);
        console.info(msg + ' makeColorFromResourceColor 255 successed');
        expect(color2 != null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor 255 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color3: common2D.Color = drawing.Tool.makeColorFromResourceColor(-0x5500ffff);
        console.info(msg + ' makeColorFromResourceColor -0x5500ffff successed');
        expect(color3 != null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor -0x5500ffff errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color4: common2D.Color = drawing.Tool.makeColorFromResourceColor(255.0001);
        console.info(msg + ' makeColorFromResourceColor 255.0001 successed');
        expect(color4 != null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor 255.0001 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color5: common2D.Color = drawing.Tool.makeColorFromResourceColor('rgb(256, 256, 256)');
        console.info(msg + ' makeColorFromResourceColor rgb(256, 256, 256) successed');
        expect(color5 != null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor rgb(256, 256, 256) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color6: common2D.Color = drawing.Tool.makeColorFromResourceColor('rgba(256, 256, 256, 0.5)');
        console.info(msg + ' makeColorFromResourceColor rgba(256, 256, 256, 0.5) successed');
        expect(color6 != null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor rgba(256, 256, 256, 0.5) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color7: common2D.Color = drawing.Tool.makeColorFromResourceColor($r('app.string.AppColorStringTest1'));
        console.info(msg + ' makeColorFromResourceColor app.string.AppColorStringTest1 successed');
        expect(color7 != null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor app.string.AppColorStringTest1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color8: common2D.Color = drawing.Tool.makeColorFromResourceColor($r('app.integer.appColorTest1'));
        console.info(msg + ' makeColorFromResourceColor app.integer.appColorTest1 successed');
        expect(color8 != null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor app.integer.appColorTest1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TOOL_0300
     * @tc.name      : testMakeColorFromResourceColorAbnormal01
     * @tc.desc      : Test for testMakeColorFromResourceColorAbnormal01.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testMakeColorFromResourceColorAbnormal01', DEFAULT, () => {
      const msg = 'testMakeColorFromResourceColorAbnormal01';
      try {
        let color1: common2D.Color = drawing.Tool.makeColorFromResourceColor('rgb(255, 255, -255)');
        console.info(msg + ' makeColorFromResourceColor rgb(255, 255, -255) return null pointer');
        expect(color1 == null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor rgb(255, 255, -255) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color2: common2D.Color = drawing.Tool.makeColorFromResourceColor('rgb(0, 255, 255, 255)');
        console.info(msg + ' makeColorFromResourceColor rgb(0, 255, 255, 255) return null pointer');
        expect(color2 == null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor rgb(0, 255, 255, 255) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color3: common2D.Color = drawing.Tool.makeColorFromResourceColor('rgba(255, 100, -1, 0.5)');
        console.info(msg + ' makeColorFromResourceColor rgba(255, 100, -1, 0.5) return null pointer');
        expect(color3 == null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor rgba(255, 100, -1, 0.5) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color4: common2D.Color = drawing.Tool.makeColorFromResourceColor('rgba(255, 100, 255, -0.1)');
        console.info(msg + ' makeColorFromResourceColor rgba(255, 100, 255, -0.1) return null pointer');
        expect(color4 == null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor rgba(255, 100, 255, -0.1) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color5: common2D.Color = drawing.Tool.makeColorFromResourceColor('rgba(255, 100, 255, 1.1)');
        console.info(msg + ' makeColorFromResourceColor rgba(255, 100, 255, 1.1) return null pointer');
        expect(color5 == null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor rgba(255, 100, 255, 1.1) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color6: common2D.Color = drawing.Tool.makeColorFromResourceColor('rgba(255, 100, 255, 0.5, 0.5)');
        console.info(msg + ' makeColorFromResourceColor rgba(255, 100, 255, 0.5, 0.5) return null pointer');
        expect(color6 == null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor rgba(255, 100, 255, 0.5, 0.5) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color7: common2D.Color = drawing.Tool.makeColorFromResourceColor('hello world');
        console.info(msg + ' makeColorFromResourceColor hello world return null pointer');
        expect(color7 == null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor hello world errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color8: common2D.Color = drawing.Tool.makeColorFromResourceColor('');
        console.info(msg + ' makeColorFromResourceColor  return null pointer');
        expect(color8 == null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor  errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color9: common2D.Color = drawing.Tool.makeColorFromResourceColor('1111111111111111111111111111111111111111111111');
        console.info(msg + ' makeColorFromResourceColor 111111111111111111 return null pointer');
        expect(color9 == null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor 1111111111111111111 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color10: common2D.Color = drawing.Tool.makeColorFromResourceColor('#');
        console.info(msg + ' makeColorFromResourceColor # return null pointer');
        expect(color10 == null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor # errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color11: common2D.Color = drawing.Tool.makeColorFromResourceColor('#ff');
        console.info(msg + ' makeColorFromResourceColor #ff return null pointer');
        expect(color11 == null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor #ff errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color12: common2D.Color = drawing.Tool.makeColorFromResourceColor('#ffffffffff');
        console.info(msg + ' makeColorFromResourceColor #ffffffffff return null pointer');
        expect(color12 == null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor #ffffffffff errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color13: common2D.Color = drawing.Tool.makeColorFromResourceColor('#ff!@ff');
        console.info(msg + ' makeColorFromResourceColor ##ff!@ff return null pointer');
        expect(color13 == null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor ##ff!@ff errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TOOL_0400
     * @tc.name      : testMakeColorFromResourceColorAbnormal02
     * @tc.desc      : Test for testMakeColorFromResourceColorAbnormal02.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testMakeColorFromResourceColorAbnormal02', DEFAULT, () => {
      const msg = 'testMakeColorFromResourceColorAbnormal02';
      try {
        let color1: common2D.Color = drawing.Tool.makeColorFromResourceColor($r('sys.string.general_paste'));
        console.info(msg + ' makeColorFromResourceColor sys.string.general_paste return null pointer');
        expect(color1 == null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor sys.string.general_paste errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color2: common2D.Color = drawing.Tool.makeColorFromResourceColor($r('app.boolean.apptest1'));
        console.info(msg + ' makeColorFromResourceColor app.boolean.apptest1 return null pointer');
        expect(color2 == null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor app.boolean.apptest1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color3: common2D.Color = drawing.Tool.makeColorFromResourceColor($rawfile('image.png'));
        console.info(msg + ' makeColorFromResourceColor image.png return null pointer');
        expect(color3 == null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor image.png errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color4: common2D.Color = drawing.Tool.makeColorFromResourceColor($r('app.media.icon'));
        console.info(msg + ' makeColorFromResourceColor app.media.icon return null pointer');
        expect(color4 == null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor app.media.icon errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TOOL_0500
     * @tc.name      : testMakeColorFromResourceColorNull
     * @tc.desc      : Test for testMakeColorFromResourceColorNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testMakeColorFromResourceColorNull', DEFAULT, () => {
      const msg = 'testMakeColorFromResourceColorNull';
      try {
        let color1: common2D.Color = drawing.Tool.makeColorFromResourceColor(null);
        console.info(msg + ' makeColorFromResourceColor null return null pointer');
        expect(color1 == null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor null errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color2: common2D.Color = drawing.Tool.makeColorFromResourceColor(undefined);
        console.info(msg + ' makeColorFromResourceColor undefined return null pointer');
        expect(color2 == null).assertTrue();
      } catch (e) {
        console.info(msg + ` makeColorFromResourceColor undefined errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TOOL_0600
     * @tc.name      : testMakeColorFromResourceColorMultipleCalls
     * @tc.desc      : Test for testMakeColorFromResourceColorMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testMakeColorFromResourceColorMultipleCalls', DEFAULT, () => {
      const msg = 'testMakeColorFromResourceColorMultipleCalls';
      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let color1: common2D.Color = drawing.Tool.makeColorFromResourceColor('rgba(255, 100, 255, 0.20)');
          console.info(msg + ' makeColorFromResourceColor rgba(255, 100, 255, 0.20) successed');
          expect(color1 != null).assertTrue();
        } catch (e) {
          console.info(msg + ` makeColorFromResourceColor rgba(255, 100, 255, 0.20) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
  })
}