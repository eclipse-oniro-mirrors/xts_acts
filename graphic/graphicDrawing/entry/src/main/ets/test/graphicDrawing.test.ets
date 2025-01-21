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
  describe('graphic_drawing_test', function () {
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
    let blendModeArr = ['CLEAR', 'SRC', 'DST', 'SRC_OVER', 'DST_OVER', 'SRC_IN', 'DST_IN', 'SRC_OUT',
    'DST_OUT', 'SRC_ATOP', 'DST_ATOP', 'XOR', 'PLUS', 'MODULATE', 'SCREEN', 'OVERLAY', 'DARKEN',
    'LIGHTEN', 'COLOR_DODGE', 'COLOR_BURN', 'HARD_LIGHT', 'SOFT_LIGHT', 'DIFFERENCE', 'EXCLUSION',
    'MULTIPLY', 'HUE', 'SATURATION', 'COLOR', 'LUMINOSITY']

    let longText = "这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字" +
    "这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字" +
    "这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字" +
    "这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字" +
    "这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字" +
    "这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字" +
    "这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字" +
    "这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字" +
    "这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字" +
    "这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字" +
    "这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字这是一段很长很长的文字"
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0010
     * @tc.name      : testEnumBlendMode
     * @tc.desc      : To test the enum value of BlendMode.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testEnumBlendMode', 0, async function () {
      let msg = "testEnumBlendMode"
      console.info(msg + 'begin');
      try {
        expect(0).assertEqual(drawing.BlendMode.CLEAR);
        expect(1).assertEqual(drawing.BlendMode.SRC);
        expect(2).assertEqual(drawing.BlendMode.DST);
        expect(3).assertEqual(drawing.BlendMode.SRC_OVER);
        expect(4).assertEqual(drawing.BlendMode.DST_OVER);
        expect(5).assertEqual(drawing.BlendMode.SRC_IN);
        expect(6).assertEqual(drawing.BlendMode.DST_IN);
        expect(7).assertEqual(drawing.BlendMode.SRC_OUT);
        expect(8).assertEqual(drawing.BlendMode.DST_OUT);
        expect(9).assertEqual(drawing.BlendMode.SRC_ATOP);
        expect(10).assertEqual(drawing.BlendMode.DST_ATOP);
        expect(11).assertEqual(drawing.BlendMode.XOR);
        expect(12).assertEqual(drawing.BlendMode.PLUS);
        expect(13).assertEqual(drawing.BlendMode.MODULATE);
        expect(14).assertEqual(drawing.BlendMode.SCREEN);
        expect(15).assertEqual(drawing.BlendMode.OVERLAY);
        expect(16).assertEqual(drawing.BlendMode.DARKEN);
        expect(17).assertEqual(drawing.BlendMode.LIGHTEN);
        expect(18).assertEqual(drawing.BlendMode.COLOR_DODGE);
        expect(19).assertEqual(drawing.BlendMode.COLOR_BURN);
        expect(20).assertEqual(drawing.BlendMode.HARD_LIGHT);
        expect(21).assertEqual(drawing.BlendMode.SOFT_LIGHT);
        expect(22).assertEqual(drawing.BlendMode.DIFFERENCE);
        expect(23).assertEqual(drawing.BlendMode.EXCLUSION);
        expect(24).assertEqual(drawing.BlendMode.MULTIPLY);
        expect(25).assertEqual(drawing.BlendMode.HUE);
        expect(26).assertEqual(drawing.BlendMode.SATURATION);
        expect(27).assertEqual(drawing.BlendMode.COLOR);
        expect(28).assertEqual(drawing.BlendMode.LUMINOSITY);
      } catch (err) {
        console.info(msg + 'test enum value of BlendMode error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0020
     * @tc.name      : testPath_MoveTo_Normal_Parameter
     * @tc.desc      : This parameter is used to set the start point of a user-defined path
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPath_MoveTo_Normal_Parameter', 0, async function () {
      let msg = "testPath_MoveTo_Normal_Parameter"
      console.info(msg + 'begin');
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
      } catch (err) {
        console.info(msg + 'moveTo error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0030
     * @tc.name      : testPath_MoveTo_Minus_Parameter
     * @tc.desc      : This parameter is used to set the start point of a user-defined path
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPath_MoveTo_Minus_Parameter', 0, async function () {
      let msg = "testPath_MoveTo_Minus_Parameter"
      console.info(msg + 'begin');
      let path = new drawing.Path();
      try {
        path.moveTo(-1, -20);
      } catch (err) {
        console.info(msg + 'moveTo error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0040
     * @tc.name      : testPath_MoveTo_NonInteger_Parameter
     * @tc.desc      : This parameter is used to set the start point of a user-defined path
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPath_MoveTo_NonInteger_Parameter', 0, async function () {
      let msg = "testPath_MoveTo_NonInteger_Parameter"
      console.info(msg + 'begin');
      let path = new drawing.Path();
      try {
        path.moveTo(50.525, 10.50256);
      } catch (err) {
        console.info(msg + 'moveTo error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0050
     * @tc.name      : testPath_LineTo_Normal_Parameter
     * @tc.desc      : Used to add a line segment from the last point of the path to the destination point
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPath_LineTo_Normal_Parameter', 0, async function () {
      let msg = "testPath_LineTo_Normal_Parameter"
      console.info(msg + 'begin');
      let path = new drawing.Path();
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0060
     * @tc.name      : testPath_LineTo_Minus_Parameter
     * @tc.desc      : Used to add a line segment from the last point of the path to the destination point
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPath_LineTo_Minus_Parameter', 0, async function () {
      let msg = "testPath_LineTo_Minus_Parameter"
      console.info(msg + 'begin');
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
      } catch (err) {
        console.info(msg + 'moveTo error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        path.lineTo(-10, -30);
      } catch (err) {
        console.info(msg + 'lineTo error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0070
     * @tc.name      : testPath_LineTo_NonInteger_Parameter
     * @tc.desc      : Used to add a line segment from the last point of the path to the destination point
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPath_LineTo_NonInteger_Parameter', 0, async function () {
      let msg = "testPath_LineTo_NonInteger_Parameter"
      console.info(msg + 'begin');
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
      } catch (err) {
        console.info(msg + 'moveTo error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        path.lineTo(23.5645, 54.156);
      } catch (err) {
        console.info(msg + 'lineTo error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0080
     * @tc.name      : testPath_ArcTo_Normal_Parameter
     * @tc.desc      : Used to add an arc to a path
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPath_ArcTo_Normal_Parameter', 0, async function () {
      let msg = "testPath_ArcTo_Normal_Parameter"
      console.info(msg + 'begin');
      let path = new drawing.Path();
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0650
     * @tc.name      : testPath_ArcTo_Minus_Parameter
     * @tc.desc      : Used to add an arc to a path
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPath_ArcTo_Minus_Parameter', 0, async function () {
      let msg = "testPath_ArcTo_Minus_Parameter"
      console.info(msg + 'begin');
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
      } catch (err) {
        console.info(msg + 'moveTo error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        path.arcTo(-10, -15.56, -10, -10, -10, -10.25);
      } catch (err) {
        console.info(msg + 'arcTo error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0660
     * @tc.name      : testPath_ArcTo_NonInteger_Parameter
     * @tc.desc      : Used to add an arc to a path
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPath_ArcTo_NonInteger_Parameter', 0, async function () {
      let msg = "testPath_ArcTo_NonInteger_Parameter"
      console.info(msg + 'begin');
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
      } catch (err) {
        console.info(msg + 'moveTo error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        path.arcTo(10.56, 15.06, 10.89, 102.59, 100.44, 10.25);
      } catch (err) {
        console.info(msg + 'arcTo error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0090
     * @tc.name      : testPath_QuadTo_Normal_Parameter
     * @tc.desc      : Used to add a second order Bessel smooth curve from the last point of the path to the destination point
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPath_QuadTo_Normal_Parameter', 0, async function () {
      let msg = "testPath_QuadTo_Normal_Parameter"
      console.info(msg + 'begin');
      let path = new drawing.Path();
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0720
     * @tc.name      : testPath_QuadTo_Minus_Parameter
     * @tc.desc      : Used to add a second order Bessel smooth curve from the last point of the path to the destination point
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPath_QuadTo_Minus_Parameter', 0, async function () {
      let msg = "testPath_QuadTo_Minus_Parameter"
      console.info(msg + 'begin');
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
      } catch (err) {
        console.info(msg + 'moveTo error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        path.quadTo(-10, -15, -10, -10);
      } catch (err) {
        console.info(msg + 'quadTo error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0730
     * @tc.name      : testPath_QuadTo_NonInteger_Parameter
     * @tc.desc      : Used to add a second order Bessel smooth curve from the last point of the path to the destination point
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPath_QuadTo_NonInteger_Parameter', 0, async function () {
      let msg = "testPath_QuadTo_NonInteger_Parameter"
      console.info(msg + 'begin');
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
      } catch (err) {
        console.info(msg + 'moveTo error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        path.quadTo(88.456, 45.12451, 10.45, 100.14);
      } catch (err) {
        console.info(msg + 'quadTo error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0100
     * @tc.name      : testPath_CubicTo_Normal_Parameter
     * @tc.desc      : Third order Bessel smooth curve
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPath_CubicTo_Normal_Parameter', 0, async function () {
      let msg = "testPath_CubicTo_Normal_Parameter"
      console.info(msg + 'begin');
      let path = new drawing.Path();
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0790
     * @tc.name      : testPath_CubicTo_Minus_Parameter
     * @tc.desc      : Third order Bessel smooth curve
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPath_CubicTo_Minus_Parameter', 0, async function () {
      let msg = "testPath_CubicTo_Minus_Parameter"
      console.info(msg + 'begin');
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
      } catch (err) {
        console.info(msg + 'moveTo error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        path.cubicTo(-10, -10, -10, -10, -15, -15);
      } catch (err) {
        console.info(msg + 'cubicTo error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0800
     * @tc.name      : testPath_CubicTo_NonInteger_Parameter
     * @tc.desc      : Third order Bessel smooth curve
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPath_CubicTo_NonInteger_Parameter', 0, async function () {
      let msg = "testPath_CubicTo_NonInteger_Parameter"
      console.info(msg + 'begin');
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
      } catch (err) {
        console.info(msg + 'moveTo error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        path.cubicTo(20.147, 30.25, 10.15, 20.58, 1.28, 420.2574);
      } catch (err) {
        console.info(msg + 'cubicTo error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0110
     * @tc.name      : testPath_Close
     * @tc.desc      : For closed path
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPath_Close', 0, async function () {
      let msg = "testPath_Close"
      console.info(msg + 'begin');
      let path = new drawing.Path();
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0120
     * @tc.name      : testPath_Reset
     * @tc.desc      : Used to reset custom path data
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPath_Reset', 0, async function () {
      let msg = "testPath_Reset"
      console.info(msg + 'begin');
      let path = new drawing.Path();
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0130
     * @tc.name      : testEnumTextEncoding
     * @tc.desc      : Enumeration of the encoding type of the text
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testEnumTextEncoding', 0, async function () {
      let msg = "testEnumTextEncoding"
      console.info(msg + 'begin');
      console.info(msg + 'value of TextEncoding is: ' + JSON.stringify(drawing.TextEncoding));
      try {
        expect(0).assertEqual(drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(1).assertEqual(drawing.TextEncoding.TEXT_ENCODING_UTF16);
        expect(2).assertEqual(drawing.TextEncoding.TEXT_ENCODING_UTF32);
        expect(3).assertEqual(drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID);
      } catch (err) {
        console.info(msg + 'test enum value of TextEncoding error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0140
     * @tc.name      : testTextBlob_MakeFromString_Normal_Parameter
     * @tc.desc      : Converts a string value to a TextBlob object
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTextBlob_MakeFromString_Normal_Parameter', 0, async function () {
      let msg = "testTextBlob_MakeFromString_Normal_Parameter"
      console.info(msg + 'begin');
      let font = new drawing.Font();
      try {
        font.setSize(20);
      } catch (err) {
        console.info(msg + 'font setSize error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        const textBlob = drawing.TextBlob.makeFromString("drawing", font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(textBlob != null).assertTrue();
      } catch (err) {
        console.info(msg + 'makeFromString error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0890
     * @tc.name      : testTextBlob_MakeFromString_NoEncoding
     * @tc.desc      : Converts a string value to a TextBlob object
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTextBlob_MakeFromString_NoEncoding', 0, async function () {
      let msg = "testTextBlob_MakeFromString_NoEncoding"
      console.info(msg + 'begin');
      let font = new drawing.Font();
      try {
        font.setSize(20);
      } catch (err) {
        console.info(msg + 'font setSize error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        const textBlob = drawing.TextBlob.makeFromString("drawing", font);
        expect(textBlob != null).assertTrue();
      } catch (err) {
        console.info(msg + 'makeFromString error cause: ' + JSON.stringify(err));
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0900
     * @tc.name      : testTextBlob_MakeFromString_LongText
     * @tc.desc      : Converts a string value to a TextBlob object
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTextBlob_MakeFromString_LongText', 0, async function () {
      let msg = "testTextBlob_MakeFromString_LongText"
      console.info(msg + 'begin');
      let font = new drawing.Font();
      try {
        font.setSize(20);
      } catch (err) {
        console.info(msg + 'font setSize error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        const textBlob = drawing.TextBlob.makeFromString(longText, font);
        expect(textBlob != null).assertTrue();
      } catch (err) {
        console.info(msg + 'makeFromString error cause: ' + JSON.stringify(err));
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0910
     * @tc.name      : testTextBlob_MakeFromString_TextEncoding_UTF16
     * @tc.desc      : Converts a string value to a TextBlob object
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTextBlob_MakeFromString_TextEncoding_UTF16', 0, async function () {
      let msg = "testTextBlob_MakeFromString_TextEncoding_UTF16"
      console.info(msg + 'begin');
      let font = new drawing.Font();
      try {
        font.setSize(20);
      } catch (err) {
        console.info(msg + 'font setSize error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        const textBlob = drawing.TextBlob.makeFromString("drawing", font, drawing.TextEncoding.TEXT_ENCODING_UTF16);
        expect(textBlob != null).assertTrue();
      } catch (err) {
        console.info(msg + 'makeFromString error cause: ' + JSON.stringify(err));
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0920
     * @tc.name      : testTextBlob_MakeFromString_TextEncoding_UTF32
     * @tc.desc      : Converts a string value to a TextBlob object
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTextBlob_MakeFromString_TextEncoding_UTF32', 0, async function () {
      let msg = "testTextBlob_MakeFromString_TextEncoding_UTF32"
      console.info(msg + 'begin');
      let font = new drawing.Font();
      try {
        font.setSize(20);
      } catch (err) {
        console.info(msg + 'font setSize error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        const textBlob = drawing.TextBlob.makeFromString("drawing", font, drawing.TextEncoding.TEXT_ENCODING_UTF32);
        expect(textBlob != null).assertTrue();
      } catch (err) {
        console.info(msg + 'makeFromString error cause: ' + JSON.stringify(err));
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0930
     * @tc.name      : testTextBlob_MakeFromString_TextEncoding_GlyphId
     * @tc.desc      : Converts a string value to a TextBlob object
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTextBlob_MakeFromString_TextEncoding_GlyphId', 0, async function () {
      let msg = "testTextBlob_MakeFromString_TextEncoding_GlyphId"
      console.info(msg + 'begin');
      let font = new drawing.Font();
      try {
        font.setSize(20);
      } catch (err) {
        console.info(msg + 'font setSize error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        const textBlob = drawing.TextBlob.makeFromString("drawing", font, drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID);
        expect(textBlob != null).assertTrue();
      } catch (err) {
        console.info(msg + 'makeFromString error cause: ' + JSON.stringify(err));
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0150
     * @tc.name      : testTextBlob_MakeFromRunBuffer_Normal_Parameter
     * @tc.desc      : Create a Textblob object based on the RunBuffer information
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTextBlob_MakeFromRunBuffer_Normal_Parameter', 0, async function () {
      let msg = "testTextBlob_MakeFromRunBuffer_Normal_Parameter"
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0990
     * @tc.name      : testTextBlob_MakeFromRunBuffer_NoBounds
     * @tc.desc      : Create a Textblob object based on the RunBuffer information
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTextBlob_MakeFromRunBuffer_NoBounds', 0, async function () {
      let msg = "testTextBlob_MakeFromRunBuffer_NoBounds"
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
      try {
        textBlob = drawing.TextBlob.makeFromRunBuffer(runBuffer, font);
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_1020
     * @tc.name      : testTextBlob_MakeFromRunBuffer_runBuffer_ArrayNumOne
     * @tc.desc      : Create a Textblob object based on the RunBuffer information
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTextBlob_MakeFromRunBuffer_runBuffer_ArrayNumOne', 0, async function () {
      let msg = "testTextBlob_MakeFromRunBuffer_runBuffer_ArrayNumOne"
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
        }
      ];
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_1030
     * @tc.name      : testTextBlob_MakeFromRunBuffer_runBuffer_ArrayNumTwo
     * @tc.desc      : Create a Textblob object based on the RunBuffer information
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTextBlob_MakeFromRunBuffer_runBuffer_ArrayNumTwo', 0, async function () {
      let msg = "testTextBlob_MakeFromRunBuffer_runBuffer_ArrayNumTwo"
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
          glyph: 283, positionX: 25.84, positionY: 0
        },
      ];
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_1040
     * @tc.name      : testTextBlob_MakeFromRunBuffer_runBuffer_ArrayNumSix
     * @tc.desc      : Create a Textblob object based on the RunBuffer information
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTextBlob_MakeFromRunBuffer_runBuffer_ArrayNumSix', 0, async function () {
      let msg = "testTextBlob_MakeFromRunBuffer_runBuffer_ArrayNumSix"
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
        },
        {
          glyph: 283, positionX: 25.84, positionY: 0
        }
      ];
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_1050
     * @tc.name      : testTextBlob_MakeFromRunBuffer_runBuffer_NumberTest
     * @tc.desc      : Create a Textblob object based on the RunBuffer information
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTextBlob_MakeFromRunBuffer_runBuffer_NumberTest', 0, async function () {
      let msg = "testTextBlob_MakeFromRunBuffer_runBuffer_NumberTest"
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
          glyph: 1000.5698, positionX: -100, positionY: 200
        },
        {
          glyph: -100, positionX: 14.9, positionY: 0
        },
        {
          glyph: 0.5698, positionX: 300, positionY: -520
        },
      ];
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0160
     * @tc.name      : testTextBlob_Bounds
     * @tc.desc      : Gets the rectangular area of the text bounding box
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTextBlob_Bounds', 0, async function () {
      let msg = "testTextBlob_Bounds"
      console.info(msg + 'begin');
      const font = new drawing.Font();
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0170
     * @tc.name      : testTypeface_GetFamilyName
     * @tc.desc      : Gets the series name of the font
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTypeface_GetFamilyName', 0, async function () {
      let msg = "testTypeface_GetFamilyName"
      console.info(msg + 'begin');
      const font = new drawing.Font();
      let typeface = null;
      try {
        typeface = font.getTypeface();
      } catch (err) {
        console.info(msg + 'getTypeface error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        const fontFamilyName = typeface.getFamilyName();
        expect(fontFamilyName != null).assertTrue();
      } catch (err) {
        console.info(msg + 'getFamilyName error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0180
     * @tc.name      : testFont_EnableSubpixel_True
     * @tc.desc      : Enable font subpixel level text rendering
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFont_EnableSubpixel_True', 0, async function () {
      let msg = "testFont_EnableSubpixel_True"
      console.info(msg + 'begin');
      let font = new drawing.Font();
      try {
        font.enableSubpixel(true);
      } catch (err) {
        console.info(msg + 'enableSubpixel error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_1060
     * @tc.name      : testFont_EnableSubpixel_False
     * @tc.desc      : Enable font subpixel level text rendering
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFont_EnableSubpixel_False', 0, async function () {
      let msg = "testFont_EnableSubpixel_False"
      console.info(msg + 'begin');
      let font = new drawing.Font();
      try {
        font.enableSubpixel(false);
      } catch (err) {
        console.info(msg + 'enableSubpixel error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0190
     * @tc.name      : testFont_EnableEmbolden_True
     * @tc.desc      : Enable font bold
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFont_EnableEmbolden_True', 0, async function () {
      let msg = "testFont_EnableEmbolden_True"
      console.info(msg + 'begin');
      const font = new drawing.Font();
      try {
        font.enableEmbolden(true);
      } catch (err) {
        console.info(msg + 'enableEmbolden error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_1090
     * @tc.name      : testFont_EnableEmbolden_False
     * @tc.desc      : Enable font bold
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFont_EnableEmbolden_False', 0, async function () {
      let msg = "testFont_EnableEmbolden_False"
      console.info(msg + 'begin');
      const font = new drawing.Font();
      try {
        font.enableEmbolden(false);
      } catch (err) {
        console.info(msg + 'enableEmbolden error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0200
     * @tc.name      : testFont_EnableLinearMetrics_True
     * @tc.desc      : Enable linear scaling of glyphs
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFont_EnableLinearMetrics_True', 0, async function () {
      let msg = "testFont_EnableLinearMetrics_True"
      console.info(msg + 'begin');
      let font = new drawing.Font();
      try {
        font.enableLinearMetrics(true);
      } catch (err) {
        console.info(msg + 'enableLinearMetrics error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_1120
     * @tc.name      : testFont_EnableLinearMetrics_False
     * @tc.desc      : Enable linear scaling of glyphs
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFont_EnableLinearMetrics_False', 0, async function () {
      let msg = "testFont_EnableLinearMetrics_False"
      console.info(msg + 'begin');
      let font = new drawing.Font();
      try {
        font.enableLinearMetrics(false);
      } catch (err) {
        console.info(msg + 'enableLinearMetrics error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0210
     * @tc.name      : testFont_SetSize_Normal_Parameter
     * @tc.desc      : Set font size
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFont_SetSize_Normal_Parameter', 0, async function () {
      let msg = "testFont_SetSize_Normal_Parameter"
      console.info(msg + 'begin');
      let font = new drawing.Font();
      try {
        font.setSize(100);
      } catch (err) {
        console.info(msg + 'setSize error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        let num = font.getSize();
        expect(num).assertEqual(100)
      } catch (err) {
        console.info(msg + 'getSize error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_1150
     * @tc.name      : testFont_SetSize_Minus_Parameter
     * @tc.desc      : Set font size
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFont_SetSize_Minus_Parameter', 0, async function () {
      let msg = "testFont_SetSize_Minus_Parameter"
      console.info(msg + 'begin');
      let font = new drawing.Font();
      try {
        font.setSize(-200);
      } catch (err) {
        console.info(msg + 'setSize error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        let num = font.getSize();
        console.info(msg + 'getSize num is: ' + num);
        expect(num).assertEqual(0)
      } catch (err) {
        console.info(msg + 'getSize error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_1160
     * @tc.name      : testFont_SetSize_Zero_Parameter
     * @tc.desc      : Set font size
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFont_SetSize_Zero_Parameter', 0, async function () {
      let msg = "testFont_SetSize_Zero_Parameter"
      console.info(msg + 'begin');
      let font = new drawing.Font();
      try {
        font.setSize(0);
      } catch (err) {
        console.info(msg + 'setSize error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        let num = font.getSize();
        console.info(msg + 'getSize num is: ' + num);
        expect(num).assertEqual(0)
      } catch (err) {
        console.info(msg + 'getSize error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0220
     * @tc.name      : testFont_GetSize
     * @tc.desc      : Get font size
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFont_GetSize', 0, async function () {
      let msg = "testFont_GetSize"
      console.info(msg + 'begin');
      let font = new drawing.Font();
      try {
        font.setSize(5);
      } catch (err) {
        console.info(msg + 'setSize error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        let num = font.getSize();
        expect(num).assertEqual(5)
      } catch (err) {
        console.info(msg + 'getSize error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0230
     * @tc.name      : testFont_SetTypeface
     * @tc.desc      : Set font
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFont_SetTypeface', 0, async function () {
      let msg = "testFont_SetTypeface"
      console.info(msg + 'begin');
      const font = new drawing.Font();
      try {
        font.setTypeface(new drawing.Typeface());
      } catch (err) {
        console.info(msg + 'setTypeface error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0240
     * @tc.name      : testFont_GetTypeface
     * @tc.desc      : Get font
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFont_GetTypeface', 0, async function () {
      let msg = "testFont_GetTypeface"
      console.info(msg + 'begin');
      const font = new drawing.Font();
      try {
        let ft = font.getTypeface();
        expect(ft != null).assertTrue();
      } catch (err) {
        console.info(msg + 'getTypeface error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0250
     * @tc.name      : testFont_GetMetrics
     * @tc.desc      : Gets the FontMetrics property associated with the font
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFont_GetMetrics', 0, async function () {
      let msg = "testFont_GetMetrics"
      console.info(msg + 'begin');
      const font = new drawing.Font();
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0260
     * @tc.name      : testFont_MeasureText
     * @tc.desc      : Measure the width of text
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFont_MeasureText', 0, async function () {
      let msg = "testFont_MeasureText"
      console.info(msg + 'begin');
      const font = new drawing.Font();
      try {
        let TextWidth = font.measureText('testFont_MeasureText', drawing.TextEncoding.TEXT_ENCODING_UTF8);
        expect(TextWidth != null).assertTrue();
      } catch (err) {
        console.info(msg + 'measureText error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_1210
     * @tc.name      : testFont_MeasureText_EncodingUtf16
     * @tc.desc      : Measure the width of text
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFont_MeasureText_EncodingUtf16', 0, async function () {
      let msg = "testFont_MeasureText_EncodingUtf16"
      console.info(msg + 'begin');
      const font = new drawing.Font();
      try {
        let TextWidth = font.measureText('testFont_MeasureText_EncodingUtf16', drawing.TextEncoding.TEXT_ENCODING_UTF16);
        expect(TextWidth != null).assertTrue();
      } catch (err) {
        console.info(msg + 'measureText error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_1220
     * @tc.name      : testFont_MeasureText_EncodingUtf32
     * @tc.desc      : Measure the width of text
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFont_MeasureText_EncodingUtf32', 0, async function () {
      let msg = "testFont_MeasureText_EncodingUtf32"
      console.info(msg + 'begin');
      const font = new drawing.Font();
      try {
        let TextWidth = font.measureText('testFont_MeasureText_EncodingUtf32', drawing.TextEncoding.TEXT_ENCODING_UTF32);
        expect(TextWidth != null).assertTrue();
      } catch (err) {
        console.info(msg + 'measureText error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_1230
     * @tc.name      : testFont_MeasureText_EncodingGlyphId
     * @tc.desc      : Measure the width of text
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFont_MeasureText_EncodingGlyphId', 0, async function () {
      let msg = "testFont_MeasureText_EncodingGlyphId"
      console.info(msg + 'begin');
      const font = new drawing.Font();
      try {
        let TextWidth = font.measureText('testFont_MeasureText_EncodingGlyphId', drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID);
        expect(TextWidth != null).assertTrue();
      } catch (err) {
        console.info(msg + 'measureText error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0270
     * @tc.name      : testColorFilter_CreateBlendModeColorFilter_Normal_Parameter
     * @tc.desc      : Creates a color filter using the specified color and blending mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilter_CreateBlendModeColorFilter_Normal_Parameter', 0, async function () {
      let msg = "testColorFilter_CreateBlendModeColorFilter_Normal_Parameter"
      console.info(msg + 'begin');
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_1360
     * @tc.name      : testColorFilter_CreateBlendModeColorFilter_BlendMode_Screen
     * @tc.desc      : Creates a color filter using the specified color and blending mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilter_CreateBlendModeColorFilter_BlendMode_Screen', 0, async function () {
      let msg = "testColorFilter_CreateBlendModeColorFilter_BlendMode_Screen"
      console.info(msg + 'begin');
      try {
        const color: common2D.Color = {
          alpha: 255, red: 240, green: 0, blue: 100
        };
        let colorFilter = drawing.ColorFilter.createBlendModeColorFilter(color, drawing.BlendMode.SCREEN);
        expect(colorFilter != null).assertTrue();
      } catch (err) {
        console.info(msg + 'createBlendModeColorFilter error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0280
     * @tc.name      : testColorFilter_CreateComposeColorFilter
     * @tc.desc      : Create a combined color filter that applies inner for filtering and then outer for filtering
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilter_CreateComposeColorFilter', 0, async function () {
      let msg = "testColorFilter_CreateComposeColorFilter"
      console.info(msg + 'begin');
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0290
     * @tc.name      : testColorFilter_CreateLinearToSRGBGamma
     * @tc.desc      : Create a color filter that translates from a linear color space to an SRGB color space
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilter_CreateLinearToSRGBGamma', 0, async function () {
      let msg = "testColorFilter_CreateLinearToSRGBGamma"
      console.info(msg + 'begin');
      const font = new drawing.Font();
      try {
        let colorFilter = drawing.ColorFilter.createLinearToSRGBGamma();
        expect(colorFilter != null).assertTrue();
      } catch (err) {
        console.info(msg + 'createLinearToSRGBGamma error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0300
     * @tc.name      : testColorFilter_CreateSRGBGammaToLinear
     * @tc.desc      : Create a color filter that converts from SRGB color space to linear color space
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilter_CreateSRGBGammaToLinear', 0, async function () {
      let msg = "testColorFilter_CreateSRGBGammaToLinear"
      console.info(msg + 'begin');
      const font = new drawing.Font();
      try {
        let colorFilter = drawing.ColorFilter.createSRGBGammaToLinear();
        expect(colorFilter != null).assertTrue();
      } catch (err) {
        console.info(msg + 'createSRGBGammaToLinear error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0310
     * @tc.name      : testColorFilter_CreateLumaColorFilter
     * @tc.desc      : Create a color filter that multiplies brightness with transparency
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilter_CreateLumaColorFilter', 0, async function () {
      let msg = "testColorFilter_CreateLumaColorFilter"
      console.info(msg + 'begin');
      try {
        let colorFilter = drawing.ColorFilter.createLumaColorFilter();
        expect(colorFilter != null).assertTrue();
      } catch (err) {
        console.info(msg + 'createLumaColorFilter error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0320
     * @tc.name      : testPen_SetColor_Normal_Parameter
     * @tc.desc      : Used to set the color of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPen_SetColor_Normal_Parameter', 0, async function () {
      let msg = "testColorFilter_CreateLumaColorFilter"
      console.info(msg + 'begin');
      const color: common2D.Color = {
        alpha: 255, red: 255, green: 0, blue: 0
      };
      const pen = new drawing.Pen();
      try {
        pen.setColor(color);
      } catch (err) {
        console.info(msg + 'setColor error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0330
     * @tc.name      : testPen_SetStrokeWidth_Normal_Parameter
     * @tc.desc      : Used to set the line width of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPen_SetStrokeWidth_Normal_Parameter', 0, async function () {
      let msg = "testPen_SetStrokeWidth_Normal_Parameter"
      console.info(msg + 'begin');
      const pen = new drawing.Pen();
      try {
        pen.setStrokeWidth(5);
      } catch (err) {
        console.info(msg + 'setStrokeWidth error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_1580
     * @tc.name      : testPen_SetStrokeWidth_NonInteger
     * @tc.desc      : Used to set the line width of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPen_SetStrokeWidth_NonInteger', 0, async function () {
      let msg = "testPen_SetStrokeWidth_NonInteger"
      console.info(msg + 'begin');
      const pen = new drawing.Pen();
      try {
        pen.setStrokeWidth(100.56987);
      } catch (err) {
        console.info(msg + 'setStrokeWidth error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0340
     * @tc.name      : testPen_SetAntiAlias_True
     * @tc.desc      : Used to set whether the brush is anti-aliasing enabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPen_SetAntiAlias_True', 0, async function () {
      let msg = "testPen_SetAntiAlias_True"
      console.info(msg + 'begin');
      const pen = new drawing.Pen();
      try {
        pen.setAntiAlias(true);
      } catch (err) {
        console.info(msg + 'setAntiAlias error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_1610
     * @tc.name      : testPen_SetAntiAlias_False
     * @tc.desc      : Used to set whether the brush is anti-aliasing enabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPen_SetAntiAlias_False', 0, async function () {
      let msg = "testPen_SetAntiAlias_False"
      console.info(msg + 'begin');
      const pen = new drawing.Pen();
      try {
        pen.setAntiAlias(false);
      } catch (err) {
        console.info(msg + 'setAntiAlias error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0350
     * @tc.name      : testPen_SetAlpha_Normal_Parameter
     * @tc.desc      : Used to set the transparency of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPen_SetAlpha_Normal_Parameter', 0, async function () {
      let msg = "testPen_SetAlpha_Normal_Parameter"
      console.info(msg + 'begin');
      const pen = new drawing.Pen();
      try {
        pen.setAlpha(128);
      } catch (err) {
        console.info(msg + 'setAlpha error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_1640
     * @tc.name      : testPen_SetAlpha_NonInteger
     * @tc.desc      : Used to set the transparency of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPen_SetAlpha_NonInteger', 0, async function () {
      let msg = "testPen_SetAlpha_NonInteger"
      console.info(msg + 'begin');
      const pen = new drawing.Pen();
      try {
        pen.setAlpha(206.5894);
      } catch (err) {
        console.info(msg + 'setAlpha error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_1650
     * @tc.name      : testPen_SetAlpha_MinValueZero
     * @tc.desc      : Used to set the transparency of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPen_SetAlpha_MinValueZero', 0, async function () {
      let msg = "testPen_SetAlpha_MinValueZero"
      console.info(msg + 'begin');
      const pen = new drawing.Pen();
      try {
        pen.setAlpha(0);
      } catch (err) {
        console.info(msg + 'setAlpha error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_1660
     * @tc.name      : testPen_SetAlpha_MaxValue
     * @tc.desc      : Used to set the transparency of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPen_SetAlpha_MaxValue', 0, async function () {
      let msg = "testPen_SetAlpha_MaxValue"
      console.info(msg + 'begin');
      const pen = new drawing.Pen();
      try {
        pen.setAlpha(255);
      } catch (err) {
        console.info(msg + 'setAlpha error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_1680
     * @tc.name      : testPen_SetAlpha_LessThan_MinValue
     * @tc.desc      : Used to set the transTparency of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPen_SetAlpha_LessThan_MinValue', 0, async function () {
      let msg = "testPen_SetAlpha_LessThan_MinValue"
      console.info(msg + 'begin');
      const pen = new drawing.Pen();
      try {
        pen.setAlpha(0.1458);
        console.info(msg + 'setAlpha successed');
      } catch (err) {
        console.info(msg + 'setAlpha error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0360
     * @tc.name      : testPen_SetColorFilter
     * @tc.desc      : Used to add additional color filters to the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPen_SetColorFilter', 0, async function () {
      let msg = "testPen_SetColorFilter"
      console.info(msg + 'begin');
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0370
     * @tc.name      : testPen_SetBlendMode_Src
     * @tc.desc      : Used to set the blending mode of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPen_SetBlendMode_Src', 0, async function () {
      let msg = "testPen_SetBlendMode_Src"
      console.info(msg + 'begin');
      const pen = new drawing.Pen();
      try {
        pen.setBlendMode(drawing.BlendMode.SRC);
      } catch (err) {
        console.info(msg + 'setBlendMode error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_1740
     * @tc.name      : testPen_SetBlendMode_Overlay
     * @tc.desc      : Used to set the blending mode of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPen_SetBlendMode_Overlay', 0, async function () {
      let msg = "testPen_SetBlendMode_Overlay"
      console.info(msg + 'begin');
      const pen = new drawing.Pen();
      try {
        pen.setBlendMode(drawing.BlendMode.OVERLAY);
      } catch (err) {
        console.info(msg + 'setBlendMode error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_1750
     * @tc.name      : testPen_SetBlendMode_Luminosity
     * @tc.desc      : Used to set the blending mode of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPen_SetBlendMode_Luminosity', 0, async function () {
      let msg = "testPen_SetBlendMode_Luminosity"
      console.info(msg + 'begin');
      const pen = new drawing.Pen();
      try {
        pen.setBlendMode(drawing.BlendMode.LUMINOSITY);
      } catch (err) {
        console.info(msg + 'setBlendMode error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2090
     * @tc.name      : testPen_SetBlendMode_AllMode
     * @tc.desc      : Used to set the blending mode of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPen_SetBlendMode_AllMode', 0, async function () {
      let msg = "testPen_SetBlendMode_AllMode"
      console.info(msg + 'begin');
      const pen = new drawing.Pen();
      try {
        for (let i = 0;i < blendModeArr.length; i++) {
          pen.setBlendMode(drawing.BlendMode[blendModeArr[i]]);
        }
      } catch (err) {
        console.info(msg + 'setBlendMode error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0380
     * @tc.name      : testPen_SetDither_True
     * @tc.desc      : Turn on the shake paint effect of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPen_SetDither_True', 0, async function () {
      let msg = "testPen_SetDither_True"
      console.info(msg + 'begin');
      const pen = new drawing.Pen();
      try {
        pen.setDither(true);
      } catch (err) {
        console.info(msg + 'setDither error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_1790
     * @tc.name      : testPen_SetDither_False
     * @tc.desc      : Turn on the shake paint effect of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPen_SetDither_False', 0, async function () {
      let msg = "testPen_SetDither_False"
      console.info(msg + 'begin');
      const pen = new drawing.Pen();
      try {
        pen.setDither(false);
      } catch (err) {
        console.info(msg + 'setDither error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0390
     * @tc.name      : testBrush_setColor_Normal_Paremeter
     * @tc.desc      : Used to set the color of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrush_setColor_Normal_Paremeter', 0, async function () {
      let msg = "testBrush_setColor_Normal_Paremeter"
      console.info(msg + 'begin');
      const color: common2D.Color = {
        alpha: 255, red: 255, green: 0, blue: 0
      };
      const brush = new drawing.Brush();
      try {
        brush.setColor(color);
      } catch (err) {
        console.info(msg + 'setColor error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0400
     * @tc.name      : testBrush_SetAntiAlias_True
     * @tc.desc      : Used to set whether to enable anti-aliasing of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrush_SetAntiAlias_True', 0, async function () {
      let msg = "testBrush_SetAntiAlias_True"
      console.info(msg + 'begin');
      const brush = new drawing.Brush();
      try {
        brush.setAntiAlias(true);
      } catch (err) {
        console.info(msg + 'setAntiAlias error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_1920
     * @tc.name      : testBrush_SetAntiAlias_False
     * @tc.desc      : Used to set whether to enable anti-aliasing of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrush_SetAntiAlias_False', 0, async function () {
      let msg = "testBrush_SetAntiAlias_False"
      console.info(msg + 'begin');
      const brush = new drawing.Brush();
      try {
        brush.setAntiAlias(false);
      } catch (err) {
        console.info(msg + 'setAntiAlias error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0410
     * @tc.name      : testBrush_SetAlpha_Normal_Parameter
     * @tc.desc      : Used to set the transparency of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrush_SetAlpha_Normal_Parameter', 0, async function () {
      let msg = "testBrush_SetAlpha_Normal_Parameter"
      console.info(msg + 'begin');
      const brush = new drawing.Brush();
      try {
        brush.setAlpha(128);
      } catch (err) {
        console.info(msg + 'setAlpha error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_1950
     * @tc.name      : testBrush_SetAlpha_NonInteger
     * @tc.desc      : Used to set the transparency of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrush_SetAlpha_NonInteger', 0, async function () {
      let msg = "testBrush_SetAlpha_NonInteger"
      console.info(msg + 'begin');
      const brush = new drawing.Brush();
      try {
        brush.setAlpha(206.5894);
      } catch (err) {
        console.info(msg + 'setAlpha error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_1960
     * @tc.name      : testBrush_SetAlpha_MinValueZero
     * @tc.desc      : Used to set the transparency of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrush_SetAlpha_MinValueZero', 0, async function () {
      let msg = "testBrush_SetAlpha_MinValueZero"
      console.info(msg + 'begin');
      const brush = new drawing.Brush();
      try {
        brush.setAlpha(0);
      } catch (err) {
        console.info(msg + 'setAlpha error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_1970
     * @tc.name      : testBrush_SetAlpha_MaxValue
     * @tc.desc      : Used to set the transparency of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrush_SetAlpha_MaxValue', 0, async function () {
      let msg = "testBrush_SetAlpha_MaxValue"
      console.info(msg + 'begin');
      const brush = new drawing.Brush();
      try {
        brush.setAlpha(255);
      } catch (err) {
        console.info(msg + 'setAlpha error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0420
     * @tc.name      : testBrush_SetColorFilter
     * @tc.desc      : Used to add additional color filters to the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrush_SetColorFilter', 0, async function () {
      let msg = "testBrush_SetColorFilter"
      console.info(msg + 'begin');
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0430
     * @tc.name      : testBrush_SetBlendMode_Src
     * @tc.desc      : Used to set the blending mode of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrush_SetBlendMode_Src', 0, async function () {
      let msg = "testBrush_SetBlendMode_Src"
      console.info(msg + 'begin');
      const brush = new drawing.Brush();
      try {
        brush.setBlendMode(drawing.BlendMode.SRC);
      } catch (err) {
        console.info(msg + 'setBlendMode error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2050
     * @tc.name      : testBrush_SetBlendMode_AllMode
     * @tc.desc      : Used to set the blending mode of the brush
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrush_SetBlendMode_AllMode', 0, async function () {
      let msg = "testBrush_SetBlendMode_AllMode"
      console.info(msg + 'begin');
      const brush = new drawing.Brush();
      try {
        for (let i = 0;i < blendModeArr.length; i++) {
          brush.setBlendMode(drawing.BlendMode[blendModeArr[i]]);
        }
      } catch (err) {
        console.info(msg + 'setBlendMode error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0440
     * @tc.name      : testCanvas_DrawRect_Normal
     * @tc.desc      : Used to draw a rectangle
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawRect_Normal', 0, async function () {
      let msg = "testCanvas_DrawRect_Normal"
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2100
     * @tc.name      : testCanvas_DrawRect_LargeNumber
     * @tc.desc      : Used to draw a rectangle
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawRect_LargeNumber', 0, async function () {
      let msg = "testCanvas_DrawRect_LargeNumber"
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
          left: 1000, right: 5000, top: 30000, bottom: 20000
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2110
     * @tc.name      : testCanvas_DrawRect_Minus
     * @tc.desc      : Used to draw a rectangle
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawRect_Minus', 0, async function () {
      let msg = "testCanvas_DrawRect_Minus"
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
          left: -10, right:-29, top: -100, bottom: -300
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2140
     * @tc.name      : testCanvas_DrawRect_NonInteger
     * @tc.desc      : Used to draw a rectangle
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawRect_NonInteger', 0, async function () {
      let msg = "testCanvas_DrawRect_NonInteger"
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
          left: 10.5689, right:20.5698, top: 59.1795, bottom: 100.000014844
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0450
     * @tc.name      : testCanvas_DrawCircle_Normal
     * @tc.desc      : Used to draw a circle
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawCircle_Normal', 0, async function () {
      let msg = "testCanvas_DrawCircle_Normal"
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2150
     * @tc.name      : testCanvas_DrawCircle_LargeNumber
     * @tc.desc      : Used to draw a circle
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawCircle_LargeNumber', 0, async function () {
      let msg = "testCanvas_DrawCircle_LargeNumber"
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
      try {
        canvas.attachPen(pen);
        console.info(msg + 'attachPen successed');
      } catch (err) {
        console.info(msg + 'attachPen error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        canvas.drawCircle(10000, 20000, 20000);
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2190
     * @tc.name      : testCanvas_DrawCircle_NonInteger
     * @tc.desc      : Used to draw a circle
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawCircle_NonInteger', 0, async function () {
      let msg = "testCanvas_DrawCircle_NonInteger"
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
      try {
        canvas.attachPen(pen);
        console.info(msg + 'attachPen successed');
      } catch (err) {
        console.info(msg + 'attachPen error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        canvas.drawCircle(20.5698, 600.2544, 100.2589);
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0460
     * @tc.name      : testCanvas_DrawImage_Normal
     * @tc.desc      : Used to draw a picture
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawImage_Normal', 0, async function () {
      let msg = "testCanvas_DrawImage_Normal"
      console.info(msg + 'begin');
      await buttonClick('UpdateDrawNode', msg).catch(async err => {
        console.info(msg + err);
        expect().assertFail();
      })
      let pixelMap_: image.PixelMap | null = null;
      const color: ArrayBuffer = new ArrayBuffer(96); //96为需要创建的像素buffer大小，取值为：height * width *4
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
      try {
        canvas.drawImage(pixelMap_, 0, 0);
        console.info(msg + 'drawImage successed');
      } catch (err) {
        console.info(msg + 'drawImage error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2200
     * @tc.name      : testCanvas_DrawImage_LargeNumber
     * @tc.desc      : Used to draw a picture
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawImage_LargeNumber', 0, async function () {
      let msg = "testCanvas_DrawImage_LargeNumber"
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
      try {
        canvas.drawImage(pixelMap_, 20000, 30000);
        console.info(msg + 'drawImage successed');
      } catch (err) {
        console.info(msg + 'drawImage error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2210
     * @tc.name      : testCanvas_DrawImage_Minus
     * @tc.desc      : Used to draw a picture
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawImage_Minus', 0, async function () {
      let msg = "testCanvas_DrawImage_Minus"
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
      try {
        canvas.drawImage(pixelMap_, -30, -70);
        console.info(msg + 'drawImage successed');
      } catch (err) {
        console.info(msg + 'drawImage error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2260
     * @tc.name      : testCanvas_DrawImage_NonInteger
     * @tc.desc      : Used to draw a picture
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawImage_NonInteger', 0, async function () {
      let msg = "testCanvas_DrawImage_NonInteger"
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
      try {
        canvas.drawImage(pixelMap_, 20.5987, 30.598);
        console.info(msg + 'drawImage successed');
      } catch (err) {
        console.info(msg + 'drawImage error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0470
     * @tc.name      : testCanvas_DrawColor_Normal
     * @tc.desc      : Paint background color
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawColor_Normal', 0, async function () {
      let msg = "testCanvas_DrawColor_Normal"
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      let color: common2D.Color = {
        alpha: 255,
        red: 0,
        green: 10,
        blue: 10
      }
      try {
        canvas.drawColor(color, drawing.BlendMode.CLEAR);
        console.info(msg + 'drawColor successed');
      } catch (err) {
        console.info(msg + 'drawColor error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2370
     * @tc.name      : testCanvas_DrawColor_AllBlendMode
     * @tc.desc      : Paint background color
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawColor_AllBlendMode', 0, async function () {
      let msg = "testCanvas_DrawColor_AllBlendMode"
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      let color: common2D.Color = {
        alpha: 255,
        red: 240,
        green: 0,
        blue: 0
      }
      try {
        for (let i = 0;i < blendModeArr.length; i++) {
          canvas.drawColor(color, drawing.BlendMode[blendModeArr[i]]);
          console.info(msg + 'drawColor successed current mode is: '+ drawing.BlendMode[blendModeArr[i]]);
        }
      } catch (err) {
        console.info(msg + 'drawColor error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0480
     * @tc.name      : testCanvas_DrawPoint_Normal
     * @tc.desc      : Used to draw a point
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawPoint_Normal', 0, async function () {
      let msg = "testCanvas_DrawPoint_Normal"
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
      try {
        canvas.drawPoint(10, 10);
        console.info(msg + 'drawPoint successed');
      } catch (err) {
        console.info(msg + 'drawPoint error cause: ' + JSON.stringify(err));
        expect().assertFail();
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2420
     * @tc.name      : testCanvas_DrawPoint_NonInteger
     * @tc.desc      : Used to draw a point
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawPoint_NonInteger', 0, async function () {
      let msg = "testCanvas_DrawPoint_NonInteger"
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
      try {
        canvas.drawPoint(50.268976, 60.21);
        console.info(msg + 'drawPoint successed');
      } catch (err) {
        console.info(msg + 'drawPoint error cause: ' + JSON.stringify(err));
        expect().assertFail();
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2430
     * @tc.name      : testCanvas_DrawPoint_Minus
     * @tc.desc      : Used to draw a point
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawPoint_Minus', 0, async function () {
      let msg = "testCanvas_DrawPoint_Minus"
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
      try {
        canvas.drawPoint(-100, -300);
        console.info(msg + 'drawPoint successed');
      } catch (err) {
        console.info(msg + 'drawPoint error cause: ' + JSON.stringify(err));
        expect().assertFail();
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2440
     * @tc.name      : testCanvas_DrawPoint_LargeNumber
     * @tc.desc      : Used to draw a point
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawPoint_LargeNumber', 0, async function () {
      let msg = "testCanvas_DrawPoint_LargeNumber"
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
      try {
        canvas.drawPoint(20000, 30000);
        console.info(msg + 'drawPoint successed');
      } catch (err) {
        console.info(msg + 'drawPoint error cause: ' + JSON.stringify(err));
        expect().assertFail();
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0490
     * @tc.name      : testCanvas_DrawPath_Normal
     * @tc.desc      : Used to draw a custom path
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawPath_Normal', 0, async function () {
      let msg = "testCanvas_DrawPath_Normal"
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
      try {
        canvas.drawPath(path);
        console.info(msg + 'drawPath successed');
      } catch (err) {
        console.info(msg + 'drawPath error cause: ' + JSON.stringify(err));
        expect().assertFail();
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0500
     * @tc.name      : testCanvas_DrawLine_Normal
     * @tc.desc      : Used to draw a straight line segment
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawLine_Normal', 0, async function () {
      let msg = "testCanvas_DrawLine_Normal"
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2490
     * @tc.name      : testCanvas_DrawLine_SecondQuadrant
     * @tc.desc      : Used to draw a straight line segment
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawLine_SecondQuadrant', 0, async function () {
      let msg = "testCanvas_DrawLine_SecondQuadrant"
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
      try {
        canvas.drawLine(0, 0, 20, -20);
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2500
     * @tc.name      : testCanvas_DrawLine_ThreeQuadrant
     * @tc.desc      : Used to draw a straight line segment
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawLine_ThreeQuadrant', 0, async function () {
      let msg = "testCanvas_DrawLine_ThreeQuadrant"
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
      try {
        canvas.drawLine(0, 0, -20, -20);
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2510
     * @tc.name      : testCanvas_DrawLine_FourQuadrant
     * @tc.desc      : Used to draw a straight line segment
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawLine_FourQuadrant', 0, async function () {
      let msg = "testCanvas_DrawLine_FourQuadrant"
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
      try {
        canvas.drawLine(0, 0, -20, 20);
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2520
     * @tc.name      : testCanvas_DrawLine_SameDot
     * @tc.desc      : Used to draw a straight line segment
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawLine_SameDot', 0, async function () {
      let msg = "testCanvas_DrawLine_SameDot"
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
      try {
        canvas.drawLine(10, 10, 10, 10);
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0510
     * @tc.name      : testCanvas_DrawTextBlob_Normal
     * @tc.desc      : Used to draw a piece of text
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawTextBlob_Normal', 0, async function () {
      let msg = "testCanvas_DrawTextBlob_Normal"
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      const brush = new drawing.Brush();
      try {
        brush.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        console.info(msg + 'setColor successed');
      } catch (err) {
        console.info(msg + 'setColor error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      const font = new drawing.Font();
      try {
        font.setSize(20);
        console.info(msg + 'setSize successed');
      } catch (err) {
        console.info(msg + 'setSize error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      let textBlob;
      try {
        textBlob = drawing.TextBlob.makeFromString("drawing", font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + 'TextBlob.makeFromString successed');
      } catch (err) {
        console.info(msg + 'TextBlob.makeFromString error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        canvas.attachBrush(brush);
        console.info(msg + 'attachBrush successed');
      } catch (err) {
        console.info(msg + 'attachBrush error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        canvas.drawTextBlob(textBlob, 20, 20);
        console.info(msg + 'drawTextBlob successed');
      } catch (err) {
        console.info(msg + 'drawTextBlob error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        canvas.detachBrush();
        console.info(msg + 'detachBrush successed');
      } catch (err) {
        console.info(msg + 'detachBrush error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2590
     * @tc.name      : testCanvas_DrawTextBlob_Minus
     * @tc.desc      : Used to draw a piece of text
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawTextBlob_Minus', 0, async function () {
      let msg = "testCanvas_DrawTextBlob_Minus"
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      const brush = new drawing.Brush();
      try {
        brush.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        console.info(msg + 'setColor successed');
      } catch (err) {
        console.info(msg + 'setColor error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      const font = new drawing.Font();
      try {
        font.setSize(20);
        console.info(msg + 'setSize successed');
      } catch (err) {
        console.info(msg + 'setSize error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      let textBlob;
      try {
        textBlob = drawing.TextBlob.makeFromString("drawing", font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + 'TextBlob.makeFromString successed');
      } catch (err) {
        console.info(msg + 'TextBlob.makeFromString error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        canvas.attachBrush(brush);
        console.info(msg + 'attachBrush successed');
      } catch (err) {
        console.info(msg + 'attachBrush error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        canvas.drawTextBlob(textBlob, -20, -1);
        console.info(msg + 'drawTextBlob successed');
      } catch (err) {
        console.info(msg + 'drawTextBlob error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        canvas.detachBrush();
        console.info(msg + 'detachBrush successed');
      } catch (err) {
        console.info(msg + 'detachBrush error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_2600
     * @tc.name      : testCanvas_DrawTextBlob_NonInteger
     * @tc.desc      : Used to draw a piece of text
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawTextBlob_NonInteger', 0, async function () {
      let msg = "testCanvas_DrawTextBlob_NonInteger"
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      const brush = new drawing.Brush();
      try {
        brush.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        console.info(msg + 'setColor successed');
      } catch (err) {
        console.info(msg + 'setColor error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      const font = new drawing.Font();
      try {
        font.setSize(20);
        console.info(msg + 'setSize successed');
      } catch (err) {
        console.info(msg + 'setSize error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      let textBlob;
      try {
        textBlob = drawing.TextBlob.makeFromString("drawing", font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + 'TextBlob.makeFromString successed');
      } catch (err) {
        console.info(msg + 'TextBlob.makeFromString error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        canvas.attachBrush(brush);
        console.info(msg + 'attachBrush successed');
      } catch (err) {
        console.info(msg + 'attachBrush error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        canvas.drawTextBlob(textBlob, 50.26754, 10.259);
        console.info(msg + 'drawTextBlob successed');
      } catch (err) {
        console.info(msg + 'drawTextBlob error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        canvas.detachBrush();
        console.info(msg + 'detachBrush successed');
      } catch (err) {
        console.info(msg + 'detachBrush error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0520
     * @tc.name      : testCanvas_AttachPenAndDetachPen
     * @tc.desc      : Bind the brush to the canvas
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_AttachPenAndDetachPen', 0, async function () {
      let msg = "testCanvas_AttachPenAndDetachPen"
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
      try {
        canvas.drawRect({
          left: 0, right: 0, top: 10, bottom: 10
        });
        console.info(msg + 'drawRect successed');
      } catch (err) {
        console.info(msg + 'drawRect error cause: ' + JSON.stringify(err));
        expect().assertFail();
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0530
     * @tc.name      : testCanvas_AttachBrushAndDetachBrush
     * @tc.desc      : Bind the brush to the canvas
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_AttachBrushAndDetachBrush', 0, async function () {
      let msg = "testCanvas_AttachBrushAndDetachBrush"
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      const brush = new drawing.Brush();
      try {
        brush.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        console.info(msg + 'setColor successed');
      } catch (err) {
        console.info(msg + 'setColor error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        canvas.attachBrush(brush);
        console.info(msg + 'attachBrush successed');
      } catch (err) {
        console.info(msg + 'attachBrush error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        canvas.drawRect({
          left: 0, right: 0, top: 10, bottom: 10
        });
        console.info(msg + 'drawRect successed');
      } catch (err) {
        console.info(msg + 'drawRect error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        canvas.detachBrush();
        console.info(msg + 'detachBrush successed');
      } catch (err) {
        console.info(msg + 'detachBrush error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_0540
     * @tc.name      : testCanvas_AttachPenAndDetachPen_MoreTime
     * @tc.desc      : Bind the brush to the canvas more times
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_AttachPenAndDetachPen_MoreTime', 0, async function () {
      let msg = "testCanvas_AttachPenAndDetachPen_MoreTime"
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
        console.info(msg + 'attachPen successed first');
      } catch (err) {
        console.info(msg + 'first attachPen error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        canvas.attachPen(pen);
        console.info(msg + 'attachPen successed second');
      } catch (err) {
        console.info(msg + 'second attachPen error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        canvas.drawRect({
          left: 0, right: 0, top: 10, bottom: 10
        });
        console.info(msg + 'drawRect successed');
      } catch (err) {
        console.info(msg + 'drawRect error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        canvas.detachPen();
        console.info(msg + 'detachPen successed first');
      } catch (err) {
        console.info(msg + 'first detachPen error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        canvas.detachPen();
        console.info(msg + 'detachPen successed second');
      } catch (err) {
        console.info(msg + 'second detachPen error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_3070
     * @tc.name      : testCanvas_DrawPixelMapMesh
     * @tc.desc      : The pixel map is drawn on the grid, and the grid is evenly distributed on the pixel map
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawPixelMapMesh', 0, async function () {
      let msg = "testCanvas_DrawPixelMapMesh"
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      const brush = new drawing.Brush();
      try {
        canvas.attachBrush(brush);
      } catch (err) {
        console.info(msg + 'attachBrush error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      let verts : Array<number> = [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360];
      try {
        canvas.drawPixelMapMesh(pixel, 2, 2, verts, 0, null, 0);
      } catch (err) {
        console.info(msg + 'drawPixelMapMesh error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        canvas.detachBrush();
      } catch (err) {
        console.info(msg + 'detachBrush error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_3080
     * @tc.name      : testCanvas_DrawPixelMapMesh_MeshWidth_Invalid
     * @tc.desc      : The pixel map is drawn on the grid, and the grid is evenly distributed on the pixel map
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawPixelMapMesh_MeshWidth_Invalid', 0, async function () {
      let msg = "testCanvas_DrawPixelMapMesh_MeshWidth_Invalid"
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      const brush = new drawing.Brush();
      try {
        canvas.attachBrush(brush);
      } catch (err) {
        console.info(msg + 'attachBrush error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      let verts : Array<number> = [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360];
      try {
        canvas.drawPixelMapMesh(pixel, -2, 2, verts, 0, null, 0);
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'drawPixelMapMesh error cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
      }
      try {
      canvas.detachBrush();
      } catch (err) {
        console.info(msg + 'detachBrush error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_3090
     * @tc.name      : testCanvas_DrawPixelMapMesh_MeshHeight_Invalid
     * @tc.desc      : The pixel map is drawn on the grid, and the grid is evenly distributed on the pixel map
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawPixelMapMesh_MeshHeight_Invalid', 0, async function () {
      let msg = "testCanvas_DrawPixelMapMesh_MeshHeight_Invalid"
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      const brush = new drawing.Brush();
      try {
        canvas.attachBrush(brush);
      } catch (err) {
        console.info(msg + 'attachBrush error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      let verts : Array<number> = [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360];
      try {
        canvas.drawPixelMapMesh(pixel, 2, -2, verts, 0, null, 0);
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'drawPixelMapMesh error cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
      }
      try {
        canvas.detachBrush();
      } catch (err) {
        console.info(msg + 'detachBrush error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_3100
     * @tc.name      : testCanvas_DrawPixelMapMesh_VertOffset_Invalid
     * @tc.desc      : The pixel map is drawn on the grid, and the grid is evenly distributed on the pixel map
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawPixelMapMesh_VertOffset_Invalid', 0, async function () {
      let msg = "testCanvas_DrawPixelMapMesh_VertOffset_Invalid"
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      const brush = new drawing.Brush();
      try {
        canvas.attachBrush(brush);
      } catch (err) {
        console.info(msg + 'attachBrush error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      let verts : Array<number> = [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360];
      try {
        canvas.drawPixelMapMesh(pixel, 2, 2, verts, -10, null, 0);
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'drawPixelMapMesh error cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
      }
      try {
        canvas.detachBrush();
      } catch (err) {
        console.info(msg + 'detachBrush error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_3110
     * @tc.name      : testCanvas_DrawPixelMapMesh_ColorOffset_Invalid
     * @tc.desc      : The pixel map is drawn on the grid, and the grid is evenly distributed on the pixel map
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCanvas_DrawPixelMapMesh_ColorOffset_Invalid', 0, async function () {
      let msg = "testCanvas_DrawPixelMapMesh_ColorOffset_Invalid"
      console.info(msg + 'begin');
      let canvas = new drawing.Canvas(pixel)
      const brush = new drawing.Brush();
      try {
        canvas.attachBrush(brush);
      } catch (err) {
        console.info(msg + 'attachBrush error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
      let verts : Array<number> = [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360];
      try {
        canvas.drawPixelMapMesh(pixel, 2, 2, verts, 1, null, -6);
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'drawPixelMapMesh error cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
      }
      try {
        canvas.detachBrush();
      } catch (err) {
        console.info(msg + 'detachBrush error cause: ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_3120
     * @tc.name      : testFilterMode_Enum
     * @tc.desc      : Filter mode enumeration
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFilterMode_Enum', 0, async function () {
      let msg = "testFilterMode_Enum"
      console.info(msg + 'begin');
      try {
        expect(0).assertEqual(drawing.FilterMode.FILTER_MODE_NEAREST);
        expect(1).assertEqual(drawing.FilterMode.FILTER_MODE_LINEAR);
      } catch (err) {
        console.info(msg + 'test enum value of FilterMode error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_3130
     * @tc.name      : testClipOp_Enum
     * @tc.desc      : Enumeration of canvas cropping methods
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testClipOp_Enum', 0, async function () {
      let msg = "testClipOp_Enum"
      console.info(msg + 'begin');
      try {
        expect(0).assertEqual(drawing.ClipOp.DIFFERENCE);
        expect(1).assertEqual(drawing.ClipOp.INTERSECT);
      } catch (err) {
        console.info(msg + 'test enum value of ClipOp error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_3140
     * @tc.name      : testJoinStyle_Enum
     * @tc.desc      : Defines an enumeration of line corner styles
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testJoinStyle_Enum', 0, async function () {
      let msg = "testJoinStyle_Enum"
      console.info(msg + 'begin');
      try {
        expect(0).assertEqual(drawing.JoinStyle.MITER_JOIN);
        expect(1).assertEqual(drawing.JoinStyle.ROUND_JOIN);
        expect(2).assertEqual(drawing.JoinStyle.BEVEL_JOIN);
      } catch (err) {
        console.info(msg + 'test enum value of JoinStyle error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_3150
     * @tc.name      : testCapStyle_Enum
     * @tc.desc      : Defines an enumeration of line hat styles
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCapStyle_Enum', 0, async function () {
      let msg = "testCapStyle_Enum"
      console.info(msg + 'begin');
      try {
        expect(0).assertEqual(drawing.CapStyle.FLAT_CAP);
        expect(1).assertEqual(drawing.CapStyle.SQUARE_CAP);
        expect(2).assertEqual(drawing.CapStyle.ROUND_CAP);
      } catch (err) {
        console.info(msg + 'test enum value of CapStyle error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWING_JS_API_3160
     * @tc.name      : testBlurType_Enum
     * @tc.desc      : Defines an enumeration of line hat styles
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBlurType_Enum', 0, async function () {
      let msg = "testBlurType_Enum"
      console.info(msg + 'begin');
      try {
        expect(0).assertEqual(drawing.BlurType.NORMAL);
        expect(1).assertEqual(drawing.BlurType.SOLID);
        expect(2).assertEqual(drawing.BlurType.OUTER);
        expect(3).assertEqual(drawing.BlurType.INNER);
      } catch (err) {
        console.info(msg + 'test enum value of BlurType error ' + JSON.stringify(err));
        expect().assertFail();
      }
    })
  })
}

