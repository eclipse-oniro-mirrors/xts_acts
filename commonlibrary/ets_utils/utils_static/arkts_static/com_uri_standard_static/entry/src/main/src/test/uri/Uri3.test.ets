/*
* Copyright (c) 2024-2026 SwanLink (Jiangsu) Technology Development Co., LTD.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with License.
* You may obtain a copy of License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import {
  describe, expect, it, Level, Size, TestType
} from '../../../../hypium/index';
import uri from '@ohos.uri';
import { BusinessError } from '@ohos.base';

export default function uriPropertiesTest() {
  describe('uriPropertiesTest', (): void => {

    /**
     * @tc.name   testGetScheme001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_8000
     * @tc.desc   Test get scheme property with a URI that has a scheme
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetScheme001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      let result: string | null = uriObj.scheme;
      expect(result).assertEqual('https');
    });

    /**
     * @tc.name   testGetScheme002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_8100
     * @tc.desc   Test get scheme property with a URI that does not have a scheme
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetScheme002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('/images/pic.jpg');
      let result: string | null = uriObj.scheme;
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   testGetScheme003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_8200
     * @tc.desc   Test get scheme property with ftp scheme
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetScheme003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('ftp://ftp.aaa.bbb.ccc/dddd/eee.txt');
      let result: string | null = uriObj.scheme;
      expect(result).assertEqual('ftp');
    });

    /**
     * @tc.name   testGetUserInfo001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_8300
     * @tc.desc   Test get userInfo property with a URI that has userInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUserInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      let result: string | null = uriObj.userInfo;
      expect(result).assertEqual('username:password');
    });

    /**
     * @tc.name   testGetUserInfo002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_8400
     * @tc.desc   Test get userInfo property with a URI that does not have userInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUserInfo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('ftp://ftp.aaa.bbb.ccc/dddd/eee.txt');
      let result: string | null = uriObj.userInfo;
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   testGetUserInfo003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_8500
     * @tc.desc   Test get userInfo property with username only (no password)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUserInfo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://username@host:8080/directory/file?foo=1&bar=2#fragment');
      let result: string | null = uriObj.userInfo;
      expect(result).assertEqual('username');
    });

    /**
     * @tc.name   testGetHost001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_8600
     * @tc.desc   Test get host property with a URI that has a host
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetHost001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      let result: string | null = uriObj.host;
      expect(result).assertEqual('host');
    });

    /**
     * @tc.name   testGetHost002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_8700
     * @tc.desc   Test get host property with a URI that does not have a host
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetHost002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('/images/pic.jpg');
      let result: string | null = uriObj.host;
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   testGetHost003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_8800
     * @tc.desc   Test get host property with a complex host
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetHost003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('ftp://ftp.aaa.bbb.ccc/dddd/eee.txt');
      let result: string | null = uriObj.host;
      expect(result).assertEqual('ftp.aaa.bbb.ccc');
    });

    /**
     * @tc.name   testGetPort001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_8900
     * @tc.desc   Test get port property with a URI that has a port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetPort001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      let result: string = uriObj.port;
      expect(result).assertEqual('8080');
    });

    /**
     * @tc.name   testGetPort002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_9000
     * @tc.desc   Test get port property with a URI that does not have a port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetPort002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('ftp://ftp.aaa.bbb.ccc/dddd/eee.txt');
      let result: string = uriObj.port;
      expect(result).assertEqual('-1');
    });

    /**
     * @tc.name   testGetPort003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_9100
     * @tc.desc   Test get port property with a relative URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetPort003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('/images/pic.jpg');
      let result: string = uriObj.port;
      expect(result).assertEqual('-1');
    });

    /**
     * @tc.name   testGetPath001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_9200
     * @tc.desc   Test get path property with a URI that has a path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetPath001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      let result: string | null = uriObj.path;
      expect(result).assertEqual('/directory/file');
    });

    /**
     * @tc.name   testGetPath002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_9300
     * @tc.desc   Test get path property with a URI that does not have a path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetPath002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('mailto:user@example.com');
      let result: string | null = uriObj.path;
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   testGetPath003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_9400
     * @tc.desc   Test get path property with a relative path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetPath003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('/images/pic.jpg');
      let result: string | null = uriObj.path;
      expect(result).assertEqual('/images/pic.jpg');
    });

    /**
     * @tc.name   testGetQuery001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_9500
     * @tc.desc   Test get query property with a URI that has a query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetQuery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      let result: string | null = uriObj.query;
      expect(result).assertEqual('foo=1&bar=2');
    });

    /**
     * @tc.name   testGetQuery002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_9600
     * @tc.desc   Test get query property with a URI that does not have a query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetQuery002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('ftp://ftp.aaa.bbb.ccc/dddd/eee.txt');
      let result: string | null = uriObj.query;
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   testGetQuery003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_9700
     * @tc.desc   Test get query property with encoded characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetQuery003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://username:my+name@host:8080/directory/my+file?foo=1&bar=2#fragment');
      let result: string | null = uriObj.query;
      expect(result).assertEqual('foo=1&bar=2');
    });

    /**
     * @tc.name   testGetFragment001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_9800
     * @tc.desc   Test get fragment property with a URI that has a fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetFragment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      let result: string | null = uriObj.fragment;
      expect(result).assertEqual('fragment');
    });

    /**
     * @tc.name   testGetFragment002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_9900
     * @tc.desc   Test get fragment property with a URI that does not have a fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetFragment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('ftp://ftp.aaa.bbb.ccc/dddd/eee.txt');
      let result: string | null = uriObj.fragment;
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   testGetFragment003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_10000
     * @tc.desc   Test get fragment property with gopher URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetFragment003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI =
        new uri.URI('gopher://spinaltap.micro.umn.edu/00/Weather/California/Los%20Angeles#fragment');
      let result: string | null = uriObj.fragment;
      expect(result).assertEqual('fragment');
    });

    /**
     * @tc.name   testGetAuthority001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_10100
     * @tc.desc   Test get authority property with a URI that has authority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetAuthority001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      let result: string | null = uriObj.authority;
      expect(result).assertEqual('username:password@host:8080');
    });

    /**
     * @tc.name   testGetAuthority002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_10200
     * @tc.desc   Test get authority property with a URI that does not have authority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetAuthority002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('/images/pic.jpg');
      let result: string | null = uriObj.authority;
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   testGetAuthority003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_10300
     * @tc.desc   Test get authority property with datashare URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetAuthority003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('datashare:///com.samples.datasharetest.DataShare/DB00/TBL00');
      let result: string | null = uriObj.authority;
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   testGetSSP001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_10400
     * @tc.desc   Test get ssp property with a URI that has scheme-specific part
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetSSP001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      let result: string = uriObj.ssp;
      expect(result).assertEqual('//username:password@host:8080/directory/file?foo=1&bar=2');
    });

    /**
     * @tc.name   testGetSSP002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_10500
     * @tc.desc   Test get ssp property with a relative URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetSSP002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('/images/pic.jpg');
      let result: string = uriObj.ssp;
      expect(result).assertEqual('');
    });

    /**
     * @tc.name   testGetSSP003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_10600
     * @tc.desc   Test get ssp property with mailto URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetSSP003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('mailto:user@example.com');
      let result: string = uriObj.ssp;
      expect(result).assertEqual('user@example.com');
    });

    /**
     * @tc.name   testGetEncodedUserInfo001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_10700
     * @tc.desc   Test get encodedUserInfo property with a URI that has userInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEncodedUserInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      let result: string | null = uriObj.encodedUserInfo;
      expect(result).assertEqual('username:password');
    });

    /**
     * @tc.name   testGetEncodedUserInfo002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_10800
     * @tc.desc   Test get encodedUserInfo property with a URI that does not have userInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEncodedUserInfo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('ftp://ftp.aaa.bbb.ccc/dddd/eee.txt');
      let result: string | null = uriObj.encodedUserInfo;
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   testGetEncodedUserInfo003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_10900
     * @tc.desc   Test get encodedUserInfo property with encoded characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEncodedUserInfo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://username:my+name@host:8080/directory/my+file?foo=1&bar=2#fragment');
      let result: string | null = uriObj.encodedUserInfo;
      expect(result).assertEqual('username:my+name');
    });

    /**
     * @tc.name   testGetEncodedPath001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_11000
     * @tc.desc   Test get encodedPath property with a URI that has a path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEncodedPath001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      let result: string | null = uriObj.encodedPath;
      expect(result).assertEqual('/directory/file');
    });

    /**
     * @tc.name   testGetEncodedPath002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_11100
     * @tc.desc   Test get encodedPath property with a URI that does not have a path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEncodedPath002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('mailto:user@example.com');
      let result: string | null = uriObj.encodedPath;
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   testGetEncodedPath003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_11200
     * @tc.desc   Test get encodedPath property with encoded characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEncodedPath003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://username:my+name@host:8080/directory/my+file?foo=1&bar=2#fragment');
      let result: string | null = uriObj.encodedPath;
      expect(result).assertEqual('/directory/my+file');
    });

    /**
     * @tc.name   testGetEncodedQuery001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_11300
     * @tc.desc   Test get encodedQuery property with a URI that has a query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEncodedQuery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      let result: string | null = uriObj.encodedQuery;
      expect(result).assertEqual('foo=1&bar=2');
    });

    /**
     * @tc.name   testGetEncodedQuery002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_11400
     * @tc.desc   Test get encodedQuery property with a URI that does not have a query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEncodedQuery002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('ftp://ftp.aaa.bbb.ccc/dddd/eee.txt');
      let result: string | null = uriObj.encodedQuery;
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   testGetEncodedQuery003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_11500
     * @tc.desc   Test get encodedQuery property with gopher URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEncodedQuery003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI =
        new uri.URI('gopher://spinaltap.micro.umn.edu/00/Weather/California/Los%20Angeles#fragment');
      let result: string | null = uriObj.encodedQuery;
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   testGetEncodedFragment001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_11600
     * @tc.desc   Test get encodedFragment property with a URI that has a fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEncodedFragment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      let result: string | null = uriObj.encodedFragment;
      expect(result).assertEqual('fragment');
    });

    /**
     * @tc.name   testGetEncodedFragment002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_11700
     * @tc.desc   Test get encodedFragment property with a URI that does not have a fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEncodedFragment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('ftp://ftp.aaa.bbb.ccc/dddd/eee.txt');
      let result: string | null = uriObj.encodedFragment;
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   testGetEncodedFragment003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_11800
     * @tc.desc   Test get encodedFragment property with gopher URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEncodedFragment003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI =
        new uri.URI('gopher://spinaltap.micro.umn.edu/00/Weather/California/Los%20Angeles#fragment');
      let result: string | null = uriObj.encodedFragment;
      expect(result).assertEqual('fragment');
    });

    /**
     * @tc.name   testGetEncodedAuthority001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_11900
     * @tc.desc   Test get encodedAuthority property with a URI that has authority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEncodedAuthority001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      let result: string | null = uriObj.encodedAuthority;
      expect(result).assertEqual('username:password@host:8080');
    });

    /**
     * @tc.name   testGetEncodedAuthority002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_12000
     * @tc.desc   Test get encodedAuthority property with a URI that does not have authority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEncodedAuthority002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('/images/pic.jpg');
      let result: string | null = uriObj.encodedAuthority;
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   testGetEncodedAuthority003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_12100
     * @tc.desc   Test get encodedAuthority property with encoded characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEncodedAuthority003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://username:my+name@host:8080/directory/my+file?foo=1&bar=2#fragment');
      let result: string | null = uriObj.encodedAuthority;
      expect(result).assertEqual('username:my+name@host:8080');
    });

    /**
     * @tc.name   testGetEncodedSSP001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_12200
     * @tc.desc   Test get encodedSSP property with a URI that has scheme-specific part
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEncodedSSP001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      let result: string = uriObj.encodedSSP;
      expect(result).assertEqual('//username:password@host:8080/directory/file?foo=1&bar=2');
    });

    /**
     * @tc.name   testGetEncodedSSP002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_12300
     * @tc.desc   Test get encodedSSP property with a relative URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEncodedSSP002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('/images/pic.jpg');
      let result: string = uriObj.encodedSSP;
      expect(result).assertEqual('');
    });

    /**
     * @tc.name   testGetEncodedSSP003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_12400
     * @tc.desc   Test get encodedSSP property with encoded characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEncodedSSP003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://username:my+name@host:8080/directory/my+file?foo=1&bar=2#fragment');
      let result: string = uriObj.encodedSSP;
      expect(result).assertEqual('//username:my+name@host:8080/directory/my+file?foo=1&bar=2');
    });

    /**
     * @tc.name   testSetScheme001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_12500
     * @tc.desc   Test set scheme property to a valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetScheme001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://example.com/path');
      uriObj.scheme = 'http';
      expect(uriObj.scheme).assertEqual("http");
    });

    /**
     * @tc.name   testSetUserInfo001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_12700
     * @tc.desc   Test set userInfo property to a valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUserInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://example.com/path');
      uriObj.userInfo = 'user:pass';
      expect(uriObj.userInfo).assertEqual("user:pass");
    });

    /**
     * @tc.name   testSetPath001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_12900
     * @tc.desc   Test set path property to a valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetPath001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://example.com/path');
      uriObj.path = '/new/path';
      expect(uriObj.path).assertEqual("/new/path");
    });

    /**
     * @tc.name   testSetQuery001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_13100
     * @tc.desc   Test set query property to a valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetQuery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://example.com/path');
      uriObj.query = 'key=value&foo=bar';
      expect(uriObj.query).assertEqual("key=value&foo=bar");
    });

    /**
     * @tc.name   testSetFragment001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_13300
     * @tc.desc   Test set fragment property to a valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetFragment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://example.com/path');
      uriObj.fragment = 'section';
      expect(uriObj.fragment).assertEqual("section");
    });

    /**
     * @tc.name   testSetAuthority001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_13500
     * @tc.desc   Test set authority property to a valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetAuthority001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://example.com/path');
      uriObj.authority = 'user@host:8080';
      expect(uriObj.authority).assertEqual("user@host:8080");
    });

    /**
     * @tc.name   testSetSSP001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_13700
     * @tc.desc   Test set ssp property to a valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSSP001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://example.com/path');
      try {
        uriObj.ssp = '//host/path?query#fragment';
      } catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(10200002);
      }
    });

    /**
     * @tc.name   testSetEncodedUserInfo001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_13900
     * @tc.desc   Test set encodedUserInfo property to a valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetEncodedUserInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://example.com/path');
      uriObj.encodedUserInfo = 'user%3Apass';
      expect(uriObj.encodedUserInfo).assertEqual("user%3Apass");
    });

    /**
     * @tc.name   testSetEncodedPath001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_14100
     * @tc.desc   Test set encodedPath property to a valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetEncodedPath001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://example.com/path');
      uriObj.encodedPath = '/new%20path';
      expect(uriObj.encodedPath).assertEqual("/new%20path");
    });

    /**
     * @tc.name   testSetEncodedQuery001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_14300
     * @tc.desc   Test set encodedQuery property to a valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetEncodedQuery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://example.com/path');
      uriObj.encodedQuery = 'key%3Dvalue%26foo%3Dbar';
      expect(uriObj.encodedQuery).assertEqual("key%3Dvalue%26foo%3Dbar");
    });

    /**
     * @tc.name   testSetEncodedFragment001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_14500
     * @tc.desc   Test set encodedFragment property to a valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetEncodedFragment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://example.com/path');
      uriObj.encodedFragment = 'section%20details';
      expect(uriObj.encodedFragment).assertEqual("section%20details");
    });

    /**
     * @tc.name   testSetEncodedAuthority001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_14700
     * @tc.desc   Test set encodedAuthority property to a valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetEncodedAuthority001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://example.com/path');
      uriObj.encodedAuthority = 'user%40host%3A8080';
      expect(uriObj.encodedAuthority).assertEqual("user%40host%3A8080");
    });

    /**
     * @tc.name   testSetEncodedSSP001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI3_14900
     * @tc.desc   Test set encodedSSP property to a valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetEncodedSSP001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj: uri.URI = new uri.URI('https://example.com/path');
      uriObj.encodedSSP = '//host%2Fpath%3Fquery%23fragment';
      expect(uriObj.encodedSSP).assertEqual("//host%2Fpath%3Fquery%23fragment");
    });
  });
}
