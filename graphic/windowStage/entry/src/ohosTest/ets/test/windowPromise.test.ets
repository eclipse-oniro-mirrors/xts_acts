/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, it, expect } from "@ohos/hypium";
import ohosWindow from '@ohos.window';
import display from '@ohos.display';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import settings from '@ohos.settings';
import image from '@ohos.multimedia.image';

function expectedError(TRUE_FLAG: boolean, error: BusinessError, caseName: string, apiName: string, done: Function,
  code: number) {
  let msgStr: string = 'jsUnittest ' + caseName + ' ' + apiName + ' failed, err: ';
  console.log(msgStr + JSON.stringify(error));
  if (error.code == code) {
    expect(TRUE_FLAG).assertTrue();
  }
  done();
}

function unexpectedError(TRUE_FLAG: boolean, error: BusinessError, caseName: string, apiName: string, done: Function) {
  let msgStr: string = 'jsUnittest ' + caseName + ' ' + apiName + ' failed, err: ';
  console.log(msgStr + JSON.stringify(error));
  expect(TRUE_FLAG).assertFail();
  done();
}

async function sleep(time: number) {
  let timeoutId: number = 0;
  let promise = new Promise<string>(resolve => {
    timeoutId = setTimeout(() => {
      resolve('sleep finished');
    }, time);
  })
  await promise;
  clearTimeout(timeoutId)
}

