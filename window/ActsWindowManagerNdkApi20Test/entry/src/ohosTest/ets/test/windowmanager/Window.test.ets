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
import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import windowndkapi20 from 'libwindowndkapi20.so';
import Utils from "../common/Utils";
import { Driver, ON } from "@kit.TestKit";
import { display, floatingBall, window } from "@kit.ArkUI";
import { BusinessError, settings } from "@kit.BasicServicesKit";
import { abilityAccessCtrl, common, PermissionRequestResult, Permissions } from "@kit.AbilityKit";

const CAN_NOT_BUILD_STAGE = -1;
const OK = 0;
const WS_OK = 0;
const WINDOW_MANAGER_ERRORCODE_NO_PERMISSION = 201;
const WINDOW_MANAGER_ERRORCODE_INVALID_PARAM = 401;
const DISPLAY_MANAGER_ERROR_DEVICE_NOT_SUPPORTED = 801;
const INVAILD_WINDOW_ID = 1000;
const WINDOW_MANAGER_ERRORCODE_STATE_ABNORMAL = 1300002;
const WINDOW_MANAGER_ERRORCODE_SYSTEM_ABNORMAL = 1300003;
const WINDOW_MANAGER_AVOID_AREA_TYPE_SYSTEM = 0;
const WINDOW_MANAGER_AVOID_AREA_TYPE_CUTOUT = 1;
const WINDOW_MANAGER_AVOID_AREA_TYPE_SYSTEM_GESTURE = 2;
const WINDOW_MANAGER_AVOID_AREA_TYPE_KEYBOARD = 3;
const WINDOW_MANAGER_AVOID_AREA_TYPE_NAVIGATION_INDICATOR = 4;
const WINDOW_MANAGER_WINDOW_TYPE_APP = 0;
const WINDOW_MANAGER_WINDOW_TYPE_MAIN = 1;
const WINDOW_MANAGER_WINDOW_TYPE_FLOAT = 8;
const WINDOW_MANAGER_WINDOW_TYPE_DIALOG = 16;

let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));

function getPermision(){
  let atManager:abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let context : common.UIAbilityContext = AppStorage.get('context') as common.UIAbilityContext;
  let permissions: Permissions[] =
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
  if (buttonOne != undefined) {
    await buttonOne.click();
  }
}

