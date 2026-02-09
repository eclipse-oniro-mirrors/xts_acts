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
import { Driver, ON} from '@kit.TestKit';
import deviceInfo from '@ohos.deviceInfo';

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

async function startAbility3(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartTestAbility3'
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
  let windowStageStart = AppStorage.get('windowStageStartTest3') as window.WindowStage;
  return windowStageStart
}

async function terminateAbility3(caseName: string) {
  let pageContext = AppStorage.get('contextTest3') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${caseName} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
  });
  await sleep(1000)
}

async function startAbility4(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartTestAbility4',
  };
  if (options) {
    await context.startAbility(want, options).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause message: ${err.message}`);
    });
  } else {
    await context.startAbility(want).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause message: ${err.message}`);
    });
  }
  await sleep(1000)
  let windowStageStart = AppStorage.get('windowStageStartTest4') as window.WindowStage;
  return windowStageStart
}

async function terminateAbility4(caseName: string) {
  let pageContext = AppStorage.get('contextTest4') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${caseName} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
  });
  await sleep(1000)
}

async function startAbility7(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartTestAbility7'
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
  let windowStageStart = AppStorage.get('windowStageStartTest7') as window.WindowStage;
  return windowStageStart
}

async function terminateAbility7(caseName: string) {
  let pageContext = AppStorage.get('contextTest7') as common.UIAbilityContext
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
    let isFreeWindowMode = false;
    let deviceType:string = deviceInfo.deviceType;
    console.info(`deviceType: ${deviceType}`);
    beforeAll(async () => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
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
      let windowClass = windowStage.getMainWindowSync();
      isFreeWindowMode = windowClass.isInFreeWindowMode();
      //isFreeWindowMode == true 自由窗口模式
      //isFreeWindowMode == false 非自由窗口模式
      console.info(`isFreeWindowMode: ${isFreeWindowMode}`);
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
      // 拉起键盘赋权限
      if (isFreeWindowMode==false) {
        let windowStageStart = await startAbility4('beforeAll', context);
        let mainWindow = windowStageStart.getMainWindowSync();
        await mainWindow.setUIContent('testability/pages/Index4');
        await mainWindow.showWindow();
        await sleep(1000);
        let driver: Driver = Driver.create();
        await sleep(1000);
        let input = await driver.findComponent(ON.id('textInput'));
        console.info('beforeAll input: ' + JSON.stringify(input));
        await sleep(1000);
        await input.click();
        await sleep(1000);
        let text1 = await driver.findComponent(ON.text('同意'));
        console.info('beforeAll text1: ' + JSON.stringify(text1));
        let text2 = await driver.findComponent(ON.text('下一步'));
        console.info('beforeAll text1: ' + JSON.stringify(text1));
        await sleep(1000);
        if (text1) {
          await text1.click();
          console.info('beforeAll 同意 click success');
          await sleep(1000);
          let text = await driver.findComponent(ON.text('下一步'));
          console.info('beforeAll text2: ' + JSON.stringify(text));
          await text.click();
          console.info('beforeAll 下一步 click success');
          await sleep(1000);

          let text3 = await driver.findComponent(ON.text('完成'));
          console.info('beforeAll text3: ' + JSON.stringify(text3));
          await text3.click();
          console.info('beforeAll 完成 click success');

        }else if(text2){
          await text2.click();
          console.info('beforeAll 下一步 click success');
          await sleep(1000);
          let text3 = await driver.findComponent(ON.text('完成'));
          console.info('beforeAll text3: ' + JSON.stringify(text3));
          await text3.click();
          console.info('beforeAll 完成 click success');
        }else{
          await driver.pressBack();
          console.info('beforeAll pressBack success');
        }
        await sleep(2000);
        await terminateAbility4('beforeAll');
      }
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
     * @tc.name   test_LANSCAPE_SHOW_STATUS_BAR_0100
     * @tc.number SUB_BASIC_WMS_LANSCAPE_SHOW_STATUS_BAR_0100
     * @tc.desc   test_LANSCAPE_SHOW_STATUS_BAR_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_LANSCAPE_SHOW_STATUS_BAR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'test_LANSCAPE_SHOW_STATUS_BAR_0100';
      let windowClass = windowStage.getMainWindowSync();
      if(isSupportRotate == true && isFreeWindowMode == false){
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
     * @tc.name   test_LANSCAPE_HIDE_STATUS_BAR_0100
     * @tc.number SUB_BASIC_WMS_LANSCAPE_HIDE_STATUS_BAR_0100
     * @tc.desc   test_LANSCAPE_HIDE_STATUS_BAR_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_LANSCAPE_HIDE_STATUS_BAR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'test_LANSCAPE_HIDE_STATUS_BAR_0100';
      let windowClass = windowStage.getMainWindowSync();
      if(isSupportRotate == true && isFreeWindowMode == false){
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
     * @tc.name   testIsImmersiveLayoutwithMainwindowDefaultState
     * @tc.number SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0100
     * @tc.desc   验证主窗创建后默认为非沉浸式状态
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testIsImmersiveLayoutwithMaximize
     * @tc.number SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0900
     * @tc.desc   验证maximize后调用IsImmersiveLayout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsImmersiveLayoutwithMaximize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testIsImmersiveLayoutwithMaximize';
      let windowClass = windowStage.getMainWindowSync();
      try {
        if (isFreeWindowMode == true) {
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
     * @tc.name   testOnavoidAreaChangeInLandScape
     * @tc.number SUB_BASIC_WMS_OnavoidAreaChange_0100
     * @tc.desc   Obtain the area that the window content avoids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testOnavoidAreaChangeInPORTRAIT
     * @tc.number SUB_BASIC_WMS_OnavoidAreaChange_0200
     * @tc.desc   Obtain the area that the window content avoids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testOnavoidAreaChangeInLANDSCAPE_INVERTED
     * @tc.number SUB_BASIC_WMS_OnavoidAreaChange_0300
     * @tc.desc   Obtain the area that the window content avoids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   SUB_BASIC_WMS_SPCIAL_XTS_SET_IMMERSIVEMODE_ENABLEDATATE_0100
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_IMMERSIVEMODE_ENABLEDATATE_0100
     * @tc.desc   SUB_BASIC_WMS_SPCIAL_XTS_SET_IMMERSIVEMODE_ENABLEDATATE_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_BASIC_WMS_SPCIAL_XTS_SET_IMMERSIVEMODE_ENABLEDATATE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msgStr = "SUB_BASIC_WMS_SPCIAL_XTS_SET_IMMERSIVEMODE_ENABLEDATATE_0100";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      try {
        let enabled = true;
        windowClass.setImmersiveModeEnabledState(enabled);
        let isEnabled = windowClass.getImmersiveModeEnabledState();
        console.log(msgStr + 'success to setImmersiveModeEnabledState enabled:' + isEnabled);
        if(isFreeWindowMode == false){
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
     * @tc.name   SUB_BASIC_WMS_SPCIAL_XTS_SET_IMMERSIVEMODE_ENABLEDATATE_0200
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_IMMERSIVEMODE_ENABLEDATATE_0200
     * @tc.desc   SUB_BASIC_WMS_SPCIAL_XTS_SET_IMMERSIVEMODE_ENABLEDATATE_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_BASIC_WMS_SPCIAL_XTS_SET_IMMERSIVEMODE_ENABLEDATATE_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   testGetWindowAvoidAreaTypeSystem
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0100
     * @tc.desc   Obtain the area that the window content avoids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testGetWindowAvoidAreaTypeCutOut
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0200
     * @tc.desc   Obtain the area that the window content avoids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetWindowAvoidAreaTypeCutOut', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
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
     * @tc.name   testGetWindowAvoidAreaTypeSystemGesture
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0300
     * @tc.desc   Obtain the area that the window content avoids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetWindowAvoidAreaTypeSystemGesture', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
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
     * @tc.name   testGetWindowAvoidAreaTypeKeyBoard
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0400
     * @tc.desc   Obtain the area that the window content avoids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetWindowAvoidAreaTypeKeyBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
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
     * @tc.name   testGetWindowAvoidAreaTypeNavigationIndicator
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0500
     * @tc.desc   Obtain the area that the window content avoids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetWindowAvoidAreaTypeNavigationIndicator', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
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
     * @tc.name   testGetWindowAvoidAreaTypeSystemInLandScape
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0600
     * @tc.desc   Obtain the area that the window content avoids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetWindowAvoidAreaTypeSystemInLandScape', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
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
     * @tc.name   testGetWindowAvoidAreaTypeSystemInPortraitInverted
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0700
     * @tc.desc   Obtain the area that the window content avoids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetWindowAvoidAreaTypeSystemInPortraitInverted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
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
     * @tc.name   testGetWindowAvoidAreaTypeCutOutInPortraitInverted
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0800
     * @tc.desc   Obtain the area that the window content avoids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetWindowAvoidAreaTypeCutOutInPortraitInverted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
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
     * @tc.name   testGetWindowAvoidAreaTypeSystemInLandScapeInverted
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0900
     * @tc.desc   Obtain the area that the window content avoids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetWindowAvoidAreaTypeSystemInLandScapeInverted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
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
     * @tc.name   testGetWindowAvoidAreaTypeCutOutInLandScapeInverted
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1000
     * @tc.desc   Obtain the area that the window content avoids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetWindowAvoidAreaTypeCutOutInLandScapeInverted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
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
     * @tc.name   testGetAvoidAreaTypeSystem
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1100
     * @tc.desc   Obtain the area that the window content avoids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAvoidAreaTypeSystem', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
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
          if(isFreeWindowMode == true || deviceType == 'wearable'){
            expect(avoidArea.topRect.width).assertEqual(0);
            expect(avoidArea.topRect.height).assertEqual(0);
            expect(avoidArea.rightRect.width).assertEqual(0);
            expect(avoidArea.rightRect.height).assertEqual(0);
            expect(avoidArea.bottomRect.width).assertEqual(0);
            expect(avoidArea.bottomRect.height).assertEqual(0);
            expect(avoidArea.leftRect.width).assertEqual(0);
            expect(avoidArea.leftRect.height).assertEqual(0);
          }else{
            expect(avoidArea.topRect.width).assertLarger(0);
            expect(avoidArea.topRect.height).assertLarger(0);
            expect(avoidArea.rightRect.width).assertEqual(0);
            expect(avoidArea.rightRect.height).assertEqual(0);
            expect(avoidArea.leftRect.width).assertEqual(0);
            expect(avoidArea.leftRect.height).assertEqual(0);
          }
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
     * @tc.name   testGetAvoidAreaTypeCutOut
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1200
     * @tc.desc   Obtain the area that the window content avoids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAvoidAreaTypeCutOut', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
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
          if(isFreeWindowMode == true){
            expect(avoidArea.topRect.width).assertEqual(0);
            expect(avoidArea.topRect.height).assertEqual(0);
            expect(avoidArea.rightRect.width).assertEqual(0);
            expect(avoidArea.rightRect.height).assertEqual(0);
            expect(avoidArea.bottomRect.width).assertEqual(0);
            expect(avoidArea.bottomRect.height).assertEqual(0);
            expect(avoidArea.leftRect.width).assertEqual(0);
            expect(avoidArea.leftRect.height).assertEqual(0);
          }
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
     * @tc.name   testGetAvoidAreaTypeSystemGesture
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1300
     * @tc.desc   Obtain the area that the window content avoids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAvoidAreaTypeSystemGesture', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
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
          if(isFreeWindowMode == true){
            expect(avoidArea.topRect.width).assertEqual(0);
            expect(avoidArea.topRect.height).assertEqual(0);
            expect(avoidArea.rightRect.width).assertEqual(0);
            expect(avoidArea.rightRect.height).assertEqual(0);
            expect(avoidArea.bottomRect.width).assertEqual(0);
            expect(avoidArea.bottomRect.height).assertEqual(0);
            expect(avoidArea.leftRect.width).assertEqual(0);
            expect(avoidArea.leftRect.height).assertEqual(0);
          }
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
     * @tc.name   testGetAvoidAreaTypeKeyBoard
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1400
     * @tc.desc   Obtain the area that the window content avoids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAvoidAreaTypeKeyBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
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
          // if(isFreeWindowMode == true){
          expect(avoidArea.topRect.width).assertEqual(0);
          expect(avoidArea.topRect.height).assertEqual(0);
          expect(avoidArea.rightRect.width).assertEqual(0);
          expect(avoidArea.rightRect.height).assertEqual(0);
          expect(avoidArea.bottomRect.width).assertEqual(0);
          expect(avoidArea.bottomRect.height).assertEqual(0);
          expect(avoidArea.leftRect.width).assertEqual(0);
          expect(avoidArea.leftRect.height).assertEqual(0);
          // }
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
     * @tc.name   testGetAvoidAreaTypeNavigationIndicator
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1500
     * @tc.desc   Obtain the area that the window content avoids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAvoidAreaTypeNavigationIndicator', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
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
     * @tc.name   testOnSystemAvoidAreaChange
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1600
     * @tc.desc   listen system avoid area change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnSystemAvoidAreaChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   testOnRepeatSystemAvoidAreaChange
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1700
     * @tc.desc   listen system avoid area change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testOffRepeatSystemAvoidAreaChange
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1800
     * @tc.desc   listen system avoid area change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOffRepeatSystemAvoidAreaChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   testOnAvoidAreaChange
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1900
     * @tc.desc   listen avoid area change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testGetAvoidAreaTypeSystemInFreeWindowMode
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2000
     * @tc.desc   验证自由多窗且窗口最大化，状态栏显示避让区域为0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAvoidAreaTypeSystemInFreeWindowMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testGetAvoidAreaTypeSystemInFreeWindowMode';
      try {
        if(isFreeWindowMode == true){
          let windowClass = windowStage.getMainWindowSync();
          await windowClass.maximize(window.MaximizePresentation.EXIT_IMMERSIVE);
          await windowClass.setSpecificSystemBarEnabled('status', true);
          windowClass.getAvoidArea(window.AvoidAreaType.TYPE_SYSTEM).then(async (data) => {
            console.info(`${caseName} Succeeded in obtaining the area. Data: ${JSON.stringify(data)}`);
            let avoidArea = data;
            expect(avoidArea.visible).assertTrue();
            expect(avoidArea.topRect.width).assertEqual(0);
            expect(avoidArea.topRect.height).assertEqual(0);
            expect(avoidArea.rightRect.width).assertEqual(0);
            expect(avoidArea.rightRect.height).assertEqual(0);
            expect(avoidArea.bottomRect.width).assertEqual(0);
            expect(avoidArea.bottomRect.height).assertEqual(0);
            expect(avoidArea.leftRect.width).assertEqual(0);
            expect(avoidArea.leftRect.height).assertEqual(0);
            await windowClass.recover();
            done();
          

        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to obtain the area. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
        }else{
          done();
        }
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testOffRepeatAvoidAreaChange
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2100
     * @tc.desc   listen system avoid area change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testSetWindowSystemBarEnableStatusInvisiblePromise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2200
     * @tc.desc   set window system bar isVisible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWindowSystemBarEnableStatusInvisiblePromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   testSetWindowSystemBarEnableStatusVisiblePromise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2300
     * @tc.desc   set window system bar isVisible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWindowSystemBarEnableStatusVisiblePromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   testSetWindowSystemBarEnableInVisiblePromise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2400
     * @tc.desc   set window system bar isVisible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWindowSystemBarEnableInVisiblePromise',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   testSetWindowSystemBarEnableStatusVisibleCallback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2500
     * @tc.desc   set window system bar isVisible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetWindowSystemBarEnableStatusVisibleCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   testSetWindowSystemBarEnableStatusInVisibleCallback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2600
     * @tc.desc   set window system bar isVisible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testSetSystemBarEnableStatusPromise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2700
     * @tc.desc   set system bar isVisible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSystemBarEnableStatusPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   testSetSystemBarEnablePromise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2800
     * @tc.desc   set system bar isVisible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testGetWindowSystemBarProperties
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2900
     * @tc.desc   get window system bar properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testSetSystemBarPropertiesPromise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3000
     * @tc.desc   set window system bar properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetSystemBarPropertiesPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
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
     * @tc.name   testSetWindowSystemBarPropertiesCallback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3100
     * @tc.desc   set window system bar properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetWindowSystemBarPropertiesCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
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
     * @tc.name   testSetWindowSystemBarPropertiesPromise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3200
     * @tc.desc   set window system bar properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetWindowSystemBarPropertiesPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
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
     * @tc.name   testSetImmersive
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3300
     * @tc.desc   set immersive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetImmersive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestSetImmersive';
      let windowClass = windowStage.getMainWindowSync();
      try {
        if(isFreeWindowMode == false){
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
     * @tc.name   testSetFullScreenInImmersiveMode
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3400
     * @tc.desc   set immersive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetFullScreenInImmersiveMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'TestSetFullScreenInImmersiveMode';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setWindowLayoutFullScreen(true).then(async () => {
          windowClass.setImmersiveModeEnabledState(true);
          let beforeImmersiveModeState: boolean = windowClass.getImmersiveModeEnabledState();
          console.info(`${caseName} Succeeded in setting the immersiveMode enabled true. Data: ${beforeImmersiveModeState}`);
          if(isFreeWindowMode == false){
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
     * @tc.name   testSetMaximizeInImmersiveMode
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3500
     * @tc.desc   set immersive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
          if(isFreeWindowMode == false){
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
     * @tc.name   testSetLayoutFullScreenFalseCallback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3600
     * @tc.desc   set layout full screen false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetLayoutFullScreenFalseCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   testSetLayoutFullScreenTrueCallback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3700
     * @tc.desc   set layout full screen true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetLayoutFullScreenTrueCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   testSetLayoutFullScreenFalsePromise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3800
     * @tc.desc   set layout full screen false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetLayoutFullScreenFalsePromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   testSetLayoutFullScreenTruePromise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3900
     * @tc.desc   set layout full screen true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetLayoutFullScreenTruePromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   testSetFullScreenFalseCallback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4000
     * @tc.desc   set full screen false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testSetFullScreenTrueCallback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4100
     * @tc.desc   set full screen true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetFullScreenTrueCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   testSetFullScreenFalsePromise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4200
     * @tc.desc   set full screen false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetFullScreenFalsePromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   testSetFullScreenTruePromise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4300
     * @tc.desc   set full screen true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetFullScreenTruePromise',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   testSetSpecificSystemBarStatus
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4400
     * @tc.desc   Test the function of setSpecificSystemBarEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetSpecificSystemBarStatus',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   test_set_WindowSystemBarProperties_statusBar
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4500
     * @tc.desc   test_set_WindowSystemBarProperties_statusBar
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   test_set_WindowSystemBarProperties_isStatusBarLightIcon
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4600
     * @tc.desc   test_set_WindowSystemBarProperties_isStatusBarLightIcon
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   test_set_WindowSystemBarProperties_NavigationBar
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4700
     * @tc.desc   test_set_WindowSystemBarProperties_NavigationBar
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   test_set_WindowSystemBarProperties_isNavigationBarLightIcon
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4800
     * @tc.desc   test_set_WindowSystemBarProperties_isNavigationBarLightIcon
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testOnOff_WindowSizeChange_Callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_0400
     * @tc.desc   To verify the function of enabling and disabling lawful interception in the system and window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   test_setSpecificSystemBarEnabled_enableAnimation
     * @tc.number SUB_BASIC_WMS_SET_SPECIFIC_SYSTEMBAR_ENABLE_0100
     * @tc.desc   test_setSpecificSystemBarEnabled_enableAnimation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setSpecificSystemBarEnabled_enableAnimation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   test_setSystemAvoidAreaEnabled_ErrorCode_401
     * @tc.number SUB_BASIC_WMS_setSystemAvoidAreaEnabled_ErrorCode_0100
     * @tc.desc   setSystemAvoidAreaEnabled接口验证401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   test_setSystemAvoidAreaEnabled_ErrorCode_801
     * @tc.number SUB_BASIC_WMS_setSystemAvoidAreaEnabled_ErrorCode_0200
     * @tc.desc   setSystemAvoidAreaEnabled接口验证801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   test_setSystemAvoidAreaEnabled_ErrorCode_1300002
     * @tc.number SUB_BASIC_WMS_setSystemAvoidAreaEnabled_ErrorCode_0300
     * @tc.desc   setSystemAvoidAreaEnabled接口验证1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   test_setSystemAvoidAreaEnabled_ErrorCode_1300004
     * @tc.number SUB_BASIC_WMS_setSystemAvoidAreaEnabled_ErrorCode_0400
     * @tc.desc   setSystemAvoidAreaEnabled接口验证1300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   test_setSystemAvoidAreaEnabled_dialog
     * @tc.number SUB_BASIC_WMS_setSystemAvoidAreaEnabled_0100
     * @tc.desc   dialog调用setSystemAvoidAreaEnabled接口
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   test_isSystemAvoidAreaEnabled_801
     * @tc.number SUB_BASIC_WMS_isSystemAvoidAreaEnabled_ErrorCode_0100
     * @tc.desc   isSystemAvoidAreaEnabled接口验证801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   test_isSystemAvoidAreaEnabled_1300004
     * @tc.number SUB_BASIC_WMS_isSystemAvoidAreaEnabled_ErrorCode_0200
     * @tc.desc   isSystemAvoidAreaEnabled接口验证1300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   test_isSystemAvoidAreaEnabled_1300002
     * @tc.number SUB_BASIC_WMS_isSystemAvoidAreaEnabled_ErrorCode_0300
     * @tc.desc   isSystemAvoidAreaEnabled接口验证1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testIsImmersiveLayoutwithSubWindowDefaultState
     * @tc.number SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0200
     * @tc.desc   验证子窗创建后默认为沉浸式状态
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testIsImmersiveLayoutwithFloatWindowDefaultState1
     * @tc.number SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0300
     * @tc.desc   验证悬浮窗创建后默认为非沉浸式状态
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsImmersiveLayoutwithFloatWindowDefaultState1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testIsImmersiveLayoutwithFloatWindowDefaultState1';
      let config: window.Configuration = {
        name: "testIsImmersiveLayoutwithFloatWindowDefaultState1",
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
     * @tc.name   testIsImmersiveLayoutwithDialogWindowDefaultState
     * @tc.number SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0400
     * @tc.desc   验证dialog窗创建后默认为非沉浸式状态
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsImmersiveLayoutwithDialogWindowDefaultState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   testIsImmersiveLayoutwithImmersiveMode
     * @tc.number SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0500
     * @tc.desc   验证非2in1设备setImmersiveModeEnabledState后IsImmersiveLayout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsImmersiveLayoutwithImmersiveMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testIsImmersiveLayoutwithImmersiveMode';
      try {
        if (isFreeWindowMode == false) {
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
     * @tc.name   testIsImmersiveLayoutwithWindowLayoutFullScreen
     * @tc.number SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0600
     * @tc.desc   验证非2in1setWindowLayoutFullScreen后IsImmersiveLayout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsImmersiveLayoutwithWindowLayoutFullScreen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testIsImmersiveLayoutwithWindowLayoutFullScreen';
      try {
        if (isFreeWindowMode == false) {
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

    /**
     * @tc.name   testIsImmersiveLayoutwithMiniMize
     * @tc.number testIsImmersiveLayoutwithMiniMize
     * @tc.desc   testIsImmersiveLayoutwithMiniMize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
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
     * @tc.name   testIsImmersiveLayoutwithDestroySubWindow
     * @tc.number SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0800
     * @tc.desc   验证销毁后调用IsImmersiveLayout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testIsImmersiveLayoutwithDisableWindowDecor
     * @tc.number SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_1100
     * @tc.desc   验证2in1设备和pad自由多窗下，子窗创建标题栏装饰后调用IsImmersiveLayout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
          if (isFreeWindowMode == true) {
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
     * @tc.name   testIsImmersiveLayoutwithDisableWindowDecor2
     * @tc.number SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_1200
     * @tc.desc   验证2in1设备和pad自由多窗下，子窗创建无标题栏装饰后调用IsImmersiveLayout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testIsImmersiveLayoutwithImmersiveMode2
     * @tc.number SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_1300
     * @tc.desc   验证非2in1设备和pad自由多窗下，子窗setImmersiveModeEnabledState后IsImmersiveLayout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsImmersiveLayoutwithImmersiveMode2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'testIsImmersiveLayoutwithImmersiveMode2';
      let windowClass = await windowStage.createSubWindow('testIsImmersiveLayoutwithImmersiveMode2')
      await windowClass.setUIContent('testability/pages/First/index2');
      await windowClass.showWindow();
      await sleep(1000);
      try {
        if (isFreeWindowMode == true) {
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
     * @tc.name   testIsImmersiveLayoutwithWindowLayoutFullScreen2
     * @tc.number SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_1400
     * @tc.desc   验证非2in1设备和pad自由多窗下，子窗setWindowLayoutFullScreen后IsImmersiveLayout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
          if (isFreeWindowMode == true) {
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
     * @tc.name   testIsImmersiveLayoutwithSubWindowDefaultState
     * @tc.number SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0200
     * @tc.desc   验证子窗创建后默认为沉浸式状态
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testIsImmersiveLayoutwithFloatWindowDefaultState
     * @tc.number SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0300
     * @tc.desc   验证悬浮窗创建后默认为非沉浸式状态
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsImmersiveLayoutwithFloatWindowDefaultState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   testIsImmersiveLayoutwithDialogWindowDefaultState
     * @tc.number SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0400
     * @tc.desc   验证dialog窗创建后默认为非沉浸式状态
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testIsImmersiveLayoutwithImmersiveMode
     * @tc.number SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0500
     * @tc.desc   验证非2in1设备setImmersiveModeEnabledState后IsImmersiveLayout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsImmersiveLayoutwithImmersiveMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testIsImmersiveLayoutwithImmersiveMode';
      try {
        if (isFreeWindowMode == false) {
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
     * @tc.name   testIsImmersiveLayoutwithWindowLayoutFullScreen
     * @tc.number SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0600
     * @tc.desc   验证非2in1setWindowLayoutFullScreen后IsImmersiveLayout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsImmersiveLayoutwithWindowLayoutFullScreen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testIsImmersiveLayoutwithWindowLayoutFullScreen';
      try {
        if (isFreeWindowMode == false) {
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

    /**
     * @tc.name   testIsImmersiveLayoutwithMiniMize
     * @tc.number testIsImmersiveLayoutwithMiniMize
     * @tc.desc   testIsImmersiveLayoutwithMiniMize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
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
     * @tc.name   testIsImmersiveLayoutwithDestroySubWindow
     * @tc.number SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_0800
     * @tc.desc   验证销毁后调用IsImmersiveLayout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.number     SUB_BASIC_WMS_FUNCTION_ROTATION_AVOIDAREACHANGE_1000
     * @tc.name       testWindowAvoidareaChangeCutout_0100
     * @tc.desc       横屏冷启动旋转窗口，正确获取挖孔避让区域
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it('testWindowAvoidareaChangeCutout_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testWindowAvoidareaChangeCutout_0100';
      if (isSupportRotate) {
        let windowStageStart = await startAbility3(caseName, context);
        let windowClass = windowStageStart.getMainWindowSync();
        let isInFreeWindowMode = windowClass.isInFreeWindowMode();
        console.info(caseName + ' isInFreeWindowMode: ' + JSON.stringify(isInFreeWindowMode));
        if (isInFreeWindowMode) {
          await terminateAbility3(caseName);
          done();
        } else {
          let displayClass = display.getDefaultDisplaySync();
          let cutoutInfo = await displayClass.getCutoutInfo();
          let arrayRect = cutoutInfo.boundingRects;
          console.info(caseName + ' arrayRect: ' + JSON.stringify(arrayRect));
          if (arrayRect.length == 0) {
            await terminateAbility3(caseName);
            done();
          } else {
            windowClass.on('avoidAreaChange', async (data) => {
              console.info(`${caseName} Succeeded in enabling the listener for avoid area changes. type:
            ${JSON.stringify(data.type)} area: ${JSON.stringify(data.area)}`);
              if(data.type == window.AvoidAreaType.TYPE_CUTOUT) {
                expect(data.area!= null).assertTrue();
                windowClass.off('avoidAreaChange');
                await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
                await sleep(1000);
                await terminateAbility3(caseName);
                done();
              } else {
                await sleep(3000)
              }
            });
            await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE_INVERTED);
          }
        }
      } else {
        done();
      }
    });

    /**
     * @tc.number     SUB_BASIC_WMS_GET_WINDOW_AVOID_AREA_IGNORING_VISIBILITY_0100
     * @tc.name       testFreeMultWindowFullScreenGetWindowAvoidAreaIgnoringVisibility
     * @tc.desc       横验证在自由多窗模式下全屏窗口调用getWindowAvoidAreaIgnoringVisibility接口
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it('testFreeMultWindowFullScreenGetWindowAvoidAreaIgnoringVisibility', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testFreeMultWindowFullScreenGetWindowAvoidAreaIgnoringVisibility';
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      let windowStageStart = await startAbility3(caseName, context);
      let windowClass = windowStageStart.getMainWindowSync();
      let isInFreeWindowMode = windowClass.isInFreeWindowMode();
      console.info(caseName + ' isInFreeWindowMode: ' + JSON.stringify(isInFreeWindowMode));
      try {
        if (isInFreeWindowMode) {
          await windowClass.maximize();
          const mainWindowProperties = windowClass.getWindowProperties();
          const mainWindowRect = mainWindowProperties.windowRect;
          console.info(caseName + ' Main window rect: ' + JSON.stringify(mainWindowRect));
          let subWindow = await windowStageStart.createSubWindow(caseName);
          await subWindow.resize(mainWindowRect.width, mainWindowRect.height);
          await subWindow.moveWindowTo(mainWindowRect.left, mainWindowRect.top);
          console.info(caseName + ' Sub window resized and moved to match main window');
          await subWindow.setUIContent("testability/pages/First/index2");
          await subWindow.showWindow();
          let avoidArea = subWindow.getWindowAvoidAreaIgnoringVisibility(window.AvoidAreaType.TYPE_SYSTEM);
          console.info(caseName + ' avoidArea: ' + JSON.stringify(avoidArea));
          expect(avoidArea.leftRect.width).assertEqual(0);
          expect(avoidArea.leftRect.height).assertEqual(0);
          expect(avoidArea.rightRect.width).assertEqual(0);
          expect(avoidArea.rightRect.height).assertEqual(0);
          expect(avoidArea.topRect.width).assertEqual(0);
          expect(avoidArea.topRect.height).assertEqual(0);
          expect(avoidArea.bottomRect.width).assertEqual(0);
          expect(avoidArea.bottomRect.height).assertEqual(0);
          await subWindow.destroyWindow();
          await terminateAbility3(caseName);
          done()
        } else {
          await terminateAbility3(caseName);
          done();
        }
      } catch (err) {
        console.error(caseName + ' failed, err: ' + JSON.stringify(err));
        await terminateAbility3(caseName);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     SUB_BASIC_WMS_GET_WINDOW_AVOID_AREA_IGNORING_VISIBILITY_0200
     * @tc.name       testFreeMultWindowNotFullScreenGetWindowAvoidAreaIgnoringVisibility
     * @tc.desc       验证在自由多窗模式下非全屏窗口调用getWindowAvoidAreaIgnoringVisibility接口
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it('testFreeMultWindowNotFullScreenGetWindowAvoidAreaIgnoringVisibility', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testFreeMultWindowNotFullScreenGetWindowAvoidAreaIgnoringVisibility';
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      let windowStageStart = await startAbility3(caseName, context);
      let windowClass = windowStageStart.getMainWindowSync();
      let isInFreeWindowMode = windowClass.isInFreeWindowMode();
      console.info(caseName + ' isInFreeWindowMode: ' + JSON.stringify(isInFreeWindowMode));
      try {
        if (isInFreeWindowMode && canIUseRes) {
          const mainWindowProperties = windowClass.getWindowProperties();
          const mainWindowRect = mainWindowProperties.windowRect;
          console.info(caseName + ' Main window rect: ' + JSON.stringify(mainWindowRect));
          let subWindow = await windowStageStart.createSubWindow(caseName);
          await subWindow.resize(mainWindowRect.width, mainWindowRect.height);
          await subWindow.moveWindowTo(mainWindowRect.left, mainWindowRect.top);
          console.info(caseName + ' Sub window resized and moved to match main window');
          await subWindow.setUIContent("testability/pages/First/index2");
          await subWindow.showWindow();
          let avoidArea = subWindow.getWindowAvoidAreaIgnoringVisibility(window.AvoidAreaType.TYPE_SYSTEM);
          console.info(caseName + ' avoidArea: ' + JSON.stringify(avoidArea));
          expect(avoidArea.leftRect.width).assertEqual(0);
          expect(avoidArea.leftRect.height).assertEqual(0);
          expect(avoidArea.rightRect.width).assertEqual(0);
          expect(avoidArea.rightRect.height).assertEqual(0);
          expect(avoidArea.topRect.width).assertEqual(0);
          expect(avoidArea.topRect.height).assertEqual(0);
          expect(avoidArea.bottomRect.width).assertEqual(0);
          expect(avoidArea.bottomRect.height).assertEqual(0);
          await subWindow.destroyWindow();
          await terminateAbility3(caseName);
          done()
        } else {
          await terminateAbility3(caseName);
          done();
        }
      } catch (err) {
        console.error(caseName + ' failed, err: ' + JSON.stringify(err));
        expect().assertFail();
        await terminateAbility3(caseName);
        done();
      }
    });

    /**
     * @tc.number     SUB_BASIC_WMS_GET_WINDOW_AVOID_AREA_IGNORING_VISIBILITY_0300
     * @tc.name       testNotFreeMultWindowMainWindowGetWindowAvoidAreaIgnoringVisibility
     * @tc.desc       验证在非自由多窗模式下状态栏、导航条未隐藏时主窗口调用getWindowAvoidAreaIgnoringVisibility接口
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it('testNotFreeMultWindowMainWindowGetWindowAvoidAreaIgnoringVisibility', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testNotFreeMultWindowMainWindowGetWindowAvoidAreaIgnoringVisibility';
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      let windowStageStart = await startAbility3(caseName, context);
      let windowClass = windowStageStart.getMainWindowSync();
      let isInFreeWindowMode = windowClass.isInFreeWindowMode();
      console.info(caseName + ' isInFreeWindowMode: ' + JSON.stringify(isInFreeWindowMode));
      try {
        if (!isInFreeWindowMode) {
          await windowClass.setWindowSystemBarEnable(['status', 'navigation']);
          try {
            let avoidArea1 = windowClass.getWindowAvoidAreaIgnoringVisibility(window.AvoidAreaType.TYPE_SYSTEM);
            console.info(caseName + ' avoidArea1: ' + JSON.stringify(avoidArea1));
            let avoidArea2 = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
            console.info(caseName + ' avoidArea2: ' + JSON.stringify(avoidArea2));
            expect(avoidArea1.leftRect.left).assertEqual(avoidArea2.leftRect.left);
            expect(avoidArea1.leftRect.top).assertEqual(avoidArea2.leftRect.top);
            expect(avoidArea1.leftRect.width).assertEqual(avoidArea2.leftRect.width);
            expect(avoidArea1.leftRect.height).assertEqual(avoidArea2.leftRect.height);

            expect(avoidArea1.rightRect.left).assertEqual(avoidArea2.rightRect.left);
            expect(avoidArea1.rightRect.top).assertEqual(avoidArea2.rightRect.top);
            expect(avoidArea1.rightRect.width).assertEqual(avoidArea2.rightRect.width);
            expect(avoidArea1.rightRect.height).assertEqual(avoidArea2.rightRect.height);

            expect(avoidArea1.topRect.left).assertEqual(avoidArea2.topRect.left);
            expect(avoidArea1.topRect.top).assertEqual(avoidArea2.topRect.top);
            expect(avoidArea1.topRect.width).assertEqual(avoidArea2.topRect.width);
            expect(avoidArea1.topRect.height).assertEqual(avoidArea2.topRect.height);

            expect(avoidArea1.bottomRect.left).assertEqual(avoidArea2.bottomRect.left);
            expect(avoidArea1.bottomRect.top).assertEqual(avoidArea2.bottomRect.top);
            expect(avoidArea1.bottomRect.width).assertEqual(avoidArea2.bottomRect.width);
            expect(avoidArea1.bottomRect.height).assertEqual(avoidArea2.bottomRect.height);
          } catch (error) {
            console.error(caseName + ' failed1, error: ' + JSON.stringify(error));
            if (!canIUseRes) {
              expect(error.code).assertEqual(801)
            } else {
              expect().assertFail();
            }
          }

          try {
            let avoidArea3 = windowClass.getWindowAvoidAreaIgnoringVisibility(window.AvoidAreaType.TYPE_CUTOUT);
            console.info(caseName + ' avoidArea3: ' + JSON.stringify(avoidArea3));
            let avoidArea4 = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_CUTOUT)
            console.info(caseName + ' avoidArea4: ' + JSON.stringify(avoidArea4));
            expect(avoidArea3.leftRect.left).assertEqual(avoidArea4.leftRect.left);
            expect(avoidArea3.leftRect.top).assertEqual(avoidArea4.leftRect.top);
            expect(avoidArea3.leftRect.width).assertEqual(avoidArea4.leftRect.width);
            expect(avoidArea3.leftRect.height).assertEqual(avoidArea4.leftRect.height);

            expect(avoidArea3.rightRect.left).assertEqual(avoidArea4.rightRect.left);
            expect(avoidArea3.rightRect.top).assertEqual(avoidArea4.rightRect.top);
            expect(avoidArea3.rightRect.width).assertEqual(avoidArea4.rightRect.width);
            expect(avoidArea3.rightRect.height).assertEqual(avoidArea4.rightRect.height);

            expect(avoidArea3.topRect.left).assertEqual(avoidArea4.topRect.left);
            expect(avoidArea3.topRect.top).assertEqual(avoidArea4.topRect.top);
            expect(avoidArea3.topRect.width).assertEqual(avoidArea4.topRect.width);
            expect(avoidArea3.topRect.height).assertEqual(avoidArea4.topRect.height);

            expect(avoidArea3.bottomRect.left).assertEqual(avoidArea4.bottomRect.left);
            expect(avoidArea3.bottomRect.top).assertEqual(avoidArea4.bottomRect.top);
            expect(avoidArea3.bottomRect.width).assertEqual(avoidArea4.bottomRect.width);
            expect(avoidArea3.bottomRect.height).assertEqual(avoidArea4.bottomRect.height);
          } catch (error) {
            console.error(caseName + ' failed2, error: ' + JSON.stringify(error));
            if (!canIUseRes) {
              expect(error.code).assertEqual(801)
            } else {
              expect().assertFail();
            }
          }

          try {
            let avoidArea5 = windowClass.getWindowAvoidAreaIgnoringVisibility(window.AvoidAreaType.TYPE_KEYBOARD);
            console.info(caseName + ' avoidArea5: ' + JSON.stringify(avoidArea5));
            let avoidArea6 = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_KEYBOARD)
            console.info(caseName + ' avoidArea6: ' + JSON.stringify(avoidArea6));
            expect().assertFail();
          } catch (error) {
            console.error(caseName + ' failed3, error: ' + JSON.stringify(error));
            if (!canIUseRes) {
              expect(error.code).assertEqual(801)
            } else {
              expect(error.code).assertEqual(1300016)
            }
          }

          try {
            let avoidArea7 = windowClass.getWindowAvoidAreaIgnoringVisibility(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR);
            console.info(caseName + ' avoidArea7: ' + JSON.stringify(avoidArea7));
            let avoidArea8 = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR)
            console.info(caseName + ' avoidArea8: ' + JSON.stringify(avoidArea8));
            expect(avoidArea7.leftRect.left).assertEqual(avoidArea8.leftRect.left);
            expect(avoidArea7.leftRect.top).assertEqual(avoidArea8.leftRect.top);
            expect(avoidArea7.leftRect.width).assertEqual(avoidArea8.leftRect.width);
            expect(avoidArea7.leftRect.height).assertEqual(avoidArea8.leftRect.height);

            expect(avoidArea7.rightRect.left).assertEqual(avoidArea8.rightRect.left);
            expect(avoidArea7.rightRect.top).assertEqual(avoidArea8.rightRect.top);
            expect(avoidArea7.rightRect.width).assertEqual(avoidArea8.rightRect.width);
            expect(avoidArea7.rightRect.height).assertEqual(avoidArea8.rightRect.height);

            expect(avoidArea7.topRect.left).assertEqual(avoidArea8.topRect.left);
            expect(avoidArea7.topRect.top).assertEqual(avoidArea8.topRect.top);
            expect(avoidArea7.topRect.width).assertEqual(avoidArea8.topRect.width);
            expect(avoidArea7.topRect.height).assertEqual(avoidArea8.topRect.height);

            expect(avoidArea7.bottomRect.left).assertEqual(avoidArea8.bottomRect.left);
            expect(avoidArea7.bottomRect.top).assertEqual(avoidArea8.bottomRect.top);
            expect(avoidArea7.bottomRect.width).assertEqual(avoidArea8.bottomRect.width);
            expect(avoidArea7.bottomRect.height).assertEqual(avoidArea8.bottomRect.height);
            await terminateAbility3(caseName);
            done()
          } catch (error) {
            console.error(caseName + ' failed4, error: ' + JSON.stringify(error));
            await terminateAbility3(caseName);
            if (!canIUseRes) {
              expect(error.code).assertEqual(801)
              done()
            } else {
              expect().assertFail();
              done()
            }
          }
        } else {
          await terminateAbility3(caseName);
          done();
        }
      } catch (err) {
        console.error(caseName + ' failed, err: ' + JSON.stringify(err));
        expect().assertFail();
        await terminateAbility3(caseName);
        done();
      }
    });

    /**
     * @tc.number     SUB_BASIC_WMS_GET_WINDOW_AVOID_AREA_IGNORING_VISIBILITY_0400
     * @tc.name       testNotFreeMultWindowMainWindowHideGetWindowAvoidAreaIgnoringVisibility
     * @tc.desc       验证在非自由多窗模式下状态栏、导航条隐藏时主窗口调用getWindowAvoidAreaIgnoringVisibility接口
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it('testNotFreeMultWindowMainWindowHideGetWindowAvoidAreaIgnoringVisibility', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testNotFreeMultWindowMainWindowHideGetWindowAvoidAreaIgnoringVisibility';
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      let windowStageStart = await startAbility3(caseName, context);
      let windowClass = windowStageStart.getMainWindowSync();
      let isInFreeWindowMode = windowClass.isInFreeWindowMode();
      console.info(caseName + ' isInFreeWindowMode: ' + JSON.stringify(isInFreeWindowMode));
      try {
        if (!isInFreeWindowMode) {
          await windowClass.setWindowSystemBarEnable([]);
          try {
            let avoidArea1 = windowClass.getWindowAvoidAreaIgnoringVisibility(window.AvoidAreaType.TYPE_SYSTEM);
            console.info(caseName + ' avoidArea1: ' + JSON.stringify(avoidArea1));
            let avoidArea2 = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
            console.info(caseName + ' avoidArea2: ' + JSON.stringify(avoidArea2));
            expect(avoidArea1.leftRect.width).assertEqual(0);
            expect(avoidArea1.leftRect.height).assertEqual(0);

            expect(avoidArea1.rightRect.width).assertEqual(0);
            expect(avoidArea1.rightRect.height).assertEqual(0);

            if(deviceType != 'wearable'){
              expect(avoidArea1.topRect.width).assertLarger(0);
              expect(avoidArea1.topRect.height).assertLarger(0);
            }else{
              expect(avoidArea1.topRect.width).assertEqual(0);
              expect(avoidArea1.topRect.height).assertEqual(0);
            }
            

            expect(avoidArea1.bottomRect.width).assertEqual(0);
            expect(avoidArea1.bottomRect.height).assertEqual(0);
          } catch (error) {
            console.error(caseName + ' failed1, error: ' + JSON.stringify(error));
            if (!canIUseRes) {
              expect(error.code).assertEqual(801)
            } else {
              expect().assertFail();
            }
          }

          try {
            let avoidArea3 = windowClass.getWindowAvoidAreaIgnoringVisibility(window.AvoidAreaType.TYPE_CUTOUT);
            console.info(caseName + ' avoidArea3: ' + JSON.stringify(avoidArea3));
            let avoidArea4 = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_CUTOUT)
            console.info(caseName + ' avoidArea4: ' + JSON.stringify(avoidArea4));
            expect(avoidArea3.leftRect.left).assertEqual(avoidArea4.leftRect.left);
            expect(avoidArea3.leftRect.top).assertEqual(avoidArea4.leftRect.top);
            expect(avoidArea3.leftRect.width).assertEqual(avoidArea4.leftRect.width);
            expect(avoidArea3.leftRect.height).assertEqual(avoidArea4.leftRect.height);

            expect(avoidArea3.rightRect.left).assertEqual(avoidArea4.rightRect.left);
            expect(avoidArea3.rightRect.top).assertEqual(avoidArea4.rightRect.top);
            expect(avoidArea3.rightRect.width).assertEqual(avoidArea4.rightRect.width);
            expect(avoidArea3.rightRect.height).assertEqual(avoidArea4.rightRect.height);

            expect(avoidArea3.topRect.left).assertEqual(avoidArea4.topRect.left);
            expect(avoidArea3.topRect.top).assertEqual(avoidArea4.topRect.top);
            expect(avoidArea3.topRect.width).assertEqual(avoidArea4.topRect.width);
            expect(avoidArea3.topRect.height).assertEqual(avoidArea4.topRect.height);

            expect(avoidArea3.bottomRect.left).assertEqual(avoidArea4.bottomRect.left);
            expect(avoidArea3.bottomRect.top).assertEqual(avoidArea4.bottomRect.top);
            expect(avoidArea3.bottomRect.width).assertEqual(avoidArea4.bottomRect.width);
            expect(avoidArea3.bottomRect.height).assertEqual(avoidArea4.bottomRect.height);
          } catch (error) {
            console.error(caseName + ' failed2, error: ' + JSON.stringify(error));
            if (!canIUseRes) {
              expect(error.code).assertEqual(801)
            } else {
              expect().assertFail();
            }
          }

          try {
            let avoidArea5 = windowClass.getWindowAvoidAreaIgnoringVisibility(window.AvoidAreaType.TYPE_KEYBOARD);
            console.info(caseName + ' avoidArea5: ' + JSON.stringify(avoidArea5));
            let avoidArea6 = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_KEYBOARD)
            console.info(caseName + ' avoidArea6: ' + JSON.stringify(avoidArea6));
            expect().assertFail();
          } catch (error) {
            console.error(caseName + ' failed3, error: ' + JSON.stringify(error));
            if (!canIUseRes) {
              expect(error.code).assertEqual(801)
            } else {
              expect(error.code).assertEqual(1300016)
            }
          }

          try {
            let avoidArea7 = windowClass.getWindowAvoidAreaIgnoringVisibility(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR);
            console.info(caseName + ' avoidArea7: ' + JSON.stringify(avoidArea7));
            let avoidArea8 = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR)
            console.info(caseName + ' avoidArea8: ' + JSON.stringify(avoidArea8));
            expect(avoidArea7.leftRect.width).assertEqual(0);
            expect(avoidArea7.leftRect.height).assertEqual(0);

            expect(avoidArea7.rightRect.width).assertEqual(0);
            expect(avoidArea7.rightRect.height).assertEqual(0);

            expect(avoidArea7.topRect.width).assertEqual(0);
            expect(avoidArea7.topRect.height).assertEqual(0);

            if(deviceType != 'wearable' && deviceType != 'tv'){
              expect(avoidArea7.bottomRect.width).assertLarger(0);
              expect(avoidArea7.bottomRect.height).assertLarger(0);
            }else{
              expect(avoidArea7.bottomRect.width).assertEqual(0);
              expect(avoidArea7.bottomRect.height).assertEqual(0);
            }
            
            await terminateAbility3(caseName);
            done()
          } catch (error) {
            console.error(caseName + ' failed4, error: ' + JSON.stringify(error));
            await terminateAbility3(caseName);
            if (!canIUseRes) {
              expect(error.code).assertEqual(801)
            } else {
              expect().assertFail();
            }
            done()
          }
        } else {
          await terminateAbility3(caseName);
          done();
        }
      } catch (err) {
        console.error(caseName + ' failed, err: ' + JSON.stringify(err));
        expect().assertFail();
        await terminateAbility3(caseName);
        done();
      }
    });

    /**
     * @tc.number     SUB_BASIC_WMS_GET_WINDOW_AVOID_AREA_IGNORING_VISIBILITY_0500
     * @tc.name       testNotFreeMultWindowMainWindowDestroyGetWindowAvoidAreaIgnoringVisibilityCutout
     * @tc.desc       销毁窗口后调用getWindowAvoidAreaIgnoringVisibility接口
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level2
     */
    it('testNotFreeMultWindowMainWindowDestroyGetWindowAvoidAreaIgnoringVisibilityCutout', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'testNotFreeMultWindowMainWindowDestroyGetWindowAvoidAreaIgnoringVisibilityCutout';
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      let subWindowClass = await windowStage.createSubWindow(caseName);
      await subWindowClass.destroyWindow();
      try {
        let avoidArea1 = subWindowClass.getWindowAvoidAreaIgnoringVisibility(window.AvoidAreaType.TYPE_SYSTEM);
        console.info(caseName + ' avoidArea1: ' + JSON.stringify(avoidArea1));
        let avoidArea2 = subWindowClass.getWindowAvoidAreaIgnoringVisibility(window.AvoidAreaType.TYPE_CUTOUT);
        console.info(caseName + ' avoidArea2: ' + JSON.stringify(avoidArea2));
        let avoidArea3 = subWindowClass.getWindowAvoidAreaIgnoringVisibility(window.AvoidAreaType.TYPE_KEYBOARD);
        console.info(caseName + ' avoidArea3: ' + JSON.stringify(avoidArea3));
        let avoidArea4 = subWindowClass.getWindowAvoidAreaIgnoringVisibility(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR);
        console.info(caseName + ' avoidArea4: ' + JSON.stringify(avoidArea4));
        expect().assertFail();
        done();
      } catch (err) {
        console.error(caseName + ' failed, err: ' + JSON.stringify(err));
        expect(err.code).assertEqual(1300002)
        done();
      }
    });


    /**
     * @tc.number     SUB_BASIC_WMS_GET_WINDOW_AVOID_AREA_IGNORING_VISIBILITY_0600
     * @tc.name       testNotFreeMultWindowMainWindowSubwindowGetWindowAvoidAreaIgnoringVisibilityKeyboard
     * @tc.desc       验证在非自由多窗模式下状态栏、导航条隐藏时子窗与主窗位置大小一致时调用getWindowAvoidAreaIgnoringVisibility接口
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it('testNotFreeMultWindowMainWindowSubwindowGetWindowAvoidAreaIgnoringVisibilityKeyboard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testNotFreeMultWindowMainWindowSubwindowGetWindowAvoidAreaIgnoringVisibilityKeyboard';
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      let windowStageStart = await startAbility3(caseName, context);
      let windowClass = windowStageStart.getMainWindowSync();
      let isInFreeWindowMode = windowClass.isInFreeWindowMode();
      console.info(caseName + ' isInFreeWindowMode: ' + JSON.stringify(isInFreeWindowMode));
      try {
        if (!isInFreeWindowMode) {
          await windowClass.maximize();
          const mainWindowProperties = windowClass.getWindowProperties();
          const mainWindowRect = mainWindowProperties.windowRect;
          console.info(caseName + ' Main window rect: ' + JSON.stringify(mainWindowRect));
          let subWindow = await windowStageStart.createSubWindow(caseName);
          await subWindow.resize(mainWindowRect.width, mainWindowRect.height);
          await subWindow.moveWindowTo(mainWindowRect.left, mainWindowRect.top);
          console.info(caseName + ' Sub window resized and moved to match main window');
          await subWindow.setUIContent("testability/pages/First/index2");
          await subWindow.showWindow();
          try {
            let avoidArea1 = windowClass.getWindowAvoidAreaIgnoringVisibility(window.AvoidAreaType.TYPE_SYSTEM);
            console.info(caseName + ' avoidArea1: ' + JSON.stringify(avoidArea1));
            let avoidArea2 = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
            console.info(caseName + ' avoidArea2: ' + JSON.stringify(avoidArea2));
            expect(avoidArea1.leftRect.left).assertEqual(avoidArea2.leftRect.left);
            expect(avoidArea1.leftRect.top).assertEqual(avoidArea2.leftRect.top);
            expect(avoidArea1.leftRect.width).assertEqual(avoidArea2.leftRect.width);
            expect(avoidArea1.leftRect.height).assertEqual(avoidArea2.leftRect.height);

            expect(avoidArea1.rightRect.left).assertEqual(avoidArea2.rightRect.left);
            expect(avoidArea1.rightRect.top).assertEqual(avoidArea2.rightRect.top);
            expect(avoidArea1.rightRect.width).assertEqual(avoidArea2.rightRect.width);
            expect(avoidArea1.rightRect.height).assertEqual(avoidArea2.rightRect.height);

            expect(avoidArea1.topRect.left).assertEqual(avoidArea2.topRect.left);
            expect(avoidArea1.topRect.top).assertEqual(avoidArea2.topRect.top);
            expect(avoidArea1.topRect.width).assertEqual(avoidArea2.topRect.width);
            expect(avoidArea1.topRect.height).assertEqual(avoidArea2.topRect.height);

            expect(avoidArea1.bottomRect.left).assertEqual(avoidArea2.bottomRect.left);
            expect(avoidArea1.bottomRect.top).assertEqual(avoidArea2.bottomRect.top);
            expect(avoidArea1.bottomRect.width).assertEqual(avoidArea2.bottomRect.width);
            expect(avoidArea1.bottomRect.height).assertEqual(avoidArea2.bottomRect.height);
          } catch (error) {
            console.error(caseName + ' failed1, error: ' + JSON.stringify(error));
            await terminateAbility3(caseName);
            if (!canIUseRes) {
              expect(error.code).assertEqual(801)
            } else {
              expect().assertFail();
            }
            done()
          }

          try {
            let avoidArea3 = windowClass.getWindowAvoidAreaIgnoringVisibility(window.AvoidAreaType.TYPE_CUTOUT);
            console.info(caseName + ' avoidArea3: ' + JSON.stringify(avoidArea3));
            let avoidArea4 = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_CUTOUT)
            console.info(caseName + ' avoidArea4: ' + JSON.stringify(avoidArea4));
            expect(avoidArea3.leftRect.left).assertEqual(avoidArea4.leftRect.left);
            expect(avoidArea3.leftRect.top).assertEqual(avoidArea4.leftRect.top);
            expect(avoidArea3.leftRect.width).assertEqual(avoidArea4.leftRect.width);
            expect(avoidArea3.leftRect.height).assertEqual(avoidArea4.leftRect.height);

            expect(avoidArea3.rightRect.left).assertEqual(avoidArea4.rightRect.left);
            expect(avoidArea3.rightRect.top).assertEqual(avoidArea4.rightRect.top);
            expect(avoidArea3.rightRect.width).assertEqual(avoidArea4.rightRect.width);
            expect(avoidArea3.rightRect.height).assertEqual(avoidArea4.rightRect.height);

            expect(avoidArea3.topRect.left).assertEqual(avoidArea4.topRect.left);
            expect(avoidArea3.topRect.top).assertEqual(avoidArea4.topRect.top);
            expect(avoidArea3.topRect.width).assertEqual(avoidArea4.topRect.width);
            expect(avoidArea3.topRect.height).assertEqual(avoidArea4.topRect.height);

            expect(avoidArea3.bottomRect.left).assertEqual(avoidArea4.bottomRect.left);
            expect(avoidArea3.bottomRect.top).assertEqual(avoidArea4.bottomRect.top);
            expect(avoidArea3.bottomRect.width).assertEqual(avoidArea4.bottomRect.width);
            expect(avoidArea3.bottomRect.height).assertEqual(avoidArea4.bottomRect.height);
          } catch (error) {
            console.error(caseName + ' failed2, error: ' + JSON.stringify(error));
            await terminateAbility3(caseName);
            if (!canIUseRes) {
              expect(error.code).assertEqual(801)
            } else {
              expect().assertFail();
            }
            done()
          }

          try {
            let avoidArea5 = windowClass.getWindowAvoidAreaIgnoringVisibility(window.AvoidAreaType.TYPE_KEYBOARD);
            console.info(caseName + ' avoidArea5: ' + JSON.stringify(avoidArea5));
            let avoidArea6 = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_KEYBOARD)
            console.info(caseName + ' avoidArea6: ' + JSON.stringify(avoidArea6));
            await terminateAbility3(caseName);
            expect().assertFail();
            done()
          } catch (error) {
            console.error(caseName + ' failed3, error: ' + JSON.stringify(error));
            if (!canIUseRes) {
              expect(error.code).assertEqual(801)
            } else {
              expect(error.code).assertEqual(1300016)
            }
          }

          try {
            let avoidArea7 = windowClass.getWindowAvoidAreaIgnoringVisibility(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR);
            console.info(caseName + ' avoidArea7: ' + JSON.stringify(avoidArea7));
            let avoidArea8 = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR)
            console.info(caseName + ' avoidArea8: ' + JSON.stringify(avoidArea8));
            expect(avoidArea7.leftRect.left).assertEqual(avoidArea8.leftRect.left);
            expect(avoidArea7.leftRect.top).assertEqual(avoidArea8.leftRect.top);
            expect(avoidArea7.leftRect.width).assertEqual(avoidArea8.leftRect.width);
            expect(avoidArea7.leftRect.height).assertEqual(avoidArea8.leftRect.height);

            expect(avoidArea7.rightRect.left).assertEqual(avoidArea8.rightRect.left);
            expect(avoidArea7.rightRect.top).assertEqual(avoidArea8.rightRect.top);
            expect(avoidArea7.rightRect.width).assertEqual(avoidArea8.rightRect.width);
            expect(avoidArea7.rightRect.height).assertEqual(avoidArea8.rightRect.height);

            expect(avoidArea7.topRect.left).assertEqual(avoidArea8.topRect.left);
            expect(avoidArea7.topRect.top).assertEqual(avoidArea8.topRect.top);
            expect(avoidArea7.topRect.width).assertEqual(avoidArea8.topRect.width);
            expect(avoidArea7.topRect.height).assertEqual(avoidArea8.topRect.height);

            expect(avoidArea7.bottomRect.left).assertEqual(avoidArea8.bottomRect.left);
            expect(avoidArea7.bottomRect.top).assertEqual(avoidArea8.bottomRect.top);
            expect(avoidArea7.bottomRect.width).assertEqual(avoidArea8.bottomRect.width);
            expect(avoidArea7.bottomRect.height).assertEqual(avoidArea8.bottomRect.height);
            await terminateAbility3(caseName);
            done()
          } catch (error) {
            console.error(caseName + ' failed4, error: ' + JSON.stringify(error));
            await terminateAbility3(caseName);
            if (!canIUseRes) {
              expect(error.code).assertEqual(801)
            } else {
              expect().assertFail();
            }
            done()
          }
        } else {
          await terminateAbility3(caseName);
          done();
        }
      } catch (err) {
        console.error(caseName + ' failed, err: ' + JSON.stringify(err));
        await terminateAbility3(caseName);
        if (!canIUseRes) {
          expect(err.code).assertEqual(801)
        } else {
          expect().assertFail();
        }
        done()
      }
    });


    /**
     * @tc.number     SUB_WMS_SYSTEM_PROPERTIES_AVOID_AREA_0200
     * @tc.name       testEnvSystemPropertiesWindowAvoidAreawithSubWindow
     * @tc.desc       testEnvSystemPropertiesWindowAvoidAreawithSubWindow
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it('testEnvSystemPropertiesWindowAvoidAreawithSubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testEnvSystemPropertiesWindowAvoidAreawithSubWindow';
      let driver = await Driver.create();
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      let isInFreeWindowMode = windowStage.getMainWindowSync().isInFreeWindowMode();
      console.info(caseName + ' isInFreeWindowMode: ' + JSON.stringify(isInFreeWindowMode));
      let windowClass: window.Window | undefined;
      let mainWindow = windowStage.getMainWindowSync();
      try {
        if (!isInFreeWindowMode && canIUseRes && isSupportRotate == true) {
          let displayInfo = await display.getDefaultDisplaySync();
          console.info(caseName + ' displayInfo: ' + JSON.stringify(displayInfo));
          windowClass = await windowStage.createSubWindow('testEnvSystemPropertiesWindowAvoidAreawithSubWindow');
          await windowClass.resize(mainWindow.getWindowProperties().windowRect.width, mainWindow.getWindowProperties().windowRect.height);
          await windowClass.setUIContent('testability/pages/Index4');
          await windowClass.showWindow();
          await sleep(1000);
          let avoidAreaAreaStatusW = 0;
          let avoidAreaAreaStatusH = 0;
          let avoidAreaAreaNavW = 0;
          let avoidAreaAreaNavH = 0;
          let avoidAreaKeyboard: window.AvoidArea = {
            visible: false,
            leftRect: {left: 0, top: 0, width: 0, height: 0},
            bottomRect: {left: 0, top: 0, width: 0, height: 0},
            rightRect: {left: 0, top: 0, width: 0, height: 0},
            topRect: {left: 0, top: 0, width: 0, height: 0},
          }
          const callback = (res: window.AvoidAreaOptions) => {
            console.info(caseName + ' callback result: ' + JSON.stringify(res));
            if (res.type == window.AvoidAreaType.TYPE_SYSTEM) {
              console.info(caseName + ' callback result, AvoidAreaType.TYPE_SYSTEM area: ' + JSON.stringify(res.area));
              avoidAreaAreaStatusW = res.area.topRect.width;
              avoidAreaAreaStatusH = res.area.topRect.height;
              expect(res.area.topRect.width).assertEqual(0)
              expect(res.area.topRect.height).assertEqual(0)
              expect(res.area.topRect.left).assertEqual(0)
              expect(res.area.topRect.top).assertEqual(0)

              expect(res.area.leftRect.left).assertEqual(0);
              expect(res.area.leftRect.top).assertEqual(0);
              expect(res.area.leftRect.width).assertEqual(0);
              expect(res.area.leftRect.height).assertEqual(0);

              expect(res.area.rightRect.left).assertEqual(0);
              expect(res.area.rightRect.top).assertEqual(0);
              expect(res.area.rightRect.width).assertEqual(0);
              expect(res.area.rightRect.height).assertEqual(0);

              expect(res.area.bottomRect.left).assertEqual(0);
              expect(res.area.bottomRect.top).assertEqual(0);
              expect(res.area.bottomRect.width).assertEqual(0);
              expect(res.area.bottomRect.height).assertEqual(0);
            } else if (res.type == window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR) {
              console.info(caseName + ' callback result, AvoidAreaType.TYPE_NAVIGATION_INDICATOR area: ' + JSON.stringify(res.area));
              avoidAreaAreaNavW = res.area.bottomRect.width;
              avoidAreaAreaNavH = res.area.bottomRect.height;
              expect(res.area.topRect.width).assertEqual(0)
              expect(res.area.topRect.height).assertEqual(0)
              expect(res.area.topRect.left).assertEqual(0)
              expect(res.area.topRect.top).assertEqual(0)

              expect(res.area.leftRect.left).assertEqual(0);
              expect(res.area.leftRect.top).assertEqual(0);
              expect(res.area.leftRect.width).assertEqual(0);
              expect(res.area.leftRect.height).assertEqual(0);

              expect(res.area.rightRect.left).assertEqual(0);
              expect(res.area.rightRect.top).assertEqual(0);
              expect(res.area.rightRect.width).assertEqual(0);
              expect(res.area.rightRect.height).assertEqual(0);

              expect(res.area.bottomRect.left).assertEqual(0);
              expect(res.area.bottomRect.top).assertEqual(0);
              expect(res.area.bottomRect.width).assertEqual(0);
              expect(res.area.bottomRect.height).assertEqual(0);
            } else if (res.type == window.AvoidAreaType.TYPE_KEYBOARD) {
              console.info(caseName + ' callback result, AvoidAreaType.TYPE_KEYBOARD area: ' + JSON.stringify(res.area));
              avoidAreaKeyboard = res.area
              avoidAreaKeyboard.visible = res.area.visible

              avoidAreaKeyboard.leftRect.left = res.area.leftRect.left
              avoidAreaKeyboard.leftRect.top = res.area.leftRect.top
              avoidAreaKeyboard.leftRect.width = res.area.leftRect.width
              avoidAreaKeyboard.leftRect.height = res.area.leftRect.height

              avoidAreaKeyboard.rightRect.left = res.area.rightRect.left
              avoidAreaKeyboard.rightRect.top = res.area.rightRect.top
              avoidAreaKeyboard.rightRect.width = res.area.rightRect.width
              avoidAreaKeyboard.rightRect.height = res.area.rightRect.height

              avoidAreaKeyboard.topRect.left = res.area.topRect.left
              avoidAreaKeyboard.topRect.top = res.area.topRect.top
              avoidAreaKeyboard.topRect.width = res.area.topRect.width
              avoidAreaKeyboard.topRect.height = res.area.topRect.height

              avoidAreaKeyboard.bottomRect.left = res.area.bottomRect.left
              avoidAreaKeyboard.bottomRect.top = res.area.bottomRect.top
              avoidAreaKeyboard.bottomRect.width = res.area.bottomRect.width
              avoidAreaKeyboard.bottomRect.height = res.area.bottomRect.height
            }
          }
          windowClass.on('avoidAreaChange', callback);
          await mainWindow.setWindowSystemBarEnable([]);
          await sleep(2000);
          let btnClick = await driver.findComponent(ON.id('index4Btn'))
          console.info(caseName + ' btnClick: ' + JSON.stringify(btnClick));
          await sleep(1000)
          await btnClick.click();
          await sleep(1000);
          let statusBarVP:window.UIEnvAvoidAreaVP = AppStorage.get('statusBarVP') as window.UIEnvAvoidAreaVP;
          console.log(caseName + ' windowAvoidAreaInfoVP statusBarVP: ' + JSON.stringify(statusBarVP))
          let cutoutVP:window.UIEnvAvoidAreaVP = AppStorage.get('cutoutVP') as window.UIEnvAvoidAreaVP;
          console.log(caseName + ' windowAvoidAreaInfoVP cutoutVP: ' + JSON.stringify(cutoutVP))

          let navigationIndicatorVP:window.UIEnvAvoidAreaVP = AppStorage.get('navigationIndicatorVP') as window.UIEnvAvoidAreaVP;
          console.log(caseName + ' windowAvoidAreaInfoVP navigationIndicatorVP: ' + JSON.stringify(navigationIndicatorVP))

          let statusBarPX:window.UIEnvAvoidAreaVP = AppStorage.get('statusBarPX') as window.UIEnvAvoidAreaVP;
          console.log(caseName + ' windowAvoidAreaInfoVP statusBarPX: ' + JSON.stringify(statusBarPX))
          let cutoutPX:window.UIEnvAvoidAreaVP = AppStorage.get('cutoutPX') as window.UIEnvAvoidAreaVP;
          console.log(caseName + ' windowAvoidAreaInfoVP cutoutPX: ' + JSON.stringify(cutoutPX))

          let navigationIndicatorPX:window.UIEnvAvoidAreaVP = AppStorage.get('navigationIndicatorPX') as window.UIEnvAvoidAreaVP;
          console.log(caseName + ' windowAvoidAreaInfoVP navigationIndicatorPX: ' + JSON.stringify(navigationIndicatorPX))

          await sleep(1000)
          expect(statusBarPX.topRect.width).assertEqual(avoidAreaAreaStatusW);
          expect(statusBarPX.topRect.height).assertEqual(avoidAreaAreaStatusH);
          console.log(caseName + ' px2vp(avoidAreaAreaStatusW): ' + px2vp(avoidAreaAreaStatusW))
          console.log(caseName + ' px2vp(avoidAreaAreaStatusH): ' + px2vp(avoidAreaAreaStatusH))
          expect(statusBarVP.topRect.width).assertEqual(px2vp(avoidAreaAreaStatusW));
          expect(statusBarVP.topRect.height).assertEqual(px2vp(avoidAreaAreaStatusH));

          expect(navigationIndicatorPX.bottomRect.width).assertEqual(avoidAreaAreaNavW);
          expect(navigationIndicatorPX.bottomRect.height).assertEqual(avoidAreaAreaNavH);
          console.log(caseName + ' px2vp(avoidAreaAreaNavW): ' + px2vp(avoidAreaAreaNavW))
          console.log(caseName + ' px2vp(avoidAreaAreaNavH): ' + px2vp(avoidAreaAreaNavH))
          expect(navigationIndicatorVP.bottomRect.width).assertEqual(px2vp(avoidAreaAreaNavW));
          expect(navigationIndicatorVP.bottomRect.height).assertEqual(px2vp(avoidAreaAreaNavH));

          expect(statusBarVP.visible).assertEqual(true)
          expect(statusBarVP.topRect.left).assertEqual(0)
          expect(statusBarVP.topRect.top).assertEqual(0)
          expect(statusBarVP.topRect.width).assertEqual(0);
          expect(statusBarVP.topRect.height).assertEqual(0);
          expect(statusBarVP.leftRect.left).assertEqual(0)
          expect(statusBarVP.leftRect.top).assertEqual(0)
          expect(statusBarVP.leftRect.width).assertEqual(0);
          expect(statusBarVP.leftRect.height).assertEqual(0);
          expect(statusBarVP.rightRect.left).assertEqual(0)
          expect(statusBarVP.rightRect.top).assertEqual(0)
          expect(statusBarVP.rightRect.width).assertEqual(0);
          expect(statusBarVP.rightRect.height).assertEqual(0);
          expect(statusBarVP.bottomRect.left).assertEqual(0)
          expect(statusBarVP.bottomRect.top).assertEqual(0)
          expect(statusBarVP.bottomRect.width).assertEqual(0);
          expect(statusBarVP.bottomRect.height).assertEqual(0);
          expect(cutoutVP.topRect.left).assertLargerOrEqual(0)
          expect(cutoutVP.topRect.top).assertLargerOrEqual(0)
          expect(cutoutVP.topRect.width).assertLargerOrEqual(0);
          expect(cutoutVP.topRect.height).assertLargerOrEqual(0);

          let input = await driver.findComponent(ON.id('textInput'));
          console.info(caseName + ' input: ' + JSON.stringify(input));
          await sleep(1000);
          await input.click();
          await sleep(1000);
          let btnClick2 = await driver.findComponent(ON.id('index4Btn'))
          await sleep(1000)
          await btnClick2.click();
          await sleep(1000);

          let keyboardVP:window.UIEnvAvoidAreaVP = AppStorage.get('keyboardVP') as window.UIEnvAvoidAreaVP;
          console.log(caseName + ' windowAvoidAreaInfoVP keyboardVP: ' + JSON.stringify(keyboardVP))
          let keyboardPX:window.UIEnvAvoidAreaVP = AppStorage.get('keyboardPX') as window.UIEnvAvoidAreaVP;
          console.log(caseName + ' windowAvoidAreaInfoVP keyboardPX: ' + JSON.stringify(keyboardPX))

          console.info(caseName + ' avoidAreaKeyboard: ' + JSON.stringify(avoidAreaKeyboard));
          await sleep(1000)
          expect(keyboardPX.visible).assertEqual(avoidAreaKeyboard?.visible)
          expect(keyboardPX.bottomRect.left).assertEqual(avoidAreaKeyboard?.bottomRect.left)
          expect(keyboardPX.bottomRect.top).assertEqual(avoidAreaKeyboard?.bottomRect.top)
          expect(keyboardPX.bottomRect.width).assertEqual(avoidAreaKeyboard?.bottomRect.width);
          expect(keyboardPX.bottomRect.height).assertEqual(avoidAreaKeyboard?.bottomRect.height);
          expect(keyboardPX.leftRect.left).assertEqual(avoidAreaKeyboard?.leftRect.left);
          expect(keyboardPX.leftRect.top).assertEqual(avoidAreaKeyboard?.leftRect.top);
          expect(keyboardPX.leftRect.width).assertEqual(avoidAreaKeyboard?.leftRect.width);
          expect(keyboardPX.leftRect.height).assertEqual(avoidAreaKeyboard?.leftRect.height);
          expect(keyboardPX.rightRect.left).assertEqual(avoidAreaKeyboard?.rightRect.left);
          expect(keyboardPX.rightRect.top).assertEqual(avoidAreaKeyboard?.rightRect.top);
          expect(keyboardPX.rightRect.width).assertEqual(avoidAreaKeyboard?.rightRect.width);
          expect(keyboardPX.rightRect.height).assertEqual(avoidAreaKeyboard?.rightRect.height);
          expect(keyboardPX.topRect.left).assertEqual(avoidAreaKeyboard?.topRect.left);
          expect(keyboardPX.topRect.top).assertEqual(avoidAreaKeyboard?.topRect.top);
          expect(keyboardPX.topRect.width).assertEqual(avoidAreaKeyboard?.topRect.width);
          expect(keyboardPX.topRect.height).assertEqual(avoidAreaKeyboard?.topRect.height);

          expect(keyboardVP.visible).assertEqual(avoidAreaKeyboard?.visible)
          console.log(caseName + ' px2vp(avoidAreaKeyboard?.bottomRect.left): ' + px2vp(avoidAreaKeyboard?.bottomRect.left))
          expect(keyboardVP.bottomRect.left).assertEqual(px2vp(avoidAreaKeyboard?.bottomRect.left))
          console.log(caseName + ' px2vp(avoidAreaKeyboard?.bottomRect.top): ' + px2vp(avoidAreaKeyboard?.bottomRect.top))
          expect(keyboardVP.bottomRect.top).assertEqual(px2vp(avoidAreaKeyboard?.bottomRect.top))
          console.log(caseName + ' px2vp(avoidAreaKeyboard?.bottomRect.width): ' + px2vp(avoidAreaKeyboard?.bottomRect.width))
          expect(keyboardVP.bottomRect.width).assertEqual(px2vp(avoidAreaKeyboard?.bottomRect.width));
          console.log(caseName + ' px2vp(avoidAreaKeyboard?.bottomRect.height): ' + px2vp(avoidAreaKeyboard?.bottomRect.height))
          expect(keyboardVP.bottomRect.height).assertEqual(px2vp(avoidAreaKeyboard?.bottomRect.height));
          console.log(caseName + ' px2vp(avoidAreaKeyboard?.leftRect.left): ' + px2vp(avoidAreaKeyboard?.leftRect.left))
          expect(keyboardVP.leftRect.left).assertEqual(px2vp(avoidAreaKeyboard?.leftRect.left));
          console.log(caseName + ' px2vp(avoidAreaKeyboard?.leftRect.top): ' + px2vp(avoidAreaKeyboard?.leftRect.top))
          expect(keyboardVP.leftRect.top).assertEqual(px2vp(avoidAreaKeyboard?.leftRect.top));
          console.log(caseName + ' px2vp(avoidAreaKeyboard?.leftRect.width): ' + px2vp(avoidAreaKeyboard?.leftRect.width))
          expect(keyboardVP.leftRect.width).assertEqual(px2vp(avoidAreaKeyboard?.leftRect.width));
          console.log(caseName + ' px2vp(avoidAreaKeyboard?.leftRect.height): ' + px2vp(avoidAreaKeyboard?.leftRect.height))
          expect(keyboardVP.leftRect.height).assertEqual(px2vp(avoidAreaKeyboard?.leftRect.height));
          console.log(caseName + ' px2vp(avoidAreaKeyboard?.rightRect.left): ' + px2vp(avoidAreaKeyboard?.rightRect.left))
          expect(keyboardVP.rightRect.left).assertEqual(px2vp(avoidAreaKeyboard?.rightRect.left));
          console.log(caseName + ' px2vp(avoidAreaKeyboard?.rightRect.top): ' + px2vp(avoidAreaKeyboard?.rightRect.top))
          expect(keyboardVP.rightRect.top).assertEqual(px2vp(avoidAreaKeyboard?.rightRect.top));
          console.log(caseName + ' px2vp(avoidAreaKeyboard?.rightRect.width): ' + px2vp(avoidAreaKeyboard?.rightRect.width))
          expect(keyboardVP.rightRect.width).assertEqual(px2vp(avoidAreaKeyboard?.rightRect.width));
          console.log(caseName + ' px2vp(avoidAreaKeyboard?.rightRect.height): ' + px2vp(avoidAreaKeyboard?.rightRect.height))
          expect(keyboardVP.rightRect.height).assertEqual(px2vp(avoidAreaKeyboard?.rightRect.height));
          console.log(caseName + ' px2vp(avoidAreaKeyboard?.topRect.left): ' + px2vp(avoidAreaKeyboard?.topRect.left))
          expect(keyboardVP.topRect.left).assertEqual(px2vp(avoidAreaKeyboard?.topRect.left));
          console.log(caseName + ' px2vp(avoidAreaKeyboard?.topRect.top): ' + px2vp(avoidAreaKeyboard?.topRect.top))
          expect(keyboardVP.topRect.top).assertEqual(px2vp(avoidAreaKeyboard?.topRect.top));
          console.log(caseName + ' px2vp(avoidAreaKeyboard?.topRect.width): ' + px2vp(avoidAreaKeyboard?.topRect.width))
          expect(keyboardVP.topRect.width).assertEqual(px2vp(avoidAreaKeyboard?.topRect.width));
          console.log(caseName + ' px2vp(avoidAreaKeyboard?.topRect.height): ' + px2vp(avoidAreaKeyboard?.topRect.height))
          expect(keyboardVP.topRect.height).assertEqual(px2vp(avoidAreaKeyboard?.topRect.height));
          await windowClass?.destroyWindow();
          done();
        } else {
          await windowClass?.destroyWindow();
          done();
        }
      } catch (err) {
        console.error(caseName + ' failed, err: ' + JSON.stringify(err));
        await windowClass?.destroyWindow();
        expect().assertFail();
        done();
      }
    });


  })
}

