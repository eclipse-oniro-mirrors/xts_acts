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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from "../../../hypium/index";
import drawing from '@ohos.graphics.drawing';
import image from '@ohos.multimedia.image';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function drawingTsRegionPart2Test() {
  describe('drawingTsRegionPart2Test', () => {
    let pixel: image.PixelMap;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      const color: ArrayBuffer = new ArrayBuffer(40000); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: {
          height: 100, width: 100
        }
      }
      pixel = await image.createPixelMap(color, opts);
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });
    /**
     * @tc.name   testRegionIsRectNormal1Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_1900
     * @tc.desc   testRegionIsRectNormal1Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionIsRectNormal1Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRegionIsRectNormal1Static';
      let region = new drawing.Region();
      let region2 = new drawing.Region();
      try {
        let result = region.isRect();
        console.info(msg + `isRect 1 successed result: ${result}`);
        expect(result).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `isRect 1 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      // try {
      //   region.setRegion(region2);
      //   let result = region.isRect();
      //   console.info(msg + `isRect 2 successed result: ${result}`);
      //   expect(result).assertEqual(false);
      // } catch (e) {
      //   e = e as BusinessError;
      //   console.info(msg + `isRect 2 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
      //   expect().assertFail();
      // }
      try {
        region.setRect(0, 0, 0, 0)
        let result = region.isRect();
        console.info(msg + `isRect 3 successed result: ${result}`);
        expect(result).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `isRect 3 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRegionIsRectNormal2Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_1901
     * @tc.desc   testRegionIsRectNormal2Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegionIsRectNormal2Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg = 'testRegionIsRectNormal2Static';
      let region = new drawing.Region();
      let region2 = new drawing.Region();
      region.setRect(100, 100, 300, 100);
      try {
        let result = region.isRect();
        console.info(msg + `isRect 1 successed result: ${result}`);
        expect(result).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `isRect 1 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      try {
        region.setRect(100, 100,100 , 200);
        let result = region.isRect();
        console.info(msg + `isRect 2 successed result: ${result}`);
        expect(result).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `isRect 2 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      try {
        region.setRect(100, 100,100 , 100);
        let result = region.isRect();
        console.info(msg + `isRect 3 successed result: ${result}`);
        expect(result).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `isRect 3 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      try {
        region.setRect(100, 100,300 , 300);
        let result = region.isRect();
        console.info(msg + `isRect 4 successed result: ${result}`);
        expect(result).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `isRect 4 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      try {
        region2.setRect(0, 0,300 , 300);
        // region.setRegion(region2);
        let result = region.isRect();
        console.info(msg + `isRect 5 successed result: ${result}`);
        expect(result).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `isRect 5 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRegionIsRectNormal3Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_1902
     * @tc.desc   testRegionIsRectNormal3Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegionIsRectNormal3Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRegionIsRectNormal3Static';
      let region = new drawing.Region();
      region.setRect(450, 50, 550, 150);
      let othregion = new drawing.Region();
      othregion.setRect(400, 0, 500, 100);
      region.op(othregion, drawing.RegionOp.UNION);
      try {
        let result = region.isRect();
        console.info(msg + `isRect 1 successed result: ${result}`);
        expect(result).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `isRect 1 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      try {
        region.setEmpty();
        othregion.setRect(400, 200, 500, 300);
        region.op(othregion, drawing.RegionOp.UNION);
        let result = region.isRect();
        console.info(msg + `isRect 2 successed result: ${result}`);
        expect(result).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `isRect 2 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      try {
        region.setRect(300, 400, 400, 500);
        othregion.setRect(400, 400, 500, 500);
        region.op(othregion, drawing.RegionOp.UNION);
        let result = region.isRect();
        console.info(msg + `isRect 3 successed result: ${result}`);
        expect(result).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `isRect 3 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      try {
        region.setRect(100, 750, 400, 850);
        othregion.setRect(200, 850, 300, 950);
        region.op(othregion,drawing.RegionOp.UNION);
        let result = region.isRect();
        console.info(msg + `isRect 4 successed result: ${result}`);
        expect(result).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `isRect 4 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRegionIsRectNormalMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_1903
     * @tc.desc   testRegionIsRectNormalMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRegionIsRectNormalMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRegionIsRectNormalMultipleCallsStatic';
      let region = new drawing.Region();
      try {
        for (let index = 0; index < 20; index++) {
          region.setRect((Math.random() * 100).toInt(), (Math.random() * 100).toInt(),
            ((Math.random() * 101) + 200).toInt(), ((Math.random() * 101) + 200).toInt());
          console.info(msg + `setRect successed step: ${index}`);
          let result = region.isRect();
          console.info(msg + `isRect successed step: ${index} result: ${result}`);
          expect(result).assertEqual(true);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `isRect failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRegionQuickContainsNormal1Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_2000
     * @tc.desc   testRegionQuickContainsNormal1Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionQuickContainsNormal1Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRegionQuickContainsNormal1Static';
      let region = new drawing.Region();
      let region2 = new drawing.Region();
      try {
        let result = region.quickContains(10, 10, 100, 100);
        console.info(msg + `quickContains 1 successed result: ${result}`);
        expect(result).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `quickContains 1 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let result = region.quickContains((Number.MAX_VALUE).toInt(), (Number.MAX_VALUE).toInt(), (Number.MAX_VALUE + 1).toInt(), (Number.MAX_VALUE + 1).toInt());
        console.info(msg + `quickContains 11 successed result: ${result}`);
        expect(result).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `quickContains 11 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      // try {
      //   region.setRegion(region2);
      //   let result = region.quickContains(10, 10, 100, 100);
      //   console.info(msg + `quickContains 2 successed result: ${result}`);
      //   expect(result).assertEqual(false);
      // } catch (e) {
      //   e = e as BusinessError;
      //   console.info(msg + `quickContains 2 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
      //   expect().assertFail();
      // }
      try {
        region.setRect(0, 0, 0, 0)
        let result = region.quickContains(0, 0, 0, 0);
        console.info(msg + `quickContains 3 successed result: ${result}`);
        expect(result).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `quickContains 3 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRegionQuickContainsNormal2Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_2001
     * @tc.desc   testRegionQuickContainsNormal2Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegionQuickContainsNormal2Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg = 'testRegionQuickContainsNormal2Static';
      let region = new drawing.Region();
      let region2 = new drawing.Region();
      region.setRect(100, 100, 300, 100)
      try {
        let result = region.quickContains(100, 100, 300, 100);
        console.info(msg + `quickContains 1 successed result: ${result}`);
        expect(result).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `quickContains 1 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      try {
        region.setRect(100, 100,100 , 200)
        let result = region.quickContains(100, 100, 100, 300);
        console.info(msg + `quickContains 2 successed result: ${result}`);
        expect(result).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `quickContains 2 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      try {
        region.setRect(100, 100,100 , 100)
        let result =region.quickContains(100, 100, 100, 100);
        console.info(msg + `quickContains 3 successed result: ${result}`);
        expect(result).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `quickContains 3 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRegionQuickContainsNormal3Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_2002
     * @tc.desc   testRegionQuickContainsNormal3Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegionQuickContainsNormal3Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg = 'testRegionQuickContainsNormal3Static';
      let region = new drawing.Region();
      let region2 = new drawing.Region();
      region.setRect(150, 150,250 , 250)
      try {
        let result = region.quickContains(300, 100, 400, 200);
        console.info(msg + `quickContains 1 successed result: ${result}`);
        expect(result).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `quickContains 1 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let result = region.quickContains(150, 150, 190, 190);
        console.info(msg + `quickContains 3 successed result: ${result}`);
        expect(result).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `quickContains 3 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRegionQuickContainsNormal4Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_2003
     * @tc.desc   testRegionQuickContainsNormal4Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it('testRegionQuickContainsNormal4Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    //   const msg = 'testRegionQuickContainsNormal4Static';
    //   let region = new drawing.Region();
    //   let region1 = new drawing.Region();
    //   region1.setRect(-200,-200,500,500);
    //   region.setRegion(region1);
    //   try {
    //     let result = region.quickContains(-300, -300, 600, 600);
    //     console.info(msg + `quickContains 1 successed result: ${result}`);
    //     expect(result).assertEqual(false);
    //   } catch (e) {
    //     e = e as BusinessError;
    //     console.info(msg + `quickContains 1 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
    //     expect().assertFail();
    //   }
    //   try {
    //     let result = region.quickContains(-300, -300, 100, 100);
    //     console.info(msg + `quickContains 2 successed result: ${result}`);
    //     expect(result).assertEqual(true);
    //   } catch (e) {
    //     e = e as BusinessError;
    //     console.info(msg + `quickContains 2 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
    //     expect().assertFail();
    //   }
    //   try {
    //     let result = region.quickContains(500, 500, 550, 550);
    //     console.info(msg + `quickContains 3 successed result: ${result}`);
    //     expect(result).assertEqual(false);
    //   } catch (e) {
    //     e = e as BusinessError;
    //     console.info(msg + `quickContains 3 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
    //     expect().assertFail();
    //   }
    //   try {
    //     let result = region.quickContains(-100,  -100,400 , 400);
    //     console.info(msg + `quickContains 4 successed result: ${result}`);
    //     expect(result).assertEqual(true);
    //   } catch (e) {
    //     e = e as BusinessError;
    //     console.info(msg + `quickContains 4 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
    //     expect().assertFail();
    //   }
    // });
    /**
     * @tc.name   testRegionQuickContainsNormal5Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_2004
     * @tc.desc   testRegionQuickContainsNormal5Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegionQuickContainsNormal5Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg = 'testRegionQuickContainsNormal5Static';
      let region = new drawing.Region();
      region.setRect(50, 50, 150, 150);
      let othregion = new drawing.Region();
      othregion.setRect(0, 0, 100, 100);
      region.op(othregion, drawing.RegionOp.DIFFERENCE );
      try {
        let result =region.quickContains(0, 0, 150, 150);
        console.info(msg + `quickContains 1 successed result: ${result}`);
        expect(result).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `quickContains 1 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let result = region.quickContains(125, 125, 150, 150);
        console.info(msg + `quickContains 2 successed result: ${result}`);
        expect(result).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `quickContains 2 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      try {
        region.setRect(700, 400, 800, 500);
        othregion.setRect(700, 500, 800, 600);
        region.op(othregion,drawing.RegionOp.UNION);
        let result = region.quickContains(800, 600, 900, 700);
        console.info(msg + `quickContains 3 successed result: ${result}`);
        expect(result).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `quickContains 3 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let result = region.quickContains(725, 450, 775, 550);
        console.info(msg + `quickContains 4 successed result: ${result}`);
        expect(result).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `quickContains 4 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let result = region.quickContains(775, 575, 800, 600);
        console.info(msg + `quickContains 5 successed result: ${result}`);
        expect(result).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `quickContains 5 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRegionQuickContainsNormal6Static
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_2005
     * @tc.desc   testRegionQuickContainsNormal6Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegionQuickContainsNormal6Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg = 'testRegionQuickContainsNormal6Static';
      let region = new drawing.Region();
      region.setRect(100, 750, 400, 800);
      let othregion = new drawing.Region();
      othregion.setRect(200, 850, 300, 950);
      region.op(othregion, drawing.RegionOp.UNION );
      try {
        let result =region.quickContains(0, 800, 250, 900);
        console.info(msg + `quickContains 1 successed result: ${result}`);
        expect(result).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `quickContains 1 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let result = region.quickContains(200, 850, 250, 950);
        console.info(msg + `quickContains 2 successed result: ${result}`);
        expect(result).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `quickContains 2 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let result = region.quickContains(225, 825, 275, 875);
        console.info(msg + `quickContains 3 successed result: ${result}`);
        expect(result).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `quickContains 3 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRegionQuickContainsNormalMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_2006
     * @tc.desc   testRegionQuickContainsNormalMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRegionQuickContainsNormalMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRegionQuickContainsNormalMultipleCallsStatic';
      let region = new drawing.Region();
      for (let index = 0; index < 20; index++) {
        region.setRect(100, 100, 800, 800);
        console.info(msg + `setRect successed step: ${index}`);
        try {
          let num2 = ((Math.random() * 201) + 100).toInt();
          let num3 = ((Math.random() * 201) + 100).toInt();
          let num4 = ((Math.random() * 401) + 400).toInt();
          let num5 = ((Math.random() * 401) + 400).toInt();
          console.info(msg + ` 1 num2: ${num2} step: ${index}`);
          console.info(msg + ` 1 num3: ${num3} step: ${index}`);
          console.info(msg + ` 1 num4: ${num4} step: ${index}`);
          console.info(msg + ` 1 num5: ${num5} step: ${index}`);
          let result =region.quickContains(num2, num3, num4, num5);
          console.info(msg + `quickContains 1 successed step: ${index} result: ${result}`);
          expect(result).assertEqual(true);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + `quickContains 1 failed. Error code is: ${e.code}. Error message is: ${e.message} step: ${index}`);
          expect().assertFail();
        }
        try {
          let num2 = (Math.random() * 100).toInt();
          let num3 = (Math.random() * 100).toInt();
          let num4 = ((Math.random() * 401) + 400).toInt();
          let num5 = ((Math.random() * 401) + 400).toInt();
          console.info(msg + ` 2 num2: ${num2} step: ${index}`);
          console.info(msg + ` 2 num3: ${num3} step: ${index}`);
          console.info(msg + ` 2 num4: ${num4} step: ${index}`);
          console.info(msg + ` 2 num5: ${num5} step: ${index}`);
          let result =region.quickContains(num2, num3, num4, num5);
          console.info(msg + `quickContains 2 successed step: ${index} result: ${result}`);
          expect(result).assertEqual(false);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + `quickContains 2 failed. Error code is: ${e.code}. Error message is: ${e.message} step: ${index}`);
          expect().assertFail();
        }
      }
    });
  });
}
