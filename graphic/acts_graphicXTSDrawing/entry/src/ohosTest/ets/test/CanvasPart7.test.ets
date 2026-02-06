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
import common2D from '@ohos.graphics.common2D';
import { getEnumCount } from './utils';

export default function drawingTsCanvasPart7Test() {
  describe('DrawingTsCanvasPart7Test', () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4800
     * @tc.name      : testCanvasDrawQuickRejectPathNormal
     * @tc.desc      : testCanvasDrawQuickRejectPathNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('testCanvasDrawQuickRejectPathNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testCanvasDrawQuickRejectPathNormal';
      const path = new drawing.Path();
      let canvas = new drawing.Canvas(pixel);
      path.moveTo(-100,-100);
      path.lineTo(-50, -50);
      try {
        let isSuccess1 = canvas.quickRejectPath(path);
        expect(isSuccess1).assertEqual(true);
      } catch (e) {
        console.info(msg + `quickRejectPath 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      path.moveTo(0, 100);
      path.lineTo(-100, -100);
      try {
        let isSuccess2 = canvas.quickRejectPath(path);
        expect(isSuccess2).assertEqual(false);
      } catch (e) {
        console.info(msg + `quickRejectPath 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      path.reset();
      path.moveTo(-100,-100);
      path.lineTo(0, 0);
      try {
        let isSuccess3 = canvas.quickRejectPath(path);
        expect(isSuccess3).assertEqual(false);
      } catch (e) {
        console.info(msg + `quickRejectPath 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      path.reset();
      path.moveTo(-100,0);
      path.lineTo(0, 100);
      path.lineTo(-100, 200);
      try {
        let isSuccess4 = canvas.quickRejectPath(path);
        expect(isSuccess4).assertEqual(false);
      } catch (e) {
        console.info(msg + `quickRejectPath 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      let isSuccess = true;
      path.lineTo(200, 200);
      try {
        isSuccess = canvas.quickRejectPath(path);
        expect(isSuccess).assertEqual(false);
      } catch (e) {
        console.info(msg + `quickRejectPath 5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      path.reset();
      isSuccess = true;
      let rect0:common2D.Rect = {
        left: 200,
        top: 200,
        right: 400,
        bottom: 400
      };
      path.addArc(rect0, 10, 50);
      path.conicTo(200, 400, 100, 200, 0);
      try {
        isSuccess = canvas.quickRejectPath(path);
        expect(isSuccess).assertEqual(true);
      } catch (e) {
        console.info(msg + `quickRejectPath 6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4801
     * @tc.name      : testCanvasDrawQuickRejectPathNull
     * @tc.desc      : testCanvasDrawQuickRejectPathNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testCanvasDrawQuickRejectPathNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
      const msg = 'testCanvasDrawQuickRejectPathNull';
      let canvas = new drawing.Canvas(pixel);
      try {
        canvas.quickRejectPath(null);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `quickRejectPath null errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.quickRejectPath(undefined);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `quickRejectPath undefined errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4802
     * @tc.name      : testCanvasDrawQuickRejectPathMultipleCalls
     * @tc.desc      : testCanvasDrawQuickRejectPathMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawQuickRejectPathMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawQuickRejectPathMultipleCalls';
      const path = new drawing.Path();
      let canvas = new drawing.Canvas(pixel);
      for(let i = 0; i < 20; i++) {
        path.moveTo(100 + i * 0.01, 100 + i * 0.01);
        path.lineTo(150 + i * 0.01, 50 + i * 0.01);
        try {
          let isSuccess = canvas.quickRejectPath(path);
          expect(isSuccess).assertEqual(false);
        } catch (e) {
          console.info(msg + `quickRejectPath ${i} errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4900
     * @tc.name      : testCanvasDrawQuickRejectRectNormal
     * @tc.desc      : testCanvasDrawQuickRejectRectNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testCanvasDrawQuickRejectRectNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
      const msg = 'testCanvasDrawQuickRejectRectNormal';
      const path = new drawing.Path();
      let canvas = new drawing.Canvas(pixel);
      let rectQuire: common2D.Rect = { left: -150, top: 10, right: -100, bottom: 100 };
      try {
        let isSuccess1 = canvas.quickRejectRect(rectQuire);
        expect(isSuccess1).assertEqual(true);
      } catch (e) {
        console.info(msg + `quickRejectRect 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      rectQuire = { left: -100, top: -100, right: 10000, bottom: 10000 };
      try {
        let isSuccess2 = canvas.quickRejectRect(rectQuire);
        expect(isSuccess2).assertEqual(false);
      } catch (e) {
        console.info(msg + `quickRejectRect 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      rectQuire = { left: 0, top: 0, right: 0, bottom: 0 };
      try {
        let isSuccess3 = canvas.quickRejectRect(rectQuire);
        expect(isSuccess3).assertEqual(true);
      } catch (e) {
        console.info(msg + `quickRejectRect 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      rectQuire = { left: -100, top: -100, right: 0, bottom: 0 };
      try {
        let isSuccess4 = canvas.quickRejectRect(rectQuire);
        expect(isSuccess4).assertEqual(false);
      } catch (e) {
        console.info(msg + `quickRejectRect 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      rectQuire = { left: -100, top: 0, right: 0, bottom: 100 };
      canvas.save()
      //边点
      canvas.rotate(45, 0, 0);
      try {
        let isSuccess5 = canvas.quickRejectRect(rectQuire);
        expect(isSuccess5).assertEqual(false);
      } catch (e) {
        console.info(msg + `quickRejectRect 5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      canvas.restore();
      canvas.save()
      canvas.rotate(45, 500, 0);
      try {
        let isSuccess6 = canvas.quickRejectRect(rectQuire);
        expect(isSuccess6).assertEqual(true);
      } catch (e) {
        console.info(msg + `quickRejectRect 6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      canvas.restore();
      rectQuire = { left: -100, top: 0, right: 100, bottom: 100 };
      try {
        let isSuccess7 = canvas.quickRejectRect(rectQuire);
        expect(isSuccess7).assertEqual(false);
      } catch (e) {
        console.info(msg + `quickRejectRect 7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      };
      rectQuire = { left: 50, top: 50, right: 100, bottom: 100 };
      try {
        let isSuccess8 = canvas.quickRejectRect(rectQuire);
        expect(isSuccess8).assertEqual(false);
      } catch (e) {
        console.info(msg + `quickRejectRect 8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      };
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4901
     * @tc.name      : testCanvasDrawQuickRejectRectNull
     * @tc.desc      : testCanvasDrawQuickRejectRectNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testCanvasDrawQuickRejectRectNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
      const msg = 'testCanvasDrawQuickRejectRectNull';
      let canvas = new drawing.Canvas(pixel);
      try {
        canvas.quickRejectRect(null);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `quickRejectRect null errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.quickRejectRect(undefined);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `quickRejectRect undefined errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4902
     * @tc.name      : testCanvasDrawQuickRejectRectMultipleCalls
     * @tc.desc      : testCanvasDrawQuickRejectRectMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawQuickRejectRectMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawQuickRejectRectMultipleCalls';
      let canvas = new drawing.Canvas(pixel);
      for(let i = 0; i < 20; i++) {
        let rect: common2D.Rect = {
            left: 100 + i * 0.01, top: 100 + i * 0.01, right: 300 + i * 0.01, bottom: 300 + i * 0.01
          };
        try {
          let isSuccess = canvas.quickRejectRect(rect);
          expect(isSuccess).assertEqual(false);
        } catch (e) {
          console.info(msg + `quickRejectPath ${i} errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_4903
     * @tc.name      : testCanvasDrawQuickRejectRectMax
     * @tc.desc      : testCanvasDrawQuickRejectRectMax
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawQuickRejectRectMax', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawQuickRejectRectMax';
      let canvas = new drawing.Canvas(pixel);
      let rect: common2D.Rect = {
        left: Number.MAX_VALUE, top: Number.MAX_VALUE, right: Number.MAX_VALUE + 100, bottom: Number.MAX_VALUE + 100
      };
      try {
        let isSuccess1 = canvas.quickRejectRect(rect);
        expect(isSuccess1).assertEqual(true);
      } catch (e) {
        console.info(msg + `quickRejectPath 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      rect = {
        left: -Number.MAX_VALUE, top: -Number.MAX_VALUE, right: Number.MAX_VALUE + 100, bottom: Number.MAX_VALUE + 100
      };
      try {
        let isSuccess2 = canvas.quickRejectRect(rect);
        expect(isSuccess2).assertEqual(true);
      } catch (e) {
        console.info(msg + `quickRejectPath 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_5000
     * @tc.name      : testCanvasDrawArcWithCenterNormal
     * @tc.desc      : testCanvasDrawArcWithCenterNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawArcWithCenterNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawArcWithCenterNormal';
      let canvas = new drawing.Canvas(pixel);
      let rect: common2D.Rect = {
        left: 100, top: 20, right: 120, bottom: 120
      };
      try {
        canvas.drawArcWithCenter(rect, 80, 280, true);
      } catch (e) {
        console.info(msg + `quickRejectPath 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      rect = {
        left: 100, top: 20, right: 300, bottom: 120
      };
      try {
        canvas.drawArcWithCenter(rect, 0, 100, true);
      } catch (e) {
        console.info(msg + `drawArcWithCenter 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      rect = {
        left: 350, top: 20, right: 450, bottom: 120
      };
      try {
        canvas.drawArcWithCenter(rect, 80, 280, false);
      } catch (e) {
        console.info(msg + `drawArcWithCenter 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      rect = {
        left: 425, top: 20, right: 525, bottom: 120
      };
      try {
        canvas.drawArcWithCenter(rect, 0, 0, true);
      } catch (e) {
        console.info(msg + `drawArcWithCenter 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawArcWithCenter(rect, 0, 0, false);
      } catch (e) {
        console.info(msg + `drawArcWithCenter 5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawArcWithCenter(rect, 0, -90, true);
      } catch (e) {
        console.info(msg + `drawArcWithCenter 6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawArcWithCenter(rect, 0, 90, false);
      } catch (e) {
        console.info(msg + `drawArcWithCenter 7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawArcWithCenter(rect, 0, 360, false);
      } catch (e) {
        console.info(msg + `drawArcWithCenter 8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawArcWithCenter(rect, -90, 0, true);
      } catch (e) {
        console.info(msg + `drawArcWithCenter 9 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawArcWithCenter(rect, 360, 0, true);
      } catch (e) {
        console.info(msg + `drawArcWithCenter 10 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawArcWithCenter(rect, -90, -200, false);
      } catch (e) {
        console.info(msg + `drawArcWithCenter 11 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawArcWithCenter(rect, 90, 200, true);
      } catch (e) {
        console.info(msg + `drawArcWithCenter 12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawArcWithCenter(rect, 0, 380, true);
      } catch (e) {
        console.info(msg + `drawArcWithCenter 13 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawArcWithCenter(rect, 380, 60, false);
      } catch (e) {
        console.info(msg + `drawArcWithCenter 14 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawArcWithCenter(rect, 10000, 10000, true);
      } catch (e) {
        console.info(msg + `drawArcWithCenter 14 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_5001
     * @tc.name      : testCanvasDrawArcWithCenterNull
     * @tc.desc      : testCanvasDrawArcWithCenterNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testCanvasDrawArcWithCenterNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
      const msg = 'testCanvasDrawArcWithCenterNull';
      let canvas = new drawing.Canvas(pixel);
      let rect: common2D.Rect = {
        left: 20,
        top: 20,
        right: 120,
        bottom: 120
      };
      try {
        canvas.drawArcWithCenter(null, 380, 60, false);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawArcWithCenter 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawArcWithCenter(undefined, 380, 60, false);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawArcWithCenter 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawArcWithCenter(rect, null, 60, true);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawArcWithCenter 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawArcWithCenter(rect, undefined, 60, true);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawArcWithCenter 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawArcWithCenter(rect, 380, null, true);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawArcWithCenter 5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawArcWithCenter(rect, 380, undefined, true);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawArcWithCenter 6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawArcWithCenter(rect, 380, 60, null);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawArcWithCenter 7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawArcWithCenter(rect, 380, 60, undefined);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawArcWithCenter 8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_5002
     * @tc.name      : testCanvasDrawArcWithCenterMultipleCalls
     * @tc.desc      : testCanvasDrawArcWithCenterMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawArcWithCenterMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawArcWithCenterMultipleCalls';
      const path = new drawing.Path();
      let canvas = new drawing.Canvas(pixel);
      for(let i = 0; i < 20; i++) {
        let rect: common2D.Rect = {
          left: 100 + i * 0.01, top: 100 + i * 0.01, right: 300 + i * 0.01, bottom: 300 + i * 0.01
        };
        try {
          canvas.drawArcWithCenter(rect, 0, 180, true);
        } catch (e) {
          console.info(msg + `drawArcWithCenter ${i} errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_5003
     * @tc.name      : testCanvasDrawArcWithCenterMax
     * @tc.desc      : testCanvasDrawArcWithCenterMax
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawArcWithCenterMax', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawArcWithCenterMax';
      const path = new drawing.Path();
      let canvas = new drawing.Canvas(pixel);
      let rect: common2D.Rect = {
        left: Number.MAX_VALUE, top: Number.MAX_VALUE, right: Number.MAX_VALUE + 100, bottom: Number.MAX_VALUE + 100
      };
      try {
        canvas.drawArcWithCenter(rect, 0, 180, true);
      } catch (e) {
        console.info(msg + `drawArcWithCenter 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      rect = {
        left: -Number.MAX_VALUE, top: -Number.MAX_VALUE, right: Number.MAX_VALUE + 100, bottom: Number.MAX_VALUE + 100
      };
      try {
        canvas.drawArcWithCenter(rect, 0, 180, true);
      } catch (e) {
        console.info(msg + `drawArcWithCenter 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_5100
     * @tc.name      : testCanvasDrawImageNineNormal
     * @tc.desc      : testCanvasDrawImageNineNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('testCanvasDrawImageNineNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testCanvasDrawImageNineNormal';
      let canvas = new drawing.Canvas(pixel);
      let center: common2D.Rect = { left: 100, top: 100, right: 900, bottom: 1500 };
      let dst: common2D.Rect = { left: -50, top: -50, right: 2000, bottom: 1600 };
      try {
        canvas.drawImageNine(pixel, center, dst, drawing.FilterMode.FILTER_MODE_NEAREST);
      } catch (e) {
        console.info(msg + `drawImageNine 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      center = { left: -100, top: -100, right: 50, bottom: 100 };
      dst = { left: 0, top: 0, right: 200, bottom: 200 };
      try {
        canvas.drawImageNine(pixel, center, dst, drawing.FilterMode.FILTER_MODE_LINEAR);
      } catch (e) {
        console.info(msg + `drawImageNine 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      center = { left: 200, top: 200, right: 100000, bottom: 100000 };
      dst = { left: 0, top: 0, right: 200, bottom: 200 };
      try {
        canvas.drawImageNine(pixel, center, dst, drawing.FilterMode.FILTER_MODE_LINEAR);
      } catch (e) {
        console.info(msg + `drawImageNine 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      center = { left: 100, top: 100, right: 200, bottom: 200 };
      dst = { left: 0, top: 0, right: 800, bottom: 800 };
      try {
        canvas.drawImageNine(pixel, center, dst, drawing.FilterMode.FILTER_MODE_NEAREST);
      } catch (e) {
        console.info(msg + `drawImageNine 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      center = { left: 10.1, top: 10.1, right: 300.1, bottom: 300.1 };
      dst = { left: 0, top: 0, right: 50.1, bottom: 50.1 };
      try {
        canvas.drawImageNine(pixel, center, dst, drawing.FilterMode.FILTER_MODE_LINEAR);
      } catch (e) {
        console.info(msg + `drawImageNine 5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_5101
     * @tc.name      : testCanvasDrawImageNineNull
     * @tc.desc      : testCanvasDrawImageNineNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawImageNineNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawImageNineNull';
      let canvas = new drawing.Canvas(pixel);
      let center: common2D.Rect = { left: 100, top: 100, right: 900, bottom: 1500 };
      let dst: common2D.Rect = { left: -50, top: -50, right: 2000, bottom: 1600 };
      try {
        canvas.drawImageNine(null, center, dst, drawing.FilterMode.FILTER_MODE_NEAREST);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawImageNine 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawImageNine(undefined, center, dst, drawing.FilterMode.FILTER_MODE_NEAREST);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawImageNine 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawImageNine(pixel, null, dst, drawing.FilterMode.FILTER_MODE_LINEAR);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawImageNine 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawImageNine(pixel, undefined, dst, drawing.FilterMode.FILTER_MODE_NEAREST);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawImageNine 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawImageNine(pixel, center, null, drawing.FilterMode.FILTER_MODE_LINEAR);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawImageNine 5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawImageNine(pixel, center, undefined, drawing.FilterMode.FILTER_MODE_LINEAR);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawImageNine 6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawImageNine(pixel, center, dst, null);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawImageNine 7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawImageNine(pixel, center, dst, undefined);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawImageNine 8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_5102
     * @tc.name      : testCanvasDrawImageNineMultipleCalls
     * @tc.desc      : testCanvasDrawImageNineMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawImageNineMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawImageNineMultipleCalls';
      const path = new drawing.Path();
      let canvas = new drawing.Canvas(pixel);
      for(let i = 0; i < 20; i++) {
        let center: common2D.Rect = { left: 100 + i * 0.01, top: 100 + i * 0.01, right: 900 + i * 0.01, bottom: 1500 + i * 0.01 };
        let dst: common2D.Rect = { left: -50 + i * 0.01, top: -50 + i * 0.01, right: 2000 + i * 0.01, bottom: 1600 + i * 0.01 };
        try {
          canvas.drawImageNine(pixel, center, dst, drawing.FilterMode.FILTER_MODE_LINEAR);
        } catch (e) {
          console.info(msg + `drawImageNine ${i} errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_5103
     * @tc.name      : testCanvasDrawImageNineMax
     * @tc.desc      : testCanvasDrawImageNineMax
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawImageNineMax', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawImageNineMax';
      const path = new drawing.Path();
      let canvas = new drawing.Canvas(pixel);
      let center: common2D.Rect = {
        left: Number.MAX_VALUE, top: Number.MAX_VALUE, right: Number.MAX_VALUE + 100, bottom: Number.MAX_VALUE + 100
      };
      let dst: common2D.Rect = { left: -50 , top: -50 , right: 2000 , bottom: 1600};
      try {
        canvas.drawImageNine(pixel, center, dst, drawing.FilterMode.FILTER_MODE_LINEAR);
      } catch (e) {
        console.info(msg + `drawImageNine 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      center = {
        left: -Number.MAX_VALUE, top: -Number.MAX_VALUE, right: Number.MAX_VALUE + 100, bottom: Number.MAX_VALUE + 100
      };
      try {
        canvas.drawImageNine(pixel, center, dst, drawing.FilterMode.FILTER_MODE_LINEAR);
      } catch (e) {
        console.info(msg + `drawImageNine 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      center = { left: -50 , top: -50 , right: 2000 , bottom: 1600};
      dst = {
        left: Number.MAX_VALUE, top: Number.MAX_VALUE, right: Number.MAX_VALUE + 100, bottom: Number.MAX_VALUE + 100
      };
      try {
        canvas.drawImageNine(pixel, center, dst, drawing.FilterMode.FILTER_MODE_LINEAR);
      } catch (e) {
        console.info(msg + `drawImageNine 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      dst = {
        left: -Number.MAX_VALUE, top: -Number.MAX_VALUE, right: Number.MAX_VALUE + 100, bottom: Number.MAX_VALUE + 100
      };
      try {
        canvas.drawImageNine(pixel, center, dst, drawing.FilterMode.FILTER_MODE_LINEAR);
      } catch (e) {
        console.info(msg + `drawImageNine 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_5200
     * @tc.name      : testCanvasDrawImageLatticeNormal
     * @tc.desc      : testCanvasDrawImageLatticeNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawImageLatticeNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawImageLatticeNormal';
      let canvas = new drawing.Canvas(pixel);
      let fXDivs: Array<number> = [80, 150];
      let fYDivs: Array<number> = [80, 150];
      let fXCount = 2
      let fYCount = 2
      let lattice = drawing.Lattice.createImageLattice(fXDivs, fYDivs, fXCount, fYCount, null, null, null);
      let dst: common2D.Rect = { left: 0, top: 0, right: 200, bottom: 200 };
      try {
        canvas.drawImageLattice(pixel, lattice, dst, drawing.FilterMode.FILTER_MODE_NEAREST);
      } catch (e) {
        console.info(msg + `drawImageLattice 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      let fXDivs1: Array<number> = [310, 320, 340, 360, 400];
      let fYDivs1: Array<number> = [310, 320, 340, 360, 400];
      fXCount = 5;
      fYCount = 5;
      lattice = drawing.Lattice.createImageLattice(fXDivs1, fYDivs1, fXCount, fYCount, null, null, null);
      dst = { left: 225, top:0, right: 425, bottom: 200 };
      try {
        canvas.drawImageLattice(pixel, lattice, dst, drawing.FilterMode.FILTER_MODE_LINEAR);
      } catch (e) {
        console.info(msg + `drawImageLattice 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      let bound1: common2D.Rect = {
        left: 700,
        right: 800,
        top: 700,
        bottom: 800
      };
      let fXDivs2: Array<number> = [200, 400];
      let fYDivs2: Array<number> = [200, 400];
      fXCount = 2;
      fYCount = 2;
      lattice = drawing.Lattice.createImageLattice(fXDivs2, fYDivs2, fXCount, fYCount, bound1, null, null);
      dst = { left: 450, top:0, right: 650, bottom: 200 };
      try {
        canvas.drawImageLattice(pixel, lattice, dst, drawing.FilterMode.FILTER_MODE_LINEAR);
      } catch (e) {
        console.info(msg + `drawImageLattice 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      dst = { left: 10.2, top: 550.1, right: 300.1, bottom: 850.1 };
      try {
        canvas.drawImageLattice(pixel, lattice, dst, drawing.FilterMode.FILTER_MODE_LINEAR);
      } catch (e) {
        console.info(msg + `drawImageLattice 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      dst = { left: -10, top: -60, right: 300000, bottom: 300000 };
      try {
        canvas.drawImageLattice(pixel, lattice, dst, drawing.FilterMode.FILTER_MODE_LINEAR);
      } catch (e) {
        console.info(msg + `drawImageLattice 5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_5201
     * @tc.name      : testCanvasDrawImageLatticeNull
     * @tc.desc      : testCanvasDrawImageLatticeNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawImageLatticeNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawImageLatticeNull';
      let canvas = new drawing.Canvas(pixel);
      let xDivs: Array<number> = [80, 160, 320, 560];
      let yDivs: Array<number> = [80, 160, 320, 560];
      let xCount = 4;
      let yCount = 4;
      let lattice = drawing.Lattice.createImageLattice(xDivs, yDivs, xCount, yCount, null, null, null);
      let dst: common2D.Rect = { left: 0, top: 0, right: 200, bottom: 200 };
      try {
        canvas.drawImageLattice(null, lattice, dst, drawing.FilterMode.FILTER_MODE_NEAREST);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawImageLattice 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawImageLattice(undefined, lattice, dst, drawing.FilterMode.FILTER_MODE_NEAREST);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawImageLattice 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawImageLattice(pixel, null, dst, drawing.FilterMode.FILTER_MODE_NEAREST);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawImageLattice 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawImageLattice(pixel, undefined, dst, drawing.FilterMode.FILTER_MODE_NEAREST);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawImageLattice 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawImageLattice(pixel, lattice, null, drawing.FilterMode.FILTER_MODE_NEAREST);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawImageLattice 5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawImageLattice(pixel, lattice, undefined, drawing.FilterMode.FILTER_MODE_NEAREST);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawImageLattice 6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawImageLattice(pixel, lattice, dst, null);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawImageLattice 7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawImageLattice(pixel, lattice, dst, undefined);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawImageLattice 8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_5202
     * @tc.name      : testCanvasDrawImageLatticeMultipleCalls
     * @tc.desc      : testCanvasDrawImageLatticeMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('testCanvasDrawImageLatticeMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testCanvasDrawImageLatticeMultipleCalls';
      const path = new drawing.Path();
      let canvas = new drawing.Canvas(pixel);
      for(let i = 0; i < 20; i++) {
        let xDivs: Array<number> = [80, 160, 320, 560];
        let yDivs: Array<number> = [80, 160, 320, 560];
        let xCount = 4;
        let yCount = 4;
        let lattice = drawing.Lattice.createImageLattice(xDivs, yDivs, xCount, yCount, null, null, null);
        let dst: common2D.Rect = { left: 0+ i * 0.01, top: 0+ i * 0.01, right: 200+ i * 0.01, bottom: 200+ i * 0.01 };
        try {
          canvas.drawImageLattice(pixel, lattice, dst, drawing.FilterMode.FILTER_MODE_LINEAR);
        } catch (e) {
          console.info(msg + `drawImageLattice 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_5203
     * @tc.name      : testCanvasDrawImageLatticeMax
     * @tc.desc      : testCanvasDrawImageLatticeMax
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('testCanvasDrawImageLatticeMax', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testCanvasDrawImageLatticeMax';
      const path = new drawing.Path();
      let canvas = new drawing.Canvas(pixel);
      let xDivs: Array<number> = [80, 160, 320, 560];
      let yDivs: Array<number> = [80, 160, 320, 560];
      let xCount = 4;
      let yCount = 4;
      let lattice = drawing.Lattice.createImageLattice(xDivs, yDivs, xCount, yCount, null, null, null);
      let dst: common2D.Rect = {
        left: Number.MAX_VALUE, top: Number.MAX_VALUE, right: Number.MAX_VALUE + 100, bottom: Number.MAX_VALUE + 100
      };
      try {
        canvas.drawImageLattice(pixel, lattice, dst, drawing.FilterMode.FILTER_MODE_NEAREST);
      } catch (e) {
        console.info(msg + `drawImageLattice 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      dst = {
        left: -Number.MAX_VALUE, top: -Number.MAX_VALUE, right: Number.MAX_VALUE + 100, bottom: Number.MAX_VALUE + 100
      };
      try {
        canvas.drawImageLattice(pixel, lattice, dst, drawing.FilterMode.FILTER_MODE_NEAREST);
      } catch (e) {
        console.info(msg + `drawImageLattice 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_5300
     * @tc.name      : testCanvasDrawSingleCharacterWithFeaturesNormal
     * @tc.desc      : testCanvasDrawSingleCharacterWithFeaturesNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testCanvasDrawSingleCharacterWithFeaturesNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCanvasDrawSingleCharacterWithFeaturesNormal';
      const font = new drawing.Font();
      let canvas = new drawing.Canvas(pixel);
      font.setSize(20);
      let fontFeatures : Array<drawing.FontFeature> = [];
      try {
        canvas.drawSingleCharacterWithFeatures("你", font, 100, 100, fontFeatures);
        console.info(msg + `drawSingleCharacterWithFeatures 1 success `);
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawSingleCharacterWithFeatures("(", font, 100, 100, fontFeatures);
        console.info(msg + `drawSingleCharacterWithFeatures 2 success `);
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawSingleCharacterWithFeatures("<", font, 100, 100, fontFeatures);
        console.info(msg + `drawSingleCharacterWithFeatures 3 success `);
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawSingleCharacterWithFeatures("1", font, 100, 100, fontFeatures);
        console.info(msg + `drawSingleCharacterWithFeatures 4 success `);
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      fontFeatures.push({name: 'calt', value: 0});
      try {
        canvas.drawSingleCharacterWithFeatures("你", font, 0, 0, fontFeatures);
        console.info(msg + `drawSingleCharacterWithFeatures 5 success `);
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawSingleCharacterWithFeatures("（", font, 100, 100, fontFeatures);
        console.info(msg + `drawSingleCharacterWithFeatures 6 success `);
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawSingleCharacterWithFeatures("<", font, 100, 100, fontFeatures);
        console.info(msg + `drawSingleCharacterWithFeatures 7 success `);
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawSingleCharacterWithFeatures("1", font, 100.25, 100.25, fontFeatures);
        console.info(msg + `drawSingleCharacterWithFeatures 8 success `);
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      font.setSize(30.55);
      fontFeatures.push({name: 'calt', value: 42});
      fontFeatures.push({name: 'ccmp', value:12});
      fontFeatures.push({name: 'frac', value:21});
      try {
        canvas.drawSingleCharacterWithFeatures("你", font, 100, 100, fontFeatures);
        console.info(msg + `drawSingleCharacterWithFeatures 9 success `);
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 9 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawSingleCharacterWithFeatures("(", font, -100, 100, fontFeatures);
        console.info(msg + `drawSingleCharacterWithFeatures 10 success `);
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 10 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawSingleCharacterWithFeatures("<", font, 100, -100, fontFeatures);
        console.info(msg + `drawSingleCharacterWithFeatures 11 success `);
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 11 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawSingleCharacterWithFeatures("1", font, -100, -100, fontFeatures);
        console.info(msg + `drawSingleCharacterWithFeatures 12 success `);
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawSingleCharacterWithFeatures("a", font, 100, 100, fontFeatures);
        console.info(msg + `drawSingleCharacterWithFeatures 13 success `);
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 13 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawSingleCharacterWithFeatures("F", font, 100, 100, fontFeatures);
        console.info(msg + `drawSingleCharacterWithFeatures 14 success `);
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 14 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      let fontFeatures1 : Array<drawing.FontFeature> = [];
      fontFeatures1.push({name: 'Azzz', value: 42});
      try {
        canvas.drawSingleCharacterWithFeatures("你", font, 100, 100, fontFeatures1);
        console.info(msg + `drawSingleCharacterWithFeatures 15 success `);
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 15 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      fontFeatures1.push({name: 'aaa', value: 42});
      try {
        canvas.drawSingleCharacterWithFeatures("你", font, 100, 100, fontFeatures1);
        console.info(msg + `drawSingleCharacterWithFeatures 16 success `);
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 16 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      fontFeatures1.push({name: 'aaa11', value: 42});
      try {
        canvas.drawSingleCharacterWithFeatures("你", font, 100, 100, fontFeatures1);
        console.info(msg + `drawSingleCharacterWithFeatures 17 success `);
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 17 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_5301
     * @tc.name      : testCanvasDrawSingleCharacterWithFeaturesToNull
     * @tc.desc      : testCanvasDrawSingleCharacterWithFeaturesToNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawSingleCharacterWithFeaturesToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawSingleCharacterWithFeaturesToNull';
      const font = new drawing.Font();
      let canvas = new drawing.Canvas(pixel);
      font.setSize(20);
      let fontFeatures : Array<drawing.FontFeature> = [];
      fontFeatures.push({name: 'calt', value: 42});
      try {
        canvas.drawSingleCharacterWithFeatures(null, font, 100, 100, fontFeatures);
        console.info(msg + `drawSingleCharacterWithFeatures 1 success `);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawSingleCharacterWithFeatures(undefined, font, 100, 100, fontFeatures);
        console.info(msg + `drawSingleCharacterWithFeatures 2 success `);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawSingleCharacterWithFeatures("你", null, 100, 100, fontFeatures);
        console.info(msg + `drawSingleCharacterWithFeatures 3 success `);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawSingleCharacterWithFeatures("你", undefined, 100, 100, fontFeatures);
        console.info(msg + `drawSingleCharacterWithFeatures 4 success `);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawSingleCharacterWithFeatures("你", font, null, 100, fontFeatures);
        console.info(msg + `drawSingleCharacterWithFeatures 5 success `);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawSingleCharacterWithFeatures("你", font, undefined, 100, fontFeatures);
        console.info(msg + `drawSingleCharacterWithFeatures 6 success `);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawSingleCharacterWithFeatures("你", font, 100, null, fontFeatures);
        console.info(msg + `drawSingleCharacterWithFeatures 7 success `);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawSingleCharacterWithFeatures("你", font, 100, undefined, fontFeatures);
        console.info(msg + `drawSingleCharacterWithFeatures 8 success `);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawSingleCharacterWithFeatures("你", font, 100, 100, null);
        console.info(msg + `drawSingleCharacterWithFeatures 9 success `);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 9 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        canvas.drawSingleCharacterWithFeatures("你", font, 100, 100, undefined);
        console.info(msg + `drawSingleCharacterWithFeatures 10 success `);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 10 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_5302
     * @tc.name      : testCanvasDrawSingleCharacterWithFeaturesMultipleCalls
     * @tc.desc      : testCanvasDrawSingleCharacterWithFeaturesMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawSingleCharacterWithFeaturesMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawSingleCharacterWithFeaturesMultipleCalls';
      const font = new drawing.Font();
      let canvas = new drawing.Canvas(pixel);
      for(let i = 0; i < 20; i++) {
        font.setSize(Math.random() * 10);
        let fontFeatures : Array<drawing.FontFeature> = [];
        fontFeatures.push({name: 'calt', value: Math.random() * 100});
        try {
          canvas.drawSingleCharacterWithFeatures("你", font, Math.random() * 100, Math.random() * 100, fontFeatures);
          console.info(msg + `drawSingleCharacterWithFeatures step: ${i} success `);
        } catch (e) {
          console.info(msg + `drawSingleCharacterWithFeatures  errorCode is:  ${e.code} + errormsg is: ${e.message} step: ${i}`);
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_5303
     * @tc.name      : testCanvasDrawSingleCharacterWithFeaturesAbnormal
     * @tc.desc      : testCanvasDrawSingleCharacterWithFeaturesAbnormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCanvasDrawSingleCharacterWithFeaturesAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawSingleCharacterWithFeaturesAbnormal';
      const font = new drawing.Font();
      let canvas = new drawing.Canvas(pixel);
      font.setSize(50);
      let fontFeatures : Array<drawing.FontFeature> = [];
      fontFeatures.push({name: 'calt', value: 42});
      try {
        canvas.drawSingleCharacterWithFeatures("", font, 0, 0, fontFeatures);
        console.info(msg + `drawSingleCharacterWithFeatures 1 success `);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
      try {
        canvas.drawSingleCharacterWithFeatures("As", font, 100, 100, fontFeatures);
        console.info(msg + `drawSingleCharacterWithFeatures 2 success `);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawSingleCharacterWithFeatures 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(25900001);
      }
    })
  })
}