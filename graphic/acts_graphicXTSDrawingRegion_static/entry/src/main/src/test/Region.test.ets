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
          console.info(msg + `drawing region error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
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
  });
}
