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

export default function drawingTsCanvasPart4Test() {
  describe('DrawingTsCanvasPart4Test', () => {
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
     * @tc.name   testCanvasSaveLayerNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2500
     * @tc.desc   testCanvasSaveLayerNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasSaveLayerNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasSaveLayerNormal';
      try {
        const canvas = new drawing.Canvas(pixel);
        const rect: common2D.Rect = {
          left: 0, right: 100, top: 0, bottom: 100
        };
        const brush = new drawing.Brush();

        canvas.saveLayer(rect, brush)
        canvas.saveLayer(null, brush)
        canvas.saveLayer(rect, null)

        console.info(msg + 'test successed');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasSaveLayerUndefined
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2501
     * @tc.desc   testCanvasSaveLayerUndefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasSaveLayerUndefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasSaveLayerUndefined';
      const canvas = new drawing.Canvas(pixel);
      const brush = new drawing.Brush();
      const rect: common2D.Rect = {
        left: 0, right: 100, top: 0, bottom: 100
      };

      try {
        canvas.saveLayer(undefined, brush)
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.saveLayer(rect, undefined)
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.name   testCanvasClearNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2600
     * @tc.desc   testCanvasClearNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasClearNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasClearNormal';
      try {
        const canvas = new drawing.Canvas(pixel);
        canvas.clear({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.clear({
          alpha: 255.1, red: 255.1, green: 255.1, blue: 255.1
        });
        canvas.clear({
          alpha: 0.1, red: 0.1, green: 0.1, blue: 0.1
        });

        console.info(msg + ' 1 test successes');
      } catch (e) {
        console.info(msg + ` 1 test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        const canvas = new drawing.Canvas(pixel);
        let color: number = 0xffff0000;
        canvas.clear(color);
        console.info(msg + ' 2 test successes');
      } catch (e) {
        console.info(msg + ` 2 test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasClearMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2601
     * @tc.desc   testCanvasClearMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasClearMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasClearMultipleCalls';
      try {
        const canvas = new drawing.Canvas(pixel);
        for (let i = 0; i < 20; i += 1) {
          canvas.clear({
            alpha: Math.random() * 256, red: Math.random() * 256,
            green: Math.random() * 256, blue: Math.random() * 256
          })
        }
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasClearToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2602
     * @tc.desc   testCanvasClearToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasClearToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasClearToNull';
      const canvas = new drawing.Canvas(pixel);


      try {
        canvas.clear(null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.clear(undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })


    /**
     * @tc.name   testCanvasClearAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2604
     * @tc.desc   testCanvasClearAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasClearAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasClearAbnormal';
      const canvas = new drawing.Canvas(pixel);
      try {

        try {
          canvas.clear({
            alpha: 256, red: 255, green: 0, blue: 0
          });
          console.info(msg + `test error`);
          expect().assertFail()
        } catch (e) {
          console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
          expect(e.code).assertEqual(401);
        }

        try {
          canvas.clear({
            alpha: 255, red: 256, green: 0, blue: 0
          });
          console.info(msg + `test error`);
          expect().assertFail()
        } catch (e) {
          console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
          expect(e.code).assertEqual(401);
        }

        try {
          canvas.clear({
            alpha: 255, red: 255, green: 256, blue: 0
          });
          console.info(msg + `test error`);
          expect().assertFail()
        } catch (e) {
          console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
          expect(e.code).assertEqual(401);
        }

        try {
          canvas.clear({
            alpha: 255, red: 255, green: 0, blue: 256
          });
          console.info(msg + `test error`);
          expect().assertFail()
        } catch (e) {
          console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
          expect(e.code).assertEqual(401);
        }

        try {
          canvas.clear({
            alpha: -1, red: 255, green: 0, blue: 0
          });
          console.info(msg + `test error`);
          expect().assertFail()
        } catch (e) {
          console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
          expect(e.code).assertEqual(401);
        }

        try {
          canvas.clear({
            alpha: 255, red: -1, green: 0, blue: 0
          });
          console.info(msg + `test error`);
          expect().assertFail()
        } catch (e) {
          console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
          expect(e.code).assertEqual(401);
        }

        try {
          canvas.clear({
            alpha: 255, red: 255, green: -1, blue: 0
          });
          console.info(msg + `test error`);
          expect().assertFail()
        } catch (e) {
          console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
          expect(e.code).assertEqual(401);
        }

        try {
          canvas.clear({
            alpha: 255, red: 255, green: 0, blue: -1
          });
          console.info(msg + `test error`);
          expect().assertFail()
        } catch (e) {
          console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
          expect(e.code).assertEqual(401);
        }

        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasGetWidthAndHeightNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2700
     * @tc.desc   testCanvasGetWidthAndHeightNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasGetWidthAndHeightNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasGetWidthAndHeightNormal';
      const canvas = new drawing.Canvas(pixel);
      try {
        let width = canvas.getWidth();
        let height = canvas.getHeight();
        console.info(msg + 'test successes');
        expect(width).assertEqual(100);
        expect(height).assertEqual(100);
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasGetWidthAndHeightMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2701
     * @tc.desc   testCanvasGetWidthAndHeightMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasGetWidthAndHeightMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasGetWidthAndHeightMultipleCalls';
      const canvas = new drawing.Canvas(pixel);
      try {
        for (let i = 0; i < 20; i += 1) {
          let width = canvas.getWidth();
          let height = canvas.getHeight();
          expect(width).assertEqual(100);
          expect(height).assertEqual(100);
        }
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasDrawOvalNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2800
     * @tc.desc   testCanvasDrawOvalNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawOvalNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawOvalNormal';
      const canvas = new drawing.Canvas(pixel);
      const maxVal = Number.MAX_VALUE;

      try {
        canvas.drawOval({
          left: 100, right: 400, top: 50, bottom: 200
        });
        canvas.drawOval({
          left: 100.1, right: 400.1, top: 50.1, bottom: 200.1
        });
        canvas.drawOval({
          left: -100, right: 400, top: -50, bottom: 200
        });
        canvas.drawOval({
          left: 100, right: -400, top: 50, bottom: -200
        });
        canvas.drawOval({
          left: 100, right: 100, top: 100, bottom: 200
        });
        canvas.drawOval({
          left: 100, right: 100, top: 100, bottom: 100
        });
        canvas.drawOval({
          left: maxVal, right: maxVal, top: maxVal, bottom: maxVal
        });
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasDrawOvalMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2801
     * @tc.desc   testCanvasDrawOvalMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawOvalMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawOvalMultipleCalls';
      const canvas = new drawing.Canvas(pixel);
      try {
        for (let i = 0; i < 20; i += 1) {
          canvas.drawOval({
            left: Math.random(), right: Math.random(), top: Math.random(), bottom: Math.random()
          });
        }

        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasDrawOvalToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2802
     * @tc.desc   testCanvasDrawOvalToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawOvalToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawOvalToNull';
      const canvas = new drawing.Canvas(pixel);

      try {
        canvas.drawOval(null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawOval(undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawOval({
          left: null, right: 400, top: 50, bottom: 200
        });
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawOval({
          left: 100, right: null, top: 50, bottom: 200
        });
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawOval({
          left: 100, right: 400, top: null, bottom: 200
        });
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawOval({
          left: 100, right: 400, top: 50, bottom: null
        });
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawOval({
          left: undefined, right: 400, top: 50, bottom: 200
        });
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawOval({
          left: 100, right: undefined, top: 50, bottom: 200
        });
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawOval({
          left: 100, right: 400, top: undefined, bottom: 200
        });
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawOval({
          left: 100, right: 400, top: 50, bottom: undefined
        });
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })


    /**
     * @tc.name   testCanvasDrawArcNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2900
     * @tc.desc   testCanvasDrawArcNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawArcNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawArcNormal';
      const canvas = new drawing.Canvas(pixel);
      const maxVal = Number.MAX_VALUE;
      try {
        canvas.drawArc({
          left: 100, right: 400, top: 50, bottom: 200
        }, 90, 180);
        canvas.drawArc({
          left: 100.1, right: 400.1, top: 50.1, bottom: 200.1
        }, 450, 450);
        canvas.drawArc({
          left: -100, right: 400, top: -50, bottom: 200
        }, -90, -90);
        canvas.drawArc({
          left: 100, right: -400, top: 50, bottom: -200
        }, 90, 180);
        canvas.drawArc({
          left: 100, right: 100, top: 100, bottom: 200
        }, -90, 180);
        canvas.drawArc({
          left: 100, right: 100, top: 100, bottom: 100
        }, 90, -180);
        canvas.drawArc({
          left: maxVal, right: maxVal, top: maxVal, bottom: maxVal
        }, 90, 180);
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasDrawArcMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2901
     * @tc.desc   testCanvasDrawArcMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawArcMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawArcMultipleCalls';
      const canvas = new drawing.Canvas(pixel);
      try {
        for (let i = 0; i < 20; i += 1) {
          canvas.drawArc({
            left: Math.random(), right: Math.random(), top: Math.random(), bottom: Math.random()
          }, 90, 180);
        }
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasDrawArcToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2902
     * @tc.desc   testCanvasDrawArcToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawArcToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawArcToNull';
      const canvas = new drawing.Canvas(pixel);

      try {
        canvas.drawArc(null, 90, 180);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawArc(undefined, 90, 180);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawArc({
          left: null, right: 400, top: 50, bottom: 200
        }, 90, 180);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawArc({
          left: 100, right: null, top: 50, bottom: 200
        }, 90, 180);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawArc({
          left: 100, right: 400, top: null, bottom: 200
        }, 90, 180);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawArc({
          left: 100, right: 400, top: 50, bottom: null
        }, 90, 180);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawArc({
          left: undefined, right: 400, top: 50, bottom: 200
        }, 90, 180);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawArc({
          left: 100, right: undefined, top: 50, bottom: 200
        }, 90, 180);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawArc({
          left: 100, right: 400, top: undefined, bottom: 200
        }, 90, 180);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawArc({
          left: 100, right: 400, top: 50, bottom: undefined
        }, 90, 180);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawArc({
          left: 100, right: 400, top: 50, bottom: 200
        }, null, 180);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawArc({
          left: 100, right: 400, top: 50, bottom: 200
        }, 90, null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawArc({
          left: 100, right: 400, top: 50, bottom: 200
        }, undefined, 180);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawArc({
          left: 100, right: 400, top: 50, bottom: 200
        }, 90, undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })


    /**
     * @tc.name   testCanvasDrawPointsNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3000
     * @tc.desc   testCanvasDrawPointsNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawPointsNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawPointsNormal';
      const canvas = new drawing.Canvas(pixel);
      try {
        canvas.drawPoints([{
          x: 100, y: 200
        }, {
          x: 150, y: 230
        }, {
          x: 200, y: 300
        }], drawing.PointMode.POINTS);
        canvas.drawPoints([{
          x: 100, y: 200
        }, {
          x: 150.1, y: 230.1
        }, {
          x: 200, y: 300
        }], drawing.PointMode.LINES);
        canvas.drawPoints([{
          x: 100, y: 200
        }, {
          x: 150, y: 230
        }, {
          x: 200, y: 300
        }], drawing.PointMode.POLYGON);
        canvas.drawPoints([{
          x: 100, y: 200
        }, {
          x: -150, y: 230
        }, {
          x: 200, y: -300
        }]);
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasDrawPointsMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3001
     * @tc.desc   testCanvasDrawPointsMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPointsMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawPointsMultipleCalls';
      const canvas = new drawing.Canvas(pixel);
      try {
        for (let i = 0; i < 20; i += 1) {
          const randomEnum = Math.floor(getEnumCount(drawing.PointMode) * Math.random())
          canvas.drawPoints([{
            x: Math.random(), y: Math.random()
          }, {
            x: Math.random(), y: Math.random()
          }, {
            x: Math.random(), y: Math.random()
          }], randomEnum);
        }
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasDrawPointsToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3002
     * @tc.desc   testCanvasDrawPointsToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPointsToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawPointsToNull';
      const canvas = new drawing.Canvas(pixel);

      try {
        canvas.drawPoints(null, drawing.PointMode.POINTS);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawPoints([{
          x: 100, y: 200
        }, {
          x: 150, y: 230
        }, {
          x: 200, y: 300
        }], null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawPoints(undefined, drawing.PointMode.POINTS);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawPoints([{
          x: 100, y: 200
        }, {
          x: 150, y: 230
        }, {
          x: 200, y: 300
        }], undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })

    /**
     * @tc.name   testCanvasDrawPointsAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3004
     * @tc.desc   testCanvasDrawPointsAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPointsAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawPointsAbnormal';
      const canvas = new drawing.Canvas(pixel);

      try {
        canvas.drawPoints([{
          x: 100, y: 200
        }, {
          x: 150, y: 230
        }, {
          x: 200, y: 300
        }], 10);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawPoints([]);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.name   testCanvasConcatMatrixNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3100
     * @tc.desc   testCanvasConcatMatrixNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasConcatMatrixNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasConcatMatrixNormal';
      const canvas = new drawing.Canvas(pixel);
      try {
        let matrix = new drawing.Matrix();
        canvas.concatMatrix(matrix);
        matrix.setMatrix([5, 0, 0, 0, 1, 2, 0, 0, 1]);
        canvas.concatMatrix(matrix);
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasConcatMatrixMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3101
     * @tc.desc   testCanvasConcatMatrixMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasConcatMatrixMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasConcatMatrixMultipleCalls';
      const canvas = new drawing.Canvas(pixel);
      try {
        for (let i = 0; i < 20; i += 1) {
          let matrix = new drawing.Matrix();
          canvas.concatMatrix(matrix);
        }
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasConcatMatrixToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3102
     * @tc.desc   testCanvasConcatMatrixToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasConcatMatrixToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasConcatMatrixToNull';
      const canvas = new drawing.Canvas(pixel);

      try {
        canvas.concatMatrix(null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.concatMatrix(undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.name   testCanvasSetMatrixNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3200
     * @tc.desc   testCanvasSetMatrixNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasSetMatrixNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasSetMatrixNormal';
      const canvas = new drawing.Canvas(pixel);
      try {
        let matrix = new drawing.Matrix();
        canvas.setMatrix(matrix);
        matrix.setMatrix([5.1, 1.1, 1.1, 1.1, 1.1, 1.1, 5.1, 0.3, 1.7]);
        canvas.setMatrix(matrix);
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasSetMatrixMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3201
     * @tc.desc   testCanvasSetMatrixMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasSetMatrixMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasSetMatrixMultipleCalls';
      const canvas = new drawing.Canvas(pixel);
      try {
        for (let i = 0; i < 20; i += 1) {
          const matrix = new drawing.Matrix()
          canvas.setMatrix(matrix)
        }
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasSetMatrixToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3202
     * @tc.desc   testCanvasSetMatrixToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasSetMatrixToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasSetMatrixToNull';
      const canvas = new drawing.Canvas(pixel);

      try {
        canvas.setMatrix(null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.setMatrix(undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })


  })
}