export default function windowPromiseTest(context: common.UIAbilityContext, windowStage: ohosWindow.WindowStage,
  abilityStorage: LocalStorage) {
  describe('windowPromise_test', () => {
    console.log('describe window_api_test start!!!')
    let WindowStage: ohosWindow.WindowStage;
    const TRUE_FLAG: boolean = true;
    let isPCStatus:string = settings.getValueSync(context,'isStatusBarExist','',settings.domainName.USER_PROPERTY);
    console.info(`beforeAll isPCStatus: ${isPCStatus}`);
    let commonRGBColorArr: Array<string> =
      ['rgb(255,0,0)', 'rgb(0,255,0)', 'rgb(0,0,255)', 'rgb(255,255,255)', 'rgb(0,0,0)', 'rgb(249,0,230)',
        'rgb(102,102,102)', 'rgb(255,247,0)'];
    let commonNUMBERColorArr: Array<string> =
      ['#00FF0000', '#0000FF00', '#000000FF', '#00FFFFFF', '#00000000', '#00F900E6', '#00666666', '#00FFF700'];
    let commonKEYColorArr: Array<string> = ['red', 'green', 'blue', 'white', 'black', 'pink', 'grey', 'yellow'];
    let avoidArea1: ohosWindow.AvoidArea;
    
    beforeAll(async () => {
      let windowClass = windowStage.getMainWindowSync();
        await windowClass.setWindowLayoutFullScreen(false);
        await windowClass.setWindowSystemBarEnable(['status']);
        let type:ohosWindow.AvoidAreaType = ohosWindow.AvoidAreaType.TYPE_SYSTEM;
        avoidArea1 = windowClass.getWindowAvoidArea(type);
        console.info(` Succeeded in getWindowAvoidArea1. Data: ${JSON.stringify(avoidArea1)}`);
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0760
     * @tc.name      : testListener_Sys_AvoidAreaChange_Promise
     * @tc.desc      : Verify whether the change monitoring of avoidance area can be started normally.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testListener_Sys_AvoidAreaChange_Promise', 0, async (done: Function) => {
      await sleep(800)
      let caseName: string = 'testListener_Sys_AvoidAreaChange_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      let listenerOnFlag: boolean = false;
      console.log(msgStr + 'begin');
      let tempWnd: ohosWindow.Window | void;
      if((avoidArea1.topRect.width != 0 && avoidArea1.topRect.height != 0) && (isPCStatus == ''|| isPCStatus == '1')){
        tempWnd = await windowStage.getMainWindow().catch((err: BusinessError) => {
          unexpectedError(TRUE_FLAG, err, caseName, 'windowStage.getMainWindow', done);
        });
        expect(!!tempWnd).assertTrue();
        console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
        await (tempWnd as ohosWindow.Window).setWindowLayoutFullScreen(true).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
        (tempWnd as ohosWindow.Window).on('systemAvoidAreaChange', (avoidAreaData: ohosWindow.AvoidArea) => {
          console.log(msgStr + 'tempWnd.on systemAvoidAreaChange, avoidAreaData : ' + JSON.stringify(avoidAreaData));
          console.log(msgStr + 'tempWnd.on systemAvoidAreaChange, listenerOnFlag : ' + JSON.stringify(listenerOnFlag));
          if (listenerOnFlag) {
            expect(!!avoidAreaData).assertTrue();
            (tempWnd as ohosWindow.Window).off('systemAvoidAreaChange');
            done();
          }
        })
  
        await (tempWnd as ohosWindow.Window).show().catch((err: BusinessError) => {
          unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.show', done);
        });
        console.log(msgStr + 'tempWnd.show success');
        await (tempWnd as ohosWindow.Window).setFullScreen(true).catch((err: BusinessError) => {
          unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.setFullScreen(true)', done);
        });
        console.log(msgStr + 'tempWnd.setFullScreen(true) success');
        await (tempWnd as ohosWindow.Window).setWindowLayoutFullScreen(false).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
        console.log(msgStr + 'tempWnd.setWindowLayoutFullScreen(false) success');
        await (tempWnd as ohosWindow.Window).setSystemBarEnable([]).catch((err: BusinessError) => {
          unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.setSystemBarEnable([])', done);
        });
        console.log(msgStr + 'tempWnd.setSystemBarEnable([]) success');
        listenerOnFlag = true;
        await sleep(800);
        await (tempWnd as ohosWindow.Window).setWindowLayoutFullScreen(true).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
        console.log(msgStr + 'tempWnd.setWindowLayoutFullScreen(true) success');
        await (tempWnd as ohosWindow.Window).setSystemBarEnable(['status', 'navigation']).catch((err: BusinessError) => {
          unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
        });
        console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success');
      }
      else{
        console.info(`${caseName} not support, isPCStatus: ${isPCStatus}`);
        done();
      }
      
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0770
     * @tc.name      : testListener_windowSizeChange
     * @tc.desc      : Verify that the window size avoidance area changes and monitor whether it can be opened normally.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testListener_windowSizeChange', 0, async (done: Function) => {
      await sleep(900)
      let caseName: string = 'testListener_windowSizeChange';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      let resizeValue = 1000;
      console.log(msgStr + 'begin');
      let flag = false;
      let tempWnd: ohosWindow.Window | void;
      tempWnd = await windowStage.createSubWindow('testShowWindowTest_Callback_Form').catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!tempWnd).assertTrue();
      await sleep(900);
      (tempWnd as ohosWindow.Window).on('windowSizeChange', async (sizeData) => {
        console.log(msgStr + 'tempWnd.on windowSizeChange, systemBatData : ' + JSON.stringify(sizeData));
        if (flag) {
          expect(!!sizeData).assertTrue();
          (tempWnd as ohosWindow.Window).off('windowSizeChange');
          await (tempWnd as ohosWindow.Window).destroy();
          done();
        }
      })
      await (tempWnd as ohosWindow.Window).show().catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      flag = true
      await (tempWnd as ohosWindow.Window).resetSize(resizeValue, resizeValue).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.resetSize(' + resizeValue + ', ' + resizeValue + ')', done);
      });
      await sleep(900);
      console.log(msgStr + 'tempWnd.resetSize(' + resizeValue + ', ' + resizeValue + ') success');
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0740
     * @tc.name      : testListener_SystemAvoidAreaChange_Off
     * @tc.desc      : Verify whether the change monitoring of avoidance area can be started normally.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testListener_SystemAvoidAreaChange_Off', 0, async (done: Function) => {
      await sleep(800)
      let caseName: string = 'testListener_SystemAvoidAreaChange_Off';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin 1');
      let tempWnd: ohosWindow.Window | void;

      if((avoidArea1.topRect.width != 0 && avoidArea1.topRect.height != 0) && (isPCStatus == ''|| isPCStatus == '1')){
        tempWnd = await windowStage.getMainWindow().catch((err: BusinessError) => {
          unexpectedError(TRUE_FLAG, err, caseName, 'windowStage.getMainWindow', done);
        });
        console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
        expect(!!tempWnd).assertTrue();
        await (tempWnd as ohosWindow.Window).setWindowLayoutFullScreen(true).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
        (tempWnd as ohosWindow.Window).on('systemAvoidAreaChange', (avoidAreaData) => {
          console.log(msgStr + 'tempWnd.on systemAvoidAreaChange, systemBatData : ' + JSON.stringify(avoidAreaData));
          (tempWnd as ohosWindow.Window).off('systemAvoidAreaChange');
          done();
        })
        console.log(msgStr + 'tempWnd.on systemAvoidAreaChange finished');
        await (tempWnd as ohosWindow.Window).show().catch((err: BusinessError) => {
          unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.show', done);
        });
        console.log(msgStr + 'tempWnd.show success');
        await (tempWnd as ohosWindow.Window).setFullScreen(true).catch((err: BusinessError) => {
          unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.setFullScreen(true)', done);
        });
        console.log(msgStr + 'tempWnd.setFullScreen(true) success');
        await (tempWnd as ohosWindow.Window).setWindowLayoutFullScreen(false).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
        console.log(msgStr + 'tempWnd.setWindowLayoutFullScreen(false) success');
        await (tempWnd as ohosWindow.Window).setSystemBarEnable([]).catch((err: BusinessError) => {
          unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.setSystemBarEnable([])', done);
        });
        console.log(msgStr + 'tempWnd.setSystemBarEnable([]) success');
        await sleep(500);
        await (tempWnd as ohosWindow.Window).setWindowLayoutFullScreen(true).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
        console.log(msgStr + 'tempWnd.setWindowLayoutFullScreen(true) success');
        await (tempWnd as ohosWindow.Window).setSystemBarEnable(['status', 'navigation']).catch((err: BusinessError) => {
          unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
        });
        await sleep(500);
        console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success');
      }
      else{
        console.info(`${caseName} not support, isPCStatus: ${isPCStatus}`);
        done();
      }
      
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0780
     * @tc.name      : testListener_windowSizeChange_Off
     * @tc.desc      : Verify whether the window size change monitoring can be closed normally.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testListener_windowSizeChange_Off', 0, async (done: Function) => {
      await sleep(900)
      let caseName: string = 'testListener_windowSizeChange_Off';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      let listenerOffFlag: boolean = false;
      console.log(msgStr + 'begin');
      let tempWindow: ohosWindow.Window | void;
      tempWindow =
        await await windowStage.createSubWindow('testShowWindowTest_Callback_Form').catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!tempWindow).assertTrue();
      await (tempWindow as ohosWindow.Window).show().catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await sleep(800);
      await sleep(800);
      (tempWindow as ohosWindow.Window).on('windowSizeChange', async (sizeData: ohosWindow.Size) => {
        console.log(msgStr + 'tempWnd.on windowSizeChange, sizeData : ' + JSON.stringify(sizeData));
        expect(sizeData.width === 1000).assertTrue();
        expect(sizeData.height === 1000).assertTrue();
        (tempWindow as ohosWindow.Window).off('windowSizeChange');
        await (tempWindow as ohosWindow.Window).destroy();
        done();
      })
      console.log(msgStr + 'tempWnd.on windowSizeChange finished');
      await (tempWindow as ohosWindow.Window).resetSize(1000, 1000).then(() => {
        listenerOffFlag = true;
        console.log(msgStr + 'listenerOffFlag:' + listenerOffFlag);
      }).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.resetSize(100, 100)', done);
      });
      console.log(msgStr + 'tempWnd.resetSize(100, 100) success');
      await sleep(800)
      await sleep(800)
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1310
     * @tc.name      : testSetSystemBarEnable_ShowStatusBar_HideNavBar_Promise
     * @tc.desc      : Verify that the scene shows the status bar and hides the navigation bar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarEnable_ShowStatusBar_HideNavBar_Promise', 0, async (done: Function) => {
      let caseName: string = 'testSetSystemBarEnable_ShowStatusBar_HideNavBar_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd: ohosWindow.Window | void;
      tempWnd = await windowStage.getMainWindow().catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
      expect(!!tempWnd).assertTrue();
      await (tempWnd as ohosWindow.Window).show().catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await (tempWnd as ohosWindow.Window).setFullScreen(true).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.setFullScreen(true)', done);
      });
      console.log(msgStr + 'tempWnd.setFullScreen(true) success');
      await (tempWnd as ohosWindow.Window).setSystemBarEnable(['navigation']).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.setSystemBarEnable([navigation])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([status]) success');
      await (tempWnd as ohosWindow.Window).setSystemBarEnable(['status']).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.setSystemBarEnable([status])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([navigation]) success');
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1240
     * @tc.name      : testSetSystemBarEnable_HideStatusBar_ShowNavBar_Promise
     * @tc.desc      : Verify that the scene hides the status bar and displays the navigation bar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarEnable_HideStatusBar_ShowNavBar_Promise', 0, async (done: Function) => {
      let caseName: string = 'testSetSystemBarEnable_HideStatusBar_ShowNavBar_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd: ohosWindow.Window | void;
      tempWnd = await windowStage.getMainWindow().catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
      expect(!!tempWnd).assertTrue();
      await (tempWnd as ohosWindow.Window).show().catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await (tempWnd as ohosWindow.Window).setFullScreen(true).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.setFullScreen(true)', done);
      });
      console.log(msgStr + 'tempWnd.setFullScreen(true) success');
      await (tempWnd as ohosWindow.Window).setSystemBarEnable(['status']).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.setSystemBarEnable([status])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([status]) success');
      await (tempWnd as ohosWindow.Window).setSystemBarEnable(['navigation']).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.setSystemBarEnable([navigation])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([navigation]) success');
      done();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1330
     * @tc.name      : testSetSystemBarEnable_Show_StatusBarAndNavBar_Promise
     * @tc.desc      : Verify that the scene displays both the status bar and the navigation bar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarEnable_Show_StatusBarAndNavBar_Promise', 0, async (done: Function) => {
      let caseName: string = 'testSetSystemBarEnable_Show_StatusBarAndNavBar_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd: ohosWindow.Window | void;
      tempWnd = await windowStage.getMainWindow().catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
      expect(!!tempWnd).assertTrue();
      await (tempWnd as ohosWindow.Window).show().catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await (tempWnd as ohosWindow.Window).setFullScreen(true).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.setFullScreen(true)', done);
      });
      console.log(msgStr + 'tempWnd.setFullScreen(true) success');
      await (tempWnd as ohosWindow.Window).setSystemBarEnable([]).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.setSystemBarEnable([])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([]) success');
      await (tempWnd as ohosWindow.Window).setSystemBarEnable(['status', 'navigation']).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success .');
      done();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1260
     * @tc.name      : testSetSystemBarEnable_Hide_StatusBarAndNavBar_Promise
     * @tc.desc      : Verify that the scene hides both the status bar and the navigation bar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarEnable_Hide_StatusBarAndNavBar_Promise', 0, async (done: Function) => {
      let caseName: string = 'testSetSystemBarEnable_Hide_StatusBarAndNavBar_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd: ohosWindow.Window | void;
      tempWnd = await windowStage.getMainWindow().catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
      expect(!!tempWnd).assertTrue();
      await (tempWnd as ohosWindow.Window).show().catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await (tempWnd as ohosWindow.Window).setFullScreen(true).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.setFullScreen(true)', done);
      });
      console.log(msgStr + 'tempWnd.setFullScreen(true) success');
      await (tempWnd as ohosWindow.Window).setSystemBarEnable(['status', 'navigation']).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success');
      await (tempWnd as ohosWindow.Window).setSystemBarEnable([]).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.setSystemBarEnable([])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([]) success');
      done();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1280
     * @tc.name      : testSetSystemBarEnable_Invalid_Parameter_Promise
     * @tc.desc      : Verify the scene where illegal values are entered when the status bar and navigation bar are displayed
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarEnable_Invalid_Parameter_Promise', 0, async (done: Function) => {
      let caseName: string = 'testSetSystemBarEnable_Invalid_Parameter_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd: ohosWindow.Window | void;
      tempWnd = await windowStage.getMainWindow().catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + JSON.stringify(tempWnd));
      expect(!!tempWnd).assertTrue();
      await (tempWnd as ohosWindow.Window).show().catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await (tempWnd as ohosWindow.Window).setFullScreen(true).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.setFullScreen(true)', done);
        console.log(msgStr + 'tempWnd.setFullScreen(true) err' + JSON.stringify(err));
      });
      console.log(msgStr + 'tempWnd.setFullScreen(true) success');
      await (tempWnd as ohosWindow.Window).setSystemBarEnable([]).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.setSystemBarEnable([])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([]) success');
      await (tempWnd as ohosWindow.Window).setSystemBarEnable([null, undefined]).catch((err: BusinessError) => {
        console.log(msgStr + 'tempWnd.setSystemBarEnable([null, undefined]) err=' + JSON.stringify(err));
        expect(err.code === 1003).assertTrue();
        done();
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([null, undefined]) finished');
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1390
     * @tc.name      : testSetSystemBarProperties_RGB_Promise
     * @tc.desc      : Verify the scene where the colors of the status bar and navigation bar are set in RGB
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarProperties_RGB_Promise', 0, async (done: Function) => {
      let caseName: string = 'testSetSystemBarProperties_RGB_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd: ohosWindow.Window | void;
      tempWnd = await windowStage.getMainWindow().catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
      expect(!!tempWnd).assertTrue();
      await (tempWnd as ohosWindow.Window).show().catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await (tempWnd as ohosWindow.Window).setFullScreen(true).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.setFullScreen(true)', done);
      });
      console.log(msgStr + 'tempWnd.setFullScreen(true) success');
      await (tempWnd as ohosWindow.Window).setSystemBarEnable(['status', 'navigation']).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success');
      let loopCount = commonRGBColorArr.length;
      for (let i = 0; i < loopCount; i++) {
        let tempColor = commonRGBColorArr[i];
        let systemBarProperties: ohosWindow.SystemBarProperties = {
          statusBarColor: tempColor,
          isStatusBarLightIcon: true,
          statusBarContentColor: tempColor,
          navigationBarColor: tempColor,
          isNavigationBarLightIcon: false,
          navigationBarContentColor: tempColor,
          enableStatusBarAnimation: false,
          enableNavigationBarAnimation: false,
        };
        await (tempWnd as ohosWindow.Window).setSystemBarProperties(systemBarProperties).then(() => {
          console.log(msgStr + 'tempWnd.setSystemBarProperties ' + tempColor + ' success');
          done();
        }, (err: BusinessError) => {
          console.log(msgStr + 'tempWnd.setSystemBarProperties failed, err : ' + JSON.stringify(err));
          expect().assertFail();
          done();
        })
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1370
     * @tc.name      : testSetSystemBarProperties_KeywordForm_Promise
     * @tc.desc      : Verify the scene where the status bar and navigation bar colors are set in hexadecimal form
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarProperties_KeywordForm_Promise', 0, async (done: Function) => {
      let caseName: string = 'testSetSystemBarProperties_KeywordForm_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd: ohosWindow.Window | void;
      tempWnd = await windowStage.getMainWindow().catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
      expect(!!tempWnd).assertTrue();
      await (tempWnd as ohosWindow.Window).show().catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await (tempWnd as ohosWindow.Window).setFullScreen(true).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.setFullScreen(true)', done);
      });
      console.log(msgStr + 'tempWnd.setFullScreen(true) success');
      await (tempWnd as ohosWindow.Window).setSystemBarEnable(['status', 'navigation']).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success');
      let loopCount: number = commonNUMBERColorArr.length;
      for (let i = 0; i < loopCount; i++) {
        let tempColor: string = commonNUMBERColorArr[i];
        let systemBarProperties: ohosWindow.SystemBarProperties = {
          statusBarColor: tempColor,
          isStatusBarLightIcon: true,
          statusBarContentColor: tempColor,
          navigationBarColor: tempColor,
          isNavigationBarLightIcon: true,
          navigationBarContentColor: tempColor,
          enableStatusBarAnimation: false,
          enableNavigationBarAnimation: false,
        };
        await (tempWnd as ohosWindow.Window).setSystemBarProperties(systemBarProperties).then(() => {
          console.log(msgStr + 'tempWnd.setSystemBarProperties ' + tempColor + ' success');
          done();
        }, (err: BusinessError) => {
          console.log(msgStr + 'tempWnd.setSystemBarProperties failed, err : ' + JSON.stringify(err));
          expect().assertFail();
          done();
        })
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1350
     * @tc.name      : testSetSystemBarProperties_Hexadecimal_Promise
     * @tc.desc      : Verify the scene where the status bar and navigation bar colors are set as keywords
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarProperties_Hexadecimal_Promise', 0, async (done: Function) => {
      let caseName: string = 'testSetSystemBarProperties_Hexadecimal_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd: ohosWindow.Window | void;
      tempWnd = await windowStage.getMainWindow().catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
      expect(!!tempWnd).assertTrue();
      await (tempWnd as ohosWindow.Window).show().catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await (tempWnd as ohosWindow.Window).setFullScreen(true).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.setFullScreen(true)', done);
      });
      console.log(msgStr + 'tempWnd.setFullScreen(true) success');
      await (tempWnd as ohosWindow.Window).setSystemBarEnable(['status', 'navigation']).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success');
      let loopCount = commonKEYColorArr.length;
      for (let i = 0; i < loopCount; i++) {
        let tempColor = commonKEYColorArr[i];
        let systemBarProperties: ohosWindow.SystemBarProperties = {
          statusBarColor: tempColor,
          isStatusBarLightIcon: true,
          statusBarContentColor: tempColor,
          navigationBarColor: tempColor,
          isNavigationBarLightIcon: false,
          navigationBarContentColor: tempColor,
          enableStatusBarAnimation: false,
          enableNavigationBarAnimation: false,
        };
        await (tempWnd as ohosWindow.Window).setSystemBarProperties(systemBarProperties).then(() => {
          console.log(msgStr + 'tempWnd.setSystemBarProperties ' + tempColor + ' success');
          done();
        }, (err: BusinessError) => {
          console.log(msgStr + 'tempWnd.setSystemBarProperties failed, err : ' + JSON.stringify(err));
          expect().assertFail();
          done();
        })
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0180
     * @tc.name      : testCreate_App_Type_Win_Promise
     * @tc.desc      : Verify the scenario of creating the application type window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreate_App_Type_Win_Promise', 0, async (done: Function) => {
      let caseName: string = 'testCreate_App_Type_Win_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempType: number = ohosWindow.WindowType.TYPE_DIALOG;
      let windId: string = 'testCreate_App_Type_Win_Promise';
      await ohosWindow.create(context, windId, tempType).then(async (data) => {
        console.log(msgStr + 'ohosWindow.create ' + tempType + 'finished, wnd: ' + data);
        expect(!!data).assertTrue();
        await data.destroy();
        done();
      }).catch((err: BusinessError) => {
        console.log(msgStr + 'ohosWindow.create ' + tempType + 'catched, err: ' + JSON.stringify(err));
        unexpectedError(TRUE_FLAG, err, caseName, 'ohosWindow.create ' + tempType, done);
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0260
     * @tc.name      : testCreate_Sys_Type_Win_Promise
     * @tc.desc      : Verify the scenario of creating the system type window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreate_Sys_Type_Win_Promise', 0, async (done: Function) => {
      let caseName: string = 'testCreate_Sys_Type_Win_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempType: number = ohosWindow.WindowType.TYPE_DIALOG;
      let windId = 'testCreate_Sys_Type_Win_Promise';
      let tempWnd: ohosWindow.Window | void;
      try {
        tempWnd = await ohosWindow.create(context, windId, tempType).catch((err: BusinessError) => {
          console.log(msgStr + 'ohosWindow.create err' + JSON.stringify(err));
          unexpectedError(TRUE_FLAG, err, caseName, 'ohosWindow.create ' + tempType, done);
        })
      } catch (err) {
        console.log(msgStr + 'ohosWindow.create catch err' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      expect(!!tempWnd).assertTrue();
      let proData: ohosWindow.WindowProperties | void;
      proData = await (tempWnd as ohosWindow.Window).getProperties().catch((err: BusinessError) => {
        console.log(msgStr + 'tempWnd.getProperties err' + JSON.stringify(err));
        unexpectedError(TRUE_FLAG, err, caseName, 'tempWnd.getProperties', done);
      })
      expect(!!proData).assertTrue();
      expect((proData as ohosWindow.WindowProperties).type == tempType).assertTrue();
      await (tempWnd as ohosWindow.Window).destroy();
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0220
     * @tc.name      : testCreate_Not_Exist_Win_Promise
     * @tc.desc      : Verify the scenario of creating a window of a type that does not exist
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreate_Not_Exist_Win_Promise', 0, async (done: Function) => {
      let caseName: string = 'testCreate_Not_Exist_Win_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempType: number = 5000;
      let windId = 'nonExistWindowType';
      console.log(msgStr + 'ohosWindow.create ' + tempType + ' start');
      await ohosWindow.create(context, windId, tempType).catch((err: BusinessError) => {
        console.log(msgStr + 'ohosWindow.create err: ' + JSON.stringify(err));
        expect(err.code === 1003).assertTrue();
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0240
     * @tc.name      : testCreate_Repeate_Id_Win_Promise
     * @tc.desc      : Verify the scenario of creating a window with duplicate IDs
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreate_Repeate_Id_Win_Promise', 0, async (done: Function) => {
      let caseName: string = 'testCreate_Repeate_Id_Win_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId: string = 'sameids'
      let ohosData: ohosWindow.Window | void;
      await ohosWindow.create(context, windowId, ohosWindow.WindowType.TYPE_DIALOG).then(async (data) => {
        ohosData = data;
        await ohosWindow.create(context, windowId, 1).catch((err: BusinessError) => {
          console.log(msgStr + 'ohosWindow.create 1 twice err: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300001)
          done();
        })
        await ohosData.destroy();
      }).catch((err: BusinessError) => {
        console.log(msgStr + 'ohosWindow.create 1 once err: ' + JSON.stringify(err));
        unexpectedError(TRUE_FLAG, err, caseName, 'ohosWindow.create', done);
      })
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0800
     * @tc.name      : testLoadContent_Exist_Create_SysWin_Promise
     * @tc.desc      : Verify the scenario of loading an existing page
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadContent_Exist_Create_SysWin_Promise', 0, async (done: Function) => {
      let caseName: string = 'testLoadContent_Exist_Create_SysWin_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWindow: ohosWindow.Window | void;
      tempWindow =
        await await windowStage.createSubWindow('testLoadContent_Exist_Create_SysWin_Promise')
          .catch((err: BusinessError) => {
            console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!tempWindow).assertTrue();
      console.log(msgStr + 'tempWnd.loadContent start');
      let load: void = await (tempWindow as ohosWindow.Window).loadContent('pages/second/second').then(() => {
        console.info(msgStr + ' Succeeded in loading the content.');
        expect().assertFail();
        done();
      }).catch((err: BusinessError) => {
        expect(err.code).assertEqual(401);
        console.log(msgStr + 'tempWnd.loadContent(pages/second/second) err=' + JSON.stringify(err));
      });
      await (tempWindow as ohosWindow.Window).destroy();
      done();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0880
     * @tc.name      : testLoadContent_Para_Is_Null_Create_SysWin_Promise
     * @tc.desc      : Verify the scene of loading the page with illegal values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadContent_Para_Is_Null_Create_SysWin_Promise', 0, async (done: Function) => {
      let caseName: string = 'testLoadContent_Para_Is_Null_Create_SysWin_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWindows: ohosWindow.Window | void;
      tempWindows =
        await windowStage.createSubWindow('testLoadContent_Para_Is_Null_Create_SysWin_Promise')
          .catch((err: BusinessError) => {
            console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!tempWindows).assertTrue();
      console.log(msgStr + 'tempWnd.loadContent start');
      await (tempWindows as ohosWindow.Window).destroy();
      let errFlag = false;
      let loadContentData: void;
      try {
        await (tempWindows as ohosWindow.Window).loadContent(null).then((data: void) => {
          loadContentData = data;
        }).catch((err: BusinessError) => {
          errFlag = true;
          expectedError(TRUE_FLAG, err, caseName, 'tempWnd.loadContent', done, 1003);
          console.log(msgStr + 'tempWnd.loadContent(null)' + JSON.stringify(err));
        });
        console.log(msgStr + 'tempWnd.loadContent loadContentData:' + JSON.stringify(loadContentData));
        if (!errFlag) {
          console.log(msgStr + 'should report err');
          expect(TRUE_FLAG).assertFail();
          done();
        }
      } catch (err) {
        console.log(msgStr + 'tempWnd.loadContent(null) catch err:' + JSON.stringify(err));
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0840
     * @tc.name      : testLoadContent_Exist_Input_Para_Path_Promise
     * @tc.desc      : Verify the scenario of loading an existing page
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadContent_Exist_Input_Para_Path_Promise', 0, async (done: Function) => {
      let caseName: string = 'testLoadContent_Exist_Input_Para_Path_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let load3: ohosWindow.Window | void = await windowStage.loadContent('testability/pages/second/second')
        .catch((err: BusinessError) => {
          unexpectedError(TRUE_FLAG, err, caseName, 'windowStage loadContent', done);
          console.log(msgStr + 'windowStage loadContent testability/pages/second/second' + JSON.stringify(err));
        });
      expect(!Boolean(load3)).assertTrue();
      console.log(msgStr + 'tempWnd.loadContent end load=' + JSON.stringify(load3));
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0860
     * @tc.name      : testLoadContent_Input_Para_Is_Null_Promise
     * @tc.desc      : Verify the scenario of loading an existing page
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadContent_Input_Para_Is_Null_Promise', 0, async (done: Function) => {
      let caseName: string = 'testLoadContent_Input_Para_Is_Null_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        await windowStage.loadContent(null).catch((err: BusinessError) => {
          expect(false).assertTrue();
          console.log(msgStr + 'windowStage loadContent null' + JSON.stringify(err));
        });
      } catch (err) {
        console.log(msgStr + 'windowStage loadContent catch err=' + JSON.stringify(err));
        expectedError(TRUE_FLAG, err.code, caseName, 'tempWnd.loadContent', done, 401);
      }
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0820
     * @tc.name      : testLoadContent_Exist_Input_Para_PathAndStorage_Promise
     * @tc.desc      : Verify the scenario of loading an existing page
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadContent_Exist_Input_Para_PathAndStorage_Promise', 0, async (done: Function) => {
      let caseName: string = 'testLoadContent_Exist_Input_Para_PathAndStorage_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        await windowStage.loadContent(null, abilityStorage).catch((err: BusinessError) => {
          expect(false).assertTrue();
          console.log(msgStr + 'windowStage loadContent null' + JSON.stringify(err));
        });
      } catch (err) {
        console.log(msgStr + 'windowStage loadContent catch err=' + JSON.stringify(err));
        expectedError(TRUE_FLAG, err.code, caseName, 'windowStage loadContent', done, 401);
      }
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0900
     * @tc.name      : testLoadContent_Para_PathAndStorage_Is_Null_Promise
     * @tc.desc      : Verify the scenario of loading an existing page
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadContent_Para_PathAndStorage_Is_Null_Promise', 0, async (done: Function) => {
      let caseName: string = 'testLoadContent_Para_PathAndStorage_Is_Null_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let load6: ohosWindow.Window | void = await windowStage.loadContent('testability/pages/second/second', null)
        .catch((err: BusinessError) => {
          unexpectedError(TRUE_FLAG, err, caseName, 'windowStage loadContent', done);
          console.log(msgStr + 'windowStage loadContent testability/pages/second/second' + JSON.stringify(err));
        });
      expect(!Boolean(load6)).assertTrue();
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0050
     * @tc.name      : testCreateSubWindow_WinName_IsNot_Empty_Promise
     * @tc.desc      : Verify the scenario of creating an auxiliary window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreateSubWindow_WinName_IsNot_Empty_Promise', 0, async (done: Function) => {
      let caseName: string = 'testCreateSubWindow_WinName_IsNot_Empty_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow: ohosWindow.Window | void = await windowStage.createSubWindow('createSubWindowTest1')
        .catch((err: BusinessError) => {
          unexpectedError(TRUE_FLAG, err, caseName, 'windowStage.createSubWindow', done);
          console.log(msgStr + 'windowStage.createSubWindow(createSubWindowTest1)=' + JSON.stringify(err));
        });
      expect(!!subWindow).assertTrue();
      await (subWindow as ohosWindow.Window).destroy();
      console.log(msgStr + 'windowStage.createSubWindow end subWindow=' + JSON.stringify(subWindow));
      console.log(msgStr + 'windowStage.createSubWindow end !!subWindow=' + !!subWindow);
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0070
     * @tc.name      : testCreateSubWindow_WinName_Is_Null_Promise
     * @tc.desc      : Verify the scene of entering illegal values to create an auxiliary window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreateSubWindow_WinName_Is_Null_Promise', 0, async (done: Function) => {
      let caseName: string = 'testCreateSubWindow_WinName_Is_Null_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        await windowStage.createSubWindow(null).catch((err: BusinessError) => {
          expect(false).assertTrue();
          console.log(msgStr + 'windowStage.createSubWindow(null) err=' + JSON.stringify(err));
        });
      } catch (err) {
        expectedError(TRUE_FLAG, err.code, caseName, 'windowStage.createSubWindow', done, 401);
        console.log(msgStr + 'windowStage.createSubWindow catch err=' + JSON.stringify(err));
      }
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0590
     * @tc.name      : testGetSubWindow_Promise
     * @tc.desc      : Verify the scene of obtaining all auxiliary sub windows
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetSubWindow_Promise', 0, async (done: Function) => {
      let caseName: string = 'testGetSubWindow_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      await windowStage.getSubWindow().then((data) => {
        expect(!!data).assertTrue();
        console.log(msgStr + 'windowStage.getSubWindow end data=' + JSON.stringify(data));
        done();
      }).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'windowStage.getSubWindow', done);
        console.log(msgStr + 'windowStage.getSubWindow(null) err=' + JSON.stringify(err));
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1200
     * @tc.name      : testSetPrivacyMode_SppSubWin_Promise
     * @tc.desc      : Verify the scene where the application sub window is set as a security layer
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetPrivacyMode_SppSubWin_Promise', 0, async (done: Function) => {
      let caseName: string = 'testSetPrivacyMode_SppSubWin_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin ');
      let wndData: ohosWindow.Window | void;
      wndData =
        await windowStage.createSubWindow('testSetPrivacyMode_SppSubWin_Promise').catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!wndData).assertTrue();
      console.log(msgStr + 'window.create success windowData' + wndData);
      await (wndData as ohosWindow.Window).getProperties().then((firstPro) => {
        expect(!firstPro.isPrivacyMode).assertTrue();
      }).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'mainWnd.getProperties', done);
      });
      await (wndData as ohosWindow.Window).setPrivacyMode(true).then((firstPrivacyMode) => {
        console.log(msgStr + 'mainWnd.setPrivacyMode true firstPrivacyMode=' + JSON.stringify(firstPrivacyMode));
        expect(!Boolean(firstPrivacyMode)).assertTrue();
      }).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'mainWnd.setPrivacyMode', done);
        console.log(msgStr + 'mainWnd.setPrivacyMode(true) err=' + JSON.stringify(err));
      })
      await (wndData as ohosWindow.Window).getProperties().then((secondPro) => {
        console.log(msgStr + 'mainWnd.getProperties secondPro:' + JSON.stringify(secondPro.isPrivacyMode));
        expect(secondPro.isPrivacyMode).assertTrue();
      }).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'mainWnd.getProperties', done);
      });
      await (wndData as ohosWindow.Window).setPrivacyMode(false).then((secondPrivacyMode) => {
        expect(!Boolean(secondPrivacyMode)).assertTrue();
        console.log(msgStr + 'mainWnd.setPrivacyMode(false) secondPrivacyMode=' + JSON.stringify(secondPrivacyMode));
      }).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'mainWnd.setPrivacyMode', done);
        console.log(msgStr + 'mainWnd.setPrivacyMode(false) err=' + JSON.stringify(err));
      })
      await (wndData as ohosWindow.Window).getProperties().then((lastPro) => {
        console.log(msgStr + 'mainWnd.getProperties lastPro:' + JSON.stringify(lastPro.isPrivacyMode));
        expect(!lastPro.isPrivacyMode).assertTrue();
      }).catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'mainWnd.getProperties', done);
      });
      await (wndData as ohosWindow.Window).destroy();
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1180
     * @tc.name      : testSetPreferredOrientation_Promise
     * @tc.desc      : Sets the display direction property of the window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetPreferredOrientation_Promise', 0, async (done: Function) => {
      let caseName: string = 'testSetPreferredOrientation_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin: ohosWindow.Window | void = await windowStage.getMainWindow().catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow :' + JSON.stringify(mainWin));
      expect(!!mainWin).assertTrue();
      let num = 0
      let orientationItem = ['UNSPECIFIED', 'PORTRAIT', 'LANDSCAPE', 'PORTRAIT_INVERTED',
        'LANDSCAPE_INVERTED', 'AUTO_ROTATION', 'AUTO_ROTATION_PORTRAIT', 'AUTO_ROTATION_LANDSCAPE',
        'AUTO_ROTATION_RESTRICTED', 'AUTO_ROTATION_PORTRAIT_RESTRICTED', 'AUTO_ROTATION_LANDSCAPE_RESTRICTED', 'LOCKED',
        'AUTO_ROTATION_UNSPECIFIED',
        'USER_ROTATION_PORTRAIT', 'USER_ROTATION_LANDSCAPE', 'USER_ROTATION_PORTRAIT_INVERTED',
        'USER_ROTATION_LANDSCAPE_INVERTED', 'FOLLOW_DESKTOP', 'UNSPECIFIED'];
      for (let i = 0; i < orientationItem.length; i++) {
        await sleep(900)
        await sleep(900)
        let orientation: ohosWindow.Orientation = ohosWindow.Orientation[orientationItem[i]]
        console.log(msgStr + 'i : ' + i + ' ,orientation : ' + orientation);
        console.log(msgStr + 'i : ' + i + ' ,ohosWindow.Orientation : ' + JSON.stringify(orientationItem[i]));
        await (mainWin as ohosWindow.Window).setPreferredOrientation(orientation).then(() => {
          console.log(msgStr + 'success set window.setPreferredOrientation : ' + orientation);
          num++
          if (num == orientationItem.length) {
            done();
          }
        }).catch((err: BusinessError) => {
          console.log(msgStr + 'window.setPreferredOrientation failed set error:' + orientation);
        });
        await sleep(900)
        await sleep(300)
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1120
     * @tc.name      : testSetForbidSplitMove_Promise
     * @tc.desc      : Sets whether Windows are forbidden to move in split screen mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetForbidSplitMove_Promise', 0, async (done: Function) => {
      let caseName: string = 'testSetForbidSplitMove_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin: ohosWindow.Window | void = await windowStage.getMainWindow().catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow' + JSON.stringify(mainWin));
      expect(!!mainWin).assertTrue();
      await (mainWin as ohosWindow.Window).setForbidSplitMove(true).then(() => {
        console.log(msgStr + 'success set window.setForbidSplitMove drag is prohibited');
      }).catch((err: BusinessError) => {
        console.log(msgStr + 'failed set window.setForbidSplitMove drag is prohibited');
      });
      await (mainWin as ohosWindow.Window).setForbidSplitMove(false).then(() => {
        console.log(msgStr + 'success set window.setForbidSplitMove you can drag it now');
      }).catch((err: BusinessError) => {
        console.log(msgStr + 'failed set window.setForbidSplitMove you can drag it now');
      });
      console.log(msgStr + 'done ');
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2160
     * @tc.name      : testSnapshotTest_Promise_Form
     * @tc.desc      : Scenario of screenshot of verification window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSnapshotTest_Promise_Form', 0, async (done: Function) => {
      await sleep(900);
      let caseName: string = 'testSnapshotTest_Promise_Form';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin: ohosWindow.Window | void = await windowStage.getMainWindow().catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow' + JSON.stringify(mainWin));
      expect(!!mainWin).assertTrue();
      let properties = (mainWin as ohosWindow.Window).getWindowProperties();
      let windowWidth:number = properties.windowRect.width;
      let windowHeight:number = properties.windowRect.height;
      console.log(msgStr + 'mainWin.getWindowProperties' + JSON.stringify(properties));
      await (mainWin as ohosWindow.Window).snapshot().then(async (pixelMap: image.PixelMap) => {
        console.info(msgStr + 'Succeeded in snapshotting window.');
        await pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
          console.log(msgStr + 'pixelMap imageInfo' + JSON.stringify(imageInfo));
          let imageWidth:number = imageInfo.size.width;
          let imageHeight:number = imageInfo.size.height;
          expect(imageWidth).assertEqual(windowWidth);
          expect(imageHeight).assertEqual(windowHeight);
        })
        pixelMap.release(); // PixelMap使用完后及时释放内存
        done();
      }).catch((err: BusinessError) => {
        console.log(msgStr + 'snapshot err.code:' + JSON.stringify(err.code));
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0330
     * @tc.name      : testDialogTargetTouch_Promise
     * @tc.desc      : Verify the scenario of opening modal window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testDialogTargetTouch_Promise', 0, async (done: Function) => {
      let caseName: string = 'testDialogTargetTouch_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin context==' + JSON.stringify(context));
      let tempType: number = ohosWindow.WindowType.TYPE_DIALOG
      let dialogTargetTouchTest1Win: ohosWindow.Window | void;
      let createWindowObj: ohosWindow.Configuration = {
        name: 'dialogTargetTouchTest1', windowType: tempType, ctx: context
      }
      try {
        await ohosWindow.createWindow(createWindowObj).then((data: ohosWindow.Window) => {
          dialogTargetTouchTest1Win = data
          expect(!!dialogTargetTouchTest1Win).assertTrue();
          dialogTargetTouchTest1Win.destroy();
          done();
        }).catch((err: BusinessError) => {
          unexpectedError(TRUE_FLAG, err, caseName, 'ohosWindow.create', done);
        })
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow catch err' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1080
     * @tc.name      : testSetAspectRatio_Cancel_Upon_Success_Promise
     * @tc.desc      : Validate the scenario cancelled after setting the proportion of the content layout of the main window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetAspectRatio_Cancel_Upon_Success_Promise', 0, async (done: Function) => {
      let caseName: string = 'testSetAspectRatio_Cancel_Upon_Success_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWnd: ohosWindow.Window | void;
      mainWnd = await windowStage.getMainWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to obtain the main window. Cause: ' + JSON.stringify(err));
      });
      expect(!!mainWnd).assertTrue();
      try {
        let ratio: number = 1.0;
        await (mainWnd as ohosWindow.Window).setAspectRatio(ratio).then(() => {
          console.info(msgStr + 'Succeeded in setting aspect ratio of window.');
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the aspect ratio of window. Cause:' + JSON.stringify(err));
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the aspect ratio of window. Cause: ' + JSON.stringify(exception));
      }
      try {
        await (mainWnd as ohosWindow.Window).resetAspectRatio().then(() => {
          console.info(msgStr + 'Succeeded in resetting aspect ratio of window.');
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to reset the aspect ratio of window. Cause:' + JSON.stringify(err));
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to reset the aspect ratio of window. Cause: ' + JSON.stringify(exception));
      }
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2340
     * @tc.name      : testSetAspectRatio_Invalid_Params_Promise
     * @tc.desc      : Validate the scenario where the content layout proportion of the main window is abnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetAspectRatio_Invalid_Params_Promise', 0, async (done: Function) => {
      let caseName: string = 'testSetAspectRatio_Invalid_Params_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWnd: ohosWindow.Window | void;
      mainWnd = await windowStage.getMainWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to obtain the main window. Cause: ' + JSON.stringify(err));
      });
      expect(!!mainWnd).assertTrue();
      console.info(msgStr + 'Succeeded in obtaining the main window. Data: ' + JSON.stringify(mainWnd));
      try {
        let ratio: number = 0;
        await (mainWnd as ohosWindow.Window).setAspectRatio(ratio).then(() => {
          console.info(msgStr + 'Succeeded in setting aspect ratio of window.');
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the aspect ratio of window. err:' + JSON.stringify(err));
        });
      } catch (exception) {
        let e: BusinessError = exception as BusinessError;
        console.error(msgStr + 'Failed to set the aspect ratio of window. exception: ' + JSON.stringify(e));
        expectedError(TRUE_FLAG, e, caseName, 'mainWnd.setAspectRatio', done, 401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2320
     * @tc.name      : testWindowEventType_Enum
     * @tc.desc      : Test the enumeration value of WindowEventType
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testWindowEventType_Enum', 0, async (done: Function) => {
      let caseName: string = 'testWindowEventType_Enum';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');

      let eventTypeStr = '';
      eventTypeStr += `WINDOW_SHOWN:${ohosWindow.WindowEventType.WINDOW_SHOWN};`;
      eventTypeStr += `WINDOW_ACTIVE:${ohosWindow.WindowEventType.WINDOW_ACTIVE};`;
      eventTypeStr += `WINDOW_INACTIVE:${ohosWindow.WindowEventType.WINDOW_INACTIVE};`;
      eventTypeStr += `WINDOW_HIDDEN:${ohosWindow.WindowEventType.WINDOW_HIDDEN};`;
      console.log(msgStr + 'ohosWindow.WindowEventType:' + JSON.stringify(eventTypeStr));
      try {
        expect(1).assertEqual(ohosWindow.WindowEventType.WINDOW_SHOWN);
        expect(2).assertEqual(ohosWindow.WindowEventType.WINDOW_ACTIVE);
        expect(3).assertEqual(ohosWindow.WindowEventType.WINDOW_INACTIVE);
        expect(4).assertEqual(ohosWindow.WindowEventType.WINDOW_HIDDEN);
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info(msgStr + 'windowEventType error :' + JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0100
     * @tc.name      : testSetSpecificSystemBarEnabled_Function_Promise
     * @tc.desc      : Test the function of setSpecificSystemBarEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSpecificSystemBarEnabled_Function_Promise', 0, async (done: Function) => {
      let msgStr: string = 'testSetSpecificSystemBarEnabled';
      console.log(msgStr + 'begin')
      try {
        let windowClass: ohosWindow.Window | void;
        windowClass = await ohosWindow.getLastWindow(context);
        let specificSystemBar: ohosWindow.SpecificSystemBar = 'navigationIndicator'
        let promise = (windowClass as ohosWindow.Window).setSpecificSystemBarEnabled(specificSystemBar, false);
        promise.then(() => {
          console.log(msgStr + 'Succeeded in setting the system bar to be invisible.');
          expect(true).assertTrue();
          done();
        }).catch((error: BusinessError) => {
          console.log(msgStr + 'Failed to set the system bar to be invisible. Cause:' + JSON.stringify(error));
          expect().assertFail();
          done();
        });
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.log(msgStr + 'Failed to set the system bar to be invisible. Cause:' + JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0200
     * @tc.name      : testSetSpecificSystemBarEnabled_2_Function_Promise
     * @tc.desc      : Test the function of setSpecificSystemBarEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSpecificSystemBarEnabled_2_Function_Promise', 0, async (done: Function) => {
      let msgStr = 'testSetSpecificSystemBarEnabled_2';
      console.log(msgStr + 'begin')
      try {
        let windowClass: ohosWindow.Window | void = await ohosWindow.getLastWindow(context);
        let specificSystemBar: ohosWindow.SpecificSystemBar = 'navigationIndicator'
        let promise = (windowClass as ohosWindow.Window).setSpecificSystemBarEnabled(specificSystemBar, true);
        promise.then(() => {
          console.log(msgStr + 'Succeeded in setting the system bar to be invisible.');
          expect(true).assertTrue();
          done();
        }).catch((error: BusinessError) => {
          console.log(msgStr + 'Failed to set the system bar to be invisible. Cause:' + JSON.stringify(error));
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.log(msgStr + 'Failed to set the system bar to be invisible. Cause:' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1220
     * @tc.name      : testSetWindowDecorVisible
     * @tc.desc      : test the function of SetWindowDecorVisible
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetWindowDecorVisible', 0, async (done: Function) => {
      let msgStr: string = 'testSetWindowDecorVisible';
      console.log(msgStr + ' begin');
      ohosWindow.getLastWindow(context).then(wnd => {
        console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
        expect(wnd != null).assertTrue();
        let isVisible = true;
        // 调用setWindowDecorVisible接口
        try {
          wnd.setWindowDecorVisible(isVisible);
          expect(true).assertTrue()
          done()

        } catch (exception) {
          console.error(msgStr + 'Failed to set the visibility of window decor. Cause: ' + JSON.stringify(exception));
          if (exception.code != 801) {
            console.error(msgStr + 'Failed to keep keyboard onFocus. Cause: ' + JSON.stringify(exception));
            expect().assertFail();
            done();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(exception))
            expect(exception.code).assertEqual(801);
            done();
          }
        }
      })
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1230
     * @tc.name      : testSetWindowDecorHeight
     * @tc.desc      : test the function of SetWindowDecorHeight
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetWindowDecorHeight', 0, async (done: Function) => {
      let msgStr: string = 'testSetWindowDecorHeight';
      console.log(msgStr + ' begin');
      let height = 50
      ohosWindow.getLastWindow(context).then((wnd) => {
        console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
        expect(wnd != null).assertTrue();
        try {
          wnd.setWindowDecorHeight(height);
          expect(true).assertTrue()
          done()
        } catch (exception) {
          console.error(msgStr + ' Failed to set the height of window decor. Cause: ' + JSON.stringify(exception));
          if (exception.code != 801) {
            console.error(msgStr + 'Failed to keep keyboard onFocus. Cause: ' + JSON.stringify(exception));
            expect().assertFail();
            done();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(exception))
            expect(exception.code).assertEqual(801);
            done();
          }
        }
      })
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1240
     * @tc.name      : testGetWindowDecorHeight
     * @tc.desc      : test the function of GetWindowDecorHeight
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testGetWindowDecorHeight', 0, async (done: Function) => {
      let caseName: string = 'www data';
      let msgStr: string = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let load3: void = await windowStage.loadContent('testability/pages/second/second').catch((err: BusinessError) => {
        unexpectedError(TRUE_FLAG, err, caseName, 'windowStage loadContent', done);
        console.log(msgStr + 'windowStage loadContent testability/pages/second/second' + JSON.stringify(err));
      });
      expect(!Boolean(load3)).assertTrue();
      try {
        let tempWnd: ohosWindow.Window | void = await windowStage.getMainWindow().catch((err: BusinessError) => {
          unexpectedError(TRUE_FLAG, err, caseName, 'windowStage.getMainWindow', done);
        });
        (tempWnd as ohosWindow.Window).getWindowDecorHeight()
        console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
        expect(true).assertTrue()
        done()
      } catch (exception) {
        console.error(msgStr + ' Failed to get the height of window decor. Cause: ' + JSON.stringify(exception));
        if (exception.code == 801 || exception.code == 1300002) {
          expect(true).assertTrue()
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1250
     * @tc.name      : testSubWindowOptions
     * @tc.desc      : test the function of SubWindowOptions
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSubWindowOptions', 0, async (done: Function) => {
      let msgStr: string = 'testSubWindowOptions';
      console.log(msgStr + ' begin');
      try {
        console.log(msgStr + ' www data try')
        // let options = {
        //   title: 'title',
        //   decorEnabled: true
        // };
        let promise = windowStage.createSubWindow('mySubWindow');
        console.log(msgStr + ' www data ' + promise)

        promise.then((data: ohosWindow.Window) => {
          let windowClass: ohosWindow.Window = data;
          console.log(msgStr + ' Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          expect(true).assertTrue()
          done()
        }).catch((err: BusinessError) => {
          console.error(msgStr + ' www data111 Failed to create the subwindow. Cause: ' + JSON.stringify(err));
          if (err.code == 801 || err.code == 1300002) {
            expect(true).assertTrue()
            done()
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        console.error(msgStr + ' www data222 Failed to create the subwindow. Cause: ' + JSON.stringify(exception));
        if (exception.code == 801 || exception.code == 1300002) {
          expect(true).assertTrue()
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1260
     * @tc.name      : testKeepKeyboardOnFocus
     * @tc.desc      : test the function of KeepKeyboardOnFocus
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testKeepKeyboardOnFocus', 0, async (done: Function) => {
      let msgStr = 'testKeepKeyboardOnFocus';
      console.log(msgStr + ' begin');
      ohosWindow.getLastWindow(context).then(wnd => {
        console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
        expect(wnd != null).assertTrue();
        try {
          wnd.keepKeyboardOnFocus(true);
          expect(true).assertTrue()
          done()
        } catch (exception) {
          console.error(msgStr + ' Failed to keep keyboard onFocus. Cause: ' + JSON.stringify(exception));
          if (exception.code == 801 || exception.code == 1300004) {
            expect(true).assertTrue()
            done()
          } else {
            expect().assertFail();
            done();
          }
        }
      })
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0100
     * @tc.name      : testShiftAppWindowFocus_Function_Promise
     * @tc.desc      : Test the function value of shiftAppWindowFocus
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testShiftAppWindowFocus_Function_Promise', 0, async (done: Function) => {
      let msgStr: string = 'testShiftAppWindowFocus_Function_Promise';
      console.log(msgStr + 'begin');
      try {
        console.log(msgStr + 'try begin')
        let sourceWindowId = 40;
        let targetWindowId = 41;
        let promise = ohosWindow.shiftAppWindowFocus(sourceWindowId, targetWindowId);
        promise.then(() => {
          console.log(msgStr + 'Succeeded in shifting app window focus');
          expect(true).assertTrue();
          done();
        }).catch((error: BusinessError) => {
          console.log(msgStr + 'Failed to shift app window focus1. Cause:' + JSON.stringify(error));
          if (error.code == 801 || error.code == 1300002) {
            expect(true).assertTrue()
            done()
          } else {
            expect().assertFail();
            done();
          }
        })
      } catch (error) {
        console.log(msgStr + 'Failed to shift app window focus2. Cause:' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3910
     * @tc.name      : testCreateSubWindowWithOptions_Function_Promise
     * @tc.desc      : Test the function value of createSubWindowWithOptions
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testCreateSubWindowWithOptions_Function_Promise", 0, async (done: Function) => {
      let msgStr = "testCreateSubWindowWithOptions_Function_Promise";
      console.log(msgStr + " begin");
      let windowClass: ohosWindow.Window | void;
      console.log(msgStr + " try begin")
      let options: ohosWindow.SubWindowOptions = {
        title: 'title',
        decorEnabled: true,
        isModal: false,
      };
      await windowStage.createSubWindowWithOptions('testCreateSubWindowWithOptions_Function_Promise', options)
        .then((data) => {
          windowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          done();
        })
        .catch((err: BusinessError) => {
          if (err.code != 1300002) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(1300002);
            done();
          }
        });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3920
     * @tc.name      : testGetWindowSystemBarProperties_Function
     * @tc.desc      : Test the function value of getWindowSystemBarProperties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testGetWindowSystemBarProperties_Function", 0, async (done: Function) => {
      let msgStr = "testGetWindowSystemBarProperties_Function";
      console.log(msgStr + " begin");
      ohosWindow.getLastWindow(context).then(wnd => {
        console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
        expect(wnd != null).assertTrue();
        try {
          let systemBarProperty = wnd.getWindowSystemBarProperties();
          console.info('Success in obtaining system bar properties. Property: ' + JSON.stringify(systemBarProperty));
          expect(true).assertTrue()
          done()
        } catch (exception) {
          console.error(msgStr + ' Failed to get system bar properties. Cause: ' + JSON.stringify(exception));
          expect().assertFail()
          done()
        }
      })
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WULTMNDOW_GET_WINDOWSYSTEMBARPROPERTIES_0100
     * @tc.name      : test_FullSereen_SetWindowSystemBarProperties_and_GetWindowSystemBarProperties
     * @tc.desc      : test_FullSereen_SetWindowSystemBarProperties_and_GetWindowSystemBarProperties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("test_FullSereen_SetWindowSystemBarProperties_and_GetWindowSystemBarProperties", 0, async (done: Function) => {
      let msgStr = "test_FullSereen_SetWindowSystemBarProperties_and_GetWindowSystemBarProperties";
      let SystemBarProperties: ohosWindow.SystemBarProperties = {
        statusBarColor: '#FF0000FF',
        navigationBarColor: '#FF00FF00',
        statusBarContentColor: '#FF00FFAA',
        navigationBarContentColor: '#FF00FFFF'
      };
      console.log(msgStr + " begin");
      ohosWindow.getLastWindow(context).then(async wnd => {
        console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
        expect(wnd != null).assertTrue();
        try {
          await wnd.setWindowSystemBarProperties(SystemBarProperties).then(() => {
            console.info('Succeeded in setting the system bar properties.');
            let systemBarProperty = wnd.getWindowSystemBarProperties();
            console.info('Success in obtaining system bar properties. Property: ' + JSON.stringify(systemBarProperty));
            expect(systemBarProperty.statusBarColor).assertEqual('#FF0000FF');
            expect(systemBarProperty.navigationBarColor).assertEqual('#FF00FF00');
            expect(systemBarProperty.statusBarContentColor).assertEqual('#FF00FFAA');
            expect(systemBarProperty.navigationBarContentColor).assertEqual('#FF00FFFF');
            done()
          }).catch((err: BusinessError) => {
            console.error('Failed to set the system bar properties. Cause: ' + JSON.stringify(err));
            expect(false).assertTrue();
            done()
          });

        } catch (exception) {
          console.error(msgStr + ' Failed to get system bar properties. Cause: ' + JSON.stringify(exception));
          expect().assertFail()
          done()
        }
      })
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WULTMNDOW_GET_WINDOWSYSTEMBARPROPERTIES_0200
     * @tc.name      : test_subWindow_GetWindowSystemBarProperties_1300004
     * @tc.desc      : test_subWindow_GetWindowSystemBarProperties_1300004
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("test_subWindow_GetWindowSystemBarProperties_1300004", 2, async (done: Function) => {
      let msgStr = "test_subWindow_GetWindowSystemBarProperties_1300004";
      console.log(msgStr + " begin");
      let SubWindowClass: ohosWindow.Window | void;
      SubWindowClass = await windowStage.createSubWindow('test_subWindow_GetWindowSystemBarProperties_1300004')
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!SubWindowClass).assertTrue();
      try {
        let systemBarProperty = (SubWindowClass as ohosWindow.Window).getWindowSystemBarProperties();
        console.info(msgStr + 'Success in obtaining system bar properties. Property: ' +
        JSON.stringify(systemBarProperty));
      } catch (err) {
        console.error(msgStr + 'Failed to get system bar properties. Code: ' + JSON.stringify(err) + err.code);
        expect(err.code).assertEqual(1300004)
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WULTMNDOW_SET_WINDOWSYSTEMBARPROPERTIES_0100
     * @tc.name      : test_subWindow_SetWindowSystemBarProperties
     * @tc.desc      : test_subWindow_GetWindowSystemBarProperties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("test_subWindow_SetWindowSystemBarProperties", 0, async () => {
      let msgStr = "test_subWindow_GetWindowSystemBarProperties_1300004";
      console.log(msgStr + " begin");
      let SubWindowClass: ohosWindow.Window | void;
      SubWindowClass =
        await windowStage.createSubWindow('test_subWindow_SetWindowSystemBarProperties').catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
        });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!SubWindowClass).assertTrue();
      let SystemBarProperties: ohosWindow.SystemBarProperties = {
        statusBarColor: '#ff00ff',
        navigationBarColor: '#00ff00',
        statusBarContentColor: '#ffffff',
        navigationBarContentColor: '#00ffff'
      };
      try {
        (SubWindowClass as ohosWindow.Window).setWindowSystemBarProperties(SystemBarProperties).then(async () => {
          console.info('Succeeded in setting the system bar properties.');
          await (SubWindowClass as ohosWindow.Window).destroyWindow();
        }).catch((err: BusinessError) => {
          console.error('Failed to set the system bar properties. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
      } catch (err) {
        console.error('Failed to setWindowSystemBarProperties. Code: ' + JSON.stringify(err) + err.code);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1180
     * @tc.name      : testSetWindowLimits_Function_Promise
     * @tc.desc      : test the function of setWindowLimits
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetWindowLimits_Function_Promise', 4, async (done: Function) => {
      let tag = 'setWindowLimits_Function_Promise '
      console.log(tag + 'begin')
      try {
        let WindowLimits: ohosWindow.WindowLimits = {
          maxWidth: 1500,
          maxHeight: 1000,
          minWidth: 500,
          minHeight: 400
        };
        let windowClass: ohosWindow.Window | void;
        windowClass = await ohosWindow.getLastWindow(context);
        let promise = windowClass.setWindowLimits(WindowLimits);
        promise.then((data) => {
          console.log(tag + 'Succeeded in setWindowLimits. Cause:' + JSON.stringify(data));
          expect(true).assertTrue();
          done();
        }).catch((error: BusinessError) => {
          console.log(tag + 'www data Failed to setWindowLimits. Cause: ' + JSON.stringify(error));
          if (error.code == 801) {
            expect(true).assertTrue()
            done()
          } else {
            expect().assertFail();
            done();
          }
        });

      } catch (error) {
        console.log(tag + 'Failed to change the window limits out. Cause:' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4000
     * @tc.name      : testEnableLandscapeMultiWindow_Function
     * @tc.desc      : Test the function value of EnableLandscapeMultiWindow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testEnableLandscapeMultiWindow_Function", 0, async (done: Function) => {
      let msgStr = "testEnableLandscapeMultiWindow_Function";
      console.log(msgStr + " begin");
      ohosWindow.getLastWindow(context).then(wnd => {
        console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
        expect(wnd != null).assertTrue();
        try {
          let promise = wnd.enableLandscapeMultiWindow()
          promise.then(() => {
            console.info(msgStr + ' Succeeded in making multi-window become landscape.');
            expect(true).assertTrue()
            done()
          }).catch((err: BusinessError) => {
            console.error(msgStr + ' Failed to make multi-window become landscape. Cause: ' + JSON.stringify(err));
            expect().assertFail()
            done()
          });
        } catch (exception) {
          console.error(msgStr + ' Failed to call enableLandscapeMultiWindow. Cause: ' + JSON.stringify(exception));
          expect().assertFail()
          done()
        }
      })
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4010
     * @tc.name      : testDisableLandscapeMultiWindow_Function
     * @tc.desc      : Test the function value of DisableLandscapeMultiWindow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testDisableLandscapeMultiWindow_Function", 0, async (done: Function) => {
      let msgStr = "testDisableLandscapeMultiWindow_Function";
      console.log(msgStr + " begin");
      ohosWindow.getLastWindow(context).then(wnd => {
        console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
        expect(wnd != null).assertTrue();
        try {
          let promise = wnd.disableLandscapeMultiWindow()
          promise.then(() => {
            console.info(msgStr + ' Succeeded in making multi-window become not landscape.');
            expect(true).assertTrue()
            done()
          }).catch((err: BusinessError) => {
            console.error(msgStr + ' Failed to make multi-window become not landscape. Cause: ' + JSON.stringify(err));
            expect().assertFail()
            done()
          });
        } catch (exception) {
          console.error(msgStr + ' Failed to call enableLandscapeMultiWindow. Cause: ' + JSON.stringify(exception));
          expect().assertFail()
          done()
        }
      })
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3930
     * @tc.name      : testSetWindowMask_Function_Promise
     * @tc.desc      : Test the function value of setWindowMask
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testSetWindowMask_Function_Promise", 0, async () => {
      let msgStr = "testSetWindowMask_Function_Promise";
      console.log(msgStr + " begin")
      let windowMask: Array<Array<number>> = new Array<Array<number>>()
      for (let i = 0; i < 500; i++) {
        let arr: Array<number> = new Array<number>(500);
        for (let j = 0; j < 500; j++) {
          if (i + j < 500) {
            arr[j] = 0
          } else {
            arr[j] = 1
          }
        }
        windowMask.push(arr)
      }
      console.log(msgStr + " windowMask OK ")
      let wnd: ohosWindow.Window | void;
      wnd = await windowStage.createSubWindow('nowWindowA').catch((err: BusinessError) => {
        console.log(msgStr + ' Failed to createSubWindow. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      })
      console.log(msgStr + " createSubWindow OK ")
      await (wnd as ohosWindow.Window).resize(500, 500);
      console.log(msgStr + " resize OK ")
      await (wnd as ohosWindow.Window).setWindowMask(windowMask).then(() => {
        console.log(msgStr + ' Succeeded in setting the window mask.');
      }).catch((err: BusinessError) => {
        console.log(msgStr + ' Failed to set the window mask. Cause: ' + JSON.stringify(err));
        if (err.code != 801) {
          console.error(msgStr + 'Failed tosetWindowMask. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持该接口')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      });
      await (wnd as ohosWindow.Window).destroyWindow();
    })
  })
}
