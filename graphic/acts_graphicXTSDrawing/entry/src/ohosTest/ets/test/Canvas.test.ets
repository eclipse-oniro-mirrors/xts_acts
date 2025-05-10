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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0100
     * @tc.name      : testCanvasConstructorNormal
     * @tc.desc      : testCanvasConstructorNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasConstructorNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0103
     * @tc.name      : testCanvasConstructorMultipleCalls
     * @tc.desc      : testCanvasConstructorMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasConstructorMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0200
     * @tc.name      : testCanvasDrawRectNormal
     * @tc.desc      : testCanvasDrawRectNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasDrawRectNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0201
     * @tc.name      : testCanvasDrawRectNull
     * @tc.desc      : testCanvasDrawRectNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawRectNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0203
     * @tc.name      : testCanvasDrawRectMultipleCalls
     * @tc.desc      : testCanvasDrawRectMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawRectMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0300
     * @tc.name      : testCanvasDrawCircleNormal
     * @tc.desc      : testCanvasDrawCircleNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasDrawCircleNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0301
     * @tc.name      : testCanvasDrawCircleNull
     * @tc.desc      : testCanvasDrawCircleNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawCircleNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0303
     * @tc.name      : testCanvasDrawCircleMultipleCalls
     * @tc.desc      : testCanvasDrawCircleMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawCircleMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0400
     * @tc.name      : testCanvasDrawImageNormal
     * @tc.desc      : testCanvasDrawImageNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasDrawImageNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0401
     * @tc.name      : testCanvasDrawImageNull
     * @tc.desc      : testCanvasDrawImageNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawImageNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0403
     * @tc.name      : testCanvasDrawImageMultipleCalls
     * @tc.desc      : testCanvasDrawImageMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawImageMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0500
     * @tc.name      : testCanvasDrawColorNormal
     * @tc.desc      : testCanvasDrawColorNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasDrawColorNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0501
     * @tc.name      : testCanvasDrawColorNull
     * @tc.desc      : testCanvasDrawColorNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawColorNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0503
     * @tc.name      : testCanvasDrawColorMultipleCalls
     * @tc.desc      : testCanvasDrawColorMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawColorMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0504
     * @tc.name      : testCanvasDrawColorBoundaryValue
     * @tc.desc      : testCanvasDrawColorBoundaryValue
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawColorBoundaryValue', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0600
     * @tc.name      : testCanvasDrawPixelMapMeshNormal
     * @tc.desc      : testCanvasDrawPixelMapMeshNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasDrawPixelMapMeshNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0601
     * @tc.name      : testCanvasDrawPixelMapMeshNull
     * @tc.desc      : testCanvasDrawPixelMapMeshNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawPixelMapMeshNull', DEFAULT, () => {
      const msg = 'testCanvasDrawPixelMapMeshNull';
      const canvas = new drawing.Canvas(pixel);
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(null, 2, 2, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360], 0, null, 0);
        canvas.detachBrush();
        console.info(msg + 'drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + `drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(pixel, null, 2, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360], 0, null, 0);
        canvas.detachBrush();
        console.info(msg + 'drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + `drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(pixel, 2, null, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360], 0, null, 0);
        canvas.detachBrush();
        console.info(msg + 'drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + `drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(pixel, 2, 2, null, 0, null, 0);
        canvas.detachBrush();
        console.info(msg + 'drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + `drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(pixel, 2, 2, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360], null, null, 0);
        canvas.detachBrush();
        console.info(msg + 'drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + `drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(pixel, 2, 2, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360], 0, null, null);
        canvas.detachBrush();
        console.info(msg + 'drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + `drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(undefined, 2, 2, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360], 0, null, 0);
        canvas.detachBrush();
        console.info(msg + 'drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + `drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(pixel, undefined, 2, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360], 0, null, 0);
        canvas.detachBrush();
        console.info(msg + 'drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + `drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(pixel, 2, undefined, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360], 0, null, 0);
        canvas.detachBrush();
        console.info(msg + 'drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + `drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(pixel, 2, 2, undefined, 0, null, 0);
        canvas.detachBrush();
        console.info(msg + 'drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + `drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(pixel, 2, 2, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360], undefined, null, 0);
        canvas.detachBrush();
        console.info(msg + 'drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + `drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(pixel, 2, 2, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360], 0, null, undefined);
        canvas.detachBrush();
        console.info(msg + 'drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + `drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(pixel, 2, 2, [], 0, [0xFFFFFFFF,0xFFEFFFFF,0xFFFFEFFF,0xFFFFFFEF,0xFFFFFF00,0xFFEFFFF,0xFFEFFFF,0xFFEFFFF,0xFFEFFFF], 0);
        canvas.detachBrush();
        console.info(msg + 'drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + `drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(pixel, 2, 2, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360], 0, [], 0);
        canvas.detachBrush();
        console.info(msg + 'drawPixelMapMesh successed');
      } catch (e) {
        console.info(msg + `drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0603
     * @tc.name      : testCanvasDrawPixelMapMeshMultipleCalls
     * @tc.desc      : testCanvasDrawPixelMapMeshMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawPixelMapMeshMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0700
     * @tc.name      : testCanvasDrawPointNormal
     * @tc.desc      : testCanvasDrawPointNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasDrawPointNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0701
     * @tc.name      : testCanvasDrawPointNull
     * @tc.desc      : testCanvasDrawPointNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawPointNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0703
     * @tc.name      : testCanvasDrawPointMultipleCalls
     * @tc.desc      : testCanvasDrawPointMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawPointMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0800
     * @tc.name      : testCanvasDrawPathNormal
     * @tc.desc      : testCanvasDrawPathNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasDrawPathNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0801
     * @tc.name      : testCanvasDrawPathNull
     * @tc.desc      : testCanvasDrawPathNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawPathNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0803
     * @tc.name      : testCanvasDrawPathMultipleCalls
     * @tc.desc      : testCanvasDrawPathMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawPathMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0900
     * @tc.name      : testCanvasDrawLineNormal
     * @tc.desc      : testCanvasDrawLineNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasDrawLineNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0901
     * @tc.name      : testCanvasDrawLineNull
     * @tc.desc      : testCanvasDrawLineNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawLineNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_0903
     * @tc.name      : testCanvasDrawLineMultipleCalls
     * @tc.desc      : testCanvasDrawLineMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawLineMultipleCalls', DEFAULT, () => {
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