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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level} from "../../../hypium/index";
import image from '@ohos.multimedia.image';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function drawingTsCanvasPart6Test() {
  describe('DrawingTsCanvasPart6Test', () => {
    let pixel: image.PixelMap | undefined;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      const color: ArrayBuffer = new ArrayBuffer(40000); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: {
          height: 100,
          width: 100
        }
      }
      pixel = await image.createPixelMap(color, opts);
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
     * @tc.name   testCanvasDrawShadowNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_4500
     * @tc.desc   testCanvasDrawShadowNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawShadowNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawShadowNormalStatic';
      const canvas = new drawing.Canvas(pixel!);
      const path = new drawing.Path();
      let itemList: drawing.ShadowFlag[]= [
        drawing.ShadowFlag.NONE,
        drawing.ShadowFlag.TRANSPARENT_OCCLUDER,
        drawing.ShadowFlag.GEOMETRIC_ONLY,
        drawing.ShadowFlag.ALL
      ];
      try {
        for (let i = 0; i < itemList.length; i += 1) {
          canvas.drawShadow(path, {
            x: 100, y: 80, z: 80
          }, {
            x: 200, y: 10, z: 40
          }, 30, {
            alpha: 0xFF, red: 0, green: 0, blue: 0xFF
          }, {
            alpha: 0xFF, red: 0xFF, green: 0, blue: 0
          }, itemList[i]);
          // shadowFlag枚举值覆盖验证
        }
        canvas.drawShadow(path, {
          x: 100.1, y: 80.1, z: 80.1
        }, {
          x: 200.1, y: 10.1, z: 40.1
        }, 30.1, {
          alpha: 0x00, red: 0, green: 0, blue: 0x00
        }, {
          alpha: 0xFF, red: 0xFF, green: 0xFF, blue: 0xFF
        }, drawing.ShadowFlag.ALL);

        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, -1, {
          alpha: 0xFF, red: 0, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, drawing.ShadowFlag.ALL);
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 0, {
          alpha: 0xFF, red: 0, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, drawing.ShadowFlag.ALL);

        canvas.drawShadow(path, {
          x: -100, y: -80, z: 80
        }, {
          x: 200, y: 10, z: -40
        }, 100, {
          alpha: 0xFF, red: 0, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, drawing.ShadowFlag.ALL);

        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasDrawShadowMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_4501
     * @tc.desc   testCanvasDrawShadowMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawShadowMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawShadowMultipleCallsStatic';
      const canvas = new drawing.Canvas(pixel!);
      const path = new drawing.Path();
      let itemList: drawing.ShadowFlag[]= [
        drawing.ShadowFlag.NONE,
        drawing.ShadowFlag.TRANSPARENT_OCCLUDER,
        drawing.ShadowFlag.GEOMETRIC_ONLY,
        drawing.ShadowFlag.ALL
      ];
      try {
        for (let i = 0; i < 20; i += 1) {
          const randomEnum = Math.floor(4 * Math.random()).toInt();
          canvas.drawShadow(path, {
            x: Math.random(), y: Math.random(), z: Math.random()
          }, {
            x: Math.random(), y: Math.random(), z: Math.random()
          }, Math.random(), {
            alpha: 0xFF, red: 0, green: 0, blue: 0xFF
          }, {
            alpha: 0xFF, red: 0xFF, green: 0, blue: 0
          }, itemList[randomEnum]);
        }
        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawShadowAbNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_4504
     * @tc.desc   testCanvasDrawShadowAbNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawShadowAbNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawShadowAbNormalStatic';
      const canvas = new drawing.Canvas(pixel!);
      const path = new drawing.Path();
      const shadowFlag: drawing.ShadowFlag = drawing.ShadowFlag.ALL;
      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: -1, red: 0, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, shadowFlag);
        console.info(msg + `test successes`);
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(25900001);
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: 0xFF, red: -1, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, shadowFlag);
        console.info(msg + `test successes`);
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(25900001);
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: 0xFF, red: 0, green: -1, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, shadowFlag);
        console.info(msg + `test successes`);
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(25900001);
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: 0xFF, red: 0, green: 0, blue: -1
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, shadowFlag);
        console.info(msg + `test successes`);
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(25900001);
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: 256, red: 0, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, shadowFlag);
        console.info(msg + `test successes`);
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(25900001);
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: 0xFF, red: 256, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, shadowFlag);
        console.info(msg + `test successes`);
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(25900001);
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: 0xFF, red: 0, green: 256, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, shadowFlag);
        console.info(msg + `test successes`);
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(25900001);
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: 0xFF, red: 0, green: 0, blue: 256
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, shadowFlag);
        console.info(msg + `test successes`);
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(25900001);
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: 0xFF, red: 0xFF, green: 0,blue:0xFF
        }, {
          alpha: -1, red: 0, green: 0, blue: 0xFF
        }, shadowFlag);
        console.info(msg + `test successes`);
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(25900001);
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: 0xFF, red: 0xFF, green: 0,blue:0xFF
        }, {
          alpha: 0xFF, red: -1, green: 0, blue: 0xFF
        }, shadowFlag);
        console.info(msg + `test successes`);
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(25900001);
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: 0xFF, red: 0xFF, green: 0,blue:0xFF
        }, {
          alpha: 0xFF, red: 0, green: -1, blue: 0xFF
        }, shadowFlag);
        console.info(msg + `test successes`);
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(25900001);
      }

      try {
        let color1 : common2D.Color = {
          alpha: 0xFF, red: 0, green: 0,blue:0xFF
        };
        let color2 : common2D.Color = {
          alpha: 0xFF, red: 0, green: 0, blue: -1
        };
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, color1, color2, shadowFlag);
        console.info(msg + `test successes`);
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(25900001);
      }

      try {
        let color1 : common2D.Color = {
          alpha: 0xFF, red: 0, green: 0,blue:0xFF
        };
        let color2 : common2D.Color = {
          alpha: 256, red: 0, green: 0, blue: 0xFF
        };
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, color1, color2, shadowFlag);
        console.info(msg + `test successes`);
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(25900001);
      }

      try {
        let color1 : common2D.Color = {
          alpha: 0xFF, red: 0xFF, green: 0,blue:0
        };
        let color2 : common2D.Color = {
          alpha: 0xFF, red: 256, green: 0, blue: 0xFF
        };
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, color1, color2, shadowFlag);
        console.info(msg + `test successes`);
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(25900001);
      }

      try {
        let color1 : common2D.Color = {
          alpha: 0xFF, red: 0xFF, green: 0,blue:0xFF
        };
        let color2 : common2D.Color = {
          alpha: 0xFF, red: 0, green: 256, blue: 0xFF
        };
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, color1, color2, shadowFlag);
        console.info(msg + `test successes`);
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(25900001);
      }

      try {
        let color1 : common2D.Color = {
          alpha: 0xFF, red: 0xFF, green: 0,blue:0xFF
        };
        let color2 : common2D.Color = {
          alpha: 0xFF, red: 0, green: 0, blue: 256
        };
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, color1, color2, shadowFlag);
        console.info(msg + `test successes`);
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(25900001);
      }

    })


    /**
     * @tc.name   testCanvasDrawBackgroundNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_4600
     * @tc.desc   testCanvasDrawBackgroundNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawBackgroundNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawBackgroundNormalStatic';
      const canvas = new drawing.Canvas(pixel!);

      try {
        const brush = new drawing.Brush();
        canvas.drawBackground(brush);
        brush.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.drawBackground(brush);

        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasDrawBackgroundMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_4601
     * @tc.desc   testCanvasDrawBackgroundMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawBackgroundMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawBackgroundMultipleCallsStatic';
      const canvas = new drawing.Canvas(pixel!);

      try {
        for (let i = 0; i < 20; i += 1) {
          const brush = new drawing.Brush();
          const color : common2D.Color = {
            red: (256 * Math.random()).toInt(),
            green: (256 * Math.random()).toInt(),
            blue: (256 * Math.random()).toInt(),
            alpha: (256 * Math.random()).toInt()
          };
          brush.setColor(color)
          canvas.drawBackground(brush)
        }
        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvadrawNestedRoundRectNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_4700
     * @tc.desc   testCanvadrawNestedRoundRectNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvadrawNestedRoundRectNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvadrawNestedRoundRectNormalStatic';
      const canvas = new drawing.Canvas(pixel!);

      try {
        let rect1: common2D.Rect = {
          left: 10, top: 100, right: 200, bottom: 300
        };
        let rect2: common2D.Rect = {
          left: 20, top: 100, right: 200, bottom: 300
        };
        let outRoundRect = new drawing.RoundRect(rect1, 10, 10);
        let inRoundRect = new drawing.RoundRect(rect1, 10, 10);

        canvas.drawNestedRoundRect(outRoundRect, inRoundRect);
        // roundrect相等

        inRoundRect = new drawing.RoundRect(rect2, 10, 10);
        canvas.drawNestedRoundRect(outRoundRect, inRoundRect);
        // roundrect不相等

        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvadrawNestedRoundRectMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_4701
     * @tc.desc   testCanvadrawNestedRoundRectMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvadrawNestedRoundRectMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvadrawNestedRoundRectMultipleCallsStatic';
      const canvas = new drawing.Canvas(pixel!);

      try {
        for (let i = 0; i < 20; i += 1) {
          let rect1: common2D.Rect = {
            left: 10, top: 100, right: 200, bottom: 300
          };
          let rect2: common2D.Rect = {
            left: 20, top: 100, right: 200, bottom: 300
          };
          let outRoundRect = new drawing.RoundRect(rect1, 10, 10);
          let inRoundRect = new drawing.RoundRect(rect2, 10, 10);
          canvas.drawNestedRoundRect(outRoundRect, inRoundRect);
        }
        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
  })
}