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

export default function drawingTsCanvasPart8Test() {
  describe('DrawingTsCanvasPart8Test', () => {
    let pixel: image.PixelMap | undefined;
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
     * @tc.name   testCanvasDrawVerticesNormal1Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_5400
     * @tc.desc   testCanvasDrawVerticesNormal1Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawVerticesNormal1Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testCanvasDrawVerticesNormal1Static';
      let canvas = new drawing.Canvas(pixel!);
      let pointsArray = new Array<common2D.Point>();
      const point1: common2D.Point = { x: 100.0, y: 100.0 };
      const point2: common2D.Point = { x: 200.0, y: 100.0 };
      const point3: common2D.Point = { x: 150.0, y: 200.0 };
      pointsArray.push(point1);
      pointsArray.push(point2);
      pointsArray.push(point3);
      let texsArray = new Array<common2D.Point>();
      const texs1: common2D.Point = { x: 0.0, y: 0.0 };
      const texs2: common2D.Point = { x: 1.0, y: 0.0 };
      const texs3: common2D.Point = { x: 0.5, y: 1.0 };
      texsArray.push(texs1);
      texsArray.push(texs2);
      texsArray.push(texs3);
      const colors:Array<int> = [0xFFFF0000.toInt(), 0xFF00FF00.toInt(), 0xFF0000FF.toInt()];
      const indices:Array<int> = [0, 1, 2];
      try {
        canvas.drawVertices(drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE, 3, pointsArray, texsArray, colors, 3, indices,drawing.BlendMode.SRC);
        console.log(msg + "drawVertices 1 success")
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawVertices 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawVertices(drawing.VertexMode.TRIANGLES_VERTEXMODE, 3, pointsArray, texsArray, colors, 3, indices,drawing.BlendMode.SRC);
        console.log(msg + "drawVertices 2 success")
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawVertices 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawVertices(drawing.VertexMode.TRIANGLESFAN_VERTEXMODE, 3, pointsArray, texsArray, colors, 3, indices,drawing.BlendMode.SRC);
        console.log(msg + "drawVertices 3 success")
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawVertices 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawVerticesNormal2Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_5401
     * @tc.desc   testCanvasDrawVerticesNormal2Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCanvasDrawVerticesNormal2Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg = 'testCanvasDrawVerticesNormal2Static';
      let canvas = new drawing.Canvas(pixel!);
      let pointsArray = new Array<common2D.Point>();
      const point1: common2D.Point = { x: 100.0, y: 100.0 };
      const point2: common2D.Point = { x: 200.0, y: 100.0 };
      const point3: common2D.Point = { x: 150.0, y: 200.0 };
      const point4: common2D.Point = { x: 350.0, y: 400.0 };
      const point5: common2D.Point = { x: 280.0, y: 700.0 };
      pointsArray.push(point1);
      pointsArray.push(point2);
      pointsArray.push(point3);
      pointsArray.push(point4);
      pointsArray.push(point5);
      let texsArray = new Array<common2D.Point>();
      const texs1: common2D.Point = { x: 0.0, y: 0.0 };
      const texs2: common2D.Point = { x: 1.0, y: 0.0 };
      const texs3: common2D.Point = { x: 0.5, y: 1.0 };
      const texs4: common2D.Point = { x: 4.5, y: 1.6 };
      const texs5: common2D.Point = { x: 10.5, y: 1.36 };
      texsArray.push(texs1);
      texsArray.push(texs2);
      texsArray.push(texs3);
      texsArray.push(texs4);
      texsArray.push(texs5);
      const colors:Array<int>  = [0xFFFF0000.toInt(), 0xFF00FF00.toInt(), 0xFF0000FF.toInt(), 0xFF00FF00.toInt(), 0xFF0000FF.toInt()];
      const indices:Array<int> = [0, 1, 2];
      try {
        canvas.drawVertices(drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE, 5, pointsArray, texsArray, colors, 3, indices,drawing.BlendMode.SRC);
        console.log(msg + "drawVertices 1 success")
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawVertices 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawVertices(drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE, 5, pointsArray, texsArray, null, 3, indices,drawing.BlendMode.SRC);
        console.log(msg + "drawVertices 2 success")
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawVertices 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawVertices(drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE, 5, pointsArray, null, colors, 3, indices,drawing.BlendMode.SRC);
        console.log(msg + "drawVertices 3 success")
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawVertices 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawVertices(drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE, 5, pointsArray, null, null, 3, indices,drawing.BlendMode.SRC);
        console.log(msg + "drawVertices 4 success")
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawVertices 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawVerticesNormal3Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_5402
     * @tc.desc   testCanvasDrawVerticesNormal3Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCanvasDrawVerticesNormal3Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, (): void => {
      const msg = 'testCanvasDrawVerticesNormal3Static';
      let canvas = new drawing.Canvas(pixel!);
      let pointsArray = new Array<common2D.Point>();
      const point1: common2D.Point = { x: 100.0, y: 100.0 };
      const point2: common2D.Point = { x: 200.0, y: 100.0 };
      const point3: common2D.Point = { x: 150.0, y: 200.0 };
      const point4: common2D.Point = { x: 350.0, y: 400.0 };
      const point5: common2D.Point = { x: 280.0, y: 700.0 };
      pointsArray.push(point1);
      pointsArray.push(point2);
      pointsArray.push(point3);
      pointsArray.push(point4);
      pointsArray.push(point5);
      let texsArray = new Array<common2D.Point>();
      const texs1: common2D.Point = { x: 0.0, y: 0.0 };
      const texs2: common2D.Point = { x: 1.0, y: 0.0 };
      const texs3: common2D.Point = { x: 0.5, y: 1.0 };
      const texs4: common2D.Point = { x: 4.5, y: 1.6 };
      const texs5: common2D.Point = { x: 10.5, y: 1.36 };
      texsArray.push(texs1);
      texsArray.push(texs2);
      texsArray.push(texs3);
      texsArray.push(texs4);
      texsArray.push(texs5);
      const colors:Array<int>  = [0xFFFF0000.toInt(), 0xFF00FF00.toInt(), 0xFF0000FF.toInt(), 0xFF00FF00.toInt(), 0xFF0000FF.toInt()];
      const indices:Array<int> = [0, 1, 2, 10, 2];
      try {
        canvas.drawVertices(drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE, 5, pointsArray, texsArray, colors, 0, null,drawing.BlendMode.SRC);
        console.log(msg + "drawVertices 1 success")
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawVertices 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawVertices(drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE, 5, pointsArray, texsArray, colors, 5, null,drawing.BlendMode.SRC);
        console.log(msg + "drawVertices 2 success")
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawVertices 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        canvas.drawVertices(drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE, 5, pointsArray, texsArray, colors, 5, indices,drawing.BlendMode.SRC);
        console.log(msg + "drawVertices 3 success")
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawVertices 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testCanvasDrawVerticesNormal4Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_5403
     * @tc.desc   testCanvasDrawVerticesNormal4Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasDrawVerticesNormal4Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (): void => {
      const msg = 'testCanvasDrawVerticesNormal4Static';
      let canvas = new drawing.Canvas(pixel!);
      let pointsArray = new Array<common2D.Point>();
      const point1: common2D.Point = { x: 100.0, y: 100.0 };
      const point2: common2D.Point = { x: 200.0, y: 100.0 };
      const point3: common2D.Point = { x: 150.0, y: 200.0 };
      const point4: common2D.Point = { x: 350.0, y: 400.0 };
      const point5: common2D.Point = { x: 280.0, y: 700.0 };
      pointsArray.push(point1);
      pointsArray.push(point2);
      pointsArray.push(point3);
      pointsArray.push(point4);
      pointsArray.push(point5);
      let texsArray = new Array<common2D.Point>();
      const texs1: common2D.Point = { x: 0.0, y: 0.0 };
      const texs2: common2D.Point = { x: 1.0, y: 0.0 };
      const texs3: common2D.Point = { x: 0.5, y: 1.0 };
      const texs4: common2D.Point = { x: 4.5, y: 1.6 };
      const texs5: common2D.Point = { x: 10.5, y: 1.36 };
      texsArray.push(texs1);
      texsArray.push(texs2);
      texsArray.push(texs3);
      texsArray.push(texs4);
      texsArray.push(texs5);
      const colors:Array<int>  = [0xFFFF0000.toInt(), 0xFF00FF00.toInt(), 0xFF0000FF.toInt(), 0xFF00FF00.toInt(), 0xFF0000FF.toInt()];
      const indices:Array<int> = [0, 1, 2, 10, 2];
      let itemList: drawing.BlendMode[] = [
        drawing.BlendMode.CLEAR,
        drawing.BlendMode.SRC,
        drawing.BlendMode.DST,
        drawing.BlendMode.SRC_OVER,
        drawing.BlendMode.DST_OVER,
        drawing.BlendMode.SRC_IN,
        drawing.BlendMode.DST_IN,
        drawing.BlendMode.SRC_OUT,
        drawing.BlendMode.DST_OUT,
        drawing.BlendMode.SRC_ATOP,
        drawing.BlendMode.DST_ATOP,
        drawing.BlendMode.XOR,
        drawing.BlendMode.PLUS,
        drawing.BlendMode.MODULATE,
        drawing.BlendMode.SCREEN,
        drawing.BlendMode.OVERLAY,
        drawing.BlendMode.DARKEN,
        drawing.BlendMode.LIGHTEN,
        drawing.BlendMode.COLOR_DODGE,
        drawing.BlendMode.COLOR_BURN,
        drawing.BlendMode.HARD_LIGHT,
        drawing.BlendMode.SOFT_LIGHT,
        drawing.BlendMode.DIFFERENCE,
        drawing.BlendMode.EXCLUSION,
        drawing.BlendMode.MULTIPLY,
        drawing.BlendMode.HUE,
        drawing.BlendMode.SATURATION,
        drawing.BlendMode.COLOR,
        drawing.BlendMode.LUMINOSITY
      ];
      for (let i = 0; i < 28; i++) {
        try {
          canvas.drawVertices(drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE, 5, pointsArray, texsArray, colors, 0, null, itemList[i]);
          console.log(msg + "drawVertices success step: " + i)
          console.log(msg + "drawVertices success drawing.BlendMode: " + itemList[i])
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + `drawVertices errorCode is:  ${e.code} + errormsg is: ${e.message} step: ${i}`);
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.name   testCanvasDrawVerticesMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_5406
     * @tc.desc   testCanvasDrawVerticesMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawVerticesMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testCanvasDrawVerticesMultipleCallsStatic';
      let canvas = new drawing.Canvas(pixel!);
      let pointsArray = new Array<common2D.Point>();
      const point1: common2D.Point = { x: 100.0, y: 100.0 };
      const point2: common2D.Point = { x: 200.0, y: 100.0 };
      const point3: common2D.Point = { x: 150.0, y: 200.0 };
      pointsArray.push(point1);
      pointsArray.push(point2);
      pointsArray.push(point3);
      let texsArray = new Array<common2D.Point>();
      const texs1: common2D.Point = { x: 0.0, y: 0.0 };
      const texs2: common2D.Point = { x: 1.0, y: 0.0 };
      const texs3: common2D.Point = { x: 0.5, y: 1.0 };
      texsArray.push(texs1);
      texsArray.push(texs2);
      texsArray.push(texs3);
      const colors:Array<int>  = [0xFFFF0000.toInt(), 0xFF00FF00.toInt(), 0xFF0000FF.toInt()];
      const indices:Array<int> = [0, 1, 2];
      let itemList: drawing.BlendMode[] = [
        drawing.BlendMode.CLEAR,
        drawing.BlendMode.SRC,
        drawing.BlendMode.DST,
        drawing.BlendMode.SRC_OVER,
        drawing.BlendMode.DST_OVER,
        drawing.BlendMode.SRC_IN,
        drawing.BlendMode.DST_IN,
        drawing.BlendMode.SRC_OUT,
        drawing.BlendMode.DST_OUT,
        drawing.BlendMode.SRC_ATOP,
        drawing.BlendMode.DST_ATOP,
        drawing.BlendMode.XOR,
        drawing.BlendMode.PLUS,
        drawing.BlendMode.MODULATE,
        drawing.BlendMode.SCREEN,
        drawing.BlendMode.OVERLAY,
        drawing.BlendMode.DARKEN,
        drawing.BlendMode.LIGHTEN,
        drawing.BlendMode.COLOR_DODGE,
        drawing.BlendMode.COLOR_BURN,
        drawing.BlendMode.HARD_LIGHT,
        drawing.BlendMode.SOFT_LIGHT,
        drawing.BlendMode.DIFFERENCE,
        drawing.BlendMode.EXCLUSION,
        drawing.BlendMode.MULTIPLY,
        drawing.BlendMode.HUE,
        drawing.BlendMode.SATURATION,
        drawing.BlendMode.COLOR,
        drawing.BlendMode.LUMINOSITY
      ];
      let itemList2: drawing.VertexMode[] = [
        drawing.VertexMode.TRIANGLES_VERTEXMODE,
        drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE,
        drawing.VertexMode.TRIANGLESFAN_VERTEXMODE,
      ];
      for (let i = 0; i < 20; i++) {
        const randomEnum = Math.floor(29 * Math.random()).toInt();
        const randomEnum2 = Math.floor(3 * Math.random()).toInt();
        try {
          canvas.drawVertices(itemList2[randomEnum2], 3, pointsArray, texsArray, colors, 3, indices,itemList[randomEnum]);
          console.log(msg + "drawVertices success step: " + i)
          console.log(msg + "drawVertices success drawing.BlendMode: " + itemList[randomEnum]);
          console.log(msg + "drawVertices success drawing.VertexMode: " + itemList2[randomEnum2]);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + `drawVertices errorCode is:  ${e.code} + errormsg is: ${e.message} step: ${i}`);
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.name   testCanvasDrawVerticesAbnormal1Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_5407
     * @tc.desc   testCanvasDrawVerticesAbnormal1Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawVerticesAbnormal1Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testCanvasDrawVerticesAbnormal1Static';
      let canvas = new drawing.Canvas(pixel!);
      let pointsArray = new Array<common2D.Point>();
      const point1: common2D.Point = { x: 100.0, y: 100.0 };
      const point2: common2D.Point = { x: 200.0, y: 100.0 };
      const point3: common2D.Point = { x: 150.0, y: 200.0 };
      pointsArray.push(point1);
      pointsArray.push(point2);

      let texsArray = new Array<common2D.Point>();
      const texs1: common2D.Point = { x: 0.0, y: 0.0 };
      const texs2: common2D.Point = { x: 1.0, y: 0.0 };
      const texs3: common2D.Point = { x: 0.5, y: 1.0 };
      texsArray.push(texs1);
      texsArray.push(texs2);
      const colors:Array<int>  = [0xFFFF0000.toInt(), 0xFF00FF00.toInt(), 0xFF0000FF.toInt()];
      const indices:Array<int> = [0, 1, 2];
      try {
        canvas.drawVertices(drawing.VertexMode.TRIANGLES_VERTEXMODE, -1, pointsArray, texsArray, colors, 3, indices,drawing.BlendMode.SRC);
        console.log(msg + "drawVertices 2 success ")
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawVertices 2 errorCode is:  ${e.code} + errormsg is: ${e.message} `);
        expect(e.code).assertEqual(25900001);
      }
      try {
        canvas.drawVertices(drawing.VertexMode.TRIANGLES_VERTEXMODE, 0, pointsArray, null, null, 3, indices,drawing.BlendMode.SRC);
        console.log(msg + "drawVertices 3 success ")
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawVertices 3 errorCode is:  ${e.code} + errormsg is: ${e.message} `);
        expect(e.code).assertEqual(25900001);
      }
      try {
        canvas.drawVertices(drawing.VertexMode.TRIANGLES_VERTEXMODE, 2, pointsArray, null, null, 3, indices,drawing.BlendMode.SRC);
        console.log(msg + "drawVertices 4 success ")
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawVertices 4 errorCode is:  ${e.code} + errormsg is: ${e.message} `);
        expect(e.code).assertEqual(25900001);
      }
      pointsArray.push(point3);
      texsArray.push(texs3);
      try {
        canvas.drawVertices(drawing.VertexMode.TRIANGLES_VERTEXMODE, 3, [], texsArray, colors, 3, indices,drawing.BlendMode.SRC);
        console.log(msg + "drawVertices 5 success ")
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawVertices 5 errorCode is:  ${e.code} + errormsg is: ${e.message} `);
        expect(e.code).assertEqual(25900001);
      }
    })
    /**
     * @tc.name   testCanvasDrawVerticesAbnormal2Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_5408
     * @tc.desc   testCanvasDrawVerticesAbnormal2Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawVerticesAbnormal2Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testCanvasDrawVerticesAbnormal2Static';
      let canvas = new drawing.Canvas(pixel!);
      let pointsArray = new Array<common2D.Point>();
      const point1: common2D.Point = { x: 100.0, y: 100.0 };
      const point2: common2D.Point = { x: 200.0, y: 100.0 };
      const point3: common2D.Point = { x: 150.0, y: 200.0 };
      const point4: common2D.Point = { x: 350.0, y: 400.0 };
      const point5: common2D.Point = { x: 280.0, y: 700.0 };
      pointsArray.push(point1);
      pointsArray.push(point2);
      pointsArray.push(point3);
      pointsArray.push(point4);
      let texsArray = new Array<common2D.Point>();
      const texs1: common2D.Point = { x: 0.0, y: 0.0 };
      const texs2: common2D.Point = { x: 1.0, y: 0.0 };
      const texs3: common2D.Point = { x: 0.5, y: 1.0 };
      const texs4: common2D.Point = { x: 4.5, y: 1.6 };
      const texs5: common2D.Point = { x: 10.5, y: 1.36 };
      texsArray.push(texs1);
      texsArray.push(texs2);
      texsArray.push(texs3);
      texsArray.push(texs4);
      texsArray.push(texs5);
      const colors:Array<int>  = [0xFFFF0000.toInt(), 0xFF00FF00.toInt(), 0xFF0000FF.toInt(), 0xFF00FF00.toInt(), 0xFF0000FF.toInt()];
      const indices:Array<int> = [0, 1, 2];
      try {
        canvas.drawVertices(drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE, 5, pointsArray, texsArray, colors, 3, indices,drawing.BlendMode.SRC);
        console.log(msg + "drawVertices 1 success ")
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawVertices 1 errorCode is:  ${e.code} + errormsg is: ${e.message} `);
        expect(e.code).assertEqual(25900001);
      }
      let texsArray1 = new Array<common2D.Point>();
      texsArray1.push(texs1);
      texsArray1.push(texs2);
      texsArray1.push(texs3);
      texsArray1.push(texs4);
      pointsArray.push(point5);
      try {
        canvas.drawVertices(drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE, 5, pointsArray, texsArray1, colors, 3, indices,drawing.BlendMode.SRC);
        console.log(msg + "drawVertices 2 success ")
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawVertices 2 errorCode is:  ${e.code} + errormsg is: ${e.message} `);
        expect(e.code).assertEqual(25900001);
      }
      const colors1:Array<int> = [0xFFFF0000.toInt(), 0xFF00FF00.toInt(), 0xFF0000FF.toInt(), 0xFF00FF00.toInt()];
      try {
        canvas.drawVertices(drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE, 5, pointsArray, texsArray, colors1, 3, indices,drawing.BlendMode.SRC);
        console.log(msg + "drawVertices 3 success ")
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawVertices 3 errorCode is:  ${e.code} + errormsg is: ${e.message} `);
        expect(e.code).assertEqual(25900001);
      }
    })
    /**
     * @tc.name   testCanvasDrawVerticesAbnormal3Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_CANVAS_STATIC_5409
     * @tc.desc   testCanvasDrawVerticesAbnormal3Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawVerticesAbnormal3Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testCanvasDrawVerticesAbnormal3Static';
      let canvas = new drawing.Canvas(pixel!);
      let pointsArray = new Array<common2D.Point>();
      const point1: common2D.Point = { x: 100.0, y: 100.0 };
      const point2: common2D.Point = { x: 200.0, y: 100.0 };
      const point3: common2D.Point = { x: 150.0, y: 200.0 };
      pointsArray.push(point1);
      pointsArray.push(point2);
      pointsArray.push(point3);
      let texsArray = new Array<common2D.Point>();
      const texs1: common2D.Point = { x: 0.0, y: 0.0 };
      const texs2: common2D.Point = { x: 1.0, y: 0.0 };
      const texs3: common2D.Point = { x: 0.5, y: 1.0 };
      texsArray.push(texs1);
      texsArray.push(texs2);
      texsArray.push(texs3);
      const colors:Array<int>  = [0xFFFF0000.toInt(), 0xFF00FF00.toInt(), 0xFF0000FF.toInt()];
      const indices:Array<int> = [0, 1];
      try {
        canvas.drawVertices(drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE, 3, pointsArray, texsArray, colors, -1, null,drawing.BlendMode.SRC);
        console.log(msg + "drawVertices 1 success ")
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawVertices 1 errorCode is:  ${e.code} + errormsg is: ${e.message} `);
        expect(e.code).assertEqual(25900001);
      }
      try {
        canvas.drawVertices(drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE, 3, pointsArray, texsArray, colors, 2, indices,drawing.BlendMode.SRC);
        console.log(msg + "drawVertices 2 success ")
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawVertices 2 errorCode is:  ${e.code} + errormsg is: ${e.message} `);
        expect(e.code).assertEqual(25900001);
      }
      try {
        canvas.drawVertices(drawing.VertexMode.TRIANGLESFAN_VERTEXMODE, 3, pointsArray, texsArray, colors, 3, indices,drawing.BlendMode.SRC);
        console.log(msg + "drawVertices 3 success ")
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawVertices 3 errorCode is:  ${e.code} + errormsg is: ${e.message} `);
        expect(e.code).assertEqual(25900001);
      }
    })
  })
}