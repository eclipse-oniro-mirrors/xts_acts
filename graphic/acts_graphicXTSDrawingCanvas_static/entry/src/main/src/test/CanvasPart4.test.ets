/*
 * Copyright (C) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from "../../../hypium/index";
import image from '@ohos.multimedia.image';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { getEnumCount } from './Util.test';
import { BusinessError } from '@ohos.base';

export default function drawingTsCanvasPart4Test() {
  describe('DrawingTsCanvasPart4Test', () => {
    let pixel: image.PixelMap;
    const DEFAULT = 0;
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
     * @tc.name   testCanvasSaveLayerNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_2500
     * @tc.desc   testCanvasSaveLayerNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasSaveLayerNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testCanvasSaveLayerNormalStatic';
      const canvas = new drawing.Canvas(pixel);
      const rect: common2D.Rect = {
        left: 0,
        right: 100,
        top: 0,
        bottom: 100
      };
      const brush = new drawing.Brush();
      try {
        canvas.saveLayer(rect, brush)
        canvas.saveLayer(null, brush)
        canvas.saveLayer(rect, null)
        console.info(msg + 'saveLayer 1 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `saveLayer 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.saveLayer()
        console.info(msg + 'saveLayer 2 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `saveLayer 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.saveLayer(null, null)
        console.info(msg + 'saveLayer 3 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `saveLayer 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.saveLayer(rect)
        console.info(msg + 'saveLayer 4 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `saveLayer 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasSaveLayerUndefinedStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_2501
     * @tc.desc   testCanvasSaveLayerUndefinedStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasSaveLayerUndefinedStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasSaveLayerUndefinedStatic';
      const canvas = new drawing.Canvas(pixel);
      const brush = new drawing.Brush();
      const rect: common2D.Rect = {
        left: 0, right: 100, top: 0, bottom: 100
      };
      try {
        canvas.saveLayer(undefined, brush)
        console.info(msg + `saveLayer test successes`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `saveLayer test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }

      try {
        canvas.saveLayer(rect, undefined)
        console.info(msg + `saveLayer test successes`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `saveLayer test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasClearNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_2600
     * @tc.desc   testCanvasClearNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasClearNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasClearNormalStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        let color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
        canvas.clear(color);
        let color2: common2D.Color = { alpha: 100, red: 100, green: 100, blue: 100 };
        canvas.clear(color2);
        let color3: common2D.Color = { alpha: 0, red: 0, green: 2, blue: 2 };
        canvas.clear(color3);
        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasClearMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_2601
     * @tc.desc   testCanvasClearMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasClearMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasClearMultipleCallsStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        for (let i = 0; i < 20; i += 1) {
          let color: common2D.Color = {
            alpha: (Math.random() * 256).toInt(), red: (Math.random() * 256).toInt(),
            green: (Math.random() * 256).toInt(), blue: (Math.random() * 256).toInt()
          };
          canvas.clear(color);
        }
        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasClearAbNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_2604
     * @tc.desc   testCanvasClearAbNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasClearAbNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasClearAbNormalStatic';
      const canvas = new drawing.Canvas(pixel);
      try {

        try {
          canvas.clear({
            alpha: 256, red: 255, green: 0, blue: 0
          });
          console.info(msg + `test error`);
          expect().assertFail()
        } catch (e) {
          e = e as BusinessError;
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
          e = e as BusinessError;
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
          e = e as BusinessError;
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
          e = e as BusinessError;
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
          e = e as BusinessError;
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
          e = e as BusinessError;
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
          e = e as BusinessError;
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
          e = e as BusinessError;
          console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
          expect(e.code).assertEqual(401);
        }

        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasGetWidthAndHeightNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_2700
     * @tc.desc   testCanvasGetWidthAndHeightNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasGetWidthAndHeightNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasGetWidthAndHeightNormalStatic';
      const canvas = new drawing.Canvas(pixel);
      try {
        let width = canvas.getWidth();
        let height = canvas.getHeight();
        console.info(msg + 'test successes');
        expect(width).assertEqual(100);
        expect(height).assertEqual(100);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasGetWidthAndHeightMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_2701
     * @tc.desc   testCanvasGetWidthAndHeightMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasGetWidthAndHeightMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasGetWidthAndHeightMultipleCallsStatic';
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
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasDrawOvalNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_2800
     * @tc.desc   testCanvasDrawOvalNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawOvalNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawOvalNormalStatic';
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
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasDrawOvalMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_2801
     * @tc.desc   testCanvasDrawOvalMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawOvalMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawOvalMultipleCallsStatic';
      const canvas = new drawing.Canvas(pixel);
      try {
        for (let i = 0; i < 20; i += 1) {
          canvas.drawOval({
            left: Math.random(), right: Math.random(), top: Math.random(), bottom: Math.random()
          });
        }

        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawArcNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_2900
     * @tc.desc   testCanvasDrawArcNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawArcNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawArcNormalStatic';
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
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasDrawArcMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_2901
     * @tc.desc   testCanvasDrawArcMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawArcMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawArcMultipleCallsStatic';
      const canvas = new drawing.Canvas(pixel);
      try {
        for (let i = 0; i < 20; i += 1) {
          canvas.drawArc({
            left: Math.random(), right: Math.random(), top: Math.random(), bottom: Math.random()
          }, 90, 180);
        }
        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawPointsNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_3000
     * @tc.desc   testCanvasDrawPointsNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawPointsNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawPointsNormalStatic';
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
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasDrawPointsMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_3001
     * @tc.desc   testCanvasDrawPointsMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPointsMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawPointsMultipleCallsStatic';
      const canvas = new drawing.Canvas(pixel);
      let itemList: drawing.PointMode[]= [drawing.PointMode.POINTS, drawing.PointMode.LINES, drawing.PointMode.POLYGON];
      try {
        for (let i = 0; i < 20; i += 1) {
          const randomEnum = Math.floor(3 * Math.random()).toInt();
          canvas.drawPoints([{
            x: Math.random(), y: Math.random()
          }, {
            x: Math.random(), y: Math.random()
          }, {
            x: Math.random(), y: Math.random()
          }], itemList[randomEnum]);
          console.info(msg + 'test successes' + i);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawPointsToNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_3002
     * @tc.desc   testCanvasDrawPointsToNullStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPointsToNullStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawPointsToNullStatic';
      const canvas = new drawing.Canvas(pixel);
      try {
        canvas.drawPoints([{
          x: 100, y: 200
        }, {
          x: 150, y: 230
        }, {
          x: 200, y: 300
        }], undefined);
        console.info(msg + `drawPoints test successes`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawPoints test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawPointsAbNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_3004
     * @tc.desc   testCanvasDrawPointsAbNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPointsAbNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawPointsAbNormalStatic';
      const canvas = new drawing.Canvas(pixel);
      try {
        canvas.drawPoints([]);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testCanvasConcatMatrixNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_3100
     * @tc.desc   testCanvasConcatMatrixNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasConcatMatrixNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasConcatMatrixNormalStatic';
      const canvas = new drawing.Canvas(pixel);
      try {
        let matrix = new drawing.Matrix();
        canvas.concatMatrix(matrix);
        matrix.setMatrix([5, 0, 0, 0, 1, 2, 0, 0, 1]);
        canvas.concatMatrix(matrix);
        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasConcatMatrixMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_3101
     * @tc.desc   testCanvasConcatMatrixMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasConcatMatrixMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasConcatMatrixMultipleCallsStatic';
      const canvas = new drawing.Canvas(pixel);
      try {
        for (let i = 0; i < 20; i += 1) {
          let matrix = new drawing.Matrix();
          canvas.concatMatrix(matrix);
        }
        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasSetMatrixNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_3200
     * @tc.desc   testCanvasSetMatrixNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasSetMatrixNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasSetMatrixNormalStatic';
      const canvas = new drawing.Canvas(pixel);
      try {
        let matrix = new drawing.Matrix();
        canvas.setMatrix(matrix);
        matrix.setMatrix([5.1, 1.1, 1.1, 1.1, 1.1, 1.1, 5.1, 0.3, 1.7]);
        canvas.setMatrix(matrix);
        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasSetMatrixMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_3201
     * @tc.desc   testCanvasSetMatrixMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasSetMatrixMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasSetMatrixMultipleCallsStatic';
      const canvas = new drawing.Canvas(pixel);
      try {
        for (let i = 0; i < 20; i += 1) {
          const matrix = new drawing.Matrix()
          canvas.setMatrix(matrix)
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