/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level } from '@ohos/hypium';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let TAG: string;

export default function shellCommandControlTest() {
  describe('ShellCommandControlTest', () => {
    /**
     * @tc.name   Acts_Ability_ShellCommandControl__0100
     * @tc.number Acts_Ability_ShellCommandControl__0100
     * @tc.desc   Error code 0 is returned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_Ability_ShellCommandControl__0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'Acts_Ability_ShellCommandControl__0100';
      console.log(`${TAG} --- start`);
      let cmd = 'aa help';
      AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilityDelegator")!.executeShellCommand(cmd, (err, data) => {
        console.log(`${TAG} stdResult = ${data.stdResult}`);
        console.log(`${TAG} stdResult = ${JSON.stringify(err)}`);
        expect(data.exitCode).assertEqual(0);
        console.log(`${TAG} --- end`);
        done();
      })
    })

    /**
     * @tc.name   Acts_Ability_ShellCommandControl__0200
     * @tc.number Acts_Ability_ShellCommandControl__0200
     * @tc.desc   Error code -1 is returned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_Ability_ShellCommandControl__0200', Level.LEVEL0, async (done: Function) => {
      TAG = 'Acts_Ability_ShellCommandControl__0200';
      console.log(`${TAG} --- start`);
      let cmd = 'ls -l';
      AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilityDelegator")!.executeShellCommand(cmd, (err, data) => {
        console.log(`${TAG} stdResult = ${data.stdResult}`);
        console.log(`${TAG} stdResult = ${JSON.stringify(err)}`);
        expect(data.exitCode).assertEqual(-1);
        console.log(`${TAG} --- end`);
        done();
      })
    })
  })
}