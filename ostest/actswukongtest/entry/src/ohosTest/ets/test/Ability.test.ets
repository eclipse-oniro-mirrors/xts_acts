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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import prompt from '@ohos.prompt'
import { BusinessError } from '@ohos.base'

let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator | undefined = undefined
let abilityDelegator1: AbilityDelegatorRegistry.AbilityDelegator | undefined = undefined
let cmd:string;

function sleep(time:number) {
  return new Promise <void>((resolve, reject) => {
    setTimeout(() => {
      resolve();
    }, time)
  })
}

export default function abilityTest() {
  describe('ActsWukongTest',  () =>{
    beforeAll(async () => {
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator1 = AbilityDelegatorRegistry.getAbilityDelegator();
      await sleep(2000);
    })

    afterAll(async  () =>{
      prompt.showToast({
        message: 'CASE All End'
      })
    })

    /**
     * @tc.name   wukongtest_0010
     * @tc.number wukongtest_0010
     * @tc.desc   getAbilityLists callback API abilityType is spoken, stateType is install.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('wukongtest_0010', Level.LEVEL0, async  ()=>{
      cmd = "wukong exec -T 0.5 &";
      if(abilityDelegator != undefined){
        await abilityDelegator.executeShellCommand("pkill accessibility");
        abilityDelegator.executeShellCommand(cmd,
          async (err: BusinessError, d) => {
            console.log('ACTS_wukongTest executeShellCommand : err : ' + JSON.stringify(err));
            console.log('ACTS_wukongTest executeShellCommand : stdResult : ' + d.stdResult);
            console.log('ACTS_wukongTest executeShellCommand : exitCode : ' + d.exitCode);
          });
      }
      await sleep(5000);
      if(abilityDelegator1 != undefined){
        abilityDelegator1.executeShellCommand("ps -ef|grep 'wukong exec -T 0.5'|grep -c -v grep ", async (error: BusinessError, date) => {
          console.log('ACTS_wukongTest cmdPs executeShellCommand : err : ' + JSON.stringify(error));
          console.log('ACTS_wukongTest cmdPs executeShellCommand : stdResult : ' + date.stdResult);
          console.log('ACTS_wukongTest cmdPs executeShellCommand : exitCode : ' + date.exitCode);
          let i:number = date.stdResult.indexOf('1');
          if (i == -1) {
            expect().assertFail();
          }
        });
      }
    })
  })
}