export default function WindowTest() {
  describe('WindowTest', () => {
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    let isPCStatus: string = '';
    let isAutoWindow: string = '';
    beforeAll(async (done: Function) => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context));
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
      //isAutoWindow == '' 非PAD设备
      //isAutoWindow == 'true' PAD设备自由多窗模式
      //isAutoWindow == 'false' PAD设备非自由多窗模式
      isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.USER_PROPERTY);
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
      isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
      //isPCStatus == '' 非PC设备
      //isPCStatus == '1' PC设备状态栏dock未融合
      //isPCStatus == '0' PC设备状态栏dock融合
      console.info(`beforeAll isPCStatus: `+ isPCStatus);
      await getPermision();
      await sleep(300);
      await ClickButtonDriver();
      await sleep(200);
      await Utils.pushPageNoClear("Window/Window", done);
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
    })

    beforeEach(async () => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      let mainWindow = windowStage.getMainWindowSync();
      let mainWindowId = mainWindow.getWindowProperties().id;
      console.info(`beforeEach mainWindowId: `+ mainWindowId);
      let thisWindow = await window.getLastWindow(context);
      let thisWindowId = thisWindow.getWindowProperties().id;
      console.info(`beforeEach thisWindowId: `+ thisWindowId);
      if (mainWindowId != thisWindowId) {
        await thisWindow.destroyWindow();
      }
    })

    /**
     * @tc.name   testLockCursorwithoutPermission
     * @tc.number SUB_BASIC_WMS_FUNCTION_LOCKCURSOR_0200
     * @tc.desc   testLockCursorwithoutPermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLockCursorwithoutPermission', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'testLockCursorwithoutPermission';
      let subWindowClass: window.Window | undefined;
      try {
        console.info(`====>${caseName} start<====`);
        subWindowClass = await windowStage.createSubWindow('testUnLockCursorwithoutPermission');
        await subWindowClass.setUIContent('MainAbility/pages/Window/SubWindow');
        await subWindowClass.showWindow();
        await sleep(1000);
        let windowId = subWindowClass.getWindowProperties().id;
        console.info(`====>${caseName} windowId: ${windowId}`);
        let Result: number = windowndkapi20.testLockCursorwithoutPermission(windowId);
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        await sleep(1000)
        await subWindowClass.destroyWindow();
        if (Result == 801) {
          done()
        } else {
          expect(Result).assertEqual(201);
          done()
        }
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + JSON.stringify(err));
        await subWindowClass?.destroyWindow();
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   testUnLockCursorwithoutPermission
     * @tc.number SUB_BASIC_WMS_FUNCTION_UNLOCKCURSOR_0200
     * @tc.desc   testUnLockCursorwithoutPermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnLockCursorwithoutPermission', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'testUnLockCursorwithoutPermission';
      let subWindowClass: window.Window | undefined;
      try {
        console.info(`====>${caseName} start<====`);
        subWindowClass = await windowStage.createSubWindow('testUnLockCursorwithoutPermission');
        await subWindowClass.setUIContent('MainAbility/pages/Window/SubWindow');
        await subWindowClass.showWindow();
        await sleep(1000);
        let windowId = subWindowClass.getWindowProperties().id;
        console.info(`====>${caseName} windowId: ${windowId}`);
        let Result: number = windowndkapi20.testUnLockCursorwithoutPermission(windowId);
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        await sleep(1000);
        await subWindowClass.destroyWindow();
        if (Result == 801) {
          done()
        } else {
          expect(Result).assertEqual(201);
          done()
        }
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + JSON.stringify(err));
        await subWindowClass?.destroyWindow()
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   testGetWindowAvoidAreaInvalidParam
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_GETWINDOWAVOIDAREA_0100
     * @tc.desc   Test get GetWindowAvoidAreaInvalidParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetWindowAvoidAreaInvalidParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_GETWINDOWAVOIDAREA_0100 start<====`);
        let Result: number = windowndkapi20.GetWindowAvoidAreaInvalidParam();
        expect(WINDOW_MANAGER_ERRORCODE_INVALID_PARAM).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_GETWINDOWAVOIDAREA_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testIsWindowShownInvalidParam
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_ISWINDOWSHOWN_0100
     * @tc.desc   Test get IsWindowShownInvalidParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsWindowShownInvalidParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_ISWINDOWSHOWN_0100 start<====`);
        let Result: number = windowndkapi20.IsWindowShownInvalidParam();
        expect(WINDOW_MANAGER_ERRORCODE_INVALID_PARAM).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_ISWINDOWSHOWN_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testSetWindowPrivacyModeNoPermission
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_SETWINDOWPRIVACYMODE_0100
     * @tc.desc   Test get SetWindowPrivacyModeNoPermission's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetWindowPrivacyModeNoPermission', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_SETWINDOWPRIVACYMODE_0100 start<====`);
        let Result: number = windowndkapi20.SetWindowPrivacyModeNoPermission();
        expect(WINDOW_MANAGER_ERRORCODE_NO_PERMISSION).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_SETWINDOWPRIVACYMODE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetWindowPropertiesInvalidParam
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_GETWINDOWPROPERTIES_0100
     * @tc.desc   Test get GetWindowPropertiesInvalidParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetWindowPropertiesInvalidParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_GETWINDOWPROPERTIES_0100 start<====`);
        let Result: number = windowndkapi20.GetWindowPropertiesInvalidParam();
        expect(WINDOW_MANAGER_ERRORCODE_INVALID_PARAM).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_GETWINDOWPROPERTIES_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testSnapshotOk
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_SNAPSHOT_0100
     * @tc.desc   Test get SnapshotOk's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSnapshotOk', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_SNAPSHOT_0100 start<====`);
        let Result: number = windowndkapi20.SnapshotOk();
        expect(OK).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_SNAPSHOT_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testSnapshotInvalidParam
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_SNAPSHOT_0200
     * @tc.desc   Test get SnapshotInvalidParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSnapshotInvalidParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_SNAPSHOT_0200 start<====`);
        let Result: number = windowndkapi20.SnapshotInvalidParam();
        expect(WINDOW_MANAGER_ERRORCODE_INVALID_PARAM).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_SNAPSHOT_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetAllWindowLayoutInfoListParameterOverride
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_GETALLWINDOWLAYOUTINFOLIST_0100
     * @tc.desc   Test get GetAllWindowLayoutInfoListParameterOverride's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetAllWindowLayoutInfoListParameterOverride', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_GETALLWINDOWLAYOUTINFOLIST_0100 start<====`);
        let Result: number = windowndkapi20.GetAllWindowLayoutInfoListParameterOverride();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_GETALLWINDOWLAYOUTINFOLIST_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetAllWindowLayoutInfoListOkOrDeviceNotSupported
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_GETALLWINDOWLAYOUTINFOLIST_0200
     * @tc.desc   Test get GetAllWindowLayoutInfoListOkOrDeviceNotSupported's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetAllWindowLayoutInfoListOkOrDeviceNotSupported', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_GETALLWINDOWLAYOUTINFOLIST_0200 start<====`);
        let Result: number = windowndkapi20.GetAllWindowLayoutInfoListOkOrDeviceNotSupported();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_GETALLWINDOWLAYOUTINFOLIST_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testInjectTouchEventSystemAbnormal
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_INJECTTOUCHEVENT_0200
     * @tc.desc   Test get InjectTouchEventSystemAbnormal's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInjectTouchEventSystemAbnormal', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_INJECTTOUCHEVENT_0200 start<====`);
        let Result: number = windowndkapi20.InjectTouchEventSystemAbnormal();
        expect(WINDOW_MANAGER_ERRORCODE_SYSTEM_ABNORMAL).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_INJECTTOUCHEVENT_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testWindowManagerErrorCodeOk
     * @tc.number SUB_ARKUI_ACE_ENGINE_OK_0100
     * @tc.desc   Test get WindowManagerErrorCodeOk's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWindowManagerErrorCodeOk', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OK_0100 start<====`);
        let Result: number = windowndkapi20.WindowManagerErrorCodeOk();
        expect(OK).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OK_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testWindowManagerErrorCodeNoPermission
     * @tc.number SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_NO_PERMISSION_0100
     * @tc.desc   Test get WindowManagerErrorCodeNoPermission's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWindowManagerErrorCodeNoPermission', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_NO_PERMISSION_0100 start<====`);
        let Result: number = windowndkapi20.WindowManagerErrorCodeNoPermission();
        expect(WINDOW_MANAGER_ERRORCODE_NO_PERMISSION).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_NO_PERMISSION_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testWindowManagerErrorCodeInvalidParam
     * @tc.number SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_INVALID_PARAM_0100
     * @tc.desc   Test get WindowManagerErrorCodeInvalidParam's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWindowManagerErrorCodeInvalidParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_INVALID_PARAM_0100 start<====`);
        let Result: number = windowndkapi20.WindowManagerErrorCodeInvalidParam();
        expect(WINDOW_MANAGER_ERRORCODE_INVALID_PARAM).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_INVALID_PARAM_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testWindowManagerErrorCodeDeviceNotSupported
     * @tc.number SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED_0100
     * @tc.desc   Test get WindowManagerErrorCodeDeviceNotSupported's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWindowManagerErrorCodeDeviceNotSupported', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED_0100 start<====`);
        let Result: number = windowndkapi20.WindowManagerErrorCodeDeviceNotSupported();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testWindowManagerErrorCodeInvalidWindowId
     * @tc.number SUB_ARKUI_ACE_ENGINE_INVAILD_WINDOW_ID_0100
     * @tc.desc   Test get WindowManagerErrorCodeInvalidWindowId's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWindowManagerErrorCodeInvalidWindowId', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_INVAILD_WINDOW_ID_0100 start<====`);
        let Result: number = windowndkapi20.WindowManagerErrorCodeInvalidWindowId();
        expect(INVAILD_WINDOW_ID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_INVAILD_WINDOW_ID_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testWindowManagerErrorCodeStateAbnormal
     * @tc.number SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_STATE_ABNORMAL_0100
     * @tc.desc   Test get WindowManagerErrorCodeStateAbnormal's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWindowManagerErrorCodeStateAbnormal', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_STATE_ABNORMAL_0100 start<====`);
        let Result: number = windowndkapi20.WindowManagerErrorCodeStateAbnormal();
        expect(WINDOW_MANAGER_ERRORCODE_STATE_ABNORMAL).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_STATE_ABNORMAL_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testWindowManagerErrorCodeSystemAbnormal
     * @tc.number SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_SYSTEM_ABNORMAL_0100
     * @tc.desc   Test get WindowManagerErrorCodeSystemAbnormal's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWindowManagerErrorCodeSystemAbnormal', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_SYSTEM_ABNORMAL_0100 start<====`);
        let Result: number = windowndkapi20.WindowManagerErrorCodeSystemAbnormal();
        expect(WINDOW_MANAGER_ERRORCODE_SYSTEM_ABNORMAL).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_SYSTEM_ABNORMAL_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetWindowAvoidAreaType0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_SYSTEM_0100
     * @tc.desc   Test get GetWindowAvoidAreaType0100's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetWindowAvoidAreaType0100', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_SYSTEM_0100 start<====`);
        let Result: number = windowndkapi20.GetWindowAvoidAreaType(0);
        expect(WINDOW_MANAGER_AVOID_AREA_TYPE_SYSTEM).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_SYSTEM_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetWindowAvoidAreaType0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_CUTOUT_0100
     * @tc.desc   Test get GetWindowAvoidAreaType0200's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetWindowAvoidAreaType0200', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_CUTOUT_0100 start<====`);
        let Result: number = windowndkapi20.GetWindowAvoidAreaType(1);
        expect(WINDOW_MANAGER_AVOID_AREA_TYPE_CUTOUT).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_CUTOUT_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetWindowAvoidAreaType0300
     * @tc.number SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_SYSTEM_GESTURE_0100
     * @tc.desc   Test get GetWindowAvoidAreaType0300's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetWindowAvoidAreaType0300', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_SYSTEM_GESTURE_0100 start<====`);
        let Result: number = windowndkapi20.GetWindowAvoidAreaType(2);
        expect(WINDOW_MANAGER_AVOID_AREA_TYPE_SYSTEM_GESTURE).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_SYSTEM_GESTURE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetWindowAvoidAreaType0400
     * @tc.number SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_KEYBOARD_0100
     * @tc.desc   Test get GetWindowAvoidAreaType0400's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetWindowAvoidAreaType0400', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_KEYBOARD_0100 start<====`);
        let Result: number = windowndkapi20.GetWindowAvoidAreaType(3);
        expect(WINDOW_MANAGER_AVOID_AREA_TYPE_KEYBOARD).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_KEYBOARD_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetWindowAvoidAreaType0500
     * @tc.number SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_NAVIGATION_INDICATOR_0100
     * @tc.desc   Test get GetWindowAvoidAreaType0500's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetWindowAvoidAreaType0500', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_NAVIGATION_INDICATOR_0100 start<====`);
        let Result: number = windowndkapi20.GetWindowAvoidAreaType(4);
        expect(WINDOW_MANAGER_AVOID_AREA_TYPE_NAVIGATION_INDICATOR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_NAVIGATION_INDICATOR_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetWindowType0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_WINDOW_TYPE_APP_0100
     * @tc.desc   Test get GetWindowType0100's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetWindowType0100', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_WINDOW_TYPE_APP_0100 start<====`);
        let button = await Utils.driver.findComponent(ON.text("SubWindow-Type: APP").id("APPSubWindow"));
        await button.click();
        await Utils.sleep(100);
        let subWindow = (globalThis.subWindow as window.Window).getWindowProperties();
        let Result: number = windowndkapi20.GetWindowType(0, subWindow.id);
        await Utils.destroySubWindow();
        expect(WINDOW_MANAGER_WINDOW_TYPE_APP).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_WINDOW_TYPE_APP_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetWindowType0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_WINDOW_TYPE_MAIN_0100
     * @tc.desc   Test get GetWindowType0200's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetWindowType0200', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_WINDOW_TYPE_MAIN_0100 start<====`);
        let mainWindow = (globalThis.windowStage as window.WindowStage).getMainWindowSync().getWindowProperties();
        let Result: number = windowndkapi20.GetWindowType(1, mainWindow.id);
        expect(WINDOW_MANAGER_WINDOW_TYPE_MAIN).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_WINDOW_TYPE_MAIN_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testGetWindowType0400
     * @tc.number SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_WINDOW_TYPE_DIALOG_0100
     * @tc.desc   Test get GetWindowType0400's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetWindowType0400', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_WINDOW_TYPE_DIALOG_0100 start<====`);
        let button = await Utils.driver.findComponent(ON.text("SubWindow-Type: Dialog").id("DialogSubWindow"));
        await button.click();
        await Utils.sleep(100);
        let subWindow = (globalThis.subWindow as window.Window).getWindowProperties();
        let Result: number = windowndkapi20.GetWindowType(16, subWindow.id);
        expect(WINDOW_MANAGER_WINDOW_TYPE_DIALOG).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_WINDOW_TYPE_DIALOG_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testRegisterMouseEventFilterOkOrServiceError
     * @tc.number SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_REGISTERMOUSEEVENTFILTER_0100
     * @tc.desc   Test get native xcomopnent key event action works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterMouseEventFilterOkOrServiceError', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_REGISTERMOUSEEVENTFILTER_0100 start<====`);
        let Result: number = windowndkapi20.RegisterMouseEventFilterOkOrServiceError();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_REGISTERMOUSEEVENTFILTER_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })

    /**
     * @tc.name   testRegisterMouseEventFilterInvaildWindowId
     * @tc.number SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_REGISTERMOUSEEVENTFILTER_0200
     * @tc.desc   Test get native xcomopnent key event action works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterMouseEventFilterInvaildWindowId', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_REGISTERMOUSEEVENTFILTER_0200 start<====`);
        let Result: number = windowndkapi20.RegisterMouseEventFilterInvaildWindowId();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_REGISTERMOUSEEVENTFILTER_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })

    /**
     * @tc.name   testUnregisterMouseEventFilterOkOrServiceError
     * @tc.number SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_UNREGISTERMOUSEEVENTFILTER_0100
     * @tc.desc   Test get native xcomopnent key event action works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnregisterMouseEventFilterOkOrServiceError', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_UNREGISTERMOUSEEVENTFILTER_0100 start<====`);
        let Result: number = windowndkapi20.UnregisterMouseEventFilterOkOrServiceError();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_UNREGISTERMOUSEEVENTFILTER_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })

    /**
     * @tc.name   testUnregisterMouseEventFilterInvaildWindowId
     * @tc.number SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_UNREGISTERMOUSEEVENTFILTER_0200
     * @tc.desc   Test get native xcomopnent key event action works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnregisterMouseEventFilterInvaildWindowId', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_UNREGISTERMOUSEEVENTFILTER_0200 start<====`);
        let Result: number = windowndkapi20.UnregisterMouseEventFilterInvaildWindowId();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_UNREGISTERMOUSEEVENTFILTER_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })

    /**
     * @tc.name   testRegisterTouchEventFilterOkOrServiceError
     * @tc.number SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_REGISTERTOUCHEVENTFILTER_0100
     * @tc.desc   Test get native xcomopnent key event action works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterTouchEventFilterOkOrServiceError', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_REGISTERTOUCHEVENTFILTER_0100 start<====`);
        let Result: number = windowndkapi20.RegisterTouchEventFilterOkOrServiceError();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_REGISTERTOUCHEVENTFILTER_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })

    /**
     * @tc.name   testRegisterTouchEventFilterInvaildWindowId
     * @tc.number SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_REGISTERTOUCHEVENTFILTER_0200
     * @tc.desc   Test get native xcomopnent key event action works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterTouchEventFilterInvaildWindowId', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_REGISTERTOUCHEVENTFILTER_0200 start<====`);
        let Result: number = windowndkapi20.RegisterTouchEventFilterInvaildWindowId();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_REGISTERTOUCHEVENTFILTER_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })

    /**
     * @tc.name   testUnregisterTouchEventFilterOkOrServiceError
     * @tc.number SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_UNREGISTERTOUCHEVENTFILTER_0100
     * @tc.desc   Test get native xcomopnent key event action works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnregisterTouchEventFilterOkOrServiceError', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_UNREGISTERTOUCHEVENTFILTER_0100 start<====`);
        let Result: number = windowndkapi20.UnregisterTouchEventFilterOkOrServiceError();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_UNREGISTERTOUCHEVENTFILTER_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })

    /**
     * @tc.name   testUnregisterTouchEventFilterInvaildWindowId
     * @tc.number SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_UNREGISTERTOUCHEVENTFILTER_0200
     * @tc.desc   Test get native xcomopnent key event action works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnregisterTouchEventFilterInvaildWindowId', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_UNREGISTERTOUCHEVENTFILTER_0200 start<====`);
        let Result: number = windowndkapi20.UnregisterTouchEventFilterInvaildWindowId();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_UNREGISTERTOUCHEVENTFILTER_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })


    /**
     * @tc.name   test_OH_WindowManager_GetAllMainWindowInfo_0200
     * @tc.number SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_WINDOWINFO_TEST_0200
     * @tc.desc   OH_WindowManager_GetAllMainWindowInfo测试返回值覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_OH_WindowManager_GetAllMainWindowInfo_0200', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (isPCStatus != '') {
        try {
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_WINDOWINFO_TEST_0200 start<====`);
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_WINDOWINFO_TEST_0200 windowId: ${windowId}`);
          let displayId = display.getDefaultDisplaySync().id;
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_WINDOWINFO_TEST_0200 displayId: ${displayId}`);
          let Result: number = windowndkapi20.test_OH_WindowManager_GetAllMainWindowInfo_0200(windowId, displayId);
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_WINDOWINFO_TEST_0200 Result: ${Result}`);
          expect(Result).assertEqual(WS_OK);
          done()
        } catch (err) {
          console.error(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_WINDOWINFO_TEST_0200 catch err: ` + err);
          expect(false).assertEqual(err);
          done()
        }
      } else {
        done()
      }
    })

    /**
     * @tc.name   test_OH_WindowManager_GetMainWindowSnapshot_0200
     * @tc.number SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0200
     * @tc.desc   test_OH_WindowManager_GetMainWindowSnapshot_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_OH_WindowManager_GetMainWindowSnapshot_0200', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (isPCStatus != '') {
        try {
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0200 start<====`);
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0200 windowId: ${windowId}`);
          let Result: number = windowndkapi20.test_OH_WindowManager_GetMainWindowSnapshot_0200();
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0200 Result: ${Result}`);
          expect(Result).assertEqual(WINDOW_MANAGER_ERRORCODE_INVALID_PARAM);
          done()
        } catch (err) {
          console.error(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0200 catch err: ` + err);
          expect(false).assertEqual(err);
          done()
        }
      } else {
        done()
      }
    })

    /**
     * @tc.name   test_OH_WindowManager_GetMainWindowSnapshot_0300
     * @tc.number SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0300
     * @tc.desc   test_OH_WindowManager_GetMainWindowSnapshot_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_OH_WindowManager_GetMainWindowSnapshot_0300', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (isPCStatus != '') {
        try {
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0300 start<====`);
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0300 windowId: ${windowId}`);
          let Result: number = windowndkapi20.test_OH_WindowManager_GetMainWindowSnapshot_0300(windowId);
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0300 Result: ${Result}`);
          expect(Result).assertEqual(WINDOW_MANAGER_ERRORCODE_INVALID_PARAM);
          done()
        } catch (err) {
          console.error(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0300 catch err: ` + err);
          expect(false).assertEqual(err);
          done()
        }
      } else {
        done()
      }
    })

    /**
     * @tc.name   test_OH_WindowManager_GetMainWindowSnapshot_0400
     * @tc.number SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0400
     * @tc.desc   test_OH_WindowManager_GetMainWindowSnapshot_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_OH_WindowManager_GetMainWindowSnapshot_0400', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (isPCStatus != '') {
        try {
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0400 start<====`);
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0400 windowId: ${windowId}`);
          let Result: number = windowndkapi20.test_OH_WindowManager_GetMainWindowSnapshot_0400(windowId);
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0400 Result: ${Result}`);
          expect(Result).assertEqual(WINDOW_MANAGER_ERRORCODE_INVALID_PARAM);
          done()
        } catch (err) {
          console.error(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0400 catch err: ` + err);
          expect(false).assertEqual(err);
          done()
        }
      } else {
        done()
      }
    })

    /**
     * @tc.name   test_OH_WindowManager_GetMainWindowSnapshot_0500
     * @tc.number SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0500
     * @tc.desc   test_OH_WindowManager_GetMainWindowSnapshot_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_OH_WindowManager_GetMainWindowSnapshot_0500', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (isPCStatus != '') {
        try {
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0500 start<====`);
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0500 windowId: ${windowId}`);
          let Result: number = windowndkapi20.test_OH_WindowManager_GetMainWindowSnapshot_0500();
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0500 Result: ${Result}`);
          expect(Result).assertEqual(OK);
          done()
        } catch (err) {
          console.error(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0500 catch err: ` + err);
          expect(false).assertEqual(err);
          done()
        }
      } else {
        done()
      }
    })

    /**
     * @tc.name   test_OH_WindowManager_GetMainWindowSnapshot_0600
     * @tc.number SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0600
     * @tc.desc   test_OH_WindowManager_GetMainWindowSnapshot_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_OH_WindowManager_GetMainWindowSnapshot_0600', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (isPCStatus != '') {
        try {
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0600 start<====`);
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0600 windowId: ${windowId}`);
          let Result: number = windowndkapi20.test_OH_WindowManager_GetMainWindowSnapshot_0600(windowId);
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0600 Result: ${Result}`);
          expect(Result).assertEqual(WINDOW_MANAGER_ERRORCODE_INVALID_PARAM);
          done()
        } catch (err) {
          console.error(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0600 catch err: ` + err);
          expect(false).assertEqual(err);
          done()
        }
      } else {
        done()
      }
    })

    /**
     * @tc.name   test_OH_WindowManager_GetMainWindowSnapshot_0700
     * @tc.number SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0700
     * @tc.desc   test_OH_WindowManager_GetMainWindowSnapshot_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_OH_WindowManager_GetMainWindowSnapshot_0700', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (isPCStatus != '') {
        try {
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0700 start<====`);
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0700 windowId: ${windowId}`);
          let Result: number = windowndkapi20.test_OH_WindowManager_GetMainWindowSnapshot_0700(windowId);
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0700 Result: ${Result}`);
          expect(Result).assertEqual(OK);
          done()
        } catch (err) {
          console.error(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0700 catch err: ` + err);
          expect(false).assertEqual(err);
          done()
        }
      } else {
        done()
      }
    })

    /**
     * @tc.name   test_OH_WindowManager_GetMainWindowSnapshot_0800
     * @tc.number SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0800
     * @tc.desc   test_OH_WindowManager_GetMainWindowSnapshot_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_OH_WindowManager_GetMainWindowSnapshot_0800', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (isPCStatus != '') {
        try {
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0800 start<====`);
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0800 windowId: ${windowId}`);
          let Result: number = windowndkapi20.test_OH_WindowManager_GetMainWindowSnapshot_0800(windowId);
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0800 Result: ${Result}`);
          expect(Result).assertEqual(WS_OK);
          done()
        } catch (err) {
          console.error(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0800 catch err: ` + err);
          expect(false).assertEqual(err);
          done()
        }
      } else {
        done()
      }
    })

    /**
     * @tc.name   testLockCursorwithOutofRange
     * @tc.number SUB_BASIC_WMS_FUNCTION_LOCKCURSOR_0100
     * @tc.desc   testLockCursorwithOutofRange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLockCursorwithOutofRange', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'testLockCursorwithOutofRange';
      try {
        console.info(`====>${caseName} start<====`);
        let windowClass = windowStage.getMainWindowSync();
        let windowId = windowClass.getWindowProperties().id;
        console.info(`====>${caseName} windowId: ${windowId}`);
        let Result: Array<number> = windowndkapi20.testLockCursorwithOutofRange(windowId);
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(401);
        expect(Result[1]).assertEqual(401);
        expect(Result[2]).assertEqual(1300002);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   testUnLockCursorwithOutofRange
     * @tc.number SUB_BASIC_WMS_FUNCTION_UNLOCKCURSOR_0100
     * @tc.desc   testUnLockCursorwithOutofRange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnLockCursorwithOutofRange', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {    
      let caseName = 'testUnLockCursorwithOutofRange';
      try {
        console.info(`====>${caseName} start<====`);
        let windowClass = windowStage.getMainWindowSync();
        let windowId = windowClass.getWindowProperties().id;
        console.info(`====>${caseName} windowId: ${windowId}`);
        let Result: Array<number> = windowndkapi20.testUnLockCursorwithOutofRange(windowId);
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(401);
        expect(Result[1]).assertEqual(401);
        expect(Result[2]).assertEqual(1300002);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   testSetWindowBrightness
     * @tc.number SUB_BASIC_WMS_FUNCTION_testSetWindowBrightness_0100
     * @tc.desc   testSetWindowBrightness
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowBrightness', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testSetWindowBrightness';
      try {
        console.info(`====>${caseName} start<====`);
        let windowClass = windowStage.getMainWindowSync();
        let windowId = windowClass.getWindowProperties().id;
        console.info(`====>${caseName} windowId: ${windowId}`);
        let Result1: number = windowndkapi20.testSetWindowBrightness(windowId, -1.0);
        console.info(`====>${caseName} Result1: ${JSON.stringify(Result1)}`);
        expect(Result1).assertEqual(OK);
        let Result2: number = windowndkapi20.testSetWindowBrightness(windowId, 0.0);
        console.info(`====>${caseName} Result2: ${JSON.stringify(Result2)}`);
        expect(Result2).assertEqual(OK);
        let Result3: number = windowndkapi20.testSetWindowBrightness(windowId, 1.0);
        console.info(`====>${caseName} Result3: ${JSON.stringify(Result3)}`);
        expect(Result3).assertEqual(OK);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   testInjectTouchEvent
     * @tc.number SUB_BASIC_WMS_FUNCTION_testInjectTouchEvent_0100
     * @tc.desc   testInjectTouchEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testInjectTouchEvent', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testInjectTouchEvent';
      let isSupport = canIUse('SystemCapability.Window.SessionManager')
      console.log(caseName + ' isSupport: ' + isSupport);
      try {
        console.info(`====>${caseName} start<====`);
        let windowClass = windowStage.getMainWindowSync();
        let windowId = windowClass.getWindowProperties().id;
        console.info(`====>${caseName} windowId: ${windowId}`);
        let Result: Array<number> = windowndkapi20.testInjectTouchEvent(windowId);
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(WINDOW_MANAGER_ERRORCODE_SYSTEM_ABNORMAL);
        if (isSupport) {
          expect(Result[1]).assertEqual(OK);
        } else {
          expect(Result[1]).assertEqual(WINDOW_MANAGER_ERRORCODE_SYSTEM_ABNORMAL);
        }
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   testGetMainWindowSnapshot
     * @tc.number SUB_BASIC_WMS_FUNCTION_testGetMainWindowSnapshot_0100
     * @tc.desc   testGetMainWindowSnapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetMainWindowSnapshot', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testGetMainWindowSnapshot';
      let isSupport = canIUse('SystemCapability.Window.SessionManager')
      console.log(caseName + ' isSupport: ' + isSupport);
      try {
        console.info(`====>${caseName} start<====`);
        let windowClass = windowStage.getMainWindowSync();
        let windowId = windowClass.getWindowProperties().id;
        console.info(`====>${caseName} windowId: ${windowId}`);
        let Result: Array<number> = windowndkapi20.testGetMainWindowSnapshot(windowId);
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(WINDOW_MANAGER_ERRORCODE_INVALID_PARAM);
        expect(Result[1]).assertEqual(WINDOW_MANAGER_ERRORCODE_INVALID_PARAM);
        expect(Result[2]).assertEqual(WINDOW_MANAGER_ERRORCODE_INVALID_PARAM);
        expect(Result[3]).assertEqual(WINDOW_MANAGER_ERRORCODE_INVALID_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   testLockCursor
     * @tc.number SUB_BASIC_WMS_FUNCTION_testLockCursor_0100
     * @tc.desc   testLockCursor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLockCursor', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testLockCursor';
      try {
        console.info(`====>${caseName} start<====`);
        let windowClass = windowStage.getMainWindowSync();
        let windowId = windowClass.getWindowProperties().id;
        console.info(`====>${caseName} windowId: ${windowId}`);
        let Result: Array<number> = windowndkapi20.testLockCursor(windowId);
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(WINDOW_MANAGER_ERRORCODE_INVALID_PARAM);
        expect(Result[1]).assertEqual(WINDOW_MANAGER_ERRORCODE_INVALID_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   testUnlockCursor
     * @tc.number SUB_BASIC_WMS_FUNCTION_testUnlockCursor_0100
     * @tc.desc   testUnlockCursor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUnlockCursor', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testUnlockCursor';
      try {
        console.info(`====>${caseName} start<====`);
        let windowClass = windowStage.getMainWindowSync();
        let windowId = windowClass.getWindowProperties().id;
        console.info(`====>${caseName} windowId: ${windowId}`);
        let Result: Array<number> = windowndkapi20.testUnlockCursor(windowId);
        console.info(`====>${caseName} Result: ${JSON.stringify(Result)}`);
        expect(Result[0]).assertEqual(WINDOW_MANAGER_ERRORCODE_INVALID_PARAM);
        expect(Result[1]).assertEqual(WINDOW_MANAGER_ERRORCODE_INVALID_PARAM);
        done()
      } catch (err) {
        console.error(`====>${caseName} catch err: ` + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

  })
}