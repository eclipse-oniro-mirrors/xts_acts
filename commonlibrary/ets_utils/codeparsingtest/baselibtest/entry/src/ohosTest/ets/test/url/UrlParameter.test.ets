/*
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import url from '@ohos.url';

let TAG = '';

export default function ActsUrlParameterTest() {
  describe('ActsUrlParameterTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_PARAMETER_0100
     * @tc.name: testUrlParameter001
     * @tc.desc: The test parameter is empty
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUrlParameter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUrlParameter001';
      try {
        let that = url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        expect(that.toString()).assertEqual('http://username:password@host:8080/directory/file?foo=1&bar=2');
      } catch (e) {
        console.error(TAG, `testUrlParameter001 failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_PARAMETER_0200
     * @tc.name: testUrlParameter002
     * @tc.desc: The test parameter is empty
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUrlParameter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUrlParameter002';
      try {
        let that = url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2#a|a');
        expect(that.toString()).assertEqual('http://username:password@host:8080/directory/file?foo=1&bar=2#a|a');
      } catch (e) {
        console.error(TAG, `testUsbGetDevices003 failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_PARAMETER_0300
     * @tc.name: testUrlParameter003
     * @tc.desc: The test parameter is empty
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUrlParameter003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUrlParameter003';
      try {
        let that = url.URL.parseURL('http://username:password@/directory/file?foo=1&bar=2');
        expect().assertFail();
      } catch (e) {
        console.error(TAG, `testUrlParameter003 failed, message is ${e.message}`);
        expect(e.message).assertContain('Invalid Url string');
      }
      done();
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_PARAMETER_0400
     * @tc.name: testUrlParameter004
     * @tc.desc: The test parameter is empty
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUrlParameter004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUrlParameter004';
      try {
        let that = url.URL.parseURL('http://username:password@ho@st:8080/directory/file?foo=1&bar=2');
        expect(that.toString()).assertEqual('http://username:password%40ho@st:8080/directory/file?foo=1&bar=2');
      } catch (e) {
        console.error(TAG, `testUrlParameter004 failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_PARAMETER_0500
     * @tc.name: testUrlParameter005
     * @tc.desc: The test parameter is empty
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUrlParameter005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUrlParameter005';
      try {
        let that = url.URL.parseURL('http://username:password@http:host:8080/directory/file?foo=1&bar=2');
        expect().assertFail();
      } catch (e) {
        console.error(TAG, `testUrlParameter005 failed, message is ${e.message}`);
        expect(e.message).assertContain('Invalid Url string');
      }
      done();
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_PARAMETER_0600
     * @tc.name: testUrlParameter006
     * @tc.desc: The test parameter is empty
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUrlParameter006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUrlParameter006';
      try {
        let that = url.URL.parseURL('http://username:password@:8080/directory/file?foo=1&bar=2');
        expect().assertFail();
      } catch (e) {
        console.error(TAG, `testUrlParameter006 failed, message is ${e.message}`);
        expect(e.message).assertContain('Invalid Url string');
      }
      done();
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_PARAMETER_0700
     * @tc.name: testUrlParameter007
     * @tc.desc: The test parameter is empty
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUrlParameter007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUrlParameter007';
      try {
        let that = url.URL.parseURL('http://username:password@a|a:8080/directory/file?foo=1&bar=2');
        expect().assertFail();
      } catch (e) {
        console.error(TAG, `testUrlParameter007 failed, message is ${e.message}`);
        expect(e.message).assertContain('Invalid Url string');
      }
      done();
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_PARAMETER_0800
     * @tc.name: testUrlParameter008
     * @tc.desc: The test parameter is empty
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUrlParameter008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUrlParameter008';
      try {
        let that = url.URL.parseURL('');
        expect().assertFail();
      } catch (e) {
        console.error(TAG, `testUrlParameter008 failed, message is ${e.message}`);
        expect(e.message).assertContain('Invalid Url string');
      }
      done();
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_PARAMETER_0900
     * @tc.name: testUrlParameter009
     * @tc.desc: The test parameter is empty
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUrlParameter009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUrlParameter009';
      try {
        let that = url.URL.parseURL('aa');
        expect().assertFail();
      } catch (e) {
        console.error(TAG, `testUrlParameter009 failed, message is ${e.message}`);
        expect(e.message).assertContain('Invalid Url string');
      }
      done();
    });
    /**

     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_PARAMETER_1000
     * @tc.name: testUrlParameter010
     * @tc.desc: The test parameter is empty
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUrlParameter010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUrlParameter010';
      try {
        let that = url.URL.parseURL('username:password@/directory/file?foo=1&bar=2');
        expect(that.toString()).assertEqual('username:password@/directory/file?foo=1&bar=2');
      } catch (e) {
        console.error(TAG, `testUrlParameter010 failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_PARAMETER_1100
     * @tc.name: testUrlParameter011
     * @tc.desc: The test parameter is empty
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUrlParameter011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUrlParameter011';
      try {
        let that = url.URL.parseURL('aa::a/username:password@host:8080/directory/file?foo=1&bar=2');
        expect(that.toString()).assertEqual('aa::a/username:password@host:8080/directory/file?foo=1&bar=2');
      } catch (e) {
        console.error(TAG, `testUrlParameter011 failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_PARAMETER_1200
     * @tc.name: testUrlParameter012
     * @tc.desc: The test parameter is empty
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUrlParameter012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUrlParameter012';
      try {
        let that = url.URL.parseURL('http://username:@host:8080/directory/file?foo=1&bar=2');
        expect(that.toString()).assertEqual('http://username@host:8080/directory/file?foo=1&bar=2');
      } catch (e) {
        console.error(TAG, `testUrlParameter012 failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_PARAMETER_1300
     * @tc.name: testUrlParameter013
     * @tc.desc: The test parameter is empty
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUrlParameter013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUrlParameter013';
      try {
        let that = url.URL.parseURL('http://username:a:a@1@host:8080/directory/file?foo=1&bar=2');
        expect(that.toString()).assertEqual('http://username:a:a%401@host:8080/directory/file?foo=1&bar=2');
      } catch (e) {
        console.error(TAG, `testUrlParameter013 failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_PARAMETER_1400
     * @tc.name: testUrlParameter014
     * @tc.desc: The test parameter is empty
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUrlParameter014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUrlParameter014';
      try {
        let that = url.URL.parseURL('http://username:password@host:8080?foo=1&bar=2#fragment');
        expect(that.toString()).assertEqual('http://username:password@host:8080/?foo=1&bar=2#fragment');
      } catch (e) {
        console.error(TAG, `testUrlParameter014 failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_PARAMETER_1500
     * @tc.name: testUrlParameter015
     * @tc.desc: The test parameter is empty
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUrlParameter015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUrlParameter015';
      try {
        let that = url.URL.parseURL('http://username:password@host:8080//~~/|file?foo=1&bar=2');
        expect(that.toString()).assertEqual('http://username:password@host:8080//~~/|file?foo=1&bar=2');
      } catch (e) {
        console.error(TAG, `testUrlParameter015 failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_PARAMETER_1600
     * @tc.name: testUrlParameter016
     * @tc.desc: The test parameter is empty
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUrlParameter016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUrlParameter016';
      try {
        let that = url.URL.parseURL('http://username:password@host:/directory/file?foo=1&bar=2');
        expect(that.toString()).assertEqual('http://username:password@host/directory/file?foo=1&bar=2');
      } catch (e) {
        console.error(TAG, `testUrlParameter016 failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_PARAMETER_1700
     * @tc.name: testUrlParameter017
     * @tc.desc: The test parameter is empty
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUrlParameter017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUrlParameter017';
      try {
        let that = url.URL.parseURL('http://username:password@host:aaa/directory/file?foo=1&bar=2');
        expect().assertFail();
      } catch (e) {
        console.error(TAG, `testUrlParameter017 failed, message is ${e.message}`);
        expect(e.message).assertContain('Invalid Url string');
      }
      done();
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_PARAMETER_1800
     * @tc.name: testUrlParameter018
     * @tc.desc: The test parameter is empty
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUrlParameter018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUrlParameter018';
      try {
        let that = url.URL.parseURL('//username:password@host:8080/directory/file?foo=1&bar=2#fragment');
        expect().assertFail();
      } catch (e) {
        console.error(TAG, `testUrlParameter018 failed, message is ${e.message}`);
        expect(e.message).assertContain('Invalid Url string');
      }
      done();
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_PARAMETER_1900
     * @tc.name: testUrlParameter019
     * @tc.desc: The test parameter is empty
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUrlParameter019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUrlParameter019';
      try {
        let that = url.URL.parseURL('aa://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
        expect(that.toString()).assertEqual('aa://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      } catch (e) {
        console.error(TAG, `testUrlParameter019 failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_PARAMETER_2000
     * @tc.name: testUrlParameter020
     * @tc.desc: The test parameter is empty
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUrlParameter020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUrlParameter020';
      try {
        let that = url.URL.parseURL('http://username:password@host:8080/directory/file#fragment');
        expect(that.toString()).assertEqual('http://username:password@host:8080/directory/file#fragment');
      } catch (e) {
        console.error(TAG, `testUrlParameter020 failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_PARAMETER_2100
     * @tc.name: testUrlParameter021
     * @tc.desc: The test parameter is empty
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUrlParameter021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUrlParameter021';
      try {
        let that = url.URL.parseURL('http://username:password@host:8080/directory/file?fo?o=1=3&bar=2#fragment');
        expect(that.toString())
          .assertEqual('http://username:password@host:8080/directory/file?fo?o=1=3&bar=2#fragment');
      } catch (e) {
        console.error(TAG, `testUrlParameter021 failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_PARAMETER_2200
     * @tc.name: testUrlParameter022
     * @tc.desc: The test parameter is empty
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUrlParameter022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUrlParameter022';
      try {
        let that = url.URL.parseURL('http://:password@host:8080/directory/file?foo=1&bar=2#fragment');
        expect(that.toString()).assertEqual('http://:password@host:8080/directory/file?foo=1&bar=2#fragment');
      } catch (e) {
        console.error(TAG, `testUrlParameter022 failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_PARAMETER_2300
     * @tc.name: testUrlParameter023
     * @tc.desc: The test parameter is empty
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUrlParameter023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUrlParameter023';
      try {
        let that = url.URL.parseURL('http://aa::password@host:8080/directory/file?foo=1&bar=2#fragment');
        expect(that.toString()).assertEqual('http://aa::password@host:8080/directory/file?foo=1&bar=2#fragment');
      } catch (e) {
        console.error(TAG, `testUrlParameter023 failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /*
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_PARAMETER_2400
    * @tc.name: testUrlParameter024
    * @tc.desc: The test parameter is empty
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testUrlParameter024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUrlParameter024';
      try {
        let that = url.URL.parseURL('http://username:password@host:8080/directory/file?foo#fragment');
        expect(that.toString()).assertEqual('http://username:password@host:8080/directory/file?foo#fragment');
      } catch (e) {
        console.error(TAG, `testUrlParameter024 failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /*
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_PARAMETER_2500
    * @tc.name: testUrlParameter025
    * @tc.desc: The test parameter is empty
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testUrlParameter025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      TAG = 'testUrlParameter025';
      try {
        let that = url.URL.parseURL('http://username:password@host:8080/directory/file?foo=!#fragment');
        expect(that.toString()).assertEqual('http://username:password@host:8080/directory/file?foo=!#fragment');
      } catch (e) {
        console.error(TAG, `testUrlParameter025 failed, message is ${e.message}`);
        expect().assertFail();
      }
      done();
    });
  })
}