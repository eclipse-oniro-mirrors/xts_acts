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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import testNapi from 'libentry.so';
import { fileIo } from '@kit.CoreFileKit';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

let context: common.UIAbilityContext;
let abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs
let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator

export default function getResourceDirNdkHaveResTest() {
  describe('ActsGetLaunchAndLatestParameterTest', () => {
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('testAbilityContext') as common.UIAbilityContext;
      abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0100
     * @tc.desc   Buffer is empty, other parameters are normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0100', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0100'
      let result = testNapi.Error_GetLaunchParameter_writelength_null();
      try {
        expect(result).assertContain('401');
      } catch (error) {
        console.error(`${tag}-expect failed, code is ${error.code}, message is ${error.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0200
     * @tc.number SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0200
     * @tc.desc   WriteLength is empty, other parameters are normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0200', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0200'
      let result = testNapi.Error_GetLaunchParameter_buffersize_less();
      try {
        expect(result).assertContain('401');
      } catch (error) {
        console.error(`${tag}-expect failed, code is ${error.code}, message is ${error.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0300
     * @tc.number SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0300
     * @tc.desc   BufferSize is smaller than the actual written size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0300', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0300'
      let result = testNapi.Error_GetLaunchParameter_buffer_null();
      try {
        expect(result).assertContain('401');
      } catch (error) {
        console.error(`${tag}-expect failed, code is ${error.code}, message is ${error.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0400
     * @tc.number SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0400
     * @tc.desc   Buffer is empty, other parameters are normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0400', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0400'
      let result = testNapi.Error_GetLatestParameter_buffer_null();
      try {
        expect(result).assertContain('401');
      } catch (error) {
        console.error(`${tag}-expect failed, code is ${error.code}, message is ${error.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0500
     * @tc.number SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0500
     * @tc.desc   WriteLength is empty, other parameters are normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0500', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0500'
      let result = testNapi.Error_GetLaunchParameter_buffersize_less();
      try {
        expect(result).assertContain('401');
      } catch (error) {
        console.error(`${tag}-expect failed, code is ${error.code}, message is ${error.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0600
     * @tc.number SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0600
     * @tc.desc   BufferSize is smaller than the actual written size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0600', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetLaunchParameterAndGetLatestParameter_0600'
      let result = testNapi.Error_GetLaunchParameter_buffer_null();
      try {
        expect(result).assertContain('401');
      } catch (error) {
        console.error(`${tag}-expect failed, code is ${error.code}, message is ${error.message}`);
      }
      done();
    })
  })
}