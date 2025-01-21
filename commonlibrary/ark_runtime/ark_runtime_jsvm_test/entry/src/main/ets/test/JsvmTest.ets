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


  })
}

