/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

let applicationContext = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().getApplicationContext();
let getCodeArray: number[] = [];

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

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ApplicationContextGetBundleName_0100
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContextGetBundleName_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ApplicationContextGetBundleName_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContextGetBundleName_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ApplicationContextGetBundleName_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let bundleName = testNapi.getBundleName();
      expect(bundleName).assertEqual(applicationContext.applicationInfo.name);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ApplicationContextGetBundleName_0200
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContextGetBundleName_0200
     * @tc.desc   SUB_Ability_AbilityRuntime_ApplicationContextGetBundleName_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContextGetBundleName_0200', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ApplicationContextGetBundleName_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testGetBundleName(applicationContext.applicationInfo.name);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ApplicationContextGetCacheDir_0100
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContextGetCacheDir_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ApplicationContextGetCacheDir_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContextGetCacheDir_0100', Level.LEVEL0, () => {
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

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ApplicationContextGetCacheDir_0200
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContextGetCacheDir_0200
     * @tc.desc   SUB_Ability_AbilityRuntime_ApplicationContextGetCacheDir_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContextGetCacheDir_0200', Level.LEVEL0, () => {
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

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ApplicationContextGetAreaMode_0100
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContextGetAreaMode_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ApplicationContextGetAreaMode_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContextGetAreaMode_0100', Level.LEVEL0, () => {
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

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ApplicationContextGetAreaMode_0200
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContextGetAreaMode_0200
     * @tc.desc   SUB_Ability_AbilityRuntime_ApplicationContextGetAreaMode_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContextGetAreaMode_0200', Level.LEVEL0, () => {
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
	
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0100
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0100
     * @tc.desc   The sandbox path is correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0100', Level.LEVEL0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      applicationContext.area = contextConstant.AreaMode.EL2;
      expect(testNapi.getTempDir()).assertEqual("/data/storage/el2/base/temp");
      hilog.info(0x0000, 'testTag', tag + ' tempDir default %{public}s ', testNapi.getTempDir());

      applicationContext.area = contextConstant.AreaMode.EL1;
      expect(testNapi.getTempDir()).assertEqual(applicationContext.tempDir);
      expect(testNapi.getTempDir()).assertEqual("/data/storage/el1/base/temp");
      hilog.info(0x0000, 'testTag', tag + ' tempDir AreaMode=EL1 %{public}s ', testNapi.getTempDir());

      applicationContext.area = contextConstant.AreaMode.EL2;
      expect(testNapi.getTempDir()).assertEqual(applicationContext.tempDir);
      expect(testNapi.getTempDir()).assertEqual("/data/storage/el2/base/temp");
      hilog.info(0x0000, 'testTag', tag + ' tempDir AreaMode=EL2 %{public}s ', testNapi.getTempDir());

      applicationContext.area = contextConstant.AreaMode.EL3;
      expect(testNapi.getTempDir()).assertEqual(applicationContext.tempDir);
      expect(testNapi.getTempDir()).assertEqual("/data/storage/el3/base/temp");
      hilog.info(0x0000, 'testTag', tag + ' tempDir AreaMode=EL3 %{public}s ', testNapi.getTempDir());

      applicationContext.area = contextConstant.AreaMode.EL4;
      expect(testNapi.getTempDir()).assertEqual(applicationContext.tempDir);
      expect(testNapi.getTempDir()).assertEqual("/data/storage/el4/base/temp");
      hilog.info(0x0000, 'testTag', tag + ' tempDir AreaMode=EL4 %{public}s ', testNapi.getTempDir());

      applicationContext.area = contextConstant.AreaMode.EL5;
      expect(testNapi.getTempDir()).assertEqual(applicationContext.tempDir);
      expect(testNapi.getTempDir()).assertEqual("/data/storage/el5/base/temp");
      hilog.info(0x0000, 'testTag', tag + ' tempDir AreaMode=EL5 %{public}s ', testNapi.getTempDir());

      applicationContext.area = 100;
      expect(testNapi.getTempDir()).assertEqual(applicationContext.tempDir);
      expect(testNapi.getTempDir()).assertEqual("/data/storage/el5/base/temp");
      hilog.info(0x0000, 'testTag', tag + ' tempDir AreaMode=100 %{public}s ', testNapi.getTempDir());

      applicationContext.area = -4;
      expect(testNapi.getTempDir()).assertEqual(applicationContext.tempDir);
      expect(testNapi.getTempDir()).assertEqual("/data/storage/el5/base/temp");
      hilog.info(0x0000, 'testTag', tag + ' tempDir AreaMode=-4 %{public}s ', testNapi.getTempDir());

      applicationContext.area = 0.5;
      expect(testNapi.getTempDir()).assertEqual(applicationContext.tempDir);
      expect(testNapi.getTempDir()).assertEqual("/data/storage/el1/base/temp");
      hilog.info(0x0000, 'testTag', tag + ' tempDir AreaMode=-0.5 %{public}s ', testNapi.getTempDir());

      // reset to default area
      applicationContext.area = contextConstant.AreaMode.EL2;
      hilog.info(0x0000, 'testTag', '%{public}s end', tag);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0200
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0200
     * @tc.desc   The Error Code is correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0200', Level.LEVEL0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);

      getCodeArray = testNapi.testGetTempDir(applicationContext.tempDir);
      let result = getCodeArray[0];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' buffer = NULL  Error code is  %{public}d ', result);

      result = getCodeArray[1];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' buffer = nullptr Error code is %{public}d ', result);

      result = getCodeArray[2];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' writeLength = NULL Error code is %{public}d ', result);

      result = getCodeArray[3];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' writeLength = nullptr Error code is %{public}d ', result);

      result = getCodeArray[4];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = -1  Error code is %{public}d ', result);

      result = getCodeArray[5];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = 0  Error code is %{public}d ', result);

      result = getCodeArray[6];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = realCacheDirLen Error code is %{public}d ', result);

      result = getCodeArray[7];
      expect(result).assertEqual(0);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = realCacheDirLen + 1  Error code is %{public}d ', result);

      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0300
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0300
     * @tc.desc   The sandbox path is correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0300', Level.LEVEL0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);

      applicationContext.area = contextConstant.AreaMode.EL2;
      expect(testNapi.getFilesDir()).assertEqual("/data/storage/el2/base/files");
      hilog.info(0x0000, 'testTag', tag + ' filesDir default %{public}s ', testNapi.getFilesDir());

      applicationContext.area = contextConstant.AreaMode.EL1;
      expect(testNapi.getFilesDir()).assertEqual(applicationContext.filesDir);
      expect(testNapi.getFilesDir()).assertEqual("/data/storage/el1/base/files");
      hilog.info(0x0000, 'testTag', tag + ' filesDir AreaMode=EL1 %{public}s ', testNapi.getFilesDir());

      applicationContext.area = contextConstant.AreaMode.EL2;
      expect(testNapi.getFilesDir()).assertEqual(applicationContext.filesDir);
      expect(testNapi.getFilesDir()).assertEqual("/data/storage/el2/base/files");
      hilog.info(0x0000, 'testTag', tag + ' filesDir AreaMode=EL2 %{public}s ', testNapi.getFilesDir());

      applicationContext.area = contextConstant.AreaMode.EL3;
      expect(testNapi.getFilesDir()).assertEqual(applicationContext.filesDir);
      expect(testNapi.getFilesDir()).assertEqual("/data/storage/el3/base/files");
      hilog.info(0x0000, 'testTag', tag + ' filesDir AreaMode=EL3 %{public}s ', testNapi.getFilesDir());

      applicationContext.area = contextConstant.AreaMode.EL4;
      expect(testNapi.getFilesDir()).assertEqual(applicationContext.filesDir);
      expect(testNapi.getFilesDir()).assertEqual("/data/storage/el4/base/files");
      hilog.info(0x0000, 'testTag', tag + ' filesDir AreaMode=EL4 %{public}s ', testNapi.getFilesDir());

      applicationContext.area = contextConstant.AreaMode.EL5;
      expect(testNapi.getFilesDir()).assertEqual(applicationContext.filesDir);
      expect(testNapi.getFilesDir()).assertEqual("/data/storage/el5/base/files");
      hilog.info(0x0000, 'testTag', tag + ' filesDir AreaMode=EL5 %{public}s ', testNapi.getFilesDir());

      applicationContext.area = 100;
      expect(testNapi.getFilesDir()).assertEqual(applicationContext.filesDir);
      expect(testNapi.getFilesDir()).assertEqual("/data/storage/el5/base/files");
      hilog.info(0x0000, 'testTag', tag + ' filesDir AreaMode=100 %{public}s ', testNapi.getFilesDir());

      applicationContext.area = -4;
      expect(testNapi.getFilesDir()).assertEqual(applicationContext.filesDir);
      expect(testNapi.getFilesDir()).assertEqual("/data/storage/el5/base/files");
      hilog.info(0x0000, 'testTag', tag + ' filesDir AreaMode=-4 %{public}s ', testNapi.getFilesDir());

      applicationContext.area = 0.5;
      expect(testNapi.getFilesDir()).assertEqual(applicationContext.filesDir);
      expect(testNapi.getFilesDir()).assertEqual("/data/storage/el1/base/files");
      hilog.info(0x0000, 'testTag', tag + ' filesDir AreaMode=-0.5 %{public}s ', testNapi.getFilesDir());

      // reset to default area
      applicationContext.area = contextConstant.AreaMode.EL2;
      hilog.info(0x0000, 'testTag', '%{public}s end', tag);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0400
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0400
     * @tc.desc   The Error Code is correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0400', Level.LEVEL0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);

      getCodeArray = testNapi.testGetFilesDir(applicationContext.filesDir);
      let result = getCodeArray[0];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' buffer = NULL  Error code is  %{public}d ', result);

      result = getCodeArray[1];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' buffer = nullptr Error code is %{public}d ', result);

      result = getCodeArray[2];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' writeLength = NULL Error code is %{public}d ', result);

      result = getCodeArray[3];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' writeLength = nullptr Error code is %{public}d ', result);

      result = getCodeArray[4];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = -1  Error code is %{public}d ', result);

      result = getCodeArray[5];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = 0  Error code is %{public}d ', result);

      result = getCodeArray[6];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = realCacheDirLen Error code is %{public}d ', result);

      result = getCodeArray[7];
      expect(result).assertEqual(0);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = realCacheDirLen + 1  Error code is %{public}d ', result);

      done();
    })


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0500
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0500
     * @tc.desc   The sandbox path is correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0500', Level.LEVEL0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0500';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);

      applicationContext.area = contextConstant.AreaMode.EL2;
      expect(testNapi.getPreferencesDir()).assertEqual("/data/storage/el2/base/preferences");
      hilog.info(0x0000, 'testTag', tag + ' preferencesDir default %{public}s ', testNapi.getPreferencesDir());

      applicationContext.area = contextConstant.AreaMode.EL1;
      expect(testNapi.getPreferencesDir()).assertEqual(applicationContext.preferencesDir);
      expect(testNapi.getPreferencesDir()).assertEqual("/data/storage/el1/base/preferences");
      hilog.info(0x0000, 'testTag', tag + ' preferencesDir AreaMode=EL1 %{public}s ', testNapi.getPreferencesDir());

      applicationContext.area = contextConstant.AreaMode.EL2;
      expect(testNapi.getPreferencesDir()).assertEqual(applicationContext.preferencesDir);
      expect(testNapi.getPreferencesDir()).assertEqual("/data/storage/el2/base/preferences");
      hilog.info(0x0000, 'testTag', tag + ' preferencesDir AreaMode=EL2 %{public}s ', testNapi.getPreferencesDir());

      applicationContext.area = contextConstant.AreaMode.EL3;
      expect(testNapi.getPreferencesDir()).assertEqual(applicationContext.preferencesDir);
      expect(testNapi.getPreferencesDir()).assertEqual("/data/storage/el3/base/preferences");
      hilog.info(0x0000, 'testTag', tag + ' preferencesDir AreaMode=EL3 %{public}s ', testNapi.getPreferencesDir());

      applicationContext.area = contextConstant.AreaMode.EL4;
      expect(testNapi.getPreferencesDir()).assertEqual(applicationContext.preferencesDir);
      expect(testNapi.getPreferencesDir()).assertEqual("/data/storage/el4/base/preferences");
      hilog.info(0x0000, 'testTag', tag + ' preferencesDir AreaMode=EL4 %{public}s ', testNapi.getPreferencesDir());

      applicationContext.area = contextConstant.AreaMode.EL5;
      expect(testNapi.getPreferencesDir()).assertEqual(applicationContext.preferencesDir);
      expect(testNapi.getPreferencesDir()).assertEqual("/data/storage/el5/base/preferences");
      hilog.info(0x0000, 'testTag', tag + ' preferencesDir AreaMode=EL5 %{public}s ', testNapi.getPreferencesDir());

      applicationContext.area = 100;
      expect(testNapi.getPreferencesDir()).assertEqual(applicationContext.preferencesDir);
      expect(testNapi.getPreferencesDir()).assertEqual("/data/storage/el5/base/preferences");
      hilog.info(0x0000, 'testTag', tag + ' preferencesDir AreaMode=100 %{public}s ', testNapi.getPreferencesDir());

      applicationContext.area = -4;
      expect(testNapi.getPreferencesDir()).assertEqual(applicationContext.preferencesDir);
      expect(testNapi.getPreferencesDir()).assertEqual("/data/storage/el5/base/preferences");
      hilog.info(0x0000, 'testTag', tag + ' preferencesDir AreaMode=-4 %{public}s ', testNapi.getPreferencesDir());

      applicationContext.area = 0.5;
      expect(testNapi.getPreferencesDir()).assertEqual(applicationContext.preferencesDir);
      expect(testNapi.getPreferencesDir()).assertEqual("/data/storage/el1/base/preferences");
      hilog.info(0x0000, 'testTag', tag + ' preferencesDir AreaMode=-0.5 %{public}s ', testNapi.getPreferencesDir());

      // reset to default area
      applicationContext.area = contextConstant.AreaMode.EL2;
      hilog.info(0x0000, 'testTag', '%{public}s end', tag);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0600
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0600
     * @tc.desc   The Error Code is correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0600', Level.LEVEL0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0600';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      getCodeArray = testNapi.testGetPreferencesDir(applicationContext.preferencesDir);

      let result = getCodeArray[0];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' buffer = NULL  Error code is  %{public}d ', result);

      result = getCodeArray[1];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' buffer = nullptr Error code is %{public}d ', result);

      result = getCodeArray[2];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' writeLength = NULL Error code is %{public}d ', result);

      result = getCodeArray[3];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' writeLength = nullptr Error code is %{public}d ', result);

      result = getCodeArray[4];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = -1  Error code is %{public}d ', result);

      result = getCodeArray[5];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = 0  Error code is %{public}d ', result);

      result = getCodeArray[6];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = realCacheDirLen Error code is %{public}d ', result);

      result = getCodeArray[7];
      expect(result).assertEqual(0);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = realCacheDirLen + 1  Error code is %{public}d ', result);

      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0700
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0700
     * @tc.desc   The sandbox path is correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0700', Level.LEVEL0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0700';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);

      applicationContext.area = contextConstant.AreaMode.EL1;
      expect(testNapi.getBundleCodeDir()).assertEqual("/data/storage/el1/bundle");
      hilog.info(0x0000, 'testTag', tag + ' bundleCodeDir default %{public}s ', testNapi.getBundleCodeDir());

      applicationContext.area = contextConstant.AreaMode.EL1;
      expect(testNapi.getBundleCodeDir()).assertEqual(applicationContext.bundleCodeDir);
      expect(testNapi.getBundleCodeDir()).assertEqual("/data/storage/el1/bundle");
      hilog.info(0x0000, 'testTag', tag + ' bundleCodeDir AreaMode=EL1 %{public}s ', testNapi.getBundleCodeDir());

      applicationContext.area = contextConstant.AreaMode.EL2;
      expect(testNapi.getBundleCodeDir()).assertEqual(applicationContext.bundleCodeDir);
      expect(testNapi.getBundleCodeDir()).assertEqual("/data/storage/el1/bundle");
      hilog.info(0x0000, 'testTag', tag + ' bundleCodeDir AreaMode=EL2 %{public}s ', testNapi.getBundleCodeDir());

      applicationContext.area = contextConstant.AreaMode.EL3;
      expect(testNapi.getBundleCodeDir()).assertEqual(applicationContext.bundleCodeDir);
      expect(testNapi.getBundleCodeDir()).assertEqual("/data/storage/el1/bundle");
      hilog.info(0x0000, 'testTag', tag + ' bundleCodeDir AreaMode=EL3 %{public}s ', testNapi.getBundleCodeDir());

      applicationContext.area = contextConstant.AreaMode.EL4;
      expect(testNapi.getBundleCodeDir()).assertEqual(applicationContext.bundleCodeDir);
      expect(testNapi.getBundleCodeDir()).assertEqual("/data/storage/el1/bundle");
      hilog.info(0x0000, 'testTag', tag + ' bundleCodeDir AreaMode=EL4 %{public}s ', testNapi.getBundleCodeDir());

      applicationContext.area = contextConstant.AreaMode.EL5;
      expect(testNapi.getBundleCodeDir()).assertEqual(applicationContext.bundleCodeDir);
      expect(testNapi.getBundleCodeDir()).assertEqual("/data/storage/el1/bundle");
      hilog.info(0x0000, 'testTag', tag + ' bundleCodeDir AreaMode=EL5 %{public}s ', testNapi.getBundleCodeDir());

      applicationContext.area = 100;
      expect(testNapi.getBundleCodeDir()).assertEqual(applicationContext.bundleCodeDir);
      expect(testNapi.getBundleCodeDir()).assertEqual("/data/storage/el1/bundle");
      hilog.info(0x0000, 'testTag', tag + ' bundleCodeDir AreaMode=100 %{public}s ', testNapi.getBundleCodeDir());

      applicationContext.area = -4;
      expect(testNapi.getBundleCodeDir()).assertEqual(applicationContext.bundleCodeDir);
      expect(testNapi.getBundleCodeDir()).assertEqual("/data/storage/el1/bundle");
      hilog.info(0x0000, 'testTag', tag + ' bundleCodeDir AreaMode=-4 %{public}s ', testNapi.getBundleCodeDir());

      applicationContext.area = 0.5;
      expect(testNapi.getBundleCodeDir()).assertEqual(applicationContext.bundleCodeDir);
      expect(testNapi.getBundleCodeDir()).assertEqual("/data/storage/el1/bundle");
      hilog.info(0x0000, 'testTag', tag + ' bundleCodeDir AreaMode=-0.5 %{public}s ', testNapi.getBundleCodeDir());

      // reset to default area
      applicationContext.area = contextConstant.AreaMode.EL1;
      hilog.info(0x0000, 'testTag', '%{public}s end', tag);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0800
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0800
     * @tc.desc   The Error Code is correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0800', Level.LEVEL0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0800';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);

      getCodeArray = testNapi.testGetBundleCodeDir(applicationContext.bundleCodeDir);
      let result = getCodeArray[0];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' buffer = NULL  Error code is  %{public}d ', result);

      result = getCodeArray[1];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' buffer = nullptr Error code is %{public}d ', result);

      result = getCodeArray[2];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' writeLength = NULL Error code is %{public}d ', result);

      result = getCodeArray[3];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' writeLength = nullptr Error code is %{public}d ', result);

      result = getCodeArray[4];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = -1  Error code is %{public}d ', result);

      result = getCodeArray[5];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = 0  Error code is %{public}d ', result);

      result = getCodeArray[6];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = realCacheDirLen Error code is %{public}d ', result);

      result = getCodeArray[7];
      expect(result).assertEqual(0);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = realCacheDirLen + 1  Error code is %{public}d ', result);

      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0900
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0900
     * @tc.desc   The sandbox path is correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0900', Level.LEVEL0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_0900';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);

      applicationContext.area = contextConstant.AreaMode.EL2;
      expect(testNapi.getDistributedFilesDir()).assertEqual("/data/storage/el2/distributedfiles");
      hilog.info(0x0000, 'testTag', tag + ' distributedFilesDir default %{public}s ', testNapi.getDistributedFilesDir());

      applicationContext.area = contextConstant.AreaMode.EL1;
      expect(testNapi.getDistributedFilesDir()).assertEqual(applicationContext.distributedFilesDir);
      expect(testNapi.getDistributedFilesDir()).assertEqual("/data/storage/el1/distributedfiles");
      hilog.info(0x0000, 'testTag', tag + ' distributedFilesDir AreaMode=EL1 %{public}s ', testNapi.getDistributedFilesDir());

      applicationContext.area = contextConstant.AreaMode.EL2;
      expect(testNapi.getDistributedFilesDir()).assertEqual(applicationContext.distributedFilesDir);
      expect(testNapi.getDistributedFilesDir()).assertEqual("/data/storage/el2/distributedfiles");
      hilog.info(0x0000, 'testTag', tag + ' distributedFilesDir AreaMode=EL2 %{public}s ', testNapi.getDistributedFilesDir());

      applicationContext.area = contextConstant.AreaMode.EL3;
      expect(testNapi.getDistributedFilesDir()).assertEqual(applicationContext.distributedFilesDir);
      expect(testNapi.getDistributedFilesDir()).assertEqual("/data/storage/el2/distributedfiles");
      hilog.info(0x0000, 'testTag', tag + ' distributedFilesDir AreaMode=EL3 %{public}s ', testNapi.getDistributedFilesDir());

      applicationContext.area = contextConstant.AreaMode.EL4;
      expect(testNapi.getDistributedFilesDir()).assertEqual(applicationContext.distributedFilesDir);
      expect(testNapi.getDistributedFilesDir()).assertEqual("/data/storage/el2/distributedfiles");
      hilog.info(0x0000, 'testTag', tag + ' distributedFilesDir AreaMode=EL4 %{public}s ', testNapi.getDistributedFilesDir());

      applicationContext.area = contextConstant.AreaMode.EL5;
      expect(testNapi.getDistributedFilesDir()).assertEqual(applicationContext.distributedFilesDir);
      expect(testNapi.getDistributedFilesDir()).assertEqual("/data/storage/el2/distributedfiles");
      hilog.info(0x0000, 'testTag', tag + ' distributedFilesDir AreaMode=EL5 %{public}s ', testNapi.getDistributedFilesDir());

      applicationContext.area = 100;
      expect(testNapi.getDistributedFilesDir()).assertEqual(applicationContext.distributedFilesDir);
      expect(testNapi.getDistributedFilesDir()).assertEqual("/data/storage/el2/distributedfiles");
      hilog.info(0x0000, 'testTag', tag + ' distributedFilesDir AreaMode=100 %{public}s ', testNapi.getDistributedFilesDir());

      applicationContext.area = -4;
      expect(testNapi.getDistributedFilesDir()).assertEqual(applicationContext.distributedFilesDir);
      expect(testNapi.getDistributedFilesDir()).assertEqual("/data/storage/el2/distributedfiles");
      hilog.info(0x0000, 'testTag', tag + ' distributedFilesDir AreaMode=-4 %{public}s ', testNapi.getDistributedFilesDir());

      applicationContext.area = 0.5;
      expect(testNapi.getDistributedFilesDir()).assertEqual(applicationContext.distributedFilesDir);
      expect(testNapi.getDistributedFilesDir()).assertEqual("/data/storage/el1/distributedfiles");
      hilog.info(0x0000, 'testTag', tag + ' distributedFilesDir AreaMode=-0.5 %{public}s ', testNapi.getDistributedFilesDir());

      // reset to default area
      applicationContext.area = contextConstant.AreaMode.EL2;
      hilog.info(0x0000, 'testTag', '%{public}s end', tag);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1000
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1000
     * @tc.desc   The Error Code is correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1000', Level.LEVEL0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1000';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);

      getCodeArray = testNapi.testGetDistributedFilesDir(applicationContext.distributedFilesDir);
      let result = getCodeArray[0];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' buffer = NULL  Error code is  %{public}d ', result);

      result = getCodeArray[1];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' buffer = nullptr Error code is %{public}d ', result);

      result = getCodeArray[2];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' writeLength = NULL Error code is %{public}d ', result);

      result = getCodeArray[3];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' writeLength = nullptr Error code is %{public}d ', result);

      result = getCodeArray[4];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = -1  Error code is %{public}d ', result);

      result = getCodeArray[5];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = 0  Error code is %{public}d ', result);

      result = getCodeArray[6];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = realCacheDirLen Error code is %{public}d ', result);

      result = getCodeArray[7];
      expect(result).assertEqual(0);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = realCacheDirLen + 1  Error code is %{public}d ', result);

      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1100
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1100
     * @tc.desc   The sandbox path is correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1100', Level.LEVEL0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);

      applicationContext.area = contextConstant.AreaMode.EL2;
      expect(testNapi.getCloudFileDir()).assertEqual("/data/storage/el2/cloud");
      hilog.info(0x0000, 'testTag', tag + ' cloudFileDir default %{public}s ', testNapi.getCloudFileDir());

      applicationContext.area = contextConstant.AreaMode.EL1;
      expect(testNapi.getCloudFileDir()).assertEqual(applicationContext.cloudFileDir);
      expect(testNapi.getCloudFileDir()).assertEqual("/data/storage/el2/cloud");
      hilog.info(0x0000, 'testTag', tag + ' cloudFileDir AreaMode=EL1 %{public}s ', testNapi.getCloudFileDir());

      applicationContext.area = contextConstant.AreaMode.EL2;
      expect(testNapi.getCloudFileDir()).assertEqual(applicationContext.cloudFileDir);
      expect(testNapi.getCloudFileDir()).assertEqual("/data/storage/el2/cloud");
      hilog.info(0x0000, 'testTag', tag + ' cloudFileDir AreaMode=EL2 %{public}s ', testNapi.getCloudFileDir());

      applicationContext.area = contextConstant.AreaMode.EL3;
      expect(testNapi.getCloudFileDir()).assertEqual(applicationContext.cloudFileDir);
      expect(testNapi.getCloudFileDir()).assertEqual("/data/storage/el2/cloud");
      hilog.info(0x0000, 'testTag', tag + ' cloudFileDir AreaMode=EL3 %{public}s ', testNapi.getCloudFileDir());

      applicationContext.area = contextConstant.AreaMode.EL4;
      expect(testNapi.getCloudFileDir()).assertEqual(applicationContext.cloudFileDir);
      expect(testNapi.getCloudFileDir()).assertEqual("/data/storage/el2/cloud");
      hilog.info(0x0000, 'testTag', tag + ' cloudFileDir AreaMode=EL4 %{public}s ', testNapi.getCloudFileDir());

      applicationContext.area = contextConstant.AreaMode.EL5;
      expect(testNapi.getCloudFileDir()).assertEqual(applicationContext.cloudFileDir);
      expect(testNapi.getCloudFileDir()).assertEqual("/data/storage/el2/cloud");
      hilog.info(0x0000, 'testTag', tag + ' cloudFileDir AreaMode=EL5 %{public}s ', testNapi.getCloudFileDir());

      applicationContext.area = 100;
      expect(testNapi.getCloudFileDir()).assertEqual(applicationContext.cloudFileDir);
      expect(testNapi.getCloudFileDir()).assertEqual("/data/storage/el2/cloud");
      hilog.info(0x0000, 'testTag', tag + ' cloudFileDir AreaMode=100 %{public}s ', testNapi.getCloudFileDir());

      applicationContext.area = -4;
      expect(testNapi.getCloudFileDir()).assertEqual(applicationContext.cloudFileDir);
      expect(testNapi.getCloudFileDir()).assertEqual("/data/storage/el2/cloud");
      hilog.info(0x0000, 'testTag', tag + ' cloudFileDir AreaMode=-4 %{public}s ', testNapi.getCloudFileDir());

      applicationContext.area = 0.5;
      expect(testNapi.getCloudFileDir()).assertEqual(applicationContext.cloudFileDir);
      expect(testNapi.getCloudFileDir()).assertEqual("/data/storage/el2/cloud");
      hilog.info(0x0000, 'testTag', tag + ' cloudFileDir AreaMode=-0.5 %{public}s ', testNapi.getCloudFileDir());

      // reset to default area
      applicationContext.area = contextConstant.AreaMode.EL2;
      hilog.info(0x0000, 'testTag', '%{public}s end', tag);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1200
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1200
     * @tc.desc   The Error Code is correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1200', Level.LEVEL0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);

      getCodeArray = testNapi.testGetCloudFileDir(applicationContext.cloudFileDir);
      let result = getCodeArray[0];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' buffer = NULL  Error code is  %{public}d ', result);

      result = getCodeArray[1];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' buffer = nullptr Error code is %{public}d ', result);

      result = getCodeArray[2];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' writeLength = NULL Error code is %{public}d ', result);

      result = getCodeArray[3];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' writeLength = nullptr Error code is %{public}d ', result);

      result = getCodeArray[4];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = -1  Error code is %{public}d ', result);

      result = getCodeArray[5];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = 0  Error code is %{public}d ', result);

      result = getCodeArray[6];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = realCacheDirLen Error code is %{public}d ', result);

      result = getCodeArray[7];
      expect(result).assertEqual(0);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = realCacheDirLen + 1  Error code is %{public}d ', result);

      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1300
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1300
     * @tc.desc   The sandbox path is correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1300', Level.LEVEL0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);

      applicationContext.area = contextConstant.AreaMode.EL2;
      expect(testNapi.getDatabaseDir()).assertEqual("/data/storage/el2/database");
      hilog.info(0x0000, 'testTag', tag + ' databaseDir default %{public}s ', testNapi.getDatabaseDir());

      applicationContext.area = contextConstant.AreaMode.EL1;
      expect(testNapi.getDatabaseDir()).assertEqual(applicationContext.databaseDir);
      expect(testNapi.getDatabaseDir()).assertEqual("/data/storage/el1/database");
      hilog.info(0x0000, 'testTag', tag + ' databaseDir AreaMode=EL1 %{public}s ', testNapi.getDatabaseDir());

      applicationContext.area = contextConstant.AreaMode.EL2;
      expect(testNapi.getDatabaseDir()).assertEqual(applicationContext.databaseDir);
      expect(testNapi.getDatabaseDir()).assertEqual("/data/storage/el2/database");
      hilog.info(0x0000, 'testTag', tag + ' databaseDir AreaMode=EL2 %{public}s ', testNapi.getDatabaseDir());

      applicationContext.area = contextConstant.AreaMode.EL3;
      expect(testNapi.getDatabaseDir()).assertEqual(applicationContext.databaseDir);
      expect(testNapi.getDatabaseDir()).assertEqual("/data/storage/el3/database");
      hilog.info(0x0000, 'testTag', tag + ' databaseDir AreaMode=EL3 %{public}s ', testNapi.getDatabaseDir());

      applicationContext.area = contextConstant.AreaMode.EL4;
      expect(testNapi.getDatabaseDir()).assertEqual(applicationContext.databaseDir);
      expect(testNapi.getDatabaseDir()).assertEqual("/data/storage/el4/database");
      hilog.info(0x0000, 'testTag', tag + ' databaseDir AreaMode=EL4 %{public}s ', testNapi.getDatabaseDir());

      applicationContext.area = contextConstant.AreaMode.EL5;
      expect(testNapi.getDatabaseDir()).assertEqual(applicationContext.databaseDir);
      expect(testNapi.getDatabaseDir()).assertEqual("/data/storage/el5/database");
      hilog.info(0x0000, 'testTag', tag + ' databaseDir AreaMode=EL5 %{public}s ', testNapi.getDatabaseDir());

      applicationContext.area = 100;
      expect(testNapi.getDatabaseDir()).assertEqual(applicationContext.databaseDir);
      expect(testNapi.getDatabaseDir()).assertEqual("/data/storage/el5/database");
      hilog.info(0x0000, 'testTag', tag + ' databaseDir AreaMode=100 %{public}s ', testNapi.getDatabaseDir());

      applicationContext.area = -4;
      expect(testNapi.getDatabaseDir()).assertEqual(applicationContext.databaseDir);
      expect(testNapi.getDatabaseDir()).assertEqual("/data/storage/el5/database");
      hilog.info(0x0000, 'testTag', tag + ' databaseDir AreaMode=-4 %{public}s ', testNapi.getDatabaseDir());

      applicationContext.area = 0.5;
      expect(testNapi.getDatabaseDir()).assertEqual(applicationContext.databaseDir);
      expect(testNapi.getDatabaseDir()).assertEqual("/data/storage/el1/database");
      hilog.info(0x0000, 'testTag', tag + ' databaseDir AreaMode=-0.5 %{public}s ', testNapi.getDatabaseDir());

      // reset to default area
      applicationContext.area = contextConstant.AreaMode.EL2;
      hilog.info(0x0000, 'testTag', '%{public}s end', tag);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1400
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1400
     * @tc.desc   The Error Code is correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1400', Level.LEVEL0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);

      getCodeArray = testNapi.testGetDatabaseDir(applicationContext.databaseDir);
      let result = getCodeArray[0];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' buffer = NULL  Error code is  %{public}d ', result);

      result = getCodeArray[1];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' buffer = nullptr Error code is %{public}d ', result);

      result = getCodeArray[2];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' writeLength = NULL Error code is %{public}d ', result);

      result = getCodeArray[3];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' writeLength = nullptr Error code is %{public}d ', result);

      result = getCodeArray[4];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = -1  Error code is %{public}d ', result);

      result = getCodeArray[5];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = 0  Error code is %{public}d ', result);

      result = getCodeArray[6];
      expect(result).assertEqual(401);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = realCacheDirLen Error code is %{public}d ', result);

      result = getCodeArray[7];
      expect(result).assertEqual(0);
      hilog.info(0x0000, 'testTag', tag + ' BUF_SIZE = realCacheDirLen + 1  Error code is %{public}d ', result);

      done();
    })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1500
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1500
     * @tc.desc   Pref test 2000 times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1500', Level.LEVEL0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1500';
      hilog.info(0x0000, 'testTag', tag + '%{public}s begin', tag);

      for (let i = 0; i < 2000; i++) {
        hilog.info(0x0000, 'testTag', tag + ' test pref ' + i);
        hilog.info(0x0000, 'testTag', tag + ' tempDir default %{public}s ', testNapi.getTempDir());
        hilog.info(0x0000, 'testTag', tag + ' filesDir default %{public}s ', testNapi.getFilesDir());
        hilog.info(0x0000, 'testTag', tag + ' preferencesDir default %{public}s ', testNapi.getPreferencesDir());
        hilog.info(0x0000, 'testTag', tag + ' bundleCodeDir default %{public}s ', testNapi.getBundleCodeDir());
        hilog.info(0x0000, 'testTag', tag + ' distributedFilesDir default %{public}s ', testNapi.getDistributedFilesDir());
        hilog.info(0x0000, 'testTag', tag + ' cloudFileDir default %{public}s ', testNapi.getCloudFileDir());
        hilog.info(0x0000, 'testTag', tag + ' databaseDir default %{public}s ', testNapi.getDatabaseDir());
        hilog.info(0x0000, 'testTag', tag + ' databaseDir default %{public}s ', testNapi.getDatabaseDir());
      }

      hilog.info(0x0000, 'testTag', tag + '%{public}s end', tag);
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1600
     * @tc.number SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1600
     * @tc.desc   FileIO test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1600', Level.LEVEL0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_ApplicationContextGetNdkDir_1600';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);

      let cacheDirTest = fileIo.openSync(applicationContext.cacheDir + '/cacheDir.txt', fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
      fileIo.closeSync(cacheDirTest);
      expect(fileIo.accessSync(testNapi.getCacheDir() + '/cacheDir.txt')).assertEqual(true);

      let tempDirTest = fileIo.openSync(applicationContext.tempDir + '/tempDir.txt', fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
      fileIo.closeSync(tempDirTest);
      expect(fileIo.accessSync(testNapi.getTempDir()+ '/tempDir.txt')).assertEqual(true);

      let filesDirTest = fileIo.openSync(applicationContext.filesDir + '/filesDir.txt', fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
      fileIo.closeSync(filesDirTest);
      expect(fileIo.accessSync(testNapi.getFilesDir()+ '/filesDir.txt')).assertEqual(true);

      let preferencesDir = fileIo.openSync(applicationContext.preferencesDir + '/preferencesDir.txt', fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
      fileIo.closeSync(preferencesDir);
      expect(fileIo.accessSync(testNapi.getPreferencesDir()+ '/preferencesDir.txt')).assertEqual(true);

      let distributedFilesDir = fileIo.openSync(applicationContext.distributedFilesDir + '/distributedFilesDir.txt', fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
      fileIo.closeSync(distributedFilesDir);
      expect(fileIo.accessSync(testNapi.getDistributedFilesDir()+ '/distributedFilesDir.txt')).assertEqual(true);

      let databaseDir = fileIo.openSync(applicationContext.databaseDir + '/databaseDir.txt', fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
      fileIo.closeSync(databaseDir);
      expect(fileIo.accessSync(testNapi.getDatabaseDir()+ '/databaseDir.txt')).assertEqual(true);

      done();
    })
  })
}