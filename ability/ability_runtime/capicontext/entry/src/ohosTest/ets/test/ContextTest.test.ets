/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import testNapi from 'libentry.so';

let ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID: number = 401;

export default function applicationContextTest() {

  describe('ActsCapiContextTest', () => {
    beforeAll(async () => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetCacheDir_NullContext_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetCacheDir_NullContext_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetCacheDir_NullContext_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetCacheDir_NullContext_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetCacheDir_NullContext_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetCacheDir_NullContext();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetCacheDir_NullBuffer_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetCacheDir_NullBuffer_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetCacheDir_NullBuffer_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetCacheDir_NullBuffer_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetCacheDir_NullBuffer_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetCacheDir_NullBuffer();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetCacheDir_NullWriteLength_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetCacheDir_NullWriteLength_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetCacheDir_NullWriteLength_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetCacheDir_NullWriteLength_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetCacheDir_NullWriteLength_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetCacheDir_NullWriteLength();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetTempDir_NullContext_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetTempDir_NullContext_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetTempDir_NullContext_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetTempDir_NullContext_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetTempDir_NullContext_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetTempDir_NullContext();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetTempDir_NullBuffer_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetTempDir_NullBuffer_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetTempDir_NullBuffer_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetTempDir_NullBuffer_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetTempDir_NullBuffer_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetTempDir_NullBuffer();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetTempDir_NullWriteLength_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetTempDir_NullWriteLength_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetTempDir_NullWriteLength_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetTempDir_NullWriteLength_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetTempDir_NullWriteLength_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetTempDir_NullWriteLength();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetFilesDir_NullContext_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetFilesDir_NullContext_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetFilesDir_NullContext_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetFilesDir_NullContext_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetFilesDir_NullContext_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetFilesDir_NullContext();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetFilesDir_NullBuffer_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetFilesDir_NullBuffer_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetFilesDir_NullBuffer_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetFilesDir_NullBuffer_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetFilesDir_NullBuffer_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetFilesDir_NullBuffer();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetFilesDir_NullWriteLength_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetFilesDir_NullWriteLength_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetFilesDir_NullWriteLength_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetFilesDir_NullWriteLength_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetFilesDir_NullWriteLength_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetFilesDir_NullWriteLength();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetDatabaseDir_NullContext_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetDatabaseDir_NullContext_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetDatabaseDir_NullContext_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetDatabaseDir_NullContext_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetDatabaseDir_NullContext_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetDatabaseDir_NullContext();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetDatabaseDir_NullBuffer_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetDatabaseDir_NullBuffer_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetDatabaseDir_NullBuffer_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetDatabaseDir_NullBuffer_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetDatabaseDir_NullBuffer_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetDatabaseDir_NullBuffer();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetDatabaseDir_NullWriteLength_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetDatabaseDir_NullWriteLength_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetDatabaseDir_NullWriteLength_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetDatabaseDir_NullWriteLength_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetDatabaseDir_NullWriteLength_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetDatabaseDir_NullWriteLength();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetPreferencesDir_NullContext_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetPreferencesDir_NullContext_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetPreferencesDir_NullContext_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetPreferencesDir_NullContext_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetPreferencesDir_NullContext_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetPreferencesDir_NullContext();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetPreferencesDir_NullBuffer_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetPreferencesDir_NullBuffer_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetPreferencesDir_NullBuffer_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetPreferencesDir_NullBuffer_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetPreferencesDir_NullBuffer_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetPreferencesDir_NullBuffer();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetPreferencesDir_NullWriteLength_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetPreferencesDir_NullWriteLength_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetPreferencesDir_NullWriteLength_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetPreferencesDir_NullWriteLength_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetPreferencesDir_NullWriteLength_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetPreferencesDir_NullWriteLength();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetBundleCodeDir_NullContext_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetBundleCodeDir_NullContext_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetBundleCodeDir_NullContext_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetBundleCodeDir_NullContext_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetBundleCodeDir_NullContext_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetBundleCodeDir_NullContext();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetBundleCodeDir_NullBuffer_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetBundleCodeDir_NullBuffer_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetBundleCodeDir_NullBuffer_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetBundleCodeDir_NullBuffer_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetBundleCodeDir_NullBuffer_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetBundleCodeDir_NullBuffer();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetBundleCodeDir_NullWriteLength_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetBundleCodeDir_NullWriteLength_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetBundleCodeDir_NullWriteLength_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetBundleCodeDir_NullWriteLength_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetBundleCodeDir_NullWriteLength_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetBundleCodeDir_NullWriteLength();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetDistributedFilesDir_NullContext_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetDistributedFilesDir_NullContext_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetDistributedFilesDir_NullContext_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetDistributedFilesDir_NullContext_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetDistributedFilesDir_NullContext_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetDistributedFilesDir_NullContext();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetDistributedFilesDir_NullBuffer_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetDistributedFilesDir_NullBuffer_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetDistributedFilesDir_NullBuffer_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetDistributedFilesDir_NullBuffer_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetDistributedFilesDir_NullBuffer_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetDistributedFilesDir_NullBuffer();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetDistributedFilesDir_NullWriteLength_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetDistributedFilesDir_NullWriteLength_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetDistributedFilesDir_NullWriteLength_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetDistributedFilesDir_NullWriteLength_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetDistributedFilesDir_NullWriteLength_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetDistributedFilesDir_NullWriteLength();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetResourceDir_NullContext_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetResourceDir_NullContext_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetResourceDir_NullContext_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetResourceDir_NullContext_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetResourceDir_NullContext_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetResourceDir_NullContext();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetResourceDir_NullBuffer_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetResourceDir_NullBuffer_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetResourceDir_NullBuffer_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetResourceDir_NullBuffer_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetResourceDir_NullBuffer_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetResourceDir_NullBuffer();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetResourceDir_NullWriteLength_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetResourceDir_NullWriteLength_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetResourceDir_NullWriteLength_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetResourceDir_NullWriteLength_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetResourceDir_NullWriteLength_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetResourceDir_NullWriteLength();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetCloudFileDir_NullContext_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetCloudFileDir_NullContext_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetCloudFileDir_NullContext_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetCloudFileDir_NullContext_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetCloudFileDir_NullContext_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetCloudFileDir_NullContext();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetCloudFileDir_NullBuffer_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetCloudFileDir_NullBuffer_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetCloudFileDir_NullBuffer_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetCloudFileDir_NullBuffer_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetCloudFileDir_NullBuffer_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetCloudFileDir_NullBuffer();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetCloudFileDir_NullWriteLength_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetCloudFileDir_NullWriteLength_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetCloudFileDir_NullWriteLength_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetCloudFileDir_NullWriteLength_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetCloudFileDir_NullWriteLength_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetCloudFileDir_NullWriteLength();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetLogFileDir_NullContext_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetLogFileDir_NullContext_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetLogFileDir_NullContext_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetLogFileDir_NullContext_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetLogFileDir_NullContext_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetLogFileDir_NullContext();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetLogFileDir_NullBuffer_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetLogFileDir_NullBuffer_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetLogFileDir_NullBuffer_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetLogFileDir_NullBuffer_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetLogFileDir_NullBuffer_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetLogFileDir_NullBuffer();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetLogFileDir_NullWriteLength_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetLogFileDir_NullWriteLength_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetLogFileDir_NullWriteLength_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetLogFileDir_NullWriteLength_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetLogFileDir_NullWriteLength_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetLogFileDir_NullWriteLength();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetProcessName_NullContext_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetProcessName_NullContext_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetProcessName_NullContext_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetProcessName_NullContext_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetProcessName_NullContext_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetProcessName_NullContext();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetProcessName_NullBuffer_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetProcessName_NullBuffer_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetProcessName_NullBuffer_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetProcessName_NullBuffer_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetProcessName_NullBuffer_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetProcessName_NullBuffer();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetProcessName_NullWriteLength_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetProcessName_NullWriteLength_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetProcessName_NullWriteLength_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetProcessName_NullWriteLength_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetProcessName_NullWriteLength_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetProcessName_NullWriteLength();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetAreaMode_NullContext_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetAreaMode_NullContext_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetAreaMode_NullContext_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetAreaMode_NullContext_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetAreaMode_NullContext_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetAreaMode_NullContext();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextGetAreaMode_NullAreaMode_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextGetAreaMode_NullAreaMode_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextGetAreaMode_NullAreaMode_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextGetAreaMode_NullAreaMode_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextGetAreaMode_NullAreaMode_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextGetAreaMode_NullAreaMode();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextSetAreaMode_NullContext_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextSetAreaMode_NullContext_0100
     * @tc.desc   SUB_Ability_AbilityRuntime_ContextSetAreaMode_NullContext_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextSetAreaMode_NullContext_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Ability_AbilityRuntime_ContextSetAreaMode_NullContext_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.testContextSetAreaMode_NullContext();
      expect(result).assertEqual(ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID);
    })
  })
}
