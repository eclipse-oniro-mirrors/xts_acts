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

import contextConstant from '@ohos.app.ability.contextConstant';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import testNapi from 'libentry.so';
import { fileIo } from '@kit.CoreFileKit';

export default function getResourceDirNdkNotHaveResTest() {
  describe('ActsGetResourceDirNdkNotHaveResTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetResourceDirNdk_1700
     * @tc.number SUB_Ability_AbilityRuntime_GetResourceDirNdk_1700
     * @tc.desc   Obtain the resource path of the entry module (no resource files)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetResourceDirNdk_1700', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetResourceDirNdk_1700';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let moduleName : string = 'entry';
      let res = testNapi.getResourceDir(moduleName);
      let resCode = res[0];
      let resPath = res[1];
      expect(resCode).assertEqual(0);
      expect(resPath).assertEqual('');
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetResourceDirNdk_1800
     * @tc.number SUB_Ability_AbilityRuntime_GetResourceDirNdk_1800
     * @tc.desc   Obtain the resource path of the feature module (no resource files)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetResourceDirNdk_1800', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetResourceDirNdk_1800';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let moduleName : string = 'feature';
      let res = testNapi.getResourceDir(moduleName);
      let resCode = res[0];
      let resPath = res[1];
      expect(resCode).assertEqual(0);
      expect(resPath).assertEqual('');
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetResourceDirNdk_1900
     * @tc.number SUB_Ability_AbilityRuntime_GetResourceDirNdk_1900
     * @tc.desc   Obtain the resource path of the shared module (no resource files)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetResourceDirNdk_1900', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetResourceDirNdk_1900';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let moduleName : string = 'shared';
      let res = testNapi.getResourceDir(moduleName);
      let resCode = res[0];
      let resPath = res[1];
      expect(resCode).assertEqual(0);
      expect(resPath).assertEqual('');
      done();
    })
  })
}