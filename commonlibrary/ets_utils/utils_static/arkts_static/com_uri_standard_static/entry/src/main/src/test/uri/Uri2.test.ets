/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import uri from '@ohos.uri';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import Utils from '../Util.test';

let str2 =
  '!!%22%22%23%23%24%24%25%25\'\'(())**%2B%2B%2C%2C--..%2F%2F%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F%40%40%5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D~~';
let str2Decode = '!!""##$$%%\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
let str3 =
  '%21%21%22%22%23%23%24%24%25%25%26%26%27%27%28%28%2A%2A%2B%2B%2C%2C%2D%2D%2E%2E%2F%2F%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F%40%40%5B%5B%5C%5C%5D%5D%5E%5E%5F%5F%60%60%7B%7B%7C%7C%7D%7D%7E%7E';
let str3Decode = '!!""##$$%%&&\'\'((**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';

export default function uriTest2() {
  describe('uriTest2', (): void => {
    afterEach(() => {
      await Utils.msSleep(20);
    })

    /**
     * @tc.name   testEqualsToSpecialSymbolsHostStr2vsStr30001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_EQUALSTOSPECIALSYMBOLSHOSTSTR2VSSTR3_0100
     * @tc.desc   Testing if URIs with different special symbols in the host part are not considered equal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEqualsToSpecialSymbolsHostStr2vsStr30001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEqualsToSpecialSymbolsHostStr2vsStr30001';
      try {
        const uri1 = 'https://username:password@host' + str2 + ':8080/directory/file/?key1=value1#qwer=da';
        const uri2 = 'https://username:password@host' + str3 + ':8080/directory/file/?key1=value1#qwer=da';
        let uriInstance1 = new uri.URI(uri1);
        let uriInstance2 = new uri.URI(uri2);
        let result1 = uriInstance1.equalsTo(uriInstance2);
        expect(String(result1)).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckIsAbsoluteSpecialSymbolsHostStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKISABSOLUTESPECIALSYMBOLSHOSTSTR2_0100
     * @tc.desc   Testing if a URI with special characters in the host part is correctly recognized as absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckIsAbsoluteSpecialSymbolsHostStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckIsAbsoluteSpecialSymbolsHostStr20001';
      try {
        const uri1 = 'https://username:password@host' + str2 + ':8080/directory/file/?key1=value1#qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkIsAbsolute();
        expect(String(result1)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckIsAbsoluteSpecialSymbolsHostStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKISABSOLUTESPECIALSYMBOLSHOSTSTR3_0200
     * @tc.desc   Testing if a URI with encoded special characters in the host part is correctly recognized as absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckIsAbsoluteSpecialSymbolsHostStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckIsAbsoluteSpecialSymbolsHostStr30002';
      try {
        const uri1 = 'https://username:password@host' + str3 + ':8080/directory/file/?key1=value1#qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkIsAbsolute();
        expect(String(result1)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckIsAbsoluteSpecialSymbolsFragmentStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKISABSOLUTESPECIALSYMBOLSFRAGMENTSTR2_0100
     * @tc.desc   Testing if a URI with special characters in the fragment part is correctly recognized as absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckIsAbsoluteSpecialSymbolsFragmentStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckIsAbsoluteSpecialSymbolsFragmentStr20001';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file?key1=value1#qwer=da' + str2;
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkIsAbsolute();
        expect(String(result1)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckIsAbsoluteSpecialSymbolsFragmentStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKISABSOLUTESPECIALSYMBOLSFRAGMENTSTR3_0200
     * @tc.desc   Testing if a URI with encoded special characters in the fragment part is correctly recognized as absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckIsAbsoluteSpecialSymbolsFragmentStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckIsAbsoluteSpecialSymbolsFragmentStr30002';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file?key1=value1#qwer=da' + str3;
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkIsAbsolute();
        expect(String(result1)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckIsAbsoluteSpecialSymbolsPathStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKISABSOLUTESPECIALSYMBOLSPATHSTR2_0100
     * @tc.desc   Testing if a URI with special characters in the path part is correctly recognized as absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckIsAbsoluteSpecialSymbolsPathStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckIsAbsoluteSpecialSymbolsPathStr20001';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file' + str2 + '?key1=value1#qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkIsAbsolute();
        expect(String(result1)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckIsAbsoluteSpecialSymbolsPathStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKISABSOLUTESPECIALSYMBOLSPATHSTR3_0200
     * @tc.desc   Testing if a URI with encoded special characters in the path part is correctly recognized as absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckIsAbsoluteSpecialSymbolsPathStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckIsAbsoluteSpecialSymbolsPathStr30002';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file' + str3 + '?key1=value1#qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkIsAbsolute();
        expect(String(result1)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   testCheckIsAbsoluteSpecialSymbolsSchemeStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKISABSOLUTESPECIALSYMBOLSSCHEMESTR2_0100
     * @tc.desc   Testing the URI creation with special characters in the scheme which should produce a BusinessError.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckIsAbsoluteSpecialSymbolsSchemeStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        const uri1 = `https${str2}://username:password@host:8080/directory/file/?key1=value1#qwer=da`;
        new uri.URI(uri1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        expect(String(err.code)).assertEqual('10200002');
      }
    });

    /**
     * @tc.name   testCheckIsAbsoluteSpecialSymbolsScheme0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKISABSOLUTESPECIALSYMBOLSSCHEME_0200
     * @tc.desc   Testing the URI creation with valid special characters in the scheme to check if it is considered absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckIsAbsoluteSpecialSymbolsScheme0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'checkIsAbsoluteSpecialSymbolsScheme0002';
      try {
        const uri1 = 'https-+.test0002://username:password@host:8080/directory/file/?key1=value1#qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkIsAbsolute();
        expect(String(result1)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckIsAbsoluteSpecialSymbolsPortStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKISABSOLUTESPECIALSYMBOLSPORTSTR2_0100
     * @tc.desc   Testing the URI creation with special characters in the port which should produce a BusinessError.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckIsAbsoluteSpecialSymbolsPortStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckIsAbsoluteSpecialSymbolsPortStr20001';
      try {
        const uri1 = `https://username:password@host:8080${str2}/directory/file/?key1=value1#qwer=da`;
        new uri.URI(uri1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(String(err.code)).assertEqual('10200002');
      }
    });

    /**
     * @tc.name   testCheckIsAbsoluteSpecialSymbolsPort0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKISABSOLUTESPECIALSYMBOLSPORT_0200
     * @tc.desc   Testing the URI creation with only number in the port to check if it is considered absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckIsAbsoluteSpecialSymbolsPort0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'checkIsAbsoluteSpecialSymbolsPort0002';
      try {
        const uri1 = 'https://username:password@host:80802347891243/directory/file/?key1=value1#qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkIsAbsolute();
        expect(String(result1)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckIsAbsoluteSpecialSymbolsUsernameStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKISABSOLUTESPECIALSYMBOLSUSERNAMESTR2_0100
     * @tc.desc   Testing if a URI with special characters in the username part is recognized as absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckIsAbsoluteSpecialSymbolsUsernameStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckIsAbsoluteSpecialSymbolsUsernameStr20001';
      try {
        const uri1 = 'https://username' + str2 + ':password@host:8080/directory/file?key1=value1#qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkIsAbsolute();
        expect(String(result1)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckIsAbsoluteSpecialSymbolsUsernameStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKISABSOLUTESPECIALSYMBOLSUSERNAMESTR3_0200
     * @tc.desc   Testing if a URI with special characters in the username part is correctly recognized as absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckIsAbsoluteSpecialSymbolsUsernameStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckIsAbsoluteSpecialSymbolsUsernameStr30002';
      try {
        const uri1 = 'https://username' + str3 + ':password@host:8080/directory/file?key1=value1#qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkIsAbsolute();
        expect(String(result1)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckIsAbsoluteSpecialSymbolsPasswordStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKISABSOLUTESPECIALSYMBOLSPASSWORDSTR2_0100
     * @tc.desc   Testing if a URI with special characters in the password part is correctly recognized as absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckIsAbsoluteSpecialSymbolsPasswordStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckIsAbsoluteSpecialSymbolsPasswordStr20001';
      try {
        const uri1 = 'https://username:password' + str2 + '@host:8080/directory/file?key1=value1#qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkIsAbsolute();
        expect(String(result1)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckIsAbsoluteSpecialSymbolsPasswordStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKISABSOLUTESPECIALSYMBOLSPASSWORDSTR3_0200
     * @tc.desc   Testing if a URI with encoded special characters in the password part is correctly recognized as absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckIsAbsoluteSpecialSymbolsPasswordStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckIsAbsoluteSpecialSymbolsPasswordStr30002';
      try {
        const uri1 = 'https://username:password' + str3 + '@host:8080/directory/file?key1=value1#qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkIsAbsolute();
        expect(String(result1)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckIsAbsoluteSpecialSymbolsKeyStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKISABSOLUTESPECIALSYMBOLSKEYSTR2_0100
     * @tc.desc   Testing if a URI with special characters in the key part is recognized as absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckIsAbsoluteSpecialSymbolsKeyStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckIsAbsoluteSpecialSymbolsKeyStr20001';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file?key1' + str2 + '=value1#qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkIsAbsolute();
        expect(String(result1)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckIsAbsoluteSpecialSymbolsKeyStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKISABSOLUTESPECIALSYMBOLSKEYSTR3_0200
     * @tc.desc   Testing if a URI with special characters in the query key part is correctly recognized as absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckIsAbsoluteSpecialSymbolsKeyStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckIsAbsoluteSpecialSymbolsKeyStr30002';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file?key1' + str3 + '=value1#qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkIsAbsolute();
        expect(String(result1)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckIsAbsoluteSpecialSymbolsValueStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKISABSOLUTESPECIALSYMBOLSVALUESTR2_0100
     * @tc.desc   Testing if a URI with special characters in the query value part is correctly recognized as absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckIsAbsoluteSpecialSymbolsValueStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckIsAbsoluteSpecialSymbolsValueStr20001';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file?key1=value1' + str2 + '#qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkIsAbsolute();
        expect(String(result1)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckIsAbsoluteSpecialSymbolsValueStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKISABSOLUTESPECIALSYMBOLSVALUESTR3_0200
     * @tc.desc   Testing if a URI with encoded special characters in the query value part is correctly recognized as absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckIsAbsoluteSpecialSymbolsValueStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckIsAbsoluteSpecialSymbolsValueStr30002';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file?key1=value1' + str3 + '#qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkIsAbsolute();
        expect(String(result1)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckIsAbsoluteSpecialSymbolsNotScheme0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKISABSOLUTESPECIALSYMBOLSNOTSCHEME_0100
     * @tc.desc   Testing if a URI without a scheme is correctly not recognized as absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckIsAbsoluteSpecialSymbolsNotScheme0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckIsAbsoluteSpecialSymbolsNotScheme0001';
      try {
        const uri1 = 'username:password@host:8080/directory/file?foo=1&bar=2#fragment';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkIsAbsolute();
        expect(String(result1)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckIsAbsoluteSpecialSymbolsNotUserInfo0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKISABSOLUTESPECIALSYMBOLSNOTUSERINFO_0100
     * @tc.desc   Testing if a URI without user info is correctly not recognized as absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckIsAbsoluteSpecialSymbolsNotUserInfo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckIsAbsoluteSpecialSymbolsNotUserInfo0001';
      try {
        const uri1 = 'host:8080/directory/file?foo=1&bar=2#fragment';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkIsAbsolute();
        expect(String(result1)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   testCheckIsAbsoluteSpecialSymbolsNotHostPort0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKISABSOLUTESPECIALSYMBOLSNOTHOSTPORT_0100
     * @tc.desc   Testing if a URI without a host and port is correctly not recognized as absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckIsAbsoluteSpecialSymbolsNotHostPort0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckIsAbsoluteSpecialSymbolsNotHostPort0001';
      try {
        const uri1 = 'directory/file?foo=1&bar=2#fragment';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkIsAbsolute();
        expect(String(result1)).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckIsAbsoluteFalseSpecialSymbolsKeyStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKISABSOLUTEFALSESPECIALSYMBOLSKEYSTR2_0100
     * @tc.desc   Testing if a URI with special characters in the key part is correctly not recognized as absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckIsAbsoluteFalseSpecialSymbolsKeyStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckIsAbsoluteFalseSpecialSymbolsKeyStr20001';
      try {
        const uri1 = 'directory/file?key1=value1' + str2 + 'pppppp&qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkIsAbsolute();
        expect(String(result1)).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckIsAbsoluteFalseSpecialSymbolsKeyStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKISABSOLUTEFALSESPECIALSYMBOLSKEYSTR3_0200
     * @tc.desc   Testing if a URI with special characters in the key part is correctly not recognized as absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckIsAbsoluteFalseSpecialSymbolsKeyStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckIsAbsoluteFalseSpecialSymbolsKeyStr30002';
      try {
        const uri1 = 'directory/file?key1=value1' + str3 + 'pppppp&qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkIsAbsolute();
        expect(String(result1)).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckIsAbsoluteFalseSpecialSymbolsValueStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKISABSOLUTEFALSESPECIALSYMBOLSVALUESTR2_0100
     * @tc.desc   Testing if a URI with special characters in the value part is correctly not recognized as absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckIsAbsoluteFalseSpecialSymbolsValueStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = 'testCheckIsAbsoluteFalseSpecialSymbolsValueStr20001';
        try {
          const uri1 = 'directory/file?key1=value1' + str2 + '#qwer=da';
          let uriInstance = new uri.URI(uri1);
          let result1 = uriInstance.checkIsAbsolute();
          expect(String(result1)).assertEqual('false');
        } catch (err) {
        err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.code}`);
          expect(false).assertFail();
        }
      });

    /**
     * @tc.name   testCheckIsAbsoluteFalseSpecialSymbolsValueStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKISABSOLUTEFALSESPECIALSYMBOLSVALUESTR3_0200
     * @tc.desc   Testing if a URI with special characters in the value part is correctly not recognized as absolute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckIsAbsoluteFalseSpecialSymbolsValueStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = 'testCheckIsAbsoluteFalseSpecialSymbolsValueStr30002';
        try {
          const uri1 = 'directory/file?key1=value1' + str3 + '#qwer=da';
          let uriInstance = new uri.URI(uri1);
          let result1 = uriInstance.checkIsAbsolute();
          expect(String(result1)).assertEqual('false');
        } catch (err) {
        err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.code}`);
          expect(false).assertFail();
        }
      });

    /**
     * @tc.name   testNormalizeSpecialSymbolsValueStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NORMALIZESPECIALSYMBOLSVALUESTR2_0100
     * @tc.desc   Testing if a URI with special characters in the value part is correctly normalized.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNormalizeSpecialSymbolsValueStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testNormalizeSpecialSymbolsValueStr20001';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file?key1=value1' + str2 + '#qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.normalize().query;
        expect(result1).assertEqual('key1=value1' + str2Decode);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testNormalizeSpecialSymbolsValueStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NORMALIZESPECIALSYMBOLSVALUESTR3_0200
     * @tc.desc   Testing if a URI with special characters in the value part is correctly normalized.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNormalizeSpecialSymbolsValueStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testNormalizeSpecialSymbolsValueStr30002';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file?key1=value1' + str3 + '#qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.normalize().query;
        expect(result1).assertEqual('key1=value1' + str3Decode);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testNormalizeSpecialSymbolsKeyStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NORMALIZESPECIALSYMBOLSKEYSTR2_0100
     * @tc.desc   Testing if a URI with special characters in the key part is correctly normalized.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNormalizeSpecialSymbolsKeyStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testNormalizeSpecialSymbolsKeyStr20001';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file?key1' + str2 + '=value1#qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.normalize().query;
        expect(result1).assertEqual('key1' + str2Decode + '=value1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testNormalizeSpecialSymbolsKeyStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_NORMALIZESPECIALSYMBOLSKEYSTR3_0200
     * @tc.desc   Testing if a URI with special characters in the key part is correctly normalized.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNormalizeSpecialSymbolsKeyStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testNormalizeSpecialSymbolsKeyStr30002';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file?key1' + str3 + '=value1#qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.normalize().query;
        expect(result1).assertEqual('key1' + str3Decode + '=value1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToStringSpecialSymbolsKeyStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRINGSPECIALSYMBOLSKEYSTR2_0100
     * @tc.desc   Testing if a URI with special characters in the key part is correctly represented as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToStringSpecialSymbolsKeyStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testToStringSpecialSymbolsKeyStr20001';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file?key1' + str2 + '=pppppp&qwer=da';
        let result = new uri.URI(uri1);
        let result1 = result.toString();
        expect(result1).assertEqual(uri1);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToStringSpecialSymbolsKeyStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRINGSPECIALSYMBOLSKEYSTR3_0200
     * @tc.desc   Testing if a URI with special characters in the key part is correctly represented as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToStringSpecialSymbolsKeyStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testToStringSpecialSymbolsKeyStr30002';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file?key1' + str3 + '=pppppp&qwer=da';
        let result = new uri.URI(uri1);
        let result1 = result.toString();
        expect(result1).assertEqual(uri1);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToStringSpecialSymbolsValueStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRINGSPECIALSYMBOLSVALUESTR2_0100
     * @tc.desc   Testing if a URI with special characters in the value part is correctly represented as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToStringSpecialSymbolsValueStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testToStringSpecialSymbolsValueStr20001';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file?key1=value1' + str2 + '#qwer=da';
        let result = new uri.URI(uri1);
        let result1 = result.toString();
        expect(result1).assertEqual(uri1);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToStringSpecialSymbolsValueStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRINGSPECIALSYMBOLSVALUESTR3_0200
     * @tc.desc   Testing if a URI with special characters in the value part is correctly represented as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToStringSpecialSymbolsValueStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testToStringSpecialSymbolsValueStr30002';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file?key1=value1' + str3 + '#qwer=da';
        let result = new uri.URI(uri1);
        let result1 = result.toString();
        expect(result1).assertEqual(uri1);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToStringSpecialSymbolsHostStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRINGSPECIALSYMBOLSHOSTSTR2_0100
     * @tc.desc   Testing if a URI with special characters in the host part is correctly represented as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToStringSpecialSymbolsHostStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testToStringSpecialSymbolsHostStr20001';
      try {
        const uri1 = 'https://username:password@host' + str2 + ':8080/directory/file?key1=value1#qwer=da';
        let result = new uri.URI(uri1);
        let result1 = result.toString();
        expect(result1).assertEqual(uri1);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToStringSpecialSymbolsHostStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRINGSPECIALSYMBOLSHOSTSTR3_0200
     * @tc.desc   Testing if a URI with special characters in the host part is correctly represented as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToStringSpecialSymbolsHostStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testToStringSpecialSymbolsHostStr30002';
      try {
        const uri1 = 'https://username:password@host' + str3 + ':8080/directory/file?key1=value1#qwer=da';
        let result = new uri.URI(uri1);
        let result1 = result.toString();
        expect(result1).assertEqual(uri1);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToStringSpecialSymbolsFragmentStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRINGSPECIALSYMBOLSFRAGMENTSTR2_0100
     * @tc.desc   Testing if a URI with special characters in the fragment part is correctly represented as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToStringSpecialSymbolsFragmentStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testToStringSpecialSymbolsFragmentStr20001';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file?key1=value1#qwer=da' + str2;
        let result = new uri.URI(uri1);
        let result1 = result.toString();
        expect(result1).assertEqual(uri1);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToStringSpecialSymbolsFragmentStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRINGSPECIALSYMBOLSFRAGMENTSTR3_0200
     * @tc.desc   Testing if a URI with special characters in the fragment part is correctly represented as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToStringSpecialSymbolsFragmentStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testToStringSpecialSymbolsFragmentStr30002';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file?key1=value1#qwer=da' + str3;
        let result = new uri.URI(uri1);
        let result1 = result.toString();
        expect(result1).assertEqual(uri1);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToStringSpecialSymbolsPathStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRINGSPECIALSYMBOLSPATHSTR2_0100
     * @tc.desc   Testing if a URI with special characters in the path part is correctly represented as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToStringSpecialSymbolsPathStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testToStringSpecialSymbolsPathStr20001';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file/' + str2 + '?key1=value1#qwer=da';
        let result = new uri.URI(uri1);
        let result1 = result.toString();
        expect(result1).assertEqual(uri1);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToStringSpecialSymbolsPathStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRINGSPECIALSYMBOLSPATHSTR3_0200
     * @tc.desc   Testing if a URI with special characters in the path part is correctly represented as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToStringSpecialSymbolsPathStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testToStringSpecialSymbolsPathStr30002';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file/' + str3 + '?key1=value1#qwer=da';
        let result = new uri.URI(uri1);
        let result1 = result.toString();
        expect(result1).assertEqual(uri1);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToStringSpecialSymbolsSchemeStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRINGSPECIALSYMBOLSSCHEMESTR2_0100
     * @tc.desc   Testing if creating a URI with invalid special characters in the scheme part throws a specific error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToStringSpecialSymbolsSchemeStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testToStringSpecialSymbolsSchemeStr20001';
      try {
        const uri1 = 'https' + str2 + '://username:password@host:8080/directory/file?key1=value1#qwer=da';
        new uri.URI(uri1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(String(err.code)).assertEqual('10200002')
      }
    });

    /**
     * @tc.name   testToStringSpecialSymbolsScheme0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRINGSPECIALSYMBOLSSCHEME_0200
     * @tc.desc   Testing if a URI with valid special characters in the scheme part is correctly represented as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToStringSpecialSymbolsScheme0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testToStringSpecialSymbolsScheme0002';
      try {
        const uri1 = 'https-+.test0002://username:password@host:8080/directory/file?key1=value1#qwer=da';
        let result = new uri.URI(uri1);
        let result1 = result.toString();
        expect(result1).assertEqual(uri1);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToStringSpecialSymbolsUsernameStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRINGSPECIALSYMBOLSUSERNAMESTR2_0100
     * @tc.desc   Testing if a URI with special characters in the username part is correctly represented as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToStringSpecialSymbolsUsernameStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testToStringSpecialSymbolsUsernameStr20001';
      try {
        const uri1 = 'https://username' + str2 + ':password@host:8080/directory/file?key1=value1#qwer=da';
        let result = new uri.URI(uri1);
        let result1 = result.toString();
        expect(result1).assertEqual(uri1);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToStringSpecialSymbolsUsernameStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRINGSPECIALSYMBOLSUSERNAMESTR3_0200
     * @tc.desc   Testing if a URI with special characters in the username part is correctly represented as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToStringSpecialSymbolsUsernameStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testToStringSpecialSymbolsUsernameStr30002';
      try {
        const uri1 = 'https://username' + str3 + ':password@host:8080/directory/file?key1=value1#qwer=da';
        let result = new uri.URI(uri1);
        let result1 = result.toString();
        expect(result1).assertEqual(uri1);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToStringSpecialSymbolsPasswordStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRINGSPECIALSYMBOLSPASSWORDSTR2_0100
     * @tc.desc   Testing if a URI with special characters in the password part is correctly represented as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToStringSpecialSymbolsPasswordStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testToStringSpecialSymbolsPasswordStr20001';
      try {
        const uri1 = 'https://username:password' + str2 + '@host:8080/directory/file?key1=value1#qwer=da';
        let result = new uri.URI(uri1);
        let result1 = result.toString();
        expect(result1).assertEqual(uri1);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToStringSpecialSymbolsPasswordStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRINGSPECIALSYMBOLSPASSWORDSTR3_0200
     * @tc.desc   Testing if a URI with special characters in the password part is correctly represented as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToStringSpecialSymbolsPasswordStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testToStringSpecialSymbolsPasswordStr30002';
      try {
        const uri1 = 'https://username:password' + str3 + '@host:8080/directory/file?key1=value1#qwer=da';
        let result = new uri.URI(uri1);
        let result1 = result.toString();
        expect(result1).assertEqual(uri1);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testToStringSpecialSymbolsPortStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRINGSPECIALSYMBOLSPORTSTR2_0100
     * @tc.desc   Testing if creating a URI with invalid special characters in the port part throws a specific error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToStringSpecialSymbolsPortStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testToStringSpecialSymbolsPortStr20001';
      try {
        const uri1 = 'https://username:password@host:8080' + str2 + '/directory/file?key1=value1#qwer=da';
        new uri.URI(uri1);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(String(err.code)).assertEqual('10200002');
      }
    });

    /**
     * @tc.name   testToStringSpecialSymbolsPort0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_TOSTRINGSPECIALSYMBOLSPORT_0200
     * @tc.desc   Testing if a URI with valid special characters in the port part is correctly represented as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testToStringSpecialSymbolsPort0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testToStringSpecialSymbolsPort0002';
      try {
        const uri1 = 'https://username:password@host:80804326489671/directory/file?key1=value1#qwer=da';
        let result = new uri.URI(uri1);
        let result1 = result.toString();
        expect(result1).assertEqual(uri1);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckRelativeSpecialSymbolsKeyStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKRELATIVESPECIALSYMBOLSKEYSTR2_0100
     * @tc.desc   Testing if a URI with special characters in the query key part is correctly identified as relative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckRelativeSpecialSymbolsKeyStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckRelativeSpecialSymbolsKeyStr20001';
      try {
        const uri1 = '/directory/file?key1' + str2 + '=value1#qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkRelative();
        expect(String(result1)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckRelativeSpecialSymbolsKeyStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKRELATIVESPECIALSYMBOLSKEYSTR3_0200
     * @tc.desc   Testing if a URI with special characters in the query key part is correctly identified as relative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckRelativeSpecialSymbolsKeyStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckRelativeSpecialSymbolsKeyStr30002';
      try {
        const uri1 = '/directory/file?key1' + str3 + '=value1#qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkRelative();
        expect(String(result1)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckRelativeSpecialSymbolsValuesStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKRELATIVESPECIALSYMBOLSVALUESSTR2_0100
     * @tc.desc   Testing if a URI with special characters in the query value part is correctly identified as relative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckRelativeSpecialSymbolsValuesStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckRelativeSpecialSymbolsValuesStr20001';
      try {
        const uri1 = '/directory/file?key1=value1' + str2 + '#qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkRelative();
        expect(String(result1)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckRelativeSpecialSymbolsValuesStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKRELATIVESPECIALSYMBOLSVALUESSTR3_0200
     * @tc.desc   Testing if a URI with special characters in the query value part is correctly identified as relative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckRelativeSpecialSymbolsValuesStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckRelativeSpecialSymbolsValuesStr30002';
      try {
        const uri1 = '/directory/file?key1=value1' + str3 + '#qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkRelative();
        expect(String(result1)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckRelativeFalseSpecialSymbolsKeyStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKRELATIVEFALSESPECIALSYMBOLSKEYSTR2_0100
     * @tc.desc   Testing if a URI with special characters in the query key part is correctly identified as not relative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckRelativeFalseSpecialSymbolsKeyStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckRelativeFalseSpecialSymbolsKeyStr20001';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file?key1' + str2 + '=value1#qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkRelative();
        expect(String(result1)).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckRelativeFalseSpecialSymbolsKeyStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKRELATIVEFALSESPECIALSYMBOLSKEYSTR3_0200
     * @tc.desc   Testing if a URI with special characters in the query key part is correctly identified as not relative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckRelativeFalseSpecialSymbolsKeyStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckRelativeFalseSpecialSymbolsKeyStr30002';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file?key1' + str3 + '=value1#qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkRelative();
        expect(String(result1)).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckRelativeFalseSpecialSymbolsValueStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKRELATIVEFALSESPECIALSYMBOLSVALUESTR2_0100
     * @tc.desc   Testing if a URI with special characters in the query value part is correctly identified as not relative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckRelativeFalseSpecialSymbolsValueStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckRelativeFalseSpecialSymbolsValueStr20001';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file?key1=value1' + str2 + '#qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkRelative();
        expect(String(result1)).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCheckRelativeFalseSpecialSymbolsValueStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CHECKRELATIVEFALSESPECIALSYMBOLSVALUESTR3_0200
     * @tc.desc   Testing if a URI with special characters in the query value part is correctly identified as not relative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckRelativeFalseSpecialSymbolsValueStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCheckRelativeFalseSpecialSymbolsValueStr30002';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file?key1=value1' + str3 + '#qwer=da';
        let uriInstance = new uri.URI(uri1);
        let result1 = uriInstance.checkRelative();
        expect(String(result1)).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testAddQueryValueSpecialSymbolsKeyStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ADDQUERYVALUESPECIALSYMBOLSKEYSTR2_0100
     * @tc.desc   Testing if a query parameter with special characters in the key is correctly added to the URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddQueryValueSpecialSymbolsKeyStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testAddQueryValueSpecialSymbolsKeyStr20001';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file';
        const uriInstance = new uri.URI(uri1);
        const result1 = uriInstance.addQueryValue('key1' + str2, 'value').query;
        expect(result1).assertEqual('key1' + str2 + '=value');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testAddQueryValueSpecialSymbolsKeyStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ADDQUERYVALUESPECIALSYMBOLSKEYSTR3_0200
     * @tc.desc   Testing if a query parameter with special characters in the key is correctly added to the URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddQueryValueSpecialSymbolsKeyStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testAddQueryValueSpecialSymbolsKeyStr30002';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file';
        const uriInstance = new uri.URI(uri1);
        const result1 = uriInstance.addQueryValue('key1' + str3, 'value').query;
        expect(result1).assertEqual('key1' + str3 + '=value');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testAddQueryValueSpecialSymbolsValueStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ADDQUERYVALUESPECIALSYMBOLSVALUESTR2_0100
     * @tc.desc   Testing if a query parameter with special characters in the value is correctly added to the URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddQueryValueSpecialSymbolsValueStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testAddQueryValueSpecialSymbolsValueStr20001';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file';
        const uriInstance = new uri.URI(uri1);
        const result1 = uriInstance.addQueryValue('key1', 'value' + str2).query;
        expect(result1).assertEqual('key1=value' + str2);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testAddQueryValueSpecialSymbolsValueStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ADDQUERYVALUESPECIALSYMBOLSVALUESTR3_0200
     * @tc.desc   Testing if a query parameter with special characters in the value is correctly added to the URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddQueryValueSpecialSymbolsValueStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testAddQueryValueSpecialSymbolsValueStr30002';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file';
        const uriInstance = new uri.URI(uri1);
        const result1 = uriInstance.addQueryValue('key1', 'value' + str3).query;
        expect(result1).assertEqual('key1=value' + str3);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testAddsegmentsSpecialsymbolsstr2Decode0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ADDSEGMENTSSPECIALSYMBOLSstr2Decode_0100
     * @tc.desc   Testing if a segment with special characters in the value is correctly added to the URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddsegmentsSpecialsymbolsstr2Decode0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testAddsegmentsSpecialsymbolsstr2Decode0001';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file/?key1=value1&key1=value2#qwer=da';
        const uriInstance = new uri.URI(uri1);
        const result1 = uriInstance.addSegment(str2Decode).toString();
        expect(result1).assertEqual(
          `https://username:password@host:8080/directory/file/${str2}?key1=value1&key1=value2#qwer=da`
        );
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });


    /**
     * @tc.name   testAddEncodedSegmentSpecialSymbolsStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ADDENCODEDSEGMENTSPECIALSYMBOLSSTR2_0100
     * @tc.desc   Testing if a URI segment with special characters is correctly encoded and added to the URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddEncodedSegmentSpecialSymbolsStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testAddEncodedSegmentSpecialSymbolsStr20001';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file/?key1=value1&key1=value2#qwer=da';
        const uriInstance = new uri.URI(uri1);
        const result1 = uriInstance.addEncodedSegment(str2).toString();
        expect(result1).assertEqual(
          `https://username:password@host:8080/directory/file/${str2}?key1=value1&key1=value2#qwer=da`
        );
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testAddEncodedSegmentSpecialSymbolsStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ADDENCODEDSEGMENTSPECIALSYMBOLSSTR3_0200
     * @tc.desc   Testing if a URI segment with special characters is correctly encoded and added to the URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddEncodedSegmentSpecialSymbolsStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testAddEncodedSegmentSpecialSymbolsStr30002';
      try {
        const uri1 = 'https://username:password@host:8080/directory/file/?key1=value1&key1=value2#qwer=da';
        const uriInstance = new uri.URI(uri1);
        const result1 = uriInstance.addEncodedSegment(str3).toString();
        expect(result1).assertEqual(
          `https://username:password@host:8080/directory/file/${str3}?key1=value1&key1=value2#qwer=da`
        );
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testGetQueryNamesSpecialSymbolsStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETQUERYNAMESSPECIALSYMBOLSSTR2_0100
     * @tc.desc   Testing if query names with special characters in their values are correctly retrieved from the URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetQueryNamesSpecialSymbolsStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testGetQueryNamesSpecialSymbolsStr20001';
      try {
        const uri1 =
          'https://username:password@host:8080/directory/file?key1' + str2 + '=value1&key2' + str2 + '=value2&key1' +
            str2 + '=value3#qwer=da';
        const uriInstance = new uri.URI(uri1);
        const result1 = Array.from(uriInstance.getQueryNames()).toString();
        expect(result1).assertEqual('key1' + str2Decode + ',key2' + str2Decode);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testGetQueryNamesSpecialSymbolsStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETQUERYNAMESSPECIALSYMBOLSSTR3_0200
     * @tc.desc   Testing if query names with special characters in their values are correctly retrieved from the URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetQueryNamesSpecialSymbolsStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testGetQueryNamesSpecialSymbolsStr30002';
      try {
        const uri1 =
          `https://username:password@host:8080/directory/file?key1${str3}=value1&key2${str3}=value2&key1${str3}=value3#qwer=da`;
        const uriInstance = new uri.URI(uri1);
        const result1 = Array.from(uriInstance.getQueryNames()).toString();
        expect(result1).assertEqual(`key1${str3Decode},key2${str3Decode}`);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testGetBooleanQueryValueSpecialSymbolsKeyStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETBOOLEANQUERYVALUESPECIALSYMBOLSKEYSTR2_0100
     * @tc.desc   Testing if Boolean query value with special characters in their keys are correctly evaluated from the URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetBooleanQueryValueSpecialSymbolsKeyStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testGetBooleanQueryValueSpecialSymbolsKeyStr20001';
      try {
        const uri1 = `https://username:password@host:8080/directory/file?key1${str2}=true&key1${str2}=value2#qwer=da`;
        const uriInstance = new uri.URI(uri1);
        const result1 = uriInstance.getBooleanQueryValue('key1' + str2Decode, false);
        expect(String(result1)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testGetBooleanQueryValueSpecialSymbolsKeyStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETBOOLEANQUERYVALUESPECIALSYMBOLSKEYSTR3_0200
     * @tc.desc   Testing if Boolean query value with special characters in their keys are correctly evaluated from the URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetBooleanQueryValueSpecialSymbolsKeyStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testGetBooleanQueryValueSpecialSymbolsKeyStr30002';
      try {
        const uri1 = `https://username:password@host:8080/directory/file?key1${str3}=false&key1${str3}=value2#qwer=da`;
        const uriInstance = new uri.URI(uri1);
        const result1 = uriInstance.getBooleanQueryValue('key1' + str3Decode, true);
        expect(String(result1)).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testGetBooleanQueryValueSpecialSymbolsValueStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETBOOLEANQUERYVALUESPECIALSYMBOLSVALUESTR2_0100
     * @tc.desc   Testing if Boolean query values with special characters in their values are correctly evaluated from the URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetBooleanQueryValueSpecialSymbolsValueStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = 'testGetBooleanQueryValueSpecialSymbolsValueStr20001';
        try {
          const uri1 = `https://username:password@host:8080/directory/file?key1=value1${str2}&key1=value2#qwer=da`;
          const uriInstance = new uri.URI(uri1);
          const result1 = uriInstance.getBooleanQueryValue('key1', false);
          expect(String(result1)).assertEqual('true');
        } catch (err) {
        err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.code}`);
          expect(false).assertFail();
        }
      });

    /**
     * @tc.name   testGetBooleanQueryValueSpecialSymbolsValueStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETBOOLEANQUERYVALUESPECIALSYMBOLSVALUESTR3_0200
     * @tc.desc   Testing if Boolean query values with special characters in their values are correctly evaluated from the URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetBooleanQueryValueSpecialSymbolsValueStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = 'testGetBooleanQueryValueSpecialSymbolsValueStr30002';
        try {
          const uri1 = `https://username:password@host:8080/directory/file?key1=value1${str3}&key1=value2#qwer=da`;
          const uriInstance = new uri.URI(uri1);
          const result1 = uriInstance.getBooleanQueryValue('key1', false);
          expect(String(result1)).assertEqual('true');
        } catch (err) {
        err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.code}`);
          expect(false).assertFail();
        }
      });

    /**
     * @tc.name   testClearQuerySpecialSymbolsKeyStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CLEARQUERYSPECIALSYMBOLSKEYSTR2_0100
     * @tc.desc   Testing if query parameters with special characters in their keys are correctly cleared from the URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testClearQuerySpecialSymbolsKeyStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testClearQuerySpecialSymbolsKeyStr20001';
      try {
        const uri1 = `https://username:password@host:8080/directory/file?key1${str2}=value1&key1=value2#qwer=da`;
        const uriInstance = new uri.URI(uri1);
        const result1 = uriInstance.clearQuery().toString();
        expect(result1).assertEqual('https://username:password@host:8080/directory/file#qwer=da');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testClearQuerySpecialSymbolsKeyStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CLEARQUERYSPECIALSYMBOLSKEYSTR3_0200
     * @tc.desc   Testing if query parameters with special characters in their keys are correctly cleared from the URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testClearQuerySpecialSymbolsKeyStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testClearQuerySpecialSymbolsKeyStr30002';
      try {
        const uri1 = `https://username:password@host:8080/directory/file?key1${str3}=value1&key1=value2#qwer=da`;
        const uriInstance = new uri.URI(uri1);
        const result1 = uriInstance.clearQuery().toString();
        expect(result1).assertEqual('https://username:password@host:8080/directory/file#qwer=da');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testClearQuerySpecialSymbolsValueStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CLEARQUERYSPECIALSYMBOLSVALUESTR2_0100
     * @tc.desc   Testing if query parameters with special characters in their values are correctly cleared from the URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testClearQuerySpecialSymbolsValueStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testClearQuerySpecialSymbolsValueStr20001';
      try {
        const uri1 = `https://username:password@host:8080/directory/file?key1=value1${str2}&key1=value2#qwer=da`;
        const uriInstance = new uri.URI(uri1);
        const result1 = uriInstance.clearQuery().toString();
        expect(result1).assertEqual('https://username:password@host:8080/directory/file#qwer=da');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testClearQuerySpecialSymbolsValueStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CLEARQUERYSPECIALSYMBOLSVALUESTR3_0200
     * @tc.desc   Testing if query parameters with special characters in their values are correctly cleared from the URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testClearQuerySpecialSymbolsValueStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testClearQuerySpecialSymbolsValueStr30002';
      try {
        const uri1 = `https://username:password@host:8080/directory/file?key1=value1${str3}&key1=value2#qwer=da`;
        const uriInstance = new uri.URI(uri1);
        const result1 = uriInstance.clearQuery().toString();
        expect(result1).assertEqual('https://username:password@host:8080/directory/file#qwer=da');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testGetLastSegmentSpecialSymbolsStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETLASTSEGMENTSPECIALSYMBOLSSTR2_0100
     * @tc.desc   Testing if the last segment of the URI path with special characters is correctly retrieved.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetLastSegmentSpecialSymbolsStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testGetLastSegmentSpecialSymbolsStr20001';
      try {
        const uri1 = `https://username:password@host:8080/directory/file/${str2}?key1=value1&key1=value2#qwer=da`;
        const uriInstance = new uri.URI(uri1);
        const result1 = uriInstance.getLastSegment();
        expect(result1).assertEqual(str2Decode);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testGetLastSegmentSpecialSymbolsStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETLASTSEGMENTSPECIALSYMBOLSSTR3_0200
     * @tc.desc   Testing if the last segment of the URI path with special characters is correctly retrieved.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetLastSegmentSpecialSymbolsStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testGetLastSegmentSpecialSymbolsStr30002';
      try {
        const uri1 = `https://username:password@host:8080/directory/file/${str3}?key1=value1&key1=value2#qwer=da`;
        const uriInstance = new uri.URI(uri1);
        const result1 = uriInstance.getLastSegment();
        expect(result1).assertEqual(str3Decode);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testGetSegmentSpecialSymbolsStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETSEGMENTSPECIALSYMBOLSSTR2_0100
     * @tc.desc   Testing if a specific segment of the URI path with special characters is correctly retrieved.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetSegmentSpecialSymbolsStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testGetSegmentSpecialSymbolsStr20001';
      try {
        const uri1 = `https://username:password@host:8080/directory/file/${str2}?key1=value1&key1=value2#qwer=da`;
        const uriInstance = new uri.URI(uri1);
        const result1 = uriInstance.getSegment();
        expect(result1[0]).assertEqual('directory');
        expect(result1[1]).assertEqual('file');
        expect(result1[2]).assertEqual(str2Decode);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testGetSegmentSpecialSymbolsStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETSEGMENTSPECIALSYMBOLSSTR3_0200
     * @tc.desc   Testing if a specific segment of the URI path with special characters is correctly retrieved.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetSegmentSpecialSymbolsStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testGetSegmentSpecialSymbolsStr30002';
      try {
        const uri1 = `https://username:password@host:8080/directory/file/${str3}?key1=value1&key1=value2#qwer=da`;
        const uriInstance = new uri.URI(uri1);
        const result1 = uriInstance.getSegment();
        expect(result1[0]).assertEqual('directory');
        expect(result1[1]).assertEqual('file');
        expect(result1[2]).assertEqual(str3Decode);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCreateFromPartsSpecialSymbolsSchemeStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CREATEFROMPARTSSPECIALSYMBOLSSCHEMESTR2_0100
     * @tc.desc   Testing if a URI instance is correctly created from parts with invalid special symbols in the scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateFromPartsSpecialSymbolsSchemeStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCreateFromPartsSpecialSymbolsSchemeStr20001';
      try {
        const uriInstance = uri.URI.createFromParts("mailto" + str2, "no body", "top");
        uriInstance.toString();
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(String(err.code)).assertEqual('10200002')
      }
    });

    /**
     * @tc.name   testCreateFromPartsSpecialSymbolsScheme0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CREATEFROMPARTSSPECIALSYMBOLSSCHEME_0200
     * @tc.desc   Testing if a URI instance is correctly created from parts with valid special symbols in the scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateFromPartsSpecialSymbolsScheme0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCreateFromPartsSpecialSymbolsScheme0002';
      try {
        const uriInstance = uri.URI.createFromParts("mailto-+.test0002", "no body", "top");
        const result1 = uriInstance.toString();
        expect(result1).assertEqual("mailto-+.test0002:no%20body#top");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCreateFromPartsSpecialSymbolsSspStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CREATEFROMPARTSSPECIALSYMBOLSSSPSTR2_0100
     * @tc.desc   Testing if a URI instance is correctly created from parts with special symbols in the ssp.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateFromPartsSpecialSymbolsSspStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCreateFromPartsSpecialSymbolsSspStr20001';
      try {
        const uriInstance = uri.URI.createFromParts("mailto", "no body" + str2, "top");
        const result1 = uriInstance.toString();
        expect(result1).assertEqual("mailto:no%20body" + '!!%2522%2522%2523%2523%2524%2524%2525%2525\'\'(())**%252B' +
          '%252B%252C%252C--..%252F%252F%253A%253A%253B%253B%253C%253C%253D%253D%253E%253E%253F%253F%2540' +
          '%2540%255B%255B%255C%255C%255D%255D%255E%255E__%2560%2560%257B%257B%257C%257C%257D%257D~~' + "#top");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCreateFromPartsSpecialSymbolsSspStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CREATEFROMPARTSSPECIALSYMBOLSSSPSTR3_0200
     * @tc.desc   Testing if a URI instance is correctly created from parts with special symbols in the ssp.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateFromPartsSpecialSymbolsSspStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCreateFromPartsSpecialSymbolsSspStr30002';
      try {
        const uriInstance = uri.URI.createFromParts("mailto", "no body" + str3, "top");
        const result1 = uriInstance.toString();
        expect(result1).assertEqual("mailto:no%20body" + '%2521%2521%2522%2522%2523%2523%2524%2524%2525%2525' +
          '%2526%2526%2527%2527%2528%2528%252A%252A%252B%252B%252C%252C%252D%252D%252E%252E%252F%252F%253A' +
          '%253A%253B%253B%253C%253C%253D%253D%253E%253E%253F%253F%2540%2540%255B%255B%255C%255C%255D%255D' +
          '%255E%255E%255F%255F%2560%2560%257B%257B%257C%257C%257D%257D%257E%257E' + "#top");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCreateFromPartsSpecialSymbolsFragmentStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CREATEFROMPARTSSPECIALSYMBOLSFRAGMENTSTR2_0100
     * @tc.desc   Testing if a URI instance is correctly created from parts with special symbols in the ssp.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateFromPartsSpecialSymbolsFragmentStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCreateFromPartsSpecialSymbolsFragmentStr20001';
      try {
        const uriInstance = uri.URI.createFromParts("mailto", "no body", "top" + str2);
        const result1 = uriInstance.toString();
        expect(result1)
          .assertEqual("mailto:no%20body" + "#top" + '!!%2522%2522%2523%2523%2524%2524%2525%2525\'\'(())**%252B' +
            '%252B%252C%252C--..%252F%252F%253A%253A%253B%253B%253C%253C%253D%253D%253E%253E%253F%253F%2540' +
            '%2540%255B%255B%255C%255C%255D%255D%255E%255E__%2560%2560%257B%257B%257C%257C%257D%257D~~');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testCreateFromPartsSpecialSymbolsFragmentStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CREATEFROMPARTSSPECIALSYMBOLSFRAGMENTSTR3_0200
     * @tc.desc   Testing if a URI instance is correctly created from parts with special symbols in the ssp.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateFromPartsSpecialSymbolsFragmentStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testCreateFromPartsSpecialSymbolsFragmentStr30002';
      try {
        const uriInstance = uri.URI.createFromParts("mailto", "no body", "top" + str3);
        const result1 = uriInstance.toString();
        expect(result1).assertEqual("mailto:no%20body" + "#top" + '%2521%2521%2522%2522%2523%2523%2524%2524%2525%2525' +
          '%2526%2526%2527%2527%2528%2528%252A%252A%252B%252B%252C%252C%252D%252D%252E%252E%252F%252F%253A' +
          '%253A%253B%253B%253C%253C%253D%253D%253E%253E%253F%253F%2540%2540%255B%255B%255C%255C%255D%255D' +
          '%255E%255E%255F%255F%2560%2560%257B%257B%257C%257C%257D%257D%257E%257E');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testGetQueryValueSpecialSymbolsKeyStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETQUERYVALUESPECIALSYMBOLSKEYSTR2_0100
     * @tc.desc   Testing if the correct value is retrieved from a URI's query when the key contains special symbols.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetQueryValueSpecialSymbolsKeyStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testGetQueryValueSpecialSymbolsKeyStr20001';
      try {
        const uri1 = `https://username:password@host:8080/directory/file?key1${str2}=value1#qwer=da`;
        const uriInstance = new uri.URI(uri1);
        const result1 = uriInstance.getQueryValue(`key1${str2Decode}`);
        expect(result1!.toString()).assertEqual('value1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testGetQueryValueSpecialSymbolsKeyStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETQUERYVALUESPECIALSYMBOLSKEYSTR3_0100
     * @tc.desc   Testing if the correct value is retrieved from a URI's query when the key contains special symbols (different case).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetQueryValueSpecialSymbolsKeyStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testGetQueryValueSpecialSymbolsKeyStr30002';
      try {
        const uri1 = `https://username:password@host:8080/directory/file?key1${str3}=value3#qwer=da`;
        const uriInstance = new uri.URI(uri1);
        const result1 = uriInstance.getQueryValues(`key1${str3Decode}`);
        expect(result1.toString()).assertEqual('value3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testGetQueryValueSpecialSymbolsValueStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETQUERYVALUESPECIALSYMBOLSVALUESTR2_0100
     * @tc.desc   Testing if the correct value is retrieved from a URI's query when the value contains special symbols.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetQueryValueSpecialSymbolsValueStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testGetQueryValueSpecialSymbolsValueStr20001';
      try {
        const uri1 = `https://username:password@host:8080/directory/file?key1=value1${str2}#qwer=da`;
        const uriInstance = new uri.URI(uri1);
        const result1 = uriInstance.getQueryValues(`key1`);
        expect(result1.toString()).assertEqual('value1' + str2Decode);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testGetQueryValueSpecialSymbolsValueStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETQUERYVALUESPECIALSYMBOLSVALUESTR3_0200
     * @tc.desc   Testing if the correct value is retrieved from a URI's query when the value contains special symbols.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetQueryValueSpecialSymbolsValueStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testGetQueryValueSpecialSymbolsValueStr30002';
      try {
        const uri1 = `https://username:password@host:8080/directory/file?key1=value3${str3}#qwer=da`;
        const uriInstance = new uri.URI(uri1);
        const result1 = uriInstance.getQueryValues(`key1`);
        expect(result1.toString()).assertEqual('value3' + str3Decode);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testGetQueryValuesSpecialSymbolsKeyStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETQUERYVALUESSPECIALSYMBOLSKEYSTR2_0100
     * @tc.desc   Testing if the correct value is retrieved from a URI's query when the key contains special symbols.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetQueryValuesSpecialSymbolsKeyStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testGetQueryValuesSpecialSymbolsKeyStr20001';
      try {
        const uri1 = `https://username:password@host:8080/directory/file?key1${str2}=value1&key1${str2}=value2#qwer=da`;
        const uriInstance = new uri.URI(uri1);
        const result1: Array<String> = uriInstance.getQueryValues(`key1${str2Decode}`);
        // expect((result1.constructor as Function).name).assertEqual('Array')
        expect(Array.isArray(result1)).assertTrue();
        expect(result1.length).assertEqual(2);
        expect(result1[0]).assertEqual('value1');
        expect(result1[1]).assertEqual('value2');
        expect(result1.toString()).assertEqual('value1,value2');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testGetQueryValuesSpecialSymbolsKeyStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETQUERYVALUESSPECIALSYMBOLSKEYSTR3_0100
     * @tc.desc   Testing if the correct value is retrieved from a URI's query when the key contains special symbols (different case).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetQueryValuesSpecialSymbolsKeyStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testGetQueryValuesSpecialSymbolsKeyStr30002';
      try {
        const uri1 = `https://username:password@host:8080/directory/file?key1${str3}=value3&key1${str3}=value4#qwer=da`;
        const uriInstance = new uri.URI(uri1);
        const result1 = uriInstance.getQueryValues(`key1${str3Decode}`);
        // expect(result1.constructor.name).assertEqual('Array')
        expect(Array.isArray(result1)).assertTrue();
        expect(result1.length).assertEqual(2);
        expect(result1[0]).assertEqual('value3');
        expect(result1[1]).assertEqual('value4');
        expect(result1.toString()).assertEqual('value3,value4');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testGetQueryValuesSpecialSymbolsValueStr20001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETQUERYVALUESSPECIALSYMBOLSVALUESTR2_0100
     * @tc.desc   Testing if the correct value is retrieved from a URI's query when the value contains special symbols.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetQueryValuesSpecialSymbolsValueStr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testGetQueryValuesSpecialSymbolsValueStr20001';
      try {
        const uri1 = `https://username:password@host:8080/directory/file?key1=value1${str2}&key1=value2${str2}#qwer=da`;
        const uriInstance = new uri.URI(uri1);
        const result1 = uriInstance.getQueryValues(`key1`);
        // expect(result1.constructor.name).assertEqual('Array')
        expect(Array.isArray(result1)).assertTrue();
        expect(result1.length).assertEqual(2);
        expect(result1[0]).assertEqual('value1' + str2Decode);
        expect(result1[1]).assertEqual('value2' + str2Decode);
        expect(result1.toString()).assertEqual(`value1${str2Decode},value2${str2Decode}`);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testGetQueryValuesSpecialSymbolsValueStr30002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_GETQUERYVALUESSPECIALSYMBOLSVALUESTR3_0200
     * @tc.desc   Testing if the correct value is retrieved from a URI's query when the value contains special symbols.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetQueryValuesSpecialSymbolsValueStr30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testGetQueryValuesSpecialSymbolsValueStr30002';
      try {
        const uri1 = `https://username:password@host:8080/directory/file?key1=value3${str3}&key1=value4${str3}#qwer=da`;
        const uriInstance = new uri.URI(uri1);
        const result1 = uriInstance.getQueryValues(`key1`);
        // expect(result1.constructor.name).assertEqual('Array')
        expect(Array.isArray(result1)).assertTrue();
        expect(result1.length).assertEqual(2);
        expect(result1[0]).assertEqual('value3' + str3Decode);
        expect(result1[1]).assertEqual('value4' + str3Decode);
        expect(result1.toString()).assertEqual(`value3${str3Decode},value4${str3Decode}`);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    //新增uri属性

    /**
     * @tc.name   testScheme0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_SCHEME_0100
     * @tc.desc   Testing if the correct scheme is retrieved from a URI when the scheme is FTP.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScheme0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testScheme0001';
      try {
        const Uri = "ftp://ftp.aaa.bbb.ccc/dddd/eee.txt"
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.scheme).assertEqual("ftp");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testScheme0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_SCHEME_0200
     * @tc.desc   Testing if the correct handling occurs when an incorrect scheme is retrieved from a URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScheme0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testScheme0002';
      try {
        const Uri = "https:ftp://ftp.aaa.bbb.ccc/dddd/eee.txt";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.scheme).assertEqual("https");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testScheme0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_SCHEME_0300
     * @tc.desc   Testing if the correct handling occurs when an invalid scheme is prefixed with a colon in a URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScheme0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testScheme0003';
      try {
        const Uri = ":ftp://ftp.aaa.bbb.ccc/dddd/eee.txt";
        new uri.URI(Uri);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(String(err.code)).assertEqual('10200002')
      }
    });

    /**
     * @tc.name   testScheme0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_SCHEME_0400
     * @tc.desc   Testing if the correct handling occurs when an invalid scheme is malformed in a URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScheme0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testScheme0004';
      try {
        const Uri = "f:tp://ftp.aaa.bbb.ccc/dddd/eee.txt";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.scheme).assertEqual("f");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testUserInfo0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_USERINFO_0100
     * @tc.desc   Testing if null is returned for a URI with malformed user info.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUserInfo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testUserInfo0001';
      try {
        const Uri = "https://username:password@@host:8080/directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        hilog.info(1, TAG, '%{public}s', 'lxl testUserInfo0001 describe start uriInstance is:' + JSON.stringify(uriInstance));
        hilog.info(1, TAG, '%{public}s', 'lxl testUserInfo0001 describe start userInfo is:' + uriInstance.userInfo);
        expect(uriInstance.userInfo).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testUserInfo0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_USERINFO_0200
     * @tc.desc   Testing if null is returned for a URI with malformed user info.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUserInfo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testUserInfo0002';
      try {
        const Uri = "https://username:@password@host:8080/directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.userInfo).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testUserInfo0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_USERINFO_0300
     * @tc.desc   Testing if null is returned for a URI with malformed user info.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUserInfo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testUserInfo0003';
      try {
        const Uri = "https://username@:password@host:8080/directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.userInfo).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testUserInfo0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_USERINFO_0400
     * @tc.desc   Testing if null is returned for a URI with malformed user info.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUserInfo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testUserInfo0004';
      try {
        const Uri = "https://user:name:password@host@:8080/directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.userInfo).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testUserInfo0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_USERINFO_0500
     * @tc.desc   Testing if null is returned for a URI with malformed user info.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUserInfo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testUserInfo0005';
      try {
        const Uri = "https:////username:password@host:8080/directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.userInfo).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testUserInfo0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_USERINFO_0600
     * @tc.desc   Testing if userInfo is correctly retrieved when format is valid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUserInfo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testUserInfo0006';
      try {
        const Uri = "https://username::password@host:8080/directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.userInfo).assertEqual("username::password");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testUserInfo0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_USERINFO_0700
     * @tc.desc   Testing if userInfo is correctly retrieved when format is valid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUserInfo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testUserInfo0007';
      try {
        const Uri = "https://user:name:password@host:8080/directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.userInfo).assertEqual("user:name:password");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testUserInfo0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_USERINFO_0800
     * @tc.desc   Testing if null is returned for a URI with an invalid scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUserInfo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testUserInfo0008';
      try {
        const Uri = "https:ftp://username:password@host:8080/directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.userInfo).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testUserInfo0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_USERINFO_0900
     * @tc.desc   Testing if userInfo is correctly retrieved when percent-encoded.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUserInfo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testUserInfo0009';
      try {
        const Uri = "https://username%3Apassword@host:8080/directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.userInfo).assertEqual("username:password");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testUserInfo0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_USERINFO_1000
     * @tc.desc   Testing if null is returned for a URI with malformed percent-encoded user info.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUserInfo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testUserInfo0010';
      try {
        const Uri = "https://username%3Apassword%40host:8080/directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.userInfo).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHost0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_HOST_0100
     * @tc.desc   Testing if null is returned for a URI with malformed host info.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHost0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHost0001';
      try {
        const Uri = "https://username:password@@host:8080/directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.host).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHost0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_HOST_0200
     * @tc.desc   Testing if null is returned for a URI with malformed host info.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHost0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHost0002';
      try {
        const Uri = "https://username:@password@host:8080/directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.host).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHost0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_HOST_0300
     * @tc.desc   Testing if null is returned for a URI with malformed host info.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHost0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHost0003';
      try {
        const Uri = "https://username@:password@host:8080/directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.host).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHost0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_HOST_0400
     * @tc.desc   Testing if null is returned for a URI with malformed host info.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHost0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHost0004';
      try {
        const Uri = "https://username:password@host@:8080/directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.host).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHost0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_HOST_0500
     * @tc.desc   Testing if null is returned for a URI with malformed host info.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHost0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHost0005';
      try {
        const Uri = "https://username:password@host:8080@/directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.host).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHost0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_HOST_0600
     * @tc.desc   Testing if null is returned for a URI with malformed host info.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHost0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHost0006';
      try {
        const Uri = "https://username:password@ho@st:8080/directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.host).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testHost0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_HOST_0700
     * @tc.desc   Testing if null is returned for a URI with malformed host info.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHost0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testHost0007';
      try {
        const Uri = "https://username:password@host::8080/directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.host).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPort0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_PORT_0100
     * @tc.desc   Testing if -1 is returned for a URI with malformed port info.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPort0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testPort0001';
      try {
        const Uri = "https://username:password@host::8080/directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.port).assertEqual("-1");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPort0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_PORT_0200
     * @tc.desc   Testing if -1 is returned for a URI with malformed port info.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPort0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testPort0002';
      try {
        const Uri = "https://username:password@host:@8080/directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.port).assertEqual("-1");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPort0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_PORT_0300
     * @tc.desc   Testing if -1 is returned for a URI with malformed port info.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPort0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testPort0003';
      try {
        const Uri = "https://username:password@host:80@80/directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.port).assertEqual("-1");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPort0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_PORT_0400
     * @tc.desc   Testing if -1 is returned for a URI with malformed port info.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPort0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testPort0004';
      try {
        const Uri = "https://username:password@host:8080@/directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.port).assertEqual("-1");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPath0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_PATH_0100
     * @tc.desc   Testing if the correct path is retrieved from a URI with leading slashes in the path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPath0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testPath0001';
      try {
        const Uri = "https://username:password@host:8080//directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.path).assertEqual("//directory/file");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPath0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_PATH_0200
     * @tc.desc   Testing if the correct path is retrieved from a URI with multiple directory segments.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPath0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testPath0002';
      try {
        const Uri = "https://username:password@host:8080/dir/ec/tory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.path).assertEqual("/dir/ec/tory/file");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPath0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_PATH_0300
     * @tc.desc   Testing if the correct path is retrieved from a URI with double slashes in the path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPath0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testPath0003';
      try {
        const Uri = "https://username:password@host:8080/directory//file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.path).assertEqual("/directory//file");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPath0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_PATH_0400
     * @tc.desc   Testing if the correct path is retrieved from a URI with percent-encoded spaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPath0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testPath0004';
      try {
        const Uri = "https://username:my+name@host:8080/directory%2Fmy+file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.path).assertEqual("/directory/my+file");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testPath0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_PATH_0500
     * @tc.desc   Testing if the correct path is retrieved from a URI with complex percent-encoded segments.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPath0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testPath0005';
      try {
        const Uri = "https://username:my+name@host:8080/direc%2F%3Dtory%2Fmy+file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.path).assertEqual("/direc/=tory/my+file");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testQuery0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_QUERY_0100
     * @tc.desc   Testing if the correct query is retrieved from a URI with double question marks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQuery0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testQuery0001';
      try {
        const Uri = "https://username:password@host:8080/directory/file??foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.query).assertEqual("?foo=1&bar=2");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testQuery0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_QUERY_0200
     * @tc.desc   Testing if the correct query is retrieved from a URI with complex query parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQuery0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testQuery0002';
      try {
        const Uri = "https://username:password@host:8080/directory/file?f?oo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.query).assertEqual("f?oo=1&bar=2");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testQuery0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_QUERY_0300
     * @tc.desc   Testing if the correct query is retrieved from a URI with multiple equal signs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQuery0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testQuery0003';
      try {
        const Uri = "https://username:password@host:8080/directory/file?foo==1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.query).assertEqual("foo==1&bar=2");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testQuery0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_QUERY_0400
     * @tc.desc   Testing if the correct query is retrieved from a URI with an equals sign within a parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQuery0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testQuery0004';
      try {
        const Uri = "https://username:password@host:8080/directory/file?fo=o=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.query).assertEqual("fo=o=1&bar=2");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testQuery0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_QUERY_0500
     * @tc.desc   Testing if the correct query is retrieved from a URI with malformed query.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQuery0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testQuery0005';
      try {
        const Uri = "https://username:password@host:8080/directory/file?foo=1=&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.query).assertEqual("foo=1=&bar=2");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testQuery0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_QUERY_0600
     * @tc.desc   Testing if the correct query is retrieved from a URI with consecutive ampersands.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQuery0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testQuery0006';
      try {
        const Uri = "https://username:password@host:8080/directory/file?foo=1&&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.query).assertEqual("foo=1&&bar=2");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testQuery0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_QUERY_0700
     * @tc.desc   Testing if the correct query is retrieved from a URI with a malformed parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQuery0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testQuery0007';
      try {
        const Uri = "https://username:password@host:8080/directory/file?foo=&1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.query).assertEqual("foo=&1&bar=2");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testQuery0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_QUERY_0800
     * @tc.desc   Testing if the correct query is retrieved from a URI with parameters without equalign sign.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQuery0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testQuery0008';
      try {
        const Uri = "https://username:password@host:8080/directory/file?foo=1&b&ar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.query).assertEqual("foo=1&b&ar=2");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testQuery0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_QUERY_0900
     * @tc.desc   Testing if null is returned for a URI when the query is part of the path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQuery0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testQuery0009';
      try {
        const Uri = "https://username:my+name@host:8080/directory/my+file%3Ffoo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.query).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testQuery0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_QUERY_1000
     * @tc.desc   Testing if the correct query is retrieved from percent-encoded parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQuery0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testQuery0010';
      try {
        const Uri = "https://username:my+name@host:8080/directory/my+file?foo%3D1%26bar%3D2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.query).assertEqual("foo=1&bar=2");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testFragment0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_FRAGMENT_0100
     * @tc.desc   Testing if a Syntax Error is returned for a URI with double hashes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFragment0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testFragment0001';
      try {
        const Uri = "https://username:password@host:8080/directory/file?foo=1&bar=2##fragment";
        new uri.URI(Uri);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(String(err.code)).assertEqual('10200002');
      }
    });

    /**
     * @tc.name   testFragment0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_FRAGMENT_0200
     * @tc.desc   Testing if a Syntax Error is returned for a URI with multiple fragments.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFragment0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testFragment0002';
      try {
        const Uri = "https://username:password@host:8080/directory/file?foo=1&bar=2#fr#agment";
        new uri.URI(Uri);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(String(err.code)).assertEqual('10200002');
      }
    });

    /**
     * @tc.name   testFragment0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_FRAGMENT_0300
     * @tc.desc   Testing if a Syntax Error is returned for a URI with trailing hash.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFragment0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testFragment0003';
      try {
        const Uri = "https://username:password@host:8080/directory/file?foo=1&bar=2#fragment#";
        new uri.URI(Uri);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(String(err.code)).assertEqual('10200002');
      }
    });

    /**
     * @tc.name   testFragment0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_FRAGMENT_0400
     * @tc.desc   Testing if a Syntax Error is returned for a URI with malformed fragment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFragment0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testFragment0004';
      try {
        const Uri = "https://username:password@host:8080/directory/file?foo=1&bar=2#frag==##ment";
        new uri.URI(Uri);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(String(err.code)).assertEqual('10200002');
      }
    });

    /**
     * @tc.name   testFragment0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_FRAGMENT_0500
     * @tc.desc   Testing if null is returned for a URI with a percent-encoded fragment indicator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFragment0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testFragment0005';
      try {
        const Uri = "https://username:my+name@host:8080/directory/my+file?foo=1&bar=2%23fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.fragment).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testFragment0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_FRAGMENT_0600
     * @tc.desc   Testing if the correct fragment is retrieved from a percent-encoded fragment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFragment0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testFragment0006';
      try {
        const Uri = "https://username:my+name@host:8080/directory/my+file?foo=1&bar=2#frag%3Dment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.fragment).assertEqual("frag=ment");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testAuthority0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_AUTHORITY_0100
     * @tc.desc   Testing if the correct authority is retrieved from a URI with double @ symbols.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAuthority0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testAuthority0001';
      try {
        const Uri = "https://username:password@@host:8080/directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.authority).assertEqual("username:password@@host:8080");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testAuthority0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_AUTHORITY_0200
     * @tc.desc   Testing if the correct authority is retrieved from a URI with a username followed by a colon.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAuthority0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testAuthority0002';
      try {
        const Uri = "https://username:@password@host:8080/directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.authority).assertEqual("username:@password@host:8080");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testAuthority0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_AUTHORITY_0300
     * @tc.desc   Testing if the correct authority is retrieved from a URI with username and password followed by an @ symbol.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAuthority0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testAuthority0003';
      try {
        const Uri = "https://username@:password@host:8080/directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.authority).assertEqual("username@:password@host:8080");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testAuthority0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_AUTHORITY_0400
     * @tc.desc   Testing if the correct authority is retrieved from a URI with user info and malformed host.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAuthority0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testAuthority0004';
      try {
        const Uri = "https://user:name:password@host@:8080/directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.authority).assertEqual("user:name:password@host@:8080");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testAuthority0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_AUTHORITY_0500
     * @tc.desc   Testing if null is returned for a percent-encoded URI without proper authority.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAuthority0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testAuthority0005';
      try {
        const Uri = "https:%2F%2Fusername%3Amy%2Bname%40host%2B8080%2Fdirectory/my+file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.authority).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testAuthority0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_AUTHORITY_0600
     * @tc.desc   Testing if the correct authority is retrieved from a percent-encoded authority.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAuthority0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testAuthority0006';
      try {
        const Uri = "https://username%3Amy%2Bname%40host%2B8080%2Fdirectory/my+file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.authority).assertEqual("username:my+name@host+8080/directory");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testSsp0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_SSP_0100
     * @tc.desc   Testing if the correct ssp is retrieved from a URI with leading colons.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSsp0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testSsp0001';
      try {
        const Uri = "www.abc.com:::8080/directory/file?ab=pppppp#qwer=da";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.ssp).assertEqual("::8080/directory/file?ab=pppppp");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testSsp0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_SSP_0200
     * @tc.desc   Testing if a Syntax Error is returned for a URI with invalid structure.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSsp0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testSsp0002';
      try {
        const Uri = "www.abc.com:8080/directory/file?ab=pppppp##qwer=da";
        new uri.URI(Uri);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(String(err.code)).assertEqual('10200002');
      }
    });

    /**
     * @tc.name   testSsp0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_SSP_0300
     * @tc.desc   Testing if the correct ssp is retrieved from a percent-encoded URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSsp0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testSsp0003';
      try {
        const Uri = "https:%2F%2Fusername%3Amy%2Bname%40host%2B8080%2Fdirectory/my+file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.ssp).assertEqual("//username:my+name@host+8080/directory/my+file?foo=1&bar=2");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedUserInfo0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDUSERINFO_0100
     * @tc.desc   Testing if the correct encoded user info is retrieved from a URI with doubles colons.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedUserInfo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedUserInfo0001';
      try {
        const Uri = "https://username::my+name@host:8080/directory/my+file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedUserInfo).assertEqual("username::my+name");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedUserInfo0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDUSERINFO_0200
     * @tc.desc   Testing if null is returned for a URI with malformed user info (leading slash).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedUserInfo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedUserInfo0002';
      try {
        const Uri = "https:///username:my+name@host:8080/directory/my+file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedUserInfo).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedUserInfo0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDUSERINFO_0300
     * @tc.desc   Testing if null is returned for a URI with invalid user info (double @).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedUserInfo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedUserInfo0003';
      try {
        const Uri = "https://username:my+name@@host:8080/directory/my+file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedUserInfo).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedUserInfo0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDUSERINFO_0400
     * @tc.desc   Testing if null is returned for a URI with incomplete user info.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedUserInfo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedUserInfo0004';
      try {
        const Uri = "https://username:@my+name@host:8080/directory/my+file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedUserInfo).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedUserInfo0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDUSERINFO_0500
     * @tc.desc   Testing if null is returned for a URI with malformed user info (host).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedUserInfo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedUserInfo0005';
      try {
        const Uri = "https://username:my+name@host@:8080/directory/my+file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedUserInfo).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedUserInfo0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDUSERINFO_0600
     * @tc.desc   Testing if the correct encoded user info is retrieved from a percent-encoded username and password.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedUserInfo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedUserInfo0006';
      try {
        const Uri = "https://username%3Apassword@host:8080/directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedUserInfo).assertEqual("username%3Apassword");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedUserInfo0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDUSERINFO_0700
     * @tc.desc   Testing if null is returned for a percent-encoded URI with an encoded host character.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedUserInfo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedUserInfo0007';
      try {
        const Uri = "https://username%3Apassword%40host:8080/directory/file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedUserInfo).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedPath0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDPATH_0100
     * @tc.desc   Testing if the correct encoded path is retrieved from a URI with leading slashes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedPath0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedPath0001';
      try {
        const Uri = "https://username:my+name@host:8080///directory/my+file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedPath).assertEqual("///directory/my+file");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedPath0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDPATH_0200
     * @tc.desc   Testing if the correct encoded path is retrieved from a URI with multiple slashes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedPath0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedPath0002';
      try {
        const Uri = "https://username:my+name@host:8080/directory///my+file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedPath).assertEqual("/directory///my+file");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedPath0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDPATH_0300
     * @tc.desc   Testing if the correct encoded path is retrieved from a URI with complex path segments.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedPath0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedPath0003';
      try {
        const Uri = "https://username:my+name@host:8080/direct/ory/my+/file/?/?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedPath).assertEqual("/direct/ory/my+/file/");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedPath0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDPATH_0400
     * @tc.desc   Testing if a Syntax Error is returned for a URI with percent encoding in the path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedPath0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedPath0004';
      try {
        const Uri = "https://username:my+name@host:8080%2Fdirectory%2Fmy+file?foo=1&bar=2#fragment";
        new uri.URI(Uri);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(String(err.code)).assertEqual('10200002');
      }
    });

    /**
     * @tc.name   testEncodedPath0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDPATH_0500
     * @tc.desc   Testing if the correct encoded path is retrieved from a URI with encoded characters in path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedPath0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedPath0005';
      try {
        const Uri = "https://username:my+name@host:8080/directory%2Fmy+file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedPath).assertEqual("/directory%2Fmy+file");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedPath0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDPATH_0600
     * @tc.desc   Testing if the correct encoded path is retrieved from a URI with complex encoded path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedPath0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedPath0006';
      try {
        const Uri = "https://username:my+name@host:8080/direc%2F=tory%2Fmy+file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedPath).assertEqual("/direc%2F=tory%2Fmy+file");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedQuery0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDQUERY_0100
     * @tc.desc   Testing if the correct encoded query is retrieved from a URI with double question marks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedQuery0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedQuery0001';
      try {
        const Uri = "https://username:my+name@host:8080/directory/my+file??foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedQuery).assertEqual("?foo=1&bar=2");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedQuery0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDQUERY_0200
     * @tc.desc   Testing if the correct encoded query is retrieved from a URI with path ending with a slash followed by a double slash.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedQuery0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedQuery0002';
      try {
        const Uri = "https://username:my+name@host:8080/directory/my+file/?/?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedQuery).assertEqual("/?foo=1&bar=2");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedQuery0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDQUERY_0300
     * @tc.desc   Testing if the correct encoded query is retrieved from a URI with unusual query structure.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedQuery0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedQuery0003';
      try {
        const Uri = "https://username:my+name@host:8080/directory/my+file?f?oo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedQuery).assertEqual("f?oo=1&bar=2");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedQuery0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDQUERY_0400
     * @tc.desc   Testing if the correct encoded query is retrieved from a URI with complex query parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedQuery0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedQuery0004';
      try {
        const Uri = "https://username:my+name@host:8080/directory/my+file?foo=aa=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedQuery).assertEqual("foo=aa=1&bar=2");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedQuery0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDQUERY_0500
     * @tc.desc   Testing if the correct encoded query is retrieved from a URI with mixed query parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedQuery0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedQuery0005';
      try {
        const Uri = "https://username:my+name@host:8080/directory/my+file?foo=1&&bar&=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedQuery).assertEqual("foo=1&&bar&=2");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedQuery0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDQUERY_0600
     * @tc.desc   Testing if null is returned for a URI with percent-encoded question mark in path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedQuery0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedQuery0006';
      try {
        const Uri = "https://username:my+name@host:8080/directory/my+file%3Ffoo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedQuery).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedQuery0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDQUERY_0700
     * @tc.desc   Testing if the correct encoded query is retrieved from a URI with encoded query parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedQuery0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedQuery0007';
      try {
        const Uri = "https://username:my+name@host:8080/directory/my+file?foo%3D1%26bar%3D2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedQuery).assertEqual("foo%3D1%26bar%3D2");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedFragment0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDFRAGMENT_0100
     * @tc.desc   Testing if a Syntax Error is returned for a URI with double hash marks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedFragment0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedFragment0001';
      try {
        const Uri = "https://username:my+name@host:8080/directory/my+file?foo=1&bar=2##fragment";
        new uri.URI(Uri);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(String(err.code)).assertEqual('10200002');
      }
    });

    /**
     * @tc.name   testEncodedFragment0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDFRAGMENT_0200
     * @tc.desc   Testing if a Syntax Error is returned for a URI with multiple fragment sections.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedFragment0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedFragment0002';
      try {
        const Uri = "https://username:my+name@host:8080/directory/my+file?foo=1&bar=2#fr#agment";
        new uri.URI(Uri);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(String(err.code)).assertEqual('10200002');
      }
    });

    /**
     * @tc.name   testEncodedFragment0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDFRAGMENT_0300
     * @tc.desc   Testing if a Syntax Error is returned for a URI with trailing hash.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedFragment0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedFragment0003';
      try {
        const Uri = "https://username:my+name@host:8080/directory/my+file?foo=1&bar=2#fragment#";
        new uri.URI(Uri);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(String(err.code)).assertEqual('10200002');
      }
    });

    /**
     * @tc.name   testEncodedFragment0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDFRAGMENT_0400
     * @tc.desc   Testing if a Syntax Error is returned for a URI with malformed fragment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedFragment0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedFragment0003';
      try {
        const Uri = "https://username:my+name@host:8080/directory/my+file?foo=1&bar=2#frag==##ment";
        new uri.URI(Uri);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(String(err.code)).assertEqual('10200002');
      }
    });

    /**
     * @tc.name   testEncodedFragment0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDFRAGMENT_0500
     * @tc.desc   Testing if null is returned for a URI with percent-encoded fragment character in the path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedFragment0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedFragment0005';
      try {
        const Uri = "https://username:my+name@host:8080/directory/my+file?foo=1&bar=2%23fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedFragment).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedFragment0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDFRAGMENT_0600
     * @tc.desc   Testing if the correct encoded fragment is retrieved from a URI with encoded fragment characters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedFragment0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedFragment0006';
      try {
        const Uri = "https://username:my+name@host:8080/directory/my+file?foo=1&bar=2#frag%3Dment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedFragment).assertEqual("frag%3Dment");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedAuthority0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDAUTHORITY_0100
     * @tc.desc   Testing if the correct encoded authority is retrieved from a URI with double '@' symbols.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedAuthority0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedAuthority0001';
      try {
        const Uri = "https://username:my+name@@host:8080/directory/my+file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedAuthority).assertEqual("username:my+name@@host:8080");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedAuthority0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDAUTHORITY_0200
     * @tc.desc   Testing if the correct encoded authority is retrieved from a URI with a colon followed by an invalid character.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedAuthority0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedAuthority0002';
      try {
        const Uri = "https://username:@my+name@host:8080/directory/my+file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedAuthority).assertEqual("username:@my+name@host:8080");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedAuthority0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDAUTHORITY_0300
     * @tc.desc   Testing if the correct encoded authority is retrieved from a URI with an '@' in the username.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedAuthority0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedAuthority0003';
      try {
        const Uri = "https://user@name:my+name@host:8080/directory/my+file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedAuthority).assertEqual("user@name:my+name@host:8080");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedAuthority0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDAUTHORITY_0400
     * @tc.desc   Testing if the correct encoded authority is retrieved from a URI with invalid format.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedAuthority0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedAuthority0004';
      try {
        const Uri = "https://username:my+name@host@:8080/directory/my+file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedAuthority).assertEqual("username:my+name@host@:8080");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedAuthority0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDAUTHORITY_0500
     * @tc.desc   Testing if null is returned for a URI with percent-encoded authority character.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedAuthority0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedAuthority0005';
      try {
        const Uri = "https:%2F%2Fusername%3Amy%2Bname%40host%2B8080%2Fdirectory/my+file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedAuthority).assertEqual(null);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedAuthority0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDAUTHORITY_0600
     * @tc.desc   Testing if the correct encoded authority is retrieved from a URI with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedAuthority0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedAuthority0006';
      try {
        const Uri = "https://username%3Amy%2Bname%40host%2B8080%2Fdirectory/my+file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedAuthority).assertEqual("username%3Amy%2Bname%40host%2B8080%2Fdirectory");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedSSP0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDSSP_0100
     * @tc.desc   Testing if the correct encoded SSP is retrieved from a URI with multiple leading slashes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedSSP0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedSSP0001';
      try {
        const Uri = "https:////username:my+name@host:8080/directory/my+file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedSSP).assertEqual("////username:my+name@host:8080/directory/my+file?foo=1&bar=2");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedSSP0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDSSP_0200
     * @tc.desc   Testing if a Syntax Error is returned for a URI with double hashes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedSSP0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedSSP0002';
      try {
        const Uri = "https://username:my+name@host:8080/directory/my+file?foo=1&bar=2##fragment";
        new uri.URI(Uri);
        expect(false).assertFail();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(String(err.code)).assertEqual('10200002');
      }
    });

    /**
     * @tc.name   testEncodedSSP0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDSSP_0300
     * @tc.desc   Testing if the correct encoded SSP is retrieved from a URI with a different scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedSSP0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedSSP0003';
      try {
        const Uri = "https:ftp://username:my+name@host:8080/directory/my+file?foo=1&bar=2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedSSP).assertEqual("ftp://username:my+name@host:8080/directory/my+file?foo=1&bar=2");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testEncodedSSP0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDSSP_0400
     * @tc.desc   Testing if null is returned for a URI with percent-encoded characters in the scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedSSP0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testEncodedSSP0004';
      try {
        const Uri = "https:%2F%2Fusername%3Amy%2Bname%40host%2B8080%2Fdirectory%2Fmy%" +
          "3Afile%3Ffoo%3D1%26bar%3D2#fragment";
        const uriInstance = new uri.URI(Uri);
        expect(uriInstance.encodedSSP).assertEqual("%2F%2Fusername%3Amy%2Bname%40host%2B8080%" +
          "2Fdirectory%2Fmy%3Afile%3Ffoo%3D1%26bar%3D2");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(false).assertFail();
      }
    });
    
    /**
     * @tc.name   testEncodedSSP0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDSSP_0500
     * @tc.desc   Testing if null is returned for a URI with percent-encoded characters in the scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedSSP0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const uriInstance = new uri.URI('https://username:password@www.qwer.com:8080?query=pppppp');
      let result1 = uriInstance.checkIsAbsolute();
      expect(result1).assertTrue();
      const uriInstance1 = new uri.URI('xxx.com/suppliers.htm');
      let result2 = uriInstance1.checkIsAbsolute();
      expect(result2).assertFalse();
    });

    /**
     * @tc.name   testEncodedSSP0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDSSP_0600
     * @tc.desc   Testing if null is returned for a URI with percent-encoded characters in the scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedSSP0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const uriInstance = new uri.URI("https://www.com?param1=value1&param2=value2");
      let result1 = uriInstance.getQueryValue("param1");
      let uriInstance1 = new uri.URI('https://www.zyy.ss?sa%3D=po%7E');
      let result2 = uriInstance1.getQueryValue('sa=');
      let result3 = uriInstance1.getQueryValue('abc');
      expect(result1).assertEqual("value1");
      expect(result2).assertEqual('po~');
      expect(result3).assertEqual(null);
    });

    /**
     * @tc.name   testEncodedSSP0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDSSP_0700
     * @tc.desc   Testing if null is returned for a URI with percent-encoded characters in the scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedSSP0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const uriInstance = new uri.URI("http://www.test.com");
      const newRoute = uriInstance.addSegment("my image.jpg");
      let result1 = newRoute.toString();
      expect(result1).assertEqual("http://www.test.com/my%20image.jpg");
    });

    /**
     * @tc.name   testEncodedSSP0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDSSP_0800
     * @tc.desc   Testing if null is returned for a URI with percent-encoded characters in the scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedSSP0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const uriInstance = new uri.URI("https://username:password@www.qwer.com:8080?query=p");
      let result1 = uriInstance.checkRelative();
      expect(result1).assertFalse();
      const uriInstance1 = new uri.URI("/images/pic.jpg");
      let result2 = uriInstance1.checkRelative();
      expect(result2).assertTrue();
    });

    /**
     * @tc.name   testEncodedSSP0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDSSP_0900
     * @tc.desc   Testing if null is returned for a URI with percent-encoded characters in the scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedSSP0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const uriInstance = new uri.URI("http://www.test.com/images/pic.jpg");
      let result1 = uriInstance.checkOpaque();
      expect(result1).assertFalse();
      const uriInstance1 = new uri.URI("mailto:user@example.com");
      let result2 = uriInstance1.checkOpaque();
      expect(result2).assertTrue();
    });

    /**
     * @tc.name   testEncodedSSP0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDSSP_01000
     * @tc.desc   Testing if null is returned for a URI with percent-encoded characters in the scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedSSP0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const uriInstance = new uri.URI("mailto:user@example.com");
      let result1 = uriInstance.checkHierarchical();
      expect(result1).assertFalse();
      const uriInstance1 = new uri.URI("http://www.test.com/images/pic.jpg");
      let result2 = uriInstance1.checkHierarchical();
      expect(result2).assertTrue();
    });

    /**
     * @tc.name   testEncodedSSP0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDSSP_01100
     * @tc.desc   Testing if null is returned for a URI with percent-encoded characters in the scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedSSP0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const uriInstance = new uri.URI("mailto:user@example.com");
      let result1 = uriInstance.checkHierarchical();
      expect(result1).assertFalse();
      const uriInstance1 = new uri.URI("http://www.test.com/images/pic.jpg");
      let result2 = uriInstance1.checkHierarchical();
      expect(result2).assertTrue();
    });

    /**
     * @tc.name   testEncodedSSP0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDSSP_01200
     * @tc.desc   Testing if null is returned for a URI with percent-encoded characters in the scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedSSP0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let str =
        'https://admin:SecurePass123!@api.example.com:443/v2/resources/finance/transactions/2025Q4?id=10086&type=bond&region=CN&sort=amount_desc#payment-detail-789'
      const uriObj3 = new uri.URI(str);
      expect(uriObj3.scheme).assertEqual("https");
      expect(uriObj3.userInfo).assertEqual("admin:SecurePass123!");
      expect(uriObj3.host).assertEqual("api.example.com");
      expect(uriObj3.port).assertEqual("443");
      expect(uriObj3.path).assertEqual("/v2/resources/finance/transactions/2025Q4");
      expect(uriObj3.query).assertEqual("id=10086&type=bond&region=CN&sort=amount_desc");
      expect(uriObj3.fragment).assertEqual("payment-detail-789");
      expect(uriObj3.authority).assertEqual("admin:SecurePass123!@api.example.com:443");
      expect(uriObj3.ssp)
        .assertEqual("//admin:SecurePass123!@api.example.com:443/v2/resources/finance/transactions/2025Q4?id=10086&type=bond&region=CN&sort=amount_desc");
      expect(uriObj3.encodedUserInfo).assertEqual("admin:SecurePass123!");
      expect(uriObj3.encodedPath).assertEqual("/v2/resources/finance/transactions/2025Q4");
      expect(uriObj3.encodedQuery).assertEqual("id=10086&type=bond&region=CN&sort=amount_desc");
      expect(uriObj3.encodedFragment).assertEqual("payment-detail-789");
      expect(uriObj3.encodedAuthority).assertEqual("admin:SecurePass123!@api.example.com:443");
      expect(uriObj3.encodedSSP)
        .assertEqual("//admin:SecurePass123!@api.example.com:443/v2/resources/finance/transactions/2025Q4?id=10086&type=bond&region=CN&sort=amount_desc");
    });

    /**
     * @tc.name   testEncodedSSP0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URI_ENCODEDSSP_01300
     * @tc.desc   Testing if null is returned for a URI with percent-encoded characters in the scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEncodedSSP0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let str = 'aa'
      const uriObj3 = new uri.URI(str);
      expect(uriObj3.scheme).assertEqual(null);
      expect(uriObj3.userInfo).assertEqual(null);
      expect(uriObj3.host).assertEqual(null);
      expect(uriObj3.port).assertEqual("-1");
      expect(uriObj3.path).assertEqual("aa");
      expect(uriObj3.query).assertEqual(null);
      expect(uriObj3.fragment).assertEqual(null);
      expect(uriObj3.authority).assertEqual(null);
      expect(uriObj3.ssp).assertEqual("");
      expect(uriObj3.encodedUserInfo).assertEqual(null);
      expect(uriObj3.encodedPath).assertEqual("aa");
      expect(uriObj3.encodedQuery).assertEqual(null);
      expect(uriObj3.encodedFragment).assertEqual(null);
      expect(uriObj3.encodedAuthority).assertEqual(null);
      expect(uriObj3.encodedSSP).assertEqual("");
    });

  })
}