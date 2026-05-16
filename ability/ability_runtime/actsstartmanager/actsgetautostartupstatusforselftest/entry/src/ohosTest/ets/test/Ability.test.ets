/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium'
import { autoStartupManager, common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { worker, MessageEvents } from '@kit.ArkTS';
import commonEventManager from '@ohos.commonEventManager';

let context: common.UIAbilityContext;
let mySubscriber: commonEventManager.CommonEventSubscriber;

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(() =>{
      context = AppStorage.get<common.UIAbilityContext>('abilityContext') as common.UIAbilityContext;
    })

    /**
     * @tc.name   Sub_Ability_AbilityRuntime_GetAutoStartupStatus_0100
     * @tc.number Sub_Ability_AbilityRuntime_GetAutoStartupStatus_0100
     * @tc.desc   getAutoStartupStatusForSelf return false or throw 801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityRuntime_GetAutoStartupStatus_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: Function) => {
      const tcNumber = `Sub_Ability_AbilityRuntime_GetAutoStartupStatus_0100 `;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
      try {
        autoStartupManager.getAutoStartupStatusForSelf()
          .then((data: boolean) => {
            hilog.info(0x0000, 'testTag', `${tcNumber} getAutoStartupStatusForSelf success`);
            expect(data).assertFalse();
            done();
          })
          .catch((error: BusinessError<void>) => {
            hilog.info(0x0000, 'testTag', `${tcNumber} getAutoStartupStatusForSelf error: ${JSON.stringify(error)}`);
            if ( error.code !== 801 ) {
              expect().assertFail();
            }
            done();
          })
      } catch (err) {
        hilog.info(0x0000, 'testTag', `${tcNumber} getAutoStartupStatusForSelf failed: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   Sub_Ability_AbilityRuntime_GetAutoStartupStatus_0200
     * @tc.number Sub_Ability_AbilityRuntime_GetAutoStartupStatus_0200
     * @tc.desc   getAutoStartupStatusForSelf return false or throw 801 when call it in thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityRuntime_GetAutoStartupStatus_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: Function) => {
      const tcNumber = `Sub_Ability_AbilityRuntime_GetAutoStartupStatus_0200 `;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
      try {
        let worker1 = new worker.ThreadWorker('../workers/Worker.ets');
        worker1.onmessage = (e: MessageEvents): void => {
          hilog.info(0x0000, 'testTag', `${tcNumber} worker1.onmessage: ${JSON.stringify(e)}`);
          let result: boolean = e.data === 'false' || e.data === '801';
          expect(result).assertTrue();
          worker1.terminate();
          done();
        }
        worker1.postMessage(`getAutoStartupStatusForSelf`);
          hilog.info(0x0000, 'testTag', `${tcNumber} worker1.postMessage`);
      } catch (err) {
        hilog.info(0x0000, 'testTag', `${tcNumber} failed: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   Sub_Ability_AbilityRuntime_GetAutoStartupStatus_0300
     * @tc.number Sub_Ability_AbilityRuntime_GetAutoStartupStatus_0300
     * @tc.desc   getAutoStartupStatusForSelf return false or throw 801 when call it in isolated process.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityRuntime_GetAutoStartupStatus_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: Function) => {
      const tcNumber = `Sub_Ability_AbilityRuntime_GetAutoStartupStatus_0300 `;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
      try {
        let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['GetAutoStartupStatus_0300']
        };
        commonEventManager.createSubscriber(subscribeInfo, (err, data) => {
          hilog.info(0x0000, 'testTag', `${tcNumber} commonEventManager.createSubscriber callback`);
          mySubscriber = data
          commonEventManager.subscribe(mySubscriber, (err, data) => {
            hilog.info(0x0000, 'testTag', `${tcNumber} commonEventManager.subscribe callback err: ${JSON.stringify(err)}`);
            hilog.info(0x0000, 'testTag', `${tcNumber} commonEventManager.subscribe callback data: ${JSON.stringify(data)}`);
            let result: boolean = data.parameters?.result === 'false' || data.parameters?.result === '801';
            expect(result).assertTrue();
            commonEventManager.unsubscribe(mySubscriber, () => {
              hilog.info(0x0000, 'testTag', `${tcNumber} commonEventManager.unsubscribe callback`);
            })
            done();
          })
        });

        context.startAbility({
          bundleName: 'com.acts.ability.actsgetautostartupstatusforself',
          abilityName: 'IsolationProcessAbility'
        }).then(() => {
          hilog.info(0x0000, 'testTag', `${tcNumber} start IsolationProcessAbility success`);
        }).catch((err: BusinessError<void>) => {
          hilog.info(0x0000, 'testTag', `${tcNumber} start IsolationProcessAbility error: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        hilog.info(0x0000, 'testTag', `${tcNumber} failed: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

  })
}