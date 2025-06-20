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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import drawing from '@ohos.graphics.drawing';
import image from '@ohos.multimedia.image';
import { getEnumCount, getRandomNumber } from './utils';

export default function drawingTsRegionTest() {
  describe('DrawingTsRegionTest', () => {
    let pixel: image.PixelMap;
    const DEFAULT = 0;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      const color: ArrayBuffer = new ArrayBuffer(40000); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_0100
     * @tc.name      : testRegionIsPointContainedNormal
     * @tc.desc      : testRegionIsPointContainedNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testRegionIsPointContainedNormal', DEFAULT, () => {
      const msg = 'testRegionIsPointContainedNormal';
      try {
        const canvas = new drawing.Canvas(pixel);
        let region = new drawing.Region();
        region.setRect(100, 100, 400, 400);
        let flag: boolean = region.isPointContained(200,200);
        expect(flag).assertTrue();
        flag = region.isPointContained(100,100);
        expect(flag).assertTrue();
        flag = region.isPointContained(50,100);
        expect(flag).assertFalse();
        flag = region.isPointContained(100.1,200.25);
        expect(flag).assertTrue();
        flag = region.isPointContained(401.2,401.6);
        expect(flag).assertFalse();
        flag = region.isPointContained(-50,-50);
        expect(flag).assertFalse();
        canvas.drawPoint(200,200);
        canvas.drawRegion(region);
        console.info(msg + `isPointContained successed`);
      } catch (e) {
        console.info(msg + `isPointContained failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_0101
     * @tc.name      : testRegionIsPointContainedNull
     * @tc.desc      : testRegionIsPointContainedNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testRegionIsPointContainedNull', DEFAULT, () => {
      const msg = 'testRegionIsPointContainedNull';
      try {
        let region = new drawing.Region();
        region.setRect(100, 100, 400, 400);
        region.isPointContained(undefined, 100);
        console.info(msg + `isPointContained successed`);
      } catch (e) {
        console.info(msg + `isPointContained failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let region = new drawing.Region();
        region.setRect(100, 100, 400, 400);
        region.isPointContained(null, 100);
        console.info(msg + `isPointContained successed`);
      } catch (e) {
        console.info(msg + `isPointContained failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let region = new drawing.Region();
        region.setRect(100, 100, 400, 400);
        region.isPointContained(100, undefined);
        console.info(msg + `isPointContained successed`);
      } catch (e) {
        console.info(msg + `isPointContained failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let region = new drawing.Region();
        region.setRect(100, 100, 400, 400);
        region.isPointContained(100, null);
        console.info(msg + `isPointContained successed`);
      } catch (e) {
        console.info(msg + `isPointContained failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_0103
     * @tc.name      : testRegionIsPointContainedMultipleCalls
     * @tc.desc      : testRegionIsPointContainedMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testRegionIsPointContainedMultipleCalls', DEFAULT, () => {
      const msg = 'testRegionIsPointContainedMultipleCalls';
      try {
        const canvas = new drawing.Canvas(pixel);
        let region = new drawing.Region();
        region.setRect(100, 100, 400, 400);
        let flag: boolean = false;
        for (let index = 0; index < 20; index++) {
          let num1 = getRandomNumber(101, 399);
          let num2 = getRandomNumber(101, 399);
          flag = region.isPointContained(num1, num2);
          console.info(msg + `isPointContained flag: ${flag}, random num1: ${num1}, num2: ${num2}`);
          expect(flag).assertTrue();
        }
        canvas.drawPoint(200,200);
        canvas.drawRegion(region);
        console.info(msg + `isPointContained successed`);
      } catch (e) {
        console.info(msg + `isPointContained failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_0200
     * @tc.name      : testRegionIsRegionContainedNormal
     * @tc.desc      : testRegionIsRegionContainedNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testRegionIsRegionContainedNormal', DEFAULT, () => {
      const msg = 'testRegionIsRegionContainedNormal';
      try {
        const canvas = new drawing.Canvas(pixel);
        let region = new drawing.Region();
        let other = new drawing.Region();
        region.setRect(100, 100, 400, 400);
        other.setRect(150, 150, 250 ,250);
        let flag: boolean = region.isRegionContained(other);
        expect(flag).assertTrue();
        other.setRect(100.1, 100.1, 400.1 ,400.1);
        flag = region.isRegionContained(other);
        expect(flag).assertTrue();
        other.setRect(50, 50, 500 ,500);
        flag = region.isRegionContained(other);
        expect(flag).assertFalse();
        other.setRect(50, 50, 150 ,150);
        flag = region.isRegionContained(other);
        expect(flag).assertFalse();
        other.setRect(50, 50, 80 ,80);
        flag = region.isRegionContained(other);
        expect(flag).assertFalse();
        canvas.drawRegion(region);
        canvas.drawRegion(other);
        console.info(msg + `isRegionContained successed`);
      } catch (e) {
        console.info(msg + `isRegionContained failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_0201
     * @tc.name      : testRegionIsRegionContainedNull
     * @tc.desc      : testRegionIsRegionContainedNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testRegionIsRegionContainedNull', DEFAULT, () => {
      const msg = 'testRegionIsRegionContainedNull';
      try {
        let region = new drawing.Region();
        region.isRegionContained(undefined);
        console.info(msg + `isRegionContained successed`);
      } catch (e) {
        console.info(msg + `isRegionContained failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let region = new drawing.Region();
        region.isRegionContained(null);
        console.info(msg + `isRegionContained successed`);
      } catch (e) {
        console.info(msg + `isRegionContained failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_0203
     * @tc.name      : testRegionIsRegionContainedMultipleCalls
     * @tc.desc      : testRegionIsRegionContainedMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testRegionIsRegionContainedMultipleCalls', DEFAULT, () => {
      const msg = 'testRegionIsRegionContainedMultipleCalls';
      try {
        let region = new drawing.Region();
        region.setRect(100, 100, 400, 400);
        let flag: boolean = false;
        for (let index = 0; index < 20; index++) {
          flag = region.isRegionContained(region);
          expect(flag).assertTrue();
        }
        console.info(msg + `isRegionContained successed`);
      } catch (e) {
        console.info(msg + `isRegionContained failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_0300
     * @tc.name      : testRegionQuickRejectNormal
     * @tc.desc      : testRegionQuickRejectNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testRegionQuickRejectNormal', DEFAULT, () => {
      const msg = 'testRegionQuickRejectNormal';
      try {
        const canvas = new drawing.Canvas(pixel);
        let region = new drawing.Region();
        let other = new drawing.Region();
        region.setRect(100, 100, 400, 400);
        other.setRect(150, 150, 250 ,250);
        let flag: boolean = region.quickReject(50, 50, 70, 70);
        expect(flag).assertTrue();
        flag = region.quickReject(100.1, 100.1, 400.1, 400.1);
        expect(flag).assertFalse();
        flag = region.quickReject(50, 50, 200, 200);
        expect(flag).assertFalse();
        flag = region.quickReject(401.1, 401.1, 500, 500);
        expect(flag).assertTrue();
        canvas.drawRegion(region);
        canvas.drawRegion(other);
        console.info(msg + `quickReject successed`);
      } catch (e) {
        console.info(msg + `quickReject failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_0301
     * @tc.name      : testRegionQuickRejectNull
     * @tc.desc      : testRegionQuickRejectNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testRegionQuickRejectNull', DEFAULT, () => {
      const msg = 'testRegionQuickRejectNull';
      try {
        let region = new drawing.Region();
        region.quickReject(undefined, 50, 70, 70);
        console.info(msg + `quickReject successed`);
      } catch (e) {
        console.info(msg + `quickReject failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let region = new drawing.Region();
        region.quickReject(50, undefined, 70, 70);
        console.info(msg + `quickReject successed`);
      } catch (e) {
        console.info(msg + `quickReject failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let region = new drawing.Region();
        region.quickReject(50, 50, undefined, 70);
        console.info(msg + `quickReject successed`);
      } catch (e) {
        console.info(msg + `quickReject failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let region = new drawing.Region();
        region.quickReject(50, 50, 70, undefined);
        console.info(msg + `quickReject successed`);
      } catch (e) {
        console.info(msg + `quickReject failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let region = new drawing.Region();
        region.quickReject(null, 50, 70, 70);
        console.info(msg + `quickReject successed`);
      } catch (e) {
        console.info(msg + `quickReject failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let region = new drawing.Region();
        region.quickReject(50, null, 70, 70);
        console.info(msg + `quickReject successed`);
      } catch (e) {
        console.info(msg + `quickReject failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let region = new drawing.Region();
        region.quickReject(50, 50, null, 70);
        console.info(msg + `quickReject successed`);
      } catch (e) {
        console.info(msg + `quickReject failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let region = new drawing.Region();
        region.quickReject(50, 50, 70, null);
        console.info(msg + `quickReject successed`);
      } catch (e) {
        console.info(msg + `quickReject failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_0303
     * @tc.name      : testRegionQuickRejectMultipleCalls
     * @tc.desc      : testRegionQuickRejectMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testRegionQuickRejectMultipleCalls', DEFAULT, () => {
      const msg = 'testRegionQuickRejectMultipleCalls';
      try {
        let region = new drawing.Region();
        region.setRect(100, 100, 400, 400);
        let flag: boolean = false;
        for (let index = 0; index < 20; index++) {
          flag = region.quickReject(50, 50, 70, 70);
          expect(flag).assertTrue();
        }
        console.info(msg + `quickReject successed`);
      } catch (e) {
        console.info(msg + `quickReject failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_0400
     * @tc.name      : testRegionSetPathNormal
     * @tc.desc      : testRegionSetPathNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testRegionSetPathNormal', DEFAULT, () => {
      const msg = 'testRegionSetPathNormal';
      try {
        const canvas = new drawing.Canvas(pixel);
        let region = new drawing.Region();
        let path = new drawing.Path();
        region.setRect(100, 100, 400, 400);
        path.arcTo(50, 50, 300, 300, 0, 359);
        region.setPath(path,region);
        canvas.drawRegion(region);
        console.info(msg + `setPath successed`);
      } catch (e) {
        console.info(msg + `setPath failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_0401
     * @tc.name      : testRegionSetPathNull
     * @tc.desc      : testRegionSetPathNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testRegionSetPathNull', DEFAULT, () => {
      const msg = 'testRegionSetPathNull';
      const canvas = new drawing.Canvas(pixel);
      try {
        let region = new drawing.Region();
        region.setPath(undefined,region);
        canvas.drawRegion(region);
        console.info(msg + `setPath successed`);
      } catch (e) {
        console.info(msg + `setPath failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let region = new drawing.Region();
        let path = new drawing.Path();
        region.setPath(path,undefined);
        canvas.drawRegion(region);
        console.info(msg + `setPath successed`);
      } catch (e) {
        console.info(msg + `setPath failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let region = new drawing.Region();
        region.setPath(null,region);
        canvas.drawRegion(region);
        console.info(msg + `setPath successed`);
      } catch (e) {
        console.info(msg + `setPath failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let region = new drawing.Region();
        let path = new drawing.Path();
        region.setPath(path,null);
        canvas.drawRegion(region);
        console.info(msg + `setPath successed`);
      } catch (e) {
        console.info(msg + `setPath failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_0403
     * @tc.name      : testRegionSetPathMultipleCalls
     * @tc.desc      : testRegionSetPathMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testRegionSetPathMultipleCalls', DEFAULT, () => {
      const msg = 'testRegionSetPathMultipleCalls';
      try {
        const canvas = new drawing.Canvas(pixel);
        let region = new drawing.Region();
        let path = new drawing.Path();
        region.setRect(100, 100, 400, 400);
        path.arcTo(50, 50, 300, 300, 0, 359);
        let flag: boolean = false;
        for (let index = 0; index < 20; index++) {
          flag = region.setPath(path,region);
          expect(flag).assertTrue();
        }
        canvas.drawRegion(region);
        console.info(msg + `setPath successed`);
      } catch (e) {
        console.info(msg + `setPath failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_0500
     * @tc.name      : testRegionSetRectNormal
     * @tc.desc      : testRegionSetRectNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testRegionSetRectNormal', DEFAULT, () => {
      const msg = 'testRegionSetRectNormal';
      try {
        const canvas = new drawing.Canvas(pixel);
        let region = new drawing.Region();
        region.setRect(100, 100, 400, 400);
        region.setRect(100.1, 100.1, 400.1, 400.1);
        region.setRect(-100.1, -100.1, 400.1, 400.1);
        region.setRect(100, 100, 100, 400);
        region.setRect(100, 400, 400, 400);
        region.setRect(Number.MIN_VALUE, Number.MIN_VALUE, Number.MAX_VALUE, Number.MAX_VALUE);
        canvas.drawRegion(region);
        console.info(msg + `setRect successed`);
      } catch (e) {
        console.info(msg + `setRect failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_0501
     * @tc.name      : testRegionSetRectNull
     * @tc.desc      : testRegionSetRectNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testRegionSetRectNull', DEFAULT, () => {
      const msg = 'testRegionSetRectNull';
      const canvas = new drawing.Canvas(pixel);
      try {
        let region = new drawing.Region();
        region.setRect(undefined, 50, 70, 70);
        canvas.drawRegion(region);
        console.info(msg + `setRect successed`);
      } catch (e) {
        console.info(msg + `setRect failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let region = new drawing.Region();
        region.setRect(50, undefined, 70, 70);
        canvas.drawRegion(region);
        console.info(msg + `setRect successed`);
      } catch (e) {
        console.info(msg + `setRect failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let region = new drawing.Region();
        region.setRect(50, 50, undefined, 70);
        canvas.drawRegion(region);
        console.info(msg + `setRect successed`);
      } catch (e) {
        console.info(msg + `setRect failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let region = new drawing.Region();
        region.setRect(50, 50, 70, undefined);
        canvas.drawRegion(region);
        console.info(msg + `setRect successed`);
      } catch (e) {
        console.info(msg + `setRect failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let region = new drawing.Region();
        region.setRect(null, 50, 70, 70);
        canvas.drawRegion(region);
        console.info(msg + `setRect successed`);
      } catch (e) {
        console.info(msg + `setRect failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let region = new drawing.Region();
        region.setRect(50, null, 70, 70);
        canvas.drawRegion(region);
        console.info(msg + `setRect successed`);
      } catch (e) {
        console.info(msg + `setRect failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let region = new drawing.Region();
        region.setRect(50, 50, null, 70);
        canvas.drawRegion(region);
        console.info(msg + `setRect successed`);
      } catch (e) {
        console.info(msg + `setRect failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let region = new drawing.Region();
        region.setRect(50, 50, 70, null);
        canvas.drawRegion(region);
        console.info(msg + `setRect successed`);
      } catch (e) {
        console.info(msg + `setRect failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_0503
     * @tc.name      : testRegionSetRectMultipleCalls
     * @tc.desc      : testRegionSetRectMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testRegionSetRectMultipleCalls', DEFAULT, () => {
      const msg = 'testRegionSetRectMultipleCalls';
      try {
        const canvas = new drawing.Canvas(pixel);
        let region = new drawing.Region();
        for (let index = 0; index < 20; index++) {
          region.setRect(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        canvas.drawRegion(region);
        console.info(msg + `setRect successed`);
      } catch (e) {
        console.info(msg + `setRect failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_0600
     * @tc.name      : testRegionOpNormal
     * @tc.desc      : testRegionOpNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testRegionOpNormal', DEFAULT, () => {
      const msg = 'testRegionOpNormal';
      const canvas = new drawing.Canvas(pixel);
      try {
        let region = new drawing.Region();
        region.setRect(200, 200, 400, 400);
        let othregion = new drawing.Region();
        othregion.setRect(110, 110, 240, 240);
        let flag: boolean = region.op(othregion,drawing.RegionOp.DIFFERENCE);
        expect(flag).assertTrue();
        canvas.drawRegion(region);
        console.info(msg + `op successed`);
      } catch (e) {
        console.info(msg + `op failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let region = new drawing.Region();
        region.setRect(200, 200, 400, 400);
        let othregion = new drawing.Region();
        othregion.setRect(110, 110, 240, 240);
        let flag: boolean = region.op(othregion,drawing.RegionOp.INTERSECT);
        expect(flag).assertTrue();
        canvas.drawRegion(region);
        console.info(msg + `op successed`);
      } catch (e) {
        console.info(msg + `op failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let region = new drawing.Region();
        region.setRect(200, 200, 400, 400);
        let othregion = new drawing.Region();
        othregion.setRect(110, 110, 240, 240);
        let flag: boolean = region.op(othregion,drawing.RegionOp.UNION);
        expect(flag).assertTrue();
        canvas.drawRegion(region);
        console.info(msg + `op successed`);
      } catch (e) {
        console.info(msg + `op failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let region = new drawing.Region();
        region.setRect(200, 200, 400, 400);
        let othregion = new drawing.Region();
        othregion.setRect(110, 110, 240, 240);
        let flag: boolean = region.op(othregion,drawing.RegionOp.XOR);
        expect(flag).assertTrue();
        canvas.drawRegion(region);
        console.info(msg + `op successed`);
      } catch (e) {
        console.info(msg + `op failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let region = new drawing.Region();
        region.setRect(200, 200, 400, 400);
        let othregion = new drawing.Region();
        othregion.setRect(110, 110, 240, 240);
        let flag: boolean = region.op(othregion,drawing.RegionOp.REVERSE_DIFFERENCE);
        expect(flag).assertTrue();
        canvas.drawRegion(region);
        console.info(msg + `op successed`);
      } catch (e) {
        console.info(msg + `op failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let region = new drawing.Region();
        region.setRect(200, 200, 400, 400);
        let othregion = new drawing.Region();
        othregion.setRect(110, 110, 240, 240);
        let flag: boolean = region.op(othregion,drawing.RegionOp.REPLACE);
        expect(flag).assertTrue();
        canvas.drawRegion(region);
        console.info(msg + `op successed`);
      } catch (e) {
        console.info(msg + `op failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_0601
     * @tc.name      : testRegionOpNull
     * @tc.desc      : testRegionOpNull
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testRegionOpNull', DEFAULT, () => {
      const msg = 'testRegionOpNull';
      try {
        const canvas = new drawing.Canvas(pixel);
        let region = new drawing.Region();
        region.setRect(200, 200, 400, 400);
        let othregion = new drawing.Region();
        othregion.setRect(110, 110, 240, 240);
        let flag: boolean = region.op(undefined,drawing.RegionOp.REPLACE);
        expect(flag).assertTrue();
        canvas.drawRegion(region);
        console.info(msg + `op successed`);
      } catch (e) {
        console.info(msg + `op failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const canvas = new drawing.Canvas(pixel);
        let region = new drawing.Region();
        region.setRect(200, 200, 400, 400);
        let othregion = new drawing.Region();
        othregion.setRect(110, 110, 240, 240);
        let flag: boolean = region.op(othregion,undefined);
        expect(flag).assertTrue();
        canvas.drawRegion(region);
        console.info(msg + `op successed`);
      } catch (e) {
        console.info(msg + `op failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const canvas = new drawing.Canvas(pixel);
        let region = new drawing.Region();
        region.setRect(200, 200, 400, 400);
        let othregion = new drawing.Region();
        othregion.setRect(110, 110, 240, 240);
        let flag: boolean = region.op(null,drawing.RegionOp.REPLACE);
        expect(flag).assertTrue();
        canvas.drawRegion(region);
        console.info(msg + `op successed`);
      } catch (e) {
        console.info(msg + `op failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const canvas = new drawing.Canvas(pixel);
        let region = new drawing.Region();
        region.setRect(200, 200, 400, 400);
        let othregion = new drawing.Region();
        othregion.setRect(110, 110, 240, 240);
        let flag: boolean = region.op(othregion,null);
        expect(flag).assertTrue();
        canvas.drawRegion(region);
        console.info(msg + `op successed`);
      } catch (e) {
        console.info(msg + `op failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_0603
     * @tc.name      : testRegionOpMultipleCalls
     * @tc.desc      : testRegionOpMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testRegionOpMultipleCalls', DEFAULT, () => {
      const msg = 'testRegionOpMultipleCalls';
      try {
        const canvas = new drawing.Canvas(pixel);
        let region = new drawing.Region();
        region.setRect(200, 200, 400, 400);
        let othregion = new drawing.Region();
        othregion.setRect(110, 110, 240, 240);
        for (let index = 0; index < 20; index++) {
          const randomEnum = Math.floor(Math.random() * getEnumCount(drawing.RegionOp));
          let flag: boolean = region.op(othregion,randomEnum);
          expect(flag).assertTrue();
        }
        canvas.drawRegion(region);
        console.info(msg + `op successed`);
      } catch (e) {
        console.info(msg + `op failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });
  });
}
