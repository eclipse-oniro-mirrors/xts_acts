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
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import uri from '@ohos.uri';
import { BusinessError } from '@ohos.base';

export default function uriTest1() {
  describe('uriTest1', (): void => {


    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_0100
     * @tc.name: testUriConstruction001
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=1&bar=2');
      } catch (err: BusinessError) {
        expect(err.code).assertEqual(10200002)
      }
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_0300
     * @tc.name: testUriConstruction003
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let that = new uri.URI('ht/tp://username:pas sword@host:8080/directory/file?foo=1&bar=2');
      } catch (err: BusinessError) {
        expect(err.code).assertEqual(10200002)
      }
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_0400
     * @tc.name: testUriConstruction004
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let that = new uri.URI('http://username:password@[::]:8080/directory/file?Query#gaogao faofao');
      } catch (err: BusinessError) {
        expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string");
        expect(err.code).assertEqual(10200002)
        expect(err.message).assertEqual("Syntax Error. Invalid Uri string");
      }
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_0500
     * @tc.name: testUriConstruction005
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let that = new uri.URI('http://username:password@host:8080/directory/file?foo^=1&bar=2#gaogaofaofao');
      } catch (err: BusinessError) {
        expect(err.code).assertEqual(10200002)
      }
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_0600
     * @tc.name: testUriConstruction006
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let that = new uri.URI('1http://username:password@host:8080/directory/file?foo=1&bar=2#gaogaofaofao');
      } catch (err: BusinessError) {
        expect(err.code).assertEqual(10200002)
      }
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_0700
     * @tc.name: testUriConstruction007
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let that = new uri.URI('ht@tp://username:password@host:8080/directory/file?foo=1&bar=2#gaogaofaofao');
      } catch (err: BusinessError) {
        expect(err.code).assertEqual(10200002)
      }
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_0800
     * @tc.name: testUriConstruction008
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let that = new uri.URI('http://username:password@[::]:80r80/directory/file?foo=1&bar=2#gaogaofaofao');
      } catch (err: BusinessError) {
        expect(err.code).assertEqual(10200002)
      }
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_0900
     * @tc.name: testUriConstruction009
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let that = new uri.URI('http://username:password@[::12:55:8080/directory/file?foo=1&bar=2#gaogaofaofao');
      } catch (err: BusinessError) {
        expect(err.code).assertEqual(10200002)
      }
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_1000
     * @tc.name: testUriConstruction010
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let that = new uri.URI('http://username:pa^ssword@[::12:55]:8080/directory/file?foo=1&bar=2#gaogaofaofao');
      } catch (err: BusinessError) {
        expect(err.code).assertEqual(10200002)
      }
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_1100
     * @tc.name: testUriConstruction011
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let that = new uri.URI('http://username:password@[::1你2:55]:8080/directory/file?foo=1&bar=2#gaogaofaofao');
      } catch (err: BusinessError) {
        expect(err.code).assertEqual(10200002)
      }
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_1200
     * @tc.name: testUriConstruction012
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://gg:gaogao@www.baidu.com:99/path/path?query#fagment');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("gg:gaogao@www.baidu.com:99");
      expect(gaogao.ssp).assertEqual("//gg:gaogao@www.baidu.com:99/path/path?query");
      expect(gaogao.userInfo).assertEqual("gg:gaogao");
      expect(gaogao.host).assertEqual("www.baidu.com");
      expect(gaogao.port).assertEqual("99");
      expect(gaogao.path).assertEqual("/path/path");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("fagment");
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_1300
     * @tc.name: testUriConstruction013
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://gg:gaogao@[1080::8:800:200C:417A]:99/path/66path1?query#fagment');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("gg:gaogao@[1080::8:800:200C:417A]:99");
      expect(gaogao.ssp).assertEqual("//gg:gaogao@[1080::8:800:200C:417A]:99/path/66path1?query");
      expect(gaogao.userInfo).assertEqual("gg:gaogao");
      expect(gaogao.host).assertEqual("[1080::8:800:200C:417A]");
      expect(gaogao.port).assertEqual("99");
      expect(gaogao.path).assertEqual("/path/66path1");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("fagment");
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_1400
     * @tc.name: testUriConstruction014
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://gg:gaogao@[::]:88/path/path66?foooo#gaogao');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("gg:gaogao@[::]:88");
      expect(gaogao.ssp).assertEqual("//gg:gaogao@[::]:88/path/path66?foooo");
      expect(gaogao.userInfo).assertEqual("gg:gaogao");
      expect(gaogao.host).assertEqual("[::]");
      expect(gaogao.port).assertEqual("88");
      expect(gaogao.path).assertEqual("/path/path66");
      expect(gaogao.query).assertEqual("foooo");
      expect(gaogao.fragment).assertEqual("gaogao");
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_1500
     * @tc.name: testUriConstruction015
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path/66path1?query#fagment');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("gg:gaogao@[1:0:0:1:2:1:2:1]:99");
      expect(gaogao.ssp).assertEqual("//gg:gaogao@[1:0:0:1:2:1:2:1]:99/path/66path1?query");
      expect(gaogao.userInfo).assertEqual("gg:gaogao");
      expect(gaogao.host).assertEqual("[1:0:0:1:2:1:2:1]");
      expect(gaogao.port).assertEqual("99");
      expect(gaogao.path).assertEqual("/path/66path1");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("fagment");
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_1600
     * @tc.name: testUriConstruction016
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://gg:gaogao@[::FFFF:129.144.52.38]:99/path/path?query#fagment');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("gg:gaogao@[::FFFF:129.144.52.38]:99");
      expect(gaogao.ssp).assertEqual("//gg:gaogao@[::FFFF:129.144.52.38]:99/path/path?query");
      expect(gaogao.userInfo).assertEqual("gg:gaogao");
      expect(gaogao.host).assertEqual("[::FFFF:129.144.52.38]");
      expect(gaogao.port).assertEqual("99");
      expect(gaogao.path).assertEqual("/path/path");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("fagment");
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_1700
     * @tc.name: testUriConstruction017
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://gg:gaogao@[::192.9.5.5]:99/path/path?query#fagment');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("gg:gaogao@[::192.9.5.5]:99");
      expect(gaogao.ssp).assertEqual("//gg:gaogao@[::192.9.5.5]:99/path/path?query");
      expect(gaogao.userInfo).assertEqual("gg:gaogao");
      expect(gaogao.host).assertEqual("[::192.9.5.5]");
      expect(gaogao.port).assertEqual("99");
      expect(gaogao.path).assertEqual("/path/path");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("fagment");
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_1800
     * @tc.name: testUriConstruction018
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://gg:gaogao@[22::22:2:2%ss]:99/path/path?query#fagment');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("gg:gaogao@[22::22:2:2%ss]:99");
      expect(gaogao.ssp).assertEqual("//gg:gaogao@[22::22:2:2%ss]:99/path/path?query");
      expect(gaogao.userInfo).assertEqual("gg:gaogao");
      expect(gaogao.host).assertEqual("[22::22:2:2%ss]");
      expect(gaogao.port).assertEqual("99");
      expect(gaogao.path).assertEqual("/path/path");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("fagment");
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_1900
     * @tc.name: testUriConstruction019
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao =
        new uri.URI('http://gg:gaogao@[fe80:0000:0001:0000:0440:44ff:1233:5678]:99/path/path?query#fagment');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("gg:gaogao@[fe80:0000:0001:0000:0440:44ff:1233:5678]:99");
      expect(gaogao.ssp).assertEqual("//gg:gaogao@[fe80:0000:0001:0000:0440:44ff:1233:5678]:99/path/path?query");
      expect(gaogao.userInfo).assertEqual("gg:gaogao");
      expect(gaogao.host).assertEqual("[fe80:0000:0001:0000:0440:44ff:1233:5678]");
      expect(gaogao.port).assertEqual("99");
      expect(gaogao.path).assertEqual("/path/path");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("fagment");
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_2000
     * @tc.name: testUriConstruction020
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://gg:gaogao@[fe80::0001:0000]:99/path/path?query#fagment');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("gg:gaogao@[fe80::0001:0000]:99");
      expect(gaogao.ssp).assertEqual("//gg:gaogao@[fe80::0001:0000]:99/path/path?query");
      expect(gaogao.userInfo).assertEqual("gg:gaogao");
      expect(gaogao.host).assertEqual("[fe80::0001:0000]");
      expect(gaogao.port).assertEqual("99");
      expect(gaogao.path).assertEqual("/path/path");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("fagment");
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_2100
     * @tc.name: testUriConstruction021
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://gg:gaogao@199.98.55.44:99/path/path?query#fagment');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("gg:gaogao@199.98.55.44:99");
      expect(gaogao.ssp).assertEqual("//gg:gaogao@199.98.55.44:99/path/path?query");
      expect(gaogao.userInfo).assertEqual("gg:gaogao");
      expect(gaogao.host).assertEqual("199.98.55.44");
      expect(gaogao.port).assertEqual("99");
      expect(gaogao.path).assertEqual("/path/path");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("fagment");
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_2200
     * @tc.name: testUriConstruction022
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://16.9.5.4:99/path/path?query#fagment');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("16.9.5.4:99");
      expect(gaogao.ssp).assertEqual("//16.9.5.4:99/path/path?query");
      expect(gaogao.userInfo).assertEqual(null);
      expect(gaogao.host).assertEqual("16.9.5.4");
      expect(gaogao.port).assertEqual("99");
      expect(gaogao.path).assertEqual("/path/path");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("fagment");
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_2300
     * @tc.name: testUriConstruction023
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://49.99.54.12:50/path/path23?query#fagment');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("49.99.54.12:50");
      expect(gaogao.ssp).assertEqual("//49.99.54.12:50/path/path23?query");
      expect(gaogao.userInfo).assertEqual(null);
      expect(gaogao.host).assertEqual("49.99.54.12");
      expect(gaogao.port).assertEqual("50");
      expect(gaogao.path).assertEqual("/path/path23");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("fagment");
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_2400
     * @tc.name: testUriConstruction024
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://user@49.10pe8.54.12:80/path/path23?query#qwer');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("user@49.10pe8.54.12:80");
      expect(gaogao.ssp).assertEqual("//user@49.10pe8.54.12:80/path/path23?query");
      expect(gaogao.userInfo).assertEqual(null);
      expect(gaogao.host).assertEqual(null);
      expect(gaogao.port).assertEqual("-1");
      expect(gaogao.path).assertEqual("/path/path23");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("qwer");
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_2500
     * @tc.name: testUriConstruction025
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://user@www.baidu.com/path/path23?query#qwer');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("user@www.baidu.com");
      expect(gaogao.ssp).assertEqual("//user@www.baidu.com/path/path23?query");
      expect(gaogao.userInfo).assertEqual("user");
      expect(gaogao.host).assertEqual("www.baidu.com");
      expect(gaogao.port).assertEqual("-1");
      expect(gaogao.path).assertEqual("/path/path23");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("qwer");
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_2600
     * @tc.name: testUriConstruction026
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://user@www.hw.com:77/path/path23?query#qwer');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("user@www.hw.com:77");
      expect(gaogao.ssp).assertEqual("//user@www.hw.com:77/path/path23?query");
      expect(gaogao.userInfo).assertEqual("user");
      expect(gaogao.host).assertEqual("www.hw.com");
      expect(gaogao.port).assertEqual("77");
      expect(gaogao.path).assertEqual("/path/path23");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("qwer");
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_2700
     * @tc.name: testUriConstruction027
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('ht2tp://user@www.h12343w.com:77/path/path23?query#qwer');
      expect(gaogao.scheme).assertEqual("ht2tp");
      expect(gaogao.authority).assertEqual("user@www.h12343w.com:77");
      expect(gaogao.ssp).assertEqual("//user@www.h12343w.com:77/path/path23?query");
      expect(gaogao.userInfo).assertEqual("user");
      expect(gaogao.host).assertEqual("www.h12343w.com");
      expect(gaogao.port).assertEqual("77");
      expect(gaogao.path).assertEqual("/path/path23");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("qwer");
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_2800
     * @tc.name: testUriConstruction028
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('ht2tp://user@www.1hw.1com:77/path/path23?query#qwer');
      expect(gaogao.scheme).assertEqual("ht2tp");
      expect(gaogao.authority).assertEqual("user@www.1hw.1com:77");
      expect(gaogao.ssp).assertEqual("//user@www.1hw.1com:77/path/path23?query");
      expect(gaogao.userInfo).assertEqual(null);
      expect(gaogao.host).assertEqual(null);
      expect(gaogao.port).assertEqual("-1");
      expect(gaogao.path).assertEqual("/path/path23");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("qwer");
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_2900
     * @tc.name: testUriConstruction029
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://user@hosthost/path/path23?query#qwer');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("user@hosthost");
      expect(gaogao.ssp).assertEqual("//user@hosthost/path/path23?query");
      expect(gaogao.userInfo).assertEqual("user");
      expect(gaogao.host).assertEqual("hosthost");
      expect(gaogao.port).assertEqual("-1");
      expect(gaogao.path).assertEqual("/path/path23");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("qwer");
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_3000
     * @tc.name: testUriConstruction030
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://user@[::]/path/path23?query#qwer');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("user@[::]");
      expect(gaogao.ssp).assertEqual("//user@[::]/path/path23?query");
      expect(gaogao.userInfo).assertEqual("user");
      expect(gaogao.host).assertEqual("[::]");
      expect(gaogao.port).assertEqual("-1");
      expect(gaogao.path).assertEqual("/path/path23");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("qwer");
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_3100
     * @tc.name: testUriConstruction031
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://[::192:0:5]/path/path23?query#qwer');
      expect(gaogao.scheme).assertEqual("http");
      expect(gaogao.authority).assertEqual("[::192:0:5]");
      expect(gaogao.ssp).assertEqual("//[::192:0:5]/path/path23?query");
      expect(gaogao.userInfo).assertEqual(null);
      expect(gaogao.host).assertEqual("[::192:0:5]");
      expect(gaogao.port).assertEqual("-1");
      expect(gaogao.path).assertEqual("/path/path23");
      expect(gaogao.query).assertEqual("query");
      expect(gaogao.fragment).assertEqual("qwer");
    })

    // Check the UriEquals.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_3200
     * @tc.name: testEquals001
     * @tc.desc: Tests this URI for equality with another object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEquals001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let gaogao1 = gaogao;
      let res = gaogao.equalsTo(gaogao1);
      expect(String(res)).assertEqual('true');
    })

    // Check the UriEquals.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_3300
     * @tc.name: testEquals002
     * @tc.desc: Tests this URI for equality with another object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEquals002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let res = gaogao.equalsTo(gaogao1);
      expect(String(res)).assertEqual('true');
    })

    // Check the UriEquals.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_3400
     * @tc.name: testEquals003
     * @tc.desc: Tests this URI for equality with another object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEquals003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment123');
      let res = gaogao.equalsTo(gaogao1);
      expect(String(res)).assertEqual('false');
    })

    // Check the UriEquals.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_3500
     * @tc.name: testEquals004
     * @tc.desc: Tests this URI for equality with another object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEquals004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://gg:gaogao@wwwaaa:99/path1?query#fagment');
      let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment123');
      let res = gaogao.equalsTo(gaogao1);
      expect(String(res)).assertEqual('false');
    })

    // Check the UriEquals.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_3600
     * @tc.name: testEquals005
     * @tc.desc: Tests this URI for equality with another object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEquals005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let gaogao1 = new uri.URI('http://[1:0:0:1:2:1:2:1]/path1?query#fagment123');
      let res = gaogao.equalsTo(gaogao1);
      expect(String(res)).assertEqual('false');
    })

    // Check the UriEquals.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_3700
     * @tc.name: testEqualsTo001
     * @tc.desc: Tests this URI for equality with another object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEqualsTo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let gaogao1 = gaogao;
      let res = gaogao.equalsTo(gaogao1);
      expect(String(res)).assertEqual('true');
    })

    // Check the UriEquals.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_3800
     * @tc.name: testEqualsTo002
     * @tc.desc: Tests this URI for equality with another object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEqualsTo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let res = gaogao.equalsTo(gaogao1);
      expect(String(res)).assertEqual('true');
    })

    // Check the UriEquals.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_3900
     * @tc.name: testEqualsTo003
     * @tc.desc: Tests this URI for equality with another object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEqualsTo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment123');
      let res = gaogao.equalsTo(gaogao1);
      expect(String(res)).assertEqual('false');
    })

    // Check the UriEquals.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_4000
     * @tc.name: testEqualsTo004
     * @tc.desc: Tests this URI for equality with another object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEqualsTo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://gg:gaogao@wwwaaa:99/path1?query#fagment');
      let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment123');
      let res = gaogao.equalsTo(gaogao1);
      expect(String(res)).assertEqual('false');
    })

    // Check the UriEquals.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_4100
     * @tc.name: testEqualsTo005
     * @tc.desc: Tests this URI for equality with another object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEqualsTo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let gaogao1 = new uri.URI('http://[1:0:0:1:2:1:2:1]/path1?query#fagment123');
      let res = gaogao.equalsTo(gaogao1);
      expect(String(res)).assertEqual('false');
    })

    // Check the UriNormalize.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_4400
     * @tc.name: testNormalize001
     * @tc.desc: Tests Normalizes this URI's path.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testNormalize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path/66./../././mm/.././path1?query#fagment');
      let res = gaogao.normalize();
      expect(res.path).assertEqual("/path/path1");
      expect(res.toString()).assertEqual("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path/path1?query#fagment");
    })

    // Check the UriNormalize.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_4500
     * @tc.name: testNormalize002
     * @tc.desc: Tests Normalizes this URI's path.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testNormalize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../path?query#fagment');
      let res = gaogao.normalize();
      expect(res.path).assertEqual("/../../path");
      expect(res.toString()).assertEqual("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../path?query#fagment");
    })

    // Check the UriNormalize.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_4600
     * @tc.name: testNormalize003
     * @tc.desc: Tests Normalizes this URI's path.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testNormalize003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../path/.././../aa/bb/cc?query#fagment');
      let res = gaogao.normalize();
      expect(res.path).assertEqual("/../../../aa/bb/cc");
      expect(res.toString()).assertEqual("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../../aa/bb/cc?query#fagment");
    })

    // Check the UriNormalize.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_4700
     * @tc.name: testNormalize004
     * @tc.desc: Tests Normalizes this URI's path.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testNormalize004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../path/.././../aa/bb/cc?query');
      let res = gaogao.normalize();
      expect(res.path).assertEqual("/../../aa/bb/cc");
      expect(res.toString()).assertEqual("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../aa/bb/cc?query");
    })

    // Check the UriNormalize.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_4800
     * @tc.name: testNormalize005
     * @tc.desc: Tests Normalizes this URI's path.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testNormalize005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/./path/./aa/bb/cc?query#fagment');
      let res = gaogao.normalize();
      expect(res.path).assertEqual("/path/aa/bb/cc");
      expect(res.toString()).assertEqual("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path/aa/bb/cc?query#fagment");
    })

    // Check the UriToString.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_4900
     * @tc.name: testToString001
     * @tc.desc: Returns the content of this URI as a US-ASCII string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../path/.././../aa/bb/cc?query#fagment');
      let res = gaogao.toString();
      expect(res).assertEqual('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../path/.././../aa/bb/cc?query#fagment');
    })

    // Check the UriToString.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_5000
     * @tc.name: testToString002
     * @tc.desc: Returns the content of this URI as a US-ASCII string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('htt1p://gg:gaogao@[::192.9.5.5]:99/path/66path1?query#fagment');
      let res = gaogao.toString();
      expect(res).assertEqual('htt1p://gg:gaogao@[::192.9.5.5]:99/path/66path1?query#fagment');
    })

    // Check the UriToString.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_5100
     * @tc.name: testToString003
     * @tc.desc: Returns the content of this URI as a US-ASCII string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('ftp://username:password@www.baidu.com:88/path?query#fagment');
      let res = gaogao.toString();
      expect(res).assertEqual('ftp://username:password@www.baidu.com:88/path?query#fagment');
    })

    // Check the UriToString.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_5200
     * @tc.name: testToString004
     * @tc.desc: Returns the content of this URI as a US-ASCII string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://gg:gao你好gao@199.98.55.44:99/path/p你好ath?qu你好ery#fag你好ment');
      let res = gaogao.toString();
      expect(res).assertEqual('http://gg:gao%E4%BD%A0%E5%A5%BDgao@199.98.55.44:99/path/' +
        'p%E4%BD%A0%E5%A5%BDath?qu%E4%BD%A0%E5%A5%BDery#fag%E4%BD%A0%E5%A5%BDment');
    })

    // Check the UriToString.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_5300
     * @tc.name: testToString005
     * @tc.desc: Returns the content of this URI as a US-ASCII string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http://gg:gaogao@199.98.55.44:99/path/path?query#fagment');
      let res = gaogao.toString();
      expect(res).assertEqual('http://gg:gaogao@199.98.55.44:99/path/path?query#fagment');
    })

    // Check the UriCheckIsAbsolute.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_5400
     * @tc.name: testCheckIsAbsolute001
     * @tc.desc: Tells whether or not this URI is absolute.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCheckIsAbsolute001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('f/tp://username:password@www.baidu.com:88/path?query#fagment');
      let res = gaogao.checkIsAbsolute();
      expect(String(res)).assertEqual('false');
    })

    // Check the UriCheckIsAbsolute.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_5500
     * @tc.name: testCheckIsAbsolute002
     * @tc.desc: Tells whether or not this URI is absolute.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCheckIsAbsolute002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('ftp://username:password@www.baidu.com:88/path?query#fagment');
      let res = gaogao.checkIsAbsolute();
      expect(String(res)).assertEqual('true');
    })

    // Check the UriCheckIsAbsolute.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_5600
     * @tc.name: testCheckIsAbsolute003
     * @tc.desc: Tells whether or not this URI is absolute.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCheckIsAbsolute003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('htt/p://username:password@www.baidu.com:88/path?query#fagment');
      let res = gaogao.checkIsAbsolute();
      expect(String(res)).assertEqual('false');
    })

    // Check the UriCheckIsAbsolute.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_5700
     * @tc.name: testCheckIsAbsolute004
     * @tc.desc: Tells whether or not this URI is absolute.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCheckIsAbsolute004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('https://username:password@www.baidu.com:88/path?query#fagment');
      let res = gaogao.checkIsAbsolute();
      expect(String(res)).assertEqual('true');
    })

    // Check the UriCheckIsAbsolute.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_5800
     * @tc.name: testCheckIsAbsolute005
     * @tc.desc: Tells whether or not this URI is absolute.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCheckIsAbsolute005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let gaogao = new uri.URI('http1://username:password@www.baidu.com:88/path?query#fagment');
      let res = gaogao.checkIsAbsolute();
      expect(String(res)).assertEqual('true');
    })

    // Check the UriCheckRelative.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_5900
     * @tc.name: testCheckRelative001
     * @tc.desc: Tells whether or not this URI is relative.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCheckRelative001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('http://www.test.com/images/pic.jpg');
      let res = route.checkRelative();
      expect(String(res)).assertEqual('false');
    })

    // Check the UriCheckRelative.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_6000
     * @tc.name: testCheckRelative002
     * @tc.desc: Tells whether or not this URI is relative.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCheckRelative002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('/images/pic.jpg');
      let res = route.checkRelative();
      expect(String(res)).assertEqual('true');
    })

    // Check the UriCheckRelative.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_6100
     * @tc.name: testCheckRelative003
     * @tc.desc: Tells whether or not this URI is relative.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCheckRelative003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com/images/logo.jpg');
      let res = route.checkRelative();
      expect(String(res)).assertEqual('false');
    })

    // Check the UriCheckRelative.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_6200
     * @tc.name: testCheckRelative004
     * @tc.desc: Tells whether or not this URI is relative.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCheckRelative004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('aaa');
      let res = route.checkRelative();
      expect(String(res)).assertEqual('true');
    })

    // Check the UriCheckRelative.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_6300
     * @tc.name: testCheckRelative005
     * @tc.desc: Tells whether or not this URI is relative.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCheckRelative005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let mailtoRoute = new uri.URI('mailto:user@test.com');
      let res = mailtoRoute.checkRelative();
      expect(String(res)).assertEqual('false');
    })

    // Check the UriCheckOpaque.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_6400
     * @tc.name: testCheckOpaque001
     * @tc.desc: Tells whether or not this URI is opaque.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCheckOpaque001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('http://www.test.com/images/pic.jpg');
      let res = route.checkOpaque();
      expect(String(res)).assertEqual('false');
    })

    // Check the UriCheckOpaque.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_6500
     * @tc.name: testCheckOpaque002
     * @tc.desc: Tells whether or not this URI is Opaque.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCheckOpaque002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('images/pic.jpg');
      let res = route.checkOpaque();
      expect(String(res)).assertEqual('false');
    })

    // Check the UriCheckOpaque.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_6600
     * @tc.name: testCheckOpaque003
     * @tc.desc: Tells whether or not this URI is Opaque.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCheckOpaque003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('mailto:user@test.com');
      let res = route.checkOpaque();
      expect(String(res)).assertEqual('true');
    })

    // Check the UriCheckOpaque.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_6700
     * @tc.name: testCheckOpaque004
     * @tc.desc: Tells whether or not this URI is Opaque.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCheckOpaque004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('tel:1234567890');
      let res = route.checkOpaque();
      expect(String(res)).assertEqual('true');
    })

    // Check the UriCheckHierarchical.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_6800
     * @tc.name: testCheckHierarchical001
     * @tc.desc: Tells whether or not this URI is Opaque.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCheckHierarchical001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('http://www.test.com/images/pic.jpg');
      let res = route.checkHierarchical();
      expect(String(res)).assertEqual('true');
    })

    // Check the UriCheckHierarchical.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_6900
     * @tc.name: testCheckHierarchical002
     * @tc.desc: Tells whether or not this URI is Opaque.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCheckHierarchical002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('mailto:test@test.com');
      let res = route.checkHierarchical();
      expect(String(res)).assertEqual('false');
    })

    // Check the UriCheckHierarchical.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_7000
     * @tc.name: testCheckHierarchical003
     * @tc.desc: Tells whether or not this URI is Opaque.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCheckHierarchical003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('images/pic.jpg');
      let res = route.checkHierarchical();
      expect(String(res)).assertEqual('true');
    })

    // Check the UriCheckHierarchical.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_7100
     * @tc.name: testCheckHierarchical004
     * @tc.desc: Tells whether or not this URI is Opaque.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCheckHierarchical004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('path');
      expect(String(route.checkHierarchical())).assertEqual('true');
      let testUri = new uri.URI('path:');
      expect(String(testUri.checkHierarchical())).assertEqual('false');
    })

    // Check the UriGetQueryValue.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_7200
     * @tc.name: testUriGetQueryValue001
     * @tc.desc: Get specific query parameters from URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetQueryValue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com?param1=value1&param2=value2');
      let param1Value = route.getQueryValue("param1");
      let param2Value = route.getQueryValue("param2");
      expect(param1Value).assertEqual('value1');
      expect(param2Value).assertEqual('value2');
    })

    // Check the UriGetQueryValue.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_7300
     * @tc.name: testUriGetQueryValue002
     * @tc.desc: Get specific query parameters from URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetQueryValue002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com');
      expect(route.getQueryValue("param1")).assertEqual(null);
      let include = new uri.URI('https://www.test.com?param1=value1');
      expect(include.getQueryValue("param")).assertEqual(null);
    })

    // Check the UriGetQueryValue.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_7400
     * @tc.name: testUriGetQueryValue003
     * @tc.desc: Get specific query parameters from URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetQueryValue003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com?param1=value1&param1=value2&param1=value3');
      let param1Value = route.getQueryValue("param1");
      expect(param1Value).assertEqual("value1");
      expect(route.getQueryValues("param1")[0]).assertEqual("value1");
    })

    // Check the UriGetQueryValue.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_7500
     * @tc.name: testUriGetQueryValue004
     * @tc.desc: Get specific query parameters from URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetQueryValue004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com?param1=hello%20world');
      expect(route.getQueryValue("param1")).assertEqual("hello world");
      let specialSymbol = new uri.URI('https://www.test.com?param1=hello+world');
      expect(specialSymbol.getQueryValue("param1")).assertEqual("hello world");
    })

    // Check the UriGetQueryValue.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_7600
     * @tc.name: testUriGetQueryValue005
     * @tc.desc: Get specific query parameters from URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetQueryValue005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com?param%201=hello');
      expect(route.getQueryValue("param 1")).assertEqual("hello");
      expect(route.getQueryValue("1")).assertEqual(null);
      expect(route.getQueryValue(" 1")).assertEqual(null);
    })

    // Check the UriGetQueryValue.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_7700
     * @tc.name: testUriGetQueryValue006
     * @tc.desc: Get specific query parameters from URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetQueryValue006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com?param1=&param2=');
      expect(route.getQueryValue("param1")).assertEqual("");
      expect(route.getQueryValue("param2")).assertEqual("");
      let noNameUri = new uri.URI('https://www.test.com?=value');
      expect(noNameUri.getQueryValue("")).assertEqual("value");
    })

    // Check the UriGetQueryValue.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_7800
     * @tc.name: testUriGetQueryValue007
     * @tc.desc: Get specific query parameters from URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetQueryValue007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let emptyParameter1 = new uri.URI('https://www.test.com?param1=value1&&param3=value3');
      expect(emptyParameter1.getQueryValue("")).assertEqual("");
      let emptyParameter12 = new uri.URI('https://www.test.com?param1=value1&');
      expect(emptyParameter12.getQueryValue("")).assertEqual("");
      let router = new uri.URI('https://www.test.com?');
      expect(router.getQueryValue("")).assertEqual(null);
    })

    // Check the UriAddQueryValue.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_7900
     * @tc.name: testUriAddQueryValue001
     * @tc.desc: Add query parameters for URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriAddQueryValue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com');
      let newRoute = route.addQueryValue("param1", "value1");
      expect(newRoute.getQueryValue("param1")).assertEqual("value1");
      expect(newRoute.toString()).assertEqual("https://www.test.com?param1=value1");
      let clearRoute = newRoute.clearQuery();
      expect(clearRoute.toString()).assertEqual("https://www.test.com");
    })

    // Check the UriAddQueryValue.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_8000
     * @tc.name: testUriAddQueryValue002
     * @tc.desc: Add query parameters for URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriAddQueryValue002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com');
      let newRoute = route.addQueryValue("param1", "value1").addQueryValue("param2", "value2");
      expect(newRoute.getQueryValue('param1')).assertEqual("value1");
      expect(newRoute.getQueryValue('param2')).assertEqual("value2");
      expect(newRoute.toString()).assertEqual("https://www.test.com?param1=value1&param2=value2");
    })

    // Check the UriAddQueryValue.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_8100
     * @tc.name: testUriAddQueryValue003
     * @tc.desc: Add query parameters for URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriAddQueryValue003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com');
      let newRoute = route.addQueryValue("param1", "hello world");
      expect(newRoute.toString()).assertEqual("https://www.test.com?param1=hello%20world");
      expect(newRoute.getQueryValue("param1")).assertEqual("hello world");
      let paramNames = newRoute.getQueryNames();
      expect(String(paramNames.length)).assertEqual('1');
      expect(paramNames.values().next().value).assertEqual("param1");
    })

    // Check the UriAddQueryValue.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_8200
     * @tc.name: testUriAddQueryValue004
     * @tc.desc: Add query parameters for URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriAddQueryValue004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com');
      let newRoute = route.addQueryValue("param1", "value1").addQueryValue("param1", "value2");
      expect(newRoute.toString()).assertEqual("https://www.test.com?param1=value1&param1=value2");
    })

    // Check the UriAddQueryValue.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_8300
     * @tc.name: testUriAddQueryValue005
     * @tc.desc: Add query parameters for URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriAddQueryValue005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com');
      let newRoute = route.addQueryValue("param1", "value1").addQueryValue("param2", "null");
      expect(newRoute.toString()).assertEqual("https://www.test.com?param1=value1&param2=null");
      let values = newRoute.getQueryValues("param1");
      expect(values[0]).assertEqual("value1");
    })

    // Check the UriAddQueryValue.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_8400
     * @tc.name: testUriAddQueryValue006
     * @tc.desc: Add query parameters for URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriAddQueryValue006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let value = "value";
      let testUri = new uri.URI('https://www.test.com');
      let addQuery = testUri.addQueryValue("param", value);
      expect(addQuery.getQueryValue("param")).assertEqual(value);
      expect(addQuery.getQueryValues("param")[0]).assertEqual(value);
      expect(addQuery.toString()).assertEqual("https://www.test.com?param=value");
      value = "value1";
      let valueChange = testUri.addQueryValue("param", value);
      expect(valueChange.toString()).assertEqual("https://www.test.com?param=value1");
      let newChange = addQuery.addQueryValue("param", value);
      expect(newChange.toString()).assertEqual("https://www.test.com?param=value&param=value1");
    })

    // Check the UriAddQueryValue.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_8500
     * @tc.name: testUriAddQueryValue007
     * @tc.desc: Add query parameters for URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriAddQueryValue007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com');
      let newRoute = route.addQueryValue("param 1", "value 1");
      expect(newRoute.getQueryValue("param 1")).assertEqual("value 1");
    })

    // Check the UriGetQueryNames.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_8600
     * @tc.name: testUriGetQueryNames001
     * @tc.desc: Get the names of all query parameters in the URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetQueryNames001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com?param1=value1&param2=value2');
      let paramNames = route.getQueryNames();
      expect(String(paramNames.length)).assertEqual('2');
      expect(paramNames.values().next().value).assertEqual("param1");
    })

    // Check the UriGetQueryNames.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_8700
     * @tc.name: testUriGetQueryNames002
     * @tc.desc: Get the names of all query parameters in the URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetQueryNames002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com');
      let paramNames = route.getQueryNames();
      expect(String(paramNames.length)).assertEqual('0');
    })

    // Check the UriGetQueryNames.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_8800
     * @tc.name: testUriGetQueryNames003
     * @tc.desc: Get the names of all query parameters in the URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetQueryNames003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com?param1=value1&&param3=value3');
      let paramNames = route.getQueryNames();
      let values = paramNames.values();
      expect(String(paramNames.length)).assertEqual('3');
      expect(values.next().value).assertEqual("param1");
      expect(values.next().value).assertEqual("");
      expect(values.next().value).assertEqual("param3");
    })

    // Check the UriGetQueryNames.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_8900
     * @tc.name: testUriGetQueryNames004
     * @tc.desc: Get the names of all query parameters in the URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetQueryNames004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com?param1=value1&=value2&param3=value3');
      let paramNames = route.getQueryNames();
      expect(String(paramNames.length)).assertEqual('3');
      let values = paramNames.values();
      expect(values.next().value).assertEqual("param1");
      expect(values.next().value).assertEqual("");
      expect(values.next().value).assertEqual("param3");
    })

    // Check the UriGetQueryNames.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_9000
     * @tc.name: testUriGetQueryNames005
     * @tc.desc: Get the names of all query parameters in the URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetQueryNames005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com?param1=value1&&&a&b=v&param3');
      let paramNames = route.getQueryNames();
      expect(String(paramNames.length)).assertEqual('5');
      let values = paramNames.values();
      expect(values.next().value).assertEqual("param1");
      expect(values.next().value).assertEqual("");
      expect(values.next().value).assertEqual("a");
      expect(values.next().value).assertEqual("b");
      expect(values.next().value).assertEqual("param3");
    })

    // Check the UriGetQueryNames.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_9100
     * @tc.name: testUriGetQueryNames006
     * @tc.desc: Get the names of all query parameters in the URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetQueryNames006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com?param%201=value1');
      let paramNames = route.getQueryNames();
      expect(String(paramNames.length)).assertEqual('1');
      expect(paramNames.values().next().value).assertEqual("param 1");
      let route1 = new uri.URI('https://www.test.com?param+1=value1');
      let paramNames1 = route1.getQueryNames();
      expect(String(paramNames1.length)).assertEqual('1');
      expect(paramNames1.values().next().value).assertEqual("param+1");
    })

    // Check the UriGetQueryValues.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_9200
     * @tc.name: testUriGetQueryValues001
     * @tc.desc: Get all parameters and their corresponding values in the URI query string
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetQueryValues001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com/search?query=name&sort=asc&filter=f');
      let values = route.getQueryValues("query");
      expect(String(values.length)).assertEqual("1");
    })

    // Check the UriGetQueryValues.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_9300
     * @tc.name: testUriGetQueryValues002
     * @tc.desc: Get all parameters and their corresponding values in the URI query string
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetQueryValues002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com/search?query=name');
      let values = route.getQueryValues("query");
      expect(values[0]).assertEqual("name");
    })

    // Check the UriGetQueryValues.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_9400
     * @tc.name: testUriGetQueryValues003
     * @tc.desc: Get all parameters and their corresponding values in the URI query string
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetQueryValues003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let emptyParameter1 = new uri.URI('https://www.test.com/search?query=');
      let result1 = emptyParameter1.getQueryValues("query");
      expect(String(result1.length)).assertEqual("1");
      expect(result1[0]).assertEqual("");
      let emptyParameter2 = new uri.URI('https://www.test.com/search?=value&');
      let result2 = emptyParameter2.getQueryValues("");
      expect(result2[0]).assertEqual("value");
      expect(result2[1]).assertEqual("");
      let emptyParameter3 = new uri.URI('https://www.test.com?');
      let result3 = emptyParameter3.getQueryValues("");
      expect(String(result3.length)).assertEqual("0");
      let emptyParameter4 = new uri.URI('https://www.test.com?param');
      let result4 = emptyParameter4.getQueryValues("param");
      expect(String(result4.length)).assertEqual("1");
      expect(result4[0]).assertEqual("");
      let emptyParameter5 = new uri.URI('https://www.test.com?param1=value1&&param3=value3');
      let result5 = emptyParameter5.getQueryValues("");
      expect(result5[0]).assertEqual("");
    })

    // Check the UriGetQueryValues.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_9500
     * @tc.name: testUriGetQueryValues004
     * @tc.desc: Get all parameters and their corresponding values in the URI query string
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetQueryValues004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com/search');
      let values = route.getQueryValues("query");
      expect(String(values.length)).assertEqual("0");
    })

    // Check the UriGetQueryValues.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_9600
     * @tc.name: testUriGetQueryValues005
     * @tc.desc: Get all parameters and their corresponding values in the URI query string
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetQueryValues005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com/search?query=my%20query');
      let values = route.getQueryValues("query");
      expect(values[0]).assertEqual("my query");
    })

    // Check the UriGetQueryValues.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_9700
     * @tc.name: testUriGetQueryValues006
     * @tc.desc: Get all parameters and their corresponding values in the URI query string
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetQueryValues006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com/search?query=name&query=my');
      let values = route.getQueryValues("query");
      expect(values[0]).assertEqual("name");
      expect(values[1]).assertEqual("my");
    })

    // Check the UriGetQueryValues.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_9800
     * @tc.name: testUriGetQueryValues007
     * @tc.desc: Get all parameters and their corresponding values in the URI query string
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetQueryValues007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com?query=hello+world');
      let values = route.getQueryValues("query");
      expect(values[0]).assertEqual("hello+world");
    })

    // Check the UriGetQueryValues.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_9900
     * @tc.name: testUriGetQueryValues008
     * @tc.desc: Get all parameters and their corresponding values in the URI query string
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetQueryValues008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route1 = new uri.URI('https://www.test.com?param_g=value_1');
      let values1 = route1.getQueryValues("param_g");
      expect(values1[0]).assertEqual("value_1");
      expect(route1.getQueryValue('param_g')).assertEqual("value_1");
    })

    // Check the UriGetBooleanQueryValue.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_10000
     * @tc.name: testUriGetBooleanQueryValue001
     * @tc.desc: Get the Boolean value of the URI query parameter
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetBooleanQueryValue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com/search?active=true');
      let isActive = route.getBooleanQueryValue("active", false);
      expect(String(isActive)).assertEqual("true");
    })

    // Check the UriGetBooleanQueryValue.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_10100
     * @tc.name: testUriGetBooleanQueryValue002
     * @tc.desc: Get the Boolean value of the URI query parameter
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetBooleanQueryValue002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com/search');
      let isActive = route.getBooleanQueryValue("active", false);
      expect(String(isActive)).assertEqual("false");
    })

    // Check the UriGetBooleanQueryValue.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_10200
     * @tc.name: testUriGetBooleanQueryValue003
     * @tc.desc: Get the Boolean value of the URI query parameter
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetBooleanQueryValue003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com/search?active=name');
      let isActive = route.getBooleanQueryValue("active", false);
      expect(String(isActive)).assertEqual("true");
    })

    // Check the UriGetBooleanQueryValue.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_10300
     * @tc.name: testUriGetBooleanQueryValue004
     * @tc.desc: Get the Boolean value of the URI query parameter
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetBooleanQueryValue004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com/search');
      let isActive = route.getBooleanQueryValue("active", true);
      expect(String(isActive)).assertEqual("true");
    })

    // Check the UriGetBooleanQueryValue.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_10400
     * @tc.name: testUriGetBooleanQueryValue005
     * @tc.desc: Get the Boolean value of the URI query parameter
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetBooleanQueryValue005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com/search?active=true&active=false');
      let isActive = route.getBooleanQueryValue("active", false);
      expect(String(isActive)).assertEqual("true");
      let uriInstance1 = new uri.URI("https://www.test.com/search?active=aa&active=false");
      expect(String(uriInstance1.getBooleanQueryValue("active", false))).assertEqual("true");
      let uriInstance2 = new uri.URI("https://www.test.com/search?active=0");
      expect(String(uriInstance2.getBooleanQueryValue("active", true))).assertEqual("false");
    })

    // Check the UriClearQuery.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_10500
     * @tc.name: testUriClearQuery001
     * @tc.desc: Clear URI query parameters
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriClearQuery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com');
      let newRoute = route.clearQuery();
      expect(newRoute.toString()).assertEqual("https://www.test.com");
    })

    // Check the UriClearQuery.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_10600
     * @tc.name: testUriClearQuery002
     * @tc.desc: Clear URI query parameters
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriClearQuery002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com?param1=value1');
      let newRoute = route.clearQuery();
      expect(newRoute.toString()).assertEqual("https://www.test.com");
    })

    // Check the UriClearQuery.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_10700
     * @tc.name: testUriClearQuery003
     * @tc.desc: Clear URI query parameters
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriClearQuery003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com?param1=value1%');
      let newRoute = route.clearQuery();
      expect(newRoute.toString()).assertEqual("https://www.test.com");
    })

    // Check the UriClearQuery.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_10800
     * @tc.name: testUriClearQuery004
     * @tc.desc: Clear URI query parameters
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriClearQuery004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com?param1=value1&param1=value2');
      let newRoute = route.clearQuery();
      expect(newRoute.toString()).assertEqual("https://www.test.com");
    })

    // Check the UriGetLastSegment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_10900
     * @tc.name: testUriGetLastSegment001
     * @tc.desc: Get the last segment of URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetLastSegment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('content://com.test.uri/files/image.jpg');
      let lastSegment = route.getLastSegment();
      expect(lastSegment).assertEqual("image.jpg");
    })

    // Check the UriGetLastSegment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_11000
     * @tc.name: testUriGetLastSegment002
     * @tc.desc: Get the last segment of URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetLastSegment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('content://com.test.uri/');
      let lastSegment = route.getLastSegment();
      expect(lastSegment).assertEqual("");
    })

    // Check the UriGetLastSegment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_11100
     * @tc.name: testUriGetLastSegment003
     * @tc.desc: Get the last segment of URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetLastSegment003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('content://com.test.uri');
      let lastSegment = route.getLastSegment();
      expect(lastSegment).assertEqual("");
    })

    // Check the UriGetLastSegment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_11200
     * @tc.name: testUriGetLastSegment004
     * @tc.desc: Get the last segment of URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetLastSegment004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('content://com.test.uri/files/');
      let lastSegment = route.getLastSegment();
      expect(lastSegment).assertEqual("files");
    })

    // Check the UriGetLastSegment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_11300
     * @tc.name: testUriGetLastSegment005
     * @tc.desc: Get the last segment of URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetLastSegment005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('content://com.test.uri/files/my%20file.jpg');
      let lastSegment = route.getLastSegment();
      expect(lastSegment).assertEqual("my file.jpg");
    })

    // Check the UriGetLastSegment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_11400
     * @tc.name: testUriGetLastSegment006
     * @tc.desc: Get the last segment of URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetLastSegment006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('content://com.test.uri/files/my+file.jpg');
      let lastSegment = route.getLastSegment();
      expect(lastSegment).assertEqual("my+file.jpg");
    })

    // Check the UriGetSegment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_11500
     * @tc.name: testUriGetSegment007
     * @tc.desc: Get all segments in the URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetSegment007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let route = new uri.URI('content://com.test.uri/files/a a');
        let segments = route.getSegment();
      } catch (err: BusinessError) {
        expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string");
        expect(err.code).assertEqual(10200002);
        expect(err.message).assertEqual("Syntax Error. Invalid Uri string");
      }
    })

    // Check the UriGetSegment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_11600
     * @tc.name: testUriGetSegment001
     * @tc.desc: Get all segments in the URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetSegment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('content://com.test.uri/files/images');
      let segments = route.getSegment();
      expect(String(segments.length)).assertEqual("2");
      expect(segments[0]).assertEqual("files");
      expect(segments[1]).assertEqual("images");
    })

    // Check the UriGetSegment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_11700
     * @tc.name: testUriGetSegment002
     * @tc.desc: Get all segments in the URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetSegment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('content://com.test.uri/');
      let segments = route.getSegment();
      expect(String(segments.length)).assertEqual("0");
    })

    // Check the UriGetSegment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_11800
     * @tc.name: testUriGetSegment003
     * @tc.desc: Get all segments in the URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetSegment003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('content://com.test.uri/files/');
      let segments = route.getSegment();
      expect(String(segments.length)).assertEqual("1");
    })

    // Check the UriGetSegment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_11900
     * @tc.name: testUriGetSegment004
     * @tc.desc: Get all segments in the URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetSegment004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('content://com.test.uri');
      let segments = route.getSegment();
      expect(String(segments.length)).assertEqual("0");
      let mailRoute = new uri.URI('mailto:people');
      expect(String(mailRoute.getSegment().length)).assertEqual("0");
    })

    // Check the UriGetSegment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_12000
     * @tc.name: testUriGetSegment005
     * @tc.desc: Get all segments in the URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetSegment005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('content://com.test.uri/files/a%20a/b%20b');
      let segments = route.getSegment();
      expect(segments[0]).assertEqual("files");
      expect(segments[1]).assertEqual("a a");
      expect(segments[2]).assertEqual("b b");
    })

    // Check the UriGetSegment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_12100
     * @tc.name: testUriGetSegment006
     * @tc.desc: Get all segments in the URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriGetSegment006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('http://www.test.com/path/to/image.jpg');
      let segments = route.getSegment();
      expect(segments[2]).assertEqual("image.jpg");
    })

    // Check the UriAddSegment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_12200
     * @tc.name: testUriAddSegment001
     * @tc.desc: Add a path segment to the URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriAddSegment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('http://www.test.com/');
      let newRoute = route.addSegment("files").addSegment("image.jpg");
      expect(newRoute.toString()).assertEqual("http://www.test.com/files/image.jpg");
      expect(newRoute.getLastSegment()).assertEqual("image.jpg");
    })

    // Check the UriAddSegment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_12300
     * @tc.name: testUriAddSegment002
     * @tc.desc: Add a path segment to the URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriAddSegment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route1 = new uri.URI('http://www.test.com');
      let newRoute1 = route1.addSegment("files").addSegment("my image.jpg");
      expect(newRoute1.toString()).assertEqual("http://www.test.com/files/my%20image.jpg");
      let route2 = new uri.URI('http://www.test.com');
      let newRoute2 = route2.addSegment("files").addSegment("my+image.jpg");
      expect(newRoute2.toString()).assertEqual("http://www.test.com/files/my%2Bimage.jpg");
      let route3 = new uri.URI('http://www.test.com');
      let newRoute3 = route3.addSegment("files").addSegment("my%20image.jpg");
      expect(newRoute3.toString()).assertEqual("http://www.test.com/files/my%2520image.jpg");
    })

    // Check the UriAddSegment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_12400
     * @tc.name: testUriAddSegment003
     * @tc.desc: Add a path segment to the URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriAddSegment003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('http://www.test.com');
      let newRoute = route.addSegment("files");
      expect(newRoute.getLastSegment()).assertEqual("files");
      expect(String(newRoute.getSegment().length)).assertEqual("1");
    })

    // Check the UriAddEncodedSegment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_12500
     * @tc.name: testUriAddEncodedSegment001
     * @tc.desc: Encode the path segment and add it to the URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriAddEncodedSegment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('http://www.test.com');
      let newRoute = route.addEncodedSegment("files").addEncodedSegment("image.jpg");
      expect(newRoute.getSegment()[1]).assertEqual("image.jpg");
    })

    // Check the UriAddEncodedSegment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_12600
     * @tc.name: testUriAddEncodedSegment002
     * @tc.desc: Encode the path segment and add it to the URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriAddEncodedSegment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route1 = new uri.URI('http://www.test.com?param%2B1=value1&param+2=value%202#fra+gemnt');
      let newRoute1 = route1.addSegment("my+files").addEncodedSegment("my+image.jpg");
      expect(newRoute1.toString())
        .assertEqual("http://www.test.com/my%2Bfiles/my+image.jpg?param%2B1=value1&param+2=value%202#fra+gemnt");
      expect(newRoute1.encodedUserInfo).assertEqual(null);
      expect(newRoute1.encodedPath).assertEqual("/my%2Bfiles/my+image.jpg");
      expect(newRoute1.encodedQuery).assertEqual('param%2B1=value1&param+2=value%202');
      expect(newRoute1.encodedFragment).assertEqual("fra+gemnt");
      expect(newRoute1.encodedAuthority).assertEqual("www.test.com");
      expect(newRoute1.encodedSSP)
        .assertEqual("//www.test.com/my%2Bfiles/my+image.jpg?param%2B1=value1&param+2=value%202");
      let route2 = new uri.URI('http://www.test.com/');
      let newRoute2 = route2.addSegment("my files").addEncodedSegment("my%20image.jpg");
      expect(newRoute2.toString()).assertEqual("http://www.test.com/my%20files/my%20image.jpg");
      expect(newRoute2.encodedUserInfo).assertEqual(null);
      expect(newRoute2.encodedPath).assertEqual("/my%20files/my%20image.jpg");
      expect(newRoute2.encodedQuery).assertEqual(null);
      expect(newRoute2.encodedFragment).assertEqual(null);
      expect(newRoute2.encodedAuthority).assertEqual("www.test.com");
      expect(newRoute2.encodedSSP).assertEqual("//www.test.com/my%20files/my%20image.jpg");
      let route3 = new uri.URI('http://username:my%20name@www.test.com/');
      let newRoute3 = route3.addSegment("my%2Bfiles").addEncodedSegment("my%2Bimage.jpg");
      expect(newRoute3.toString()).assertEqual("http://username:my%20name@www.test.com/my%252Bfiles/my%2Bimage.jpg");
      expect(newRoute3.encodedUserInfo).assertEqual("username:my%20name");
      expect(newRoute3.encodedPath).assertEqual("/my%252Bfiles/my%2Bimage.jpg");
      expect(newRoute3.encodedQuery).assertEqual(null);
      expect(newRoute3.encodedFragment).assertEqual(null);
      expect(newRoute3.encodedAuthority).assertEqual("username:my%20name@www.test.com");
      expect(newRoute3.encodedSSP).assertEqual("//username:my%20name@www.test.com/my%252Bfiles/my%2Bimage.jpg");
    })

    // Check the UriAddEncodedSegment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_12700
     * @tc.name: testUriAddEncodedSegment003
     * @tc.desc: Encode the path segment and add it to the URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriAddEncodedSegment003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let route = new uri.URI('http://www.test.com/');
        let newRoute = route.addEncodedSegment("my files");
      } catch (err: BusinessError) {
        expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string");
        expect(err.code).assertEqual(10200002);
        expect(err.message).assertEqual("Syntax Error. Invalid Uri string");
      }
    })

    // Check the UriCreateFromParts.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_12800
     * @tc.name: testUriCreateFromParts001
     * @tc.desc: Build a new URI object
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriCreateFromParts001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = uri.URI.createFromParts("http", "", "fragment");
      expect(route.toString()).assertEqual("http:#fragment");
    })

    // Check the UriCreateFromParts.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_12900
     * @tc.name: testUriCreateFromParts002
     * @tc.desc: Build a new URI object
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriCreateFromParts002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = uri.URI.createFromParts("mailto", "no body", "top");
      expect(route.toString()).assertEqual("mailto:no%20body#top");
    })

    // Check the UriCreateFromParts.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_13100
     * @tc.name: testUriCreateFromParts004
     * @tc.desc: Build a new URI object
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriCreateFromParts004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let scheme = "https";
      let ssp = "www.test.com";
      let fragment = "fragment";
      let route = uri.URI.createFromParts(scheme, ssp, fragment);
      expect(route.toString()).assertEqual("https:www.test.com#fragment");
    })

    // Check the UriEncodedUserInfo.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_13200
     * @tc.name: testUriEncodedUserInfo001
     * @tc.desc:Encoded URI user information
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriEncodedUserInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('http://username:name@www.test.com/');
      expect(route.encodedUserInfo).assertEqual("username:name");
    })

    // Check the UriEncodedUserInfo.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_13300
     * @tc.name: testUriEncodedUserInfo002
     * @tc.desc: Encoded URI user information
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriEncodedUserInfo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('http://username:@www.test.com/');
      expect(route.encodedUserInfo).assertEqual("username:");
    })

    // Check the UriEncodedUserInfo.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_13400
     * @tc.name: testUriEncodedUserInfo003
     * @tc.desc: Encoded URI user information
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriEncodedUserInfo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('http://username:my%20name@www.test.com/');
      expect(route.encodedUserInfo).assertEqual("username:my%20name");
    })

    // Check the UriEncodedUserInfo.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_13500
     * @tc.name: testUriEncodedUserInfo004
     * @tc.desc: Encoded URI user information
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriEncodedUserInfo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('http://www.test.com');
      expect(route.encodedUserInfo).assertEqual(null);
      let mailRoute = new uri.URI('mailto:body');
      expect(mailRoute.encodedUserInfo).assertEqual(null);
    })

    // Check the UriEncodedPath.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_13600
     * @tc.name: testUriEncodedPath001
     * @tc.desc: Encoded URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriEncodedPath001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('http://www.test.com/file/image.jpg');
      expect(route.encodedPath).assertEqual("/file/image.jpg");
    })

    // Check the UriEncodedPath.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_13700
     * @tc.name: testUriEncodedPath002
     * @tc.desc: Encoded URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriEncodedPath002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('http://www.test.com/');
      expect(route.encodedPath).assertEqual("/");
    })

    // Check the UriEncodedPath.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_13800
     * @tc.name: testUriEncodedPath003
     * @tc.desc: Encoded URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriEncodedPath003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('http://www.test.com');
      expect(route.encodedPath).assertEqual(null);
      let mailRoute = new uri.URI('mailto:body');
      expect(mailRoute.encodedPath).assertEqual(null);
    })

    // Check the UriEncodedPath.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_13900
     * @tc.name: testUriEncodedPath004
     * @tc.desc: Encoded URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriEncodedPath004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('http://www.test.com/my%20file');
      expect(route.encodedPath).assertEqual("/my%20file");
    })

    // Check the UriEncodedQuery.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_14000
     * @tc.name: testUriUriEncodedQuery001
     * @tc.desc: Encoded URI parameters
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriUriEncodedQuery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com/search?query=name&query=my');
      expect(route.encodedQuery).assertEqual("query=name&query=my");
    })

    // Check the UriEncodedQuery.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_14100
     * @tc.name: testUriUriEncodedQuery002
     * @tc.desc: Encoded URI parameters
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriUriEncodedQuery002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com/search?');
      expect(route.encodedQuery).assertEqual(null);
    })

    // Check the UriEncodedQuery.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_14200
     * @tc.name: testUriUriEncodedQuery003
     * @tc.desc: Encoded URI parameters
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriUriEncodedQuery003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com/');
      expect(route.encodedQuery).assertEqual(null);
    })

    // Check the UriEncodedQuery.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_14300
     * @tc.name: testUriUriEncodedQuery004
     * @tc.desc: Encoded URI parameters
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriUriEncodedQuery004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com/search?query=my%20test');
      expect(route.encodedQuery).assertEqual("query=my%20test");
    })

    // Check the UriEncodedFragment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_14400
     * @tc.name: testUriEncodedFragment001
     * @tc.desc: Encoded URI fragment
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriEncodedFragment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('mailto:body#top');
      expect(route.encodedFragment).assertEqual("top");
    })

    // Check the UriEncodedFragment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_14500
     * @tc.name: testUriEncodedFragment002
     * @tc.desc: Encoded URI fragment
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriEncodedFragment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('mailto:body#');
      expect(route.encodedFragment).assertEqual(null);
    })

    // Check the UriEncodedFragment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_14600
     * @tc.name: testUriEncodedFragment003
     * @tc.desc: Encoded URI fragment
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriEncodedFragment003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('mailto:body#te%20st');
      expect(route.encodedFragment).assertEqual("te%20st");
    })

    // Check the UriEncodedFragment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_14700
     * @tc.name: testUriEncodedFragment004
     * @tc.desc: Encoded URI fragment
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriEncodedFragment004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('mailto:body');
      expect(route.encodedFragment).assertEqual(null);
    })

    // Check the UriEncodedAuthority.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_14800
     * @tc.name: testUriEncodedAuthority001
     * @tc.desc: Encoded resource location information
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriEncodedAuthority001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com/search?query=name&query=my');
      expect(route.encodedAuthority).assertEqual("www.test.com");
    })

    // Check the UriEncodedAuthority.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_14900
     * @tc.name: testUriEncodedAuthority002
     * @tc.desc: Encoded resource location information
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriEncodedAuthority002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('http://username:my%20name@www.test.com/');
      expect(route.encodedAuthority).assertEqual("username:my%20name@www.test.com");
    })

    // Check the UriEncodedAuthority.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_15000
     * @tc.name: testUriEncodedAuthority003
     * @tc.desc: Encoded resource location information
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriEncodedAuthority003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('mailto:body#top');
      expect(route.encodedAuthority).assertEqual(null);
    })

    // Check the UriEncodedAuthority.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_15100
     * @tc.name: testUriEncodedAuthority004
     * @tc.desc: Encoded resource location information
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriEncodedAuthority004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com:8080/');
      expect(route.encodedAuthority).assertEqual("www.test.com:8080");
    })

    // Check the UriEncodedSSP.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_15200
     * @tc.name: testUriEncodedSSP001
     * @tc.desc: Encoded URI specific scheme section
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriEncodedSSP001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('http://username:name@www.test.com/path?query=example');
      expect(route.encodedSSP).assertEqual("//username:name@www.test.com/path?query=example");
    })

    // Check the UriEncodedSSP.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_15300
     * @tc.name: testUriEncodedSSP002
     * @tc.desc: Encoded URI specific scheme section
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriEncodedSSP002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('http://username:my%20name@www.test.com');
      expect(route.encodedSSP).assertEqual("//username:my%20name@www.test.com");
      let route1 = new uri.URI('http://username:my_20name@www.test.com');
      expect(route1.encodedSSP).assertEqual("//username:my_20name@www.test.com");
    })

    // Check the UriEncodedSSP.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_15400
     * @tc.name: testUriEncodedSSP003
     * @tc.desc: Encoded URI specific scheme section
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriEncodedSSP003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let route = new uri.URI('https://www.test.com/');
      expect(route.encodedSSP).assertEqual("//www.test.com/");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_16600
     * @tc.name: testTildeUnderline001
     * @tc.desc: Encoded URI specific scheme section
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTildeUnderline001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriTest = new uri.URI('http://www.bian~_cheng.net/inde~_x?param=10~_!*&para~_m1=20!-~_');
      expect(uriTest.host).assertEqual('www.bian~_cheng.net');
      expect(uriTest.path).assertEqual('/inde~_x');
      expect(uriTest.query).assertEqual('param=10~_!*&para~_m1=20!-~_');
      expect(uriTest.authority).assertEqual('www.bian~_cheng.net');
      expect(uriTest.ssp).assertEqual('//www.bian~_cheng.net/inde~_x?param=10~_!*&para~_m1=20!-~_');
      expect(uriTest.encodedPath).assertEqual('/inde~_x');
      expect(uriTest.encodedQuery).assertEqual('param=10~_!*&para~_m1=20!-~_');
      expect(uriTest.encodedAuthority).assertEqual('www.bian~_cheng.net');
      expect(uriTest.encodedSSP).assertEqual('//www.bian~_cheng.net/inde~_x?param=10~_!*&para~_m1=20!-~_');
    })
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_16700
     * @tc.name: testTildeUnderline002
     * @tc.desc: Encoded URI specific scheme section
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTildeUnderline002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriTest = new uri.URI('http://www.bian_cheng.net/inde_x?param=10_!*&para_m1=20!-_');
      expect(uriTest.host).assertEqual('www.bian_cheng.net');
      expect(uriTest.path).assertEqual('/inde_x');
      expect(uriTest.query).assertEqual('param=10_!*&para_m1=20!-_');
      expect(uriTest.authority).assertEqual('www.bian_cheng.net');
      expect(uriTest.ssp).assertEqual('//www.bian_cheng.net/inde_x?param=10_!*&para_m1=20!-_');
      expect(uriTest.encodedPath).assertEqual('/inde_x');
      expect(uriTest.encodedQuery).assertEqual('param=10_!*&para_m1=20!-_');
      expect(uriTest.encodedAuthority).assertEqual('www.bian_cheng.net');
      expect(uriTest.encodedSSP).assertEqual('//www.bian_cheng.net/inde_x?param=10_!*&para_m1=20!-_');
    })
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_16800
     * @tc.name: testTildeUnderline003
     * @tc.desc: Encoded URI specific scheme section
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTildeUnderline003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriTest = new uri.URI('http://www.bian~cheng.net/inde~x?param=10~!*&para~m1=20!-~');
      expect(uriTest.host).assertEqual('www.bian~cheng.net');
      expect(uriTest.path).assertEqual('/inde~x');
      expect(uriTest.query).assertEqual('param=10~!*&para~m1=20!-~');
      expect(uriTest.authority).assertEqual('www.bian~cheng.net');
      expect(uriTest.ssp).assertEqual('//www.bian~cheng.net/inde~x?param=10~!*&para~m1=20!-~');
      expect(uriTest.encodedPath).assertEqual('/inde~x');
      expect(uriTest.encodedQuery).assertEqual('param=10~!*&para~m1=20!-~');
      expect(uriTest.encodedAuthority).assertEqual('www.bian~cheng.net');
      expect(uriTest.encodedSSP).assertEqual('//www.bian~cheng.net/inde~x?param=10~!*&para~m1=20!-~');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_16900
     * @tc.name: testAddQueryJson001
     * @tc.desc: URI query add json
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAddQueryJson001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriTest = new uri.URI('aaa://drive/page?need=false&bbb=true');
      let newUri = uriTest.addQueryValue("data", '{"type": 0, "from": "from"}');
      expect(newUri.toString())
        .assertEqual('aaa://drive/page?need=false&bbb=true&data=%7B%22type%22%3A%200%2C%20%22from%22%3A%20%22from%22%7D');
      expect(newUri.query).assertEqual('need=false&bbb=true&data={"type": 0, "from": "from"}');
      expect(newUri.getQueryValue('data')).assertEqual('{"type": 0, "from": "from"}');
      expect(newUri.encodedQuery)
        .assertEqual('need=false&bbb=true&data=%7B%22type%22%3A%200%2C%20%22from%22%3A%20%22from%22%7D');
    })

    // Check the Uri constructor json.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_17700
     * @tc.name: testConstructorJson001
     * @tc.desc: URI constructor json
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testConstructorJson001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriObj = new uri.URI("testUri://testHost/testNumPage?need=false&bbb=true&data={\"aaa\":0,\"bbb\":\"ccc\"}");
      expect(uriObj.query).assertEqual('need=false&bbb=true&data={"aaa":0,"bbb":"ccc"}');
      // expect(JSON.parse(uriObj.getQueryValue('data')).aaa).assertEqual(0);
      // expect(JSON.parse(uriObj.getQueryValue('data')).bbb).assertEqual('ccc');
      expect(String(uriObj.getQueryValue('data'))).assertEqual('{"aaa":0,"bbb":"ccc"}');
    })

    // Check the Uri Special Characters.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_17800
     * @tc.name: testSpecialCharacters001
     * @tc.desc: URI Special Characters
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSpecialCharacters001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriStr =
        "hta{}_b- c|~d!a$b&c=d+e,;'()*vvtp://www.bi an'|{}()$~,;*!_-+:80/index?par(,;/) '_$:?+a{}|m=10-!*&pa ra~m1=20!-~#par(,;/) '_$:?+a{}|m=10-!*&para~m1=20!-~";
      let newUri = new uri.URI(uriStr);
      expect(newUri.scheme).assertEqual("hta{}_b- c|~d!a$b&c=d+e,;'()*vvtp");
      expect(newUri.getSegment()[0]).assertEqual("index");
      expect(newUri.query).assertEqual("par(,;/) '_$:?+a{}|m=10-!*&pa ra~m1=20!-~");
      expect(newUri.ssp).assertEqual("//www.bi an'|{}()$~,;*!_-+:80/index?par(,;/) '_$:?+a{}|m=10-!*&pa ra~m1=20!-~");
      expect(newUri.authority).assertEqual("www.bi an'|{}()$~,;*!_-+:80");
      expect(newUri.fragment).assertEqual("par(,;/) '_$:?+a{}|m=10-!*&para~m1=20!-~");
      expect(newUri.host).assertEqual("www.bi an'|{}()$~,;*!_-+");
      expect(newUri.userInfo).assertEqual(null);
      expect(newUri.port).assertEqual("80");
    })
    // Check the Uri Port.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_17900
     * @tc.name: testspecialPort001
     * @tc.desc: URI Special Characters
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testspecialPort001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriStr = "http://publickinfo:-1";
      let newUri = new uri.URI(uriStr);
      expect(newUri.toString()).assertEqual("http://publickinfo:-1");
      expect(newUri.port).assertEqual("-1");
      expect(newUri.host).assertEqual(null);
      expect(newUri.authority).assertEqual("publickinfo:-1");
    })
    // Check the Uri Port.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_18000
     * @tc.name: testspecialPort002
     * @tc.desc: URI Special Characters
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testspecialPort002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriStr = "http://publickinfo:2147483647";
      let newUri = new uri.URI(uriStr);
      expect(newUri.toString()).assertEqual("http://publickinfo:2147483647");
      expect(newUri.port).assertEqual("2147483647");
      expect(newUri.host).assertEqual('publickinfo');
      expect(newUri.authority).assertEqual("publickinfo:2147483647");
    })
    // Check the Uri Port.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_18100
     * @tc.name: testspecialPort003
     * @tc.desc: URI Special Characters
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testspecialPort003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriStr = "http://publickinfo:600000000332";
      let newUri = new uri.URI(uriStr);
      expect(newUri.toString()).assertEqual("http://publickinfo:600000000332");
      expect(newUri.port).assertEqual("-1");
      expect(newUri.host).assertEqual(null);
      expect(newUri.authority).assertEqual("publickinfo:600000000332");
    })
    // Check the Uri Port.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_18200
     * @tc.name: testspecialPort004
     * @tc.desc: URI Special Characters
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testspecialPort004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uriStr = "http://publickinfo:0";
      let newUri = new uri.URI(uriStr);
      expect(newUri.toString()).assertEqual("http://publickinfo:0");
      expect(newUri.port).assertEqual("0");
      expect(newUri.host).assertEqual("publickinfo");
      expect(newUri.authority).assertEqual("publickinfo:0");
    })

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_18300
     * @tc.name: testUriConstruction032
     * @tc.desc: URI Special Characters
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let that = new uri.URI('ht/tp://username:pas sword@host:8080/di[rectory/file?foo=1&bar=2');
      } catch (err: BusinessError) {
        expect(err.code).assertEqual(10200002)
      }
    })
    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_18400
     * @tc.name: testUriConstruction033
     * @tc.desc: URI Special Characters
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let that = new uri.URI('http://username:password@[::]:8080/directory/file?Query#abc^de');
      } catch (err: BusinessError) {
        expect(err.code).assertEqual(10200002)
      }
    })
    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_18500
     * @tc.name: testUriConstruction034
     * @tc.desc: URI Special Characters
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriConstruction034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let route = new uri.URI('content://com.test.uri/files/a^a');
        let segments = route.getSegment();
      } catch (err: BusinessError) {
        expect(err.code).assertEqual(10200002);
      }
    })
    // Check the UriAddEncodedSegment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_18600
     * @tc.name: testUriAddEncodedSegment004
     * @tc.desc: Encode the path segment and add it to the URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUriAddEncodedSegment004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let route = new uri.URI('http://www.test.com/');
        let newRoute = route.addEncodedSegment("my`files");
      } catch (err: BusinessError) {
        expect(err.code).assertEqual(10200002);
      }
    })
    // Check the UriSetScheme.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_18700
     * @tc.name: testUriUriSetScheme001
     * @tc.desc: Encode Scheme and set it to the URI Scheme
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetScheme001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("ht2tp://user@www.1hw.1com:77/path/path23?query#qwer");
      uriObj.scheme = "https:"
      expect(uriObj.toString()).assertEqual('https://user@www.1hw.1com:77/path/path23?query#qwer');
    })
    // Check the UriSetScheme.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_18800
     * @tc.name: testUriUriSetScheme002
     * @tc.desc: Encode Scheme and set it to the URI Scheme
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetScheme002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("ht2tp://user@www.1hw.1com:77/path/path23?query#qwer");
      uriObj.scheme = "3https:"
      expect(uriObj.toString()).assertEqual('ht2tp://user@www.1hw.1com:77/path/path23?query#qwer');
    })
    // Check the UriSetScheme.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_18900
     * @tc.name: testUriUriSetScheme003
     * @tc.desc: Encode Scheme and set it to the URI Scheme
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetScheme003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("ht2tp://user@www.1hw.1com:77/path/path23?query#qwer");
      uriObj.scheme = "asffdsa"
      expect(uriObj.toString()).assertEqual('asffdsa://user@www.1hw.1com:77/path/path23?query#qwer');
    })
    // Check the UriSetScheme.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_19000
     * @tc.name: testUriUriSetScheme004
     * @tc.desc: Encode Scheme and set it to the URI Scheme
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetScheme004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("ht2tp://user@www.1hw.1com:77/path/path23?query#qwer");
      uriObj.scheme = "%asffdsa"
      expect(uriObj.toString()).assertEqual('ht2tp://user@www.1hw.1com:77/path/path23?query#qwer');
    })
    // Check the UriSetScheme.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_19100
     * @tc.name: testUriUriSetScheme005
     * @tc.desc: Encode Scheme and set it to the URI Scheme
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetScheme005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://user@www.1hw.1com:77/path/path23?query#qwer");
      uriObj.scheme = ""
      expect(uriObj.toString()).assertEqual('http://user@www.1hw.1com:77/path/path23?query#qwer');
    })
    // Check the UriSetScheme.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_19200
     * @tc.name: testUriUriSetScheme006
     * @tc.desc: Encode Scheme and set it to the URI Scheme
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetScheme006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://user@www.1hw.1com:77?query#qwer");
      uriObj.scheme = "testuri006"
      expect(uriObj.scheme).assertEqual('testuri006');
    })
    // Check the UriSetUserInfo.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_19300
     * @tc.name: testUriUriSetUserInfo001
     * @tc.desc: Encode UserInfo and set it to the URI UserInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetUserInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://user@www.hw.com:77/path/path23?query#qwer");
      uriObj.userInfo = "testuri007"
      expect(uriObj.userInfo).assertEqual('testuri007');
      expect(uriObj.toString()).assertEqual('http://testuri007@www.hw.com:77/path/path23?query#qwer');
    })
    // Check the UriSetUserInfo.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_19400
     * @tc.name: testUriUriSetUserInfo002
     * @tc.desc: Encode UserInfo and set it to the URI UserInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetUserInfo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://www.test.com:77/path/path23?query#qwer");
      uriObj.userInfo = "testuri008"
      expect(uriObj.userInfo).assertEqual('testuri008');
      expect(uriObj.toString()).assertEqual('http://testuri008@www.test.com:77/path/path23?query#qwer');
    })
    // Check the UriSetUserInfo.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_19500
     * @tc.name: testUriUriSetUserInfo003
     * @tc.desc: Encode UserInfo and set it to the URI UserInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetUserInfo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
      uriObj.userInfo = "sji<+s大"
      expect(uriObj.userInfo).assertEqual('sji<+s大');
      expect(uriObj.toString()).assertEqual('http://sji%3C%2Bs%E5%A4%A7@www.test.com:77/path/path23?query#qwer');
    })
    // Check the UriSetUserInfo.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_19600
     * @tc.name: testUriUriSetUserInfo004
     * @tc.desc: Encode UserInfo and set it to the URI UserInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetUserInfo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http:/userinfo@www.test.com:77/path/path23?query#qwer");
      uriObj.userInfo = "sji<+s大"
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.toString()).assertEqual('http:/userinfo@www.test.com:77/path/path23?query#qwer');
    })
    // Check the UriSetUserInfo.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_19700
     * @tc.name: testUriUriSetUserInfo005
     * @tc.desc: Encode UserInfo and set it to the URI UserInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetUserInfo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
      uriObj.userInfo = ""
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.toString()).assertEqual('http://www.test.com:77/path/path23?query#qwer');
    })
    // Check the UriSetPath.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_19800
     * @tc.name: testUriUriSetPath001
     * @tc.desc: Encode Path and set it to the URI Path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetPath001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
      uriObj.path = ""
      expect(uriObj.path).assertEqual(null);
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77?query#qwer');
    })
    // Check the UriSetPath.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_19900
     * @tc.name: testUriUriSetPath002
     * @tc.desc: Encode Path and set it to the URI Path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetPath002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
      uriObj.path = "pathtest/pp"
      expect(uriObj.path).assertEqual('pathtest/pp');
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/pathtest/pp?query#qwer');
    })
    // Check the UriSetPath.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_20000
     * @tc.name: testUriUriSetPath003
     * @tc.desc: Encode Path and set it to the URI Path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetPath003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
      uriObj.path = "pathtest/p大p"
      expect(uriObj.path).assertEqual('pathtest/p大p');
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/pathtest/p%E5%A4%A7p?query#qwer');
    })
    // Check the UriSetPath.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_20100
     * @tc.name: testUriUriSetPath004
     * @tc.desc: Encode Path and set it to the URI Path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetPath004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77?query#qwer");
      uriObj.path = "/testuri015/p大p/"
      expect(uriObj.path).assertEqual('/testuri015/p大p/');
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/testuri015/p%E5%A4%A7p/?query#qwer');
    })
    // Check the UriSetPath.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_20200
     * @tc.name: testUriUriSetPath005
     * @tc.desc: Encode Path and set it to the URI Path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetPath005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77?query#qwer");
      uriObj.path = "/testuri016/p大p/"
      expect(uriObj.ssp).assertEqual('//userinfo@www.test.com:77/testuri016/p大p/?query');
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/testuri016/p%E5%A4%A7p/?query#qwer');
    })
    // Check the UriSetPath.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_20300
     * @tc.name: testUriUriSetPath006
     * @tc.desc: Encode Path and set it to the URI Path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetPath006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http:userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.path = "/testuri017/p大p/"
      expect(uriObj.path).assertEqual('/testuri017/p大p/');
      expect(uriObj.toString()).assertEqual('http:/testuri017/p%E5%A4%A7p/#qwer');
    })
    // Check the UriSetQuery.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_20400
     * @tc.name: testUriUriSetQuery001
     * @tc.desc: Encode Query and set it to the URI Query
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetQuery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.query = "/testuri018/p大p/=sasf"
      expect(uriObj.query).assertEqual('/testuri018/p大p/=sasf');
      let res = 'http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?%2Ftesturi018%2Fp%E5%A4%A7p%2F%3Dsasf#qwer';
      expect(uriObj.toString()).assertEqual(res);
    })
    // Check the UriSetQuery.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_20500
     * @tc.name: testUriUriSetQuery002
     * @tc.desc: Encode Query and set it to the URI Query
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetQuery002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.query = "key=value&key1=value1"
      expect(uriObj.query).assertEqual('key=value&key1=value1');
      let res = 'http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?key%3Dvalue%26key1%3Dvalue1#qwer';
      expect(uriObj.toString()).assertEqual(res);
    })
    // Check the UriSetQuery.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_20600
     * @tc.name: testUriUriSetQuery003
     * @tc.desc: Encode Query and set it to the URI Query
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetQuery003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.query = '';
      expect(uriObj.query).assertEqual(null);
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/#qwer');
    })
    // Check the UriSetQuery.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_20700
     * @tc.name: testUriUriSetQuery004
     * @tc.desc: Encode Query and set it to the URI Query
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetQuery004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.query = 'kkey=sal';
      expect(uriObj.query).assertEqual("kkey=sal");
      expect(uriObj.ssp).assertEqual("//userinfo@www.test.com:77/testuri017/p大p/?kkey=sal");
      let res = 'http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?kkey%3Dsal#qwer';
      expect(uriObj.toString()).assertEqual(res);
    })
    // Check the UriSetQuery.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_20800
     * @tc.name: testUriUriSetQuery005
     * @tc.desc: Encode Query and set it to the URI Query
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetQuery005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http:/userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.query = 'kkey=sal&jj=oi';
      expect(uriObj.query).assertEqual("kkey=sal&jj=oi");
      expect(uriObj.ssp).assertEqual("/userinfo@www.test.com:77/testuri017/p大p/?kkey=sal&jj=oi");
      let res = 'http:/userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?kkey%3Dsal%26jj%3Doi#qwer';
      expect(uriObj.toString()).assertEqual(res);
    })
    // Check the UriSetFragment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_20900
     * @tc.name: testUriUriSetFragment001
     * @tc.desc: Encode Fragment and set it to the URI Fragment
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetFragment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http:/userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.fragment = 'kkey=sal&jj=oi';
      expect(uriObj.fragment).assertEqual("kkey=sal&jj=oi");
      expect(uriObj.ssp).assertEqual("/userinfo@www.test.com:77/testuri017/p大p/?query");
      let res = 'http:/userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query#kkey%3Dsal%26jj%3Doi';
      expect(uriObj.toString()).assertEqual(res);
    })
    // Check the UriSetFragment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_21000
     * @tc.name: testUriUriSetFragment002
     * @tc.desc: Encode Fragment and set it to the URI Fragment
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetFragment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http:/userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.fragment = '';
      expect(uriObj.fragment).assertEqual(null);
      expect(uriObj.toString()).assertEqual('http:/userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query');
    })
    // Check the UriSetFragment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_21100
     * @tc.name: testUriUriSetFragment003
     * @tc.desc: Encode Fragment and set it to the URI Fragment
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetFragment003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http:/userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.fragment = '#jia片段';
      expect(uriObj.fragment).assertEqual("#jia片段");
      let res = 'http:/userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query#%23jia%E7%89%87%E6%AE%B5';
      expect(uriObj.toString()).assertEqual(res);
    })
    // Check the UriSetFragment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_21200
     * @tc.name: testUriUriSetFragment004
     * @tc.desc: Encode Fragment and set it to the URI Fragment
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetFragment004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query");
      uriObj.fragment = '#jia片段f';
      expect(uriObj.fragment).assertEqual("#jia片段f");
      let res = 'http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query#%23jia%E7%89%87%E6%AE%B5f';
      expect(uriObj.toString()).assertEqual(res);
    })
    // Check the UriSetFragment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_21300
     * @tc.name: testUriUriSetFragment005
     * @tc.desc: Encode Fragment and set it to the URI Fragment
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetFragment005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http:userinfo@www.test.com:77/testuri017/p大p/?query");
      uriObj.fragment = 'jia片段f';
      expect(uriObj.fragment).assertEqual("jia片段f");
      let res = 'http:userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query#jia%E7%89%87%E6%AE%B5f';
      expect(uriObj.toString()).assertEqual(res);
    })
    // Check the UriSetAuthority.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_21400
     * @tc.name: testUriUriSetAuthority001
     * @tc.desc: Encode Authority and set it to the URI Authority
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetAuthority001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.authority = 'www.test11.cn:88';
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.host).assertEqual("www.test11.cn");
      expect(uriObj.port).assertEqual("88");
      expect(uriObj.toString()).assertEqual('http://www.test11.cn:88/testuri017/p%E5%A4%A7p/?query#asd');
    })
    // Check the UriSetAuthority.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_21500
     * @tc.name: testUriUriSetAuthority002
     * @tc.desc: Encode Authority and set it to the URI Authority
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetAuthority002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.authority = 'uusc@www.testuc.com:741';
      expect(uriObj.userInfo).assertEqual("uusc");
      expect(uriObj.host).assertEqual("www.testuc.com");
      expect(uriObj.port).assertEqual("741");
      expect(uriObj.authority).assertEqual("uusc@www.testuc.com:741");
      expect(uriObj.toString()).assertEqual('http://uusc@www.testuc.com:741/testuri017/p%E5%A4%A7p/?query#asd');
    })
    // Check the UriSetAuthority.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_21600
     * @tc.name: testUriUriSetAuthority003
     * @tc.desc: Encode Authority and set it to the URI Authority
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetAuthority003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.authority = '';
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.host).assertEqual(null);
      expect(uriObj.port).assertEqual("-1");
      expect(uriObj.authority).assertEqual(null);
      expect(uriObj.ssp).assertEqual('/testuri017/p大p/?query');
      expect(uriObj.toString()).assertEqual('http:/testuri017/p%E5%A4%A7p/?query#asd');
    })
    // Check the UriSetAuthority.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_21700
     * @tc.name: testUriUriSetAuthority004
     * @tc.desc: Encode Authority and set it to the URI Authority
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetAuthority004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.authority = 'usc@';
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.host).assertEqual(null);
      expect(uriObj.port).assertEqual("-1");
      expect(uriObj.authority).assertEqual("usc@");
      expect(uriObj.ssp).assertEqual('//usc@/testuri017/p大p/?query');
      expect(uriObj.toString()).assertEqual('http://usc@/testuri017/p%E5%A4%A7p/?query#asd');
    })
    // Check the UriSetSsp.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_21800
     * @tc.name: testUriUriSetSsp001
     * @tc.desc: Encode Ssp and set it to the URI Ssp
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetSsp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.ssp = 'usc@asjf:99/path1/ss?key=1';
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.host).assertEqual(null);
      expect(uriObj.port).assertEqual("-1");
      expect(uriObj.authority).assertEqual(null);
      expect(uriObj.path).assertEqual(null);
      expect(uriObj.ssp).assertEqual('usc@asjf:99/path1/ss?key=1');
      expect(uriObj.toString()).assertEqual('http:usc@asjf:99/path1/ss?key=1#asd');
    })
    // Check the UriSetSsp.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_21900
     * @tc.name: testUriUriSetSsp002
     * @tc.desc: Encode Ssp and set it to the URI Ssp
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetSsp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.ssp = '/usc@asjf:99/path1/ss?key=1';
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.host).assertEqual(null);
      expect(uriObj.path).assertEqual("/usc@asjf:99/path1/ss");
      expect(uriObj.authority).assertEqual(null);
      expect(uriObj.ssp).assertEqual('/usc@asjf:99/path1/ss?key=1');
      expect(uriObj.toString()).assertEqual('http:/usc@asjf:99/path1/ss?key=1#asd');
    })
    // Check the UriSetSsp.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_22000
     * @tc.name: testUriUriSetSsp003
     * @tc.desc: Encode Ssp and set it to the URI Ssp
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetSsp003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("safdcas://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.ssp = '//usc@www.test321.cn:996?key=1';
      expect(uriObj.userInfo).assertEqual("usc");
      expect(uriObj.host).assertEqual("www.test321.cn");
      expect(uriObj.path).assertEqual(null);
      expect(uriObj.authority).assertEqual('usc@www.test321.cn:996');
      expect(uriObj.ssp).assertEqual('//usc@www.test321.cn:996?key=1');
      expect(uriObj.toString()).assertEqual('safdcas://usc@www.test321.cn:996?key=1#asd');
    })
    // Check the UriSetSsp.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_22100
     * @tc.name: testUriUriSetSsp004
     * @tc.desc: Encode Ssp and set it to the URI Ssp
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetSsp004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("safdcas://userinfo@www.test.com:77/testuri017/p大p/?query#asdasf");
      uriObj.ssp = '//www.test321.cn';
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.host).assertEqual("www.test321.cn");
      expect(uriObj.path).assertEqual(null);
      expect(uriObj.authority).assertEqual('www.test321.cn');
      expect(uriObj.ssp).assertEqual('//www.test321.cn');
      expect(uriObj.toString()).assertEqual('safdcas://www.test321.cn#asdasf');
    })
    // Check the UriSetEncodedUserInfo.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_22200
     * @tc.name: testUriUriSetEncodedUserInfo001
     * @tc.desc: set EncodedUserInfo to the URI UserInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedUserInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://user@www.hw.com:77/path/path23?query#qwer");
      uriObj.encodedUserInfo = "testuri007"
      expect(uriObj.encodedUserInfo).assertEqual('testuri007');
      expect(uriObj.toString()).assertEqual('http://testuri007@www.hw.com:77/path/path23?query#qwer');
    })
    // Check the UriSetEncodedUserInfo.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_22300
     * @tc.name: testUriUriSetEncodedUserInfo002
     * @tc.desc: set EncodedUserInfo to the URI UserInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedUserInfo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://www.test.com:77/path/path23?query#qwer");
      uriObj.encodedUserInfo = "testuri008"
      expect(uriObj.encodedUserInfo).assertEqual('testuri008');
      expect(uriObj.toString()).assertEqual('http://testuri008@www.test.com:77/path/path23?query#qwer');
    })
    // Check the UriSetEncodedUserInfo.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_22400
     * @tc.name: testUriUriSetEncodedUserInfo003
     * @tc.desc: set EncodedUserInfo to the URI UserInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedUserInfo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
      uriObj.encodedUserInfo = "sji<+s大"
      expect(uriObj.encodedUserInfo).assertEqual('userinfo');
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/path/path23?query#qwer');
    })
    // Check the UriSetEncodedUserInfo.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_22500
     * @tc.name: testUriUriSetEncodedUserInfo004
     * @tc.desc: set EncodedUserInfo to the URI UserInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedUserInfo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http:/userinfo@www.test.com:77/path/path23?query#qwer");
      uriObj.encodedUserInfo = "sji<+s大"
      expect(uriObj.encodedUserInfo).assertEqual(null);
      expect(uriObj.toString()).assertEqual('http:/userinfo@www.test.com:77/path/path23?query#qwer');
    })
    // Check the UriSetEncodedUserInfo.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_22600
     * @tc.name: testUriUriSetEncodedUserInfo005
     * @tc.desc: set EncodedUserInfo to the URI UserInfo
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedUserInfo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
      uriObj.encodedUserInfo = ""
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.toString()).assertEqual('http://www.test.com:77/path/path23?query#qwer');
    })
    // Check the UriSetEncodedPath.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_22700
     * @tc.name: testUriUriSetEncodedPath001
     * @tc.desc: set EncodedPath to the URI Path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedPath001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
      uriObj.encodedPath = ""
      expect(uriObj.encodedPath).assertEqual(null);
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77?query#qwer');
    })
    // Check the UriSetEncodedPath.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_22800
     * @tc.name: testUriUriSetEncodedPath002
     * @tc.desc: set EncodedPath to the URI Path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedPath002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
      uriObj.encodedPath = "pathtest/pp"
      expect(uriObj.encodedPath).assertEqual('pathtest/pp');
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/pathtest/pp?query#qwer');
    })
    // Check the UriSetEncodedPath.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_22900
     * @tc.name: testUriUriSetEncodedPath003
     * @tc.desc: set EncodedPath to the URI Path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedPath003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
      uriObj.encodedPath = "pathtest/p%E5%A4%A7p"
      expect(uriObj.encodedPath).assertEqual('pathtest/p%E5%A4%A7p');
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/pathtest/p%E5%A4%A7p?query#qwer');
    })
    // Check the UriSetEncodedPath.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_23000
     * @tc.name: testUriUriSetEncodedPath004
     * @tc.desc: set EncodedPath to the URI Path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedPath004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77?query#qwer");
      uriObj.encodedPath = "/testuri015/p大p/"
      expect(uriObj.encodedPath).assertEqual('/testuri015/p大p/');
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/testuri015/p%E5%A4%A7p/?query#qwer');
    })
    // Check the UriSetEncodedPath.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_23100
     * @tc.name: testUriUriSetEncodedPath005
     * @tc.desc: set EncodedPath to the URI Path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedPath005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77");
      uriObj.encodedPath = "testuri016/p%E5%A4%A7/"
      expect(uriObj.encodedPath).assertEqual('testuri016/p%E5%A4%A7/');
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/testuri016/p%E5%A4%A7/');
    })
    // Check the UriSetEncodedQuery.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_23200
     * @tc.name: testUriUriSetEncodedQuery001
     * @tc.desc: set EncodedQuery to the URI Query
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedQuery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.encodedQuery = "/testuri018/p大p/=sasf"
      expect(uriObj.encodedQuery).assertEqual('/testuri018/p大p/=sasf');
      let res = 'http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?/testuri018/p%E5%A4%A7p/=sasf#qwer';
      expect(uriObj.toString()).assertEqual(res);
    })
    // Check the UriSetEncodedQuery.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_23300
     * @tc.name: testUriUriSetEncodedQuery002
     * @tc.desc: set EncodedQuery to the URI Query
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedQuery002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.encodedQuery = "key=value&key1=value1"
      expect(uriObj.encodedQuery).assertEqual('key=value&key1=value1');
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?key=value&key1=value1#qwer');
    })
    // Check the UriSetEncodedQuery.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_23400
     * @tc.name: testUriUriSetEncodedQuery003
     * @tc.desc: set EncodedQuery to the URI Query
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedQuery003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.encodedQuery = '';
      expect(uriObj.encodedQuery).assertEqual(null);
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/#qwer');
    })
    // Check the UriSetEncodedQuery.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_23500
     * @tc.name: testUriUriSetEncodedQuery004
     * @tc.desc: set EncodedQuery to the URI Query
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedQuery004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.encodedQuery = 'kkey=sal';
      expect(uriObj.encodedQuery).assertEqual("kkey=sal");
      expect(uriObj.ssp).assertEqual("//userinfo@www.test.com:77/testuri017/p大p/?kkey=sal");
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?kkey=sal#qwer');
    })
    // Check the UriSetEncodedQuery.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_23600
     * @tc.name: testUriUriSetEncodedQuery005
     * @tc.desc: set EncodedQuery to the URI Query
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedQuery005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http:/userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.encodedQuery = 'kkey=sal&jj=oi';
      expect(uriObj.encodedQuery).assertEqual("kkey=sal&jj=oi");
      expect(uriObj.ssp).assertEqual("/userinfo@www.test.com:77/testuri017/p大p/?kkey=sal&jj=oi");
      expect(uriObj.toString()).assertEqual('http:/userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?kkey=sal&jj=oi#qwer');
    })
    // Check the UriSetEncodedFragment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_23700
     * @tc.name: testUriUriSetEncodedFragment001
     * @tc.desc: set EncodedFragment to the URI Fragment
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedFragment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http:/userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.encodedFragment = 'kkey=sal&jj=oi';
      expect(uriObj.encodedFragment).assertEqual("kkey=sal&jj=oi");
      expect(uriObj.ssp).assertEqual("/userinfo@www.test.com:77/testuri017/p大p/?query");
      expect(uriObj.toString()).assertEqual('http:/userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query#kkey=sal&jj=oi');
    })
    // Check the UriSetEncodedFragment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_23800
     * @tc.name: testUriUriSetEncodedFragment002
     * @tc.desc: set EncodedFragment to the URI Fragment
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedFragment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http:/userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.encodedFragment = '';
      expect(uriObj.encodedFragment).assertEqual(null);
      expect(uriObj.toString()).assertEqual('http:/userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query');
    })
    // Check the UriSetEncodedFragment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_23900
     * @tc.name: testUriUriSetEncodedFragment003
     * @tc.desc: set EncodedFragment to the URI Fragment
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedFragment003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http:/userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
      uriObj.encodedFragment = '#jia片段';
      expect(uriObj.encodedFragment).assertEqual("qwer");
      expect(uriObj.toString()).assertEqual('http:/userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query#qwer');
    })
    // Check the UriSetEncodedFragment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_24000
     * @tc.name: testUriUriSetEncodedFragment004
     * @tc.desc: set EncodedFragment to the URI Fragment
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedFragment004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query");
      uriObj.encodedFragment = 'jia片段f';
      expect(uriObj.encodedFragment).assertEqual("jia片段f");
      expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query#jia%E7%89%87%E6%AE%B5f');
    })
    // Check the UriSetEncodedFragment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_24100
     * @tc.name: testUriUriSetEncodedFragment005
     * @tc.desc: set EncodedFragment to the URI Fragment
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedFragment005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http:userinfo@www.test.com:77/testuri017/p大p/?query");
      uriObj.encodedFragment = 'jia片段f';
      expect(uriObj.encodedFragment).assertEqual("jia片段f");
      expect(uriObj.toString()).assertEqual('http:userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query#jia%E7%89%87%E6%AE%B5f');
    })
    // Check the UriSetEncodedAuthority.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_24200
     * @tc.name: testUriUriSetEncodedAuthority001
     * @tc.desc: set EncodedAuthority to the URI Authority
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedAuthority001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.encodedAuthority = 'www.test11.cn:88';
      expect(uriObj.encodedUserInfo).assertEqual(null);
      expect(uriObj.host).assertEqual("www.test11.cn");
      expect(uriObj.port).assertEqual("88");
      expect(uriObj.toString()).assertEqual('http://www.test11.cn:88/testuri017/p%E5%A4%A7p/?query#asd');
    })
    // Check the UriSetEncodedAuthority.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_24300
     * @tc.name: testUriUriSetEncodedAuthority002
     * @tc.desc: set EncodedAuthority to the URI Authority
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedAuthority002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.encodedAuthority = 'uusc@www.testuc.com:741';
      expect(uriObj.encodedUserInfo).assertEqual("uusc");
      expect(uriObj.host).assertEqual("www.testuc.com");
      expect(uriObj.port).assertEqual("741");
      expect(uriObj.encodedAuthority).assertEqual("uusc@www.testuc.com:741");
      expect(uriObj.toString()).assertEqual('http://uusc@www.testuc.com:741/testuri017/p%E5%A4%A7p/?query#asd');
    })
    // Check the UriSetEncodedAuthority.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_24400
     * @tc.name: testUriUriSetEncodedAuthority003
     * @tc.desc: set EncodedAuthority to the URI Authority
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedAuthority003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.encodedAuthority = '';
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.host).assertEqual(null);
      expect(uriObj.port).assertEqual("-1");
      expect(uriObj.encodedAuthority).assertEqual(null);
      expect(uriObj.encodedSSP).assertEqual('/testuri017/p大p/?query');
      expect(uriObj.toString()).assertEqual('http:/testuri017/p%E5%A4%A7p/?query#asd');
    })
    // Check the UriSetEncodedAuthority.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_24500
     * @tc.name: testUriUriSetEncodedAuthority004
     * @tc.desc: set EncodedAuthority to the URI Authority
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedAuthority004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.encodedAuthority = 'usc@';
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.host).assertEqual(null);
      expect(uriObj.port).assertEqual("-1");
      expect(uriObj.encodedAuthority).assertEqual("usc@");
      expect(uriObj.encodedSSP).assertEqual('//usc@/testuri017/p大p/?query');
      expect(uriObj.toString()).assertEqual('http://usc@/testuri017/p%E5%A4%A7p/?query#asd');
    })
    // Check the UriSetEncodedSsp.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_24600
     * @tc.name: testUriUriSetEncodedSsp001
     * @tc.desc: set EncodedSsp to the URI Ssp
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedSsp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.encodedSSP = 'usc@asjf:99/path1/ss?key=1';
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.host).assertEqual(null);
      expect(uriObj.port).assertEqual("-1");
      expect(uriObj.authority).assertEqual(null);
      expect(uriObj.path).assertEqual(null);
      expect(uriObj.encodedSSP).assertEqual('usc@asjf:99/path1/ss?key=1');
      expect(uriObj.toString()).assertEqual('http:usc@asjf:99/path1/ss?key=1#asd');
    })
    // Check the UriSetEncodedSsp.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_24700
     * @tc.name: testUriUriSetEncodedSsp002
     * @tc.desc: set EncodedSsp to the URI Ssp
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedSsp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.encodedSSP = '/usc@asjf:99/path1/ss?key=1';
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.host).assertEqual(null);
      expect(uriObj.path).assertEqual("/usc@asjf:99/path1/ss");
      expect(uriObj.authority).assertEqual(null);
      expect(uriObj.encodedSSP).assertEqual('/usc@asjf:99/path1/ss?key=1');
      expect(uriObj.toString()).assertEqual('http:/usc@asjf:99/path1/ss?key=1#asd');
    })
    // Check the UriSetEncodedSsp.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_24800
     * @tc.name: testUriUriSetEncodedSsp003
     * @tc.desc: set EncodedSsp to the URI Ssp
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedSsp003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("safdcas://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
      uriObj.encodedSSP = '//usc@www.test321.cn:996?key=1';
      expect(uriObj.userInfo).assertEqual("usc");
      expect(uriObj.host).assertEqual("www.test321.cn");
      expect(uriObj.path).assertEqual(null);
      expect(uriObj.encodedAuthority).assertEqual('usc@www.test321.cn:996');
      expect(uriObj.encodedSSP).assertEqual('//usc@www.test321.cn:996?key=1');
      expect(uriObj.toString()).assertEqual('safdcas://usc@www.test321.cn:996?key=1#asd');
    })
    // Check the UriSetEncodedSsp.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_24900
     * @tc.name: testUriUriSetEncodedSsp004
     * @tc.desc: set EncodedSsp to the URI Ssp
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriUriSetEncodedSsp004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriObj = new uri.URI("safdcas://userinfo@www.test.com:77/testuri017/p大p/?query#asdasf");
      uriObj.encodedSSP = '//www.test321.cn';
      expect(uriObj.userInfo).assertEqual(null);
      expect(uriObj.host).assertEqual("www.test321.cn");
      expect(uriObj.path).assertEqual(null);
      expect(uriObj.authority).assertEqual('www.test321.cn');
      expect(uriObj.encodedSSP).assertEqual('//www.test321.cn');
      expect(uriObj.toString()).assertEqual('safdcas://www.test321.cn#asdasf');
    })
  })
}