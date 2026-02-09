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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import testNapi from 'libentry.so'
import { display, screenshot, window } from '@kit.ArkUI';
import { abilityAccessCtrl, PermissionRequestResult, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import common from '@ohos.app.ability.common';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { image } from '@kit.ImageKit';
import settings from '@ohos.settings';
interface Capability{
  foldStatus:string;
  foldDisplayMode:string;
  rotation:string[];
  orientation:string[]
}
interface CapabilityData{
  capability:Capability[];
}
function sleep(ms: number): Promise<string> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms);
  });
}
function getPermision(){
  let atManager:abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let context : common.UIAbilityContext = AppStorage.get('context') as common.UIAbilityContext;
  let permissions: Array<Permissions> =
    ["ohos.permission.CUSTOM_SCREEN_CAPTURE"];
  atManager.requestPermissionsFromUser(context,permissions,(err:BusinessError,data:PermissionRequestResult)=>{
    if(err){
      console.error('capture requestPermissionsFromUser failed: ' + JSON.stringify(err));
    }else {
      console.info('capture requestPermissionsFromUser success: ' + JSON.stringify(data));
    }
  })
}

async function ClickButtonDriver(){
  console.info(`come in permissionClick`);
  let driver: Driver = Driver.create();
  console.info(`come in Driver create`);
  let buttonOne = await driver.findComponent(ON.text('允许'));
  console.info(`buttonOne is ${JSON.stringify(buttonOne)}`);
  await buttonOne.click();
}
export default function ActsDisplayNdkApi14Test() {

  describe('ActsDisplayNdkApi14Test', () => {
    let context : common.UIAbilityContext;
    let isAutoWindow:string = '';
    let windowStage: window.WindowStage;
    let windowClass: window.Window;
    let deviceMessage:string = '';
    let displayClass = display.getDefaultDisplaySync();
    let foldStatus:string= '';
    let foldDisplayMode:string= '';
    let rotation:string[];
    let orientation:string[];
    let code:number = 0;
    let displayFoldStatus:number;
    beforeAll(async () => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
      windowClass = windowStage.getMainWindowSync();
      isAutoWindow = settings.getValueSync(context,'window_pcmode_switch_status','');
      //isAutoWindow == '' 非PAD设备
      //isAutoWindow == 'true' PAD设备自由多窗模式
      //isAutoWindow == 'false' PAD设备非自由多窗模式
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
      displayFoldStatus = display.getFoldStatus();
        console.log('jsUnittest beforeAll getFoldStatus =' + displayFoldStatus);
      try{
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
        console.log('jsUnittest beforeAll getDisplayCapability failed ' + err.code);
        console.log('jsUnittest beforeAll code =' + code);
        if(err.code == 801){
          code = 801;
          console.log('jsUnittest beforeAll code =' + code);
        }else {
          console.log('jsUnittest getDisplayCapability failed');
        }
      }
      try {
          let driver = Driver.create();
          let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
          console.log('findComponent allowed: ' + JSON.stringify(allowed));
          if(allowed){
            await allowed.click();
          }
        } catch (err) {
          console.error('findComponent allowed failed: ' + JSON.stringify(err));
        }
      await getPermision();
      await sleep(300);
      await ClickButtonDriver();
      await sleep(200);
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
     * @tc.name   test_OH_NativeDisplayManager_CreatePrimaryDisplay
     * @tc.number SUB_BASIC_DMS_NDK_2100
     * @tc.desc   test_OH_NativeDisplayManager_CreatePrimaryDisplay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_OH_NativeDisplayManager_CreatePrimaryDisplay', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_CreatePrimaryDisplay';
      try{
        let displayInfo = testNapi.getPrimaryDisplay();
        console.log(caseName + ' getPrimaryDisplay displayInfo:'+ JSON.stringify(displayInfo)+'type:'+ typeof (displayInfo));
        if(Number(displayInfo) == 801){
          done();
        }else{
          if(code == 801){
            expect(displayInfo.rotation).assertEqual(0);
            expect(displayInfo.orientation).assertEqual(0);
             done();
          }else {
            // expect(displayInfo.rotation).assertEqual(Number(rotation[0]));
            let rotation = displayInfo.rotation;
            expect(displayInfo.orientation).assertEqual(Number(orientation[rotation]));
            done();
          }
          expect(displayInfo.id).assertEqual(0);
          expect(displayInfo.alive).assertEqual(1);
          expect(displayInfo.width).assertLarger(0);
          expect(displayInfo.height).assertLarger(0);
          expect(displayInfo.refreshRate).assertLarger(0);
          expect(displayInfo.densityDPI).assertLarger(0);
          expect(displayInfo.densityPixels).assertLarger(0);
          expect(displayInfo.scaledDensity).assertLarger(0);
          expect(displayInfo.xDPI).assertLarger(0);
          expect(displayInfo.yDPI).assertLarger(0);
          expect(displayInfo.state).assertEqual(2);
          done();
        }
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' ' + err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   test_OH_NativeDisplayManager_CreateAllDisplays
     * @tc.number SUB_BASIC_DMS_NDK_2200
     * @tc.desc   test_OH_NativeDisplayManager_CreateAllDisplays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_OH_NativeDisplayManager_CreateAllDisplays', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_CreateAllDisplays';
      try{
        let displayInfos: Array<display.Display> = testNapi.getAllDisplay();
        for(let i = 0;i <displayInfos.length;i++){
          console.log(caseName + ' getAllDisplay displayInfos:'+ JSON.stringify(displayInfos[i]));

        }
        console.log(caseName + ' getAllDisplay displayInfos length:'+ JSON.stringify(displayInfos.length));
        expect(displayInfos.length).assertLarger(0);
        if(displayInfos[0] != null){
          expect(displayInfos[0].alive).assertEqual(1);
          expect(displayInfos[0].width).assertLarger(0);
          expect(displayInfos[0].height).assertLarger(0);
          expect(displayInfos[0].refreshRate).assertLarger(0);
          expect(displayInfos[0].densityDPI).assertLarger(0);
          expect(displayInfos[0].xDPI).assertLarger(0);
          expect(displayInfos[0].yDPI).assertLarger(0);
          expect(displayInfos[0].state).assertEqual(2);
          if(code == 801){
            expect(displayInfos[0].rotation).assertEqual(0);
            expect(displayInfos[0].orientation).assertEqual(0);
            done();
          }else {
            // expect(displayInfos[0].rotation).assertEqual(Number(rotation[0]));
            let rotation = displayInfos[0].rotation;
            expect(displayInfos[0].orientation).assertEqual(Number(orientation[rotation]));
            done();
          }
        }
        else if (displayInfos[1] != null){
          expect(displayInfos[1].alive).assertEqual(1);
          expect(displayInfos[1].width).assertLarger(0);
          expect(displayInfos[1].height).assertLarger(0);
          expect(displayInfos[1].refreshRate).assertLarger(0);
          expect(displayInfos[1].densityDPI).assertLarger(0);
          expect(displayInfos[1].densityPixels).assertLarger(0);
          expect(displayInfos[1].scaledDensity).assertLarger(0);
          expect(displayInfos[1].xDPI).assertLarger(0);
          expect(displayInfos[1].yDPI).assertLarger(0);
          expect(displayInfos[1].state).assertEqual(2);
          if(code == 801){
            expect(displayInfos[1].rotation).assertEqual(0);
            expect(displayInfos[1].orientation).assertEqual(0);
            done();
          }else {
            // expect(displayInfos[1].rotation).assertEqual(Number(rotation[0]));
            let rotation2 = displayInfos[1].rotation;
            expect(displayInfos[1].orientation).assertEqual(Number(orientation[rotation2]));
            done();
          }
        }
      } catch (err) {
        console.log(caseName + ': fail cause:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   test_OH_NativeDisplayManager_CreateDisplayById_0
     * @tc.number SUB_BASIC_DMS_NDK_2300
     * @tc.desc   test_OH_NativeDisplayManager_CreateDisplayById_0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_OH_NativeDisplayManager_CreateDisplayById_0', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_CreateDisplayById_0';
      try{
        let displayInfo = testNapi.getDisplayById(0);
        console.log(caseName + ' getAllDisplay getDisplayById:'+ JSON.stringify(displayInfo));
        expect(displayInfo.id).assertEqual(0);
        expect(displayInfo.alive).assertEqual(1);
        expect(displayInfo.width).assertLarger(0);
        expect(displayInfo.height).assertLarger(0);
        expect(displayInfo.refreshRate).assertLarger(0);
        expect(displayInfo.densityDPI).assertLarger(0);
        expect(displayInfo.densityPixels).assertLarger(0);
        expect(displayInfo.scaledDensity).assertLarger(0);
        expect(displayInfo.xDPI).assertLarger(0);
        expect(displayInfo.yDPI).assertLarger(0);
        expect(displayInfo.state).assertEqual(2);
        if(code == 801){
            expect(displayInfo.rotation).assertEqual(0);
            expect(displayInfo.orientation).assertEqual(0);
             done();
          }else {
            // expect(displayInfo.rotation).assertEqual(Number(rotation[0]));
            let rotation = displayInfo.rotation;
            expect(displayInfo.orientation).assertEqual(Number(orientation[rotation]));
             done();
          }
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   test_OH_NativeDisplayManager_CreateDisplayById_123
     * @tc.number SUB_BASIC_DMS_NDK_2400
     * @tc.desc   test_OH_NativeDisplayManager_CreateDisplayById_123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_OH_NativeDisplayManager_CreateDisplayById_123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_CreateDisplayById_123';
      try{
        let displayInfo = testNapi.getDisplayById(123);
        console.log(caseName + ' getAllDisplay getDisplayById:'+ JSON.stringify(displayInfo));
        expect(displayInfo).assertEqual(1400003);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   test_OH_NativeDisplayManager_DestroyDisplay_without_create
     * @tc.number SUB_BASIC_DMS_NDK_2500
     * @tc.desc   test_OH_NativeDisplayManager_DestroyDisplay_without_create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_OH_NativeDisplayManager_DestroyDisplay_without_create', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
      let caseName = 'test_OH_NativeDisplayManager_DestroyDisplay_without_create';
      try{
        let result = testNapi.destroyDisplayWithoutCreate();
        console.log(caseName + ' destroy display without create result:'+ result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_DISPLAY_STATE_UNKNOWN
     * @tc.number SUB_BASIC_DMS_NDK_2600
     * @tc.desc   test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_DISPLAY_STATE_UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_DISPLAY_STATE_UNKNOWN', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
      let caseName = 'test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_DISPLAY_STATE_UNKNOWN';
      try{
        let result = testNapi.getDisplayState_UNKNOWN();
        console.log(caseName + ' getDisplayState_UNKNOWN result:'+ result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_DISPLAY_STATE_OFF
     * @tc.number SUB_BASIC_DMS_NDK_2700
     * @tc.desc   test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_DISPLAY_STATE_OFF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_DISPLAY_STATE_OFF', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
      let caseName = 'test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_DISPLAY_STATE_OFF';
      try{
        let result = testNapi.getDisplayState_OFF();
        console.log(caseName + ' getDisplayState_OFF result:'+ result);
        expect(result).assertEqual(1);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_DISPLAY_STATE_ON
     * @tc.number SUB_BASIC_DMS_NDK_2800
     * @tc.desc   test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_DISPLAY_STATE_ON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_DISPLAY_STATE_ON', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
      let caseName = 'test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_DISPLAY_STATE_ON';
      try{
        let result = testNapi.getDisplayState_ON();
        console.log(caseName + ' getDisplayState_ON result:'+ result);
        expect(result).assertEqual(2);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_DISPLAY_STATE_DOZE
     * @tc.number SUB_BASIC_DMS_NDK_2900
     * @tc.desc   test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_DISPLAY_STATE_DOZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_DISPLAY_STATE_DOZE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
      let caseName = 'test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_DISPLAY_STATE_DOZE';
      try{
        let result = testNapi.getDisplayState_DOZE();
        console.log(caseName + ' getDisplayState_DOZE result:'+ result);
        expect(result).assertEqual(3);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_DISPLAY_STATE_DOZE_SUSPEND
     * @tc.number SUB_BASIC_DMS_NDK_3000
     * @tc.desc   test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_DISPLAY_STATE_DOZE_SUSPEND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_DISPLAY_STATE_DOZE_SUSPEND', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
      let caseName = 'test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_DISPLAY_STATE_DOZE_SUSPEND';
      try{
        let result = testNapi.getDisplayState_DOZE_SUSPEND();
        console.log(caseName + ' getDisplayState_DOZE_SUSPEND result:'+ result);
        expect(result).assertEqual(4);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_DISPLAY_VR
     * @tc.number SUB_BASIC_DMS_NDK_3100
     * @tc.desc   test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_DISPLAY_VR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_DISPLAY_VR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
      let caseName = 'test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_DISPLAY_VR';
      try{
        let result = testNapi.getDisplayState_VR();
        console.log(caseName + ' getDisplayState_VR result:'+ result);
        expect(result).assertEqual(5);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_ON_SUSPEND
     * @tc.number SUB_BASIC_DMS_NDK_3200
     * @tc.desc   test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_ON_SUSPEND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_ON_SUSPEND', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
      let caseName = 'test_NativeDisplayManager_DisplayState_DISPLAY_MANAGER_ON_SUSPEND';
      try{
        let result = testNapi.getDisplayState_ON_SUSPEND();
        console.log(caseName + ' getDisplayState_ON_SUSPEND result:'+ result);
        expect(result).assertEqual(6);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   test_NativeDisplayManager_CaptureScreenPixeImap
     * @tc.number SUB_BASIC_DMS_NDK_3300
     * @tc.desc   test_NativeDisplayManager_CaptureScreenPixeImap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_NativeDisplayManager_CaptureScreenPixeImap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
      let caseName = 'test_NativeDisplayManager_CaptureScreenPixeImap';
      try{
        let PixelMap = testNapi.getDisplayCapture(0);
        console.log(caseName + ' getDisplayCapture result:'+ JSON.stringify(PixelMap));
        if(Number(PixelMap) == 801){
          done();
        }else{
          PixelMap.getImageInfo().then((imageInfo:image.ImageInfo)=>{
            let PixelMapWidth = imageInfo.size.width;
            let PixelMapHeight = imageInfo.size.height;
            console.log(caseName + ' PixelMapWidth:'+ PixelMapWidth + ' ,PixelMapHeight:'+ PixelMapHeight);
            expect(PixelMapWidth).assertLarger(0);
            expect(PixelMapHeight).assertLarger(0);
            done();
          })

        }

      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   test_getDefaultDisplaySync_api14
     * @tc.number SUB_BASIC_DMS_JS_0100
     * @tc.desc   test_getDefaultDisplaySync_api14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_getDefaultDisplaySync_api14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
      let caseName = 'test_getDefaultDisplaySync_api14';
      try{
        let displayInfo = display.getDefaultDisplaySync();
        console.log(caseName + ' displayInfo:'+ JSON.stringify(displayInfo));
        expect(displayInfo.id).assertEqual(0);
        expect(displayInfo.name != null).assertTrue();
        expect(displayInfo.alive).assertEqual(true);
        expect(displayInfo.width).assertLarger(0);
        expect(displayInfo.height).assertLarger(0);
        expect(displayInfo.refreshRate).assertLarger(0);
        expect(displayInfo.densityDPI).assertLarger(0);
        expect(displayInfo.densityPixels).assertLarger(0);
        expect(displayInfo.scaledDensity).assertLarger(0);
        expect(displayInfo.xDPI).assertLarger(0);
        expect(displayInfo.yDPI).assertLarger(0);
        expect(displayInfo.state).assertEqual(2);
        expect(displayInfo.hdrFormats != null).assertTrue();
        expect(displayInfo.colorSpaces != null).assertTrue();
        if(code == 801){
            expect(displayInfo.rotation).assertEqual(0);
            expect(displayInfo.orientation).assertEqual(0);
             done();
          }else {
            // expect(displayInfo.rotation).assertEqual(Number(rotation[0]));
            let rotation = displayInfo.rotation;
            expect(displayInfo.orientation).assertEqual(Number(orientation[rotation]));
             done();
          }
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   test_getPrimaryDisplaySync_api14
     * @tc.number SUB_BASIC_DMS_JS_0200
     * @tc.desc   test_getPrimaryDisplaySync_api14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_getPrimaryDisplaySync_api14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
      let caseName = 'test_getPrimaryDisplaySync_api14';
      try{
        let displayInfo = display.getPrimaryDisplaySync();
        console.log(caseName + ' displayInfo:'+ JSON.stringify(displayInfo));
        expect(displayInfo.id).assertEqual(0);
        expect(displayInfo.name != null).assertTrue();
        expect(displayInfo.alive).assertEqual(true);
        expect(displayInfo.width).assertLarger(0);
        expect(displayInfo.height).assertLarger(0);
        expect(displayInfo.refreshRate).assertLarger(0);
        expect(displayInfo.densityDPI).assertLarger(0);
        expect(displayInfo.densityPixels).assertLarger(0);
        expect(displayInfo.scaledDensity).assertLarger(0);
        expect(displayInfo.xDPI).assertLarger(0);
        expect(displayInfo.yDPI).assertLarger(0);
        expect(displayInfo.state).assertEqual(2);
        expect(displayInfo.hdrFormats != null).assertTrue();
        expect(displayInfo.colorSpaces != null).assertTrue();
        if(code == 801){
            expect(displayInfo.rotation).assertEqual(0);
            expect(displayInfo.orientation).assertEqual(0);
             done();
          }else {
            // expect(displayInfo.rotation).assertEqual(Number(rotation[0]));
            let rotation = displayInfo.rotation;
            expect(displayInfo.orientation).assertEqual(Number(orientation[rotation]));
            done();
          }
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   test_js_capture
     * @tc.number SUB_BASIC_DMS_JS_0300
     * @tc.desc   test_js_capture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_js_capture', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
      let caseName = 'test_js_capture';
      try{
        let captureOption: screenshot.CaptureOption = {
          "displayId": 0
        };
        let isCaptured = false;
        let callback = (status: boolean) => {
          console.info(caseName + 'capture status: ' + status);
          isCaptured = status;
        };
        display.on('captureStatusChange', callback);
        let promise = screenshot.capture(captureOption);
        promise.then((PixelMap: image.PixelMap) => {
          console.log(caseName + 'Succeeded in saving screenshot. Pixel bytes number: ' + PixelMap.getPixelBytesNumber());
          PixelMap.getImageInfo().then((imageInfo:image.ImageInfo)=>{
            let PixelMapWidth = imageInfo.size.width;
            let PixelMapHeight = imageInfo.size.height;
            console.log(caseName + ' PixelMapWidth:'+ PixelMapWidth + ' ,PixelMapHeight:'+ PixelMapHeight);
            expect(PixelMapWidth).assertLarger(0);
            expect(PixelMapHeight).assertLarger(0);
            PixelMap.release(); // PixelMap使用完后及时释放内存
            expect(isCaptured).assertEqual(true);
            done();
          })
        }).catch((err: BusinessError) => {
          console.log(caseName +'Failed to save screenshot. Code: ' + JSON.stringify(err));
          if(err.code == 801){
            done();
          }else{
            expect(false).assertTrue();
            done();
          }
        });
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   test_js_capture_captureStatusChange
     * @tc.number SUB_BASIC_DMS_JS_0400
     * @tc.desc   test_js_capture_captureStatusChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_js_capture_captureStatusChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
      let caseName = 'test_js_capture_captureStatusChange';
      let captured = false;
      try{
        let callback: Callback<boolean> = (captureStatus: boolean) => {
          console.info(caseName + 'Listening capture status: ' + captureStatus);
          display.off('captureStatusChange', callback);
          done();
        };
        display.on('captureStatusChange', callback);
        let captureOption: screenshot.CaptureOption = {
          "displayId": 0
        };
        let promise = screenshot.capture(captureOption);
        promise.then((PixelMap: image.PixelMap) => {
          console.log(caseName + 'Succeeded in saving screenshot. Pixel bytes number: ' + PixelMap.getPixelBytesNumber());
          PixelMap.getImageInfo().then((imageInfo:image.ImageInfo)=>{
            let PixelMapWidth = imageInfo.size.width;
            let PixelMapHeight = imageInfo.size.height;
            console.log(caseName + ' PixelMapWidth:'+ PixelMapWidth + ' ,PixelMapHeight:'+ PixelMapHeight);
            expect(PixelMapWidth).assertLarger(0);
            expect(PixelMapHeight).assertLarger(0);
            PixelMap.release(); // PixelMap使用完后及时释放内存
            done();
          })
        }).catch((err: BusinessError) => {
          console.log(caseName +'Failed to save screenshot. Code: ' + JSON.stringify(err));
          if(err.code == 801){
            display.off('captureStatusChange', callback);
            done();
          }else{
            expect(false).assertTrue();
            done();
          }
        });
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   test_js_capture_privateWindow
     * @tc.number SUB_BASIC_DMS_JS_0500
     * @tc.desc   test_js_capture_privateWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_js_capture_privateWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
      let caseName = 'test_js_capture_privateWindow';
      try{
        windowClass.setWindowPrivacyMode(true, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`caseName + Failed to set the window to privacy mode. Cause code: ${err.code}, message: ${err.message}`);
            return;
          }
          console.info(caseName + 'Succeeded in setting the window to privacy mode.');
          let captureOption: screenshot.CaptureOption = {
            "displayId": 0
          };
          let promise = screenshot.capture(captureOption);
          promise.then((PixelMap: image.PixelMap) => {
            console.log(caseName + 'Succeeded in saving screenshot. Pixel bytes number: ' + PixelMap.getPixelBytesNumber());
            PixelMap.getImageInfo().then((imageInfo:image.ImageInfo)=>{
              let PixelMapWidth = imageInfo.size.width;
              let PixelMapHeight = imageInfo.size.height;
              console.log(caseName + ' PixelMapWidth:'+ PixelMapWidth + ' ,PixelMapHeight:'+ PixelMapHeight);
              expect(PixelMapWidth).assertLarger(0);
              expect(PixelMapHeight).assertLarger(0);
              PixelMap.release(); // PixelMap使用完后及时释放内存
              done();
            })
          }).catch((err: BusinessError) => {
            console.log(caseName +'Failed to save screenshot. Code: ' + JSON.stringify(err));
            if(err.code == 801){
              windowClass.setWindowPrivacyMode(false);
              done();
            }else if(err.code == 1400003){
              console.info(caseName + 'privateWindow not support capture');
              done();
            }else{
              expect(false).assertTrue();
              done();
            }
          });

        });

      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testcapture
     * @tc.number SUB_BASIC_WMS_capture_0100
     * @tc.desc   testcapture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testcapture', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done:Function) => {
      let caseName = 'testcapture';
      try{
          let captureOption: screenshot.CaptureOption = {
            "displayId": 0
          };
          let promise = screenshot.capture();
          promise.then((PixelMap: image.PixelMap) => {
            console.log(caseName + 'Succeeded in saving screenshot. Pixel bytes number: ' + PixelMap.getPixelBytesNumber());
            PixelMap.getImageInfo().then((imageInfo:image.ImageInfo)=>{
              let PixelMapWidth = imageInfo.size.width;
              let PixelMapHeight = imageInfo.size.height;
              console.log(caseName + ' PixelMapWidth:'+ PixelMapWidth + ' ,PixelMapHeight:'+ PixelMapHeight);
              expect(PixelMapWidth).assertLarger(0);
              expect(PixelMapHeight).assertLarger(0);
              PixelMap.release(); // PixelMap使用完后及时释放内存
              done();
            })
          }).catch((err: BusinessError) => {
            console.log(caseName +'Failed to save screenshot. Code: ' + JSON.stringify(err));
            if(err.code == 801){
              done();
            }else{
              expect(false).assertTrue();
              done();
            }
          });
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   testCaptureWithBlacklistNotFloatBall
     * @tc.number SUB_BASIC_WMS_FUNCTION_CAPTURE_FILTER_0200
     * @tc.desc   截屏过滤窗口不为闪控球
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCaptureWithBlacklistNotFloatBall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      let caseName = 'testCaptureWithBlacklistNotFloatBall';
      let windowClass = windowStage.getMainWindowSync();
      let windowId = windowClass.getWindowProperties().id;
      console.info(caseName+ ' Succeeded in get window id:'+windowId);
      let captureOption: screenshot.CaptureOption = {
        "displayId": display.getDefaultDisplaySync().id,
        "blackWindowIds":[windowId]
      };
      try {
      let promise = screenshot.capture(captureOption);
      promise.then(async (pixelMap: image.PixelMap) => {
        console.info(caseName+' Succeeded in saving screenshot. Pixel bytes number: ' + pixelMap.getPixelBytesNumber());
        expect(false).assertTrue();
        pixelMap.release(); // PixelMap使用完后及时释放内存
        done();
      }).catch((err: BusinessError) => {
        console.error(caseName+` Failed to save screenshot. Code: ${err.code}, message: ${err.message}`);
        if(err.code == 801){
          done();
        }else{
          expect(err.code).assertEqual(401);
          expect(err.message!=null).assertTrue();
          done();
        }
      });
      } catch(e) {
        console.error( caseName+  `Failed. Cause:${e.code}, message:${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })



  })
}