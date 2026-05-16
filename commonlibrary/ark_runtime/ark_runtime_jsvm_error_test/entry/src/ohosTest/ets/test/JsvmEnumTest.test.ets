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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from "@ohos/hypium"

import napitest from 'libentry.so'

function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve()
    }, time)
  }).then(() => {
    console.info( `sleep ${time} over...`)
  })
}

export default function JsvmEnumTest() {

  describe('JsvmEnumTest',() => {
    const empty = 'hh';
    let value: string;

    /**
     * run after testcase
     */
    afterEach(async (done:Function) => {
      console.info('[JsvmTest] after each called')
      value == '';
      await sleep(50);
      done();
    });

    /**
     * @tc.name   JsvmWritableTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmWritable_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmWritableTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmWritableCode();
      console.info('JsvmWritableTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmConfigurableTest0001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmConfigurable_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmConfigurableTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmConfigurableCode();
      console.info('JsvmConfigurableTest0001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmNoReceiverCheckTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmNoReceiverCheck_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmNoReceiverCheckTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmNoReceiverCheckCode();
      console.info('JsvmNoReceiverCheckTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmStaticTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmStatic_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmStaticTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmStaticCode();
      console.info('JsvmStaticTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmDefaultMethodTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmDefaultMethod_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmDefaultMethodTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmDefaultMethodCode();
      console.info('JsvmDefaultMethodTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmMethodNoReceiverCheckTest0001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmMethodNoReceiverCheck_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmMethodNoReceiverCheckTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmMethodNoReceiverCheckCode();
      console.info('JsvmMethodNoReceiverCheckTest0001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmDefaultJspropertyTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmDefaultJsproperty_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmDefaultJspropertyTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmDefaultJspropertyCode();
      console.info('JsvmDefaultJspropertyTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmJspropertyNoReceiverlCheckTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmJspropertyNoReceiverlCheck_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmJspropertyNoReceiverlCheckTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmJspropertyNoReceiverlCheckCode();
      console.info('JsvmJspropertyNoReceiverlCheckTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmKeyAllPropertiesTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmKeyAllProperties_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmKeyAllPropertiesTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmKeyAllPropertiesCode();
      console.info('JsvmKeyAllPropertiesTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmKeySkipStringsTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmKeySkipStrings_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmKeySkipStringsTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmKeySkipStringsCode();
      console.info('JsvmKeySkipStringsTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmCompileModeDefaultTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmCompileModeDefault_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmCompileModeDefaultTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmCompileModeDefaultCode();
      console.info('JsvmCompileModeDefaultTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmCompileModeConsumeCodeTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmCompileModeConsumeCode_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmCompileModeConsumeCodeTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmCompileModeConsumeCodeCode();
      console.info('JsvmCompileModeConsumeCodeTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(1);
    });

    /**
     * @tc.name   JsvmCompileModeProduceCompileProfileTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmCompileModeProduceCompileProfile_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmCompileModeProduceCompileProfileTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmCompileModeProduceCompileProfileCode();
      console.info('JsvmCompileModeProduceCompileProfileTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmCompileModeConsumeCompileProfileTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmCompileModeConsumeCompileProfile_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmCompileModeConsumeCompileProfileTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmCompileModeConsumeCompileProfileCode();
      console.info('JsvmCompileModeConsumeCompileProfileTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmCompileCodeCacheTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmCompileCodeCache_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmCompileCodeCacheTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmCompileCodeCacheCode();
      console.info('JsvmCompileCodeCacheTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmCompileCompileProfileTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmCompileCompileProfile_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmCompileCompileProfileTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmCompileCompileProfileCode();
      console.info('JsvmCompileCompileProfileTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmCompileEnableSourceMapTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmCompileEnableSourceMap_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmCompileEnableSourceMapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmCompileEnableSourceMapCode();
      console.info('JsvmCompileEnableSourceMapTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmHeapStatisticsTotalHeapSizeTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmHeapStatisticsTotalHeapSize_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmHeapStatisticsTotalHeapSizeTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmHeapStatisticsTotalHeapSizeCode();
      console.info('JsvmHeapStatisticsTotalHeapSizeTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmHeapStatisticsTotalHeapSizeExecutableTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmHeapStatisticsTotalHeapSizeExecutable_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmHeapStatisticsTotalHeapSizeExecutableTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmHeapStatisticsTotalHeapSizeExecutableCode();
      console.info('JsvmHeapStatisticsTotalHeapSizeExecutableTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmHeapStatisticsTotalPhysicalSizeTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmHeapStatisticsTotalPhysicalSize_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmHeapStatisticsTotalPhysicalSizeTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmHeapStatisticsTotalPhysicalSizeCode();
      console.info('JsvmHeapStatisticsTotalPhysicalSizeTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmHeapStatisticsTotalAvailableSizeTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmHeapStatisticsTotalAvailableSize_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmHeapStatisticsTotalAvailableSizeTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmHeapStatisticsTotalAvailableSizeCode();
      console.info('JsvmHeapStatisticsTotalAvailableSizeTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmHeapStatisticsUsedHeapSizeTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmHeapStatisticsUsedHeapSize_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmHeapStatisticsUsedHeapSizeTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmHeapStatisticsUsedHeapSizeCode();
      console.info('JsvmHeapStatisticsUsedHeapSizeTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmHeapStatisticsHeapSizeLimitTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmHeapStatisticsHeapSizeLimit_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmHeapStatisticsHeapSizeLimitTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmHeapStatisticsHeapSizeLimitCode();
      console.info('JsvmHeapStatisticsHeapSizeLimitTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmHeapStatisticsMallocedMemoryTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmHeapStatisticsMallocedMemory_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmHeapStatisticsMallocedMemoryTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmHeapStatisticsMallocedMemoryCode();
      console.info('JsvmHeapStatisticsMallocedMemoryTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmHeapStatisticsExternalMemoryTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmHeapStatisticsExternalMemory_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmHeapStatisticsExternalMemoryTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmHeapStatisticsExternalMemoryCode();
      console.info('JsvmHeapStatisticsExternalMemoryTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmHeapStatisticsPeakMallocedMemoryTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmHeapStatisticsPeakMallocedMemory_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmHeapStatisticsPeakMallocedMemoryTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmHeapStatisticsPeakMallocedMemoryCode();
      console.info('JsvmHeapStatisticsPeakMallocedMemoryTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmHeapStatisticsNumberOfDetachedContextTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmHeapStatisticsNumberOfDetachedContext_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmHeapStatisticsNumberOfDetachedContextTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmHeapStatisticsNumberOfDetachedContextCode();
      console.info('JsvmHeapStatisticsNumberOfDetachedContextTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmHeapStatisticsTotalGlobalHandlesSizeTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmHeapStatisticsTotalGlobalHandlesSize_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmHeapStatisticsTotalGlobalHandlesSizeTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmHeapStatisticsTotalGlobalHandlesSizeCode();
      console.info('JsvmHeapStatisticsTotalGlobalHandlesSizeTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmHeapStatisticsUsedGlobalHandlesSizeTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmHeapStatisticsUsedGlobalHandlesSize_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmHeapStatisticsUsedGlobalHandlesSizeTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmHeapStatisticsUsedGlobalHandlesSizeCode();
      console.info('JsvmHeapStatisticsUsedGlobalHandlesSizeTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmInitOptionsArgcTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmInitOptionsArgc_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmInitOptionsArgcTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      setTimeout(()=>{
      sleep(1000);
      let rst: number = napitest.JsvmInitOptionsArgcCode();
      console.info('JsvmInitOptionsArgcTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
      },2000)

    });

    /**
     * @tc.name   JsvmInitOptionsArgvTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmInitOptionsArgv_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmInitOptionsArgvTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      setTimeout(()=>{
      sleep(1000);
      let rst: number = napitest.JsvmInitOptionsArgvCode();
      console.info('JsvmInitOptionsArgvTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
      },2000)
    });

    /**
     * @tc.name   JsvmInitOptionsRemoveFlagsTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmInitOptionsRemoveFlags_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmInitOptionsRemoveFlagsTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      setTimeout(()=>{
      sleep(1000);
      let rst: number = napitest.JsvmInitOptionsRemoveFlagsCode();
      console.info('JsvmInitOptionsRemoveFlagsTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
      },2000)
    });

    /**
     * @tc.name   JsvmCreateVmOptionsMaxOldGenerationSizeTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmCreateVmOptionsMaxOldGenerationSize_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmCreateVmOptionsMaxOldGenerationSizeTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmCreateVmOptionsMaxOldGenerationSizeCode();
      console.info('JsvmCreateVmOptionsMaxOldGenerationSizeTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmCreateVmOptionsMaxYoungGenerationSizeTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmCreateVmOptionsMaxYoungGenerationSize_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmCreateVmOptionsMaxYoungGenerationSizeTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmCreateVmOptionsMaxYoungGenerationSizeCode();
      console.info('JsvmCreateVmOptionsMaxYoungGenerationSizeTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmCreateVmOptionsInitialOldGenerationSizeTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmCreateVmOptionsInitialOldGenerationSize_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmCreateVmOptionsInitialOldGenerationSizeTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmCreateVmOptionsInitialOldGenerationSizeCode();
      console.info('JsvmCreateVmOptionsInitialOldGenerationSizeTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmCreateVmOptionsInitialYoungGenerationSizeTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmCreateVmOptionsInitialYoungGenerationSize_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmCreateVmOptionsInitialYoungGenerationSizeTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        let rst: number = napitest.JsvmCreateVmOptionsInitialYoungGenerationSizeCode();
        console.info('JsvmCreateVmOptionsInitialYoungGenerationSizeTest001 testString result is:' +
        JSON.stringify(rst));
        expect(rst).assertEqual(0);
      });

    /**
     * @tc.name   JsvmCreateVmOptionsSnapshotBlobDataTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmCreateVmOptionsSnapshotBlobData_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmCreateVmOptionsSnapshotBlobDataTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmCreateVmOptionsSnapshotBlobDataCode();
      console.info('JsvmCreateVmOptionsSnapshotBlobDataTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmCreateVmOptionsSnapshotBlobSizeTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmCreateVmOptionsSnapshotBlobSize_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmCreateVmOptionsSnapshotBlobSizeTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmCreateVmOptionsSnapshotBlobSizeCode();
      console.info('JsvmCreateVmOptionsSnapshotBlobSizeTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmVmInfoEngineTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmVmInfoEngine_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmVmInfoEngineTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmVmInfoEngineCode();
      console.info('JsvmVmInfoEngineTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmVmInfoVersionTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmVmInfoVersion_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmVmInfoVersionTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmVmInfoVersionCode();
      console.info('JsvmVmInfoVersionTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmVmInfoCachedDataVersionTagTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmVmInfoCachedDataVersionTag_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmVmInfoCachedDataVersionTagTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmVmInfoCachedDataVersionTagCode();
      console.info('JsvmVmInfoCachedDataVersionTagTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmExtendedErrorInfoEngineReservedTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmExtendedErrorInfoEngineReserved_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmExtendedErrorInfoEngineReservedTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmExtendedErrorInfoEngineReservedCode();
      console.info('JsvmExtendedErrorInfoEngineReservedTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmExtendedErrorInfoEngineErrorTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmExtendedErrorInfoEngineError_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmExtendedErrorInfoEngineErrorTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmExtendedErrorInfoEngineErrorCode();
      console.info('JsvmExtendedErrorInfoEngineErrorTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmRegexpNoneTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmRegexpNone_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmRegexpNoneTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmRegexpNoneCode();
      console.info('JsvmRegexpNoneTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmDefineClassOptionsTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmDefineClassOptions_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmDefineClassOptionsTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmDefineClassOptionsCode();
      console.info('JsvmDefineClassOptionsTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmDefineClassNormalTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmDefineClassNormal_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmDefineClassNormalTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmDefineClassNormalCode();
      console.info('JsvmDefineClassNormalTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmGcTypeMinorMarkCompactTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmGcTypeMinorMarkCompact_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmGcTypeMinorMarkCompactTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmGcTypeMinorMarkCompactCode();
      console.info('JsvmGcTypeMinorMarkCompactTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmGcTypeMarkSweepCompactTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmGcTypeMarkSweepCompact_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmGcTypeMarkSweepCompactTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmGcTypeMarkSweepCompactCode();
      console.info('JsvmGcTypeMarkSweepCompactTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmGcTypeIncrementalMarkingTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmGcTypeIncrementalMarking_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmGcTypeIncrementalMarkingTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmGcTypeIncrementalMarkingCode();
      console.info('JsvmGcTypeIncrementalMarkingTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmGcTypeProcessWeakCallbacksTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmGcTypeProcessWeakCallbacks_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmGcTypeProcessWeakCallbacksTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmGcTypeProcessWeakCallbacksCode();
      console.info('JsvmGcTypeProcessWeakCallbacksTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmNapiQosBackgroundTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmNapiQosBackground_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmNapiQosBackgroundTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmNapiQosBackgroundCode(1000, (input:number) => {
        console.info('Worker: asyncWorkWithQos ' + (input * 2));
        return input * 2;
      });
      console.info('JsvmNapiQosBackgroundTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmNapiQosUtilityTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmNapiQosUtility_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmNapiQosUtilityTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmNapiQosUtilityCode(1000, (input:number) => {
        console.info('Worker: asyncWorkWithQos ' + (input * 2));
        return input * 2;
      });
      console.info('JsvmNapiQosUtilityTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmNapiQosUserInitiaredTest001
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_JsvmNapiQosUserInitiared_0001
     * @tc.desc   CreateVM,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmNapiQosUserInitiaredTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.JsvmNapiQosUserInitiaredCode(1000, (input:number) => {
        console.info('Worker: asyncWorkWithQos ' + (input * 2));
        return input * 2;
      });
      console.info('JsvmNapiQosUserInitiaredTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });
  });
}
