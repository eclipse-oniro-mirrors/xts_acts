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

export default function drawingTsCanvasPart4Test() {
  describe('DrawingTsCanvasPart4Test', () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2500
     * @tc.name      : testCanvasSaveLayerNormal
     * @tc.desc      : testCanvasSaveLayerNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasSaveLayerNormal', DEFAULT, () => {
      const msg = 'testCanvasSaveLayerNormal';
      try {
        const canvas = new drawing.Canvas(pixel);
        const rect: common2D.Rect = {
          left: 0, right: 100, top: 0, bottom: 100
        };
        const brush = new drawing.Brush();

        canvas.saveLayer(rect, brush)
        canvas.saveLayer(null, brush)
        canvas.saveLayer(rect, null)

        console.info(msg + 'test successed');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2501
     * @tc.name      : testCanvasSaveLayerUndefined
     * @tc.desc      : testCanvasSaveLayerUndefined
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasSaveLayerUndefined', 3, () => {
      const msg = 'testCanvasSaveLayerUndefined';
      const canvas = new drawing.Canvas(pixel);
      const brush = new drawing.Brush();
      const rect: common2D.Rect = {
        left: 0, right: 100, top: 0, bottom: 100
      };

      try {
        canvas.saveLayer(undefined, brush)
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.saveLayer(rect, undefined)
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2600
     * @tc.name      : testCanvasClearNormal
     * @tc.desc      : testCanvasClearNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasClearNormal', DEFAULT, () => {
      const msg = 'testCanvasClearNormal';
      try {
        const canvas = new drawing.Canvas(pixel);
        canvas.clear({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        canvas.clear({
          alpha: 255.1, red: 255.1, green: 255.1, blue: 255.1
        });
        canvas.clear({
          alpha: 0.1, red: 0.1, green: 0.1, blue: 0.1
        });

        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2601
     * @tc.name      : testCanvasClearMultipleCalls
     * @tc.desc      : testCanvasClearMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasClearMultipleCalls', 3, () => {
      const msg = 'testCanvasClearMultipleCalls';
      try {
        const canvas = new drawing.Canvas(pixel);
        for (let i = 0; i < 20; i += 1) {
          canvas.clear({
            alpha: Math.random() * 256, red: Math.random() * 256,
            green: Math.random() * 256, blue: Math.random() * 256
          })
        }
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2602
     * @tc.name      : testCanvasClearToNull
     * @tc.desc      : testCanvasClearToNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasClearToNull', 3, () => {
      const msg = 'testCanvasClearToNull';
      const canvas = new drawing.Canvas(pixel);


      try {
        canvas.clear(null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.clear(undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2604
     * @tc.name      : testCanvasClearAbnormal
     * @tc.desc      : testCanvasClearAbnormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasClearAbnormal', 3, () => {
      const msg = 'testCanvasClearAbnormal';
      const canvas = new drawing.Canvas(pixel);
      try {

        try {
          canvas.clear({
            alpha: 256, red: 255, green: 0, blue: 0
          });
          console.info(msg + `test error`);
          expect().assertFail()
        } catch (e) {
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
          console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
          expect(e.code).assertEqual(401);
        }

        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2700
     * @tc.name      : testCanvasGetWidthAndHeightNormal
     * @tc.desc      : testCanvasGetWidthAndHeightNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasGetWidthAndHeightNormal', DEFAULT, () => {
      const msg = 'testCanvasGetWidthAndHeightNormal';
      const canvas = new drawing.Canvas(pixel);
      try {
        let width = canvas.getWidth();
        let height = canvas.getHeight();
        console.info(msg + 'test successes');
        expect(width).assertEqual(100);
        expect(height).assertEqual(100);
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2701
     * @tc.name      : testCanvasGetWidthAndHeightMultipleCalls
     * @tc.desc      : testCanvasGetWidthAndHeightMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasGetWidthAndHeightMultipleCalls', 3, () => {
      const msg = 'testCanvasGetWidthAndHeightMultipleCalls';
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
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2800
     * @tc.name      : testCanvasDrawOvalNormal
     * @tc.desc      : testCanvasDrawOvalNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasDrawOvalNormal', DEFAULT, () => {
      const msg = 'testCanvasDrawOvalNormal';
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
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2801
     * @tc.name      : testCanvasDrawOvalMultipleCalls
     * @tc.desc      : testCanvasDrawOvalMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawOvalMultipleCalls', 3, () => {
      const msg = 'testCanvasDrawOvalMultipleCalls';
      const canvas = new drawing.Canvas(pixel);
      try {
        for (let i = 0; i < 20; i += 1) {
          canvas.drawOval({
            left: Math.random(), right: Math.random(), top: Math.random(), bottom: Math.random()
          });
        }

        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2802
     * @tc.name      : testCanvasDrawOvalToNull
     * @tc.desc      : testCanvasDrawOvalToNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawOvalToNull', 3, () => {
      const msg = 'testCanvasDrawOvalToNull';
      const canvas = new drawing.Canvas(pixel);

      try {
        canvas.drawOval(null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawOval(undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawOval({
          left: null, right: 400, top: 50, bottom: 200
        });
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawOval({
          left: 100, right: null, top: 50, bottom: 200
        });
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawOval({
          left: 100, right: 400, top: null, bottom: 200
        });
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawOval({
          left: 100, right: 400, top: 50, bottom: null
        });
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawOval({
          left: undefined, right: 400, top: 50, bottom: 200
        });
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawOval({
          left: 100, right: undefined, top: 50, bottom: 200
        });
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawOval({
          left: 100, right: 400, top: undefined, bottom: 200
        });
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawOval({
          left: 100, right: 400, top: 50, bottom: undefined
        });
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2900
     * @tc.name      : testCanvasDrawArcNormal
     * @tc.desc      : testCanvasDrawArcNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasDrawArcNormal', DEFAULT, () => {
      const msg = 'testCanvasDrawArcNormal';
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
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2901
     * @tc.name      : testCanvasDrawArcMultipleCalls
     * @tc.desc      : testCanvasDrawArcMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawArcMultipleCalls', 3, () => {
      const msg = 'testCanvasDrawArcMultipleCalls';
      const canvas = new drawing.Canvas(pixel);
      try {
        for (let i = 0; i < 20; i += 1) {
          canvas.drawArc({
            left: Math.random(), right: Math.random(), top: Math.random(), bottom: Math.random()
          }, 90, 180);
        }
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_2902
     * @tc.name      : testCanvasDrawArcToNull
     * @tc.desc      : testCanvasDrawArcToNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawArcToNull', 3, () => {
      const msg = 'testCanvasDrawArcToNull';
      const canvas = new drawing.Canvas(pixel);

      try {
        canvas.drawArc(null, 90, 180);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawArc(undefined, 90, 180);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawArc({
          left: null, right: 400, top: 50, bottom: 200
        }, 90, 180);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawArc({
          left: 100, right: null, top: 50, bottom: 200
        }, 90, 180);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawArc({
          left: 100, right: 400, top: null, bottom: 200
        }, 90, 180);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawArc({
          left: 100, right: 400, top: 50, bottom: null
        }, 90, 180);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawArc({
          left: undefined, right: 400, top: 50, bottom: 200
        }, 90, 180);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawArc({
          left: 100, right: undefined, top: 50, bottom: 200
        }, 90, 180);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawArc({
          left: 100, right: 400, top: undefined, bottom: 200
        }, 90, 180);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawArc({
          left: 100, right: 400, top: 50, bottom: undefined
        }, 90, 180);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawArc({
          left: 100, right: 400, top: 50, bottom: 200
        }, null, 180);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawArc({
          left: 100, right: 400, top: 50, bottom: 200
        }, 90, null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawArc({
          left: 100, right: 400, top: 50, bottom: 200
        }, undefined, 180);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawArc({
          left: 100, right: 400, top: 50, bottom: 200
        }, 90, undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3000
     * @tc.name      : testCanvasDrawPointsNormal
     * @tc.desc      : testCanvasDrawPointsNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasDrawPointsNormal', DEFAULT, () => {
      const msg = 'testCanvasDrawPointsNormal';
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
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3001
     * @tc.name      : testCanvasDrawPointsMultipleCalls
     * @tc.desc      : testCanvasDrawPointsMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawPointsMultipleCalls', 3, () => {
      const msg = 'testCanvasDrawPointsMultipleCalls';
      const canvas = new drawing.Canvas(pixel);
      try {
        for (let i = 0; i < 20; i += 1) {
          const randomEnum = Math.floor(getEnumCount(drawing.PointMode) * Math.random())
          canvas.drawPoints([{
            x: Math.random(), y: Math.random()
          }, {
            x: Math.random(), y: Math.random()
          }, {
            x: Math.random(), y: Math.random()
          }], randomEnum);
        }
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3002
     * @tc.name      : testCanvasDrawPointsToNull
     * @tc.desc      : testCanvasDrawPointsToNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawPointsToNull', 3, () => {
      const msg = 'testCanvasDrawPointsToNull';
      const canvas = new drawing.Canvas(pixel);

      try {
        canvas.drawPoints(null, drawing.PointMode.POINTS);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawPoints([{
          x: 100, y: 200
        }, {
          x: 150, y: 230
        }, {
          x: 200, y: 300
        }], null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawPoints(undefined, drawing.PointMode.POINTS);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.drawPoints([{
          x: 100, y: 200
        }, {
          x: 150, y: 230
        }, {
          x: 200, y: 300
        }], undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3004
     * @tc.name      : testCanvasDrawPointsAbnormal
     * @tc.desc      : testCanvasDrawPointsAbnormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawPointsAbnormal', 3, () => {
      const msg = 'testCanvasDrawPointsAbnormal';
      const canvas = new drawing.Canvas(pixel);

      try {
        canvas.drawPoints([{
          x: 100, y: 200
        }, {
          x: 150, y: 230
        }, {
          x: 200, y: 300
        }], 10);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawPoints([]);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3100
     * @tc.name      : testCanvasConcatMatrixNormal
     * @tc.desc      : testCanvasConcatMatrixNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasConcatMatrixNormal', DEFAULT, () => {
      const msg = 'testCanvasConcatMatrixNormal';
      const canvas = new drawing.Canvas(pixel);
      try {
        let matrix = new drawing.Matrix();
        canvas.concatMatrix(matrix);
        matrix.setMatrix([5, 0, 0, 0, 1, 2, 0, 0, 1]);
        canvas.concatMatrix(matrix);
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3101
     * @tc.name      : testCanvasConcatMatrixMultipleCalls
     * @tc.desc      : testCanvasConcatMatrixMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasConcatMatrixMultipleCalls', 3, () => {
      const msg = 'testCanvasConcatMatrixMultipleCalls';
      const canvas = new drawing.Canvas(pixel);
      try {
        for (let i = 0; i < 20; i += 1) {
          let matrix = new drawing.Matrix();
          canvas.concatMatrix(matrix);
        }
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3102
     * @tc.name      : testCanvasConcatMatrixToNull
     * @tc.desc      : testCanvasConcatMatrixToNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasConcatMatrixToNull', 3, () => {
      const msg = 'testCanvasConcatMatrixToNull';
      const canvas = new drawing.Canvas(pixel);

      try {
        canvas.concatMatrix(null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.concatMatrix(undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3200
     * @tc.name      : testCanvasSetMatrixNormal
     * @tc.desc      : testCanvasSetMatrixNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasSetMatrixNormal', DEFAULT, () => {
      const msg = 'testCanvasSetMatrixNormal';
      const canvas = new drawing.Canvas(pixel);
      try {
        let matrix = new drawing.Matrix();
        canvas.setMatrix(matrix);
        matrix.setMatrix([5.1, 1.1, 1.1, 1.1, 1.1, 1.1, 5.1, 0.3, 1.7]);
        canvas.setMatrix(matrix);
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3201
     * @tc.name      : testCanvasSetMatrixMultipleCalls
     * @tc.desc      : testCanvasSetMatrixMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasSetMatrixMultipleCalls', 3, () => {
      const msg = 'testCanvasSetMatrixMultipleCalls';
      const canvas = new drawing.Canvas(pixel);
      try {
        for (let i = 0; i < 20; i += 1) {
          const matrix = new drawing.Matrix()
          canvas.setMatrix(matrix)
        }
        console.info(msg + 'test successes');
      } catch (e) {
        console.info(msg + `test errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_3202
     * @tc.name      : testCanvasSetMatrixToNull
     * @tc.desc      : testCanvasSetMatrixToNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasSetMatrixToNull', 3, () => {
      const msg = 'testCanvasSetMatrixToNull';
      const canvas = new drawing.Canvas(pixel);

      try {
        canvas.setMatrix(null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        canvas.setMatrix(undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })


  })
}