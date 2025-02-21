/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import testNapi from 'libentry.so';
import { display } from '@kit.ArkUI';

export default function DisplayNdkTest() {
  describe('ActsDisplayNdkTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
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
     * @tc.number    : SUB_BASIC_DMS_NDK_0100
     * @tc.name      : test_OH_NativeDisplayManager_GetDefaultDisplayId
     * @tc.desc      : test_OH_NativeDisplayManager_GetDefaultDisplayId
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_GetDefaultDisplayId', 0, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_GetDefaultDisplayId';
      try{
        let displayId  = testNapi.getId();
        console.log(caseName + ':'+ displayId);
        expect(displayId).assertLargerOrEqual(0);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_DMS_NDK_0200
     * @tc.name      : test_OH_NativeDisplayManager_GetDefaultDisplayWidth
     * @tc.desc      : test_OH_NativeDisplayManager_GetDefaultDisplayWidth
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_GetDefaultDisplayWidth', 0, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_GetDefaultDisplayWidth';
      try{
        let displayWidth  = testNapi.getWidth();
        console.log(caseName + ' :'+ displayWidth);
        expect(displayWidth).assertLarger(0);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_DMS_NDK_0300
     * @tc.name      : test_OH_NativeDisplayManager_GetDefaultDisplayHeight
     * @tc.desc      : test_OH_NativeDisplayManager_GetDefaultDisplayHeight
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_GetDefaultDisplayHeight', 0, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_GetDefaultDisplayHeight';
      try{
        let displayHeight  = testNapi.getHeight();
        console.log(caseName + ' :'+ displayHeight);
        expect(displayHeight).assertLarger(0);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_DMS_NDK_0400
     * @tc.name      : test_OH_NativeDisplayManager_GetDefaultDisplayRotation
     * @tc.desc      : test_OH_NativeDisplayManager_GetDefaultDisplayRotation
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_GetDefaultDisplayRotation', 0, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_GetDefaultDisplayRotation';
      try{
        let displayRotation  = testNapi.getRotation();
        console.log(caseName + ' :'+ displayRotation);
        expect(displayRotation).assertEqual(0);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_DMS_NDK_0500
     * @tc.name      : test_OH_NativeDisplayManager_GetDefaultDisplayOrientation
     * @tc.desc      : test_OH_NativeDisplayManager_GetDefaultDisplayOrientation
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_GetDefaultDisplayOrientation', 0, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_GetDefaultDisplayOrientation';
      try{
        let displayOrientation  = testNapi.getOrientation();
        console.log(caseName + ' :'+ displayOrientation);
        let display1 = display.getDefaultDisplaySync()
        console.log(caseName + 'jsOrientation :'+ display1.orientation);
        if (displayOrientation == 0) {
          done();
        } else if (displayOrientation == 1){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_DMS_NDK_0600
     * @tc.name      : test_OH_NativeDisplayManager_GetDefaultDisplayVirtualPixelRatio
     * @tc.desc      : test_OH_NativeDisplayManager_GetDefaultDisplayVirtualPixelRatio
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_GetDefaultDisplayVirtualPixelRatio', 0, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_GetDefaultDisplayVirtualPixelRatio';
      try{
        let displayVirtualPixelRatio  = testNapi.getVirtualPixelRatio();
        console.log(caseName + ' :'+ displayVirtualPixelRatio);
        expect(displayVirtualPixelRatio).assertLarger(0);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_DMS_NDK_0700
     * @tc.name      : test_OH_NativeDisplayManager_GetDefaultDisplayRefreshRate
     * @tc.desc      : test_OH_NativeDisplayManager_GetDefaultDisplayRefreshRate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_GetDefaultDisplayRefreshRate', 0, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_GetDefaultDisplayRefreshRate';
      try{
        let displayRefreshRate  = testNapi.getRefreshRate();
        console.log(caseName + ' :'+ displayRefreshRate);
        expect(displayRefreshRate).assertLargerOrEqual(0);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_DMS_NDK_0800
     * @tc.name      : test_OH_NativeDisplayManager_GetDefaultDisplayDensityDpi
     * @tc.desc      : test_OH_NativeDisplayManager_GetDefaultDisplayDensityDpi
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_GetDefaultDisplayDensityDpi', 0, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_GetDefaultDisplayDensityDpi';
      try{
        let displayDensityDpi  = testNapi.getDensityDpi();
        console.log(caseName + ' :'+ displayDensityDpi );
        expect(displayDensityDpi).assertLarger(0);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_DMS_NDK_0900
     * @tc.name      : test_OH_NativeDisplayManager_GetDefaultDisplayDensityPixels
     * @tc.desc      : test_OH_NativeDisplayManager_GetDefaultDisplayDensityPixels
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_GetDefaultDisplayDensityPixels', 0, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_GetDefaultDisplayDensityPixels';
      try{
        let displayDensityPixels  = testNapi.getDensityPixels();
        console.log(caseName + ' :'+ displayDensityPixels );
        expect(displayDensityPixels).assertLarger(0);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_DMS_NDK_1000
     * @tc.name      : test_OH_NativeDisplayManager_GetDefaultDisplayScaledDensity
     * @tc.desc      : test_OH_NativeDisplayManager_GetDefaultDisplayScaledDensity
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_GetDefaultDisplayScaledDensity', 0, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_GetDefaultDisplayScaledDensity';
      try{
        let displayScaledDensity  = testNapi.getScaledDensity();
        console.log(caseName + ' :'+ displayScaledDensity );
        expect(displayScaledDensity).assertLarger(0);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_DMS_NDK_1100
     * @tc.name      : test_OH_NativeDisplayManager_GetDefaultDisplayDensityXdpi
     * @tc.desc      : test_OH_NativeDisplayManager_GetDefaultDisplayDensityXdpi
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_GetDefaultDisplayDensityXdpi', 0, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_GetDefaultDisplayDensityXdpi';
      try{
        let displayDensityXdpi  = testNapi.getDensityXdpi();
        console.log(caseName + ' :'+ displayDensityXdpi );
        expect(displayDensityXdpi).assertLarger(0);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_DMS_NDK_1200
     * @tc.name      : test_OH_NativeDisplayManager_GetDefaultDisplayDensityYdpi
     * @tc.desc      : test_OH_NativeDisplayManager_GetDefaultDisplayDensityYdpi
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_GetDefaultDisplayDensityYdpi', 0, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_GetDefaultDisplayDensityYdpi';
      try{
        let displayDensityYdpi  = testNapi.getDensityYdpi();
        console.log(caseName + ' :'+ displayDensityYdpi );
        expect(displayDensityYdpi).assertLarger(0);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_DMS_NDK_1300
     * @tc.name      : test_OH_NativeDisplayManager_CreateDefaultDisplayCutoutInfo
     * @tc.desc      : test_OH_NativeDisplayManager_CreateDefaultDisplayCutoutInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_CreateDefaultDisplayCutoutInfo', 0, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_CreateDefaultDisplayCutoutInfo';
      try{
        let displayCutoutInfo  = testNapi.getCutoutInfo();
        console.log(caseName + ' :'+ displayCutoutInfo );
        expect(displayCutoutInfo).assertLargerOrEqual(0);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_DMS_NDK_1400
     * @tc.name      : test_OH_NativeDisplayManager_CreateDefaultDisplayCutoutInfo
     * @tc.desc      : test_OH_NativeDisplayManager_CreateDefaultDisplayCutoutInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_Create_DestroyDefaultDisplayCutoutInfo', 0, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_Create_DestroyDefaultDisplayCutoutInfo';
      try{
        let displayCutoutInfo  = testNapi.getCutoutInfo();
        console.log(caseName + ' :'+ displayCutoutInfo );
        expect(displayCutoutInfo).assertLargerOrEqual(0);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_DMS_NDK_1500
     * @tc.name      : test_OH_NativeDisplayManager_IsFoldable
     * @tc.desc      : test_OH_NativeDisplayManager_IsFoldable
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_IsFoldable', 0, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_IsFoldable';
      try{
        let displayIsFoldable  = testNapi.checkIsFoldDevice();
        console.log(caseName + ' :'+ displayIsFoldable );
        if(displayIsFoldable == true){
          done();
        }else if(displayIsFoldable == false){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
        
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_DMS_NDK_1600
     * @tc.name      : test_OH_NativeDisplayManager_GetFoldDisplayMode
     * @tc.desc      : test_OH_NativeDisplayManager_GetFoldDisplayMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_GetFoldDisplayMode', 0, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_GetFoldDisplayMode';
      try{
        let displayIsFoldable  = testNapi.checkIsFoldDevice();
        let displayMode  = testNapi.getDisplayMode();
        console.log(caseName + ' :'+ displayMode );
        if(displayIsFoldable == true){
          if(displayMode == 1 || displayMode ==2){
            done();
          }
         
        }else{
          expect(displayMode).assertEqual(801);
          done();
        }
        
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_DMS_NDK_1700
     * @tc.name      : test_OH_NativeDisplayManager_RegisterFoldDisplayModeChangeListener
     * @tc.desc      : test_OH_NativeDisplayManager_RegisterFoldDisplayModeChangeListener
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_RegisterFoldDisplayModeChangeListener', 0, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_RegisterFoldDisplayModeChangeListener';
      try{
        let displayIsFoldable  = testNapi.checkIsFoldDevice();
        let displayMode1  = testNapi.registerFoldDisplayModeChange((displayMode: number) => {
          console.log(caseName + ' displayMode:'+ displayMode );
          expect(false).assertTrue();
          done();
        });
        console.log(caseName + ' displayMode1:'+ displayMode1 );
        if(displayIsFoldable == true){
          if(displayMode1 == 1 || displayMode1 == 2){
            done();
          }
          
        }else{
          expect(displayMode1).assertEqual(801);
          done();
        }
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_DMS_NDK_1800
     * @tc.name      : test_OH_NativeDisplayManager_UnregisterFoldDisplayModeChangeListener
     * @tc.desc      : test_OH_NativeDisplayManager_UnregisterFoldDisplayModeChangeListener
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_UnregisterFoldDisplayModeChangeListener', 0, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_UnregisterFoldDisplayModeChangeListener';
      try{
        let displayIsFoldable  = testNapi.checkIsFoldDevice();
        let displayMode  = testNapi.unregisterFoldDisplayModeChange(0);
        console.log(caseName + ' displayMode1:'+ displayMode );
        if(displayIsFoldable == true){
          expect(displayMode).assertEqual(401);
          done();
        }else{
          expect(displayMode).assertEqual(801);
          done();
        }
        
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_DMS_NDK_1900
     * @tc.name      : test_OH_NativeDisplayManager_UnRegisterDisplayChangeListener
     * @tc.desc      : test_OH_NativeDisplayManager_UnRegisterDisplayChangeListener
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_UnRegisterDisplayChangeListener', 0, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_UnRegisterDisplayChangeListener';
      try{
        let result  = testNapi.unregisterDisplayChange(0);
        console.log(caseName + ' result:'+ result );
        expect(result).assertEqual(401);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_DMS_NDK_2000
     * @tc.name      : test_OH_NativeDisplayManager_registerDisplayChangeListener
     * @tc.desc      : test_OH_NativeDisplayManager_registerDisplayChangeListener
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_registerDisplayChangeListener', 0, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_registerDisplayChangeListener';
      try{
        let displayId1  = testNapi.registerDisplayChange((displayId: number) => {
          console.log(caseName + ' displayId:'+ displayId );
        });
        console.log(caseName + ' displayId1:'+ displayId1 );
        expect(displayId1).assertEqual(1);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })



  })
}