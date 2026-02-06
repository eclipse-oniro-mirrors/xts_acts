/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import libGraphics2DApi20 from 'libgraphicsApiNdk.so'
const Success = 0;
const InvalidArguments = 40001000;

export default function ExternalWindowTest() {
  describe('ExternalWindowTest', () => {
    /**
     * @tc.name   SUB_OH_ScalingModeToWindow_0100
     * @tc.number SUB_OH_ScalingModeToWindow_0100
     * @tc.desc   Test testOHScalingModeToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_ScalingModeToWindow_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_ScalingModeToWindow_0100 start====");
          let result: number = libGraphics2DApi20.testOHScalingModeToWindow();
          console.info("====> SUB_OH_ScalingModeToWindow_0100 result====", result);
          expect(result).assertEqual(InvalidArguments);
          done();
        } catch (err) {
          console.error("====> SUB_OH_ScalingModeToWindow_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_ScalingModeCrop_0200
     * @tc.number SUB_OH_ScalingModeCrop_0200
     * @tc.desc   Test testOHScalingModeCrop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_ScalingModeCrop_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_ScalingModeCrop_0200 start====");
          let result: number = libGraphics2DApi20.testOHScalingModeCrop();
          console.info("====> SUB_OH_ScalingModeCrop_0200 result====", result);
          expect(result).assertEqual(InvalidArguments);
          done();
        } catch (err) {
          console.error("====> SUB_OH_ScalingModeCrop_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_ScalingModeNoCrop_0300
     * @tc.number SUB_OH_ScalingModeNoCrop_0300
     * @tc.desc   Test testOHScalingModeNoCrop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_ScalingModeNoCrop_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_ScalingModeNoCrop_0300 start====");
          let result: number = libGraphics2DApi20.testOHScalingModeNoCrop();
          console.info("====> SUB_OH_ScalingModeNoCrop_0300 result====", result);
          expect(result).assertEqual(InvalidArguments);
          done();
        } catch (err) {
          console.error("====> SUB_OH_ScalingModeNoCrop_0300 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_MetakeyRedPrimaryY_0400
     * @tc.number SUB_OH_MetakeyRedPrimaryY_0400
     * @tc.desc   Test testOhMetakeyRedPrimaryY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_MetakeyRedPrimaryY_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_MetakeyRedPrimaryY_0400 start====");
          let result: number = libGraphics2DApi20.testOhMetakeyRedPrimaryY();
          console.info("====> SUB_OH_MetakeyRedPrimaryY_0400 result====", result);
          expect(result).assertEqual(InvalidArguments);
          done();
        } catch (err) {
          console.error("====> SUB_OH_MetakeyRedPrimaryY_0400 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_MetakeyGreenPrimaryX_0500
     * @tc.number SUB_OH_MetakeyGreenPrimaryX_0500
     * @tc.desc   Test testOhMetakeyGreenPrimaryX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_MetakeyGreenPrimaryX_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_MetakeyGreenPrimaryX_0500 start====");
          let result: number = libGraphics2DApi20.testOhMetakeyGreenPrimaryX();
          console.info("====> SUB_OH_MetakeyGreenPrimaryX_0500 result====", result);
          expect(result).assertEqual(InvalidArguments);
          done();
        } catch (err) {
          console.error("====> SUB_OH_MetakeyGreenPrimaryX_0500 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_MetakeyGreenPrimary_0600
     * @tc.number SUB_OH_MetakeyGreenPrimary_0600
     * @tc.desc   Test testOhMetakeyGreenPrimaryY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_MetakeyGreenPrimary_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_MetakeyGreenPrimary_0600 start====");
          let result: number = libGraphics2DApi20.testOhMetakeyGreenPrimaryY();
          console.info("====> SUB_OH_MetakeyGreenPrimary_0600 result====", result);
          expect(result).assertEqual(InvalidArguments);
          done();
        } catch (err) {
          console.error("====> SUB_OH_MetakeyGreenPrimary_0600 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_MetakeyBluePrimaryX_0700
     * @tc.number SUB_OH_MetakeyBluePrimaryX_0700
     * @tc.desc   Test testOhMetakeyBluePrimaryX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_MetakeyBluePrimaryX_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_MetakeyBluePrimaryX_0700 start====");
          let result: number = libGraphics2DApi20.testOhMetakeyBluePrimaryX();
          console.info("====> SUB_OH_MetakeyBluePrimaryX_0700 result====", result);
          expect(result).assertEqual(InvalidArguments);
          done();
        } catch (err) {
          console.error("====> SUB_OH_MetakeyBluePrimaryX_0700 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_MetakeyBluePrimaryY_0800
     * @tc.number SUB_OH_MetakeyBluePrimaryY_0800
     * @tc.desc   Test testOhMetakeyBluePrimaryY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_MetakeyBluePrimaryY_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_MetakeyBluePrimaryY_0800 start====");
          let result: number = libGraphics2DApi20.testOhMetakeyBluePrimaryY();
          console.info("====> SUB_OH_MetakeyBluePrimaryY_0800 result====", result);
          expect(result).assertEqual(InvalidArguments);
          done();
        } catch (err) {
          console.error("====> SUB_OH_MetakeyBluePrimaryY_0800 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_MetakeyWhitePrimaryX_0900
     * @tc.number SUB_OH_MetakeyWhitePrimaryX_0900
     * @tc.desc   Test testOhMetakeyWhitePrimaryX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_MetakeyWhitePrimaryX_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_MetakeyWhitePrimaryX_0900 start====");
          let result: number = libGraphics2DApi20.testOhMetakeyWhitePrimaryX();
          console.info("====> SUB_OH_MetakeyWhitePrimaryX_0900 result====", result);
          expect(result).assertEqual(InvalidArguments);
          done();
        } catch (err) {
          console.error("====> SUB_OH_MetakeyWhitePrimaryX_0900 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_MetakeyWhitePrimaryY_1000
     * @tc.number SUB_OH_MetakeyWhitePrimaryY_1000
     * @tc.desc   Test testOhMetakeyWhitePrimaryY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_MetakeyWhitePrimaryY_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_MetakeyWhitePrimaryY_1000 start====");
          let result: number = libGraphics2DApi20.testOhMetakeyWhitePrimaryY();
          console.info("====> SUB_OH_MetakeyWhitePrimaryY_1000 result====", result);
          expect(result).assertEqual(InvalidArguments);
          done();
        } catch (err) {
          console.error("====> SUB_OH_MetakeyWhitePrimaryY_1000 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_MetakeyMaxLuminance_1100
     * @tc.number SUB_OH_MetakeyMaxLuminance_1100
     * @tc.desc   Test testOhMetakeyMaxLuminance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_MetakeyMaxLuminance_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_MetakeyMaxLuminance_1100 start====");
          let result: number = libGraphics2DApi20.testOhMetakeyMaxLuminance();
          console.info("====> SUB_OH_MetakeyMaxLuminance_1100 result====", result);
          expect(result).assertEqual(InvalidArguments);
          done();
        } catch (err) {
          console.error("====> SUB_OH_MetakeyMaxLuminance_1100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_MetakeyMinLuminance_1200
     * @tc.number SUB_OH_MetakeyMinLuminance_1200
     * @tc.desc   Test testOhMetakeyMinLuminance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_MetakeyMinLuminance_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_MetakeyMinLuminance_1200 start====");
          let result: number = libGraphics2DApi20.testOhMetakeyMinLuminance();
          console.info("====> SUB_OH_MetakeyMinLuminance_1200 result====", result);
          expect(result).assertEqual(InvalidArguments);
          done();
        } catch (err) {
          console.error("====> SUB_OH_MetakeyMinLuminance_1200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_MetakeyMaxContentLightLevel_1300
     * @tc.number SUB_OH_MetakeyMaxContentLightLevel_1300
     * @tc.desc   Test testOhMetakeyMaxContentLightLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_MetakeyMaxContentLightLevel_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_MetakeyMaxContentLightLevel_1300 start====");
          let result: number = libGraphics2DApi20.testOhMetakeyMaxContentLightLevel();
          console.info("====> SUB_OH_MetakeyMaxContentLightLevel_1300 result====", result);
          expect(result).assertEqual(InvalidArguments);
          done();
        } catch (err) {
          console.error("====> SUB_OH_MetakeyMaxContentLightLevel_1300 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_MetakeyMaxFrameAverageLightLevel_1400
     * @tc.number SUB_OH_MetakeyMaxFrameAverageLightLevel_1400
     * @tc.desc   Test testOhMetakeyMaxFrameAverageLightLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_MetakeyMaxFrameAverageLightLevel_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_MetakeyMaxFrameAverageLightLevel_1400 start====");
          let result: number = libGraphics2DApi20.testOhMetakeyMaxFrameAverageLightLevel();
          console.info("====> SUB_OH_MetakeyMaxFrameAverageLightLevel_1400 result====", result);
          expect(result).assertEqual(InvalidArguments);
          done();
        } catch (err) {
          console.error("====> SUB_OH_MetakeyMaxFrameAverageLightLevel_1400 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_MetakeyHdrVivid_1500
     * @tc.number SUB_OH_MetakeyHdrVivid_1500
     * @tc.desc   Test testOhMetakeyHdrVivid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_MetakeyHdrVivid_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_MetakeyHdrVivid_1500 start====");
          let result: number = libGraphics2DApi20.testOhMetakeyHdrVivid();
          console.info("====> SUB_OH_MetakeyHdrVivid_1500 result====", result);
          expect(result).assertEqual(InvalidArguments);
          done();
        } catch (err) {
          console.error("====> SUB_OH_MetakeyHdrVivid_1500 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeWindowWTParcelSuccess_1600
     * @tc.number SUB_OH_NativeWindowWTParcelSuccess_1600
     * @tc.desc   Test testNativeWindowWTParcelSuccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_NativeWindowWTParcelSuccess_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeWindowWTParcelSuccess_1600 start====");
          let result: number = libGraphics2DApi20.testNativeWindowWTParcelSuccess();
          console.info("====> SUB_OH_NativeWindowWTParcelSuccess_1600 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeWindowWTParcelSuccess_1600 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeWindowWTParcelInvalidArguments_1700
     * @tc.number SUB_OH_NativeWindowWTParcelInvalidArguments_1700
     * @tc.desc   Test testNativeWindowWTParcelInvalidArguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_NativeWindowWTParcelInvalidArguments_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeWindowWTParcelInvalidArguments_1700 start====");
          let result: number = libGraphics2DApi20.testNativeWindowWTParcelInvalidArguments();
          console.info("====> SUB_OH_NativeWindowWTParcelInvalidArguments_1700 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeWindowWTParcelInvalidArguments_1700 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeWindowRFParcelSuccess_1800
     * @tc.number SUB_OH_NativeWindowRFParcelSuccess_1800
     * @tc.desc   Test testNativeWindowRFParcelSuccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_NativeWindowRFParcelSuccess_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeWindowRFParcelSuccess_1800 start====");
          let result: number = libGraphics2DApi20.testNativeWindowRFParcelSuccess();
          console.info("====> SUB_OH_NativeWindowRFParcelSuccess_1800 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeWindowRFParcelSuccess_1800 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeWindowRFParcelInvalidArguments_1900
     * @tc.number SUB_OH_NativeWindowRFParcelInvalidArguments_1900
     * @tc.desc   Test testNativeWindowRFParcelInvalidArguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_NativeWindowRFParcelInvalidArguments_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeWindowRFParcelInvalidArguments_1900 start====");
          let result: number = libGraphics2DApi20.testNativeWindowRFParcelInvalidArguments();
          console.info("====> SUB_OH_NativeWindowRFParcelInvalidArguments_1900 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeWindowRFParcelInvalidArguments_1900 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeWindowWindowHandleOptSetTimeOut_2000
     * @tc.number SUB_OH_NativeWindowWindowHandleOptSetTimeOut_2000
     * @tc.desc   Test testNativeWindowWindowHandleOptSetTimeOut
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_NativeWindowWindowHandleOptSetTimeOut_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeWindowWindowHandleOptSetTimeOut_2000 start====");
          let result: number = libGraphics2DApi20.testNativeWindowWindowHandleOptSetTimeOut();
          console.info("====> SUB_OH_NativeWindowWindowHandleOptSetTimeOut_2000 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeWindowWindowHandleOptSetTimeOut_2000 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeWindowWindowHandleOptGetTimeOut_2100
     * @tc.number SUB_OH_NativeWindowWindowHandleOptGetTimeOut_2100
     * @tc.desc   Test testNativeWindowWindowHandleOptGetTimeOut
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_NativeWindowWindowHandleOptGetTimeOut_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeWindowWindowHandleOptGetTimeOut_2100 start====");
          let result: number = libGraphics2DApi20.testNativeWindowWindowHandleOptGetTimeOut();
          console.info("====> SUB_OH_NativeWindowWindowHandleOptGetTimeOut_2100 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeWindowWindowHandleOptGetTimeOut_2100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeWindowGLFlushedBufferV2Success_2200
     * @tc.number SUB_OH_NativeWindowGLFlushedBufferV2Success_2200
     * @tc.desc   Test testNativeWindowGLFlushedBufferV2Success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_NativeWindowGLFlushedBufferV2Success_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeWindowGLFlushedBufferV2Success_2200 start====");
          let result: number = libGraphics2DApi20.testNativeWindowGLFlushedBufferV2Success();
          console.info("====> SUB_OH_NativeWindowGLFlushedBufferV2Success_2200 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeWindowGLFlushedBufferV2Success_2200 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.name   SUB_OH_NativeWindowGLFBufferV2InvalidArguments_2300
     * @tc.number SUB_OH_NativeWindowGLFBufferV2InvalidArguments_2300
     * @tc.desc   Test testNativeWindowGLFBufferV2InvalidArguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_NativeWindowGLFBufferV2InvalidArguments_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_NativeWindowGLFBufferV2InvalidArguments_2300 start====");
          let result: number = libGraphics2DApi20.testNativeWindowGLFBufferV2InvalidArguments();
          console.info("====> SUB_OH_NativeWindowGLFBufferV2InvalidArguments_2300 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_NativeWindowGLFBufferV2InvalidArguments_2300 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.name   SUB_OH_testNativeWindowSetColorSpaceSuccess_2400
     * @tc.number SUB_OH_testNativeWindowSetColorSpaceSuccess_2400
     * @tc.desc   Test testNativeWindowSetColorSpaceSuccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_testNativeWindowSetColorSpaceSuccess_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_testNativeWindowSetColorSpaceSuccess_2400 start====");
          let result: number = libGraphics2DApi20.testNativeWindowSetColorSpaceSuccess();
          console.info("====> SUB_OH_testNativeWindowSetColorSpaceSuccess_2400 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_testNativeWindowSetColorSpaceSuccess_2400 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.name   SUB_OH_testNativeWindowSetColorSpaceInvalidArguments_2500
     * @tc.number SUB_OH_testNativeWindowSetColorSpaceInvalidArguments_2500
     * @tc.desc   Test testNativeWindowSetColorSpaceInvalidArguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_testNativeWindowSetColorSpaceInvalidArguments_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_testNativeWindowSetColorSpaceInvalidArguments_2500 start====");
          let result: number = libGraphics2DApi20.testNativeWindowSetColorSpaceInvalidArguments();
          console.info("====> SUB_OH_testNativeWindowSetColorSpaceInvalidArguments_2500 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_testNativeWindowSetColorSpaceInvalidArguments_2500 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.name   SUB_OH_testNativeWindowGetColorSpaceInvalidArguments_2600
     * @tc.number SUB_OH_testNativeWindowGetColorSpaceInvalidArguments_2600
     * @tc.desc   Test testNativeWindowGetColorSpaceInvalidArguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_testNativeWindowGetColorSpaceInvalidArguments_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_testNativeWindowGetColorSpaceInvalidArguments_2600 start====");
          let result: number = libGraphics2DApi20.testNativeWindowGetColorSpaceInvalidArguments();
          console.info("====> SUB_OH_testNativeWindowGetColorSpaceInvalidArguments_2600 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_testNativeWindowGetColorSpaceInvalidArguments_2600 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.name   SUB_OH_testNativeWindowSetMVSuccess_2700
     * @tc.number SUB_OH_testNativeWindowSetMVSuccess_2700
     * @tc.desc   Test testNativeWindowSetMVSuccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_testNativeWindowSetMVSuccess_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_testNativeWindowSetMVSuccess_2700 start====");
          let result: number = libGraphics2DApi20.testNativeWindowSetMVSuccess();
          console.info("====> SUB_OH_testNativeWindowSetMVSuccess_2700 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_testNativeWindowSetMVSuccess_2700 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.name   SUB_OH_testNativeWindowSetMVInvalidArguments_2800
     * @tc.number SUB_OH_testNativeWindowSetMVInvalidArguments_2800
     * @tc.desc   Test testNativeWindowSetMVInvalidArguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_testNativeWindowSetMVInvalidArguments_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_testNativeWindowSetMVInvalidArguments_2800 start====");
          let result: number = libGraphics2DApi20.testNativeWindowSetMVInvalidArguments();
          console.info("====> SUB_OH_testNativeWindowSetMVInvalidArguments_2800 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_testNativeWindowSetMVInvalidArguments_2800 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.name   SUB_OH_testNativeWindowGetMVSuccess_3000
     * @tc.number SUB_OH_testNativeWindowGetMVSuccess_3000
     * @tc.desc   Test testNativeWindowGetMVSuccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_testNativeWindowGetMVSuccess_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_testNativeWindowGetMVSuccess_3000 start====");
          let result: number = libGraphics2DApi20.testNativeWindowGetMVSuccess();
          console.info("====> SUB_OH_testNativeWindowGetMVSuccess_3000 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_testNativeWindowGetMVSuccess_3000 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.name   SUB_OH_testNativeWindowGetMVInvalidArguments_3100
     * @tc.number SUB_OH_testNativeWindowGetMVInvalidArguments_3100
     * @tc.desc   Test testNativeWindowGetMVInvalidArguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_testNativeWindowGetMVInvalidArguments_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_testNativeWindowGetMVInvalidArguments_3100 start====");
          let result: number = libGraphics2DApi20.testNativeWindowGetMVInvalidArguments();
          console.info("====> SUB_OH_testNativeWindowGetMVInvalidArguments_3100 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_testNativeWindowGetMVInvalidArguments_3100 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.name   SUB_OH_testNativeWindowGetMVUnsupported_3200
     * @tc.number SUB_OH_testNativeWindowGetMVUnsupported_3200
     * @tc.desc   Test testNativeWindowGetMVUnsupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_testNativeWindowGetMVUnsupported_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_testNativeWindowGetMVUnsupported_3200 start====");
          let result: number = libGraphics2DApi20.testNativeWindowGetMVUnsupported();
          console.info("====> SUB_OH_testNativeWindowGetMVUnsupported_3200 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_testNativeWindowGetMVUnsupported_3200 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.name   SUB_OH_testNativeWindowCleanCacheInvalidArguments_3300
     * @tc.number SUB_OH_testNativeWindowCleanCacheInvalidArguments_3300
     * @tc.desc   Test testNativeWindowCleanCacheInvalidArguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_testNativeWindowCleanCacheInvalidArguments_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_testNativeWindowCleanCacheInvalidArguments_3300 start====");
          let result: number = libGraphics2DApi20.testNativeWindowCleanCacheInvalidArguments();
          console.info("====> SUB_OH_testNativeWindowCleanCacheInvalidArguments_3300 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_testNativeWindowCleanCacheInvalidArguments_3300 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.name   SUB_OH_testNativeWindowCleanCacheConsumerDisconnected_3400
     * @tc.number SUB_OH_testNativeWindowCleanCacheConsumerDisconnected_3400
     * @tc.desc   Test testNativeWindowCleanCacheConsumerDisconnected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_testNativeWindowCleanCacheConsumerDisconnected_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_testNativeWindowCleanCacheConsumerDisconnected_3400 start====");
          let result: number = libGraphics2DApi20.testNativeWindowCleanCacheConsumerDisconnected();
          console.info("====> SUB_OH_testNativeWindowCleanCacheConsumerDisconnected_3400 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_testNativeWindowCleanCacheConsumerDisconnected_3400 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.name   SUB_OH_GLFlushedBufferV2BUFFERSTATEINVALID_3500
     * @tc.number SUB_OH_GLFlushedBufferV2BUFFERSTATEINVALID_3500
     * @tc.desc   Test testNativeWindowGLFlushedBufferV2BUFFERSTATEINVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_GLFlushedBufferV2BUFFERSTATEINVALID_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_GLFlushedBufferV2BUFFERSTATEINVALID_3500 start====");
          let result: number = libGraphics2DApi20.testNativeWindowGLFlushedBufferV2BUFFERSTATEINVALID();
          console.info("====> SUB_OH_GLFlushedBufferV2BUFFERSTATEINVALID_3500 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_GLFlushedBufferV2BUFFERSTATEINVALID_3500 catch err: " + err);
          done();
        }
      })
  })
}