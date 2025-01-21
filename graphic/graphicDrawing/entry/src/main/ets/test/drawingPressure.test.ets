/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import { RenderNode, DrawContext } from "@ohos.arkui.node"
import drawing from "@ohos.graphics.drawing"
import common2D from "@ohos.graphics.common2D"
import image from "@ohos.multimedia.image"
import { UiDriver, BY, ON, PointerMatrix } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';
import buffer from '@ohos.buffer';

export default function graphicDrawing(context, windowStage, abilityStorage) {
  describe('drawing_pressure_test', function () {
    console.log('describe graphic_drawing_test start!!!')

    function buttonClick(buttonText, msgStr) {
      console.info(msgStr + `case come in buttonClick fun`)
      return new Promise(async (resolve, reject) => {
        let driver = await UiDriver.create()
        console.info(msgStr + `case come in buttonClick fun 222`)
        console.info(msgStr + `driver is ${JSON.stringify(driver)}`)
        await sleep(1000)
        console.info(msgStr + `UiDriver start`)
        let button = null
        button = await driver.findComponent(BY.text(buttonText))
        console.info(msgStr + `button is ${JSON.stringify(button)}`)
        await sleep(1000)
        if (button) {
          console.info(msgStr + `button click begin`)
          await button.click()
          console.info(msgStr + `button click end`)
          resolve(msgStr + 'get button successed')
        } else {
          console.info(msgStr + `inter else: button is null`)
          reject(msgStr + 'get button failed')
        }
      })
    }

    async function sleep(time) {
      let timeoutId = null;
      let promise = new Promise(resolve => {
        timeoutId = setTimeout(() => {
          resolve('sleep finished');
        }, time);
      })
      let result = await promise;
      clearTimeout(timeoutId)
    }

    let pressureTestNum = 100;
    let blendModeArr = ['CLEAR', 'SRC', 'DST', 'SRC_OVER', 'DST_OVER', 'SRC_IN', 'DST_IN', 'SRC_OUT',
    'DST_OUT', 'SRC_ATOP', 'DST_ATOP', 'XOR', 'PLUS', 'MODULATE', 'SCREEN', 'OVERLAY', 'DARKEN',
    'LIGHTEN', 'COLOR_DODGE', 'COLOR_BURN', 'HARD_LIGHT', 'SOFT_LIGHT', 'DIFFERENCE', 'EXCLUSION',
    'MULTIPLY', 'HUE', 'SATURATION', 'COLOR', 'LUMINOSITY']
    let pixel;
    beforeAll(async function () {
      const color: ArrayBuffer = new ArrayBuffer(40000); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 100, width: 100
        }
      }
      pixel = await image.createPixelMap(color, opts);
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2650
     * @tc.name      : testPath_LineTo_PressureTest
     * @tc.desc      : Used to add a line segment from the last point of the path to the destination point
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPath_LineTo_PressureTest', 0, async function () {
      let msg = "testPath_LineTo_PressureTest"
      console.info(msg + 'begin');
      let path = new drawing.Path();
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          path.moveTo(10, 10);
        } catch (err) {
          console.info(msg + 'moveTo error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          path.lineTo(10, 15);
        } catch (err) {
          console.info(msg + 'lineTo error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          path.close();
        } catch (err) {
          console.info(msg + 'close error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2660
     * @tc.name      : testPath_ArcTo_PressureTest
     * @tc.desc      : Used to add an arc to a path
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPath_ArcTo_PressureTest', 0, async function () {
      let msg = "testPath_ArcTo_PressureTest"
      console.info(msg + 'begin');
      let path = new drawing.Path();
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          path.moveTo(10, 10);
        } catch (err) {
          console.info(msg + 'moveTo error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          path.arcTo(10, 15, 10, 10, 10, 10);
        } catch (err) {
          console.info(msg + 'arcTo error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          path.close();
        } catch (err) {
          console.info(msg + 'close error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2670
     * @tc.name      : testPath_QuadTo_PressureTest
     * @tc.desc      : Used to add a second order Bessel smooth curve from the last point of the path to the destination point
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPath_QuadTo_PressureTest', 0, async function () {
      let msg = "testPath_QuadTo_PressureTest"
      console.info(msg + 'begin');
      let path = new drawing.Path();
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          path.moveTo(10, 10);
        } catch (err) {
          console.info(msg + 'moveTo error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          path.quadTo(10, 15, 10, 10);
        } catch (err) {
          console.info(msg + 'quadTo error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          path.close();
        } catch (err) {
          console.info(msg + 'close error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2680
     * @tc.name      : testPath_CubicTo_PressureTest
     * @tc.desc      : Third order Bessel smooth curve
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPath_CubicTo_PressureTest', 0, async function () {
      let msg = "testPath_CubicTo_PressureTest"
      console.info(msg + 'begin');
      let path = new drawing.Path();
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          path.moveTo(10, 10);
        } catch (err) {
          console.info(msg + 'moveTo error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          path.cubicTo(10, 10, 10, 10, 15, 15);
        } catch (err) {
          console.info(msg + 'cubicTo error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          path.close();
        } catch (err) {
          console.info(msg + 'close error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_3010
     * @tc.name      : testPath_Reset_PressureTest
     * @tc.desc      : Used to reset custom path data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPath_Reset_PressureTest', 0, async function () {
      let msg = "testPath_Reset_PressureTest"
      console.info(msg + 'begin');
      let path = new drawing.Path();
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          path.moveTo(10, 10);
        } catch (err) {
          console.info(msg + 'moveTo error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          path.cubicTo(10, 10, 10, 10, 15, 15);
        } catch (err) {
          console.info(msg + 'cubicTo error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          path.reset();
        } catch (err) {
          console.info(msg + 'reset error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2690
     * @tc.name      : testCanvas_DrawRect_PressureTest
     * @tc.desc      : Used to draw a rectangle
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawRect_PressureTest', 0, async function () {
      let msg = "testCanvas_DrawRect_PressureTest"
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      console.info(msg + 'canvas is: ' + JSON.stringify(canvas));
      const pen = new drawing.Pen();
      try {
        pen.setStrokeWidth(5);
        console.info(msg + 'setStrokeWidth successed');
      } catch (err) {
        console.info(msg + 'setStrokeWidth error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        console.info(msg + 'setColor successed');
      } catch (err) {
        console.info(msg + 'setColor error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          canvas.attachPen(pen);
          console.info(msg + 'attachPen successed');
        } catch (err) {
          console.info(msg + `attachPen errorCode is:  ${err.code} + errormsg is: ${err.message}`);
          console.info(msg + 'attachPen error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          canvas.drawRect({
            left: 0, right: 0, top: 10, bottom: 10
          });
          console.info(msg + 'drawRect successed');
        } catch (err) {
          console.info(msg + `drawRect errorCode is:  ${err.code} + errorMsg is: ${err.message}`);
          expect().assertFail();
        }
        try {
          canvas.detachPen();
          console.info(msg + 'detachPen successed');
        } catch (err) {
          console.info(msg + `detachPen errorCode is:  ${err.code} + errorMsg is: ${err.message}`);
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2700
     * @tc.name      : testCanvas_DrawCircle_PressureTest
     * @tc.desc      : Used to draw a circle
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawCircle_PressureTest', 0, async function () {
      let msg = "testCanvas_DrawCircle_PressureTest"
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      console.info(msg + 'canvas is: ' + JSON.stringify(canvas));
      const pen = new drawing.Pen();
      try {
        pen.setStrokeWidth(5);
        console.info(msg + 'setStrokeWidth successed');
      } catch (err) {
        console.info(msg + 'setStrokeWidth error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        console.info(msg + 'setColor successed');
      } catch (err) {
        console.info(msg + 'setColor error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          canvas.attachPen(pen);
          console.info(msg + 'attachPen successed');
        } catch (err) {
          console.info(msg + 'attachPen error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          canvas.drawCircle(10, 10, 2);
          console.info(msg + 'drawCircle successed');
        } catch (err) {
          console.info(msg + 'drawCircle error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          canvas.detachPen();
          console.info(msg + 'detachPen successed');
        } catch (err) {
          console.info(msg + 'detachPen error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2710
     * @tc.name      : testCanvas_DrawImage_PressureTest
     * @tc.desc      : Used to draw a picture
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawImage_PressureTest', 0, async function () {
      let msg = "testCanvas_DrawImage_PressureTest"
      console.info(msg + 'begin');
      await buttonClick('UpdateDrawNode', msg).catch(async err => {
        console.info(msg + err);
        expect().assertFail();
      })
      let pixelMap_: image.PixelMap | null = null;
      //96为需要创建的像素buffer大小，取值为：height * width *4
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 4, width: 6
        }
      }
      await image.createPixelMap(color, opts).then((pixelMap: image.PixelMap) => {
        pixelMap_ = pixelMap
        console.info(msg + 'Succeeded in creating pixelmap.');
      }).catch((error: BusinessError) => {
        console.error(msg + 'Failed to create pixelmap.');
        expect().assertFail();
      })

      let canvas = new drawing.Canvas(pixelMap_)
      console.info(msg + 'canvas is: ' + JSON.stringify(canvas));
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          canvas.drawImage(pixelMap_, 0, 0);
          console.info(msg + 'drawImage successed');
        } catch (err) {
          console.info(msg + 'drawImage error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2720
     * @tc.name      : testCanvas_DrawColor_PressureTest
     * @tc.desc      : Paint background color
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawColor_PressureTest', 0, async function () {
      let msg = "testCanvas_DrawColor_PressureTest"
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      let color: common2D.Color = {
        alpha: 255,
        red: 0,
        green: 10,
        blue: 10
      }
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          canvas.drawColor(color, drawing.BlendMode.CLEAR);
          console.info(msg + 'drawColor successed');
        } catch (err) {
          console.info(msg + 'drawColor error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2730
     * @tc.name      : testCanvas_DrawPoint_PressureTest
     * @tc.desc      : Used to draw a point
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawPoint_PressureTest', 0, async function () {
      let msg = "testCanvas_DrawPoint_PressureTest"
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      const pen = new drawing.Pen();
      try {
        pen.setStrokeWidth(5);
        console.info(msg + 'setStrokeWidth successed');
      } catch (err) {
        console.info(msg + 'setStrokeWidth error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        console.info(msg + 'setColor successed');
      } catch (err) {
        console.info(msg + 'setColor error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        canvas.attachPen(pen);
        console.info(msg + 'attachPen successed');
      } catch (err) {
        console.info(msg + 'attachPen error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          canvas.drawPoint(10, 10);
          console.info(msg + 'drawPoint successed');
        } catch (err) {
          console.info(msg + 'drawPoint error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
      try {
        canvas.detachPen();
        console.info(msg + 'detachPen successed');
      } catch (err) {
        console.info(msg + 'detachPen error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2740
     * @tc.name      : testCanvas_DrawPath_PressureTest
     * @tc.desc      : Used to draw a custom path
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawPath_PressureTest', 0, async function () {
      let msg = "testCanvas_DrawPath_PressureTest"
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      const pen = new drawing.Pen();
      let path = new drawing.Path();
      try {
        pen.setStrokeWidth(5);
        console.info(msg + 'setStrokeWidth successed');
      } catch (err) {
        console.info(msg + 'setStrokeWidth error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        console.info(msg + 'setColor successed');
      } catch (err) {
        console.info(msg + 'setColor error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        path.moveTo(10, 10);
        console.info(msg + 'moveTo successed');
      } catch (err) {
        console.info(msg + 'moveTo error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        path.cubicTo(10, 10, 10, 10, 15, 15);
        console.info(msg + 'cubicTo successed');
      } catch (err) {
        console.info(msg + 'cubicTo error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        path.close();
        console.info(msg + 'close successed');
      } catch (err) {
        console.info(msg + 'close error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        canvas.attachPen(pen);
        console.info(msg + 'attachPen successed');
      } catch (err) {
        console.info(msg + 'attachPen error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          canvas.drawPath(path);
          console.info(msg + 'drawPath successed');
        } catch (err) {
          console.info(msg + 'drawPath error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
      try {
        canvas.detachPen();
        console.info(msg + 'detachPen successed');
      } catch (err) {
        console.info(msg + 'detachPen error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2750
     * @tc.name      : testCanvas_DrawLine_PressureTest
     * @tc.desc      : Used to draw a straight line segment
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawLine_PressureTest', 0, async function () {
      let msg = "testCanvas_DrawLine_PressureTest"
      console.info(msg + 'begin');

      let canvas = new drawing.Canvas(pixel)
      const pen = new drawing.Pen();
      try {
        pen.setStrokeWidth(5);
        console.info(msg + 'setStrokeWidth successed');
      } catch (err) {
        console.info(msg + 'setStrokeWidth error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        console.info(msg + 'setColor successed');
      } catch (err) {
        console.info(msg + 'setColor error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        canvas.attachPen(pen);
        console.info(msg + 'attachPen successed');
      } catch (err) {
        console.info(msg + 'attachPen error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          canvas.drawLine(0, 0, 20, 20);
          console.info(msg + 'drawLine successed');
        } catch (err) {
          console.info(msg + 'drawLine error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
      try {
        canvas.detachPen();
        console.info(msg + 'detachPen successed');
      } catch (err) {
        console.info(msg + 'detachPen error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2900
     * @tc.name      : testCanvas_DrawLine_PressureTest_Second
     * @tc.desc      : Used to draw a straight line segment
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawLine_PressureTest_Second', 0, async function () {
      let msg = "testCanvas_DrawLine_PressureTest_Second"
      console.info(msg + 'begin');
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        let canvas = new drawing.Canvas(pixel)
        const pen = new drawing.Pen();
        try {
          pen.setStrokeWidth(5);
          console.info(msg + 'setStrokeWidth successed');
        } catch (err) {
          console.info(msg + 'setStrokeWidth error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          pen.setColor({
            alpha: 255, red: 255, green: 0, blue: 0
          });
          console.info(msg + 'setColor successed');
        } catch (err) {
          console.info(msg + 'setColor error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          canvas.attachPen(pen);
          console.info(msg + 'attachPen successed');
        } catch (err) {
          console.info(msg + 'attachPen error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          canvas.drawLine(0, 0, 20, 20);
          console.info(msg + 'drawLine successed');
        } catch (err) {
          console.info(msg + 'drawLine error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          canvas.detachPen();
          console.info(msg + 'detachPen successed');
        } catch (err) {
          console.info(msg + 'detachPen error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2770
     * @tc.name      : testTextBlob_MakeFromString_PressureTest
     * @tc.desc      : Converts a string value to a TextBlob object
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTextBlob_MakeFromString_PressureTest', 0, async function () {
      let msg = "testTextBlob_MakeFromString_PressureTest"
      console.info(msg + 'begin');
      let font = new drawing.Font();
      try {
        font.setSize(20);
      } catch (err) {
        console.info(msg + 'font setSize error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          const textBlob = drawing.TextBlob.makeFromString("drawing", font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
          expect(textBlob != null).assertTrue();
        } catch (err) {
          console.info(msg + 'makeFromString error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2780
     * @tc.name      : testTextBlob_MakeFromRunBuffer_PressureTest
     * @tc.desc      : Create a Textblob object based on the RunBuffer information
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTextBlob_MakeFromRunBuffer_PressureTest', 0, async function () {
      let msg = "testTextBlob_MakeFromRunBuffer_PressureTest"
      console.info(msg + 'begin');
      let runBuffer = null;
      let textBlob = null
      let canvas = new drawing.Canvas(pixel)
      const font = new drawing.Font();
      const brush = new drawing.Brush();
      try {
        font.setSize(20);
      } catch (err) {
        console.info(msg + 'font setSize error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      runBuffer = [
        {
          glyph: 65, positionX: 0, positionY: 0
        },
        {
          glyph: 227, positionX: 14.9, positionY: 0
        },
        {
          glyph: 283, positionX: 25.84, positionY: 0
        },
        {
          glyph: 283, positionX: 30.62, positionY: 0
        },
        {
          glyph: 299, positionX: 35.4, positionY: 0
        }
      ];
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          textBlob = drawing.TextBlob.makeFromRunBuffer(runBuffer, font, null);
        } catch (err) {
          console.info(msg + 'makeFromRunBuffer error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          brush.setColor({
            alpha: 255, red: 255, green: 0, blue: 0
          });
        } catch (err) {
          console.info(msg + 'setColor error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          canvas.attachBrush(brush);
        } catch (err) {
          console.info(msg + 'attachBrush error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          canvas.drawTextBlob(textBlob, 20, 20);
        } catch (err) {
          console.info(msg + 'drawTextBlob error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          canvas.detachBrush();
        } catch (err) {
          console.info(msg + 'detachBrush error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_3020
     * @tc.name      : testTextBlob_Bounds_PressureTest
     * @tc.desc      : Gets the rectangular area of the text bounding box
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTextBlob_Bounds_PressureTest', 0, async function () {
      let msg = "testTextBlob_Bounds_PressureTest"
      console.info(msg + 'begin');
      const font = new drawing.Font();
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        let textBlob = null
        try {
          textBlob = drawing.TextBlob.makeFromString("drawing", font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
          expect(textBlob != null).assertTrue();
        } catch (err) {
          console.info(msg + 'makeFromString error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          let bd = textBlob.bounds();
          expect(bd != null).assertTrue();
        } catch (err) {
          console.info(msg + 'bounds error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2790
     * @tc.name      : testTypeface_GetFamilyName_PressureTest
     * @tc.desc      : Gets the series name of the font
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTypeface_GetFamilyName_PressureTest', 0, async function () {
      let msg = "testTypeface_GetFamilyName_PressureTest"
      console.info(msg + 'begin');
      const font = new drawing.Font();
      let typeface = null;
      try {
        typeface = font.getTypeface();
      } catch (err) {
        console.info(msg + 'getTypeface error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          const fontFamilyName = typeface.getFamilyName();
          expect(fontFamilyName != null).assertTrue();
        } catch (err) {
          console.info(msg + 'getFamilyName error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2800
     * @tc.name      : testFont_EnableSubpixel_PressureTest
     * @tc.desc      : Enable font subpixel level text rendering
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFont_EnableSubpixel_PressureTest', 0, async function () {
      let msg = "testFont_EnableSubpixel_PressureTest"
      console.info(msg + 'begin');
      let font = new drawing.Font();
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          font.enableSubpixel(true);
        } catch (err) {
          console.info(msg + 'enableSubpixel error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2810
     * @tc.name      : testFont_EnableEmbolden_PressureTest
     * @tc.desc      : Enable font bold
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFont_EnableEmbolden_PressureTest', 0, async function () {
      let msg = "testFont_EnableEmbolden_PressureTest"
      console.info(msg + 'begin');
      const font = new drawing.Font();
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          font.enableEmbolden(true);
        } catch (err) {
          console.info(msg + 'enableEmbolden error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2820
     * @tc.name      : testFont_EnableLinearMetrics_PressureTest
     * @tc.desc      : Enable linear scaling of glyphs
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFont_EnableLinearMetrics_PressureTest', 0, async function () {
      let msg = "testFont_EnableLinearMetrics_PressureTest"
      console.info(msg + 'begin');
      let font = new drawing.Font();
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          font.enableLinearMetrics(true);
        } catch (err) {
          console.info(msg + 'enableLinearMetrics error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2830
     * @tc.name      : testFont_SetSize_PressureTest
     * @tc.desc      : Set font size
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFont_SetSize_PressureTest', 0, async function () {
      let msg = "testFont_SetSize_PressureTest"
      console.info(msg + 'begin');
      let font = new drawing.Font();
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          font.setSize(i);
        } catch (err) {
          console.info(msg + 'setSize error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          let num = font.getSize();
          expect(num).assertEqual(i)
        } catch (err) {
          console.info(msg + 'getSize error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2840
     * @tc.name      : testFont_SetTypeface_PressureTest
     * @tc.desc      : Set font
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFont_SetTypeface_PressureTest', 0, async function () {
      let msg = "testFont_SetTypeface_PressureTest"
      console.info(msg + 'begin');
      const font = new drawing.Font();
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          font.setTypeface(new drawing.Typeface());
        } catch (err) {
          console.info(msg + 'setTypeface error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2850
     * @tc.name      : testFont_GetTypeface_PressureTest
     * @tc.desc      : Get font
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFont_GetTypeface_PressureTest', 0, async function () {
      let msg = "testFont_GetTypeface_PressureTest"
      console.info(msg + 'begin');
      const font = new drawing.Font();
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          let ft = font.getTypeface();
          expect(ft != null).assertTrue();
        } catch (err) {
          console.info(msg + 'getTypeface error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2860
     * @tc.name      : testFont_GetMetrics_PressureTest
     * @tc.desc      : Gets the FontMetrics property associated with the font
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFont_GetMetrics_PressureTest', 0, async function () {
      let msg = "testFont_GetMetrics_PressureTest"
      console.info(msg + 'begin');
      const font = new drawing.Font();
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          let metrics = font.getMetrics();
          expect(metrics != null).assertTrue();
          expect(metrics.top != null).assertTrue();
          expect(metrics.ascent != null).assertTrue();
          expect(metrics.descent != null).assertTrue();
          expect(metrics.bottom != null).assertTrue();
          expect(metrics.leading != null).assertTrue();
        } catch (err) {
          console.info(msg + 'getMetrics error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2870
     * @tc.name      : testFont_MeasureText_PressureTest
     * @tc.desc      : Measure the width of text
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFont_MeasureText_PressureTest', 0, async function () {
      let msg = "testFont_MeasureText_PressureTest"
      console.info(msg + 'begin');
      const font = new drawing.Font();
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          let TextWidth = font.measureText('testFont_MeasureText', drawing.TextEncoding.TEXT_ENCODING_UTF8);
          expect(TextWidth != null).assertTrue();
        } catch (err) {
          console.info(msg + 'measureText error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2880
     * @tc.name      : testColorFilter_CreateBlendModeColorFilter_PressureTest
     * @tc.desc      : Creates a color filter using the specified color and blending mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilter_CreateBlendModeColorFilter_PressureTest', 0, async function () {
      let msg = "testColorFilter_CreateBlendModeColorFilter_PressureTest"
      console.info(msg + 'begin');
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          const color: common2D.Color = {
            alpha: 255, red: 255, green: 0, blue: 0
          };
          let colorFilter = drawing.ColorFilter.createBlendModeColorFilter(color, drawing.BlendMode.SRC);
          expect(colorFilter != null).assertTrue();
        } catch (err) {
          console.info(msg + 'createBlendModeColorFilter error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2760
     * @tc.name      : testColorFilter_CreateComposeColorFilter_PressureTest
     * @tc.desc      : Create a combined color filter that applies inner for filtering and then outer for filtering
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilter_CreateComposeColorFilter_PressureTest', 0, async function () {
      let msg = "testColorFilter_CreateComposeColorFilter_PressureTest"
      console.info(msg + 'begin');
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          const color: common2D.Color = {
            alpha: 255, red: 255, green: 0, blue: 0
          };
          let colorFilter1 = drawing.ColorFilter.createBlendModeColorFilter(color, drawing.BlendMode.SRC);
          let colorFilter2 = drawing.ColorFilter.createBlendModeColorFilter(color, drawing.BlendMode.DST);
          let colorFilter = drawing.ColorFilter.createComposeColorFilter(colorFilter1, colorFilter2);
          expect(colorFilter1 != null).assertTrue();
          expect(colorFilter2 != null).assertTrue();
          expect(colorFilter != null).assertTrue();
        } catch (err) {
          console.info(msg + 'createComposeColorFilter error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2890
     * @tc.name      : testColorFilter_CreateLinearToSRGBGamma_PressureTest
     * @tc.desc      : Create a color filter that translates from a linear color space to an SRGB color space
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilter_CreateLinearToSRGBGamma_PressureTest', 0, async function () {
      let msg = "testColorFilter_CreateLinearToSRGBGamma_PressureTest"
      console.info(msg + 'begin');
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        const font = new drawing.Font();
        try {
          let colorFilter = drawing.ColorFilter.createLinearToSRGBGamma();
          expect(colorFilter != null).assertTrue();
        } catch (err) {
          console.info(msg + 'createLinearToSRGBGamma error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2910
     * @tc.name      : testColorFilter_CreateSRGBGammaToLinear_PressureTest
     * @tc.desc      : Create a color filter that converts from SRGB color space to linear color space
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilter_CreateSRGBGammaToLinear_PressureTest', 0, async function () {
      let msg = "testColorFilter_CreateSRGBGammaToLinear_PressureTest"
      console.info(msg + 'begin');
      const font = new drawing.Font();
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          let colorFilter = drawing.ColorFilter.createSRGBGammaToLinear();
          expect(colorFilter != null).assertTrue();
        } catch (err) {
          console.info(msg + 'createSRGBGammaToLinear error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_3030
     * @tc.name      : testColorFilter_CreateLumaColorFilter_PressureTest
     * @tc.desc      : Create a color filter that multiplies brightness with transparency
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilter_CreateLumaColorFilter_PressureTest', 0, async function () {
      let msg = "testColorFilter_CreateLumaColorFilter_PressureTest"
      console.info(msg + 'begin');
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          let colorFilter = drawing.ColorFilter.createLumaColorFilter();
          expect(colorFilter != null).assertTrue();
        } catch (err) {
          console.info(msg + 'createLumaColorFilter error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2920
     * @tc.name      : testPen_SetColor_PressureTest
     * @tc.desc      : Used to set the color of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPen_SetColor_PressureTest', 0, async function () {
      let msg = "testPen_SetColor_PressureTest"
      console.info(msg + 'begin');
      const color: common2D.Color = {
        alpha: 255, red: 255, green: 0, blue: 0
      };
      const pen = new drawing.Pen();
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          pen.setColor(color);
          console.log(msg + 'setColor success')
        } catch (err) {
          console.info(msg + 'setColor error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2930
     * @tc.name      : testPen_SetStrokeWidth_PressureTest
     * @tc.desc      : Used to set the line width of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPen_SetStrokeWidth_PressureTest', 0, async function () {
      let msg = "testPen_SetStrokeWidth_PressureTest"
      console.info(msg + 'begin');
      const pen = new drawing.Pen();
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          pen.setStrokeWidth(5);
          console.log(msg + 'setStrokeWidth success')
        } catch (err) {
          console.info(msg + 'setStrokeWidth error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2940
     * @tc.name      : testPen_SetAntiAlias_PressureTest
     * @tc.desc      : Used to set whether the brush is anti-aliasing enabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPen_SetAntiAlias_PressureTest', 0, async function () {
      let msg = "testPen_SetAntiAlias_PressureTest"
      console.info(msg + 'begin');
      const pen = new drawing.Pen();
      let bool = true
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          pen.setAntiAlias(bool);
          console.log(msg + 'setAntiAlias success ' + bool)
          bool = !bool;
        } catch (err) {
          console.info(msg + 'setAntiAlias error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2950
     * @tc.name      : testPen_SetAlpha_PressureTest
     * @tc.desc      : Used to set the transparency of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPen_SetAlpha_PressureTest', 0, async function () {
      let msg = "testPen_SetAlpha_PressureTest"
      console.info(msg + 'begin');
      const pen = new drawing.Pen();
      let opacityNum = 0
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          pen.setAlpha(opacityNum);
          console.log(msg + 'setAlpha success opacityNum is: ' + opacityNum)
        } catch (err) {
          console.info(msg + 'setAlpha error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        opacityNum = opacityNum > 255 ? 0 : opacityNum + 1
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_3040
     * @tc.name      : testPen_SetColorFilter_PressureTest
     * @tc.desc      : Used to add additional color filters to the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPen_SetColorFilter_PressureTest', 0, async function () {
      let msg = "testPen_SetColorFilter_PressureTest"
      console.info(msg + 'begin');
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        const pen = new drawing.Pen();
        let colorFilter = null;
        try {
          colorFilter = drawing.ColorFilter.createLinearToSRGBGamma();
          expect(colorFilter != null).assertTrue();
        } catch (err) {
          console.info(msg + 'createLinearToSRGBGamma error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          pen.setColorFilter(colorFilter);
        } catch (err) {
          console.info(msg + 'setColorFilter error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_3050
     * @tc.name      : testPen_SetBlendMode_AllMode_PressureTest
     * @tc.desc      : Used to set the blending mode of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPen_SetBlendMode_AllMode_PressureTest', 0, async function () {
      let msg = "testPen_SetBlendMode_AllMode_PressureTest"
      console.info(msg + 'begin');
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        const pen = new drawing.Pen();
        try {
          for (let i = 0;i < blendModeArr.length; i++) {
            pen.setBlendMode(drawing.BlendMode[blendModeArr[i]]);
          }
        } catch (err) {
          console.info(msg + 'setBlendMode error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2960
     * @tc.name      : testPen_SetDither_PressureTest
     * @tc.desc      : Turn on the shake paint effect of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPen_SetDither_PressureTest', 0, async function () {
      let msg = "testPen_SetDither_PressureTest"
      console.info(msg + 'begin');
      const pen = new drawing.Pen();
      let bool = true
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          pen.setDither(true);
          console.log(msg + 'setDither success ' + bool)
          bool = !bool;
        } catch (err) {
          console.info(msg + 'setDither error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2970
     * @tc.name      : testBrush_setColor_PressureTest
     * @tc.desc      : Used to set the color of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrush_setColor_PressureTest', 0, async function () {
      let msg = "testBrush_setColor_PressureTest"
      console.info(msg + 'begin');
      const color: common2D.Color = {
        alpha: 255, red: 255, green: 0, blue: 0
      };
      const brush = new drawing.Brush();
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          brush.setColor(color);
          console.log(msg + 'setColor success ')
        } catch (err) {
          console.info(msg + 'setColor error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2980
     * @tc.name      : testBrush_SetAntiAlias_PressureTest
     * @tc.desc      : Used to set whether to enable anti-aliasing of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrush_SetAntiAlias_PressureTest', 0, async function () {
      let msg = "testBrush_SetAntiAlias_PressureTest"
      console.info(msg + 'begin');
      const brush = new drawing.Brush();
      let bool = true
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          brush.setAntiAlias(true);
          console.log(msg + 'setAntiAlias success ' + bool)
          bool = !bool;
        } catch (err) {
          console.info(msg + 'setAntiAlias error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2990
     * @tc.name      : testBrush_SetAlpha_PressureTest
     * @tc.desc      : Used to set the transparency of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrush_SetAlpha_PressureTest', 0, async function () {
      let msg = "testBrush_SetAlpha_PressureTest"
      console.info(msg + 'begin');
      const brush = new drawing.Brush();
      let opacityNum = 0
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          brush.setAlpha(128);
          console.log(msg + 'setAlpha success opacityNum is: ' + opacityNum)
        } catch (err) {
          console.info(msg + 'setAlpha error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        opacityNum = opacityNum > 255 ? 0 : opacityNum + 1
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_3000
     * @tc.name      : testBrush_SetBlendMode_AllMode_PressureTest
     * @tc.desc      : Used to set the blending mode of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrush_SetBlendMode_AllMode_PressureTest', 0, async function () {
      let msg = "testBrush_SetBlendMode_AllMode_PressureTest"
      console.info(msg + 'begin');
      const brush = new drawing.Brush();
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        try {
          for (let i = 0;i < blendModeArr.length; i++) {
            brush.setBlendMode(drawing.BlendMode[blendModeArr[i]]);
            console.log(msg + 'setBlendMode success ')
          }
        } catch (err) {
          console.info(msg + 'setBlendMode error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_3060
     * @tc.name      : testBrush_SetColorFilter_PressureTest
     * @tc.desc      : Used to add additional color filters to the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrush_SetColorFilter_PressureTest', 0, async function () {
      let msg = "testBrush_SetColorFilter_PressureTest"
      console.info(msg + 'begin');
      for (let i = 0;i < pressureTestNum; i++) {
        console.log(msg + 'step is: ' + i)
        const brush = new drawing.Brush();
        let colorFilter = null;
        try {
          colorFilter = drawing.ColorFilter.createLinearToSRGBGamma();
          expect(colorFilter != null).assertTrue();
        } catch (err) {
          console.info(msg + 'createLinearToSRGBGamma error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          brush.setColorFilter(colorFilter);
        } catch (err) {
          console.info(msg + 'setColorFilter error cause: ' + JSON.stringify(err));
          expect().assertFail();
        }
      }
    })
  })
}