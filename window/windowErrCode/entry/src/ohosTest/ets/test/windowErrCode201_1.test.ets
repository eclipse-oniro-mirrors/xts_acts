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

export default function windowErrCode201_1() {
  describe('windowErrCode201_1', () => {
    console.log('describe windowErrCode201_1 start!!!')
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context : common.UIAbilityContext;
    let windowStage:ohosWindow.WindowStage;

    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
    })

    /**
     * @tc.number     : testsetWindowTopmostErrCode201_0100
     * @tc.name       : testsetWindowTopmostErrCode201_0100
     * @tc.desc       : testsetWindowTopmostErrCode201_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testsetWindowTopmostErrCode201_0100', Level.LEVEL0, async (done: Function) => {
      let caseName = "testsetWindowTopmostErrCode201_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        let windowClass = windowStage.getMainWindowSync();
        let isWindowTopmost: boolean = true;
        let promiseTopmost = windowClass.setWindowTopmost(isWindowTopmost);
        promiseTopmost.then(() => {
          console.info(msgStr +'Succeeded in setting the main window to be topmost.');
          expect(false).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          console.error(msgStr +`Failed to set the main window to be topmost. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(201);
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setWindowTopmost. Cause:' + JSON.stringify(exception));
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done()
        }

      }
    })

  })
}