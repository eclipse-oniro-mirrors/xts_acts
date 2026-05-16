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
import { getEnumCount, getRandomNumber } from './Util.test';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function drawingTsRegionTest() {
  describe('DrawingTsRegionTest', () => {
    let pixel: image.PixelMap | undefined;
    const DEFAULT = 0;
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
     * @tc.name   testRegionIsPointContainedNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_0100
     * @tc.desc   testRegionIsPointContainedNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionIsPointContainedNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRegionIsPointContainedNormalStatic';
      try {
        const canvas = new drawing.Canvas(pixel!);
        let region = new drawing.Region();
        region.setRect(100, 100, 400, 400);
        let flag: boolean = region.isPointContained(200, 200);
        expect(flag).assertTrue();
        flag = region.isPointContained(100, 100);
        expect(flag).assertTrue();
        flag = region.isPointContained(50, 100);
        expect(flag).assertFalse();
        flag = region.isPointContained(100, 200);
        expect(flag).assertTrue();
        flag = region.isPointContained(401, 401);
        expect(flag).assertFalse();
        flag = region.isPointContained(-50, -50);
        expect(flag).assertFalse();
        canvas.drawPoint(200, 200);
        canvas.drawRegion(region);
        console.info(msg + `isPointContained successed`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `isPointContained failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRegionIsPointContainedMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_0103
     * @tc.desc   testRegionIsPointContainedMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRegionIsPointContainedMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRegionIsPointContainedMultipleCallsStatic';
      try {
        const canvas = new drawing.Canvas(pixel!);
        let region = new drawing.Region();
        region.setRect(100, 100, 400, 400);
        let flag: boolean = false;
        for (let index = 0; index < 20; index++) {
          let num1 = getRandomNumber(101, 399).toInt();
          let num2 = getRandomNumber(101, 399).toInt();
          flag = region.isPointContained(num1, num2);
          console.info(msg + `isPointContained flag: ${flag}, random num1: ${num1}, num2: ${num2}`);
          expect(flag).assertTrue();
        }
        canvas.drawPoint(200, 200);
        canvas.drawRegion(region);
        console.info(msg + `isPointContained successed`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `isPointContained failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.name   testRegionIsRegionContainedNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_0200
     * @tc.desc   testRegionIsRegionContainedNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionIsRegionContainedNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRegionIsRegionContainedNormalStatic';
      try {
        const canvas = new drawing.Canvas(pixel!);
        let region = new drawing.Region();
        let other = new drawing.Region();
        region.setRect(100, 100, 400, 400);
        other.setRect(150, 150, 250, 250);
        let flag: boolean = region.isRegionContained(other);
        expect(flag).assertTrue();
        other.setRect(100, 100, 400, 400);
        flag = region.isRegionContained(other);
        expect(flag).assertTrue();
        other.setRect(50, 50, 500, 500);
        flag = region.isRegionContained(other);
        expect(flag).assertFalse();
        other.setRect(50, 50, 150, 150);
        flag = region.isRegionContained(other);
        expect(flag).assertFalse();
        other.setRect(50, 50, 80, 80);
        flag = region.isRegionContained(other);
        expect(flag).assertFalse();
        canvas.drawRegion(region);
        canvas.drawRegion(other);
        console.info(msg + `isRegionContained successed`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `isRegionContained failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRegionIsRegionContainedMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_0203
     * @tc.desc   testRegionIsRegionContainedMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRegionIsRegionContainedMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRegionIsRegionContainedMultipleCallsStatic';
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
        e = e as BusinessError;
        console.info(msg + `isRegionContained failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.name   testRegionQuickRejectNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_0300
     * @tc.desc   testRegionQuickRejectNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionQuickRejectNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRegionQuickRejectNormalStatic';
      try {
        const canvas = new drawing.Canvas(pixel!);
        let region = new drawing.Region();
        let other = new drawing.Region();
        region.setRect(100, 100, 400, 400);
        other.setRect(150, 150, 250, 250);
        let flag: boolean = region.quickReject(50, 50, 70, 70);
        expect(flag).assertTrue();
        flag = region.quickReject(100, 100, 400, 400);
        expect(flag).assertFalse();
        flag = region.quickReject(50, 50, 200, 200);
        expect(flag).assertFalse();
        flag = region.quickReject(401, 401, 500, 500);
        expect(flag).assertTrue();
        canvas.drawRegion(region);
        canvas.drawRegion(other);
        console.info(msg + `quickReject successed`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `quickReject failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRegionQuickRejectMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_0303
     * @tc.desc   testRegionQuickRejectMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRegionQuickRejectMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRegionQuickRejectMultipleCallsStatic';
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
        e = e as BusinessError;
        console.info(msg + `quickReject failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.name   testRegionSetPathNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_0400
     * @tc.desc   testRegionSetPathNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionSetPathNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRegionSetPathNormalStatic';
      try {
        const canvas = new drawing.Canvas(pixel!);
        let region = new drawing.Region();
        let path = new drawing.Path();
        region.setRect(100, 100, 400, 400);
        path.arcTo(50, 50, 300, 300, 0, 359);
        let flag: boolean = region.setPath(path, region);
        console.info(msg + " region setRect flag: " + flag);
        expect(flag).assertTrue();
        canvas.drawRegion(region);
        console.info(msg + `setPath successed`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `setPath failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRegionSetPathMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_0403
     * @tc.desc   testRegionSetPathMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRegionSetPathMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRegionSetPathMultipleCallsStatic';
      try {
        const canvas = new drawing.Canvas(pixel!);
        let region = new drawing.Region();
        let path = new drawing.Path();
        region.setRect(100, 100, 400, 400);
        path.arcTo(50, 50, 300, 300, 0, 359);
        let flag: boolean = false;
        for (let index = 0; index < 20; index++) {
          flag = region.setPath(path, region);
          expect(flag).assertTrue();
        }
        canvas.drawRegion(region);
        console.info(msg + `setPath successed`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `setPath failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.name   testRegionSetRectNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_0500
     * @tc.desc   testRegionSetRectNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionSetRectNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRegionSetRectNormalStatic';
      try {
        const canvas = new drawing.Canvas(pixel!);
        let region = new drawing.Region();
        let result1: boolean = region.setRect(100, 100, 400, 400);
        console.info(msg + " setRect -----result1:  " + result1);
        expect(result1).assertEqual(true);
        let result2: boolean = region.setRect(100, 100, 400, 400);
        console.info(msg + " setRect -----result2:  " + result2);
        expect(result2).assertEqual(true);
        let result3: boolean = region.setRect(-100, -100, 400, 400);
        console.info(msg + " setRect -----result3:  " + result3);
        expect(result3).assertEqual(true);
        let result4: boolean = region.setRect(100, 100, 100, 400);
        console.info(msg + " setRect -----result4:  " + result4);
        expect(result4).assertEqual(false);
        let result5: boolean = region.setRect(100, 400, 400, 400);
        console.info(msg + " setRect -----result5:  " + result5);
        expect(result5).assertEqual(false);
        let result6: boolean = region.setRect((Number.MIN_VALUE).toInt(), (Number.MIN_VALUE).toInt(), (Number.MAX_VALUE).toInt(), (Number.MAX_VALUE).toInt());
        console.info(msg + " setRect -----result6:  " + result6);
        expect(result6).assertEqual(false);
        canvas.drawRegion(region);
        console.info(msg + `setRect successed`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `setRect failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRegionSetRectMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_0503
     * @tc.desc   testRegionSetRectMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRegionSetRectMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRegionSetRectMultipleCallsStatic';
      try {
        const canvas = new drawing.Canvas(pixel!);
        let region = new drawing.Region();
        for (let index = 0; index < 20; index++) {
          region.setRect((Math.random() * Number.MAX_VALUE).toInt(), (Math.random() * Number.MAX_VALUE).toInt(),
            (Math.random() * Number.MAX_VALUE).toInt(), (Math.random() * Number.MAX_VALUE).toInt());
        }
        canvas.drawRegion(region);
        console.info(msg + `setRect successed`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `setRect failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRegionOpNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_0600
     * @tc.desc   testRegionOpNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionOpNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRegionOpNormalStatic';
      const canvas = new drawing.Canvas(pixel!);
      try {
        let region = new drawing.Region();
        region.setRect(200, 200, 400, 400);
        let othregion = new drawing.Region();
        othregion.setRect(110, 110, 240, 240);
        let flag: boolean = region.op(othregion, drawing.RegionOp.DIFFERENCE);
        expect(flag).assertTrue();
        canvas.drawRegion(region);
        console.info(msg + `op successed`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `op failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let region = new drawing.Region();
        region.setRect(200, 200, 400, 400);
        let othregion = new drawing.Region();
        othregion.setRect(110, 110, 240, 240);
        let flag: boolean = region.op(othregion, drawing.RegionOp.INTERSECT);
        expect(flag).assertTrue();
        canvas.drawRegion(region);
        console.info(msg + `op successed`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `op failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let region = new drawing.Region();
        region.setRect(200, 200, 400, 400);
        let othregion = new drawing.Region();
        othregion.setRect(110, 110, 240, 240);
        let flag: boolean = region.op(othregion, drawing.RegionOp.UNION);
        expect(flag).assertTrue();
        canvas.drawRegion(region);
        console.info(msg + `op successed`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `op failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let region = new drawing.Region();
        region.setRect(200, 200, 400, 400);
        let othregion = new drawing.Region();
        othregion.setRect(110, 110, 240, 240);
        let flag: boolean = region.op(othregion, drawing.RegionOp.XOR);
        expect(flag).assertTrue();
        canvas.drawRegion(region);
        console.info(msg + `op successed`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `op failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let region = new drawing.Region();
        region.setRect(200, 200, 400, 400);
        let othregion = new drawing.Region();
        othregion.setRect(110, 110, 240, 240);
        let flag: boolean = region.op(othregion, drawing.RegionOp.REVERSE_DIFFERENCE);
        expect(flag).assertTrue();
        canvas.drawRegion(region);
        console.info(msg + `op successed`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `op failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let region = new drawing.Region();
        region.setRect(200, 200, 400, 400);
        let othregion = new drawing.Region();
        othregion.setRect(110, 110, 240, 240);
        let flag: boolean = region.op(othregion, drawing.RegionOp.REPLACE);
        expect(flag).assertTrue();
        canvas.drawRegion(region);
        console.info(msg + `op successed`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `op failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRegionOpMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_0603
     * @tc.desc   testRegionOpMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRegionOpMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRegionOpMultipleCallsStatic';
      let itemList: drawing.RegionOp[] = [
        drawing.RegionOp.DIFFERENCE,
        drawing.RegionOp.INTERSECT,
        drawing.RegionOp.UNION,
        drawing.RegionOp.REVERSE_DIFFERENCE,
        drawing.RegionOp.REPLACE,
        drawing.RegionOp.XOR
      ];
      try {
        const canvas = new drawing.Canvas(pixel!);
        for (let index = 0; index < 20; index++) {
          let region = new drawing.Region();
          region.setRect(200, 200, 400, 400);
          let othregion = new drawing.Region();
          othregion.setRect(110, 110, 240, 240);
          const randomEnum = Math.floor(6 * Math.random()).toInt();
          let flag: boolean = region.op(othregion, itemList[randomEnum]);
          console.info(msg + `op successed itemList[randomEnum]: ${itemList[randomEnum]} step: ${index}`);
          console.info(msg + `op successed flag: ${flag} step: ${index}`);
          expect(flag).assertTrue();
          canvas.drawRegion(region);
        }
        console.info(msg + `op successed`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `op failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRegionConstructor1NormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_0700
     * @tc.desc   testRegionConstructor1NormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionConstructor1NormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRegionConstructor1NormalStatic';
      try {
        let region = new drawing.Region();
        console.info(msg + `drawing Region success`);
        expect(region != null || region != undefined).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawing Region error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRegionConstructor1MultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_0701
     * @tc.desc   testRegionConstructor1MultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRegionConstructor1MultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRegionConstructor1MultipleCallsStatic';
      for (let i = 0; i < 20; i += 1) {
        try {
          let region = new drawing.Region();
          console.info(msg + `drawing Region success step: ` + i);
          expect(region != null || region != undefined).assertTrue();
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + `drawing Region error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    })
    /**
     * @tc.name   testRegionConstructor2NormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_0800
     * @tc.desc   testRegionConstructor2NormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionConstructor2NormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRegionConstructor2NormalStatic';
      try {
        let region = new drawing.Region(100, 100, 200, 200);
        console.info(msg + `drawing Region success`);
        expect(region != null || region != undefined).assertTrue();
      } catch (e) {
        console.info(msg + `drawing Region error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        let region2 = new drawing.Region(-100, -100, 300, 351);
        console.info(msg + `drawing Region2 success`);
        expect(region2 != null || region2 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + `drawing region2 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        let region3 = new drawing.Region(150, 150, 150, 150);
        console.info(msg + `drawing region3 success`);
        expect(region3 != null || region3 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + `drawing region3 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        let region4 = new drawing.Region(0, 150, 150, 150);
        console.info(msg + `drawing region4 success`);
        expect(region4 != null || region4 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + `drawing region4 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        let region5 = new drawing.Region(100, 100, 100, 300);
        console.info(msg + `drawing region5 success`);
        expect(region5 != null || region5 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + `drawing region5 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        let region6 = new drawing.Region(100, 100, 800, 600);
        console.info(msg + `drawing region6 success`);
        expect(region6 != null || region6 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + `drawing region6 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        let region7 = new drawing.Region(500, 900, 180, 240);
        console.info(msg + `drawing region7 success`);
        expect(region7 != null || region7 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + `drawing region7 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        let region8 =
          new drawing.Region((Number.MAX_VALUE).toInt(), (Number.MAX_VALUE).toInt(), (Number.MAX_VALUE + 1).toInt(),
            (Number.MAX_VALUE + 1).toInt());
        console.info(msg + `drawing region8 success`);
        expect(region8 != null || region8 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + `drawing region8 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRegionConstructor2MultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_0801
     * @tc.desc   testRegionConstructor2MultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRegionConstructor2MultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRegionConstructor2MultipleCallsStatic';
      let region = new drawing.Region();
      try {
        region.setRect((Math.random() * 100).toInt(), (Math.random() * 200).toInt(), (Math.random() * 100).toInt(),
          (Math.random() * 200).toInt());
        console.info(msg + `drawing Region setRect success `);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `drawing Region setRect error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      for (let i = 0; i < 20; i += 1) {
        try {
          let region2 = new drawing.Region(region)
          console.info(msg + `drawing region2 success step: ` + i);
          expect(region2 != null || region2 != undefined).assertTrue();
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + `drawing region2 error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    })
    /**
     * @tc.name   testRegionConstructor3MultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_0901
     * @tc.desc   testRegionConstructor3MultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRegionConstructor3MultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRegionConstructor3MultipleCallsStatic';
      for (let i = 0; i < 20; i += 1) {
        try {
          let region = new drawing.Region((Math.random() * 100).toInt(), (Math.random() * 200).toInt(),
            (Math.random() * 100).toInt(), (Math.random() * 200).toInt())
          console.info(msg + `drawing region success step: ` + i);
          expect(region != null || region != undefined).assertTrue();
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + `drawing region error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    })
    /**
     * @tc.name   testRegionIsEqualNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_1000
     * @tc.desc   testRegionIsEqualNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionIsEqualNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testRegionIsEqualNormalStatic';
      let region = new drawing.Region();
      let other = new drawing.Region(0,0,0,0);
      try {
        let flag: boolean = region.isEqual(other);
        console.info(msg + `Region isEqual flag success`);
        expect(flag).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region isEqual flag error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      other = new drawing.Region(100,100,200,200);
      try {
        let flag2: boolean = region.isEqual(other);
        console.info(msg + `Region isEqual flag2 success`);
        expect(flag2).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region isEqual flag2 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      other = new drawing.Region(0,0,0,0);
      region.setRect(100,100,200,200);
      try {
        let flag3: boolean = region.isEqual(other);
        console.info(msg + `Region isEqual flag3 success`);
        expect(flag3).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region isEqual flag3 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      other.setRect(100,100,300,300);
      region.setRect(100,100,200,200);
      try {
        let flag4: boolean = region.isEqual(other);
        console.info(msg + `Region isEqual flag4 success`);
        expect(flag4).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region isEqual flag4 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      other.setRect(100,100,200,200);
      region.setRect(100,100,200,200);
      try {
        let flag5: boolean = region.isEqual(other);
        console.info(msg + `Region isEqual flag5 success`);
        expect(flag5).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region isEqual flag5 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRegionIsEqualMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_1001
     * @tc.desc   testRegionIsEqualMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRegionIsEqualMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testRegionIsEqualMultipleCallsStatic';
      let region = new drawing.Region();
      let other = new drawing.Region();
      region.setRect(100, 100, 400, 400);
      other.setRect(150, 150, 250 ,250);
      for (let i = 0; i < 20; i += 1) {
        try {
          let flag = region.isEqual(other);
          console.info(msg + `region isEqual success step: ` + i);
          expect(flag).assertEqual(false);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + `drawing region isEqual error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    })
    /**
     * @tc.name   testRegionIsComplexNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_1100
     * @tc.desc   testRegionIsComplexNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionIsComplexNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testRegionIsComplexNormalStatic';
      let region = new drawing.Region();
      try {
        let flag: boolean = region.isComplex();
        console.info(msg + `Region isComplex flag success`);
        expect(flag).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region isComplex flag error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region = new drawing.Region(100,100,200,200);
      try {
        let flag2: boolean = region.isComplex();
        console.info(msg + `Region isComplex flag2 success`);
        expect(flag2).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region isComplex flag2 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.op(new drawing.Region(120, 120, 180, 180), drawing.RegionOp.UNION);
      try {
        let flag3: boolean = region.isComplex();
        console.info(msg + `Region isComplex flag3 success`);
        expect(flag3).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region isComplex flag3 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.op(new drawing.Region(220, 220, 280, 280), drawing.RegionOp.UNION);
      try {
        let flag4: boolean = region.isComplex();
        console.info(msg + `Region isComplex flag4 success`);
        expect(flag4).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region isComplex flag4 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      let path = new drawing.Path()
      region.setRect(100, 100, 400, 400);
      path.arcTo(50, 50, 300, 300, 0, 359);
      region.setPath(path,region);
      try {
        let flag5: boolean = region.isComplex();
        console.info(msg + `Region isComplex flag5 success`);
        expect(flag5).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region isComplex flag5 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRegionIsComplexMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_1101
     * @tc.desc   testRegionIsComplexMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRegionIsComplexMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testRegionIsComplexMultipleCallsStatic';
      let region = new drawing.Region();
      for (let i = 0; i < 20; i += 1) {
        try {
          let flag: boolean = region.isComplex();
          console.info(msg + `region isComplex success step: ` + i);
          expect(flag).assertEqual(false);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + `drawing region isComplex error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    })
    /**
     * @tc.name   testRegionIsEmptyNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_1200
     * @tc.desc   testRegionIsEmptyNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionIsEmptyNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testRegionIsEmptyNormalStatic';
      let region = new drawing.Region();
      try {
        let flag: boolean = region.isEmpty();
        console.info(msg + `Region isEmpty flag success`);
        expect(flag).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region isEmpty flag error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      let region1 = new drawing.Region(region);
      try {
        let flag2: boolean = region.isEmpty();
        console.info(msg + `Region isEmpty flag2 success`);
        expect(flag2).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region isEmpty flag2 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region = new drawing.Region(0,0,0,0);
      try {
        let flag3: boolean = region.isEmpty();
        console.info(msg + `Region isEmpty flag3 success`);
        expect(flag3).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region isEmpty flag3 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(10, 20, 20, 20);
      try {
        let flag4: boolean = region.isEmpty();
        console.info(msg + `Region isEmpty flag4 success`);
        expect(flag4).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region isEmpty flag4 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(10, 10, 10, 20);
      try {
        let flag5: boolean = region.isEmpty();
        console.info(msg + `Region isEmpty flag5 success`);
        expect(flag5).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region isEmpty flag5 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(20, 20, 20, 20);
      try {
        let flag6: boolean = region.isEmpty();
        console.info(msg + `Region isEmpty flag6 success`);
        expect(flag6).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region isEmpty flag6 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(0, 0, 100, 100);
      try {
        let flag7: boolean = region.isEmpty();
        console.info(msg + `Region isEmpty flag7 success`);
        expect(flag7).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region isEmpty flag7 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(0,10,100,100);
      try {
        let flag8: boolean = region.isEmpty();
        console.info(msg + `Region isEmpty flag8 success`);
        expect(flag8).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region isEmpty flag8 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(-100,-100,-50,-50);
      try {
        let flag9: boolean = region.isEmpty();
        console.info(msg + `Region isEmpty flag9 success`);
        expect(flag9).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region isEmpty flag9 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(100,100,-100,-100);
      try {
        let flag10: boolean = region.isEmpty();
        console.info(msg + `Region isEmpty flag10 success`);
        expect(flag10).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region isEmpty flag10 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRegionIsEmptyMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_1201
     * @tc.desc   testRegionIsEmptyMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRegionIsEmptyMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testRegionIsEmptyMultipleCallsStatic';
      let region = new drawing.Region();
      for (let i = 0; i < 20; i += 1) {
        try {
          let flag: boolean = region.isEmpty();
          console.info(msg + `region isEmpty success step: ` + i);
          expect(flag).assertEqual(true);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + `drawing region isEmpty error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    })
    /**
     * @tc.name   testRegionGetBoundsNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_1300
     * @tc.desc   testRegionGetBoundsNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionGetBoundsNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testRegionGetBoundsNormalStatic';
      let region = new drawing.Region();
      try {
        let rect: common2D.Rect | undefined= region.getBounds();
        if(rect == undefined){
          console.info(msg + `Region getBounds failed`);
          expect().assertFail();
        } else {
          console.info(msg + `Region getBounds rect success`);
          console.info(msg + `rect11: ${JSON.stringify(rect)}`);
          expect(rect.left == 0 && rect.top == 0 && rect.right == 0 && rect.bottom == 0).assertEqual(true);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region getBounds rect error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      let region1 = new drawing.Region(region);
      try {
        let rect2: common2D.Rect | undefined= region1.getBounds();
        if(rect2 == undefined){
          console.info(msg + `Region getBounds rect2 failed`);
          expect().assertFail();
        } else {
          console.info(msg + `Region getBounds rect2 success`);
          console.info(msg + `rect11: ${JSON.stringify(rect2)}`);
          expect(rect2.left == 0 && rect2.top == 0 && rect2.right == 0 && rect2.bottom == 0).assertEqual(true);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region getBounds rect2 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region = new drawing.Region(0,0,0,0);
      try {
        let rect3: common2D.Rect | undefined= region.getBounds();
        if(rect3 == undefined){
          console.info(msg + `Region getBounds rect3 failed`);
          expect().assertFail();
        } else {
          console.info(msg + `Region getBounds rect3 success`);
          console.info(msg + `rect11: ${JSON.stringify(rect3)}`);
          expect(rect3.left == 0 && rect3.top == 0 && rect3.right == 0 && rect3.bottom == 0).assertEqual(true);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region getBounds rect3 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(10, 20, 20, 20);
      try {
        let rect4: common2D.Rect | undefined= region.getBounds();
        if(rect4 == undefined){
          console.info(msg + `Region getBounds rect4 failed`);
          expect().assertFail();
        } else {
          console.info(msg + `Region getBounds rect4 success`);
          console.info(msg + `rect11: ${JSON.stringify(rect4)}`);
          expect(rect4.left == 0 && rect4.top == 0 && rect4.right == 0 && rect4.bottom == 0).assertEqual(true);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region getBounds rect4 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(10, 10, 10, 20);
      try {
        let rect5: common2D.Rect | undefined= region.getBounds();
        if(rect5 == undefined){
          console.info(msg + `Region getBounds rect5 failed`);
          expect().assertFail();
        } else {
          console.info(msg + `Region getBounds rect5 success`);
          console.info(msg + `rect11: ${JSON.stringify(rect5)}`);
          expect(rect5.left == 0 && rect5.top == 0 && rect5.right == 0 && rect5.bottom == 0).assertEqual(true);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region getBounds rect5 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(20, 20, 20, 20);
      try {
        let rect6: common2D.Rect | undefined= region.getBounds();
        if(rect6 == undefined){
          console.info(msg + `Region getBounds rect6 failed`);
          expect().assertFail();
        } else {
          console.info(msg + `Region getBounds rect6 success`);
          console.info(msg + `rect11: ${JSON.stringify(rect6)}`);
          expect(rect6.left == 0 && rect6.top == 0 && rect6.right == 0 && rect6.bottom == 0).assertEqual(true);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region getBounds rect6 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(0, 0, 100, 100);
      try {
        let rect7: common2D.Rect | undefined= region.getBounds();
        if(rect7 == undefined){
          console.info(msg + `Region getBounds rect7 failed`);
          expect().assertFail();
        } else {
          console.info(msg + `Region getBounds rect7 success`);
          console.info(msg + `rect11: ${JSON.stringify(rect7)}`);
          expect(rect7.left == 0 && rect7.top == 0 && rect7.right == 100 && rect7.bottom == 100).assertEqual(true);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region getBounds rect7 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(0,10,100,100);
      try {
        let rect8: common2D.Rect | undefined= region.getBounds();
        if(rect8 == undefined){
          console.info(msg + `Region getBounds rect8 failed`);
          expect().assertFail();
        } else {
          console.info(msg + `Region getBounds rect8 success`);
          console.info(msg + `rect11: ${JSON.stringify(rect8)}`);
          expect(rect8.left == 0 && rect8.top == 10 && rect8.right == 100 && rect8.bottom == 100).assertEqual(true);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region getBounds rect8 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(-100,-100,-50,-50);
      try {
        let rect9: common2D.Rect | undefined = region.getBounds();
        if(rect9 == undefined){
          console.info(msg + `Region getBounds rect9 failed`);
          expect().assertFail();
        } else {
          console.info(msg + `Region getBounds rect9 success`);
          console.info(msg + `rect11: ${JSON.stringify(rect9)}`);
          expect(rect9.left == -100 && rect9.top == -100 && rect9.right == -50 && rect9.bottom == -50).assertEqual(true);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region getBounds rect9 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(100,100,-100,-100);
      try {
        let rect10: common2D.Rect | undefined= region.getBounds();
        if(rect10 == undefined){
          console.info(msg + `Region getBounds rect10 failed`);
          expect().assertFail();
        } else {
          console.info(msg + `Region getBounds rect10 success`);
          console.info(msg + `rect11: ${JSON.stringify(rect10)}`);
          expect(rect10.left == 0 && rect10.top == 0 && rect10.right == 0 && rect10.bottom == 0).assertEqual(true);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region getBounds rect10 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      let path = new drawing.Path()
      region.setRect(100, 100, 400, 400);
      path.arcTo(50, 50, 300, 300, 0, 359);
      region.setPath(path,region);
      try {
        let rect11: common2D.Rect | undefined= region.getBounds();
        if(rect11 == undefined){
          console.info(msg + `Region getBounds rect11 failed`);
          expect().assertFail();
        } else {
          console.info(msg + `Region getBounds rect11 success`);
          console.info(msg + `rect11: ${JSON.stringify(rect11)}`);
          expect(rect11.left == 100 && rect11.top == 100 && rect11.right == 300 && rect11.bottom == 300).assertEqual(true);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region getBounds rect11 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRegionGetBoundsMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_1301
     * @tc.desc   testRegionGetBoundsMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRegionGetBoundsMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testRegionGetBoundsMultipleCallsStatic';
      let region = new drawing.Region();
      region.setRect(100, 100, 400, 400);
      for (let i = 0; i < 20; i += 1) {
        try {
          let rect: common2D.Rect | undefined= region.getBounds();
          if(rect == undefined){
            console.info(msg + `Region getBounds rect failed`);
            expect().assertFail();
          } else {
            console.info(msg + `region getBounds success step: ` + i);
            console.info(msg + `rect: ${JSON.stringify(rect)}`);
            expect(rect.left == 100 && rect.top == 100 && rect.right == 400 && rect.bottom == 400).assertEqual(true);
          }
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + `drawing region getBounds error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    })
    /**
     * @tc.name   testRegionGetBoundaryPathNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_1400
     * @tc.desc   testRegionGetBoundaryPathNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionGetBoundaryPathNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testRegionGetBoundaryPathNormalStatic';
      let region = new drawing.Region();
      try {
        let getpath = region.getBoundaryPath();
        if(getpath == undefined){
          console.info(msg + `Region getBoundaryPath failed`);
          expect().assertFail();
        } else {
          console.info(msg + `Region getBoundaryPath getpath success`);
          expect(getpath != null || getpath != undefined).assertTrue()
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region getBoundaryPath getpath error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      let region1 = new drawing.Region(region);
      try {
        let getpath2 = region1.getBoundaryPath();
        if(getpath2 == undefined){
          console.info(msg + `Region getBoundaryPath getpath2 failed`);
          expect().assertFail();
        } else {
          console.info(msg + `Region getBoundaryPath getpath2 success`);
          expect(getpath2 != null || getpath2 != undefined).assertTrue()
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region getBoundaryPath getpath2 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region = new drawing.Region(0,0,0,0);
      try {
        let getpath3 = region.getBoundaryPath();
        if(getpath3 == undefined){
          console.info(msg + `Region getBoundaryPath getpath3 failed`);
          expect().assertFail();
        } else {
          console.info(msg + `Region getBoundaryPath getpath3 success`);
          expect(getpath3 != null || getpath3 != undefined).assertTrue()
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region getBoundaryPath getpath3 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(10, 20, 20, 20);
      try {
        let getpath4 = region.getBoundaryPath();
        if(getpath4 == undefined){
          console.info(msg + `Region getBoundaryPath getpath4 failed`);
          expect().assertFail();
        } else {
          console.info(msg + `Region getBoundaryPath getpath4 success`);
          expect(getpath4 != null || getpath4 != undefined).assertTrue()
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region getBoundaryPath getpath4 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(10, 10, 10, 20);
      try {
        let getpath5 = region.getBoundaryPath();
        if(getpath5 == undefined){
          console.info(msg + `Region getBoundaryPath getpath5 failed`);
          expect().assertFail();
        } else {
          console.info(msg + `Region getBoundaryPath getpath5 success`);
          expect(getpath5 != null || getpath5 != undefined).assertTrue()
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region getBoundaryPath getpath5 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(20, 20, 20, 20);
      try {
        let getpath6 = region.getBoundaryPath();
        if(getpath6 == undefined){
          console.info(msg + `Region getBoundaryPath getpath6 failed`);
          expect().assertFail();
        } else {
          console.info(msg + `Region getBoundaryPath getpath6 success`);
          expect(getpath6 != null || getpath6 != undefined).assertTrue()
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region getBoundaryPath getpath6 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(50, 50, 300, 300);
      try {
        let getpath7 = region.getBoundaryPath();
        if(getpath7 == undefined){
          console.info(msg + `Region getBoundaryPath getpath7 failed`);
          expect().assertFail();
        } else {
          console.info(msg + `Region getBoundaryPath getpath7 success`);
          expect(getpath7 != null || getpath7 != undefined).assertTrue()
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region getBoundaryPath getpath7 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(0,100,600,500);
      try {
        let getpath8 = region.getBoundaryPath();
        if(getpath8 == undefined){
          console.info(msg + `Region getBoundaryPath getpath8 failed`);
          expect().assertFail();
        } else {
          console.info(msg + `Region getBoundaryPath getpath8 success`);
          expect(getpath8 != null || getpath8 != undefined).assertTrue()
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region getBoundaryPath getpath8 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(-100,-100,450,450);
      try {
        let getpath9 = region.getBoundaryPath();
        if(getpath9 == undefined){
          console.info(msg + `Region getBoundaryPath getpath9 failed`);
          expect().assertFail();
        } else {
          console.info(msg + `Region getBoundaryPath getpath9 success`);
          expect(getpath9 != null || getpath9 != undefined).assertTrue()
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region getBoundaryPath getpath9 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(100,100,-100,-100);
      try {
        let getpath10 = region.getBoundaryPath();
        if(getpath10 == undefined){
          console.info(msg + `Region getBoundaryPath getpath10 failed`);
          expect().assertFail();
        } else {
          console.info(msg + `Region getBoundaryPath getpath10 success`);
          expect(getpath10 != null || getpath10 != undefined).assertTrue()
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region getBoundaryPath getpath10 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      let path = new drawing.Path()
      region.setRect(100, 100, 400, 400);
      path.arcTo(50, 50, 300, 300, 0, 359);
      region.setPath(path,region);
      try {
        let getpath11 = region.getBoundaryPath();
        if(getpath11 == undefined){
          console.info(msg + `Region getBoundaryPath getpath11 failed`);
          expect().assertFail();
        } else {
          console.info(msg + `Region getBoundaryPath getpath11 success`);
          expect(getpath11 != null || getpath11 != undefined).assertTrue()
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region getBoundaryPath getpath11 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRegionGetBoundaryPathMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_1401
     * @tc.desc   testRegionGetBoundaryPathMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRegionGetBoundaryPathMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testRegionGetBoundaryPathMultipleCallsStatic';
      let region = new drawing.Region();
      region.setRect(100, 100, 400, 400);
      for (let i = 0; i < 20; i += 1) {
        try {
          let getpath = region.getBoundaryPath();
          if(getpath == undefined){
            console.info(msg + `Region getBoundaryPath getpath failed`);
            expect().assertFail();
          } else {
            console.info(msg + `region getBoundaryPath success step: ` + i);
            expect(getpath != null || getpath != undefined).assertTrue()
          }
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + `drawing region getBoundaryPath error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    })
    /**
     * @tc.name   testRegionOffsetNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_1500
     * @tc.desc   testRegionOffsetNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionOffsetNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testRegionOffsetNormalStatic';
      let region = new drawing.Region();
      try {
        region.offset(10,20);
        console.info(msg + `Region offset 1 success`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region offset 1 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(50, 50, 300, 300);
      try {
        region.offset(-50,-50);
        console.info(msg + `Region offset 2 success`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region offset 2 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        region.offset((Number.MAX_VALUE).toInt(), (Number.MAX_VALUE).toInt());
        console.info(msg + `Region offset 6 success`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region offset 6 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRegionOffsetMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_1501
     * @tc.desc   testRegionOffsetMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRegionOffsetMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testRegionOffsetMultipleCallsStatic';
      let region = new drawing.Region();
      region.setRect(100, 100, 400, 400);
      for (let i = 0; i < 20; i += 1) {
        try {
          region.offset(100,100);
          console.info(msg + `region offset success step: ` + i);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + `drawing region offset error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    })
    /**
     * @tc.name   testRegionQuickRejectRegionNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_1600
     * @tc.desc   testRegionQuickRejectRegionNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionQuickRejectRegionNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testRegionQuickRejectRegionNormalStatic';
      let region = new drawing.Region();
      region.setRect(100, 100, 400, 400);
      let other = new drawing.Region(50, 50, 150, 150);
      try {
        let flag1 = region.quickRejectRegion(other);
        console.info(msg + `Region quickRejectRegion flag1 success`);
        expect(flag1).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region quickRejectRegion flag1 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      other.setRect(0, 0, 100, 100);
      try {
        let flag2 = region.quickRejectRegion(other);
        console.info(msg + `Region quickRejectRegion flag2 success`);
        expect(flag2).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region quickRejectRegion flag2 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      other.setRect(-100, -100, 500, 500);
      try {
        let flag3 = region.quickRejectRegion(other);
        console.info(msg + `Region quickRejectRegion flag3 success`);
        expect(flag3).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region quickRejectRegion flag3 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      other.setRect(100, 100, 400, 400);
      try {
        let flag4 = region.quickRejectRegion(other);
        console.info(msg + `Region quickRejectRegion flag4 success`);
        expect(flag4).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region quickRejectRegion flag4 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      other.setRect(500, 500, 600, 600);
      try {
        let flag5 = region.quickRejectRegion(other);
        console.info(msg + `Region quickRejectRegion flag5 success`);
        expect(flag5).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region quickRejectRegion flag5 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      other.setRect(200, 200, 300, 300);
      try {
        let flag6 = region.quickRejectRegion(other);
        console.info(msg + `Region quickRejectRegion flag6 success`);
        expect(flag6).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region quickRejectRegion flag6 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      other.setRect(400, 400, 500, 500);
      try {
        let flag7 = region.quickRejectRegion(other);
        console.info(msg + `Region quickRejectRegion flag7 success`);
        expect(flag7).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region quickRejectRegion flag7 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      other.setRect(0, 0, 200, 100);
      try {
        let flag8 = region.quickRejectRegion(other);
        console.info(msg + `Region quickRejectRegion flag8 success`);
        expect(flag8).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region quickRejectRegion flag8 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      other.setRect(0, 100, 100, 400);
      try {
        let flag9 = region.quickRejectRegion(other);
        console.info(msg + `Region quickRejectRegion flag9 success`);
        expect(flag9).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region quickRejectRegion flag9 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      other.setRect(200, 400, 300, 500);
      try {
        let flag10 = region.quickRejectRegion(other);
        console.info(msg + `Region quickRejectRegion flag10 success`);
        expect(flag10).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region quickRejectRegion flag10 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      other.setRect(400, 300, 500, 500);
      try {
        let flag11 = region.quickRejectRegion(other);
        console.info(msg + `Region quickRejectRegion flag11 success`);
        expect(flag11).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region quickRejectRegion flag11 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRegionQuickRejectRegionMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_1601
     * @tc.desc   testRegionQuickRejectRegionMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRegionQuickRejectRegionMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testRegionQuickRejectRegionMultipleCallsStatic';
      let region = new drawing.Region();
      region.setRect(100, 100, 400, 400);
      let other = new drawing.Region(50, 50, 150, 150);
      for (let i = 0; i < 20; i += 1) {
        try {
          let flag1 = region.quickRejectRegion(other);
          console.info(msg + `region quickRejectRegion success step: ` + i);
          expect(flag1).assertEqual(false);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + `drawing region quickRejectRegion error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    })
    /**
     * @tc.name   testRegionEmptyNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_1700
     * @tc.desc   testRegionEmptyNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionEmptyNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRegionEmptyNormalStatic';
      let region = new drawing.Region();
      try {
        region.setEmpty();
      } catch (e) {
        console.info(msg + `RegionEmpty errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    });

    /**
     * @tc.name   testRegionEmptyMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_1701
     * @tc.desc   testRegionEmptyMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRegionEmptyMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRegionEmptyMultipleCallsStatic';
      let region = new drawing.Region();
      for (let i = 0; i < 20; i++) {
        try {
          region.setEmpty();
        } catch (e) {
          console.info(msg + `RegionEmpty errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail()
        }
      }
    });
    /**
     * @tc.name   testRegionSetRegionNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_1800
     * @tc.desc   testRegionSetRegionNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegionSetRegionNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testRegionSetRegionNormalStatic';
      let region = new drawing.Region();
      let region2 = new drawing.Region();
      try {
        region2.setRegion(region);
        let setRegion = region2.isEmpty();
        console.info(msg + `Region setRegion 1 success`);
        expect(setRegion).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region setRegion 1 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(10, 20, 20, 20)
      region2.setRegion(region);
      try {
        let rect = region2.getBounds();
        console.info(msg + `Region getBounds 2 success`);
        expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 0 && rect!.bottom == 0).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region getBounds 2 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(10, 10, 10, 20)
      region2.setRegion(region);
      try {
        let rect2 = region2.getBounds();
        console.info(msg + `Region getBounds rect2 success`);
        expect(rect2!.left == 0 && rect2!.top == 0 && rect2!.right == 0 && rect2!.bottom == 0).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region getBounds rect2 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(20, 20, 20, 20)
      region2.setRegion(region);
      try {
        let rect3 = region2.getBounds();
        console.info(msg + `Region getBounds rect3 success`);
        expect(rect3!.left == 0 && rect3!.top == 0 && rect3!.right == 0 && rect3!.bottom == 0).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region getBounds rect3 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(0, 0, 100, 100)
      region2.setRegion(region);
      try {
        let rect4 = region2.getBounds();
        console.info(msg + `Region getBounds rect4 success`);
        expect(rect4!.left == 0 && rect4!.top == 0 && rect4!.right == 100 && rect4!.bottom == 100).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region getBounds rect4 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(0,10,100,100);
      try {
        region2.setRegion(region);
        console.info(msg + `Region region2 setRegion 2 success`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region region2 setRegion 2 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(-100,-100,-50,-50);
      try {
        region2.setRegion(region);
        console.info(msg + `Region region2 setRegion 3 success`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region region2 setRegion 3 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      region.setRect(100,100,-100,-100)
      region2.setRegion(region);
      try {
        let rect7 = region2.getBounds();
        console.info(msg + `Region getBounds rect7 success`);
        console.info(msg + `Region getBounds rect7: ` + JSON.stringify(rect7!));
        expect(rect7!.left == 0 && rect7!.top == 0 && rect7!.right == 0 && rect7!.bottom == 0).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region getBounds rect7 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      let path = new drawing.Path()
      region.setRect(100, 100, 400, 400);
      path.arcTo(50, 50, 300, 300, 0, 359);
      region.setPath(path,region);
      try {
        region2.setRegion(region);
        console.info(msg + `Region region2 setRegion 4 success`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `Region region2 setRegion 4 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRegionSetRegionMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_REGION_STATIC_1801
     * @tc.desc   testRegionSetRegionMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRegionSetRegionMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testRegionSetRegionMultipleCallsStatic';
      let region = new drawing.Region();
      let region2 = new drawing.Region();
      region.setRect(100, 100, 400, 400);
      for (let i = 0; i < 20; i += 1) {
        try {
          region2.setRegion(region);
          console.info(msg + `region2 setRegion success step: ` + i);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + `drawing region2 setRegion error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    })
  });
}
