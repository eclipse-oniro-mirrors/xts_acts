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

export default function drawingTsCanvasPart2Test() {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1000
     * @tc.name      : testCanvasDrawTextBlobNormal
     * @tc.desc      : testCanvasDrawTextBlobNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasDrawTextBlobNormal', DEFAULT, () => {
      const msg = 'testCanvasDrawTextBlobNormal';
      try {
        const canvas = new drawing.Canvas(pixel);
        const brush = new drawing.Brush();
        brush.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        const font = new drawing.Font();
        font.setSize(20);
        const textBlob = drawing.TextBlob.makeFromString("Hello, drawing", font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        canvas.attachBrush(brush);
        canvas.drawTextBlob(textBlob, 20, 20);
        canvas.drawTextBlob(textBlob, 20.5, 20.5);
        canvas.drawTextBlob(textBlob, -10, -10);
        canvas.detachBrush();
        console.info(msg + 'drawTextBlob successed');
      } catch (e) {
        console.info(msg + `drawTextBlob errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1001
     * @tc.name      : testCanvasDrawTextBlobNull
     * @tc.desc      : testCanvasDrawTextBlobNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawTextBlobNull', DEFAULT, () => {
      const msg = 'testCanvasDrawTextBlobNull';
      const canvas = new drawing.Canvas(pixel);
      try {
        const brush = new drawing.Brush();
        brush.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        const font = new drawing.Font();
        font.setSize(20);
        canvas.attachBrush(brush);
        canvas.drawTextBlob(undefined, 20, 20);
        canvas.detachBrush();
        console.info(msg + 'drawTextBlob successed');
      } catch (e) {
        console.info(msg + `drawTextBlob errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        const font = new drawing.Font();
        font.setSize(20);
        const textBlob = drawing.TextBlob.makeFromString("Hello, drawing", font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        canvas.attachBrush(brush);
        canvas.drawTextBlob(textBlob, undefined, 20);
        canvas.detachBrush();
        console.info(msg + 'drawTextBlob successed');
      } catch (e) {
        console.info(msg + `drawTextBlob errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        const font = new drawing.Font();
        font.setSize(20);
        const textBlob = drawing.TextBlob.makeFromString("Hello, drawing", font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        canvas.attachBrush(brush);
        canvas.drawTextBlob(textBlob, 20, undefined);
        canvas.detachBrush();
        console.info(msg + 'drawTextBlob successed');
      } catch (e) {
        console.info(msg + `drawTextBlob errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        const font = new drawing.Font();
        font.setSize(20);
        canvas.attachBrush(brush);
        canvas.drawTextBlob(null, 20, 20);
        canvas.detachBrush();
        console.info(msg + 'drawTextBlob successed');
      } catch (e) {
        console.info(msg + `drawTextBlob errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        const font = new drawing.Font();
        font.setSize(20);
        const textBlob = drawing.TextBlob.makeFromString("Hello, drawing", font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        canvas.attachBrush(brush);
        canvas.drawTextBlob(textBlob, null, 20);
        canvas.detachBrush();
        console.info(msg + 'drawTextBlob successed');
      } catch (e) {
        console.info(msg + `drawTextBlob errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        const font = new drawing.Font();
        font.setSize(20);
        const textBlob = drawing.TextBlob.makeFromString("Hello, drawing", font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        canvas.attachBrush(brush);
        canvas.drawTextBlob(textBlob, 20, null);
        canvas.detachBrush();
        console.info(msg + 'drawTextBlob successed');
      } catch (e) {
        console.info(msg + `drawTextBlob errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1002
     * @tc.name      : testCanvasDrawTextBlobMismatch
     * @tc.desc      : testCanvasDrawTextBlobMismatch
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawTextBlobMismatch', DEFAULT, () => {
      const msg = 'testCanvasDrawTextBlobMismatch';
      const canvas = new drawing.Canvas(pixel);
      try {
        const brush = new drawing.Brush();
        brush.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        const font = new drawing.Font();
        font.setSize(20);
        const textBlob = drawing.TextBlob.makeFromString("Hello, drawing", font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        canvas.attachBrush(brush);
        canvas.drawTextBlob(textBlob, 20, 20, 100);
        canvas.detachBrush();
        console.info(msg + 'drawTextBlob successed');
      } catch (e) {
        console.info(msg + `drawTextBlob errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        const font = new drawing.Font();
        font.setSize(20);
        const textBlob = drawing.TextBlob.makeFromString("Hello, drawing", font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        canvas.attachBrush(brush);
        canvas.drawTextBlob(textBlob, 200);
        canvas.detachBrush();
        console.info(msg + 'drawTextBlob successed');
      } catch (e) {
        console.info(msg + `drawTextBlob errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        const font = new drawing.Font();
        font.setSize(20);
        const textBlob = drawing.TextBlob.makeFromString("Hello, drawing", font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        canvas.attachBrush(brush);
        canvas.drawTextBlob(textBlob, 20, 's');
        canvas.detachBrush();
        console.info(msg + 'drawTextBlob successed');
      } catch (e) {
        console.info(msg + `drawTextBlob errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1003
     * @tc.name      : testCanvasDrawTextBlobMultipleCalls
     * @tc.desc      : testCanvasDrawTextBlobMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawTextBlobMultipleCalls', DEFAULT, () => {
      const msg = 'testCanvasDrawTextBlobMultipleCalls';
      try {
        const canvas = new drawing.Canvas(pixel);
        const brush = new drawing.Brush();
        brush.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        const font = new drawing.Font();
        font.setSize(20);
        const textBlob = drawing.TextBlob.makeFromString("Hello, drawing", font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        canvas.attachBrush(brush);
        for (let index = 0; index < 20; index++) {
          canvas.drawTextBlob(textBlob, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        canvas.detachBrush();
        console.info(msg + 'drawTextBlob successed');
      } catch (e) {
        console.info(msg + `drawTextBlob errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1100
     * @tc.name      : testCanvasAttachPenDetachPenNormal
     * @tc.desc      : testCanvasAttachPenDetachPenNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasAttachPenDetachPenNormal', DEFAULT, () => {
      const msg = 'testCanvasAttachPenDetachPenNormal';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.drawRect({ left : 0, right : 0, top : 10, bottom : 10 });
        canvas.detachPen();
        console.info(msg + 'attachPen successed');
      } catch (e) {
        console.info(msg + `attachPen errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1101
     * @tc.name      : testCanvasAttachPenDetachPenNull
     * @tc.desc      : testCanvasAttachPenDetachPenNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasAttachPenDetachPenNull', DEFAULT, () => {
      const msg = 'testCanvasAttachPenDetachPenNull';
      const canvas = new drawing.Canvas(pixel);
      try {
        canvas.attachPen(undefined);
        canvas.drawRect({ left : 0, right : 0, top : 10, bottom : 10 });
        canvas.drawRect({ left : 0, right : 0, top : 10, bottom : 10 });
        canvas.detachPen();
        console.info(msg + 'attachPen successed');
      } catch (e) {
        console.info(msg + `attachPen errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1102
     * @tc.name      : testCanvasAttachPenDetachPenMismatch
     * @tc.desc      : testCanvasAttachPenDetachPenMismatch
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasAttachPenDetachPenMismatch', DEFAULT, () => {
      const msg = 'testCanvasAttachPenDetachPenMismatch';
      const canvas = new drawing.Canvas(pixel);
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen, pen);
        canvas.drawRect({ left : 0, right : 0, top : 10, bottom : 10 });
        canvas.detachPen();
        console.info(msg + 'attachPen successed');
      } catch (e) {
        console.info(msg + `attachPen errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.attachPen();
        canvas.drawRect({ left : 0, right : 0, top : 10, bottom : 10 });
        canvas.detachPen();
        console.info(msg + 'attachPen successed');
      } catch (e) {
        console.info(msg + `attachPen errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.attachPen('pen');
        canvas.drawRect({ left : 0, right : 0, top : 10, bottom : 10 });
        canvas.detachPen();
        console.info(msg + 'attachPen successed');
      } catch (e) {
        console.info(msg + `attachPen errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1103
     * @tc.name      : testCanvasAttachPenDetachPenMultipleCalls
     * @tc.desc      : testCanvasAttachPenDetachPenMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasAttachPenDetachPenMultipleCalls', DEFAULT, () => {
      const msg = 'testCanvasAttachPenDetachPenMultipleCalls';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        for (let index = 0; index < 20; index++) {
          canvas.attachPen(pen);
        }
        canvas.drawRect({ left : 0, right : 0, top : 10, bottom : 10 });
        for (let index = 0; index < 20; index++) {
          canvas.detachPen();
        }
        for (let index = 0; index < 20; index++) {
          canvas.attachPen(pen);
          canvas.drawRect({ left : 0, right : 0, top : 10, bottom : 10 });
          canvas.detachPen();
        }
        console.info(msg + 'attachPen successed');
      } catch (e) {
        console.info(msg + `attachPen errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1104
     * @tc.name      : testCanvasAttachPenOly
     * @tc.desc      : testCanvasAttachPenOly
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasAttachPenOly', DEFAULT, () => {
      const msg = 'testCanvasAttachPenOly';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.drawRect({ left : 0, right : 0, top : 10, bottom : 10 });
        console.info(msg + 'attachPen successed');
      } catch (e) {
        console.info(msg + `attachPen errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1105
     * @tc.name      : testCanvasDttachPenOly
     * @tc.desc      : testCanvasDttachPenOly
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDttachPenOly', DEFAULT, () => {
      const msg = 'testCanvasDttachPenOly';
      try {
        const canvas = new drawing.Canvas(pixel);
        canvas.detachPen();
        console.info(msg + 'attachPen successed');
      } catch (e) {
        console.info(msg + `attachPen errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1200
     * @tc.name      : testCanvasAttachBrushDetachBrushNormal
     * @tc.desc      : testCanvasAttachBrushDetachBrushNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasAttachBrushDetachBrushNormal', DEFAULT, () => {
      const msg = 'testCanvasAttachBrushDetachBrushNormal';
      try {
        const canvas = new drawing.Canvas(pixel);
        const brush = new drawing.Brush();
        brush.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachBrush(brush);
        canvas.drawRect({ left : 0, right : 0, top : 10, bottom : 10 });
        canvas.detachBrush();
        console.info(msg + 'attachBrush successed');
      } catch (e) {
        console.info(msg + `attachBrush errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1201
     * @tc.name      : testCanvasAttachBrushDetachBrushNull
     * @tc.desc      : testCanvasAttachBrushDetachBrushNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasAttachBrushDetachBrushNull', DEFAULT, () => {
      const msg = 'testCanvasAttachBrushDetachBrushNull';
      const canvas = new drawing.Canvas(pixel);
      try {
        canvas.attachBrush(undefined);
        canvas.drawRect({ left : 0, right : 0, top : 10, bottom : 10 });
        canvas.detachBrush();
        console.info(msg + 'attachBrush successed');
      } catch (e) {
        console.info(msg + `attachBrush errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.attachBrush(null);
        canvas.drawRect({ left : 0, right : 0, top : 10, bottom : 10 });
        canvas.detachBrush();
        console.info(msg + 'attachBrush successed');
      } catch (e) {
        console.info(msg + `attachBrush errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1202
     * @tc.name      : testCanvasAttachBrushDetachBrushMismatch
     * @tc.desc      : testCanvasAttachBrushDetachBrushMismatch
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasAttachBrushDetachBrushMismatch', DEFAULT, () => {
      const msg = 'testCanvasAttachBrushDetachBrushMismatch';
      const canvas = new drawing.Canvas(pixel);
      try {
        const brush = new drawing.Brush();
        brush.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachBrush(brush, brush);
        canvas.drawRect({ left : 0, right : 0, top : 10, bottom : 10 });
        canvas.detachBrush();
        console.info(msg + 'attachBrush successed');
      } catch (e) {
        console.info(msg + `attachBrush errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.attachBrush();
        canvas.drawRect({ left : 0, right : 0, top : 10, bottom : 10 });
        canvas.detachBrush();
        console.info(msg + 'attachBrush successed');
      } catch (e) {
        console.info(msg + `attachBrush errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachBrush('brush');
        canvas.drawRect({ left : 0, right : 0, top : 10, bottom : 10 });
        canvas.detachBrush();
        console.info(msg + 'attachBrush successed');
      } catch (e) {
        console.info(msg + `attachBrush errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1203
     * @tc.name      : testCanvasAttachBrushDetachBrushMultipleCalls
     * @tc.desc      : testCanvasAttachBrushDetachBrushMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasAttachBrushDetachBrushMultipleCalls', DEFAULT, () => {
      const msg = 'testCanvasAttachBrushDetachBrushMultipleCalls';
      try {
        const canvas = new drawing.Canvas(pixel);
        const brush = new drawing.Brush();
        brush.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        for (let index = 0; index < 20; index++) {
          canvas.attachBrush(brush);
        }
        canvas.drawRect({ left : 0, right : 0, top : 10, bottom : 10 });
        for (let index = 0; index < 20; index++) {
          canvas.detachBrush();
        }
        for (let index = 0; index < 20; index++) {
          canvas.attachBrush(brush);
          canvas.drawRect({ left : 0, right : 0, top : 10, bottom : 10 });
          canvas.detachBrush();
        }
        console.info(msg + 'attachBrush successed');
      } catch (e) {
        console.info(msg + `attachBrush errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1204
     * @tc.name      : testCanvasAttachBrushOly
     * @tc.desc      : testCanvasAttachBrushOly
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasAttachBrushOly', DEFAULT, () => {
      const msg = 'testCanvasAttachBrushOly';
      try {
        const canvas = new drawing.Canvas(pixel);
        const brush = new drawing.Brush();
        brush.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachBrush(brush);
        canvas.drawRect({ left : 0, right : 0, top : 10, bottom : 10 });
        console.info(msg + 'attachBrush successed');
      } catch (e) {
        console.info(msg + `attachBrush errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1205
     * @tc.name      : testCanvasDttachBrushOly
     * @tc.desc      : testCanvasDttachBrushOly
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDttachBrushOly', DEFAULT, () => {
      const msg = 'testCanvasDttachBrushOly';
      try {
        const canvas = new drawing.Canvas(pixel);
        canvas.detachBrush();
        console.info(msg + 'attachBrush successed');
      } catch (e) {
        console.info(msg + `attachBrush errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1300
     * @tc.name      : testCanvasClipPathNormal
     * @tc.desc      : testCanvasClipPathNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasClipPathNormal', DEFAULT, () => {
      const msg = 'testCanvasClipPathNormal';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        let path = new drawing.Path();
        path.moveTo(10, 10);
        path.cubicTo(10, 10, 10, 10, 15, 15);
        path.close();
        canvas.attachPen(pen);
        canvas.clipPath(path, drawing.ClipOp.DIFFERENCE, true);
        canvas.clipPath(path, drawing.ClipOp.INTERSECT, true);
        canvas.clipPath(path, drawing.ClipOp.DIFFERENCE, false);
        canvas.clipPath(path, drawing.ClipOp.INTERSECT, false);
        canvas.clipPath(path, drawing.ClipOp.DIFFERENCE);
        canvas.clipPath(path);
        canvas.detachPen();
        console.info(msg + 'clipPath successed');
      } catch (e) {
        console.info(msg + `clipPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1301
     * @tc.name      : testCanvasClipPathNull
     * @tc.desc      : testCanvasClipPathNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasClipPathNull', DEFAULT, () => {
      const msg = 'testCanvasClipPathNull';
      const canvas = new drawing.Canvas(pixel);
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.clipPath(undefined, drawing.ClipOp.DIFFERENCE, true);
        canvas.detachPen();
        console.info(msg + 'clipPath successed');
      } catch (e) {
        console.info(msg + `clipPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        let path = new drawing.Path();
        path.moveTo(10, 10);
        path.cubicTo(10, 10, 10, 10, 15, 15);
        path.close();
        canvas.attachPen(pen);
        canvas.clipPath(path, undefined, true);
        canvas.detachPen();
        console.info(msg + 'clipPath successed');
      } catch (e) {
        console.info(msg + `clipPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        let path = new drawing.Path();
        path.moveTo(10, 10);
        path.cubicTo(10, 10, 10, 10, 15, 15);
        path.close();
        canvas.attachPen(pen);
        canvas.clipPath(path, drawing.ClipOp.DIFFERENCE, undefined);
        canvas.detachPen();
        console.info(msg + 'clipPath successed');
      } catch (e) {
        console.info(msg + `clipPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.clipPath(null, drawing.ClipOp.DIFFERENCE, true);
        canvas.detachPen();
        console.info(msg + 'clipPath successed');
      } catch (e) {
        console.info(msg + `clipPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        let path = new drawing.Path();
        path.moveTo(10, 10);
        path.cubicTo(10, 10, 10, 10, 15, 15);
        path.close();
        canvas.attachPen(pen);
        canvas.clipPath(path, null, true);
        canvas.detachPen();
        console.info(msg + 'clipPath successed');
      } catch (e) {
        console.info(msg + `clipPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        let path = new drawing.Path();
        path.moveTo(10, 10);
        path.cubicTo(10, 10, 10, 10, 15, 15);
        path.close();
        canvas.attachPen(pen);
        canvas.clipPath(path, drawing.ClipOp.DIFFERENCE, null);
        canvas.detachPen();
        console.info(msg + 'clipPath successed');
      } catch (e) {
        console.info(msg + `clipPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1302
     * @tc.name      : testCanvasClipPathMismatch
     * @tc.desc      : testCanvasClipPathMismatch
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasClipPathMismatch', DEFAULT, () => {
      const msg = 'testCanvasClipPathMismatch';
      const canvas = new drawing.Canvas(pixel);
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        let path = new drawing.Path();
        path.moveTo(10, 10);
        path.cubicTo(10, 10, 10, 10, 15, 15);
        path.close();
        canvas.attachPen(pen);
        canvas.clipPath(path, drawing.ClipOp.DIFFERENCE, true, true);
        canvas.detachPen();
        console.info(msg + 'clipPath successed');
      } catch (e) {
        console.info(msg + `clipPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        let path = new drawing.Path();
        path.moveTo(10, 10);
        path.cubicTo(10, 10, 10, 10, 15, 15);
        path.close();
        canvas.attachPen(pen);
        canvas.clipPath(path, 's', true);
        canvas.detachPen();
        console.info(msg + 'clipPath successed');
      } catch (e) {
        console.info(msg + `clipPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        let path = new drawing.Path();
        path.moveTo(10, 10);
        path.cubicTo(10, 10, 10, 10, 15, 15);
        path.close();
        canvas.attachPen(pen);
        canvas.clipPath(drawing.ClipOp.DIFFERENCE);
        canvas.detachPen();
        console.info(msg + 'clipPath successed');
      } catch (e) {
        console.info(msg + `clipPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1303
     * @tc.name      : testCanvasClipPathMultipleCalls
     * @tc.desc      : testCanvasClipPathMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasClipPathMultipleCalls', DEFAULT, () => {
      const msg = 'testCanvasClipPathMultipleCalls';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        for (let index = 0; index < 20; index++) {
          let path = new drawing.Path();
          path.moveTo(10, 10);
          path.cubicTo(Math.random() * Number.MAX_VALUE, 10, 10, 10, 15, 15);
          path.close();
          const randomEnum = Math.floor(Math.random() * (getEnumCount(drawing.ClipOp)));
          canvas.clipPath(path, randomEnum, Math.random() == 1 ? true : false);
        }
        canvas.detachPen();
        console.info(msg + 'clipPath successed');
      } catch (e) {
        console.info(msg + `clipPath errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1400
     * @tc.name      : testCanvasClipRectNormal
     * @tc.desc      : testCanvasClipRectNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasClipRectNormal', DEFAULT, () => {
      const msg = 'testCanvasClipRectNormal';
      try {
        const canvas = new drawing.Canvas(pixel);
        canvas.clipRect({left : 10, right : 500, top : 300, bottom : 900}, drawing.ClipOp.DIFFERENCE, true);
        canvas.clipRect({left : 10, right : 500, top : 300, bottom : 900}, drawing.ClipOp.INTERSECT, true);
        canvas.clipRect({left : 10, right : 500, top : 300, bottom : 900}, drawing.ClipOp.DIFFERENCE, false);
        canvas.clipRect({left : 10, right : 500, top : 300, bottom : 900}, drawing.ClipOp.INTERSECT, false);
        canvas.clipRect({left : 10, right : 500, top : 300, bottom : 900}, drawing.ClipOp.DIFFERENCE);
        canvas.clipRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.clipRect({ left : 100.32, right : 100.5, top : 400.2, bottom : 400.3 }, drawing.ClipOp.DIFFERENCE, true);
        canvas.clipRect({ left : 0, right : 0, top : 0, bottom : 100}, drawing.ClipOp.INTERSECT, true);
        canvas.clipRect({ left : 0, right : 100, top : 100, bottom : 100}, drawing.ClipOp.DIFFERENCE, false);
        canvas.clipRect({ left : 100, right : 100, top : 100, bottom : 100}, drawing.ClipOp.INTERSECT, false);
        canvas.clipRect({ left : -100, right : 100, top : -100, bottom : 100});
        canvas.clipRect({ left : 100, right : -100, top : 100, bottom : -100}, drawing.ClipOp.DIFFERENCE, true);
        canvas.clipRect({left : 10, right : 500, top : 300, bottom : 900}, drawing.ClipOp.DIFFERENCE, true);
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1401
     * @tc.name      : testCanvasClipRectNull
     * @tc.desc      : testCanvasClipRectNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasClipRectNull', DEFAULT, () => {
      const msg = 'testCanvasClipRectNull';
      const canvas = new drawing.Canvas(pixel);
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.clipRect(undefined, drawing.ClipOp.DIFFERENCE, true);
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.clipRect({left : 10, right : 500, top : 300, bottom : 900}, undefined, true);
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.clipRect({left : 10, right : 500, top : 300, bottom : 900}, drawing.ClipOp.DIFFERENCE, undefined);
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.clipRect(null, drawing.ClipOp.DIFFERENCE, true);
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.clipRect({left : 10, right : 500, top : 300, bottom : 900}, null, true);
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.clipRect({left : 10, right : 500, top : 300, bottom : 900}, drawing.ClipOp.DIFFERENCE, null);
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.clipRect({ left : null, right : 0, top : 10, bottom : 10 });
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.clipRect({ left : 0, right : null, top : 10, bottom : 10 });
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.clipRect({ left : 0, right : 100, top : null, bottom : 10 });
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.drawRect({ left : 0, right : 100, top : 10, bottom : null });
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.clipRect({ left : undefined, right : 0, top : 10, bottom : 10 });
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.clipRect({ left : 0, right : undefined, top : 10, bottom : 10 });
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.clipRect({ left : 0, right : 100, top : undefined, bottom : 10 });
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.clipRect({ left : 0, right : 100, top : 10, bottom : undefined });
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1402
     * @tc.name      : testCanvasClipRectMismatch
     * @tc.desc      : testCanvasClipRectMismatch
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasClipRectMismatch', DEFAULT, () => {
      const msg = 'testCanvasClipRectMismatch';
      const canvas = new drawing.Canvas(pixel);
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.clipRect({left : 10, right : 500, top : 300, bottom : 900}, drawing.ClipOp.DIFFERENCE, true, true);
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.clipRect({left : 10, right : 500, top : 300, bottom : 900}, 's', true);
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.clipRect(drawing.ClipOp.DIFFERENCE);
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1403
     * @tc.name      : testCanvasClipRectMultipleCalls
     * @tc.desc      : testCanvasClipRectMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasClipRectMultipleCalls', DEFAULT, () => {
      const msg = 'testCanvasClipRectMultipleCalls';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        for (let index = 0; index < 20; index++) {
          const randomEnum = Math.floor(Math.random() * (getEnumCount(drawing.ClipOp)));
          canvas.drawCircle(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
          canvas.clipRect({left : Math.random() * Number.MAX_VALUE, right : Math.random() * Number.MAX_VALUE, top : Math.random() * Number.MAX_VALUE, bottom : Math.random() * Number.MAX_VALUE}, randomEnum, Math.random() == 1 ? true : false);
        }
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1500
     * @tc.name      : testCanvasSaveGetSaveCountNormal
     * @tc.desc      : testCanvasSaveGetSaveCountNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasSaveGetSaveCountNormal', DEFAULT, () => {
      const msg = 'testCanvasSaveGetSaveCountNormal';
      try {
        const canvas = new drawing.Canvas(pixel);
        let rect: common2D.Rect = {left: 10, right: 200, top: 100, bottom: 300};
        canvas.drawRect(rect);
        let saveCount = canvas.save();
        let readCount = canvas.getSaveCount();
        canvas.restore();
        expect(saveCount + 1 == readCount).assertTrue();
        canvas.scale(2, 0.5);
        canvas.skew(0.1, 0.1);
        canvas.rotate(30, 100, 100);
        canvas.translate(10, 10);
        let saveCount2 = canvas.save();
        readCount = canvas.getSaveCount();
        canvas.restore();
        expect(saveCount + 1 == readCount).assertTrue();
        console.info(msg + 'save、getSaveCount successed');
      } catch (e) {
        console.info(msg + `save、getSaveCount errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1501
     * @tc.name      : testCanvasSaveGetSaveCountMismatch
     * @tc.desc      : testCanvasSaveGetSaveCountMismatch
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasSaveGetSaveCountMismatch', DEFAULT, () => {
      const msg = 'testCanvasSaveGetSaveCountMismatch';
      try {
        const canvas = new drawing.Canvas(pixel);
        canvas.save('canvas');
        canvas.getSaveCount('canvas');
        canvas.restore();
        console.info(msg + 'save、getSaveCount successed');
      } catch (e) {
        console.info(msg + `save、getSaveCount errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1502
     * @tc.name      : testCanvasSaveGetSaveCountMultipleCalls
     * @tc.desc      : testCanvasSaveGetSaveCountMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasSaveGetSaveCountMultipleCalls', DEFAULT, () => {
      const msg = 'testCanvasSaveGetSaveCountMultipleCalls';
      try {
        const canvas = new drawing.Canvas(pixel);
        let rect: common2D.Rect = {left: 10, right: 200, top: 100, bottom: 300};
        canvas.drawRect(rect);
        for (let index = 0; index < 20; index++) {
          canvas.save();
        }
        for (let index = 0; index < 20; index++) {
          canvas.getSaveCount();
        }
        for (let index = 0; index < 20; index++) {
          canvas.save();
          canvas.getSaveCount();
        }
        canvas.restore();
        console.info(msg + 'save、getSaveCount successed');
      } catch (e) {
        console.info(msg + `save、getSaveCount errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1503
     * @tc.name      : testCanvasGetSaveCountWhenNoSave
     * @tc.desc      : testCanvasGetSaveCountWhenNoSave
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasGetSaveCountWhenNoSave', DEFAULT, () => {
      const msg = 'testCanvasGetSaveCountWhenNoSave';
      try {
        const canvas = new drawing.Canvas(pixel);
        let readCount = canvas.getSaveCount();
        expect(1 == readCount).assertTrue();
        console.info(msg + 'save、getSaveCount successed');
      } catch (e) {
        console.info(msg + `save、getSaveCount errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1600
     * @tc.name      : testCanvasScaleNormal
     * @tc.desc      : testCanvasScaleNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasScaleNormal', DEFAULT, () => {
      const msg = 'testCanvasScaleNormal';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.scale(2, 2);
        canvas.scale(0.5, 0.5);
        canvas.scale(-10, -10);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'scale successed');
      } catch (e) {
        console.info(msg + `scale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1601
     * @tc.name      : testCanvasScaleNull
     * @tc.desc      : testCanvasScaleNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasScaleNull', DEFAULT, () => {
      const msg = 'testCanvasScaleNull';
      const canvas = new drawing.Canvas(pixel);
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.scale(undefined,2);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'scale successed');
      } catch (e) {
        console.info(msg + `scale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.scale(0.5,undefined);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'scale successed');
      } catch (e) {
        console.info(msg + `scale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.scale(null,0.5);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'scale successed');
      } catch (e) {
        console.info(msg + `scale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.scale(2,null);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'scale successed');
      } catch (e) {
        console.info(msg + `scale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1602
     * @tc.name      : testCanvasScaleMismatch
     * @tc.desc      : testCanvasScaleMismatch
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasScaleMismatch', DEFAULT, () => {
      const msg = 'testCanvasScaleMismatch';
      const canvas = new drawing.Canvas(pixel);
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.scale(10,10,10);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'scale successed');
      } catch (e) {
        console.info(msg + `scale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.scale(10);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'scale successed');
      } catch (e) {
        console.info(msg + `scale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.scale(10,'s');
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'scale successed');
      } catch (e) {
        console.info(msg + `scale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1603
     * @tc.name      : testCanvasScaleMultipleCalls
     * @tc.desc      : testCanvasScaleMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasScaleMultipleCalls', DEFAULT, () => {
      const msg = 'testCanvasScaleMultipleCalls';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        for (let index = 0; index < 20; index++) {
          canvas.scale(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'clipRect successed');
      } catch (e) {
        console.info(msg + `clipRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1700
     * @tc.name      : testCanvasSkewNormal
     * @tc.desc      : testCanvasSkewNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasSkewNormal', DEFAULT, () => {
      const msg = 'testCanvasSkewNormal';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.skew(2, 2);
        canvas.skew(0.5, 0.5);
        canvas.skew(-10, -10);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'skew successed');
      } catch (e) {
        console.info(msg + `skew errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1701
     * @tc.name      : testCanvasSkewNull
     * @tc.desc      : testCanvasSkewNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasSkewNull', DEFAULT, () => {
      const msg = 'testCanvasSkewNull';
      const canvas = new drawing.Canvas(pixel);
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.skew(undefined,2);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'skew successed');
      } catch (e) {
        console.info(msg + `skew errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.skew(0.5,undefined);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'skew successed');
      } catch (e) {
        console.info(msg + `skew errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.skew(null,0.5);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'skew successed');
      } catch (e) {
        console.info(msg + `skew errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.skew(2,null);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'skew successed');
      } catch (e) {
        console.info(msg + `skew errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1702
     * @tc.name      : testCanvasSkewMismatch
     * @tc.desc      : testCanvasSkewMismatch
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasSkewMismatch', DEFAULT, () => {
      const msg = 'testCanvasSkewMismatch';
      const canvas = new drawing.Canvas(pixel);
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.skew(10,10,10);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'skew successed');
      } catch (e) {
        console.info(msg + `skew errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.skew(10);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'skew successed');
      } catch (e) {
        console.info(msg + `skew errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.skew(10,'s');
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'skew successed');
      } catch (e) {
        console.info(msg + `skew errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1703
     * @tc.name      : testCanvasSkewMultipleCalls
     * @tc.desc      : testCanvasSkewMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasSkewMultipleCalls', DEFAULT, () => {
      const msg = 'testCanvasSkewMultipleCalls';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        for (let index = 0; index < 20; index++) {
          canvas.skew(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'skew successed');
      } catch (e) {
        console.info(msg + `skew errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1800
     * @tc.name      : testCanvasRotateNormal
     * @tc.desc      : testCanvasRotateNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasRotateNormal', DEFAULT, () => {
      const msg = 'testCanvasRotateNormal';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.rotate(30, 100, 100);
        canvas.rotate(30.1, 100.1, 100.1);
        canvas.rotate(0, 100, 100);
        canvas.rotate(360, 100, 100);
        canvas.rotate(-90, 100, 100);
        canvas.rotate(400, 100, 100);
        canvas.rotate(30, -100, -100);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'rotate successed');
      } catch (e) {
        console.info(msg + `rotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1801
     * @tc.name      : testCanvasRotateNull
     * @tc.desc      : testCanvasRotateNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasRotateNull', DEFAULT, () => {
      const msg = 'testCanvasRotateNull';
      const canvas = new drawing.Canvas(pixel);
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.rotate(undefined, 100, 100);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'rotate successed');
      } catch (e) {
        console.info(msg + `rotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.rotate(30, undefined, 100);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'rotate successed');
      } catch (e) {
        console.info(msg + `rotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.rotate(30, 100, undefined);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'rotate successed');
      } catch (e) {
        console.info(msg + `rotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.rotate(null, 100, 100);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'rotate successed');
      } catch (e) {
        console.info(msg + `rotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.rotate(30, null, 100);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'rotate successed');
      } catch (e) {
        console.info(msg + `rotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.rotate(30, 100, null);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'rotate successed');
      } catch (e) {
        console.info(msg + `rotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1802
     * @tc.name      : testCanvasRotateMismatch
     * @tc.desc      : testCanvasRotateMismatch
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasRotateMismatch', DEFAULT, () => {
      const msg = 'testCanvasRotateMismatch';
      const canvas = new drawing.Canvas(pixel);
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.rotate(30, 100, 100,30);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'rotate successed');
      } catch (e) {
        console.info(msg + `rotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.rotate(30);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'rotate successed');
      } catch (e) {
        console.info(msg + `rotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.rotate(30, 's', 100);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'rotate successed');
      } catch (e) {
        console.info(msg + `rotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1803
     * @tc.name      : testCanvasRotateMultipleCalls
     * @tc.desc      : testCanvasRotateMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasRotateMultipleCalls', DEFAULT, () => {
      const msg = 'testCanvasRotateMultipleCalls';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        for (let index = 0; index < 20; index++) {
          canvas.rotate(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'rotate successed');
      } catch (e) {
        console.info(msg + `rotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1900
     * @tc.name      : testCanvasTranlateNormal
     * @tc.desc      : testCanvasTranlateNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasTranlateNormal', DEFAULT, () => {
      const msg = 'testCanvasTranlateNormal';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.translate(10, 10);
        canvas.translate(10.1, 10.1);
        canvas.translate(-10, -10);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'tranlate successed');
      } catch (e) {
        console.info(msg + `tranlate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1901
     * @tc.name      : testCanvasTranlateNull
     * @tc.desc      : testCanvasTranlateNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasTranlateNull', DEFAULT, () => {
      const msg = 'testCanvasTranlateNull';
      const canvas = new drawing.Canvas(pixel);
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.translate(undefined,2);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'tranlate successed');
      } catch (e) {
        console.info(msg + `tranlate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.translate(10,undefined);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'tranlate successed');
      } catch (e) {
        console.info(msg + `tranlate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.translate(null,10);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'tranlate successed');
      } catch (e) {
        console.info(msg + `tranlate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.translate(2,null);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'tranlate successed');
      } catch (e) {
        console.info(msg + `tranlate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1902
     * @tc.name      : testCanvasTranlateMismatch
     * @tc.desc      : testCanvasTranlateMismatch
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasTranlateMismatch', DEFAULT, () => {
      const msg = 'testCanvasTranlateMismatch';
      const canvas = new drawing.Canvas(pixel);
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.translate(10,10,10);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'tranlate successed');
      } catch (e) {
        console.info(msg + `tranlate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.translate(10);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'tranlate successed');
      } catch (e) {
        console.info(msg + `tranlate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        canvas.translate(10,'s');
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'tranlate successed');
      } catch (e) {
        console.info(msg + `tranlate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_1903
     * @tc.name      : testCanvasTranlateMultipleCalls
     * @tc.desc      : testCanvasTranlateMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasTranlateMultipleCalls', DEFAULT, () => {
      const msg = 'testCanvasTranlateMultipleCalls';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        pen.setStrokeWidth(5);
        pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        canvas.attachPen(pen);
        for (let index = 0; index < 20; index++) {
          canvas.translate(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        canvas.detachPen();
        console.info(msg + 'tranlate successed');
      } catch (e) {
        console.info(msg + `tranlate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
  })
}