/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { application, common, Context } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { JSON, worker, MessageEvents } from '@kit.ArkTS';
let uiAbilityContext: common.UIAbilityContext | undefined;

export default function transfercontextinworkertest() {

  describe('ActsTransferTest', () => {
    beforeEach(async (done: Function) => {
      console.info('beforeEach===start ');
      setTimeout(()=>{
        abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility().then((ability) => {
          console.info('beforeEach===ability ' + JSON.stringify(ability).length);
          uiAbilityContext = ability.context;
          console.info('beforeEach===end ');
          done();
        });
      }, 1000);
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_TransferContextInWorker_0100
     * @tc.name: SUB_Ability_AbilityRuntime_TransferContextInWorker_0100
     * @tc.desc: Create a Context transfer in worker
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_TransferContextInWorker_0100', Level.LEVEL3, async (done: Function) => {
      console.log('[SUB_Ability_AbilityRuntime_TransferContextInWorker_0100]: start');
      try {
        console.log('SUB_Ability_AbilityRuntime_TransferContextInWorker_0100 init OneWorker');
        let oneWorker = new worker.ThreadWorker('../workers/OneWorker.ets');
        console.log('SUB_Ability_AbilityRuntime_TransferContextInWorker_0100 set OneWorker onmessage');
        oneWorker.onmessage = (e: MessageEvents): void => {
          oneWorker.terminate();
          console.log('SUB_Ability_AbilityRuntime_TransferContextInWorker_0100 on onmessage');
          let twoWorker = new worker.ThreadWorker('../workers/TwoWorker.ets');
          twoWorker.onmessage = (e: MessageEvents): void => {
            twoWorker.terminate();
            console.log('SUB_Ability_AbilityRuntime_TransferContextInWorker_0100 two onmessage');
            let ctx:common.UIAbilityContext = e.data as common.UIAbilityContext;
            let cache:string = ctx.cacheDir;
            console.log('SUB_Ability_AbilityRuntime_TransferContextInWorker_0100 cache' + cache);
            expect(cache.length).assertLarger(0);
            done();
          }
          twoWorker.postMessage(e.data);
        }
        console.log('SUB_Ability_AbilityRuntime_TransferContextInWorker_0100 OneWorker postMessage');
        if (!uiAbilityContext) {
            console.error('[SUB_Ability_AbilityRuntime_TransferContextInWorker_0100]: context is null');
            expect().assertFail();
            done();
        }
        oneWorker.postMessage(uiAbilityContext);
      } catch (err) {
        console.error('[SUB_Ability_AbilityRuntime_TransferContextInWorker_0100]: catch err' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      console.log('[SUB_Ability_AbilityRuntime_TransferContextInWorker_0100]: end');
    })
  })
}
