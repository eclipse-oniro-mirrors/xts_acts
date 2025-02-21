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
import { getEnumCount } from './utils';

export default function drawingTsCanvasPart5Test() {
  describe('DrawingTsCanvas5Test', () => {
    let pixel: image.PixelMap;
    const DEFAULT = 0;
    let pixelMap: image.PixelMap;

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      const color: ArrayBuffer = new ArrayBuffer(40000); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 100, width: 100
        }
      }
      pixel = await image.createPixelMap(color, opts);
      pixelMap = await image.createPixelMap(color, opts);
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3300
     * @tc.name      : testCanvasDrawImageRectNormal
     * @tc.desc      : testCanvasDrawImageRectNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawImageRectNormal', DEFAULT, () => {
      const msg = 'testCanvasDrawImageRectNormal';
      const canvas = new drawing.Canvas(pixel);
      const maxVal = Number.MAX_VALUE;

      try {
        canvas.drawImageRect(pixelMap, {
          left: 0, top: 0, right: 600, bottom: 600
        });
        canvas.drawImageRect(pixelMap, {
          left: 100.1, top: 10.10, right: 900.1, bottom: 900.1
        }, new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST));
        canvas.drawImageRect(pixelMap, {
          left: -200, top: -200, right: 1000, bottom: 1000
        }, new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR));
        canvas.drawImageRect(pixelMap, {
          left: 200, top: 200, right: -1000, bottom: -1000
        }, new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR));
        canvas.drawImageRect(pixelMap, {
          left: maxVal, top: maxVal, right: maxVal, bottom: maxVal
        });
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3301
     * @tc.name      : testCanvasDrawImageRectMultipleCalls
     * @tc.desc      : testCanvasDrawImageRectMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawImageRectMultipleCalls', 3, () => {
      const msg = 'testCanvasDrawImageRectMultipleCalls';
      const canvas = new drawing.Canvas(pixel);
      try {
        for (let i = 0; i < 20; i += 1) {
          const randomEnum = Math.floor(getEnumCount(drawing.FilterMode) * Math.random())
          canvas.drawImageRect(pixelMap, {
            left: Math.random(), top: Math.random(), right: Math.random(), bottom: Math.random()
          }, new drawing.SamplingOptions(randomEnum));
        }
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3302
     * @tc.name      : testCanvasDrawImageRectToNull
     * @tc.desc      : testCanvasDrawImageRectToNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawImageRectToNull', 3, () => {
      const msg = 'testCanvasDrawImageRectToNull';
      const canvas = new drawing.Canvas(pixel);

      try {
        canvas.drawImageRect(null, {
          left: 0, top: 0, right: 600, bottom: 600
        });
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawImageRect(pixelMap, null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawImageRect(pixelMap, {
          left: 0, top: 0, right: 600, bottom: 600
        }, null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawImageRect(undefined, {
          left: 0, top: 0, right: 600, bottom: 600
        });
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawImageRect(pixelMap, undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawImageRect(pixelMap, {
          left: 0, top: 0, right: 600, bottom: 600
        }, undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3304
     * @tc.name      : testCanvasDrawImageRectAbnormal
     * @tc.desc      : testCanvasDrawImageRectAbnormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawImageRectAbnormal', 3, () => {
      const msg = 'testCanvasDrawImageRectAbnormal';
      const canvas = new drawing.Canvas(pixel);

      try {
        canvas.drawImageRect(pixelMap, {
          left: 0, top: 0, right: 600, bottom: 600
        }, 10);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3600
     * @tc.name      : testCanvasIsClipEmptyNormal
     * @tc.desc      : testCanvasIsClipEmptyNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasIsClipEmptyNormal', DEFAULT, () => {
      const msg = 'testCanvasIsClipEmptyNormal';
      const canvas = new drawing.Canvas(pixel);
      try {
        canvas.isClipEmpty();
        const path = new drawing.Path();
        canvas.clipPath(path);
        canvas.isClipEmpty();
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3601
     * @tc.name      : testCanvasIsClipEmptyMultipleCalls
     * @tc.desc      : testCanvasIsClipEmptyMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasIsClipEmptyMultipleCalls', 3, () => {
      const msg = 'testCanvasIsClipEmptyMultipleCalls';
      const canvas = new drawing.Canvas(pixel);
      try {
        for (let i = 0; i < 20; i += 1) {
          canvas.isClipEmpty();
        }
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3700
     * @tc.name      : testCanvasClipRegionNormal
     * @tc.desc      : testCanvasClipRegionNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasClipRegionNormal', 3, () => {
      const msg = 'testCanvasClipRegionNormal';
      const canvas = new drawing.Canvas(pixel);
      try {
        let region1 = new drawing.Region();
        canvas.clipRegion(region1);
        canvas.clipRegion(region1, drawing.ClipOp.DIFFERENCE);
        canvas.clipRegion(region1, drawing.ClipOp.INTERSECT);
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3701
     * @tc.name      : testCanvasClipRegionMultipleCalls
     * @tc.desc      : testCanvasClipRegionMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasClipRegionMultipleCalls', 3, () => {
      const msg = 'testCanvasClipRegionMultipleCalls';
      const canvas = new drawing.Canvas(pixel);
      try {
        for (let i = 0; i < 20; ++i) {
          let region1 = new drawing.Region();
          canvas.clipRegion(region1, drawing.ClipOp.DIFFERENCE);
        }
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3702
     * @tc.name      : testCanvasClipRegionToNull
     * @tc.desc      : testCanvasClipRegionToNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasClipRegionToNull', 3, () => {
      const msg = 'testCanvasClipRegionToNull';
      const canvas = new drawing.Canvas(pixel);
      let region1 = new drawing.Region();

      try {
        canvas.clipRegion(null, drawing.ClipOp.DIFFERENCE);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.clipRegion(region1, null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.clipRegion(undefined, drawing.ClipOp.DIFFERENCE);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.clipRegion(region1, undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3704
     * @tc.name      : testCanvasClipRegionAbnormal
     * @tc.desc      : testCanvasClipRegionAbnormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasClipRegionAbnormal', 3, () => {
      const msg = 'testCanvasClipRegionAbnormal';
      const canvas = new drawing.Canvas(pixel);
      let region1 = new drawing.Region();

      try {
        canvas.clipRegion(region1, 10);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3800
     * @tc.name      : testCanvasClipRoundRectNormal
     * @tc.desc      : testCanvasClipRoundRectNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasClipRoundRectNormal', DEFAULT, () => {
      const msg = 'testCanvasClipRoundRectNormal';
      const canvas = new drawing.Canvas(pixel);
      try {
        let rectOne: common2D.Rect = {
          left: 10, top: 100, right: 200, bottom: 300
        };
        let roundRectOne = new drawing.RoundRect(rectOne, 10, 10);
        canvas.clipRoundRect(roundRectOne);
        canvas.clipRoundRect(roundRectOne, drawing.ClipOp.DIFFERENCE);
        canvas.clipRoundRect(roundRectOne, drawing.ClipOp.INTERSECT);
        canvas.clipRoundRect(roundRectOne, drawing.ClipOp.DIFFERENCE, true);
        canvas.clipRoundRect(roundRectOne, drawing.ClipOp.DIFFERENCE, false);
        canvas.clipRoundRect(roundRectOne, drawing.ClipOp.INTERSECT, true);
        canvas.clipRoundRect(roundRectOne, drawing.ClipOp.INTERSECT, false);
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3801
     * @tc.name      : testCanvasClipRoundRectMultipleCalls
     * @tc.desc      : testCanvasClipRoundRectMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasClipRoundRectMultipleCalls', 3, () => {
      const msg = 'testCanvasClipRoundRectMultipleCalls';
      const canvas = new drawing.Canvas(pixel);
      try {
        for (let i = 0; i < 20; i += 1) {
          const randomEnum = Math.floor(Math.random() * getEnumCount(drawing.ClipOp))
          let rectOne: common2D.Rect = {
            left: Math.random(), top: Math.random(), right: Math.random(), bottom: Math.random()
          };
          let roundRectOne = new drawing.RoundRect(rectOne, Math.random(), Math.random());
          canvas.clipRoundRect(roundRectOne, randomEnum, true);
        }
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3802
     * @tc.name      : testCanvasClipRoundRectToNull
     * @tc.desc      : testCanvasClipRoundRectToNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasClipRoundRectToNull', 3, () => {
      const msg = 'testCanvasClipRoundRectToNull';
      const canvas = new drawing.Canvas(pixel);
      let rectOne: common2D.Rect = {
        left: 10, top: 100, right: 200, bottom: 300
      };
      let roundRectOne = new drawing.RoundRect(rectOne, 10, 10);


      try {
        canvas.clipRoundRect(null, drawing.ClipOp.DIFFERENCE, false);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.clipRoundRect(roundRectOne, null, false);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.clipRoundRect(roundRectOne, drawing.ClipOp.DIFFERENCE, null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.clipRoundRect(null, drawing.ClipOp.DIFFERENCE, false);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.clipRoundRect(roundRectOne, null, false);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.clipRoundRect(roundRectOne, drawing.ClipOp.DIFFERENCE, null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3804
     * @tc.name      : testCanvasClipRoundRectAbnormal
     * @tc.desc      : testCanvasClipRoundRectAbnormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasClipRoundRectAbnormal', 3, () => {
      const msg = 'testCanvasClipRoundRectAbnormal';
      const canvas = new drawing.Canvas(pixel);
      let rectOne: common2D.Rect = {
        left: 10, top: 100, right: 200, bottom: 300
      };
      let roundRectOne = new drawing.RoundRect(rectOne, 10, 10);

      try {
        canvas.clipRoundRect(roundRectOne, 10, true);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3900
     * @tc.name      : testCanvasResetMatrixNormal
     * @tc.desc      : testCanvasResetMatrixNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasResetMatrixNormal', DEFAULT, () => {
      const msg = 'testCanvasResetMatrixNormal';
      const canvas = new drawing.Canvas(pixel);
      try {
        let matrix = new drawing.Matrix();
        matrix.preRotate(-30, 10, 20)
        canvas.setMatrix(matrix)
        canvas.drawRect(100, 100, 200, 300)
        canvas.resetMatrix();
        canvas.drawRect(200, 200, 300, 400)
        canvas.resetMatrix();

        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3901
     * @tc.name      : testCanvasResetMatrixMultipleCalls
     * @tc.desc      : testCanvasResetMatrixMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasResetMatrixMultipleCalls', 3, () => {
      const msg = 'testCanvasResetMatrixMultipleCalls';
      const canvas = new drawing.Canvas(pixel);
      try {
        for (let i = 0; i < 20; i += 1) {
          let matrix = new drawing.Matrix();
          canvas.setMatrix(matrix);
          canvas.resetMatrix();
        }

        for (let i = 0; i < 20; i += 1) {
          let matrix = new drawing.Matrix();
          canvas.setMatrix(matrix);
        }
        for (let i = 0; i < 20; i += 1) {
          canvas.resetMatrix();
        }

        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4000
     * @tc.name      : testCanvasDrawSingleCharacterNormal
     * @tc.desc      : testCanvasDrawSingleCharacterNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasDrawSingleCharacterNormal', DEFAULT, () => {
      const msg = 'testCanvasDrawSingleCharacterNormal';
      const canvas = new drawing.Canvas(pixel);
      const font = new drawing.Font();
      try {
        canvas.drawSingleCharacter("你", font, 100, 100);
        canvas.drawSingleCharacter("A", font, 200.1, 100.1);
        canvas.drawSingleCharacter("\\", font, -200.1, 200.1);
        canvas.drawSingleCharacter("1", font, 200.1, -200.1);
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4001
     * @tc.name      : testCanvasDrawSingleCharacterMultipleCalls
     * @tc.desc      : testCanvasDrawSingleCharacterMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawSingleCharacterMultipleCalls', 3, () => {
      const msg = 'testCanvasDrawSingleCharacterMultipleCalls';
      const canvas = new drawing.Canvas(pixel);
      const font = new drawing.Font();
      const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
      
      try {
        for (let i = 0; i < 20; i += 1) {
          const randomString = characters.charAt(Math.floor(Math.random()*characters.length));
          canvas.drawSingleCharacter(randomString, font, Math.random(), Math.random());
        }
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4002
     * @tc.name      : testCanvasDrawSingleCharacterToNull
     * @tc.desc      : testCanvasDrawSingleCharacterToNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawSingleCharacterToNull', 3, () => {
      const msg = 'testCanvasDrawSingleCharacterToNull';
      const canvas = new drawing.Canvas(pixel);
      const font = new drawing.Font();

      try {
        canvas.drawSingleCharacter(null, font, 100, 100);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawSingleCharacter("你", null, 100, 100);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawSingleCharacter("你", font, null, 100);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawSingleCharacter("你", font, 100, null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawSingleCharacter(undefined, font, 100, 100);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawSingleCharacter("你", undefined, 100, 100);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawSingleCharacter("你", font, undefined, 100);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawSingleCharacter("你", font, 100, undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4004
     * @tc.name      : testCanvasDrawSingleCharacterAbnormal
     * @tc.desc      : testCanvasDrawSingleCharacterAbnormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawSingleCharacterAbnormal', 3, () => {
      const msg = 'testCanvasDrawSingleCharacterAbnormal';
      const canvas = new drawing.Canvas(pixel);
      const font = new drawing.Font();

      try {
        canvas.drawSingleCharacter("", font, 100, 100);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawSingleCharacter("abcdd", font, 100, 100);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4100
     * @tc.name      : testCanvasDrawImageRectWithSrcNormal
     * @tc.desc      : testCanvasDrawImageRectWithSrcNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasDrawImageRectWithSrcNormal', DEFAULT, () => {
      const msg = 'testCanvasDrawImageRectWithSrcNormal';
      const canvas = new drawing.Canvas(pixel);
      const maxVal = Number.MAX_VALUE;
      try {
        canvas.drawImageRectWithSrc(pixelMap, {
          left: 0, top: 0, right: 600, bottom: 600
        }, {
          left: 0, top: 0, right: 600, bottom: 600
        });
        canvas.drawImageRectWithSrc(pixelMap, {
          left: 100.1, top: 100.2, right: 700.1, bottom: 700.2
        }, {
          left: 200.1, top: 200.2, right: 800.1, bottom: 800.1
        }, new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST));

        for (let i = 0; i < getEnumCount(drawing.FilterMode); i += 1) {
          for (let j = 0; j < getEnumCount(drawing.SrcRectConstraint); j += 1) {
            canvas.drawImageRectWithSrc(pixelMap, {
              left: 100, top: 100.2, right: 700, bottom: 700.2
            }, {
              left: 200.1, top: 200.2, right: 800.1, bottom: 800.1
            }, new drawing.SamplingOptions(i), j);
            //枚举值samplingOptions和constraint交叉遍历验证
          }
        }
        canvas.drawImageRectWithSrc(pixelMap, {
          left: 0, top: 0, right: -600, bottom: -600
        }, {
          left: -100, top: -100, right: 600, bottom: 600
        });
        canvas.drawImageRectWithSrc(pixelMap, {
          left: 100, top: 100, right: 100, bottom: 600
        }, {
          left: -100, top: -100, right: -100, bottom: 700
        });
        canvas.drawImageRectWithSrc(pixelMap, {
          left: 100, top: 100, right: 100, bottom: 100
        }, {
          left: 700, top: 700, right: 700, bottom: 700
        });
        canvas.drawImageRectWithSrc(pixelMap, {
          left: maxVal, top: maxVal, right: maxVal, bottom: maxVal
        }, {
          left: maxVal, top: maxVal, right: maxVal, bottom: maxVal
        });

        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4101
     * @tc.name      : testCanvasDrawImageRectWithSrcMultipleCalls
     * @tc.desc      : testCanvasDrawImageRectWithSrcMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawImageRectWithSrcMultipleCalls', 3, () => {
      const msg = 'testCanvasDrawImageRectWithSrcMultipleCalls';
      const canvas = new drawing.Canvas(pixel);
      try {
        for (let i = 0; i < 20; i += 1) {
          const e1 = Math.floor(Math.random() * getEnumCount(drawing.SamplingOptions))
          const e2 = Math.floor(Math.random() * getEnumCount(drawing.SrcRectConstraint))
          canvas.drawImageRectWithSrc(pixelMap, {
            left: Math.random(), top: Math.random(), right: Math.random(), bottom: Math.random()
          }, {
            left: Math.random(), top: Math.random(), right: Math.random(), bottom: Math.random()
          }, new drawing.SamplingOptions(e1), e2);
        }
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4102
     * @tc.name      : testCanvasDrawImageRectWithSrcToNull
     * @tc.desc      : testCanvasDrawImageRectWithSrcToNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawImageRectWithSrcToNull', 3, () => {
      const msg = 'testCanvasDrawImageRectWithSrcToNull';
      const canvas = new drawing.Canvas(pixel);

      try {
        canvas.drawImageRectWithSrc(null, {
          left: 100, top: 100.2, right: 700, bottom: 700.2
        }, {
          left: 200.1, top: 200.2, right: 800.1, bottom: 800.1
        }, new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST), drawing.SrcRectConstraint.STRICT);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawImageRectWithSrc(pixelMap, null, {
          left: 200.1, top: 200.2, right: 800.1, bottom: 800.1
        }, new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST), drawing.SrcRectConstraint.STRICT);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawImageRectWithSrc(pixelMap, {
          left: 100, top: 100.2, right: 700, bottom: 700.2
        }, null, new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST), drawing.SrcRectConstraint.STRICT);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawImageRectWithSrc(pixelMap, {
          left: 100, top: 100.2, right: 700, bottom: 700.2
        }, {
          left: 200.1, top: 200.2, right: 800.1, bottom: 800.1
        }, null, drawing.SrcRectConstraint.STRICT);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawImageRectWithSrc(pixelMap, {
          left: 100, top: 100.2, right: 700, bottom: 700.2
        }, {
          left: 200.1, top: 200.2, right: 800.1, bottom: 800.1
        }, new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST), null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawImageRectWithSrc(undefined, {
          left: 100, top: 100.2, right: 700, bottom: 700.2
        }, {
          left: 200.1, top: 200.2, right: 800.1, bottom: 800.1
        }, new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST), drawing.SrcRectConstraint.STRICT);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawImageRectWithSrc(pixelMap, undefined, {
          left: 200.1, top: 200.2, right: 800.1, bottom: 800.1
        }, new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST), drawing.SrcRectConstraint.STRICT);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawImageRectWithSrc(pixelMap, {
          left: 100, top: 100.2, right: 700, bottom: 700.2
        }, undefined, new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST), drawing.SrcRectConstraint.STRICT);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawImageRectWithSrc(pixelMap, {
          left: 100, top: 100.2, right: 700, bottom: 700.2
        }, {
          left: 200.1, top: 200.2, right: 800.1, bottom: 800.1
        }, undefined, drawing.SrcRectConstraint.STRICT);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawImageRectWithSrc(pixelMap, {
          left: 100, top: 100.2, right: 700, bottom: 700.2
        }, {
          left: 200.1, top: 200.2, right: 800.1, bottom: 800.1
        }, new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST), undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4104
     * @tc.name      : testCanvasDrawImageRectWithSrcAbnormal
     * @tc.desc      : testCanvasDrawImageRectWithSrcAbnormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawImageRectWithSrcAbnormal', 3, () => {
      const msg = 'testCanvasDrawImageRectWithSrcAbnormal';
      const canvas = new drawing.Canvas(pixel);

      try {
        canvas.drawImageRectWithSrc(pixelMap, {
          left: 100, top: 100.2, right: 700, bottom: 700.2
        }, {
          left: 200.1, top: 200.2, right: 800.1, bottom: 800.1
        }, new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST), 10);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4200
     * @tc.name      : testCanvasDrawRoundRectNormal
     * @tc.desc      : testCanvasDrawRoundRectNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasDrawRoundRectNormal', DEFAULT, () => {
      const msg = 'testCanvasDrawRoundRectNormal';
      const canvas = new drawing.Canvas(pixel);

      try {
        let rectOne: common2D.Rect = {
          left: 10, top: 100, right: 200, bottom: 300
        };
        let roundRect = new drawing.RoundRect(rectOne, 10, 10);
        canvas.drawRoundRect(roundRect);
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4201
     * @tc.name      : testCanvasDrawRoundRectMultipleCalls
     * @tc.desc      : testCanvasDrawRoundRectMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawRoundRectMultipleCalls', 3, () => {
      const msg = 'testCanvasDrawRoundRectMultipleCalls';
      const canvas = new drawing.Canvas(pixel);

      try {
        for (let i = 0; i < 20; i += 1) {
          let rectOne: common2D.Rect = {
            left: 10 * Math.random(), top: 100 * Math.random(), right: 200 * Math.random(), bottom: 300 * Math.random()
          };
          let roundRect = new drawing.RoundRect(rectOne, 10, 10);
          canvas.drawRoundRect(roundRect);
        }
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4202
     * @tc.name      : testCanvasDrawRoundRectToNull
     * @tc.desc      : testCanvasDrawRoundRectToNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawRoundRectToNull', 3, () => {
      const msg = 'testCanvasDrawRoundRectToNull';
      const canvas = new drawing.Canvas(pixel);

      try {
        canvas.drawRoundRect(null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawRoundRect(undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4300
     * @tc.name      : testCanvasGetLocalClipBoundsNormal
     * @tc.desc      : testCanvasGetLocalClipBoundsNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasGetLocalClipBoundsNormal', DEFAULT, () => {
      const msg = 'testCanvasGetLocalClipBoundsNormal';
      const canvas = new drawing.Canvas(pixel);

      try {
        let rect: common2D.Rect = canvas.getLocalClipBounds();
        expect(rect.left).assertEqual(-1)
        expect(rect.right).assertEqual(101)
        expect(rect.top).assertEqual(-1)
        expect(rect.bottom).assertEqual(101)

        canvas.clipRect({
          left: 10, right: 50, top: 30, bottom: 90
        }, drawing.ClipOp.DIFFERENCE, true);
        rect = canvas.getLocalClipBounds();

        expect(rect.left).assertEqual(-1)
        expect(rect.right).assertEqual(101)
        expect(rect.top).assertEqual(-1)
        expect(rect.bottom).assertEqual(101)
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4301
     * @tc.name      : testCanvasGetLocalClipBoundsMultipleCalls
     * @tc.desc      : testCanvasGetLocalClipBoundsMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasGetLocalClipBoundsMultipleCalls', 3, () => {
      const msg = 'testCanvasGetLocalClipBoundsMultipleCalls';
      const canvas = new drawing.Canvas(pixel);

      try {
        for (let i = 0; i < 20; i += 1) {
          let rect: common2D.Rect = canvas.getLocalClipBounds();
          expect(rect.left).assertEqual(-1)
          expect(rect.right).assertEqual(101)
          expect(rect.top).assertEqual(-1)
          expect(rect.bottom).assertEqual(101)
        }
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4400
     * @tc.name      : testCanvasGetTotalMatrixNormal
     * @tc.desc      : testCanvasGetTotalMatrixNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasGetTotalMatrixNormal', DEFAULT, () => {
      const msg = 'testCanvasGetTotalMatrixNormal';
      const canvas = new drawing.Canvas(pixel);

      try {
        let matrix1 = new drawing.Matrix();
        canvas.setMatrix(matrix1)
        let matrixResult1 = canvas.getTotalMatrix();
        expect(matrixResult1).assertDeepEquals(matrix1);

        let matrix2 = new drawing.Matrix();
        matrix2.setMatrix([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        canvas.setMatrix(matrix2);
        let matrixResult2 = canvas.getTotalMatrix();
        expect(matrixResult2).assertDeepEquals(matrix2);

        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4401
     * @tc.name      : testCanvasGetTotalMatrixMultipleCalls
     * @tc.desc      : testCanvasGetTotalMatrixMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasGetTotalMatrixMultipleCalls', 3, () => {
      const msg = 'testCanvasGetTotalMatrixMultipleCalls';
      const canvas = new drawing.Canvas(pixel);

      try {
        for (let i = 0; i < 20; i += 1) {
          let matrix = new drawing.Matrix();
          canvas.setMatrix(matrix)
          let matrixResult = canvas.getTotalMatrix();
          expect(matrixResult).assertDeepEquals(matrix);
        }
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


  })
}