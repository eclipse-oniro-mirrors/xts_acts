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
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { getRandomNumber } from './utils';

export default function penTest() {
  describe('DrawingTsPenTest', () => {
    const DEFAULT = 0;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {

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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0100
     * @tc.name      : testPenSetColorNormal
     * @tc.desc      : Test for testPenSetColorNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenSetColorNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenSetColorNormal';
      const pen = new drawing.Pen();
      try {
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 0
        });
        console.info(msg + ' setColor successed');
      } catch (e) {
        console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        pen.setColor({
          alpha: 245.3, red: 251.1, green: 10.1, blue: 12.1
        });
        console.info(msg + ' setColor successed');
      } catch (e) {
        console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0101
     * @tc.name      : testPenSetColorNull
     * @tc.desc      : Test for testPenSetColorNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetColorNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetColorNull';
      const pen = new drawing.Pen();

      try {
        pen.setColor(undefined);
        console.info(msg + ' setColor successed');
      } catch (e) {
        console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        pen.setColor(null);
        console.info(msg + ' setColor successed');
      } catch (e) {
        console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0103
     * @tc.name      : testPenSetColorMultipleCalls
     * @tc.desc      : Test for testPenSetColorMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetColorMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetColorMultipleCalls';
      try {
        const pen = new drawing.Pen();
        for (let i = 0; i < 20; i++) {
          pen.setColor({
            alpha: Math.floor(Math.random() * 256),
            red: Math.floor(Math.random() * 256),
            green: Math.floor(Math.random() * 256),
            blue: Math.floor(Math.random() * 256),
          });
        }
        console.info(msg + ' setColor successed');
      } catch (e) {
        console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0104
     * @tc.name      : testPenSetColorBoundaryValue
     * @tc.desc      : Test for testPenSetColorBoundaryValue.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetColorBoundaryValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetColorBoundaryValue';
      const pen = new drawing.Pen();

      try {
        pen.setColor({
          alpha: -1, red: 255, green: 0, blue: 255
        });
        console.info(msg + ' setColor successed');
      } catch (e) {
        console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        pen.setColor({
          alpha: 256, red: 255, green: 0, blue: 255
        });
        console.info(msg + ' setColor successed');
      } catch (e) {
        console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        pen.setColor({
          alpha: 255, red: -2, green: 0, blue: 255
        });
        console.info(msg + ' setColor successed');
      } catch (e) {
        console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        pen.setColor({
          alpha: 255, red: 256, green: 0, blue: 255
        });
        console.info(msg + ' setColor successed');
      } catch (e) {
        console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        pen.setColor({
          alpha: 255, red: 255, green: 256, blue: 255
        });
        console.info(msg + ' setColor successed');
      } catch (e) {
        console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        pen.setColor({
          alpha: 255, red: 255, green: -1, blue: 255
        });
        console.info(msg + ' setColor successed');
      } catch (e) {
        console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: -1
        });
        console.info(msg + ' setColor successed');
      } catch (e) {
        console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        pen.setColor({
          alpha: 255, red: 255, green: 0, blue: 256
        });
        console.info(msg + ' setColor successed');
      } catch (e) {
        console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0200
     * @tc.name      : testPenSetStrokeWidthNormal
     * @tc.desc      : Test for testPenSetStrokeWidthNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenSetStrokeWidthNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenSetStrokeWidthNormal';
      const pen = new drawing.Pen();

      try {
        pen.setStrokeWidth(20);
        console.info(msg + ' setStrokeWidth(20) succeeded');
      } catch (e) {
        console.info(msg + ` setStrokeWidth(20) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        pen.setStrokeWidth(1.1);
        console.info(msg + ' setStrokeWidth(1.1) succeeded');
      } catch (e) {
        console.info(msg + ` setStrokeWidth(1.1) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        pen.setStrokeWidth(0);
        console.info(msg + ' setStrokeWidth(0) succeeded');
      } catch (e) {
        console.info(msg + ` setStrokeWidth(0) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        pen.setStrokeWidth(-1);
        console.info(msg + ' setStrokeWidth(-1) succeeded');
      } catch (e) {
        console.info(msg + ` setStrokeWidth(-1) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0201
     * @tc.name      : testPenSetStrokeWidthNull
     * @tc.desc      : Test for testPenSetStrokeWidthNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetStrokeWidthNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetStrokeWidthNull';
      const pen = new drawing.Pen();

      try {
        pen.setStrokeWidth(undefined);
        console.info(msg + ' setStrokeWidth(undefined) succeeded');
      } catch (e) {
        console.info(msg + ` setStrokeWidth(undefined) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        pen.setStrokeWidth(null);
        console.info(msg + ' setStrokeWidth(null) succeeded');
      } catch (e) {
        console.info(msg + ` setStrokeWidth(null) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0203
     * @tc.name      : testPenSetStrokeWidthMultipleCalls
     * @tc.desc      : Test for testPenSetStrokeWidthMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetStrokeWidthMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetStrokeWidthMultipleCalls';
      const pen = new drawing.Pen();

      for (let i = 0; i < 20; i++) {
        try {
          const randomStrokeWidth = Math.random() * 100; // Generate a random stroke width
          pen.setStrokeWidth(randomStrokeWidth);
          console.info(msg + ' setStrokeWidth(' + randomStrokeWidth + ') succeeded');
        } catch (e) {
          console.info(msg + ` setStrokeWidth errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0300
     * @tc.name      : testPenSetAntiAliasNormal
     * @tc.desc      : Test for testPenSetAntiAliasNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenSetAntiAliasNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenSetAntiAliasNormal';
      const pen = new drawing.Pen();

      try {
        pen.setAntiAlias(true);
        console.info(msg + ' setAntiAlias(true) succeeded');
      } catch (e) {
        console.info(msg + ` setAntiAlias(true) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        pen.setAntiAlias(false);
        console.info(msg + ' setAntiAlias(false) succeeded');
      } catch (e) {
        console.info(msg + ` setAntiAlias(false) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0301
     * @tc.name      : testPenSetAntiAliasNull
     * @tc.desc      : Test for testPenSetAntiAliasNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetAntiAliasNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetAntiAliasNull';
      const pen = new drawing.Pen();

      try {
        pen.setAntiAlias(undefined);
        console.info(msg + ' setAntiAlias(undefined) succeeded');
      } catch (e) {
        console.info(msg + ` setAntiAlias(undefined) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        pen.setAntiAlias(null);
        console.info(msg + ' setAntiAlias(null) succeeded');
      } catch (e) {
        console.info(msg + ` setAntiAlias(null) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0303
     * @tc.name      : testPenSetAntiAliasMultipleCalls
     * @tc.desc      : Test for testPenSetAntiAliasMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetAntiAliasMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetAntiAliasMultipleCalls';
      const pen = new drawing.Pen();

      for (let i = 0; i < 20; i++) {
        try {
          const randomBoolean = Math.random() < 0.5;
          pen.setAntiAlias(randomBoolean);
          console.info(msg + ' setAntiAlias(' + randomBoolean + ') succeeded');
        } catch (e) {
          console.info(msg + ` setAntiAlias errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0400
     * @tc.name      : testPenSetAlphaNormal
     * @tc.desc      : Test for testPenSetAlphaNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenSetAlphaNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenSetAlphaNormal';
      const pen = new drawing.Pen();

      try {
        pen.setAlpha(255);
        console.info(msg + ' setAlpha(255) succeeded');
      } catch (e) {
        console.info(msg + ` setAlpha(255) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        pen.setAlpha(0);
        console.info(msg + ' setAlpha(0) succeeded');
      } catch (e) {
        console.info(msg + ` setAlpha(0) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        pen.setAlpha(255.562);
        console.info(msg + ' setAlpha(255.562) succeeded');
      } catch (e) {
        console.info(msg + ` setAlpha(255.562) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0401
     * @tc.name      : testPenSetAlphaNull
     * @tc.desc      : Test for testPenSetAlphaNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetAlphaNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetAlphaNull';
      const pen = new drawing.Pen();

      try {
        pen.setAlpha(undefined);
        console.info(msg + ' setAlpha(undefined) succeeded');
      } catch (e) {
        console.info(msg + ` setAlpha(undefined) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        pen.setAlpha(null);
        console.info(msg + ' setAlpha(null) succeeded');
      } catch (e) {
        console.info(msg + ` setAlpha(null) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0403
     * @tc.name      : testPenSetAlphaMultipleCalls
     * @tc.desc      : Test for testPenSetAlphaMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetAlphaMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetAlphaMultipleCalls';
      const pen = new drawing.Pen();

      for (let i = 0; i < 20; i++) {
        try {
          const randomAlpha = Math.floor(Math.random() * 256);
          pen.setAlpha(randomAlpha);
          console.info(msg + ' setAlpha(' + randomAlpha + ') succeeded');
        } catch (e) {
          console.info(msg + ` setAlpha errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0500
     * @tc.name      : testPenSetColorFilterNormal
     * @tc.desc      : Test for testPenSetColorFilterNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenSetColorFilterNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenSetColorFilterNormal';
      try {
        const pen = new drawing.Pen();
        pen.setColorFilter(drawing.ColorFilter.createLinearToSRGBGamma());
        console.info(msg + ' setColorFilter successed');
      } catch (e) {
        console.info(msg + ` setColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0501
     * @tc.name      : testPenSetColorFilterNull
     * @tc.desc      : Test for testPenSetColorFilterNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetColorFilterNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetColorFilterNull';
      const pen = new drawing.Pen();

      try {
        pen.setColorFilter(undefined);
        console.info(msg + ' setColorFilter(undefined) succeeded');
      } catch (e) {
        console.info(msg + ` setColorFilter(undefined) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        pen.setColorFilter(null);
        console.info(msg + ' setColorFilter(null) succeeded');
      } catch (e) {
        console.info(msg + ` setColorFilter(null) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0503
     * @tc.name      : testPenSetColorFilterMultipleCalls
     * @tc.desc      : Test for testPenSetColorFilterMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetColorFilterMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetColorFilterMultipleCalls';
      const pen = new drawing.Pen();

      for (let i = 0; i < 20; i++) {
        try {
          pen.setColorFilter(drawing.ColorFilter.createLinearToSRGBGamma());
          console.info(msg + ' setColorFilter successed');
        } catch (e) {
          console.info(msg + ` setColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0600
     * @tc.name      : testPenSetMaskFilterNormal
     * @tc.desc      : Test for testPenSetMaskFilterNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenSetMaskFilterNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenSetMaskFilterNormal';
      try {
        const pen = new drawing.Pen();
        pen.setMaskFilter(drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, 10));
        console.info(msg + ' setMaskFilter successed');
      } catch (e) {
        console.info(msg + ` setMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0601
     * @tc.name      : testPenSetMaskFilterNull
     * @tc.desc      : Test for testPenSetMaskFilterNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetMaskFilterNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetMaskFilterNull';
      const pen = new drawing.Pen();

      try {
        pen.setMaskFilter(undefined);
        console.info(msg + ' setMaskFilter(undefined) succeeded');
      } catch (e) {
        console.info(msg + ` setMaskFilter(undefined) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        pen.setMaskFilter(null);
        console.info(msg + ' setMaskFilter(null) succeeded');
      } catch (e) {
        console.info(msg + ` setMaskFilter(null) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0603
     * @tc.name      : testPenSetMaskFilterMultipleCalls
     * @tc.desc      : Test for testPenSetMaskFilterMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetMaskFilterMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetMaskFilterMultipleCalls';
      const pen = new drawing.Pen();

      for (let i = 0; i < 20; i++) {
        try {
          const randomBlurType = Math.floor(Math.random() * 4);
          const randomValue = Math.floor(Math.random() * 100) + 1;
          pen.setMaskFilter(drawing.MaskFilter.createBlurMaskFilter(randomBlurType, randomValue));
          console.info(msg + ' setMaskFilter(' + randomBlurType + ', ' + randomValue + ') succeeded');
        } catch (e) {
          console.info(msg + ` setMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0700
     * @tc.name      : testPenSetShadowLayerNormal
     * @tc.desc      : Test for testPenSetShadowLayerNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenSetShadowLayerNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenSetShadowLayerNormal';
      try {
        const pen = new drawing.Pen();
        pen.setShadowLayer(drawing.ShadowLayer.create(3, -3, 3, {
          alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00
        }));
        console.info(msg + ' setShadowLayer succeeded');
      } catch (e) {
        console.info(msg + ` setShadowLayer errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0701
     * @tc.name      : testPenSetShadowLayerNull
     * @tc.desc      : Test for testPenSetShadowLayerNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetShadowLayerNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetShadowLayerNull';
      const pen = new drawing.Pen();

      try {
        pen.setShadowLayer(undefined);
        console.info(msg + ' setShadowLayer(undefined) succeeded');
      } catch (e) {
        console.info(msg + ` setShadowLayer(undefined) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        pen.setShadowLayer(null);
        console.info(msg + ' setShadowLayer(null) succeeded');
      } catch (e) {
        console.info(msg + ` setShadowLayer(null) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0703
     * @tc.name      : testPenSetShadowLayerMultipleCalls
     * @tc.desc      : Test for testPenSetShadowLayerMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetShadowLayerMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetShadowLayerMultipleCalls';
      const pen = new drawing.Pen();

      for (let i = 0; i < 20; i++) {
        try {
          const randomColor: common2D.Color = {
            alpha: Math.floor(Math.random() * 256),
            red: Math.floor(Math.random() * 256),
            green: Math.floor(Math.random() * 256),
            blue: Math.floor(Math.random() * 256),
          };
          pen.setShadowLayer(drawing.ShadowLayer.create(Math.random() * 100, Math.random() * 100, Math.random() * 100, randomColor));
          console.info(msg + ' setShadowLayer succeeded');
        } catch (e) {
          console.info(msg + ` setShadowLayer errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0800
     * @tc.name      : testPenSetBlendModeNormal
     * @tc.desc      : Test for testPenSetBlendModeNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenSetBlendModeNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenSetBlendModeNormal';
      try {
        const pen = new drawing.Pen();
        pen.setBlendMode(drawing.BlendMode.SRC);
        console.info(msg + ' setBlendMode successed');
      } catch (e) {
        console.info(msg + ` setBlendMode errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0801
     * @tc.name      : testPenSetBlendModeNull
     * @tc.desc      : Test for testPenSetBlendModeNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetBlendModeNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetBlendModeNull';
      const pen = new drawing.Pen();

      try {
        pen.setBlendMode(undefined);
        console.info(msg + ' setBlendMode(undefined) succeeded');
      } catch (e) {
        console.info(msg + ` setBlendMode(undefined) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        pen.setBlendMode(null);
        console.info(msg + ' setBlendMode(null) succeeded');
      } catch (e) {
        console.info(msg + ` setBlendMode(null) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0803
     * @tc.name      : testPenSetBlendModeMultipleCalls
     * @tc.desc      : Test for testPenSetBlendModeMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetBlendModeMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetBlendModeMultipleCalls';
      const pen = new drawing.Pen();

      for (let i = 0; i < 20; i++) {
        try {
          const randomBlendMode = Math.floor(Math.random() * 29);
          pen.setBlendMode(randomBlendMode);
          console.info(msg + ' setBlendMode(' + randomBlendMode + ') succeeded');
        } catch (e) {
          console.info(msg + ` setBlendMode errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0900
     * @tc.name      : testPenSetGetJoinStyleNormal
     * @tc.desc      : Test for testPenSetGetJoinStyleNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenSetGetJoinStyleNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenSetGetJoinStyleNormal';
      const pen = new drawing.Pen();
      try {
        pen.setJoinStyle(drawing.JoinStyle.ROUND_JOIN);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.ROUND_JOIN);
        pen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.MITER_JOIN);
        pen.setJoinStyle(drawing.JoinStyle.BEVEL_JOIN);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.BEVEL_JOIN);
        console.info(msg + ' setJoinStyle successed');
      } catch (e) {
        console.info(msg + ` setJoinStyle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0901
     * @tc.name      : testPenSetGetJoinStyleNull
     * @tc.desc      : Test for testPenSetGetJoinStyleNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetGetJoinStyleNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetGetJoinStyleNull';
      const pen = new drawing.Pen();

      try {
        // Step 1: Set the join style to undefined
        pen.setJoinStyle(undefined);
        console.info(msg + ' setJoinStyle(undefined) succeeded');
      } catch (e) {
        console.info(msg + ` setJoinStyle(undefined) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        // Step 2: Set the join style to null
        pen.setJoinStyle(null);
        console.info(msg + ' setJoinStyle(null) succeeded');
      } catch (e) {
        console.info(msg + ` setJoinStyle(null) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0903
     * @tc.name      : testPenSetGetJoinStyleMultipleCalls
     * @tc.desc      : Test for testPenSetGetJoinStyleMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetGetJoinStyleMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetGetJoinStyleMultipleCalls';
      const pen = new drawing.Pen();

      for (let i = 0; i < 20; i++) {
        try {
          const randomJoinStyle = Math.floor(Math.random() * 3);
          pen.setJoinStyle(randomJoinStyle);
        } catch (e) {
          console.info(msg + ` setJoinStyle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let i = 0; i < 20; i++) {
        try {
          pen.getJoinStyle();
        } catch (e) {
          console.info(msg + ` getJoinStyle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let i = 0; i < 20; i++) {
        try {
          const anotherRandomJoinStyle = Math.floor(Math.random() * 3);
          pen.setJoinStyle(anotherRandomJoinStyle);
          const anotherJoinStyle = pen.getJoinStyle();
          expect(anotherRandomJoinStyle).assertEqual(anotherJoinStyle);
          console.info(msg + ' setJoinStyle succeeded');
        } catch (e) {
          console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_0904
     * @tc.name      : testPenGetJoinStyleWhenNoSetJoinStyle
     * @tc.desc      : Test for testPenGetJoinStyleWhenNoSetJoinStyle.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testPenGetJoinStyleWhenNoSetJoinStyle', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPenGetJoinStyleWhenNoSetJoinStyle';
      const pen = new drawing.Pen();
      try {
        pen.getJoinStyle();
        console.info(msg + ' getJoinStyle successed');
      } catch (e) {
        console.info(msg + ` getJoinStyle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1000
     * @tc.name      : testPenSetGetCapStyleNormal
     * @tc.desc      : Test for testPenSetGetCapStyleNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenSetGetCapStyleNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenSetGetCapStyleNormal';
      const pen = new drawing.Pen();
      try {
        pen.setCapStyle(drawing.CapStyle.SQUARE_CAP);
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.SQUARE_CAP);
        pen.setCapStyle(drawing.CapStyle.FLAT_CAP);
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.FLAT_CAP);
        pen.setCapStyle(drawing.CapStyle.ROUND_CAP);
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.ROUND_CAP);
        console.info(msg + ' setCapStyle successed');
      } catch (e) {
        console.info(msg + ` setCapStyle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1001
     * @tc.name      : testPenSetGetCapStyleNull
     * @tc.desc      : Test for testPenSetGetCapStyleNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetGetCapStyleNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetGetCapStyleNull';
      const pen = new drawing.Pen();

      try {
        // Step 1: Set the cap style to undefined
        pen.setCapStyle(undefined);
        console.info(msg + ' setCapStyle(undefined) succeeded');
      } catch (e) {
        console.info(msg + ` setCapStyle(undefined) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        // Step 2: Set the cap style to null
        pen.setCapStyle(null);
        console.info(msg + ' setCapStyle(null) succeeded');
      } catch (e) {
        console.info(msg + ` setCapStyle(null) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1003
     * @tc.name      : testPenSetGetCapStyleMultipleCalls
     * @tc.desc      : Test for testPenSetGetCapStyleMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetGetCapStyleMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetGetCapStyleMultipleCalls';
      const pen = new drawing.Pen();

      // Step 1: Set the cap style 20 times
      for (let i = 0; i < 20; i++) {
        try {
          const randomCapStyle = Math.floor(Math.random() * 3);
          pen.setCapStyle(randomCapStyle);
          console.info(msg + ' setCapStyle(' + randomCapStyle + ') succeeded');
        } catch (e) {
          console.info(msg + ` setCapStyle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      // Step 2: Get the cap style 20 times
      for (let i = 0; i < 20; i++) {
        try {
          pen.getCapStyle();
          console.info(msg + ' getCapStyle succeeded');
        } catch (e) {
          console.info(msg + ` getCapStyle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      // Step 3: Alternate setting and getting the cap style 20 times
      for (let i = 0; i < 20; i++) {
        try {
          const anotherRandomCapStyle = Math.floor(Math.random() * 3);
          pen.setCapStyle(anotherRandomCapStyle);
          const anotherCapStyle = pen.getCapStyle();
          expect(anotherRandomCapStyle).assertEqual(anotherCapStyle);
          console.info(msg + ' setCapStyle and getCapStyle succeeded');
        } catch (e) {
          console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1004
     * @tc.name      : testPenGetCapStyleWhenNoSetCapStyle
     * @tc.desc      : Test for testPenGetCapStyleWhenNoSetCapStyle.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testPenGetCapStyleWhenNoSetCapStyle', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPenGetCapStyleWhenNoSetCapStyle';
      const pen = new drawing.Pen();
      try {
        pen.getCapStyle();
        console.info(msg + ' getCapStyle successed');
      } catch (e) {
        console.info(msg + ` getCapStyle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1100
     * @tc.name      : testPenSetDitherNormal
     * @tc.desc      : Test for testPenSetDitherNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenSetDitherNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenSetDitherNormal';
      const pen = new drawing.Pen();
      try {
        pen.setDither(true);
        console.info(msg + ' setDither successed');
      } catch (e) {
        console.info(msg + ` setDither errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        pen.setDither(false);
        console.info(msg + ' setDither successed');
      } catch (e) {
        console.info(msg + ` setDither errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1101
     * @tc.name      : testPenSetDitherNull
     * @tc.desc      : Test for testPenSetDitherNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetDitherNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetDitherNull';
      const pen = new drawing.Pen();

      try {
        // Step 1: Set the dither to undefined
        pen.setDither(undefined);
        console.info(msg + ' setDither(undefined) succeeded');
      } catch (e) {
        console.info(msg + ` setDither(undefined) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        // Step 2: Set the dither to null
        pen.setDither(null);
        console.info(msg + ' setDither(null) succeeded');
      } catch (e) {
        console.info(msg + ` setDither(null) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1103
     * @tc.name      : testPenSetDitherMultipleCalls
     * @tc.desc      : Test for testPenSetDitherMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetDitherMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetDitherMultipleCalls';
      const pen = new drawing.Pen();

      for (let i = 0; i < 20; i++) {
        try {
          const randomBoolean = Math.random() < 0.5;
          pen.setDither(randomBoolean);
          console.info(msg + ' setDither(' + randomBoolean + ') succeeded');
        } catch (e) {
          console.info(msg + ` setDither errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1200
     * @tc.name      : testPenSetPathEffectNormal
     * @tc.desc      : Test for testPenSetPathEffectNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenSetPathEffectNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenSetPathEffectNormal';
      const pen = new drawing.Pen();
      try {
        pen.setPathEffect(drawing.PathEffect.createDashPathEffect([30, 10], 0));
        console.info(msg + ' setPathEffect successed');
      } catch (e) {
        console.info(msg + ` setPathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1201
     * @tc.name      : testPenSetPathEffectNull
     * @tc.desc      : Test for testPenSetPathEffectNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetPathEffectNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetPathEffectNull';
      const pen = new drawing.Pen();

      try {
        // Step 1: Set the path effect to undefined
        pen.setPathEffect(undefined);
        console.info(msg + ' setPathEffect(undefined) succeeded');
      } catch (e) {
        console.info(msg + ` setPathEffect(undefined) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        // Step 2: Set the path effect to null
        pen.setPathEffect(null);
        console.info(msg + ' setPathEffect(null) succeeded');
      } catch (e) {
        console.info(msg + ` setPathEffect(null) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1203
     * @tc.name      : testPenSetPathEffectMultipleCalls
     * @tc.desc      : Test for testPenSetPathEffectMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetPathEffectMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetPathEffectMultipleCalls';
      const pen = new drawing.Pen();

      for (let i = 0; i < 20; i++) {
        try {
          const dashPathEffect = drawing.PathEffect.createDashPathEffect([30, 10], 0);
          pen.setPathEffect(dashPathEffect);
          console.info(msg + ' setPathEffect succeeded');
        } catch (e) {
          console.info(msg + ` setPathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1300
     * @tc.name      : testPenSetColor12Normal
     * @tc.desc      : testPenSetColor12Normal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testPenSetColor12Normal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenSetColor12Normal';
      try {
        const pen = new drawing.Pen();
        pen.setColor(255, 255, 0, 0);
        pen.setColor(245.3, 251.1, 10.1, 12.1);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1301
     * @tc.name      : testPenSetColor12Null
     * @tc.desc      : testPenSetColor12Null
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetColor12Null', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetColor12Null';
      try {
        const pen = new drawing.Pen();
        pen.setColor(undefined, 255, 0, 0);
        console.info(msg + 'setColor12 successed');
      } catch (e) {
        console.info(msg + `setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setColor(255, undefined, 0, 0);
        console.info(msg + 'setColor12 successed');
      } catch (e) {
        console.info(msg + `setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setColor(255, 255, undefined, 0);
        console.info(msg + 'setColor12 successed');
      } catch (e) {
        console.info(msg + `setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setColor(255, 255, 0, undefined);
        console.info(msg + 'setColor12 successed');
      } catch (e) {
        console.info(msg + `setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setColor(null, 255, 0, 0);
        console.info(msg + 'setColor12 successed');
      } catch (e) {
        console.info(msg + `setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setColor(255, null, 0, 0);
        console.info(msg + 'setColor12 successed');
      } catch (e) {
        console.info(msg + `setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setColor(255, 255, null, 0);
        console.info(msg + 'setColor12 successed');
      } catch (e) {
        console.info(msg + `setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setColor(255, 255, 0, null);
        console.info(msg + 'setColor12 successed');
      } catch (e) {
        console.info(msg + `setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1303
     * @tc.name      : testPenSetColor12MultipleCalls
     * @tc.desc      : testPenSetColor12MultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetColor12MultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetColor12MultipleCalls';
      try {
        const pen = new drawing.Pen();
        for (let index = 0; index < 20; index++) {
          pen.setColor(getRandomNumber(0, 255), getRandomNumber(0, 255), getRandomNumber(0, 255),
            getRandomNumber(0, 255));
        }
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_1304
     * @tc.name      : testPenSetColor12BoundaryValue
     * @tc.desc      : testPenSetColor12BoundaryValue
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPenSetColor12BoundaryValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPenSetColor12BoundaryValue';
      try {
        const pen = new drawing.Pen();
        pen.setColor(-1, 255, 0, 0);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setColor(255, -1, 0, 0);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setColor(256, 255, -1, 0);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setColor(255, 255, 0, -1);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setColor(256, 255, 0, 0);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setColor(255, 256, 0, 0);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setColor(255, 255, 256, 0);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setColor(255, 255, 0, 256);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

  });
}