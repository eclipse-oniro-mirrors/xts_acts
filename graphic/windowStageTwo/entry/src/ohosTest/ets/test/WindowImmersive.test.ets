/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level} from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import window from '@ohos.window';
import ohosWindow from '@ohos.window';
import common from '@ohos.app.ability.common';
import settings from '@ohos.settings';
import { display } from '@kit.ArkUI';
import { StartOptions } from '@kit.AbilityKit';

let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));

async function startAbility(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartTestAbility'
  };
  if (options) {
    await context.startAbility(want, options).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
    });
  } else {
    await context.startAbility(want).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
    });
  }
  await sleep(1000)
  let windowStageStart = AppStorage.get('windowStageStartTest') as window.WindowStage;
  return windowStageStart
}

async function terminateAbility(caseName: string) {
  let pageContext = AppStorage.get('contextTest') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${caseName} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
  });
  await sleep(1000)
}

export default function windowImmersiveTest() {
  describe('windowImmersive_test', () => {
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context : common.UIAbilityContext;
    let windowStage:ohosWindow.WindowStage;
    let isPCStatus:string = '';
    let isAutoWindow:string = '';
    let avoidArea1: window.AvoidArea;
    let isSupportRotate = false;
    beforeAll(async () => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      isPCStatus = settings.getValueSync(context,'isStatusBarExist','',settings.domainName.USER_PROPERTY)
      //isPCStatus == '' 非PC设备
      //isPCStatus == '1' PC设备状态栏dock未融合
      //isPCStatus == '0' PC设备状态栏dock融合
      console.info(`beforeAll isPCStatus: ${JSON.stringify(isPCStatus)}`);
      isAutoWindow = settings.getValueSync(context,'window_pcmode_switch_status','',settings.domainName.USER_PROPERTY);
      //isAutoWindow == '' 非PAD设备
      //isAutoWindow == 'true' PAD设备自由多窗模式
      //isAutoWindow == 'false' PAD设备非自由多窗模式
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
      let windowClass = windowStage.getMainWindowSync();
        await windowClass.setWindowLayoutFullScreen(false);
        // await windowClass.setWindowSystemBarEnable(['status']);
        let type = window.AvoidAreaType.TYPE_SYSTEM;
        avoidArea1 = windowClass.getWindowAvoidArea(type);
        console.info(` Succeeded in getWindowAvoidArea1. Data: ${JSON.stringify(avoidArea1)}`);
        //查看设备是否支持旋转：isSupportRotate == true,支持；isSupportRotate == false,不支持
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
        await sleep(300);
        let Orientation1 = display.getDefaultDisplaySync().orientation;
        await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE);
        await sleep(300);
        let Orientation2 = display.getDefaultDisplaySync().orientation;
        if(Orientation1 != Orientation2){
          isSupportRotate = true;
        }else{
          isSupportRotate = false;
        }
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
        await sleep(300);
        console.log(`beforeAll isSupportRotate: ${JSON.stringify(isSupportRotate)},Orientation1: ${JSON.stringify(Orientation1)},Orientation2: ${JSON.stringify(Orientation2)}`)
    
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async ()=>{
      try {
        await sleep(1000)
        let mainWindowClass = windowStage.getMainWindowSync()
        let mainID = mainWindowClass.getWindowProperties().id
        let lastWindow = await window.getLastWindow(context)
        let lastID = lastWindow.getWindowProperties().id
        while (mainID != lastID) {
          await lastWindow.destroyWindow()
          await sleep(1000)
          lastWindow = await window.getLastWindow(context)
          lastID = lastWindow.getWindowProperties().id
      }
      } catch (error) {
        console.log('afterEach fail cause'+error)
      }
    })
    afterAll(async () => {
      let windowClass = windowStage.getMainWindowSync();
      await windowClass.setWindowLayoutFullScreen(false);
      await windowClass.setWindowSystemBarEnable(['status']);
      await windowClass.setSpecificSystemBarEnabled('status', true);
      await windowClass.setFullScreen(false);
      await windowClass.recover();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_LANSCAPE_SHOW_STATUS_BAR_0100
     * @tc.name      : test_LANSCAPE_SHOW_STATUS_BAR_0100
     * @tc.desc      : test_LANSCAPE_SHOW_STATUS_BAR_0100
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('test_LANSCAPE_SHOW_STATUS_BAR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'test_LANSCAPE_SHOW_STATUS_BAR_0100';
      let windowClass = windowStage.getMainWindowSync();
      if(isSupportRotate == true && isPCStatus == ''&&isAutoWindow != 'true'){
        try {
          await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE);
          await sleep(1000);
          console.info(`${caseName} Succeeded in setPreferredOrientation LANDSCAPE.`);
          await windowClass.setWindowSystemBarEnable(['navigation']);
          await sleep(3000);
          windowClass.on('avoidAreaChange', async (data) => {
            console.info(`${caseName} Succeeded in enabling the listener for avoid area changes. type:
           ${JSON.stringify(data.type)} area: ${JSON.stringify(data.area)}`);
            if(data.type == 0){
              windowClass.off('avoidAreaChange');
              await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
              await sleep(1000);
              done();
            }else{
              await sleep(1000);
            }
          });
          await windowClass.setWindowSystemBarEnable(['status', 'navigation'])
          console.log(`${caseName} Succeeded in setting the status bar to be visible.`);
          await sleep(2000);

        } catch (exception) {
          console.error(`${caseName} Failed to set setSpecificSystemBarEnabled. Cause code: ${exception.code}, message: ${exception.message}`);
          await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
          expect().assertFail();
          done();
        }
      }else{
        done();
      }

    })

    /**
     * @tc.number    : SUB_BASIC_WMS_LANSCAPE_HIDE_STATUS_BAR_0100
     * @tc.name      : test_LANSCAPE_HIDE_STATUS_BAR_0100
     * @tc.desc      : test_LANSCAPE_HIDE_STATUS_BAR_0100
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('test_LANSCAPE_HIDE_STATUS_BAR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'test_LANSCAPE_HIDE_STATUS_BAR_0100';
      let windowClass = windowStage.getMainWindowSync();
      if(isSupportRotate == true && isPCStatus == ''&&isAutoWindow == ''){
        try {
          await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE);
          await sleep(1000);
          console.info(`${caseName} Succeeded in setPreferredOrientation LANDSCAPE.`);
          await windowClass.setWindowSystemBarEnable(['status', 'navigation']);
          await sleep(3000);
          windowClass.on('avoidAreaChange', async (data) => {
            console.info(`${caseName} Succeeded in enabling the listener for avoid area changes. type: ${JSON.stringify(data.type)} area: ${JSON.stringify(data.area)}`);
            if(data.type == 0){
              windowClass.off('avoidAreaChange');
              await windowClass.setWindowSystemBarEnable(['status', 'navigation']);
              await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
              await sleep(1000);
              done();
            }else{
              await sleep(1000);
            }
          });
          await windowClass.setWindowSystemBarEnable(['navigation']);
          console.log(`${caseName} Succeeded in setting the status bar to be invisible.`);
          await sleep(2000);


        } catch (exception) {
          console.error(`${caseName} Failed to set setSpecificSystemBarEnabled. Cause code: ${exception.code}, message: ${exception.message}`);
          await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
          expect().assertFail();
          done();
        }
      }else{
        done();
      }

    });


    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0100
     * @tc.name      : testIsImmersiveLayoutwithMainwindowDefaultState
     * @tc.desc      : 验证主窗创建后默认为非沉浸式状态
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testIsImmersiveLayoutwithMainwindowDefaultState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testIsImmersiveLayoutwithMainwindowDefaultState';
      let windowClass = windowStage.getMainWindowSync();
      try {
        await windowClass.setSpecificSystemBarEnabled('status', true);
        await sleep(2000);
        let res = windowClass.isImmersiveLayout();
        console.log(`${caseName} isImmersiveLayout: ${res}.`);
        expect(res).assertEqual(false);
        done();
      } catch (exception) {
        console.error(`${caseName} Failed. Cause code: ${exception.code}, message: ${exception.message}`);
        if (exception.code === 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0900
     * @tc.name      : testIsImmersiveLayoutwithMaximize
     * @tc.desc      : 验证maximize后调用IsImmersiveLayout
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testIsImmersiveLayoutwithMaximize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testIsImmersiveLayoutwithMaximize';
      let windowClass = windowStage.getMainWindowSync();
      try {
        if (isPCStatus != '' || isAutoWindow =='true') {
          await windowClass.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING);
          await sleep(200);
          let res = windowClass.isImmersiveLayout();
          console.log(`${caseName} isImmersiveLayout 1: ${res}.`);
          expect(res).assertEqual(false);
          await windowClass.recover();
          await sleep(200);
          await windowClass.maximize(window.MaximizePresentation.EXIT_IMMERSIVE);
          await sleep(200);
          let res2 = windowClass.isImmersiveLayout();
          console.log(`${caseName} isImmersiveLayout 2: ${res2}.`);
          expect(res2).assertEqual(false);
          await windowClass.recover();
          await sleep(200);
          await windowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE);
          await sleep(200);
          let res3 = windowClass.isImmersiveLayout();
          console.log(`${caseName} isImmersiveLayout 3: ${res3}.`);
          expect(res3).assertEqual(true);
          await windowClass.recover();
          await sleep(200);
          await windowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE_DISABLE_TITLE_AND_DOCK_HOVER);
          await sleep(200);
          let res4 = windowClass.isImmersiveLayout();
          console.log(`${caseName} isImmersiveLayout 4: ${res4}.`);
          expect(res4).assertEqual(true);
          await windowClass.recover();
          await sleep(200);

          done();
        } else {
          done();
        }
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        expect().assertFail();
        done()
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_OnavoidAreaChange_0100
     * @tc.name      : testOnavoidAreaChangeInLandScape
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('testOnavoidAreaChangeInLandScape', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'testOnavoidAreaChangeInLandScape';
      if(isSupportRotate){
        try {
          let windowClass = windowStage.getMainWindowSync();
          let displayWidth = display.getDefaultDisplaySync().width;
          console.info(caseName+ 'displayWidth: ' + JSON.stringify(displayWidth));
          let displayHeight = display.getDefaultDisplaySync().height;
          console.info(caseName+ 'displayHeight: ' + JSON.stringify(displayHeight));
          windowClass.on('avoidAreaChange', async (data) => {
            console.info(caseName+ ':Succeeded in enabling the listener for system avoid area changes. type:' +
            JSON.stringify(data.type) + ', area: ' + JSON.stringify(data.area));
            if(data.type == 0){
              expect(data.area.visible).assertTrue();
              expect(data.area.topRect !== null).assertTrue();
              expect(data.area.rightRect !== null).assertTrue();
              expect(data.area.bottomRect !== null).assertTrue();
              expect(data.area.leftRect !== null).assertTrue();
            }else if(data.type == 4){
              expect(data.area.visible).assertTrue();
              expect(data.area.topRect !== null).assertTrue();
              expect(data.area.rightRect !== null).assertTrue();
              expect(data.area.bottomRect.top+data.area.bottomRect.height).assertEqual(displayWidth);
              expect(data.area.leftRect !== null).assertTrue();
            }else{
              await sleep(500);
            }

            windowClass.off('avoidAreaChange');
            await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
            await sleep(300);
            done();

          });
          await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE);
          await sleep(500);
        } catch (exception) {
          console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
          done();
        }
      }else{
        done();
      }

    })
    /**
     * @tc.number    : SUB_BASIC_WMS_OnavoidAreaChange_0200
     * @tc.name      : testOnavoidAreaChangeInPORTRAIT
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('testOnavoidAreaChangeInPORTRAIT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'testOnavoidAreaChangeInPORTRAIT';
      if(isSupportRotate){
        try {
          let windowClass = windowStage.getMainWindowSync();
          let displayWidth = display.getDefaultDisplaySync().width;
          console.info(caseName+ 'displayWidth: ' + JSON.stringify(displayWidth));
          let displayHeight = display.getDefaultDisplaySync().height;
          console.info(caseName+ 'displayHeight: ' + JSON.stringify(displayHeight));
          await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE);
          await sleep(300);
          windowClass.on('avoidAreaChange', async (data) => {
            console.info(caseName+ ':Succeeded in enabling the listener for system avoid area changes. type:' +
            JSON.stringify(data.type) + ', area: ' + JSON.stringify(data.area));
            if(data.type == 0){
              expect(data.area.visible).assertTrue();
              expect(data.area.topRect !== null).assertTrue();
              expect(data.area.rightRect !== null).assertTrue();
              expect(data.area.bottomRect !== null).assertTrue();
              expect(data.area.leftRect !== null).assertTrue();
            }else if(data.type == 4){
              expect(data.area.visible).assertTrue();
              expect(data.area.topRect!== null).assertTrue();
              expect(data.area.rightRect !== null).assertTrue();
              expect(data.area.bottomRect.top+data.area.bottomRect.height).assertEqual(displayHeight);
              expect(data.area.leftRect !== null).assertTrue();
            }else{
              await sleep(500);
            }

            windowClass.off('avoidAreaChange');
            await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
            await sleep(300);
            done();

          });
          await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
          await sleep(2000);
        } catch (exception) {
          console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
          done();
        }
      }else{
        done();
      }

    })
    /**
     * @tc.number    : SUB_BASIC_WMS_OnavoidAreaChange_0300
     * @tc.name      : testOnavoidAreaChangeInLANDSCAPE_INVERTED
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('testOnavoidAreaChangeInLANDSCAPE_INVERTED', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'testOnavoidAreaChangeInLANDSCAPE_INVERTED';
      if(isSupportRotate){
        try {
          let windowClass = windowStage.getMainWindowSync();
          let displayWidth = display.getDefaultDisplaySync().width;
          console.info(caseName+ 'displayWidth: ' + JSON.stringify(displayWidth));
          let displayHeight = display.getDefaultDisplaySync().height;
          console.info(caseName+ 'displayHeight: ' + JSON.stringify(displayHeight));
          await sleep(300);
          windowClass.on('avoidAreaChange', async (data) => {
            console.info(caseName+ ':Succeeded in enabling the listener for system avoid area changes. type:' +
            JSON.stringify(data.type) + ', area: ' + JSON.stringify(data.area));
            if(data.type == 0){
              expect(data.area.visible).assertTrue();
              expect(data.area.topRect !== null).assertTrue();
              expect(data.area.rightRect !== null).assertTrue();
              expect(data.area.bottomRect !== null).assertTrue();
              expect(data.area.leftRect !== null).assertTrue();
            }else if(data.type == 4){
              expect(data.area.visible).assertTrue();
              expect(data.area.topRect !== null).assertTrue();
              expect(data.area.rightRect !== null).assertTrue();
              expect(data.area.bottomRect.top+data.area.bottomRect.height).assertEqual(displayWidth);
              expect(data.area.leftRect !== null).assertTrue();
            }else{
              await sleep(500);
            }
            windowClass.off('avoidAreaChange');
            await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
            await sleep(300);
            done();

          });
          await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE_INVERTED);
          await sleep(2000);
        } catch (exception) {
          console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
          done();
        }
      }else{
        done();
      }

    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_IMMERSIVEMODE_ENABLEDATATE_0100
     * @tc.name      : test_setImmersiveModeEnabledState_true
     * @tc.desc      : test_setImmersiveModeEnabledState_true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */

    it("SUB_BASIC_WMS_SPCIAL_XTS_SET_IMMERSIVEMODE_ENABLEDATATE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let msgStr = "SUB_BASIC_WMS_SPCIAL_XTS_SET_IMMERSIVEMODE_ENABLEDATATE_0100";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      try {
        let enabled = true;
        windowClass.setImmersiveModeEnabledState(enabled);
        let isEnabled = windowClass.getImmersiveModeEnabledState();
        console.log(msgStr + 'success to setImmersiveModeEnabledState enabled:' + isEnabled);
        if(isPCStatus == '' || isAutoWindow =='false'){
          expect(isEnabled).assertEqual(true);
          done();
        }else{
          expect(isEnabled).assertEqual(false);
          done();
        }
        
      } catch (error) {
        console.log(msgStr + 'Failed to setImmersiveModeEnabledState enable' + JSON.stringify(error.code) +
          error.message);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_IMMERSIVEMODE_ENABLEDATATE_0200
     * @tc.name      : test_setImmersiveModeEnabledState_false
     * @tc.desc      : test_setImmersiveModeEnabledState_false
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */

    it("SUB_BASIC_WMS_SPCIAL_XTS_SET_IMMERSIVEMODE_ENABLEDATATE_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let msgStr = "SUB_BASIC_WMS_SPCIAL_XTS_SET_IMMERSIVEMODE_ENABLEDATATE_0200";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      try {
        let enabled = false;
        windowClass.setImmersiveModeEnabledState(enabled);
        let isEnabled = windowClass.getImmersiveModeEnabledState();
        console.log(msgStr + 'success to setImmersiveModeEnabledState disenabled:' + isEnabled);
        expect(isEnabled).assertEqual(false);
        done();
      } catch (error) {
        console.log(msgStr + 'Failed to setImmersiveModeEnabledState disEnable' + JSON.stringify(error.code) +
          error.message);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0100
     * @tc.name      : testGetWindowAvoidAreaTypeSystem
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testGetWindowAvoidAreaTypeSystem', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'TestGetWindowAvoidAreaTypeSystem';
      try {
        let windowClass = windowStage.getMainWindowSync();
        let avoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
        console.info(`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
        expect(avoidArea.visible).assertTrue();
        expect(avoidArea.topRect !== null).assertTrue();
        expect(avoidArea.rightRect !== null).assertTrue();
        expect(avoidArea.bottomRect !== null).assertTrue();
        expect(avoidArea.leftRect !== null).assertTrue();
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0200
     * @tc.name      : testGetWindowAvoidAreaTypeCutout
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('testGetWindowAvoidAreaTypeCutOut', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName = 'TestGetWindowAvoidAreaTypeCutOut';
      try {
        let windowClass = windowStage.getMainWindowSync();
        let avoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_CUTOUT);
        console.info(`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
        expect(!avoidArea.visible).assertTrue();
        expect(avoidArea.topRect !== null).assertTrue();
        expect(avoidArea.rightRect !== null).assertTrue();
        expect(avoidArea.bottomRect !== null).assertTrue();
        expect(avoidArea.leftRect !== null).assertTrue();
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0300
     * @tc.name      : testGetWindowAvoidAreaTypeSystemGesture
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('testGetWindowAvoidAreaTypeSystemGesture', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName = 'TestGetWindowAvoidAreaTypeSystemGesture';
      try {
        let windowClass = windowStage.getMainWindowSync();
        let avoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM_GESTURE);
        console.info(`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
        expect(avoidArea.visible).assertTrue();
        expect(avoidArea.topRect !== null).assertTrue();
        expect(avoidArea.rightRect !== null).assertTrue();
        expect(avoidArea.bottomRect !== null).assertTrue();
        expect(avoidArea.leftRect !== null).assertTrue();
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0400
     * @tc.name      : testGetWindowAvoidAreaTypeKeyBoard
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('testGetWindowAvoidAreaTypeKeyBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      let caseName = 'TestGetWindowAvoidAreaTypeKeyBoard';
      try {
        let windowClass = windowStage.getMainWindowSync();
        let avoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_KEYBOARD);
        console.info(`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
        expect(avoidArea.visible).assertTrue();
        expect(avoidArea.topRect !== null).assertTrue();
        expect(avoidArea.rightRect !== null).assertTrue();
        expect(avoidArea.bottomRect !== null).assertTrue();
        expect(avoidArea.leftRect !== null).assertTrue();
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0500
     * @tc.name      : testGetWindowAvoidAreaTypeNavigationIndicator
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('testGetWindowAvoidAreaTypeNavigationIndicator', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      let caseName = 'TestGetWindowAvoidAreaTypeNavigationIndicator';
      try {
        let windowClass = windowStage.getMainWindowSync();
        let avoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR);
        console.info(`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
        expect(avoidArea.visible).assertTrue();
        expect(avoidArea.topRect !== null).assertTrue();
        expect(avoidArea.rightRect !== null).assertTrue();
        expect(avoidArea.bottomRect !== null).assertTrue();
        expect(avoidArea.leftRect !== null).assertTrue();
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0600
     * @tc.name      : testGetWindowAvoidAreaTypeSystemInLandScape
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('testGetWindowAvoidAreaTypeSystemInLandScape', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      let caseName = 'TestGetWindowAvoidAreaTypeSystemInLandScape';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE, () => {
          console.info(`${caseName} Succeeded in setting window orientation`);
          let avoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
          console.info(`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
          expect(avoidArea.visible).assertTrue();
          expect(avoidArea.topRect !== null).assertTrue();
          expect(avoidArea.rightRect !== null).assertTrue();
          expect(avoidArea.bottomRect !== null).assertTrue();
          expect(avoidArea.leftRect !== null).assertTrue();
          done();
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0700
     * @tc.name      : testGetWindowAvoidAreaTypeSystemInPortraitInverted
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('testGetWindowAvoidAreaTypeSystemInPortraitInverted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      let caseName = 'TestGetWindowAvoidAreaTypeSystemInPortraitInverted';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setPreferredOrientation(window.Orientation.PORTRAIT_INVERTED, () => {
          console.info(`${caseName} Succeeded in setting window orientation`);
          let avoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
          console.info(`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
          expect(avoidArea.visible).assertTrue();
          expect(avoidArea.topRect !== null).assertTrue();
          expect(avoidArea.rightRect !== null).assertTrue();
          expect(avoidArea.bottomRect !== null).assertTrue();
          expect(avoidArea.leftRect !== null).assertTrue();
          done();
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0800
     * @tc.name      : testGetWindowAvoidAreaTypeCutOutInPortraitInverted
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('testGetWindowAvoidAreaTypeCutOutInPortraitInverted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      let caseName = 'TestGetWindowAvoidAreaTypeCutOutInPortraitInverted';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setPreferredOrientation(window.Orientation.PORTRAIT_INVERTED, () => {
          console.info(`${caseName} Succeeded in setting window orientation`);
          let avoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_CUTOUT);
          console.info(`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
          expect(avoidArea.visible).assertFalse();
          expect(avoidArea.topRect !== null).assertTrue();
          expect(avoidArea.rightRect !== null).assertTrue();
          expect(avoidArea.bottomRect !== null).assertTrue();
          expect(avoidArea.leftRect !== null).assertTrue();
          done();
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0900
     * @tc.name      : testGetWindowAvoidAreaTypeSystemInLandScapeInverted
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('testGetWindowAvoidAreaTypeSystemInLandScapeInverted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      let caseName = 'TestGetWindowAvoidAreaTypeSystemInLandScapeInverted';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE_INVERTED, () => {
          console.info(`${caseName} Succeeded in setting window orientation`);
          let avoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
          console.info(`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
          expect(avoidArea.visible).assertTrue();
          expect(avoidArea.topRect !== null).assertTrue();
          expect(avoidArea.rightRect !== null).assertTrue();
          expect(avoidArea.bottomRect !== null).assertTrue();
          expect(avoidArea.leftRect !== null).assertTrue();
          done();
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1000
     * @tc.name      : testGetWindowAvoidAreaTypeCutOutInLandScapeInverted
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('testGetWindowAvoidAreaTypeCutOutInLandScapeInverted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      let caseName = 'TestGetWindowAvoidAreaTypeCutOutInLandScapeInverted';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE_INVERTED, () => {
          console.info(`${caseName} Succeeded in setting window orientation`);
          let avoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_CUTOUT);
          console.info(`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
          expect(avoidArea.visible).assertFalse();
          expect(avoidArea.topRect !== null).assertTrue();
          expect(avoidArea.rightRect !== null).assertTrue();
          expect(avoidArea.bottomRect !== null).assertTrue();
          expect(avoidArea.leftRect !== null).assertTrue();
          windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
          done();
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1100
     * @tc.name      : testGetAvoidAreaTypeSystem
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetAvoidAreaTypeSystem', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'TestGetAvoidAreaTypeSystem';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.getAvoidArea(window.AvoidAreaType.TYPE_SYSTEM).then((data) => {
          console.info(`${caseName} Succeeded in obtaining the area. Data: ${JSON.stringify(data)}`);
          let avoidArea = data;
          expect(avoidArea.visible).assertTrue();
          expect(avoidArea.topRect !== null).assertTrue();
          expect(avoidArea.rightRect !== null).assertTrue();
          expect(avoidArea.bottomRect !== null).assertTrue();
          expect(avoidArea.leftRect !== null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to obtain the area. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1200
     * @tc.name      : testGetAvoidAreaTypeCutOut
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetAvoidAreaTypeCutOut', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'TestGetAvoidAreaTypeCutOut';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.getAvoidArea(window.AvoidAreaType.TYPE_CUTOUT).then((data) => {
          console.info(`${caseName} Succeeded in obtaining the area. Data: ${JSON.stringify(data)}`);
          let avoidArea = data;
          expect(!avoidArea.visible).assertTrue();
          expect(avoidArea.topRect !== null).assertTrue();
          expect(avoidArea.rightRect !== null).assertTrue();
          expect(avoidArea.bottomRect !== null).assertTrue();
          expect(avoidArea.leftRect !== null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to obtain the area. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1300
     * @tc.name      : testGetAvoidAreaTypeSystemGesture
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetAvoidAreaTypeSystemGesture', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'TestGetAvoidAreaTypeSystemGesture';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.getAvoidArea(window.AvoidAreaType.TYPE_SYSTEM_GESTURE).then((data) => {
          console.info(`${caseName} Succeeded in obtaining the area. Data: ${JSON.stringify(data)}`);
          let avoidArea = data;
          expect(avoidArea.visible).assertTrue();
          expect(avoidArea.topRect !== null).assertTrue();
          expect(avoidArea.rightRect !== null).assertTrue();
          expect(avoidArea.bottomRect !== null).assertTrue();
          expect(avoidArea.leftRect !== null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to obtain the area. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1400
     * @tc.name      : testGetAvoidAreaTypeKeyBoard
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetAvoidAreaTypeKeyBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'TestGetAvoidAreaTypeKeyBoard';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.getAvoidArea(window.AvoidAreaType.TYPE_KEYBOARD).then((data) => {
          console.info(`${caseName} Succeeded in obtaining the area. Data: ${JSON.stringify(data)}`);
          let avoidArea = data;
          expect(avoidArea.visible).assertTrue();
          expect(avoidArea.topRect !== null).assertTrue();
          expect(avoidArea.rightRect !== null).assertTrue();
          expect(avoidArea.bottomRect !== null).assertTrue();
          expect(avoidArea.leftRect !== null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to obtain the area. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1500
     * @tc.name      : testGetAvoidAreaTypeNavigationIndicator
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetAvoidAreaTypeNavigationIndicator', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'TestGetAvoidAreaTypeNavigationIndicator';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.getAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR).then((data) => {
          console.info(`${caseName} Succeeded in obtaining the area. Data: ${JSON.stringify(data)}`);
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to obtain the area. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1003);
          done();
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1600
     * @tc.name      : testOnSystemAvoidAreaChange
     * @tc.desc      : listen system avoid area change
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testOnSystemAvoidAreaChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestOnSystemAvoidAreaChange';
      try {
        if((avoidArea1.topRect.width != 0 && avoidArea1.topRect.height != 0) && (isPCStatus == ''|| isPCStatus == '1')){
          let windowClass = windowStage.getMainWindowSync();
          windowClass.on('systemAvoidAreaChange', (data) => {
          console.info(`${caseName} Succeeded in enabling the listener for system avoid area changes. Data: ${JSON.stringify(data)}`);
          windowClass.off('systemAvoidAreaChange');
          done();
        });
        await windowClass.setWindowLayoutFullScreen(true);
        console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
        await windowClass.setWindowSystemBarEnable(['status']);
        console.info(`${caseName} Succeeded in setting the status bar to be visible.`);
        await sleep(1000);
        await windowClass.setWindowSystemBarEnable([]);
        console.info(`${caseName} Succeeded in setting the status bar to be invisible.`);
        await windowClass.setWindowLayoutFullScreen(false);
        }
        else{
          console.info(`${caseName} not support, isPCStatus: ${isPCStatus}`);
          done();
        }
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1700
     * @tc.name      : testOnRepeatSystemAvoidAreaChange
     * @tc.desc      : listen system avoid area change
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testOnRepeatSystemAvoidAreaChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestOnRepeatSystemAvoidAreaChange';
      try {
        if((avoidArea1.topRect.width != 0 && avoidArea1.topRect.height != 0) && (isPCStatus == ''|| isPCStatus == '1')){
          let windowClass = windowStage.getMainWindowSync();
          const callback1 = () => {
            console.info(`${caseName} callback1 Succeeded in enabling the listener for system avoid area changes.`);
            expect(false).assertTrue();
            done();
          };
          const callback2 = () => {
            console.info(`${caseName} callback2 Succeeded in enabling the listener for system avoid area changes.`);
            expect(true).assertTrue();
            windowClass.off('systemAvoidAreaChange', callback2);
            done();
          };
          windowClass.on('systemAvoidAreaChange', callback1);
          windowClass.on('systemAvoidAreaChange', callback2);
          windowClass.off('systemAvoidAreaChange', callback1);
          await windowClass.setWindowLayoutFullScreen(true);
          console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
          await windowClass.setWindowSystemBarEnable(['status']);
          console.info(`${caseName} Succeeded in setting the status bar to be visible.`);
          await sleep(1000);
          await windowClass.setWindowSystemBarEnable([]);
          console.info(`${caseName} Succeeded in setting the status bar to be invisible.`);
          await windowClass.setWindowLayoutFullScreen(false);
        }
        else{
          console.info(`${caseName} not support, isPCStatus: ${isPCStatus}`);
          done();
        }
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1800
     * @tc.name      : testOffRepeatSystemAvoidAreaChange
     * @tc.desc      : listen system avoid area change
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testOffRepeatSystemAvoidAreaChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestOffRepeatSystemAvoidAreaChange';
      try {
        let windowClass = windowStage.getMainWindowSync();
        let num = 0;
        const callback1 = () => {
          console.info(`${caseName} callback1 Succeeded in enabling the listener for system avoid area changes.`);
          num++;
        };
        const callback2 = () => {
          console.info(`${caseName} callback2 Succeeded in enabling the listener for system avoid area changes.`);
          num++;
        };
        windowClass.on('systemAvoidAreaChange', callback1);
        windowClass.on('systemAvoidAreaChange', callback2);
        windowClass.off("systemAvoidAreaChange");
        await windowClass.setWindowLayoutFullScreen(true);
        console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
        await windowClass.setWindowSystemBarEnable(['status']);
        console.info(`${caseName} Succeeded in setting the status bar to be visible.`);
        await sleep(1000);
        await windowClass.setWindowSystemBarEnable([]);
        console.info(`${caseName} Succeeded in setting the status bar to be invisible.`);
        console.info(`${caseName} listener for system avoid area changes num is: ${num}`);
        expect(num).assertEqual(0);
        await windowClass.setWindowLayoutFullScreen(false);
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1900
     * @tc.name      : testOnAvoidAreaChange
     * @tc.desc      : listen avoid area change
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testOnAvoidAreaChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestOnAvoidAreaChange';
      try {
        if((avoidArea1.topRect.width != 0 && avoidArea1.topRect.height != 0) && (isPCStatus == ''|| isPCStatus == '1')){
          let windowClass = windowStage.getMainWindowSync();
          windowClass.on('avoidAreaChange', (data) => {
          console.info(`${caseName} Succeeded in enabling the listener for avoid area changes. Data: ${JSON.stringify(data)}`);
          expect(data !== null).assertTrue();
          windowClass.off('avoidAreaChange');
          done();
        });
        await windowClass.setWindowLayoutFullScreen(true);
        console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
        await windowClass.setWindowSystemBarEnable(['status']);
        console.info(`${caseName} Succeeded in setting the status bar to be visible.`);
        await sleep(1000);
        await windowClass.setWindowSystemBarEnable([]);
        console.info(`${caseName} Succeeded in setting the status bar to be invisible.`);
        await windowClass.setWindowLayoutFullScreen(false);
        console.info(`${caseName} Succeeded in setting the setWindowLayoutFullScreen false.`);
        }
        else{
          console.info(`${caseName} not support, isPCStatus: ${isPCStatus}`);
          done();
        }
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2100
     * @tc.name      : testOffRepeatAvoidAreaChange
     * @tc.desc      : listen system avoid area change
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testOffRepeatAvoidAreaChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestOffRepeatAvoidAreaChange';
      try {
        let windowClass = windowStage.getMainWindowSync();
        let num = 0;
        windowClass.on('avoidAreaChange', (data) => {
          console.info(`${caseName} 1 Succeeded in enabling the listener for avoid area changes. Data: ${JSON.stringify(data)}`);
          num++;
        });
        windowClass.on('avoidAreaChange', (data) => {
          console.info(`${caseName} 2 Succeeded in enabling the listener for avoid area changes. Data: ${JSON.stringify(data)}`);
          num++;
        });
        windowClass.off("avoidAreaChange");
        await windowClass.setWindowLayoutFullScreen(true);
        console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
        await windowClass.setWindowSystemBarEnable(['status']);
        console.info(`${caseName} Succeeded in setting the status bar to be visible.`);
        console.info(`${caseName} listener for avoid area changes num is: ${num}`);
        expect(num).assertEqual(0);
        await windowClass.setWindowLayoutFullScreen(false);
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2200
     * @tc.name      : testSetWindowSystemBarEnableStatusInvisiblePromise
     * @tc.desc      : set window system bar isVisible
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowSystemBarEnableStatusInvisiblePromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestSetWindowSystemBarEnableStatusInvisiblePromise';
      try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setFullScreen(true);
        console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
        windowClass.on('avoidAreaChange', (data) => {
          console.info(`${caseName} Succeeded in enabling the listener for avoid area changes. type: ${JSON.stringify(data.type)} area: ${JSON.stringify(data.area)}`);
          windowClass.off('avoidAreaChange');
          done();
        });
        await windowClass.setWindowSystemBarEnable(['status', 'navigation']);
        console.info(`${caseName} Succeeded in setting the status bar to be visible.`);
        await sleep(1000);
        await windowClass.setWindowSystemBarEnable(['navigation']);
        console.info(`${caseName} Succeeded in setting the status bar to be invisible.`);
        await sleep(1000);
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2300
     * @tc.name      : testSetWindowSystemBarEnableStatusVisiblePromise
     * @tc.desc      : set window system bar isVisible
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowSystemBarEnableStatusVisiblePromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestSetWindowSystemBarEnableStatusVisiblePromise';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.on('avoidAreaChange', (data) => {
          console.info(`${caseName} Succeeded in enabling the listener for avoid area changes. type: ${JSON.stringify(data.type)} area: ${JSON.stringify(data.area)}`);
          windowClass.off('avoidAreaChange');
          done();
        });
        await windowClass.setFullScreen(true);
        console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
        await windowClass.setWindowSystemBarEnable(['navigation']);
        console.info(`${caseName} Succeeded in setting the status bar to be invisible.`);
        await sleep(1000);
        await windowClass.setWindowSystemBarEnable(['status','navigation']);
        console.info(`${caseName} Succeeded in setting the status bar to be visible.`);
        await sleep(1000);
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2400
     * @tc.name      : testSetWindowSystemBarEnableInVisiblePromise
     * @tc.desc      : set window system bar isVisible
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowSystemBarEnableInVisiblePromise',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestSetWindowSystemBarEnableInVisiblePromise';
      try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setFullScreen(true);
        console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
        await windowClass.setWindowSystemBarEnable(['status', 'navigation']);
        console.info(`${caseName} Succeeded in setting the system bar to be visible.`);
        windowClass.on('avoidAreaChange', (data) => {
          console.info(`${caseName} Succeeded in enabling the listener for system avoid area changes. type: ${JSON.stringify(data.type)} area: ${JSON.stringify(data.area)}`);
          windowClass.off('avoidAreaChange');
          done();
        });
        await sleep(1000);
        await windowClass.setWindowSystemBarEnable([]);
        console.info(`${caseName} Succeeded in setting the system bar to be invisible.`);
        await sleep(1000);
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2500
     * @tc.name      : testSetWindowSystemBarEnableStatusVisibleCallback
     * @tc.desc      : set window system bar isVisible
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowSystemBarEnableStatusVisibleCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestSetWindowSystemBarEnableStatusVisibleCallback';
      try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setFullScreen(true);
        console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
        windowClass.setWindowSystemBarEnable(['navigation'], (err: BusinessError) => {
          console.info(`${caseName} Succeeded in setting the status bar to be invisible.`);
        });
        await sleep(1000);
        windowClass.on('avoidAreaChange', (data) => {
          console.info(`${caseName} Succeeded in enabling the listener for avoid area changes. type: ${JSON.stringify(data.type)} area: ${JSON.stringify(data.area)}`);
          windowClass.off('avoidAreaChange');
          done();
        });
        windowClass.setWindowSystemBarEnable(['status', 'navigation'], (err: BusinessError) => {
          console.info(`${caseName} Succeeded in setting the status bar to be visible.`);
        });
        await sleep(1000);
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2600
     * @tc.name      : testSetWindowSystemBarEnableStatusInVisibleCallback
     * @tc.desc      : set window system bar isVisible
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowSystemBarEnableStatusInVisibleCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestSetWindowSystemBarEnableStatusInVisibleCallback';
      try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setFullScreen(true);
        console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
        windowClass.setWindowSystemBarEnable(['status', 'navigation'], (err: BusinessError) => {
          console.info(`${caseName} Succeeded in setting the status bar to be visible.`);
        });
        await sleep(1000);
        windowClass.on('avoidAreaChange', (data) => {
          console.info(`${caseName} Succeeded in enabling the listener for avoid area changes. type: ${JSON.stringify(data.type)} area: ${JSON.stringify(data.area)}`);
          windowClass.off('avoidAreaChange');
          done();
        });
        windowClass.setWindowSystemBarEnable(['navigation'], (err: BusinessError) => {
          console.info(`${caseName} Succeeded in setting the status bar to be invisible.`);
        });
        await sleep(1000);
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2700
     * @tc.name      : testSetSystemBarEnableStatusPromise
     * @tc.desc      : set system bar isVisible
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarEnableStatusPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestSetSystemBarEnableStatusPromise';
      try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setFullScreen(true);
        console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
        windowClass.setWindowSystemBarEnable(['status', 'navigation'], (err: BusinessError) => {
          console.info(`${caseName} Succeeded in setting the status bar to be visible.`);
        });
        await sleep(1000);
        windowClass.on('avoidAreaChange', (data) => {
          console.info(`${caseName} Succeeded in enabling the listener for avoid area changes. type: ${JSON.stringify(data.type)} area: ${JSON.stringify(data.area)}`);
          windowClass.off('avoidAreaChange');
          done();
        });
        windowClass.setWindowSystemBarEnable(['navigation'], (err: BusinessError) => {
          console.info(`${caseName} Succeeded in setting the status bar to be invisible.`);
        });
        await sleep(1000);
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2800
     * @tc.name      : testSetSystemBarEnablePromise
     * @tc.desc      : set system bar isVisible
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarEnablePromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestSetSystemBarEnablePromise';
      try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setFullScreen(true);
        console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
        windowClass.setWindowSystemBarEnable([], (err: BusinessError) => {
          console.info(`${caseName} Succeeded in setting the status bar to be invisible.`);
        });
        await sleep(1000);
        windowClass.on('avoidAreaChange', (data) => {
          console.info(`${caseName} Succeeded in enabling the listener for avoid area changes. type: ${JSON.stringify(data.type)} area: ${JSON.stringify(data.area)}`);
          windowClass.off('avoidAreaChange');
          done();
        });
        windowClass.setWindowSystemBarEnable(['status', 'navigation'], (err: BusinessError) => {
          console.info(`${caseName} Succeeded in setting the status bar to be visible.`);
        });
        await sleep(1000);
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2900
     * @tc.name      : testGetWindowSystemBarProperties
     * @tc.desc      : get window system bar properties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testGetWindowSystemBarProperties', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'TestGetWindowSystemBarProperties';
      try {
        let windowClass = windowStage.getMainWindowSync();
        let systemBarProperty = windowClass.getWindowSystemBarProperties();
        console.info(`${caseName} Success in obtaining system bar properties. Property: ` + JSON.stringify(systemBarProperty));
        expect(systemBarProperty !== null).assertTrue();
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3000
     * @tc.name      : testSetSystemBarPropertiesPromise
     * @tc.desc      : set window system bar properties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarPropertiesPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'TestSetSystemBarPropertiesPromise';
      try {
        let windowClass = windowStage.getMainWindowSync();
        let SystemBarProperties: window.SystemBarProperties = {
          statusBarColor: '#ff00ff',
          navigationBarColor: '#00ff00',
          statusBarContentColor: '#ffffff',
          navigationBarContentColor: '#00ffff'
        };
        windowClass.setSystemBarProperties(SystemBarProperties).then(() => {
          let systemBarProperty = windowClass.getWindowSystemBarProperties();
          console.info(`${caseName} Succeeded in setting the system bar properties. data: ${JSON.stringify(systemBarProperty)}`);
          expect(systemBarProperty.statusBarColor).assertEqual('#FFFF00FF');
          expect(systemBarProperty.navigationBarColor).assertEqual('#FF00FF00');
          expect(systemBarProperty.statusBarContentColor).assertEqual('#FFFFFFFF');
          expect(systemBarProperty.navigationBarContentColor).assertEqual('#FF00FFFF');
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to set the system bar properties. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3100
     * @tc.name      : testSetWindowSystemBarPropertiesCallback
     * @tc.desc      : set window system bar properties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowSystemBarPropertiesCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'TestSetWindowSystemBarPropertiesCallback';
      try {
        let windowClass = windowStage.getMainWindowSync();
        let SystemBarProperties: window.SystemBarProperties = {
          statusBarColor: '#ff00ff',
          navigationBarColor: '#00ff00',
          statusBarContentColor: '#ffffff',
          navigationBarContentColor: '#00ffff'
        };
        windowClass.setWindowSystemBarProperties(SystemBarProperties, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`${caseName}  Failed to set the system bar properties. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(`${caseName} Succeeded in setting the system bar properties.`);
            let systemBarProperty = windowClass.getWindowSystemBarProperties();
            expect(systemBarProperty.statusBarColor).assertEqual('#FFFF00FF');
            expect(systemBarProperty.navigationBarColor).assertEqual('#FF00FF00');
            expect(systemBarProperty.statusBarContentColor).assertEqual('#FFFFFFFF');
            expect(systemBarProperty.navigationBarContentColor).assertEqual('#FF00FFFF');
            done();
          }
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3200
     * @tc.name      : testSetWindowSystemBarPropertiesPromise
     * @tc.desc      : set window system bar properties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowSystemBarPropertiesPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'TestSetWindowSystemBarPropertiesPromise';
      try {
        let windowClass = windowStage.getMainWindowSync();
        let SystemBarProperties: window.SystemBarProperties = {
          statusBarColor: '#ff00ff',
          navigationBarColor: '#00ff00',
          statusBarContentColor: '#ffffff',
          navigationBarContentColor: '#00ffff'
        }
        windowClass.setWindowSystemBarProperties(SystemBarProperties).then(() => {
          console.info(`${caseName} Succeeded in setting the system bar properties.`);
          let systemBarProperty = windowClass.getWindowSystemBarProperties();
          expect(systemBarProperty.statusBarColor).assertEqual('#FFFF00FF');
          expect(systemBarProperty.navigationBarColor).assertEqual('#FF00FF00');
          expect(systemBarProperty.statusBarContentColor).assertEqual('#FFFFFFFF');
          expect(systemBarProperty.navigationBarContentColor).assertEqual('#FF00FFFF');
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName}  Failed to set the system bar properties. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3300
     * @tc.name      : testSetImmersive
     * @tc.desc      : set immersive
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetImmersive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestSetImmersive';
      let windowClass = windowStage.getMainWindowSync();
      try {
        if(isPCStatus == ''|| isAutoWindow =='false'){
        windowClass.setImmersiveModeEnabledState(false);
        let immersiveModeStateTrue: boolean = windowClass.getImmersiveModeEnabledState();
        console.info(`${caseName} Succeeded in setting the immersiveMode enabled false. Data: ${immersiveModeStateTrue}`);
        expect(immersiveModeStateTrue).assertFalse();
        await sleep(1000);
        windowClass.setImmersiveModeEnabledState(true);
        let immersiveModeStateFalse: boolean = windowClass.getImmersiveModeEnabledState();
        console.info(`${caseName} Succeeded in setting the immersiveMode enabled true. Data: ${immersiveModeStateFalse}`);
        expect(immersiveModeStateFalse).assertTrue();
        done();
        }else{
        await windowClass.maximize(window.MaximizePresentation.EXIT_IMMERSIVE);
        let immersiveModeStateTrue2: boolean = await windowClass.getImmersiveModeEnabledState();
        console.info(`${caseName} Succeeded in setting the maximize EXIT_IMMERSIVE enabled false. Data: ${immersiveModeStateTrue2}`);
        expect(immersiveModeStateTrue2).assertFalse();
        await sleep(1000);
        await windowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE);
        let immersiveModeStateFalse2: boolean = await windowClass.getImmersiveModeEnabledState();
        console.info(`${caseName} Succeeded in setting the maximize ENTER_IMMERSIVE enabled true. Data: ${immersiveModeStateFalse2}`);
        expect(immersiveModeStateFalse2).assertTrue();
        windowClass.recover();
        done();
        }
        
      } catch (exception) {
        console.error(`${caseName} Failed to obtain the main window. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3400
     * @tc.name      : testSetFullScreenInImmersiveMode
     * @tc.desc      : set immersive
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetFullScreenInImmersiveMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestSetFullScreenInImmersiveMode';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setWindowLayoutFullScreen(true).then(async () => {
          windowClass.setImmersiveModeEnabledState(true);
          let beforeImmersiveModeState: boolean = windowClass.getImmersiveModeEnabledState();
          console.info(`${caseName} Succeeded in setting the immersiveMode enabled true. Data: ${beforeImmersiveModeState}`);
          if(isPCStatus == ''|| isAutoWindow =='false'){
            expect(beforeImmersiveModeState).assertTrue();
            await sleep(1000);
            windowClass.setImmersiveModeEnabledState(false);
            let afterImmersiveModeState: boolean = windowClass.getImmersiveModeEnabledState();
            console.info(`${caseName} Succeeded in setting the immersiveMode enabled false. Data: ${afterImmersiveModeState}`);
            expect(afterImmersiveModeState).assertFalse();
            done();
          }else{
            expect(beforeImmersiveModeState).assertFalse();
            done();
          }
          
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to set the window layout to full-screen mode. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3500
     * @tc.name      : testSetMaximizeInImmersiveMode
     * @tc.desc      : set immersive
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetMaximizeInImmersiveMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestSetMaximizeInImmersiveMode';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.maximize().then(async () => {
          windowClass.setImmersiveModeEnabledState(true);
          let beforeImmersiveModeState: boolean = windowClass.getImmersiveModeEnabledState();
          console.info(`${caseName} Succeeded in setting the immersiveMode enabled true. Data: ${beforeImmersiveModeState}`);
            expect(beforeImmersiveModeState).assertTrue();
            await sleep(1000);
            windowClass.setImmersiveModeEnabledState(false);
            let afterImmersiveModeState: boolean = windowClass.getImmersiveModeEnabledState();
            console.info(`${caseName} Succeeded in setting the immersiveMode enabled false. Data: ${afterImmersiveModeState}`);
            if(isPCStatus == ''|| isAutoWindow =='false'){
            expect(afterImmersiveModeState).assertFalse();
            done();
          }else{
            expect(beforeImmersiveModeState).assertTrue();
            windowClass.recover();
            done();
          }
          
        }).catch((err: BusinessError) => {
          if(err.code == 801){
            console.info(`${caseName} The current device type does not support to maximize`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${caseName} Failed to set the window layout to maximize mode. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3600
     * @tc.name      : testSetLayoutFullScreenFalseCallback
     * @tc.desc      : set layout full screen false
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetLayoutFullScreenFalseCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestSetLayoutFullScreenFalseCallback';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setLayoutFullScreen(false, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`${caseName} Failed to set the window layout to full-screen mode. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
            let immersiveModeEnabledState = windowClass.getImmersiveModeEnabledState();
            console.info(`${caseName} layout full-screen mode is: ${immersiveModeEnabledState}`);
            expect(immersiveModeEnabledState).assertFalse();
            done();
          }
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3700
     * @tc.name      : testSetLayoutFullScreenTrueCallback
     * @tc.desc      : set layout full screen true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetLayoutFullScreenTrueCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestSetLayoutFullScreenTrueCallback';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setLayoutFullScreen(true, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`${caseName} Failed to set the window layout to full-screen mode. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
            let immersiveModeEnabledState = windowClass.getImmersiveModeEnabledState();
            console.info(`${caseName} layout full-screen mode is: ${immersiveModeEnabledState}`);
            expect(immersiveModeEnabledState).assertTrue();
            done();
          }
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3800
     * @tc.name      : testSetLayoutFullScreenFalsePromise
     * @tc.desc      : set layout full screen false
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetLayoutFullScreenFalsePromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestSetLayoutFullScreenFalsePromise';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setLayoutFullScreen(false).then(() => {
          console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
          let immersiveModeEnabledState = windowClass.getImmersiveModeEnabledState();
          console.info(`${caseName} layout full-screen mode is: ${immersiveModeEnabledState}`);
          expect(immersiveModeEnabledState).assertFalse();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to set the window layout to full-screen mode. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3900
     * @tc.name      : testSetLayoutFullScreenTruePromise
     * @tc.desc      : set layout full screen true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetLayoutFullScreenTruePromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestSetLayoutFullScreenTruePromise';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setLayoutFullScreen(true).then(() => {
          console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
          let immersiveModeEnabledState = windowClass.getImmersiveModeEnabledState();
          console.info(`${caseName} layout full-screen mode is: ${immersiveModeEnabledState}`);
          expect(immersiveModeEnabledState).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to set the window layout to full-screen mode. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4000
     * @tc.name      : testSetFullScreenFalseCallback
     * @tc.desc      : set full screen false
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetFullScreenFalseCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestSetFullScreenFalseCallback';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setFullScreen(false, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`${caseName} Failed to enable the full-screen mode. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(`${caseName} Succeeded in enabling the full-screen mode.`);
            let properties = windowClass.getWindowProperties();
            console.info(`${caseName} current window isFullScreen: ${properties.isFullScreen}`);
            expect(properties.isFullScreen).assertFalse();
            done();
          }
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4100
     * @tc.name      : testSetFullScreenTrueCallback
     * @tc.desc      : set full screen true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetFullScreenTrueCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestSetFullScreenTrueCallback';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setFullScreen(true, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`${caseName} Failed to enable the full-screen mode. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(`${caseName} Succeeded in enabling the full-screen mode.`);
            let properties = windowClass.getWindowProperties();
            console.info(`${caseName} current window isFullScreen: ${properties.isFullScreen}`);
            expect(properties.isFullScreen).assertTrue();
            done();
          }
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4200
     * @tc.name      : testSetFullScreenFalsePromise
     * @tc.desc      : set full screen false
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetFullScreenFalsePromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestSetFullScreenFalseCallback';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setFullScreen(false).then(() => {
          console.info(`${caseName} Succeeded in enabling the full-screen mode.`);
          let properties = windowClass.getWindowProperties();
          console.info(`${caseName} current window isFullScreen: ${properties.isFullScreen}`);
          expect(properties.isFullScreen).assertFalse();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to enable the full-screen mode. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4300
     * @tc.name      : testSetFullScreenTruePromise
     * @tc.desc      : set full screen true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetFullScreenTruePromise',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestSetFullScreenTruePromise';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setFullScreen(true).then(() => {
          console.info(`${caseName} Succeeded in enabling the full-screen mode.`);
          let properties = windowClass.getWindowProperties();
          console.info(`${caseName} current window isFullScreen: ${properties.isFullScreen}`);
          expect(properties.isFullScreen).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to enable the full-screen mode. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4400
     * @tc.name      : testSetSpecificSystemBarStatus
     * @tc.desc      : Test the function of setSpecificSystemBarEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSpecificSystemBarStatus',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestSetSpecificSystemBarStatus';
      try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setFullScreen(true);
        console.info(`${caseName} Succeeded in enabling the full-screen mode.`);
        windowClass.setSpecificSystemBarEnabled('status', false).then(async () => {
          console.log(`${caseName} Succeeded in setting the status bar to be invisible.`);
          await sleep(100);
          let avoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
          console.info(`${caseName} Get Window Avoid Area: ${JSON.stringify(avoidArea)}`);
          expect(avoidArea.bottomRect.height).assertEqual(0);
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} Failed to set the status bar to be invisible. Cause: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(`${caseName} Failed to set the system bar to be invisible. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4500
     * @tc.name      : test_set_WindowSystemBarProperties_statusBar
     * @tc.desc      : test_set_WindowSystemBarProperties_statusBar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_set_WindowSystemBarProperties_statusBar', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'test_set_WindowSystemBarProperties_statusBar';
      console.log(`${caseName} begin .`);
      try {
        let windowClass = windowStage.getMainWindowSync();
        let SystemBarProperties: window.SystemBarProperties = {
          statusBarColor: '#ff00ff',
          isStatusBarLightIcon: true,
          statusBarContentColor: '#00ff00',
          enableStatusBarAnimation:true
        };
        let promise = windowClass.setWindowSystemBarProperties(SystemBarProperties);
        promise.then(()=>{
          console.info(`${caseName} Succeeded in Succeeded in setting the system bar properties..`);
          expect(true).assertTrue();
        }).catch((err:BusinessError)=>{
          console.error(`${caseName} Failed to set the system bar properties. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        })
        let promise1 = windowClass.setSpecificSystemBarEnabled('status',true);
        promise1.then(()=>{
          console.info(`${caseName} Succeeded in setSpecificSystemBarEnabled status..`);
          expect(true).assertTrue();
        }).catch((err:BusinessError)=>{
          console.error(`${caseName} Failed to set the SpecificSystemBarEnabled status. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        })
        await  sleep(1000);
        let systemBarProperty = windowClass.getWindowSystemBarProperties();
        console.info(`${caseName} Success in obtaining system bar properties. Property:   ${JSON.stringify(systemBarProperty)}`);
        expect(systemBarProperty.statusBarColor).assertEqual('#FFFF00FF');
        expect(systemBarProperty.statusBarContentColor).assertEqual('#FF00FF00');
        expect(systemBarProperty.isStatusBarLightIcon).assertEqual(false);
        done();
      } catch (exception) {
        console.error(`${caseName} Failed to test_set_WindowSystemBarProperties_statusBar. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4600
     * @tc.name      : test_set_WindowSystemBarProperties_isStatusBarLightIcon
     * @tc.desc      : test_set_WindowSystemBarProperties_isStatusBarLightIcon
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_set_WindowSystemBarProperties_isStatusBarLightIcon', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'test_set_WindowSystemBarProperties_isStatusBarLightIcon';
      console.log(`${caseName} begin .`);
      try {
        let windowClass = windowStage.getMainWindowSync();
        let SystemBarProperties: window.SystemBarProperties = {
          isStatusBarLightIcon: true
        };
        let promise = windowClass.setWindowSystemBarProperties(SystemBarProperties);
        promise.then(()=>{
          console.info(`${caseName} Succeeded in Succeeded in setting the system bar properties..`);
          expect(true).assertTrue();
        }).catch((err:BusinessError)=>{
          console.error(`${caseName} Failed to set the system bar properties. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        })
        let promise1 = windowClass.setSpecificSystemBarEnabled('status',true);
        promise1.then(()=>{
          console.info(`${caseName} Succeeded in setSpecificSystemBarEnabled status..`);
          expect(true).assertTrue();
        }).catch((err:BusinessError)=>{
          console.error(`${caseName} Failed to set the SpecificSystemBarEnabled status. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        })
        await  sleep(1000);
        let systemBarProperty = windowClass.getWindowSystemBarProperties();
        console.info(`${caseName} Success in obtaining system bar properties. Property:   ${JSON.stringify(systemBarProperty)}`);
        expect(systemBarProperty.isStatusBarLightIcon).assertEqual(true);
        done();
      } catch (exception) {
        console.error(`${caseName} Failed to test_set_WindowSystemBarProperties_statusBar. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4700
     * @tc.name      : test_set_WindowSystemBarProperties_NavigationBar
     * @tc.desc      : test_set_WindowSystemBarProperties_NavigationBar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_set_WindowSystemBarProperties_NavigationBar', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'test_set_WindowSystemBarProperties_NavigationBar';
      console.log(`${caseName} begin .`);
      try {
        let windowClass = windowStage.getMainWindowSync();
        let SystemBarProperties: window.SystemBarProperties = {
          navigationBarColor: '#ff00ff',
          isNavigationBarLightIcon: true,
          navigationBarContentColor: '#00ff00',
          enableNavigationBarAnimation:true
        };
        let promise = windowClass.setWindowSystemBarProperties(SystemBarProperties);
        promise.then(()=>{
          console.info(`${caseName} Succeeded in Succeeded in setting the system bar properties..`);
          expect(true).assertTrue();
        }).catch((err:BusinessError)=>{
          console.error(`${caseName} Failed to set the system bar properties. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        })
        let promise1 = windowClass.setSpecificSystemBarEnabled('status',true);
        promise1.then(()=>{
          console.info(`${caseName} Succeeded in setSpecificSystemBarEnabled status..`);
          expect(true).assertTrue();
        }).catch((err:BusinessError)=>{
          console.error(`${caseName} Failed to set the SpecificSystemBarEnabled status. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        })
        await sleep(1000);
        let systemBarProperty = windowClass.getWindowSystemBarProperties();
        console.info(`${caseName} Success in obtaining system bar properties. Property:   ${JSON.stringify(systemBarProperty)}`);
        expect(systemBarProperty.navigationBarColor).assertEqual('#FFFF00FF');
        expect(systemBarProperty.navigationBarContentColor).assertEqual('#FF00FF00');
        expect(systemBarProperty.isNavigationBarLightIcon).assertEqual(false);
        done();
      } catch (exception) {
        console.error(`${caseName} Failed to test_set_WindowSystemBarProperties_statusBar. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4800
     * @tc.name      : test_set_WindowSystemBarProperties_isNavigationBarLightIcon
     * @tc.desc      : test_set_WindowSystemBarProperties_isNavigationBarLightIcon
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_set_WindowSystemBarProperties_isNavigationBarLightIcon', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'test_set_WindowSystemBarProperties_isNavigationBarLightIcon';
      console.log(`${caseName} begin .`);
      try {
        let windowClass = windowStage.getMainWindowSync();
        let SystemBarProperties: window.SystemBarProperties = {
          isNavigationBarLightIcon: true
        };
        let promise = windowClass.setWindowSystemBarProperties(SystemBarProperties);
        promise.then(()=>{
          console.info(`${caseName} Succeeded in Succeeded in setting the system bar properties..`);
          expect(true).assertTrue();
        }).catch((err:BusinessError)=>{
          console.error(`${caseName} Failed to set the system bar properties. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        })
        let promise1 = windowClass.setSpecificSystemBarEnabled('status',true);
        promise1.then(()=>{
          console.info(`${caseName} Succeeded in setSpecificSystemBarEnabled status..`);
          expect(true).assertTrue();
        }).catch((err:BusinessError)=>{
          console.error(`${caseName} Failed to set the SpecificSystemBarEnabled status. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        })
        await  sleep(1000);
        let systemBarProperty = windowClass.getWindowSystemBarProperties();
        console.info(`${caseName} Success in obtaining system bar properties. Property:   ${JSON.stringify(systemBarProperty)}`);
        expect(systemBarProperty.isNavigationBarLightIcon).assertEqual(true);
        done();
      } catch (exception) {
        console.error(`${caseName} Failed to test_set_WindowSystemBarProperties_statusBar. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_0400
     * @tc.name      testOnOff_WindowSizeChange_Callback
     * @tc.desc      To verify the function of enabling and disabling lawful interception in the system and window
     */
     it('testOnOff_WindowSizeChange_Callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = 'testOnOff_WindowSizeChange_Callback';
      console.log(msgStr + ' begin');
      let height:Number;
      let names: Array<'status' | 'navigation'> = ['status'];
      const systemAvoidAreaChangeCallback = (data:window.AvoidArea) => {
        console.log(msgStr +' :' + JSON.stringify(data));
            height = data.bottomRect.height;
      };
        if((avoidArea1.topRect.width != 0 && avoidArea1.topRect.height != 0)  && (isPCStatus == ''|| isPCStatus == '1')){
        windowStage.getMainWindow((err, data) => {
              if (err.code != 0) {
                  console.log(msgStr + ' getTopWindow callback fail ' + JSON.stringify(err.code));
                  expect().assertFail();
                  done();
              } else {
                expect(data != null).assertTrue();
                  let promise = data.setWindowSystemBarEnable(names);
                    promise.then(() => {
                    console.info(msgStr+ 'Succeeded in setting the system bar to be invisible.');
                    data.on('systemAvoidAreaChange', systemAvoidAreaChangeCallback);
                    data.setLayoutFullScreen(false, (err) => {
                      console.log(msgStr + ' setLayoutFullScreen(false) err info is ' + JSON.stringify(err));
                      data.setLayoutFullScreen(true, (err) => {
                          console.log(msgStr + ' setLayoutFullScreen(true) err info is ' + JSON.stringify(err));
                          data.setFullScreen(true, (err) => {
                              if (err.code != 0) {
                                  console.log(msgStr + ' setFullScreen callback fail ' + JSON.stringify(err));
                                  expect().assertFail();
                                  done();
                              } else {
                                  setTimeout((async  ()=> {
                                      expect(height == 0).assertTrue();
                                      data.off('systemAvoidAreaChange');
                                      data.setFullScreen(false, (err) => {
                                          if (err.code != 0) {
                                              console.log(msgStr + ' setLayoutFullScreen callback fail ' + JSON.stringify(err));
                                              expect().assertFail();
                                              done();
                                          } else {
                                              console.log(msgStr + ' off callback success');
                                              expect(height == 0).assertTrue();
                                              done();
                                          }
                                      })
                                  }), 3000)
                              }
                          })
                      })
                  })
                }).catch((err: BusinessError) => {
                  console.error(msgStr+`Failed to set the system bar to be invisible. Cause code: ${err.code}, message: ${err.message}`);
                  expect().assertFail();
                                              done();
                });
                  
              }
          })
      }
      else{
        console.info(`${msgStr} not support, isPCStatus: ${isPCStatus}`);
        done();
      }
    })
    
    /**
     * @tc.number    : SUB_BASIC_WMS_SET_SPECIFIC_SYSTEMBAR_ENABLE_0100
     * @tc.name      : test_setSpecificSystemBarEnabled_enableAnimation
     * @tc.desc      : test_setSpecificSystemBarEnabled_enableAnimation
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_setSpecificSystemBarEnabled_enableAnimation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'test_setSpecificSystemBarEnabled_enableAnimation';
      try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setFullScreen(true);
        console.info(`${caseName} Succeeded in enabling the full-screen mode.`);
        windowClass.setSpecificSystemBarEnabled('status', false, true).then(async () => {
          console.log(`${caseName} Succeeded in setting the status bar to be invisible.`);
          done();
        }).catch((error: BusinessError) => {
          console.log(`${caseName} Failed to set the status bar to be invisible. Cause: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
        windowClass.setSpecificSystemBarEnabled('status', true, false).then(async () => {
          console.log(`${caseName} Succeeded in setting the status bar to be visible.`);
          done();
        }).catch((error: BusinessError) => {
          console.log(`${caseName} Failed to set the status bar to be visible. Cause: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(`${caseName} Failed to set setSpecificSystemBarEnabled. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_BASIC_WMS_setSystemAvoidAreaEnabled_ErrorCode_0100
     * @tc.name       : test_setSystemAvoidAreaEnabled_ErrorCode_401
     * @tc.desc       : setSystemAvoidAreaEnabled接口验证401
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_setSystemAvoidAreaEnabled_ErrorCode_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_setSystemAvoidAreaEnabled_ErrorCode_401!'
      let config: window.Configuration = {
        name: message,
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      }
      try {
        let promise = window.createWindow(config)
        promise.then(async (data) => {
          console.info(`${message} succeed createWindow`);
          let dialogWindowClass = data;
          await data.setUIContent("testability/pages/First/index2");
          await sleep(1000)
          await data.showWindow();
          await sleep(1000)
          try {
            let promise1 = dialogWindowClass.setSystemAvoidAreaEnabled(null);
            promise1.then(async () => {
              console.info(`${message} succeed setSystemAvoidAreaEnabled`);
              await dialogWindowClass?.destroyWindow();
              await sleep(1000);
              expect().assertFail();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(`${message} promise promise Failed to setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
              await dialogWindowClass?.destroyWindow();
              await sleep(1000);
              expect(err.code).assertEqual(801);
              done();
            })
          }catch (err) {
            console.error(`${message} Failed to setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
            await dialogWindowClass?.destroyWindow();
            await sleep(1000);
            expect(err.code).assertEqual(401);
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to createWindow, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        })
      } catch (err) {
        console.error(`${message} Failed to test setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_setSystemAvoidAreaEnabled_ErrorCode_0200
     * @tc.name       : test_setSystemAvoidAreaEnabled_ErrorCode_801
     * @tc.desc       : setSystemAvoidAreaEnabled接口验证801
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_setSystemAvoidAreaEnabled_ErrorCode_801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_setSystemAvoidAreaEnabled_ErrorCode_801!'
      let config: window.Configuration = {
        name: message,
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      }
      try {
        let promise = window.createWindow(config)
        promise.then(async (data) => {
          console.info(`${message} succeed createWindow`);
          let dialogWindowClass = data;
          await data.setUIContent('testability/pages/First/index2')
          await sleep(1000)
          await data.showWindow();
          await sleep(1000)
          try {
            let promise1 = dialogWindowClass.setSystemAvoidAreaEnabled(true);
            promise1.then(async () => {
              console.info(`${message} succeed setSystemAvoidAreaEnabled`);
              await dialogWindowClass?.destroyWindow();
              await sleep(1000);
              expect(true).assertTrue();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(`${message} promise promise Failed to setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
              await dialogWindowClass?.destroyWindow();
              await sleep(1000);
              expect(err.code).assertEqual(801);
              done();
            })
          }catch (err) {
            console.error(`${message} Failed to setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
            await dialogWindowClass?.destroyWindow();
            await sleep(1000);
            expect().assertFail();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to createWindow, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        })
      } catch (err) {
        console.error(`${message} Failed to test setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_setSystemAvoidAreaEnabled_ErrorCode_0300
     * @tc.name       : test_setSystemAvoidAreaEnabled_ErrorCode_1300002
     * @tc.desc       : setSystemAvoidAreaEnabled接口验证1300002
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_setSystemAvoidAreaEnabled_ErrorCode_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_setSystemAvoidAreaEnabled_ErrorCode_1300002!'
      let config: window.Configuration = {
        name: message,
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      }
      try {
        let promise = window.createWindow(config)
        promise.then(async (data) => {
          console.info(`${message} succeed createWindow`);
          let dialogWindowClass = data;
          await dialogWindowClass.setUIContent('testability/pages/First/index2')
          await sleep(1000)
          await dialogWindowClass.showWindow();
          await sleep(1000)
          await dialogWindowClass?.destroyWindow();
          await sleep(1000);
          try {
            let promise1 = dialogWindowClass.setSystemAvoidAreaEnabled(true);
            promise1.then(async () => {
              console.info(`${message} succeed setSystemAvoidAreaEnabled`);
              expect().assertFail();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(`${message} promise promise Failed to setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
              expect(err.code == 801 || err.code ==1300002).assertTrue();
              done();
            })
          }catch (err) {
            console.error(`${message} Failed to setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
            expect().assertFail();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to createWindow, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        })
      } catch (err) {
        console.error(`${message} Failed to test setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_setSystemAvoidAreaEnabled_ErrorCode_0400
     * @tc.name       : test_setSystemAvoidAreaEnabled_ErrorCode_1300004
     * @tc.desc       : setSystemAvoidAreaEnabled接口验证1300004
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_setSystemAvoidAreaEnabled_ErrorCode_1300004',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_setSystemAvoidAreaEnabled_ErrorCode_1300004!'
      try {
        let promise = windowStage.createSubWindow(message)
        promise.then(async (data) => {
          console.info(`${message} succeed createWindow`);
          let subWindowClass = data;
          await subWindowClass.setUIContent('testability/pages/First/index2')
          await sleep(1000)
          await subWindowClass.showWindow();
          await sleep(1000)
          try {
            let promise1 = subWindowClass.setSystemAvoidAreaEnabled(true);
            promise1.then(async () => {
              console.info(`${message} succeed setSystemAvoidAreaEnabled`);
              await subWindowClass?.destroyWindow();
              await sleep(1000);
              expect().assertFail();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(`${message} promise promise Failed to setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
              await subWindowClass?.destroyWindow();
              await sleep(1000);
              expect(err.code == 801 || err.code ==1300004).assertTrue();
              done();
            })
          }catch (err) {
            console.error(`${message} Failed to setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
            await subWindowClass?.destroyWindow();
            await sleep(1000);
            expect().assertFail();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to createWindow, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        })
      } catch (err) {
        console.error(`${message} Failed to test setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_setSystemAvoidAreaEnabled_0100
     * @tc.name       : test_setSystemAvoidAreaEnabled_dialog
     * @tc.desc       : dialog调用setSystemAvoidAreaEnabled接口
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_setSystemAvoidAreaEnabled_dialog', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_setSystemAvoidAreaEnabled_dialog!'
      let config: window.Configuration = {
        name: message,
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      }
      try {
        let promise = window.createWindow(config)
        promise.then(async (data) => {
          console.info(`${message} succeed createWindow`);
          let dialogWindowClass = data;
          await dialogWindowClass.setUIContent('testability/pages/First/index2')
          await sleep(1000)
          await dialogWindowClass.showWindow();
          await sleep(1000)
          try {
            expect(dialogWindowClass.isSystemAvoidAreaEnabled()).assertEqual(false)
            let promise1 = dialogWindowClass.setSystemAvoidAreaEnabled(true);
            promise1.then(async () => {
              console.info(`${message} succeed setSystemAvoidAreaEnabled`);
              expect(dialogWindowClass.isSystemAvoidAreaEnabled()).assertEqual(true);
              await dialogWindowClass?.destroyWindow();
              await sleep(1000);
              expect(true).assertTrue();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(`${message} promise promise Failed to setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
              await dialogWindowClass?.destroyWindow();
              await sleep(1000);
              expect(err.code).assertEqual(801);
              done();
            })
          }catch (err) {
            console.error(`${message} Failed to setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
            await dialogWindowClass?.destroyWindow();
            await sleep(1000);
            expect(err.code).assertEqual(801);
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to createWindow, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        })
      } catch (err) {
        console.error(`${message} Failed to test setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_isSystemAvoidAreaEnabled_ErrorCode_0100
     * @tc.name       : test_isSystemAvoidAreaEnabled_801
     * @tc.desc       : isSystemAvoidAreaEnabled接口验证801
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_isSystemAvoidAreaEnabled_801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_isSystemAvoidAreaEnabled_801!'
      let config: window.Configuration = {
        name: message,
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      }
      try {
        let promise = window.createWindow(config)
        promise.then(async (data) => {
          console.info(`${message} succeed createWindow`);
          let dialogWindowClass = data;
          await dialogWindowClass.setUIContent('testability/pages/First/index2')
          await sleep(1000)
          await dialogWindowClass.showWindow();
          await sleep(1000)
          try {
            expect(dialogWindowClass.isSystemAvoidAreaEnabled()).assertEqual(false)
            await dialogWindowClass?.destroyWindow();
            await sleep(1000);
            done();
          }catch (err) {
            console.error(`${message} Failed to assert isSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
            await dialogWindowClass?.destroyWindow();
            await sleep(1000);
            expect(err.code).assertEqual(801);
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to createWindow, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        })
      } catch (err) {
        console.error(`${message} Failed to test isSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_isSystemAvoidAreaEnabled_ErrorCode_0200
     * @tc.name       : test_isSystemAvoidAreaEnabled_1300004
     * @tc.desc       : isSystemAvoidAreaEnabled接口验证1300004
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_isSystemAvoidAreaEnabled_1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_isSystemAvoidAreaEnabled_1300004!'
      try {
        let promise = windowStage.createSubWindow(message)
        promise.then(async (data) => {
          console.info(`${message} succeed createWindow`);
          let dialogWindowClass = data;
          await dialogWindowClass.setUIContent('testability/pages/First/index2')
          await sleep(1000)
          await dialogWindowClass.showWindow();
          await sleep(1000)
          try {
            dialogWindowClass.isSystemAvoidAreaEnabled()
            console.info(`${message} succeed assert isSystemAvoidAreaEnabled`);
            await dialogWindowClass?.destroyWindow();
            await sleep(1000);
            expect().assertFail();
            done();
          }catch (err) {
            console.error(`${message} Failed to assert isSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
            await dialogWindowClass?.destroyWindow();
            console.info(`${message} after destroyWindow`);
            await sleep(1000);
            expect(err.code == 801 || err.code ==1300004).assertTrue();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to createWindow, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        })
      } catch (err) {
        console.error(`${message} Failed to test isSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_isSystemAvoidAreaEnabled_ErrorCode_0300
     * @tc.name       : test_isSystemAvoidAreaEnabled_1300002
     * @tc.desc       : isSystemAvoidAreaEnabled接口验证1300002
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_isSystemAvoidAreaEnabled_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_isSystemAvoidAreaEnabled_1300002!'
      let config: window.Configuration = {
        name: message,
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      }
      try {
        let promise = window.createWindow(config)
        promise.then(async (data) => {
          console.info(`${message} succeed createWindow`);
          let dialogWindowClass = data;
          await dialogWindowClass.setUIContent("testability/pages/First/index2")
          await dialogWindowClass.showWindow();
          await sleep(1000);
          await dialogWindowClass?.destroyWindow();
          await sleep(1000);
          try {
            dialogWindowClass.isSystemAvoidAreaEnabled();
            console.info(`${message} succeed assert isSystemAvoidAreaEnabled`);
            expect().assertFail();
            done();
          }catch (err) {
            console.error(`${message} Failed to assert isSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
            expect(err.code == 801 || err.code ==1300002).assertTrue();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to createWindow, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        })
      } catch (err) {
        console.error(`${message} Failed to test isSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0200
     * @tc.name      : testIsImmersiveLayoutwithSubWindowDefaultState
     * @tc.desc      : 验证子窗创建后默认为沉浸式状态
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testIsImmersiveLayoutwithSubWindowDefaultState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testIsImmersiveLayoutwithSubWindowDefaultState';
      let windowClass = await windowStage.createSubWindow('testIsImmersiveLayoutwithSubWindowDefaultState')
      await windowClass.setUIContent('testability/pages/Index1');
      await windowClass.showWindow();
      await sleep(300);
      try {
        let res = windowClass.isImmersiveLayout();
        console.log(`${caseName} isImmersiveLayout: ${res}.`);
        expect(res).assertEqual(true);
        await windowClass.destroyWindow();
        done();
      } catch (exception) {
        console.error(`${caseName} Failed. Cause code: ${exception.code}, message: ${exception.message}`);
        await windowClass.destroyWindow();
        if (exception.code === 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0300
     * @tc.name      : testIsImmersiveLayoutwithFloatWindowDefaultState
     * @tc.desc      : 验证悬浮窗创建后默认为非沉浸式状态
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('testIsImmersiveLayoutwithFloatWindowDefaultState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'testIsImmersiveLayoutwithFloatWindowDefaultState';
      let config: window.Configuration = {
        name: "testIsImmersiveLayoutwithFloatWindowDefaultState",
        windowType: window.WindowType.TYPE_FLOAT,
        ctx: context
      };
      let subWindowClass: window.Window | undefined;
      console.info(`${caseName} Succeeded in creating the float window.`);
      try {
        window.createWindow(config).then(async (data) => {
          subWindowClass = data;
          let res = subWindowClass.isImmersiveLayout();
          console.log(`${caseName} isImmersiveLayout: ${res}.`);
          expect(res).assertEqual(false);
          await subWindowClass?.destroyWindow();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} Failed. Cause code: ${err.code}, message: ${err.message}`);
          await subWindowClass?.destroyWindow();
          if (err.code === 801 || err.code === 1300002) {
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (e) {
        console.error(`${caseName} Failed2. Cause: ${JSON.stringify(e)}`);
        expect().assertFail();
        await subWindowClass?.destroyWindow();
        done()
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0400
     * @tc.name      : testIsImmersiveLayoutwithDialogWindowDefaultState
     * @tc.desc      : 验证dialog窗创建后默认为非沉浸式状态
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('testIsImmersiveLayoutwithDialogWindowDefaultState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'testIsImmersiveLayoutwithDialogWindowDefaultState';
      let config: window.Configuration = {
        name: "testIsImmersiveLayoutwithDialogWindowDefaultState",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
        decorEnabled:true
      };
      let subWindowClass: window.Window | undefined;
      console.info(`${caseName} Succeeded in creating the float window.`);
      try {
        window.createWindow(config).then(async (data) => {
          subWindowClass = data;
          await subWindowClass.setUIContent('testability/pages/Index1');
          await subWindowClass.showWindow();
          await sleep(300);
          let res = subWindowClass.isImmersiveLayout();
          console.log(`${caseName} isImmersiveLayout: ${res}.`);
          expect(res).assertEqual(false);
          await subWindowClass?.destroyWindow();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} Failed. Cause code: ${err.code}, message: ${err.message}`);
          await subWindowClass?.destroyWindow();
          if (err.code === 801) {
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (e) {
        console.error(`${caseName} Failed2. Cause: ${JSON.stringify(e)}`);
        expect().assertFail();
        await subWindowClass?.destroyWindow();
        done()
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0500
     * @tc.name      : testIsImmersiveLayoutwithImmersiveMode
     * @tc.desc      : 验证非2in1设备setImmersiveModeEnabledState后IsImmersiveLayout
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testIsImmersiveLayoutwithImmersiveMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testIsImmersiveLayoutwithImmersiveMode';
      try {
        if (isPCStatus == '') {
          let windowClass = windowStage.getMainWindowSync();
          windowClass.setImmersiveModeEnabledState(true);
          let res = windowClass.isImmersiveLayout();
          console.log(`${caseName} isImmersiveLayout 1: ${res}.`);
          expect(res).assertEqual(true);
          windowClass.setImmersiveModeEnabledState(false);
          let res2 = windowClass.isImmersiveLayout();
          console.log(`${caseName} isImmersiveLayout 2: ${res2}.`);
          expect(res2).assertEqual(false);
          done();
        } else {
          done();
        }
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        if (e.code === 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0600
     * @tc.name      : testIsImmersiveLayoutwithWindowLayoutFullScreen
     * @tc.desc      : 验证非2in1setWindowLayoutFullScreen后IsImmersiveLayout
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testIsImmersiveLayoutwithWindowLayoutFullScreen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testIsImmersiveLayoutwithWindowLayoutFullScreen';
      try {
        if (isPCStatus == '') {
          let windowClass = windowStage.getMainWindowSync();
          await windowClass.setWindowLayoutFullScreen(true);
          await sleep(200);
          let res = windowClass.isImmersiveLayout();
          console.log(`${caseName} isImmersiveLayout 1: ${res}.`);
          expect(res).assertEqual(true);
          await windowClass.setWindowLayoutFullScreen(false);
          await sleep(200);
          let res2 = windowClass.isImmersiveLayout();
          console.log(`${caseName} isImmersiveLayout 2: ${res2}.`);
          expect(res2).assertEqual(false);
          done();
        } else {
          done();
        }
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        if (e.code === 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    // it('testIsImmersiveLayoutwithMiniMize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
    //   let caseName = 'testIsImmersiveLayoutwithMiniMize';
    //   // 1、拉起另一个Abllity主窗
    //   let windowStageStart = await startAbility(caseName, context);
    //   let windowClassTest = windowStageStart.getMainWindowSync();
    //   try {
    //     await windowClassTest.minimize();
    //     await sleep(200);
    //     let res = windowClassTest.isImmersiveLayout();
    //     console.log(`${caseName} isImmersiveLayout: ${res}.`);
    //     expect(res).assertEqual(false);
    //     await terminateAbility(caseName);
    //     await sleep(200)
    //     done();
    //   } catch (e) {
    //     console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
    //     await terminateAbility(caseName);
    //     if (e.code === 801) {
    //       done();
    //     } else {
    //       expect().assertFail();
    //       done();
    //     }
    //   }
    // });

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0800
     * @tc.name      : testIsImmersiveLayoutwithDestroySubWindow
     * @tc.desc      : 验证销毁后调用IsImmersiveLayout
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('testIsImmersiveLayoutwithDestroySubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'testIsImmersiveLayoutwithDestroySubWindow';
      let windowClass = await windowStage.createSubWindow('testIsImmersiveLayoutwithDestroySubWindow');
      await windowClass.destroyWindow();
      try {
        let res = windowClass.isImmersiveLayout();
        console.log(`${caseName} isImmersiveLayout: ${res}.`);
        expect().assertFail();
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(1300002);
        done()
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_1100
     * @tc.name      : testIsImmersiveLayoutwithDisableWindowDecor
     * @tc.desc      : 验证2in1设备和pad自由多窗下，子窗创建标题栏装饰后调用IsImmersiveLayout
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testIsImmersiveLayoutwithDisableWindowDecor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testIsImmersiveLayoutwithDisableWindowDecor';
      let windowClass: window.Window | undefined;
      try {
        let options: window.SubWindowOptions = {
          title: 'subWindow',
          decorEnabled: true
        }
        console.log(caseName + 'start run')
        windowStage.createSubWindowWithOptions('testIsImmersiveLayoutwithDisableWindowDecor', options).then(async (subWindowClass) => {
          windowClass = subWindowClass;
          await windowClass.setUIContent('testability/pages/Index1');
          await sleep(200);
          await windowClass.showWindow()
          await sleep(200);
          let res = windowClass.isImmersiveLayout();
          console.log(`${caseName} isImmersiveLayout: ${res}.`);
          await windowClass.destroyWindow();
          if (isPCStatus != '' || isAutoWindow == 'true') {
            expect(res).assertEqual(false);
          } else {
            expect(res).assertEqual(true);
          }
          done();
        }).catch((error: BusinessError) => {
          console.log(caseName + 'Failed to create the subwindow. Cause: ' + JSON.stringify(error));
          if (error.code == 1300002) {
            console.log(caseName + 'device not support')
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(err)}`);
        await windowClass?.destroyWindow();
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done()
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_1200
     * @tc.name      : testIsImmersiveLayoutwithDisableWindowDecor2
     * @tc.desc      : 验证2in1设备和pad自由多窗下，子窗创建无标题栏装饰后调用IsImmersiveLayout
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testIsImmersiveLayoutwithDisableWindowDecor2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testIsImmersiveLayoutwithDisableWindowDecor2';
      let windowClass: window.Window | undefined;
      try {
        let options: window.SubWindowOptions = {
          title: 'subWindow2',
          decorEnabled: false
        }
        console.log(caseName + 'start run')
        windowStage.createSubWindowWithOptions('testIsImmersiveLayoutwithDisableWindowDecor2', options).then(async (subWindowClass) => {
          windowClass = subWindowClass;
          await windowClass.setUIContent('testability/pages/Index1');
          await sleep(200);
          await windowClass.showWindow()
          await sleep(200);
          let res = windowClass.isImmersiveLayout();
          console.log(`${caseName} isImmersiveLayout: ${res}.`);
          await windowClass.destroyWindow();
          expect(res).assertEqual(true);
          done();
        }).catch((error: BusinessError) => {
          console.log(caseName + 'Failed to create the subwindow. Cause: ' + JSON.stringify(error));
          if (error.code == 1300002) {
            console.log(caseName + 'device not support')
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(err)}`);
        await windowClass?.destroyWindow();
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done()
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_1300
     * @tc.name      : testIsImmersiveLayoutwithImmersiveMode2
     * @tc.desc      : 验证非2in1设备和pad自由多窗下，子窗setImmersiveModeEnabledState后IsImmersiveLayout
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('testIsImmersiveLayoutwithImmersiveMode2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'testIsImmersiveLayoutwithImmersiveMode2';
      let windowClass = await windowStage.createSubWindow('testIsImmersiveLayoutwithImmersiveMode2')
      await windowClass.setUIContent('testability/pages/First/index2');
      await windowClass.showWindow();
      await sleep(1000);
      try {
        if (isPCStatus != '' || isAutoWindow == 'true') {
          console.log(`${caseName} isPCStatus: ${isPCStatus}.`);
          windowClass.setImmersiveModeEnabledState(true);
          let res = windowClass.isImmersiveLayout();
          console.log(`${caseName} isImmersiveLayout 1: ${res}.`);
          expect(res).assertEqual(true);
          await sleep(1000);
          windowClass.setImmersiveModeEnabledState(false);
          let res2 = windowClass.isImmersiveLayout();
          console.log(`${caseName} isImmersiveLayout 2: ${res2}.`);
          expect(res2).assertEqual(true);
          await windowClass.destroyWindow();
          done();
        }else{
          windowClass.setImmersiveModeEnabledState(true);
          let res = windowClass.isImmersiveLayout();
          console.log(`${caseName} isImmersiveLayout 1: ${res}.`);
          expect(res).assertEqual(true);
          await sleep(1000);
          windowClass.setImmersiveModeEnabledState(false);
          let res2 = windowClass.isImmersiveLayout();
          console.log(`${caseName} isImmersiveLayout 2: ${res2}.`);
          expect(res2).assertEqual(false);
          await windowClass.destroyWindow();
          done();
        }

      } catch (err) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(err)}`);
        await windowClass.destroyWindow();
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done()
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_1400
     * @tc.name      : testIsImmersiveLayoutwithWindowLayoutFullScreen2
     * @tc.desc      : 验证非2in1设备和pad自由多窗下，子窗setWindowLayoutFullScreen后IsImmersiveLayout
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('testIsImmersiveLayoutwithWindowLayoutFullScreen2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'testIsImmersiveLayoutwithWindowLayoutFullScreen2';
      let options : window.SubWindowOptions = {
        title: 'testIsImmersiveLayoutwithWindowLayoutFullScreen2',
        decorEnabled: true,
      };
      let promise = windowStage.createSubWindowWithOptions('testIsImmersiveLayoutwithWindowLayoutFullScreen2', options);
      promise.then(async (data) => {
        let windowClass = data;
        console.info(caseName+ ' Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
        await windowClass.setUIContent('testability/pages/First/index2');
        await windowClass.showWindow();
        await sleep(1000);
        try {
          if (isPCStatus != '' || isAutoWindow == 'true') {
            await windowClass.setWindowLayoutFullScreen(true);
            let res = windowClass.isImmersiveLayout();
            console.log(`${caseName} isImmersiveLayout 1: ${res}.`);
            expect(res).assertEqual(false);
            await sleep(1000);
            await windowClass.setWindowLayoutFullScreen(false);
            let res2 = windowClass.isImmersiveLayout();
            console.log(`${caseName} isImmersiveLayout 2: ${res2}.`);
            expect(res2).assertEqual(false);
            await windowClass.destroyWindow();
            done();
          }else{
            await windowClass.setWindowLayoutFullScreen(true);
            let res = windowClass.isImmersiveLayout();
            console.log(`${caseName} isImmersiveLayout 1: ${res}.`);
            expect(res).assertEqual(true);
            await sleep(1000);
            await windowClass.setWindowLayoutFullScreen(false);
            let res2 = windowClass.isImmersiveLayout();
            console.log(`${caseName} isImmersiveLayout 2: ${res2}.`);
            expect(res2).assertEqual(false);
            await windowClass.destroyWindow();
            done();
          }

        } catch (err) {
          console.error(`${caseName} Failed. Cause: ${JSON.stringify(err)}`);
          await windowClass.destroyWindow();
          if (err.code === 801) {
            done()
          } else {
            expect().assertFail();
            done()
          }
        }
      }).catch(async (err: BusinessError) => {
        console.error(`${caseName} :Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
        if (err.code === 1300002) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      });
    });


    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0200
     * @tc.name      : testIsImmersiveLayoutwithSubWindowDefaultState
     * @tc.desc      : 验证子窗创建后默认为沉浸式状态
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testIsImmersiveLayoutwithSubWindowDefaultState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testIsImmersiveLayoutwithSubWindowDefaultState';
      let windowClass = await windowStage.createSubWindow('testIsImmersiveLayoutwithSubWindowDefaultState')
      await windowClass.setUIContent('testability/pages/Index1');
      await windowClass.showWindow();
      await sleep(300);
      try {
        let res = windowClass.isImmersiveLayout();
        console.log(`${caseName} isImmersiveLayout: ${res}.`);
        expect(res).assertEqual(true);
        await windowClass.destroyWindow();
        done();
      } catch (exception) {
        console.error(`${caseName} Failed. Cause code: ${exception.code}, message: ${exception.message}`);
        await windowClass.destroyWindow();
        if (exception.code === 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0300
     * @tc.name      : testIsImmersiveLayoutwithFloatWindowDefaultState
     * @tc.desc      : 验证悬浮窗创建后默认为非沉浸式状态
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('testIsImmersiveLayoutwithFloatWindowDefaultState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'testIsImmersiveLayoutwithFloatWindowDefaultState';
      let config: window.Configuration = {
        name: "testIsImmersiveLayoutwithFloatWindowDefaultState",
        windowType: window.WindowType.TYPE_FLOAT,
        ctx: context
      };
      let subWindowClass: window.Window | undefined;
      console.info(`${caseName} Succeeded in creating the float window.`);
      try {
        window.createWindow(config).then(async (data) => {
          subWindowClass = data;
          let res = subWindowClass.isImmersiveLayout();
          console.log(`${caseName} isImmersiveLayout: ${res}.`);
          expect(res).assertEqual(false);
          await subWindowClass?.destroyWindow();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} Failed. Cause code: ${err.code}, message: ${err.message}`);
          await subWindowClass?.destroyWindow();
          if (err.code === 801 || err.code === 1300002) {
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (e) {
        console.error(`${caseName} Failed2. Cause: ${JSON.stringify(e)}`);
        expect().assertFail();
        await subWindowClass?.destroyWindow();
        done()
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0400
     * @tc.name      : testIsImmersiveLayoutwithDialogWindowDefaultState
     * @tc.desc      : 验证dialog窗创建后默认为非沉浸式状态
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('testIsImmersiveLayoutwithDialogWindowDefaultState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'testIsImmersiveLayoutwithDialogWindowDefaultState';
      let config: window.Configuration = {
        name: "testIsImmersiveLayoutwithDialogWindowDefaultState",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
        decorEnabled:true
      };
      let subWindowClass: window.Window | undefined;
      console.info(`${caseName} Succeeded in creating the float window.`);
      try {
        window.createWindow(config).then(async (data) => {
          subWindowClass = data;
          await subWindowClass.setUIContent('testability/pages/Index1');
          await subWindowClass.showWindow();
          await sleep(300);
          let res = subWindowClass.isImmersiveLayout();
          console.log(`${caseName} isImmersiveLayout: ${res}.`);
          expect(res).assertEqual(false);
          await subWindowClass?.destroyWindow();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} Failed. Cause code: ${err.code}, message: ${err.message}`);
          await subWindowClass?.destroyWindow();
          if (err.code === 801) {
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (e) {
        console.error(`${caseName} Failed2. Cause: ${JSON.stringify(e)}`);
        expect().assertFail();
        await subWindowClass?.destroyWindow();
        done()
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0500
     * @tc.name      : testIsImmersiveLayoutwithImmersiveMode
     * @tc.desc      : 验证非2in1设备setImmersiveModeEnabledState后IsImmersiveLayout
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testIsImmersiveLayoutwithImmersiveMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testIsImmersiveLayoutwithImmersiveMode';
      try {
        if (isPCStatus == '') {
          let windowClass = windowStage.getMainWindowSync();
          windowClass.setImmersiveModeEnabledState(true);
          let res = windowClass.isImmersiveLayout();
          console.log(`${caseName} isImmersiveLayout 1: ${res}.`);
          expect(res).assertEqual(true);
          windowClass.setImmersiveModeEnabledState(false);
          let res2 = windowClass.isImmersiveLayout();
          console.log(`${caseName} isImmersiveLayout 2: ${res2}.`);
          expect(res2).assertEqual(false);
          done();
        } else {
          done();
        }
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        if (e.code === 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0600
     * @tc.name      : testIsImmersiveLayoutwithWindowLayoutFullScreen
     * @tc.desc      : 验证非2in1setWindowLayoutFullScreen后IsImmersiveLayout
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testIsImmersiveLayoutwithWindowLayoutFullScreen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testIsImmersiveLayoutwithWindowLayoutFullScreen';
      try {
        if (isPCStatus == '') {
          let windowClass = windowStage.getMainWindowSync();
          await windowClass.setWindowLayoutFullScreen(true);
          await sleep(200);
          let res = windowClass.isImmersiveLayout();
          console.log(`${caseName} isImmersiveLayout 1: ${res}.`);
          expect(res).assertEqual(true);
          await windowClass.setWindowLayoutFullScreen(false);
          await sleep(200);
          let res2 = windowClass.isImmersiveLayout();
          console.log(`${caseName} isImmersiveLayout 2: ${res2}.`);
          expect(res2).assertEqual(false);
          done();
        } else {
          done();
        }
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        if (e.code === 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    // it('testIsImmersiveLayoutwithMiniMize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
    //   let caseName = 'testIsImmersiveLayoutwithMiniMize';
    //   // 1、拉起另一个Abllity主窗
    //   let windowStageStart = await startAbility(caseName, context);
    //   let windowClassTest = windowStageStart.getMainWindowSync();
    //   try {
    //     await windowClassTest.minimize();
    //     await sleep(200);
    //     let res = windowClassTest.isImmersiveLayout();
    //     console.log(`${caseName} isImmersiveLayout: ${res}.`);
    //     expect(res).assertEqual(false);
    //     await terminateAbility(caseName);
    //     await sleep(200)
    //     done();
    //   } catch (e) {
    //     console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
    //     await terminateAbility(caseName);
    //     if (e.code === 801) {
    //       done();
    //     } else {
    //       expect().assertFail();
    //       done();
    //     }
    //   }
    // });

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0800
     * @tc.name      : testIsImmersiveLayoutwithDestroySubWindow
     * @tc.desc      : 验证销毁后调用IsImmersiveLayout
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('testIsImmersiveLayoutwithDestroySubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'testIsImmersiveLayoutwithDestroySubWindow';
      let windowClass = await windowStage.createSubWindow('testIsImmersiveLayoutwithDestroySubWindow');
      await windowClass.destroyWindow();
      try {
        let res = windowClass.isImmersiveLayout();
        console.log(`${caseName} isImmersiveLayout: ${res}.`);
        expect().assertFail();
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(1300002);
        done()
      }
    });
    
  })
}

