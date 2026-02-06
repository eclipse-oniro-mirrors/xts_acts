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

export default function shadowLayerTest() {
  describe('DrawingTsShadowLayerTest', () => {
    let pixel: image.PixelMap;
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
     * @tc.name   testShadowLayerCreateNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADOWLAYER_0100
     * @tc.desc   Test for testShadowLayerCreateNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShadowLayerCreateNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testShadowLayerCreateNormal';
      const pen = new drawing.Pen();

      try {
        drawing.ShadowLayer.create(50, 100, 100, {
          alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00
        });
        console.info(msg + ' create successed');
      } catch (e) {
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.ShadowLayer.create(50.2, 100.2, 100.1, {
          alpha: 128.22, red: 246.1, green: 0, blue: 0
        });
        console.info(msg + ' create successed');
      } catch (e) {
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.ShadowLayer.create(50, -100, -100, {
          alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00
        });
        console.info(msg + ' create successed');
      } catch (e) {
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        drawing.ShadowLayer.create(50, -100, -100, 0xff00ff00);
        console.info(msg + ' 0xff00ff00 create successed');
      } catch (e) {
        console.info(msg + ` 0xff00ff00 create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testShadowLayerCreateNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADOWLAYER_0101
     * @tc.desc   Test for testShadowLayerCreateNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testShadowLayerCreateNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testShadowLayerCreateNull';

      try {
        drawing.ShadowLayer.create(undefined, 100, 100, {
          alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00
        });
      } catch (e) {
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShadowLayer.create(50, undefined, 100, {
          alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00
        });
      } catch (e) {
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShadowLayer.create(50, 100, undefined, {
          alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00
        });
      } catch (e) {
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShadowLayer.create(50, 100, 100, undefined);
      } catch (e) {
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShadowLayer.create(null, 100, 100, {
          alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00
        });
      } catch (e) {
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShadowLayer.create(50, null, 100, {
          alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00
        });
      } catch (e) {
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShadowLayer.create(50, 100, null, {
          alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00
        });
      } catch (e) {
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShadowLayer.create(50, 100, 100, null);
      } catch (e) {
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testShadowLayerCreateMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADOWLAYER_0103
     * @tc.desc   Test for testShadowLayerCreateMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testShadowLayerCreateMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testShadowLayerCreateMultipleCalls';

      for (let i = 0; i < 20; i++) {
        try {
          const randomRadius = Math.random() * 100;
          const randomOffsetX = Math.random() * 100;
          const randomOffsetY = Math.random() * 100;
          const randomColor: common2D.Color = {
            alpha: Math.floor(Math.random() * 256),
            red: Math.floor(Math.random() * 256),
            green: Math.floor(Math.random() * 256),
            blue: Math.floor(Math.random() * 256)
          };
          drawing.ShadowLayer.create(randomRadius, randomOffsetX, randomOffsetY, randomColor);
          console.info(`${msg} create successed for iteration ${i}`);
        } catch (e) {
          console.info(`${msg} create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testShadowLayerCreateBoundaryValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SHADOWLAYER_0104
     * @tc.desc   Test for testShadowLayerCreateBoundaryValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testShadowLayerCreateBoundaryValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testShadowLayerCreateBoundaryValue';

      try {
        drawing.ShadowLayer.create(50, 100, 100, {
          alpha: -1, red: 255, green: 0, blue: 255
        });
      } catch (e) {
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShadowLayer.create(50, 100, 100, {
          alpha: 256, red: 255, green: 0, blue: 255
        });
      } catch (e) {
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShadowLayer.create(50, 100, 100, {
          alpha: 255, red: -2, green: 0, blue: 255
        });
      } catch (e) {
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShadowLayer.create(50, 100, 100, {
          alpha: 255, red: 256, green: 0, blue: 255
        });
      } catch (e) {
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShadowLayer.create(50, 100, 100, {
          alpha: 255, red: 255, green: 256, blue: 255
        });
      } catch (e) {
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShadowLayer.create(50, 100, 100, {
          alpha: 255, red: 255, green: -1, blue: 255
        });
      } catch (e) {
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShadowLayer.create(50, 100, 100, {
          alpha: 255, red: 255, green: 0, blue: -1
        });
      } catch (e) {
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ShadowLayer.create(50, 100, 100, {
          alpha: 255, red: 255, green: 0, blue: 256
        });
      } catch (e) {
        console.info(msg + ` create errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });


  });
}