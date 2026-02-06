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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from "../../../hypium/index";
import image from '@ohos.multimedia.image';
import drawing from '@ohos.graphics.drawing';
import { getEnumCount } from './utils';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function drawingTsCanvasPart2Test() {
  describe('DrawingTsCanvasPart2Test', () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_8000
     * @tc.name      : testCanvasClipOpStatic
     * @tc.desc      : testCanvasClipOpStatic
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasClipOpStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testCanvasClipOpStatic';
      try {
        expect(drawing.ClipOp.DIFFERENCE + '').assertEqual('0');
        expect(drawing.ClipOp.INTERSECT + '').assertEqual('1');
        console.info(msg + 'ClipOp successes');
      } catch (e: BusinessError) {
        console.info(msg + `ClipOp errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1200
     * @tc.name      : testCanvasAttachBrushDetachBrushNormalStatic
     * @tc.desc      : testCanvasAttachBrushDetachBrushNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasAttachBrushDetachBrushNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testCanvasAttachBrushDetachBrushNormalStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        const brush = new drawing.Brush();
        // brush.setColor({
        //   alpha: 255,
        //   red: 255,
        //   green: 0,
        //   blue: 0
        // });
        canvas.attachBrush(brush);
        canvas.drawRect({
          left: 0,
          right: 0,
          top: 10,
          bottom: 10
        });
        canvas.detachBrush();
        console.info(msg + 'attachBrush successed');
      } catch (e: BusinessError) {
        console.info(msg + `attachBrush errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1203
     * @tc.name      : testCanvasAttachBrushDetachBrushMultipleCallsStatic
     * @tc.desc      : testCanvasAttachBrushDetachBrushMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasAttachBrushDetachBrushMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const msg = 'testCanvasAttachBrushDetachBrushMultipleCallsStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        const brush = new drawing.Brush();
        // brush.setColor({
        //   alpha: 255,
        //   red: 255,
        //   green: 0,
        //   blue: 0
        // });
        for (let index = 0; index < 20; index++) {
          canvas.attachBrush(brush);
        }
        canvas.drawRect({
          left: 0,
          right: 0,
          top: 10,
          bottom: 10
        });
        for (let index = 0; index < 20; index++) {
          canvas.detachBrush();
        }
        for (let index = 0; index < 20; index++) {
          canvas.attachBrush(brush);
          canvas.drawRect({
            left: 0,
            right: 0,
            top: 10,
            bottom: 10
          });
          canvas.detachBrush();
        }
        console.info(msg + 'attachBrush successed');
      } catch (e: BusinessError) {
        console.info(msg + `attachBrush errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1204
     * @tc.name      : testCanvasAttachBrushOlyStatic
     * @tc.desc      : testCanvasAttachBrushOly
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasAttachBrushOlyStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const msg = 'testCanvasAttachBrushOlyStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        const brush = new drawing.Brush();
        // brush.setColor({
        //   alpha: 255,
        //   red: 255,
        //   green: 0,
        //   blue: 0
        // });
        canvas.attachBrush(brush);
        canvas.drawRect({
          left: 0,
          right: 0,
          top: 10,
          bottom: 10
        });
        console.info(msg + 'attachBrush successed');
      } catch (e: BusinessError) {
        console.info(msg + `attachBrush errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1205
     * @tc.name      : testCanvasDttachBrushOlyStatic
     * @tc.desc      : testCanvasDttachBrushOly
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDttachBrushOlyStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const msg = 'testCanvasDttachBrushOlyStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        canvas.detachBrush();
        console.info(msg + 'attachBrush successed');
      } catch (e: BusinessError) {
        console.info(msg + `attachBrush errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1800
     * @tc.name      : testCanvasRotateNormalStatic
     * @tc.desc      : testCanvasRotateNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasRotateNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testCanvasRotateNormalStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        // pen.setStrokeWidth(5);
        // pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        // canvas.attachPen(pen);
        canvas.rotate(30, 100, 100);
        canvas.rotate(30.1, 100.1, 100.1);
        canvas.rotate(0, 100, 100);
        canvas.rotate(360, 100, 100);
        canvas.rotate(-90, 100, 100);
        canvas.rotate(400, 100, 100);
        canvas.rotate(30, -100, -100);
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        // canvas.detachPen();
        console.info(msg + 'rotate successed');
      } catch (e: BusinessError) {
        console.info(msg + `rotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_1803
     * @tc.name      : testCanvasRotateMultipleCallsStatic
     * @tc.desc      : testCanvasRotateMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasRotateMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testCanvasRotateMultipleCallsStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        // pen.setStrokeWidth(5);
        // pen.setColor({alpha: 255, red: 255, green: 0, blue: 0});
        // canvas.attachPen(pen);
        for (let index = 0; index < 20; index++) {
          canvas.rotate(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        canvas.drawRect({left : 10, right : 500, top : 300, bottom : 900});
        // canvas.detachPen();
        console.info(msg + 'rotate successed');
      } catch (e: BusinessError) {
        console.info(msg + `rotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
  })
}