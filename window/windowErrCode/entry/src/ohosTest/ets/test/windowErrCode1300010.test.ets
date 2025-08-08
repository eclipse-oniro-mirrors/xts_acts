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
export default function windowErrCode1300010() {
  describe('windowErrCode1300010', () => {
    console.log('describe windowErrCode1300010 start!!!')
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context : common.UIAbilityContext;
    let windowStage:ohosWindow.WindowStage;
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
    })
    /**
     * @tc.number    : testMoveWindowToGlobalPromiseErrCode1300010_0100
     * @tc.name      : testMoveWindowToGlobalPromiseErrCode1300010_0100
     * @tc.desc      : testMoveWindowToGlobalPromiseErrCode1300010_0100
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMoveWindowToGlobalPromiseErrCode1300010_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = 'testMoveWindowToGlobalPromiseErrCode1300010_0100';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setFullScreen(true);
        console.info(`${caseName} Succeeded in enabling the full-screen mode.`);
        await sleep(1000);
        windowClass.moveWindowToGlobal(200,300).then(() => {
          console.error(msgStr + 'Succeeded in calling on moveWindowToGlobal.');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to call moveWindowToGlobal. Cause: ' + JSON.stringify(err));
          if (err.code == 801) {
            console.info(msgStr + '此设备不支持moveWindowToGlobal能力.');
          } else {
            expect(err.code).assertEqual(1300010);
          }
          done()
        });
      } catch (exception) {
        if (exception.code == 801) {
          console.info(`${caseName}: The current device type does not support: ${exception.message}`);
          done();
        } else {
          console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
          done();
        }
      }
    })
  })
}