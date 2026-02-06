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
  })
}