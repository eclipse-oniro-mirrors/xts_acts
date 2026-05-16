/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { getEnumCount } from './Util.test';
import { BusinessError } from '@ohos.base';

export default function drawingTsCanvasPart7Test() {
  describe('DrawingTsCanvasPart7Test', () => {
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
     * @tc.name   testCanvasDrawQuickRejectPathNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_4800
     * @tc.desc   testCanvasDrawQuickRejectPathNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasDrawQuickRejectPathNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testCanvasDrawQuickRejectPathNormalStatic';
      const path = new drawing.Path();
      let canvas = new drawing.Canvas(pixel);
      path.moveTo(-100,-100);
      path.lineTo(-50, -50);
      try {
        let isSuccess1 = canvas.quickRejectPath(path);
        expect(isSuccess1).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `quickRejectPath 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      path.moveTo(0, 100);
      path.lineTo(-100, -100);
      try {
        let isSuccess2 = canvas.quickRejectPath(path);
        expect(isSuccess2).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
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
        e = e as BusinessError;
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
        e = e as BusinessError;
        console.info(msg + `quickRejectPath 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      let isSuccess = true;
      path.lineTo(200, 200);
      try {
        isSuccess = canvas.quickRejectPath(path);
        expect(isSuccess).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
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
        e = e as BusinessError;
        console.info(msg + `quickRejectPath 6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawQuickRejectPathMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_4802
     * @tc.desc   testCanvasDrawQuickRejectPathMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawQuickRejectPathMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawQuickRejectPathMultipleCallsStatic';
      const path = new drawing.Path();
      let canvas = new drawing.Canvas(pixel);
      for(let i = 0; i < 20; i++) {
        path.moveTo(100 + i * 0.01, 100 + i * 0.01);
        path.lineTo(150 + i * 0.01, 50 + i * 0.01);
        try {
          let isSuccess = canvas.quickRejectPath(path);
          expect(isSuccess).assertEqual(false);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + `quickRejectPath ${i} errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.name   testCanvasDrawQuickRejectRectNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_4900
     * @tc.desc   testCanvasDrawQuickRejectRectNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testCanvasDrawQuickRejectRectNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
      const msg = 'testCanvasDrawQuickRejectRectNormalStatic';
      const path = new drawing.Path();
      let canvas = new drawing.Canvas(pixel);
      let rectQuire: common2D.Rect = { left: -150, top: 10, right: -100, bottom: 100 };
      try {
        let isSuccess1 = canvas.quickRejectRect(rectQuire);
        expect(isSuccess1).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `quickRejectRect 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      rectQuire = { left: -100, top: -100, right: 10000, bottom: 10000 };
      try {
        let isSuccess2 = canvas.quickRejectRect(rectQuire);
        expect(isSuccess2).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `quickRejectRect 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      rectQuire = { left: 0, top: 0, right: 0, bottom: 0 };
      try {
        let isSuccess3 = canvas.quickRejectRect(rectQuire);
        expect(isSuccess3).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `quickRejectRect 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      rectQuire = { left: -100, top: -100, right: 0, bottom: 0 };
      try {
        let isSuccess4 = canvas.quickRejectRect(rectQuire);
        expect(isSuccess4).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
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
        e = e as BusinessError;
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
        e = e as BusinessError;
        console.info(msg + `quickRejectRect 6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      canvas.restore();
      rectQuire = { left: -100, top: 0, right: 100, bottom: 100 };
      try {
        let isSuccess7 = canvas.quickRejectRect(rectQuire);
        expect(isSuccess7).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `quickRejectRect 7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      };
      rectQuire = { left: 50, top: 50, right: 100, bottom: 100 };
      try {
        let isSuccess8 = canvas.quickRejectRect(rectQuire);
        expect(isSuccess8).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `quickRejectRect 8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      };
    })
    /**
     * @tc.name   testCanvasDrawQuickRejectRectMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_4902
     * @tc.desc   testCanvasDrawQuickRejectRectMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawQuickRejectRectMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawQuickRejectRectMultipleCallsStatic';
      let canvas = new drawing.Canvas(pixel);
      for(let i = 0; i < 20; i++) {
        let rect: common2D.Rect = {
            left: 100 + i * 0.01, top: 100 + i * 0.01, right: 300 + i * 0.01, bottom: 300 + i * 0.01
          };
        try {
          let isSuccess = canvas.quickRejectRect(rect);
          expect(isSuccess).assertEqual(false);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + `quickRejectPath ${i} errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.name   testCanvasDrawQuickRejectRectMaxStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_4903
     * @tc.desc   testCanvasDrawQuickRejectRectMaxStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawQuickRejectRectMaxStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawQuickRejectRectMaxStatic';
      let canvas = new drawing.Canvas(pixel);
      let rect: common2D.Rect = {
        left: Number.MAX_VALUE, top: Number.MAX_VALUE, right: Number.MAX_VALUE + 100, bottom: Number.MAX_VALUE + 100
      };
      try {
        let isSuccess1 = canvas.quickRejectRect(rect);
        expect(isSuccess1).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
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
        e = e as BusinessError;
        console.info(msg + `quickRejectPath 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawArcWithCenterNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_5000
     * @tc.desc   testCanvasDrawArcWithCenterNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawArcWithCenterNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawArcWithCenterNormalStatic';
      let canvas = new drawing.Canvas(pixel);
      let rect: common2D.Rect = {
        left: 100, top: 20, right: 120, bottom: 120
      };
      try {
        canvas.drawArcWithCenter(rect, 80, 280, true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `quickRejectPath 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      rect = {
        left: 100, top: 20, right: 300, bottom: 120
      };
      try {
        canvas.drawArcWithCenter(rect, 0, 100, true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawArcWithCenter 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      rect = {
        left: 350, top: 20, right: 450, bottom: 120
      };
      try {
        canvas.drawArcWithCenter(rect, 80, 280, false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawArcWithCenter 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      rect = {
        left: 425, top: 20, right: 525, bottom: 120
      };
      try {
        canvas.drawArcWithCenter(rect, 0, 0, true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawArcWithCenter 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawArcWithCenter(rect, 0, 0, false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawArcWithCenter 5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawArcWithCenter(rect, 0, -90, true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawArcWithCenter 6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawArcWithCenter(rect, 0, 90, false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawArcWithCenter 7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawArcWithCenter(rect, 0, 360, false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawArcWithCenter 8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawArcWithCenter(rect, -90, 0, true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawArcWithCenter 9 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawArcWithCenter(rect, 360, 0, true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawArcWithCenter 10 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawArcWithCenter(rect, -90, -200, false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawArcWithCenter 11 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawArcWithCenter(rect, 90, 200, true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawArcWithCenter 12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawArcWithCenter(rect, 0, 380, true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawArcWithCenter 13 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawArcWithCenter(rect, 380, 60, false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawArcWithCenter 14 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawArcWithCenter(rect, 10000, 10000, true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawArcWithCenter 14 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawArcWithCenterMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_5002
     * @tc.desc   testCanvasDrawArcWithCenterMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawArcWithCenterMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawArcWithCenterMultipleCallsStatic';
      const path = new drawing.Path();
      let canvas = new drawing.Canvas(pixel);
      for(let i = 0; i < 20; i++) {
        let rect: common2D.Rect = {
          left: 100 + i * 0.01, top: 100 + i * 0.01, right: 300 + i * 0.01, bottom: 300 + i * 0.01
        };
        try {
          canvas.drawArcWithCenter(rect, 0, 180, true);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + `drawArcWithCenter ${i} errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.name   testCanvasDrawArcWithCenterMaxStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_5003
     * @tc.desc   testCanvasDrawArcWithCenterMaxStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawArcWithCenterMaxStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawArcWithCenterMaxStatic';
      const path = new drawing.Path();
      let canvas = new drawing.Canvas(pixel);
      let rect: common2D.Rect = {
        left: Number.MAX_VALUE, top: Number.MAX_VALUE, right: Number.MAX_VALUE + 100, bottom: Number.MAX_VALUE + 100
      };
      try {
        canvas.drawArcWithCenter(rect, 0, 180, true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawArcWithCenter 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      rect = {
        left: -Number.MAX_VALUE, top: -Number.MAX_VALUE, right: Number.MAX_VALUE + 100, bottom: Number.MAX_VALUE + 100
      };
      try {
        canvas.drawArcWithCenter(rect, 0, 180, true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawArcWithCenter 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawImageNineNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_5100
     * @tc.desc   testCanvasDrawImageNineNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCanvasDrawImageNineNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testCanvasDrawImageNineNormalStatic';
      let canvas = new drawing.Canvas(pixel);
      let center: common2D.Rect = { left: 100, top: 100, right: 900, bottom: 1500 };
      let dst: common2D.Rect = { left: -50, top: -50, right: 2000, bottom: 1600 };
      try {
        canvas.drawImageNine(pixel, center, dst, drawing.FilterMode.FILTER_MODE_NEAREST);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawImageNine 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      center = { left: -100, top: -100, right: 50, bottom: 100 };
      dst = { left: 0, top: 0, right: 200, bottom: 200 };
      try {
        canvas.drawImageNine(pixel, center, dst, drawing.FilterMode.FILTER_MODE_LINEAR);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawImageNine 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      center = { left: 200, top: 200, right: 100000, bottom: 100000 };
      dst = { left: 0, top: 0, right: 200, bottom: 200 };
      try {
        canvas.drawImageNine(pixel, center, dst, drawing.FilterMode.FILTER_MODE_LINEAR);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawImageNine 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      center = { left: 100, top: 100, right: 200, bottom: 200 };
      dst = { left: 0, top: 0, right: 800, bottom: 800 };
      try {
        canvas.drawImageNine(pixel, center, dst, drawing.FilterMode.FILTER_MODE_NEAREST);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawImageNine 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      center = { left: 10.1, top: 10.1, right: 300.1, bottom: 300.1 };
      dst = { left: 0, top: 0, right: 50.1, bottom: 50.1 };
      try {
        canvas.drawImageNine(pixel, center, dst, drawing.FilterMode.FILTER_MODE_LINEAR);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawImageNine 5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawImageNineMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_5102
     * @tc.desc   testCanvasDrawImageNineMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawImageNineMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawImageNineMultipleCallsStatic';
      const path = new drawing.Path();
      let canvas = new drawing.Canvas(pixel);
      for(let i = 0; i < 20; i++) {
        let center: common2D.Rect = { left: 100 + i * 0.01, top: 100 + i * 0.01, right: 900 + i * 0.01, bottom: 1500 + i * 0.01 };
        let dst: common2D.Rect = { left: -50 + i * 0.01, top: -50 + i * 0.01, right: 2000 + i * 0.01, bottom: 1600 + i * 0.01 };
        try {
          canvas.drawImageNine(pixel, center, dst, drawing.FilterMode.FILTER_MODE_LINEAR);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + `drawImageNine ${i} errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.name   testCanvasDrawImageNineMaxStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_5103
     * @tc.desc   testCanvasDrawImageNineMaxStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawImageNineMaxStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawImageNineMaxStatic';
      const path = new drawing.Path();
      let canvas = new drawing.Canvas(pixel);
      let center: common2D.Rect = {
        left: Number.MAX_VALUE, top: Number.MAX_VALUE, right: Number.MAX_VALUE + 100, bottom: Number.MAX_VALUE + 100
      };
      let dst: common2D.Rect = { left: -50 , top: -50 , right: 2000 , bottom: 1600};
      try {
        canvas.drawImageNine(pixel, center, dst, drawing.FilterMode.FILTER_MODE_LINEAR);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawImageNine 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      center = {
        left: -Number.MAX_VALUE, top: -Number.MAX_VALUE, right: Number.MAX_VALUE + 100, bottom: Number.MAX_VALUE + 100
      };
      try {
        canvas.drawImageNine(pixel, center, dst, drawing.FilterMode.FILTER_MODE_LINEAR);
      } catch (e) {
        e = e as BusinessError;
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
        e = e as BusinessError;
        console.info(msg + `drawImageNine 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      dst = {
        left: -Number.MAX_VALUE, top: -Number.MAX_VALUE, right: Number.MAX_VALUE + 100, bottom: Number.MAX_VALUE + 100
      };
      try {
        canvas.drawImageNine(pixel, center, dst, drawing.FilterMode.FILTER_MODE_LINEAR);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawImageNine 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawImageLatticeNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_5200
     * @tc.desc   testCanvasDrawImageLatticeNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawImageLatticeNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCanvasDrawImageLatticeNormalStatic';
      let canvas = new drawing.Canvas(pixel);
      let fXDivs: Array<int> = [80, 150];
      let fYDivs: Array<int> = [80, 150];
      let fXCount = 2
      let fYCount = 2
      let lattice = drawing.Lattice.createImageLattice(fXDivs, fYDivs, fXCount, fYCount, null, null, null) as drawing.Lattice;
      let dst: common2D.Rect = { left: 0, top: 0, right: 200, bottom: 200 };
      try {
        canvas.drawImageLattice(pixel, lattice, dst, drawing.FilterMode.FILTER_MODE_NEAREST);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawImageLattice 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      let fXDivs1: Array<int> = [310, 320, 340, 360, 400];
      let fYDivs1: Array<int> = [310, 320, 340, 360, 400];
      fXCount = 5;
      fYCount = 5;
      lattice = drawing.Lattice.createImageLattice(fXDivs1, fYDivs1, fXCount, fYCount, null, null, null) as drawing.Lattice;
      dst = { left: 225, top:0, right: 425, bottom: 200 };
      try {
        canvas.drawImageLattice(pixel, lattice, dst, drawing.FilterMode.FILTER_MODE_LINEAR);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawImageLattice 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      let bound1: common2D.Rect = {
        left: 700,
        right: 800,
        top: 700,
        bottom: 800
      };
      let fXDivs2: Array<int> = [200, 400];
      let fYDivs2: Array<int> = [200, 400];
      fXCount = 2;
      fYCount = 2;
      lattice = drawing.Lattice.createImageLattice(fXDivs2, fYDivs2, fXCount, fYCount, bound1, null, null) as drawing.Lattice;
      dst = { left: 450, top:0, right: 650, bottom: 200 };
      try {
        canvas.drawImageLattice(pixel, lattice, dst, drawing.FilterMode.FILTER_MODE_LINEAR);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawImageLattice 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      dst = { left: 10.2, top: 550.1, right: 300.1, bottom: 850.1 };
      try {
        canvas.drawImageLattice(pixel, lattice, dst, drawing.FilterMode.FILTER_MODE_LINEAR);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawImageLattice 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      dst = { left: -10, top: -60, right: 300000, bottom: 300000 };
      try {
        canvas.drawImageLattice(pixel, lattice, dst, drawing.FilterMode.FILTER_MODE_LINEAR);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawImageLattice 5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawImageLatticeMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_5202
     * @tc.desc   testCanvasDrawImageLatticeMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasDrawImageLatticeMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testCanvasDrawImageLatticeMultipleCallsStatic';
      const path = new drawing.Path();
      let canvas = new drawing.Canvas(pixel);
      for(let i = 0; i < 20; i++) {
        let xDivs: Array<int> = [80, 160, 320, 560];
        let yDivs: Array<int> = [80, 160, 320, 560];
        let xCount = 4;
        let yCount = 4;
        let lattice = drawing.Lattice.createImageLattice(xDivs, yDivs, xCount, yCount, null, null, null) as drawing.Lattice;
        let dst: common2D.Rect = { left: 0+ i * 0.01, top: 0+ i * 0.01, right: 200+ i * 0.01, bottom: 200+ i * 0.01 };
        try {
          canvas.drawImageLattice(pixel, lattice, dst, drawing.FilterMode.FILTER_MODE_LINEAR);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + `drawImageLattice 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.name   testCanvasDrawImageLatticeMaxStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_5203
     * @tc.desc   testCanvasDrawImageLatticeMaxStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasDrawImageLatticeMaxStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testCanvasDrawImageLatticeMaxStatic';
      const path = new drawing.Path();
      let canvas = new drawing.Canvas(pixel);
      let xDivs: Array<int> = [80, 160, 320, 560];
      let yDivs: Array<int> = [80, 160, 320, 560];
      let xCount = 4;
      let yCount = 4;
      let lattice = drawing.Lattice.createImageLattice(xDivs, yDivs, xCount, yCount, null, null, null) as drawing.Lattice;
      let dst: common2D.Rect = {
        left: Number.MAX_VALUE, top: Number.MAX_VALUE, right: Number.MAX_VALUE + 100, bottom: Number.MAX_VALUE + 100
      };
      try {
        canvas.drawImageLattice(pixel, lattice, dst, drawing.FilterMode.FILTER_MODE_NEAREST);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawImageLattice 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      dst = {
        left: -Number.MAX_VALUE, top: -Number.MAX_VALUE, right: Number.MAX_VALUE + 100, bottom: Number.MAX_VALUE + 100
      };
      try {
        canvas.drawImageLattice(pixel, lattice, dst, drawing.FilterMode.FILTER_MODE_NEAREST);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawImageLattice 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
  })
}