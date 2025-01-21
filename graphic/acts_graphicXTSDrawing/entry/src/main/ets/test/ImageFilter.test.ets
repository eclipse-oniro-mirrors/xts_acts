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

import { afterAll , afterEach , beforeAll , beforeEach , describe , expect , it } from '@ohos/hypium';
import image from '@ohos.multimedia.image';
import drawing from '@ohos.graphics.drawing';
import uiEffect from '@ohos.graphics.uiEffect';
import { getRandomNumber } from './utils';

export default function imageFilterTest() {
  describe('DrawingTsImageFilterTest' , () => {
    let pixel: image.PixelMap;
    const DEFAULT = 0;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async() => {

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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_0100
     * @tc.name      : testImageFilterCreateBlurImageFilterNormal
     * @tc.desc      : Test for testImageFilterCreateBlurImageFilterNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testImageFilterCreateBlurImageFilterNormal' , DEFAULT , () => {
      const msg = 'testImageFilterCreateBlurImageFilterNormal';

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(5 , 10 , uiEffect.TileMode.CLAMP);
        console.info(msg + ' createBlurImageFilter CLAMP successed,ImageFilter:' + JSON.stringify(imgFilter));
        imgFilter = drawing.ImageFilter.createBlurImageFilter(5, 10, uiEffect.TileMode.REPEAT);
        console.info(msg + ' createBlurImageFilter CLAMP successed,ImageFilter:' + JSON.stringify(imgFilter));
        imgFilter = drawing.ImageFilter.createBlurImageFilter(5, 10, uiEffect.TileMode.MIRROR);
        console.info(msg + ' createBlurImageFilter CLAMP successed,ImageFilter:' + JSON.stringify(imgFilter));
        imgFilter = drawing.ImageFilter.createBlurImageFilter(5, 10, uiEffect.TileMode.DECAL);
        console.info(msg + ' createBlurImageFilter CLAMP successed,ImageFilter:' + JSON.stringify(imgFilter));
      } catch( e ) {
        console.info(msg + ` create errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let imgFilter: drawing.ImageFilter = {};
        let imgFilter1 = drawing.ImageFilter.createBlurImageFilter(5.1 , 10.1 , uiEffect.TileMode.REPEAT , imgFilter)
        console.info(msg + ' createBlurImageFilter REPEAT successed');
        console.info(msg + ' imgFilter:' + imgFilter + ' imgFilter1:' + imgFilter1);
      } catch( e ) {
        console.info(msg + ` create errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(1 , 10 , uiEffect.TileMode.CLAMP , null)
        console.info(msg + ' createBlurImageFilter CLAMP null successed,ImageFilter:' + JSON.stringify(imgFilter));
      } catch( e ) {
        console.info(msg + ` create errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(10 , 1 , uiEffect.TileMode.CLAMP , null);
        console.info(msg + ' createBlurImageFilter CLAMP null successed,ImageFilter:' + JSON.stringify(imgFilter));
      } catch( e ) {
        console.info(msg + ` create errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_0101
     * @tc.name      : testImageFilterCreateBlurImageFilterMultipleCalls
     * @tc.desc      : Test for testImageFilterCreateBlurImageFilterMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testImageFilterCreateBlurImageFilterMultipleCalls' , DEFAULT , () => {
      const msg = 'testImageFilterCreateBlurImageFilterMultipleCalls';

      for ( let i = 0 ; i < 20 ; i ++ ) {
        let randomNumber =getRandomNumber(1,100)
        try {
          let imgFilter = drawing.ImageFilter.createBlurImageFilter(randomNumber, randomNumber, uiEffect.TileMode.CLAMP);
          console.info(msg + ' createBlurImageFilter CLAMP successed,ImageFilter:' + JSON.stringify(imgFilter));
        } catch( e ) {
          console.info(msg + ` create errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_0102
     * @tc.name      : testImageFilterCreateBlurImageFilterToNull
     * @tc.desc      : Test for testImageFilterCreateBlurImageFilterToNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testImageFilterCreateBlurImageFilterToNull' , DEFAULT , () => {
      const msg = 'testImageFilterCreateBlurImageFilterToNull';

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(null, 10, uiEffect.TileMode.CLAMP,null);
        console.info(msg + ' createBlurImageFilter(null) succeeded');
      } catch( e ) {
        console.info(msg + ` createBlurImageFilter(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(5, null, uiEffect.TileMode.CLAMP,null);
        console.info(msg + ' createBlurImageFilter(null) succeeded');
      } catch( e ) {
        console.info(msg + ` createBlurImageFilter(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(5, 10, null,null);
        console.info(msg + ' createBlurImageFilter(null) succeeded');
      } catch( e ) {
        console.info(msg + ` createBlurImageFilter(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(null, 10, uiEffect.TileMode.CLAMP,null);
        console.info(msg + ' createBlurImageFilter(null) succeeded');
      } catch( e ) {
        console.info(msg + ` createBlurImageFilter(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(5, null, uiEffect.TileMode.CLAMP,null);
        console.info(msg + ' createBlurImageFilter(null) succeeded');
      } catch( e ) {
        console.info(msg + ` createBlurImageFilter(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(5, 10, null,null);
        console.info(msg + ' createBlurImageFilter(null) succeeded');
      } catch( e ) {
        console.info(msg + ` createBlurImageFilter(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(10, 10, uiEffect.TileMode.CLAMP, undefined);
        console.info(msg + ' createBlurImageFilter(null) succeeded');
      } catch( e ) {
        console.info(msg + ` createBlurImageFilter(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_0103
     * @tc.name      : testImageFilterCreateBlurImageFilterMismatch
     * @tc.desc      : Test for testImageFilterCreateBlurImageFilterMismatch.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testImageFilterCreateBlurImageFilterMismatch' , DEFAULT , () => {
      const msg = 'testImageFilterCreateBlurImageFilterMismatch';

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(5, 10, uiEffect.TileMode.CLAMP,null,10);
        console.info(msg + ' createBlurImageFilter succeeded');
      } catch( e ) {
        console.info(msg + ` createBlurImageFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(5, 10);
        console.info(msg + ' createBlurImageFilter succeeded');
      } catch( e ) {
        console.info(msg + ` createBlurImageFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter('s', 10, uiEffect.TileMode.CLAMP);
        console.info(msg + ' createBlurImageFilter succeeded');
      } catch( e ) {
        console.info(msg + ` createBlurImageFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_0104
     * @tc.name      : testImageFilterCreateBlurImageFilterAbnormal
     * @tc.desc      : Test for testImageFilterCreateBlurImageFilterAbnormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testImageFilterCreateBlurImageFilterAbnormal' , DEFAULT , () => {
      const msg = 'testImageFilterCreateBlurImageFilterAbnormal';

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(5, 10, 10);
        console.info(msg + ' createBlurImageFilter succeeded');
      } catch( e ) {
        console.info(msg + ` createBlurImageFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(0, 10, uiEffect.TileMode.CLAMP);
        console.info(msg + ' createBlurImageFilter succeeded');
      } catch( e ) {
        console.info(msg + ` createBlurImageFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(-1, 10, uiEffect.TileMode.CLAMP);
        console.info(msg + ' createBlurImageFilter succeeded');
      } catch( e ) {
        console.info(msg + ` createBlurImageFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(5, 0, uiEffect.TileMode.CLAMP);
        console.info(msg + ' createBlurImageFilter succeeded');
      } catch( e ) {
        console.info(msg + ` createBlurImageFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let imgFilter = drawing.ImageFilter.createBlurImageFilter(5, -1, uiEffect.TileMode.CLAMP);
        console.info(msg + ' createBlurImageFilter(null) succeeded');
      } catch( e ) {
        console.info(msg + ` createBlurImageFilter(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_0200
     * @tc.name      : testImageFilterCreateFromColorFilterNormal
     * @tc.desc      : Test for testImageFilterCreateFromColorFilterNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testImageFilterCreateFromColorFilterNormal' , DEFAULT , () => {
      const msg = 'testImageFilterCreateFromColorFilterNormal';

      try {
        let colorFilter = drawing.ColorFilter.createSRGBGammaToLinear();
        let imgFilter1 = drawing.ImageFilter.createBlurImageFilter(5, 10, uiEffect.TileMode.CLAMP, null);
        let imgFilter2 = drawing.ImageFilter.createFromColorFilter(colorFilter, imgFilter1);
        console.info(msg + ' createFromColorFilter successed,ImageFilter:' + JSON.stringify(imgFilter2));
      } catch( e ) {
        console.info(msg + ` createFromColorFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let colorFilter = drawing.ColorFilter.createSRGBGammaToLinear();
        let imgFilter2 = drawing.ImageFilter.createFromColorFilter(colorFilter, null);
        console.info(msg + ' createFromColorFilter successed,ImageFilter:' + JSON.stringify(imgFilter2));
      } catch( e ) {
        console.info(msg + ` createFromColorFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_0201
     * @tc.name      : testImageFilterCreateFromColorFilterMultipleCalls
     * @tc.desc      : Test for testImageFilterCreateFromColorFilterMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testImageFilterCreateFromColorFilterMultipleCalls' , DEFAULT , () => {
      const msg = 'testImageFilterCreateFromColorFilterMultipleCalls';

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let colorFilter = drawing.ColorFilter.createSRGBGammaToLinear();
          let imgFilter1 = drawing.ImageFilter.createBlurImageFilter(5, 10, uiEffect.TileMode.CLAMP, null);
          let imgFilter2 = drawing.ImageFilter.createFromColorFilter(colorFilter, imgFilter1);
          console.info(msg + ' createFromColorFilter CLAMP successed,ImageFilter:' + JSON.stringify(imgFilter2));
        } catch( e ) {
          console.info(msg + ` create errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }

    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_0202
     * @tc.name      : testImageFilterCreateFromColorFilterToNull
     * @tc.desc      : Test for testImageFilterCreateFromColorFilterToNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testImageFilterCreateFromColorFilterToNull' , DEFAULT , () => {
      const msg = 'testImageFilterCreateFromColorFilterToNull';

      try {
        let imgFilter1 = drawing.ImageFilter.createBlurImageFilter(5, 10, uiEffect.TileMode.CLAMP, null);
        let imgFilter2 = drawing.ImageFilter.createFromColorFilter(null, imgFilter1);
        console.info(msg + ' createFromColorFilter(null) succeeded');
      } catch( e ) {
        console.info(msg + ` createFromColorFilter(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let imgFilter1 = drawing.ImageFilter.createBlurImageFilter(5, 10, uiEffect.TileMode.CLAMP, null);
        let imgFilter2 = drawing.ImageFilter.createFromColorFilter(undefined, imgFilter1);
        console.info(msg + ' createFromColorFilter(null) succeeded');
      } catch( e ) {
        console.info(msg + ` createFromColorFilter(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let colorFilter = drawing.ColorFilter.createSRGBGammaToLinear();
        let imgFilter2 = drawing.ImageFilter.createFromColorFilter(colorFilter, undefined);
        console.info(msg + ' createFromColorFilter(null) succeeded');
      } catch( e ) {
        console.info(msg + ` createFromColorFilter(null) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_IMAGEFILTER_0203
     * @tc.name      : testImageFilterCreateFromColorFilterMismatch
     * @tc.desc      : Test for testImageFilterCreateFromColorFilterMismatch.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testImageFilterCreateFromColorFilterMismatch' , DEFAULT , () => {
      const msg = 'testImageFilterCreateFromColorFilterMismatch';

      try {
        let colorFilter = drawing.ColorFilter.createSRGBGammaToLinear();
        let imgFilter1 = drawing.ImageFilter.createBlurImageFilter(5, 10, uiEffect.TileMode.CLAMP, null);
        let imgFilter2 = drawing.ImageFilter.createFromColorFilter(colorFilter, imgFilter1, imgFilter1);
        console.info(msg + ' createFromColorFilter succeeded');
      } catch( e ) {
        console.info(msg + ` createFromColorFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let colorFilter = drawing.ColorFilter.createSRGBGammaToLinear();
        let imgFilter2 = drawing.ImageFilter.createFromColorFilter(colorFilter);
        console.info(msg + ' createFromColorFilter succeeded');
      } catch( e ) {
        console.info(msg + ` createFromColorFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        let imgFilter1 = drawing.ImageFilter.createBlurImageFilter(5, 10, uiEffect.TileMode.CLAMP, null);
        let imgFilter2 = drawing.ImageFilter.createFromColorFilter('s', imgFilter1);
        console.info(msg + ' createFromColorFilter succeeded');
      } catch( e ) {
        console.info(msg + ` createFromColorFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });
  })
}