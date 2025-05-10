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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"

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
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0001
     * @tc.name      JsvmTest001
     * @tc.desc      JsvmTest
     */
    it('JsvmTest001', 0, async (done:Function) => {
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
    it('JsvmTest002', 0, async (done:Function) => {
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
    it('JsvmTest003', 0, async (done:Function) => {
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
    it('JsvmTest004', 0, async (done:Function) => {
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
    it('JsvmTest005', 0, async (done:Function) => {
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
    it('JsvmTest006', 0, async (done:Function) => {
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
    it('JsvmTest007', 0, async (done:Function) => {
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
    it('JsvmTest008', 0, async (done:Function) => {
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
    it('JsvmTest009', 0, async (done:Function) => {
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
    it('JsvmTest010', 0, async (done:Function) => {
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
    it('JsvmTest011', 0, async (done:Function) => {
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
    it('JsvmTest012', 0, async (done:Function) => {
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
    it('JsvmTest013', 0, async (done:Function) => {
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
    it('JsvmTest014', 0, async (done:Function) => {
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
    it('JsvmTest015', 0, async (done:Function) => {
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
    it('JsvmTest016', 0, async (done:Function) => {
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
    it('JsvmTest017', 0, async (done:Function) => {
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
    it('JsvmTest018', 0, async (done:Function) => {
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
    it('JsvmTest019', 0, async (done:Function) => {
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
    it('JSvmTest020', 0, async (done:Function) => {
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
    it('JsvmTest021', 0, async (done:Function) => {
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
    it('JsvmTest022', 0, async (done:Function) => {
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
    it('JsvmTest023', 0, async (done:Function) => {
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
    it('JsvmTest024', 0, async (done:Function) => {
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
    it('JsvmTest025', 0, async (done:Function) => {
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
    it('JsvmTest026', 0, async (done:Function) => {
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
    it('JsvmTest027', 0, async (done:Function) => {
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
    it('JsvmTest028', 0, async (done:Function) => {
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
    it('JsvmTest029', 0, async (done:Function) => {
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
    it('JsvmTest030', 0, async (done:Function) => {
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
    it('JsvmTest031', 0, async (done:Function) => {
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
    it('JsvmTest032', 0, async (done:Function) => {
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
    it('JsvmTest033', 0, async (done:Function) => {
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
    it('JsvmTest034', 0, async (done:Function) => {
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
    it('JsvmTest035', 0, async (done:Function) => {
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
    it('JsvmTest036', 0, async (done:Function) => {
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
    it('JsvmTest037', 0, async (done:Function) => {
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
    it('JsvmTest038', 0, async (done:Function) => {
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
    it('JsvmTest039', 0, async (done:Function) => {
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
    it('JsvmTest040', 0, async (done:Function) => {
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
    it('JsvmTest041', 0, async (done:Function) => {
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
    it('JsvmTest042', 0, async (done:Function) => {
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
    it('JsvmTest043', 0, async (done:Function) => {
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
    it('JsvmTest044', 0, async (done:Function) => {
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
    it('JsvmTest045', 0, async (done:Function) => {
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
    it('JsvmTest046', 0, async (done:Function) => {
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
    it('JsvmTest047', 0, async (done:Function) => {
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
    it('JsvmTest048', 0, async (done:Function) => {
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
    it('JsvmTest049', 0, async (done:Function) => {
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
    it('JsvmTest050', 0, async (done:Function) => {
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
    it('JsvmTest051', 0, () => {
      let data = `"aaBC"`;
      let script: string = `
        getValueStringUtf8(${ data })
      `;
      expect(napitest.runJsVm(script)).assertEqual('aaBC');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0052
     * @tc.name JsvmTest052
     * @tc.desc JsvmTest
     */
    it('JsvmTest052', 0, () => {
      let data = `"--&% #$"`;
      let script: string = `
        getValueStringUtf8(${ data })
      `;
      expect(napitest.runJsVm(script)).assertEqual('--&% #$');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0053
     * @tc.name JsvmTest053
     * @tc.desc JsvmTest
     */
    it('JsvmTest053', 0, () => {
      let data = `"中国"`;
      let script: string = `
        getValueStringUtf8(${ data })
      `;
      expect(napitest.runJsVm(script)).assertEqual('中国');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0054
     * @tc.name JsvmTest054
     * @tc.desc JsvmTest
     */
    it('JsvmTest054', 0, () => {
      let data = `"123"`;
      let script: string = `
        getValueStringUtf8(${ data })
      `;
      expect(napitest.runJsVm(script)).assertEqual('123');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0055
     * @tc.name JsvmTest055
     * @tc.desc JsvmTest
     */
    it('JsvmTest055', 0, () => {
      let data = `"abc"`;
      let script: string = `
        getValueStringUtf8(${ data })
      `;
      expect(typeof napitest.runJsVm(script)).assertEqual('string');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0056
     * @tc.name JsvmTest056
     * @tc.desc JsvmTest
     */
    it('JsvmTest056', 0, () => {
      let script: string = `
        createStringUtf16()
      `;
      expect(napitest.runJsVm(script)).assertEqual('你好, World!, successes to create UTF-16 string!');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0057
     * @tc.name JsvmTest057
     * @tc.desc JsvmTest
     */
    it('JsvmTest057', 0, () => {
      let script: string = `
        createStringUtf16()
       `;
      expect(typeof napitest.runJsVm(script)).assertEqual('string');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0058
     * @tc.name JsvmTest058
     * @tc.desc JsvmTest
     */
    it('JsvmTest058', 0, () => {
      let data = `"ahello。"`;
      let script: string = `
        getValueStringUtf16(${ data })
      `;
      expect(napitest.runJsVm(script)).assertEqual('ahello。');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0059
     * @tc.name JsvmTest059
     * @tc.desc JsvmTest
     */
    it('JsvmTest059', 0, () => {
      let data = `"@#$%^&*()"`;
      let script: string = `
        getValueStringUtf16(${ data })
      `;
      expect(napitest.runJsVm(script)).assertEqual('@#$%^&*()');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0060
     * @tc.name JsvmTest060
     * @tc.desc JsvmTest
     */
    it('JsvmTest060', 0, () => {
      let data = `"中国"`;
      let script: string = `
        getValueStringUtf16(${ data })
      `;
      expect(napitest.runJsVm(script)).assertEqual('中国');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0061
     * @tc.name JsvmTest061
     * @tc.desc JsvmTest
     */
    it('JsvmTest061', 0, () => {
      let data = `"11"`;
      let script: string = `
        getValueStringUtf16(${ data })
      `;
      expect(napitest.runJsVm(script)).assertEqual('11');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0062
     * @tc.name JsvmTest062
     * @tc.desc JsvmTest
     */
    it('JsvmTest062', 0, () => {
      let data = `"abc"`;
      let script: string = `
        getValueStringUtf16(${ data })
      `;
      expect(typeof napitest.runJsVm(script)).assertEqual('string');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0063
     * @tc.name JsvmTest063
     * @tc.desc JsvmTest
     */
    it('JsvmTest063', 0, () => {
      let script: string = `
        createStringLatin1()
      `;
      expect(napitest.runJsVm(script)).assertEqual('Hello, World! éçñ, successes to create Latin1 string! 111');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0064
     * @tc.name JsvmTest064
     * @tc.desc JsvmTest
     */
    it('JsvmTest064', 0, () => {
      let script: string = `
        createStringLatin1()
      `;
      expect(typeof napitest.runJsVm(script)).assertEqual('string');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0065
     * @tc.name JsvmTest065
     * @tc.desc JsvmTest
     */
    it('JsvmTest065', 0, () => {
      let data = `"中文"`;
      let script: string = `
        getValueStringLatin1(${ data })
      `;
      expect(napitest.runJsVm(script)).assertEqual('-');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0066
     * @tc.name JsvmTest066
     * @tc.desc JsvmTest
     */
    it('JsvmTest066', 0, () => {
      let data = `"111"`;
      let script: string = `
        getValueStringLatin1(${ data })
      `;
      expect(napitest.runJsVm(script)).assertEqual('111');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0067
     * @tc.name JsvmTest067
     * @tc.desc JsvmTest
     */
    it('JsvmTest067', 0, () => {
      let data = `"ab"`;
      let script: string = `
        getValueStringLatin1(${ data })
      `;
      expect(napitest.runJsVm(script)).assertEqual('ab');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0068
     * @tc.name JsvmTest068
     * @tc.desc JsvmTest
     */
    it('JsvmTest068', 0, () => {
      let data = `"~!@#$%^&*"`;
      let script: string = `
        getValueStringLatin1(${ data })
      `;
      expect(napitest.runJsVm(script)).assertEqual('~!@#$%^&*');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0069
     * @tc.name JsvmTest069
     * @tc.desc JsvmTest
     */
    it('JsvmTest069', 0, () => {
      let data = `"©"`;
      let script: string = `
        getValueStringLatin1(${ data })
      `;
      expect(napitest.runJsVm(script)).assertEqual('©');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0070
     * @tc.name JsvmTest070
     * @tc.desc JsvmTest
     */
    it('JsvmTest070', 0, () => {
      let script: string = `
        createDate()
      `;
      expect(napitest.runJsVm(script).toString()).assertEqual('Sat Aug 05 2017 17:21:16 GMT+0800');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0071
     * @tc.name JsvmTest071
     * @tc.desc JsvmTest
     */
    it('JsvmTest071', 0, () => {
      let script: string = `
        createDate()
      `;
      expect(napitest.runJsVm(script) instanceof Date).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0072
     * @tc.name JsvmTest072
     * @tc.desc JsvmTest
     */
    it('JsvmTest072', 0, () => {
      let script: string = `
        createObject()
      `;
      expect(typeof napitest.runJsVm(script)).assertEqual('object');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0073
     * @tc.name JsvmTest073
     * @tc.desc JsvmTest
     */
    it('JsvmTest073', 0, () => {
      let script: string = `
        createObject()
      `;
      expect(napitest.runJsVm(script).name).assertEqual('Hello OH_JSVM_CreateObject!');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0074
     * @tc.name JsvmTest074
     * @tc.desc JsvmTest
     */
    it('JsvmTest074', 0, () => {
      let script: string = `
        createObject()
      `;
      expect(JSON.stringify(napitest.runJsVm(script))).assertEqual('{"name":"Hello OH_JSVM_CreateObject!"}');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0075
     * @tc.name JsvmTest075
     * @tc.desc JsvmTest
     */
    it('JsvmTest075', 0, () => {
      let script: string = `
        createBigintInt64()
      `;
      expect(napitest.runJsVm(script).toString()).assertEqual('-5555555555555555555');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0076
     * @tc.name JsvmTest076
     * @tc.desc JsvmTest
     */
    it('JsvmTest076', 0, () => {
      let script: string = `
        createBigintInt64()
      `;
      expect(typeof napitest.runJsVm(script)).assertEqual('bigint');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0077
     * @tc.name JsvmTest077
     * @tc.desc JsvmTest
     */
    it('JsvmTest077', 0, () => {
      let script: string = `
        createExternal()
      `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0078
     * @tc.name JsvmTest078
     * @tc.desc JsvmTest
     */
    it('JsvmTest078', 0, () => {
      let script: string = `
        createExternal()
      `;
      expect(typeof napitest.runJsVm(script)).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0079
     * @tc.name JsvmTest079
     * @tc.desc JsvmTest
     */
    it('JsvmTest079', 0, () => {
      let script: string = `
        getValueExternal()
      `;
      expect(napitest.runJsVm(script)).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0080
     * @tc.name JsvmTest080
     * @tc.desc JsvmTest
     */
    it('JsvmTest080', 0, () => {
      let script: string = `
        function testCreateArray() {
          return createArray();
        }
        testCreateArray()
      `;
      expect(napitest.runJsVm(script).length).assertEqual(5);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0081
     * @tc.name JsvmTest081
     * @tc.desc JsvmTest
     */
    it('JsvmTest081', 0, () => {
      let script: string = `
        function testCreateArray() {
          return createArray();
        }
        testCreateArray()
    `;
      expect(napitest.runJsVm(script).toString()).assertEqual('0,1,2,3,4');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0082
     * @tc.name JsvmTest082
     * @tc.desc JsvmTest
     */
    it('JsvmTest082', 0, () => {
      let script: string = `
        function testCreateArray() {
          return createArray();
        }
        testCreateArray()
      `;
      expect(napitest.runJsVm(script) instanceof Array).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0083
     * @tc.name JsvmTest083
     * @tc.desc JsvmTest
     */
    it('JsvmTest083', 0, () => {
      let script: string = `
        function testCreateArray() {
          return createArray();
        }
        testCreateArray()
      `;
      expect(Array.isArray(napitest.runJsVm(script))).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0084
     * @tc.name JsvmTest084
     * @tc.desc JsvmTest
     */
    it('JsvmTest084', 0, () => {
      let num = -1;
      let script: string = `
      function testCreateArrayWithLength(num) {
         return createArrayWithLength(num);
      }
      testCreateArrayWithLength(${ num })
    `;
      expect(napitest.runJsVm(script).length).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0085
     * @tc.name JsvmTest085
     * @tc.desc JsvmTest
     */
    it('JsvmTest085', 0, () => {
      let num = 0;
      let script: string = `
      function testCreateArrayWithLength(num) {
         return createArrayWithLength(num);
      }
      testCreateArrayWithLength(${ num })
    `;
      expect(napitest.runJsVm(script).length).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0086
     * @tc.name JsvmTest086
     * @tc.desc JsvmTest
     */
    it('JsvmTest086', 0, () => {
      let num = 5;
      let script: string = `
      function testCreateArrayWithLength(num) {
         return createArrayWithLength(num);
      }
      testCreateArrayWithLength(${ num })
    `;
      expect(napitest.runJsVm(script).length).assertEqual(5);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0087
     * @tc.name JsvmTest087
     * @tc.desc JsvmTest
     */
    it('JsvmTest087', 0, () => {
      let num = 5;
      let script: string = `
      function testCreateArrayWithLength(num) {
         return createArrayWithLength(num);
      }
      testCreateArrayWithLength(${ num })
    `;
      expect(napitest.runJsVm(script).toString()).assertEqual('0,1,2,3,4');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0088
     * @tc.name JsvmTest088
     * @tc.desc JsvmTest
     */
    it('JsvmTest088', 0, () => {
      let num = 5;
      let script: string = `
      function testCreateArrayWithLength(num) {
         return createArrayWithLength(num);
      }
      testCreateArrayWithLength(${ num })
    `;
      expect(Array.isArray(napitest.runJsVm(script))).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0089
     * @tc.name JsvmTest089
     * @tc.desc JsvmTest
     */
    it('JsvmTest089', 0, () => {
      let script: string = `
      function testCreateArraybuffer() {
         return createArraybuffer(6);
      }
      testCreateArraybuffer()
    `;
      expect(napitest.runJsVm(script).byteLength).assertEqual(6);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0090
     * @tc.name JsvmTest090
     * @tc.desc JsvmTest
     */
    it('JsvmTest090', 0, () => {
      let script: string = `
      function testCreateArraybuffer() {
         return createArraybuffer(0);
      }
      testCreateArraybuffer()
    `;
      expect(napitest.runJsVm(script).byteLength).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0091
     * @tc.name JsvmTest091
     * @tc.desc JsvmTest
     */
    it('JsvmTest091', 0, () => {
      let script: string = `
      function testCreateArraybuffer() {
         return createArraybuffer(3);
      }
      testCreateArraybuffer()
    `;
      expect(napitest.runJsVm(script) instanceof ArrayBuffer).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0092
     * @tc.name JsvmTest092
     * @tc.desc JsvmTest
     */
    it('JsvmTest092', 0, () => {
      let script: string = `
      function testCreateArraybuffer() {
         return createArraybuffer(3);
      }
      testCreateArraybuffer()
    `;
      expect(napitest.runJsVm(script).toString()).assertEqual('[object ArrayBuffer]');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0093
     * @tc.name JsvmTest093
     * @tc.desc JsvmTest
     */
    it('JsvmTest093', 0, () => {
      let script: string = `
      function testCreateInt32() {
         return createInt32();
      }
      testCreateInt32()
    `;
      expect(napitest.runJsVm(script)).assertEqual(-20);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0094
     * @tc.name JsvmTest094
     * @tc.desc JsvmTest
     */
    it('JsvmTest094', 0, () => {
      let script: string = `
      function testCreateInt32() {
         return createInt32();
      }
      testCreateInt32()
    `;
      expect(Number.isInteger(napitest.runJsVm(script))).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0095
     * @tc.name JsvmTest095
     * @tc.desc JsvmTest
     */
    it('JsvmTest095', 0, () => {
      let num = 0;
      let script: string = `
      function testGetValueInt32(num) {
         return getValueInt32(num);
      }
      testGetValueInt32(${ num })
    `;
      expect(napitest.runJsVm(script)).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0096
     * @tc.name JsvmTest096
     * @tc.desc JsvmTest
     */
    it('JsvmTest096', 0, () => {
      let num = 2147483647;
      let script: string = `
      function testGetValueInt32(num) {
         return getValueInt32(num);
      }
      testGetValueInt32(${ num })
    `;
      expect(napitest.runJsVm(script)).assertEqual(2147483647);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0097
     * @tc.name JsvmTest097
     * @tc.desc JsvmTest
     */
    it('JsvmTest097', 0, () => {
      let num = 2147483649;
      let script: string = `
      function testGetValueInt32(num) {
         return getValueInt32(num);
      }
      testGetValueInt32(${ num })
    `;
      expect(napitest.runJsVm(script)).assertEqual(-2147483647);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0098
     * @tc.name JsvmTest098
     * @tc.desc JsvmTest
     */
    it('JsvmTest098', 0, () => {
      let num = -2147483648;
      let script: string = `
      function testGetValueInt32(num) {
         return getValueInt32(num);
      }
      testGetValueInt32(${ num })
    `;
      expect(napitest.runJsVm(script)).assertEqual(-2147483648);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0099
     * @tc.name JsvmTest099
     * @tc.desc JsvmTest
     */
    it('JsvmTest099', 0, () => {
      let num = -2147483650;
      let script: string = `
      function testGetValueInt32(num) {
         return getValueInt32(num);
      }
      testGetValueInt32(${ num })
    `;
      expect(napitest.runJsVm(script)).assertEqual(2147483646);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0100
     * @tc.name JsvmTest100
     * @tc.desc JsvmTest
     */
    it('JsvmTest100', 0, () => {
      let num = 1;
      let script: string = `
      function testGetValueInt32(num) {
         return getValueInt32(num);
      }
      testGetValueInt32(${ num })
    `;
      expect(Number.isInteger(napitest.runJsVm(script))).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0101
     * @tc.name JsvmTest101
     * @tc.desc JsvmTest
     */
    it('JsvmTest101', 0, () => {
      let script: string = `
      function testCreateUInt32() {
         return createUInt32();
      }
      testCreateUInt32()
    `;
      expect(Number.isInteger(napitest.runJsVm(script))).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0102
     * @tc.name JsvmTest102
     * @tc.desc JsvmTest
     */
    it('JsvmTest102', 0, () => {
      let script: string = `
      function testCreateUInt32() {
         return createUInt32();
      }
      testCreateUInt32()
    `;
      expect(napitest.runJsVm(script)).assertEqual(26);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0103
     * @tc.name JsvmTest103
     * @tc.desc JsvmTest
     */
    it('JsvmTest103', 0, () => {
      let num = 1;
      let script: string = `
      function testGetValueUint32(num) {
         return getValueUint32(num);
      }
      testGetValueUint32(${ num })
    `;
      expect(napitest.runJsVm(script)).assertEqual(1);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0104
     * @tc.name JsvmTest104
     * @tc.desc JsvmTest
     */
    it('JsvmTest104', 0, () => {
      let num = -1;
      let script: string = `
      function testGetValueUint32(num) {
         return getValueUint32(num);
      }
      testGetValueUint32(${ num })
    `;
      expect(napitest.runJsVm(script)).assertEqual(4294967295);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0105
     * @tc.name JsvmTest105
     * @tc.desc JsvmTest
     */
    it('JsvmTest105', 0, () => {
      let num = 4294967295;
      let script: string = `
      function testGetValueUint32(num) {
         return getValueUint32(num);
      }
      testGetValueUint32(${ num })
    `;
      expect(napitest.runJsVm(script)).assertEqual(4294967295);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0106
     * @tc.name JsvmTest106
     * @tc.desc JsvmTest
     */
    it('JsvmTest106', 0, () => {
      let num = 4294967296;
      let script: string = `
      function testGetValueUint32(num) {
         return getValueUint32(num);
      }
      testGetValueUint32(${ num })
    `;
      expect(napitest.runJsVm(script)).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0107
     * @tc.name JsvmTest107
     * @tc.desc JsvmTest
     */
    it('JsvmTest107', 0, () => {
      let num = 3;
      let script: string = `
      function testGetValueUint32(num) {
         return getValueUint32(num);
      }
      testGetValueUint32(${ num })
    `;
      expect(Number.isInteger(napitest.runJsVm(script))).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0108
     * @tc.name JsvmTest108
     * @tc.desc JsvmTest
     */
    it('JsvmTest108', 0, () => {
      let script: string = `
      function testCreateInt64() {
         return createInt64();
      }
      testCreateInt64()
    `;
      expect(napitest.runJsVm(script)).assertEqual(2147483648);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0109
     * @tc.name JsvmTest109
     * @tc.desc JsvmTest
     */
    it('JsvmTest109', 0, () => {
      let script: string = `
      function testCreateInt64() {
         return createInt64();
      }
      testCreateInt64()
    `;
      expect(Number.isInteger(napitest.runJsVm(script))).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0110
     * @tc.name JsvmTest110
     * @tc.desc JsvmTest
     */
    it('JsvmTest110', 0, () => {
      let num = -1;
      let script: string = `
      function testGetValueInt64(num) {
         return getValueInt64(num);
      }
      testGetValueInt64(${ num })
    `;
      expect(napitest.runJsVm(script)).assertEqual(-1);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0111
     * @tc.name JsvmTest111
     * @tc.desc JsvmTest
     */
    it('JsvmTest111', 0, () => {
      let num = -9223372036854775808;
      let script: string = `
      function testGetValueInt64(num) {
         return getValueInt64(num);
      }
      testGetValueInt64(${ num })
    `;
      expect(napitest.runJsVm(script)).assertEqual(-9223372036854775808);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0112
     * @tc.name JsvmTest112
     * @tc.desc JsvmTest
     */
    it('JsvmTest112', 0, () => {
      let num = 9223372036854775807;
      let script: string = `
      function testGetValueInt64(num) {
         return getValueInt64(num);
      }
      testGetValueInt64(${ num })
    `;
      expect(napitest.runJsVm(script)).assertEqual(9223372036854775807);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0113
     * @tc.name JsvmTest113
     * @tc.desc JsvmTest
     */
    it('JsvmTest113', 0, () => {
      let num = 888;
      let script: string = `
      function testGetValueInt64(num) {
         return getValueInt64(num);
      }
      testGetValueInt64(${ num })
    `;
      expect(Number.isInteger(napitest.runJsVm(script))).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0114
     * @tc.name JsvmTest114
     * @tc.desc JsvmTest
     */
    it('JsvmTest114', 0, () => {
      let num = 11;
      let script: string = `
      function testGetValueInt64(num) {
         return getValueInt64(num);
      }
      testGetValueInt64(${ num })
    `;
      expect(typeof napitest.runJsVm(script)).assertEqual('number');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0115
     * @tc.name JsvmTest115
     * @tc.desc JsvmTest
     */
    it('JsvmTest115', 0, () => {
      let script: string = `
      function testCreateDouble() {
         return createDouble();
      }
      testCreateDouble()
    `;
      expect(!Number.isInteger(napitest.runJsVm(script))).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0116
     * @tc.name JsvmTest116
     * @tc.desc JsvmTest
     */
    it('JsvmTest116', 0, () => {
      let script: string = `
      function testCreateDouble() {
         return createDouble();
      }
      testCreateDouble()
    `;
      expect(napitest.runJsVm(script)).assertEqual(1.234);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0117
     * @tc.name JsvmTest117
     * @tc.desc JsvmTest
     */
    it('JsvmTest117', 0, () => {
      let script: string = `
      function testCreateDouble() {
         return createDouble();
      }
      testCreateDouble()
    `;
      expect(typeof napitest.runJsVm(script)).assertEqual('number');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0118
     * @tc.name JsvmTest118
     * @tc.desc JsvmTest
     */
    it('JsvmTest118', 0, () => {
      let num = -110.0456;
      let script: string = `
      function testGetDouble(num) {
         return getDouble(num);
      }
      testGetDouble(${ num })
    `;
      expect(napitest.runJsVm(script)).assertEqual(-110.0456);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0119
     * @tc.name JsvmTest119
     * @tc.desc JsvmTest
     */
    it('JsvmTest119', 0, () => {
      let num = 1.456;
      let script: string = `
      function testGetDouble(num) {
         return getDouble(num);
      }
      testGetDouble(${ num })
    `;
      expect(napitest.runJsVm(script)).assertEqual(1.456);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0120
     * @tc.name JsvmTest120
     * @tc.desc JsvmTest
     */
    it('JsvmTest120', 0, () => {
      let num = 0.0000001;
      let script: string = `
      function testGetDouble(num) {
         return getDouble(num);
      }
      testGetDouble(${ num })
    `;
      expect(napitest.runJsVm(script)).assertEqual(0.0000001);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0121
     * @tc.name JsvmTest121
     * @tc.desc JsvmTest
     */
    it('JsvmTest121', 0, () => {
      let num = 1.5;
      let script: string = `
      function testGetDouble(num) {
         return getDouble(num);
      }
      testGetDouble(${ num })
    `;
      expect(typeof napitest.runJsVm(script)).assertEqual('number');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0122
     * @tc.name JsvmTest122
     * @tc.desc JsvmTest
     */
    it('JsvmTest122', 0, () => {
      let data = 1;
      let value = 2;
      let script: string = `
      function testGetBoolean(data, value) {
         return getBoolean(data, value);
      }
      testGetBoolean(${ data }, ${ value })
    `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0123
     * @tc.name JsvmTest123
     * @tc.desc JsvmTest
     */
    it('JsvmTest123', 0, () => {
      let data = 1;
      let value = 1;
      let script: string = `
      function testGetBoolean(data, value) {
         return getBoolean(data, value);
      }
      testGetBoolean(${ data }, ${ value })
    `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0124
     * @tc.name JsvmTest124
     * @tc.desc JsvmTest
     */
    it('JsvmTest124', 0, () => {
      let data = '2';
      let value = '2';
      let script: string = `
      function testGetBoolean(data, value) {
         return getBoolean(data, value);
      }
      testGetBoolean(${ data }, ${ value })
    `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0125
     * @tc.name JsvmTest125
     * @tc.desc JsvmTest
     */
    it('JsvmTest125', 0, () => {
      let data = '2';
      let value = '3';
      let script: string = `
      function testGetBoolean(data, value) {
         return getBoolean(data, value);
      }
      testGetBoolean(${ data }, ${ value })
    `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0126
     * @tc.name JsvmTest126
     * @tc.desc JsvmTest
     */
    it('JsvmTest126', 0, () => {
      let data = `'a'`;
      let value = `'a'`;
      let script: string = `
      getBoolean(${ data }, ${ value })
    `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0127
     * @tc.name JsvmTest127
     * @tc.desc JsvmTest
     */
    it('JsvmTest127', 0, () => {
      let data = true;
      let script: string = `
      function testGetValueBool(data) {
         return getValueBool(data);
      }
      testGetValueBool(${ data })
    `;
      expect(typeof napitest.runJsVm(script)).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0128
     * @tc.name JsvmTest128
     * @tc.desc JsvmTest
     */
    it('JsvmTest128', 0, () => {
      let data = 'true';
      let script: string = `
      function testGetValueBool(data) {
         return getValueBool(data);
      }
      testGetValueBool(${ data })
    `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0129
     * @tc.name JsvmTest129
     * @tc.desc JsvmTest
     */
    it('JsvmTest129', 0, () => {
      let data = 11;
      let script: string = `
      function testGetValueBool(data) {
         return getValueBool(data);
      }
      testGetValueBool(${ data })
    `;
      expect(napitest.runJsVm(script)).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0130
     * @tc.name JsvmTest130
     * @tc.desc JsvmTest
     */
    it('JsvmTest130', 0, () => {
      let data = 'false';
      let script: string = `
      function testGetValueBool(data) {
         return getValueBool(data);
      }
      testGetValueBool(${ data })
    `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0131
     * @tc.name JsvmTest131
     * @tc.desc JsvmTest
     */
    it('JsvmTest131', 0, () => {
      let data = false;
      let script: string = `
      function testGetValueBool(data) {
         return getValueBool(data);
      }
      testGetValueBool(${ data })
    `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0132
     * @tc.name JsvmTest132
     * @tc.desc JsvmTest
     */
    it('JsvmTest132', 0, () => {
      let script: string = `
        createBigintUint64()
    `;
      expect(napitest.runJsVm(script).toString()).assertEqual('5555555555555555555');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0133
     * @tc.name JsvmTest133
     * @tc.desc JsvmTest
     */
    it('JsvmTest133', 0, () => {
      let script: string = `
        createBigintUint64()
    `;
      expect(typeof napitest.runJsVm(script)).assertEqual('bigint');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0134
     * @tc.name JsvmTest134
     * @tc.desc JsvmTest
     */
    it('JsvmTest134', 0, () => {
      let script: string = `
        getValueBigintUint64(BigInt(5555555555555555))
    `;
      expect(napitest.runJsVm(script).toString()).assertEqual('5555555555555555');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0135
     * @tc.name JsvmTest135
     * @tc.desc JsvmTest
     */
    it('JsvmTest135', 0, () => {
      let script: string = `
        getValueBigintUint64(BigInt(0))
    `;
      expect(napitest.runJsVm(script).toString()).assertEqual('0');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0136
     * @tc.name JsvmTest136
     * @tc.desc JsvmTest
     */
    it('JsvmTest136', 0, () => {
      let script: string = `
        getValueBigintUint64(BigInt(1))
    `;
      expect(typeof napitest.runJsVm(script)).assertEqual('bigint');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0137
     * @tc.name JsvmTest137
     * @tc.desc JsvmTest
     */
    it('JsvmTest137', 0, () => {
      let script: string = `
        createBigintInt64()
    `;
      expect(napitest.runJsVm(script).toString()).assertEqual('-5555555555555555555');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0138
     * @tc.name JsvmTest138
     * @tc.desc JsvmTest
     */
    it('JsvmTest138', 0, () => {
      let script: string = `
        createBigintInt64()
    `;
      expect(typeof napitest.runJsVm(script)).assertEqual('bigint');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0139
     * @tc.name JsvmTest139
     * @tc.desc JsvmTest
     */
    it('JsvmTest139', 0, () => {
      let script: string = `
        getBigintInt64(BigInt(-5555555555555555))
    `;
      expect(napitest.runJsVm(script).toString()).assertEqual('-5555555555555555');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0140
     * @tc.name JsvmTest140
     * @tc.desc JsvmTest
     */
    it('JsvmTest140', 0, () => {
      let script: string = `
        getBigintInt64(BigInt(0))
    `;
      expect(napitest.runJsVm(script).toString()).assertEqual('0');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0141
     * @tc.name JsvmTest141
     * @tc.desc JsvmTest
     */
    it('JsvmTest141', 0, () => {
      let script: string = `
        getBigintInt64(BigInt(5555555555555555))
    `;
      expect(napitest.runJsVm(script).toString()).assertEqual('5555555555555555');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0142
     * @tc.name JsvmTest142
     * @tc.desc JsvmTest
     */
    it('JsvmTest142', 0, () => {
      let script: string = `
        getBigintInt64(BigInt(123))
    `;
      expect(typeof napitest.runJsVm(script)).assertEqual('bigint');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0143
     * @tc.name JsvmTest143
     * @tc.desc JsvmTest
     */
    it('JsvmTest143', 0, () => {
      let script: string = `
        createBigintWords()
    `;
      expect(napitest.runJsVm(script).toString()).assertEqual('19055812547572553954576167314685144596492');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0144
     * @tc.name JsvmTest144
     * @tc.desc JsvmTest
     */
    it('JsvmTest144', 0, () => {
      let script: string = `
        createBigintWords()
    `;
      expect(typeof napitest.runJsVm(script)).assertEqual('bigint');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0145
     * @tc.name JsvmTest145
     * @tc.desc JsvmTest
     */
    it('JsvmTest145', 0, () => {
      let script: string = `
        getValueBigintWords(BigInt(5555555555555555))
    `;
      // 0代表符号位为正
      expect(napitest.runJsVm(script).toString()).assertEqual('0');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0146
     * @tc.name JsvmTest146
     * @tc.desc JsvmTest
     */
    it('JsvmTest146', 0, () => {
      let script: string = `
        getValueBigintWords(BigInt(-5555555555555555))
    `;
      // 1代表符号位为负
      expect(napitest.runJsVm(script).toString()).assertEqual('1');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0147
     * @tc.name JsvmTest147
     * @tc.desc JsvmTest
     */
    it('JsvmTest147', 0, () => {
      let script: string = `
        getValueBigintWords(11)
    `;
      expect(napitest.runJsVm(script)).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0148
     * @tc.name JsvmTest148
     * @tc.desc JsvmTest
     */
    it('JsvmTest148', 0, () => {
      let script: string = `
        getValueBigintWords('ab')
    `;
      expect(napitest.runJsVm(script)).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0149
     * @tc.name JsvmTest149
     * @tc.desc JsvmTest
     */
    it('JsvmTest149', 0, () => {
      let script: string = `
        getValueBigintWords('中')
    `;
      expect(napitest.runJsVm(script)).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0150
     * @tc.name JsvmTest150
     * @tc.desc JsvmTest
     */
    it('JsvmTest150', 0, () => {
      let script: string = `
        getValueBigintWords('@#￥%&*（$^(')
    `;
      expect(napitest.runJsVm(script)).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0151
     * @tc.name JsvmTest151
     * @tc.desc JsvmTest
     */
    it('JsvmTest151', 0, () => {
      let script: string = `
        getNull()
    `;
      expect(napitest.runJsVm(script)).assertEqual(null);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0152
     * @tc.name JsvmTest152
     * @tc.desc JsvmTest
     */
    it('JsvmTest152', 0, () => {
      let script: string = `
        getUndefined()
    `;
      expect(napitest.runJsVm(script)).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0153
     * @tc.name JsvmTest153
     * @tc.desc JsvmTest
     */
    it('JsvmTest153', 0, () => {
      let script: string = `
        getGlobal()
    `;
      expect(napitest.runJsVm(script).Row).assertEqual(1);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0154
     * @tc.name JsvmTest154
     * @tc.desc JsvmTest
     */
    it('JsvmTest154', 0, () => {
      let script: string = `
        getGlobal()
    `;
      expect(typeof napitest.runJsVm(script)).assertEqual('object');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0155
     * @tc.name JsvmTest155
     * @tc.desc JsvmTest
     */
    it('JsvmTest155', 0, () => {
      let script: string = `
        createSymbol()
    `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0156
     * @tc.name JsvmTest156
     * @tc.desc JsvmTest
     */
    it('JsvmTest156', 0, () => {
      let script: string = `
        createSymbol()
    `;
      expect(typeof napitest.runJsVm(script)).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0157
     * @tc.name JsvmTest157
     * @tc.desc JsvmTest
     */
    it('JsvmTest157', 0, () => {
      let script: string = `
        symbolFor()
    `;
      expect(typeof napitest.runJsVm(script)).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0158
     * @tc.name JsvmTest158
     * @tc.desc JsvmTest
     */
    it('JsvmTest158', 0, () => {
      let script: string = `
        symbolFor()
    `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0159
     * @tc.name JsvmTest159
     * @tc.desc JsvmTest
     */
    it('JsvmTest159', 0, () => {
      let script: string = `
        getDateValue(new Date(Date.now()))
    `;
      expect(napitest.runJsVm(script) > 0).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0160
     * @tc.name JsvmTest1160
     * @tc.desc JsvmTest
     */
    it('JsvmTest160', 0, () => {
      let script: string = `
        getDateValue(new Date(Date.now()))
    `;
      expect(Number.isInteger(napitest.runJsVm(script))).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0161
     * @tc.name JsvmTest161
     * @tc.desc JsvmTest
     */
    it('JsvmTest161', 0, () => {
      let ARRAY_BUFFER = 1;
      let script: string = `
        getArraybufferInfo(new ArrayBuffer(10), ${ ARRAY_BUFFER })
    `;
      expect(typeof napitest.runJsVm(script)).assertEqual('object');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0162
     * @tc.name JsvmTest162
     * @tc.desc JsvmTest
     */
    it('JsvmTest162', 0, () => {
      let ARRAY_LENGTH = 0;
      let script: string = `
        getArraybufferInfo(new ArrayBuffer(10), ${ ARRAY_LENGTH })
    `;
      expect(napitest.runJsVm(script)).assertEqual(10);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0163
     * @tc.name JsvmTest163
     * @tc.desc JsvmTest
     */
    it('JsvmTest163', 0, () => {
      let ARRAY_BUFFER = 1;
      let script: string = `
        getArraybufferInfo(new ArrayBuffer(10), ${ ARRAY_BUFFER })
    `;
      expect(napitest.runJsVm(script) instanceof ArrayBuffer).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0164
     * @tc.name JsvmTest164
     * @tc.desc JsvmTest
     */
    it('JsvmTest164', 0, () => {
      let script: string = `
        createTypedArray(${ napitest.TypedArrayTypes['INT8_ARRAY'] })
    `;
      expect(napitest.runJsVm(script) instanceof Int8Array).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0165
     * @tc.name JsvmTest165
     * @tc.desc JsvmTest
     */
    it('JsvmTest165', 0, () => {
      let script: string = `
        createTypedArray(${ napitest.TypedArrayTypes['UINT8_ARRAY'] })
    `;
      expect(napitest.runJsVm(script) instanceof Uint8Array).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0166
     * @tc.name JsvmTest166
     * @tc.desc JsvmTest
     */
    it('JsvmTest166', 0, () => {
      let script: string = `
        createTypedArray(${ napitest.TypedArrayTypes['UINT8_CLAMPED_ARRAY'] })
    `;
      expect(napitest.runJsVm(script) instanceof Uint8ClampedArray).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0167
     * @tc.name JsvmTest167
     * @tc.desc JsvmTest
     */
    it('JsvmTest167', 0, () => {
      let script: string = `
        createTypedArray(${ napitest.TypedArrayTypes['INT16_ARRAY'] })
    `;
      expect(napitest.runJsVm(script) instanceof Int16Array).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0168
     * @tc.name JsvmTest168
     * @tc.desc JsvmTest
     */
    it('JsvmTest168', 0, () => {
      let script: string = `
        createTypedArray(${ napitest.TypedArrayTypes['UINT16_ARRAY'] })
    `;
      expect(napitest.runJsVm(script) instanceof Uint16Array).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0169
     * @tc.name JsvmTest169
     * @tc.desc JsvmTest
     */
    it('JsvmTest169', 0, () => {
      let script: string = `
        createTypedArray(${ napitest.TypedArrayTypes['INT32_ARRAY'] })
    `;
      expect(napitest.runJsVm(script) instanceof Int32Array).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0170
     * @tc.name JsvmTest170
     * @tc.desc JsvmTest
     */
    it('JsvmTest170', 0, () => {
      let script: string = `
        createTypedArray(${ napitest.TypedArrayTypes['UINT32_ARRAY'] })
    `;
      expect(napitest.runJsVm(script) instanceof Uint32Array).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0171
     * @tc.name JsvmTest171
     * @tc.desc JsvmTest
     */
    it('JsvmTest171', 0, () => {
      let script: string = `
        createTypedArray(${ napitest.TypedArrayTypes['FLOAT32_ARRAY'] })
    `;
      expect(napitest.runJsVm(script) instanceof Float32Array).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0172
     * @tc.name JsvmTest172
     * @tc.desc JsvmTest
     */
    it('JsvmTest172', 0, () => {
      let script: string = `
        createTypedArray(${ napitest.TypedArrayTypes['FLOAT64_ARRAY'] })
    `;
      expect(napitest.runJsVm(script) instanceof Float64Array).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0173
     * @tc.name JsvmTest173
     * @tc.desc JsvmTest
     */
    it('JsvmTest173', 0, () => {
      let script: string = `
        createTypedArray(${ napitest.TypedArrayTypes['BIGINT64_ARRAY'] })
    `;
      expect(napitest.runJsVm(script) instanceof BigInt64Array).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0174
     * @tc.name JsvmTest174
     * @tc.desc JsvmTest
     */
    it('JsvmTest174', 0, () => {
      let script: string = `
        createTypedArray(${ napitest.TypedArrayTypes['BIGUINT64_ARRAY'] })
    `;
      expect(napitest.runJsVm(script) instanceof BigUint64Array).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0175
     * @tc.name JsvmTest175
     * @tc.desc JsvmTest
     */
    it('JsvmTest175', 0, () => {
      //  超出范围，默认是INT8_ARRAY
      let script: string = `
        createTypedArray(22)
    `;
      expect(napitest.runJsVm(script) instanceof Int8Array).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0176
     * @tc.name JsvmTest176
     * @tc.desc JsvmTest
     */
    it('JsvmTest176', 0, () => {
      let IS_JSVM_INT8_ARRAY = 0;
      let script: string = `
        getTypedArrayInfo(new Int8Array(3), ${ IS_JSVM_INT8_ARRAY })
    `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0177
     * @tc.name JsvmTest177
     * @tc.desc JsvmTest
     */
    it('JsvmTest177', 0, () => {
      let IS_JSVM_INT8_ARRAY = 0;
      let script: string = `
        getTypedArrayInfo(new Int16Array(3), ${ IS_JSVM_INT8_ARRAY })
    `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0178
     * @tc.name JsvmTest178
     * @tc.desc JsvmTest
     */
    it('JsvmTest178', 0, () => {
      let IS_JSVM_INT8_ARRAY = 0;
      let script: string = `
        getTypedArrayInfo(new Int32Array(3), ${ IS_JSVM_INT8_ARRAY })
    `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0179
     * @tc.name JsvmTest179
     * @tc.desc JsvmTest
     */
    it('JsvmTest179', 0, () => {
      let IS_JSVM_INT8_ARRAY = 0;
      let script: string = `
        getTypedArrayInfo(new Float64Array(3), ${ IS_JSVM_INT8_ARRAY })
    `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0180
     * @tc.name JsvmTest180
     * @tc.desc JsvmTest
     */
    it('JsvmTest180', 0, () => {
      let IS_JSVM_INT8_ARRAY = 0;
      let script: string = `
        getTypedArrayInfo(new BigInt64Array(3), ${ IS_JSVM_INT8_ARRAY })
    `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0181
     * @tc.name JsvmTest181
     * @tc.desc JsvmTest
     */
    it('JsvmTest181', 0, () => {
      let LENGTH = 1;
      let script: string = `
        getTypedArrayInfo(new Int8Array(5), ${ LENGTH })
    `;
      expect(napitest.runJsVm(script)).assertEqual(5);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0182
     * @tc.name JsvmTest182
     * @tc.desc JsvmTest
     */
    it('JsvmTest182', 0, () => {
      let IS_BUFFER = 2;
      let script: string = `
        getTypedArrayInfo(new Int8Array(5), ${ IS_BUFFER })
    `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0183
     * @tc.name JsvmTest183
     * @tc.desc JsvmTest
     */
    it('JsvmTest183', 0, () => {
      let IS_BUFFER = 2;
      let script: string = `
        getTypedArrayInfo(1, ${ IS_BUFFER })
    `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0184
     * @tc.name JsvmTest184
     * @tc.desc JsvmTest
     */
    it('JsvmTest184', 0, () => {
      let IS_BUFFER = 2;
      let script: string = `
        getTypedArrayInfo(\'a\', ${ IS_BUFFER })
    `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0185
     * @tc.name JsvmTest185
     * @tc.desc JsvmTest
     */
    it('JsvmTest185', 0, () => {
      let IS_BUFFER = 2;
      let script: string = `
        getTypedArrayInfo({}, ${ IS_BUFFER })
    `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0186
     * @tc.name JsvmTest186
     * @tc.desc JsvmTest
     */
    it('JsvmTest186', 0, () => {
      let IS_BUFFER = 2;
      let script: string = `
        getTypedArrayInfo(\'中\', ${ IS_BUFFER })
    `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0187
     * @tc.name JsvmTest187
     * @tc.desc JsvmTest
     */
    it('JsvmTest187', 0, () => {
      let BYTE_OFFSET = 3;
      let script: string = `
        getTypedArrayInfo(new Int8Array(1), ${ BYTE_OFFSET })
    `;
      expect(napitest.runJsVm(script)).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0188
     * @tc.name JsvmTest188
     * @tc.desc JsvmTest
     */
    it('JsvmTest188', 0, () => {
      let BYTE_LENGTGH = 0;
      let script: string = `
        createDataView(new ArrayBuffer(16), ${ BYTE_LENGTGH })
    `;
      expect(napitest.runJsVm(script)).assertEqual(12);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0189
     * @tc.name JsvmTest189
     * @tc.desc JsvmTest
     */
    it('JsvmTest189', 0, () => {
      let IS_ARRAYBUFFER = 1;
      let script: string = `
        createDataView(new ArrayBuffer(16), ${ IS_ARRAYBUFFER })
    `;
      expect(typeof napitest.runJsVm(script)).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0190
     * @tc.name JsvmTest190
     * @tc.desc JsvmTest
     */
    it('JsvmTest190', 0, () => {
      let IS_ARRAYBUFFER = 1;
      let script: string = `
        createDataView(new ArrayBuffer(16), ${ IS_ARRAYBUFFER })
    `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0191
     * @tc.name JsvmTest191
     * @tc.desc JsvmTest
     */
    it('JsvmTest191', 0, () => {
      let BYTE_OFFSET = '2';
      let script: string = `
        createDataView(new ArrayBuffer(16), ${ BYTE_OFFSET })
    `;
      expect(napitest.runJsVm(script)).assertEqual(4);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0192
     * @tc.name JsvmTest192
     * @tc.desc JsvmTest
     */
    it('JsvmTest192', 0, () => {
      let BYTE_LENGTGH = 0;
      let script: string = `
        getDataViewInfo(new DataView(new Int8Array([2,5]).buffer), ${ BYTE_LENGTGH })
    `;
      expect(napitest.runJsVm(script)).assertEqual(2);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0193
     * @tc.name JsvmTest193
     * @tc.desc JsvmTest
     */
    it('JsvmTest193', 0, () => {
      let BYTE_LENGTGH = 0;
      let script: string = `
        getDataViewInfo(new DataView(new Int8Array([2,5,3]).buffer), ${ BYTE_LENGTGH })
    `;
      expect(napitest.runJsVm(script)).assertEqual(3);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0194
     * @tc.name JsvmTest194
     * @tc.desc JsvmTest
     */
    it('JsvmTest194', 0, () => {
      let data = 'new DataView(new Int8Array([2,5,3]).buffer)';
      let IS_ARRAYBUFFER = '1';
      let script: string = `
        getDataViewInfo(${ data }, ${ IS_ARRAYBUFFER })
    `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0195
     * @tc.name JsvmTest195
     * @tc.desc JsvmTest
     */
    it('JsvmTest195', 0, () => {
      let data = `'a'`;
      let IS_ARRAYBUFFER = '1';
      let script: string = `
        getDataViewInfo(${ data }, ${ IS_ARRAYBUFFER })
    `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0196
     * @tc.name JsvmTest196
     * @tc.desc JsvmTest
     */
    it('JsvmTest196', 0, () => {
      let data = `'中'`;
      let IS_ARRAYBUFFER = '1';
      let script: string = `
        getDataViewInfo(${ data }, ${ IS_ARRAYBUFFER })
    `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0197
     * @tc.name JsvmTest197
     * @tc.desc JsvmTest
     */
    it('JsvmTest197', 0, () => {
      let data = 'new DataView(new Int8Array([2,5,3]).buffer)';
      let BYTE_OFFSET = '2';
      let script: string = `
        getDataViewInfo(${ data }, ${ BYTE_OFFSET })
    `;
      expect(napitest.runJsVm(script)).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0198
     * @tc.name JsvmTest198
     * @tc.desc JsvmTest
     */
    it('JsvmTest198', 0, () => {
      let script: string = `
        getPrototype()
    `;
      expect(napitest.runJsVm(script)).assertEqual('set and get proto');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0199
     * @tc.name JsvmTest199
     * @tc.desc JsvmTest
     */
    it('JsvmTest199', 0, () => {
      let script: string = `
        getPrototype()
    `;
      expect(typeof napitest.runJsVm(script)).assertEqual('string');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0200
     * @tc.name JsvmTest200
     * @tc.desc JsvmTest
     */
    it('JsvmTest200', 0, () => {
      let script: string = `createReference();`;
      expect(JSON.stringify(napitest.runJsVm(script))).assertEqual('{"name":"CreateReference"}');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0201
     * @tc.name JsvmTest201
     * @tc.desc JsvmTest
     */
    it('JsvmTest201', 0, () => {
      let script: string = `createReference();`;
      expect(napitest.runJsVm(script).name).assertEqual('CreateReference');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0202
     * @tc.name JsvmTest202
     * @tc.desc JsvmTest
     */
    it('JsvmTest202', 0, () => {
      let script: string = `createReference();`;
      expect(typeof napitest.runJsVm(script)).assertEqual('object');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0203
     * @tc.name JsvmTest203
     * @tc.desc JsvmTest
     */
    it('JsvmTest203', 0, () => {
      let script: string = `useReference()`;
      expect(typeof napitest.runJsVm(script)).assertEqual('object');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0204
     * @tc.name JsvmTest204
     * @tc.desc JsvmTest
     */
    it('JsvmTest204', 0, () => {
      let script: string = `useReference()`;
      expect(napitest.runJsVm(script).name).assertEqual('UseReference');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0205
     * @tc.name JsvmTest205
     * @tc.desc JsvmTest
     */
    it('JsvmTest205', 0, () => {
      let script: string = `useReference()`;
      expect(JSON.stringify(napitest.runJsVm(script))).assertEqual('{"name":"UseReference"}');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0206
     * @tc.name JsvmTest206
     * @tc.desc JsvmTest
     */
    it('JsvmTest206', 0, () => {
      let script: string = `deleteReference()`;
      expect(napitest.runJsVm(script)).assertEqual('OH_JSVM_DeleteReference success');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0207
     * @tc.name JsvmTest207
     * @tc.desc JsvmTest
     */
    it('JsvmTest207', 0, () => {
      let script: string = `deleteReference()`;
      expect(typeof napitest.runJsVm(script)).assertEqual('string');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0208
     * @tc.name JsvmTest208
     * @tc.desc JsvmTest
     */
    it('JsvmTest208', 0, () => {
      let script: string = `escapableHandleScopeTest()`;
      expect(typeof napitest.runJsVm(script)).assertEqual('object');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0209
     * @tc.name JsvmTest209
     * @tc.desc JsvmTest
     */
    it('JsvmTest209', 0, () => {
      let script: string = `escapableHandleScopeTest()`;
      expect(JSON.stringify(napitest.runJsVm(script))).assertEqual('{"name":"Test jsvm_escapable_handle_scope","id":"001"}');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0210
     * @tc.name JsvmTest210
     * @tc.desc JsvmTest
     */
    it('JsvmTest210', 0, () => {
      let script: string = `escapableHandleScopeTest()`;
      expect(napitest.runJsVm(script).name).assertEqual('Test jsvm_escapable_handle_scope');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0211
     * @tc.name JsvmTest211
     * @tc.desc JsvmTest
     */
    it('JsvmTest211', 0, () => {
      let script: string = `escapableHandleScopeTest()`;
      expect(napitest.runJsVm(script).id).assertEqual('001');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0212
     * @tc.name JsvmTest212
     * @tc.desc JsvmTest
     */
    it('JsvmTest212', 0, () => {
      let script: string = `handleScopeTest()`;
      expect(JSON.stringify(napitest.runJsVm(script))).assertEqual('{"name":"test handleScope"}');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0213
     * @tc.name JsvmTest213
     * @tc.desc JsvmTest
     */
    it('JsvmTest213', 0, () => {
      let script: string = `handleScopeTest()`;
      expect(napitest.runJsVm(script).name).assertEqual('test handleScope');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0214
     * @tc.name JsvmTest214
     * @tc.desc JsvmTest
     */
    it('JsvmTest214', 0, () => {
      let script: string = `handleScopeTest()`;
      expect(typeof napitest.runJsVm(script)).assertEqual('object');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0215
     * @tc.name JsvmTest215
     * @tc.desc JsvmTest
     */
    it('JsvmTest215', 0, () => {
      let script: string = `handleScope()`;
      expect(typeof napitest.runJsVm(script)).assertEqual('object');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0216
     * @tc.name JsvmTest216
     * @tc.desc JsvmTest
     */
    it('JsvmTest216', 0, () => {
      let obj = '{ data: 0, message: "hello world"}';
      let script: string = `
        getPropertyNames(${ obj })
    `;
      expect(napitest.runJsVm(script).toString()).assertEqual('data,message');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0217
     * @tc.name JsvmTest217
     * @tc.desc JsvmTest
     */
    it('JsvmTest217', 0, () => {
      let arr = '["one", "two", "three", "four", "five"]';
      let script: string = `
        getPropertyNames(${ arr })
    `;
      expect(napitest.runJsVm(script).toString()).assertEqual('0,1,2,3,4');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0218
     * @tc.name JsvmTest218
     * @tc.desc JsvmTest
     */
    it('JsvmTest218', 0, () => {
      let obj = '{ data: 0, message: "hello world", 50: 1}';
      let script: string = `
        getAllPropertyNames(${ obj })
    `;
      expect(napitest.runJsVm(script).toString()).assertEqual('50,data,message');
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
    it('JsvmTest219', 0, () => {
      let script: string = scriptGlobal + `\n` + `
        const testObject = createNewObject();
        getEnumerableNames(testObject)
    `;
      expect(napitest.runJsVm(script).toString()).assertEqual('normal,writable,configurable,inherited');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0220
     * @tc.name JsvmTest220
     * @tc.desc JsvmTest
     */
    it('JsvmTest220', 0, () => {
      let script: string = scriptGlobal + `\n` + `
        const testObject = createNewObject();
        getOwnWritableNames(testObject)
    `;
      expect(napitest.runJsVm(script).toString()).assertEqual('normal,unenumerable,writable');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0221
     * @tc.name JsvmTest221
     * @tc.desc JsvmTest
     */
    it('JsvmTest221', 0, () => {
      let script: string = scriptGlobal + `\n` + `
        const testObject = createNewObject();
        getEnumerableConfigurableNames(testObject)
    `;
      expect(napitest.runJsVm(script).toString()).assertEqual('normal,configurable,inherited');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0222
     * @tc.name JsvmTest222
     * @tc.desc JsvmTest
     */
    it('JsvmTest222', 0, () => {
      let script: string = scriptGlobal + `\n` + `
        const testObject = createNewObject();
        getOwnConfigurableNames(testObject)
    `;
      expect(napitest.runJsVm(script).toString()).assertEqual('normal,unenumerable,configurable');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0223
     * @tc.name JsvmTest223
     * @tc.desc JsvmTest
     */
    it('JsvmTest223', 0, () => {
      let script: string = `
       let obj = { data: 0, message: "hello world", 50: 1};
       jsvmSetProperty(obj, "code", "hi")
   `;
      expect(napitest.runJsVm(script).code).assertEqual('hi');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0224
     * @tc.name JsvmTest224
     * @tc.desc JsvmTest
     */
    it('JsvmTest224', 0, () => {
      let script: string = `
       let obj = { data: 0, message: "hello world", 50: 1};
       jsvmSetProperty(obj, 50, 12)
   `;
      expect(napitest.runJsVm(script)[50]).assertEqual(12);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0225
     * @tc.name JsvmTest225
     * @tc.desc JsvmTest
     */
    it('JsvmTest225', 0, () => {
      let script: string = `
       let obj = { data: 0, message: "hello world", 50: 1};
       jsvmSetProperty(obj, "true", false)
   `;
      expect(napitest.runJsVm(script).true).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0226
     * @tc.name JsvmTest226
     * @tc.desc JsvmTest
     */
    it('JsvmTest226', 0, () => {
      let script: string = `
       let obj = { data: 0, message: "hello world", 50: 1};
       let objTest = {};
       jsvmSetProperty(obj, "object", objTest)
   `;
      expect(typeof napitest.runJsVm(script).object).assertEqual('object');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0227
     * @tc.name JsvmTest227
     * @tc.desc JsvmTest
     */
    it('JsvmTest227', 0, () => {
      let script: string = `
          setPropertyFailed()
      `;
      const expectedObject: napitest.JSVM_Value = {
        nullptrEnv: 'Invalid argument',
        nullprtObject: 'Invalid argument',
        nullptrValue: 'Invalid argument',
      };
      expect(napitest.runJsVm(script).toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0228
     * @tc.name JsvmTest228
     * @tc.desc JsvmTest
     */
    it('JsvmTest228', 0, () => {
      let script: string = `
     let obj = { data: 0, message: "hello world", 50: 1};
     getProperty(obj, "message")
   `;
      expect(napitest.runJsVm(script)).assertEqual('hello world');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0229
     * @tc.name JsvmTest229
     * @tc.desc JsvmTest
     */
    it('JsvmTest229', 0, () => {
      let script: string = `
     let obj = { data: 0, message: "hello world", 50: 1};
     getProperty(obj, "data")
   `;
      expect(napitest.runJsVm(script)).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0230
     * @tc.name JsvmTest230
     * @tc.desc JsvmTest
     */
    it('JsvmTest230', 0, () => {
      let script: string = `
     let obj = { data: 0, message: "hello world", 50: true};
     getProperty(obj, 50)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0231
     * @tc.name JsvmTest231
     * @tc.desc JsvmTest
     */
    it('JsvmTest231', 0, () => {
      let script: string = `
     let objTest = {};
     let obj = { data: 0, message: "hello world", 50: true, Object: objTest};
     getProperty(obj, "Object")
   `;
      expect(typeof napitest.runJsVm(script)).assertEqual('object');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0232
     * @tc.name JsvmTest232
     * @tc.desc JsvmTest
     */
    it('JsvmTest232', 0, () => {
      let script: string = `
     getPropertyFailed()
   `;
      const expectedObject: napitest.JSVM_Value = {
        nullptrEnv: 'Invalid argument',
        nullprtObject: 'Invalid argument',
        nullptrResult: 'Invalid argument',
      };
      expect(napitest.runJsVm(script).toString()).assertEqual(expectedObject.toString());
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
    it('JsvmTest233', 0, () => {
      let scriptTrue: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     hasProperty(testObject, "normal")
   `;
      expect(napitest.runJsVm(scriptTrue)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0234
     * @tc.name JsvmTest234
     * @tc.desc JsvmTest
     */
    it('JsvmTest234', 0, () => {
      let scriptTrue: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     hasProperty(testObject, 5)
   `;
      expect(napitest.runJsVm(scriptTrue)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0235
     * @tc.name JsvmTest235
     * @tc.desc JsvmTest
     */
    it('JsvmTest235', 0, () => {
      let scriptTrue: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     hasProperty(testObject, fooSymbol)
   `;
      expect(napitest.runJsVm(scriptTrue)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0236
     * @tc.name JsvmTest236
     * @tc.desc JsvmTest
     */
    it('JsvmTest236', 0, () => {
      let scriptTrue: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     hasProperty(testObject, "inherited")
   `;
      expect(napitest.runJsVm(scriptTrue)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0237
     * @tc.name JsvmTest237
     * @tc.desc JsvmTest
     */
    it('JsvmTest237', 0, () => {
      let scriptFalse: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     hasProperty(testObject, "otherProperty")
   `;
      expect(napitest.runJsVm(scriptFalse)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0238
     * @tc.name JsvmTest238
     * @tc.desc JsvmTest
     */
    it('JsvmTest238', 0, () => {
      let script: string = `
     hasPropertyFailed()
   `;
      const expectedObject: napitest.JSVM_Value = {
        nullptrEnv: 'Invalid argument',
        nullprtObject: 'Invalid argument',
        nullprtKey: 'Invalid argument',
        nullptrResult: 'Invalid argument',
      };
      expect(napitest.runJsVm(script).toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0239
     * @tc.name JsvmTest239
     * @tc.desc JsvmTest
     */
    it('JsvmTest239', 0, () => {
      let scriptTrue: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     deleteProperty(testObject, "normal")
   `;
      expect(napitest.runJsVm(scriptTrue)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0240
     * @tc.name JsvmTest240
     * @tc.desc JsvmTest
     */
    it('JsvmTest240', 0, () => {
      let scriptTrue: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     deleteProperty(testObject, 5)
   `;
      expect(napitest.runJsVm(scriptTrue)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0241
     * @tc.name JsvmTest241
     * @tc.desc JsvmTest
     */
    it('JsvmTest241', 0, () => {
      let scriptFalse: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     Object.defineProperty(testObject, "unconfigurable", {
       configurable: false
     });
     deleteProperty(testObject, "unconfigurable")
   `;
      expect(napitest.runJsVm(scriptFalse)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0242
     * @tc.name JsvmTest242
     * @tc.desc JsvmTest
     */
    it('JsvmTest242', 0, () => {
      let scriptFalse: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     Object.freeze(testObject);
     deleteProperty(testObject, "normal")
   `;
      expect(napitest.runJsVm(scriptFalse)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0243
     * @tc.name JsvmTest243
     * @tc.desc JsvmTest
     */
    it('JsvmTest243', 0, () => {
      let script: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     deleteProperty(testObject, "inherited");
     getPropertyNames(testObject)
   `;
      expect(napitest.runJsVm(script).toString()).assertEqual('5,normal,inherited');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0244
     * @tc.name JsvmTest245
     * @tc.desc JsvmTest
     */
    it('JsvmTest245', 0, () => {
      let script: string = `
     deletePropertyFailed()
   `;
      const expectedObject: napitest.JSVM_Value = {
        nullptrEnv: 'Invalid argument',
        nullprtObject: 'Invalid argument',
        nullprtKey: 'Invalid argument',
      };
      expect(napitest.runJsVm(script).toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0246
     * @tc.name JsvmTest246
     * @tc.desc JsvmTest
     */
    it('JsvmTest246', 0, () => {
      let script: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     hasOwnProperty(testObject, "normal")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0247
     * @tc.name JsvmTest247
     * @tc.desc JsvmTest
     */
    it('JsvmTest247', 0, () => {
      let script: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     hasOwnProperty(testObject, "inherited")
   `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0248
     * @tc.name JsvmTest248
     * @tc.desc JsvmTest
     */
    it('JsvmTest248', 0, () => {
      let script: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     hasOwnProperty(testObject, fooSymbol)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0249
     * @tc.name JsvmTest249
     * @tc.desc JsvmTest
     */
    it('JsvmTest249', 0, () => {
      let script: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     hasOwnProperty(testObject, 5)
   `;
      expect(napitest.runJsVm(script)).assertEqual('name expected status.');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0250
     * @tc.name JsvmTest250
     * @tc.desc JsvmTest
     */
    it('JsvmTest250', 0, () => {
      let script: string = scriptProperty + `\n` + `
     const testObject = createNewObject();
     hasOwnProperty(testObject, '5')
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0251
     * @tc.name JsvmTest251
     * @tc.desc JsvmTest
     */
    it('JsvmTest251', 0, () => {
      let script: string = `
     hasOwnPropertyFailed()
   `;
      const expectedObject: napitest.JSVM_Value = {
        nullptrEnv: 'Invalid argument',
        nullprtObject: 'Invalid argument',
        nullprtKey: 'Invalid argument',
        nullptrResult: 'Invalid argument',
      };
      expect(napitest.runJsVm(script).toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0252
     * @tc.name JsvmTest252
     * @tc.desc JsvmTest
     */
    it('JsvmTest252', 0, () => {
      let script: string = `
       setNamedPropertyCreateObject("message")
   `;
      expect(napitest.runJsVm(script).message).assertEqual(1234);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0253
     * @tc.name JsvmTest253
     * @tc.desc JsvmTest
     */
    it('JsvmTest253', 0, () => {
      let script: string = `
       let obj = {};
       setNamedProperty(obj, "name", "strValue");
   `;
      expect(napitest.runJsVm(script).name).assertEqual('strValue');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0254
     * @tc.name JsvmTest0254
     * @tc.desc JsvmTest
     */
    it('JsvmTest0254', 0, () => {
      let script: string = `
       let obj = {data: 0, message: "hello world"};
       setNamedProperty(obj, "message", "strValue");
   `;
      expect(napitest.runJsVm(script).message).assertEqual('strValue');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0255
     * @tc.name JsvmTest0255
     * @tc.desc JsvmTest
     */
    it('JsvmTest0255', 0, () => {
      let script: string = `
       let obj = {data: 0, message: "hello world"};
       Object.freeze(obj);
       setNamedProperty(obj, "message", "strValue");
   `;
      expect(napitest.runJsVm(script).message).not('strValue');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0256
     * @tc.name JsvmTest0256
     * @tc.desc JsvmTest
     */
    it('JsvmTest0256', 0, () => {
      let script: string = `
     setNamedPropertyFailed()
   `;
      const expectedObject: napitest.JSVM_Value = {
        nullptrEnv: 'Invalid argument',
        nullprtObject: 'Invalid argument',
        nullprtKey: 'Invalid argument',
        nullptrResult: 'Invalid argument',
      };
      expect(napitest.runJsVm(script).toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0257
     * @tc.name JsvmTest0257
     * @tc.desc JsvmTest
     */
    it('JsvmTest0257', 0, () => {
      let script: string = `
     let obj = { data: 0, message: "hello world", 50: 1};
     getNamedProperty(obj, "message")
   `;
      expect(napitest.runJsVm(script)).assertEqual('hello world');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0258
     * @tc.name JsvmTest0258
     * @tc.desc JsvmTest
     */
    it('JsvmTest0258', 0, () => {
      let script: string = `
     let obj = { data: 0, message: "hello world", 50: 1};
     getNamedProperty(obj, "data")
   `;
      expect(napitest.runJsVm(script)).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0259
     * @tc.name JsvmTest0259
     * @tc.desc JsvmTest
     */
    it('JsvmTest0259', 0, () => {
      let script: string = `
     let obj = { data: 0, message: "hello world", 50: false};
     getNamedProperty(obj, "50")
   `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0260
     * @tc.name JsvmTest0260
     * @tc.desc JsvmTest
     */
    it('JsvmTest0260', 0, () => {
      let script: string = `
     let obj = { data: 0, message: "hello world", 50: false,
                 newObj: NewObj = {first: 12, second: "two"}};
     getNamedProperty(obj, "newObj")
   `;
      expect(typeof napitest.runJsVm(script)).assertEqual('object');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0261
     * @tc.name JsvmTest0261
     * @tc.desc JsvmTest
     */
    it('JsvmTest0261', 0, () => {
      let script: string = `
     getNamedPropertyFailed()
   `;
      const expectedObject: napitest.JSVM_Value = {
        nullptrEnv: 'Invalid argument',
        nullprtObject: 'Invalid argument',
        nullprtKey: 'Invalid argument',
        nullptrResult: 'Invalid argument',
      };
      expect(napitest.runJsVm(script).toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0262
     * @tc.name JsvmTest0262
     * @tc.desc JsvmTest
     */
    it('JsvmTest0262', 0, () => {
      let script: string = `
     let obj = { str: "bar", num: 42, bol: true,
                 newObj: NewObj = {first: 12, second: "two"}};
     hasNamedProperty(obj, "str")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0263
     * @tc.name JsvmTest0263
     * @tc.desc JsvmTest
     */
    it('JsvmTest0263', 0, () => {
      let script: string = `
     let obj = { str: "bar", num: 42, bol: true,
                 newObj: NewObj = {first: 12, second: "two"}};
     hasNamedProperty(obj, "newObj")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0264
     * @tc.name JsvmTest0264
     * @tc.desc JsvmTest
     */
    it('JsvmTest0264', 0, () => {
      let script: string = `
     let obj = { str: "bar", num: 42, bol: true,
                 newObj: NewObj = {first: 12, second: "two"}};
     hasNamedProperty(obj, "first")
   `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0265
     * @tc.name JsvmTest0265
     * @tc.desc JsvmTest
     */
    it('JsvmTest0265', 0, () => {
      let script: string = `
     hasNamedPropertyFailed()
   `;
      const expectedObject: napitest.JSVM_Value = {
        nullptrEnv: 'Invalid argument',
        nullprtObject: 'Invalid argument',
        nullprtKey: 'Invalid argument',
        nullptrResult: 'Invalid argument',
      };
      expect(napitest.runJsVm(script).toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0266
     * @tc.name JsvmTest0266
     * @tc.desc JsvmTest
     */
    it('JsvmTest0266', 0, () => {
      let script: string = `
       setElementWithLength(3)
   `;
      expect(napitest.runJsVm(script).toString()).assertEqual('2,3,4');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0267
     * @tc.name JsvmTest267
     * @tc.desc JsvmTest
     */
    it('JsvmTest267', 0, () => {
      let script: string = `
     let arr = [];
     setElement(arr, 1, "Hello world!")
   `;
      expect(napitest.runJsVm(script)[1]).assertEqual('Hello world!');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0268
     * @tc.name JsvmTest268
     * @tc.desc JsvmTest
     */
    it('JsvmTest268', 0, () => {
      let script: string = `
     let arr = ["Hello world!", 10, true];
     setElement(arr, 1, "Hello world!")
   `;
      expect(napitest.runJsVm(script)[1]).assertEqual('Hello world!');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0269
     * @tc.name JsvmTest269
     * @tc.desc JsvmTest
     */
    it('JsvmTest269', 0, () => {
      let script: string = `
     setElementFailed()
   `;
      const expectedObject: napitest.JSVM_Value = {
        nullptrEnv: 'Invalid argument',
        nullprtObject: 'Invalid argument',
        nullprtValue: 'Invalid argument',
      };
      expect(napitest.runJsVm(script).toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0270
     * @tc.name JsvmTest270
     * @tc.desc JsvmTest
     */
    it('JsvmTest270', 0, () => {
      let script: string = `
     let arr = [10, 'hello', null, true];
     getElement(arr, 0)
   `;
      expect(napitest.runJsVm(script)).assertEqual(10);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0271
     * @tc.name JsvmTest271
     * @tc.desc JsvmTest
     */
    it('JsvmTest271', 0, () => {
      let script: string = `
     let arr = [10, 'hello', null, true];
     getElement(arr, 1)
   `;
      expect(napitest.runJsVm(script)).assertEqual('hello');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0272
     * @tc.name JsvmTest272
     * @tc.desc JsvmTest
     */
    it('JsvmTest272', 0, () => {
      let script: string = `
     let arr = [10, 'hello', null, true];
     getElement(arr, 2)
   `;
      expect(napitest.runJsVm(script)).assertEqual(null);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0273
     * @tc.name JsvmTest273
     * @tc.desc JsvmTest
     */
    it('JsvmTest273', 0, () => {
      let script: string = `
     let arr = [10, 'hello', null, true];
     getElement(arr, 3)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0274
     * @tc.name JsvmTest274
     * @tc.desc JsvmTest
     */
    it('JsvmTest274', 0, () => {
      let script: string = `
     getElementFailed()
   `;
      const expectedObject: napitest.JSVM_Value = {
        nullptrEnv: 'Invalid argument',
        nullprtObject: 'Invalid argument',
        nullprtValue: 'Invalid argument',
      };
      expect(napitest.runJsVm(script).toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0275
     * @tc.name JsvmTest275
     * @tc.desc JsvmTest
     */
    it('JsvmTest275', 0, () => {
      let scriptTrue: string = `
     let arr = [10, 'hello', null, true];
     hasElement(arr, 0)
   `;
      expect(napitest.runJsVm(scriptTrue)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0276
     * @tc.name JsvmTest276
     * @tc.desc JsvmTest
     */
    it('JsvmTest276', 0, () => {
      let scriptFalse: string = `
     let arr = [10, 'hello', null, true];
     hasElement(arr, 4)
   `;
      expect(napitest.runJsVm(scriptFalse)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0277
     * @tc.name JsvmTest277
     * @tc.desc JsvmTest
     */
    it('JsvmTest277', 0, () => {
      let scriptFalse: string = `
     let arr = [10, 'hello', , true];
     hasElement(arr, 2)
   `;
      expect(napitest.runJsVm(scriptFalse)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0278
     * @tc.name JsvmTest278
     * @tc.desc JsvmTest
     */
    it('JsvmTest278', 0, () => {
      let script: string = `
     hasElementFailed()
   `;
      const expectedObject: napitest.JSVM_Value = {
        nullptrEnv: 'Invalid argument',
        nullprtObject: 'Invalid argument',
        nullprtresult: 'Invalid argument',
      };
      expect(napitest.runJsVm(script).toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0279
     * @tc.name JsvmTest279
     * @tc.desc JsvmTest
     */
    it('JsvmTest279', 0, () => {
      let script: string = `
     let arr = [10, 'hello', null, true];
     deleteElement(arr, 0)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0280
     * @tc.name JsvmTest280
     * @tc.desc JsvmTest
     */
    it('JsvmTest280', 0, () => {
      let script: string = `
     let arr = [10, 'hello', null, true];
     deleteElement(arr, 4)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0281
     * @tc.name JsvmTest281
     * @tc.desc JsvmTest
     */
    it('JsvmTest281', 0, () => {
      let script: string = `
     let arr = [10, 'hello',  , true];
     deleteElement(arr, 2)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0282
     * @tc.name JsvmTest282
     * @tc.desc JsvmTest
     */
    it('JsvmTest282', 0, () => {
      let script: string = `
     let arr = [10, 'hello', 'world', true];
     deleteElementAndCheck(arr, 1)
   `;
      expect(napitest.runJsVm(script).toString()).assertEqual('10,,world,true');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0283
     * @tc.name JsvmTest283
     * @tc.desc JsvmTest
     */
    it('JsvmTest283', 0, () => {
      let script: string = `
     deleteElementFailed()
   `;
      const expectedObject: napitest.JSVM_Value = {
        nullptrEnv: 'Invalid argument',
        nullprtObject: 'Invalid argument',
      };
      expect(napitest.runJsVm(script).toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0284
     * @tc.name JsvmTest284
     * @tc.desc JsvmTest
     */
    it('JsvmTest284', 0, () => {
      let scriptMethod: string = `
       let obj = {};
       defineMethodProperties(obj)
   `;
      expect(napitest.runJsVm(scriptMethod)).assertEqual(26);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0285
     * @tc.name JsvmTest285
     * @tc.desc JsvmTest
     */
    it('JsvmTest285', 0, () => {
      let scriptString: string = `
       let obj = {};
       defineStringProperties(obj)
   `;
      expect(napitest.runJsVm(scriptString)).assertEqual('Hello!');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0286
     * @tc.name JsvmTest286
     * @tc.desc JsvmTest
     */
    it('JsvmTest286', 0, () => {
      let scriptGetter: string = `
       let obj = {};
       defineGetterProperties(obj)
   `;
      expect(napitest.runJsVm(scriptGetter)).assertEqual('Hello world!');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0287
     * @tc.name JsvmTest287
     * @tc.desc JsvmTest
     */
    it('JsvmTest287', 0, () => {
      let script: string = `
     definePropertiesFailed()
   `;
      const expectedObject: napitest.JSVM_Value = {
        nullptrEnv: 'Invalid argument',
        nullprtObject: 'Invalid argument',
        nullptrDescriptorList: 'Invalid argument',
        nullptrUtf8name: 'Invalid argument',
      };
      expect(napitest.runJsVm(script).toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0288
     * @tc.name JsvmTest288
     * @tc.desc JsvmTest
     */
    it('JsvmTest288', 0, () => {
      let script: string = `
     let obj = { data: 55, message: "hello world"};
     objectFreeze(obj)
   `;
      // 输出后的对象还是之前的属性值并未修改、删除或增加
      const expectedObject: napitest.JSVM_Value = {
        data: 55,
        message: 'hello world',
      };
      expect(napitest.runJsVm(script).toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0289
     * @tc.name JsvmTest289
     * @tc.desc JsvmTest
     */
    it('JsvmTest289', 0, () => {
      let script: string = `
     let obj = { data: 55, message: "hello world"};
     objectSeal(obj)
   `;
      // 封闭后的对象可以修改但不能删除和新增
      const expectedObject: napitest.JSVM_Value = {
        data: 12,
        message: 'hello world',
      };
      expect(napitest.runJsVm(script).toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0290
     * @tc.name JsvmTest290
     * @tc.desc JsvmTest
     */
    it('JsvmTest290', 0, () => {
      let script: string = `
     getVersion()
   `;
      expect(napitest.runJsVm(script)).assertEqual(9);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0291
     * @tc.name JsvmTest291
     * @tc.desc JsvmTest
     */
    it('JsvmTest291', 0, () => {
      let script: string = `
       getVersionFailed()
   `;
      const expectedObject: napitest.JSVM_Value = {
        nullptrEnv: 'Invalid argument',
        nullptrResult: 'Invalid argument',
      };
      expect(napitest.runJsVm(script).toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0292
     * @tc.name JsvmTest292
     * @tc.desc JsvmTest
     */
    it('JsvmTest292', 0, () => {
      let script: string = `
       getVMInfo()
   `;
      expect(napitest.runJsVm(script)).assertEqual(1);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0293
     * @tc.name JsvmTest293
     * @tc.desc JsvmTest
     */
    it('JsvmTest293', 0, () => {
      let script: string = `
       jsonParseNumber()
   `;
      expect(napitest.runJsVm(script)).assertEqual(10.555);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0294
     * @tc.name JsvmTest294
     * @tc.desc JsvmTest
     */
    it('JsvmTest294', 0, () => {
      let script: string = `
       jsonParseObject()
   `;
      const expectedObject: napitest.JSVM_Value = {
        first: 'one',
        second: 'two',
      };
      expect(napitest.runJsVm(script).toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0295
     * @tc.name JsvmTest295
     * @tc.desc JsvmTest
     */
    it('JsvmTest295', 0, () => {
      let script: string = `
     let strTrue = "true";
     jsonParse(strTrue)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0296
     * @tc.name JsvmTest296
     * @tc.desc JsvmTest
     */
    it('JsvmTest296', 0, () => {
      let script: string = `
     let strNull = "null"
     jsonParse(strNull)
   `;
      expect(napitest.runJsVm(script)).assertEqual(null);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0297
     * @tc.name JsvmTest297
     * @tc.desc JsvmTest
     */
    it('JsvmTest297', 0, () => {
      let script: string = `
       jsonParseFailed()
   `;
      const expectedObject: napitest.JSVM_Value = {
        nullptrEnv: 'Invalid argument',
        nullptrJsonString: 'Invalid argument',
      };
      expect(napitest.runJsVm(script).toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0298
     * @tc.name JsvmTest298
     * @tc.desc JsvmTest
     */
    it('JsvmTest298', 0, () => {
      let script: string = `
     let arr = [1, 2, 3, 4, 5];
     jsonStringify(arr)
   `;
      expect(napitest.runJsVm(script)).assertEqual('[1,2,3,4,5]');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0299
     * @tc.name JsvmTest299
     * @tc.desc JsvmTest
     */
    it('JsvmTest299', 0, () => {
      let script: string = `
     let obj = {data: 0, message: "hello world"};
     jsonStringify(obj)
   `;
      expect(napitest.runJsVm(script)).assertEqual('{"data":0,"message":"hello world"}');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0300
     * @tc.name JsvmTest300
     * @tc.desc JsvmTest
     */
    it('JsvmTest300', 0, () => {
      let script: string = `
     let obj = {data: 0, message: "hello world",
                innerObj: InnerObj = {info: 123}};
     jsonStringify(obj)
   `;
      expect(napitest.runJsVm(script)).assertEqual('{"data":0,"message":"hello world","innerObj":{"info":123}}');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0301
     * @tc.name JsvmTest301
     * @tc.desc JsvmTest
     */
    it('JsvmTest301', 0, () => {
      let script: string = `
     let num = 12.003;
     jsonStringify(num)
   `;
      expect(napitest.runJsVm(script)).assertEqual('12.003');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0302
     * @tc.name JsvmTest302
     * @tc.desc JsvmTest
     */
    it('JsvmTest302', 0, () => {
      let script: string = `
       jsonStringifyFailed()
   `;
      const expectedObject: napitest.JSVM_Value = {
        nullptrEnv: 'Invalid argument',
        nullptrJsonObject: 'Invalid argument',
      };
      expect(napitest.runJsVm(script).toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0303
     * @tc.name JsvmTest303
     * @tc.desc JsvmTest
     */
    it('JsvmTest303', 0, () => {
      let script: string = `
       function returnNumber(){
           return 10;
       }
       callFunction(returnNumber)
   `;
      expect(napitest.runJsVm(script)).assertEqual(10);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0304
     * @tc.name JsvmTest304
     * @tc.desc JsvmTest
     */
    it('JsvmTest304', 0, () => {
      let script: string = `
       function concatStr(a, b){
           return a + b;
       }
       callFunctionWithArg(concatStr)
   `;
      expect(napitest.runJsVm(script)).assertEqual('Hello World!');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0305
     * @tc.name JsvmTest305
     * @tc.desc JsvmTest
     */
    it('JsvmTest305', 0, () => {
      let script: string = `
     let obj = {myMethod: function(arg1, arg2) {
         return arg1 + arg2;
       }}
     callFunctionWithObject(obj)
   `;
      expect(napitest.runJsVm(script)).assertEqual(52);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0306
     * @tc.name JsvmTest306
     * @tc.desc JsvmTest
     */
    it('JsvmTest306', 0, () => {
      let script: string = `
       function returnNumber(){
           return 10;
       }
       callFunctionFailed(returnNumber)
   `;
      const expectedObject: napitest.JSVM_Value = {
        nullptrEnv: 'Invalid argument',
        nullprtGlobal: 'Invalid argument',
        nullprtArgv: 'Invalid argument',
        nullptrFunc: 'Invalid argument',
      };
      expect(napitest.runJsVm(script).toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0307
     * @tc.name JsvmTest307
     * @tc.desc JsvmTest
     */
    it('JsvmTest307', 0, () => {
      let script: string = `
        createFunction()
   `;
      expect(napitest.runJsVm(script)).assertEqual(7);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0308
     * @tc.name JsvmTest308
     * @tc.desc JsvmTest
     */
    it('JsvmTest308', 0, () => {
      let script: string = `
        createFunctionFailed()
   `;
      const expectedObject: napitest.JSVM_Value = {
        nullptrEnv: 'Invalid argument',
        nullprtCD: 'Invalid argument',
        nullptrResult: 'Invalid argument',
      };
      expect(napitest.runJsVm(script).toString()).assertEqual(expectedObject.toString());
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0309
     * @tc.name JsvmTest309
     * @tc.desc JsvmTest
     */
    it('JsvmTest309', 0, () => {
      let script: string = `
        getHeapStatistics()
   `;
      expect(napitest.runJsVm(script)).assertEqual(1);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0310
     * @tc.name JsvmTest310
     * @tc.desc JsvmTest
     */
    it('JsvmTest310', 0, () => {
      let script: string = `
       getVM()
   `;
      expect(napitest.runJsVm(script)).assertTrue();
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0311
     * @tc.name JsvmTest311
     * @tc.desc JsvmTest
     */
    it('JsvmTest311', 0, () => {
      let script: string = `
        getTypeof(1111);
     `;
      expect(napitest.runJsVm(script)).assertEqual('number');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0312
     * @tc.name JsvmTest312
     * @tc.desc JsvmTest
     */
    it('JsvmTest312', 0, () => {
      let script: string = `
        getTypeof("1111");
     `;
      expect(napitest.runJsVm(script)).assertEqual('string');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0313
     * @tc.name JsvmTest313
     * @tc.desc JsvmTest
     */
    it('JsvmTest313', 0, () => {
      let script: string = `
        getTypeof(true);
     `;
      expect(napitest.runJsVm(script)).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0314
     * @tc.name JsvmTest314
     * @tc.desc JsvmTest
     */
    it('JsvmTest314', 0, () => {
      let script: string = `
        let obj = {
          data: 1
        }
        getTypeof(obj);
     `;
      expect(napitest.runJsVm(script)).assertEqual('object');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0315
     * @tc.name JsvmTest315
     * @tc.desc JsvmTest
     */
    it('JsvmTest315', 0, () => {
      let script: string = `
        getTypeof(null);
     `;
      expect(napitest.runJsVm(script)).assertEqual('null');
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0316
     * @tc.name JsvmTest316
     * @tc.desc JsvmTest
     */
    it('JsvmTest316', 0, () => {
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
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0317
     * @tc.name JsvmTest317
     * @tc.desc JsvmTest
     */
    it('JsvmTest317', 0, () => {
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
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0318
     * @tc.name JsvmTest318
     * @tc.desc JsvmTest
     */
    it('JsvmTest318', 0, () => {
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
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0319
     * @tc.name JsvmTest319
     * @tc.desc JsvmTest
     */
    it('JsvmTest319', 0, () => {
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
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0320
     * @tc.name JsvmTest320
     * @tc.desc JsvmTest
     */
    it('JsvmTest320', 0, () => {
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
      expect(napitest.runJsVm(script)).assertEqual(true);
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0321
     * @tc.name JsvmTest321
     * @tc.desc JsvmTest
     */
    it('JsvmTest321', 0, () => {
      let data = '[1, 2, 3, 4, 5]';
      let script: string = `
         isArray(${ data })
       `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0322
     * @tc.name JsvmTest322
     * @tc.desc JsvmTest
     */
    it('JsvmTest322', 0, () => {
      let data = '2,3,4,5';
      let script: string = `
         isArray(${ data })
       `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0323
     * @tc.name JsvmTest323
     * @tc.desc JsvmTest
     */
    it('JsvmTest323', 0, () => {
      let script: string = `
          let data = [{
             data: 1
           }]
           isArray(data)
       `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0324
     * @tc.name JsvmTest324
     * @tc.desc JsvmTest
     */
    it('JsvmTest324', 0, () => {
      let script: string = `
          let data = []
           isArray(data)
       `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0325
     * @tc.name JsvmTest325
     * @tc.desc JsvmTest
     */
    it('JsvmTest325', 0, () => {
      let script: string = `
          let data = 'Hello';
          isArray(data);
       `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0326
     * @tc.name JsvmTest326
     * @tc.desc JsvmTest
     */
    it('JsvmTest326', 0, () => {
      let script: string = `
         isArrayBuffer(new ArrayBuffer(8))
       `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0327
     * @tc.name JsvmTest327
     * @tc.desc JsvmTest
     */
    it('JsvmTest327', 0, () => {
      let script: string = `
      isArrayBuffer('hello')
      `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0328
     * @tc.name JsvmTest328
     * @tc.desc JsvmTest
     */
    it('JsvmTest328', 0, () => {
      let script: string = `
      isArrayBuffer(new Uint8Array([1, 2, 3]).buffer)
       `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0329
     * @tc.name JsvmTest329
     * @tc.desc JsvmTest
     */
    it('JsvmTest329', 0, () => {
      let script: string = `
      isArrayBuffer(null)
      `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0330
     * @tc.name JsvmTest330
     * @tc.desc JsvmTest
     */
    it('JsvmTest330', 0, () => {
      let script: string = `
      isArrayBuffer({})
      `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0331
     * @tc.name JsvmTest331
     * @tc.desc JsvmTest
     */
    it('JsvmTest331', 0, () => {
      let script: string = `
         isTypedarray(new Uint16Array([1, 2, 3, 4]))
       `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0332
     * @tc.name JsvmTest332
     * @tc.desc JsvmTest
     */
    it('JsvmTest332', 0, () => {
      let script: string = `
         isTypedarray('hello')
      `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0333
     * @tc.name JsvmTest333
     * @tc.desc JsvmTest
     */
    it('JsvmTest333', 0, () => {
      let script: string = `
         isTypedarray(new Uint8Array([1, 2, 3]))
      `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0334
     * @tc.name JsvmTest334
     * @tc.desc JsvmTest
     */
    it('JsvmTest334', 0, () => {
      let script: string = `
         isTypedarray(null)
       `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0335
     * @tc.name JsvmTest335
     * @tc.desc JsvmTest
     */
    it('JsvmTest335', 0, () => {
      let script: string = `
        isTypedarray({})
       `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0336
     * @tc.name JsvmTest336
     * @tc.desc JsvmTest
     */
    it('JsvmTest336', 0, () => {
      let script: string = `
      let buffer = new ArrayBuffer(16);
      let dataView = new DataView(buffer);
      isDataView(dataView);
        `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0337
     * @tc.name JsvmTest337
     * @tc.desc JsvmTest
     */
    it('JsvmTest337', 0, () => {
      let script: string = `
    isDataView('hello')
  `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0338
     * @tc.name JsvmTest338
     * @tc.desc JsvmTest
     */
    it('JsvmTest338', 0, () => {
      let script: string = `
    let buffer = new ArrayBuffer(32);
    let dataView = new DataView(buffer, 8, 16);
    isDataView(dataView);
  `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0339
     * @tc.name JsvmTest339
     * @tc.desc JsvmTest
     */
    it('JsvmTest339', 0, () => {
      let script: string = `
    isDataView(null)
  `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0340
     * @tc.name JsvmTest340
     * @tc.desc JsvmTest
     */
    it('JsvmTest340', 0, () => {
      let script: string = `
    isDataView({})
  `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0341
     * @tc.name JsvmTest341
     * @tc.desc JsvmTest
     */
    it('JsvmTest341', 0, () => {
      let script: string = `
        let str = '123';
        let num = 123;
        isStrictEquals(str,num);
        `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0342
     * @tc.name JsvmTest342
     * @tc.desc JsvmTest
     */
    it('JsvmTest342', 0, () => {
      let script: string = `
        let str = 'hello';
        let testStr = 'hello';
        isStrictEquals(str, testStr);
    `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0343
     * @tc.name JsvmTest343
     * @tc.desc JsvmTest
     */
    it('JsvmTest343', 0, () => {
      let script: string = `
        let str = 'hello';
        let testStr = 'hell';
        isStrictEquals(str, testStr);
      `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0344
     * @tc.name JsvmTest344
     * @tc.desc JsvmTest
     */
    it('JsvmTest344', 0, () => {
      let script: string = `
        let testNum = 123;
        let num = 123;
        isStrictEquals(num,testNum);
      `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0345
     * @tc.name JsvmTest345
     * @tc.desc JsvmTest
     */
    it('JsvmTest345', 0, () => {
      let script: string = `
        let obj = {
            data: 1
        };
        let testObj = obj
        isStrictEquals(obj, testObj);
      `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0346
     * @tc.name JsvmTest346
     * @tc.desc JsvmTest
     */
    it('JsvmTest346', 0, () => {
      let script: string = `
        let arrayBuffer = new ArrayBuffer(10);
        isDetachedArraybuffer(arrayBuffer);
      `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0347
     * @tc.name JsvmTest347
     * @tc.desc JsvmTest
     */
    it('JsvmTest347', 0, () => {
      let script: string = `
        let arrayBuffer = new ArrayBuffer(10);
        isDetachedArraybuffer(isDetachedArraybuffer(arrayBuffer));
      `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0348
     * @tc.name JsvmTest348
     * @tc.desc JsvmTest
     */
    it('JsvmTest348', 0, () => {
      let script: string = `
        coerceToNumber(true)
      `;
      expect(napitest.runJsVm(script)).assertEqual(1);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0349
     * @tc.name JsvmTest349
     * @tc.desc JsvmTest
     */
    it('JsvmTest349', 0, () => {
      let script: string = `
           coerceToNumber(false)
       `;
      expect(napitest.runJsVm(script)).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0350
     * @tc.name JsvmTest350
     * @tc.desc JsvmTest
     */
    it('JsvmTest350', 0, () => {
      let data = '123';
      let script: string = `
           coerceToNumber(${ data })
       `;
      expect(napitest.runJsVm(script)).assertEqual(123);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0351
     * @tc.name JsvmTest351
     * @tc.desc JsvmTest
     */
    it('JsvmTest351', 0, () => {
      let obj = `{ data : 1}`;
      let script: string = `
           coerceToNumber(${ obj })
       `;
      expect(napitest.runJsVm(script)).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0352
     * @tc.name JsvmTest352
     * @tc.desc JsvmTest
     */
    it('JsvmTest352', 0, () => {
      let script: string = `
           coerceToNumber('sss')
       `;
      expect(napitest.runJsVm(script)).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0353
     * @tc.name JsvmTest353
     * @tc.desc JsvmTest
     */
    it('JsvmTest353', 0, () => {
      let script: string = `
           coerceToObject("dad")
       `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0354
     * @tc.name JsvmTest354
     * @tc.desc JsvmTest
     */
    it('JsvmTest354', 0, () => {
      let script: string = `
           coerceToObject(11111111)
       `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0355
     * @tc.name JsvmTest355
     * @tc.desc JsvmTest
     */
    it('JsvmTest355', 0, () => {
      let script: string = `
           coerceToObject(true)
       `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0356
     * @tc.name JsvmTest356
     * @tc.desc JsvmTest
     */
    it('JsvmTest356', 0, () => {
      let script: string = `
           coerceToString(22222)
       `;
      expect(napitest.runJsVm(script)).assertEqual('22222');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0357
     * @tc.name JsvmTest357
     * @tc.desc JsvmTest
     */
    it('JsvmTest357', 0, () => {
      let script: string = `
           coerceToString(true)
       `;
      expect(napitest.runJsVm(script)).assertEqual('true');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0358
     * @tc.name JsvmTest358
     * @tc.desc JsvmTest
     */
    it('JsvmTest358', 0, () => {
      let script: string = `
        let obj = {
             data: 1
            }
        coerceToString(obj)
       `;
      expect(typeof napitest.runJsVm(script)).assertEqual('string');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0359
     * @tc.name JsvmTest359
     * @tc.desc JsvmTest
     */
    it('JsvmTest359', 0, () => {
      let script: string = `
        coerceToString(undefined)
       `;
      expect(napitest.runJsVm(script)).assertEqual('undefined');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0360
     * @tc.name JsvmTest360
     * @tc.desc JsvmTest
     */
    it('JsvmTest360', 0, () => {
      let script: string = `
        coerceToString(null)
       `;
      expect(napitest.runJsVm(script)).assertEqual('null');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0361
     * @tc.name JsvmTest361
     * @tc.desc JsvmTest
     */
    it('JsvmTest361', 0, () => {
      let script: string = `
           coerceToBool("123")
       `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0362
     * @tc.name JsvmTest362
     * @tc.desc JsvmTest
     */
    it('JsvmTest362', 0, () => {
      let script: string = `
           coerceToBool(0)
       `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0363
     * @tc.name JsvmTest363
     * @tc.desc JsvmTest
     */
    it('JsvmTest363', 0, () => {
      let script: string = `
           coerceToBool("true")
       `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0364
     * @tc.name JsvmTest364
     * @tc.desc JsvmTest
     */
    it('JsvmTest364', 0, () => {
      let script: string = `
           coerceToBool("")
       `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0365
     * @tc.name JsvmTest365
     * @tc.desc JsvmTest
     */
    it('JsvmTest365', 0, () => {
      let script: string = `
           let obj = { value:1 }
           coerceToBool(obj)
       `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0366
     * @tc.name JsvmTest366
     * @tc.desc JsvmTest
     */
    it('JsvmTest366', 0, () => {
      let script: string = `
          let value = Promise.resolve();
          isPromise(value);
        `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0367
     * @tc.name JsvmTest367
     * @tc.desc JsvmTest
     */
    it('JsvmTest367', 0, () => {
      let script: string = `
          let value = Promise.resolve();
          isPromise(value);
        `;
      expect(typeof napitest.runJsVm(script)).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0368
     * @tc.name JsvmTest368
     * @tc.desc JsvmTest
     */
    it('JsvmTest368', 0, () => {
      let script: string = `
          let value = 111;
          isPromise(value);
        `;
      expect(typeof napitest.runJsVm(script)).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0369
     * @tc.name JsvmTest369
     * @tc.desc JsvmTest
     */
    it('JsvmTest369', 0, () => {
      let script: string = `
          let value = 111;
          isPromise(value);
        `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0370
     * @tc.name JsvmTest370
     * @tc.desc JsvmTest
     */
    it('JsvmTest370', 0, () => {
      let script: string = `
          let value = Promise.reject();
          isPromise(value);
        `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0371
     * @tc.name JsvmTest371
     * @tc.desc JsvmTest
     */
    it('JsvmTest371', 0, () => {
      let script: string = `
          createPromise();
        `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0372
     * @tc.name JsvmTest372
     * @tc.desc JsvmTest
     */
    it('JsvmTest372', 0, () => {
      let script: string = `
          createPromise();
        `;
      expect(typeof napitest.runJsVm(script)).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0373
     * @tc.name JsvmTest373
     * @tc.desc JsvmTest
     */
    it('JsvmTest373', 0, () => {
      let script: string = `
         resolveRejectDeferred('success','fail', true)
        `;
      expect(typeof napitest.runJsVm(script)).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0374
     * @tc.name JsvmTest374
     * @tc.desc JsvmTest
     */
    it('JsvmTest374', 0, () => {
      let script: string = `
         resolveRejectDeferred('success','fail', true)
        `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0375
     * @tc.name JsvmTest375
     * @tc.desc JsvmTest
     */
    it('JsvmTest375', 0, () => {
      let script: string = `
         const str = 'message';
         getCbArgs(str);
        `;
      expect(napitest.runJsVm(script)).assertEqual('message');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0376
     * @tc.name JsvmTest376
     * @tc.desc JsvmTest
     */
    it('JsvmTest376', 0, () => {
      let script: string = `
         const str = 'message';
         getCbArgs(str);
        `;
      expect(typeof napitest.runJsVm(script)).assertEqual('string');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0377
     * @tc.name JsvmTest377
     * @tc.desc JsvmTest
     */
    it('JsvmTest377', 0, () => {
      let script: string = `
         function Fruit(name) {
             this.name = name;
         }
         newInstance(Fruit, "apple");
        `;
      expect(typeof napitest.runJsVm(script)).assertEqual('object');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0378
     * @tc.name JsvmTest378
     * @tc.desc JsvmTest
     */
    it('JsvmTest378', 0, () => {
      let script: string = `
         function Fruit(name) {
             this.name = name;
         }
         newInstance(Fruit, "apple");
        `;
      expect(napitest.runJsVm(script).name).assertEqual('apple');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0379
     * @tc.name JsvmTest379
     * @tc.desc JsvmTest
     */
    it('JsvmTest379', 0, () => {
      let script: string = `
         class Obj {
           data;
           message;
         }
         let obj= { data: 0, message: "hello world"};
         setTypeTagToObject(obj, 0)
       `;
      expect(typeof napitest.runJsVm(script)).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0380
     * @tc.name JsvmTest380
     * @tc.desc JsvmTest
     */
    it('JsvmTest380', 0, () => {
      let script: string = `
         class Obj {
           data;
           message;
         }
         let obj= { data: 0, message: "hello world"};
         setTypeTagToObject(obj, 0)
       `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0381
     * @tc.name JsvmTest381
     * @tc.desc JsvmTest
     */
    it('JsvmTest381', 0, () => {
      let script: string = `
         class Obj {
           data;
           message;
         }
         let obj= { data: 0, message: "hello world"};
         setTypeTagToObject(obj,0)
         checkObjectTypeTag(obj,0);
       `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0382
     * @tc.name JsvmTest382
     * @tc.desc JsvmTest
     */
    it('JsvmTest382', 0, () => {
      let script: string = `
         class Obj {
           data;
           message;
         }
         let obj= { data: 0, message: "hello world"};
         setTypeTagToObject(obj,0)
         checkObjectTypeTag(obj,0);
       `;
      expect(typeof napitest.runJsVm(script)).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0383
     * @tc.name JsvmTest383
     * @tc.desc JsvmTest
     */
    it('JsvmTest383', 0, () => {
      let script: string = `
         adjustExternalMemory()
        `;
      expect(typeof napitest.runJsVm(script)).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0384
     * @tc.name JsvmTest384
     * @tc.desc JsvmTest
     */
    it('JsvmTest384', 0, () => {
      let script: string = `
         adjustExternalMemory()
        `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0385
     * @tc.name JsvmTest385
     * @tc.desc JsvmTest
     */
    it('JsvmTest385', 0, () => {
      let script: string = `
         memoryPressureNotification();
        `;
      expect(napitest.runJsVm(script)).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0386
     * @tc.name JsvmTest386
     * @tc.desc JsvmTest
     */
    it('JsvmTest386', 0, () => {
      let script: string = `
         memoryPressureNotification();
        `;
      expect(typeof napitest.runJsVm(script)).assertEqual('number');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0387
     * @tc.name JsvmTest387
     * @tc.desc JsvmTest
     */
    it('JsvmTest387', 0, () => {
      class Obj {
      }

      let obj: Obj = `{}`;
      let script: string = `
        wrapObject(${ obj });
        `;
      expect(typeof napitest.runJsVm(script)).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0388
     * @tc.name JsvmTest388
     * @tc.desc JsvmTest
     */
    it('JsvmTest388', 0, () => {
      class Obj {
      }

      let obj: Obj = `{}`;
      let script: string = `
        wrapObject(${ obj });
        `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0389
     * @tc.name JsvmTest389
     * @tc.desc JsvmTest
     */
    it('JsvmTest389', 0, () => {
      class Obj {
      }

      let obj: Obj = `{}`;
      let script: string = `
        removeWrap(${ obj });
        `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0390
     * @tc.name JsvmTest390
     * @tc.desc JsvmTest
     */
    it('JsvmTest390', 0, () => {
      class Obj {
      }

      let obj: Obj = `{}`;
      let script: string = `
        removeWrap(${ obj });
        `;
      expect(typeof napitest.runJsVm(script)).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0391
     * @tc.name JsvmTest391
     * @tc.desc JsvmTest
     */
    it('JsvmTest391', 0, () => {
      let script: string = `handleScopeFor()`;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0392
     * @tc.name JsvmTest392
     * @tc.desc JsvmTest
     */
    it('JsvmTest392', 0, () => {
      expect(JSON.parse(napitest.runJsVm('defineClass')).name).assertEqual('lilei');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0393
     * @tc.name JsvmTest393
     * @tc.desc JsvmTest
     */
    it('JsvmTest393', 0, () => {
      expect(typeof napitest.runJsVm('defineClass')).assertEqual('string');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0394
     * @tc.name JsvmTest394
     * @tc.desc JsvmTest
     */
    it('JsvmTest394', 0, () => {
      let script: string = `
          createSnapshotFailed()
      `;
      expect(napitest.runJsVm(script)).assertEqual('generic failure status.');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0395
     * @tc.name JsvmTest395
     * @tc.desc JsvmTest
     */
    it('JsvmTest395', 0, () => {
      let script: string = `
          createSnapshotFailed()
      `;
      expect(napitest.runJsVm(script)).assertEqual('generic failure status.');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0396
     * @tc.name JsvmTest396
     * @tc.desc JsvmTest
     */
    it('JsvmTest396', 0, () => {
      let script: string = `
          debugCodeUsingCpuProfiler()
      `;
      expect(napitest.runJsVm(script)).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0397
     * @tc.name JsvmTest397
     * @tc.desc JsvmTest
     */
    it('JsvmTest397', 0, () => {
      let script: string = `
          takeHeapSnapshot()
      `;
      expect(napitest.runJsVm(script)).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0398
     * @tc.name JsvmTest398
     * @tc.desc JsvmTest
     */
    it('JsvmTest398', 0, () => {
      let script: string = `
          debugCodeUsingInspector()
      `;
      expect(napitest.runJsVm(script)).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0399
     * @tc.name JsvmTest399
     * @tc.desc JsvmTest
     */
    it('JsvmTest399', 0, () => {
      let script: string = `
          waitForDebuggerFailed()
      `;
      const expectedObject: napitest.JSVM_Value = {
        nullptrEnv: 'Invalid argument',
        notConnected: 'JSVM_status::JSVM_OK',
      };
      expect(napitest.runJsVm(script).toString()).assertEqual(expectedObject.toString());
    });
	/**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0400
     * @tc.name      JsvmTest400
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0400', 0, () => {
      try {
        let script: string = `
            jsVmThrow();
        `;
        napitest.runJsVm(script);
        expect(true).assertEqual(false);
      } catch (e) {
        expect(true).assertEqual(true);
      }
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0401
     * @tc.name JsvmTest401
     * @tc.desc JsvmTest
     */
    it('JsvmTest0401', 0, () => {
      let script: string = `
            jsVmThrowFromJS(Error());
       `;
      try {
        napitest.runJsVm(script);
        expect(true).assertFalse();
      } catch (error) {
        expect(true).assertTrue();
      }
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0402
     * @tc.name JsvmTest0402
     * @tc.desc JsvmTest
     */
    it('JsvmTest0402', 0, () => {
      let script: string = `
            jsVmThrowError()
       `;
      try {
        napitest.runJsVm(script);
        expect(true).assertFalse();
      } catch (e) {
        expect(true).assertTrue();
      }
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0403
     * @tc.name JsvmTest0403
     * @tc.desc JsvmTest
     */
    it('JsvmTest0403', 0, () => {
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
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0404
     * @tc.name JsvmTest0404
     * @tc.desc JsvmTest
     */
    it('JsvmTest0404', 0, () => {
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
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0405
     * @tc.name JsvmTest0405
     * @tc.desc JsvmTest
     */
    it('JsvmTest0405', 0, () => {
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
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0406
     * @tc.name JsvmTest0406
     * @tc.desc JsvmTest
     */
    it('JsvmTest0406', 0, () => {
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
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0407
     * @tc.name JsvmTest0407
     * @tc.desc JsvmTest
     */
    it('JsvmTest0407', 0, () => {
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
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0408
     * @tc.name JsvmTest0408
     * @tc.desc JsvmTest
     */
    it('JsvmTest0408', 0, () => {
      let script: string =
        `
            jsVmIsError(Error())
       `;
      expect(napitest.runJsVm(script)).assertTrue();
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0409
     * @tc.name JsvmTest0409
     * @tc.desc JsvmTest
     */
    it('JsvmTest0409', 0, () => {
      let script: string =
        `
            jsVmIsError("2333")
       `;
      expect(napitest.runJsVm(script)).assertFalse();
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0410
     * @tc.name JsvmTest0410
     * @tc.desc JsvmTest
     */
    it('JsvmTest0410', 0, () => {
      let script: string =
        `
           let error = jsVmCreateError()
           error instanceof Error;
       `;
      expect(napitest.runJsVm(script)).assertTrue();
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0411
     * @tc.name JsvmTest0411
     * @tc.desc JsvmTest
     */
    it('JsvmTest0411', 0, () => {
      let script: string =
        `
            let error = jsVmCreateTypeError()
           error instanceof TypeError;
       `;
      expect(napitest.runJsVm(script)).assertTrue();
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0412
     * @tc.name JsvmTest0412
     * @tc.desc JsvmTest
     */
    it('JsvmTest0412', 0, () => {
      let script: string =
        `
            let error = jsVmCreateRangeError()
            error instanceof RangeError;
       `;
      expect(napitest.runJsVm(script)).assertTrue();
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0413
     * @tc.name JsvmTest0413
     * @tc.desc JsvmTest
     */
    it('JsvmTest0413', 0, () => {
      let script: string =
        `
             let error = jsVmCreateSyntaxError()
             error instanceof SyntaxError;
       `;
      expect(napitest.runJsVm(script)).assertTrue();
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0414
     * @tc.name JsvmTest0414
     * @tc.desc JsvmTest
     */
    it('JsvmTest0414', 0, () => {
      let script: string = `
          jsVmGetAndClearLastException().message
      `;
      expect(napitest.runJsVm(script)).assertEqual('OH_JSVM_ThrowError');
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0415
     * @tc.name JsvmTest0415
     * @tc.desc JsvmTest
     */
    it('JsvmTest0415', 0, () => {
      let script: string = `
          jsVmIsExceptionPending().message
      `;
      expect(napitest.runJsVm(script)).assertEqual('OH_JSVM_ThrowError');
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0416
     * @tc.name JsvmTest0416
     * @tc.desc JsvmTest
     */
    it('JsvmTest0416', 0, () => {
      let script: string =`
          jsVmGetLastErrorInfo()
      `;
      expect(napitest.runJsVm(script)).assertEqual(1);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0417
     * @tc.name      JsvmTest0417
     * @tc.desc      Test the functions of the OH_JSVM_SetInstanceData interfaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0417', 0, () => {
      let script: string = `
          setInstanceData(1)
      `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0418
     * @tc.name      JsvmTest0418
     * @tc.desc      Test the functions of the OH_JSVM_GetInstanceData interfaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
	it('JsvmTest0418', 0, () => {
      let script: string = `
          getInstanceData()
      `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0419
     * @tc.name JsvmTest0419
     * @tc.desc JsvmTest
     */
    it('JsvmTest0419', 0, () => {
      let data = '[0, 1, 2, 3, 4, 5]';
      let script: string = `
          getArrayLength(${data})
       `;
      expect(napitest.runJsVm(script)).assertEqual(6);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0420
     * @tc.name JsvmTest0420
     * @tc.desc JsvmTest
     */
    it('JsvmTest0420', 0, () => {
      let data = '[]';
      let script: string = `
          getArrayLength(${data})
       `;
      expect(napitest.runJsVm(script)).assertEqual(0);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0421
     * @tc.name JsvmTest0421
     * @tc.desc JsvmTest
     */
    it('JsvmTest0421', 0, () => {
      let data = '1';
      let script: string = `
          getArrayLength(${data})
       `;
      expect(napitest.runJsVm(script)).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0422
     * @tc.name JsvmTest0422
     * @tc.desc JsvmTest
     */
    it('JsvmTest0422', 0, () => {
      let data = `'a'`;
      let script: string = `
          getArrayLength(${data})
       `;
      expect(napitest.runJsVm(script)).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0423
     * @tc.name JsvmTest0423
     * @tc.desc JsvmTest
     */
    it('JsvmTest0423', 0, () => {
      let data = `'中'`;
      let script: string = `
          getArrayLength(${data})
       `;
      expect(napitest.runJsVm(script)).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0424
     * @tc.name JsvmTest0424
     * @tc.desc JsvmTest
     */
    it('JsvmTest0424', 0, () => {
      let data = `'￥%……&*'`;
      let script: string = `
          getArrayLength(${data})
       `;
      expect(napitest.runJsVm(script)).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0425
     * @tc.name JsvmTest0425
     * @tc.desc JsvmTest
     */
    it("JsvmTest0425", 0, () => {
      let script: string = `
          isDate(new Date())
       `
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0426
     * @tc.name JsvmTest0426
     * @tc.desc JsvmTest
     */
    it("JsvmTest0426", 0, () => {
      let script: string = `
          isDate('2024-04-16T12:00:00')
       `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0427
     * @tc.name JsvmTest0427
     * @tc.desc JsvmTest
     */
    it("JsvmTest0427", 0, () => {
      let script: string = `
          isDate(1649942400000)
      `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0428
     * @tc.name JsvmTest0428
     * @tc.desc JsvmTest
     */
    it("JsvmTest0428", 0, () => {
      let script: string = `
          isDate('Invalid Date')
      `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0429
     * @tc.name JsvmTest0429
     * @tc.desc JsvmTest
     */
    it("JsvmTest0429", 0, () => {
      let script: string = `
          isDate({})
      `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
	/**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0430
     * @tc.name JsvmTest0430
     * @tc.desc JsvmTest
     */
    it('JsvmTest0430', 0, () => {
      let script: string = `
        createStringUtf8()
      `;
      expect(napitest.runJsVm(script)).assertEqual('你好, World!, successes to create UTF-8 string!');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0431
     * @tc.name JsvmTest0431
     * @tc.desc JsvmTest
     */
    it('JsvmTest0431', 0, () => {
      let script: string = `
        createStringUtf8(45)
      `;
      expect(napitest.runJsVm(script).length).assertEqual(45);
    });
	 /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0432
     * @tc.name JsvmTest0432
     * @tc.desc JsvmTest
     */
    it('JsvmTest0432', 0, () => {
      let script: string = `
        createStringUtf8()
      `;
      expect(typeof napitest.runJsVm(script)).assertEqual('string');
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0433
     * @tc.name      JsvmTest0433
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0433', 0, () => {
      console.info('JsvmTest0433 START');
      value = napitest.testValueOperation5()
      console.info('JsvmTest0433 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0434
     * @tc.name      JsvmTest0434
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0434', 0, () => {
      console.info('JsvmTest0434 START');
      let rst: number = napitest.testIsCallable();
      console.info('JsvmTest0434 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0435
     * @tc.name      JsvmTest0435
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0435', 0, () => {
      let rst: boolean = napitest.testHandleMicrotasks();
      console.info('JsvmTest0435 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0436
     * @tc.name      JsvmTest0436
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0436', 0, () => {
      let rst: number = napitest.testMultithreadFunction();
      console.info('JsvmTest0436 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(1);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0437
     * @tc.name      JsvmTest0437
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0437', 0, () => {
        let rst: boolean = napitest.testJswmInterface();
        console.info('JsvmTest0437 testString result is:' + JSON.stringify(rst));
        expect(rst).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0438
     * @tc.name      JsvmTest0438
     * @tc.desc      JsvmTest
     */
     it('JsvmTest0438', 0, () => {
      let script: string = `
        var f = () => console.log('no constructable');
        isConstructor(f);
      `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0439
     * @tc.name      JsvmTest0439
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0439', 0, () => {
      let script: string = `
        isConstructor((function(){}));
      `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0440
     * @tc.name      JsvmTest0440
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0440', 0, () => {
      console.info('JsvmTest0440 START');
      value = napitest.testValueOperation6()
      console.info('JsvmTest0440 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0441
     * @tc.name      JsvmTest0441
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0441', 0, () => {
      console.info('JsvmTest0441 START');
      value = napitest.testValueOperation7()
      console.info('JsvmTest0441 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0442
     * @tc.name      JsvmTest0442
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0442', 0, () => {
      let script: string = `
        createRegExp1("ab+c").toString();
      `;
      expect(napitest.runJsVm(script)).assertEqual("/ab+c/i");
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0443
     * @tc.name      JsvmTest0443
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0443', 0, () => {
      let script: string = `
        createRegExp2("[bc]at").toString();
      `;
      expect(napitest.runJsVm(script)).assertEqual("/[bc]at/g");
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0444
     * @tc.name      JsvmTest0444
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0444', 0, () => {
      let script: string = `
        createRegExp3("d{3}-d{2}-d{4}").toString();
      `;
      expect(napitest.runJsVm(script)).assertEqual("/d{3}-d{2}-d{4}/m");
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0445
     * @tc.name      JsvmTest0445
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0445', 0, () => {
      let script: string = `
        createRegExp4(".at").toString();
      `;
      expect(napitest.runJsVm(script)).assertEqual("/.at/y");
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0446
     * @tc.name      JsvmTest0446
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0446', 0, () => {
      let script: string = `
        createRegExp5("(.)hort").toString();
      `;
      expect(napitest.runJsVm(script)).assertEqual("/(.)hort/s");
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0447
     * @tc.name      JsvmTest0447
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0447', 0, () => {
      let script: string = `
        createRegExp1("ab+c").global.toString();
      `;
      expect(napitest.runJsVm(script)).assertEqual("false");
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0448
     * @tc.name      JsvmTest0448
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0448', 0, () => {
      let script: string = `
        createRegExp1("ab+c").ignoreCase.toString();
      `;
      expect(napitest.runJsVm(script)).assertEqual("true");
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0449
     * @tc.name      JsvmTest0449
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0449', 0, () => {
      let script: string = `
        Object.prototype.toString.call(createRegExp1("ab+c"));
      `;
      expect(napitest.runJsVm(script)).assertEqual("[object RegExp]");
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0450
     * @tc.name      JsvmTest0450
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0450', 0, () => {
      let script: string = `
        createRegExpEnvNullptr("ab+c").toString();
      `;
      expect(napitest.runJsVm(script)).assertEqual("1");
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0451
     * @tc.name      JsvmTest0451
     * @tc.desc      JsvmTest
     */
    it('JsvmTest0451', 0, () => {
      console.info('JsvmTest0451 START');
      value = napitest.testValueOperation8()
      console.info('JsvmTest0451 testString result is:'+ value + "--" + JSON.stringify(value) );
      expect(value).assertEqual(0);
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0452
     * @tc.name JsvmTest0452
     * @tc.desc JsvmTest
     */
    it('JsvmTest0452', 0, () => {
      let script: string = `
        let add1 = createFunctionWithScript(\"add\", [\"a\", \"b\"], \"return a + b\")
        let add2 = createFunctionWithScript(\"add\", [\"a\", \"b\"], \"return (a + b) * 2\")
        let mul = createFunctionWithScript(\"class\", [\"c\", \"d\"], \"return c * d\")
        let res1 = add1(3, 4)
        let res2 = add2(2, 3)
        mul(res1, res2);
      `;
      expect(napitest.runJsVm(script)).assertEqual(70);
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0453
     * @tc.name JsvmTest0453
     * @tc.desc JsvmTest
     */
    it('JsvmTest0453', 0, () => {
      let script: string = `
        let emptyFunc = createFunctionWithScript(\"add\", [\"a\"], \"\")
        emptyFunc(3)
      `;
      expect(typeof napitest.runJsVm(script)).assertEqual('undefined');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_JSVM_0454
     * @tc.name JsvmTest0454
     * @tc.desc JsvmTest
     */
    it('JsvmTest0454', 0, () => {
      let script: string = `
        let func = createFunctionWithScript(\"func\", [\"a\", \"a\"], \"return a\")
        func(3, 5)
      `;
      expect(napitest.runJsVm(script)).assertEqual(5);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0455
     * @tc.name      JsvmTest0455
     * @tc.desc      Test the function of the OH_JSVM_CreateMap interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0455', 0, () => {
      let script: string = `
        Object.prototype.toString.call(createMap());
      `;
      expect(napitest.runJsVm(script)).assertEqual("[object Map]");
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0456
     * @tc.name      JsvmTest0456
     * @tc.desc      Test the function of the OH_JSVM_CreateMap interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0456', 0, () => {
      let script: string = `
        var map = createMap();
        map.toString();
      `;
      expect(napitest.runJsVm(script)).assertEqual("[object Map]");
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0457
     * @tc.name      JsvmTest0457
     * @tc.desc      Test the function of the OH_JSVM_CreateMap interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0457', 0, () => {
      let script: string = `
        var map = createMap();
        map.set("key1", "val1");
        map.set("key2", "val2");
        map.set("key3", "val3");
        map.size;
      `;
      expect(napitest.runJsVm(script)).assertEqual(3);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0458
     * @tc.name      JsvmTest0458
     * @tc.desc      Test the function of the OH_JSVM_CreateMap interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0458', 0, () => {
      let script: string = `
        var map = createMap();
        map.set("key1", "val1");
        map.set("key2", "val2");
        map.set("key3", "val3");
        map.get("key1");
      `;
      expect(napitest.runJsVm(script)).assertEqual("val1");
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0459
     * @tc.name      JsvmTest0459
     * @tc.desc      Test the function of the OH_JSVM_CreateMap interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0459', 0, () => {
      let script: string = `
        var map = createMap();
        map.set("key1", "val1");
        map.set("key2", "val2");
        map.set("key3", "val3");
        map.has("key2");
      `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0460
     * @tc.name      JsvmTest0460
     * @tc.desc      Test the function of the OH_JSVM_CreateMap interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0460', 0, () => {
      let script: string = `
        var map = createMap();
        map.set("key1", "val1");
        map.set("key2", "val2");
        map.set("key3", "val3");
        map.delete("key3");
        map.has("key3");
      `;
      expect(napitest.runJsVm(script)).assertEqual(false);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0461
     * @tc.name      JsvmTest0461
     * @tc.desc      Test the function of the OH_JSVM_CoerceToBigInt interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0461', 0, () => {
      let script: string = `
        coerceToBigInt(false) === BigInt(0)
      `;
      expect(napitest.runJsVm(script)).assertTrue();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0462
     * @tc.name      JsvmTest0462
     * @tc.desc      Test the function of the OH_JSVM_CoerceToBigInt interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0462', 0, () => {
      let script: string = `
        coerceToBigInt(true) === BigInt(1)
      `;
      expect(napitest.runJsVm(script)).assertTrue();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0463
     * @tc.name      JsvmTest0463
     * @tc.desc      Test the function of the OH_JSVM_CoerceToBigInt interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0463', 0, () => {
      let script: string = `
        coerceToBigInt("123") === BigInt(123)
      `;
      expect(napitest.runJsVm(script)).assertTrue();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0464
     * @tc.name      JsvmTest0464
     * @tc.desc      Test the function of the OH_JSVM_CoerceToBigInt interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0464', 0, () => {
      let script: string = `
        let val = getValueBigintUint64(BigInt(123))
        coerceToBigInt(val) === BigInt(123)
      `;
      expect(napitest.runJsVm(script)).assertTrue();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0465
     * @tc.name      JsvmTest0465
     * @tc.desc      Test the function of the OH_JSVM_IsRegExp interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0465', 0, () => {
      let script: string = `
        let val = /pattern/
        isRegExp(val)
      `;
      expect(napitest.runJsVm(script)).assertTrue();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0466
     * @tc.name      JsvmTest0466
     * @tc.desc      Test the function of the OH_JSVM_IsRegExp interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0466', 0, () => {
      let script: string = `
        let val
        isRegExp(val)
      `;
      expect(napitest.runJsVm(script)).assertFalse();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0467
     * @tc.name      JsvmTest0467
     * @tc.desc      Test the function of the OH_JSVM_IsRegExp interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0467', 0, () => {
      let script: string = `
        isRegExp(null)
      `;
      expect(napitest.runJsVm(script)).assertFalse();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0468
     * @tc.name      JsvmTest0468
     * @tc.desc      Test the function of the OH_JSVM_IsRegExp interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0468', 0, () => {
      let script: string = `
        isRegExp(true)
      `;
      expect(napitest.runJsVm(script)).assertFalse();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0469
     * @tc.name      JsvmTest0469
     * @tc.desc      Test the function of the OH_JSVM_IsRegExp interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0469', 0, () => {
      let script: string = `
        isRegExp(123)
      `;
      expect(napitest.runJsVm(script)).assertFalse();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0470
     * @tc.name      JsvmTest0470
     * @tc.desc      Test the function of the OH_JSVM_IsRegExp interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0470', 0, () => {
      let script: string = `
        isRegExp("123")
      `;
      expect(napitest.runJsVm(script)).assertFalse();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0471
     * @tc.name      JsvmTest0471
     * @tc.desc      Test the function of the OH_JSVM_IsRegExp interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0471', 0, () => {
      let script: string = `
        isRegExp({})
      `;
      expect(napitest.runJsVm(script)).assertFalse();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0472
     * @tc.name      JsvmTest0472
     * @tc.desc      Test the function of the OH_JSVM_IsRegExp interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0472', 0, () => {
      let script: string = `
        isRegExp(BigInt(123))
      `;
      expect(napitest.runJsVm(script)).assertFalse();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0473
     * @tc.name      JsvmTest0473
     * @tc.desc      Test the function of the OH_JSVM_IsRegExp interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0473', 0, () => {
      let script: string = `
        isRegExp(Symbol())
      `;
      expect(napitest.runJsVm(script)).assertFalse();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0474
     * @tc.name      JsvmTest0474
     * @tc.desc      Test the function of the OH_JSVM_CompileScriptWithOptions interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0474', 0, () => {
      let rst: boolean = napitest.testCompileWithOption();
      console.info('JsvmTest0474 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0475
     * @tc.name      JsvmTest0475
     * @tc.desc      Test the functions of the OH_JSVM_RetainScript and OH_JSVM_ReleaseScript interfaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0475', 0, () => {
      let rst: boolean = napitest.testRetainScript();
      console.info('JsvmTest0475 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0476
     * @tc.name      JsvmTest0476
     * @tc.desc      Test the function of the OH_JSVM_OpenInspectorWithName interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0476', 0, () => {
      let rst: boolean = napitest.testOpenInspectorWithName();
      console.info('JsvmTest0476 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0477
     * @tc.name      JsvmTest0477
     * @tc.desc      Test the function of ArrayBuffer interfaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0477', 0, () => {
      let rst: number = napitest.testArrayBuffer();
      console.info('JsvmTest0477 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0478
     * @tc.name      JsvmTest0478
     * @tc.desc      Test the function of ArrayBuffer interfaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0478', 0, () => {
      let rst: number = napitest.testArrayBuffer2();
      console.info('JsvmTest0478 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0479
     * @tc.name      JsvmTest0479
     * @tc.desc      Test the function of ArrayBuffer interfaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0479', 0, () => {
      let rst: number = napitest.testArrayBuffer3();
      console.info('JsvmTest0479 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0480
     * @tc.name      JsvmTest0480
     * @tc.desc      Test the function of WasmOperator interfaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0480', 0, () => {
      let rst: number = napitest.testWasmOperator();
      console.info('JsvmTest0480 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0481
     * @tc.name      JsvmTest0481
     * @tc.desc      Test the function of WebAssembly interfaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0481', 0, () => {
      let rst: number = napitest.wasmTest();
      console.info('JsvmTest0481 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0482
     * @tc.name      JsvmTest0482
     * @tc.desc      Test the function of ArrayBuffer backing store interfaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0482', 0, () => {
      let rst: number = napitest.arrayBufferBackingStoreTest();
      console.info('JsvmTest0482 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0483
     * @tc.name      JsvmTest0483
     * @tc.desc      Test that when JSVM_Value is js code, return 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0483', 0, () => {
      let script: string = `
      testGetValueStringUtf8Test1("Hello world")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0484
     * @tc.name      JsvmTest0484
     * @tc.desc      Test that when JSVM_Value is create code, return 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0484', 0, () => {
      let script: string = `
      testGetValueStringUtf8Test2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0485
     * @tc.name      JsvmTest0485
     * @tc.desc      Test that when bufsize less than (char*) buf, return 'ok' and size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0485', 0, () => {
      let script: string = `
      testGetValueStringUtf8Test3()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0486
     * @tc.name      JsvmTest0486
     * @tc.desc      Test that when bufsize greater than or equal (char*) buf, return 'ok' and size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0486', 0, () => {
      let script: string = `
      testGetValueStringUtf8Test4()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0487
     * @tc.name      JsvmTest0487
     * @tc.desc      Test that when bufsize less than buf, return 'ok' and size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0487', 0, () => {
      let script: string = `
      testGetValueStringUtf8Test5()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0488
     * @tc.name      JsvmTest0488
     * @tc.desc      Test that when (char*) buf equal to bufsize, return 'ok' and size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0488', 0, () => {
      let script: string = `
      testGetValueStringUtf8Test6()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0489
     * @tc.name      JsvmTest0489
     * @tc.desc      Test that when str is null, return 'not ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0489', 0, () => {
      let script: string = `
      testCreateStringUtf8Test1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0490
     * @tc.name      JsvmTest0490
     * @tc.desc      Test that when length less than str, return 'ok' and size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0490', 0, () => {
      let script: string = `
      testCreateStringUtf8Test2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0491
     * @tc.name      JsvmTest0491
     * @tc.desc      Test that when length equal to str, return 'ok' and size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0491', 0, () => {
      let script: string = `
      testCreateStringUtf8Test3()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0492
     * @tc.name      JsvmTest0492
     * @tc.desc      Test that when length greate than str, return 'ok' and size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0492', 0, () => {
      let script: string = `
      testCreateStringUtf8Test4()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0493
     * @tc.name      JsvmTest0493
     * @tc.desc      Test that when str(UTF16) is null, return 'not ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0493', 0, () => {
      let script: string = `
      testCreateStringUtf16Test1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0494
     * @tc.name      JsvmTest0494
     * @tc.desc      Test that when length less than str(UTF16), return 'ok' and size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0494', 0, () => {
      let script: string = `
      testCreateStringUtf16Test2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0495
     * @tc.name      JsvmTest0495
     * @tc.desc      Test that when length equal to str(UTF16), return 'ok' and size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0495', 0, () => {
      let script: string = `
      testCreateStringUtf16Test3()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0496
     * @tc.name      JsvmTest0496
     * @tc.desc      Test that when length greate than str(UTF16), return 'ok' and size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0496', 0, () => {
      let script: string = `
      testCreateStringUtf16Test4("get utf16 string")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0497
     * @tc.name      JsvmTest0497
     * @tc.desc      Test that when JSVM_Value is js code, return 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0497', 0, () => {
      let script: string = `
      testGetValueStringUtf16Test1("create UTF16")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0498
     * @tc.name      JsvmTest0498
     * @tc.desc      Test that when JSVM_Value is create code, return 'ok' and size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0498', 0, () => {
      let script: string = `
      testGetValueStringUtf16Test2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0499
     * @tc.name      JsvmTest0499
     * @tc.desc      Test that when buf(UTF16) less than str(UTF16), return size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0499', 0, () => {
      let script: string = `
      testGetValueStringUtf16Test3()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0500
     * @tc.name      JsvmTest0500
     * @tc.desc      Test that when buf(UTF16) greater than or equal str(UTF16), return ‘ok’ and size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0500', 0, () => {
      let script: string = `
      testGetValueStringUtf16Test4()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0501
     * @tc.name      JsvmTest0501
     * @tc.desc      Test that when bufsize less than buf, return size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0501', 0, () => {
      let script: string = `
      testGetValueStringUtf16Test5()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0502
     * @tc.name      JsvmTest0502
     * @tc.desc      Test that when bufsize equal buf, return ‘ok’ and size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0502', 0, () => {
      let script: string = `
      testGetValueStringUtf16Test6()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0503
     * @tc.name      JsvmTest0503
     * @tc.desc      Test that when str is null, return 'not ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0503', 0, () => {
      let script: string = `
      testCreateStringLatin1Test1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0504
     * @tc.name      JsvmTest0504
     * @tc.desc      Test that when length less than str(Latin1), return 'ok' and size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0504', 0, () => {
      let script: string = `
      testCreateStringLatin1Test2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0505
     * @tc.name      JsvmTest0505
     * @tc.desc      Test that when length equal to str(Latinl), return 'ok' and size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0505', 0, () => {
      let script: string = `
      testCreateStringLatin1Test3()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0506
     * @tc.name      JsvmTest0506
     * @tc.desc      Test that when length greate than str(Latin1), return 'ok' and size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0506', 0, () => {
      let script: string = `
      testCreateStringLatin1Test4("get Latin1 string")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0507
     * @tc.name      JsvmTest0507
     * @tc.desc      Test that when JSVM_Value is js code(Latin1), return 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0507', 0, () => {
      let script: string = `
      testGetValueStringLatin1Test1("create Latin1 string")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0508
     * @tc.name      JsvmTest0508
     * @tc.desc      Test that when JSVM_Value is create code(Latin1), return 'ok' and size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0508', 0, () => {
      let script: string = `
      testGetValueStringLatin1Test2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0509
     * @tc.name      JsvmTest0509
     * @tc.desc      Test that when buf(Latin1) less than str(Latin1), return size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0509', 0, () => {
      let script: string = `
      testGetValueStringLatin1Test3()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0510
     * @tc.name      JsvmTest0510
     * @tc.desc      Test that when buf(Latin1) greater than or equal str(Latin1), return ‘ok’ and size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0510', 0, () => {
      let script: string = `
      testGetValueStringLatin1Test4()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0511
     * @tc.name      JsvmTest0511
     * @tc.desc      Test that when bufsize less than buf(Latin1), return size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0511', 0, () => {
      let script: string = `
      testGetValueStringLatin1Test5()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0512
     * @tc.name      JsvmTest0512
     * @tc.desc      Test that when bufsize equal buf(Latin1), return ‘ok’ and size.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0512', 0, () => {
      let script: string = `
      testGetValueStringLatin1Test6()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0513
     * @tc.name      JsvmTest0513
     * @tc.desc      Test that when create utf8 string, return string is true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0513', 0, () => {
      let script: string = `
      testIsStringTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0514
     * @tc.name      JsvmTest0514
     * @tc.desc      Test that when create utf16 string, return string is true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0514', 0, () => {
      let script: string = `
      testIsStringTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0515
     * @tc.name      JsvmTest0515
     * @tc.desc      Test that when create Latin1 string, return string is true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0515', 0, () => {
      let script: string = `
      testIsStringTest3()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0516
     * @tc.name      JsvmTest0516
     * @tc.desc      Test that when create utf8 string, receive utf16, return err code.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0516', 0, () => {
      let script: string = `
      testOtherTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0517
     * @tc.name      JsvmTest0517
     * @tc.desc      Test that creat array with lenth 0, result is not null, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0517', 0, () => {
      let script: string = `
      testCreateArrayWithLength_01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0518
     * @tc.name      JsvmTest0518
     * @tc.desc      Test that creat array with lenth 10, result is not null, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0518', 0, () => {
      let script: string = `
      testCreateArrayWithLength_02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0519
     * @tc.name      JsvmTest0519
     * @tc.desc      Test that creat array with lenth UINT64_MAX, result is not null, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0519', 0, () => {
      let script: string = `
      testCreateArrayWithLength_03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0520
     * @tc.name      JsvmTest0520
     * @tc.desc      Test that creat array with lenth 10, result is null, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0520', 0, () => {
      let script: string = `
      testCreateArrayWithLength_04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0521
     * @tc.name      JsvmTest0521
     * @tc.desc      Test that creat array object, result is nonnull, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0521', 0, () => {
      let script: string = `
      testGetArrayLength_01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0522
     * @tc.name      JsvmTest0522
     * @tc.desc      Test that creat array with len 10, get array len is sucess. result is nonnull, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0522', 0, () => {
      let script: string = `
      testGetArrayLength_02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0523
     * @tc.name      JsvmTest0523
     * @tc.desc      Test that creat not array object, get array len is fail, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0523', 0, () => {
      let script: string = `
      testGetArrayLength_03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0524
     * @tc.name      JsvmTest0524
     * @tc.desc      Test that creat array len 4, get array the last parameter is NULL,return result is fail, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0524', 0, () => {
      let script: string = `
      testGetArrayLength_04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0525
     * @tc.name      JsvmTest0525
     * @tc.desc      Test that creat type array, type is INT8_ARRAY, obj is array, len 0, srclen <= tarlen, return result is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0525', 0, () => {
      let script: string = `
      testCreateTypedarray_01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0526
     * @tc.name      JsvmTest0526
     * @tc.desc      Test that creat type array, type is INT8_ARRAY, obj is array, len 4, srclen <= tarlen, return result is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0526', 0, () => {
      let script: string = `
      testCreateTypedarray_02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0527
     * @tc.name      JsvmTest0527
     * @tc.desc      Test that creat type array, type is UINT8_CLAMPED_ARRAY, obj is nullptr, len 4, srclen <= tarlen, return result is fail, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0527', 0, () => {
      let script: string = `
      testCreateTypedarray_03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0528
     * @tc.name      JsvmTest0528
     * @tc.desc      Test that creat type array, type is JSVM_INT16_ARRAY, obj is other object, len 4, srclen <= tarlen, return result is fail, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0528', 0, () => {
      let script: string = `
      testCreateTypedarray_04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0529
     * @tc.name      JsvmTest0529
     * @tc.desc      Test that creat type array, type is UINT16_ARRAY, obj is arraybuffer, len 4, srclen > tarlen, return result is fail, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0529', 0, () => {
      let script: string = `
      testCreateTypedarray_05()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0530
     * @tc.name      JsvmTest0530
     * @tc.desc      Test that creat type array, type is INT32_ARRAY, obj is arraybuffer, len 2, srclen <= tarlen, return result is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0530', 0, () => {
      let script: string = `
      testCreateTypedarray_06()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0531
     * @tc.name      JsvmTest0531
     * @tc.desc      Test that creat type array with INT32_ARRAY, len 4, srclen <= tarlen, get arraybuffer len is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0531', 0, () => {
      let script: string = `
      testGetTypedarrayInfo_01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0532
     * @tc.name      JsvmTest0532
     * @tc.desc      Test that not creat type array, get arraybuffer len is fail, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0532', 0, () => {
      let script: string = `
      testGetTypedarrayInfo_02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0533
     * @tc.name      JsvmTest0533
     * @tc.desc      Test that creat dataview,len 0,array buffer,srclen <= destlen, creat dataview is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0533', 0, () => {
      let script: string = `
      testCreateDataview_01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0534
     * @tc.name      JsvmTest0534
     * @tc.desc      Test that creat dataview,len 16,array buffer is nullptr, srclen <= destlen, creat dataview is fail, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0534', 0, () => {
      let script: string = `
      testCreateDataview_02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0535
     * @tc.name      JsvmTest0535
     * @tc.desc      Test that creat dataview,len 16,array buffer is nullptr, srclen <= destlen, creat dataview is fail, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0535', 0, () => {
      let script: string = `
      testCreateDataview_03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0536
     * @tc.name      JsvmTest0536
     * @tc.desc      Test that creat dataview,len 16,other object, srclen <= destlen, creat dataview is fail, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0536', 0, () => {
      let script: string = `
      testCreateDataview_04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0537
     * @tc.name      JsvmTest0537
     * @tc.desc      Test that creat dataview,len 16,array buffer object, srclen > destlen, creat dataview is fail, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0537', 0, () => {
      let script: string = `
      testCreateDataview_05()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0538
     * @tc.name      JsvmTest0538
     * @tc.desc      Test that creat dataview,len 16,array buffer object, srclen > destlen, the last parameter is NULL, creat dataview is fail, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0538', 0, () => {
      let script: string = `
      testCreateDataview_06()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0539
     * @tc.name      JsvmTest0539
     * @tc.desc      Test that creat dataview,is dataview, get dataview info, result is true, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0539', 0, () => {
      let script: string = `
      testGetDataview_01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0540
     * @tc.name      JsvmTest0540
     * @tc.desc      Test that not creat dataview, get dataview info is fail, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0540', 0, () => {
      let script: string = `
      testGetDataview_02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0541
     * @tc.name      JsvmTest0541
     * @tc.desc      Test that creat arraybuffer, set index 0,result is null,return status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0541', 0, () => {
      let script: string = `
      testSetElement_01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0542
     * @tc.name      JsvmTest0542
     * @tc.desc      Test that creat arraybuffer, set index 4,result is not null,return status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0542', 0, () => {
      let script: string = `
      testSetElement_02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0543
     * @tc.name      JsvmTest0543
     * @tc.desc      Test that creat Utf8 arraybuffer, set index 9,result is not null,return status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0543', 0, () => {
      let script: string = `
      testSetElement_03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0544
     * @tc.name      JsvmTest0544
     * @tc.desc      Test that creat Utf8 arraybuffer, set index 0,result is null,return status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0544', 0, () => {
      let script: string = `
      testSetElement_04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0545
     * @tc.name      JsvmTest0545
     * @tc.desc      Test that creat dataview, set index is sizeof(obj),result is nonnull,return status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0545', 0, () => {
      let script: string = `
      testSetElement_05()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0546
     * @tc.name      JsvmTest0546
     * @tc.desc      Test that creat not array object, set index 0,result is nonnull,return status is fail, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0546', 0, () => {
      let script: string = `
      testSetElement_06()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0547
     * @tc.name      JsvmTest0547
     * @tc.desc      Test that creat not array object, set index 1,result is nonnull,return status is fail, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0547', 0, () => {
      let script: string = `
      testSetElement_07()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0548
     * @tc.name      JsvmTest0548
     * @tc.desc      Test that set arraybuffer Element the property value is nonnull, get Element status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0548', 0, () => {
      let script: string = `
      testGetElement_01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0549
     * @tc.name      JsvmTest0549
     * @tc.desc      Test that set arraybuffer Element the property value is null, get Element status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0549', 0, () => {
      let script: string = `
      testGetElement_02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0550
     * @tc.name      JsvmTest0550
     * @tc.desc      Test that set typedarray Element the property value is nonnull, get Element status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0550', 0, () => {
      let script: string = `
      testGetElement_03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0551
     * @tc.name      JsvmTest0551
     * @tc.desc      Test that set dataview Element the property value is nonnull, get Element status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0551', 0, () => {
      let script: string = `
      testGetElement_04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0552
     * @tc.name      JsvmTest0552
     * @tc.desc      Test that set other object Element the property value is nonnull, get Element status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0552', 0, () => {
      let script: string = `
      testGetElement_05()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0553
     * @tc.name      JsvmTest0553
     * @tc.desc      Test that not set Element, get Element status is fail, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0553', 0, () => {
      let script: string = `
      testGetElement_06()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0554
     * @tc.name      JsvmTest0554
     * @tc.desc      Test that arraybuffer set Element, has Element status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0554', 0, () => {
      let script: string = `
      testHasElement_01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0555
     * @tc.name      JsvmTest0555
     * @tc.desc      Test that Utf8 array set Element, has Element status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0555', 0, () => {
      let script: string = `
      testHasElement_02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0556
     * @tc.name      JsvmTest0556
     * @tc.desc      Test that dataview set Element, has Element status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0556', 0, () => {
      let script: string = `
      testHasElement_03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0557
     * @tc.name      JsvmTest0557
     * @tc.desc      Test that utf8 array set Element, has Element status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0557', 0, () => {
      let script: string = `
      testHasElement_04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0558
     * @tc.name      JsvmTest0558
     * @tc.desc      Test that array set Element, has Element index 0 status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0558', 0, () => {
      let script: string = `
      testHasElement_05()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0559
     * @tc.name      JsvmTest0559
     * @tc.desc      Test that array set Element, has Element index 0,result is null,return status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0559', 0, () => {
      let script: string = `
      testHasElement_06()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0560
     * @tc.name      JsvmTest0560
     * @tc.desc      Test that arraybuffer set Element,delete Element index 0,result is nonnull,return status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0560', 0, () => {
      let script: string = `
      testDeleteElement_01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0561
     * @tc.name      JsvmTest0561
     * @tc.desc      Test that typedarray set Element, delete Element index 0,result is nonnull,return status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0561', 0, () => {
      let script: string = `
      testDeleteElement_02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0562
     * @tc.name      JsvmTest0562
     * @tc.desc      Test that dataview set Element, delete Element index 0,result is nonnull,return status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0562', 0, () => {
      let script: string = `
      testDeleteElement_03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0563
     * @tc.name      JsvmTest0563
     * @tc.desc      Test that not array set Element, delete Element index 0,result is nonnull,return status is fail, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0563', 0, () => {
      let script: string = `
      testDeleteElement_04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0564
     * @tc.name      JsvmTest0564
     * @tc.desc      Test that not array set Element, delete Element index 0,result is nonnull,return status is fail, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0564', 0, () => {
      let script: string = `
      testDeleteElement_05()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0565
     * @tc.name      JsvmTest0565
     * @tc.desc      Test that arraybuffer set element value null, delete element index 0,result is nonnull,return status is fail, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0565', 0, () => {
      let script: string = `
      testDeleteElement_06()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0566
     * @tc.name      JsvmTest0566
     * @tc.desc      Test that creat array, get Array Length, set index element,get element, delete element etc..,return status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0566', 0, () => {
      let script: string = `
      testArrayProcessSteps_01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0567
     * @tc.name      JsvmTest0567
     * @tc.desc      Test that creat array, get Array Length, not set index element,get element, delete element etc..,return status is fail, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0567', 0, () => {
      let script: string = `
      testArrayProcessSteps_02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0568
     * @tc.name      JsvmTest0568
     * @tc.desc      Test that creat type INT32 array, get Array Length, set index element,get element, delete element etc..,return status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0568', 0, () => {
      let script: string = `
      testTypedarrayProcessSteps_01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0569
     * @tc.name      JsvmTest0569
     * @tc.desc      Test that creat type INT32 array, get Array Length, not set index element,get element, delete element etc..,return status is fail, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0569', 0, () => {
      let script: string = `
      testTypedarrayProcessSteps_02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0570
     * @tc.name      JsvmTest0570
     * @tc.desc      Test that creat dataview, get Array Length, set index element,get element, delete element etc..,return status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0570', 0, () => {
      let script: string = `
      testArrayDataviewProcessSteps_01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0571
     * @tc.name      JsvmTest0571
     * @tc.desc      Test that creat dataview, get Array Length, not set index element,get element, delete element etc..,return status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0571', 0, () => {
      let script: string = `
      testArrayDataviewProcessSteps_02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0572
     * @tc.name      JsvmTest0572
     * @tc.desc      Test that creat dataview, creat type array, get dataview info,return status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0572', 0, () => {
      let script: string = `
      testTypeArrayAndDataviewProcessSteps_01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0573
     * @tc.name      JsvmTest0573
     * @tc.desc      Test that creat type array, repeat set at the same index, get element is right,return status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0573', 0, () => {
      let script: string = `
      testTypeArraySetMultipleTimes_01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0574
     * @tc.name      JsvmTest0574
     * @tc.desc      Test that creat array, repeat set at the same index, get element is right,return status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0574', 0, () => {
      let script: string = `
      testArraySetMultipleTimes_01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0575
     * @tc.name      JsvmTest0575
     * @tc.desc      Test that creat type array, set element, repeat get element is right,return status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0575', 0, () => {
      let script: string = `
      testArrayGetMultipleTimes_01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0576
     * @tc.name      JsvmTest0576
     * @tc.desc      Test that creat type array, set element, repeat delete element is right,return status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0576', 0, () => {
      let script: string = `
      testArrayDeleteMultipleTimes_01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
 /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0577
     * @tc.name      JsvmTest0577
     * @tc.desc      Test that creat type array, set element, delete different locations element is right,return status is sucess, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0577', 0, () => {
      let script: string = `
      testArrayDeleteMultipleTimes_02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0578
     * @tc.name      JsvmTest0578
     * @tc.desc      Test that when code is "0", msg is not null, result is not null, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0578', 0, () => {
      let script: string = `
      testCreateErrorTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0579
     * @tc.name      JsvmTest0579
     * @tc.desc      Test that when code is negative number, msg is not null, result is not null, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0579', 0, () => {
      let script: string = `
      testCreateErrorTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0580
     * @tc.name      JsvmTest0580
     * @tc.desc      Test that when code is positive number, msg is not null, result is not null, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0580', 0, () => {
      let script: string = `
      testCreateErrorTest3()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0581
     * @tc.name      JsvmTest0581
     * @tc.desc      Test that when code is “0”, msg is not null, result is null, return is 'n-ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0581', 0, () => {
      let script: string = `
      testCreateErrorTest4()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0582
     * @tc.name      JsvmTest0582
     * @tc.desc      Test that when code is string, msg is not null, result is not null, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0582', 0, () => {
      let script: string = `
      testCreateErrorTest5()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0583
     * @tc.name      JsvmTest0583
     * @tc.desc      Test that when code is "0", msg is not null, result is not null, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0583', 0, () => {
      let script: string = `
      testCreateTypeErrorTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0584
     * @tc.name      JsvmTest0584
     * @tc.desc      Test that when code is negative number, msg is not null, result is not null, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0584', 0, () => {
      let script: string = `
      testCreateTypeErrorTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0586
     * @tc.name      JsvmTest0586
     * @tc.desc      Test that when code is positive number, msg is not null, result is not null, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0586', 0, () => {
      let script: string = `
      testCreateTypeErrorTest3()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0587
     * @tc.name      JsvmTest0587
     * @tc.desc      Test that when code is “0”, msg is not null, result is null, return is 'n-ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0587', 0, () => {
      let script: string = `
      testCreateTypeErrorTest4()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0588
     * @tc.name      JsvmTest0588
     * @tc.desc      Test that when code is string, msg is not null, result is not null, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0588', 0, () => {
      let script: string = `
      testCreateTypeErrorTest5()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0589
     * @tc.name      JsvmTest0589
     * @tc.desc      Test that when code is "0", msg is not null, result is not null, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0589', 0, () => {
      let script: string = `
      testCreateRangeErrorTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0590
     * @tc.name      JsvmTest0590
     * @tc.desc      Test that when code is negative number, msg is not null, result is not null, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0590', 0, () => {
      let script: string = `
      testCreateRangeErrorTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0591
     * @tc.name      JsvmTest0591
     * @tc.desc      Test that when code is positive number, msg is not null, result is not null, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0591', 0, () => {
      let script: string = `
      testCreateRangeErrorTest3()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0592
     * @tc.name      JsvmTest0592
     * @tc.desc      Test that when code is “0”, msg is not null, result is null, return is 'n-ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0592', 0, () => {
      let script: string = `
      testCreateRangeErrorTest4()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0593
     * @tc.name      JsvmTest0593
     * @tc.desc      Test that when code is string, msg is not null, result is not null, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0593', 0, () => {
      let script: string = `
      testCreateRangeErrorTest5()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0594
     * @tc.name      JsvmTest0594
     * @tc.desc      Test that when code is "0", msg is not null, result is not null, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0594', 0, () => {
      let script: string = `
      testCreateSyntaxErrorTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0595
     * @tc.name      JsvmTest0595
     * @tc.desc      Test that when code is negative number, msg is not null, result is not null, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0595', 0, () => {
      let script: string = `
      testCreateSyntaxErrorTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0596
     * @tc.name      JsvmTest0596
     * @tc.desc      Test that when code is positive number, msg is not null, result is not null, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0596', 0, () => {
      let script: string = `
      testCreateSyntaxErrorTest3()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0597
     * @tc.name      JsvmTest0597
     * @tc.desc      Test that when code is “0”, msg is not null, result is null, return is 'n-ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0597', 0, () => {
      let script: string = `
      testCreateSyntaxErrorTest4()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0598
     * @tc.name      JsvmTest0598
     * @tc.desc      Test that when code is string, msg is not null, result is not null, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0598', 0, () => {
      let script: string = `
      testCreateSyntaxErrorTest5()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0599
     * @tc.name      JsvmTest0599
     * @tc.desc      Test that when error is int, return is 'n-ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0599', 0, () => {
      let script: string = `
      testThrowTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0600
     * @tc.name      JsvmTest0600
     * @tc.desc      Test that when error is 'CreateError', return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0600', 0, () => {
      let script: string = `
      testThrowTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0601
     * @tc.name      JsvmTest0601
     * @tc.desc      Test that when error is CreateTypeError, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0601', 0, () => {
      let script: string = `
      testThrowTest3()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0602
     * @tc.name      JsvmTest0602
     * @tc.desc      Test that when error is CreateRangeError, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0602', 0, () => {
      let script: string = `
      testThrowTest4()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0603
     * @tc.name      JsvmTest0603
     * @tc.desc      Test that when error is CreateSyntaxError, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0603', 0, () => {
      let script: string = `
      testThrowTest5()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0604
     * @tc.name      JsvmTest0604
     * @tc.desc      Test that when error is javascript Error, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0604', 0, () => {
      let script: string = `
      testThrowTest6("javascript error")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0605
     * @tc.name      JsvmTest0605
     * @tc.desc      Test that when code is not null, msg is nullptr, return is 'n-ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0605', 0, () => {
      let script: string = `
      testThrowErrorTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0606
     * @tc.name      JsvmTest0606
     * @tc.desc      Test that when code is nullptr, msg is not null, return is 'n-ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0606', 0, () => {
      let script: string = `
      testThrowErrorTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0607
     * @tc.name      JsvmTest0607
     * @tc.desc      Test that when code is not null, msg is not null, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0607', 0, () => {
      let script: string = `
      testThrowErrorTest3()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0608
     * @tc.name      JsvmTest0608
     * @tc.desc      Test that when code is not null, msg is nullptr, return is 'n-ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0608', 0, () => {
      let script: string = `
      testThrowTypeErrorTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0609
     * @tc.name      JsvmTest0609
     * @tc.desc      Test that when code is nullptr, msg is not null, return is 'n-ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0609', 0, () => {
      let script: string = `
      testThrowTypeErrorTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0610
     * @tc.name      JsvmTest0610
     * @tc.desc      Test that when code is not null, msg is not null, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0610', 0, () => {
      let script: string = `
      testThrowTypeErrorTest3()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0611
     * @tc.name      JsvmTest0611
     * @tc.desc      Test that when code is not null, msg is nullptr, return is 'n-ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0611', 0, () => {
      let script: string = `
      testThrowRangeErrorTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0612
     * @tc.name      JsvmTest0612
     * @tc.desc      Test that when code is nullptr, msg is not null, return is 'n-ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0612', 0, () => {
      let script: string = `
      testThrowRangeErrorTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0613
     * @tc.name      JsvmTest0613
     * @tc.desc      Test that when code is not null, msg is not null, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0613', 0, () => {
      let script: string = `
      testThrowRangeErrorTest3()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0614
     * @tc.name      JsvmTest0614
     * @tc.desc      Test that when code is not null, msg is nullptr, return is 'n-ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0614', 0, () => {
      let script: string = `
      testThrowSyntaxErrorTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0615
     * @tc.name      JsvmTest0615
     * @tc.desc      Test that when code is nullptr, msg is not null, return is 'n-ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0615', 0, () => {
      let script: string = `
      testThrowSyntaxErrorTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0616
     * @tc.name      JsvmTest0616
     * @tc.desc      Test that when code is not null, msg is not null, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0616', 0, () => {
      let script: string = `
      testThrowSyntaxErrorTest3()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0617
     * @tc.name      JsvmTest0617
     * @tc.desc      Test that when value is error, result is nullptr, return is 'n-ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0617', 0, () => {
      let script: string = `
      testIsErrorTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0618
     * @tc.name      JsvmTest0618
     * @tc.desc      Test that when code is not error, result is not null, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0618', 0, () => {
      let script: string = `
      testIsErrorTest2("js error")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0619
     * @tc.name      JsvmTest0619
     * @tc.desc      Test that when result is not null, there is error, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0619', 0, () => {
      let script: string = `
      testGetAndClearLastExceptionTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0620
     * @tc.name      JsvmTest0620
     * @tc.desc      Test that when result is not null, there is not error, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0620', 0, () => {
      let script: string = `
      testGetAndClearLastExceptionTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0621
     * @tc.name      JsvmTest0621
     * @tc.desc      Test that when result is nullptr, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0621', 0, () => {
      let script: string = `
      testGetAndClearLastExceptionTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0622
     * @tc.name      JsvmTest0622
     * @tc.desc      Test that when result is nullptr, return is 'n-ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0622', 0, () => {
      let script: string = `
      testGetAndClearLastExceptionTest3()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0623
     * @tc.name      JsvmTest0623
     * @tc.desc      Test that when result is not null, there is error, return is 'ok', result is true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0623', 0, () => {
      let script: string = `
      testIsExceptionPendingTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0624
     * @tc.name      JsvmTest0624
     * @tc.desc      Test that when result is not null, there is not error, return is 'ok', result is false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0624', 0, () => {
      let script: string = `
      testIsExceptionPendingTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0625
     * @tc.name      JsvmTest0625
     * @tc.desc      Test that when result is nullptr, return is 'n-ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0625', 0, () => {
      let script: string = `
      testIsExceptionPendingTest3()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0626
     * @tc.name      JsvmTest0626
     * @tc.desc      Test that when result is not null, there is error, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0626', 0, () => {
      let script: string = `
      testGetLastErrorInfoTest1("abc")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0627
     * @tc.name      JsvmTest0627
     * @tc.desc      Test that when result is not null, there is not error, return is 'ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0627', 0, () => {
      let script: string = `
      testGetLastErrorInfoTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0628
     * @tc.name      JsvmTest0628
     * @tc.desc      Test that when result is nullptr, return is 'n-ok'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0628', 0, () => {
      let script: string = `
      testGetLastErrorInfoTest3()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0629
     * @tc.name      JsvmTest0629
     * @tc.desc      Combination scenario: CreateError-> isError->Throw, return ok.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0629', 0, () => {
      let script: string = `
      testCombinationTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0630
     * @tc.name      JsvmTest0630
     * @tc.desc      Combination scenario: CreateTypeError-> isError->Throw, return ok.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0630', 0, () => {
      let script: string = `
      testCombinationTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0631
     * @tc.name      JsvmTest0631
     * @tc.desc      Combination scenario: CreateRangeError-> isError->Throw, return ok.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0631', 0, () => {
      let script: string = `
      testCombinationTest3()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0632
     * @tc.name      JsvmTest0632
     * @tc.desc      Combination scenario: CreateSyntaxError-> isError->Throw, return ok.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0632', 0, () => {
      let script: string = `
      testCombinationTest4()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0633
     * @tc.name      JsvmTest0633
     * @tc.desc      Combination scenario: ThrowError, return ok.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0633', 0, () => {
      let script: string = `
      testCombinationTest5()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0634
     * @tc.name      JsvmTest0634
     * @tc.desc      Combination scenario: ThrowTypeError, return ok.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0634', 0, () => {
      let script: string = `
      testCombinationTest6()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0635
     * @tc.name      JsvmTest0635
     * @tc.desc      Combination scenario: ThrowRangeError, return ok.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0635', 0, () => {
      let script: string = `
      testCombinationTest7()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0636
     * @tc.name      JsvmTest0636
     * @tc.desc      Combination scenario: ThrowSyntaxError, return ok.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0636', 0, () => {
      let script: string = `
      testCombinationTest8()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0637
     * @tc.name      JsvmTest0637
     * @tc.desc      Combination scenario: CreateError-> isError->Throw->IsExceptionPending is true
     * -> GetAndClearLastException-> IsExceptionPending is false, return ok.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0637', 0, () => {
      let script: string = `
      testCombinationTest9()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0638
     * @tc.name      JsvmTest0638
     * @tc.desc      Combination scenario: CreateTypeError-> isError->Throw->IsExceptionPending is true
     * -> GetAndClearLastException -> IsExceptionPending is false, return ok.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0638', 0, () => {
      let script: string = `
      testCombinationTest10()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0639
     * @tc.name      JsvmTest0639
     * @tc.desc      Combination scenario: CreateRangeError-> isError->Throw->IsExceptionPending is true
     * -> GetAndClearLastException -> IsExceptionPending is false, return ok.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0639', 0, () => {
      let script: string = `
      testCombinationTest11()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0640
     * @tc.name      JsvmTest0640
     * @tc.desc      Combination scenario: ThrowSyntaxErrorr-> isError->Throw->IsExceptionPending is true
     * -> GetAndClearLastException -> IsExceptionPending is false, return ok.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0640', 0, () => {
      let script: string = `
      testCombinationTest12()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0641
     * @tc.name      JsvmTest0641
     * @tc.desc      Combination scenario: ThrowError->IsExceptionPending is true -> GetAndClearLastException
     * -> IsExceptionPending is false, return ok.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0641', 0, () => {
      let script: string = `
      testCombinationTest13()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0642
     * @tc.name      JsvmTest0642
     * @tc.desc      Combination scenario: ThrowTypeError->IsExceptionPending is true -> GetAndClearLastException
     *  -> IsExceptionPending is false, return ok.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0642', 0, () => {
      let script: string = `
      testCombinationTest14()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0643
     * @tc.name      JsvmTest0643
     * @tc.desc      Combination scenario: ThrowRangeError->IsExceptionPending is true -> GetAndClearLastException
     * -> IsExceptionPending is false, return ok.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0643', 0, () => {
      let script: string = `
      testCombinationTest15()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0644
     * @tc.name      JsvmTest0644
     * @tc.desc      Combination scenario: ThrowSyntaxError->IsExceptionPending is true -> GetAndClearLastException
     * -> IsExceptionPending is false, return ok.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0644', 0, () => {
      let script: string = `
      testCombinationTest16()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0645
     * @tc.name      JsvmTest0645
     * @tc.desc      Combination scenario: CreateError->GetAndClearLastException->isError is true, return ok.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0645', 0, () => {
      let script: string = `
      testCombinationTest17()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0646
     * @tc.name      JsvmTest0646
     * @tc.desc      Combination scenario: CreateTypeError->GetAndClearLastException->isError is true, return ok.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0646', 0, () => {
      let script: string = `
      testCombinationTest18()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0647
     * @tc.name      JsvmTest0647
     * @tc.desc      Combination scenario: CreateRangeError->GetAndClearLastException->isError is true, return ok.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0647', 0, () => {
      let script: string = `
      testCombinationTest19()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0648
     * @tc.name      JsvmTest0648
     * @tc.desc      Combination scenario: CreateSyntaxErrorr->GetAndClearLastException->isError is true, return ok.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0648', 0, () => {
      let script: string = `
      testCombinationTest20()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0649
     * @tc.name      JsvmTest0649
     * @tc.desc      Combination scenario: ThrowError->ThrowTypeError->IsExceptionPending is true
     * -> GetAndClearLastException-> IsExceptionPending is true, return ok.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0649', 0, () => {
      let script: string = `
      testCombinationTest21()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0650
     * @tc.name      JsvmTest0650
     * @tc.desc      Combination scenario: ThrowRangeError->ThrowSyntaxError->IsExceptionPending is true
     * -> GetAndClearLastException-> IsExceptionPending is true, return ok.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0650', 0, () => {
      let script: string = `
      testCombinationTest22()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0651
     * @tc.name      JsvmTest0651
     * @tc.desc      Combination scenario: ThrowTypeError->ThrowRangeError->ThrowError->ThrowSyntaxError
     * ->IsExceptionPending is true->GetAndClearLastException(four) ->IsExceptionPending is false, return ok.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0651', 0, () => {
      let script: string = `
      testCombinationTest23()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0652
     * @tc.name      JsvmTest0652
     * @tc.desc      when object is null, key is not null, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0652', 0, () => {
      let script: string = `
      testHasPropertyTest1("key")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0653
     * @tc.name      JsvmTest0653
     * @tc.desc      when object is not null, key is null, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0653', 0, () => {
      let script: string = `
      let obj = '{ data: 0, key: "key message", 50: 1}';
      testHasPropertyTest2(obj)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0654
     * @tc.name      JsvmTest0654
     * @tc.desc      when object is null, key is not null, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0654', 0, () => {
      let script: string = `
      let obj = '{ data: 0, key: "key message", 50: 1}';
      testDeletePropertyTest1(obj, "key")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0655
     * @tc.name      JsvmTest0655
     * @tc.desc      when object is not null, key is null, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0655', 0, () => {
      let script: string = `
      let obj = '{ data: 0, key: "key message", 50: 1}';
      testDeletePropertyTest2(obj, "key")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0656
     * @tc.name      JsvmTest0656
     * @tc.desc      when object is not null, key is null, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0656', 0, () => {
      let script: string = `
      let obj = '{ data: 0, key: "key message", 50: 1}';
      testHasOwnPropertyTest1(obj, "key")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0657
     * @tc.name      JsvmTest0657
     * @tc.desc      when object is null, key is not null, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0657', 0, () => {
      let script: string = `
      let obj = { data: 0, key: "key message", 50: 1};
      testHasOwnPropertyTest2(obj, "key")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0658
     * @tc.name      JsvmTest0658
     * @tc.desc      when property is setProperty, return 'false'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0658', 0, () => {
      let script: string = `
      let obj = { key: "key message" };
      testHasOwnPropertyTest3(obj)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0659
     * @tc.name      JsvmTest0659
     * @tc.desc      when object is null, key is not null, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0659', 0, () => {
      let script: string = `
      let obj = { data: 0, key: "key message", 50: 1};
      testGetNamedPropertyTest1(obj, "key")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0660
     * @tc.name      JsvmTest0660
     * @tc.desc      when object is not null, key is null, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0660', 0, () => {
      let script: string = `
      let obj = { data: 0, key: "key message", 50: 1};
      testGetNamedPropertyTest2(obj, "key")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0661
     * @tc.name      JsvmTest0661
     * @tc.desc      when object is not null, get n-on exist key, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0661', 0, () => {
      let script: string = `
      let obj = { data: 0, key: "key message", 50: 1};
      testGetNamedPropertyTest3(obj, "key")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0662
     * @tc.name      JsvmTest0662
     * @tc.desc      when object is null, utf8name is not null, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0662', 0, () => {
      let script: string = `
      let obj = { data: 0, key: "key message", 50: 1};
      testHasNamedPropertyTest1(obj, "key")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0663
     * @tc.name      JsvmTest0663
     * @tc.desc      when object is not null, utf8name is null, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0663', 0, () => {
      let script: string = `
      let obj = { data: 0, key: "key message", 50: 1};
      testHasNamedPropertyTest2(obj, "key")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0664
     * @tc.name      JsvmTest0664
     * @tc.desc      when object is not null, utf8name is non exist value, return 'ok' and result is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0664', 0, () => {
      let script: string = `
      let obj = { data: 0, key: "key message", 50: 1};
      testHasNamedPropertyTest3(obj, "key")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0665
     * @tc.name      JsvmTest0665
     * @tc.desc      when object is not null, utf8name is exist value, return 'ok' and result is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0665', 0, () => {
      let script: string = `
      let obj = { data: 0, key: "key message", 50: 1};
      testHasNamedPropertyTest4(obj, "key")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0666
     * @tc.name      JsvmTest0666
     * @tc.desc      when object is null, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0666', 0, () => {
      let script: string = `
      let obj = { data: 0, key: "key message", 50: 1};
      testDefinePropertiesTest1(obj)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0667
     * @tc.name      JsvmTest0667
     * @tc.desc      when object is not null, propertyCount is 0, return 'ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0667', 0, () => {
      let script: string = `
      let obj = { data: 0, key: "key message", 50: 1};
      testDefinePropertiesTest2(obj)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0668
     * @tc.name      JsvmTest0668
     * @tc.desc      when properties is null, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0668', 0, () => {
      let script: string = `
      let obj = { data: 0, key: "key message", 50: 1};
      testDefinePropertiesTest3(obj)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0669
     * @tc.name      JsvmTest0669
     * @tc.desc      when properties is effective, return 'ok' and successful definition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0669', 0, () => {
      let script: string = `
      let obj = { data1: 1, key1: "key message", 50: 1};
      testDefinePropertiesTest4(obj)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0670
     * @tc.name      JsvmTest0670
     * @tc.desc      Combination scenario: setProperty one property->setProperty once more->getProperty->getProperty again
     * -> hasProperty-> hasProperty again ->deleteProperty->deleteProperty again
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0670', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCombinationPropertyTest1(obj, "key", "key message")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0671
     * @tc.name      JsvmTest0671
     * @tc.desc      Combination scenario: setProperty two properties->hasProperty two ->getProperty two
     * ->deleteProperty one property ->hasProperty ->getProperty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0671', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCombinationPropertyTest2(obj, "key", "key message")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0672
     * @tc.name      JsvmTest0672
     * @tc.desc      Combination scenario: setProperty two properties->hasProperty two ->getProperty two
     * ->deleteProperty one property ->hasProperty delete property ->getProperty delete property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0672', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCombinationPropertyTest3(obj, "key", "key message")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0673
     * @tc.name      JsvmTest0673
     * @tc.desc      Combination scenario: setProperty two properties->hasProperty two ->getProperty two
     * ->deleteProperty one property ->setProperty ->hasProperty ->getProperty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0673', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCombinationPropertyTest4(obj, "key", "key message")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0674
     * @tc.name      JsvmTest0674
     * @tc.desc      namedProperty组合: SetNamedProperty -> setProperty -> GetNamedProperty -> GetNamedProperty
     *               -> HasNamedProperty -> HasNamedProperty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0674', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCombinationNamedPropertyTest1(obj, "key", "key message")
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0675
     * @tc.name      JsvmTest0675
     * @tc.desc      Combination scenario: setProperty two properties->hasProperty two ->getProperty two
     * ->deleteProperty one property ->setProperty ->hasProperty ->getProperty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0675', 0, () => {
      let script: string = `
      testCombinationNamedPropertyTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0676
     * @tc.name      JsvmTest0676
     * @tc.desc      result is null, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0676', 0, () => {
      let script: string = `
      testCreateObjectTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0677
     * @tc.name      JsvmTest0677
     * @tc.desc      result is not null, return 'ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0677', 0, () => {
      let script: string = `
      testCreateObjectTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0678
     * @tc.name      JsvmTest0678
     * @tc.desc      value is null, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0678', 0, () => {
      let script: string = `
      testTypeofTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0679
     * @tc.name      JsvmTest0679
     * @tc.desc      value is not null, return 'ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0679', 0, () => {
      let script: string = `
      let value = undefined
      testTypeofTest2(value)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0680
     * @tc.name      JsvmTest0680
     * @tc.desc      value is not null, type is JSVM_NULL, return 'ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0680', 0, () => {
      let script: string = `
      let value = null
      testTypeofTest3(value)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0681
     * @tc.name      JsvmTest0681
     * @tc.desc      value is not null, type is JSVM_BOOLEAN, return 'ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0681', 0, () => {
      let script: string = `
      let value = true
      testTypeofTest4(value)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0682
     * @tc.name      JsvmTest0682
     * @tc.desc      value is not null, type is JSVM_NUMBER, return 'ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0682', 0, () => {
      let script: string = `
      let value = 5
      testTypeofTest5(value)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0683
     * @tc.name      JsvmTest0683
     * @tc.desc      value is not null, type is JSVM_STRING, return 'ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0683', 0, () => {
      let script: string = `
      let value = 'string type'
      testTypeofTest6(value)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0684
     * @tc.name      JsvmTest0684
     * @tc.desc      value is not null, type is JSVM_SYMBOL, return 'ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0684', 0, () => {
      let script: string = `
      let symbolValue = Symbol("foo")
      testTypeofTest7(symbolValue)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0685
     * @tc.name      JsvmTest0685
     * @tc.desc      value is not null, type is JSVM_OBJECT, return 'ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0685', 0, () => {
      let script: string = `
      let objectValue = {data: "123"}
      testTypeofTest8(objectValue)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0686
     * @tc.name      JsvmTest0686
     * @tc.desc      value is not null, type is JSVM_FUNCTION, return 'ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0686', 0, () => {
      let script: string = `
      function fun(){}
      let value = fun
      testTypeofTest9(value)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0687
     * @tc.name      JsvmTest0687
     * @tc.desc      value is not null, type is JSVM_EXTERNAL, return 'ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0687', 0, () => {
      let script: string = `
      testTypeofTest10()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0688
     * @tc.name      JsvmTest0688
     * @tc.desc      value is not null, type is JSVM_BIGINT, return 'ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0688', 0, () => {
      let script: string = `
      let value = 3n
      testTypeofTest11(value)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0689
     * @tc.name      JsvmTest0689
     * @tc.desc      value is not null, result is null, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0689', 0, () => {
      let script: string = `
      testTypeofTest12()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0690
     * @tc.name      JsvmTest0690
     * @tc.desc      value is null, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0690', 0, () => {
      let script: string = `
      testTypeTagObjectTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0691
     * @tc.name      JsvmTest0691
     * @tc.desc      value is not null, object is not connected with typeTag, return 'ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0691', 0, () => {
      let script: string = `
      let obj = {data: "value"}
      testTypeTagObjectTest2(obj)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0692
     * @tc.name      JsvmTest0692
     * @tc.desc      value is not null, object is connected with typeTag, return 'ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0692', 0, () => {
      let script: string = `
      let obj = {data: "value"}
      testTypeTagObjectTest3(obj)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0693
     * @tc.name      JsvmTest0693
     * @tc.desc      value is not null, typeTag is null, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0693', 0, () => {
      let script: string = `
      let obj = {data: "value"}
      testTypeTagObjectTest4(obj)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0694
     * @tc.name      JsvmTest0694
     * @tc.desc      value is null, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0694', 0, () => {
      let script: string = `
      testCheckObjectTypeTagTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0695
     * @tc.name      JsvmTest0695
     * @tc.desc      value is not null, object is not connected with typeTag, return 'ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0695', 0, () => {
      let script: string = `
      let obj = {data: "value"}
      testCheckObjectTypeTagTest2(obj)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0696
     * @tc.name      JsvmTest0696
     * @tc.desc      value is not null, object is connected with typeTag, return 'ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0696', 0, () => {
      let script: string = `
      let obj = {data: "value"}
      testCheckObjectTypeTagTest3(obj)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0697
     * @tc.name      JsvmTest0697
     * @tc.desc      value is not null, typeTag is null, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0697', 0, () => {
      let script: string = `
      let obj = {data: "value"}
      testCheckObjectTypeTagTest4(obj)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0698
     * @tc.name      JsvmTest0698
     * @tc.desc      value is not null, typeTag is not null, result is null, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0698', 0, () => {
      let script: string = `
      let obj = {data: "value"}
      testCheckObjectTypeTagTest5(obj)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0699
     * @tc.name      JsvmTest0699
     * @tc.desc      Combination: createObject -> Typeof -> GetPrototype -> TypeTagObject -> CheckObjectTypeTag
     *               -> CheckObjectTypeTag -> Instanceof -> ObjectFreeze -> SetNamedProperty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0699', 0, () => {
      let script: string = `
      function person(){}
      let value = person
      testObjectCombinationTest1(person)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0700
     * @tc.name      JsvmTest0700
     * @tc.desc      Combination: CreateSymbol -> SymbolFor -> SymbolFor -> Typeof -> GetPrototype -> TypeTagObject
     *               -> CheckObjectTypeTag -> ObjectSeal -> SetNamedProperty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0700', 0, () => {
      let script: string = `
      testObjectCombinationTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0702
     * @tc.name      JsvmTest0702
     * @tc.desc      options is null, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0702', 0, () => {
      let script: string = `
      testInitTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0703
     * @tc.name      JsvmTest0703
     * @tc.desc      options is JSVM_InitOptions, vm is not null, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0703', 0, () => {
      let script: string = `
      testCreateVMTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0704
     * @tc.name      JsvmTest0704
     * @tc.desc      options is null, vm is not null, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0704', 0, () => {
      let script: string = `
      testCreateVMTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0705
     * @tc.name      JsvmTest0705
     * @tc.desc      create vm, return 'ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0705', 0, () => {
      let script: string = `
      testDestroyVMTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0706
     * @tc.name      JsvmTest0706
     * @tc.desc      vm is null, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0706', 0, () => {
      let script: string = `
      testDestroyVMTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0708
     * @tc.name      JsvmTest0708
     * @tc.desc      create vm, return 'ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0708', 0, () => {
      let script: string = `
      testOpenVMScopeTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0709
     * @tc.name      JsvmTest0709
     * @tc.desc      create vm, and create more scope, return 'ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0709', 0, () => {
      let script: string = `
      testOpenVMScopeTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0711
     * @tc.name      JsvmTest0711
     * @tc.desc      create vm -> open VMScope, return 'ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0711', 0, () => {
      let script: string = `
      testCloseVMScopeTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0712
     * @tc.name      JsvmTest0712
     * @tc.desc      continuously close the same scope, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0712', 0, () => {
      let script: string = `
      testCloseVMScopeTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0713
     * @tc.name      JsvmTest0713
     * @tc.desc      create JSVM_PropertyDescriptor array, propertycount is 0, return 'ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0713', 0, () => {
      let script: string = `
      testCreateEnvTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0714
     * @tc.name      JsvmTest0714
     * @tc.desc      create JSVM_PropertyDescriptor array, propertycount is the size, return 'ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0714', 0, () => {
      let script: string = `
      testCreateEnvTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0715
     * @tc.name      JsvmTest0715
     * @tc.desc      create env, return 'ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0715', 0, () => {
      let script: string = `
      testDestroyEnvTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0716
     * @tc.name      JsvmTest0716
     * @tc.desc      env is null, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0716', 0, () => {
      let script: string = `
      testDestroyEnvTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0717
     * @tc.name      JsvmTest0717
     * @tc.desc      env is null, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0717', 0, () => {
      let script: string = `
      testOpenEnvScopeTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0718
     * @tc.name      JsvmTest0718
     * @tc.desc      env is not null, return 'ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0718', 0, () => {
      let script: string = `
      testOpenEnvScopeTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0719
     * @tc.name      JsvmTest0719
     * @tc.desc      called OpenEnvScope two, return 'ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0719', 0, () => {
      let script: string = `
      testOpenEnvScopeTest3()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0721
     * @tc.name      JsvmTest0721
     * @tc.desc      scope is null, return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0721', 0, () => {
      let script: string = `
      testCloseEnvScopeTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0723
     * @tc.name      JsvmTest0723
     * @tc.desc      env adn scope is ok, close scope two, the first return 'ok', second return 'n-ok'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0723', 0, () => {
      let script: string = `
      testCloseEnvScopeTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0724
     * @tc.name      JsvmTest0724
     * @tc.desc      Combination: Init -> create vm ->open vm scope->create env->open env scope -> open handlescope
     *               -> close handlescope -> close env scope -> destroy env -> close vm scope -> destroy vm
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0724', 0, () => {
      let script: string = `
      testDataTypeCombinationTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0725
     * @tc.name      JsvmTest0725
     * @tc.desc      time is null, return 'n-ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0725', 0, () => {
      let script: string = `
      testCreateDateTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0726
     * @tc.name      JsvmTest0726
     * @tc.desc      time is ok, get ok, return 'ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0726', 0, () => {
      let script: string = `
      testGetDateValueTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0727
     * @tc.name      JsvmTest0727
     * @tc.desc      value is null, return 'n-ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0727', 0, () => {
      let script: string = `
      testIsDateTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0728
     * @tc.name      JsvmTest0728
     * @tc.desc      create ok, get ok, return 'ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0728', 0, () => {
      let script: string = `
      testDateCombinationTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0729
     * @tc.name      JsvmTest0729
     * @tc.desc      create ok, get ok, return 'ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0729', 0, () => {
      let script: string = `
      testDateCombinationTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0730
     * @tc.name      JsvmTest0730
     * @tc.desc      vm is null, return 'n-ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0730', 0, () => {
      let script: string = `
      testPumpMessageLoopTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0731
     * @tc.name      JsvmTest0731
     * @tc.desc      vm is null, return 'n-ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0731', 0, () => {
      let script: string = `
      testPerformMicrotaskCheckpointTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0732
     * @tc.name      JsvmTest0732
     * @tc.desc      pump -> perform, return 'ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0732', 0, () => {
      let script: string = `
      testExecuteTasksCombinationTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0733
     * @tc.name      JsvmTest0733
     * @tc.desc      string is null, return 'n-ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0733', 0, () => {
      let script: string = `
      testJsonParseTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0734
     * @tc.name      JsvmTest0734
     * @tc.desc      string is error, return 'n-ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0734', 0, () => {
      let script: string = `
      testJsonParseTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0735
     * @tc.name      JsvmTest0735
     * @tc.desc      string is ok, return 'ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0735', 0, () => {
      let script: string = `
      testJsonParseTest3()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0736
     * @tc.name      JsvmTest0736
     * @tc.desc      jsonObject is nullptr, return 'n-ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0736', 0, () => {
      let script: string = `
      testJsonStringifyTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0737
     * @tc.name      JsvmTest0737
     * @tc.desc      jsonObject is object, return 'n-ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0737', 0, () => {
      let script: string = `
      testJsonStringifyTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0738
     * @tc.name      JsvmTest0738
     * @tc.desc      jsonObject is TypedArray, return 'ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0738', 0, () => {
      let script: string = `
      testJsonStringifyTest3()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0739
     * @tc.name      JsvmTest0739
     * @tc.desc      Combination: JsonStringify -> JsonParse, return 'ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0739', 0, () => {
      let script: string = `
      testJsonCombinationTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0740
     * @tc.name      JsvmTest0740
     * @tc.desc      Combination: JsonStringify -> JsonParse, return 'ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0740', 0, () => {
      let script: string = `
      testJsonCombinationTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0741
     * @tc.name      JsvmTest0741
     * @tc.desc      lhs is int, rhs is int, result is nullptr, return 'n-ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0741', 0, () => {
      let script: string = `
      testStrictEqualsTest1()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0742
     * @tc.name      JsvmTest0742
     * @tc.desc      lhs is double, rhs is int, result is not null, return 'ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0742', 0, () => {
      let script: string = `
      testStrictEqualsTest2()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0743
     * @tc.name      JsvmTest0743
     * @tc.desc      lhs is nullptr, rhs is nullptr, result is not null, return 'n-ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0743', 0, () => {
      let script: string = `
      testStrictEqualsTest3()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0744
     * @tc.name      JsvmTest0744
     * @tc.desc      lhs is undefined, rhs is undefined, result is not null, return 'n-ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0744', 0, () => {
      let script: string = `
      let lhsValue = undefined
      let rhsValue = undefined
      testStrictEqualsTest4(lhsValue, rhsValue)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0745
     * @tc.name      JsvmTest0745
     * @tc.desc      lhs is set, rhs is set, result is not null, same value, return 'ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0745', 0, () => {
      let script: string = `
      const value = new Set([1, 2, 3])
      const lhsValue = value
      const rhsValue = value
      testStrictEqualsTest5(lhsValue, rhsValue)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0746
     * @tc.name      JsvmTest0746
     * @tc.desc      lhs is boolean, rhs is boolean, result is not null, same value, return 'ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0746', 0, () => {
      let script: string = `
      let lhsValue = true
      let rhsValue = true
      testStrictEqualsTest6(lhsValue, rhsValue)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0747
     * @tc.name      JsvmTest0747
     * @tc.desc      lhs is string, rhs is string, result is not null, same value, return 'ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0747', 0, () => {
      let script: string = `
      let lhsValue = 'string123'
      let rhsValue = 'string123'
      testStrictEqualsTest7(lhsValue, rhsValue)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0748
     * @tc.name      JsvmTest0748
     * @tc.desc      lhs is symbol, rhs is symbol, result is not null, same value, return 'ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0748', 0, () => {
      let script: string = `
      let value = Symbol("foo")
      let lhsValue = value
      let rhsValue = value
      testStrictEqualsTest8(lhsValue, rhsValue)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0749
     * @tc.name      JsvmTest0749
     * @tc.desc      lhs is function, rhs is function, result is not null, same value, return 'ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0749', 0, () => {
      let script: string = `
      function person(){}
      let value = person
      let lhsValue = person
      let rhsValue = person
      testStrictEqualsTest9(lhsValue, rhsValue)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0750
     * @tc.name      JsvmTest0750
     * @tc.desc      lhs is bigint, rhs is bigint, result is not null, same value, return 'ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0750', 0, () => {
      let script: string = `
      let lhsValue = 5n
      let rhsValue = 5n
      testStrictEqualsTest10(lhsValue, rhsValue)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0751
     * @tc.name      JsvmTest0751
     * @tc.desc      lhs is regexp, rhs is regexp, result is not null, same value, return 'ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0751', 0, () => {
      let script: string = `
      const value = /[a-z]+/g
      const lhsValue = value
      const rhsValue = value
      testStrictEqualsTest11(lhsValue, rhsValue)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0752
     * @tc.name      JsvmTest0752
     * @tc.desc      lhs is set, rhs is set, result is not null, different values, return 'ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0752', 0, () => {
      let script: string = `
      let lhsValue = new Set([1, 2, 3])
      let rhsValue = new Set([4, 5, 6])
      testStrictEqualsTest12(lhsValue, rhsValue)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0753
     * @tc.name      JsvmTest0753
     * @tc.desc      lhs is boolean, rhs is boolean, result is not null, different values, return 'ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0753', 0, () => {
      let script: string = `
      let lhsValue = true
      let rhsValue = false
      testStrictEqualsTest13(lhsValue, rhsValue)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0754
     * @tc.name      JsvmTest0754
     * @tc.desc      lhs is string, rhs is string, result is not null, different values, return 'ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0754', 0, () => {
      let script: string = `
      let lhsValue = 'string123'
      let rhsValue = 'hello'
      testStrictEqualsTest14(lhsValue, rhsValue)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0755
     * @tc.name      JsvmTest0755
     * @tc.desc      lhs is symbol, rhs is symbol, result is not null, different values, return 'ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0755', 0, () => {
      let script: string = `
      let lhsValue = Symbol("foo")
      let rhsValue = Symbol("fun")
      testStrictEqualsTest15(lhsValue, rhsValue)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0756
     * @tc.name      JsvmTest0756
     * @tc.desc      lhs is function, rhs is function, result is not null, different values, return 'ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0756', 0, () => {
      let script: string = `
      function person(){}
      let lhsValue = person
      function hello(){}
      let rhsValue = hello
      testStrictEqualsTest16(lhsValue, rhsValue)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0757
     * @tc.name      JsvmTest0757
     * @tc.desc      lhs is bigint, rhs is bigint, result is not null, different values, return 'ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0757', 0, () => {
      let script: string = `
      let lhsValue = 5n
      let rhsValue = 9n
      testStrictEqualsTest17(lhsValue, rhsValue)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0758
     * @tc.name      JsvmTest0758
     * @tc.desc      lhs is regexp, rhs is regexp, result is not null, different values, return 'ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0758', 0, () => {
      let script: string = `
      const lhsValue = /[a-z]+/g
      const rhsValue = /[0-9]+/g
      testStrictEqualsTest18(lhsValue, rhsValue)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0759
     * @tc.name      JsvmTest0759
     * @tc.desc      lhs is null, rhs is null, result is not null, different values, return 'ok'
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0759', 0, () => {
      let script: string = `
      const lhsValue = null
      const rhsValue = null
      testStrictEqualsTest19(lhsValue, rhsValue)
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0760
     * @tc.name      JsvmTest0760
     * @tc.desc      Test the function of Trace interfaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0760', 0, () => {
      let rst: number = napitest.traceTest();
      console.info('JsvmTest0760 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0761
     * @tc.name      JsvmTest0761
     * @tc.desc      Test the function of Wrapper Object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0761', 0, () => {
      let rst: number = napitest.wrapperObjectTest();
      console.info('JsvmTest0761 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0762
     * @tc.name      JsvmTest0762
     * @tc.desc      Test the function of Well-Known Symbols.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0762', 0, () => {
      let rst: number = napitest.wellKnownSymbolsTest();
      console.info('JsvmTest0762 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0763
     * @tc.name      JsvmTest0763
     * @tc.desc      Test OH_JSVM_DefineClassWithOptions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0763', 0, () => {
      let rst: number = napitest.defineClassWithOptionsTest();
      console.info('JsvmTest0763 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0764
     * @tc.name      JsvmTest0764
     * @tc.desc      Test the handler for exceptions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0764', 0, () => {
      let rst: number = napitest.triggerExceptionsTest();
      console.info('JsvmTest0764 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0765
     * @tc.name      JsvmTest0765
     * @tc.desc      Test the handler for gc.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0765', 0, () => {
      let rst: number = napitest.triggerGCTest();
      console.info('JsvmTest0765 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
        });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0766
     * @tc.name      JsvmTest0766
     * @tc.desc      Test the function of SetMicrotaskPolicy.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0766', 0, () => {
      let rst: number = napitest.SetMicrotaskPolicy();
      console.info('JsvmTest0766 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0767
     * @tc.name      JsvmTest0767
     * @tc.desc      Test the function of PromiseRegisterHandler.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0767', 0, () => {
      let rst: number = napitest.PromiseRegisterHandler();
      console.info('JsvmTest0767 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0768
     * @tc.name      JsvmTest0768
     * @tc.desc      Test the function of ProxyTest.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0768', 0, () => {
      let rst: number = napitest.ProxyTest();
      console.info('JsvmTest0768 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0769
     * @tc.name      JsvmTest0769
     * @tc.desc      Test the function of private interfaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0769', 0, () => {
      let rst: number = napitest.privateTest();
      console.info('JsvmTest0769 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0770
     * @tc.name      JsvmTest0770
     * @tc.desc      Test the function of external string interfaces.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('JsvmTest0770', 0, () => {
      let rst: number = napitest.externalStringTest();
      console.info('JsvmTest0770 testString result is:' + JSON.stringify(rst));
      expect(rst).assertEqual(0);
    });
        /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0771
     * @tc.name      JsvmTest0771
     * @tc.desc      Create arraybuffer byteLength 0 and data NULL and result not null, rst ok
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0771', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateArrayBufferCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0772
     * @tc.name      JsvmTest0772
     * @tc.desc      Create arraybuffer byteLength > 0 and data not null and result not null, rst ok
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0772', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateArrayBufferCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0773
     * @tc.name      JsvmTest0773
     * @tc.desc      Create arraybuffer byteLength JSVM_AUTO_LENGTH and data not null and result not null, rst ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0773', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateArrayBufferCase03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0774
     * @tc.name      JsvmTest0774
     * @tc.desc      Create arraybuffer byteLength 10 and data not null and result NULL
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0774', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateArrayBufferCase04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0775
     * @tc.name      JsvmTest0775
     * @tc.desc      Get arraybuffer, arraybuffer obj,Obtain expected data and byteLength
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0775', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetArrayBufferCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0776
     * @tc.name      JsvmTest0776
     * @tc.desc      Get arraybuffer, not arraybuffer obj, get information failure
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0776', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetArrayBufferCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0777
     * @tc.name      JsvmTest0777
     * @tc.desc      Is arraybuffer judge, value arraybuffer obj + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0777', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testIsArrayBufferCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0778
     * @tc.name      JsvmTest0778
     * @tc.desc      Is arraybuffer judge, value not arraybuffer obj + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0778', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testIsArrayBufferCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0779
     * @tc.name      JsvmTest0779
     * @tc.desc      Is arraybuffer judge, value arraybuffer obj + result null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0779', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testIsArrayBufferCase03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0780
     * @tc.name      JsvmTest0780
     * @tc.desc      Detach arraybuffer, arraybuffer obj,binding typedarray
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0780', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testDetachArrayBufferCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0781
     * @tc.name      JsvmTest0781
     * @tc.desc      Detach arraybuffer, arraybuffer obj, binding dataview
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0781', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testDetachArrayBufferCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0782
     * @tc.name      JsvmTest0782
     * @tc.desc      Detach arraybuffer, not arraybuffer obj
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0782', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testDetachArrayBufferCase03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0783
     * @tc.name      JsvmTest0783
     * @tc.desc      Is detach arraybuffer, arraybuffer obj binding typedarray + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0783', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testIsDetachedArraybufferCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0784
     * @tc.name      JsvmTest0784
     * @tc.desc      Is detach arraybuffer, arraybuffer obj binding dataview + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0784', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testIsDetachedArraybufferCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0785
     * @tc.name      JsvmTest0785
     * @tc.desc      Is detach arraybuffer, arraybuffer obj detach obj + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0785', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testIsDetachedArraybufferCase03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0786
     * @tc.name      JsvmTest0786
     * @tc.desc      Is detach arraybuffer, value not arraybuffer obj + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0786', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testIsDetachedArraybufferCase04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0787
     * @tc.name      JsvmTest0787
     * @tc.desc      Is detach arraybuffer, value arraybuffer obj + result NULL
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0787', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testIsDetachedArraybufferCase05()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0788
     * @tc.name      JsvmTest0788
     * @tc.desc      createArraybuffer Createarraybuffer -> IsArraybuffer，true -> 
     * createTypedarray -> GetArraybufferInfo -> IsTypedarray, true -> IsDetachedArraybuffer，false 
     *-> DetachArraybuffer -> IsTypedarray, false -> IsDetachedArraybuffer,true
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0788', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateAnyBufferDetachedCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0789
     * @tc.name      JsvmTest0789
     * @tc.desc      Create Int32, value int32_max + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0789', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateInt32Case01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0790
     * @tc.name      JsvmTest0790
     * @tc.desc      Create Int32, value int32_min + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0790', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateInt32Case02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0791
     * @tc.name      JsvmTest0791
     * @tc.desc      Create Int32, value 0 + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0791', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateInt32Case03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0792
     * @tc.name      JsvmTest0792
     * @tc.desc      Create Int32, value 0 + result NULL
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0792', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateInt32Case04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0793
     * @tc.name      JsvmTest0793
     * @tc.desc      Create Uint32, value uint32_max + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0793', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateUint32Case01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0794
     * @tc.name      JsvmTest0794
     * @tc.desc      Create Uint32, value 1 + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0794', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateUint32Case02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0795
     * @tc.name      JsvmTest0795
     * @tc.desc      Create Uint32, value 0 + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0795', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateUint32Case03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0796
     * @tc.name      JsvmTest0796
     * @tc.desc      Create Uint32, value 0 + result NULL
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0796', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateUint32Case04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0797
     * @tc.name      JsvmTest0797
     * @tc.desc      Create int64, value int64_max + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0797', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateInt64Case01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0798
     * @tc.name      JsvmTest0798
     * @tc.desc      Create int64, value int64_min + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0798', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateInt64Case02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0799
     * @tc.name      JsvmTest0799
     * @tc.desc      Create int64, value 0 + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0799', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateInt64Case03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0800
     * @tc.name      JsvmTest0800
     * @tc.desc      Create int64, value 0 + result NULL
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0800', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateInt64Case04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0801
     * @tc.name      JsvmTest0801
     * @tc.desc      Create double, value double_max + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0801', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateDoubleCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0802
     * @tc.name      JsvmTest0802
     * @tc.desc      Create double, value double_min + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0802', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateDoubleCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0803
     * @tc.name      JsvmTest0803
     * @tc.desc      Create double, value 0 + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0803', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateDoubleCase03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0804
     * @tc.name      JsvmTest0804
     * @tc.desc      Create double, value 0 + result NULL
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0804', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateDoubleCase04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0805
     * @tc.name      JsvmTest0805
     * @tc.desc      Get uint32, not uint32 value
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0805', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetValueUint32Case01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0806
     * @tc.name      JsvmTest0806
     * @tc.desc      Get int32, not int32 value
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0806', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetValueInt32Case01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0807
     * @tc.name      JsvmTest0807
     * @tc.desc      Get int64, not int64 value
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0807', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetValueInt64Case01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0808
     * @tc.name      JsvmTest0808
     * @tc.desc      Get double, not double value
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0808', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetValueDoubleCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0809
     * @tc.name      JsvmTest0809
     * @tc.desc      CreateInt32 value -> GetValueUint32 int32 convert uint32 ->GetValueInt32 -> 
     * GetValueInt64 int32 convert int64 -> GetValueDouble int32 convert double
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0809', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testBasicDataTypesCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0810
     * @tc.name      JsvmTest0810
     * @tc.desc      CreateUint32 value -> GetValueUint32 -> GetValueInt32 uint32 convert int32 -> 
     * GetValueInt64 uint32 convert int64 -> GetValueDouble uint32 convert double
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0810', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testBasicDataTypesCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0811
     * @tc.name      JsvmTest0811
     * @tc.desc      CreateInt64 -> GetValueUint32 int64 convert uint32 ->GetValueInt32 int64 convert int32 ->
     * GetValueInt64 int64->GetValueDouble int64 convert double
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0811', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testBasicDataTypesCase03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0812
     * @tc.name      JsvmTest0812
     * @tc.desc      CreateDouble -> GetValueUint32 double convert uint32 -> GetValueInt32 double convert int32 ->
     * GetValueInt64 double convert int64 -> GetValueDouble double value
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0812', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testBasicDataTypesCase04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0813
     * @tc.name      JsvmTest0813
     * @tc.desc      Create bigint int64, value int64_max + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0813', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateBigintInt64Case01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0814
     * @tc.name      JsvmTest0814
     * @tc.desc      Create bigint int64, value int64_min + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0814', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateBigintInt64Case02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0815
     * @tc.name      JsvmTest0815
     * @tc.desc      Create bigint int64, value 0 + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0815', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateBigintInt64Case03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0816
     * @tc.name      JsvmTest0816
     * @tc.desc      Create bigint int64, value 0 + result NULL
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0816', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateBigintInt64Case04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0817
     * @tc.name      JsvmTest0817
     * @tc.desc      Create bigint Uint64, value uint64_max + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0817', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateBigintUint64Case01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0818
     * @tc.name      JsvmTest0818
     * @tc.desc      Create bigint Uint64, value 0 + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0818', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateBigintUint64Case02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0819
     * @tc.name      JsvmTest0819
     * @tc.desc      Create bigint Uint64, value 0 + result NULL
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0819', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateBigintUint64Case03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0820
     * @tc.name      JsvmTest0820
     * @tc.desc      Create bigint Words, signBit 0 + wordCount 3 + words {uint64_max,0,1} + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0820', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateBigintWordsCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0821
     * @tc.name      JsvmTest0821
     * @tc.desc      Create bigint Words, signBit not 0 + wordCount 3 + words {uint64_max,0,1} + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0821', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateBigintWordsCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0822
     * @tc.name      JsvmTest0822
     * @tc.desc      Create bigint Words, signBit 0 + wordCount 0 + words {uint64_max,0,1} + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0822', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateBigintWordsCase03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0823
     * @tc.name      JsvmTest0823
     * @tc.desc      Create bigint Words, signBit 0 + wordCount 4 + words {uint64_max,0,1} + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0823', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateBigintWordsCase04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0824
     * @tc.name      JsvmTest0824
     * @tc.desc      Create bigint Words, signBit 0 + wordCount 3 + words {uint64_max,0,1} + result NULL
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0824', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateBigintWordsCase05()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0825
     * @tc.name      JsvmTest0825
     * @tc.desc      Get bigint Int64, "value int64_max+1" + result nogt null + lossless not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0825', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetValueBigintInt64Case01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0826
     * @tc.name      JsvmTest0826
     * @tc.desc      Get bigint Int64, "value int64_max" + result not null + lossless not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0826', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetValueBigintInt64Case02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0827
     * @tc.name      JsvmTest0827
     * @tc.desc      Get bigint Int64, "value int64_min" + result not null + lossless not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0827', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetValueBigintInt64Case03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0828
     * @tc.name      JsvmTest0828
     * @tc.desc      Get bigint Int64, "value int64_min-1" + result not null + lossless not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0828', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetValueBigintInt64Case04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0829
     * @tc.name      JsvmTest0829
     * @tc.desc      Get bigint Int64, "value int64_max" + result NULL + lossless not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0829', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetValueBigintInt64Case05()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0830
     * @tc.name      JsvmTest0830
     * @tc.desc      Get bigint Int64, "value int64_max" + result not null + lossless NULL
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0830', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetValueBigintInt64Case06()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0831
     * @tc.name      JsvmTest0831
     * @tc.desc      Get bigint Uint64, "value Uint64_max+1" + result not null + lossless not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0831', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetValueBigintUint64Case01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0832
     * @tc.name      JsvmTest0832
     * @tc.desc      Get bigint Uint64, "value Uint64_max" + result not null + lossless not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0832', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetValueBigintUint64Case02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0833
     * @tc.name      JsvmTest0833
     * @tc.desc      Get bigint Uint64, "value 0" + result not null + lossless not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0833', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetValueBigintUint64Case03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0834
     * @tc.name      JsvmTest0834
     * @tc.desc      Get bigint Uint64, "value -1" + result not null + lossless not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0834', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetValueBigintUint64Case04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0835
     * @tc.name      JsvmTest0835
     * @tc.desc      Get bigint Uint64, "value 0" + result NULL + lossless not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0835', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetValueBigintUint64Case05()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0836
     * @tc.name      JsvmTest0836
     * @tc.desc      Get bigint Uint64, "value 0" + result not null + lossless NULL
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0836', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetValueBigintUint64Case06()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0837
     * @tc.name      JsvmTest0837
     * @tc.desc      Get bigint Words, value is BigInt + signBit/wordCount/words not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0837', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetValueBigintWordsCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0838
     * @tc.name      JsvmTest0838
     * @tc.desc      Get bigint Words, value is BigInt + signBit NULL + wordCount not null + words not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0838', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetValueBigintWordsCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0839
     * @tc.name      JsvmTest0839
     * @tc.desc      Get bigint Words, value is BigInt + signBit not null + wordCount NULL + words not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0839', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetValueBigintWordsCase03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0840
     * @tc.name      JsvmTest0840
     * @tc.desc      Get bigint Words, value is BigInt + signBit not null + wordCount not null + words NULL
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0840', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetValueBigintWordsCase04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0841
     * @tc.name      JsvmTest0841
     * @tc.desc      Get bigint Words, value is BigInt + signBit NULL + wordCount not null + words NULL
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0841', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetValueBigintWordsCase05()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0842
     * @tc.name      JsvmTest0842
     * @tc.desc      APICombination:CreateBigintInt64 -> GetValueBigintInt64 Same as 
     * the input value of int64 -> GetValueBigintUint64-> GetValueBigintWords signBit 
     * Return the actual value,wordCount is 1, words Return the actual value
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0842', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateAndGetBigIntProgramCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0843
     * @tc.name      JsvmTest0843
     * @tc.desc      CreateBigintUint64 -> GetValueBigintUint64 -> GetValueBigintInt64 -> 
     * GetValueBigintWords -> signBit is 0,wordCount is 1, words return actual value
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0843', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateAndGetBigIntProgramCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0844
     * @tc.name      JsvmTest0844
     * @tc.desc      CreateBigintWords uint64 argc <-> Js Bigint -> GetValueBigintInt64,
     * compare values -> GetValueBigintUint64 -> GetValueBigintWords,
     * signBit actual symbol value,wordCount is argc length, words actual value.
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0844', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateAndGetBigIntProgramCase03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0845
     * @tc.name      JsvmTest0845
     * @tc.desc      New instance,Constructor is a constructor with input parameters，argc、argv normal，result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0845', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testNewInstanceCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0846
     * @tc.name      JsvmTest0846
     * @tc.desc      New instance,Constructor is not a constructor，argc\argv nullptr, result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0846', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testNewInstanceCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0847
     * @tc.name      JsvmTest0847
     * @tc.desc      Get new Target,cbinfo not null + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0847', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetNewTargetCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0848
     * @tc.name      JsvmTest0848
     * @tc.desc      Get new Target,cbinfo NULL , result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0848', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetNewTargetCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0849
     * @tc.name      JsvmTest0849
     * @tc.desc      Get new Target,cbinfo not null，result NULL
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0849', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetNewTargetCase03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0850
     * @tc.name      JsvmTest0850
     * @tc.desc      Define class,name not null + length <= utf8name + 
     * properties not null + propertyCount <= properties + result
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0850', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testDefineClassCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0851
     * @tc.name      JsvmTest0851
     * @tc.desc      Define class,name not null + length <= utf8name + 
     * properties NULL+ propertyCount 0 + result NULL
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0851', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testDefineClassCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0852
     * @tc.name      JsvmTest0852
     * @tc.desc      jsobject + nativeObject + finalizeCb + 
     * finalizeHint + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0852', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testWrapCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0853
     * @tc.name      JsvmTest0853
     * @tc.desc      jsobject|nativeObject not null + finalizeCb NULL
     * + finalizeHint NULL + result NULL
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0853', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testWrapCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0854
     * @tc.name      JsvmTest0854
     * @tc.desc      jsobject NULL + nativeObject not null +
     * finalizeCb NULL + finalizeHint NULL + result NULL
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0854', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testWrapCase03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0855
     * @tc.name      JsvmTest0855
     * @tc.desc      jsobject not null + nativeObject NULL +
     * finalizeCb NULL + finalizeHint NULL + result NULL
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0855', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testWrapCase04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0856
     * @tc.name      JsvmTest0856
     * @tc.desc      JsObject has been wrapped with other 
     * object instances + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0856', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testUnwrapCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0857
     * @tc.name      JsvmTest0857
     * @tc.desc      JsObject is not wrapped with other 
     * object instances + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0857', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testUnwrapCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0858
     * @tc.name      JsvmTest0858
     * @tc.desc      jsObject NULL + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0858', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testUnwrapCase03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0859
     * @tc.name      JsvmTest0859
     * @tc.desc      JsObject has been wrapped with other object instances + result NULL
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0859', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testUnwrapCase04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0860
     * @tc.name      JsvmTest0860
     * @tc.desc      JsObject has been wrapped with other object instances + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0860', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testRemoveWrapCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0861
     * @tc.name      JsvmTest0861
     * @tc.desc      JsObject is not wrapped with other object instances + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0861', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testRemoveWrapCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0862
     * @tc.name      JsvmTest0862
     * @tc.desc      jsObject NULL + result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0862', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testRemoveWrapCase03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0863
     * @tc.name      JsvmTest0863
     * @tc.desc      JsObject has been wrapped with other object instances + result NULL
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0863', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testRemoveWrapCase04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0864
     * @tc.name      JsvmTest0864
     * @tc.desc      defineClass -> NewInstance -> Wrap -> Unwrap ok -> RemoveWrap -> unwrap fail
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0864', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testClassOperationCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0865
     * @tc.name      JsvmTest0865
     * @tc.desc      recv nullptr,CreateFunction without input parameters, 
     * argc 0, argv nullptr, result not null，return 0, result is consistent
     * with the expected value of the function in CreateFunction
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0865', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCallFunction01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0866
     * @tc.name      JsvmTest0866
     * @tc.desc      recv undefined, CreateFunction without input parameters,
     * argc 0, argv nullptr, result not null,return 0, result is consistent
     * with the expected value of the function in CreateFunction
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0866', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCallFunction02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0867
     * @tc.name      JsvmTest0867
     * @tc.desc      recv undefined,CreateFunction without input parameters,
     * argc 0, argv nullptr, result not null,return 0, result is consistent
     * with the expected value of the function in CreateFunction
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0867', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCallFunction03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0868
     * @tc.name      JsvmTest0868
     * @tc.desc      recv global,CreateFunction without input parameters,
     * argc 0,argv nullptr,result not null,return 0,result is consistent
     * with the expected value of the function in CreateFunction
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0868', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCallFunction04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0869
     * @tc.name      JsvmTest0869
     * @tc.desc      recv global,CreateFunction interface that requires one
     * input parameter, argc 1,argv not null,len 1, result not null,
     * return 0,result is consistent with the expected value of the function in CreateFunction
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0869', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCallFunction05()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0870
     * @tc.name      JsvmTest0870
     * @tc.desc      recv global,CreateFunction interface that requires 
     * one input parameter, argc 2， argv len 2， result not null,return 0,
     * result is consistent with the expected value of the function in CreateFunction
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0870', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCallFunction06()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0871
     * @tc.name      JsvmTest0871
     * @tc.desc      recv global,CreateFunction interface that requires
     * two input parameters, argc 2,argv len 2,result not null
     * return 0,The result cannot be obtained normally
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0871', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCallFunction07()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0872
     * @tc.name      JsvmTest0872
     * @tc.desc      recv global,CreateFunction interface that requires
     * two input parameters, argc 1, argv len 1， result not null,
     * return 0,The result cannot be obtained normally
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0872', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCallFunction08()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0873
     * @tc.name      JsvmTest0873
     * @tc.desc      recv global,The function obtained from JS code that 
     * requires one input parameter,argc 1,argv len 1,result not null,
     * return 0,The result is consistent with the expected value of the function in CreateFunction
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0873', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCallFunction09()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0874
     * @tc.name      JsvmTest0874
     * @tc.desc      utf8name nullptr,length=0,set callback，data is null,result not null
     * return 0,func name is nullptr
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0874', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateFunction01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0875
     * @tc.name      JsvmTest0875
     * @tc.desc      utf8name not null,length>=utf8name,set callback,data null,result not null
     * return 0,funcname len = utf8name len
     * return 0,func name is nullptr
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0875', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateFunction02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0876
     * @tc.name      JsvmTest0876
     * @tc.desc      utf8name not null,length<utf8name,set callback,data null,result not null
     * return 0,funcname len = length
     * return 0,func name is nullptr
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0876', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateFunction03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0877
     * @tc.name      JsvmTest0877
     * @tc.desc      utf8name not null,length>=utf8name,set callback,data not null,
     * result not null, return 0
     * return 0,func name is nullptr
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0877', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateFunction04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0878
     * @tc.name      JsvmTest0878
     * @tc.desc      utf8name not null,length>=utf8name,set callback,data not null,
     * result nullptr, return not 0
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0878', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateFunction05()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0879
     * @tc.name      JsvmTest0879
     * @tc.desc      utf8name not null,length=utf8name,set callback is nullptr,data null,result not null
     * retrun 0,error
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0879', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateFunction06()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0880
     * @tc.name      JsvmTest0880
     * @tc.desc      cbinfo is callback cbinfo,argc NULL,argv NULL,thisArg null,data not null,
     * return 0, returnval is consistent with the data passed to 
     * the callback function in the CreateFunction interface
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0880', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetCbInfo01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0881
     * @tc.name      JsvmTest0881
     * @tc.desc      cbinfo is callback cbinfo, argc NULL，argv NULL， thisArg not null，data NULL
     * return 0, The objects mounted by thisArg and Callfunction are consistent
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0881', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetCbInfo02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0882
     * @tc.name      JsvmTest0882
     * @tc.desc      cbinfo is callback cbinfo,argc not null,argv not null,
     * argv len -> argc set len,thisArg,data NULL
     * return 0, argc elements the same as input，argv index>argc，result undefined
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0882', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetCbInfo03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0883
     * @tc.name      JsvmTest0883
     * @tc.desc      cbinfo is callback cbinfo,argc not null,argv not null,argv len > argc len,thisArg,data NULL
     * return 0, argv index>argc,undefined
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0883', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetCbInfo04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0884
     * @tc.name      JsvmTest0884
     * @tc.desc      cbinfo is callback cbinfo,argc not null,argv not null,argv len = argc,thisArg,
     * data NULL, return 0,argc = argv
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0884', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetCbInfo05()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0885
     * @tc.name      JsvmTest0885
     * @tc.desc      value is function, isFunction not null
     * return 0，isFunction true
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0885', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testIsFunction01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0886
     * @tc.name      JsvmTest0886
     * @tc.desc      value is not function, isFunction not null
     * return 0，isFunction false
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0886', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testIsFunction02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0887
     * @tc.name      JsvmTest0887
     * @tc.desc      value nullptr, isFunction not null
     * return not 0
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0887', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testIsFunction03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0888
     * @tc.name      JsvmTest0888
     * @tc.desc      value function, isFunction nullptr
     * return not 0
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0888', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testIsFunction04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0889
     * @tc.name      JsvmTest0889
     * @tc.desc      Open handle scope,env null,return not ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0889', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testOpenHandleScopeCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0890
     * @tc.name      JsvmTest0890
     * @tc.desc      Open handle scope,env not null,return ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0890', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testOpenHandleScopeCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0891
     * @tc.name      JsvmTest0891
     * @tc.desc      Open handle scope,env not null，call this interface twice，first ok, second ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0891', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testOpenHandleScopeCase03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0892
     * @tc.name      JsvmTest0892
     * @tc.desc      Open handle scope,open two scope，create jsvm value,
     * close one scope,expected inability to access jsvm value again
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0892', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testOpenHandleScopeCase04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0893
     * @tc.name      JsvmTest0893
     * @tc.desc      Close handle scope,scope nullptr,return not ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0893', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCloseHandleScopeCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0894
     * @tc.name      JsvmTest0894
     * @tc.desc      Close handle scope,Call this interface after opening,return ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0894', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCloseHandleScopeCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0895
     * @tc.name      JsvmTest0895
     * @tc.desc      Open and close handle scope,open twice,close twice,return ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0895', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testOpenAndCloseHandleScopeCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0896
     * @tc.name      JsvmTest0896
     * @tc.desc      Open and close handle scope,open,close twice,first ok, second not ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0896', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testOpenAndCloseHandleScopeCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0897
     * @tc.name      JsvmTest0897
     * @tc.desc      Open escapable handle scope,env null,return not ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0897', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testOpenEscapableHandleScopeCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0898
     * @tc.name      JsvmTest0898
     * @tc.desc      Open escapable handle scope,env not null,return ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0898', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testOpenEscapableHandleScopeCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0899
     * @tc.name      JsvmTest0899
     * @tc.desc      Open escapable handle scope,env not null,call twice func,first ok, second ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0899', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testOpenEscapableHandleScopeCase03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0900
     * @tc.name      JsvmTest0900
     * @tc.desc      Close escapable handle scope,scope nullptr,return not ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0900', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCloseEscapableHandleScopeCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0901
     * @tc.name      JsvmTest0901
     * @tc.desc      Close escapable handle scope,open,call func,return ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0901', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCloseEscapableHandleScopeCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0902
     * @tc.name      JsvmTest0902
     * @tc.desc      Close escapable handle scope,not open,call func,failed
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0902', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCloseEscapableHandleScopeCase03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0903
     * @tc.name      JsvmTest0903
     * @tc.desc      not call OpenEscapableHandleScope,call this func,return not ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0903', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testEscapeHandleCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0904
     * @tc.name      JsvmTest0904
     * @tc.desc      scope null,return not ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0904', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testEscapeHandleCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0905
     * @tc.name      JsvmTest0905
     * @tc.desc      Open escapable handle scope,open,return ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0905', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testEscapeHandleCase03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0906
     * @tc.name      JsvmTest0906
     * @tc.desc      escapee obj null,return not ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0906', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testEscapeHandleCase04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0907
     * @tc.name      JsvmTest0907
     * @tc.desc      escapee valid value，return ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0907', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testEscapeHandleCase05()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0908
     * @tc.name      JsvmTest0908
     * @tc.desc      EscapeHandle combination test:open twice,call close,return ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0908', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testOpenClosedEscapeCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0909
     * @tc.name      JsvmTest0909
     * @tc.desc      open,call close twice,first ok, second not ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0909', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testOpenClosedEscapeCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0910
     * @tc.name      JsvmTest0910
     * @tc.desc      value nullptr,call test func,return not ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0910', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateReferenceCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0911
     * @tc.name      JsvmTest0911
     * @tc.desc      jsvm value is normal data,initialRefcount 0,return ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0911', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateReferenceCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0912
     * @tc.name      JsvmTest0912
     * @tc.desc      jsvm value is normal data,initialRefcount 1,return ok,result not nullptr
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0912', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateReferenceCase03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0913
     * @tc.name      JsvmTest0913
     * @tc.desc      ref null,return not ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0913', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testDeleteReferenceCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0914
     * @tc.name      JsvmTest0914
     * @tc.desc      create ref,return ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0914', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testDeleteReferenceCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0915
     * @tc.name      JsvmTest0915
     * @tc.desc      ref nullptr, return not ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0915', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testReferenceRefCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0916
     * @tc.name      JsvmTest0916
     * @tc.desc      create ref,increase citation count，return ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0916', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testReferenceRefCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0917
     * @tc.name      JsvmTest0917
     * @tc.desc      repeated call,return ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0917', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testReferenceRefCase03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0918
     * @tc.name      JsvmTest0918
     * @tc.desc      ref nullptr,return not ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0918', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testReferenceUnrefCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0919
     * @tc.name      JsvmTest0919
     * @tc.desc      create ref,call this func,reduce the number of citations,return ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0919', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testReferenceUnrefCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0920
     * @tc.name      JsvmTest0920
     * @tc.desc      repeate call,call the test interface when the ref reference count is 0,return not ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0920', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testReferenceUnrefCase03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0921
     * @tc.name      JsvmTest0921
     * @tc.desc      ref nullptr,return ok,result nullptr
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0921', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetReferenceValueCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0922
     * @tc.name      JsvmTest0922
     * @tc.desc      create ref,return ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0922', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetReferenceValueCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0923
     * @tc.name      JsvmTest0923
     * @tc.desc      open handlescope -- create obj -- create reference 
     * -- increase citation count -- reduce citation count --get reference info
     * -- delete reference -- get reference, no result -- close handlescope
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0923', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testHandleAndRefCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0924
     * @tc.name      JsvmTest0924
     * @tc.desc      open escapehandlescope -- create obj -- escapehanle --
     * create reference -- increase citation count -- reduce
     * citation count -- get reference info -- get reference,
     * no result -- delete reference -- closed escapehandlescope
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0924', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testHandleAndRefCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0925
     * @tc.name      JsvmTest0925
     * @tc.desc      create multiple reference,delete multiple referencee,result normal
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0925', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testHandleAndRefCase03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0926
     * @tc.name      JsvmTest0926
     * @tc.desc      changeInBytes 0 +result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0926', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testAdjustExternalMemoryCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0927
     * @tc.name      JsvmTest0927
     * @tc.desc      changeInBytes 1024*1024 +result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0927', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testAdjustExternalMemoryCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0928
     * @tc.name      JsvmTest0928
     * @tc.desc      changeInBytes 1024*1024*1024 +result not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0928', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testAdjustExternalMemoryCase03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0929
     * @tc.name      JsvmTest0929
     * @tc.desc      changeInBytes 1024*1024 +result NULL
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0929', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testAdjustExternalMemoryCase04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0930
     * @tc.name      JsvmTest0930
     * @tc.desc      JSVM_MEMORY_PRESSURE_LEVEL_NONE    no pressure
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0930', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testMemoryPressureNotificationCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0931
     * @tc.name      JsvmTest0931
     * @tc.desc      JSVM_MEMORY_PRESSURE_LEVEL_MODERATE    moderate pressure
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0931', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testMemoryPressureNotificationCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0932
     * @tc.name      JsvmTest0932
     * @tc.desc      JSVM_MEMORY_PRESSURE_LEVEL_CRITICAL    critical pressure
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0932', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testMemoryPressureNotificationCase03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0933
     * @tc.name      JsvmTest0933
     * @tc.desc      AdjustExternalMemory allocation of 1GB memory -> 
     * MemoryPressureNotification(JSVM_MEMORY_PRESSURE_LEVEL_CRITICAL)
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0933', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testMemoryManagementuseCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0934
     * @tc.name      JsvmTest0934
     * @tc.desc      value null,return not ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0934', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testIsPromiseCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0935
     * @tc.name      JsvmTest0935
     * @tc.desc      input promise,return ok,result true
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0935', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testIsPromiseCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0936
     * @tc.name      JsvmTest0936
     * @tc.desc      input not promise,return ok,result false
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0936', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testIsPromiseCase03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0937
     * @tc.name      JsvmTest0937
     * @tc.desc      JS Create promise obj,return ok，result is true
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0937', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testIsPromiseCase04()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0938
     * @tc.name      JsvmTest0938
     * @tc.desc      call this func,return ok, deferred and promise not null
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0938', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreatePromiseCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0939
     * @tc.name      JsvmTest0939
     * @tc.desc      create deferred and promise,call this func,resolution true,return ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0939', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testResolveDeferredCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0940
     * @tc.name      JsvmTest0940
     * @tc.desc      create deferred and promise,call this func,resolution false, return ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0940', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testResolveDeferredCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0941
     * @tc.name      JsvmTest0941
     * @tc.desc      CreatePromise create deferred and promise,call this func,rejection true, return ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0941', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testRejectDeferredCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0942
     * @tc.name      JsvmTest0942
     * @tc.desc      CreatePromise create deferred and promise,
     * call this func, rejection false, return ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0942', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testRejectDeferredCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0943
     * @tc.name      JsvmTest0943
     * @tc.desc      create -- is -- resolve result normal
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0943', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCreateResolveDeferredCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0944
     * @tc.name      JsvmTest0944
     * @tc.desc      call this func,return jsvm ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0944', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetVersionCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0945
     * @tc.name      JsvmTest0945
     * @tc.desc      call func,return jsvm ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0945', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetVMInfoCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0946
     * @tc.name      JsvmTest0946
     * @tc.desc      getversion -- getvminfo ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0946', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetVMInfoCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0947
     * @tc.name      JsvmTest0947
     * @tc.desc      Call the interface to be tested,return ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0947', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testGetHeapStatisticsCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0948
     * @tc.name      JsvmTest0948
     * @tc.desc      Call the interface to be tested,return ok,result not nullptr
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0948', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testStartCpuProfilerCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0949
     * @tc.name      JsvmTest0949
     * @tc.desc      call OH_JSVM_StartCpuProfiler,Call the interface to be tested,return ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0949', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testStopCpuProfilerCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0950
     * @tc.name      JsvmTest0950
     * @tc.desc      stream nullptr,return not ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0950', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testTakeHeapSnapshotCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0951
     * @tc.name      JsvmTest0951
     * @tc.desc      host nullptr,return not ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0951', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testOpenInspectorCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0952
     * @tc.name      JsvmTest0952
     * @tc.desc      host valid value, port as a negative number, return not ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0952', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testOpenInspectorCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0953
     * @tc.name      JsvmTest0953
     * @tc.desc      host valid value,port 65536,return not ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0953', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testOpenInspectorCase03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0954
     * @tc.name      JsvmTest0954
     * @tc.desc      no open inspectors in the env,call test func,return not ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0954', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCloseInspectorCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0955
     * @tc.name      JsvmTest0955
     * @tc.desc      an open inspector in the env,call test func,return ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0955', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCloseInspectorCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0956
     * @tc.name      JsvmTest0956
     * @tc.desc      there are multiple open inspectors in the env,
     * call test func,return ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0956', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testCloseInspectorCase03()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0957
     * @tc.name      JsvmTest0957
     * @tc.desc      pid is a valid value,return ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0957', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testOpenInspectorWithNameCase01()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_JSVM_0958
     * @tc.name      JsvmTest0958
     * @tc.desc      pid is empty,return not ok
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('JsvmTest0958', 0, () => {
      let script: string = `
      let obj = { code: "code init" };
      testOpenInspectorWithNameCase02()
   `;
      expect(napitest.runJsVm(script)).assertEqual(true);
    });
  });
}
