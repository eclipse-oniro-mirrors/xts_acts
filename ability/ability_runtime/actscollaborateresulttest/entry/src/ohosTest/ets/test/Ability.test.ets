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
import { describe, it, expect, Level } from '@ohos/hypium'
import { AbilityConstant, wantConstant } from '@kit.AbilityKit';

export default function abilityTest() {
  describe('AddFlagTest', () => {

    /**
     * @tc.name   SUB_Ability_Ability_Runtime_onCollaborate_2900
     * @tc.number SUB_Ability_Ability_Runtime_onCollaborate_2900
     * @tc.desc   AbilityConstant.CollaborateResult.ACCEPT equal 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_Ability_Runtime_onCollaborate_2900', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_Ability_Ability_Runtime_onCollaborate_2900';
      console.info(`${caseName} Begin`);
      try {
        expect(AbilityConstant.CollaborateResult.ACCEPT).assertEqual(0)
        done();
      } catch (err) {
        console.info(`${caseName} failed: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end`);
    })
    
    /**
     * @tc.name   SUB_Ability_Ability_Runtime_onCollaborate_3000
     * @tc.number SUB_Ability_Ability_Runtime_onCollaborate_3000
     * @tc.desc   AbilityConstant.CollaborateResult.REJECT equal 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_Ability_Runtime_onCollaborate_3000', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_Ability_Ability_Runtime_onCollaborate_3000';
      console.info(`${caseName} Begin`);
      try {
        expect(AbilityConstant.CollaborateResult.REJECT).assertEqual(1)
        done();
      } catch (err) {
        console.info(`${caseName} failed: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end`);
    })
    
    /**
     * @tc.name   SUB_Ability_Ability_Runtime_onCollaborate_3100
     * @tc.number SUB_Ability_Ability_Runtime_onCollaborate_3100
     * @tc.desc   wantConstant.Flags.FLAG_ABILITY_ON_COLLABORATE equal 0x00002000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_Ability_Runtime_onCollaborate_3100', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_Ability_Ability_Runtime_onCollaborate_3100';
      console.info(`${caseName} Begin`);
      try {
        expect(wantConstant.Flags.FLAG_ABILITY_ON_COLLABORATE).assertEqual(0x00002000)
        done();
      } catch (err) {
        console.info(`${caseName} failed: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end`);
    })
  })
}