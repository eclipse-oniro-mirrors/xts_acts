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

import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import hyperSnapManager from "@ohos.app.ability.hyperSnapManager"
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

let supportUse = false;

export default function HyperSnapManagerTest() {
  describe('HyperSnapManagerTest', () => {

    beforeAll(async (done: Function) => {
      console.log('HyperSnapManagerTest' + "beforeAll called");
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
      await abilityDelegator.executeShellCommand('hidumper -s 1901 -a -a').then((result) => {
        hilog.info(0x0000, 'testTag', 'executeShellCommand : data : %{public}s', result.stdResult ?? '');
        hilog.info(0x0000, 'testTag', 'executeShellCommand : data : %{public}s', result.exitCode ?? '');
        if(result.stdResult.indexOf('libforkall_plugin.z.so') != -1){
          supportUse = true;
        }
      })
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnapManager_OnAboutToCreateAbility_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnapManager_OnAboutToCreateAbility_0100
     * @tc.desc   Test onAboutToCreateAbility() not return when not in white list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnapManager_OnAboutToCreateAbility_0100', Level.LEVEL0, async (done: Function) => {
      let onCreate:string | undefined = AppStorage.get<string>("onCreate")
      let onAboutToCreateAbility:string | undefined = AppStorage.get<string>("onAboutToCreateAbility")
      expect(onAboutToCreateAbility).assertEqual('onAboutToCreateAbility');
      expect(onCreate).assertEqual('onCreate');
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnapManager_OnLaunchFromHyperSnap_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnapManager_OnLaunchFromHyperSnap_0100
     * @tc.desc   Test onLaunchFromHyperSnap() not return when not in white list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnapManager_OnLaunchFromHyperSnap_0100', Level.LEVEL0, async (done: Function) => {
      let onCreate:string | undefined = AppStorage.get<string>("onCreate")
      let onLaunchFromHyperSnap:string | undefined = AppStorage.get<string>("onLaunchFromHyperSnap")
      expect(onLaunchFromHyperSnap).assertEqual(undefined);
      expect(onCreate).assertEqual('onCreate');
      done();
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0100
     * @tc.desc   Test SetHyperSnapEnabled set false will return 16000150 when not support hyperSnap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0100', Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0100 supprot ' + supportUse);
      if(!supportUse){
        try{
          hyperSnapManager.setHyperSnapEnabled(false);
          hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0100 success');
          expect().assertFail();
        }catch(e){
          hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0100 catch');
          expect((e as BusinessError).code).assertEqual(16000150);
        }
        done();
      }else{
        let flag = false;
        try{
          hyperSnapManager.setHyperSnapEnabled(false);
          flag = true;
          hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0100 success ' + flag);
        }catch(e){
          hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0100 catch ');
          expect().assertFail();
        }
        expect(flag).assertTrue();
        done();
      }
    })

    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0200
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0200
     * @tc.desc   Test SetHyperSnapEnabled set true will return 16000150 when not support hyperSnap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0200', Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0200 supprot ' + supportUse);
      if(!supportUse){
        try{
          hyperSnapManager.setHyperSnapEnabled(true);
          hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0200 success');
          expect().assertFail();
        }catch(e){
          hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0200 catch');
          expect((e as BusinessError).code).assertEqual(16000150);
        }
        done();
      }else{
        let flag = false;
        try{
          hyperSnapManager.setHyperSnapEnabled(true);
          flag = true;
          hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0200 success ' + flag);
        }catch(e){
          hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0200 catch ');
          expect().assertFail();
        }
        expect(flag).assertTrue();
        done();
      }
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnapManager_RequestRebuildHyperSnap_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnapManager_RequestRebuildHyperSnap_0100
     * @tc.desc   Test RequestRebuildHyperSnap will return 16000150 when not support hyperSnap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnapManager_RequestRebuildHyperSnap_0100', Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_RequestRebuildHyperSnap_0100 supprot ' + supportUse);
      if(!supportUse){
        try{
          hyperSnapManager.requestRebuildHyperSnap();
          hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_RequestRebuildHyperSnap_0100 success');
          expect().assertFail();
        }catch(e){
          hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_RequestRebuildHyperSnap_0100 catch');
          expect((e as BusinessError).code).assertEqual(16000150);
        }
        done();
      }else{
        let flag = false;
        try{
          hyperSnapManager.requestRebuildHyperSnap();
          flag = true;
          hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_RequestRebuildHyperSnap_0100 success ' + flag);
        }catch(e){
          hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_RequestRebuildHyperSnap_0100 catch ');
          expect().assertFail();
        }
        expect(flag).assertTrue();
        done();
      }
    })
  })
}
