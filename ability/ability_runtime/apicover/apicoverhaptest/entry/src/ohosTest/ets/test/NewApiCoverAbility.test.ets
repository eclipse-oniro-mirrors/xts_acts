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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import abilityManager from '@ohos.app.ability.abilityManager';
import errorManager from '@ohos.app.ability.errorManager';
import { BusinessError } from '@ohos.base';
import { Configuration } from '@ohos.app.ability.Configuration';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import { Driver } from '@ohos.UiTest';

function sleep(time:number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok");
    }, time)
  });
}

let driver1:Driver;
export default function NewApiCoverTest() {
  describe('NewApiCoverTestTest', () => {
    beforeAll(async()=>{
      try{
        driver1 = await Driver.create();
      }catch{
        console.info("NewApiCoverTestTest beforeAll create driver error" );
      }
    })

    afterEach(async (done: Function) => {
      try{
        await driver1.delayMs(2500);
        done();
      }catch{
        console.info("NewApiCoverTestTest afterEach delayMs error" );
      }
    })

    /**
     * @tc.name   SUB_AA_ReisterLoopObserver_0100
     * @tc.number SUB_AA_ReisterLoopObserver_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ReisterLoopObserver_0100', Level.LEVEL0, async (done: Function) => {
      console.info("SUB_AA_ReisterLoopObserver_0100 start");
      try {
        let observer: errorManager.LoopObserver = {
          onLoopTimeOut(timeout: number) {
            console.info('Duration timeout: ' + timeout);
          }
        };
        errorManager.on("loopObserver", 1, observer);
        setTimeout(() => {
          done();
        }, 2500);
        errorManager.off("loopObserver");
        done();
      } catch (error) {
        console.info("SUB_AA_ReisterLoopObserver_0100 error: " + JSON.stringify(error));
        expect(error.code == 16200001).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_AA_ReisterErrorObserver_New_0100
     * @tc.number SUB_AA_ReisterErrorObserver_New_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ReisterErrorObserver_New_0100', Level.LEVEL0, async (done: Function) => {
      console.info("SUB_AA_ReisterErrorObserver_New_0100 start");
      let errorObserver: errorManager.ErrorObserver;
      errorObserver = {
        onUnhandledException: (errMessage) => {
          console.info("SUB_AA_ReisterErrorObserver_0100" + JSON.stringify(errMessage));
        }
      }
      try {
        let errCodeId = errorManager.on("error", errorObserver);
        console.info("SUB_AA_ReisterErrorObserver_New_0100 errCodeId=" + errCodeId);
        expect(errCodeId).assertEqual(0);
        errorManager.off("error", errCodeId)
          .then((data) => {
            console.info("SUB_AA_ReisterErrorObserver_New_0100 data=" + data);
            expect(data).assertEqual(undefined);
            done();
          })
          .catch((err: BusinessError) => {
            expect().assertFail();
            console.info("SUB_AA_ReisterErrorObserver_New_0100 catch err, err=" + JSON.stringify(err));
            done();
          })
      } catch (error) {
        expect().assertFail();
        done();
      }

    });

    /**
     * @tc.name   SUB_AA_ReisterErrorObserver_New_0200
     * @tc.number SUB_AA_ReisterErrorObserver_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_ReisterErrorObserver_New_0200', Level.LEVEL0, async (done: Function) => {
      console.info("SUB_AA_ReisterErrorObserver_New_0200 start");
      try {
        errorManager.off("error", -1)
          .then((data) => {
            console.info("SUB_AA_ReisterErrorObserver_New_0200 off error with -1 success, " + JSON.stringify(data));
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.info("SUB_AA_ReisterErrorObserver_New_0200 off error with -1 catch error, " + JSON.stringify(err));
            expect(err.code).assertEqual(401);
            done();
          })
      } catch (error) {
        console.info("SUB_AA_ReisterErrorObserver_New_0200 off error with -1 catch error2, " + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_AA_GetExtensionRunningInfos_0100
     * @tc.number SUB_AA_GetExtensionRunningInfos_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_GetExtensionRunningInfos_0100', Level.LEVEL0, async (done: Function) => {
      console.info("SUB_AA_GetExtensionRunningInfos_0100 start");
      try {
        let upperLimit = 1;
        await abilityManager.getExtensionRunningInfos(upperLimit)
          .then((data) => {
            console.info("SUB_AA_GetExtensionRunningInfos_0100 getExtensionRunningInfos success");
            expect(true).assertTrue();
            done();
          })
          .catch((err: BusinessError) => {
            console.info("SUB_AA_GetExtensionRunningInfos_0100 getExtensionRunningInfos fail " + JSON.stringify(err));
            expect().assertFail();
            done();
          })
      } catch (error) {
        console.info("SUB_AA_GetExtensionRunningInfos_0100 getExtensionRunningInfos fail2 " + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_restartSelfAtomicService_0200
     * @tc.number SUB_Ability_AbilityRuntime_restartSelfAtomicService_0200
     * @tc.desc   Bundle Type cannot use restartSelfAtomicService.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_restartSelfAtomicService_0200', Level.LEVEL3, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_restartSelfAtomicService_0200`;
      let UIAbilityContexts:common.UIAbilityContext;
      UIAbilityContexts = await AppStorage.get<common.UIAbilityContext>("abilityContext") as common.UIAbilityContext;
      console.log(`${tag}, test begin`);
      try {
        await abilityManager.restartSelfAtomicService(UIAbilityContexts);
        expect().assertFail();
        done();
      } catch (error) {
        console.log(`${tag}, catch failed: ${JSON.stringify(error)}`);
        expect(error?.code).assertEqual(16000090);
        done();
      }
    })
  })
}
