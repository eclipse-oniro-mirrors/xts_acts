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

import { describe, it, expect, TestType, Size, Level, beforeAll } from '@ohos/hypium'
import displaymanager from 'libdisplaymanager.so'
import { BusinessError } from '@kit.BasicServicesKit';
const Success = 0;
export default function DisplayManagerTest() {
  describe('DisplayManagerTest', () => {

    /**
     * @tc.number  : SUB_OH_GetDefaultDisplayId_0100
     * @tc.name    : SUB_OH_GetDefaultDisplayId_0100
     * @tc.desc    : Test GetDefaultDisplayId
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_GetDefaultDisplayId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_GetDefaultDisplayId_0100 start====");
          let result: number = displaymanager.GetDefaultDisplayId();
          console.info("====> SUB_OH_GetDefaultDisplayId_0100 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_GetDefaultDisplayId_0100 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_GetDefaultDisplayWidth_0200
     * @tc.name    : SUB_OH_GetDefaultDisplayWidth_0200
     * @tc.desc    : Test GetDefaultDisplayWidth
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_GetDefaultDisplayWidth_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_GetDefaultDisplayWidth_0200 start====");
          let result: number = displaymanager.GetDefaultDisplayWidth();
          console.info("====> SUB_OH_GetDefaultDisplayWidth_0200 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_GetDefaultDisplayWidth_0200 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_GetDefaultDisplayHeight_0300
     * @tc.name    : SUB_OH_GetDefaultDisplayHeight_0300
     * @tc.desc    : Test GetDefaultDisplayHeight
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_GetDefaultDisplayHeight_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_GetDefaultDisplayHeight_0300 start====");
          let result: number = displaymanager.GetDefaultDisplayHeight();
          console.info("====> SUB_OH_GetDefaultDisplayHeight_0300 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_GetDefaultDisplayHeight_0300 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_GetDefaultDisplayRotation_0400
     * @tc.name    : SUB_OH_GetDefaultDisplayRotation_0400
     * @tc.desc    : Test GetDefaultDisplayRotation
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_GetDefaultDisplayRotation_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_GetDefaultDisplayRotation_0400 start====");
          let result: number = displaymanager.GetDefaultDisplayRotation();
          console.info("====> SUB_OH_GetDefaultDisplayRotation_0400 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_GetDefaultDisplayRotation_0400 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_GetDefaultDisplayOrientation_0500
     * @tc.name    : SUB_OH_GetDefaultDisplayOrientation_0500
     * @tc.desc    : Test GetDefaultDisplayOrientation
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_GetDefaultDisplayOrientation_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_GetDefaultDisplayOrientation_0500 start====");
          let result: number = displaymanager.GetDefaultDisplayOrientation();
          console.info("====> SUB_OH_GetDefaultDisplayOrientation_0500 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_GetDefaultDisplayOrientation_0500 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_GetDefaultDisplayVirtualPixelRatio_0600
     * @tc.name    : SUB_OH_GetDefaultDisplayVirtualPixelRatio_0600
     * @tc.desc    : Test GetDefaultDisplayRotation
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_GetDefaultDisplayVirtualPixelRatio_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_GetDefaultDisplayVirtualPixelRatio_0600 start====");
          let result: number = displaymanager.GetDefaultDisplayVirtualPixelRatio();
          console.info("====> SUB_OH_GetDefaultDisplayVirtualPixelRatio_0600 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_GetDefaultDisplayVirtualPixelRatio_0600 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_GetDefaultDisplayRefreshRate_0700
     * @tc.name    : SUB_OH_GetDefaultDisplayRefreshRate_0700
     * @tc.desc    : Test GetDefaultDisplayRefreshRate
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_GetDefaultDisplayRefreshRate_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_GetDefaultDisplayRefreshRate_0700 start====");
          let result: number = displaymanager.GetDefaultDisplayRefreshRate();
          console.info("====> SUB_OH_GetDefaultDisplayRefreshRate_0700 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_GetDefaultDisplayRefreshRate_0700 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_GetDefaultDisplayDensityDpi_0800
     * @tc.name    : SUB_OH_GetDefaultDisplayDensityDpi_0800
     * @tc.desc    : Test GetDefaultDisplayDensityDpi
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_GetDefaultDisplayDensityDpi_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_GetDefaultDisplayDensityDpi_0800 start====");
          let result: number = displaymanager.GetDefaultDisplayDensityDpi();
          console.info("====> SUB_OH_GetDefaultDisplayDensityDpi_0800 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_GetDefaultDisplayDensityDpi_0800 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_GetDefaultDisplayDensityPixels_0900
     * @tc.name    : SUB_OH_GetDefaultDisplayDensityPixels_0900
     * @tc.desc    : Test GetDefaultDisplayDensityPixels
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_GetDefaultDisplayDensityPixels_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_GetDefaultDisplayDensityPixels_0900 start====");
          let result: number = displaymanager.GetDefaultDisplayDensityPixels();
          console.info("====> SUB_OH_GetDefaultDisplayDensityPixels_0900 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_GetDefaultDisplayDensityPixels_0900 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_GetDefaultDisplayScaledDensity_1000
     * @tc.name    : SUB_OH_GetDefaultDisplayScaledDensity_1000
     * @tc.desc    : Test GetDefaultDisplayScaledDensity
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_GetDefaultDisplayScaledDensity_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_GetDefaultDisplayScaledDensity_1000 start====");
          let result: number = displaymanager.GetDefaultDisplayScaledDensity();
          console.info("====> SUB_OH_GetDefaultDisplayScaledDensity_1000 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_GetDefaultDisplayScaledDensity_1000 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_GetDefaultDisplayDensityXdpi_1100
     * @tc.name    : SUB_OH_GetDefaultDisplayDensityXdpi_1100
     * @tc.desc    : Test GetDefaultDisplayDensityXdpi
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_GetDefaultDisplayDensityXdpi_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_GetDefaultDisplayDensityXdpi_1100 start====");
          let result: number = displaymanager.GetDefaultDisplayDensityXdpi();
          console.info("====> SUB_OH_GetDefaultDisplayDensityXdpi_1100 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_GetDefaultDisplayDensityXdpi_1100 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_GetDefaultDisplayDensityYdpi_1200
     * @tc.name    : SUB_OH_GetDefaultDisplayDensityYdpi_1200
     * @tc.desc    : Test GetDefaultDisplayDensityYdpi
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_GetDefaultDisplayDensityYdpi_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_GetDefaultDisplayDensityYdpi_1200 start====");
          let result: number = displaymanager.GetDefaultDisplayDensityYdpi();
          console.info("====> SUB_OH_GetDefaultDisplayDensityYdpi_1200 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_GetDefaultDisplayDensityYdpi_1200 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_CreateDefaultDisplayCutoutInfo_1300
     * @tc.name    : SUB_OH_CreateDefaultDisplayCutoutInfo_1300
     * @tc.desc    : Test CreateDefaultDisplayCutoutInfo
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreateDefaultDisplayCutoutInfo_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreateDefaultDisplayCutoutInfo_1300 start====");
          let result: number = displaymanager.CreateDefaultDisplayCutoutInfo();
          console.info("====> SUB_OH_CreateDefaultDisplayCutoutInfo_1300 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreateDefaultDisplayCutoutInfo_1300 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_DestroyDefaultDisplayCutoutInfoSuccess_1400
     * @tc.name    : SUB_OH_DestroyDefaultDisplayCutoutInfoSuccess_1400
     * @tc.desc    : Test DestroyDefaultDisplayCutoutInfoSuccess
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_DestroyDefaultDisplayCutoutInfoSuccess_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_DestroyDefaultDisplayCutoutInfoSuccess_1400 start====");
          let result: number = displaymanager.DestroyDefaultDisplayCutoutInfoSuccess();
          console.info("====> SUB_OH_DestroyDefaultDisplayCutoutInfoSuccess_1400 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_DestroyDefaultDisplayCutoutInfoSuccess_1400 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_DestroyDefaultDisplayCutoutInfoError_1500
     * @tc.name    : SUB_OH_DestroyDefaultDisplayCutoutInfoError_1500
     * @tc.desc    : Test DestroyDefaultDisplayCutoutInfoError
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_DestroyDefaultDisplayCutoutInfoError_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_DestroyDefaultDisplayCutoutInfoError_1500 start====");
          let result: number = displaymanager.DestroyDefaultDisplayCutoutInfoError();
          console.info("====> SUB_OH_DestroyDefaultDisplayCutoutInfoError_1500 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_DestroyDefaultDisplayCutoutInfoError_1500 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_GetFoldDisplayMode_1600
     * @tc.name    : SUB_OH_GetFoldDisplayMode_1600
     * @tc.desc    : Test GetFoldDisplayMode
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_GetFoldDisplayMode_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_GetFoldDisplayMode_1600 start====");
          let result: number = displaymanager.GetFoldDisplayMode();
          console.info("====> SUB_OH_GetFoldDisplayMode_1600 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_GetFoldDisplayMode_1600 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_RegisterDisplayChangeListener_1700
     * @tc.name    : SUB_OH_RegisterDisplayChangeListener_1700
     * @tc.desc    : Test RegisterDisplayChangeListener
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_RegisterDisplayChangeListener_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_RegisterDisplayChangeListener_1700 start====");
          let result: number = displaymanager.RegisterDisplayChangeListener();
          console.info("====> SUB_OH_RegisterDisplayChangeListener_1700 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_RegisterDisplayChangeListener_1700 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_UnRegisterDisplayChangeListener_1800
     * @tc.name    : SUB_OH_UnRegisterDisplayChangeListener_1800
     * @tc.desc    : Test UnRegisterDisplayChangeListener
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_UnRegisterDisplayChangeListener_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_UnRegisterDisplayChangeListener_1800 start====");
          let result: number = displaymanager.UnRegisterDisplayChangeListener();
          console.info("====> SUB_OH_UnRegisterDisplayChangeListener_1800 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_UnRegisterDisplayChangeListener_1800 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_RegisterFoldDisplayModeChangeListenerNoSupport_2000
     * @tc.name    : SUB_OH_RegisterFoldDisplayModeChangeListenerNoSupport_2000
     * @tc.desc    : Test RegisterFoldDisplayModeChangeListenerNoSupport
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_RegisterFoldDisplayModeChangeListenerNoSupport_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_RegisterFoldDisplayModeChangeListenerNoSupport_2000 start====");
          let result: number = displaymanager.RegisterFoldDisplayModeChangeListenerNoSupport();
          console.info("====> SUB_OH_RegisterFoldDisplayModeChangeListenerNoSupport_2000 result====", result);
          expect([0, 801]).assertContain(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_RegisterFoldDisplayModeChangeListenerNoSupport_2000 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_RegisterFoldDisplayModeChangeListener_2100
     * @tc.name    : SUB_OH_RegisterFoldDisplayModeChangeListenerInvalidParam_2100
     * @tc.desc    : Test RegisterFoldDisplayModeChangeListenerInvalidParam
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_RegisterFoldDisplayModeChangeListenerInvalidParam_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_RegisterFoldDisplayModeChangeListenerInvalidParam_2100 start====");
          let result: number = displaymanager.RegisterFoldDisplayModeChangeListenerInvalidParam();
          console.info("====> SUB_OH_RegisterFoldDisplayModeChangeListenerInvalidParam_2100 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_RegisterFoldDisplayModeChangeListenerInvalidParam_2100 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_GetAllDisplay_2300
     * @tc.name    : SUB_OH_GetAllDisplay_2300
     * @tc.desc    : Test GetAllDisplay
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_GetAllDisplay_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_GetAllDisplay_2300 start====");
          let result: number = displaymanager.GetAllDisplay();
          console.info("====> SUB_OH_GetAllDisplay_2300 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_GetAllDisplay_2300 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_GetDisplayById_2400
     * @tc.name    : SUB_OH_GetDisplayById_2400
     * @tc.desc    : Test GetDisplayById
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_GetDisplayById_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_GetDisplayById_2400 start====");
          let result: number = displaymanager.GetDisplayById();
          console.info("====> SUB_OH_GetDisplayById_2400 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_GetDisplayById_2400 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_CreatePrimaryDisplay_2500
     * @tc.name    : SUB_OH_CreatePrimaryDisplay_2500
     * @tc.desc    : Test GetPrimaryDisplay
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_CreatePrimaryDisplay_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_CreatePrimaryDisplay_2500 start====");
          let result: number = displaymanager.CreatePrimaryDisplay();
          console.info("====> SUB_OH_CreatePrimaryDisplay_2500 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_CreatePrimaryDisplay_2500 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_RegisterAvailableAreaChangeListener_2600
     * @tc.name    : SUB_OH_RegisterAvailableAreaChangeListener_2600
     * @tc.desc    : Test RegisterAvailableAreaChangeListener
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_RegisterAvailableAreaChangeListener_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_RegisterAvailableAreaChangeListener_2600 start====");
          let result: number = displaymanager.RegisterAvailableAreaChangeListener();
          console.info("====> SUB_OH_RegisterAvailableAreaChangeListener_2600 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_RegisterAvailableAreaChangeListener_2600 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_DestroyAvailableArea_2900
     * @tc.name    : SUB_OH_DestroyAvailableArea_2900
     * @tc.desc    : Test DestroyAvailableArea
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_DestroyAvailableArea_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_DestroyAvailableArea_2900 start====");
          let result: number = displaymanager.DestroyAvailableArea();
          console.info("====> SUB_OH_DestroyAvailableArea_2900 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_DestroyAvailableArea_2900 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_RegisterDisplayAddListener_3000
     * @tc.name    : SUB_OH_RegisterDisplayAddListener_3000
     * @tc.desc    : Test RegisterDisplayAddListener
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_RegisterDisplayAddListener_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_RegisterDisplayAddListener_3000 start====");
          let result: number = displaymanager.RegisterDisplayAddListener();
          console.info("====> SUB_OH_RegisterDisplayAddListener_3000 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_RegisterDisplayAddListener_3000 catch err: " + err);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  : SUB_OH_RegisterDisplayRemoveListener_3200
     * @tc.name    : SUB_OH_RegisterDisplayRemoveListener_3200
     * @tc.desc    : Test RegisterDisplayRemoveListener
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_RegisterDisplayRemoveListener_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====> SUB_OH_RegisterDisplayRemoveListener_3200 start====");
          let result: number = displaymanager.RegisterDisplayRemoveListener();
          console.info("====> SUB_OH_RegisterDisplayRemoveListener_3200 result====", result);
          expect(result).assertEqual(Success);
          done();
        } catch (err) {
          console.error("====> SUB_OH_RegisterDisplayRemoveListener_3200 catch err: " + err);
          expect().assertFail();
        }
      })
  })
}