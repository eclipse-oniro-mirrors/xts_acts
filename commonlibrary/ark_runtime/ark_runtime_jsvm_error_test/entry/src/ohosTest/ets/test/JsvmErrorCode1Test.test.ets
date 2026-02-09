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

  describe('JsvmTest1',() => {
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
     * @tc.name   JsvmErrorCodeTest130
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0130
     * @tc.desc   CreateRegExp,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateRegExpJSOK();
      console.info('JsvmErrorCodeTest130 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest131
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0131
     * @tc.desc   CreateRegExp,return JSVM_STRING_EXPECTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateRegExpExpected();
      console.info('JsvmErrorCodeTest131 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest132
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0132
     * @tc.desc   CreateRegExp,return JSVM_PENDING_EXCEPTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateRegExpPending();
      console.info('JsvmErrorCodeTest132 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest133
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0133
     * @tc.desc   CreateRegExp,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateRegExpInvalid();
      console.info('JsvmErrorCodeTest133 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest134
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0134
     * @tc.desc   CreateRegExp,return JSVM_GENERIC_FAILURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateRegExpGenericFailure();
      console.info('JsvmErrorCodeTest134 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });
    /**
     * @tc.name   JsvmErrorCodeTest135
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0135
     * @tc.desc   ObjectGetPrototypeOf,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testObjectGetPrototypeOfInvalid();
      console.info('JsvmErrorCodeTest135 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest136
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0136
     * @tc.desc   ObjectSetPrototypeOf,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testObjectSetPrototypeOfInvalid();
      console.info('JsvmErrorCodeTest136 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest137
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0137
     * @tc.desc   CreateFunctionWithScript,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateFunctionWithScriptJSOK();
      console.info('JsvmErrorCodeTest137 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest138
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0138
     * @tc.desc   CreateFunctionWithScript,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateFunctionWithScriptInvalid();
      console.info('JsvmErrorCodeTest138 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);


    });
    /**
     * @tc.name   JsvmErrorCodeTest139
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0139
     * @tc.desc   CreateFunctionWithScript,return JSVM_GENERIC_FAILURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateFunctionWithScriptGenericFailure();
      console.info('JsvmErrorCodeTest139 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);

    });
    /**
     * @tc.name   JsvmErrorCodeTest140
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0140
     * @tc.desc   RetainScript,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testRetainScriptInvalid();
      console.info('JsvmErrorCodeTest140 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);

    });
    /**
     * @tc.name   JsvmErrorCodeTest141
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0141
     * @tc.desc   ReleaseScript,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testReleaseScriptJSOK();
      console.info('JsvmErrorCodeTest141 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest142
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0142
     * @tc.desc   ReleaseScript,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testReleaseScriptInvalid();
      console.info('JsvmErrorCodeTest142 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest143
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0143
     * @tc.desc   OpenInspectorWithName,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testOpenInspectorWithNameJSOK();
      console.info('JsvmErrorCodeTest143 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest144
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0144
     * @tc.desc   OpenInspectorWithName,return JSVM_PENDING_EXCEPTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testOpenInspectorWithNamePending();
      console.info('JsvmErrorCodeTest144 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest145
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0145
     * @tc.desc   CompileWasmModule,return JSVM_PENDING_EXCEPTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCompileWasmModulePending();
      console.info('JsvmErrorCodeTest145 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest147
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0147
     * @tc.desc   CompileWasmModule,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCompileWasmModuleInvalid();
      console.info('JsvmErrorCodeTest147 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest149
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0149
     * @tc.desc   CompileWasmFunction,return JSVM_PENDING_EXCEPTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCompileWasmFunctionPending();
      console.info('JsvmErrorCodeTest149 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest151
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0151
     * @tc.desc   CompileWasmFunction,return JSVM_GENERIC_FAILURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCompileWasmFunctionGenericFailure();
      console.info('JsvmErrorCodeTest151 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest153
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0153
     * @tc.desc   CreateWasmCache,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateWasmCacheInvalid();
      console.info('JsvmErrorCodeTest153 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest154
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0154
     * @tc.desc   CreateWasmCache,return JSVM_GENERIC_FAILURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateWasmCacheGenericFailure();
      console.info('JsvmErrorCodeTest154 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest155
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0155
     * @tc.desc   CreateExternalStringLatin1,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateExternalStringLatin1JSOK();
      console.info('JsvmErrorCodeTest155 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest156
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0156
     * @tc.desc   CreateExternalStringLatin1,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateExternalStringLatin1Invalid();
      console.info('JsvmErrorCodeTest156 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest157
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0157
     * @tc.desc   CreateExternalStringUtf16,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateExternalStringUtf16JSOK();
      console.info('JsvmErrorCodeTest157 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest158
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0158
     * @tc.desc   CreateExternalStringUtf16,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateExternalStringUtf16Invalid();
      console.info('JsvmErrorCodeTest158 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest159
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0159
     * @tc.desc   CreatePrivate,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreatePrivateJSOK();
      console.info('JsvmErrorCodeTest159 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest160
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0160
     * @tc.desc   CreatePrivate,return JSVM_STRING_EXPECTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreatePrivateExpected();
      console.info('JsvmErrorCodeTest160 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest161
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0161
     * @tc.desc   CreatePrivate,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreatePrivateInvalid();
      console.info('JsvmErrorCodeTest161 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest162
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0162
     * @tc.desc   SetPrivate,return JSVM_PENDING_EXCPTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testSetPrivatePending();
      console.info('JsvmErrorCodeTest162 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest164
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0164
     * @tc.desc   GetPrivate,return JSVM_PENDING_EXCPTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetPrivatePending();
      console.info('JsvmErrorCodeTest164 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest166
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0166
     * @tc.desc   DeletePrivate,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testDeletePrivateJSOK();
      console.info('JsvmErrorCodeTest166 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest167
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0167
     * @tc.desc   DeletePrivate,return JSVM_PENDING_EXCPTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testDeletePrivatePending();
      console.info('JsvmErrorCodeTest167 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest169
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0169
     * @tc.desc   CreateDataReference,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testCreateDataReferenceInvalid();
      console.info('JsvmErrorCodeTest169 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest170
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0170
     * @tc.desc   GetReferenceData,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetReferenceDataInvalid();
      console.info('JsvmErrorCodeTest170 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });


    /**
     * @tc.name   JsvmErrorCodeTest171
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0171
     * @tc.desc   IsBigIntObject,return JSVM_Ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsBigIntObjectJSOK();
      console.info('JsvmErrorCodeTest171 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest172
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0172
     * @tc.desc   IsBigIntObject,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsBigIntObjectInvalid();
      console.info('JsvmErrorCodeTest172 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest173
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0173
     * @tc.desc   IsBooleanObject,return JSVM_Ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsBooleanObjectJSOK();
      console.info('JsvmErrorCodeTest173 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest174
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0174
     * @tc.desc   IsBooleanObject,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsBooleanObjectInvalid();
      console.info('JsvmErrorCodeTest174 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest175
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0175
     * @tc.desc   IsStringObject,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsStringObjectJSOK();
      console.info('JsvmErrorCodeTest175 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest176
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0176
     * @tc.desc   IsStringObject,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsStringObjectInvalid();
      console.info('JsvmErrorCodeTest176 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest177
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0177
     * @tc.desc   IsNumberObject,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsNumberObjectJSOK();
      console.info('JsvmErrorCodeTest177 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });
    /**
     * @tc.name   JsvmErrorCodeTest178
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0178
     * @tc.desc   IsNumberObject,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsNumberObjectInvalid();
      console.info('JsvmErrorCodeTest178 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });
    /**
     * @tc.name   JsvmErrorCodeTest179
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0179
     * @tc.desc   IsSymbolObject,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsSymbolObjectJSOK();
      console.info('JsvmErrorCodeTest179 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });
    /**
     * @tc.name   JsvmErrorCodeTest180
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0180
     * @tc.desc   IsSymbolObject,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testIsSymbolObjectInvalid();
      console.info('JsvmErrorCodeTest180 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest181
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0181
     * @tc.desc   GetSymbolAsyncIterator,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetSymbolAsyncIteratorJSOK();
      console.info('JsvmErrorCodeTest181 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest182
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0182
     * @tc.desc   GetSymbolAsyncIterator,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetSymbolAsyncIteratorInvalid();
      console.info('JsvmErrorCodeTest182 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest183
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0183
     * @tc.desc   GetSymbolHasInstance,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetSymbolHasInstanceJSOK();
      console.info('JsvmErrorCodeTest183 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest184
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0184
     * @tc.desc   GetSymbolHasInstance,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetSymbolHasInstanceInvalid();
      console.info('JsvmErrorCodeTest184 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest185
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0185
     * @tc.desc   GetSymbolIsConcatSpreadable,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetSymbolIsConcatSpreadableJSOK();
      console.info('JsvmErrorCodeTest185 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest186
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0186
     * @tc.desc   GetSymbolIsConcatSpreadable,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetSymbolIsConcatSpreadableInvalid();
      console.info('JsvmErrorCodeTest186 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest187
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0187
     * @tc.desc   GetSymbolMatch,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetSymbolMatchJSOK();
      console.info('JsvmErrorCodeTest187 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest188
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0188
     * @tc.desc   GetSymbolMatch,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetSymbolMatchInvalid();
      console.info('JsvmErrorCodeTest188 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest189
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0189
     * @tc.desc   GetSymbolReplace,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetSymbolReplaceJSOK();
      console.info('JsvmErrorCodeTest189 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest190
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0190
     * @tc.desc   GetSymbolReplace,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetSymbolReplaceInvalid();
      console.info('JsvmErrorCodeTest190 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest191
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0191
     * @tc.desc   GetSymbolSearch,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetSymbolSearchJSOK();
      console.info('JsvmErrorCodeTest191 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest192
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0192
     * @tc.desc   GetSymbolSearch,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetSymbolSearchInvalid();
      console.info('JsvmErrorCodeTest192 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest193
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0193
     * @tc.desc   GetSymbolSplit,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetSymbolSplitJSOK();
      console.info('JsvmErrorCodeTest193 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest194
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0194
     * @tc.desc   GetSymbolSplit,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetSymbolSplitInvalid();
      console.info('JsvmErrorCodeTest194 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest195
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0195
     * @tc.desc   GetSymbolToPrimitive,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetSymbolToPrimitiveJSOK();
      console.info('JsvmErrorCodeTest195 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest196
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0196
     * @tc.desc   GetSymbolToPrimitive,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetSymbolToPrimitiveInvalid();
      console.info('JsvmErrorCodeTest196 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest197
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0197
     * @tc.desc   GetSymbolUnscopables,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetSymbolUnscopablesJSOK();
      console.info('JsvmErrorCodeTest197 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest198
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0198
     * @tc.desc   GetSymbolUnscopables,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetSymbolUnscopablesInvalid();
      console.info('JsvmErrorCodeTest198 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest199
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0199
     * @tc.desc   GetSymbolToStringTag,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetSymbolToStringTagJSOK();
      console.info('JsvmErrorCodeTest199 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest200
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0200
     * @tc.desc   GetSymbolToStringTag,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetSymbolToStringTagInvalid();
      console.info('JsvmErrorCodeTest200 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest201
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0201
     * @tc.desc   GetSymbolIterator,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetSymbolIteratorJSOK();
      console.info('JsvmErrorCodeTest201 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest202
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0202
     * @tc.desc   GetSymbolIterator,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testGetSymbolIteratorInvalid();
      console.info('JsvmErrorCodeTest202 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest203
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0203
     * @tc.desc   SetHandlerForOOMError,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testSetHandlerForOOMErrorJSOK();
      console.info('JsvmErrorCodeTest203 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest204
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0204
     * @tc.desc   SetHandlerForOOMError,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testSetHandlerForOOMErrorInvalid();
      console.info('JsvmErrorCodeTest204 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest205
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0205
     * @tc.desc   SetDebugOption,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testSetDebugOptionJSOK();
      console.info('JsvmErrorCodeTest205 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest206
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0206
     * @tc.desc   SetDebugOption,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testSetDebugOptionInvalid();
      console.info('JsvmErrorCodeTest206 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest207
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0207
     * @tc.desc   SetHandlerForFatalError,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testSetHandlerForFatalErrorJSOK();
      console.info('JsvmErrorCodeTest207 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest208
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0208
     * @tc.desc   SetHandlerForFatalError,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testSetHandlerForFatalErrorInvalid();
      console.info('JsvmErrorCodeTest208 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest209
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0209
     * @tc.desc   SetHandlerForPromiseReject,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testSetHandlerForPromiseRejectJSOK();
      console.info('JsvmErrorCodeTest209 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest210
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0210
     * @tc.desc   SetHandlerForPromiseReject,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testSetHandlerForPromiseRejectInvalid();
      console.info('JsvmErrorCodeTest210 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest211
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0211
     * @tc.desc   DefineClassWithOptions,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testDefineClassWithOptionsJSOK();
      console.info('JsvmErrorCodeTest211 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest213
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0213
     * @tc.desc   AddHandlerForGC,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testAddHandlerForGCJSOK();
      console.info('JsvmErrorCodeTest213 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest214
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0214
     * @tc.desc   AddHandlerForGC,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testAddHandlerForGCInvalid();
      console.info('JsvmErrorCodeTest214 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest215
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0215
     * @tc.desc   RemoveHandlerForGC,return JSVM_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testRemoveHandlerForGCJSOK();
      console.info('JsvmErrorCodeTest215 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest216
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0216
     * @tc.desc   RemoveHandlerForGC,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testRemoveHandlerForGCInvalid();
      console.info('JsvmErrorCodeTest216 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest217
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0217
     * @tc.desc   RemoveHandlerForGC,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testJSVMStatusNameExpected();
      console.info('JsvmErrorCodeTest217 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest218
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0218
     * @tc.desc   RemoveHandlerForGC,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testJSVMStatusFunctionExpected();
      console.info('JsvmErrorCodeTest218 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest220
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0220
     * @tc.desc   RemoveHandlerForGC,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testJSVMStatusBigintExpected();
      console.info('JsvmErrorCodeTest220 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest221
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0221
     * @tc.desc   RemoveHandlerForGC,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testJSVMStatusDateExpected();
      console.info('JsvmErrorCodeTest221 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

    /**
     * @tc.name   JsvmErrorCodeTest223
     * @tc.number SUB_ACE_ERROR_ETS_JSVM_0223
     * @tc.desc   RemoveHandlerForGC,return JSVM_INVALID_ARG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('JsvmErrorCodeTest223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rst: number = napitest.testJSVMStatusInvalidType();
      console.info('JsvmErrorCodeTest223 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });

  });

}
