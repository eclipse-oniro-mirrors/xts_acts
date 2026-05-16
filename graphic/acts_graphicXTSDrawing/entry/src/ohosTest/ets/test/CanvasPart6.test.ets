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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import image from '@ohos.multimedia.image';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { getEnumCount } from './utils';

export default function drawingTsCanvasPart6Test() {
  describe('DrawingTsCanvasPart6Test', () => {
    let pixel: image.PixelMap;
    const DEFAULT = 0;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      const color: ArrayBuffer = new ArrayBuffer(40000); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 100, width: 100
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
     * @tc.name   testCanvasDrawShadowNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4500
     * @tc.desc   testCanvasDrawShadowNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawShadowNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawShadowNormal';
      const canvas = new drawing.Canvas(pixel);
      const path = new drawing.Path();

      try {
        for (let i = 0; i < getEnumCount(drawing.ShadowFlag); i += 1) {
          canvas.drawShadow(path, {
            x: 100, y: 80, z: 80
          }, {
            x: 200, y: 10, z: 40
          }, 30, {
            alpha: 0xFF, red: 0, green: 0, blue: 0xFF
          }, {
            alpha: 0xFF, red: 0xFF, green: 0, blue: 0
          }, i);
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
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawShadow2Normal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4506
     * @tc.desc   testCanvasDrawShadow2Normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawShadow2Normal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawShadow2Normal';
      const canvas = new drawing.Canvas(pixel);
      const path = new drawing.Path();

      try {
        canvas.drawShadow(path, {
          x: 100.1, y: 80.1, z: 80.1
        }, {
          x: 200.1, y: 10.1, z: 40.1
        }, 30.1, 100, 100, drawing.ShadowFlag.ALL);
        console.info(msg + '1 test successes');
      } catch (e) {
        console.info(msg + `1 test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, -1, 500, 100, drawing.ShadowFlag.NONE);
        console.info(msg + '2 test successes');
      } catch (e) {
        console.info(msg + `2 test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, -1, 0xFF0000FF, 0xFFFF0000, drawing.ShadowFlag.TRANSPARENT_OCCLUDER);
        console.info(msg + '3 test successes');
      } catch (e) {
        console.info(msg + `3 test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, -1, 0xFF0000FF, 0xFFFF0000, drawing.ShadowFlag.GEOMETRIC_ONLY);
        console.info(msg + '4 test successes');
      } catch (e) {
        console.info(msg + `4 test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawShadowMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4501
     * @tc.desc   testCanvasDrawShadowMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawShadowMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawShadowMultipleCalls';
      const canvas = new drawing.Canvas(pixel);
      const path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          const e = Math.floor(Math.random() * getEnumCount(drawing.ShadowFlag))
          canvas.drawShadow(path, {
            x: Math.random(), y: Math.random(), z: Math.random()
          }, {
            x: Math.random(), y: Math.random(), z: Math.random()
          }, Math.random(), {
            alpha: 0xFF, red: 0, green: 0, blue: 0xFF
          }, {
            alpha: 0xFF, red: 0xFF, green: 0, blue: 0
          }, e);
        }
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasDrawShadowToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4502
     * @tc.desc   testCanvasDrawShadowToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawShadowToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawShadowToNull';
      const canvas = new drawing.Canvas(pixel);
      const path = new drawing.Path();
      const shadowFlag = drawing.ShadowFlag.NONE;

      try {
        canvas.drawShadow(null, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: 0xFF, red: 0, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, shadowFlag);
        console.info(msg + `1 test successes`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `1 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawShadow(path, null, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: 0xFF, red: 0, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, shadowFlag);
        console.info(msg + `2 test successes`);
      } catch (e) {
        console.info(msg + `2 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, null, 30, {
          alpha: 0xFF, red: 0, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, shadowFlag);
        console.info(msg + `3 test successes`);
      } catch (e) {
        console.info(msg + `3 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, null, {
          alpha: 0xFF, red: 0, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, shadowFlag);
        console.info(msg + `4 test successes`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `4 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, null, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, shadowFlag);
        console.info(msg + `5 test successes`);
      } catch (e) {
        console.info(msg + `5 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: 0xFF, red: 0, green: 0, blue: 0xFF
        }, null, shadowFlag);
        console.info(msg + `6 test successes`);
      } catch (e) {
        console.info(msg + `6 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: 0xFF, red: 0, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, null);
        console.info(msg + `7 test successes`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `7 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawShadow(undefined, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: 0xFF, red: 0, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, shadowFlag);
        console.info(msg + `8 test successes`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `8 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawShadow(path, undefined, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: 0xFF, red: 0, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, shadowFlag);
        console.info(msg + `9 test successes`);
      } catch (e) {
        console.info(msg + `9 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, undefined, 30, {
          alpha: 0xFF, red: 0, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, shadowFlag);
        console.info(msg + `10 test successes`);
      } catch (e) {
        console.info(msg + `10 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, undefined, {
          alpha: 0xFF, red: 0, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, shadowFlag);
        console.info(msg + `11 test successes`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `11 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, undefined, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, shadowFlag);
        console.info(msg + `12 test successes`);
      } catch (e) {
        console.info(msg + `12 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: 0xFF, red: 0, green: 0, blue: 0xFF
        }, undefined, shadowFlag);
        console.info(msg + `13 test successes`);
      } catch (e) {
        console.info(msg + `13 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: 0xFF, red: 0, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, undefined);
        console.info(msg + `14 test successes`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `14 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 100, y: 80, z: 80
        }, 30, {
          alpha: null, red: 0, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, shadowFlag);
        console.info(msg + `15 test successes`);
      } catch (e) {
        console.info(msg + `15 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 100, y: 80, z: 80
        }, 30, {
          alpha: 0xFF, red: undefined, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, shadowFlag);
        console.info(msg + `16 test successes`);
      } catch (e) {
        console.info(msg + `16 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 100, y: 80, z: 80
        }, 30, {
          alpha: 0xFF, red: 0, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0xFF, green: null, blue: 0
        }, shadowFlag);
        console.info(msg + `17 test successes`);
      } catch (e) {
        console.info(msg + `17 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 100, y: 80, z: 80
        }, 30, {
          alpha: 0xFF, red: 0, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: undefined
        }, shadowFlag);
        console.info(msg + `18 test successes`);
      } catch (e) {
        console.info(msg + `16 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawShadow2ToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4507
     * @tc.desc   testCanvasDrawShadow2ToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawShadow2ToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawShadow2ToNull';
      const canvas = new drawing.Canvas(pixel);
      const path = new drawing.Path();
      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, null, 100, 100, drawing.ShadowFlag.ALL);
        console.info(msg + `1 test successes`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `1 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, undefined, 100, 100, drawing.ShadowFlag.ALL);
        console.info(msg + `2 test successes`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `2 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, undefined, 100, drawing.ShadowFlag.ALL);
        console.info(msg + `3 test successes`);
      } catch (e) {
        console.info(msg + `3 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }
      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, null, 100, drawing.ShadowFlag.NONE);
        console.info(msg + `4 test successes`);
      } catch (e) {
        console.info(msg + `4 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }
      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, 100, null, drawing.ShadowFlag.TRANSPARENT_OCCLUDER);
        console.info(msg + `5 test successes`);
      } catch (e) {
        console.info(msg + `5 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }
      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, 100, undefined, drawing.ShadowFlag.TRANSPARENT_OCCLUDER);
        console.info(msg + `6 test successes`);
      } catch (e) {
        console.info(msg + `6 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawShadowAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4504
     * @tc.desc   testCanvasDrawShadowAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawShadowAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawShadowAbnormal';
      const canvas = new drawing.Canvas(pixel);
      const path = new drawing.Path();
      const shadowFlag = drawing.ShadowFlag.NONE;
      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: 0xFF, red: 0, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, 10);
        console.info(msg + `1 test successes`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `1 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
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
        console.info(msg + `2 test successes`);
      } catch (e) {
        console.info(msg + `2 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
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
        console.info(msg + `3 test successes`);
      } catch (e) {
        console.info(msg + `3 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
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
        console.info(msg + `4 test successes`);
      } catch (e) {
        console.info(msg + `4 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
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
        console.info(msg + `5 test successes`);
      } catch (e) {
        console.info(msg + `5 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
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
        console.info(msg + `6 test successes`);
      } catch (e) {
        console.info(msg + `6 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
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
        console.info(msg + `7 test successes`);
      } catch (e) {
        console.info(msg + `7 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
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
        console.info(msg + `8 test successes`);
      } catch (e) {
        console.info(msg + `8 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
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
        console.info(msg + `9 test successes`);
      } catch (e) {
        console.info(msg + `9 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0xFF
        }, {
          alpha: -1, red: 0, green: 0, blue: 0xFF
        }, shadowFlag);
        console.info(msg + `10 test successes`);
      } catch (e) {
        console.info(msg + `10 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: -1, green: 0, blue: 0xFF
        }, shadowFlag);
        console.info(msg + `11 test successes`);
      } catch (e) {
        console.info(msg + `11 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0, green: -1, blue: 0xFF
        }, shadowFlag);
        console.info(msg + `12 test successes`);
      } catch (e) {
        console.info(msg + `12 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0, green: 0, blue: -1
        }, shadowFlag);
        console.info(msg + `13 test successes`);
      } catch (e) {
        console.info(msg + `13 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0xFF
        }, {
          alpha: 256, red: 0, green: 0, blue: 0xFF
        }, shadowFlag);
        console.info(msg + `14 test successes`);
      } catch (e) {
        console.info(msg + `14 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 256, green: 0, blue: 0xFF
        }, shadowFlag);
        console.info(msg + `15 test successes`);
      } catch (e) {
        console.info(msg + `15 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0, green: 256, blue: 0xFF
        }, shadowFlag);
        console.info(msg + `16 test successes`);
      } catch (e) {
        console.info(msg + `16 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }

      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 30, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0, green: 0, blue: 256
        }, shadowFlag);
        console.info(msg + `17 test successes`);
      } catch (e) {
        console.info(msg + `17 test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawBackgroundNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4600
     * @tc.desc   testCanvasDrawBackgroundNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawBackgroundNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawBackgroundNormal';
      const canvas = new drawing.Canvas(pixel);

      try {
        const brush = new drawing.Brush();
        canvas.drawBackground(brush);
        brush.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.drawBackground(brush);

        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testAAAA
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_XXXX
     * @tc.desc   testAAAA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAAAA', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testAAAA';
      const canvas = new drawing.Canvas(pixel);

      try {
        for (let i = 0; i < 20; i += 1) {
          const brush = new drawing.Brush();
          brush.setColor({
            red: 256 * Math.random(),
            green: 256 * Math.random(),
            blue: 256 * Math.random(),
            alpha: 256 * Math.random()
          })
          canvas.drawBackground(brush)
        }
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasDrawBackgroundToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4602
     * @tc.desc   testCanvasDrawBackgroundToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawBackgroundToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawBackgroundToNull';
      const canvas = new drawing.Canvas(pixel);

      try {
        canvas.drawBackground(null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawBackground(undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.name   testCanvadrawNestedRoundRectNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4700
     * @tc.desc   testCanvadrawNestedRoundRectNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvadrawNestedRoundRectNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvadrawNestedRoundRectNormal';
      const canvas = new drawing.Canvas(pixel);

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
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvadrawNestedRoundRectMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4701
     * @tc.desc   testCanvadrawNestedRoundRectMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvadrawNestedRoundRectMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvadrawNestedRoundRectMultipleCalls';
      const canvas = new drawing.Canvas(pixel);

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
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvadrawNestedRoundRectToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4702
     * @tc.desc   testCanvadrawNestedRoundRectToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvadrawNestedRoundRectToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvadrawNestedRoundRectToNull';
      const canvas = new drawing.Canvas(pixel);

      let rect1: common2D.Rect = {
        left: 10, top: 100, right: 200, bottom: 300
      };
      let rect2: common2D.Rect = {
        left: 20, top: 100, right: 200, bottom: 300
      };
      let outRoundRect = new drawing.RoundRect(rect1, 10, 10);
      let inRoundRect = new drawing.RoundRect(rect2, 10, 10);

      try {
        canvas.drawNestedRoundRect(null, inRoundRect);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawNestedRoundRect(undefined, inRoundRect);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawNestedRoundRect(outRoundRect, null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawNestedRoundRect(outRoundRect, undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })

  })
}