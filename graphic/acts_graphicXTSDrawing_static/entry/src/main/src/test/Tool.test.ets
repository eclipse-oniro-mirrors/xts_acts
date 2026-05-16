/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  TestType,
  Size,
  Level
} from "../../../hypium/index";
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';
import { $r, $rawfile, Color, ResourceColor } from '@ohos.arkui.component'

export default function toolTest() {
  describe('DrawingTsToolTest', () => {
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
     * @tc.name   testMakeColorFromResourceColorNormal01Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TOOL_STATIC_0100
     * @tc.desc   Test for testMakeColorFromResourceColorNormal01Static.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeColorFromResourceColorNormal01Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMakeColorFromResourceColorNormal01Static';
      try {
        let color1: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor(Color.Orange);
        console.info(msg + ' makeColorFromResourceColor Color.Orange successed');
        if (color1) {
          expect(color1 != null).assertTrue();
        }
        if(color1 == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeColorFromResourceColor Color.Orange errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color2: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor(0xff0000);
        console.info(msg + ' makeColorFromResourceColor 0xff0000 successed');
        if (color2) {
          expect(color2 != null).assertTrue();
        }
        if(color2 == undefined){
          console.info(msg + ' 2 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` makeColorFromResourceColor 0xff0000 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color3: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor(0x5500ff00);
        console.info(msg + ' makeColorFromResourceColor 0x5500ff00 successed');
        if (color3) {
          expect(color3 != null).assertTrue();
        }
        if(color3 == undefined){
          console.info(msg + ' 3 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeColorFromResourceColor 0x5500ff00 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color4: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor("#0223fa");
        console.info(msg + ' makeColorFromResourceColor #0223fa successed');
        if (color4) {
          expect(color4 != null).assertTrue();
        }
        if(color4 == undefined){
          console.info(msg + ' 4 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` makeColorFromResourceColor #0223fa errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color5: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor("#ffaca5e5");
        console.info(msg + ' makeColorFromResourceColor #ffaca5e5 successed');
        if (color5) {
          expect(color5 != null).assertTrue();
        }
        if(color5 == undefined){
          console.info(msg + ' 5 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeColorFromResourceColor #ffaca5e5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color6: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor("#1f0");
        console.info(msg + ' makeColorFromResourceColor #1f0 successed');
        if (color6) {
          expect(color6 != null).assertTrue();
        }
        if(color6 == undefined){
          console.info(msg + ' 6 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` makeColorFromResourceColor #1f0 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color7: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor("#5ff0");
        console.info(msg + ' makeColorFromResourceColor #5ff0 successed');
        if (color7) {
          expect(color7 != null).assertTrue();
        }
        if(color7 == undefined){
          console.info(msg + ' 7 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` makeColorFromResourceColor #5ff0 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color8: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor('rgb(255, 100, 255)');
        console.info(msg + ' makeColorFromResourceColor rgb(255, 100, 255) successed');
        if (color8) {
          expect(color8 != null).assertTrue();
        }
        if(color8 == undefined){
          console.info(msg + ' 8 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeColorFromResourceColor rgb(255, 100, 255) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color9: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor('rgba(255, 100, 255, 0.20)');
        console.info(msg + ' makeColorFromResourceColor rgba(255, 100, 255, 0.20) successed');
        if (color9) {
          expect(color9 != null).assertTrue();
        }
        if(color9 == undefined){
          console.info(msg + ' 9 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeColorFromResourceColor rgba(255, 100, 255, 0.20) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color10: common2D.Color | undefined =
          drawing.Tool.makeColorFromResourceColor($r('sys.color.ohos_id_color_button_normal'));
        console.info(msg + ' makeColorFromResourceColor sys.color.ohos_id_color_button_normal successed');
        if (color10) {
          expect(color10 != null).assertTrue();
        }
        if(color10 == undefined){
          console.info(msg + ' 10 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeColorFromResourceColor sys.color.ohos_id_color_button_normal errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color11: common2D.Color | undefined =
          drawing.Tool.makeColorFromResourceColor($r('app.color.appColorTest1'));
        console.info(msg + ' makeColorFromResourceColor app.color.appColorTest1 successed');
        if (color11) {
          expect(color11 != null).assertTrue();
        }
        if(color11 == undefined){
          console.info(msg + ' 11 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeColorFromResourceColor app.color.appColorTest1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testMakeColorFromResourceColorNormal02Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TOOL_STATIC_0200
     * @tc.desc   Test for testMakeColorFromResourceColorNormal02Static.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeColorFromResourceColorNormal02Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMakeColorFromResourceColorNormal02Static';
      try {
        let color2: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor(255);
        console.info(msg + ' makeColorFromResourceColor 255 successed');
        if (color2) {
          expect(color2 != null).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` makeColorFromResourceColor 255 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color3: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor(-0x5500ffff);
        console.info(msg + ' makeColorFromResourceColor -0x5500ffff successed');
        if (color3) {
          expect(color3 != null).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeColorFromResourceColor -0x5500ffff errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color4: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor(255);
        console.info(msg + ' makeColorFromResourceColor 255 successed');
        if (color4) {
          expect(color4 != null).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` makeColorFromResourceColor 255 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color5: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor('rgb(256, 256, 256)');
        console.info(msg + ' makeColorFromResourceColor rgb(256, 256, 256) successed');
        if (color5) {
          expect(color5 != null).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeColorFromResourceColor rgb(256, 256, 256) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color6: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor('rgba(256, 256, 256, 0.5)');
        console.info(msg + ' makeColorFromResourceColor rgba(256, 256, 256, 0.5) successed');
        if (color6) {
          expect(color6 != null).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeColorFromResourceColor rgba(256, 256, 256, 0.5) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color7: common2D.Color | undefined =
          drawing.Tool.makeColorFromResourceColor($r('app.string.AppColorStringTest1'));
        console.info(msg + ' makeColorFromResourceColor app.string.AppColorStringTest1 successed');
        if (color7) {
          expect(color7 != null).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeColorFromResourceColor app.string.AppColorStringTest1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color8: common2D.Color | undefined =
          drawing.Tool.makeColorFromResourceColor($r('app.integer.appColorTest1'));
        console.info(msg + ' makeColorFromResourceColor app.integer.appColorTest1 successed');
        if (color8) {
          expect(color8 != null).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeColorFromResourceColor app.integer.appColorTest1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testMakeColorFromResourceColorAbnormal01Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TOOL_STATIC_0300
     * @tc.desc   Test for testMakeColorFromResourceColorAbnormal01Static.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeColorFromResourceColorAbnormal01Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMakeColorFromResourceColorAbnormal01Static';
      try {
        let color1: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor('rgb(255, 255, -255)');
        console.info(msg + ' makeColorFromResourceColor rgb(255, 255, -255) return null pointer');
        if (color1) {
          expect(color1 == null).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeColorFromResourceColor rgb(255, 255, -255) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color2: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor('rgb(0, 255, 255, 255)');
        console.info(msg + ' makeColorFromResourceColor rgb(0, 255, 255, 255) return null pointer');
        if (color2) {
          expect(color2 == null).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeColorFromResourceColor rgb(0, 255, 255, 255) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color3: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor('rgba(255, 100, -1, 0.5)');
        console.info(msg + ' makeColorFromResourceColor rgba(255, 100, -1, 0.5) return null pointer');
        if (color3) {
          expect(color3 == null).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeColorFromResourceColor rgba(255, 100, -1, 0.5) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color4: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor('rgba(255, 100, 255, -0.1)');
        console.info(msg + ' makeColorFromResourceColor rgba(255, 100, 255, -0.1) return null pointer');
        if (color4) {
          expect(color4 == null).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeColorFromResourceColor rgba(255, 100, 255, -0.1) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color5: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor('rgba(255, 100, 255, 1.1)');
        console.info(msg + ' makeColorFromResourceColor rgba(255, 100, 255, 1.1) return null pointer');
        if (color5) {
          expect(color5 == null).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeColorFromResourceColor rgba(255, 100, 255, 1.1) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color6: common2D.Color | undefined =
          drawing.Tool.makeColorFromResourceColor('rgba(255, 100, 255, 0.5, 0.5)');
        console.info(msg + ' makeColorFromResourceColor rgba(255, 100, 255, 0.5, 0.5) return null pointer');
        if (color6) {
          expect(color6 == null).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeColorFromResourceColor rgba(255, 100, 255, 0.5, 0.5) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color7: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor('hello world');
        console.info(msg + ' makeColorFromResourceColor hello world return null pointer');
        if (color7) {
          expect(color7 == null).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeColorFromResourceColor hello world errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color8: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor('');
        console.info(msg + ' makeColorFromResourceColor  return null pointer');
        if (color8) {
          expect(color8 == null).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` makeColorFromResourceColor  errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color9: common2D.Color | undefined =
          drawing.Tool.makeColorFromResourceColor('1111111111111111111111111111111111111111111111');
        console.info(msg + ' makeColorFromResourceColor 111111111111111111 return null pointer');
        if (color9) {
          expect(color9 == null).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeColorFromResourceColor 1111111111111111111 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color10: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor('#');
        console.info(msg + ' makeColorFromResourceColor # return null pointer');
        if (color10) {
          expect(color10 == null).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` makeColorFromResourceColor # errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color11: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor('#ff');
        console.info(msg + ' makeColorFromResourceColor #ff return null pointer');
        if (color11) {
          expect(color11 == null).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` makeColorFromResourceColor #ff errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color12: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor('#ffffffffff');
        console.info(msg + ' makeColorFromResourceColor #ffffffffff return null pointer');
        if (color12) {
          expect(color12 == null).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeColorFromResourceColor #ffffffffff errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color13: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor('#ff!@ff');
        console.info(msg + ' makeColorFromResourceColor ##ff!@ff return null pointer');
        if (color13) {
          expect(color13 == null).assertTrue()
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` makeColorFromResourceColor ##ff!@ff errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testMakeColorFromResourceColorAbnormal02Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TOOL_STATIC_0400
     * @tc.desc   Test for testMakeColorFromResourceColorAbnormal02Static.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeColorFromResourceColorAbnormal02Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMakeColorFromResourceColorAbnormal02Static';
      try {
        let color1: common2D.Color | undefined =
          drawing.Tool.makeColorFromResourceColor($r('sys.string.general_paste'));
        if (color1) {
          console.info(msg + ' makeColorFromResourceColor sys.string.general_paste return null pointer');
          expect(color1 == null).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeColorFromResourceColor sys.string.general_paste errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color2: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor($r('app.boolean.apptest1'));
        if (color2) {
          console.info(msg + ' makeColorFromResourceColor app.boolean.apptest1 return null pointer');
          expect(color2 == null).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeColorFromResourceColor app.boolean.apptest1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color3: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor($rawfile('image.png'));
        if (color3) {
          console.info(msg + ' makeColorFromResourceColor image.png return null pointer');
          expect(color3 == null).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeColorFromResourceColor image.png errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let color4: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor($r('app.media.icon'));
        if (color4) {
          console.info(msg + ' makeColorFromResourceColor app.media.icon return null pointer');
          expect(color4 == null).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeColorFromResourceColor app.media.icon errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testMakeColorFromResourceColorMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TOOL_STATIC_0600
     * @tc.desc   Test for testMakeColorFromResourceColorMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeColorFromResourceColorMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMakeColorFromResourceColorMultipleCallsStatic';
      for (let i = 0; i < 20; i++) {
        try {
          let color1: common2D.Color | undefined = drawing.Tool.makeColorFromResourceColor('rgba(255, 100, 255, 0.20)');
          console.info(msg + ' makeColorFromResourceColor rgba(255, 100, 255, 0.20) successed');
          if (color1) {
            expect(color1 != null).assertTrue();
          }
        } catch (e) {
          e = e as BusinessError;
          console.info(msg +
            ` makeColorFromResourceColor rgba(255, 100, 255, 0.20) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
  })
}