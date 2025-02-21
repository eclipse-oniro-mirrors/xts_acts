/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

import contextConstant from '@ohos.app.ability.contextConstant';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import testNapi from 'libentry.so';

let applicationContext = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().getApplicationContext();

export default function applicationContextTest() {
  describe('ActsCapiAbilityRuntimeTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    it('SUB_Ability_AbilityRuntime_ApplicationContextGetBundleName_0100', 0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ApplicationContextGetBundleName_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let bundleName = testNapi.getBundleName();
      expect(bundleName).assertEqual(applicationContext.applicationInfo.name);
    })

    it('SUB_Ability_AbilityRuntime_ApplicationContextGetBundleName_0200', 0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ApplicationContextGetBundleName_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testGetBundleName(applicationContext.applicationInfo.name);
      expect(result).assertEqual(0);
    })

    it('SUB_Ability_AbilityRuntime_ApplicationContextGetCacheDir_0100', 0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ApplicationContextGetCacheDir_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      expect(testNapi.getCacheDir()).assertEqual(applicationContext.cacheDir);

      applicationContext.area = contextConstant.AreaMode.EL1;
      expect(testNapi.getCacheDir()).assertEqual(applicationContext.cacheDir);

      applicationContext.area = contextConstant.AreaMode.EL2;
      expect(testNapi.getCacheDir()).assertEqual(applicationContext.cacheDir);

      applicationContext.area = contextConstant.AreaMode.EL3;
      expect(testNapi.getCacheDir()).assertEqual(applicationContext.cacheDir);

      applicationContext.area = contextConstant.AreaMode.EL4;
      expect(testNapi.getCacheDir()).assertEqual(applicationContext.cacheDir);

      applicationContext.area = contextConstant.AreaMode.EL5;
      expect(testNapi.getCacheDir()).assertEqual(applicationContext.cacheDir);

      // reset to default area
      applicationContext.area = contextConstant.AreaMode.EL2;
    })

    it('SUB_Ability_AbilityRuntime_ApplicationContextGetCacheDir_0200', 0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ApplicationContextGetCacheDir_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testGetCacheDir(applicationContext.cacheDir);
      expect(result).assertEqual(0);

      applicationContext.area = contextConstant.AreaMode.EL1;
      result = testNapi.testGetCacheDir(applicationContext.cacheDir);
      expect(result).assertEqual(0);

      applicationContext.area = contextConstant.AreaMode.EL2;
      result = testNapi.testGetCacheDir(applicationContext.cacheDir);
      expect(result).assertEqual(0);

      applicationContext.area = contextConstant.AreaMode.EL3;
      result = testNapi.testGetCacheDir(applicationContext.cacheDir);
      expect(result).assertEqual(0);

      applicationContext.area = contextConstant.AreaMode.EL4;
      result = testNapi.testGetCacheDir(applicationContext.cacheDir);
      expect(result).assertEqual(0);

      applicationContext.area = contextConstant.AreaMode.EL5;
      result = testNapi.testGetCacheDir(applicationContext.cacheDir);
      expect(result).assertEqual(0);

      // reset to default area
      applicationContext.area = contextConstant.AreaMode.EL2;
    })

    it('SUB_Ability_AbilityRuntime_ApplicationContextGetAreaMode_0100', 0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ApplicationContextGetAreaMode_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      expect(testNapi.getAreaMode()).assertEqual(applicationContext.area);

      applicationContext.area = contextConstant.AreaMode.EL1;
      expect(testNapi.getAreaMode()).assertEqual(contextConstant.AreaMode.EL1);

      applicationContext.area = contextConstant.AreaMode.EL2;
      expect(testNapi.getAreaMode()).assertEqual(contextConstant.AreaMode.EL2);

      applicationContext.area = contextConstant.AreaMode.EL3;
      expect(testNapi.getAreaMode()).assertEqual(contextConstant.AreaMode.EL3);

      applicationContext.area = contextConstant.AreaMode.EL4;
      expect(testNapi.getAreaMode()).assertEqual(contextConstant.AreaMode.EL4);

      applicationContext.area = contextConstant.AreaMode.EL5;
      expect(testNapi.getAreaMode()).assertEqual(contextConstant.AreaMode.EL5);

      // reset to default area
      applicationContext.area = contextConstant.AreaMode.EL2;
    })

    it('SUB_Ability_AbilityRuntime_ApplicationContextGetAreaMode_0200', 0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ApplicationContextGetAreaMode_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testGetAreaMode(applicationContext.area);
      expect(result).assertEqual(0);

      applicationContext.area = contextConstant.AreaMode.EL1;
      result = testNapi.testGetAreaMode(applicationContext.area);
      expect(result).assertEqual(0);

      applicationContext.area = contextConstant.AreaMode.EL2;
      result = testNapi.testGetAreaMode(applicationContext.area);
      expect(result).assertEqual(0);

      applicationContext.area = contextConstant.AreaMode.EL3;
      result = testNapi.testGetAreaMode(applicationContext.area);
      expect(result).assertEqual(0);

      applicationContext.area = contextConstant.AreaMode.EL4;
      result = testNapi.testGetAreaMode(applicationContext.area);
      expect(result).assertEqual(0);

      applicationContext.area = contextConstant.AreaMode.EL5;
      result = testNapi.testGetAreaMode(applicationContext.area);
      expect(result).assertEqual(0);

      // reset to default area
      applicationContext.area = contextConstant.AreaMode.EL2;
    })
  })
}