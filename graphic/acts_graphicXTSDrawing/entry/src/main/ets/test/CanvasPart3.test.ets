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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2000
     * @tc.name      : testCanvasRestoreToCountNormal
     * @tc.desc      : testCanvasRestoreToCountNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasRestoreToCountNormal', DEFAULT, () => {
      const msg = 'testCanvasRestoreToCountNormal';
      try {
        const canvas = new drawing.Canvas(pixel);
        canvas.drawRect({left: 10, right: 200, top: 100, bottom: 300});
        for (let index = 0; index < 20; index++) {
            canvas.save();
          }
        canvas.restoreToCount(2);
        canvas.getSaveCount();
        canvas.restoreToCount(5.22);
        canvas.getSaveCount();
        canvas.restoreToCount(1);
        canvas.getSaveCount(); 
        canvas.restoreToCount(0);
        canvas.getSaveCount();
        canvas.restoreToCount(15);
        canvas.getSaveCount(); 
        console.info(msg + 'restoreToCount successed');
      } catch (e) {
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
        console.info(msg + `restoreToCount errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2001
     * @tc.name      : testCanvasRestoreToCountNull
     * @tc.desc      : testCanvasRestoreToCountNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasRestoreToCountNull', DEFAULT, () => {
      const msg = 'testCanvasRestoreToCountNull';
      try {
        const canvas = new drawing.Canvas(pixel);
        canvas.restoreToCount(undefined);
        console.info(msg + 'restoreToCount successed');
      } catch (e) {
        console.info(msg + `restoreToCount errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const canvas = new drawing.Canvas(pixel);
        canvas.restoreToCount(null);
        console.info(msg + 'restoreToCount successed');
      } catch (e) {
        console.info(msg + `restoreToCount errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2002
     * @tc.name      : testCanvasRestoreToCountMismatch
     * @tc.desc      : testCanvasRestoreToCountMismatch
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasRestoreToCountMismatch', DEFAULT, () => {
      const msg = 'testCanvasRestoreToCountMismatch';
      const canvas = new drawing.Canvas(pixel);
      try {
        canvas.restoreToCount(10,10);
        console.info(msg + 'restoreToCount successed');
      } catch (e) {
        console.info(msg + `restoreToCount errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.restoreToCount();
        console.info(msg + 'restoreToCount successed');
      } catch (e) {
        console.info(msg + `restoreToCount errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.restoreToCount('s');
        console.info(msg + 'restoreToCount successed');
      } catch (e) {
        console.info(msg + `restoreToCount errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2003
     * @tc.name      : testCanvasRestoreToCountMultipleCalls
     * @tc.desc      : testCanvasRestoreToCountMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasRestoreToCountMultipleCalls', DEFAULT, () => {
      const msg = 'testCanvasRestoreToCountMultipleCalls';
      try {
        const canvas = new drawing.Canvas(pixel);
        for (let index = 0; index < 20; index++) {
          canvas.restoreToCount(Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + 'restoreToCount successed');
      } catch (e) {
        console.info(msg + `restoreToCount errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2100
     * @tc.name      : testCanvasRestoreNormal
     * @tc.desc      : testCanvasRestoreNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasRestoreNormal', DEFAULT, () => {
      const msg = 'testCanvasRestoreNormal';
      try {
        const canvas = new drawing.Canvas(pixel);
        canvas.save();
        canvas.restore();
        canvas.getSaveCount();
        console.info(msg + 'restore successed');
      } catch (e) {
        console.info(msg + `restore errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2101
     * @tc.name      : testCanvasRestoreMismatch
     * @tc.desc      : testCanvasRestoreMismatch
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasRestoreMismatch', DEFAULT, () => {
      const msg = 'testCanvasRestoreMismatch';
      try {
        const canvas = new drawing.Canvas(pixel);
        canvas.restore('s');
        console.info(msg + 'restore successed');
      } catch (e) {
        console.info(msg + `restore errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2102
     * @tc.name      : testCanvasRestoreMultipleCalls
     * @tc.desc      : testCanvasRestoreMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasRestoreMultipleCalls', DEFAULT, () => {
      const msg = 'testCanvasRestoreMultipleCalls';
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
        console.info(msg + `restore errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2103
     * @tc.name      : testCanvasRestoreWhenNoSave
     * @tc.desc      : testCanvasRestoreWhenNoSave
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasRestoreWhenNoSave', DEFAULT, () => {
      const msg = 'testCanvasRestoreWhenNoSave';
      try {
        const canvas = new drawing.Canvas(pixel);
        canvas.restore();
        canvas.getSaveCount();
        console.info(msg + 'restore successed');
      } catch (e) {
        console.info(msg + `restore errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

  })
}