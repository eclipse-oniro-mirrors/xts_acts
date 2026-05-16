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
import { getEnumCount } from './utils';
import common2D from '@ohos.graphics.common2D';

export default function drawingTsCanvasTest() {
  describe('DrawingTsCanvasTest', () => {
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
     * @tc.name   testCanvasConstructorNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0100
     * @tc.desc   testCanvasConstructorNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasConstructorNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasConstructorNormal';
      try {
        new drawing.Canvas(pixel);
        console.info(msg + 'canvasConstructor successed');
      } catch (e) {
        console.info(msg + `canvasConstructor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasConstructorMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0103
     * @tc.desc   testCanvasConstructorMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasConstructorMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasConstructorMultipleCalls';
      try {
        for (let index = 0; index < 20; index++) {
          new drawing.Canvas(pixel);
        }
        console.info(msg + 'canvasConstructor successed');
      } catch (e) {
        console.info(msg + `canvasConstructor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasDrawRectNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0200
     * @tc.desc   testCanvasDrawRectNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawRectNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawRectNormal';
      try {
        let canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawRect({
          left: 0, right: 0, top: 10, bottom: 10
        });
        canvas.drawRect({
          left: 100.32, right: 100.5, top: 400.2, bottom: 400.3
        });
        canvas.drawRect({
          left: 0, right: 0, top: 0, bottom: 100
        });
        canvas.drawRect({
          left: 0, right: 100, top: 100, bottom: 100
        });
        canvas.drawRect({
          left: 100, right: 100, top: 100, bottom: 100
        });
        canvas.drawRect({
          left: -100, right: 100, top: -100, bottom: 100
        });
        canvas.drawRect({
          left: 100, right: -100, top: 100, bottom: -100
        });
        canvas.drawRect({
          left: 200, right: 100, top: 200, bottom: 100
        });
        canvas.detachPen();
        console.info(msg + 'drawRect successed');
      } catch (e) {
        console.info(msg + `drawRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawRectNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0201
     * @tc.desc   testCanvasDrawRectNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRectNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRectNull';
      let canvas = new drawing.Canvas(pixel);
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawRect(null);
        canvas.detachPen();
        console.info(msg + 'drawRect successed');
      } catch (e) {
        console.info(msg + `drawRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawRect(undefined);
        canvas.detachPen();
        console.info(msg + 'drawRect successed');
      } catch (e) {
        console.info(msg + `drawRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawRect({
          left: null, right: 0, top: 10, bottom: 10
        });
        canvas.detachPen();
        console.info(msg + 'drawRect successed');
      } catch (e) {
        console.info(msg + `drawRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawRect({
          left: 0, right: null, top: 10, bottom: 10
        });
        canvas.detachPen();
        console.info(msg + 'drawRect successed');
      } catch (e) {
        console.info(msg + `drawRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawRect({
          left: 0, right: 100, top: null, bottom: 10
        });
        canvas.detachPen();
        console.info(msg + 'drawRect successed');
      } catch (e) {
        console.info(msg + `drawRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawRect({
          left: 0, right: 100, top: 10, bottom: null
        });
        canvas.detachPen();
        console.info(msg + 'drawRect successed');
      } catch (e) {
        console.info(msg + `drawRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawRect({
          left: undefined, right: 0, top: 10, bottom: 10
        });
        canvas.detachPen();
        console.info(msg + 'drawRect successed');
      } catch (e) {
        console.info(msg + `drawRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawRect({
          left: 0, right: undefined, top: 10, bottom: 10
        });
        canvas.detachPen();
        console.info(msg + 'drawRect successed');
      } catch (e) {
        console.info(msg + `drawRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawRect({
          left: 0, right: 100, top: undefined, bottom: 10
        });
        canvas.detachPen();
        console.info(msg + 'drawRect successed');
      } catch (e) {
        console.info(msg + `drawRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawRect({
          left: 0, right: 100, top: 10, bottom: undefined
        });
        canvas.detachPen();
        console.info(msg + 'drawRect successed');
      } catch (e) {
        console.info(msg + `drawRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testCanvasDrawRect2Null
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0204
     * @tc.desc   testCanvasDrawRect2Null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRect2Null', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRect2Null';
      let canvas = new drawing.Canvas(pixel);
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawRect(null, 0, 10, 10);
        canvas.detachPen();
        console.info(msg + '1 drawRect successed');
      } catch (e) {
        console.info(msg + `1 drawRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawRect(undefined, 0, 10, 10);
        canvas.detachPen();
        console.info(msg + '2 drawRect successed');
      } catch (e) {
        console.info(msg + `2 drawRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawRect(0, null, 10, 10);
        canvas.detachPen();
        console.info(msg + '3 drawRect successed');
      } catch (e) {
        console.info(msg + `3 drawRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawRect(0, undefined, 10, 10);
        canvas.detachPen();
        console.info(msg + '4 drawRect successed');
      } catch (e) {
        console.info(msg + `4 drawRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawRect(0, 0, null, 10);
        canvas.detachPen();
        console.info(msg + '5 drawRect successed');
      } catch (e) {
        console.info(msg + `5 drawRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawRect(0, 0, undefined, 10);
        canvas.detachPen();
        console.info(msg + '6 drawRect successed');
      } catch (e) {
        console.info(msg + `6 drawRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawRect(0, 0, 10, null);
        canvas.detachPen();
        console.info(msg + '7 drawRect successed');
      } catch (e) {
        console.info(msg + `7 drawRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawRect(0, 0, 10, undefined);
        canvas.detachPen();
        console.info(msg + '8 drawRect successed');
      } catch (e) {
        console.info(msg + `8 drawRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testCanvasDrawRectMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0203
     * @tc.desc   testCanvasDrawRectMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRectMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRectMultipleCalls';
      try {
        let canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        for (let index = 0; index < 20; index++) {
          canvas.drawRect({
            left: Math.random() * Number.MAX_VALUE, right: Math.random() * Number.MAX_VALUE, top: Math.random() * Number.MAX_VALUE, bottom: Math.random() * Number.MAX_VALUE
          });
        }
        canvas.detachPen();
        console.info(msg + 'drawRect successed');
      } catch (e) {
        console.info(msg + `drawRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawCircleNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0300
     * @tc.desc   testCanvasDrawCircleNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawCircleNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawCircleNormal';
      let canvas = new drawing.Canvas(pixel);
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawCircle(10, 10, 100);
        canvas.drawCircle(10.1, 10.1, 100.1);
        canvas.detachPen();
        console.info(msg + 'drawCircle successed');
      } catch (e) {
        console.info(msg + `drawCircle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawCircleNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0301
     * @tc.desc   testCanvasDrawCircleNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawCircleNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawCircleNull';
      let canvas = new drawing.Canvas(pixel);
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawCircle(null, 10, 100);
        canvas.detachPen();
        console.info(msg + 'drawCircle successed');
      } catch (e) {
        console.info(msg + `drawCircle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        pixel
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawCircle(10, null, 100);
        canvas.detachPen();
        console.info(msg + 'drawCircle successed');
      } catch (e) {
        console.info(msg + `drawCircle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawCircle(10, 10, null);
        canvas.detachPen();
        console.info(msg + 'drawCircle successed');
      } catch (e) {
        console.info(msg + `drawCircle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawCircle(undefined, 10, 100);
        canvas.detachPen();
        console.info(msg + 'drawCircle successed');
      } catch (e) {
        console.info(msg + `drawCircle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawCircle(10, undefined, 100);
        canvas.detachPen();
        console.info(msg + 'drawCircle successed');
      } catch (e) {
        console.info(msg + `drawCircle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        canvas.drawCircle(10, 10, undefined);
        canvas.detachPen();
        console.info(msg + 'drawCircle successed');
      } catch (e) {
        console.info(msg + `drawCircle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testCanvasDrawCircleMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0303
     * @tc.desc   testCanvasDrawCircleMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawCircleMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawCircleMultipleCalls';
      try {
        let canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.attachPen(pen);
        for (let index = 0; index < 20; index++) {
          canvas.drawCircle(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        canvas.detachPen();
        console.info(msg + 'drawCircle successed');
      } catch (e) {
        console.info(msg + `drawCircle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasDrawImageNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0400
     * @tc.desc   testCanvasDrawImageNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawImageNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawImageNormal';
      try {
        let canvas = new drawing.Canvas(pixel);
        canvas.drawImage(pixel, 100, 100);
        canvas.drawImage(pixel, 100.2, 100.2);
        canvas.drawImage(pixel, 100, 100, new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST));
        canvas.drawImage(pixel, 100.2, 100.2, new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR));
        canvas.drawImage(pixel, -100.2, -100, new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR));
        console.info(msg + 'drawImage successed');
      } catch (e) {
        console.info(msg + `drawImage errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawImageNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0401
     * @tc.desc   testCanvasDrawImageNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawImageNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawImageNull';
      let canvas = new drawing.Canvas(pixel);
      try {
        canvas.drawImage(null, 100, 100);
        console.info(msg + 'drawImage successed');
      } catch (e) {
        console.info(msg + `drawImage errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawImage(pixel, null, 100);
        console.info(msg + 'drawImage successed');
      } catch (e) {
        console.info(msg + `drawImage errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawImage(pixel, 100, null);
        console.info(msg + 'drawImage successed');
      } catch (e) {
        console.info(msg + `drawImage errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawImage(pixel, 100, 100, null);
        console.info(msg + 'drawImage successed');
      } catch (e) {
        console.info(msg + `drawImage errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawImage(undefined, 100, 100);
        console.info(msg + 'drawImage successed');
      } catch (e) {
        console.info(msg + `drawImage errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawImage(pixel, undefined, 100);
        console.info(msg + 'drawImage successed');
      } catch (e) {
        console.info(msg + `drawImage errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawImage(pixel, 100, undefined);
        console.info(msg + 'drawImage successed');
      } catch (e) {
        console.info(msg + `drawImage errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawImage(pixel, 100, 100, undefined);
        console.info(msg + 'drawImage successed');
      } catch (e) {
        console.info(msg + `drawImage errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testCanvasDrawImageMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0403
     * @tc.desc   testCanvasDrawImageMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawImageMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawImageMultipleCalls';
      try {
        let canvas = new drawing.Canvas(pixel);
        const randomEnum = Math.floor(Math.random() * (getEnumCount(drawing.FilterMode)));
        canvas.drawImage(pixel, Math.random() * 200, Math.random() * 200, new drawing.SamplingOptions(randomEnum));
        console.info(msg + 'drawImage successed');
      } catch (e) {
        console.info(msg + `drawImage errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasDrawColorNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0500
     * @tc.desc   testCanvasDrawColorNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawColorNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawColorNormal';
      let canvas = new drawing.Canvas(pixel);
      try {
        canvas.drawColor({ alpha: 0xFF, red: 0xFF, green: 0xFF, blue: 0xFF}, drawing.BlendMode.CLEAR);
        canvas.drawColor({ alpha: 0x00, red: 0x00, green: 0x00, blue: 0x00}, drawing.BlendMode.CLEAR);

        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.CLEAR);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.SRC);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.DST);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.SRC_OVER);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.DST_OVER);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.SRC_IN);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.DST_IN);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.SRC_OUT);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.DST_OUT);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.SRC_ATOP);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.DST_ATOP);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.XOR);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.PLUS);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.MODULATE);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.SCREEN);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.OVERLAY);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.DARKEN);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.LIGHTEN);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.COLOR_DODGE);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.COLOR_BURN);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.HARD_LIGHT);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.SOFT_LIGHT);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.DIFFERENCE);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.EXCLUSION);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.MULTIPLY);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.HUE);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.SATURATION);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.COLOR);
        canvas.drawColor({ alpha: 0xFF, red: 0xE0, green: 0x10, blue: 0xFF}, drawing.BlendMode.LUMINOSITY);
        console.info(msg + 'drawColor successed');
      } catch (e) {
        console.info(msg + `drawColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawColor2Normal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0505
     * @tc.desc   testCanvasDrawColor2Normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawColor2Normal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawColor2Normal';
      let canvas = new drawing.Canvas(pixel);
      try {
        canvas.drawColor(255, 255, 10, 100, drawing.BlendMode.CLEAR);
        canvas.drawColor(255, 254, 10, 255, drawing.BlendMode.CLEAR);
        canvas.drawColor(255, 0, 10, 10, drawing.BlendMode.CLEAR);
        canvas.drawColor(255, 0, 10, 255, drawing.BlendMode.SRC);
        canvas.drawColor(255, 0, 10, 10, drawing.BlendMode.DST);
        canvas.drawColor(255, 100, 10, 10, drawing.BlendMode.SRC_OVER);
        canvas.drawColor(255, 0, 10, 10, drawing.BlendMode.DST_OVER);
        canvas.drawColor(255, 0, 10, 255, drawing.BlendMode.SRC_IN);
        canvas.drawColor(255, 255, 10, 10, drawing.BlendMode.DST_IN);
        canvas.drawColor(255, 0, 10, 10, drawing.BlendMode.SRC_OUT);
        canvas.drawColor(255, 0, 10, 10, drawing.BlendMode.DST_OUT);
        canvas.drawColor(255, 0, 10, 10, drawing.BlendMode.SRC_ATOP);
        canvas.drawColor(255, 0, 10, 10, drawing.BlendMode.DST_ATOP);
        canvas.drawColor(255, 20, 100, 255, drawing.BlendMode.XOR);
        canvas.drawColor(255, 0, 10, 10, drawing.BlendMode.PLUS);
        canvas.drawColor(255, 0, 10, 255, drawing.BlendMode.MODULATE);
        canvas.drawColor(255, 0, 10, 10, drawing.BlendMode.SCREEN);
        canvas.drawColor(255, 10, 100, 255, drawing.BlendMode.OVERLAY);
        canvas.drawColor(255, 10, 10, 10, drawing.BlendMode.DARKEN);
        canvas.drawColor(255, 0, 10, 10, drawing.BlendMode.LIGHTEN);
        canvas.drawColor(255, 0, 100, 10, drawing.BlendMode.COLOR_DODGE);
        canvas.drawColor(255, 0, 10, 10, drawing.BlendMode.COLOR_BURN);
        canvas.drawColor(255, 0, 100, 10, drawing.BlendMode.HARD_LIGHT);
        canvas.drawColor(255, 0, 10, 10, drawing.BlendMode.SOFT_LIGHT);
        canvas.drawColor(255, 0, 255, 10, drawing.BlendMode.DIFFERENCE);
        canvas.drawColor(255, 0, 10, 10, drawing.BlendMode.EXCLUSION);
        canvas.drawColor(255, 255, 10, 10, drawing.BlendMode.MULTIPLY);
        canvas.drawColor(255, 0, 10, 10, drawing.BlendMode.HUE);
        canvas.drawColor(255, 255, 10, 10, drawing.BlendMode.SATURATION);
        canvas.drawColor(255, 255, 10, 10, drawing.BlendMode.COLOR);
        canvas.drawColor(255, 255, 10, 10, drawing.BlendMode.LUMINOSITY);
        console.info(msg + 'drawColor successed');
      } catch (e) {
        console.info(msg + `drawColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawColor2Null
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0506
     * @tc.desc   testCanvasDrawColor2Null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawColor2Null', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawColor2Null';
      let canvas = new drawing.Canvas(pixel);
      try {
        canvas.drawColor(null, 255, 10, 10, drawing.BlendMode.CLEAR);
        console.info(msg + '1 drawColor successed');
        expect().assertFail();
      } catch (e) {
        console.info(msg + `1 drawColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawColor(undefined, 255, 10, 10, drawing.BlendMode.CLEAR);
        console.info(msg + '2 drawColor successed');
        expect().assertFail();
      } catch (e) {
        console.info(msg + `2 drawColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawColor(255, null, 10, 10, drawing.BlendMode.CLEAR);
        console.info(msg + '3 drawColor successed');
        expect().assertFail();
      } catch (e) {
        console.info(msg + `3 drawColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawColor(255, undefined, 10, 10, drawing.BlendMode.CLEAR);
        console.info(msg + '4 drawColor successed');
        expect().assertFail();
      } catch (e) {
        console.info(msg + `4 drawColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawColor(255, 10, null, 10, drawing.BlendMode.CLEAR);
        console.info(msg + '5 drawColor successed');
        expect().assertFail();
      } catch (e) {
        console.info(msg + `5 drawColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawColor(255, 10, undefined, 10, drawing.BlendMode.CLEAR);
        console.info(msg + '6 drawColor successed');
        expect().assertFail();
      } catch (e) {
        console.info(msg + `6 drawColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawColor(255, 10, 10, null, drawing.BlendMode.CLEAR);
        console.info(msg + '7 drawColor successed');
        expect().assertFail();
      } catch (e) {
        console.info(msg + `7 drawColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawColor(255, 10, 10, undefined, drawing.BlendMode.CLEAR);
        console.info(msg + '8 drawColor successed');
        expect().assertFail();
      } catch (e) {
        console.info(msg + `8 drawColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawColor(255, 10, 10, 10, null);
        console.info(msg + '9 drawColor successed');
        expect().assertFail();
      } catch (e) {
        console.info(msg + `9 drawColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawColor(255, 10, 10, 10, undefined);
        console.info(msg + '10 drawColor successed');
        expect().assertFail();
      } catch (e) {
        console.info(msg + `10 drawColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testCanvasDrawColorNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0501
     * @tc.desc   testCanvasDrawColorNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawColorNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawColorNull';
      let canvas = new drawing.Canvas(pixel);
      try {
        canvas.drawColor(null, drawing.BlendMode.CLEAR);
        console.info(msg + 'drawColor successed');
      } catch (e) {
        console.info(msg + `drawColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawColor(undefined, drawing.BlendMode.CLEAR);
        console.info(msg + 'drawColor successed');
      } catch (e) {
        console.info(msg + `drawColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawColor({ alpha: 0x00, red: 0x00, green: 0x00, blue: 0x00}, undefined);
        console.info(msg + 'drawColor successed');
      } catch (e) {
        console.info(msg + `drawColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testCanvasDrawColorMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0503
     * @tc.desc   testCanvasDrawColorMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawColorMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawColorMultipleCalls';
      try {
        let canvas = new drawing.Canvas(pixel);
        for (let index = 0; index < 20; index++) {
          const randomEnum = Math.floor(Math.random() * (getEnumCount(drawing.BlendMode)));
          canvas.drawColor({
            alpha: Math.random() * 255, red: Math.random() * 255, green: Math.random() * 255, blue: Math.random() * 255}, randomEnum);
        }
        console.info(msg + 'drawColor successed');
      } catch (e) {
        console.info(msg + `drawColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawColorBoundaryValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0504
     * @tc.desc   testCanvasDrawColorBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawColorBoundaryValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawColorBoundaryValue';
      let canvas = new drawing.Canvas(pixel);
      try {
        canvas.drawColor({ alpha: -1, red: 0xFF, green: 0xFF, blue: 0xFF}, drawing.BlendMode.CLEAR);
        console.info(msg + 'drawColor successed');
      } catch (e) {
        console.info(msg + `drawColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawColor({ alpha: 0xFF, red: -1, green: 0xFF, blue: 0xFF}, drawing.BlendMode.CLEAR);
        console.info(msg + 'drawColor successed');
      } catch (e) {
        console.info(msg + `drawColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawColor({ alpha: 0xFF, red: 0xFF, green: -1, blue: 0xFF}, drawing.BlendMode.CLEAR);
        console.info(msg + 'drawColor successed');
      } catch (e) {
        console.info(msg + `drawColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawColor({ alpha: 0xFF, red: 0xFF, green: 0xFF, blue: -1}, drawing.BlendMode.CLEAR);
        console.info(msg + 'drawColor successed');
      } catch (e) {
        console.info(msg + `drawColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawColor({ alpha: 256, red: 0xFF, green: 0xFF, blue: 0xFF}, drawing.BlendMode.CLEAR);
        console.info(msg + 'drawColor successed');
      } catch (e) {
        console.info(msg + `drawColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawColor({ alpha: 0xFF, red: 256, green: 0xFF, blue: 0xFF}, drawing.BlendMode.CLEAR);
        console.info(msg + 'drawColor successed');
      } catch (e) {
        console.info(msg + `drawColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawColor({ alpha: 0xFF, red: 0xFF, green: 256, blue: 0xFF}, drawing.BlendMode.CLEAR);
        console.info(msg + 'drawColor successed');
      } catch (e) {
        console.info(msg + `drawColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawColor({ alpha: 0xFF, red: 0xFF, green: 0xFF, blue: 256}, drawing.BlendMode.CLEAR);
        console.info(msg + 'drawColor successed');
      } catch (e) {
        console.info(msg + `drawColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.name   testCanvasDrawPixelMapMeshNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0600
     * @tc.desc   testCanvasDrawPixelMapMeshNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawPixelMapMeshNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawPixelMapMeshNormal';
      try {
        const canvas = new drawing.Canvas(pixel);
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(pixel, 2, 2, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360], 0, null, 0);
        canvas.drawPixelMapMesh(pixel, 2, 2, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360], 0, [0xFFFFFFFF,0xFFEFFFFF,0xFFFFEFFF,0xFFFFFFEF,0xFFFFFF00,0xFFEFFFF,0xFFEFFFF,0xFFEFFFF,0xFFEFFFF], 0);
        canvas.drawPixelMapMesh(pixel, 1, 1, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180], 1.43, [0xFFFFFFFF,0xFFEFFFFF,0xFFFFEFFF,0xFFFFFFEF], 0);
        canvas.drawPixelMapMesh(pixel, 1, 1, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180], 1 , [0xFFFFFFFF,0xFFEFFFFF,0xFFFFEFFF,0xFFFFFFEF,0xFFFFFF00], 1.5356);
        canvas.drawPixelMapMesh(pixel, 1.55, 1, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180], 1, [0xFFFFFFFF,0xFFEFFFFF,0xFFFFEFFF,0xFFFFFFEF], 0);
        canvas.drawPixelMapMesh(pixel, 1, 1.45, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180], 1 , [0xFFFFFFFF,0xFFEFFFFF,0xFFFFEFFF,0xFFFFFFEF,0xFFFFFF00], 1);
        canvas.detachBrush();
        console.info(msg + 'drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + `drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawPixelMapMeshNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0601
     * @tc.desc   testCanvasDrawPixelMapMeshNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPixelMapMeshNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawPixelMapMeshNull';
      const canvas = new drawing.Canvas(pixel);
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(null, 2, 2, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360], 0, null, 0);
        canvas.detachBrush();
        console.info(msg + ' 1 drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + ` 1 drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(pixel, null, 2, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360], 0, null, 0);
        canvas.detachBrush();
        console.info(msg + ' 2 drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + ` 2 drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(pixel, 2, null, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360], 0, null, 0);
        canvas.detachBrush();
        console.info(msg + ' 3 drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + ` 3 drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(pixel, 2, 2, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360], 0, undefined, 0);
        canvas.detachBrush();
        console.info(msg + ' 4 drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + ` 4 drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(pixel, 2, 2, null, 0, null, 0);
        canvas.detachBrush();
        console.info(msg + ' 5 drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + ` 5 drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(pixel, 2, 2, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360], null, null, 0);
        canvas.detachBrush();
        console.info(msg + ' 6 drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + ` 6 drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(pixel, 2, 2, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360], 0, null, null);
        canvas.detachBrush();
        console.info(msg + ' 7 drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + ` 7 drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(undefined, 2, 2, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360], 0, null, 0);
        canvas.detachBrush();
        console.info(msg + ' 8 drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + ` 8 drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(pixel, undefined, 2, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360], 0, null, 0);
        canvas.detachBrush();
        console.info(msg + ' 9 drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + ` 9 drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(pixel, 2, undefined, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360], 0, null, 0);
        canvas.detachBrush();
        console.info(msg + ' 10 drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + ` 10 drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(pixel, 2, 2, undefined, 0, null, 0);
        canvas.detachBrush();
        console.info(msg + ' 11 drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + ` 11 drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(pixel, 2, 2, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360], undefined, null, 0);
        canvas.detachBrush();
        console.info(msg + ' 12 drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + ` 12 drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(pixel, 2, 2, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360], 0, null, undefined);
        canvas.detachBrush();
        console.info(msg + ' 13 drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + ` 13 drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(pixel, 2, 2, [], 0, [0xFFFFFFFF,0xFFEFFFFF,0xFFFFEFFF,0xFFFFFFEF,0xFFFFFF00,0xFFEFFFF,0xFFEFFFF,0xFFEFFFF,0xFFEFFFF], 0);
        canvas.detachBrush();
        console.info(msg + ' 14 drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + ` 14 drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(pixel, 2, 2, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360], 0, [], 0);
        canvas.detachBrush();
        console.info(msg + ' 15 drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + ` 15 drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testCanvasDrawPixelMapMeshMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0603
     * @tc.desc   testCanvasDrawPixelMapMeshMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPixelMapMeshMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawPixelMapMeshMultipleCalls';
      try {
        const canvas = new drawing.Canvas(pixel);
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        for (let index = 0; index < 20; index++) {
          canvas.drawPixelMapMesh(pixel, 2, 2, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360], 0, null, 0);
        }
        canvas.detachBrush();
        console.info(msg + 'drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + `drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawPointNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0700
     * @tc.desc   testCanvasDrawPointNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawPointNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawPointNormal';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.drawPoint(10, 10);
        canvas.drawPoint(10.1, 10.1);
        canvas.drawPoint(-10, -10);
        canvas.detachPen();
        console.info(msg + 'drawPoint successed');
      } catch (e) {
        console.info(msg + `drawPoint errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawPointNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0701
     * @tc.desc   testCanvasDrawPointNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPointNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawPointNull';
      const canvas = new drawing.Canvas(pixel);
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.drawPoint(undefined, 10);
        canvas.detachPen();
        console.info(msg + 'drawPoint successed');
      } catch (e) {
        console.info(msg + `drawPoint errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.drawPoint(10, undefined);
        canvas.detachPen();
        console.info(msg + 'drawPoint successed');
      } catch (e) {
        console.info(msg + `drawPoint errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.drawPoint(null, 10);
        canvas.detachPen();
        console.info(msg + 'drawPoint successed');
      } catch (e) {
        console.info(msg + `drawPoint errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.drawPoint(10, null);
        canvas.detachPen();
        console.info(msg + 'drawPoint successed');
      } catch (e) {
        console.info(msg + `drawPoint errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testCanvasDrawPointMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0703
     * @tc.desc   testCanvasDrawPointMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPointMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawPointMultipleCalls';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        for (let index = 0; index < 20; index++) {
          canvas.drawPoint(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        canvas.detachPen();
        console.info(msg + 'drawPoint successed');
      } catch (e) {
        console.info(msg + `drawPoint errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasDrawPathNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0800
     * @tc.desc   testCanvasDrawPathNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawPathNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawPathNormal';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        let path = new drawing.Path();
        path.moveTo(10,10);
        path.cubicTo(10, 10, 10, 10, 15, 15);
        path.close();
        canvas.attachPen(pen);
        canvas.drawPath(path);
        canvas.detachPen();
        console.info(msg + 'drawPath successed');
      } catch (e) {
        console.info(msg + `drawPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawPathNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0801
     * @tc.desc   testCanvasDrawPathNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPathNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawPathNull';
      const canvas = new drawing.Canvas(pixel);
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.drawPath(undefined);
        canvas.detachPen();
        console.info(msg + 'drawPath successed');
      } catch (e) {
        console.info(msg + `drawPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.drawPath(null);
        canvas.detachPen();
        console.info(msg + 'drawPath successed');
      } catch (e) {
        console.info(msg + `drawPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testCanvasDrawPathMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0803
     * @tc.desc   testCanvasDrawPathMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPathMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawPathMultipleCalls';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        let path = new drawing.Path();
        path.moveTo(10,10);
        path.cubicTo(10, 10, 10, 10, 15, 15);
        path.close();
        canvas.attachPen(pen);
        for (let index = 0; index < 20; index++) {
          canvas.drawPath(path);
        }
        canvas.detachPen();
        console.info(msg + 'drawPath successed');
      } catch (e) {
        console.info(msg + `drawPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasDrawLineNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0900
     * @tc.desc   testCanvasDrawLineNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawLineNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawLineNormal';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.drawLine(10, 15, 10, 10);
        canvas.drawLine(10.2, 15.3, 10.4, 10.5);
        canvas.drawLine(-10, -15, 10, 10);
        canvas.drawLine(10, 15, -10, -10);
        canvas.detachPen();
        console.info(msg + 'drawLine successed');
      } catch (e) {
        console.info(msg + `drawLine errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawLineNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0901
     * @tc.desc   testCanvasDrawLineNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawLineNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawLineNull';
      const canvas = new drawing.Canvas(pixel);
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.drawLine(undefined, 15, 10, 10);
        canvas.detachPen();
        console.info(msg + 'drawLine successed');
      } catch (e) {
        console.info(msg + `drawLine errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.drawLine(10, undefined, 10, 10);
        canvas.detachPen();
        console.info(msg + 'drawLine successed');
      } catch (e) {
        console.info(msg + `drawLine errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.drawLine(10, 15, undefined, 10);
        canvas.detachPen();
        console.info(msg + 'drawLine successed');
      } catch (e) {
        console.info(msg + `drawLine errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.drawLine(10, 15, 10, undefined);
        canvas.detachPen();
        console.info(msg + 'drawLine successed');
      } catch (e) {
        console.info(msg + `drawLine errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.drawLine(null, 15, 10, 10);
        canvas.detachPen();
        console.info(msg + 'drawLine successed');
      } catch (e) {
        console.info(msg + `drawLine errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.drawLine(10, null, 10, 10);
        canvas.detachPen();
        console.info(msg + 'drawLine successed');
      } catch (e) {
        console.info(msg + `drawLine errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.drawLine(10, 15, null, 10);
        canvas.detachPen();
        console.info(msg + 'drawLine successed');
      } catch (e) {
        console.info(msg + `drawLine errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.drawLine(10, 15, 10, null);
        canvas.detachPen();
        console.info(msg + 'drawLine successed');
      } catch (e) {
        console.info(msg + `drawLine errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testCanvasDrawLineMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0903
     * @tc.desc   testCanvasDrawLineMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawLineMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawLineMultipleCalls';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        for (let index = 0; index < 20; index++) {
          canvas.drawLine(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        canvas.detachPen();
        console.info(msg + 'drawLine successed');
      } catch (e) {
        console.info(msg + `drawLine errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
  })
}