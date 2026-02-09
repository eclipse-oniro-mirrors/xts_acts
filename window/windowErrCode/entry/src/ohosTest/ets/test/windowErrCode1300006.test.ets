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
export default function windowErrCode1300006() {
  describe('windowErrCode1300006', () => {
    console.log('describe windowErrCode1300006 start!!!')
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context : common.UIAbilityContext;
    let windowStage:ohosWindow.WindowStage;
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
    })
    /**
     * @tc.name   testCreateWindowCallbackErrCode1300006_0100
     * @tc.number testCreateWindowCallbackErrCode1300006_0100
     * @tc.desc   testCreateWindowCallbackErrCode1300006_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateWindowCallbackErrCode1300006_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testCreateWindowCallbackErrCode1300006_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testHideCallbackErrCode202_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: undefined,
      };
      try {
        ohosWindow.createWindow(windowConfig, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed. Cause:' + JSON.stringify(err.code)+` message:${err.message}`);
            expect(err.code).assertEqual(1300006);
        expect(err.message!=null).assertTrue();
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in calling createWindow.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })
    /**
     * @tc.name   testCreateWindowPromiseErrCode1300006_0100
     * @tc.number testCreateWindowPromiseErrCode1300006_0100
     * @tc.desc   testCreateWindowPromiseErrCode1300006_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateWindowPromiseErrCode1300006_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testCreateWindowPromiseErrCode1300006_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testHideCallbackErrCode202_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: undefined,
      };
      try {
        await ohosWindow.createWindow(windowConfig).then(async () => {
          console.info(msgStr + 'Succeeded in calling createWindow.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed. Cause:' + JSON.stringify(err.code)+` message:${err.message}`);
          expect(err.code).assertEqual(1300006);
        expect(err.message!=null).assertTrue();
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call createWindow. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })

    

  })
}