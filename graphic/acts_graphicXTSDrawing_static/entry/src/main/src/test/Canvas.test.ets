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

export default function drawingTsCanvasTest() {
  describe('DrawingTsCanvasTest', () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_0100
     * @tc.name      : testCanvasConstructorNormalStatic
     * @tc.desc      : testCanvasConstructorNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasConstructorNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testCanvasConstructorNormalStatic';
      try {
        new drawing.Canvas(pixel);
        console.info(msg + 'canvasConstructor successed');
      } catch (e: BusinessError) {
        console.info(msg + `canvasConstructor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_0103
     * @tc.name      : testCanvasConstructorMultipleCallsStatic
     * @tc.desc      : testCanvasConstructorMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasConstructorMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testCanvasConstructorMultipleCallsStatic';
      try {
        for (let index = 0; index < 20; index++) {
          new drawing.Canvas(pixel);
        }
        console.info(msg + 'canvasConstructor successed');
      } catch (e: BusinessError) {
        console.info(msg + `canvasConstructor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_0200
     * @tc.name      : testCanvasDrawRectNormalStatic
     * @tc.desc      : testCanvasDrawRectNormalStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasDrawRectNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testCanvasDrawRectNormalStatic';
      try {
        let canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        // pen.setStrokeWidth(5);
        // pen.setColor({
        //   alpha: 255, red: 255, green: 0, blue: 0
        // });
        // canvas.attachPen(pen);
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
        // canvas.detachPen();
        console.info(msg + 'drawRect successed');
      } catch (e: BusinessError) {
        console.info(msg + `drawRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_0201
     * @tc.name      : testCanvasDrawRect2NormalStatic
     * @tc.desc      : testCanvasDrawRect2NormalStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasDrawRect2NormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testCanvasDrawRect2NormalStatic';
      try {
        let canvas = new drawing.Canvas(pixel);
        const pen = new drawing.Pen();
        // pen.setStrokeWidth(5);
        // pen.setColor({
        //   alpha: 255, red: 255, green: 0, blue: 0
        // });
        // canvas.attachPen(pen);
        canvas.drawRect(0, 0, 10, 10);
        // canvas.detachPen();
        console.info(msg + '2 drawRect successed');
      } catch (e: BusinessError) {
        console.info(msg + `2 drawRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_0600
     * @tc.name      : testCanvasDrawPixelMapMeshNormalStatic
     * @tc.desc      : testCanvasDrawPixelMapMeshNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasDrawPixelMapMeshNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testCanvasDrawPixelMapMeshNormalStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        const brush = new drawing.Brush();
        canvas.attachBrush(brush);
        canvas.drawPixelMapMesh(pixel, 2, 2, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360], 0, [0xFFFFFFFF,0xFFEFFFFF,0xFFFFEFFF,0xFFFFFFEF,0xFFFFFF00,0xFFEFFFF,0xFFEFFFF,0xFFEFFFF,0xFFEFFFF], 0);
        canvas.drawPixelMapMesh(pixel, 1, 1, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180], 1.43, [0xFFFFFFFF,0xFFEFFFFF,0xFFFFEFFF,0xFFFFFFEF], 0);
        canvas.drawPixelMapMesh(pixel, 1, 1, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180], 1 , [0xFFFFFFFF,0xFFEFFFFF,0xFFFFEFFF,0xFFFFFFEF,0xFFFFFF00], 1.5356);
        canvas.drawPixelMapMesh(pixel, 1.55, 1, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180], 1, [0xFFFFFFFF,0xFFEFFFFF,0xFFFFEFFF,0xFFFFFFEF], 0);
        canvas.drawPixelMapMesh(pixel, 1, 1.45, [0, 0, 50, 0, 410, 0, 0, 180, 50, 180], 1 , [0xFFFFFFFF,0xFFEFFFFF,0xFFFFEFFF,0xFFFFFFEF,0xFFFFFF00], 1);
        canvas.detachBrush();
        console.info(msg + 'drawPixelMapMesh successed');
      } catch (e: BusinessError) {
        console.info(msg + `drawPixelMapMesh errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
  })
}