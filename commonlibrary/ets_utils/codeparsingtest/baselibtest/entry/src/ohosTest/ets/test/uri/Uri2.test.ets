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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import uri from '@ohos.uri';

export default function uri2Test() {
  describe('uri2Test', () => {


    /**
     * @tc.name   testequalsWithEmptyScheme001
     * @tc.number SUB_COMMONLIBRARY_URI_equals_PARAM_EMPTY_SCHEME_0100
     * @tc.desc   equals 401 error test with empty scheme property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testequalsWithEmptyScheme001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testequalsWithEmptyScheme001';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        const uri2 = new uri.URI('http://www.test.com/path');
        uri2.scheme = '';
        let result = uri1.equals(uri2);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testequalsWithEmptyUserInfo002
     * @tc.number SUB_COMMONLIBRARY_URI_equals_PARAM_EMPTY_USERINFO_0200
     * @tc.desc   equals test with empty userInfo property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testequalsWithEmptyUserInfo002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testequalsWithEmptyUserInfo002';
      try {
        const uri1 = new uri.URI('https://user@www.test.com/path');
        const uri2 = new uri.URI('https://@www.test.com/path');
        let result = uri1.equals(uri2);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testequalsWithEmptyHost003
     * @tc.number SUB_COMMONLIBRARY_URI_equals_PARAM_EMPTY_HOST_0300
     * @tc.desc   equals test with empty host property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testequalsWithEmptyHost003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testequalsWithEmptyHost003';
      try {
        const uri1 = new uri.URI('file:///path/to/file');
        const uri2 = new uri.URI('file:///path/to/file');
        let result = uri1.equals(uri2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testequalsWithEmptyPort004
     * @tc.number SUB_COMMONLIBRARY_URI_equals_PARAM_EMPTY_PORT_0400
     * @tc.desc   equals test with empty port property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testequalsWithEmptyPort004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testequalsWithEmptyPort004';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        const uri2 = new uri.URI('https://www.test.com:80/path');
        let result = uri1.equals(uri2);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testequalsWithEmptyPath005
     * @tc.number SUB_COMMONLIBRARY_URI_equals_PARAM_EMPTY_PATH_0500
     * @tc.desc   equals test with empty path property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testequalsWithEmptyPath005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testequalsWithEmptyPath005';
      try {
        const uri1 = new uri.URI('https://www.test.com');
        const uri2 = new uri.URI('https://www.test.com/');
        let result = uri1.equals(uri2);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testequalsWithEmptyQuery006
     * @tc.number SUB_COMMONLIBRARY_URI_equals_PARAM_EMPTY_QUERY_0600
     * @tc.desc   equals test with empty query property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testequalsWithEmptyQuery006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testequalsWithEmptyQuery006';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        const uri2 = new uri.URI('https://www.test.com/path?');
        let result = uri1.equals(uri2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testequalsWithEmptyFragment007
     * @tc.number SUB_COMMONLIBRARY_URI_equals_PARAM_EMPTY_FRAGMENT_0700
     * @tc.desc   equals test with empty fragment property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testequalsWithEmptyFragment007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testequalsWithEmptyFragment007';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        const uri2 = new uri.URI('https://www.test.com/path#');
        let result = uri1.equals(uri2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testequalsWithEmptyAuthority008
     * @tc.number SUB_COMMONLIBRARY_URI_equals_PARAM_EMPTY_AUTHORITY_0800
     * @tc.desc   equals test with empty authority property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testequalsWithEmptyAuthority008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testequalsWithEmptyAuthority008';
      try {
        const uri1 = new uri.URI('file:///path/to/file');
        const uri2 = new uri.URI('file:///path/to/file');
        let result = uri1.equals(uri2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testequalsWithEmptySsp009
     * @tc.number SUB_COMMONLIBRARY_URI_equals_PARAM_EMPTY_SSP_0900
     * @tc.desc   equals test with empty ssp property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testequalsWithEmptySsp009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testequalsWithEmptySsp009';
      try {
        const uri1 = new uri.URI('mailto:');
        const uri2 = new uri.URI('mailto:');
        let result = uri1.equals(uri2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testequalsWithEmptyEncodedUserInfo010
     * @tc.number SUB_COMMONLIBRARY_URI_equals_PARAM_EMPTY_ENCODEDUSERINFO_1000
     * @tc.desc   equals test with empty encodedUserInfo property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testequalsWithEmptyEncodedUserInfo010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testequalsWithEmptyEncodedUserInfo010';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        const uri2 = new uri.URI('https://www.test.com/path');
        let result = uri1.equals(uri2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testequalsWithEmptyEncodedPath011
     * @tc.number SUB_COMMONLIBRARY_URI_equals_PARAM_EMPTY_ENCODEDPATH_1100
     * @tc.desc   equals test with empty encodedPath property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testequalsWithEmptyEncodedPath011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testequalsWithEmptyEncodedPath011';
      try {
        const uri1 = new uri.URI('https://www.test.com');
        const uri2 = new uri.URI('https://www.test.com');
        let result = uri1.equals(uri2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testequalsWithEmptyEncodedQuery012
     * @tc.number SUB_COMMONLIBRARY_URI_equals_PARAM_EMPTY_ENCODEDQUERY_1200
     * @tc.desc   equals test with empty encodedQuery property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testequalsWithEmptyEncodedQuery012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testequalsWithEmptyEncodedQuery012';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        const uri2 = new uri.URI('https://www.test.com/path');
        let result = uri1.equals(uri2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testequalsWithEmptyEncodedFragment013
     * @tc.number SUB_COMMONLIBRARY_URI_equals_PARAM_EMPTY_ENCODEDFRAGMENT_1300
     * @tc.desc   equals test with empty encodedFragment property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testequalsWithEmptyEncodedFragment013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testequalsWithEmptyEncodedFragment013';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        const uri2 = new uri.URI('https://www.test.com/path');
        let result = uri1.equals(uri2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testequalsWithEmptyEncodedAuthority014
     * @tc.number SUB_COMMONLIBRARY_URI_equals_PARAM_EMPTY_ENCODEDAUTHORITY_1400
     * @tc.desc   equals test with empty encodedAuthority property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testequalsWithEmptyEncodedAuthority014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testequalsWithEmptyEncodedAuthority014';
      try {
        const uri1 = new uri.URI('file:///path');
        const uri2 = new uri.URI('file:///path');
        let result = uri1.equals(uri2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testequalsWithEmptyEncodedSSP015
     * @tc.number SUB_COMMONLIBRARY_URI_equals_PARAM_EMPTY_ENCODEDSSP_1500
     * @tc.desc   equals test with empty encodedSSP property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testequalsWithEmptyEncodedSSP015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testequalsWithEmptyEncodedSSP015';
      try {
        const uri1 = new uri.URI('mailto:');
        const uri2 = new uri.URI('mailto:');
        let result = uri1.equals(uri2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testequalsWithNullParam016
     * @tc.number SUB_COMMONLIBRARY_URI_equals_PARAM_NULL_1600
     * @tc.desc   equals 401 error test with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testequalsWithNullParam016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testequalsWithNullParam016';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        let result = uri1.equals(null);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("Cannot read property uricalss of null");
      }
    });

    /**
     * @tc.name   testequalsWithUndefinedParam017
     * @tc.number SUB_COMMONLIBRARY_URI_equals_PARAM_UNDEFINED_1700
     * @tc.desc   equals 401 error test with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testequalsWithUndefinedParam017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testequalsWithUndefinedParam017';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        let result = uri1.equals(undefined);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect(err.message).assertEqual("Cannot read property uricalss of undefined");
      }
    });
    /**
     * @tc.name   testEqualsToWithEmptyScheme001
     * @tc.number SUB_COMMONLIBRARY_URI_EQUALSTO_PARAM_EMPTY_SCHEME_0100
     * @tc.desc   equalsTo 401 error test with empty scheme property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEqualsToWithEmptyScheme001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testEqualsToWithEmptyScheme001';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        const uri2 = new uri.URI('http://www.test.com/path');
        uri2.scheme = '';
        let result = uri1.equalsTo(uri2);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testEqualsToWithEmptyUserInfo002
     * @tc.number SUB_COMMONLIBRARY_URI_EQUALSTO_PARAM_EMPTY_USERINFO_0200
     * @tc.desc   equalsTo test with empty userInfo property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEqualsToWithEmptyUserInfo002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testEqualsToWithEmptyUserInfo002';
      try {
        const uri1 = new uri.URI('https://user@www.test.com/path');
        const uri2 = new uri.URI('https://@www.test.com/path');
        let result = uri1.equalsTo(uri2);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testEqualsToWithEmptyHost003
     * @tc.number SUB_COMMONLIBRARY_URI_EQUALSTO_PARAM_EMPTY_HOST_0300
     * @tc.desc   equalsTo test with empty host property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEqualsToWithEmptyHost003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testEqualsToWithEmptyHost003';
      try {
        const uri1 = new uri.URI('file:///path/to/file');
        const uri2 = new uri.URI('file:///path/to/file');
        let result = uri1.equalsTo(uri2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testEqualsToWithEmptyPort004
     * @tc.number SUB_COMMONLIBRARY_URI_EQUALSTO_PARAM_EMPTY_PORT_0400
     * @tc.desc   equalsTo test with empty port property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEqualsToWithEmptyPort004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testEqualsToWithEmptyPort004';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        const uri2 = new uri.URI('https://www.test.com:80/path');
        let result = uri1.equalsTo(uri2);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testEqualsToWithEmptyPath005
     * @tc.number SUB_COMMONLIBRARY_URI_EQUALSTO_PARAM_EMPTY_PATH_0500
     * @tc.desc   equalsTo test with empty path property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEqualsToWithEmptyPath005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testEqualsToWithEmptyPath005';
      try {
        const uri1 = new uri.URI('https://www.test.com');
        const uri2 = new uri.URI('https://www.test.com/');
        let result = uri1.equalsTo(uri2);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testEqualsToWithEmptyQuery006
     * @tc.number SUB_COMMONLIBRARY_URI_EQUALSTO_PARAM_EMPTY_QUERY_0600
     * @tc.desc   equalsTo test with empty query property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEqualsToWithEmptyQuery006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testEqualsToWithEmptyQuery006';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        const uri2 = new uri.URI('https://www.test.com/path?');
        let result = uri1.equalsTo(uri2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testEqualsToWithEmptyFragment007
     * @tc.number SUB_COMMONLIBRARY_URI_EQUALSTO_PARAM_EMPTY_FRAGMENT_0700
     * @tc.desc   equalsTo test with empty fragment property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEqualsToWithEmptyFragment007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testEqualsToWithEmptyFragment007';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        const uri2 = new uri.URI('https://www.test.com/path#');
        let result = uri1.equalsTo(uri2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testEqualsToWithEmptyAuthority008
     * @tc.number SUB_COMMONLIBRARY_URI_EQUALSTO_PARAM_EMPTY_AUTHORITY_0800
     * @tc.desc   equalsTo test with empty authority property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEqualsToWithEmptyAuthority008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testEqualsToWithEmptyAuthority008';
      try {
        const uri1 = new uri.URI('file:///path/to/file');
        const uri2 = new uri.URI('file:///path/to/file');
        let result = uri1.equalsTo(uri2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testEqualsToWithEmptySsp009
     * @tc.number SUB_COMMONLIBRARY_URI_EQUALSTO_PARAM_EMPTY_SSP_0900
     * @tc.desc   equalsTo test with empty ssp property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEqualsToWithEmptySsp009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testEqualsToWithEmptySsp009';
      try {
        const uri1 = new uri.URI('mailto:');
        const uri2 = new uri.URI('mailto:');
        let result = uri1.equalsTo(uri2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testEqualsToWithEmptyEncodedUserInfo010
     * @tc.number SUB_COMMONLIBRARY_URI_EQUALSTO_PARAM_EMPTY_ENCODEDUSERINFO_1000
     * @tc.desc   equalsTo test with empty encodedUserInfo property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEqualsToWithEmptyEncodedUserInfo010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testEqualsToWithEmptyEncodedUserInfo010';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        const uri2 = new uri.URI('https://www.test.com/path');
        let result = uri1.equalsTo(uri2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testEqualsToWithEmptyEncodedPath011
     * @tc.number SUB_COMMONLIBRARY_URI_EQUALSTO_PARAM_EMPTY_ENCODEDPATH_1100
     * @tc.desc   equalsTo test with empty encodedPath property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEqualsToWithEmptyEncodedPath011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testEqualsToWithEmptyEncodedPath011';
      try {
        const uri1 = new uri.URI('https://www.test.com');
        const uri2 = new uri.URI('https://www.test.com');
        let result = uri1.equalsTo(uri2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testEqualsToWithEmptyEncodedQuery012
     * @tc.number SUB_COMMONLIBRARY_URI_EQUALSTO_PARAM_EMPTY_ENCODEDQUERY_1200
     * @tc.desc   equalsTo test with empty encodedQuery property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEqualsToWithEmptyEncodedQuery012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testEqualsToWithEmptyEncodedQuery012';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        const uri2 = new uri.URI('https://www.test.com/path');
        let result = uri1.equalsTo(uri2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testEqualsToWithEmptyEncodedFragment013
     * @tc.number SUB_COMMONLIBRARY_URI_EQUALSTO_PARAM_EMPTY_ENCODEDFRAGMENT_1300
     * @tc.desc   equalsTo test with empty encodedFragment property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEqualsToWithEmptyEncodedFragment013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testEqualsToWithEmptyEncodedFragment013';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        const uri2 = new uri.URI('https://www.test.com/path');
        let result = uri1.equalsTo(uri2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testEqualsToWithEmptyEncodedAuthority014
     * @tc.number SUB_COMMONLIBRARY_URI_EQUALSTO_PARAM_EMPTY_ENCODEDAUTHORITY_1400
     * @tc.desc   equalsTo test with empty encodedAuthority property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEqualsToWithEmptyEncodedAuthority014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testEqualsToWithEmptyEncodedAuthority014';
      try {
        const uri1 = new uri.URI('file:///path');
        const uri2 = new uri.URI('file:///path');
        let result = uri1.equalsTo(uri2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testEqualsToWithEmptyEncodedSSP015
     * @tc.number SUB_COMMONLIBRARY_URI_EQUALSTO_PARAM_EMPTY_ENCODEDSSP_1500
     * @tc.desc   equalsTo test with empty encodedSSP property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEqualsToWithEmptyEncodedSSP015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testEqualsToWithEmptyEncodedSSP015';
      try {
        const uri1 = new uri.URI('mailto:');
        const uri2 = new uri.URI('mailto:');
        let result = uri1.equalsTo(uri2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testEqualsToWithNullParam016
     * @tc.number SUB_COMMONLIBRARY_URI_EQUALSTO_PARAM_NULL_1600
     * @tc.desc   equalsTo 401 error test with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEqualsToWithNullParam016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testEqualsToWithNullParam016';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        let result = uri1.equalsTo(null);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testEqualsToWithUndefinedParam017
     * @tc.number SUB_COMMONLIBRARY_URI_EQUALSTO_PARAM_UNDEFINED_1700
     * @tc.desc   equalsTo 401 error test with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testEqualsToWithUndefinedParam017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testEqualsToWithUndefinedParam017';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        let result = uri1.equalsTo(undefined);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testGetQueryValueWithEmptyString001
     * @tc.number SUB_COMMONLIBRARY_URI_GETQUERYVALUE_PARAM_EMPTY_STRING_0100
     * @tc.desc   getQueryValue test with empty string parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testGetQueryValueWithEmptyString001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testGetQueryValueWithEmptyString001';
      try {
        const uri1 = new uri.URI('https://www.test.com?key=value');
        let result = uri1.getQueryValue('');
        expect(result).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetQueryValueWithNullParam002
     * @tc.number SUB_COMMONLIBRARY_URI_GETQUERYVALUE_PARAM_NULL_0200
     * @tc.desc   getQueryValue 401 error test with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testGetQueryValueWithNullParam002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testGetQueryValueWithNullParam002';
      try {
        const uri1 = new uri.URI('https://www.test.com?key=value');
        let result = uri1.getQueryValue(null);
        expect(result).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testGetQueryValueWithUndefinedParam003
     * @tc.number SUB_COMMONLIBRARY_URI_GETQUERYVALUE_PARAM_UNDEFINED_0300
     * @tc.desc   getQueryValue 401 error test with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testGetQueryValueWithUndefinedParam003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testGetQueryValueWithUndefinedParam003';
      try {
        const uri1 = new uri.URI('https://www.test.com?key=value');
        let result = uri1.getQueryValue(undefined);
        expect(result).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testAddQueryValueWithEmptyKey001
     * @tc.number SUB_COMMONLIBRARY_URI_ADDQUERYVALUE_PARAM_EMPTY_KEY_0100
     * @tc.desc   addQueryValue test with empty key parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testAddQueryValueWithEmptyKey001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testAddQueryValueWithEmptyKey001';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        const newUri = uri1.addQueryValue('', 'value');
        expect(newUri.toString()).assertContain('?=value');
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testAddQueryValueWithNullKey002
     * @tc.number SUB_COMMONLIBRARY_URI_ADDQUERYVALUE_PARAM_NULL_KEY_0200
     * @tc.desc   addQueryValue 401 error test with null key parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testAddQueryValueWithNullKey002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testAddQueryValueWithNullKey002';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        const newUri = uri1.addQueryValue(null, 'value');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testAddQueryValueWithUndefinedKey003
     * @tc.number SUB_COMMONLIBRARY_URI_ADDQUERYVALUE_PARAM_UNDEFINED_KEY_0300
     * @tc.desc   addQueryValue 401 error test with undefined key parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testAddQueryValueWithUndefinedKey003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testAddQueryValueWithUndefinedKey003';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        const newUri = uri1.addQueryValue(undefined, 'value');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testAddQueryValueWithEmptyValue004
     * @tc.number SUB_COMMONLIBRARY_URI_ADDQUERYVALUE_PARAM_EMPTY_VALUE_0400
     * @tc.desc   addQueryValue test with empty value parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testAddQueryValueWithEmptyValue004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testAddQueryValueWithEmptyValue004';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        const newUri = uri1.addQueryValue('key', '');
        expect(newUri.toString()).assertContain('key=');
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testAddQueryValueWithNullValue005
     * @tc.number SUB_COMMONLIBRARY_URI_ADDQUERYVALUE_PARAM_NULL_VALUE_0500
     * @tc.desc   addQueryValue 401 error test with null value parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testAddQueryValueWithNullValue005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testAddQueryValueWithNullValue005';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        const newUri = uri1.addQueryValue('key', null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testAddQueryValueWithUndefinedValue006
     * @tc.number SUB_COMMONLIBRARY_URI_ADDQUERYVALUE_PARAM_UNDEFINED_VALUE_0600
     * @tc.desc   addQueryValue 401 error test with undefined value parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testAddQueryValueWithUndefinedValue006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testAddQueryValueWithUndefinedValue006';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        const newUri = uri1.addQueryValue('key', undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testGetQueryValuesWithEmptyString001
     * @tc.number SUB_COMMONLIBRARY_URI_GETQUERYVALUES_PARAM_EMPTY_STRING_0100
     * @tc.desc   getQueryValues test with empty string parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testGetQueryValuesWithEmptyString001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testGetQueryValuesWithEmptyString001';
      try {
        const uri1 = new uri.URI('https://www.test.com?key=value');
        let result = uri1.getQueryValues('');
        expect(result.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetQueryValuesWithNullParam002
     * @tc.number SUB_COMMONLIBRARY_URI_GETQUERYVALUES_PARAM_NULL_0200
     * @tc.desc   getQueryValues 401 error test with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testGetQueryValuesWithNullParam002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testGetQueryValuesWithNullParam002';
      try {
        const uri1 = new uri.URI('https://www.test.com?key=value');
        let result = uri1.getQueryValues(null);
        expect(result.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testGetQueryValuesWithUndefinedParam003
     * @tc.number SUB_COMMONLIBRARY_URI_GETQUERYVALUES_PARAM_UNDEFINED_0300
     * @tc.desc   getQueryValues 401 error test with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testGetQueryValuesWithUndefinedParam003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testGetQueryValuesWithUndefinedParam003';
      try {
        const uri1 = new uri.URI('https://www.test.com?key=value');
        let result = uri1.getQueryValues(undefined);
        expect(result.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testGetBooleanQueryValueWithEmptyString001
     * @tc.number SUB_COMMONLIBRARY_URI_GETBOOLEANQUERYVALUE_PARAM_EMPTY_STRING_0100
     * @tc.desc   getBooleanQueryValue test with empty string parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testGetBooleanQueryValueWithEmptyString001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testGetBooleanQueryValueWithEmptyString001';
      try {
        const uri1 = new uri.URI('https://www.test.com?active=true');
        let result = uri1.getBooleanQueryValue('', false);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetBooleanQueryValueWithNullParam002
     * @tc.number SUB_COMMONLIBRARY_URI_GETBOOLEANQUERYVALUE_PARAM_NULL_0200
     * @tc.desc   getBooleanQueryValue 401 error test with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testGetBooleanQueryValueWithNullParam002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testGetBooleanQueryValueWithNullParam002';
      try {
        const uri1 = new uri.URI('https://www.test.com?active=true');
        let result = uri1.getBooleanQueryValue(null, false);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testGetBooleanQueryValueWithUndefinedParam003
     * @tc.number SUB_COMMONLIBRARY_URI_GETBOOLEANQUERYVALUE_PARAM_UNDEFINED_0300
     * @tc.desc   getBooleanQueryValue 401 error test with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testGetBooleanQueryValueWithUndefinedParam003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testGetBooleanQueryValueWithUndefinedParam003';
      try {
        const uri1 = new uri.URI('https://www.test.com?active=true');
        let result = uri1.getBooleanQueryValue(undefined, false);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testAddSegmentWithEmptyString001
     * @tc.number SUB_COMMONLIBRARY_URI_ADDSEGMENT_PARAM_EMPTY_STRING_0100
     * @tc.desc   addSegment test with empty string parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testAddSegmentWithEmptyString001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testAddSegmentWithEmptyString001';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        const newUri = uri1.addSegment('');
        expect(newUri.path).assertEqual('/path/');
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testAddSegmentWithNullParam002
     * @tc.number SUB_COMMONLIBRARY_URI_ADDSEGMENT_PARAM_NULL_0200
     * @tc.desc   addSegment 401 error test with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testAddSegmentWithNullParam002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testAddSegmentWithNullParam002';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        const newUri = uri1.addSegment(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testAddSegmentWithUndefinedParam003
     * @tc.number SUB_COMMONLIBRARY_URI_ADDSEGMENT_PARAM_UNDEFINED_0300
     * @tc.desc   addSegment 401 error test with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testAddSegmentWithUndefinedParam003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testAddSegmentWithUndefinedParam003';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        const newUri = uri1.addSegment(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testAddEncodedSegmentWithEmptyString001
     * @tc.number SUB_COMMONLIBRARY_URI_ADDENCODEDSEGMENT_PARAM_EMPTY_STRING_0100
     * @tc.desc   addEncodedSegment test with empty string parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testAddEncodedSegmentWithEmptyString001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testAddEncodedSegmentWithEmptyString001';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        const newUri = uri1.addEncodedSegment('');
        expect(newUri.path).assertEqual('/path/');
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testAddEncodedSegmentWithNullParam002
     * @tc.number SUB_COMMONLIBRARY_URI_ADDENCODEDSEGMENT_PARAM_NULL_0200
     * @tc.desc   addEncodedSegment 401 error test with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testAddEncodedSegmentWithNullParam002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testAddEncodedSegmentWithNullParam002';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        const newUri = uri1.addEncodedSegment(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testAddEncodedSegmentWithUndefinedParam003
     * @tc.number SUB_COMMONLIBRARY_URI_ADDENCODEDSEGMENT_PARAM_UNDEFINED_0300
     * @tc.desc   addEncodedSegment 401 error test with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testAddEncodedSegmentWithUndefinedParam003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testAddEncodedSegmentWithUndefinedParam003';
      try {
        const uri1 = new uri.URI('https://www.test.com/path');
        const newUri = uri1.addEncodedSegment(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testCreateFromPartsWithEmptyScheme001
     * @tc.number SUB_COMMONLIBRARY_URI_CREATEFROMPARTS_PARAM_EMPTY_SCHEME_0100
     * @tc.desc   createFromParts test with empty scheme parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCreateFromPartsWithEmptyScheme001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testCreateFromPartsWithEmptyScheme001';
      try {
        const uri1 = uri.URI.createFromParts('', 'ssp', 'fragment');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.name   testCreateFromPartsWithNullScheme002
     * @tc.number SUB_COMMONLIBRARY_URI_CREATEFROMPARTS_PARAM_NULL_SCHEME_0200
     * @tc.desc   createFromParts 401 error test with null scheme parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCreateFromPartsWithNullScheme002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testCreateFromPartsWithNullScheme002';
      try {
        const uri1 = uri.URI.createFromParts(null, 'ssp', 'fragment');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testCreateFromPartsWithUndefinedScheme003
     * @tc.number SUB_COMMONLIBRARY_URI_CREATEFROMPARTS_PARAM_UNDEFINED_SCHEME_0300
     * @tc.desc   createFromParts 401 error test with undefined scheme parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCreateFromPartsWithUndefinedScheme003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testCreateFromPartsWithUndefinedScheme003';
      try {
        const uri1 = uri.URI.createFromParts(undefined, 'ssp', 'fragment');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testCreateFromPartsWithEmptySsp004
     * @tc.number SUB_COMMONLIBRARY_URI_CREATEFROMPARTS_PARAM_EMPTY_SSP_0400
     * @tc.desc   createFromParts test with empty ssp parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCreateFromPartsWithEmptySsp004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testCreateFromPartsWithEmptySsp004';
      try {
        const uri1 = uri.URI.createFromParts('http', '', 'fragment');
        expect(uri1.ssp).assertEqual('');
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateFromPartsWithNullSsp005
     * @tc.number SUB_COMMONLIBRARY_URI_CREATEFROMPARTS_PARAM_NULL_SSP_0500
     * @tc.desc   createFromParts 401 error test with null ssp parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCreateFromPartsWithNullSsp005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testCreateFromPartsWithNullSsp005';
      try {
        const uri1 = uri.URI.createFromParts('http', null, 'fragment');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testCreateFromPartsWithUndefinedSsp006
     * @tc.number SUB_COMMONLIBRARY_URI_CREATEFROMPARTS_PARAM_UNDEFINED_SSP_0600
     * @tc.desc   createFromParts 401 error test with undefined ssp parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCreateFromPartsWithUndefinedSsp006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testCreateFromPartsWithUndefinedSsp006';
      try {
        const uri1 = uri.URI.createFromParts('http', undefined, 'fragment');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testCreateFromPartsWithEmptyFragment007
     * @tc.number SUB_COMMONLIBRARY_URI_CREATEFROMPARTS_PARAM_EMPTY_FRAGMENT_0700
     * @tc.desc   createFromParts test with empty fragment parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCreateFromPartsWithEmptyFragment007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testCreateFromPartsWithEmptyFragment007';
      try {
        const uri1 = uri.URI.createFromParts('http', 'ssp', '');
        expect(uri1.fragment).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testCreateFromPartsWithNullFragment008
     * @tc.number SUB_COMMONLIBRARY_URI_CREATEFROMPARTS_PARAM_NULL_FRAGMENT_0800
     * @tc.desc   createFromParts 401 error test with null fragment parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCreateFromPartsWithNullFragment008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testCreateFromPartsWithNullFragment008';
      try {
        const uri1 = uri.URI.createFromParts('http', 'ssp', null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testCreateFromPartsWithUndefinedFragment009
     * @tc.number SUB_COMMONLIBRARY_URI_CREATEFROMPARTS_PARAM_UNDEFINED_FRAGMENT_0900
     * @tc.desc   createFromParts 401 error test with undefined fragment parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCreateFromPartsWithUndefinedFragment009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG = 'testCreateFromPartsWithUndefinedFragment009';
      try {
        const uri1 = uri.URI.createFromParts('http', 'ssp', undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
      }
    });

  });
}
