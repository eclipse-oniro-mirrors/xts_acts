/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"

// @ts-ignore
import napitest from 'libjsvmtest.so'


export default function JsvmJsunit() {

  describe('JsvmTest',() => {
    const empty = 'hh';
    let value;

    async function sleep(time) {
      return new Promise((resolve, reject) => {
        setTimeout(() => {
          resolve("ok")
        }, time)
      }).then(() => {
        console.info( `sleep ${time} over...`)
      })
    }

    /**
    * run after testcase
    */
    afterEach(async function () {
      console.info('[JsvmTest] after each called')
      value == '';
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0001
     * @tc.name      JsvmTest001
     * @tc.desc      JsvmTest
     */
    it('JsvmTest001', 0, async function (done) {
      console.info('JsvmTest001 START');
      napitest.Add()
      console.info('JsvmTest001 testString result is:'+ value + "--" + JSON.stringify(value) );
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0002
     * @tc.name      JsvmTest002
     * @tc.desc      JsvmTest
     */
    it('JsvmTest002', 0, async function (done) {
      console.info('JsvmTest002 START');
      value = napitest.testEngineAndContext()
      console.info('JsvmTest002 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0003
     * @tc.name      JsvmTest003
     * @tc.desc      JsvmTest
     */
    it('JsvmTest003', 0, async function (done) {
      console.info('JsvmTest003 START');
      value = napitest.testError()
      console.info('JsvmTest003 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0004
     * @tc.name      JsvmTest004
     * @tc.desc      JsvmTest
     */
    it('JsvmTest004', 0, async function (done) {
      console.info('JsvmTest004 START');
      value = napitest.testTypeError()
      console.info('JsvmTest004 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0005
     * @tc.name      JsvmTest005
     * @tc.desc      JsvmTest
     */
    it('JsvmTest005', 0, async function (done) {
      console.info('JsvmTest005 START');
      value = napitest.testRangeError()
      console.info('JsvmTest005 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0006
     * @tc.name      JsvmTest005
     * @tc.desc      JsvmTest
     */
    it('JsvmTest006', 0, async function (done) {
      console.info('JsvmTest006 START');
      value = napitest.testSyntaxError()
      console.info('JsvmTest006 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0007
     * @tc.name      JsvmTest007
     * @tc.desc      JsvmTest
     */
    it('JsvmTest007', 0, async function (done) {
      console.info('JsvmTest007 START');
      value = napitest.testClearError()
      console.info('JsvmTest007 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0008
     * @tc.name      JsvmTest008
     * @tc.desc      JsvmTest
     */
    it('JsvmTest008', 0, async function (done) {
      console.info('JsvmTest008 START');
      value = napitest.testLifeCycle()
      console.info('JsvmTest008 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0009
     * @tc.name      JsvmTest009
     * @tc.desc      JsvmTest
     */
    it('JsvmTest009', 0, async function (done) {
      console.info('JsvmgTest009 START');
      value = napitest.testCreateData1()
      console.info('Jsvm009 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0010
     * @tc.name      JsvmTest010
     * @tc.desc      JsvmTest
     */
    it('JsvmTest010', 0, async function (done) {
      console.info('JsvmTest010 START');
      value = napitest.testCreateData2()
      console.info('JsvmTest010 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0011
     * @tc.name      JsvmTest011
     * @tc.desc      JsvmTest
     */
    it('JsvmTest011', 0, async function (done) {
      console.info('JsvmTest011 START');
      value = napitest.testCreateData3()
      console.info('JsvmTest011 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0012
     * @tc.name      JsvmTest012
     * @tc.desc      JsvmTest
     */
    it('JsvmTest012', 0, async function (done) {
      console.info('JsvmTest012 START');
      value = napitest.testCreateData4()
      console.info('JsvmTest012 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0013
     * @tc.name      JsvmTest013
     * @tc.desc      JsvmTest
     */
    it('JsvmTest013', 0, async function (done) {
      console.info('JsvmTest013 START');
      value = napitest.testCreateData5()
      console.info('JsvmTest013 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0014
     * @tc.name      JsvmTest014
     * @tc.desc      JsvmTest
     */
    it('JsvmTest014', 0, async function (done) {
      console.info('JsvmTest014 START');
      value = napitest.testGetData1()
      console.info('JsvmTest014 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0015
     * @tc.name      JsvmTest015
     * @tc.desc      JsvmTest
     */
    it('JsvmTest015', 0, async function (done) {
      console.info('JsvmTest015 START');
      value = napitest.testGetData2()
      console.info('JsvmTest015 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0016
     * @tc.name      JsvmTest016
     * @tc.desc      JsvmTest
     */
    it('JsvmTest016', 0, async function (done) {
      console.info('JsvmTest016 START');
      value = napitest.testValueOperation()
      console.info('JsvmgTest016 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0017
     * @tc.name      JsvmTest017
     * @tc.desc      JsvmTest
     */
    it('JsvmTest017', 0, async function (done) {
      console.info('JsvmTest017 START');
      value = napitest.testValueOperation2()
      console.info('JsvmTest017 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0018
     * @tc.name      JsvmTest018
     * @tc.desc      JsvmTest
     */
    it('JsvmTest018', 0, async function (done) {
      console.info('JsvmTest018 START');
      value = napitest.testGetPropertyNames()
      console.info('JsvmTest018 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0019
     * @tc.name      JsvmTest019
     * @tc.desc      JsvmTest
     */
    it('JsvmTest019', 0, async function (done) {
      console.info('JsvmTest019 START');
      value = napitest.testGetAllPropertyNames()
      console.info('JsvmTest019 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0020
     * @tc.name      JsvmTest020
     * @tc.desc      JsvmTest
     */
    it('JSvmTest020', 0, async function (done) {
      console.info('JsvmTest020 START');
      value = napitest.testProperty()
      console.info('JsvmTest020 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0021
     * @tc.name      JsvmTest021
     * @tc.desc      JsvmTest
     */
    it('JsvmTest021', 0, async function (done) {
      console.info('JsvmTest021 START');
      value = napitest.testDefineProperties()
      console.info('JsvmTest021 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0022
     * @tc.name      JsvmTest022
     * @tc.desc      JsvmTest
     */
    it('JsvmTest022', 0, async function (done) {
      console.info('JsvmTest022 START');
      value = napitest.testWrap()
      console.info('JsvmTest022 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0023
     * @tc.name      JsvmTest023
     * @tc.desc      JsvmTest
     */
    it('JsvmTest023', 0, async function (done) {
      console.info('JsvmTest023 START');
      value = napitest.testOthers()
      console.info('JsvmTest023 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0024
     * @tc.name      JsvmTest024
     * @tc.desc      JsvmTest
     */
    it('JsvmTest024', 0, async function (done) {
      console.info('JsvmTest024 START');
      value = napitest.Add1()
      console.info('JsvmTest024 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0025
     * @tc.name      JsvmTest025
     * @tc.desc      JsvmTest
     */
    it('JsvmTest025', 0, async function (done) {
      console.info('JsvmTest025 START');
      value = napitest.testSecondOperations()
      console.info('JsvmTest025 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0026
     * @tc.name      JsvmTest026
     * @tc.desc      JsvmTest
     */
    it('JsvmTest026', 0, async function (done) {
      console.info('JsvmTest026 START');
      value = napitest.testDefinePropertyHandle(0)
      console.info('JsvmTest026 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0027
     * @tc.name      JsvmTest027
     * @tc.desc      JsvmTest
     */
    it('JsvmTest027', 0, async function (done) {
      console.info('JsvmTest027 START');
      value = napitest.testDefinePropertyHandle(1)
      console.info('JsvmTest027 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0028
     * @tc.name      JsvmTest028
     * @tc.desc      JsvmTest
     */
    it('JsvmTest028', 0, async function (done) {
      console.info('JsvmTest028 START');
      value = napitest.testDefinePropertyHandle(2)
      console.info('JsvmTest028 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0029
     * @tc.name      JsvmTest029
     * @tc.desc      JsvmTest
     */
    it('JsvmTest029', 0, async function (done) {
      console.info('JsvmTest029 START');
      value = napitest.testDefinePropertyHandle(3)
      console.info('JsvmTest029 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0030
     * @tc.name      JsvmTest030
     * @tc.desc      JsvmTest
     */
    it('JsvmTest030', 0, async function (done) {
      console.info('JsvmTest030 START');
      value = napitest.testDefinePropertyHandle(4)
      console.info('JsvmTest030 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0031
     * @tc.name      JsvmTest031
     * @tc.desc      JsvmTest
     */
    it('JsvmTest031', 0, async function (done) {
      console.info('JsvmTest031 START');
      value = napitest.testDefinePropertyHandle(5)
      console.info('JsvmTest031 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0032
     * @tc.name      JsvmTest032
     * @tc.desc      JsvmTest
     */
    it('JsvmTest032', 0, async function (done) {
      console.info('JsvmTest032 START');
      value = napitest.testDefinePropertyHandle(6)
      console.info('JsvmTest032 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0033
     * @tc.name      JsvmTest033
     * @tc.desc      JsvmTest
     */
    it('JsvmTest033', 0, async function (done) {
      console.info('JsvmTest033 START');
      value = napitest.testDefinePropertyHandle(7)
      console.info('JsvmTest033 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0034
     * @tc.name      JsvmTest034
     * @tc.desc      JsvmTest
     */
    it('JsvmTest034', 0, async function (done) {
      console.info('JsvmTest034 START');
      value = napitest.testDefinePropertyHandle(8)
      console.info('JsvmTest034 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0035
     * @tc.name      JsvmTest035
     * @tc.desc      JsvmTest
     */
    it('JsvmTest035', 0, async function (done) {
      console.info('JsvmTest035 START');
      value = napitest.testDefinePropertyHandle(9)
      console.info('JsvmTest035 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0036
     * @tc.name      JsvmTest036
     * @tc.desc      JsvmTest
     */
    it('JsvmTest036', 0, async function (done) {
      console.info('JsvmTest036 START');
      value = napitest.testDefinePropertyHandle(10)
      console.info('JsvmTest036 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0037
     * @tc.name      JsvmTest037
     * @tc.desc      JsvmTest
     */
    it('JsvmTest037', 0, async function (done) {
      console.info('JsvmTest037 START');
      value = napitest.testDefinePropertyHandle(11)
      console.info('JsvmTest037 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0038
     * @tc.name      JsvmTest038
     * @tc.desc      JsvmTest
     */
    it('JsvmTest038', 0, async function (done) {
      console.info('JsvmTest038 START');
      value = napitest.testDefinePropertyHandle(12)
      console.info('JsvmTest038 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0039
     * @tc.name      JsvmTest039
     * @tc.desc      JsvmTest
     */
    it('JsvmTest039', 0, async function (done) {
      console.info('JsvmTest039 START');
      value = napitest.testDefinePropertyHandle(13)
      console.info('JsvmTest039 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0040
     * @tc.name      JsvmTest040
     * @tc.desc      JsvmTest
     */
    it('JsvmTest040', 0, async function (done) {
      console.info('JsvmTest040 START');
      value = napitest.testDefinePropertyHandle(14)
      console.info('JsvmTest040 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0041
     * @tc.name      JsvmTest041
     * @tc.desc      JsvmTest
     */
    it('JsvmTest041', 0, async function (done) {
      console.info('JsvmTest041 START');
      value = napitest.testDefinePropertyHandle(15)
      console.info('JsvmTest041 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0042
     * @tc.name      JsvmTest042
     * @tc.desc      JsvmTest
     */
    it('JsvmTest042', 0, async function (done) {
      console.info('JsvmTest042 START');
      value = napitest.testDefinePropertyHandle(16)
      console.info('JsvmTest042 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0043
     * @tc.name      JsvmTest043
     * @tc.desc      JsvmTest
     */
    it('JsvmTest043', 0, async function (done) {
      console.info('JsvmTest043 START');
      value = napitest.testDefinePropertyHandle(17)
      console.info('JsvmTest043 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0044
     * @tc.name      JsvmTest044
     * @tc.desc      JsvmTest
     */
    it('JsvmTest044', 0, async function (done) {
      console.info('JsvmTest044 START');
      value = napitest.testDefinePropertyHandle(18)
      console.info('JsvmTest044 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0045
     * @tc.name      JsvmTest045
     * @tc.desc      JsvmTest
     */
    it('JsvmTest045', 0, async function (done) {
      console.info('JsvmTest045 START');
      value = napitest.testDefinePropertyHandle(19)
      console.info('JsvmTest045 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0046
     * @tc.name      JsvmTest046
     * @tc.desc      JsvmTest
     */
    it('JsvmTest046', 0, async function (done) {
      console.info('JsvmTest046 START');
      value = napitest.testDefinePropertyHandle(20)
      console.info('JsvmTest046 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0047
     * @tc.name      JsvmTest047
     * @tc.desc      JsvmTest
     */
    it('JsvmTest047', 0, async function (done) {
      console.info('JsvmTest047 START');
      value = napitest.testDefinePropertyHandle(21)
      console.info('JsvmTest047 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0048
     * @tc.name      JsvmTest048
     * @tc.desc      JsvmTest
     */
    it('JsvmTest048', 0, async function (done) {
      console.info('JsvmTest048 START');
      value = napitest.testValueOperation3()
      console.info('JsvmTest048 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
      /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0049
     * @tc.name      JsvmTest049
     * @tc.desc      JsvmTest
     */
    it('JsvmTest049', 0, async function (done) {
      console.info('JsvmTest049 START');
      value = napitest.testValueOperation4()
      console.info('JsvmTest049 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
     /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0050
     * @tc.name      JsvmTest050
     * @tc.desc      JsvmTest
     */
    it('JsvmTest050', 0, async function (done) {
      console.info('JsvmTest050 START');
      value = napitest.testLifeCycle2()
      console.info('JsvmTest050 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0051
     * @tc.name JsvmTest051
     * @tc.desc JsvmTest
     */
    it('JsvmTest051', 0, function () {
      let data = `"aaBC"`;
      let script: string = `
        getValueStringUtf8(${ data })
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('aaBC');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0052
     * @tc.name JsvmTest052
     * @tc.desc JsvmTest
     */
    it('JsvmTest052', 0, function () {
      let data = `"--&% #$"`;
      let script: string = `
        getValueStringUtf8(${ data })
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('--&% #$');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0053
     * @tc.name JsvmTest053
     * @tc.desc JsvmTest
     */
    it('JsvmTest053', 0, function () {
      let data = `"中国"`;
      let script: string = `
        getValueStringUtf8(${ data })
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('中国');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0054
     * @tc.name JsvmTest054
     * @tc.desc JsvmTest
     */
    it('JsvmTest054', 0, function () {
      let data = `"123"`;
      let script: string = `
        getValueStringUtf8(${ data })
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('123');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0055
     * @tc.name JsvmTest055
     * @tc.desc JsvmTest
     */
    it('JsvmTest055', 0, function () {
      let data = `"abc"`;
      let script: string = `
        getValueStringUtf8(${ data })
      `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('string');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0056
     * @tc.name JsvmTest056
     * @tc.desc JsvmTest
     */
    it('JsvmTest056', 0, function () {
      let script: string = `
        createStringUtf16()
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('你好, World!, successes to create UTF-16 string!');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0057
     * @tc.name JsvmTest057
     * @tc.desc JsvmTest
     */
    it('JsvmTest057', 0, function () {
      let script: string = `
        createStringUtf16()
       `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('string');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0058
     * @tc.name JsvmTest058
     * @tc.desc JsvmTest
     */
    it('JsvmTest058', 0, function () {
      let data = `"ahello。"`;
      let script: string = `
        getValueStringUtf16(${ data })
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('ahello。');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0059
     * @tc.name JsvmTest059
     * @tc.desc JsvmTest
     */
    it('JsvmTest059', 0, function () {
      let data = `"@#$%^&*()"`;
      let script: string = `
        getValueStringUtf16(${ data })
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('@#$%^&*()');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0060
     * @tc.name JsvmTest060
     * @tc.desc JsvmTest
     */
    it('JsvmTest060', 0, function () {
      let data = `"中国"`;
      let script: string = `
        getValueStringUtf16(${ data })
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('中国');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0061
     * @tc.name JsvmTest061
     * @tc.desc JsvmTest
     */
    it('JsvmTest061', 0, function () {
      let data = `"11"`;
      let script: string = `
        getValueStringUtf16(${ data })
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('11');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0062
     * @tc.name JsvmTest062
     * @tc.desc JsvmTest
     */
    it('JsvmTest062', 0, function () {
      let data = `"abc"`;
      let script: string = `
        getValueStringUtf16(${ data })
      `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('string');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0063
     * @tc.name JsvmTest063
     * @tc.desc JsvmTest
     */
    it('JsvmTest063', 0, function () {
      let script: string = `
        createStringLatin1()
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('Hello, World! éçñ, successes to create Latin1 string! 111');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0064
     * @tc.name JsvmTest064
     * @tc.desc JsvmTest
     */
    it('JsvmTest064', 0, function () {
      let script: string = `
        createStringLatin1()
      `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('string');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0065
     * @tc.name JsvmTest065
     * @tc.desc JsvmTest
     */
    it('JsvmTest065', 0, function () {
      let data = `"中文"`;
      let script: string = `
        getValueStringLatin1(${ data })
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('-');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0066
     * @tc.name JsvmTest066
     * @tc.desc JsvmTest
     */
    it('JsvmTest066', 0, function () {
      let data = `"111"`;
      let script: string = `
        getValueStringLatin1(${ data })
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('111');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0067
     * @tc.name JsvmTest067
     * @tc.desc JsvmTest
     */
    it('JsvmTest067', 0, function () {
      let data = `"ab"`;
      let script: string = `
        getValueStringLatin1(${ data })
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('ab');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0068
     * @tc.name JsvmTest068
     * @tc.desc JsvmTest
     */
    it('JsvmTest068', 0, function () {
      let data = `"~!@#$%^&*"`;
      let script: string = `
        getValueStringLatin1(${ data })
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('~!@#$%^&*');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0069
     * @tc.name JsvmTest069
     * @tc.desc JsvmTest
     */
    it('JsvmTest069', 0, function () {
      let data = `"©"`;
      let script: string = `
        getValueStringLatin1(${ data })
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('©');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0070
     * @tc.name JsvmTest070
     * @tc.desc JsvmTest
     */
    it('JsvmTest070', 0, function () {
      let script: string = `
        createDate()
      `;
      let result = napitest.runJsVm(script);
      expect(result.toString()).assertEqual('Sat Aug 05 2017 17:21:16 GMT+0800');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0071
     * @tc.name JsvmTest071
     * @tc.desc JsvmTest
     */
    it('JsvmTest071', 0, function () {
      let script: string = `
        createDate()
      `;
      let result = napitest.runJsVm(script);
      expect(result instanceof Date).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0072
     * @tc.name JsvmTest072
     * @tc.desc JsvmTest
     */
    it('JsvmTest072', 0, function () {
      let script: string = `
        createObject()
      `;
      let result: any = napitest.runJsVm(script);
      expect(typeof result).assertEqual('object');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0073
     * @tc.name JsvmTest073
     * @tc.desc JsvmTest
     */
    it('JsvmTest073', 0, function () {
      let script: string = `
        createObject()
      `;
      let result: any = napitest.runJsVm(script);
      expect(result.name).assertEqual('Hello OH_JSVM_CreateObject!');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0074
     * @tc.name JsvmTest074
     * @tc.desc JsvmTest
     */
    it('JsvmTest074', 0, function () {
      let script: string = `
        createObject()
      `;
      let result: any = napitest.runJsVm(script);
      expect(JSON.stringify(result)).assertEqual('{"name":"Hello OH_JSVM_CreateObject!"}');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0075
     * @tc.name JsvmTest075
     * @tc.desc JsvmTest
     */
    it('JsvmTest075', 0, function () {
      let script: string = `
        createBigintInt64()
      `;
      let result = napitest.runJsVm(script);
      expect(result.toString()).assertEqual('-5555555555555555555');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0076
     * @tc.name JsvmTest076
     * @tc.desc JsvmTest
     */
    it('JsvmTest076', 0, function () {
      let script: string = `
        createBigintInt64()
      `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('bigint');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0077
     * @tc.name JsvmTest077
     * @tc.desc JsvmTest
     */
    it('JsvmTest077', 0, function () {
      let script: string = `
        createExternal()
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0078
     * @tc.name JsvmTest078
     * @tc.desc JsvmTest
     */
    it('JsvmTest078', 0, function () {
      let script: string = `
        createExternal()
      `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0079
     * @tc.name JsvmTest079
     * @tc.desc JsvmTest
     */
    it('JsvmTest079', 0, function () {
      let script: string = `
        getValueExternal()
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0080
     * @tc.name JsvmTest080
     * @tc.desc JsvmTest
     */
    it('JsvmTest080', 0, function () {
      let script: string = `
        function testCreateArray() {
          return createArray();
        }
        testCreateArray()
      `;
      let result: any = napitest.runJsVm(script);
      expect(result.length).assertEqual(5);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0081
     * @tc.name JsvmTest081
     * @tc.desc JsvmTest
     */
    it('JsvmTest081', 0, function () {
      let script: string = `
        function testCreateArray() {
          return createArray();
        }
        testCreateArray()
    `;
      let result: any = napitest.runJsVm(script);
      expect(result.toString()).assertEqual('0,1,2,3,4');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0082
     * @tc.name JsvmTest082
     * @tc.desc JsvmTest
     */
    it('JsvmTest082', 0, function () {
      let script: string = `
        function testCreateArray() {
          return createArray();
        }
        testCreateArray()
      `;
      let result: any = napitest.runJsVm(script);
      expect(result instanceof Array).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0083
     * @tc.name JsvmTest083
     * @tc.desc JsvmTest
     */
    it('JsvmTest083', 0, function () {
      let script: string = `
        function testCreateArray() {
          return createArray();
        }
        testCreateArray()
      `;
      let result: any = napitest.runJsVm(script);
      expect(Array.isArray(result)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0084
     * @tc.name JsvmTest084
     * @tc.desc JsvmTest
     */
    it('JsvmTest084', 0, function () {
      let num = -1;
      let script: string = `
      function testCreateArrayWithLength(num) {
         return createArrayWithLength(num);
      }
      testCreateArrayWithLength(${ num })
    `;
      let result: any = napitest.runJsVm(script);
      expect(result.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0085
     * @tc.name JsvmTest085
     * @tc.desc JsvmTest
     */
    it('JsvmTest085', 0, function () {
      let num = 0;
      let script: string = `
      function testCreateArrayWithLength(num) {
         return createArrayWithLength(num);
      }
      testCreateArrayWithLength(${ num })
    `;
      let result: any = napitest.runJsVm(script);
      expect(result.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0086
     * @tc.name JsvmTest086
     * @tc.desc JsvmTest
     */
    it('JsvmTest086', 0, function () {
      let num = 5;
      let script: string = `
      function testCreateArrayWithLength(num) {
         return createArrayWithLength(num);
      }
      testCreateArrayWithLength(${ num })
    `;
      let result: any = napitest.runJsVm(script);
      expect(result.length).assertEqual(5);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0087
     * @tc.name JsvmTest087
     * @tc.desc JsvmTest
     */
    it('JsvmTest087', 0, function () {
      let num = 5;
      let script: string = `
      function testCreateArrayWithLength(num) {
         return createArrayWithLength(num);
      }
      testCreateArrayWithLength(${ num })
    `;
      let result: any = napitest.runJsVm(script);
      expect(result.toString()).assertEqual('0,1,2,3,4');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0088
     * @tc.name JsvmTest088
     * @tc.desc JsvmTest
     */
    it('JsvmTest088', 0, function () {
      let num = 5;
      let script: string = `
      function testCreateArrayWithLength(num) {
         return createArrayWithLength(num);
      }
      testCreateArrayWithLength(${ num })
    `;
      let result: any = napitest.runJsVm(script);
      expect(Array.isArray(result)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0089
     * @tc.name JsvmTest089
     * @tc.desc JsvmTest
     */
    it('JsvmTest089', 0, function () {
      let script: string = `
      function testCreateArraybuffer() {
         return createArraybuffer(6);
      }
      testCreateArraybuffer()
    `;
      let result: any = napitest.runJsVm(script);
      expect(result.byteLength).assertEqual(6);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0090
     * @tc.name JsvmTest090
     * @tc.desc JsvmTest
     */
    it('JsvmTest090', 0, function () {
      let script: string = `
      function testCreateArraybuffer() {
         return createArraybuffer(0);
      }
      testCreateArraybuffer()
    `;
      let result: any = napitest.runJsVm(script);
      expect(result.byteLength).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0091
     * @tc.name JsvmTest091
     * @tc.desc JsvmTest
     */
    it('JsvmTest091', 0, function () {
      let script: string = `
      function testCreateArraybuffer() {
         return createArraybuffer(3);
      }
      testCreateArraybuffer()
    `;
      let result: any = napitest.runJsVm(script);
      expect(result instanceof ArrayBuffer).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0092
     * @tc.name JsvmTest092
     * @tc.desc JsvmTest
     */
    it('JsvmTest092', 0, function () {
      let script: string = `
      function testCreateArraybuffer() {
         return createArraybuffer(3);
      }
      testCreateArraybuffer()
    `;
      let result: any = napitest.runJsVm(script);
      expect(result.toString()).assertEqual('[object ArrayBuffer]');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0093
     * @tc.name JsvmTest093
     * @tc.desc JsvmTest
     */
    it('JsvmTest093', 0, function () {
      let script: string = `
      function testCreateInt32() {
         return createInt32();
      }
      testCreateInt32()
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(-20);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0094
     * @tc.name JsvmTest094
     * @tc.desc JsvmTest
     */
    it('JsvmTest094', 0, function () {
      let script: string = `
      function testCreateInt32() {
         return createInt32();
      }
      testCreateInt32()
    `;
      let result = napitest.runJsVm(script);
      expect(Number.isInteger(result)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0095
     * @tc.name JsvmTest095
     * @tc.desc JsvmTest
     */
    it('JsvmTest095', 0, function () {
      let num = 0;
      let script: string = `
      function testGetValueInt32(num) {
         return getValueInt32(num);
      }
      testGetValueInt32(${ num })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0096
     * @tc.name JsvmTest096
     * @tc.desc JsvmTest
     */
    it('JsvmTest096', 0, function () {
      let num = 2147483647;
      let script: string = `
      function testGetValueInt32(num) {
         return getValueInt32(num);
      }
      testGetValueInt32(${ num })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(2147483647);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0097
     * @tc.name JsvmTest097
     * @tc.desc JsvmTest
     */
    it('JsvmTest097', 0, function () {
      let num = 2147483649;
      let script: string = `
      function testGetValueInt32(num) {
         return getValueInt32(num);
      }
      testGetValueInt32(${ num })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(-2147483647);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0098
     * @tc.name JsvmTest098
     * @tc.desc JsvmTest
     */
    it('JsvmTest098', 0, function () {
      let num = -2147483648;
      let script: string = `
      function testGetValueInt32(num) {
         return getValueInt32(num);
      }
      testGetValueInt32(${ num })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(-2147483648);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0099
     * @tc.name JsvmTest099
     * @tc.desc JsvmTest
     */
    it('JsvmTest099', 0, function () {
      let num = -2147483650;
      let script: string = `
      function testGetValueInt32(num) {
         return getValueInt32(num);
      }
      testGetValueInt32(${ num })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(2147483646);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0100
     * @tc.name JsvmTest100
     * @tc.desc JsvmTest
     */
    it('JsvmTest100', 0, function () {
      let num = 1;
      let script: string = `
      function testGetValueInt32(num) {
         return getValueInt32(num);
      }
      testGetValueInt32(${ num })
    `;
      let result = napitest.runJsVm(script);
      expect(Number.isInteger(result)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0101
     * @tc.name JsvmTest101
     * @tc.desc JsvmTest
     */
    it('JsvmTest101', 0, function () {
      let script: string = `
      function testCreateUInt32() {
         return createUInt32();
      }
      testCreateUInt32()
    `;
      let result = napitest.runJsVm(script);
      expect(Number.isInteger(result)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0102
     * @tc.name JsvmTest102
     * @tc.desc JsvmTest
     */
    it('JsvmTest102', 0, function () {
      let script: string = `
      function testCreateUInt32() {
         return createUInt32();
      }
      testCreateUInt32()
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(26);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0103
     * @tc.name JsvmTest103
     * @tc.desc JsvmTest
     */
    it('JsvmTest103', 0, function () {
      let num = 1;
      let script: string = `
      function testGetValueUint32(num) {
         return getValueUint32(num);
      }
      testGetValueUint32(${ num })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(1);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0104
     * @tc.name JsvmTest104
     * @tc.desc JsvmTest
     */
    it('JsvmTest104', 0, function () {
      let num = -1;
      let script: string = `
      function testGetValueUint32(num) {
         return getValueUint32(num);
      }
      testGetValueUint32(${ num })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(4294967295);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0105
     * @tc.name JsvmTest105
     * @tc.desc JsvmTest
     */
    it('JsvmTest105', 0, function () {
      let num = 4294967295;
      let script: string = `
      function testGetValueUint32(num) {
         return getValueUint32(num);
      }
      testGetValueUint32(${ num })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(4294967295);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0106
     * @tc.name JsvmTest106
     * @tc.desc JsvmTest
     */
    it('JsvmTest106', 0, function () {
      let num = 4294967296;
      let script: string = `
      function testGetValueUint32(num) {
         return getValueUint32(num);
      }
      testGetValueUint32(${ num })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0107
     * @tc.name JsvmTest107
     * @tc.desc JsvmTest
     */
    it('JsvmTest107', 0, function () {
      let num = 3;
      let script: string = `
      function testGetValueUint32(num) {
         return getValueUint32(num);
      }
      testGetValueUint32(${ num })
    `;
      let result = napitest.runJsVm(script);
      expect(Number.isInteger(result)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0108
     * @tc.name JsvmTest108
     * @tc.desc JsvmTest
     */
    it('JsvmTest108', 0, function () {
      let script: string = `
      function testCreateInt64() {
         return createInt64();
      }
      testCreateInt64()
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(2147483648);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0109
     * @tc.name JsvmTest109
     * @tc.desc JsvmTest
     */
    it('JsvmTest109', 0, function () {
      let script: string = `
      function testCreateInt64() {
         return createInt64();
      }
      testCreateInt64()
    `;
      let result = napitest.runJsVm(script);
      expect(Number.isInteger(result)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0110
     * @tc.name JsvmTest110
     * @tc.desc JsvmTest
     */
    it('JsvmTest110', 0, function () {
      let num = -1;
      let script: string = `
      function testGetValueInt64(num) {
         return getValueInt64(num);
      }
      testGetValueInt64(${ num })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(-1);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0111
     * @tc.name JsvmTest111
     * @tc.desc JsvmTest
     */
    it('JsvmTest111', 0, function () {
      let num = -9223372036854775808;
      let script: string = `
      function testGetValueInt64(num) {
         return getValueInt64(num);
      }
      testGetValueInt64(${ num })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(-9223372036854775808);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0112
     * @tc.name JsvmTest112
     * @tc.desc JsvmTest
     */
    it('JsvmTest112', 0, function () {
      let num = 9223372036854775807;
      let script: string = `
      function testGetValueInt64(num) {
         return getValueInt64(num);
      }
      testGetValueInt64(${ num })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(9223372036854775807);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0113
     * @tc.name JsvmTest113
     * @tc.desc JsvmTest
     */
    it('JsvmTest113', 0, function () {
      let num = 888;
      let script: string = `
      function testGetValueInt64(num) {
         return getValueInt64(num);
      }
      testGetValueInt64(${ num })
    `;
      let result = napitest.runJsVm(script);
      expect(Number.isInteger(result)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0114
     * @tc.name JsvmTest114
     * @tc.desc JsvmTest
     */
    it('JsvmTest114', 0, function () {
      let num = 11;
      let script: string = `
      function testGetValueInt64(num) {
         return getValueInt64(num);
      }
      testGetValueInt64(${ num })
    `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('number');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0115
     * @tc.name JsvmTest115
     * @tc.desc JsvmTest
     */
    it('JsvmTest115', 0, function () {
      let script: string = `
      function testCreateDouble() {
         return createDouble();
      }
      testCreateDouble()
    `;
      let result = napitest.runJsVm(script);
      expect(!Number.isInteger(result)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0116
     * @tc.name JsvmTest116
     * @tc.desc JsvmTest
     */
    it('JsvmTest116', 0, function () {
      let script: string = `
      function testCreateDouble() {
         return createDouble();
      }
      testCreateDouble()
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(1.234);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0117
     * @tc.name JsvmTest117
     * @tc.desc JsvmTest
     */
    it('JsvmTest117', 0, function () {
      let script: string = `
      function testCreateDouble() {
         return createDouble();
      }
      testCreateDouble()
    `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('number');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0118
     * @tc.name JsvmTest118
     * @tc.desc JsvmTest
     */
    it('JsvmTest118', 0, function () {
      let num = -110.0456;
      let script: string = `
      function testGetDouble(num) {
         return getDouble(num);
      }
      testGetDouble(${ num })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(-110.0456);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0119
     * @tc.name JsvmTest119
     * @tc.desc JsvmTest
     */
    it('JsvmTest119', 0, function () {
      let num = 1.456;
      let script: string = `
      function testGetDouble(num) {
         return getDouble(num);
      }
      testGetDouble(${ num })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(1.456);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0120
     * @tc.name JsvmTest120
     * @tc.desc JsvmTest
     */
    it('JsvmTest120', 0, function () {
      let num = 0.0000001;
      let script: string = `
      function testGetDouble(num) {
         return getDouble(num);
      }
      testGetDouble(${ num })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(0.0000001);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0121
     * @tc.name JsvmTest121
     * @tc.desc JsvmTest
     */
    it('JsvmTest121', 0, function () {
      let num = 1.5;
      let script: string = `
      function testGetDouble(num) {
         return getDouble(num);
      }
      testGetDouble(${ num })
    `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('number');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0122
     * @tc.name JsvmTest122
     * @tc.desc JsvmTest
     */
    it('JsvmTest122', 0, function () {
      let data = 1;
      let value = 2;
      let script: string = `
      function testGetBoolean(data, value) {
         return getBoolean(data, value);
      }
      testGetBoolean(${ data }, ${ value })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0123
     * @tc.name JsvmTest123
     * @tc.desc JsvmTest
     */
    it('JsvmTest123', 0, function () {
      let data = 1;
      let value = 1;
      let script: string = `
      function testGetBoolean(data, value) {
         return getBoolean(data, value);
      }
      testGetBoolean(${ data }, ${ value })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0124
     * @tc.name JsvmTest124
     * @tc.desc JsvmTest
     */
    it('JsvmTest124', 0, function () {
      let data = '2';
      let value = '2';
      let script: string = `
      function testGetBoolean(data, value) {
         return getBoolean(data, value);
      }
      testGetBoolean(${ data }, ${ value })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0125
     * @tc.name JsvmTest125
     * @tc.desc JsvmTest
     */
    it('JsvmTest125', 0, function () {
      let data = '2';
      let value = '3';
      let script: string = `
      function testGetBoolean(data, value) {
         return getBoolean(data, value);
      }
      testGetBoolean(${ data }, ${ value })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0126
     * @tc.name JsvmTest126
     * @tc.desc JsvmTest
     */
    it('JsvmTest126', 0, function () {
      let data = `'a'`;
      let value = `'c'`;
      let script: string = `
      getBoolean(${ data }, ${ value })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0127
     * @tc.name JsvmTest127
     * @tc.desc JsvmTest
     */
    it('JsvmTest127', 0, function () {
      let data = true;
      let script: string = `
      function testGetValueBool(data) {
         return getValueBool(data);
      }
      testGetValueBool(${ data })
    `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0128
     * @tc.name JsvmTest128
     * @tc.desc JsvmTest
     */
    it('JsvmTest128', 0, function () {
      let data = 'true';
      let script: string = `
      function testGetValueBool(data) {
         return getValueBool(data);
      }
      testGetValueBool(${ data })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0129
     * @tc.name JsvmTest129
     * @tc.desc JsvmTest
     */
    it('JsvmTest129', 0, function () {
      let data = 11;
      let script: string = `
      function testGetValueBool(data) {
         return getValueBool(data);
      }
      testGetValueBool(${ data })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0130
     * @tc.name JsvmTest130
     * @tc.desc JsvmTest
     */
    it('JsvmTest130', 0, function () {
      let data = 'false';
      let script: string = `
      function testGetValueBool(data) {
         return getValueBool(data);
      }
      testGetValueBool(${ data })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0131
     * @tc.name JsvmTest131
     * @tc.desc JsvmTest
     */
    it('JsvmTest131', 0, function () {
      let data = false;
      let script: string = `
      function testGetValueBool(data) {
         return getValueBool(data);
      }
      testGetValueBool(${ data })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0132
     * @tc.name JsvmTest132
     * @tc.desc JsvmTest
     */
    it('JsvmTest132', 0, function () {
      let script: string = `
        createBigintUint64()
    `;
      let result = napitest.runJsVm(script);
      expect(result.toString()).assertEqual('5555555555555555555');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0133
     * @tc.name JsvmTest133
     * @tc.desc JsvmTest
     */
    it('JsvmTest133', 0, function () {
      let script: string = `
        createBigintUint64()
    `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('bigint');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0134
     * @tc.name JsvmTest134
     * @tc.desc JsvmTest
     */
    it('JsvmTest134', 0, function () {
      let script: string = `
        getValueBigintUint64(BigInt(5555555555555555))
    `;
      let result = napitest.runJsVm(script);
      expect(result.toString()).assertEqual('5555555555555555');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0135
     * @tc.name JsvmTest135
     * @tc.desc JsvmTest
     */
    it('JsvmTest135', 0, function () {
      let script: string = `
        getValueBigintUint64(BigInt(0))
    `;
      let result = napitest.runJsVm(script);
      expect(result.toString()).assertEqual('0');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0136
     * @tc.name JsvmTest136
     * @tc.desc JsvmTest
     */
    it('JsvmTest136', 0, function () {
      let script: string = `
        getValueBigintUint64(BigInt(1))
    `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('bigint');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0137
     * @tc.name JsvmTest137
     * @tc.desc JsvmTest
     */
    it('JsvmTest137', 0, function () {
      let script: string = `
        createBigintInt64()
    `;
      let result = napitest.runJsVm(script);
      expect(result.toString()).assertEqual('-5555555555555555555');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0138
     * @tc.name JsvmTest138
     * @tc.desc JsvmTest
     */
    it('JsvmTest138', 0, function () {
      let script: string = `
        createBigintInt64()
    `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('bigint');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0139
     * @tc.name JsvmTest139
     * @tc.desc JsvmTest
     */
    it('JsvmTest139', 0, function () {
      let script: string = `
        getBigintInt64(BigInt(-5555555555555555))
    `;
      let result = napitest.runJsVm(script);
      expect(result.toString()).assertEqual('-5555555555555555');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0140
     * @tc.name JsvmTest140
     * @tc.desc JsvmTest
     */
    it('JsvmTest140', 0, function () {
      let script: string = `
        getBigintInt64(BigInt(0))
    `;
      let result = napitest.runJsVm(script);
      expect(result.toString()).assertEqual('0');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0141
     * @tc.name JsvmTest141
     * @tc.desc JsvmTest
     */
    it('JsvmTest141', 0, function () {
      let script: string = `
        getBigintInt64(BigInt(5555555555555555))
    `;
      let result = napitest.runJsVm(script);
      expect(result.toString()).assertEqual('5555555555555555');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0142
     * @tc.name JsvmTest142
     * @tc.desc JsvmTest
     */
    it('JsvmTest142', 0, function () {
      let script: string = `
        getBigintInt64(BigInt(123))
    `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('bigint');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0143
     * @tc.name JsvmTest143
     * @tc.desc JsvmTest
     */
    it('JsvmTest143', 0, function () {
      let script: string = `
        createBigintWords()
    `;
      let result = napitest.runJsVm(script);
      expect(result.toString()).assertEqual('19055812547572553954576167314685144596492');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0144
     * @tc.name JsvmTest144
     * @tc.desc JsvmTest
     */
    it('JsvmTest144', 0, function () {
      let script: string = `
        createBigintWords()
    `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('bigint');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0145
     * @tc.name JsvmTest145
     * @tc.desc JsvmTest
     */
    it('JsvmTest145', 0, function () {
      let script: string = `
        getValueBigintWords(BigInt(5555555555555555))
    `;
      let result = napitest.runJsVm(script);
      // 0代表符号位为正
      expect(result.toString()).assertEqual('0');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0146
     * @tc.name JsvmTest146
     * @tc.desc JsvmTest
     */
    it('JsvmTest146', 0, function () {
      let script: string = `
        getValueBigintWords(BigInt(-5555555555555555))
    `;
      let result = napitest.runJsVm(script);
      // 1代表符号位为负
      expect(result.toString()).assertEqual('1');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0147
     * @tc.name JsvmTest147
     * @tc.desc JsvmTest
     */
    it('JsvmTest147', 0, function () {
      let script: string = `
        getValueBigintWords(11)
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0148
     * @tc.name JsvmTest148
     * @tc.desc JsvmTest
     */
    it('JsvmTest148', 0, function () {
      let script: string = `
        getValueBigintWords('ab')
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0149
     * @tc.name JsvmTest149
     * @tc.desc JsvmTest
     */
    it('JsvmTest149', 0, function () {
      let script: string = `
        getValueBigintWords('中')
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0150
     * @tc.name JsvmTest150
     * @tc.desc JsvmTest
     */
    it('JsvmTest150', 0, function () {
      let script: string = `
        getValueBigintWords('@#￥%&*（$^(')
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0151
     * @tc.name JsvmTest151
     * @tc.desc JsvmTest
     */
    it('JsvmTest151', 0, function () {
      let script: string = `
        getNull()
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(null);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0152
     * @tc.name JsvmTest152
     * @tc.desc JsvmTest
     */
    it('JsvmTest152', 0, function () {
      let script: string = `
        getUndefined()
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0153
     * @tc.name JsvmTest153
     * @tc.desc JsvmTest
     */
    it('JsvmTest153', 0, function () {
      let script: string = `
        getGlobal()
    `;
      let result = napitest.runJsVm(script);
      // @ts-ignore
      expect(result.Row).assertEqual(1);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0154
     * @tc.name JsvmTest154
     * @tc.desc JsvmTest
     */
    it('JsvmTest154', 0, function () {
      let script: string = `
        getGlobal()
    `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('object');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0155
     * @tc.name JsvmTest155
     * @tc.desc JsvmTest
     */
    it('JsvmTest155', 0, function () {
      let script: string = `
        createSymbol()
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0156
     * @tc.name JsvmTest156
     * @tc.desc JsvmTest
     */
    it('JsvmTest156', 0, function () {
      let script: string = `
        createSymbol()
    `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0157
     * @tc.name JsvmTest157
     * @tc.desc JsvmTest
     */
    it('JsvmTest157', 0, function () {
      let script: string = `
        symbolFor()
    `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0158
     * @tc.name JsvmTest158
     * @tc.desc JsvmTest
     */
    it('JsvmTest158', 0, function () {
      let script: string = `
        symbolFor()
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0159
     * @tc.name JsvmTest159
     * @tc.desc JsvmTest
     */
    it('JsvmTest159', 0, function () {
      let script: string = `
        getDateValue(new Date(Date.now()))
    `;
      let result = napitest.runJsVm(script);
      expect(result > 0).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0160
     * @tc.name JsvmTest1160
     * @tc.desc JsvmTest
     */
    it('JsvmTest160', 0, function () {
      let script: string = `
        getDateValue(new Date(Date.now()))
    `;
      let result = napitest.runJsVm(script);
      expect(Number.isInteger(result)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0161
     * @tc.name JsvmTest161
     * @tc.desc JsvmTest
     */
    it('JsvmTest161', 0, function () {
      let ARRAY_BUFFER = 1;
      let script: string = `
        getArraybufferInfo(new ArrayBuffer(10), ${ ARRAY_BUFFER })
    `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('object');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0162
     * @tc.name JsvmTest162
     * @tc.desc JsvmTest
     */
    it('JsvmTest162', 0, function () {
      let ARRAY_LENGTH = 0;
      let script: string = `
        getArraybufferInfo(new ArrayBuffer(10), ${ ARRAY_LENGTH })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(10);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0163
     * @tc.name JsvmTest163
     * @tc.desc JsvmTest
     */
    it('JsvmTest163', 0, function () {
      let ARRAY_BUFFER = 1;
      let script: string = `
        getArraybufferInfo(new ArrayBuffer(10), ${ ARRAY_BUFFER })
    `;
      let result: any = napitest.runJsVm(script);
      expect(result instanceof ArrayBuffer).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0164
     * @tc.name JsvmTest164
     * @tc.desc JsvmTest
     */
    it('JsvmTest164', 0, function () {
      let type = napitest.TypedArrayTypes['INT8_ARRAY'];
      let script: string = `
        createTypedArray(${ type })
    `;
      let result = napitest.runJsVm(script);
      expect(result instanceof Int8Array).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0165
     * @tc.name JsvmTest165
     * @tc.desc JsvmTest
     */
    it('JsvmTest165', 0, function () {
      let type = napitest.TypedArrayTypes['UINT8_ARRAY'];
      let script: string = `
        createTypedArray(${ type })
    `;
      let result = napitest.runJsVm(script);
      expect(result instanceof Uint8Array).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0166
     * @tc.name JsvmTest166
     * @tc.desc JsvmTest
     */
    it('JsvmTest166', 0, function () {
      let type = napitest.TypedArrayTypes['UINT8_CLAMPED_ARRAY'];
      let script: string = `
        createTypedArray(${ type })
    `;
      let result = napitest.runJsVm(script);
      expect(result instanceof Uint8ClampedArray).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0167
     * @tc.name JsvmTest167
     * @tc.desc JsvmTest
     */
    it('JsvmTest167', 0, function () {
      let type = napitest.TypedArrayTypes['INT16_ARRAY'];
      let script: string = `
        createTypedArray(${ type })
    `;
      let result = napitest.runJsVm(script);
      expect(result instanceof Int16Array).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0168
     * @tc.name JsvmTest168
     * @tc.desc JsvmTest
     */
    it('JsvmTest168', 0, function () {
      let type = napitest.TypedArrayTypes['UINT16_ARRAY'];
      let script: string = `
        createTypedArray(${ type })
    `;
      let result = napitest.runJsVm(script);
      expect(result instanceof Uint16Array).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0169
     * @tc.name JsvmTest169
     * @tc.desc JsvmTest
     */
    it('JsvmTest169', 0, function () {
      let type = napitest.TypedArrayTypes['INT32_ARRAY'];
      let script: string = `
        createTypedArray(${ type })
    `;
      let result = napitest.runJsVm(script);
      expect(result instanceof Int32Array).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0170
     * @tc.name JsvmTest170
     * @tc.desc JsvmTest
     */
    it('JsvmTest170', 0, function () {
      let type = napitest.TypedArrayTypes['UINT32_ARRAY'];
      let script: string = `
        createTypedArray(${ type })
    `;
      let result = napitest.runJsVm(script);
      expect(result instanceof Uint32Array).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0171
     * @tc.name JsvmTest171
     * @tc.desc JsvmTest
     */
    it('JsvmTest171', 0, function () {
      let type = napitest.TypedArrayTypes['FLOAT32_ARRAY'];
      let script: string = `
        createTypedArray(${ type })
    `;
      let result = napitest.runJsVm(script);
      expect(result instanceof Float32Array).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0172
     * @tc.name JsvmTest172
     * @tc.desc JsvmTest
     */
    it('JsvmTest172', 0, function () {
      let type = napitest.TypedArrayTypes['FLOAT64_ARRAY'];
      let script: string = `
        createTypedArray(${ type })
    `;
      let result = napitest.runJsVm(script);
      expect(result instanceof Float64Array).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0173
     * @tc.name JsvmTest173
     * @tc.desc JsvmTest
     */
    it('JsvmTest173', 0, function () {
      let type = napitest.TypedArrayTypes['BIGINT64_ARRAY'];
      let script: string = `
        createTypedArray(${ type })
    `;
      let result = napitest.runJsVm(script);
      expect(result instanceof BigInt64Array).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0174
     * @tc.name JsvmTest174
     * @tc.desc JsvmTest
     */
    it('JsvmTest174', 0, function () {
      let type = napitest.TypedArrayTypes['BIGUINT64_ARRAY'];
      let script: string = `
        createTypedArray(${ type })
    `;
      let result = napitest.runJsVm(script);
      expect(result instanceof BigUint64Array).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0175
     * @tc.name JsvmTest175
     * @tc.desc JsvmTest
     */
    it('JsvmTest175', 0, function () {
      //  超出范围，默认是INT8_ARRAY
      let script: string = `
        createTypedArray(22)
    `;
      let result = napitest.runJsVm(script);
      expect(result instanceof Int8Array).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0176
     * @tc.name JsvmTest176
     * @tc.desc JsvmTest
     */
    it('JsvmTest176', 0, function () {
      let IS_JSVM_INT8_ARRAY = 0;
      let script: string = `
        getTypedArrayInfo(new Int8Array(3), ${ IS_JSVM_INT8_ARRAY })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0177
     * @tc.name JsvmTest177
     * @tc.desc JsvmTest
     */
    it('JsvmTest177', 0, function () {
      let IS_JSVM_INT8_ARRAY = 0;
      let script: string = `
        getTypedArrayInfo(new Int16Array(3), ${ IS_JSVM_INT8_ARRAY })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0178
     * @tc.name JsvmTest178
     * @tc.desc JsvmTest
     */
    it('JsvmTest178', 0, function () {
      let IS_JSVM_INT8_ARRAY = 0;
      let script: string = `
        getTypedArrayInfo(new Int32Array(3), ${ IS_JSVM_INT8_ARRAY })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0179
     * @tc.name JsvmTest179
     * @tc.desc JsvmTest
     */
    it('JsvmTest179', 0, function () {
      let IS_JSVM_INT8_ARRAY = 0;
      let script: string = `
        getTypedArrayInfo(new Float64Array(3), ${ IS_JSVM_INT8_ARRAY })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0180
     * @tc.name JsvmTest180
     * @tc.desc JsvmTest
     */
    it('JsvmTest180', 0, function () {
      let IS_JSVM_INT8_ARRAY = 0;
      let script: string = `
        getTypedArrayInfo(new BigInt64Array(3), ${ IS_JSVM_INT8_ARRAY })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0181
     * @tc.name JsvmTest181
     * @tc.desc JsvmTest
     */
    it('JsvmTest181', 0, function () {
      let LENGTH = 1;
      let script: string = `
        getTypedArrayInfo(new Int8Array(5), ${ LENGTH })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(5);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0182
     * @tc.name JsvmTest182
     * @tc.desc JsvmTest
     */
    it('JsvmTest182', 0, function () {
      let IS_BUFFER = 2;
      let script: string = `
        getTypedArrayInfo(new Int8Array(5), ${ IS_BUFFER })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0183
     * @tc.name JsvmTest183
     * @tc.desc JsvmTest
     */
    it('JsvmTest183', 0, function () {
      let IS_BUFFER = 2;
      let script: string = `
        getTypedArrayInfo(1, ${ IS_BUFFER })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0184
     * @tc.name JsvmTest184
     * @tc.desc JsvmTest
     */
    it('JsvmTest184', 0, function () {
      let IS_BUFFER = 2;
      let script: string = `
        getTypedArrayInfo(\'a\', ${ IS_BUFFER })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0185
     * @tc.name JsvmTest185
     * @tc.desc JsvmTest
     */
    it('JsvmTest185', 0, function () {
      let IS_BUFFER = 2;
      let script: string = `
        getTypedArrayInfo({}, ${ IS_BUFFER })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0186
     * @tc.name JsvmTest186
     * @tc.desc JsvmTest
     */
    it('JsvmTest186', 0, function () {
      let IS_BUFFER = 2;
      let script: string = `
        getTypedArrayInfo(\'中\', ${ IS_BUFFER })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0187
     * @tc.name JsvmTest187
     * @tc.desc JsvmTest
     */
    it('JsvmTest187', 0, function () {
      let BYTE_OFFSET = 3;
      let script: string = `
        getTypedArrayInfo(new Int8Array(1), ${ BYTE_OFFSET })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0188
     * @tc.name JsvmTest188
     * @tc.desc JsvmTest
     */
    it('JsvmTest188', 0, function () {
      let BYTE_LENGTGH = 0;
      let script: string = `
        createDataView(new ArrayBuffer(16), ${ BYTE_LENGTGH })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(12);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0189
     * @tc.name JsvmTest189
     * @tc.desc JsvmTest
     */
    it('JsvmTest189', 0, function () {
      let IS_ARRAYBUFFER = 1;
      let script: string = `
        createDataView(new ArrayBuffer(16), ${ IS_ARRAYBUFFER })
    `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0190
     * @tc.name JsvmTest190
     * @tc.desc JsvmTest
     */
    it('JsvmTest190', 0, function () {
      let IS_ARRAYBUFFER = 1;
      let script: string = `
        createDataView(new ArrayBuffer(16), ${ IS_ARRAYBUFFER })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0191
     * @tc.name JsvmTest191
     * @tc.desc JsvmTest
     */
    it('JsvmTest191', 0, function () {
      let BYTE_OFFSET = '2';
      let script: string = `
        createDataView(new ArrayBuffer(16), ${ BYTE_OFFSET })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(4);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0192
     * @tc.name JsvmTest192
     * @tc.desc JsvmTest
     */
    it('JsvmTest192', 0, function () {
      let BYTE_LENGTGH = 0;
      let script: string = `
        getDataViewInfo(new DataView(new Int8Array([2,5]).buffer), ${ BYTE_LENGTGH })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(2);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0193
     * @tc.name JsvmTest193
     * @tc.desc JsvmTest
     */
    it('JsvmTest193', 0, function () {
      let BYTE_LENGTGH = 0;
      let script: string = `
        getDataViewInfo(new DataView(new Int8Array([2,5,3]).buffer), ${ BYTE_LENGTGH })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(3);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0194
     * @tc.name JsvmTest194
     * @tc.desc JsvmTest
     */
    it('JsvmTest194', 0, function () {
      let data = 'new DataView(new Int8Array([2,5,3]).buffer)';
      let IS_ARRAYBUFFER = '1';
      let script: string = `
        getDataViewInfo(${ data }, ${ IS_ARRAYBUFFER })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0195
     * @tc.name JsvmTest195
     * @tc.desc JsvmTest
     */
    it('JsvmTest195', 0, function () {
      let data = `'a'`;
      let IS_ARRAYBUFFER = '1';
      let script: string = `
        getDataViewInfo(${ data }, ${ IS_ARRAYBUFFER })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0196
     * @tc.name JsvmTest196
     * @tc.desc JsvmTest
     */
    it('JsvmTest196', 0, function () {
      let data = `'中'`;
      let IS_ARRAYBUFFER = '1';
      let script: string = `
        getDataViewInfo(${ data }, ${ IS_ARRAYBUFFER })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0197
     * @tc.name JsvmTest197
     * @tc.desc JsvmTest
     */
    it('JsvmTest197', 0, function () {
      let data = 'new DataView(new Int8Array([2,5,3]).buffer)';
      let BYTE_OFFSET = '2';
      let script: string = `
        getDataViewInfo(${ data }, ${ BYTE_OFFSET })
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0198
     * @tc.name JsvmTest198
     * @tc.desc JsvmTest
     */
    it('JsvmTest198', 0, function () {
      let script: string = `
        getPrototype()
    `;
      let result: any = napitest.runJsVm(script);
      expect(result).assertEqual('set and get proto');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0199
     * @tc.name JsvmTest199
     * @tc.desc JsvmTest
     */
    it('JsvmTest199', 0, function () {
      let script: string = `
        getPrototype()
    `;
      let result: any = napitest.runJsVm(script);
      expect(typeof result).assertEqual('string');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0200
     * @tc.name JsvmTest200
     * @tc.desc JsvmTest
     */
    it('JsvmTest200', 0, function () {
      let script: string = `createReference();`;
      let result: any = napitest.runJsVm(script);
      expect(JSON.stringify(result)).assertEqual('{"name":"CreateReference"}');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0201
     * @tc.name JsvmTest201
     * @tc.desc JsvmTest
     */
    it('JsvmTest201', 0, function () {
      let script: string = `createReference();`;
      let result: any = napitest.runJsVm(script);
      expect(result.name).assertEqual('CreateReference');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0202
     * @tc.name JsvmTest202
     * @tc.desc JsvmTest
     */
    it('JsvmTest202', 0, function () {
      let script: string = `createReference();`;
      let result: any = napitest.runJsVm(script);
      expect(typeof result).assertEqual('object');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0203
     * @tc.name JsvmTest203
     * @tc.desc JsvmTest
     */
    it('JsvmTest203', 0, function () {
      let script: string = `useReference()`;
      let result: any = napitest.runJsVm(script);
      expect(typeof result).assertEqual('object');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0204
     * @tc.name JsvmTest204
     * @tc.desc JsvmTest
     */
    it('JsvmTest204', 0, function () {
      let script: string = `useReference()`;
      let result: any = napitest.runJsVm(script);
      expect(result.name).assertEqual('UseReference');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0205
     * @tc.name JsvmTest205
     * @tc.desc JsvmTest
     */
    it('JsvmTest205', 0, function () {
      let script: string = `useReference()`;
      let result: any = napitest.runJsVm(script);
      expect(JSON.stringify(result)).assertEqual('{"name":"UseReference"}');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0206
     * @tc.name JsvmTest206
     * @tc.desc JsvmTest
     */
    it('JsvmTest206', 0, function () {
      let script: string = `deleteReference()`;
      let result: any = napitest.runJsVm(script);
      expect(result).assertEqual('OH_JSVM_DeleteReference success');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0207
     * @tc.name JsvmTest207
     * @tc.desc JsvmTest
     */
    it('JsvmTest207', 0, function () {
      let script: string = `deleteReference()`;
      let result: any = napitest.runJsVm(script);
      expect(typeof result).assertEqual('string');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0208
     * @tc.name JsvmTest208
     * @tc.desc JsvmTest
     */
    it('JsvmTest208', 0, function () {
      let script: string = `escapableHandleScopeTest()`;
      let result: any = napitest.runJsVm(script);
      expect(typeof result).assertEqual('object');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0209
     * @tc.name JsvmTest209
     * @tc.desc JsvmTest
     */
    it('JsvmTest209', 0, function () {
      let script: string = `escapableHandleScopeTest()`;
      let result: any = napitest.runJsVm(script);
      expect(JSON.stringify(result)).assertEqual('{"name":"Test jsvm_escapable_handle_scope","id":"001"}');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0210
     * @tc.name JsvmTest210
     * @tc.desc JsvmTest
     */
    it('JsvmTest210', 0, function () {
      let script: string = `escapableHandleScopeTest()`;
      let result: any = napitest.runJsVm(script);
      expect(result.name).assertEqual('Test jsvm_escapable_handle_scope');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0211
     * @tc.name JsvmTest211
     * @tc.desc JsvmTest
     */
    it('JsvmTest211', 0, function () {
      let script: string = `escapableHandleScopeTest()`;
      let result: any = napitest.runJsVm(script);
      expect(result.id).assertEqual('001');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0212
     * @tc.name JsvmTest212
     * @tc.desc JsvmTest
     */
    it('JsvmTest212', 0, function () {
      let script: string = `handleScopeTest()`;
      let result: any = napitest.runJsVm(script);
      expect(JSON.stringify(result)).assertEqual('{"name":"test handleScope"}');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0213
     * @tc.name JsvmTest213
     * @tc.desc JsvmTest
     */
    it('JsvmTest213', 0, function () {
      let script: string = `handleScopeTest()`;
      let result: any = napitest.runJsVm(script);
      expect(result.name).assertEqual('test handleScope');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0214
     * @tc.name JsvmTest214
     * @tc.desc JsvmTest
     */
    it('JsvmTest214', 0, function () {
      let script: string = `handleScopeTest()`;
      let result: any = napitest.runJsVm(script);
      expect(typeof result).assertEqual('object');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0215
     * @tc.name JsvmTest215
     * @tc.desc JsvmTest
     */
    it('JsvmTest215', 0, function () {
      let script: string = `handleScope()`;
      let result: any = napitest.runJsVm(script);
      expect(typeof result).assertEqual('object');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0216
     * @tc.name JsvmTest216
     * @tc.desc JsvmTest
     */
    it('JsvmTest216', 0, function () {
      let obj = '{ data: 0, message: "hello world"}';
      let script: string = `
        getPropertyNames(${ obj })
    `;
      let result = napitest.runJsVm(script);
      expect(result.toString()).assertEqual('data,message');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0217
     * @tc.name JsvmTest217
     * @tc.desc JsvmTest
     */
    it('JsvmTest217', 0, function () {
      let arr = '["one", "two", "three", "four", "five"]';
      let script: string = `
        getPropertyNames(${ arr })
    `;
      let result = napitest.runJsVm(script);
      expect(result.toString()).assertEqual('0,1,2,3,4');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0218
     * @tc.name JsvmTest218
     * @tc.desc JsvmTest
     */
    it('JsvmTest218', 0, function () {
      let obj = '{ data: 0, message: "hello world", 50: 1}';
      let script: string = `
        getAllPropertyNames(${ obj })
    `;
      let result = napitest.runJsVm(script);
      expect(result.toString()).assertEqual('50,data,message');
    });

    let scriptGlobal: string = `
   function createNewObject() {
     const object = { __proto__: {
       inherited: 1,
     }
     };
     object.normal = 2;
     Object.defineProperty(object,
       'unenumerable',
       {
         value: 4,
         enumerable: false,
         writable: true,
         configurable: true,
       });
     Object.defineProperty(object,
       'writable',
       {
         value: 4,
         enumerable: true,
         writable: true,
         configurable: false,
       });
     Object.defineProperty(object,
       'configurable',
       {
         value: 4,
         enumerable: true,
         writable: false,
         configurable: true,
       });
     return object;
   }
 `;
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0219
     * @tc.name JsvmTest219
     * @tc.desc JsvmTest
     */
    it('JsvmTest219', 0, function () {
      let script: string = scriptGlobal + `\n` + `
        const testObject = createNewObject();
        getEnumerableNames(testObject)
    `;
      let result = napitest.runJsVm(script);
      expect(result.toString()).assertEqual('normal,writable,configurable,inherited');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0220
     * @tc.name JsvmTest220
     * @tc.desc JsvmTest
     */
    it('JsvmTest220', 0, function () {
      let script: string = scriptGlobal + `\n` + `
        const testObject = createNewObject();
        getOwnWritableNames(testObject)
    `;
      let result = napitest.runJsVm(script);
      expect(result.toString()).assertEqual('normal,unenumerable,writable');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0221
     * @tc.name JsvmTest221
     * @tc.desc JsvmTest
     */
    it('JsvmTest221', 0, function () {
      let script: string = scriptGlobal + `\n` + `
        const testObject = createNewObject();
        getEnumerableConfigurableNames(testObject)
    `;
      let result = napitest.runJsVm(script);
      expect(result.toString()).assertEqual('normal,configurable,inherited');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0222
     * @tc.name JsvmTest222
     * @tc.desc JsvmTest
     */
    it('JsvmTest222', 0, function () {
      let script: string = scriptGlobal + `\n` + `
        const testObject = createNewObject();
        getOwnConfigurableNames(testObject)
    `;
      let result = napitest.runJsVm(script);
      expect(result.toString()).assertEqual('normal,unenumerable,configurable');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0223
     * @tc.name JsvmTest223
     * @tc.desc JsvmTest
     */
    it('JsvmTest223', 0, function () {
      let script: string = `
       let obj = { data: 0, message: "hello world", 50: 1};
       jsvmSetProperty(obj, "code", "hi")
   `;
      let result = napitest.runJsVm(script);
      // @ts-ignore
      expect(result.code).assertEqual('hi');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0224
     * @tc.name JsvmTest224
     * @tc.desc JsvmTest
     */
    it('JsvmTest224', 0, function () {
      let script: string = `
       let obj = { data: 0, message: "hello world", 50: 1};
       jsvmSetProperty(obj, 50, 12)
   `;
      let result = napitest.runJsVm(script);
      // @ts-ignore
      expect(result[50]).assertEqual(12);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0225
     * @tc.name JsvmTest225
     * @tc.desc JsvmTest
     */
    it('JsvmTest225', 0, function () {
      let script: string = `
       let obj = { data: 0, message: "hello world", 50: 1};
       jsvmSetProperty(obj, "true", false)
   `;
      let result = napitest.runJsVm(script);
      // @ts-ignore
      expect(result.true).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0226
     * @tc.name JsvmTest226
     * @tc.desc JsvmTest
     */
    it('JsvmTest226', 0, function () {
      let script: string = `
       let obj = { data: 0, message: "hello world", 50: 1};
       let objTest = {};
       jsvmSetProperty(obj, "object", objTest)
   `;
      let result = napitest.runJsVm(script);
      // @ts-ignore
      expect(typeof result.object).assertEqual('object');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0227
     * @tc.name JsvmTest227
     * @tc.desc JsvmTest
     */
    it('JsvmTest227', 0, function () {
      let script: string = `
       setPropertyFailed()
   `;
      let result = napitest.runJsVm(script);
      const expectedObject = {
        nullptrEnv: 'Invalid argument',
        nullprtObject: 'Invalid argument',
        nullptrValue: 'Invalid argument',
      };
      expect(result.toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0228
     * @tc.name JsvmTest228
     * @tc.desc JsvmTest
     */
    it('JsvmTest228', 0, function () {
      let script: string = `
     let obj = { data: 0, message: "hello world", 50: 1};
     getProperty(obj, "message")
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('hello world');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0229
     * @tc.name JsvmTest229
     * @tc.desc JsvmTest
     */
    it('JsvmTest229', 0, function () {
      let script: string = `
     let obj = { data: 0, message: "hello world", 50: 1};
     getProperty(obj, "data")
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0230
     * @tc.name JsvmTest230
     * @tc.desc JsvmTest
     */
    it('JsvmTest230', 0, function () {
      let script: string = `
     let obj = { data: 0, message: "hello world", 50: true};
     getProperty(obj, 50)
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0231
     * @tc.name JsvmTest231
     * @tc.desc JsvmTest
     */
    it('JsvmTest231', 0, function () {
      let script: string = `
     let objTest = {};
     let obj = { data: 0, message: "hello world", 50: true, Object: objTest};
     getProperty(obj, "Object")
   `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('object');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0232
     * @tc.name JsvmTest232
     * @tc.desc JsvmTest
     */
    it('JsvmTest232', 0, function () {
      let script: string = `
     getPropertyFailed()
   `;
      let result = napitest.runJsVm(script);
      const expectedObject = {
        nullptrEnv: 'Invalid argument',
        nullprtObject: 'Invalid argument',
        nullptrResult: 'Invalid argument',
      };
      expect(result.toString()).assertEqual(expectedObject.toString());
    });

    let scriptProperty: string = `
   const fooSymbol = Symbol('foo');
   function createNewObject() {
     const object = { __proto__: {
       inherited: 1,
     }
     };
     object.normal = 2;
     object[fooSymbol] = 3;
     object[5] = 5;
     return object;
   }
 `;
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0233
     * @tc.name JsvmTest233
     * @tc.desc JsvmTest
     */
    it('JsvmTest233', 0, function () {
      let scriptTrue: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     hasProperty(testObject, "normal")
   `;
      let resultTrue = napitest.runJsVm(scriptTrue);
      expect(resultTrue).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0234
     * @tc.name JsvmTest234
     * @tc.desc JsvmTest
     */
    it('JsvmTest234', 0, function () {
      let scriptTrue: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     hasProperty(testObject, 5)
   `;
      let resultTrue = napitest.runJsVm(scriptTrue);
      expect(resultTrue).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0235
     * @tc.name JsvmTest235
     * @tc.desc JsvmTest
     */
    it('JsvmTest235', 0, function () {
      let scriptTrue: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     hasProperty(testObject, fooSymbol)
   `;
      let resultTrue = napitest.runJsVm(scriptTrue);
      expect(resultTrue).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0236
     * @tc.name JsvmTest236
     * @tc.desc JsvmTest
     */
    it('JsvmTest236', 0, function () {
      let scriptTrue: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     hasProperty(testObject, "inherited")
   `;
      let resultTrue = napitest.runJsVm(scriptTrue);
      expect(resultTrue).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0237
     * @tc.name JsvmTest237
     * @tc.desc JsvmTest
     */
    it('JsvmTest237', 0, function () {
      let scriptFalse: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     hasProperty(testObject, "otherProperty")
   `;
      let resultFalse = napitest.runJsVm(scriptFalse);
      expect(resultFalse).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0238
     * @tc.name JsvmTest238
     * @tc.desc JsvmTest
     */
    it('JsvmTest238', 0, function () {
      let script: string = `
     hasPropertyFailed()
   `;
      let result = napitest.runJsVm(script);
      const expectedObject = {
        nullptrEnv: 'Invalid argument',
        nullprtObject: 'Invalid argument',
        nullprtKey: 'Invalid argument',
        nullptrResult: 'Invalid argument',
      };
      expect(result.toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0239
     * @tc.name JsvmTest239
     * @tc.desc JsvmTest
     */
    it('JsvmTest239', 0, function () {
      let scriptTrue: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     deleteProperty(testObject, "normal")
   `;
      let resultTrue = napitest.runJsVm(scriptTrue);
      expect(resultTrue).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0240
     * @tc.name JsvmTest240
     * @tc.desc JsvmTest
     */
    it('JsvmTest240', 0, function () {
      let scriptTrue: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     deleteProperty(testObject, 5)
   `;
      let resultTrue = napitest.runJsVm(scriptTrue);
      expect(resultTrue).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0241
     * @tc.name JsvmTest241
     * @tc.desc JsvmTest
     */
    it('JsvmTest241', 0, function () {
      let scriptFalse: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     Object.defineProperty(testObject, "unconfigurable", {
       configurable: false
     });
     deleteProperty(testObject, "unconfigurable")
   `;
      let resultFalse = napitest.runJsVm(scriptFalse);
      expect(resultFalse).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0242
     * @tc.name JsvmTest242
     * @tc.desc JsvmTest
     */
    it('JsvmTest242', 0, function () {
      let scriptFalse: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     Object.freeze(testObject);
     deleteProperty(testObject, "normal")
   `;
      let resultFalse = napitest.runJsVm(scriptFalse);
      expect(resultFalse).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0243
     * @tc.name JsvmTest243
     * @tc.desc JsvmTest
     */
    it('JsvmTest243', 0, function () {
      let script: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     deleteProperty(testObject, "inherited");
     getPropertyNames(testObject)
   `;
      let result = napitest.runJsVm(script);
      expect(result.toString()).assertEqual('5,normal,inherited');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0244
     * @tc.name JsvmTest245
     * @tc.desc JsvmTest
     */
    it('JsvmTest245', 0, function () {
      let script: string = `
     deletePropertyFailed()
   `;
      let result = napitest.runJsVm(script);
      const expectedObject = {
        nullptrEnv: 'Invalid argument',
        nullprtObject: 'Invalid argument',
        nullprtKey: 'Invalid argument',
      };
      expect(result.toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0246
     * @tc.name JsvmTest246
     * @tc.desc JsvmTest
     */
    it('JsvmTest246', 0, function () {
      let script: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     hasOwnProperty(testObject, "normal")
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0247
     * @tc.name JsvmTest247
     * @tc.desc JsvmTest
     */
    it('JsvmTest247', 0, function () {
      let script: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     hasOwnProperty(testObject, "inherited")
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0248
     * @tc.name JsvmTest248
     * @tc.desc JsvmTest
     */
    it('JsvmTest248', 0, function () {
      let script: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     hasOwnProperty(testObject, fooSymbol)
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0249
     * @tc.name JsvmTest249
     * @tc.desc JsvmTest
     */
    it('JsvmTest249', 0, function () {
      let script: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     hasOwnProperty(testObject, 5)
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('name expected status.');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0250
     * @tc.name JsvmTest250
     * @tc.desc JsvmTest
     */
    it('JsvmTest250', 0, function () {
      let script: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     hasOwnProperty(testObject, '5')
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0251
     * @tc.name JsvmTest251
     * @tc.desc JsvmTest
     */
    it('JsvmTest251', 0, function () {
      let script: string = `
     hasOwnPropertyFailed()
   `;
      let result = napitest.runJsVm(script);
      const expectedObject = {
        nullptrEnv: 'Invalid argument',
        nullprtObject: 'Invalid argument',
        nullprtKey: 'Invalid argument',
        nullptrResult: 'Invalid argument',
      };
      expect(result.toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0252
     * @tc.name JsvmTest252
     * @tc.desc JsvmTest
     */
    it('JsvmTest252', 0, function () {
      let script: string = `
       setNamedPropertyCreateObject("message")
   `;
      let result = napitest.runJsVm(script);
      // @ts-ignore
      expect(result.message).assertEqual(1234);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0253
     * @tc.name JsvmTest253
     * @tc.desc JsvmTest
     */
    it('JsvmTest253', 0, function () {
      let script: string = `
       let obj = {};
       setNamedProperty(obj, "name", "strValue");
   `;
      let result = napitest.runJsVm(script);
      // @ts-ignore
      expect(result.name).assertEqual('strValue');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0254
     * @tc.name JsvmTest0254
     * @tc.desc JsvmTest
     */
    it('JsvmTest0254', 0, function () {
      let script: string = `
       let obj = {data: 0, message: "hello world"};
       setNamedProperty(obj, "message", "strValue");
   `;
      let result = napitest.runJsVm(script);
      // @ts-ignore
      expect(result.message).assertEqual('strValue');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0255
     * @tc.name JsvmTest0255
     * @tc.desc JsvmTest
     */
    it('JsvmTest0255', 0, function () {
      let script: string = `
       let obj = {data: 0, message: "hello world"};
       Object.freeze(obj);
       setNamedProperty(obj, "message", "strValue");
   `;
      let result = napitest.runJsVm(script);
      // @ts-ignore
      expect(result.message).not('strValue');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0256
     * @tc.name JsvmTest0256
     * @tc.desc JsvmTest
     */
    it('JsvmTest0256', 0, function () {
      let script: string = `
     setNamedPropertyFailed()
   `;
      let result = napitest.runJsVm(script);
      const expectedObject = {
        nullptrEnv: 'Invalid argument',
        nullprtObject: 'Invalid argument',
        nullprtKey: 'Invalid argument',
        nullptrResult: 'Invalid argument',
      };
      expect(result.toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0257
     * @tc.name JsvmTest0257
     * @tc.desc JsvmTest
     */
    it('JsvmTest0257', 0, function () {
      let script: string = `
     let obj = { data: 0, message: "hello world", 50: 1};
     getNamedProperty(obj, "message")
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('hello world');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0258
     * @tc.name JsvmTest0258
     * @tc.desc JsvmTest
     */
    it('JsvmTest0258', 0, function () {
      let script: string = `
     let obj = { data: 0, message: "hello world", 50: 1};
     getNamedProperty(obj, "data")
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0259
     * @tc.name JsvmTest0259
     * @tc.desc JsvmTest
     */
    it('JsvmTest0259', 0, function () {
      let script: string = `
     let obj = { data: 0, message: "hello world", 50: false};
     getNamedProperty(obj, "50")
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0260
     * @tc.name JsvmTest0260
     * @tc.desc JsvmTest
     */
    it('JsvmTest0260', 0, function () {
      let script: string = `
     let obj = { data: 0, message: "hello world", 50: false,
                 newObj: NewObj = {first: 12, second: "two"}};
     getNamedProperty(obj, "newObj")
   `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('object');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0261
     * @tc.name JsvmTest0261
     * @tc.desc JsvmTest
     */
    it('JsvmTest0261', 0, function () {
      let script: string = `
     getNamedPropertyFailed()
   `;
      let result = napitest.runJsVm(script);
      const expectedObject = {
        nullptrEnv: 'Invalid argument',
        nullprtObject: 'Invalid argument',
        nullprtKey: 'Invalid argument',
        nullptrResult: 'Invalid argument',
      };
      expect(result.toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0262
     * @tc.name JsvmTest0262
     * @tc.desc JsvmTest
     */
    it('JsvmTest0262', 0, function () {
      let script: string = `
     let obj = { str: "bar", num: 42, bol: true,
                 newObj: NewObj = {first: 12, second: "two"}};
     hasNamedProperty(obj, "str")
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0263
     * @tc.name JsvmTest0263
     * @tc.desc JsvmTest
     */
    it('JsvmTest0263', 0, function () {
      let script: string = `
     let obj = { str: "bar", num: 42, bol: true,
                 newObj: NewObj = {first: 12, second: "two"}};
     hasNamedProperty(obj, "newObj")
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0264
     * @tc.name JsvmTest0264
     * @tc.desc JsvmTest
     */
    it('JsvmTest0264', 0, function () {
      let script: string = `
     let obj = { str: "bar", num: 42, bol: true,
                 newObj: NewObj = {first: 12, second: "two"}};
     hasNamedProperty(obj, "first")
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0265
     * @tc.name JsvmTest0265
     * @tc.desc JsvmTest
     */
    it('JsvmTest0265', 0, function () {
      let script: string = `
     hasNamedPropertyFailed()
   `;
      let result = napitest.runJsVm(script);
      const expectedObject = {
        nullptrEnv: 'Invalid argument',
        nullprtObject: 'Invalid argument',
        nullprtKey: 'Invalid argument',
        nullptrResult: 'Invalid argument',
      };
      expect(result.toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0266
     * @tc.name JsvmTest0266
     * @tc.desc JsvmTest
     */
    it('JsvmTest0266', 0, function () {
      let script: string = `
       setElementWithLength(3)
   `;
      let result = napitest.runJsVm(script);
      expect(result.toString()).assertEqual('2,3,4');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0267
     * @tc.name JsvmTest267
     * @tc.desc JsvmTest
     */
    it('JsvmTest267', 0, function () {
      let script: string = `
     let arr = [];
     setElement(arr, 1, "Hello world!")
   `;
      let result = napitest.runJsVm(script);
      expect(result[1]).assertEqual('Hello world!');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0268
     * @tc.name JsvmTest268
     * @tc.desc JsvmTest
     */
    it('JsvmTest268', 0, function () {
      let script: string = `
     let arr = ["Hello world!", 10, true];
     setElement(arr, 1, "Hello world!")
   `;
      let result = napitest.runJsVm(script);
      expect(result[1]).assertEqual('Hello world!');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0269
     * @tc.name JsvmTest269
     * @tc.desc JsvmTest
     */
    it('JsvmTest269', 0, function () {
      let script: string = `
     setElementFailed()
   `;
      let result = napitest.runJsVm(script);
      const expectedObject = {
        nullptrEnv: 'Invalid argument',
        nullprtObject: 'Invalid argument',
        nullprtValue: 'Invalid argument',
      };
      expect(result.toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0270
     * @tc.name JsvmTest270
     * @tc.desc JsvmTest
     */
    it('JsvmTest270', 0, function () {
      let script: string = `
     let arr = [10, 'hello', null, true];
     getElement(arr, 0)
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(10);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0271
     * @tc.name JsvmTest271
     * @tc.desc JsvmTest
     */
    it('JsvmTest271', 0, function () {
      let script: string = `
     let arr = [10, 'hello', null, true];
     getElement(arr, 1)
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('hello');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0272
     * @tc.name JsvmTest272
     * @tc.desc JsvmTest
     */
    it('JsvmTest272', 0, function () {
      let script: string = `
     let arr = [10, 'hello', null, true];
     getElement(arr, 2)
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(null);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0273
     * @tc.name JsvmTest273
     * @tc.desc JsvmTest
     */
    it('JsvmTest273', 0, function () {
      let script: string = `
     let arr = [10, 'hello', null, true];
     getElement(arr, 3)
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0274
     * @tc.name JsvmTest274
     * @tc.desc JsvmTest
     */
    it('JsvmTest274', 0, function () {
      let script: string = `
     getElementFailed()
   `;
      let result = napitest.runJsVm(script);
      const expectedObject = {
        nullptrEnv: 'Invalid argument',
        nullprtObject: 'Invalid argument',
        nullprtValue: 'Invalid argument',
      };
      expect(result.toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0275
     * @tc.name JsvmTest275
     * @tc.desc JsvmTest
     */
    it('JsvmTest275', 0, function () {
      let scriptTrue: string = `
     let arr = [10, 'hello', null, true];
     hasElement(arr, 0)
   `;
      let resultTrue = napitest.runJsVm(scriptTrue);
      expect(resultTrue).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0276
     * @tc.name JsvmTest276
     * @tc.desc JsvmTest
     */
    it('JsvmTest276', 0, function () {
      let scriptFalse: string = `
     let arr = [10, 'hello', null, true];
     hasElement(arr, 4)
   `;
      let resultFalse = napitest.runJsVm(scriptFalse);
      expect(resultFalse).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0277
     * @tc.name JsvmTest277
     * @tc.desc JsvmTest
     */
    it('JsvmTest277', 0, function () {
      let scriptFalse: string = `
     let arr = [10, 'hello', , true];
     hasElement(arr, 2)
   `;
      let resultFalse = napitest.runJsVm(scriptFalse);
      expect(resultFalse).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0278
     * @tc.name JsvmTest278
     * @tc.desc JsvmTest
     */
    it('JsvmTest278', 0, function () {
      let script: string = `
     hasElementFailed()
   `;
      let result = napitest.runJsVm(script);
      const expectedObject = {
        nullptrEnv: 'Invalid argument',
        nullprtObject: 'Invalid argument',
        nullprtresult: 'Invalid argument',
      };
      expect(result.toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0279
     * @tc.name JsvmTest279
     * @tc.desc JsvmTest
     */
    it('JsvmTest279', 0, function () {
      let script: string = `
     let arr = [10, 'hello', null, true];
     deleteElement(arr, 0)
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0280
     * @tc.name JsvmTest280
     * @tc.desc JsvmTest
     */
    it('JsvmTest280', 0, function () {
      let script: string = `
     let arr = [10, 'hello', null, true];
     deleteElement(arr, 4)
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0281
     * @tc.name JsvmTest281
     * @tc.desc JsvmTest
     */
    it('JsvmTest281', 0, function () {
      let script: string = `
     let arr = [10, 'hello',  , true];
     deleteElement(arr, 2)
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0282
     * @tc.name JsvmTest282
     * @tc.desc JsvmTest
     */
    it('JsvmTest282', 0, function () {
      let script: string = `
     let arr = [10, 'hello', 'world', true];
     deleteElementAndCheck(arr, 1)
   `;
      let result = napitest.runJsVm(script);
      expect(result.toString()).assertEqual('10,,world,true');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0283
     * @tc.name JsvmTest283
     * @tc.desc JsvmTest
     */
    it('JsvmTest283', 0, function () {
      let script: string = `
     deleteElementFailed()
   `;
      let result = napitest.runJsVm(script);
      const expectedObject = {
        nullptrEnv: 'Invalid argument',
        nullprtObject: 'Invalid argument',
      };
      expect(result.toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0284
     * @tc.name JsvmTest284
     * @tc.desc JsvmTest
     */
    it('JsvmTest284', 0, function () {
      let scriptMethod: string = `
       let obj = {};
       defineMethodProperties(obj)
   `;
      let resultMethod = napitest.runJsVm(scriptMethod);
      expect(resultMethod).assertEqual(26);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0285
     * @tc.name JsvmTest285
     * @tc.desc JsvmTest
     */
    it('JsvmTest285', 0, function () {
      let scriptString: string = `
       let obj = {};
       defineStringProperties(obj)
   `;
      let resultString = napitest.runJsVm(scriptString);
      expect(resultString).assertEqual('Hello!');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0286
     * @tc.name JsvmTest286
     * @tc.desc JsvmTest
     */
    it('JsvmTest286', 0, function () {
      let scriptGetter: string = `
       let obj = {};
       defineGetterProperties(obj)
   `;
      let resultGetter = napitest.runJsVm(scriptGetter);
      expect(resultGetter).assertEqual('Hello world!');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0287
     * @tc.name JsvmTest287
     * @tc.desc JsvmTest
     */
    it('JsvmTest287', 0, function () {
      let script: string = `
     definePropertiesFailed()
   `;
      let result = napitest.runJsVm(script);
      const expectedObject = {
        nullptrEnv: 'Invalid argument',
        nullprtObject: 'Invalid argument',
        nullptrDescriptorList: 'Invalid argument',
        nullptrUtf8name: 'Invalid argument',
      };
      expect(result.toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0288
     * @tc.name JsvmTest288
     * @tc.desc JsvmTest
     */
    it('JsvmTest288', 0, function () {
      let script: string = `
     let obj = { data: 55, message: "hello world"};
     objectFreeze(obj)
   `;
      let result = napitest.runJsVm(script);
      // 输出后的对象还是之前的属性值并未修改、删除或增加
      const expectedObject = {
        data: 55,
        message: 'hello world',
      };
      expect(result.toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0289
     * @tc.name JsvmTest289
     * @tc.desc JsvmTest
     */
    it('JsvmTest289', 0, function () {
      let script: string = `
     let obj = { data: 55, message: "hello world"};
     objectSeal(obj)
   `;
      let result = napitest.runJsVm(script);
      // 封闭后的对象可以修改但不能删除和新增
      const expectedObject = {
        data: 12,
        message: 'hello world',
      };
      expect(result.toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0290
     * @tc.name JsvmTest290
     * @tc.desc JsvmTest
     */
    it('JsvmTest290', 0, function () {
      let script: string = `
     getVersion()
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(9);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0291
     * @tc.name JsvmTest291
     * @tc.desc JsvmTest
     */
    it('JsvmTest291', 0, function () {
      let script: string = `
       getVersionFailed()
   `;
      let result = napitest.runJsVm(script);
      const expectedObject = {
        nullptrEnv: 'Invalid argument',
        nullptrResult: 'Invalid argument',
      };
      expect(result.toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0292
     * @tc.name JsvmTest292
     * @tc.desc JsvmTest
     */
    it('JsvmTest292', 0, function () {
      let script: string = `
       getVMInfo()
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(1);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0293
     * @tc.name JsvmTest293
     * @tc.desc JsvmTest
     */
    it('JsvmTest293', 0, function () {
      let script: string = `
       jsonParseNumber()
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(10.555);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0294
     * @tc.name JsvmTest294
     * @tc.desc JsvmTest
     */
    it('JsvmTest294', 0, function () {
      let script: string = `
       jsonParseObject()
   `;
      let result = napitest.runJsVm(script);
      const expectedObject = {
        first: 'one',
        second: 'two',
      };
      expect(result.toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0295
     * @tc.name JsvmTest295
     * @tc.desc JsvmTest
     */
    it('JsvmTest295', 0, function () {
      let script: string = `
     let strTrue = "true";
     jsonParse(strTrue)
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0296
     * @tc.name JsvmTest296
     * @tc.desc JsvmTest
     */
    it('JsvmTest296', 0, function () {
      let script: string = `
     let strNull = "null"
     jsonParse(strNull)
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(null);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0297
     * @tc.name JsvmTest297
     * @tc.desc JsvmTest
     */
    it('JsvmTest297', 0, function () {
      let script: string = `
       jsonParseFailed()
   `;
      let result = napitest.runJsVm(script);
      const expectedObject = {
        nullptrEnv: 'Invalid argument',
        nullptrJsonString: 'Invalid argument',
      };
      expect(result.toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0298
     * @tc.name JsvmTest298
     * @tc.desc JsvmTest
     */
    it('JsvmTest298', 0, function () {
      let script: string = `
     let arr = [1, 2, 3, 4, 5];
     jsonStringify(arr)
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('[1,2,3,4,5]');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0299
     * @tc.name JsvmTest299
     * @tc.desc JsvmTest
     */
    it('JsvmTest299', 0, function () {
      let script: string = `
     let obj = {data: 0, message: "hello world"};
     jsonStringify(obj)
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('{"data":0,"message":"hello world"}');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0300
     * @tc.name JsvmTest300
     * @tc.desc JsvmTest
     */
    it('JsvmTest300', 0, function () {
      let script: string = `
     let obj = {data: 0, message: "hello world",
                innerObj: InnerObj = {info: 123}};
     jsonStringify(obj)
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('{"data":0,"message":"hello world","innerObj":{"info":123}}');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0301
     * @tc.name JsvmTest301
     * @tc.desc JsvmTest
     */
    it('JsvmTest301', 0, function () {
      let script: string = `
     let num = 12.003;
     jsonStringify(num)
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('12.003');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0302
     * @tc.name JsvmTest302
     * @tc.desc JsvmTest
     */
    it('JsvmTest302', 0, function () {
      let script: string = `
       jsonStringifyFailed()
   `;
      let result = napitest.runJsVm(script);
      const expectedObject = {
        nullptrEnv: 'Invalid argument',
        nullptrJsonObject: 'Invalid argument',
      };
      expect(result.toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0303
     * @tc.name JsvmTest303
     * @tc.desc JsvmTest
     */
    it('JsvmTest303', 0, function () {
      let script: string = `
       function returnNumber(){
           return 10;
       }
       callFunction(returnNumber)
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(10);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0304
     * @tc.name JsvmTest304
     * @tc.desc JsvmTest
     */
    it('JsvmTest304', 0, function () {
      let script: string = `
       function concatStr(a, b){
           return a + b;
       }
       callFunctionWithArg(concatStr)
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('Hello World!');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0305
     * @tc.name JsvmTest305
     * @tc.desc JsvmTest
     */
    it('JsvmTest305', 0, function () {
      let script: string = `
     let obj = {myMethod: function(arg1, arg2) {
         return arg1 + arg2;
       }}
     callFunctionWithObject(obj)
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(52);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0306
     * @tc.name JsvmTest306
     * @tc.desc JsvmTest
     */
    it('JsvmTest306', 0, function () {
      let script: string = `
       function returnNumber(){
           return 10;
       }
       callFunctionFailed(returnNumber)
   `;
      let result = napitest.runJsVm(script);
      const expectedObject = {
        nullptrEnv: 'Invalid argument',
        nullprtGlobal: 'Invalid argument',
        nullprtArgv: 'Invalid argument',
        nullptrFunc: 'Invalid argument',
      };
      expect(result.toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0307
     * @tc.name JsvmTest307
     * @tc.desc JsvmTest
     */
    it('JsvmTest307', 0, function () {
      let script: string = `
       createFunction()
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(7);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0308
     * @tc.name JsvmTest308
     * @tc.desc JsvmTest
     */
    it('JsvmTest308', 0, function () {
      let script: string = `
       createFunctionFailed()
   `;
      let result = napitest.runJsVm(script);
      const expectedObject = {
        nullptrEnv: 'Invalid argument',
        nullprtCD: 'Invalid argument',
        nullptrResult: 'Invalid argument',
      };
      expect(result.toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0309
     * @tc.name JsvmTest309
     * @tc.desc JsvmTest
     */
    it('JsvmTest309', 0, function () {
      let script: string = `
       getHeapStatistics()
   `;
      let numberOfNativeContexts = napitest.runJsVm(script);
      expect(numberOfNativeContexts).assertEqual(1);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0310
     * @tc.name JsvmTest310
     * @tc.desc JsvmTest
     */
    it('JsvmTest310', 0, function () {
      let script: string = `
       getVM()
   `;
      let result = napitest.runJsVm(script);
      expect(result).assertTrue();
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0311
     * @tc.name JsvmTest311
     * @tc.desc JsvmTest
     */
    it('JsvmTest311', 0, function () {
      let script: string = `
   getTypeof(1111);
     `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('number');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0312
     * @tc.name JsvmTest312
     * @tc.desc JsvmTest
     */
    it('JsvmTest312', 0, function () {
      let script: string = `
   getTypeof("1111");
     `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('string');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0313
     * @tc.name JsvmTest313
     * @tc.desc JsvmTest
     */
    it('JsvmTest313', 0, function () {
      let script: string = `
   getTypeof(true);
     `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0314
     * @tc.name JsvmTest314
     * @tc.desc JsvmTest
     */
    it('JsvmTest314', 0, function () {
      let script: string = `
   let obj = {
     data: 1
   }
   getTypeof(obj);
     `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('object');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0315
     * @tc.name JsvmTest315
     * @tc.desc JsvmTest
     */
    it('JsvmTest315', 0, function () {
      let script: string = `
   getTypeof(null);
     `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('null');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0316
     * @tc.name JsvmTest316
     * @tc.desc JsvmTest
     */
    it('JsvmTest316', 0, function () {
      let script: string = `
  class Person {
    name;
    age;
    constructor(name, age) {
      this.name = name;
      this.age = age;
    }
  }
 instanceOf(new Person('Alice', 30), Person);
 ;
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0317
     * @tc.name JsvmTest317
     * @tc.desc JsvmTest
     */
    it('JsvmTest317', 0, function () {
      let script: string = `
  class Person {
    name;
    age;
    constructor(name, age) {
      this.name = name;
      this.age = age;
    }
  }
  let obj = { data : 1 }
  instanceOf(obj, Person);
 ;
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0318
     * @tc.name JsvmTest318
     * @tc.desc JsvmTest
     */
    it('JsvmTest318', 0, function () {
      let script: string = `
 class Person {
  name;
  age;
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }
}
class Animal {
  type;
  constructor(type) {
    this.type = type;
  }
}
instanceOf(new Animal('Dog'), Person);
`;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0319
     * @tc.name JsvmTest319
     * @tc.desc JsvmTest
     */
    it('JsvmTest319', 0, function () {
      let script: string = `
class Person {
  name;
  age;
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }
}
let obj = {};
instanceOf(obj, Person);
`;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0320
     * @tc.name JsvmTest320
     * @tc.desc JsvmTest
     */
    it('JsvmTest320', 0, function () {
      let script: string = `
      class Person {
        name;
        age;
        constructor(name, age) {
          this.name = name;
          this.age = age;
        }
      }
      class Employee extends Person {
        job;
        constructor(name, age, job) {
          super(name, age);
          this.job = job;
        }
      }
      let obj = new Employee('Bob', 25, 'Engineer');
      instanceOf(obj, Person);
  `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0321
     * @tc.name JsvmTest321
     * @tc.desc JsvmTest
     */
    it('JsvmTest321', 0, function () {
      let data = '[1, 2, 3, 4, 5]';
      let script: string = `
         isArray(${ data })
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0322
     * @tc.name JsvmTest322
     * @tc.desc JsvmTest
     */
    it('JsvmTest322', 0, function () {
      let data = '2,3,4,5';
      let script: string = `
         isArray(${ data })
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0323
     * @tc.name JsvmTest323
     * @tc.desc JsvmTest
     */
    it('JsvmTest323', 0, function () {
      let script: string = `
          let data = [{
             data: 1
           }]
           isArray(data)
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0324
     * @tc.name JsvmTest324
     * @tc.desc JsvmTest
     */
    it('JsvmTest324', 0, function () {
      let script: string = `
          let data = []
           isArray(data)
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0325
     * @tc.name JsvmTest325
     * @tc.desc JsvmTest
     */
    it('JsvmTest325', 0, function () {
      let script: string = `
          let data = 'Hello';
          isArray(data);
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0326
     * @tc.name JsvmTest326
     * @tc.desc JsvmTest
     */
    it('JsvmTest326', 0, function () {
      let script: string = `
         isArrayBuffer(new ArrayBuffer(8))
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0327
     * @tc.name JsvmTest327
     * @tc.desc JsvmTest
     */
    it('JsvmTest327', 0, function () {
      let script: string = `
      isArrayBuffer('hello')
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0328
     * @tc.name JsvmTest328
     * @tc.desc JsvmTest
     */
    it('JsvmTest328', 0, function () {
      let script: string = `
      isArrayBuffer(new Uint8Array([1, 2, 3]).buffer)
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0329
     * @tc.name JsvmTest329
     * @tc.desc JsvmTest
     */
    it('JsvmTest329', 0, function () {
      let script: string = `
      isArrayBuffer(null)
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0330
     * @tc.name JsvmTest330
     * @tc.desc JsvmTest
     */
    it('JsvmTest330', 0, function () {
      let script: string = `
      isArrayBuffer({})
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0331
     * @tc.name JsvmTest331
     * @tc.desc JsvmTest
     */
    it('JsvmTest331', 0, function () {
      let script: string = `
         isTypedarray(new Uint16Array([1, 2, 3, 4]))
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0332
     * @tc.name JsvmTest332
     * @tc.desc JsvmTest
     */
    it('JsvmTest332', 0, function () {
      let script: string = `
         isTypedarray('hello')
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0333
     * @tc.name JsvmTest333
     * @tc.desc JsvmTest
     */
    it('JsvmTest333', 0, function () {
      let script: string = `
         isTypedarray(new Uint8Array([1, 2, 3]))
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0334
     * @tc.name JsvmTest334
     * @tc.desc JsvmTest
     */
    it('JsvmTest334', 0, function () {
      let script: string = `
         isTypedarray(null)
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0335
     * @tc.name JsvmTest335
     * @tc.desc JsvmTest
     */
    it('JsvmTest335', 0, function () {
      let script: string = `
        isTypedarray({})
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0336
     * @tc.name JsvmTest336
     * @tc.desc JsvmTest
     */
    it('JsvmTest336', 0, function () {
      let script: string = `
      let buffer = new ArrayBuffer(16);
      let dataView = new DataView(buffer);
      isDataView(dataView);
        `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0337
     * @tc.name JsvmTest337
     * @tc.desc JsvmTest
     */
    it('JsvmTest337', 0, function () {
      let script: string = `
    isDataView('hello')
  `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0338
     * @tc.name JsvmTest338
     * @tc.desc JsvmTest
     */
    it('JsvmTest338', 0, function () {
      let script: string = `
    let buffer = new ArrayBuffer(32);
    let dataView = new DataView(buffer, 8, 16);
    isDataView(dataView);
  `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0339
     * @tc.name JsvmTest339
     * @tc.desc JsvmTest
     */
    it('JsvmTest339', 0, function () {
      let script: string = `
    isDataView(null)
  `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0340
     * @tc.name JsvmTest340
     * @tc.desc JsvmTest
     */
    it('JsvmTest340', 0, function () {
      let script: string = `
    isDataView({})
  `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0341
     * @tc.name JsvmTest341
     * @tc.desc JsvmTest
     */
    it('JsvmTest341', 0, function () {
      let script: string = `
      let str = '123';
      let num = 123;
      isStrictEquals(str,num);
        `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0342
     * @tc.name JsvmTest342
     * @tc.desc JsvmTest
     */
    it('JsvmTest342', 0, function () {
      let script: string = `
      let str = 'hello';
      let testStr = 'hello';
      isStrictEquals(str, testStr);
  `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0343
     * @tc.name JsvmTest343
     * @tc.desc JsvmTest
     */
    it('JsvmTest343', 0, function () {
      let script: string = `
      let str = 'hello';
      let testStr = 'hell';
      isStrictEquals(str, testStr);
  `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0344
     * @tc.name JsvmTest344
     * @tc.desc JsvmTest
     */
    it('JsvmTest344', 0, function () {
      let script: string = `
      let testNum = 123;
      let num = 123;
      isStrictEquals(num,testNum);
        `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0345
     * @tc.name JsvmTest345
     * @tc.desc JsvmTest
     */
    it('JsvmTest345', 0, function () {
      let script: string = `
        let obj = {
            data: 1
        };
        let testObj = obj
        isStrictEquals(obj, testObj);
    `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0346
     * @tc.name JsvmTest346
     * @tc.desc JsvmTest
     */
    it('JsvmTest346', 0, function () {
      let script: string = `
          let arrayBuffer = new ArrayBuffer(10);
          isDetachedArraybuffer(arrayBuffer);
        `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0347
     * @tc.name JsvmTest347
     * @tc.desc JsvmTest
     */
    it('JsvmTest347', 0, function () {
      let script: string = `
          let arrayBuffer = new ArrayBuffer(10);
          isDetachedArraybuffer(isDetachedArraybuffer(arrayBuffer));
        `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0348
     * @tc.name JsvmTest348
     * @tc.desc JsvmTest
     */
    it('JsvmTest348', 0, function () {
      let script: string = `
           coerceToNumber(true)
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(1);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0349
     * @tc.name JsvmTest349
     * @tc.desc JsvmTest
     */
    it('JsvmTest349', 0, function () {
      let script: string = `
           coerceToNumber(false)
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0350
     * @tc.name JsvmTest350
     * @tc.desc JsvmTest
     */
    it('JsvmTest350', 0, function () {
      let data = '123';
      let script: string = `
           coerceToNumber(${ data })
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(123);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0351
     * @tc.name JsvmTest351
     * @tc.desc JsvmTest
     */
    it('JsvmTest351', 0, function () {
      let obj = `{ data : 1}`;
      let script: string = `
           coerceToNumber(${ obj })
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0352
     * @tc.name JsvmTest352
     * @tc.desc JsvmTest
     */
    it('JsvmTest352', 0, function () {
      let script: string = `
           coerceToNumber('sss')
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0353
     * @tc.name JsvmTest353
     * @tc.desc JsvmTest
     */
    it('JsvmTest353', 0, function () {
      let script: string = `
           coerceToObject("dad")
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0354
     * @tc.name JsvmTest354
     * @tc.desc JsvmTest
     */
    it('JsvmTest354', 0, function () {
      let script: string = `
           coerceToObject(11111111)
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0355
     * @tc.name JsvmTest355
     * @tc.desc JsvmTest
     */
    it('JsvmTest355', 0, function () {
      let script: string = `
           coerceToObject(true)
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0356
     * @tc.name JsvmTest356
     * @tc.desc JsvmTest
     */
    it('JsvmTest356', 0, function () {
      let script: string = `
           coerceToString(22222)
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('22222');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0357
     * @tc.name JsvmTest357
     * @tc.desc JsvmTest
     */
    it('JsvmTest357', 0, function () {
      let script: string = `
           coerceToString(true)
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('true');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0358
     * @tc.name JsvmTest358
     * @tc.desc JsvmTest
     */
    it('JsvmTest358', 0, function () {
      let script: string = `
        let obj = {
             data: 1
            }
        coerceToString(obj)
       `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('string');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0359
     * @tc.name JsvmTest359
     * @tc.desc JsvmTest
     */
    it('JsvmTest359', 0, function () {
      let script: string = `
        coerceToString(undefined)
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('undefined');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0360
     * @tc.name JsvmTest360
     * @tc.desc JsvmTest
     */
    it('JsvmTest360', 0, function () {
      let script: string = `
        coerceToString(null)
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('null');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0361
     * @tc.name JsvmTest361
     * @tc.desc JsvmTest
     */
    it('JsvmTest361', 0, function () {
      let script: string = `
           coerceToBool("123")
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0362
     * @tc.name JsvmTest362
     * @tc.desc JsvmTest
     */
    it('JsvmTest362', 0, function () {
      let script: string = `
           coerceToBool(0)
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0363
     * @tc.name JsvmTest363
     * @tc.desc JsvmTest
     */
    it('JsvmTest363', 0, function () {
      let script: string = `
           coerceToBool("true")
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0364
     * @tc.name JsvmTest364
     * @tc.desc JsvmTest
     */
    it('JsvmTest364', 0, function () {
      let script: string = `
           coerceToBool("")
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0365
     * @tc.name JsvmTest365
     * @tc.desc JsvmTest
     */
    it('JsvmTest365', 0, function () {
      let script: string = `
           let obj = { value:1 }
           coerceToBool(obj)
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0366
     * @tc.name JsvmTest366
     * @tc.desc JsvmTest
     */
    it('JsvmTest366', 0, function () {
      let script: string = `
          let value = Promise.resolve();
          isPromise(value);
        `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0367
     * @tc.name JsvmTest367
     * @tc.desc JsvmTest
     */
    it('JsvmTest367', 0, function () {
      let script: string = `
          let value = Promise.resolve();
          isPromise(value);
        `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0368
     * @tc.name JsvmTest368
     * @tc.desc JsvmTest
     */
    it('JsvmTest368', 0, function () {
      let script: string = `
          let value = 111;
          isPromise(value);
        `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0369
     * @tc.name JsvmTest369
     * @tc.desc JsvmTest
     */
    it('JsvmTest369', 0, function () {
      let script: string = `
          let value = 111;
          isPromise(value);
        `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0370
     * @tc.name JsvmTest370
     * @tc.desc JsvmTest
     */
    it('JsvmTest370', 0, function () {
      let script: string = `
          let value = Promise.reject();
          isPromise(value);
        `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0371
     * @tc.name JsvmTest371
     * @tc.desc JsvmTest
     */
    it('JsvmTest371', 0, function () {
      let script: string = `
          createPromise();
        `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0372
     * @tc.name JsvmTest372
     * @tc.desc JsvmTest
     */
    it('JsvmTest372', 0, function () {
      let script: string = `
          createPromise();
        `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0373
     * @tc.name JsvmTest373
     * @tc.desc JsvmTest
     */
    it('JsvmTest373', 0, function () {
      let script: string = `
         resolveRejectDeferred('success','fail', true)
        `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0374
     * @tc.name JsvmTest374
     * @tc.desc JsvmTest
     */
    it('JsvmTest374', 0, function () {
      let script: string = `
         resolveRejectDeferred('success','fail', true)
        `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0375
     * @tc.name JsvmTest375
     * @tc.desc JsvmTest
     */
    it('JsvmTest375', 0, function () {
      let script: string = `
         const str = 'message';
         getCbArgs(str);
        `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('message');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0376
     * @tc.name JsvmTest376
     * @tc.desc JsvmTest
     */
    it('JsvmTest376', 0, function () {
      let script: string = `
         const str = 'message';
         getCbArgs(str);
        `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('string');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0377
     * @tc.name JsvmTest377
     * @tc.desc JsvmTest
     */
    it('JsvmTest377', 0, function () {
      let script: string = `
         function Fruit(name) {
             this.name = name;
         }
         newInstance(Fruit, "apple");
        `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('object');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0378
     * @tc.name JsvmTest378
     * @tc.desc JsvmTest
     */
    it('JsvmTest378', 0, function () {
      let script: string = `
         function Fruit(name) {
             this.name = name;
         }
         newInstance(Fruit, "apple");
        `;
      let result: any = napitest.runJsVm(script);
      expect(result.name).assertEqual('apple');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0379
     * @tc.name JsvmTest379
     * @tc.desc JsvmTest
     */
    it('JsvmTest379', 0, function () {
      let script: string = `
         class Obj {
           data;
           message;
         }
         let obj= { data: 0, message: "hello world"};
         setTypeTagToObject(obj, 0)
       `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0380
     * @tc.name JsvmTest380
     * @tc.desc JsvmTest
     */
    it('JsvmTest380', 0, function () {
      let script: string = `
         class Obj {
           data;
           message;
         }
         let obj= { data: 0, message: "hello world"};
         setTypeTagToObject(obj, 0)
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0381
     * @tc.name JsvmTest381
     * @tc.desc JsvmTest
     */
    it('JsvmTest381', 0, function () {
      let script: string = `
         class Obj {
           data;
           message;
         }
         let obj= { data: 0, message: "hello world"};
         setTypeTagToObject(obj,0)
         checkObjectTypeTag(obj,0);
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0382
     * @tc.name JsvmTest382
     * @tc.desc JsvmTest
     */
    it('JsvmTest382', 0, function () {
      let script: string = `
         class Obj {
           data;
           message;
         }
         let obj= { data: 0, message: "hello world"};
         setTypeTagToObject(obj,0)
         checkObjectTypeTag(obj,0);
       `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0383
     * @tc.name JsvmTest383
     * @tc.desc JsvmTest
     */
    it('JsvmTest383', 0, function () {
      let script: string = `
         adjustExternalMemory()
        `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0384
     * @tc.name JsvmTest384
     * @tc.desc JsvmTest
     */
    it('JsvmTest384', 0, function () {
      let script: string = `
         adjustExternalMemory()
        `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0385
     * @tc.name JsvmTest385
     * @tc.desc JsvmTest
     */
    it('JsvmTest385', 0, function () {
      let script: string = `
         memoryPressureNotification();
        `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0386
     * @tc.name JsvmTest386
     * @tc.desc JsvmTest
     */
    it('JsvmTest386', 0, function () {
      let script: string = `
         memoryPressureNotification();
        `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('number');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0387
     * @tc.name JsvmTest387
     * @tc.desc JsvmTest
     */
    it('JsvmTest387', 0, function () {
      class Obj {
      }

      let obj: Obj = `{}`;
      let script: string = `
        wrapObject(${ obj });
        `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0388
     * @tc.name JsvmTest388
     * @tc.desc JsvmTest
     */
    it('JsvmTest388', 0, function () {
      class Obj {
      }

      let obj: Obj = `{}`;
      let script: string = `
        wrapObject(${ obj });
        `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0389
     * @tc.name JsvmTest389
     * @tc.desc JsvmTest
     */
    it('JsvmTest389', 0, function () {
      class Obj {
      }

      let obj: Obj = `{}`;
      let script: string = `
        removeWrap(${ obj });
        `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0390
     * @tc.name JsvmTest390
     * @tc.desc JsvmTest
     */
    it('JsvmTest390', 0, function () {
      class Obj {
      }

      let obj: Obj = `{}`;
      let script: string = `
        removeWrap(${ obj });
        `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0391
     * @tc.name JsvmTest391
     * @tc.desc JsvmTest
     */
    it('JsvmTest391', 0, function () {
      let script: string = `handleScopeFor()`;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0392
     * @tc.name JsvmTest392
     * @tc.desc JsvmTest
     */
    it('JsvmTest392', 0, function () {
      let result = napitest.runJsVm('defineClass');
      // @ts-ignore
      expect(JSON.parse(result).name).assertEqual('lilei');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0393
     * @tc.name JsvmTest393
     * @tc.desc JsvmTest
     */
    it('JsvmTest393', 0, function () {
      let result = napitest.runJsVm('defineClass');
      expect(typeof result).assertEqual('string');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0394
     * @tc.name JsvmTest394
     * @tc.desc JsvmTest
     */
    it('JsvmTest394', 0, function () {
      let script: string = `
          createSnapshotFailed()
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('generic failure status.');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0395
     * @tc.name JsvmTest395
     * @tc.desc JsvmTest
     */
    it('JsvmTest395', 0, function () {
      let script: string = `
          createSnapshotFailed()
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('generic failure status.');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0396
     * @tc.name JsvmTest396
     * @tc.desc JsvmTest
     */
    it('JsvmTest396', 0, function () {
      let script: string = `
          debugCodeUsingCpuProfiler()
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0397
     * @tc.name JsvmTest397
     * @tc.desc JsvmTest
     */
    it('JsvmTest397', 0, function () {
      let script: string = `
          takeHeapSnapshot()
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0398
     * @tc.name JsvmTest398
     * @tc.desc JsvmTest
     */
    it('JsvmTest398', 0, function () {
      let script: string = `
          debugCodeUsingInspector()
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0399
     * @tc.name JsvmTest399
     * @tc.desc JsvmTest
     */
    it('JsvmTest399', 0, function () {
      let script: string = `
          waitForDebuggerFailed()
      `;
      let result = napitest.runJsVm(script);
      const expectedObject = {
        nullptrEnv: 'Invalid argument',
        notConnected: 'JSVM_status::JSVM_OK',
      };
      expect(result.toString()).assertEqual(expectedObject.toString());
    });
	/**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0400
     * @tc.name      JsvmTest400
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0400', 0, async function (done) {
      try {
        let script: string = `
            jsVmThrow();
        `;
        let value = napitest.runJsVm(script);
        expect(true).assertEqual(false);
      } catch (e) {
        expect(true).assertEqual(true);
      }
      done();
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0401
     * @tc.name JsvmTest401
     * @tc.desc JsvmTest
     */
    it('JsvmTest0401', 0, async function (done) {
      let script: string = `
            jsVmThrowFromJS(Error());
       `;
      try {
        napitest.runJsVm(script);
        expect(true).assertFalse();
      } catch (error) {
        expect(true).assertTrue();
      }
      done();
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0402
     * @tc.name JsvmTest0402
     * @tc.desc JsvmTest
     */
    it('JsvmTest0402', 0, async function (done) {
      let script: string = `
            jsVmThrowError()
       `;
      try {
        napitest.runJsVm(script);
        expect(true).assertFalse();
      } catch (e) {
        expect(true).assertTrue();
      }
      done();
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0403
     * @tc.name JsvmTest0403
     * @tc.desc JsvmTest
     */
    it('JsvmTest0403', 0, async function (done) {
      let errMessage = `\"has Error\"`;
      let script: string =
        `
            jsVmThrowError(${ errMessage })
       `;
      try {
        napitest.runJsVm(script);
        expect(false).assertTrue();
      } catch (e) {
        expect(e.message).assertEqual('has Error');
      }
      done();
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0404
     * @tc.name JsvmTest0404
     * @tc.desc JsvmTest
     */
    it('JsvmTest0404', 0, async function (done) {
      let script: string =
        `
            jsVmThrowTypeError()
       `;
      try {
        napitest.runJsVm(script);
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
      done();
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0405
     * @tc.name JsvmTest0405
     * @tc.desc JsvmTest
     */
    it('JsvmTest0405', 0, async function (done) {
      let errMessage = `\"has Type Error\"`;
      let script: string =
        `
            jsVmThrowTypeError(${ errMessage })
       `;
      try {
        napitest.runJsVm(script);
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
      done();
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0406
     * @tc.name JsvmTest0406
     * @tc.desc JsvmTest
     */
    it('JsvmTest0406', 0, async function (done) {
      let script: string =
        `
            jsVmThrowRangeError(1)
       `;
      try {
        napitest.runJsVm(script);
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof RangeError).assertTrue();
      }
      done();
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0407
     * @tc.name JsvmTest0407
     * @tc.desc JsvmTest
     */
    it('JsvmTest0407', 0, async function (done) {
      let script: string =
        `
            jsVmThrowSyntaxError()
       `;
      try {
        napitest.runJsVm(script);
        expect(false).assertTrue();
      } catch (e) {
        expect(e.message).assertEqual('throw syntax error');
      }
      done();
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0408
     * @tc.name JsvmTest0408
     * @tc.desc JsvmTest
     */
    it('JsvmTest0408', 0, async function (done) {
      let script: string =
        `
            jsVmIsError(Error())
       `;
      const isError = napitest.runJsVm(script);
      expect(isError).assertTrue();
      done();
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0409
     * @tc.name JsvmTest0409
     * @tc.desc JsvmTest
     */
    it('JsvmTest0409', 0, async function (done) {
      let script: string =
        `
            jsVmIsError("2333")
       `;
      const isError = napitest.runJsVm(script);
      expect(isError).assertFalse();
      done();
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0410
     * @tc.name JsvmTest0410
     * @tc.desc JsvmTest
     */
    it('JsvmTest0410', 0, async function (done) {
      let script: string =
        `
           let error = jsVmCreateError()
           error instanceof Error;
       `;
      let res = napitest.runJsVm(script);
      expect(res).assertTrue();
      done();
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0411
     * @tc.name JsvmTest0411
     * @tc.desc JsvmTest
     */
    it('JsvmTest0411', 0, async function (done) {
      let script: string =
        `
            let error = jsVmCreateTypeError()
           error instanceof TypeError;
       `;
      let res = napitest.runJsVm(script);
      expect(res).assertTrue();
      done();
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0412
     * @tc.name JsvmTest0412
     * @tc.desc JsvmTest
     */
    it('JsvmTest0412', 0, async function (done) {
      let script: string =
        `
            let error = jsVmCreateRangeError()
            error instanceof RangeError;
       `;
      let res = napitest.runJsVm(script);
      expect(res).assertTrue();
      done();
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0413
     * @tc.name JsvmTest0413
     * @tc.desc JsvmTest
     */
    it('JsvmTest0413', 0, async function (done) {
      let script: string =
        `
             let error = jsVmCreateSyntaxError()
             error instanceof SyntaxError;
       `;
      let res = napitest.runJsVm(script);
      expect(res).assertTrue();
      done();
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0414
     * @tc.name JsvmTest0414
     * @tc.desc JsvmTest
     */
    it('JsvmTest0414', 0, async function (done) {
      let script: string = `
          jsVmGetAndClearLastException().message
      `;
      let res = napitest.runJsVm(script);
      expect(res).assertEqual('OH_JSVM_ThrowError');
      done();
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0415
     * @tc.name JsvmTest0415
     * @tc.desc JsvmTest
     */
    it('JsvmTest0415', 0, async function (done) {
      let script: string = `
          jsVmIsExceptionPending().message
      `;
      let res = napitest.runJsVm(script);
      expect(res).assertEqual('OH_JSVM_ThrowError');
      done();
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0416
     * @tc.name JsvmTest0416
     * @tc.desc JsvmTest
     */
    it('JsvmTest0416', 0, async function (done) {
      let script: string =`
          jsVmGetLastErrorInfo()
      `;
      let errorinfo = napitest.runJsVm(script);
      expect(errorinfo).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0417
     * @tc.name      JsvmTest0417
     * @tc.desc      Test the functions of the OH_JSVM_SetInstanceData interfaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0417', 0, async function (done) {
      let script: string = `
          setInstanceData(1)
      `;
      let setRes = napitest.runJsVm(script);
      expect(setRes).assertEqual(true);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0418
     * @tc.name      JsvmTest0418
     * @tc.desc      Test the functions of the OH_JSVM_GetInstanceData interfaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
	it('JsvmTest0418', 0, async function (done) {
      let script: string = `
          getInstanceData()
      `;
      let setRes = napitest.runJsVm(script);
      expect(setRes).assertEqual(true);
      done();
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0419
     * @tc.name JsvmTest0419
     * @tc.desc JsvmTest
     */
    it('JsvmTest0419', 0, function () {
      let data = '[0, 1, 2, 3, 4, 5]';
      let script: string = `
          getArrayLength(${data})
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(6);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0420
     * @tc.name JsvmTest0420
     * @tc.desc JsvmTest
     */
    it('JsvmTest0420', 0, function () {
      let data = '[]';
      let script: string = `
          getArrayLength(${data})
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0421
     * @tc.name JsvmTest0421
     * @tc.desc JsvmTest
     */
    it('JsvmTest0421', 0, function () {
      let data = '1';
      let script: string = `
          getArrayLength(${data})
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0422
     * @tc.name JsvmTest0422
     * @tc.desc JsvmTest
     */
    it('JsvmTest0422', 0, function () {
      let data = `'a'`;
      let script: string = `
          getArrayLength(${data})
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0423
     * @tc.name JsvmTest0423
     * @tc.desc JsvmTest
     */
    it('JsvmTest0423', 0, function () {
      let data = `'中'`;
      let script: string = `
          getArrayLength(${data})
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0424
     * @tc.name JsvmTest0424
     * @tc.desc JsvmTest
     */
    it('JsvmTest0424', 0, function () {
      let data = `'￥%……&*'`;
      let script: string = `
          getArrayLength(${data})
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0425
     * @tc.name JsvmTest0425
     * @tc.desc JsvmTest
     */
    it("JsvmTest0425", 0, function () {
      let script: string = `
          isDate(new Date())
       `
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0426
     * @tc.name JsvmTest0426
     * @tc.desc JsvmTest
     */
    it("JsvmTest0426", 0, function () {
      let script: string = `
          isDate('2024-04-16T12:00:00')
       `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0427
     * @tc.name JsvmTest0427
     * @tc.desc JsvmTest
     */
    it("JsvmTest0427", 0, function () {
      let script: string = `
          isDate(1649942400000)
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0428
     * @tc.name JsvmTest0428
     * @tc.desc JsvmTest
     */
    it("JsvmTest0428", 0, function () {
      let script: string = `
          isDate('Invalid Date')
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0429
     * @tc.name JsvmTest0429
     * @tc.desc JsvmTest
     */
    it("JsvmTest0429", 0, function () {
      let script: string = `
          isDate({})
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0430
     * @tc.name JsvmTest0430
     * @tc.desc JsvmTest
     */
    it('JsvmTest0430', 0, async function (done) {
      let script: string = `
        createStringUtf8()
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual('你好, World!, successes to create UTF-8 string!');
      done();
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0431
     * @tc.name JsvmTest0431
     * @tc.desc JsvmTest
     */
    it('JsvmTest0431', 0, function () {
      let script: string = `
        createStringUtf8(45)
      `;
      let result = napitest.runJsVm(script);
      expect(result.length).assertEqual(45);
    });
	 /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0432
     * @tc.name JsvmTest0432
     * @tc.desc JsvmTest
     */
    it('JsvmTest0432', 0, function () {
      let script: string = `
        createStringUtf8()
      `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('string');
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0433
     * @tc.name      JsvmTest0433
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0433', 0, async function (done) {
      console.info('JsvmTest0433 START');
      value = napitest.testValueOperation5()
      console.info('JsvmTest0433 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0434
     * @tc.name      JsvmTest0434
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0434', 0, async function (done) {
        let rst = napitest.testIsCallable();
        console.info('JsvmTest0434 testString result is:' + JSON.stringify(rst));
        expect(rst).assertEqual(0);
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0435
     * @tc.name      JsvmTest0435
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0435', 0, async function (done) {
        let rst = napitest.testHandleMicrotasks();
        console.info('JsvmTest0435 testString result is:' + JSON.stringify(rst));
        expect(rst).assertEqual(true);
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0436
     * @tc.name      JsvmTest0436
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0436', 0, async function (done) {
        let rst = napitest.testMultithreadFunction();
        console.info('JsvmTest0436 testString result is:' + JSON.stringify(rst));
        expect(rst).assertEqual(1);
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0437
     * @tc.name      JsvmTest0437
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0437', 0, async function (done) {
        let rst = napitest.testJswmInterface();
        console.info('JsvmTest0437 testString result is:' + JSON.stringify(rst));
        expect(rst).assertEqual(true);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0438
     * @tc.name      JsvmTest0438
     * @tc.desc      JsvmTest
     */
     it('JsvmTest0438', 0, function () {
      let script: string = `
        var f = () => console.log('no constructable');
        isConstructor(f);
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0439
     * @tc.name      JsvmTest0439
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0439', 0, function () {
      let script: string = `
        isConstructor((function(){}));
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0440
     * @tc.name      JsvmTest0440
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0440', 0, async function (done) {
      console.info('JsvmTest0440 START');
      value = napitest.testValueOperation6()
      console.info('JsvmTest0440 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0441
     * @tc.name      JsvmTest0441
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0441', 0, async function (done) {
      console.info('JsvmTest0441 START');
      value = napitest.testValueOperation7()
      console.info('JsvmTest0441 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0442
     * @tc.name      JsvmTest0442
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0442', 0, function () {
      let script: string = `
        createRegExp1("ab+c").toString();
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual("/ab+c/i");
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0443
     * @tc.name      JsvmTest0443
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0443', 0, function () {
      let script: string = `
        createRegExp2("[bc]at").toString();
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual("/[bc]at/g");
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0444
     * @tc.name      JsvmTest0444
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0444', 0, function () {
      let script: string = `
        createRegExp3("d{3}-d{2}-d{4}").toString();
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual("/d{3}-d{2}-d{4}/m");
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0445
     * @tc.name      JsvmTest0445
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0445', 0, function () {
      let script: string = `
        createRegExp4(".at").toString();
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual("/.at/y");
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0446
     * @tc.name      JsvmTest0446
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0446', 0, function () {
      let script: string = `
        createRegExp5("(.)hort").toString();
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual("/(.)hort/s");
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0447
     * @tc.name      JsvmTest0447
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0447', 0, function () {
      let script: string = `
        createRegExp1("ab+c").global.toString();
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual("false");
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0448
     * @tc.name      JsvmTest0448
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0448', 0, function () {
      let script: string = `
        createRegExp1("ab+c").ignoreCase.toString();
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual("true");
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0449
     * @tc.name      JsvmTest0449
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0449', 0, function () {
      let script: string = `
        Object.prototype.toString.call(createRegExp1("ab+c"));
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual("[object RegExp]");
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0450
     * @tc.name      JsvmTest0450
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0450', 0, function () {
      let script: string = `
        createRegExpEnvNullptr("ab+c").toString();
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual("1");
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0451
     * @tc.name      JsvmTest0451
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0451', 0, async function (done) {
      console.info('JsvmTest0451 START');
      value = napitest.testValueOperation8()
      console.info('JsvmTest0451 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0452
     * @tc.name JsvmTest0452
     * @tc.desc JsvmTest
     */
    it('JsvmTest0452', 0, function () {
      let script: string = `
        let add1 = createFunctionWithScript(\"add\", [\"a\", \"b\"], \"return a + b\")
        let add2 = createFunctionWithScript(\"add\", [\"a\", \"b\"], \"return (a + b) * 2\")
        let mul = createFunctionWithScript(\"class\", [\"c\", \"d\"], \"return c * d\")
        let res1 = add1(3, 4)
        let res2 = add2(2, 3)
        mul(res1, res2);
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(70);
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0453
     * @tc.name JsvmTest0453
     * @tc.desc JsvmTest
     */
    it('JsvmTest0453', 0, function () {
      let script: string = `
        let emptyFunc = createFunctionWithScript(\"add\", [\"a\"], \"\")
        emptyFunc(3)
      `;
      let result = napitest.runJsVm(script);
      expect(typeof result).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0454
     * @tc.name JsvmTest0454
     * @tc.desc JsvmTest
     */
    it('JsvmTest0454', 0, function () {
      let script: string = `
        let func = createFunctionWithScript(\"func\", [\"a\", \"a\"], \"return a\")
        func(3, 5)
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(5);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0455
     * @tc.name      JsvmTest0455
     * @tc.desc      Test the function of the OH_JSVM_CreateMap interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0455', 0, function () {
      let script: string = `
        Object.prototype.toString.call(createMap());
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual("[object Map]");
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0456
     * @tc.name      JsvmTest0456
     * @tc.desc      Test the function of the OH_JSVM_CreateMap interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0456', 0, function () {
      let script: string = `
        var map = createMap();
        map.toString();
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual("[object Map]");
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0457
     * @tc.name      JsvmTest0457
     * @tc.desc      Test the function of the OH_JSVM_CreateMap interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0457', 0, function () {
      let script: string = `
        var map = createMap();
        map.set("key1", "val1");
        map.set("key2", "val2");
        map.set("key3", "val3");
        map.size;
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(3);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0458
     * @tc.name      JsvmTest0458
     * @tc.desc      Test the function of the OH_JSVM_CreateMap interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0458', 0, function () {
      let script: string = `
        var map = createMap();
        map.set("key1", "val1");
        map.set("key2", "val2");
        map.set("key3", "val3");
        map.get("key1");
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual("val1");
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0459
     * @tc.name      JsvmTest0459
     * @tc.desc      Test the function of the OH_JSVM_CreateMap interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0459', 0, function () {
      let script: string = `
        var map = createMap();
        map.set("key1", "val1");
        map.set("key2", "val2");
        map.set("key3", "val3");
        map.has("key2");
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0460
     * @tc.name      JsvmTest0460
     * @tc.desc      Test the function of the OH_JSVM_CreateMap interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0460', 0, function () {
      let script: string = `
        var map = createMap();
        map.set("key1", "val1");
        map.set("key2", "val2");
        map.set("key3", "val3");
        map.delete("key3");
        map.has("key3");
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0461
     * @tc.name      JsvmTest0461
     * @tc.desc      Test the function of the OH_JSVM_CoerceToBigInt interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0461', 0, function () {
      let script: string = `
        coerceToBigInt(false) === BigInt(0)
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertTrue();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0462
     * @tc.name      JsvmTest0462
     * @tc.desc      Test the function of the OH_JSVM_CoerceToBigInt interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0462', 0, function () {
      let script: string = `
        coerceToBigInt(true) === BigInt(1)
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertTrue();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0463
     * @tc.name      JsvmTest0463
     * @tc.desc      Test the function of the OH_JSVM_CoerceToBigInt interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0463', 0, function () {
      let script: string = `
        coerceToBigInt("123") === BigInt(123)
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertTrue();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0464
     * @tc.name      JsvmTest0464
     * @tc.desc      Test the function of the OH_JSVM_CoerceToBigInt interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0464', 0, function () {
      let script: string = `
        let val = getValueBigintUint64(BigInt(123))
        coerceToBigInt(val) === BigInt(123)
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertTrue();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0465
     * @tc.name      JsvmTest0465
     * @tc.desc      Test the function of the OH_JSVM_IsRegExp interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0465', 0, function () {
      let script: string = `
        let val = /pattern/
        isRegExp(val)
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertTrue();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0466
     * @tc.name      JsvmTest0466
     * @tc.desc      Test the function of the OH_JSVM_IsRegExp interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0466', 0, function () {
      let script: string = `
        let val
        isRegExp(val)
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertFalse();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0467
     * @tc.name      JsvmTest0467
     * @tc.desc      Test the function of the OH_JSVM_IsRegExp interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0467', 0, function () {
      let script: string = `
        isRegExp(null)
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertFalse();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0468
     * @tc.name      JsvmTest0468
     * @tc.desc      Test the function of the OH_JSVM_IsRegExp interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0468', 0, function () {
      let script: string = `
        isRegExp(true)
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertFalse();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0469
     * @tc.name      JsvmTest0469
     * @tc.desc      Test the function of the OH_JSVM_IsRegExp interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0469', 0, function () {
      let script: string = `
        isRegExp(123)
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertFalse();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0470
     * @tc.name      JsvmTest0470
     * @tc.desc      Test the function of the OH_JSVM_IsRegExp interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0470', 0, function () {
      let script: string = `
        isRegExp("123")
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertFalse();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0471
     * @tc.name      JsvmTest0471
     * @tc.desc      Test the function of the OH_JSVM_IsRegExp interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0471', 0, function () {
      let script: string = `
        isRegExp({})
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertFalse();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0472
     * @tc.name      JsvmTest0472
     * @tc.desc      Test the function of the OH_JSVM_IsRegExp interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0472', 0, function () {
      let script: string = `
        isRegExp(BigInt(123))
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertFalse();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0473
     * @tc.name      JsvmTest0473
     * @tc.desc      Test the function of the OH_JSVM_IsRegExp interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0473', 0, function () {
      let script: string = `
        isRegExp(Symbol())
      `;
      let result = napitest.runJsVm(script);
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0474
     * @tc.name      JsvmTest0474
     * @tc.desc      Test the function of the OH_JSVM_CompileScriptWithOptions interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0474', 0, async function (done) {
        let rst = napitest.testCompileWithOption();
        console.info('JsvmTest0474 testString result is:' + JSON.stringify(rst));
        expect(rst).assertEqual(true);
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0475
     * @tc.name      JsvmTest0475
     * @tc.desc      Test the functions of the OH_JSVM_RetainScript and OH_JSVM_ReleaseScript interfaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0475', 0, async function (done) {
        let rst = napitest.testRetainScript();
        console.info('JsvmTest0475 testString result is:' + JSON.stringify(rst));
        expect(rst).assertEqual(true);
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0476
     * @tc.name      JsvmTest0476
     * @tc.desc      Test the function of the OH_JSVM_OpenInspectorWithName interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0476', 0, async function (done) {
        let rst = napitest.testOpenInspectorWithName();
        console.info('JsvmTest0476 testString result is:' + JSON.stringify(rst));
        expect(rst).assertEqual(true);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0477
     * @tc.name      JsvmTest0477
     * @tc.desc      Test the function of ArrayBuffer interfaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0477', 0, async function (done) {
        let rst = napitest.testArrayBuffer();
        console.info('JsvmTest0477 testString result is:' + JSON.stringify(rst));
        expect(rst).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0478
     * @tc.name      JsvmTest0478
     * @tc.desc      Test the function of ArrayBuffer interfaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0478', 0, async function (done) {
        let rst = napitest.testArrayBuffer2();
        console.info('JsvmTest0478 testString result is:' + JSON.stringify(rst));
        expect(rst).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0479
     * @tc.name      JsvmTest0479
     * @tc.desc      Test the function of ArrayBuffer interfaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0479', 0, async function (done) {
        let rst = napitest.testArrayBuffer3();
        console.info('JsvmTest0479 testString result is:' + JSON.stringify(rst));
        expect(rst).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0480
     * @tc.name      JsvmTest0480
     * @tc.desc      Test the function of WasmOperator interfaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0480', 0, async function (done) {
        let rst = napitest.testWasmOperator();
        console.info('JsvmTest0480 testString result is:' + JSON.stringify(rst));
        expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0481
     * @tc.name      JsvmTest0481
     * @tc.desc      Test the function of WebAssembly interfaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0481', 0, async function (done) {
        let rst = napitest.wasmTest();
        console.info('JsvmTest0481 testString result is:' + JSON.stringify(rst));
        expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0482
     * @tc.name      JsvmTest0482
     * @tc.desc      Test the function of ArrayBuffer backing store interfaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0482', 0, async function (done) {
        let rst = napitest.arrayBufferBackingStoreTest();
        console.info('JsvmTest0482 testString result is:' + JSON.stringify(rst));
        expect(value).assertEqual(0);
      done();
    });
  });
}

