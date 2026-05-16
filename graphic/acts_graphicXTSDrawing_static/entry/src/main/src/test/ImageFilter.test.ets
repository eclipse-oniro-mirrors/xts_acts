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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  TestType,
  Size,
  Level
} from "../../../hypium/index";
import image from '@ohos.multimedia.image';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { getRandomNumber } from './Util.test';
import { BusinessError } from '@ohos.base';

export default function imageFilterTest() {
  describe('DrawingTsImageFilterTest', () => {
    let pixel: image.PixelMap | undefined;
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
     * @tc.name   testImageFilterCreateBlurImageFilterNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_STATIC_0100
     * @tc.desc   Test for testImageFilterCreateBlurImageFilterNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageFilterCreateBlurImageFilterNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testImageFilterCreateBlurImageFilterNormalStatic';

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(5, 10, drawing.TileMode.CLAMP);
        console.info(msg + ' createBlurImageFilter CLAMP successed,ImageFilter:' + JSON.stringify(imgFilter));
        if(imgFilter == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
        imgFilter = drawing.ImageFilter.createBlurImageFilter(5, 10, drawing.TileMode.REPEAT);
        console.info(msg + ' createBlurImageFilter CLAMP successed,ImageFilter:' + JSON.stringify(imgFilter));
        if(imgFilter == undefined){
          console.info(msg + ' 2 test failed');
          expect().assertFail();
        }
        imgFilter = drawing.ImageFilter.createBlurImageFilter(5, 10, drawing.TileMode.MIRROR);
        console.info(msg + ' createBlurImageFilter CLAMP successed,ImageFilter:' + JSON.stringify(imgFilter));
        if(imgFilter == undefined){
          console.info(msg + ' 3 test failed');
          expect().assertFail();
        }
        imgFilter = drawing.ImageFilter.createBlurImageFilter(5, 10, drawing.TileMode.DECAL);
        console.info(msg + ' createBlurImageFilter CLAMP successed,ImageFilter:' + JSON.stringify(imgFilter));
        if(imgFilter == undefined){
          console.info(msg + ' 4 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let imgFilter: drawing.ImageFilter | undefined= drawing.ImageFilter.createBlurImageFilter(5, 10, drawing.TileMode.CLAMP);
        if(imgFilter){
          let imgFilter1 = drawing.ImageFilter.createBlurImageFilter(5.1, 10.1, drawing.TileMode.REPEAT, imgFilter)
          console.info(msg + ' createBlurImageFilter REPEAT successed');
          console.info(msg + ' imgFilter:' + imgFilter + ' imgFilter1:' + imgFilter1);
        }
        if(imgFilter == undefined){
          console.info(msg + ' 5 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createBlurImageFilter REPEAT create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(1, 10, drawing.TileMode.CLAMP, null)
        console.info(msg + ' createBlurImageFilter CLAMP null successed,ImageFilter:' + JSON.stringify(imgFilter));
        if(imgFilter == undefined){
          console.info(msg + ' 6 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(10, 1, drawing.TileMode.CLAMP, null);
        console.info(msg + ' createBlurImageFilter CLAMP null successed,ImageFilter:' + JSON.stringify(imgFilter));
        if(imgFilter == undefined){
          console.info(msg + ' 7 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testImageFilterCreateBlurImageFilterMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_STATIC_0101
     * @tc.desc   Test for testImageFilterCreateBlurImageFilterMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageFilterCreateBlurImageFilterMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testImageFilterCreateBlurImageFilterMultipleCallsStatic';

      for (let i = 0; i < 20; i++) {
        let randomNumber = getRandomNumber(1, 100)
        try {
          let imgFilter = drawing.ImageFilter.createBlurImageFilter(randomNumber, randomNumber, drawing.TileMode.CLAMP);
          console.info(msg + ' createBlurImageFilter CLAMP successed,ImageFilter:' + JSON.stringify(imgFilter));
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testImageFilterCreateBlurImageFilterToNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_STATIC_0102
     * @tc.desc   Test for testImageFilterCreateBlurImageFilterToNullStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageFilterCreateBlurImageFilterToNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testImageFilterCreateBlurImageFilterToNullStatic';
      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(10, 10, drawing.TileMode.CLAMP, undefined);
        console.info(msg + ' createBlurImageFilter(null) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createBlurImageFilter(null) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testImageFilterCreateBlurImageFilterAbNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_STATIC_0104
     * @tc.desc   Test for testImageFilterCreateBlurImageFilterAbNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageFilterCreateBlurImageFilterAbNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testImageFilterCreateBlurImageFilterAbNormalStatic';
      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(0, 10, drawing.TileMode.CLAMP);
        console.info(msg + ' createBlurImageFilter succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createBlurImageFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(-1, 10, drawing.TileMode.CLAMP);
        console.info(msg + ' createBlurImageFilter succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createBlurImageFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(5, 0, drawing.TileMode.CLAMP);
        console.info(msg + ' createBlurImageFilter succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createBlurImageFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(5, -1, drawing.TileMode.CLAMP);
        console.info(msg + ' createBlurImageFilter(null) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createBlurImageFilter(null) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testImageFilterCreateFromColorFilterNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_STATIC_0200
     * @tc.desc   Test for testImageFilterCreateFromColorFilterNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageFilterCreateFromColorFilterNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testImageFilterCreateFromColorFilterNormalStatic';

      try {
        let colorFilter = drawing.ColorFilter.createSRGBGammaToLinear();
        if(colorFilter){
          let imgFilter1 = drawing.ImageFilter.createBlurImageFilter(5, 10, drawing.TileMode.CLAMP, null);
          let imgFilter2 = drawing.ImageFilter.createFromColorFilter(colorFilter, imgFilter1);
          console.info(msg + ' createFromColorFilter successed,ImageFilter:' + JSON.stringify(imgFilter2));
          if(imgFilter2 == undefined){
            console.info(msg + ' 1 test failed');
            expect().assertFail();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let colorFilter = drawing.ColorFilter.createSRGBGammaToLinear();
        if(colorFilter){
          let imgFilter2 = drawing.ImageFilter.createFromColorFilter(colorFilter, null);
          console.info(msg + ' createFromColorFilter successed,ImageFilter:' + JSON.stringify(imgFilter2));
          if(imgFilter2 == undefined){
            console.info(msg + ' 2 test failed');
            expect().assertFail();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let colorFilter3 = drawing.ColorFilter.createSRGBGammaToLinear();
        if(colorFilter3){
          let imgFilter3 = drawing.ImageFilter.createFromColorFilter(colorFilter3);
          console.info(msg + ' createFromColorFilter successed,ImageFilter:' + JSON.stringify(imgFilter3));
          if(imgFilter3 == undefined){
            console.info(msg + ' 3 test failed');
            expect().assertFail();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testImageFilterCreateFromColorFilterMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_STATIC_0201
     * @tc.desc   Test for testImageFilterCreateFromColorFilterMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageFilterCreateFromColorFilterMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testImageFilterCreateFromColorFilterMultipleCallsStatic';

      for (let i = 0; i < 20; i++) {
        try {
          let colorFilter = drawing.ColorFilter.createSRGBGammaToLinear();
          if(colorFilter){
            let imgFilter1 = drawing.ImageFilter.createBlurImageFilter(5, 10, drawing.TileMode.CLAMP, null);
            let imgFilter2 = drawing.ImageFilter.createFromColorFilter(colorFilter, imgFilter1);
            console.info(msg + ' createFromColorFilter CLAMP successed,ImageFilter:' + JSON.stringify(imgFilter2));
            if(imgFilter2 == undefined){
              console.info(msg + '  test failed step: ' + i);
              expect().assertFail();
            }
          }
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testImageFilterCreateFromColorFilterToNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_STATIC_0202
     * @tc.desc   Test for testImageFilterCreateFromColorFilterToNullStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testImageFilterCreateFromColorFilterToNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testImageFilterCreateFromColorFilterToNullStatic';
      try {
        let colorFilter = drawing.ColorFilter.createSRGBGammaToLinear();
        if(colorFilter){
          let imgFilter2 = drawing.ImageFilter.createFromColorFilter(colorFilter, undefined);
          console.info(msg + ' createFromColorFilter(null) succeeded');
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromColorFilter(null) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testImageFilterCreateFromImageNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_STATIC_0300
     * @tc.desc   Test for testImageFilterCreateFromImageNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageFilterCreateFromImageNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testImageFilterCreateFromImageNormalStatic';
      let srcRect: common2D.Rect = {
        left: 10,
        top: 10,
        right: 80,
        bottom: 80
      };
      let dstRect: common2D.Rect = {
        left: 200,
        top: 200,
        right: 400,
        bottom: 400
      };
      try {
        let filter = drawing.ImageFilter.createFromImage(pixel!, srcRect, dstRect);
        console.info(msg + ' createFromImage filter succeeded');
        expect(filter != null || filter != undefined).assertTrue();
        if(filter == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage filter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      srcRect = {
        left: 10000,
        top: 10000,
        right: 800000,
        bottom: 800000
      };
      dstRect = {
        left: -200,
        top: -200,
        right: 400,
        bottom: 400
      };
      try {
        let filter1 = drawing.ImageFilter.createFromImage(pixel!, srcRect, dstRect);
        console.info(msg + ' createFromImage filter1 succeeded');
        expect(filter1 != null || filter1 != undefined).assertTrue();
        if(filter1 == undefined){
          console.info(msg + ' filter1 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage filter1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      srcRect = {
        left: 200.3,
        top: 400.0127,
        right: 100.55,
        bottom: 300.2454
      };
      dstRect = {
        left: 300.50,
        top: -200,
        right: 400.3,
        bottom: 400
      };
      try {
        let filter2 = drawing.ImageFilter.createFromImage(pixel!, srcRect, dstRect);
        console.info(msg + ' createFromImage filter2 succeeded');
        expect(filter2 != null || filter2 != undefined).assertTrue();
        if(filter2 == undefined){
          console.info(msg + ' filter2 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage filter2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let filter3 = drawing.ImageFilter.createFromImage(pixel!);
        console.info(msg + ' createFromImage filter3 succeeded');
        expect(filter3 != null || filter3 != undefined).assertTrue();
        if(filter3 == undefined){
          console.info(msg + ' filter3 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage filter3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let filter4 = drawing.ImageFilter.createFromImage(pixel!, null, dstRect);
        console.info(msg + ' createFromImage filter4 succeeded');
        expect(filter4 != null || filter4 != undefined).assertTrue();
        if(filter4 == undefined){
          console.info(msg + ' filter4 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage filter4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let filter5 = drawing.ImageFilter.createFromImage(pixel!, srcRect, null);
        console.info(msg + ' createFromImage filter5 succeeded');
        expect(filter5 != null || filter5 != undefined).assertTrue();
        if(filter5 == undefined){
          console.info(msg + ' filter5 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage filter5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let filter6 = drawing.ImageFilter.createFromImage(pixel!, null, null);
        console.info(msg + ' createFromImage filter6 succeeded');
        expect(filter6 != null || filter6 != undefined).assertTrue();
        if(filter6 == undefined){
          console.info(msg + ' filter6 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage filter6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let filter7 = drawing.ImageFilter.createFromImage(pixel!, srcRect);
        console.info(msg + ' createFromImage filter7 succeeded');
        expect(filter7 != null || filter7 != undefined).assertTrue();
        if(filter7 == undefined){
          console.info(msg + ' filter7 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage filter7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      srcRect = {
        left: Number.MIN_VALUE,
        top: Number.MIN_VALUE,
        right: Number.MAX_VALUE,
        bottom: Number.MAX_VALUE
      };
      dstRect = {
        left: Number.MAX_VALUE,
        top: Number.MAX_VALUE,
        right: Number.MIN_VALUE,
        bottom: Number.MIN_VALUE
      };
      try {
        let filter8 = drawing.ImageFilter.createFromImage(pixel!, srcRect, dstRect);
        console.info(msg + ' createFromImage filter8 succeeded');
        expect(filter8 != null || filter8 != undefined).assertTrue();
        if(filter8 == undefined){
          console.info(msg + ' filter8 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage filter8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testImageFilterCreateFromImageMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_0301
     * @tc.desc   Test for testImageFilterCreateFromImageMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testImageFilterCreateFromImageMultipleCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg = 'testImageFilterCreateFromImageMultipleCalls';
      for (let i = 0; i < 20; i++) {
        let srcRect: common2D.Rect = {
          left: Math.floor(Math.random() * 100),
          top: Math.floor(Math.random() * 100),
          right: Math.floor(Math.random() * 100),
          bottom: Math.floor(Math.random() * 100)
        };
        let dstRect: common2D.Rect = {
          left: Math.floor(Math.random() * 200),
          top: Math.floor(Math.random() * 200),
          right: Math.floor(Math.random() * 200),
          bottom: Math.floor(Math.random() * 200)
        };
        try {
          let ImageFilter = drawing.ImageFilter.createFromImage(pixel!, srcRect, dstRect);
          console.info(msg + ' createFromImage  successed,ImageFilter:' + JSON.stringify(ImageFilter));
          expect(ImageFilter != null || ImageFilter != undefined).assertTrue();
          if(ImageFilter == undefined){
            console.info(msg + ' ImageFilter test failed');
            expect().assertFail();
          }
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testImageFilterCreateFromImageToNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_STATIC_0302
     * @tc.desc   Test for testImageFilterCreateFromImageToNullStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testImageFilterCreateFromImageToNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testImageFilterCreateFromImageToNullStatic';
      let srcRect: common2D.Rect = {
        left: 10,
        top: 10,
        right: 80,
        bottom: 80
      };
      let dstRect: common2D.Rect = {
        left: 200,
        top: 200,
        right: 400,
        bottom: 400
      };
      try {
        let filter2 = drawing.ImageFilter.createFromImage(pixel!, undefined, dstRect);
        console.info(msg + ' createFromImage  successed,filter2:' + JSON.stringify(filter2));
      } catch (e) {
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let filter3 = drawing.ImageFilter.createFromImage(pixel!, srcRect, undefined);
        console.info(msg + ' createFromImage  successed,filter3:' + JSON.stringify(filter3));
      } catch (e) {
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testImageFilterCreateBlendImageFilterNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_STATIC_0400
     * @tc.desc   Test for testImageFilterCreateBlendImageFilterNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageFilterCreateBlendImageFilterNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testImageFilterCreateBlendImageFilterNormalStatic';
      let dx = 15.0;
      let dy = 10.0;
      let offsetFilter1 = drawing.ImageFilter.createOffsetImageFilter(dx, dy, null);
      let x = 15.0;
      let y = 30.0;
      let offsetFilter2 = drawing.ImageFilter.createOffsetImageFilter(x, y, null);
      try {
        let blendImageFilter1 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.CLEAR, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter1 succeeded');
        expect(blendImageFilter1 != null || blendImageFilter1 != undefined).assertTrue();
        if(blendImageFilter1 == undefined){
          console.info(msg + ' blendImageFilter1 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter2 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.SRC, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter2 succeeded');
        expect(blendImageFilter2 != null || blendImageFilter2 != undefined).assertTrue();
        if(blendImageFilter2 == undefined){
          console.info(msg + ' blendImageFilter2 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter3 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.DST, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter3 succeeded');
        expect(blendImageFilter3 != null || blendImageFilter3 != undefined).assertTrue();
        if(blendImageFilter3 == undefined){
          console.info(msg + ' blendImageFilter3 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter4 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.SRC_OVER, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter4 succeeded');
        expect(blendImageFilter4 != null || blendImageFilter4 != undefined).assertTrue();
        if(blendImageFilter4 == undefined){
          console.info(msg + ' blendImageFilter4 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter5 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.DST_OVER, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter5 succeeded');
        expect(blendImageFilter5 != null || blendImageFilter5 != undefined).assertTrue();
        if(blendImageFilter5 == undefined){
          console.info(msg + ' blendImageFilter5 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter6 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.SRC_IN, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter6 succeeded');
        expect(blendImageFilter6 != null || blendImageFilter6 != undefined).assertTrue();
        if(blendImageFilter6 == undefined){
          console.info(msg + ' blendImageFilter6 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter7 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.DST_IN, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter7 succeeded');
        expect(blendImageFilter7 != null || blendImageFilter7 != undefined).assertTrue();
        if(blendImageFilter7 == undefined){
          console.info(msg + ' blendImageFilter7 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter8 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.SRC_OUT, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter8 succeeded');
        expect(blendImageFilter8 != null || blendImageFilter8 != undefined).assertTrue();
        if(blendImageFilter8 == undefined){
          console.info(msg + ' blendImageFilter8 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter9 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.DST_OUT, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter9 succeeded');
        expect(blendImageFilter9 != null || blendImageFilter9 != undefined).assertTrue();
        if(blendImageFilter9 == undefined){
          console.info(msg + ' blendImageFilter9 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter9 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter10 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.SRC_ATOP, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter10 succeeded');
        expect(blendImageFilter10 != null || blendImageFilter10 != undefined).assertTrue();
        if(blendImageFilter10 == undefined){
          console.info(msg + ' blendImageFilter10 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter10 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter11 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.DST_ATOP, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter11 succeeded');
        expect(blendImageFilter11 != null || blendImageFilter11 != undefined).assertTrue();
        if(blendImageFilter11 == undefined){
          console.info(msg + ' blendImageFilter11 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter11 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter12 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.XOR, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter12 succeeded');
        expect(blendImageFilter12 != null || blendImageFilter12 != undefined).assertTrue();
        if(blendImageFilter12 == undefined){
          console.info(msg + ' blendImageFilter12 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter13 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.PLUS, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter13 succeeded');
        expect(blendImageFilter13 != null || blendImageFilter13 != undefined).assertTrue();
        if(blendImageFilter13 == undefined){
          console.info(msg + ' blendImageFilter13 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter13 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter14 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.MODULATE, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter14 succeeded');
        expect(blendImageFilter14 != null || blendImageFilter14 != undefined).assertTrue();
        if(blendImageFilter14 == undefined){
          console.info(msg + ' blendImageFilter14 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter14 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter15 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.SCREEN, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter15 succeeded');
        expect(blendImageFilter15 != null || blendImageFilter15 != undefined).assertTrue();
        if(blendImageFilter15 == undefined){
          console.info(msg + ' blendImageFilter15 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter15 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter16 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.OVERLAY, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter16 succeeded');
        expect(blendImageFilter16 != null || blendImageFilter16 != undefined).assertTrue();
        if(blendImageFilter16 == undefined){
          console.info(msg + ' blendImageFilter16 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter16 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter17 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.DARKEN, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter17 succeeded');
        expect(blendImageFilter17 != null || blendImageFilter17 != undefined).assertTrue();
        if(blendImageFilter17 == undefined){
          console.info(msg + ' blendImageFilter17 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter17 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter18 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.LIGHTEN, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter18 succeeded');
        expect(blendImageFilter18 != null || blendImageFilter18 != undefined).assertTrue();
        if(blendImageFilter18 == undefined){
          console.info(msg + ' blendImageFilter18 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter18 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter19 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.COLOR_DODGE, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter19 succeeded');
        expect(blendImageFilter19 != null || blendImageFilter19 != undefined).assertTrue();
        if(blendImageFilter19 == undefined){
          console.info(msg + ' blendImageFilter19 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter19 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter20 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.COLOR_BURN, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter20 succeeded');
        expect(blendImageFilter20 != null || blendImageFilter20 != undefined).assertTrue();
        if(blendImageFilter20 == undefined){
          console.info(msg + ' blendImageFilter20 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter20 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter21 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.HARD_LIGHT, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter21 succeeded');
        expect(blendImageFilter21 != null || blendImageFilter21 != undefined).assertTrue();
        if(blendImageFilter21 == undefined){
          console.info(msg + ' blendImageFilter21 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter21 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter22 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.SOFT_LIGHT, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter22 succeeded');
        expect(blendImageFilter22 != null || blendImageFilter22 != undefined).assertTrue();
        if(blendImageFilter22 == undefined){
          console.info(msg + ' blendImageFilter22 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter22 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter23 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.DIFFERENCE, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter23 succeeded');
        expect(blendImageFilter23 != null || blendImageFilter23 != undefined).assertTrue();
        if(blendImageFilter23 == undefined){
          console.info(msg + ' blendImageFilter23 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter23 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter24 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.EXCLUSION, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter24 succeeded');
        expect(blendImageFilter24 != null || blendImageFilter24 != undefined).assertTrue();
        if(blendImageFilter24 == undefined){
          console.info(msg + ' blendImageFilter24 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter24 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter25 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.MULTIPLY, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter25 succeeded');
        expect(blendImageFilter25 != null || blendImageFilter25 != undefined).assertTrue();
        if(blendImageFilter25 == undefined){
          console.info(msg + ' blendImageFilter25 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter25 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter26 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.HUE, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter26 succeeded');
        expect(blendImageFilter26 != null || blendImageFilter26 != undefined).assertTrue();
        if(blendImageFilter26 == undefined){
          console.info(msg + ' blendImageFilter26 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter26 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter27 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.SATURATION, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter27 succeeded');
        expect(blendImageFilter27 != null || blendImageFilter27 != undefined).assertTrue();
        if(blendImageFilter27 == undefined){
          console.info(msg + ' blendImageFilter27 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter27 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter28 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.COLOR, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter28 succeeded');
        expect(blendImageFilter28 != null || blendImageFilter28 != undefined).assertTrue();
        if(blendImageFilter28 == undefined){
          console.info(msg + ' blendImageFilter28 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter28 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let blendImageFilter29 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.LUMINOSITY, offsetFilter1!, offsetFilter2!);
        console.info(msg + ' createBlendImageFilter blendImageFilter29 succeeded');
        expect(blendImageFilter29 != null || blendImageFilter29 != undefined).assertTrue();
        if(blendImageFilter29 == undefined){
          console.info(msg + ' blendImageFilter29 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter29 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      let imgFilter = drawing.ImageFilter.createBlurImageFilter(5, 10, drawing.TileMode.CLAMP);
      try {
        let blendImageFilter30 = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.SRC, offsetFilter1! , imgFilter! );
        console.info(msg + ' createBlendImageFilter blendImageFilter30 succeeded');
        expect(blendImageFilter30 != null || blendImageFilter30 != undefined).assertTrue();
        if(blendImageFilter30 == undefined){
          console.info(msg + ' blendImageFilter30 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createFromImage blendImageFilter30 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testImageFilterCreateBlendImageFilterMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_STATIC_0401
     * @tc.desc   Test for testImageFilterCreateBlendImageFilterMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testImageFilterCreateBlendImageFilterMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testImageFilterCreateBlendImageFilterMultipleCallsStatic';
      for (let i = 0; i < 20; i++) {
        let dx = 15.0;
        let dy = 10.0;
        let offsetFilter1 = drawing.ImageFilter.createOffsetImageFilter(dx, dy, null);
        let offsetFilter2 = drawing.ImageFilter.createBlurImageFilter(5, 10, drawing.TileMode.CLAMP);
        try {
          let blendImageFilter = drawing.ImageFilter.createBlendImageFilter(drawing.BlendMode.SRC, offsetFilter1!, offsetFilter2!);
          expect(blendImageFilter != null || blendImageFilter != undefined).assertTrue();
          if(blendImageFilter == undefined){
            console.info(msg + ' test failed step: ' + i);
            expect().assertFail();
          }
        } catch( e ) {
          e = e as BusinessError;
          console.info(msg + ` create errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testImageFilterCreateComposeImageFilterNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_STATIC_0500
     * @tc.desc   Test for testImageFilterCreateComposeImageFilterNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageFilterCreateComposeImageFilterNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testImageFilterCreateComposeImageFilterNormalStatic';
      let blurSigmaX = 10.0;
      let blurSigmaY = 10.0;
      let blurFilter = drawing.ImageFilter.createBlurImageFilter(blurSigmaX, blurSigmaY, drawing.TileMode.CLAMP, null);
      let colorMatrix:Array<number> = [
        0, 0, 0, 0, 0,
        0, 1, 0, 0, 0,
        0, 0, 1, 0, 0,
        0, 0, 0, 1, 0
      ];
      let redRemovalFilter = drawing.ColorFilter.createMatrixColorFilter(colorMatrix);
      let colorFilter = drawing.ImageFilter.createFromColorFilter(redRemovalFilter!, null);
      try {
        let composedImageFilter = drawing.ImageFilter.createComposeImageFilter(colorFilter!, blurFilter!);
        console.info(msg + ' createComposeImageFilter composedImageFilter successed');
        expect(composedImageFilter != null || composedImageFilter != undefined).assertTrue();
        if(composedImageFilter == undefined){
          console.info(msg + ' composedImageFilter test failed');
          expect().assertFail();
        }
      } catch( e ) {
        console.info(msg + ` createComposeImageFilter composedImageFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testImageFilterCreateComposeImageFilterMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_STATIC_0501
     * @tc.desc   Test for testImageFilterCreateComposeImageFilterMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testImageFilterCreateComposeImageFilterMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testImageFilterCreateComposeImageFilterMultipleCallsStatic';
      for (let i = 0; i < 20; i++) {
        let blurSigmaX = 10.0;
        let blurSigmaY = 10.0;
        let blurFilter = drawing.ImageFilter.createBlurImageFilter(blurSigmaX, blurSigmaY, drawing.TileMode.CLAMP, null);
        let shaderEffect = drawing.ShaderEffect.createColorShader(0xFF00FF00.toInt());
        let renderEffect = drawing.ImageFilter.createFromShaderEffect(shaderEffect!);
        try {
          let composedImageFilter = drawing.ImageFilter.createComposeImageFilter(renderEffect! , blurFilter!);
          console.info(msg + ' createComposeImageFilter composedImageFilter successed' + i);
          expect(composedImageFilter != null || composedImageFilter != undefined).assertTrue()
          if(composedImageFilter == undefined){
            console.info(msg + ' composedImageFilter test failed ' + i);
            expect().assertFail();
          }
        } catch( e ) {
          console.info(msg + ` createComposeImageFilter composedImageFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testImageFilterCreateOffsetImageFilterNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_STATIC_0600
     * @tc.desc   Test for testImageFilterCreateOffsetImageFilterNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageFilterCreateOffsetImageFilterNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testImageFilterCreateOffsetImageFilterNormalStatic';
      let dx = 15.0;
      let dy = 10.0;
      try {
        let offsetFilter = drawing.ImageFilter.createOffsetImageFilter(dx, dy, null);
        console.info(msg + ' createOffsetImageFilter offsetFilter successed');
        expect(offsetFilter != null || offsetFilter != undefined).assertTrue();
        if(offsetFilter == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
      } catch( e ) {
        e = e as BusinessError;
        console.info(msg + ` createOffsetImageFilter offsetFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        let offsetFilter2 = drawing.ImageFilter.createOffsetImageFilter(-13, 300);
        console.info(msg + ' createOffsetImageFilter offsetFilter2 successed');
        expect(offsetFilter2 != null || offsetFilter2 != undefined).assertTrue();
        if(offsetFilter2 == undefined){
          console.info(msg + ' offsetFilter2 test failed');
          expect().assertFail();
        }
      } catch( e ) {
        e = e as BusinessError;
        console.info(msg + ` createOffsetImageFilter offsetFilter2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      let blurSigmaX = 10.0;
      let blurSigmaY = 10.0;
      let blurFilter = drawing.ImageFilter.createBlurImageFilter(blurSigmaX, blurSigmaY, drawing.TileMode.CLAMP, null);
      try {
        let offsetFilter3 = drawing.ImageFilter.createOffsetImageFilter(300, -100, blurFilter! );
        console.info(msg + ' createOffsetImageFilter offsetFilter3 successed');
        expect(offsetFilter3 != null || offsetFilter3 != undefined).assertTrue();
        if(offsetFilter3 == undefined){
          console.info(msg + ' offsetFilter3 test failed');
          expect().assertFail();
        }
      } catch( e ) {
        e = e as BusinessError;
        console.info(msg + ` createOffsetImageFilter offsetFilter3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      let colorMatrix:Array<number> = [
        0, 0, 0, 0, 0,
        0, 1, 0, 0, 0,
        0, 0, 1, 0, 0,
        0, 0, 0, 1, 0
      ];
      let redRemovalFilter = drawing.ColorFilter.createMatrixColorFilter(colorMatrix);
      let colorFilter = drawing.ImageFilter.createFromColorFilter(redRemovalFilter!, null);
      try {
        let offsetFilter4 = drawing.ImageFilter.createOffsetImageFilter(1000000, 1000000, colorFilter!);
        console.info(msg + ' createOffsetImageFilter offsetFilter4 successed');
        expect(offsetFilter4 != null || offsetFilter4 != undefined).assertTrue()
        if(offsetFilter4 == undefined){
          console.info(msg + ' offsetFilter4 test failed');
          expect().assertFail();
        }
      } catch( e ) {
        e = e as BusinessError;
        console.info(msg + ` createOffsetImageFilter offsetFilter4 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        let offsetFilter5 = drawing.ImageFilter.createOffsetImageFilter(Number.MAX_VALUE, Number.MAX_VALUE, colorFilter!);
        console.info(msg + ' createOffsetImageFilter offsetFilter5 successed');
        expect(offsetFilter5 != null || offsetFilter5 != undefined).assertTrue()
        if(offsetFilter5 == undefined){
          console.info(msg + ' offsetFilter5 test failed');
          expect().assertFail();
        }
      } catch( e ) {
        e = e as BusinessError;
        console.info(msg + ` createOffsetImageFilter offsetFilter5 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testImageFilterCreateOffsetImageFilterMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_0601
     * @tc.desc   Test for testImageFilterCreateOffsetImageFilterMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testImageFilterCreateOffsetImageFilterMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testImageFilterCreateOffsetImageFilterMultipleCalls';
      for (let i = 0; i < 20; i++) {
        let blurSigmaX = 10.0;
        let blurSigmaY = 10.0;
        let blurFilter = drawing.ImageFilter.createBlurImageFilter(blurSigmaX, blurSigmaY, drawing.TileMode.CLAMP, null);
        try {
          let offsetFilter = drawing.ImageFilter.createOffsetImageFilter(Math.random() * 10, Math.random() * 100, blurFilter!);
          console.info(msg + ' createOffsetImageFilter offsetFilter successed' + i);
          expect(offsetFilter != null || offsetFilter != undefined).assertTrue();
          if(offsetFilter == undefined){
            console.info(msg + ' offsetFilter test failed ' + i);
            expect().assertFail();
          }
        } catch( e ) {
          e = e as BusinessError;
          console.info(msg + ` createOffsetImageFilter offsetFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testImageFilterCreateOffsetImageFilterToNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_STATIC_0602
     * @tc.desc   Test for testImageFilterCreateOffsetImageFilterToNullStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testImageFilterCreateOffsetImageFilterToNullStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, () => {
      const msg = 'testImageFilterCreateOffsetImageFilterToNullStatic';
      let blurSigmaX = 10.0;
      let blurSigmaY = 10.0;
      let blurFilter = drawing.ImageFilter.createBlurImageFilter(blurSigmaX, blurSigmaY, drawing.TileMode.CLAMP, null);
      try {
        let offsetFilter2 = drawing.ImageFilter.createOffsetImageFilter(200, 200, null);
        console.info(msg + ' createOffsetImageFilter 4 successed');
      } catch( e ) {
        e = e as BusinessError;
        console.info(msg + ` createOffsetImageFilter 4 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        let offsetFilter3 = drawing.ImageFilter.createOffsetImageFilter(200, 200, undefined);
        console.info(msg + ' createOffsetImageFilter 5 successed');
      } catch( e ) {
        e = e as BusinessError;
        console.info(msg + ` createOffsetImageFilter 5 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testImageFilterCreateFromShaderEffectNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_STATIC_0700
     * @tc.desc   Test for testImageFilterCreateFromShaderEffectNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageFilterCreateFromShaderEffectNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testImageFilterCreateFromShaderEffectNormalStatic';
      let shaderEffect0 = drawing.ShaderEffect.createColorShader(0xFF00FF00.toInt());
      try {
        let renderEffect = drawing.ImageFilter.createFromShaderEffect(shaderEffect0!);
        console.info(msg + ' createFromShaderEffect renderEffect successed');
        expect(renderEffect != null || renderEffect != undefined).assertTrue()
        if(renderEffect == undefined){
          console.info(msg + ' renderEffect test failed');
          expect().assertFail();
        }
      } catch( e ) {
        e = e as BusinessError;
        console.info(msg + ` createFromShaderEffect renderEffect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      let dstShader = drawing.ShaderEffect.createColorShader(0xFF0000FF.toInt());
      let srcShader = drawing.ShaderEffect.createColorShader(0xFFFF0000.toInt());
      let shaderEffect = drawing.ShaderEffect.createComposeShader(dstShader!, srcShader!, drawing.BlendMode.SRC);
      try {
        let renderEffect1 = drawing.ImageFilter.createFromShaderEffect(shaderEffect!);
        console.info(msg + ' createFromShaderEffect renderEffect1 successed');
        expect(renderEffect1 != null || renderEffect1 != undefined).assertTrue()
        if(renderEffect1 == undefined){
          console.info(msg + ' renderEffect1 test failed');
          expect().assertFail();
        }
      } catch( e ) {
        e = e as BusinessError;
        console.info(msg + ` createFromShaderEffect renderEffect1 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      let startPt: common2D.Point = { x: 100, y: 100 };
      let endPt: common2D.Point = { x: 300, y: 300 };
      shaderEffect  = drawing.ShaderEffect.createLinearGradient(startPt, endPt, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT);
      try {
        let renderEffect2 = drawing.ImageFilter.createFromShaderEffect(shaderEffect!);
        console.info(msg + ' createFromShaderEffect renderEffect2 successed');
        expect(renderEffect2 != null || renderEffect2 != undefined).assertTrue()
        if(renderEffect2 == undefined){
          console.info(msg + ' renderEffect2 test failed');
          expect().assertFail();
        }
      } catch( e ) {
        e = e as BusinessError;
        console.info(msg + ` createFromShaderEffect renderEffect2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testImageFilterCreateFromShaderEffectMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_STATIC_0701
     * @tc.desc   Test for testImageFilterCreateFromShaderEffectMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testImageFilterCreateFromShaderEffectMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testImageFilterCreateFromShaderEffectMultipleCallsStatic';
      for (let i = 0; i < 20; i++) {
        let shaderEffect = drawing.ShaderEffect.createColorShader(0xFF00FF00.toInt());
        try {
          let renderEffect = drawing.ImageFilter.createFromShaderEffect(shaderEffect!);
          console.info(msg + ' createFromShaderEffect renderEffect successed' + i);
          expect(renderEffect != null || renderEffect != undefined).assertTrue();
          if(renderEffect == undefined){
            console.info(msg + ' createFromShaderEffect test failed ' + i);
            expect().assertFail();
          }
        } catch( e ) {
          e = e as BusinessError;
          console.info(msg + ` createFromShaderEffect renderEffect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });
  })
}