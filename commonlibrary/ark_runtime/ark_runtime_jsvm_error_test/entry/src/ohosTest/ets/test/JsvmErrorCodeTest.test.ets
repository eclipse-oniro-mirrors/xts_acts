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

export default function JsvmJsunit() {

  describe('JsvmTest',() => {
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
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0001
     * @tc.name      JsvmErrorCodeTest001
     * @tc.desc      CreateVM,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateVMJSOK();
      console.info('JsvmErrorCodeTest001 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0002
     * @tc.name      JsvmErrorCodeTest002
     * @tc.desc      OpenVMScope,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testOpenVMScopeJSOK();
      console.info('JsvmErrorCodeTest002 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0003
     * @tc.name      JsvmErrorCodeTest003
     * @tc.desc      CloseVMScope,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCloseVMScopeJSOK();
      console.info('JsvmErrorCodeTest003 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0004
     * @tc.name      JsvmErrorCodeTest004
     * @tc.desc      CreateProxy,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateProxyJSOK();
      console.info('JsvmErrorCodeTest004 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });
    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0005
     * @tc.name      JsvmErrorCodeTest005
     * @tc.desc      CreateProxy if the any of the input arguments is NULL,return JSVM_INVALID_ARG
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateProxyInvalid();
      console.info('JsvmErrorCodeTest005 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0006
     * @tc.name      JsvmErrorCodeTest006
     * @tc.desc      CreateProxy if target or handler is not Javascript Object,return JSVM_OBJECT_EXPECTED
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateProxyObejct();
      console.info('JsvmErrorCodeTest006 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0007
     * @tc.name      JsvmErrorCodeTest007
     * @tc.desc      CreateProxy if an exception occurs,return JSVM_PENDING_EXCEPTION
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let rst:number = napitest.testCreateProxyPending();
        console.info('JsvmErrorCodeTest007 testString result is:' + JSON.stringify(rst));
        expect(rst).assertEqual(0);
      }catch (e){
        expect(false).assertEqual(true);
        console.info('JsvmErrorCodeTest007 testString result is:' + JSON.stringify(e));
      }
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0008
     * @tc.name      JsvmErrorCodeTest008
     * @tc.desc      CreateEnv,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateEnvJSOK();
      console.info('JsvmErrorCodeTest008 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);


    });
    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0009
     * @tc.name      JsvmErrorCodeTest009
     * @tc.desc      CreateEnvFromSnapshot,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateEnvFromSnapshotJSOK();
      console.info('JsvmErrorCodeTest009 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);

    });
    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0010
     * @tc.name      JsvmErrorCodeTest010
     * @tc.desc      DestroyEnv,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testDestroyEnvJSOK();
      console.info('JsvmErrorCodeTest010 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);

    });
    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0011
     * @tc.name      JsvmErrorCodeTest011
     * @tc.desc      OpenEnvScope,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testOpenEnvScopeJSOK();
      console.info('JsvmErrorCodeTest011 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0012
     * @tc.name      JsvmErrorCodeTest012
     * @tc.desc      CloseEnvScope,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCloseEnvScopeJSOK();
      console.info('JsvmErrorCodeTest012 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0013
     * @tc.name      JsvmErrorCodeTest013
     * @tc.desc      GetVM,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetVMJSOK();
      console.info('JsvmErrorCodeTest013 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0014
     * @tc.name      JsvmErrorCodeTest014
     * @tc.desc      IsProxy,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsProxyJSOK();
      console.info('JsvmErrorCodeTest014 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0015
     * @tc.name      JsvmErrorCodeTest015
     * @tc.desc      IsProxy,return JSVM_INVALID_ARG
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsProxyInvalid();
      console.info('JsvmErrorCodeTest015 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0016
     * @tc.name      JsvmErrorCodeTest016
     * @tc.desc      ProxyGetTarget,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testProxyGetTargetJSOK();
      console.info('JsvmErrorCodeTest016 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0017
     * @tc.name      JsvmErrorCodeTest017
     * @tc.desc      ProxyGetTarget,return JSVM_INVALID_ARG
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testProxyGetTargetInvalid();
      console.info('JsvmErrorCodeTest017 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0018
     * @tc.name      JsvmErrorCodeTest018
     * @tc.desc      ProxyGetTarget,return JSVM_INVALID_TYPE
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testProxyGetTargetInvalidType();
      console.info('JsvmErrorCodeTest018 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0019
     * @tc.name      JsvmErrorCodeTest019
     * @tc.desc      CompileScript,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCompileScriptJSOK();
      console.info('JsvmErrorCodeTest019 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0020
     * @tc.name      JsvmErrorCodeTest020
     * @tc.desc      CreateCodeCache,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateCodeCacheJSOK();
      console.info('JsvmErrorCodeTest020 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0021
     * @tc.name      JsvmErrorCodeTest021
     * @tc.desc      OH_JSVM_Throw,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let rst: number = napitest.testThrowJSOK();
        console.info('JsvmErrorCodeTest021 testString result is:' + JSON.stringify(rst));
        expect(rst).assertEqual(0);
      }catch (e) {
        expect(false).assertEqual(true);
      }
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0022
     * @tc.name      JsvmErrorCodeTest022
     * @tc.desc      OpenHandleScope,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testOpenHandleScopeJSOK();
      console.info('JsvmErrorCodeTest022 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0023
     * @tc.name      JsvmErrorCodeTest023
     * @tc.desc      OpenEscapableHandleScope,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testOpenEscapableHandleScopeJSOK();
      console.info('JsvmErrorCodeTest023 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0024
     * @tc.name      JsvmErrorCodeTest024
     * @tc.desc      CloseEscapableHandleScope,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCloseEscapableHandleScopeJSOK();
      console.info('JsvmErrorCodeTest024 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0025
     * @tc.name      JsvmErrorCodeTest025
     * @tc.desc      GetReferenceValue,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetReferenceValueJSOK();
      console.info('JsvmErrorCodeTest025 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0026
     * @tc.name      JsvmErrorCodeTest026
     * @tc.desc      CreateArray,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateArrayJSOK();
      console.info('JsvmErrorCodeTest026 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0027
     * @tc.name      JsvmErrorCodeTest027
     * @tc.desc      AllocateArrayBufferBackingStoreData,return JSVM_INVALID_ARG
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testAllocateArrayBufferBackingStoreDataInvalid();
      console.info('JsvmErrorCodeTest027 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0028
     * @tc.name      JsvmErrorCodeTest028
     * @tc.desc      AllocateArrayBufferBackingStoreData,return JSVM_GENERIC_FAILURE
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testAllocateArrayBufferBackingStoreDataGenericFailure();
      console.info('JsvmErrorCodeTest028 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0029
     * @tc.name      JsvmErrorCodeTest029
     * @tc.desc      FreeArrayBufferBackingStoreData,return JSVM_INVALID_ARG
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testFreeArrayBufferBackingStoreDataInvalid();
      console.info('JsvmErrorCodeTest029 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0030
     * @tc.name      JsvmErrorCodeTest030
     * @tc.desc      CreateArrayBufferFromBackingStoreData,return JSVM_INVALID_ARG
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateArrayBufferFromBackingStoreDataInvalid();
      console.info('JsvmErrorCodeTest030 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0031
     * @tc.name      JsvmErrorCodeTest031
     * @tc.desc      CreateDate,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateDateJSOK();
      console.info('JsvmErrorCodeTest031 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0032
     * @tc.name      JsvmErrorCodeTest032
     * @tc.desc      CreateExternal,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateExternalJSOK();
      console.info('JsvmErrorCodeTest032 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0033
     * @tc.name      JsvmErrorCodeTest033
     * @tc.desc      CreateSymbol,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateSymbolJSOK();
      console.info('JsvmErrorCodeTest033 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0034
     * @tc.name      JsvmErrorCodeTest034
     * @tc.desc      CreateBigintInt64,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateBigintInt64JSOK();
      console.info('JsvmErrorCodeTest034 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0035
     * @tc.name      JsvmErrorCodeTest035
     * @tc.desc      GetArrayLength,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetArrayLengthJSOK();
      console.info('JsvmErrorCodeTest035 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0036
     * @tc.name      JsvmErrorCodeTest036
     * @tc.desc      GetPrototype,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetPrototypeJSOK();
      console.info('JsvmErrorCodeTest036 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0037
     * @tc.name      JsvmErrorCodeTest037
     * @tc.desc      GetDateValue,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetDateValueJSOK();
      console.info('JsvmErrorCodeTest037 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0038
     * @tc.name      JsvmErrorCodeTest038
     * @tc.desc      GetDateValue,return JSVM_DATE_EXPECTED
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetDateValueExpected();
      console.info('JsvmErrorCodeTest038 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0039
     * @tc.name      JsvmErrorCodeTest039
     * @tc.desc      GetGetValueBool,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetValueBoolJSOK();
      console.info('JsvmErrorCodeTest039 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0040
     * @tc.name      JsvmErrorCodeTest040
     * @tc.desc      GetValueDouble,return JSVM_NUMBER_EXPECTED
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetValueDoubleExpected();
      console.info('JsvmErrorCodeTest040 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0041
     * @tc.name      JsvmErrorCodeTest041
     * @tc.desc      GetValueBigintInt64,return JSVM_BIGINT_EXPECTED
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetValueBigintInt64Expected();
      console.info('JsvmErrorCodeTest041 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0042
     * @tc.name      JsvmErrorCodeTest042
     * @tc.desc      GetValueBigintUint64,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetValueBigintUint64JSOK();
      console.info('JsvmErrorCodeTest042 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0043
     * @tc.name      JsvmErrorCodeTest043
     * @tc.desc      GetValueBigintUint64,return JSVM_BIGINT_EXPECTED
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetValueBigintUint64Expected();
      console.info('JsvmErrorCodeTest043 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0044
     * @tc.name      JsvmErrorCodeTest044
     * @tc.desc      GetValueExternal,return JSVM_INVALID_ARG
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetValueExternalInvalid();
      console.info('JsvmErrorCodeTest044 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0045
     * @tc.name      JsvmErrorCodeTest045
     * @tc.desc      GetValueInt32,return JSVM_NUMBER_EXPECTED
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetValueInt32Expected();
      console.info('JsvmErrorCodeTest045 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0046
     * @tc.name      JsvmErrorCodeTest046
     * @tc.desc      GetValueInt64,return JSVM_NUMBER_EXPECTED
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetValueInt64Expected();
      console.info('JsvmErrorCodeTest046 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0047
     * @tc.name      JsvmErrorCodeTest047
     * @tc.desc      GetValueStringLatin1,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetValueStringLatin1JSOK();
      console.info('JsvmErrorCodeTest047 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0048
     * @tc.name      JsvmErrorCodeTest048
     * @tc.desc      GetValueStringLatin1,return JSVM_STRING_EXPECTED
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetValueStringLatin1Expected();
      console.info('JsvmErrorCodeTest048 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0049
     * @tc.name      JsvmErrorCodeTest049
     * @tc.desc      GetValueStringUtf8,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetValueStringUtf8JSOK();
      console.info('JsvmErrorCodeTest049 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0050
     * @tc.name      JsvmErrorCodeTest050
     * @tc.desc      GetValueStringUtf8,return JSVM_STRING_EXPECTED
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetValueStringUtf8Expected();
      console.info('JsvmErrorCodeTest050 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0051
     * @tc.name      JsvmErrorCodeTest051
     * @tc.desc      GetValueStringUtf16,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetValueStringUtf16JSOK();
      console.info('JsvmErrorCodeTest051 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0052
     * @tc.name      JsvmErrorCodeTest052
     * @tc.desc      GetValueStringUtf16,return JSVM_STRING_EXPECTED
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetValueStringUtf16Expected();
      console.info('JsvmErrorCodeTest052 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0053
     * @tc.name      JsvmErrorCodeTest053
     * @tc.desc      GetValueUint32,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetValueUint32JSOK();
      console.info('JsvmErrorCodeTest053 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0054
     * @tc.name      JsvmErrorCodeTest054
     * @tc.desc      GetValueUint32,return JSVM_NUMBER_EXPECTED
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetValueUint32Expected();
      console.info('JsvmErrorCodeTest054 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0055
     * @tc.name      JsvmErrorCodeTest055
     * @tc.desc      GetBoolean,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetBooleanJSOK();
      console.info('JsvmErrorCodeTest055 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0056
     * @tc.name      JsvmErrorCodeTest056
     * @tc.desc      GetNull,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetNullJSOK();
      console.info('JsvmErrorCodeTest056 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0057
     * @tc.name      JsvmErrorCodeTest057
     * @tc.desc      GetUndefined,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetUndefinedJSOK();
      console.info('JsvmErrorCodeTest057 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0058
     * @tc.name      JsvmErrorCodeTest058
     * @tc.desc      CoerceToBool,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCoerceToBoolJSOK();
      console.info('JsvmErrorCodeTest058 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0059
     * @tc.name      JsvmErrorCodeTest059
     * @tc.desc      CoerceToNumber,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCoerceToNumberJSOK();
      console.info('JsvmErrorCodeTest059 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0060
     * @tc.name      JsvmErrorCodeTest060
     * @tc.desc      CoerceToObject,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCoerceToObjectJSOK();
      console.info('JsvmErrorCodeTest060 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0061
     * @tc.name      JsvmErrorCodeTest061
     * @tc.desc      CoerceToString,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCoerceToStringJSOK();
      console.info('JsvmErrorCodeTest061 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0062
     * @tc.name      JsvmErrorCodeTest062
     * @tc.desc      Instanceof,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testInstanceofJSOK();
      console.info('JsvmErrorCodeTest062 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0063
     * @tc.name      JsvmErrorCodeTest063
     * @tc.desc      IsArray,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsArrayJSOK();
      console.info('JsvmErrorCodeTest063 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0064
     * @tc.name      JsvmErrorCodeTest064
     * @tc.desc      IsArraybuffer,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsArraybufferJSOK();
      console.info('JsvmErrorCodeTest064 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0065
     * @tc.name      JsvmErrorCodeTest065
     * @tc.desc      IsDataview,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsDataviewJSOK();
      console.info('JsvmErrorCodeTest065 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0066
     * @tc.name      JsvmErrorCodeTest066
     * @tc.desc      Equals,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testEqualsJSOK();
      console.info('JsvmErrorCodeTest066 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0068
     * @tc.name      JsvmErrorCodeTest068
     * @tc.desc      IsDetachedArraybuffer,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsDetachedArraybufferJSOK();
      console.info('JsvmErrorCodeTest068 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0069
     * @tc.name      JsvmErrorCodeTest069
     * @tc.desc      GetPropertyNames,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetPropertyNamesJSOK();
      console.info('JsvmErrorCodeTest069 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0070
     * @tc.name      JsvmErrorCodeTest070
     * @tc.desc      GetAllPropertyNames,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetAllPropertyNamesJSOK();
      console.info('JsvmErrorCodeTest070 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0071
     * @tc.name      JsvmErrorCodeTest071
     * @tc.desc      GetProperty,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetPropertyJSOK();
      console.info('JsvmErrorCodeTest071 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0072
     * @tc.name      JsvmErrorCodeTest072
     * @tc.desc      SetElement,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testSetElementJSOK();
      console.info('JsvmErrorCodeTest072 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0073
     * @tc.name      JsvmErrorCodeTest073
     * @tc.desc      HasElement,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testHasElementJSOK();
      console.info('JsvmErrorCodeTest073 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0074
     * @tc.name      JsvmErrorCodeTest074
     * @tc.desc      DeleteElement,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testDeleteElementJSOK();
      console.info('JsvmErrorCodeTest074 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0075
     * @tc.name      JsvmErrorCodeTest075
     * @tc.desc      ObjectFreeze,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testObjectFreezeJSOK();
      console.info('JsvmErrorCodeTest075 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0076
     * @tc.name      JsvmErrorCodeTest076
     * @tc.desc      ObjectSeal,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testObjectSealJSOK();
      console.info('JsvmErrorCodeTest076 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0077
     * @tc.name      JsvmErrorCodeTest077
     * @tc.desc      GetCbInfo,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetCbInfoJSOK()
   `;
      expect(napitest.runJsVm(script)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0078
     * @tc.name      JsvmErrorCodeTest078
     * @tc.desc      GetNewTarget,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetNewTargetJSOK()
   `;
      expect(napitest.runJsVm(script)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0079
     * @tc.name      JsvmErrorCodeTest079
     * @tc.desc      NewInstance,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testNewInstanceJSOK();
      console.info('JsvmErrorCodeTest079 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0080
     * @tc.name      JsvmErrorCodeTest080
     * @tc.desc      DefineClass,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testDefineClassJSOK();
      console.info('JsvmErrorCodeTest080 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0081
     * @tc.name      JsvmErrorCodeTest081
     * @tc.desc      RemoveWrap,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testRemoveWrapJSOK();
      console.info('JsvmErrorCodeTest081 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0082
     * @tc.name      JsvmErrorCodeTest082
     * @tc.desc      TypeTagObject,return JSVM_INVALID_ARG
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testTypeTagObjectInvalid();
      console.info('JsvmErrorCodeTest082 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });


    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0083
     * @tc.name      JsvmErrorCodeTest083
     * @tc.desc      AddFinalizer,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testAddFinalizerJSOK();
      console.info('JsvmErrorCodeTest083 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0084
     * @tc.name      JsvmErrorCodeTest084
     * @tc.desc      GetVersion,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetVersionJSOK();
      console.info('JsvmErrorCodeTest084 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0085
     * @tc.name      JsvmErrorCodeTest085
     * @tc.desc      GetVMInfo,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetVMInfoJSOK();
      console.info('JsvmErrorCodeTest085 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0086
     * @tc.name      JsvmErrorCodeTest086
     * @tc.desc      MemoryPressureNotification,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testMemoryPressureNotificationJSOK();
      console.info('JsvmErrorCodeTest086 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0087
     * @tc.name      JsvmErrorCodeTest087
     * @tc.desc      CreatePromise,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreatePromiseJSOK();
      console.info('JsvmErrorCodeTest087 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0088
     * @tc.name      JsvmErrorCodeTest088
     * @tc.desc      ResolveDeferre,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testResolveDeferreJSOK();
      console.info('JsvmErrorCodeTest088 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0089
     * @tc.name      JsvmErrorCodeTest089
     * @tc.desc      RejectDeferred,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testRejectDeferredJSOK();
      console.info('JsvmErrorCodeTest089 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0090
     * @tc.name      JsvmErrorCodeTest090
     * @tc.desc      PromiseRegisterHandler,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testPromiseRegisterHandlerJSOK();
      console.info('JsvmErrorCodeTest090 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0091
     * @tc.name      JsvmErrorCodeTest091
     * @tc.desc      PromiseRegisterHandler,return JSVM_INVALID_TYPE
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testPromiseRegisterHandlerInvalidtype();
      console.info('JsvmErrorCodeTest091 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0092
     * @tc.name      JsvmErrorCodeTest092
     * @tc.desc      PromiseRegisterHandler,return JSVM_PENDING_EXCEPTION
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testPromiseRegisterHandlerPending();
      console.info('JsvmErrorCodeTest092 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0093
     * @tc.name      JsvmErrorCodeTest093
     * @tc.desc      PromiseRegisterHandler,return JSVM_INVALID_ARG
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testPromiseRegisterHandlerInvalid();
      console.info('JsvmErrorCodeTest093 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0095
     * @tc.name      JsvmErrorCodeTest095
     * @tc.desc      CreateSnapshot,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateSnapshotJSOK();
      console.info('JsvmErrorCodeTest095 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0096
     * @tc.name      JsvmErrorCodeTest096
     * @tc.desc      GetHeapStatistics,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetHeapStatisticsJSOK();
      console.info('JsvmErrorCodeTest096 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0097
     * @tc.name      JsvmErrorCodeTest097
     * @tc.desc      StartCpuProfiler,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testStartCpuProfilerJSOK();
      console.info('JsvmErrorCodeTest097 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0098
     * @tc.name      JsvmErrorCodeTest098
     * @tc.desc      StopCpuProfiler,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testStopCpuProfilerJSOK();
      console.info('JsvmErrorCodeTest098 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0099
     * @tc.name      JsvmErrorCodeTest099
     * @tc.desc      TakeHeapSnapshot,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testTakeHeapSnapshotJSOK();
      console.info('JsvmErrorCodeTest099 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0100
     * @tc.name      JsvmErrorCodeTest100
     * @tc.desc      OpenInspector,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testOpenInspectorJSOK();
      console.info('JsvmErrorCodeTest100 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0101
     * @tc.name      JsvmErrorCodeTest101
     * @tc.desc      OpenInspector,return JSVM_PENDING_EXCEPTION
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testOpenInspectorPending();
      console.info('JsvmErrorCodeTest101 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0102
     * @tc.name      JsvmErrorCodeTest102
     * @tc.desc      CloseInspector,return JSVM_PENDING_EXCEPTION
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCloseInspectorPending();
      console.info('JsvmErrorCodeTest102 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0104
     * @tc.name      JsvmErrorCodeTest104
     * @tc.desc      WaitForDebugger,return JSVM_PENDING_EXCEPTION
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testWaitForDebuggerPending();
      console.info('JsvmErrorCodeTest104 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0105
     * @tc.name      JsvmErrorCodeTest105
     * @tc.desc      IsLocked,return JSVM_Ok
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsLockedJSOK();
      console.info('JsvmErrorCodeTest105 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0106
     * @tc.name      JsvmErrorCodeTest106
     * @tc.desc      AcquireLock,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testAcquireLockJSOK();
      console.info('JsvmErrorCodeTest106 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0107
     * @tc.name      JsvmErrorCodeTest107
     * @tc.desc      ReleaseLock,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testReleaseLockJSOK();
      console.info('JsvmErrorCodeTest107 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0108
     * @tc.name      JsvmErrorCodeTest108
     * @tc.desc      IsCallable,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsCallableJSOK();
      console.info('JsvmErrorCodeTest108 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0109
     * @tc.name      JsvmErrorCodeTest109
     * @tc.desc      IsNull,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsNullJSOK();
      console.info('JsvmErrorCodeTest109 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0110
     * @tc.name      JsvmErrorCodeTest110
     * @tc.desc      IsNullOrUndefined,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsNullOrUndefinedJSOK();
      console.info('JsvmErrorCodeTest110 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0111
     * @tc.name      JsvmErrorCodeTest111
     * @tc.desc      IsBoolean,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsBooleanJSOK();
      console.info('JsvmErrorCodeTest111 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0112
     * @tc.name      JsvmErrorCodeTest112
     * @tc.desc      IsNumber,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsNumberJSOK();
      console.info('JsvmErrorCodeTest112 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0113
     * @tc.name      JsvmErrorCodeTest113
     * @tc.desc      IsString,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsStringJSOK();
      console.info('JsvmErrorCodeTest113 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0114
     * @tc.name      JsvmErrorCodeTest114
     * @tc.desc      IsSymbol,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsSymbolJSOK();
      console.info('JsvmErrorCodeTest114 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0115
     * @tc.name      JsvmErrorCodeTest115
     * @tc.desc      IsBigInt,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsBigIntJSOK();
      console.info('JsvmErrorCodeTest115 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0116
     * @tc.name      JsvmErrorCodeTest116
     * @tc.desc      CreateMap,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateMapJSOK();
      console.info('JsvmErrorCodeTest116 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0117
     * @tc.name      JsvmErrorCodeTest117
     * @tc.desc      CreateMap,return JSVM_INVALID_ARG
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateMapInvalid();
      console.info('JsvmErrorCodeTest117 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0118
     * @tc.name      JsvmErrorCodeTest118
     * @tc.desc      IsMap,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsMapJSOK();
      console.info('JsvmErrorCodeTest118 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0119
     * @tc.name      JsvmErrorCodeTest119
     * @tc.desc      IsMap,return JSVM_INVALID_ARG
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsMapInvalid();
      console.info('JsvmErrorCodeTest119 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0120
     * @tc.name      JsvmErrorCodeTest120
     * @tc.desc      CreateSet,return JSVM_INVALID_ARG
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateSetInvalid();
      console.info('JsvmErrorCodeTest120 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0121
     * @tc.name      JsvmErrorCodeTest121
     * @tc.desc      IsSet,return JSVM_INVALID_ARG
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsSetInvalid();
      console.info('JsvmErrorCodeTest121 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0122
     * @tc.name      JsvmErrorCodeTest122
     * @tc.desc      CompileScriptWithOptions,return JSVM_INVALID_ARG
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCompileScriptWithOptionsInvalid();
      console.info('JsvmErrorCodeTest122 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0123
     * @tc.name      JsvmErrorCodeTest123
     * @tc.desc      CoerceToBigInt,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCoerceToBigIntJSOK();
      console.info('JsvmErrorCodeTest123 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0124
     * @tc.name      JsvmErrorCodeTest124
     * @tc.desc      CoerceToBigInt,return JSVM_INVALID_ARG
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCoerceToBigIntInvalid();
      console.info('JsvmErrorCodeTest124 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0125
     * @tc.name      JsvmErrorCodeTest125
     * @tc.desc      CoerceToBigInt,return JSVM_BIGINT_EXPECTED
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCoerceToBigIntExpected();
      console.info('JsvmErrorCodeTest125 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0126
     * @tc.name      JsvmErrorCodeTest126
     * @tc.desc      IsRegExp,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsRegExpJSOK();
      console.info('JsvmErrorCodeTest126 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0127
     * @tc.name      JsvmErrorCodeTest127
     * @tc.desc      IsRegExp,return JSVM_INVALID_ARG
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsRegExpInvalid();
      console.info('JsvmErrorCodeTest127 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0128
     * @tc.name      JsvmErrorCodeTest128
     * @tc.desc      IsConstructor,return JSVM_OK
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsConstructorJSOK();
      console.info('JsvmErrorCodeTest128 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ACE_ERROR_ETS_JSVM_0129
     * @tc.name      JsvmErrorCodeTest129
     * @tc.desc      IsConstructor,return JSVM_INVALID_ARG
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('JsvmErrorCodeTest129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsConstructorInvalid();
      console.info('JsvmErrorCodeTest129 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });


  });

}
