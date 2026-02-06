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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , Level, TestType, Size} from '@ohos/hypium';
import testNapi from 'libentry.so';
import { display, window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

interface Capability{
  foldStatus:string;
  foldDisplayMode:string;
  rotation:string[];
  orientation:string[]
}
interface CapabilityData{
  capability:Capability[];
}
export default function DisplayNdkTest() {
  describe('ActsDisplayNdkTest', () => {
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let displayClass = display.getDefaultDisplaySync();
    let foldStatus:string= '';
    let foldDisplayMode:string= '';
    let rotation:string[];
    let orientation:string[];
    let code:number;
    let displayFoldStatus:number;
    beforeAll(() => {
      try{
        displayFoldStatus = display.getFoldStatus();
        console.log('jsUnittest beforeAll getFoldStatus =' + displayFoldStatus);
        let data:string = displayClass.getDisplayCapability();
        let capabilityData:CapabilityData = JSON.parse(data);
        console.log('jsUnittest beforeAll deviceMessage =' + JSON.stringify(capabilityData));
        for(const capability of capabilityData.capability){
          if(Number(capability.foldStatus) == displayFoldStatus){
            foldStatus = capability.foldStatus;
            foldDisplayMode = capability.foldDisplayMode;
            rotation = capability.rotation;
            orientation = capability.orientation;
            console.log('jsUnittest beforeAll foldStatus =' + capability.foldStatus);
            console.log('jsUnittest beforeAll foldDisplayMode =' + capability.foldDisplayMode);
            console.log('jsUnittest beforeAll rotation[0] =' + capability.rotation);
            console.log('jsUnittest beforeAll orientation[0] =' + capability.orientation);
          }
        }
      } catch (err) {
        console.log('jsUnittest beforeAll getDisplayCapability failed' + err.code+' ' +err.message);
        if(err.code == 801){
          code = 801;
        }else {
          console.log('jsUnittest getDisplayCapability failed');
        }
      }
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
    it('test_OH_NativeDisplayManager_GetDefaultDisplayId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function) => {
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
    it('test_OH_NativeDisplayManager_GetDefaultDisplayWidth', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function) => {
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
    it('test_OH_NativeDisplayManager_GetDefaultDisplayHeight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function) => {
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
     * @tc.level     : Level 2
     */
    it('test_OH_NativeDisplayManager_GetDefaultDisplayRotation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_GetDefaultDisplayRotation';
      try{
        let displayRotation  = testNapi.getRotation();
        console.log(caseName + ' :'+ displayRotation);
        let rotation = display.getDefaultDisplaySync().rotation;
        console.log(caseName + ': displayRotation:'+ displayRotation + ',rotation:'+rotation);
        expect(displayRotation).assertEqual(rotation);
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
     * @tc.level     : Level 2
     */
    it('test_OH_NativeDisplayManager_GetDefaultDisplayOrientation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_GetDefaultDisplayOrientation';
      try{
        let displayOrientation  = testNapi.getOrientation();
        console.log(caseName + ' :'+ displayOrientation);
        let display1 = display.getDefaultDisplaySync()
        console.log(caseName + 'jsOrientation :'+ display1.rotation);
        let rotation = display1.rotation;
        console.log(caseName + 'displayOrientation :'+ displayOrientation);
        if(code == 801){
            expect(displayOrientation).assertEqual(0);
             done();
          }else {
            expect(displayOrientation).assertEqual(Number(orientation[rotation]));
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
     * @tc.level     : Level 3
     */
    it('test_OH_NativeDisplayManager_GetDefaultDisplayVirtualPixelRatio', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
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
     * @tc.level     : Level 3
     */
    it('test_OH_NativeDisplayManager_GetDefaultDisplayRefreshRate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
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
     * @tc.level     : Level 3
     */
    it('test_OH_NativeDisplayManager_GetDefaultDisplayDensityDpi', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
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
     * @tc.level     : Level 3
     */
    it('test_OH_NativeDisplayManager_GetDefaultDisplayDensityPixels', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
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
     * @tc.level     : Level 3
     */
    it('test_OH_NativeDisplayManager_GetDefaultDisplayScaledDensity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
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
     * @tc.level     : Level 3
     */
    it('test_OH_NativeDisplayManager_GetDefaultDisplayDensityXdpi', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
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
     * @tc.level     : Level 3
     */
    it('test_OH_NativeDisplayManager_GetDefaultDisplayDensityYdpi', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
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
     * @tc.level     : Level 3
     */
    it('test_OH_NativeDisplayManager_CreateDefaultDisplayCutoutInfo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
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
     * @tc.level     : Level 3
     */
    it('test_OH_NativeDisplayManager_Create_DestroyDefaultDisplayCutoutInfo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
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
     * @tc.level     : Level 3
     */
    it('test_OH_NativeDisplayManager_IsFoldable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
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
     * @tc.level     : Level 3
     */
    it('test_OH_NativeDisplayManager_GetFoldDisplayMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_GetFoldDisplayMode';
      try{
        let displayIsFoldable  = testNapi.checkIsFoldDevice();
        let displayMode  = testNapi.getDisplayMode();
        console.log(caseName + ' :'+ displayMode );
        if(displayIsFoldable == true){
          expect(displayMode).assertEqual(Number(foldDisplayMode))
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
     * @tc.number    : SUB_BASIC_DMS_NDK_1700
     * @tc.name      : test_OH_NativeDisplayManager_RegisterFoldDisplayModeChangeListener
     * @tc.desc      : test_OH_NativeDisplayManager_RegisterFoldDisplayModeChangeListener
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('test_OH_NativeDisplayManager_RegisterFoldDisplayModeChangeListener', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
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
     * @tc.level     : Level 3
     */
    it('test_OH_NativeDisplayManager_UnregisterFoldDisplayModeChangeListener', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
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
     * @tc.level     : Level 3
     */
    it('test_OH_NativeDisplayManager_UnRegisterDisplayChangeListener', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
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
     * @tc.level     : Level 3
     */
    it('test_OH_NativeDisplayManager_registerDisplayChangeListener', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
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

    /**
     * @tc.number    : OH_NativeDisplayManager_CreateAvailableArea
     * @tc.name      : test_OH_NativeDisplayManager_CreateAvailableArea
     * @tc.desc      : test_OH_NativeDisplayManager_CreateAvailableArea
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_CreateAvailableArea', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_CreateAvailableArea';
      try{
        let result  = testNapi.createAvailableArea();
        console.log(`${caseName} createAvailableArea result: ${JSON.stringify(result)}`);
        expect(result.errcode).assertEqual(0);
        let availableArea = await displayClass.getAvailableArea();
        console.log(`${caseName} getAvailableArea availableArea: ${JSON.stringify(availableArea)}`);
        expect(Math.abs(availableArea.left - result.left)).assertLessOrEqual(0);
        expect(Math.abs(availableArea.top - result.top)).assertLessOrEqual(0);
        expect(Math.abs(availableArea.width - result.width)).assertLessOrEqual(0);
        expect(Math.abs(availableArea.height - result.height)).assertLessOrEqual(0);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        if (err.code === 801) {
          expect(true).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.number    : OH_NativeDisplayManager_CreateAvailableAreaErrCode_140004
     * @tc.name      : test_OH_NativeDisplayManager_CreateAvailableArea_ErrCode140004
     * @tc.desc      : test_OH_NativeDisplayManager_CreateAvailableArea_ErrCode140004
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('test_OH_NativeDisplayManager_CreateAvailableArea_ErrCode140004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_CreateAvailableArea_ErrCode140004';
      try{
        let errcode  = testNapi.createAvailableArea_ErrCode140004();
        console.log(`${caseName} result: ${JSON.stringify(errcode)}`);
        expect(errcode).assertEqual(1400004);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : OH_NativeDisplayManager_DestroyAvailableArea
     * @tc.name      : test_OH_NativeDisplayManager_DestroyAvailableArea
     * @tc.desc      : test_OH_NativeDisplayManager_DestroyAvailableArea
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_DestroyAvailableArea', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_DestroyAvailableArea';
      try{
        let errcode  = testNapi.destroyAvailableArea();
        console.log(`${caseName} result: ${JSON.stringify(errcode)}`);
        expect(errcode).assertEqual(0);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : test_OH_NativeDisplayManager_GetDisplaySourceMode_1
     * @tc.name      : test_OH_NativeDisplayManager_GetDisplaySourceMode_1
     * @tc.desc      : test_OH_NativeDisplayManager_GetDisplaySourceMode_1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_GetDisplaySourceMode_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_GetDisplaySourceMode_1';
      try{
        let result  = testNapi.getDisplaySourceMode_1();
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        expect(result).assertEqual(1);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : test_OH_NativeDisplayManager_GetDisplaySourceMode_2
     * @tc.name      : test_OH_NativeDisplayManager_GetDisplaySourceMode_2
     * @tc.desc      : test_OH_NativeDisplayManager_GetDisplaySourceMode_2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_GetDisplaySourceMode_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_GetDisplaySourceMode_2';
      try{
        let option : display.VirtualScreenConfig = {
          name: 'screen01',
          width: 1080,
          height: 2340,
          density: 2,
          surfaceId: ''
        };
        display.createVirtualScreen(option).then((data: number) => {
          let result  = testNapi.getDisplaySourceMode_2(data);
          console.log(`${caseName} result: ${JSON.stringify(result)}`);
          expect(result).assertEqual(0);
          done();
          console.info(caseName + 'Succeeded in creating the virtual screen. Data: ' + JSON.stringify(data));
        }).catch((err: BusinessError) => {
          console.error(caseName + 'Failed to create the virtual screen. Code: ' + JSON.stringify(err));
          expect(false).assertTrue();
          done();
        });
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        if(err.code == 801){
          done()
        }else{
          expect(false).assertTrue();
          done();
        }
        
      }
    })

    /**
     * @tc.number    : test_OH_NativeDisplayManager_GetDisplaySourceMode_4
     * @tc.name      : test_OH_NativeDisplayManager_GetDisplaySourceMode_4
     * @tc.desc      : test_OH_NativeDisplayManager_GetDisplaySourceMode_4
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_GetDisplaySourceMode_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_GetDisplaySourceMode_4';
      try{
        let option : display.VirtualScreenConfig = {
          name: 'screen01',
          width: 1080,
          height: 2340,
          density: 2,
          surfaceId: ''
        };
        display.createVirtualScreen(option).then(async (data: number) => {
          console.info(caseName + 'Succeeded in creating the virtual screen. Data: ' + JSON.stringify(data));
          display.makeUnique(data).then(async () =>{
            await sleep(200);
            let result  = testNapi.getDisplaySourceMode_4(data);
            console.log(`${caseName} result: ${JSON.stringify(result)}`);
            expect(result).assertEqual(4);
            done();
          }).catch((err: BusinessError) => {
            console.error(caseName + 'Failed to makeUnique. Code: ' + JSON.stringify(err));
            if (err.code === 801) {
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });

        }).catch((err: BusinessError) => {
          console.error(caseName + 'Failed to create the virtual screen. Code: ' + JSON.stringify(err));
          expect(false).assertTrue();
          done();
        });
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : test_OH_NativeDisplayManager_GetDisplaySourceMode_ErrCode1400004
     * @tc.name      : test_OH_NativeDisplayManager_GetDisplaySourceMode_ErrCode1400004
     * @tc.desc      : test_OH_NativeDisplayManager_GetDisplaySourceMode_ErrCode1400004
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('test_OH_NativeDisplayManager_GetDisplaySourceMode_ErrCode1400004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_GetDisplaySourceMode_ErrCode1400004';
      try{
        let result  = testNapi.getDisplaySourceMode_ErrCode140004();
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        expect(result).assertEqual(1400004);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : test_OH_NativeDisplayManager_GetDisplayPosition
     * @tc.name      : test_OH_NativeDisplayManager_GetDisplayPosition
     * @tc.desc      : test_OH_NativeDisplayManager_GetDisplayPosition
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_GetDisplayPosition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_GetDisplayPosition';
      try{
        let result  = testNapi.getDisplayPosition();
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : OH_NativeDisplayManager_GetDisplayPosition
     * @tc.name      : test_OH_NativeDisplayManager_GetDisplayPosition_ErrCode140004
     * @tc.desc      : test_OH_NativeDisplayManager_GetDisplayPosition_ErrCode140004
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('test_OH_NativeDisplayManager_GetDisplayPosition_ErrCode140004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_GetDisplayPosition_ErrCode140004';
      try{
        let result  = testNapi.getDisplayPosition_ErrCode140004();
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        expect(result).assertEqual(1400004);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : OH_NativeDisplayManager_RegisterAvailableAreaChangeListener
     * @tc.name      : test_OH_NativeDisplayManager_RegisterAvailableAreaChangeListener
     * @tc.desc      : OH_NativeDisplayManager_RegisterAvailableAreaChangeListener中注册可用区域变化监听
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_RegisterAvailableAreaChangeListener', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_RegisterAvailableAreaChangeListener';
      try{
        let result  = testNapi.registerAvailableAreaChangeListener();
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : OH_NativeDisplayManager_UnregisterAvailableAreaChangeListener
     * @tc.name      : test_OH_NativeDisplayManager_UnregisterAvailableAreaChangeListener
     * @tc.desc      : OH_NativeDisplayManager_UnregisterAvailableAreaChangeListener中取消可用区域变化监听
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_UnregisterAvailableAreaChangeListener', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_UnregisterAvailableAreaChangeListener';
      try{
        let result  = testNapi.unregisterAvailableAreaChangeListener();
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : OH_NativeDisplayManager_UnregisterAvailableAreaChangeListener_ErrCode140004
     * @tc.name      : test_OH_NativeDisplayManager_UnregisterAvailableAreaChangeListener_ErrCode140004
     * @tc.desc      : OH_NativeDisplayManager_UnregisterAvailableAreaChangeListener中直接取消可用区域变化监听
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('test_OH_NativeDisplayManager_UnregisterAvailableAreaChangeListener_ErrCode140004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_UnregisterAvailableAreaChangeListener_ErrCode140004';
      try{
        let result  = testNapi.unregisterAvailableAreaChangeListener_ErrCode140004();
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        expect(result).assertEqual(1400004);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.number    : OH_NativeDisplayManager_RegisterDisplayAddListener
     * @tc.name      : test_OH_NativeDisplayManager_RegisterDisplayAddListener
     * @tc.desc      : OH_NativeDisplayManager_RegisterDisplayAddListener中注册屏幕增加监听
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_RegisterDisplayAddListener', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_RegisterDisplayAddListener';
      try{
        let result  = testNapi.registerDisplayAddListener();
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : OH_NativeDisplayManager_UnregisterDisplayAddListener
     * @tc.name      : test_OH_NativeDisplayManager_UnregisterDisplayAddListener
     * @tc.desc      : OH_NativeDisplayManager_UnregisterDisplayAddListener中取消屏幕增加监听
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_UnregisterDisplayAddListener', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_UnregisterDisplayAddListener';
      try{
        let result  = testNapi.unregisterDisplayAddListener();
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : OH_NativeDisplayManager_UnregisterDisplayAddListener_ErrCode140004
     * @tc.name      : test_OH_NativeDisplayManager_UnregisterDisplayAddListener_ErrCode140004
     * @tc.desc      : OH_NativeDisplayManager_UnregisterDisplayAddListener中直接取消屏幕增加监听
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('test_OH_NativeDisplayManager_UnregisterDisplayAddListener_ErrCode140004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_UnregisterDisplayAddListener_ErrCode140004';
      try{
        let result  = testNapi.unregisterDisplayAddListener_ErrCode140004();
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        expect(result).assertEqual(1400004);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : OH_NativeDisplayManager_RegisterDisplayRemoveListener
     * @tc.name      : test_OH_NativeDisplayManager_RegisterDisplayRemoveListener
     * @tc.desc      : OH_NativeDisplayManager_RegisterDisplayRemoveListener中注册屏幕移除监听
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_RegisterDisplayRemoveListener', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_RegisterDisplayRemoveListener';
      try{
        let result  = testNapi.registerDisplayRemoveListener();
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : OH_NativeDisplayManager_UnregisterDisplayRemoveListener
     * @tc.name      : test_OH_NativeDisplayManager_UnregisterDisplayRemoveListener
     * @tc.desc      : OH_NativeDisplayManager_UnregisterDisplayRemoveListener中取消屏幕移除监听
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_NativeDisplayManager_UnregisterDisplayRemoveListener', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_UnregisterDisplayRemoveListener';
      try{
        let result  = testNapi.unregisterDisplayRemoveListener();
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : OH_NativeDisplayManager_RegisterDisplayRemoveListener_ErrCode140004
     * @tc.name      : test_OH_NativeDisplayManager_RegisterDisplayRemoveListener_ErrCode140004
     * @tc.desc      : OH_NativeDisplayManager_RegisterDisplayRemoveListener中注册屏幕移除监听
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('test_OH_NativeDisplayManager_RegisterDisplayRemoveListener_ErrCode140004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_RegisterDisplayRemoveListener_ErrCode140004';
      try{
        let result  = testNapi.registerDisplayRemoveListener_ErrCode140004();
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        expect(result).assertEqual(1400004);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })


  })
}