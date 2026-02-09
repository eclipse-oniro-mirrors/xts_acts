/*
* Copyright (c) 2026 Huawei Technology Development Co., LTD.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { url } from '@kit.ArkTS';

let TAG = '';

export default function url2Test() {
  describe('url2Test', () => {
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
     * @tc.name   testURLSpecialChars001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_EDGE_SPECIAL_0100
     * @tc.desc   Test URL with special characters in path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSpecialChars001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLSpecialChars001';
      try {
        let result = url.URL.parseURL('http://host:8080//~~/|file?foo=1&bar=2');
        expect(result.toString()).assertEqual('http://host:8080//~~/|file?foo=1&bar=2');
      } catch (e) {
        console.error(TAG, `testURLSpecialChars001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLSpecialChars002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_EDGE_SPECIAL_0200
     * @tc.desc   Test URL with encoded characters in username.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSpecialChars002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLSpecialChars002';
      try {
        let result = url.URL.parseURL('http://username:a:a%401@host:8080/directory/file');
        expect(result.toString()).assertEqual('http://username:a:a%401@host:8080/directory/file');
      } catch (e) {
        console.error(TAG, `testURLSpecialChars002 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLSpecialChars003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_EDGE_SPECIAL_0300
     * @tc.desc   Test URL with @ symbol in hostname.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSpecialChars003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLSpecialChars003';
      try {
        let result = url.URL.parseURL('http://username:password@ho@st:8080/directory/file');
        expect(result.toString()).assertEqual('http://username:password%40ho@st:8080/directory/file');
      } catch (e) {
        console.error(TAG, `testURLSpecialChars003 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLQueryComplex001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_EDGE_QUERY_0100
     * @tc.desc   Test URL with complex query string containing ?.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLQueryComplex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLQueryComplex001';
      try {
        let result = url.URL.parseURL('http://host:8080/directory/file?fo?o=1=3&bar=2');
        expect(result.search).assertEqual('?fo?o=1=3&bar=2');
      } catch (e) {
        console.error(TAG, `testURLQueryComplex001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLQueryComplex002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_EDGE_QUERY_0200
     * @tc.desc   Test URL with query but no value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLQueryComplex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLQueryComplex002';
      try {
        let result = url.URL.parseURL('http://host:8080/directory/file?foo');
        expect(result.search).assertEqual('?foo');
      } catch (e) {
        console.error(TAG, `testURLQueryComplex002 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLFragmentComplex001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_EDGE_FRAGMENT_0100
     * @tc.desc   Test URL with complex fragment containing special chars.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLFragmentComplex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLFragmentComplex001';
      try {
        let result = url.URL.parseURL('http://host:8080/directory/file?foo=1#a|a');
        expect(result.hash).assertEqual('#a|a');
      } catch (e) {
        console.error(TAG, `testURLFragmentComplex001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLFragmentComplex002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_EDGE_FRAGMENT_0200
     * @tc.desc   Test URL with fragment containing ! character.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLFragmentComplex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLFragmentComplex002';
      try {
        let result = url.URL.parseURL('http://host:8080/directory/file?foo=!#fragment');
        expect(result.hash).assertEqual('#fragment');
      } catch (e) {
        console.error(TAG, `testURLFragmentComplex002 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLAuthentication001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_EDGE_AUTH_0100
     * @tc.desc   Test URL with empty password.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLAuthentication001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLAuthentication001';
      try {
        let result = url.URL.parseURL('http://username:@host:8080/directory/file');
        expect(result.username).assertEqual('username');
        expect(result.password).assertEqual('');
      } catch (e) {
        console.error(TAG, `testURLAuthentication001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLAuthentication002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_EDGE_AUTH_0200
     * @tc.desc   Test URL with no username but password.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLAuthentication002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLAuthentication002';
      try {
        let result = url.URL.parseURL('http://:password@host:8080/directory/file');
        expect(result.username).assertEqual('');
        expect(result.password).assertEqual('password');
      } catch (e) {
        console.error(TAG, `testURLAuthentication002 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLDefaultPorts001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_EDGE_PORT_0100
     * @tc.desc   Test URL with HTTP default port 80.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLDefaultPorts001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLDefaultPorts001';
      try {
        let result = url.URL.parseURL('http://example.com:80/path');
        expect(result.port).assertEqual('');
        expect(result.toString()).assertEqual('http://example.com/path');
      } catch (e) {
        console.error(TAG, `testURLDefaultPorts001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLDefaultPorts002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_EDGE_PORT_0200
     * @tc.desc   Test URL with HTTPS default port 443.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLDefaultPorts002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLDefaultPorts002';
      try {
        let result = url.URL.parseURL('https://example.com:443/path');
        expect(result.port).assertEqual('');
        expect(result.toString()).assertEqual('https://example.com/path');
      } catch (e) {
        console.error(TAG, `testURLDefaultPorts002 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLDefaultPorts003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_EDGE_PORT_0300
     * @tc.desc   Test URL with FTP default port 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLDefaultPorts003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLDefaultPorts003';
      try {
        let result = url.URL.parseURL('ftp://example.com:21/path');
        expect(result.port).assertEqual('');
        expect(result.toString()).assertEqual('ftp://example.com/path');
      } catch (e) {
        console.error(TAG, `testURLDefaultPorts003 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLDefaultPorts004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_EDGE_PORT_0400
     * @tc.desc   Test URL with WS default port 80.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLDefaultPorts004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLDefaultPorts004';
      try {
        let result = url.URL.parseURL('ws://example.com:80/path');
        expect(result.port).assertEqual('');
        expect(result.toString()).assertEqual('ws://example.com/path');
      } catch (e) {
        console.error(TAG, `testURLDefaultPorts004 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLDefaultPorts005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_EDGE_PORT_0500
     * @tc.desc   Test URL with WSS default port 443.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLDefaultPorts005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLDefaultPorts005';
      try {
        let result = url.URL.parseURL('wss://example.com:443/path');
        expect(result.port).assertEqual('');
        expect(result.toString()).assertEqual('wss://example.com/path');
      } catch (e) {
        console.error(TAG, `testURLDefaultPorts005 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLPathEmpty001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_EDGE_PATH_0100
     * @tc.desc   Test URL with empty path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLPathEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLPathEmpty001';
      try {
        let result = url.URL.parseURL('http://host:8080?foo=1&bar=2#fragment');
        expect(result.pathname).assertEqual('/');
      } catch (e) {
        console.error(TAG, `testURLPathEmpty001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLParamsEmpty001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_EDGE_PARAMS_0100
     * @tc.desc   Test URL with empty params.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLParamsEmpty001';
      try {
        let urlObject = url.URL.parseURL('http://host:8080/directory/file');
        let params = urlObject.params;
        expect(params.get('nonexistent')).assertUndefined();
        expect(params.has('nonexistent')).assertFalse();
      } catch (e) {
        console.error(TAG, `testURLParamsEmpty001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLParamsMultiple001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_EDGE_PARAMS_0200
     * @tc.desc   Test URLParams with multiple values for same key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsMultiple001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLParamsMultiple001';
      try {
        let urlObject = url.URL.parseURL('http://host:8080/?key=1&key=2&key=3');
        let params = urlObject.params;
        expect(params.get('key')).assertEqual('1');
        expect(params.getAll('key').length).assertEqual(3);
      } catch (e) {
        console.error(TAG, `testURLParamsMultiple001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testInvalidURLEmpty001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_ERROR_0100
     * @tc.desc   Test parseURL with empty string - should throw error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testInvalidURLEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      TAG = 'testInvalidURLEmpty001';
      try {
        url.URL.parseURL('');
        expect().assertFail();
      } catch (e) {
        console.error(TAG, `testInvalidURLEmpty001 failed, message is ${e.code}`);
        expect(e.code).assertEqual(10200002);
      }

    });

    /**
     * @tc.name   testInvalidURLRelative001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_ERROR_0200
     * @tc.desc   Test parseURL with relative URL without base - should throw error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testInvalidURLRelative001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      TAG = 'testInvalidURLRelative001';
      try {
        url.URL.parseURL('/relative/path');
        expect().assertFail();
      } catch (e) {
        console.error(TAG, `testInvalidURLRelative001 failed, message is ${e.code}`);
        expect(e.code).assertEqual(10200002);
      }

    });

    /**
     * @tc.name   testInvalidURLProtocol001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_ERROR_0300
     * @tc.desc   Test parseURL with invalid protocol - should throw error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testInvalidURLProtocol001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      TAG = 'testInvalidURLProtocol001';
      try {
        url.URL.parseURL('http://username:password@http:host:8080/directory/file');
        expect().assertFail();
      } catch (e) {
        console.error(TAG, `testInvalidURLProtocol001 failed, message is ${e.code}`);
        expect(e.code).assertEqual(10200002);
      }

    });

    /**
     * @tc.name   testInvalidURLHost001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_ERROR_0400
     * @tc.desc   Test parseURL with missing host - should throw error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testInvalidURLHost001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      TAG = 'testInvalidURLHost001';
      try {
        url.URL.parseURL('http://username:password@/directory/file');
        expect().assertFail();
      } catch (e) {
        console.error(TAG, `testInvalidURLHost001 failed, message is ${e.code}`);
        expect(e.code).assertEqual(10200002);
      }

    });

    /**
     * @tc.name   testInvalidURLHost002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_ERROR_0500
     * @tc.desc   Test parseURL with empty host - should throw error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testInvalidURLHost002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      TAG = 'testInvalidURLHost002';
      try {
        url.URL.parseURL('http://username:password@:8080/directory/file');
        expect().assertFail();
      } catch (e) {
        console.error(TAG, `testInvalidURLHost002 failed, message is ${e.code}`);
        expect(e.code).assertEqual(10200002);
      }

    });

    /**
     * @tc.name   testInvalidURLPort001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_ERROR_0600
     * @tc.desc   Test parseURL with invalid port - should throw error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testInvalidURLPort001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      TAG = 'testInvalidURLPort001';
      try {
        url.URL.parseURL('http://username:password@host:aaa/directory/file');
        expect().assertFail();
      } catch (e) {
        console.error(TAG, `testInvalidURLPort001 failed, message is ${e.code}`);
        expect(e.code).assertEqual(10200002);
      }

    });

    /**
     * @tc.name   testInvalidURLBase001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_ERROR_0700
     * @tc.desc   Test parseURL with invalid base URL - should throw error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testInvalidURLBase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      TAG = 'testInvalidURLBase001';
      try {
        url.URL.parseURL('/path/path1', '');
        expect().assertFail();
      } catch (e) {
        console.error(TAG, `testInvalidURLBase001 failed, message is ${e.code}`);
        expect(e.code).assertEqual(401);
      }

    });

    /**
     * @tc.name   testURLParamsGetNull001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_NULL_UNDEFINED_0100
     * @tc.desc   Test URLParams.get() returns null for non-existent key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsGetNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLParamsGetNull001';
      try {
        let params = new url.URLParams('key1=value1&key2=value2');
        let result = params.get('nonexistent');
        expect(result).assertUndefined();
      } catch (e) {
        console.error(TAG, `testURLParamsGetNull001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLParamsGetNull002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_NULL_UNDEFINED_0200
     * @tc.desc   Test URLParams.get() with empty params returns null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsGetNull002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLParamsGetNull002';
      try {
        let params = new url.URLParams('');
        let result = params.get('anykey');
        expect(result).assertUndefined();
      } catch (e) {
        console.error(TAG, `testURLParamsGetNull002 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLParamsGetAllNull001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_NULL_UNDEFINED_0300
     * @tc.desc   Test URLParams.getAll() returns empty array for non-existent key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsGetAllNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLParamsGetAllNull001';
      try {
        let params = new url.URLParams('key1=value1&key2=value2');
        let result = params.getAll('nonexistent');
        expect(result.length).assertEqual(0);
      } catch (e) {
        console.error(TAG, `testURLParamsGetAllNull001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLParamsHasNull001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_NULL_UNDEFINED_0400
     * @tc.desc   Test URLParams.has() returns false for non-existent key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsHasNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLParamsHasNull001';
      try {
        let params = new url.URLParams('key1=value1&key2=value2');
        let result = params.has('nonexistent');
        expect(result).assertFalse();
      } catch (e) {
        console.error(TAG, `testURLParamsHasNull001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLParamsDeleteNull001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_NULL_UNDEFINED_0500
     * @tc.desc   Test URLParams.delete() with non-existent key should not throw.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsDeleteNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLParamsDeleteNull001';
      try {
        let params = new url.URLParams('key1=value1&key2=value2');
        params.delete('nonexistent');
        // Should not throw, params should remain unchanged
        let result = params.get('key1');
        expect(result).assertEqual('value1');
      } catch (e) {
        console.error(TAG, `testURLParamsDeleteNull001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLPropertyEmptyString001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_NULL_UNDEFINED_0600
     * @tc.desc   Test URL properties with empty values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLPropertyEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLPropertyEmptyString001';
      try {
        let urlObject = url.URL.parseURL('http://example.com/');
        expect(urlObject.hash).assertEqual('');
        expect(urlObject.search).assertEqual('');
        expect(urlObject.username).assertEqual('');
        expect(urlObject.password).assertEqual('');
      } catch (e) {
        console.error(TAG, `testURLPropertyEmptyString001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLParamsConstructorEmpty001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_NULL_UNDEFINED_0800
     * @tc.desc   Test URLParams constructor with empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsConstructorEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLParamsConstructorEmpty001';
      try {
        let params = new url.URLParams('');
        expect(params.toString()).assertEqual('');
      } catch (e) {
        console.error(TAG, `testURLParamsConstructorEmpty001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLParamsAppendNull001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_NULL_UNDEFINED_0900
     * @tc.desc   Test URLParams.append() with empty string values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsAppendNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLParamsAppendNull001';
      try {
        let params = new url.URLParams('');
        params.append('key', '');
        expect(params.get('key')).assertEqual('');
      } catch (e) {
        console.error(TAG, `testURLParamsAppendNull001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLParamsSetNull001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_NULL_UNDEFINED_1000
     * @tc.desc   Test URLParams.set() with empty string value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsSetNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLParamsSetNull001';
      try {
        let params = new url.URLParams('key=value1');
        params.set('key', '');
        expect(params.get('key')).assertEqual('');
      } catch (e) {
        console.error(TAG, `testURLParamsSetNull001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLHashEmpty001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_NULL_UNDEFINED_1100
     * @tc.desc   Test URL hash property with empty and set to empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLHashEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLHashEmpty001';
      try {
        let urlObject = url.URL.parseURL('http://example.com/path');
        expect(urlObject.hash).assertEqual('');
        urlObject.hash = '';
        expect(urlObject.hash).assertEqual('');
      } catch (e) {
        console.error(TAG, `testURLHashEmpty001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLSearchEmpty001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_NULL_UNDEFINED_1200
     * @tc.desc   Test URL search property with empty and set to empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSearchEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLSearchEmpty001';
      try {
        let urlObject = url.URL.parseURL('http://example.com/path');
        expect(urlObject.search).assertEqual('');
        urlObject.search = '';
        expect(urlObject.search).assertEqual('');
      } catch (e) {
        console.error(TAG, `testURLSearchEmpty001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLParamsEntriesEmpty001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_NULL_UNDEFINED_1300
     * @tc.desc   Test URLParams.entries() with empty params.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsEntriesEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLParamsEntriesEmpty001';
      try {
        let params = new url.URLParams('');
        let entries: string[] = [];
        for (let pair of params.entries()) {
          entries.push(pair[0], pair[1]);
        }
        expect(entries.length).assertEqual(0);
      } catch (e) {
        console.error(TAG, `testURLParamsEntriesEmpty001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLParamsKeysEmpty001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_NULL_UNDEFINED_1400
     * @tc.desc   Test URLParams.keys() with empty params.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsKeysEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLParamsKeysEmpty001';
      try {
        let params = new url.URLParams('');
        let keys: string[] = [];
        for (let key of params.keys()) {
          keys.push(key);
        }
        expect(keys.length).assertEqual(0);
      } catch (e) {
        console.error(TAG, `testURLParamsKeysEmpty001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLParamsValuesEmpty001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_NULL_UNDEFINED_1500
     * @tc.desc   Test URLParams.values() with empty params.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsValuesEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLParamsValuesEmpty001';
      try {
        let params = new url.URLParams('');
        let values: string[] = [];
        for (let value of params.values()) {
          values.push(value);
        }
        expect(values.length).assertEqual(0);
      } catch (e) {
        console.error(TAG, `testURLParamsValuesEmpty001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLParamsToStringEmpty001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_NULL_UNDEFINED_1600
     * @tc.desc   Test URLParams.toString() with empty params.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsToStringEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLParamsToStringEmpty001';
      try {
        let params = new url.URLParams('');
        let result = params.toString();
        expect(result).assertEqual('');
      } catch (e) {
        console.error(TAG, `testURLParamsToStringEmpty001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLParamsForEachEmpty001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_NULL_UNDEFINED_1700
     * @tc.desc   Test URLParams.forEach() with empty params.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsForEachEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLParamsForEachEmpty001';
      try {
        let params = new url.URLParams('');
        let callCount = 0;
        params.forEach((value: string, key: string) => {
          callCount++;
        });
        expect(callCount).assertEqual(0);
      } catch (e) {
        console.error(TAG, `testURLParamsForEachEmpty001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });


    /**
     * @tc.name   testURLParamsAppendEmptyKey001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_NULL_UNDEFINED_1900
     * @tc.desc   Test URLParams.append() with empty key name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsAppendEmptyKey001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLParamsAppendEmptyKey001';
      try {
        let params = new url.URLParams('');
        params.append('', 'value');
        let result = params.get('');
        expect(result).assertEqual('value');
      } catch (e) {
        console.error(TAG, `testURLParamsAppendEmptyKey001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testURLParamsSetEmptyKey001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_NULL_UNDEFINED_2000
     * @tc.desc   Test URLParams.set() with empty key name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsSetEmptyKey001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testURLParamsSetEmptyKey001';
      try {
        let params = new url.URLParams('');
        params.set('', 'value');
        let result = params.get('');
        expect(result).assertEqual('value');
      } catch (e) {
        console.error(TAG, `testURLParamsSetEmptyKey001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testParseURLWithBase001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_CONSTRUCTOR_BASE_0100
     * @tc.desc   Test parseURL with relative URL and base string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseURLWithBase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testParseURLWithBase001';
      try {
        let result = url.URL.parseURL('/path/path1', 'https://www.exampleUrl/fr-FR/toot');
        expect(result.toString()).assertEqual('https://www.exampleurl/path/path1');
      } catch (e) {
        console.error(TAG, `testParseURLWithBase001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testParseURLWithBase002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_CONSTRUCTOR_BASE_0200
     * @tc.desc   Test parseURL with relative path and base URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseURLWithBase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testParseURLWithBase002';
      try {
        let baseUrl = url.URL.parseURL('https://www.example.com/test/test1/test3');
        let result = url.URL.parseURL('path2/path3', baseUrl);
        expect(result.toString()).assertEqual('https://www.example.com/test/test1/path2/path3');
      } catch (e) {
        console.error(TAG, `testParseURLWithBase002 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testParseURLWithBase003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_CONSTRUCTOR_BASE_0300
     * @tc.desc   Test parseURL with absolute path and base URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseURLWithBase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testParseURLWithBase003';
      try {
        let baseUrl = url.URL.parseURL('https://username:password@host:8080/test/test1/test3');
        let result = url.URL.parseURL('/path1/path2', baseUrl);
        expect(result.toString()).assertEqual('https://username:password@host:8080/path1/path2');
      } catch (e) {
        console.error(TAG, `testParseURLWithBase003 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testParseURLWithBase004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_CONSTRUCTOR_BASE_0400
     * @tc.desc   Test parseURL with absolute URL ignores base.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseURLWithBase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testParseURLWithBase004';
      try {
        let baseUrl = url.URL.parseURL('https://www.example.com/base/path');
        let result = url.URL.parseURL('https://www.example.com', baseUrl);
        expect(result.toString()).assertEqual('https://www.example.com/');
      } catch (e) {
        console.error(TAG, `testParseURLWithBase004 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testParseURLWithBase005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_CONSTRUCTOR_BASE_0500
     * @tc.desc   Test parseURL with different protocols (https).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseURLWithBase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testParseURLWithBase005';
      try {
        let result = url.URL.parseURL('https://example.com/path');
        expect(result.protocol).assertEqual('https:');
        expect(result.hostname).assertEqual('example.com');
        expect(result.pathname).assertEqual('/path');
      } catch (e) {
        console.error(TAG, `testParseURLWithBase005 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testParseURLWithBase006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_CONSTRUCTOR_BASE_0600
     * @tc.desc   Test parseURL with ftp protocol.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseURLWithBase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testParseURLWithBase006';
      try {
        let result = url.URL.parseURL('ftp://example.com/file.txt');
        expect(result.protocol).assertEqual('ftp:');
        expect(result.hostname).assertEqual('example.com');
        expect(result.pathname).assertEqual('/file.txt');
      } catch (e) {
        console.error(TAG, `testParseURLWithBase006 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testParseURLWithBase007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_CONSTRUCTOR_BASE_0700
     * @tc.desc   Test parseURL with file protocol.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseURLWithBase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testParseURLWithBase007';
      try {
        let result = url.URL.parseURL('file:///path/to/file');
        expect(result.protocol).assertEqual('file:');
        expect(result.pathname).assertEqual('/path/to/file');
      } catch (e) {
        console.error(TAG, `testParseURLWithBase007 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testParseURLWithBase008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_CONSTRUCTOR_BASE_0800
     * @tc.desc   Test parseURL with ws protocol.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseURLWithBase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testParseURLWithBase008';
      try {
        let result = url.URL.parseURL('ws://example.com/socket');
        expect(result.protocol).assertEqual('ws:');
        expect(result.hostname).assertEqual('example.com');
        expect(result.pathname).assertEqual('/socket');
      } catch (e) {
        console.error(TAG, `testParseURLWithBase008 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testParseURLWithBase009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_CONSTRUCTOR_BASE_0900
     * @tc.desc   Test parseURL with relative URL containing query and fragment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseURLWithBase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testParseURLWithBase009';
      try {
        let result = url.URL.parseURL('?query=value#fragment', 'https://example.com/path');
        expect(result.pathname).assertEqual('/path/');
        expect(result.search).assertEqual('?query=value');
        expect(result.hash).assertEqual('#fragment');
      } catch (e) {
        console.error(TAG, `testParseURLWithBase009 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testParseURLWithBase010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_CONSTRUCTOR_BASE_1000
     * @tc.desc   Test parseURL with complex relative path resolution.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseURLWithBase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testParseURLWithBase010';
      try {
        let result = url.URL.parseURL('../parent/path', 'https://example.com/a/b/c/d');
        expect(result.pathname).assertEqual('/a/b/parent/path');
      } catch (e) {
        console.error(TAG, `testParseURLWithBase010 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });
    /**
     * @tc.name   testUrlParameter001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL2_PARAMETER_0100
     * @tc.desc   The test parameter is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlParameter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlParameter001';
      try {
        let that = url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        expect(that.toString()).assertEqual('http://username:password@host:8080/directory/file?foo=1&bar=2');
      } catch (e) {
        console.error(TAG, `testUrlParameter001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });
    /**
     * @tc.name   testUrlParameter002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL2_PARAMETER_0200
     * @tc.desc   The test parameter is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlParameter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlParameter002';
      try {
        let that = url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2#a|a');
        expect(that.toString()).assertEqual('http://username:password@host:8080/directory/file?foo=1&bar=2#a|a');
      } catch (e) {
        console.error(TAG, `testUsbGetDevices003 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });
    /**
     * @tc.name   testUrlParameter003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL2_PARAMETER_0300
     * @tc.desc   The test parameter is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlParameter003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlParameter003';
      try {
        let that = url.URL.parseURL('http://username:password@/directory/file?foo=1&bar=2');
        expect().assertFail();
      } catch (e) {
        console.error(TAG, `testUrlParameter003 failed, message is ${e.code}`);
        expect(e.code).assertEqual(10200002);
      }

    });
    /**
     * @tc.name   testUrlParameter004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL2_PARAMETER_0400
     * @tc.desc   The test parameter is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlParameter004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlParameter004';
      try {
        let that = url.URL.parseURL('http://username:password@ho@st:8080/directory/file?foo=1&bar=2');
        expect(that.toString()).assertEqual('http://username:password%40ho@st:8080/directory/file?foo=1&bar=2');
      } catch (e) {
        console.error(TAG, `testUrlParameter004 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });
    /**
     * @tc.name   testUrlParameter005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL2_PARAMETER_0500
     * @tc.desc   The test parameter is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlParameter005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlParameter005';
      try {
        let that = url.URL.parseURL('http://username:password@http:host:8080/directory/file?foo=1&bar=2');
        expect().assertFail();
      } catch (e) {
        console.error(TAG, `testUrlParameter005 failed, message is ${e.code}`);
        expect(e.code).assertEqual(10200002);
      }

    });
    /**
     * @tc.name   testUrlParameter006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL2_PARAMETER_0600
     * @tc.desc   The test parameter is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlParameter006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlParameter006';
      try {
        let that = url.URL.parseURL('http://username:password@:8080/directory/file?foo=1&bar=2');
        expect().assertFail();
      } catch (e) {
        console.error(TAG, `testUrlParameter006 failed, message is ${e.code}`);
        expect(e.code).assertEqual(10200002);
      }

    });
    /**
     * @tc.name   testUrlParameter007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL2_PARAMETER_0700
     * @tc.desc   The test parameter is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlParameter007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlParameter007';
      try {
        let that = url.URL.parseURL('http://username:password@a|a:8080/directory/file?foo=1&bar=2');
        expect().assertFail();
      } catch (e) {
        console.error(TAG, `testUrlParameter007 failed, message is ${e.code}`);
        expect(e.code).assertEqual(10200002);
      }

    });
    /**
     * @tc.name   testUrlParameter008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL2_PARAMETER_0800
     * @tc.desc   The test parameter is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlParameter008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlParameter008';
      try {
        let that = url.URL.parseURL('');
        expect().assertFail();
      } catch (e) {
        console.error(TAG, `testUrlParameter008 failed, message is ${e.code}`);
        expect(e.code).assertEqual(10200002);
      }

    });
    /**
     * @tc.name   testUrlParameter009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL2_PARAMETER_0900
     * @tc.desc   The test parameter is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlParameter009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlParameter009';
      try {
        let that = url.URL.parseURL('aa');
        expect().assertFail();
      } catch (e) {
        console.error(TAG, `testUrlParameter009 failed, message is ${e.code}`);
        expect(e.code).assertEqual(10200002);
      }
    });
    /**
     * @tc.name   testUrlParameter010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL2_PARAMETER_1000
     * @tc.desc   The test parameter is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlParameter010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlParameter010';
      try {
        let that = url.URL.parseURL('username:password@/directory/file?foo=1&bar=2');
        expect(that.toString()).assertEqual('username:password@/directory/file?foo=1&bar=2');
      } catch (e) {
        console.error(TAG, `testUrlParameter010 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });
    /**
     * @tc.name   testUrlParameter011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL2_PARAMETER_1100
     * @tc.desc   The test parameter is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlParameter011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlParameter011';
      try {
        let that = url.URL.parseURL('aa::a/username:password@host:8080/directory/file?foo=1&bar=2');
        expect(that.toString()).assertEqual('aa::a/username:password@host:8080/directory/file?foo=1&bar=2');
      } catch (e) {
        console.error(TAG, `testUrlParameter011 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });
    /**
     * @tc.name   testUrlParameter012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL2_PARAMETER_1200
     * @tc.desc   The test parameter is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlParameter012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlParameter012';
      try {
        let that = url.URL.parseURL('http://username:@host:8080/directory/file?foo=1&bar=2');
        expect(that.toString()).assertEqual('http://username@host:8080/directory/file?foo=1&bar=2');
      } catch (e) {
        console.error(TAG, `testUrlParameter012 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });
    /**
     * @tc.name   testUrlParameter013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL2_PARAMETER_1300
     * @tc.desc   The test parameter is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlParameter013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlParameter013';
      try {
        let that = url.URL.parseURL('http://username:a:a@1@host:8080/directory/file?foo=1&bar=2');
        expect(that.toString()).assertEqual('http://username:a:a%401@host:8080/directory/file?foo=1&bar=2');
      } catch (e) {
        console.error(TAG, `testUrlParameter013 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });
    /**
     * @tc.name   testUrlParameter014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL2_PARAMETER_1400
     * @tc.desc   The test parameter is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlParameter014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlParameter014';
      try {
        let that = url.URL.parseURL('http://username:password@host:8080?foo=1&bar=2#fragment');
        expect(that.toString()).assertEqual('http://username:password@host:8080/?foo=1&bar=2#fragment');
      } catch (e) {
        console.error(TAG, `testUrlParameter014 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });
    /**
     * @tc.name   testUrlParameter015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL2_PARAMETER_1500
     * @tc.desc   The test parameter is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlParameter015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlParameter015';
      try {
        let that = url.URL.parseURL('http://username:password@host:8080//~~/|file?foo=1&bar=2');
        expect(that.toString()).assertEqual('http://username:password@host:8080//~~/|file?foo=1&bar=2');
      } catch (e) {
        console.error(TAG, `testUrlParameter015 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });
    /**
     * @tc.name   testUrlParameter016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL2_PARAMETER_1600
     * @tc.desc   The test parameter is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlParameter016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlParameter016';
      try {
        let that = url.URL.parseURL('http://username:password@host:/directory/file?foo=1&bar=2');
        expect(that.toString()).assertEqual('http://username:password@host/directory/file?foo=1&bar=2');
      } catch (e) {
        console.error(TAG, `testUrlParameter016 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });
    /**
     * @tc.name   testUrlParameter017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL2_PARAMETER_1700
     * @tc.desc   The test parameter is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlParameter017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlParameter017';
      try {
        let that = url.URL.parseURL('http://username:password@host:aaa/directory/file?foo=1&bar=2');
        expect().assertFail();
      } catch (e) {
        console.error(TAG, `testUrlParameter017 failed, message is ${e.code}`);
        expect(e.code).assertEqual(10200002);
      }

    });
    /**
     * @tc.name   testUrlParameter018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL2_PARAMETER_1800
     * @tc.desc   The test parameter is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlParameter018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlParameter018';
      try {
        let that = url.URL.parseURL('//username:password@host:8080/directory/file?foo=1&bar=2#fragment');
        expect().assertFail();
      } catch (e) {
        console.error(TAG, `testUrlParameter018 failed, message is ${e.code}`);
        expect(e.code).assertEqual(10200002);
      }

    });
    /**
     * @tc.name   testUrlParameter019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL2_PARAMETER_1900
     * @tc.desc   The test parameter is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlParameter019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlParameter019';
      try {
        let that = url.URL.parseURL('aa://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
        expect(that.toString()).assertEqual('aa://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      } catch (e) {
        console.error(TAG, `testUrlParameter019 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });
    /**
     * @tc.name   testUrlParameter020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL2_PARAMETER_2000
     * @tc.desc   The test parameter is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlParameter020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlParameter020';
      try {
        let that = url.URL.parseURL('http://username:password@host:8080/directory/file#fragment');
        expect(that.toString()).assertEqual('http://username:password@host:8080/directory/file#fragment');
      } catch (e) {
        console.error(TAG, `testUrlParameter020 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });
    /**
     * @tc.name   testUrlParameter021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL2_PARAMETER_2100
     * @tc.desc   The test parameter is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlParameter021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlParameter021';
      try {
        let that = url.URL.parseURL('http://username:password@host:8080/directory/file?fo?o=1=3&bar=2#fragment');
        expect(that.toString())
          .assertEqual('http://username:password@host:8080/directory/file?fo?o=1=3&bar=2#fragment');
      } catch (e) {
        console.error(TAG, `testUrlParameter021 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });
    /**
     * @tc.name   testUrlParameter022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL2_PARAMETER_2200
     * @tc.desc   The test parameter is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlParameter022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlParameter022';
      try {
        let that = url.URL.parseURL('http://:password@host:8080/directory/file?foo=1&bar=2#fragment');
        expect(that.toString()).assertEqual('http://:password@host:8080/directory/file?foo=1&bar=2#fragment');
      } catch (e) {
        console.error(TAG, `testUrlParameter022 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });
    /**
     * @tc.name   testUrlParameter023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL2_PARAMETER_2300
     * @tc.desc   The test parameter is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlParameter023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlParameter023';
      try {
        let that = url.URL.parseURL('http://aa::password@host:8080/directory/file?foo=1&bar=2#fragment');
        expect(that.toString()).assertEqual('http://aa::password@host:8080/directory/file?foo=1&bar=2#fragment');
      } catch (e) {
        console.error(TAG, `testUrlParameter023 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });
    /**
     * @tc.name   testUrlParameter024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL2_PARAMETER_2400
     * @tc.desc   The test parameter is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlParameter024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlParameter024';
      try {
        let that = url.URL.parseURL('http://username:password@host:8080/directory/file?foo#fragment');
        expect(that.toString()).assertEqual('http://username:password@host:8080/directory/file?foo#fragment');
      } catch (e) {
        console.error(TAG, `testUrlParameter024 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });
    /**
     * @tc.name   testUrlParameter025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL1_PARAMETER_2500
     * @tc.desc   The test parameter is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlParameter025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlParameter025';
      try {
        let that = url.URL.parseURL('http://username:password@host:8080/directory/file?foo=!#fragment');
        expect(that.toString()).assertEqual('http://username:password@host:8080/directory/file?foo=!#fragment');
      } catch (e) {
        console.error(TAG, `testUrlParameter025 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });
    /**
     * @tc.name   testUrlHash001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_PROPERTY_HASH_0100
     * @tc.desc   Test URL hash property getter and setter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHash001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlHash001';
      try {
        let urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
        expect(urlObject.hash).assertEqual('#fragment');
        urlObject.hash = '#newFragment';
        expect(urlObject.hash).assertEqual('#newFragment');
      } catch (e) {
        console.error(TAG, `testUrlHash001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testUrlHash002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_PROPERTY_HASH_0200
     * @tc.desc   Test URL hash property with empty value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHash002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlHash002';
      try {
        let urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        expect(urlObject.hash).assertEqual('');
        urlObject.hash = '#test';
        expect(urlObject.hash).assertEqual('#test');
      } catch (e) {
        console.error(TAG, `testUrlHash002 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testUrlHost001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_PROPERTY_HOST_0100
     * @tc.desc   Test URL host property getter and setter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHost001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlHost001';
      try {
        let urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        expect(urlObject.host).assertEqual('host:8080');
        urlObject.host = 'newhost:9090';
        expect(urlObject.host).assertEqual('newhost:9090');
      } catch (e) {
        console.error(TAG, `testUrlHost001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testUrlHostname001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_PROPERTY_HOSTNAME_0100
     * @tc.desc   Test URL hostname property getter and setter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHostname001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlHostname001';
      try {
        let urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        expect(urlObject.hostname).assertEqual('host');
        urlObject.hostname = 'newhost';
        expect(urlObject.hostname).assertEqual('newhost');
      } catch (e) {
        console.error(TAG, `testUrlHostname001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testUrlHref001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_PROPERTY_HREF_0100
     * @tc.desc   Test URL href property getter and setter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHref001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlHref001';
      try {
        let urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        expect(urlObject.href).assertEqual('http://username:password@host:8080/directory/file?foo=1&bar=2');
        urlObject.href = 'http://example.com/test';
        expect(urlObject.href).assertEqual('http://example.com/test');
      } catch (e) {
        console.error(TAG, `testUrlHref001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testUrlOrigin001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_PROPERTY_ORIGIN_0100
     * @tc.desc   Test URL origin property getter (readonly).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlOrigin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlOrigin001';
      try {
        let urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        expect(urlObject.origin).assertEqual('http://host:8080');
      } catch (e) {
        console.error(TAG, `testUrlOrigin001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testUrlPassword001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_PROPERTY_PASSWORD_0100
     * @tc.desc   Test URL password property getter and setter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlPassword001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlPassword001';
      try {
        let urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        expect(urlObject.password).assertEqual('password');
        urlObject.password = 'newpass';
        expect(urlObject.password).assertEqual('newpass');
      } catch (e) {
        console.error(TAG, `testUrlPassword001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testUrlPathname001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_PROPERTY_PATHNAME_0100
     * @tc.desc   Test URL pathname property getter and setter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlPathname001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlPathname001';
      try {
        let urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        expect(urlObject.pathname).assertEqual('/directory/file');
        urlObject.pathname = '/new/path';
        expect(urlObject.pathname).assertEqual('/new/path');
      } catch (e) {
        console.error(TAG, `testUrlPathname001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testUrlPort001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_PROPERTY_PORT_0100
     * @tc.desc   Test URL port property getter and setter with non-default port.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlPort001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlPort001';
      try {
        let urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        expect(urlObject.port).assertEqual('8080');
        urlObject.port = '9090';
        expect(urlObject.port).assertEqual('9090');
      } catch (e) {
        console.error(TAG, `testUrlPort001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testUrlPort002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_PROPERTY_PORT_0200
     * @tc.desc   Test URL port property with default port (should be empty).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlPort002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlPort002';
      try {
        let urlObject = url.URL.parseURL('http://testhost:80/directory/file?foo=1');
        expect(urlObject.port).assertEqual('');
        expect(urlObject.toString()).assertEqual('http://testhost/directory/file?foo=1');
      } catch (e) {
        console.error(TAG, `testUrlPort002 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testUrlProtocol001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_PROPERTY_PROTOCOL_0100
     * @tc.desc   Test URL protocol property getter and setter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlProtocol001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlProtocol001';
      try {
        let urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        expect(urlObject.protocol).assertEqual('http:');
        urlObject.protocol = 'https:';
        expect(urlObject.protocol).assertEqual('https:');
      } catch (e) {
        console.error(TAG, `testUrlProtocol001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testUrlSearch001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_PROPERTY_SEARCH_0100
     * @tc.desc   Test URL search property getter and setter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSearch001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlSearch001';
      try {
        let urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        expect(urlObject.search).assertEqual('?foo=1&bar=2');
        urlObject.search = '?new=param';
        expect(urlObject.search).assertEqual('?new=param');
      } catch (e) {
        console.error(TAG, `testUrlSearch001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testUrlParams001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_PROPERTY_PARAMS_0100
     * @tc.desc   Test URL params property getter (readonly URLParams object).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlParams001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlParams001';
      try {
        let urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        expect(urlObject.params.get('foo')).assertEqual('1');
        expect(urlObject.params.get('bar')).assertEqual('2');
      } catch (e) {
        console.error(TAG, `testUrlParams001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testUrlUsername001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_PROPERTY_USERNAME_0100
     * @tc.desc   Test URL username property getter and setter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlUsername001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlUsername001';
      try {
        let urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        expect(urlObject.username).assertEqual('username');
        urlObject.username = 'newuser';
        expect(urlObject.username).assertEqual('newuser');
      } catch (e) {
        console.error(TAG, `testUrlUsername001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testUrlToJSON001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_TOJSON_0100
     * @tc.desc   Test URL.toJSON() method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlToJSON001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlToJSON001';
      try {
        let urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
        let result = urlObject.toJSON();
        expect(result).assertEqual('http://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      } catch (e) {
        console.error(TAG, `testUrlToJSON001 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testUrlToString002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_TOSTRING_0100
     * @tc.desc   Test URL.toString() method with complex URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      TAG = 'testUrlToString002';
      try {
        let urlObject = url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da');
        let result = urlObject.toString();
        expect(result).assertEqual('https://username:password@host:8080/directory/file?query=pppppp#qwer=da');
      } catch (e) {
        console.error(TAG, `testUrlToString002 failed, message is ${e.code}`);
        expect().assertFail();
      }

    });

  })

}