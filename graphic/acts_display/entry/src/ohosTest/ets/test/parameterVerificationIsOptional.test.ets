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
import { describe, beforeAll, it, expect, Level, TestType, Size } from "@ohos/hypium"
import ohosWindow from '@ohos.window';
// import screen from '@ohos.screen';
import display from '@ohos.display';
import screenshot from '@ohos.screenshot';
import { UiDriver, BY, ON, PointerMatrix, UiComponent } from '@ohos.UiTest'
import Ability from '@ohos.app.ability.Ability';
import { BusinessError, Callback } from '@ohos.base';
import { UIContext } from '@ohos.arkui.UIContext';
import common from '@ohos.app.ability.common';
import deviceInfo from '@ohos.deviceInfo';
import {Driver} from '@ohos.UiTest'

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

export default function windowInterfaceOptionalParameterTest() {
  describe('windowInterface_optionalParameter_test', () => {
    console.log('describe window_api_test start!!!')
    let context : common.UIAbilityContext;
    let windowStage:ohosWindow.WindowStage;
    // = AppStorage.get('windowStage') as ohosWindow.WindowStage;
    // let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    const TRUE_FLAG: boolean = true;
    let currentDeviceIsPC = false;
    beforeAll(async () => {
       context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
       windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
      // let deviceTypeInfo = deviceInfo.deviceType
      // currentDeviceIsPC = deviceTypeInfo === '2in1' ? true : false;
      // console.info('the value of the deviceType is :' + deviceInfo.deviceType);
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

    /**
     * @tc.name   testDisplay_off_change_Deregister_All_Listeners
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0360
     * @tc.desc   Enable monitoring of screen status changes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testDisplay_off_change_Deregister_All_Listeners', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: Function) => {
      let caseName: string = 'testDisplay_off_change_Deregister_All_Listeners';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let num: number = 0
      let firstListenFlag: boolean = false
      let secondListenFlag: boolean = false

      let firstCall: Callback<number> = () => {
        console.log(msgStr + "first listener trigger")
        num++
        firstListenFlag = true
      }

      let secondCall: Callback<number> = () => {
        console.log(msgStr + "second listener trigger")
        num++
        secondListenFlag = true
      }
      if(canIUse("SyatemCapability.Sensors.Sensor")){
        console.log(caseName+' '+' 该设备支持SyatemCapability.Sensors.Sensor');
        display.on('change', firstCall);
        display.on('change', secondCall);
        let mainWindow: ohosWindow.Window | undefined;
        await windowStage.getMainWindow().then((data)=>{
          mainWindow = data;
          console.info(caseName+ ' '+'Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
        }).catch((err: BusinessError) => {
          unexpectedError(err, caseName, 'windowStage.getMainWindow', TRUE_FLAG, done);
        });
        expect(!!mainWindow).assertTrue();
        await (mainWindow as ohosWindow.Window).setPreferredOrientation(ohosWindow.Orientation.PORTRAIT_INVERTED).then(() => {
          console.info(caseName+' Succeeded in setting the window orientation.');
          console.info(caseName+' 1:firstListenFlag'+firstListenFlag,'secondListenFlag:'+secondListenFlag);
        }).catch((err: BusinessError) => {
          console.error(msgStr + ' Failed to set the window orientation. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
        await sleep(1000);
        console.info(caseName+' 2:firstListenFlag'+firstListenFlag,'secondListenFlag:'+secondListenFlag);
        display.off('change')
        firstListenFlag = false
        secondListenFlag = false
        await (mainWindow as ohosWindow.Window).setPreferredOrientation(ohosWindow.Orientation.UNSPECIFIED).then(() => {
          console.info(caseName+' Succeeded in setting the window orientation.');
          console.info(caseName+' 3:firstListenFlag'+firstListenFlag,'secondListenFlag:'+secondListenFlag);
        })
          .catch((err: BusinessError) => {
            console.error(msgStr + 'Failed to set the window orientation. Cause: ' + JSON.stringify(err));
            expect(TRUE_FLAG).assertFail();
            done();
          });
        await sleep(1000);
        console.info(caseName+' 4:firstListenFlag'+firstListenFlag,'secondListenFlag:'+secondListenFlag);
        if (num >= 2 && firstListenFlag === false && secondListenFlag === false) {
          done();
        } else {
          expect(TRUE_FLAG).assertFail();
          done();
        }
      }else{
        console.log(caseName+' 该设备不支持SyatemCapability.Sensors.Sensor');
        let mainWindow: ohosWindow.Window | void
        await windowStage.getMainWindow().then((data)=>{
          mainWindow = data;
          console.info(caseName+' Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
          expect(!!mainWindow).assertTrue();
          let orientation = (mainWindow as ohosWindow.Window).getPreferredOrientation();
          console.log(caseName+' orientation: '+orientation);
          expect(orientation).assertEqual(ohosWindow.Orientation.PORTRAIT);
          done();
        }).catch((err: BusinessError) => {
          unexpectedError(err, caseName, 'windowStage.getMainWindow', TRUE_FLAG, done);
          done();
        });
      }
    })
    /**
     * @tc.name   testDisplay_off_change_Deregister_FirstCall_Listeners
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0370
     * @tc.desc   Enable monitoring of screen status changes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testDisplay_off_change_Deregister_FirstCall_Listeners', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: Function) => {
      let caseName: string = 'testDisplay_off_change_Deregister_FirstCall_Listeners';
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
      if(canIUse("SyatemCapability.Sensors.Sensor")){
        console.log(caseName+' 该设备支持SyatemCapability.Sensors.Sensor');
      display.on('change', firstCall);
      display.on('change', secondCall);
      let mainWindow: ohosWindow.Window | undefined;
      await windowStage.getMainWindow().then((data)=>{
        mainWindow = data;
        console.info(caseName+' Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', TRUE_FLAG, done);
      });
      expect(!!mainWindow).assertTrue();

      await (mainWindow as ohosWindow.Window).setPreferredOrientation(ohosWindow.Orientation.PORTRAIT_INVERTED).then(() => {
        console.info(caseName+'Succeeded in setting the window orientation.');
        console.info(caseName+'1:firstListenFlag'+firstListenFlag,'secondListenFlag:'+secondListenFlag);
      }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the window orientation. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      await sleep(1000);
      console.info(caseName+'2:firstListenFlag'+firstListenFlag,'secondListenFlag:'+secondListenFlag);
      display.off('change', firstCall)
      firstListenFlag = false
      secondListenFlag = false
      await (mainWindow as ohosWindow.Window).setPreferredOrientation(ohosWindow.Orientation.UNSPECIFIED).then(() => {
        console.info(caseName+'Succeeded in setting the window orientation.');
        console.info(caseName+'3:firstListenFlag'+firstListenFlag,'secondListenFlag:'+secondListenFlag);
      })
        .catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the window orientation. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      await sleep(1000);
      display.off('change')
      console.info(caseName+'4:firstListenFlag'+firstListenFlag,'secondListenFlag:'+secondListenFlag);
      if (!firstListenFlag && secondListenFlag) {
        done();
      } else {
        expect(TRUE_FLAG).assertFail();
        done();
      }}else{
        console.log(caseName+'该设备不支持SyatemCapability.Sensors.Sensor');
        let mainWindow: ohosWindow.Window | void
        await windowStage.getMainWindow().then((data)=>{
        mainWindow = data;
        console.info(caseName+'Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
        expect(!!mainWindow).assertTrue();
        let orientation = (mainWindow as ohosWindow.Window).getPreferredOrientation();
        console.log(caseName+'orientation:'+orientation);
        expect(orientation).assertEqual(ohosWindow.Orientation.PORTRAIT);
        done();
      }).catch((err: BusinessError) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', TRUE_FLAG, done);
        done();
      });
      
      }
    })
  })
}
