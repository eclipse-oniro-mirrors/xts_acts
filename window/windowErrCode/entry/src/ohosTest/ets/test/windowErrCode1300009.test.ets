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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import ohosWindow from '@ohos.window';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
export default function windowErrCode1300009() {
  describe('windowErrCode1300009', () => {
    console.log('describe windowErrCode1300009 start!!!')
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: ohosWindow.WindowStage;
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
    })
    /**
     * @tc.number     : testSetRaiseByClickEnabledPromiseErrCode1300009_0100
     * @tc.name       : testSetRaiseByClickEnabledPromiseErrCode1300009_0100
     * @tc.desc       : testSetRaiseByClickEnabledPromiseErrCode1300009_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetRaiseByClickEnabledPromiseErrCode1300009_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetRaiseByClickEnabledPromiseErrCode1300009_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let mainWindow: ohosWindow.Window | undefined;
      await windowStage.getMainWindow().then((data) => {
        mainWindow = data;
        console.info(caseName + ' ' + 'Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        console.error(caseName + ' ' + 'Failed in obtaining the main window. Cuase: ' + JSON.stringify(err));
        done()
      });
      expect(!!mainWindow).assertTrue();
      await (mainWindow as ohosWindow.Window).setUIContent("testability/pages/second/PageOne");
      await (mainWindow as ohosWindow.Window).showWindow();
      try {
        await (mainWindow as ohosWindow.Window)!.setRaiseByClickEnabled(true).then(async () => {
          console.info(msgStr + 'Succeeded in calling setRaiseByClickEnabled.');
          expect().assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setRaiseByClickEnabled. Cause: ' + JSON.stringify(err));
          if (err.code == 801) {
            console.info(msgStr + '此设备不支持setWindowTitleMoveEnabled能力.');
          } else {
            expect(err.code).assertEqual(1300009);
          }
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setRaiseByClickEnabled. Cause:' + JSON.stringify(exception));
        if (exception.code == 801) {
          console.info(msgStr + '此设备不支持setWindowTitleMoveEnabled能力.');
        } else {
          expect().assertFail();
        }
        done()
      }
    })
    /**
     * @tc.number     : testRaiseToAppTopPromiseErrCode1300009_0100
     * @tc.name       : testRaiseToAppTopPromiseErrCode1300009_0100
     * @tc.desc       : testRaiseToAppTopPromiseErrCode1300009_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testRaiseToAppTopPromiseErrCode1300009_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testRaiseToAppTopPromiseErrCode1300009_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let mainWindow: ohosWindow.Window | undefined;
      await windowStage.getMainWindow().then((data) => {
        mainWindow = data;
        console.info(caseName + ' ' + 'Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        console.error(caseName + ' ' + 'Failed in obtaining the main window. Cuase: ' + JSON.stringify(err));
        done()
      });
      expect(!!mainWindow).assertTrue();
      await (mainWindow as ohosWindow.Window).setUIContent("testability/pages/second/PageOne");
      await (mainWindow as ohosWindow.Window).showWindow();
      try {
        await (mainWindow as ohosWindow.Window).raiseToAppTop().then(async () => {
          console.info(msgStr + 'Succeeded in calling raiseToAppTop.');
          expect().assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call raiseToAppTop. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300009);
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call raiseToAppTop. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })
  })
}