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
import { describe, beforeAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
import ohosWindow from '@ohos.window';
import screen from '@ohos.screen';
import display from '@ohos.display';
import screenshot from '@ohos.screenshot';
import { UiDriver, BY, ON, PointerMatrix, UiComponent } from '@ohos.UiTest'
import Ability from '@ohos.app.ability.Ability';
import { BusinessError, Callback } from '@ohos.base';
import { UIContext } from '@ohos.arkui.UIContext';
import common from '@ohos.app.ability.common';
import settings from '@ohos.settings';

function unexpectedError(error: BusinessError, caseName: string, apiName: string, TRUE_FLAG: boolean, done: Function) {
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


function buttonClick(buttonText: string, msgStr: string) {
  console.info(msgStr + `case come in buttonClick fun`)
  return new Promise<string>(async (resolve, reject) => {
    let driver = await UiDriver.create()
    console.info(msgStr + `case come in buttonClick fun 222`)
    console.info(msgStr + `driver is ${JSON.stringify(driver)}`)
    await sleep(900)
    console.info(msgStr + `UiDriver start`)
    let button: UiComponent = await driver.findComponent(BY.text(buttonText))
    console.info(msgStr + `button is ${JSON.stringify(button)}`)
    await sleep(900)
    if (button) {
      console.info(msgStr + `button click begin`)
      await button.click()
      console.info(msgStr + `button click end`)
      resolve(msgStr + 'get button successed')
    } else {
      console.info(msgStr + `inter else: button is null`)
      reject(msgStr + 'get button failed')
    }
  })
}

function inputClick(buttonText: string, msgStr: string) {
  console.info(msgStr + `case come in inputClick fun`)
  return new Promise<string>(async (resolve, reject) => {
    let driver = await UiDriver.create()
    console.info(msgStr + `case come in inputClick fun 222`)
    console.info(msgStr + `driver is ${JSON.stringify(driver)}`)
    await sleep(900)
    console.info(msgStr + `UiDriver start`)
    let input: UiComponent = await driver.findComponent(BY.key(buttonText))
    console.info(msgStr + `input is ${JSON.stringify(input)}`)
    await sleep(900)
    if (input) {
      console.info(msgStr + `input click begin`)
      await input.click()
      console.info(msgStr + `input click end`)
      resolve(msgStr + 'get input successed')
    } else {
      console.info(msgStr + `inter else: input is null`)
      reject(msgStr + 'get input failed')
    }
  })
}

export default function parameterVerificationIsOptionalTest(context: common.UIAbilityContext, windowStage: ohosWindow.WindowStage) {
  describe('parameterVerificationIsOptional_test', () => {
    console.log('describe parameterVerificationIsOptional_test start!!!')
    const TRUE_FLAG: boolean = true;
    let isPCStatus:string = settings.getValueSync(context,'isStatusBarExist','',settings.domainName.USER_PROPERTY);
    console.info(`beforeAll isPCStatus: ${isPCStatus}`);
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2360
     * @tc.name      : testTouchOutsideBaseTest
     * @tc.desc      : Enable listening for click events outside the area of this window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testTouchOutsideBaseTest', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      let caseName: string = 'testTouchOutsideBaseTest';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      let mainWin: ohosWindow.Window | undefined = undefined;
      await windowStage.getMainWindow().then((data) => {
        mainWin = data;
        expect(!!mainWin).assertTrue();
        console.info(msgStr + 'Succeeded in getMainWindow. Data:' + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        expect().assertFail();
        done();
      });
      let callback = () => {
        console.log('windowTest on/off touchOutside callback success');
      }
      try {
        mainWin!.on('touchOutside', callback);
      } catch (err) {
        console.log(msgStr + 'window on touchOutside failed');
        expect().assertFail();
        done();
      }
      await sleep(900);
      try {
        mainWin!.off('touchOutside', callback);
        done();
      } catch (err) {
        console.log(msgStr + 'window off touchOutside failed');
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2370
     * @tc.name      : testWindowOffTouchOutsideCancelAll
     * @tc.desc      : Turns off listening for click events outside this window area.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testWindowOffTouchOutsideCancelAll', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      let caseName: string = 'testWindowOffTouchOutsideCancelAll';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let num: number = 0
      let firstListenFlag: boolean = false
      let secondListenFlag: boolean = false
      let tempWnd: ohosWindow.Window | undefined = undefined;
      let tempWnd_two: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('touchOutside01').then(async (data) => {
        tempWnd = data;
        expect(!!tempWnd).assertTrue();
        console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await tempWnd!.loadContent('testability/pages/second/second')
        .catch((err: BusinessError) => {
          console.log(msgStr + 'tempWnd.loadContent failed');
          expect().assertFail();
          done();
        });
      await tempWnd!.resize(400, 400).catch((err: BusinessError) => {
        console.log(msgStr + 'tempWnd.resize failed');
        expect().assertFail();
        done();
      });
      await tempWnd!.moveWindowTo(0, 0).catch((err: BusinessError) => {
        console.log(msgStr + 'tempWnd.moveWindowTo failed');
        expect().assertFail();
        done();
      });
      await tempWnd!.showWindow().catch((err: BusinessError) => {
        console.log(msgStr + 'tempWnd.showWindow failed');
        expect().assertFail();
        done();
      });
      await windowStage.createSubWindow('touchOutside001').then(async (data) => {
        tempWnd_two = data;
        expect(!!tempWnd_two).assertTrue();
        console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await tempWnd_two!.loadContent('testability/pages/second/pageOne')
        .catch((err: BusinessError) => {
          console.log(msgStr + 'tempWnd_two.loadContent failed');
          expect().assertFail();
          done();
        });
      await tempWnd_two!.resize(500, 500).catch((err: BusinessError) => {
        console.log(msgStr + 'tempWnd_two.resize failed');
        expect().assertFail();
        done();
      });
      await tempWnd_two!.moveWindowTo(0, 0).catch((err: BusinessError) => {
        console.log(msgStr + 'tempWnd_two.moveWindowTo failed');
        expect().assertFail();
        done();
      });
      await tempWnd_two!.showWindow().catch((err: BusinessError) => {
        console.log(msgStr + 'tempWnd_two.showWindow failed');
        expect().assertFail();
        done();
      });
      tempWnd!.on('touchOutside', () => {
        console.info(msgStr + "first listener trigger");
        num++;
        firstListenFlag = true;
        console.info(msgStr + "listener trigger num is: " + num);
      });
      tempWnd!.on('touchOutside', () => {
        console.info(msgStr + "second listener trigger");
        num++;
        secondListenFlag = true;
        console.info(msgStr + "listener trigger num is: " + num);
      });
      await sleep(800);
      await sleep(800);
      await sleep(800);
      await sleep(600);
      await buttonClick("点击pageOne", msgStr).catch(async (err: BusinessError) => {
        console.info(msgStr + err);
        await tempWnd!.destroyWindow();
        await tempWnd_two!.destroyWindow();
        expect().assertFail();
        done();
      });
      tempWnd!.off('touchOutside');
      firstListenFlag = false
      secondListenFlag = false
      await buttonClick('点击pageOne', msgStr).catch(async (err: BusinessError) => {
        console.info(msgStr + err);
        await tempWnd!.destroyWindow();
        await tempWnd_two!.destroyWindow();
        expect().assertFail();
        done();
      })
      console.info(msgStr + "finally listener trigger num is: " + num);
      if (num == 2 && firstListenFlag === false && secondListenFlag === false) {
        await tempWnd!.destroyWindow();
        await tempWnd_two!.destroyWindow();
        done();
      } else {
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2380
     * @tc.name      : Test testWindowOffTouchOutsideCancelSingle
     * @tc.desc      : Turns off listening for click events outside this window area.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testWindowOffTouchOutsideCancelSingle', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      let caseName: string = 'testWindowOffTouchOutsideCancelSingle';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let firstListenFlag: boolean = false
      let secondListenFlag: boolean = false
      let num: number = 0

      let firstCall = () => {
        console.log(msgStr + "first listener trigger")
        num++;
        console.info(msgStr + "first listener trigger num is: " + num);
        firstListenFlag = true
        return firstListenFlag
      }

      let secondCall = () => {
        console.log(msgStr + "second listener trigger")
        num++;
        console.info(msgStr + "second listener trigger num is: " + num);
        secondListenFlag = true
        return secondListenFlag
      }
      let tempWnd: ohosWindow.Window | void;
      let tempWnd_two: ohosWindow.Window | void;
      tempWnd = await windowStage.createSubWindow('touchOutside02').catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!!tempWnd).assertTrue();
      await (tempWnd as ohosWindow.Window).loadContent('testability/pages/second/second')
        .catch((err: BusinessError) => {
          unexpectedError(err, caseName, 'tempWnd.resetSize', TRUE_FLAG, done);
        });
      await (tempWnd as ohosWindow.Window).resize(400, 400).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'tempWnd.resetSize', TRUE_FLAG, done);
      });
      await (tempWnd as ohosWindow.Window).moveWindowTo(0, 0).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'tempWnd.moveWindowTo ', TRUE_FLAG, done);
      });
      await (tempWnd as ohosWindow.Window).show().catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'tempWnd.show', TRUE_FLAG, done);
      });
      tempWnd_two = await windowStage.createSubWindow('touchOutside002').catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!!tempWnd_two).assertTrue();
      await (tempWnd_two as ohosWindow.Window).loadContent('testability/pages/second/pageOne')
        .catch((err: BusinessError) => {
          unexpectedError(err, caseName, 'tempWnd.resetSize', TRUE_FLAG, done);
        });
      await (tempWnd_two as ohosWindow.Window).resize(500, 500).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'tempWnd.resetSize', TRUE_FLAG, done);
      });
      await (tempWnd_two as ohosWindow.Window).moveWindowTo(0, 0).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'tempWnd.moveWindowTo ', TRUE_FLAG, done);
      });
      await (tempWnd_two as ohosWindow.Window).show().catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'tempWnd.show', TRUE_FLAG, done);
      });
      (tempWnd as ohosWindow.Window).on('touchOutside', firstCall);
      (tempWnd as ohosWindow.Window).on('touchOutside', secondCall);
      await sleep(800);
      await buttonClick('点击pageOne', msgStr).catch(async (err: BusinessError) => {
        console.info(msgStr + err);
        await (tempWnd as ohosWindow.Window).destroyWindow();
        await (tempWnd_two as ohosWindow.Window).destroyWindow();
        expect().assertFail();
        done();
      });
      (tempWnd as ohosWindow.Window).off('touchOutside', firstCall);
      firstListenFlag = false
      secondListenFlag = false
      await buttonClick('点击pageOne', msgStr).catch(async (err: BusinessError) => {
        console.info(msgStr + err);
        await (tempWnd as ohosWindow.Window).destroyWindow();
        await (tempWnd_two as ohosWindow.Window).destroyWindow();
        expect().assertFail();
        done();
      })
      console.info(msgStr + "finally listener trigger num is: " + num);
      await sleep(800)
      await (tempWnd as ohosWindow.Window).destroyWindow();
      await (tempWnd_two as ohosWindow.Window).destroyWindow();
      if (!firstListenFlag && secondListenFlag && num == 3) {
        done();
      } else {
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2170
     * @tc.name      : testWindowStage_loadContent_Test_001
     * @tc.desc      : Verify The optional parameter is undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testWindowStage_loadContent_Test_001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      let caseName: string = 'windowStage_loadContent_Test_001';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let load: void = await windowStage.loadContent('testability/pages/second/second', undefined)
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage loadContent testability/pages/second/second' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      expect(!Boolean(load)).assertTrue();
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2280
     * @tc.name      : testWindow_off_WindowSizeChange_No_Callback
     * @tc.desc      : Turn off listening for window size changes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testWindow_off_WindowSizeChange_No_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      let caseName: string = 'testWindow_off_WindowSizeChange_No_Callback';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let num: number = 0
      let firstListenFlag: boolean = false
      let secondListenFlag: boolean = false
      console.log(msgStr + 'begin');
      let tempWnd: ohosWindow.Window | void;
      tempWnd = await windowStage.createSubWindow('testWindow_off_WindowSizeChange_No_Callback').catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!tempWnd).assertTrue();
      (tempWnd as ohosWindow.Window).on('windowSizeChange', () => {
        console.info(msgStr + "first listener trigger");
        num++
        firstListenFlag = true
      });
      (tempWnd as ohosWindow.Window).on('windowSizeChange', () => {
        console.info(msgStr + "second listener trigger");
        num++
        secondListenFlag = true
      });
      await (tempWnd as ohosWindow.Window).show().catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'tempWnd.show', TRUE_FLAG, done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await (tempWnd as ohosWindow.Window).resize(200, 600).catch(async (err: BusinessError) => {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        await (tempWnd as ohosWindow.Window).destroyWindow();
        done();
      })
      await sleep(800);
      (tempWnd as ohosWindow.Window).off('windowSizeChange');
      firstListenFlag = false
      secondListenFlag = false
      await (tempWnd as ohosWindow.Window).resize(500, 500).catch(async (err: BusinessError) => {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        await (tempWnd as ohosWindow.Window).destroyWindow();
        done();
      })
      console.error(msgStr + 'num : ' + num);
      await sleep(900);
      await (tempWnd as ohosWindow.Window).destroyWindow();
      if (num >= 2 && firstListenFlag === false && secondListenFlag === false) {
        done();
      }else {
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2290
     * @tc.name      : testWindow_off_WindowSizeChange_SecondCall_Callback
     * @tc.desc      : Turn off listening for window size changes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testWindow_off_WindowSizeChange_SecondCall_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      let caseName = 'testWindow_off_WindowSizeChange_SecondCall_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let firstListenFlag = false
      let secondListenFlag = false
      let tempWnd: ohosWindow.Window | void = await windowStage.createSubWindow('testWindow_off_WindowSizeChange_SecondCall_Callback').catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!tempWnd).assertTrue();
      let firstCall = () => {
        console.log(msgStr + "first listener trigger")
        firstListenFlag = true
      }

      let secondCall = () => {
        console.log(msgStr + "second listener trigger")
        secondListenFlag = true
      }

      (tempWnd as ohosWindow.Window).on('windowSizeChange', firstCall);
      (tempWnd as ohosWindow.Window).on('windowSizeChange', secondCall);
      await (tempWnd as ohosWindow.Window).show().catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'tempWnd.show', TRUE_FLAG, done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await (tempWnd as ohosWindow.Window).resize(200, 600).catch(async (err: BusinessError) => {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        await (tempWnd as ohosWindow.Window).destroyWindow();
        done();
      })
      await sleep(800);
      (tempWnd as ohosWindow.Window).off('windowSizeChange', firstCall);
      firstListenFlag = false
      secondListenFlag = false
      await (tempWnd as ohosWindow.Window).resize(500, 500).catch(async (err: BusinessError) => {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        await (tempWnd as ohosWindow.Window).destroyWindow();
        done();
      })
      await sleep(900);
      (tempWnd as ohosWindow.Window).off('windowSizeChange');
      await (tempWnd as ohosWindow.Window).destroyWindow();
      if (!firstListenFlag && secondListenFlag) {
        done();
      } else {
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2200
     * @tc.name      : testWindow_off_AvoidAreaChange_AllListening_LogOut
     * @tc.desc      : Disable listening for system avoidance zone changes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testWindow_off_AvoidAreaChange_AllListening_LogOut', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      let caseName: string = 'testWindow_off_AvoidAreaChange_AllListening_LogOut';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let num: number = 0
      let firstListenFlag: boolean = false
      let secondListenFlag: boolean = false
      let tempWnd: ohosWindow.Window | void

      if((avoidArea1.topRect.width != 0 && avoidArea1.topRect.height != 0) && (isPCStatus == ''|| isPCStatus == '1')){
        tempWnd = await windowStage.getMainWindow().catch((err: BusinessError) => {
          unexpectedError(err, caseName, 'windowStage.getMainWindow', TRUE_FLAG, done);
        });
        expect(!!tempWnd).assertTrue();
        await (tempWnd as ohosWindow.Window).show().catch((err: BusinessError) => {
          unexpectedError(err, caseName, 'tempWnd.show', TRUE_FLAG, done);
        });
        (tempWnd as ohosWindow.Window).on('avoidAreaChange', () => {
          console.info(msgStr + "first listener trigger");
          num++
          firstListenFlag = true
        });
        (tempWnd as ohosWindow.Window).on('avoidAreaChange', () => {
          console.info(msgStr + 'second listener trigger');
          num++
          secondListenFlag = true
        });
        await sleep(1000);
        await (tempWnd as ohosWindow.Window).setFullScreen(true).catch((err: BusinessError) => {
          unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', TRUE_FLAG, done);
        });
        await sleep(1000);
        await (tempWnd as ohosWindow.Window).setWindowLayoutFullScreen(false).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
        console.log(msgStr + 'tempWnd.setWindowLayoutFullScreen(false) success');
        await sleep(1000);
        await (tempWnd as ohosWindow.Window).setSystemBarEnable(['status']).catch((err: BusinessError) => {
          unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status])', TRUE_FLAG, done);
        });
  
        await (tempWnd as ohosWindow.Window).setWindowLayoutFullScreen(true).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the window layout to setWindowLayoutFullScreen true. Cause:' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
        console.log(msgStr + 'tempWnd.setWindowLayoutFullScreen(true) success');
        await sleep(800);
        (tempWnd as ohosWindow.Window).off('avoidAreaChange');
        firstListenFlag = false
        secondListenFlag = false
        await (tempWnd as ohosWindow.Window).setWindowLayoutFullScreen(false).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the window layout to setWindowLayoutFullScreen false. Cause:' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
        await (tempWnd as ohosWindow.Window).setSystemBarEnable([]).catch((err: BusinessError) => {
          unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([navigation])', TRUE_FLAG, done);
        });
        await sleep(800);
        await (tempWnd as ohosWindow.Window).setSystemBarEnable(['status', 'navigation']).catch((err: BusinessError) => {
          unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status])', TRUE_FLAG, done);
        });
        if (num >= 2 && firstListenFlag === false && secondListenFlag === false) {
          done();
        }else {
          expect().assertFail();
          done();
        }
      }
      else{
        console.info(`${caseName} not support, isPCStatus: ${isPCStatus}`);
        done();
      }
      
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2210
     * @tc.name      : testWindow_off_AvoidAreaChange_FirstCall_LogOut
     * @tc.desc      : Disable listening for system avoidance zone changes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testWindow_off_AvoidAreaChange_FirstCall_LogOut', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      let caseName: string = 'testWindow_off_AvoidAreaChange_FirstCall_LogOut';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let firstListenFlag: boolean = false
      let secondListenFlag: boolean = false

      if((avoidArea1.topRect.width != 0 && avoidArea1.topRect.height != 0) && (isPCStatus == ''|| isPCStatus == '1')){
        let firstCall = () => {
          console.log(msgStr + "first listener trigger")
          firstListenFlag = true
        }
  
        let secondCall = () => {
          console.log(msgStr + "second listener trigger")
          secondListenFlag = true
        }
  
        let tempWnd = await windowStage.getMainWindow().catch((err: BusinessError) => {
          unexpectedError(err, caseName, 'windowStage.getMainWindow', TRUE_FLAG, done);
        });
        expect(!!tempWnd).assertTrue();
        await (tempWnd as ohosWindow.Window).show().catch((err: BusinessError) => {
          unexpectedError(err, caseName, 'tempWnd.show', TRUE_FLAG, done);
        });
        console.log(msgStr + 'tempWnd.show success');
        (tempWnd as ohosWindow.Window).on('avoidAreaChange', firstCall);
        (tempWnd as ohosWindow.Window).on('avoidAreaChange', secondCall);
        await (tempWnd as ohosWindow.Window).setFullScreen(true).catch((err: BusinessError) => {
          unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', TRUE_FLAG, done);
        });
        await sleep(800);
        (tempWnd as ohosWindow.Window).off('avoidAreaChange', firstCall);
        firstListenFlag = false
        secondListenFlag = false
        await (tempWnd as ohosWindow.Window).setWindowLayoutFullScreen(false).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
        console.log(msgStr + 'tempWnd.setWindowLayoutFullScreen(false) success');
        await (tempWnd as ohosWindow.Window).setSystemBarEnable([]).catch((err: BusinessError) => {
          unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([navigation])', TRUE_FLAG, done);
        });
        await (tempWnd as ohosWindow.Window).setWindowLayoutFullScreen(true).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
        console.log(msgStr + 'tempWnd.setWindowLayoutFullScreen(true) success');
        await (tempWnd as ohosWindow.Window).setSystemBarEnable(['status', 'navigation']).catch((err: BusinessError) => {
          unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status])', TRUE_FLAG, done);
        });
        await sleep(800);
        if (!firstListenFlag && secondListenFlag) {
          (tempWnd as ohosWindow.Window).off('avoidAreaChange');
          done();
        } else {
          (tempWnd as ohosWindow.Window).off('avoidAreaChange');
          expect(TRUE_FLAG).assertFail();
          done();
        }
      }
      else{
        console.info(`${caseName} not support, isPCStatus: ${isPCStatus}`);
        done();
      }
      
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2220
     * @tc.name      : testWindow_off_dialogTargetTouch_AllListening_LogOut
     * @tc.desc      : Turns on modal window listener for click events on target Windows.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testWindow_off_dialogTargetTouch_AllListening_LogOut', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      let caseName: string = 'testWindow_off_dialogTargetTouch_AllListening_LogOut';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let num: number = 0
      let firstListenFlag: boolean = false
      let secondListenFlag: boolean = false
      let subWin: ohosWindow.Window | void = await windowStage.createSubWindow('testWindow_off_dialogTargetTouch_AllListening_LogOut').catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!subWin).assertTrue();
      let current_display_Class = display.getDefaultDisplaySync();
      console.info(msgStr + 'current_display_Class: ' + JSON.stringify(current_display_Class));
      await (subWin as ohosWindow.Window).resize(current_display_Class.width, current_display_Class.height).catch((err: BusinessError) => {
        expect().assertFail();
        done();
      });
      await (subWin as ohosWindow.Window).loadContent('testability/pages/second/second')
        .catch((err: BusinessError) => {
          expect().assertFail();
          done();
        });
      await (subWin as ohosWindow.Window).show().catch((err: BusinessError) => {
        expect().assertFail();
        done();
      });
      let windowId: string = 'window_off_dialogTargetTouch_Test_001';
      let windowConfig: ohosWindow.Configuration = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_DIALOG, ctx: context
      };
      let tempWnd: ohosWindow.Window | void;
      tempWnd = await ohosWindow.createWindow(windowConfig).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'ohosWindow.createWindow', TRUE_FLAG, done);
      });
      expect(!!tempWnd).assertTrue();
      await (tempWnd as ohosWindow.Window).resize(100, 100).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'tempWnd.resetSize', TRUE_FLAG, done);
      });
      await (tempWnd as ohosWindow.Window).moveWindowTo(current_display_Class.width, current_display_Class.height).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await (tempWnd as ohosWindow.Window).loadContent('testability/pages/second/pageOne')
        .catch((err: BusinessError) => {
          unexpectedError(err, caseName, 'tempWnd.resetSize', TRUE_FLAG, done);
        });
      await (tempWnd as ohosWindow.Window).show().catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'tempWnd.show', TRUE_FLAG, done);
      });
      (tempWnd as ohosWindow.Window).on('dialogTargetTouch', () => {
        console.info(msgStr + "first listener trigger");
        num++
        firstListenFlag = true
      });
      (tempWnd as ohosWindow.Window).on('dialogTargetTouch', () => {
        console.info(msgStr + "second listener trigger");
        num++
        secondListenFlag = true
      });
      // 点击模态窗口
      await buttonClick('secondPage_BackToIndex', msgStr).catch(async (err: BusinessError) => {
        console.info(msgStr + err);
        await (tempWnd as ohosWindow.Window).destroyWindow();
        await (subWin as ohosWindow.Window).destroyWindow();
        expect().assertFail();
        done();
      })
      await sleep(800);
      (tempWnd as ohosWindow.Window).off('dialogTargetTouch');
      firstListenFlag = false
      secondListenFlag = false
      await buttonClick('secondPage_BackToIndex', msgStr).catch(async (err: BusinessError) => {
        console.info(msgStr + err);
        await (tempWnd as ohosWindow.Window).destroyWindow();
        await (subWin as ohosWindow.Window).destroyWindow();
        expect().assertFail();
        done();
      })
      await sleep(800);
      await (tempWnd as ohosWindow.Window).destroyWindow();
      await (subWin as ohosWindow.Window).destroyWindow();
      if (num >= 2 && firstListenFlag === false && secondListenFlag === false) {
        done();
      }else{
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2230
     * @tc.name      : testWindow_off_dialogTargetTouch_FirstCall_LogOut
     * @tc.desc      : Turns on modal window listener for click events on target Windows.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testWindow_off_dialogTargetTouch_FirstCall_LogOut', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      let caseName: string = 'testWindow_off_dialogTargetTouch_FirstCall_LogOut';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let firstListenFlag: boolean = false
      let secondListenFlag: boolean = false

      let firstCall = () => {
        console.log(msgStr + "first listener trigger")
        firstListenFlag = true
      }

      let secondCall = () => {
        console.log(msgStr + "second listener trigger")
        secondListenFlag = true
      }
      let subWin: ohosWindow.Window | void = await windowStage.createSubWindow('testWindow_off_dialogTargetTouch_FirstCall_LogOut').catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!subWin).assertTrue();
      let current_display_Class = display.getDefaultDisplaySync();
      console.info(msgStr + 'current_display_Class: ' + JSON.stringify(current_display_Class));
      await (subWin as ohosWindow.Window).resize(current_display_Class.width, current_display_Class.height).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'tempWnd.resetSize', TRUE_FLAG, done);
      });
      await (subWin as ohosWindow.Window).loadContent('testability/pages/second/second')
        .catch((err: BusinessError) => {
          unexpectedError(err, caseName, 'subWin.resetSize', TRUE_FLAG, done);
        });
      await (subWin as ohosWindow.Window).show().catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'tempWnd.show', TRUE_FLAG, done);
      });
      let windowId: string = 'window_off_dialogTargetTouch_Test_002';
      let windowConfig: ohosWindow.Configuration = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_DIALOG, ctx: context
      };
      let tempWnd: ohosWindow.Window | void;
      tempWnd = await ohosWindow.createWindow(windowConfig).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'ohosWindow.createWindow', TRUE_FLAG, done);
      });
      expect(!!tempWnd).assertTrue();
      await (tempWnd as ohosWindow.Window).resize(100, 100).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'tempWnd.resetSize', TRUE_FLAG, done);
      });
      await (tempWnd as ohosWindow.Window).moveWindowTo(current_display_Class.width, current_display_Class.height).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await (tempWnd as ohosWindow.Window).loadContent('testability/pages/second/pageOne')
        .catch((err: BusinessError) => {
          unexpectedError(err, caseName, 'tempWnd.resetSize', TRUE_FLAG, done);
        });
      await (tempWnd as ohosWindow.Window).show().catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'tempWnd.show', TRUE_FLAG, done);
      });
      (tempWnd as ohosWindow.Window).on('dialogTargetTouch', firstCall);
      (tempWnd as ohosWindow.Window).on('dialogTargetTouch', secondCall);
      await buttonClick('secondPage_BackToIndex', msgStr).catch(async (err: BusinessError) => {
        console.info(msgStr + err);
        await (tempWnd as ohosWindow.Window).destroyWindow();
        await (subWin as ohosWindow.Window).destroyWindow();
        expect().assertFail();
        done();
      })
      await sleep(800);
      (tempWnd as ohosWindow.Window).off('dialogTargetTouch', firstCall);
      firstListenFlag = false
      secondListenFlag = false
      await buttonClick('secondPage_BackToIndex', msgStr).catch(async (err: BusinessError) => {
        console.info(msgStr + err);
        await (tempWnd as ohosWindow.Window).destroyWindow();
        await (subWin as ohosWindow.Window).destroyWindow();
        expect().assertFail();
        done();
      })
      await sleep(800);
      (tempWnd as ohosWindow.Window).off('dialogTargetTouch');
      await (tempWnd as ohosWindow.Window).destroyWindow();
      await (subWin as ohosWindow.Window).destroyWindow();
      if (!firstListenFlag && secondListenFlag) {
        done();
      } else {
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2240
     * @tc.name      : testWindow_off_keyboardHeightChange_All
     * @tc.desc      : Turn off listening for keyboard height changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testWindow_off_keyboardHeightChange_All', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      let caseName: string = 'testWindow_off_keyboardHeightChange_All';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd: ohosWindow.Window | void;
      tempWnd = await windowStage.createSubWindow('testWindow_off_keyboardHeightChange_All').catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!tempWnd).assertTrue();
      await (tempWnd as ohosWindow.Window).loadContent('testability/pages/second/pageTwo')
        .catch((err: BusinessError) => {
          expect().assertFail();
          done();
        });
      let current_display_Class = display.getDefaultDisplaySync();
      await (tempWnd as ohosWindow.Window).resize(800, current_display_Class.height).catch((err: BusinessError) => {
        expect().assertFail();
        done();
      });
      await (tempWnd as ohosWindow.Window).moveWindowTo(0, 0).catch((err: BusinessError) => {
        expect().assertFail();
        done();
      });
      await (tempWnd as ohosWindow.Window).showWindow().catch((err: BusinessError) => {
        expect().assertFail();
        done();
      });
      try {
        (tempWnd as ohosWindow.Window).on('keyboardHeightChange', () => {
          console.info(msgStr + "first listener trigger");
        });
      } catch (exception) {
        console.error(msgStr + `Failed to enable the listener for keyboard height changes. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
      try {
        (tempWnd as ohosWindow.Window).on('keyboardHeightChange', () => {
          console.info(msgStr + "second listener trigger");
        });
      } catch (exception) {
        console.error(msgStr + `Failed to enable the listener for keyboard height changes. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
      try {
        (tempWnd as ohosWindow.Window).off('keyboardHeightChange');
      } catch (exception) {
        console.error(msgStr + `Failed to enable the listener for keyboard height changes. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
      await (tempWnd as ohosWindow.Window).destroyWindow();
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2250
     * @tc.name      : testWindow_off_keyboardHeightChange_FirstCall
     * @tc.desc      : Turn off listening for keyboard height changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testWindow_off_keyboardHeightChange_FirstCall', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      let caseName: string = 'testWindow_off_keyboardHeightChange_FirstCall';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let firstCall = () => {
        console.log(msgStr + "first listener trigger")
      }

      let secondCall = () => {
        console.log(msgStr + "second listener trigger")
      }

      let tempWnd: ohosWindow.Window | void;
      tempWnd = await windowStage.createSubWindow('testWindow_off_keyboardHeightChange_FirstCall_LogOut').catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!tempWnd).assertTrue();
      await (tempWnd as ohosWindow.Window).loadContent('testability/pages/second/pageTwo')
        .catch((err: BusinessError) => {
          unexpectedError(err, caseName, 'tempWnd.loadContent', TRUE_FLAG, done);
        });
      let current_display_Class = display.getDefaultDisplaySync();
      await (tempWnd as ohosWindow.Window).resize(800, current_display_Class.height).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'tempWnd.resetSize', TRUE_FLAG, done);
      });
      await (tempWnd as ohosWindow.Window).moveWindowTo(0, 0).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'tempWnd.moveWindowTo ', TRUE_FLAG, done);
      });
      await (tempWnd as ohosWindow.Window).showWindow().catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'tempWnd.showWindow', TRUE_FLAG, done);
      });
      try {
        (tempWnd as ohosWindow.Window).on('keyboardHeightChange', firstCall);
      } catch (exception) {
        console.error(msgStr + `Failed to enable the listener for keyboard height changes firstCall. Cause code: ${exception.code}, message: ${exception.message}`);
      }
      try {
        (tempWnd as ohosWindow.Window).on('keyboardHeightChange', secondCall);
      } catch (exception) {
        console.error(msgStr + `Failed to enable the listener for keyboard height changes secondCall. Cause code: ${exception.code}, message: ${exception.message}`);
      }
      try {
        (tempWnd as ohosWindow.Window).off('keyboardHeightChange', firstCall);
      } catch (exception) {
        console.error(msgStr + `Failed to enable the listener for keyboard height changes. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
      try {
        (tempWnd as ohosWindow.Window).off('keyboardHeightChange');
      } catch (exception) {
        console.error(msgStr + `Failed to enable the listener for keyboard height changes All. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
      await (tempWnd as ohosWindow.Window).destroyWindow();
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0610
     * @tc.name      : testGetUIContext_Instances
     * @tc.desc      : Get the UIContext instance.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testGetUIContext_Instances', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      let caseName: string = 'testGetUIContext_Instances';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWindow: ohosWindow.Window | void
      mainWindow = await windowStage.getMainWindow().catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', TRUE_FLAG, done);
      });
      expect(!!mainWindow).assertTrue();
      // 获取UIContext实例。
      let uiContext: UIContext = (mainWindow as ohosWindow.Window).getUIContext();
      expect(!!uiContext).assertTrue();
      console.log(msgStr + 'after uiContext: ' + JSON.stringify(uiContext));
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2500
     * @tc.name      : testGetLastWindow_CreateSubWindow
     * @tc.desc      : Gets the last window displayed in the current app.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetLastWindow_CreateSubWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testGetLastWindow_CreateSubWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow: ohosWindow.Window | void = await windowStage.createSubWindow('testGetLastWindow_CreateSubWindow')
        .catch((err: BusinessError) => {
          expect().assertFail();
        });
      expect(!!subWindow).assertTrue();
      await (subWindow as ohosWindow.Window).resize(400, 400).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await (subWindow as ohosWindow.Window).loadContent('testability/pages/second/second')
        .catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
      await (subWindow as ohosWindow.Window).moveWindowTo(100, 100).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await (subWindow as ohosWindow.Window).showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      let lastWindow: ohosWindow.Window | void = await ohosWindow.getLastWindow(context).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      })
      expect(!!lastWindow).assertTrue();
      console.log(msgStr + 'lastWindow is:' + JSON.stringify(lastWindow))
      let properties = (lastWindow as ohosWindow.Window).getWindowProperties();
      let SubProperties = (subWindow as ohosWindow.Window).getWindowProperties();
      console.log(msgStr + 'SubProperties is:' + JSON.stringify(SubProperties));
      expect(properties.id).assertEqual(SubProperties.id);
      await (subWindow as ohosWindow.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4490
     * @tc.name      : testGetLastWindow_CreateDialogWindow
     * @tc.desc      : Gets the last window displayed in the current app.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetLastWindow_CreateDialogWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testGetLastWindow_CreateDialogWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId: string = 'testGetLastWindow_CreateDialogWindow';
      let windowConfig: ohosWindow.Configuration = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_DIALOG, ctx: context
      };
      let tempWnd: ohosWindow.Window | void;
      tempWnd = await ohosWindow.createWindow(windowConfig).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!tempWnd).assertTrue();
      await (tempWnd as ohosWindow.Window).resize(400, 400).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await (tempWnd as ohosWindow.Window).loadContent('testability/pages/second/second')
        .catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
      await (tempWnd as ohosWindow.Window).moveWindowTo(100, 100).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await (tempWnd as ohosWindow.Window).showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      let lastWindow: ohosWindow.Window | void = await ohosWindow.getLastWindow(context).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      })
      expect(!!lastWindow).assertTrue();
      console.log(msgStr + 'lastWindow is:' + JSON.stringify(lastWindow))
      let lastWindow_properties = (lastWindow as ohosWindow.Window).getWindowProperties();
      let mainWin = windowStage.getMainWindowSync();
      let mainWin_properties = (mainWin as ohosWindow.Window).getWindowProperties();
      expect(lastWindow_properties.id).assertEqual(mainWin_properties.id);
      await (tempWnd as ohosWindow.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4500
     * @tc.name      : testLoadContent_NotExistPage_Callback
     * @tc.desc      : The page does not exist
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testLoadContent_NotExistPage_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      let caseName = 'testLoadContent_NotExistPage_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow: ohosWindow.Window | void = await windowStage.createSubWindow('testLoadContent_NotExistPage_Callback')
        .catch((err: BusinessError) => {
          expect().assertFail();
          done();
        });
      expect(!!subWindow).assertTrue();
      await (subWindow as ohosWindow.Window).resize(400, 400).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      (subWindow as ohosWindow.Window).loadContent('pages/page2/page3', async (err: BusinessError) => {
        const errCode: number = err.code;
        if (errCode) {
          console.error(msgStr + `Failed to load the content. Cause code: ${err.code}, message: ${err.message}`);
          await (subWindow as ohosWindow.Window).destroyWindow();
          expect(err.code).assertEqual(401);
          done();
        }
        console.info(msgStr + 'Succeeded in loading the content.');
        await (subWindow as ohosWindow.Window).destroyWindow();
        expect().assertFail();
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4510
     * @tc.name      : testLoadContent_NotExistPage_Promise
     * @tc.desc      : The page does not exist
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testLoadContent_NotExistPage_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testLoadContent_NotExistPage_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow: ohosWindow.Window | void = await windowStage.createSubWindow('testLoadContent_NotExistPage_Promise')
        .catch((err: BusinessError) => {
          expect().assertFail();
        });
      expect(!!subWindow).assertTrue();
      await (subWindow as ohosWindow.Window).resize(400, 400).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await (subWindow as ohosWindow.Window).loadContent('pages/page2/page3').then(() => {
        console.info(msgStr + 'Succeeded in loading the content.');
        expect().assertFail();
      }).catch((err: BusinessError) => {
        console.error(msgStr + `Failed to load the content. Cause code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      });
      await (subWindow as ohosWindow.Window).destroyWindow();
    })
  })
}
