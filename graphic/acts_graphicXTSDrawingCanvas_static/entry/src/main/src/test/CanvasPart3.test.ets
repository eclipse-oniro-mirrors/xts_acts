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
import { BusinessError } from '@ohos.base';

export default function drawingTsCanvasPart3Test() {
  describe('DrawingTsCanvasPart3Test', () => {
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
     * @tc.name   testCanvasRestoreToCountNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_2000
     * @tc.desc   testCanvasRestoreToCountNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasRestoreToCountNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasRestoreToCountNormalStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        canvas.drawRect({left: 10, right: 200, top: 100, bottom: 300});
        for (let index = 0; index < 20; index++) {
          canvas.save();
        }
        canvas.restoreToCount(2);
        canvas.getSaveCount();
        canvas.restoreToCount(5);
        canvas.getSaveCount();
        canvas.restoreToCount(1);
        canvas.getSaveCount();
        canvas.restoreToCount(0);
        canvas.getSaveCount();
        canvas.restoreToCount(15);
        canvas.getSaveCount();
        console.info(msg + 'restoreToCount successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `restoreToCount errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        const canvas = new drawing.Canvas(pixel);
        canvas.drawRect({left: 10, right: 200, top: 100, bottom: 300});
        for (let index = 0; index < 20; index++) {
          canvas.save();
        }
        canvas.restoreToCount(-1);
        canvas.getSaveCount();
        console.info(msg + 'restoreToCount successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `restoreToCount errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testCanvasRestoreToCountMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_2003
     * @tc.desc   testCanvasRestoreToCountMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasRestoreToCountMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasRestoreToCountMultipleCallsStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        for (let index = 0; index < 20; index++) {
          canvas.restoreToCount((Math.random() * Number.MAX_VALUE).toInt());
        }
        console.info(msg + 'restoreToCount successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `restoreToCount errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasRestoreNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_2100
     * @tc.desc   testCanvasRestoreNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasRestoreNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testCanvasRestoreNormalStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        canvas.save();
        canvas.restore();
        canvas.getSaveCount();
        console.info(msg + 'restore successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `restore errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasRestoreMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_2102
     * @tc.desc   testCanvasRestoreMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasRestoreMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testCanvasRestoreMultipleCallsStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        for (let index = 0; index < 20; index++) {
          canvas.save();
        }
        for (let index = 0; index < 20; index++) {
          canvas.restore();
        }
        canvas.getSaveCount();
        for (let index = 0; index < 20; index++) {
          canvas.save();
          canvas.restore();
          canvas.getSaveCount();
        }
        console.info(msg + 'restore successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `restore errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasRestoreWhenNoSaveStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_2103
     * @tc.desc   testCanvasRestoreWhenNoSave
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasRestoreWhenNoSaveStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testCanvasRestoreWhenNoSaveStatic';
      try {
        const canvas = new drawing.Canvas(pixel);
        canvas.restore();
        canvas.getSaveCount();
        console.info(msg + 'restore successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `restore errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
  })
}