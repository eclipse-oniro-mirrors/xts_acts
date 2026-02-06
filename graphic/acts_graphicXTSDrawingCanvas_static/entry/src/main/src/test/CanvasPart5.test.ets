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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level} from "../../../hypium/index";
import image from '@ohos.multimedia.image';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function drawingTsCanvasPart5Test() {
  describe('DrawingTsCanvasPart5Test', () => {
    let pixel: image.PixelMap | undefined;
    const DEFAULT = 0;
    let pixelMap: image.PixelMap | undefined;

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
     * @tc.name   testCanvasDrawImageRectNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_3300
     * @tc.desc   testCanvasDrawImageRectNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawImageRectNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawImageRectNormalStatic';
      const canvas = new drawing.Canvas(pixel!);
      const maxVal = Number.MAX_VALUE;

      try {
        canvas.drawImageRect(pixelMap!, {
          left: 0, top: 0, right: 600, bottom: 600
        });
        canvas.drawImageRect(pixelMap!, {
          left: 100.1, top: 10.10, right: 900.1, bottom: 900.1
        }, new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST));
        canvas.drawImageRect(pixelMap!, {
          left: -200, top: -200, right: 1000, bottom: 1000
        }, new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR));
        canvas.drawImageRect(pixelMap!, {
          left: 200, top: 200, right: -1000, bottom: -1000
        }, new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR));
        canvas.drawImageRect(pixelMap!, {
          left: maxVal, top: maxVal, right: maxVal, bottom: maxVal
        });
        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasDrawImageRectMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_3301
     * @tc.desc   testCanvasDrawImageRectMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawImageRectMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawImageRectMultipleCallsStatic';
      const canvas = new drawing.Canvas(pixel!);
      try {
        for (let i = 0; i < 20; i += 1) {
          let itemList1: drawing.FilterMode[]= [drawing.FilterMode.FILTER_MODE_NEAREST, drawing.FilterMode.FILTER_MODE_LINEAR];
          const randomEnum1 = Math.round(Math.random()).toInt();
          canvas.drawImageRect(pixelMap!, {
            left: Math.random(), top: Math.random(), right: Math.random(), bottom: Math.random()
          }, new drawing.SamplingOptions(itemList1[randomEnum1]));
        }
        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawImageRectToNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_3302
     * @tc.desc   testCanvasDrawImageRectToNullStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawImageRectToNullStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawImageRectToNullStatic';
      const canvas = new drawing.Canvas(pixel!);
      try {
        canvas.drawImageRect(pixelMap!, {
          left: 0, top: 0, right: 600, bottom: 600
        }, undefined);
        console.info(msg + `drawImageRect test successes`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawImageRect test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasIsClipEmptyNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_3600
     * @tc.desc   testCanvasIsClipEmptyNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasIsClipEmptyNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasIsClipEmptyNormalStatic';
      const canvas = new drawing.Canvas(pixel!);
      try {
        let result = canvas.isClipEmpty();
        console.info(msg + " isClipEmpty 1 -----result:  "+ result);
        expect(result).assertEqual(false);
        const path = new drawing.Path();
        canvas.clipPath(path);
        let result2 = canvas.isClipEmpty();
        console.info(msg + " isClipEmpty 2 -----result2:  "+ result2);
        expect(result2).assertEqual(true);
        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasIsClipEmptyMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_3601
     * @tc.desc   testCanvasIsClipEmptyMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasIsClipEmptyMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasIsClipEmptyMultipleCallsStatic';
      const canvas = new drawing.Canvas(pixel!);
      try {
        for (let i = 0; i < 20; i += 1) {
          canvas.isClipEmpty();
        }
        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasClipRegionNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_3700
     * @tc.desc   testCanvasClipRegionNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasClipRegionNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasClipRegionNormalStatic';
      const canvas = new drawing.Canvas(pixel!);
      try {
        let region1 = new drawing.Region();
        canvas.clipRegion(region1);
        canvas.clipRegion(region1, drawing.ClipOp.DIFFERENCE);
        canvas.clipRegion(region1, drawing.ClipOp.INTERSECT);
        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasClipRegionMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_3701
     * @tc.desc   testCanvasClipRegionMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasClipRegionMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasClipRegionMultipleCallsStatic';
      const canvas = new drawing.Canvas(pixel!);
      try {
        for (let i = 0; i < 20; ++i) {
          let region1 = new drawing.Region();
          canvas.clipRegion(region1, drawing.ClipOp.DIFFERENCE);
        }
        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasClipRegionToNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_3702
     * @tc.desc   testCanvasClipRegionToNullStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasClipRegionToNullStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasClipRegionToNullStatic';
      const canvas = new drawing.Canvas(pixel!);
      let region1 = new drawing.Region();
      try {
        canvas.clipRegion(region1, undefined);
        console.info(msg + `clipRegion test successes`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `clipRegion test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }

    })
    /**
     * @tc.name   testCanvasClipRoundRectNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_3800
     * @tc.desc   testCanvasClipRoundRectNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasClipRoundRectNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasClipRoundRectNormalStatic';
      const canvas = new drawing.Canvas(pixel!);
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
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasClipRoundRectMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_3801
     * @tc.desc   testCanvasClipRoundRectMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasClipRoundRectMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasClipRoundRectMultipleCallsStatic';
      const canvas = new drawing.Canvas(pixel!);
      try {
        for (let i = 0; i < 20; i += 1) {
          let itemList: drawing.ClipOp[]= [drawing.ClipOp.DIFFERENCE, drawing.ClipOp.INTERSECT];
          const randomEnum = Math.round(Math.random()).toInt();
          let rectOne: common2D.Rect = {
            left: Math.random(), top: Math.random(), right: Math.random(), bottom: Math.random()
          };
          let roundRectOne = new drawing.RoundRect(rectOne, Math.random(), Math.random());
          canvas.clipRoundRect(roundRectOne, itemList[randomEnum], true);
        }
        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasResetMatrixNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_3900
     * @tc.desc   testCanvasResetMatrixNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasResetMatrixNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasResetMatrixNormalStatic';
      const canvas = new drawing.Canvas(pixel!);
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
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasResetMatrixMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_3901
     * @tc.desc   testCanvasResetMatrixMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasResetMatrixMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasResetMatrixMultipleCallsStatic';
      const canvas = new drawing.Canvas(pixel!);
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
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasDrawSingleCharacterNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_4000
     * @tc.desc   testCanvasDrawSingleCharacterNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawSingleCharacterNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawSingleCharacterNormalStatic';
      const canvas = new drawing.Canvas(pixel!);
      const font = new drawing.Font();
      try {
        canvas.drawSingleCharacter("你", font, 100, 100);
        canvas.drawSingleCharacter("A", font, 200.1, 100.1);
        canvas.drawSingleCharacter("\\", font, -200.1, 200.1);
        canvas.drawSingleCharacter("1", font, 200.1, -200.1);
        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasDrawSingleCharacterMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_4001
     * @tc.desc   testCanvasDrawSingleCharacterMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawSingleCharacterMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawSingleCharacterMultipleCallsStatic';
      const canvas = new drawing.Canvas(pixel!);
      const font = new drawing.Font();
      try {
        for (let i = 0; i < 20; i += 1) {
          canvas.drawSingleCharacter("你", font, Math.random(), Math.random());
        }
        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawSingleCharacterAbNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_4004
     * @tc.desc   testCanvasDrawSingleCharacterAbNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawSingleCharacterAbNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawSingleCharacterAbNormalStatic';
      const canvas = new drawing.Canvas(pixel!);
      const font = new drawing.Font();

      try {
        canvas.drawSingleCharacter("", font, 100, 100);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawSingleCharacter("abcdd", font, 100, 100);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })


    /**
     * @tc.name   testCanvasDrawImageRectWithSrcNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_4100
     * @tc.desc   testCanvasDrawImageRectWithSrcNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawImageRectWithSrcNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawImageRectWithSrcNormalStatic';
      const canvas = new drawing.Canvas(pixel!);
      const maxVal = Number.MAX_VALUE;
      try {
        canvas.drawImageRectWithSrc(pixelMap!, {
          left: 0, top: 0, right: 600, bottom: 600
        }, {
          left: 0, top: 0, right: 600, bottom: 600
        });
        canvas.drawImageRectWithSrc(pixelMap!, {
          left: 100.1, top: 100.2, right: 700.1, bottom: 700.2
        }, {
          left: 200.1, top: 200.2, right: 800.1, bottom: 800.1
        }, new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST));
        let itemList1: drawing.FilterMode[]= [drawing.FilterMode.FILTER_MODE_NEAREST, drawing.FilterMode.FILTER_MODE_LINEAR];
        let itemList2: drawing.SrcRectConstraint[]= [drawing.SrcRectConstraint.STRICT, drawing.SrcRectConstraint.FAST];
        for (let i = 0; i < itemList1.length; i += 1) {
          for (let j = 0; j < itemList2.length; j += 1) {
            canvas.drawImageRectWithSrc(pixelMap!, {
              left: 100, top: 100.2, right: 700, bottom: 700.2
            }, {
              left: 200.1, top: 200.2, right: 800.1, bottom: 800.1
            }, new drawing.SamplingOptions(itemList1[i]), itemList2[j]);
            //枚举值samplingOptions和constraint交叉遍历验证
          }
        }
        canvas.drawImageRectWithSrc(pixelMap!, {
          left: 0, top: 0, right: -600, bottom: -600
        }, {
          left: -100, top: -100, right: 600, bottom: 600
        });
        canvas.drawImageRectWithSrc(pixelMap!, {
          left: 100, top: 100, right: 100, bottom: 600
        }, {
          left: -100, top: -100, right: -100, bottom: 700
        });
        canvas.drawImageRectWithSrc(pixelMap!, {
          left: 100, top: 100, right: 100, bottom: 100
        }, {
          left: 700, top: 700, right: 700, bottom: 700
        });
        canvas.drawImageRectWithSrc(pixelMap!, {
          left: maxVal, top: maxVal, right: maxVal, bottom: maxVal
        }, {
          left: maxVal, top: maxVal, right: maxVal, bottom: maxVal
        });

        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasDrawImageRectWithSrcMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_4101
     * @tc.desc   testCanvasDrawImageRectWithSrcMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawImageRectWithSrcMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawImageRectWithSrcMultipleCallsStatic';
      const canvas = new drawing.Canvas(pixel!);
      try {
        for (let i = 0; i < 20; i += 1) {
          let itemList1: drawing.FilterMode[]= [drawing.FilterMode.FILTER_MODE_NEAREST, drawing.FilterMode.FILTER_MODE_LINEAR];
          const randomEnum1 = Math.round(Math.random()).toInt();
          let itemList2: drawing.SrcRectConstraint[]= [drawing.SrcRectConstraint.STRICT, drawing.SrcRectConstraint.FAST];
          const randomEnum2 = Math.round(Math.random()).toInt();
          canvas.drawImageRectWithSrc(pixelMap!, {
            left: Math.random(), top: Math.random(), right: Math.random(), bottom: Math.random()
          }, {
            left: Math.random(), top: Math.random(), right: Math.random(), bottom: Math.random()
          }, new drawing.SamplingOptions(itemList1[randomEnum1]), itemList2[randomEnum2]);
        }
        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawImageRectWithSrcToNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_4102
     * @tc.desc   testCanvasDrawImageRectWithSrcToNullStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawImageRectWithSrcToNullStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawImageRectWithSrcToNullStatic';
      const canvas = new drawing.Canvas(pixel!);
      try {
        canvas.drawImageRectWithSrc(pixelMap!, {
          left: 100, top: 100.2, right: 700, bottom: 700.2
        }, {
          left: 200.1, top: 200.2, right: 800.1, bottom: 800.1
        }, undefined, drawing.SrcRectConstraint.STRICT);
        console.info(msg + `drawImageRectWithSrc test successes`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawImageRectWithSrc test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }
      try {
        canvas.drawImageRectWithSrc(pixelMap!, {
          left: 100, top: 100.2, right: 700, bottom: 700.2
        }, {
          left: 200.1, top: 200.2, right: 800.1, bottom: 800.1
        }, new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST), undefined);
        console.info(msg + `drawImageRectWithSrc test successes`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawImageRectWithSrc test error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }

    })
    /**
     * @tc.name   testCanvasDrawRoundRectNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_4200
     * @tc.desc   testCanvasDrawRoundRectNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawRoundRectNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawRoundRectNormalStatic';
      const canvas = new drawing.Canvas(pixel!);

      try {
        let rectOne: common2D.Rect = {
          left: 10, top: 100, right: 200, bottom: 300
        };
        let roundRect = new drawing.RoundRect(rectOne, 10, 10);
        canvas.drawRoundRect(roundRect);
        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasDrawRoundRectMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_4201
     * @tc.desc   testCanvasDrawRoundRectMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRoundRectMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawRoundRectMultipleCallsStatic';
      const canvas = new drawing.Canvas(pixel!);

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
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasGetLocalClipBoundsNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_4300
     * @tc.desc   testCanvasGetLocalClipBoundsNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasGetLocalClipBoundsNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasGetLocalClipBoundsNormalStatic';
      const canvas = new drawing.Canvas(pixel!);

      try {
        let rect: common2D.Rect | undefined = canvas.getLocalClipBounds();
        if(rect){
          expect(rect.left).assertEqual(-1)
          expect(rect.right).assertEqual(101)
          expect(rect.top).assertEqual(-1)
          expect(rect.bottom).assertEqual(101)
        }
        if(rect == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
        canvas.clipRect({
          left: 10, right: 50, top: 30, bottom: 90
        }, drawing.ClipOp.DIFFERENCE, true);
        rect = canvas.getLocalClipBounds();
        if(rect){
          expect(rect.left).assertEqual(-1)
          expect(rect.right).assertEqual(101)
          expect(rect.top).assertEqual(-1)
          expect(rect.bottom).assertEqual(101)
        }
        if(rect == undefined){
          console.info(msg + ' 2 test failed');
          expect().assertFail();
        }
        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasGetLocalClipBoundsMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_4301
     * @tc.desc   testCanvasGetLocalClipBoundsMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasGetLocalClipBoundsMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasGetLocalClipBoundsMultipleCallsStatic';
      const canvas = new drawing.Canvas(pixel!);

      try {
        for (let i = 0; i < 20; i += 1) {
          let rect: common2D.Rect | undefined= canvas.getLocalClipBounds();
          if( rect ){
            expect(rect.left).assertEqual(-1)
            expect(rect.right).assertEqual(101)
            expect(rect.top).assertEqual(-1)
            expect(rect.bottom).assertEqual(101)
          }
        }
        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasGetTotalMatrixNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_4400
     * @tc.desc   testCanvasGetTotalMatrixNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasGetTotalMatrixNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasGetTotalMatrixNormalStatic';
      const canvas = new drawing.Canvas(pixel!);

      try {
        let matrix1 = new drawing.Matrix();
        canvas.setMatrix(matrix1)
        let matrixResult1 = canvas.getTotalMatrix();
        if( matrixResult1 ){
          expect(matrixResult1.getAll()).assertDeepEquals(matrix1.getAll());
        }
        if( matrixResult1 == undefined ){
          console.info(msg + ' matrixResult1 test failed');
          expect().assertFail();
        }
        let matrix2 = new drawing.Matrix();
        matrix2.setMatrix([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        canvas.setMatrix(matrix2);
        let matrixResult2 = canvas.getTotalMatrix();
        if( matrixResult2 ){
          expect(matrixResult2.getAll()).assertDeepEquals(matrix2.getAll());
        }
        if( matrixResult2 == undefined ){
          console.info(msg + ' matrixResult2 test failed');
          expect().assertFail();
        }
        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testCanvasGetTotalMatrixMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_4401
     * @tc.desc   testCanvasGetTotalMatrixMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasGetTotalMatrixMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasGetTotalMatrixMultipleCallsStatic';
      const canvas = new drawing.Canvas(pixel!);

      try {
        for (let i = 0; i < 20; i += 1) {
          let matrix = new drawing.Matrix();
          canvas.setMatrix(matrix)
          let matrixResult = canvas.getTotalMatrix();
          if( matrixResult ){
            expect(matrixResult.getAll()).assertDeepEquals(matrix.getAll());
          }
        }
        console.info(msg + 'test successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCanvasDrawShadowNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_4505
     * @tc.desc   testCanvasDrawShadowNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawShadowNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawShadowNormalStatic';
      const canvas = new drawing.Canvas(pixel!);
      const path = new drawing.Path();
      try {
        canvas.drawShadow(path, {
          x: -100, y: -80, z: 80
        }, {
          x: 200, y: 10, z: -40
        }, 100, {
          alpha: 0xFF, red: 0, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, drawing.ShadowFlag.ALL);
        console.info(msg + 'test ALL successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test ALL errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawShadow(path, {
          x: 100.1, y: 80.1, z: 80.1
        }, {
          x: 200.1, y: 10.1, z: 40.1
        }, 30.1, {
          alpha: 0x00, red: 0, green: 0, blue: 0x00
        }, {
          alpha: 0xFF, red: 0xFF, green: 0xFF, blue: 0xFF
        }, drawing.ShadowFlag.NONE);
        console.info(msg + 'test NONE successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test NONE errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, -1, {
          alpha: 0xFF, red: 0, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, drawing.ShadowFlag.TRANSPARENT_OCCLUDER);
        console.info(msg + 'test TRANSPARENT_OCCLUDER successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test TRANSPARENT_OCCLUDER errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawShadow(path, {
          x: 100, y: 80, z: 80
        }, {
          x: 200, y: 10, z: 40
        }, 0, {
          alpha: 0xFF, red: 0, green: 0, blue: 0xFF
        }, {
          alpha: 0xFF, red: 0xFF, green: 0, blue: 0
        }, drawing.ShadowFlag.GEOMETRIC_ONLY);
        console.info(msg + 'test GEOMETRIC_ONLY successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test GEOMETRIC_ONLY errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
  })
}