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
  import { BusinessError } from '@ohos.base';
  import geoLocationManager from '@ohos.geoLocationManager';
  import hilog from '@ohos.hilog'
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BusinessError } from '@ohos.base';
import AbilityStage from "@ohos.app.ability.AbilityStage"
import { Driver, ON } from '@ohos.UiTest';

let domain: int = 0x0000;
let tag: string = 'testTag';
let addMonitor = false;
let removeMonitor = false;
let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let abilityStageContext: common.AbilityStageContext

  export default function xmlTest1() {
    describe('xmlTest1', (): void => {
          /**
     * @tc.name   testUriConstruction001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0100
     * @tc.desc   Constructs a URI by parsing the given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUriConstruction001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=1&bar=2');
      } catch (err) {
          expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string: The #It can't be the first");
          expect(err.code).assertEqual(10200002)
          expect(err.message).assertEqual("Syntax Error. Invalid Uri string: The #It can't be the first");
      }
  })

  // Check the UriConstruction.
  /**
   * @tc.name   testUriConstruction002
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0200
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      try {
          var a = {name: 'gaogao'}
          let that = new uri.URI(a);
      } catch (err) {
          expect(err.toString()).assertEqual(`BusinessError: Parameter error. The type of ${a} must be string`);
          expect(err.code).assertEqual(401)
          expect(err.message).assertEqual(`Parameter error. The type of ${a} must be string`);
      }
  })

  // Check the UriConstruction.
  /**
   * @tc.name   testUriConstruction003
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0300
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      try {
          let that = new uri.URI('ht/tp://username:pas sword@host:8080/directory/file?foo=1&bar=2');
      } catch (err) {
          expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string");
          expect(err.code).assertEqual(10200002)
          expect(err.message).assertEqual("Syntax Error. Invalid Uri string");
      }
  })

  // Check the UriConstruction.
  /**
   * @tc.name   testUriConstruction004
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0400
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      try {
          let that = new uri.URI('http://username:password@[::]:8080/directory/file?Query#gaogao faofao');
      } catch (err) {
          expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string");
          expect(err.code).assertEqual(10200002)
          expect(err.message).assertEqual("Syntax Error. Invalid Uri string");
      }
  })

  // Check the UriConstruction.
  /**
   * @tc.name   testUriConstruction005
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0500
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      try {
          let that = new uri.URI('http://username:password@host:8080/directory/file?foo^=1&bar=2#gaogaofaofao');
      } catch (err) {
          expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string: The Query does not conform to the rule");
          expect(err.code).assertEqual(10200002)
          expect(err.message).assertEqual("Syntax Error. Invalid Uri string: The Query does not conform to the rule");
      }
  })

  // Check the UriConstruction.
  /**
   * @tc.name   testUriConstruction006
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0600
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      try {
          let that = new uri.URI('1http://username:password@host:8080/directory/file?foo=1&bar=2#gaogaofaofao');
      } catch (err) {
          expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string: The Scheme the first character must be a letter");
          expect(err.code).assertEqual(10200002)
          expect(err.message).assertEqual("Syntax Error. Invalid Uri string: The Scheme the first character must be a letter");
      }
  })

  // Check the UriConstruction.
  /**
   * @tc.name   testUriConstruction007
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0700
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      try {
          let that = new uri.URI('ht@tp://username:password@host:8080/directory/file?foo=1&bar=2#gaogaofaofao');
      } catch (err) {
          expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string: The scheme does not conform to the rule");
          expect(err.code).assertEqual(10200002)
          expect(err.message).assertEqual("Syntax Error. Invalid Uri string: The scheme does not conform to the rule");
      }
  })

  // Check the UriConstruction.
  /**
   * @tc.name   testUriConstruction008
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0800
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      try {
          let that = new uri.URI('http://username:password@[::]:80r80/directory/file?foo=1&bar=2#gaogaofaofao');
      } catch (err) {
          expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string: The Prot does not conform to the rule");
          expect(err.code).assertEqual(10200002)
          expect(err.message).assertEqual("Syntax Error. Invalid Uri string: The Prot does not conform to the rule");
      }
  })

  // Check the UriConstruction.
  /**
   * @tc.name   testUriConstruction009
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_0900
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      try {
          let that = new uri.URI('http://username:password@[::12:55:8080/directory/file?foo=1&bar=2#gaogaofaofao');
      } catch (err) {
          expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string: The IPv6 is missing a closing bracket");
          expect(err.code).assertEqual(10200002)
          expect(err.message).assertEqual("Syntax Error. Invalid Uri string: The IPv6 is missing a closing bracket");
      }
  })

  // Check the UriConstruction.
  /**
   * @tc.name   testUriConstruction010
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1000
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      try {
          let that = new uri.URI('http://username:pa^ssword@[::12:55]:8080/directory/file?foo=1&bar=2#gaogaofaofao');
      } catch (err) {
          expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string: The userInfo does not conform to the rule");
          expect(err.code).assertEqual(10200002)
          expect(err.message).assertEqual("Syntax Error. Invalid Uri string: The userInfo does not conform to the rule");
      }
  })

  // Check the UriConstruction.
  /**
   * @tc.name   testUriConstruction011
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1100
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      try {
          let that = new uri.URI('http://username:password@[::1你2:55]:8080/directory/file?foo=1&bar=2#gaogaofaofao');
      } catch (err) {
          expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string: The ipv6 does not conform to the rule");
          expect(err.code).assertEqual(10200002)
          expect(err.message).assertEqual("Syntax Error. Invalid Uri string: The ipv6 does not conform to the rule");
      }
  })

  // Check the UriConstruction.
  /**
   * @tc.name   testUriConstruction012
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1200
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testUriConstruction013
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1300
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testUriConstruction014
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1400
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testUriConstruction015
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1500
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testUriConstruction016
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1600
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testUriConstruction017
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1700
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testUriConstruction018
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1800
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testUriConstruction019
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_1900
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testUriConstruction020
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2000
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testUriConstruction021
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2100
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testUriConstruction022
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2200
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testUriConstruction023
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2300
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testUriConstruction024
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2400
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testUriConstruction025
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2500
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testUriConstruction026
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2600
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testUriConstruction027
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2700
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testUriConstruction028
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2800
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testUriConstruction029
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_2900
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testUriConstruction030
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_3000
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testUriConstruction031
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_3100
   * @tc.desc   Constructs a URI by parsing the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testUriConstruction031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
   * @tc.name   testEquals001
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_3200
   * @tc.desc   Tests this URI for equality with another object.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testEquals001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let gaogao1 = gaogao;
      let res = gaogao.equals(gaogao1);
      expect(res).assertEqual(true);
  })

  // Check the UriEquals.
  /**
   * @tc.name   testEquals002
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_3300
   * @tc.desc   Tests this URI for equality with another object.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testEquals002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let res = gaogao.equals(gaogao1);
      expect(res).assertEqual(true);
  })

  // Check the UriEquals.
  /**
   * @tc.name   testEquals003
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_3400
   * @tc.desc   Tests this URI for equality with another object.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testEquals003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment123');
      let res = gaogao.equals(gaogao1);
      expect(res).assertEqual(false);
  })

  // Check the UriEquals.
  /**
   * @tc.name   testEquals004
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_3500
   * @tc.desc   Tests this URI for equality with another object.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testEquals004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let gaogao = new uri.URI('http://gg:gaogao@wwwaaa:99/path1?query#fagment');
      let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment123');
      let res = gaogao.equals(gaogao1);
      expect(res).assertEqual(false);
  })

  // Check the UriEquals.
  /**
   * @tc.name   testEquals005
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_3600
   * @tc.desc   Tests this URI for equality with another object.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testEquals005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let gaogao1 = new uri.URI('http://[1:0:0:1:2:1:2:1]/path1?query#fagment123');
      let res = gaogao.equals(gaogao1);
      expect(res).assertEqual(false);
  })

  // Check the UriEquals.
  /**
   * @tc.name   testEqualsTo001
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_3700
   * @tc.desc   Tests this URI for equality with another object.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testEqualsTo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let gaogao1 = gaogao;
      let res = gaogao.equalsTo(gaogao1);
      expect(res).assertEqual(true);
  })

  // Check the UriEquals.
  /**
   * @tc.name   testEqualsTo002
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_3800
   * @tc.desc   Tests this URI for equality with another object.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testEqualsTo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let res = gaogao.equalsTo(gaogao1);
      expect(res).assertEqual(true);
  })

  // Check the UriEquals.
  /**
   * @tc.name   testEqualsTo003
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_3900
   * @tc.desc   Tests this URI for equality with another object.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testEqualsTo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment123');
      let res = gaogao.equalsTo(gaogao1);
      expect(res).assertEqual(false);
  })

  // Check the UriEquals.
  /**
   * @tc.name   testEqualsTo004
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_4000
   * @tc.desc   Tests this URI for equality with another object.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testEqualsTo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let gaogao = new uri.URI('http://gg:gaogao@wwwaaa:99/path1?query#fagment');
      let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment123');
      let res = gaogao.equalsTo(gaogao1);
      expect(res).assertEqual(false);
  })

  // Check the UriEquals.
  /**
   * @tc.name   testEqualsTo005
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_4100
   * @tc.desc   Tests this URI for equality with another object.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testEqualsTo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
      let gaogao1 = new uri.URI('http://[1:0:0:1:2:1:2:1]/path1?query#fagment123');
      let res = gaogao.equalsTo(gaogao1);
      expect(res).assertEqual(false);
  })
  
  // Check the UriEquals.
  /**
   * @tc.name   testEqualsTo006
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_4200
   * @tc.desc   Tests for wrong input parameter type.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testEqualsTo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      try {
          let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
          var gaogao1 = 666;
          let err = gaogao.equalsTo(gaogao1);
      } catch (err) {
          expect(err.toString()).assertEqual(`BusinessError: Parameter error. The type of ${gaogao1} must be URI`);
          expect(err.code).assertEqual(401)
          expect(err.message).assertEqual(`Parameter error. The type of ${gaogao1} must be URI`);
      }
  })

      
  // Check the UriEquals.
   /**
    * @tc.name   testEqualsTo007
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_4300
    * @tc.desc   Tests for wrong input parameter type.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('testEqualsTo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      try {
          let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
          var gaogao1 = {"0" : "1"};
          let err = gaogao.equalsTo(gaogao1);
      } catch (err) {
          expect(err.toString()).assertEqual(`BusinessError: Parameter error. The type of ${gaogao1} must be URI`);
          expect(err.code).assertEqual(401)
          expect(err.message).assertEqual(`Parameter error. The type of ${gaogao1} must be URI`);
      }
  })

  // Check the UriNormalize.
  /**
   * @tc.name   testNormalize001
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_4400
   * @tc.desc   Tests Normalizes this URI's path.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testNormalize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path/66./../././mm/.././path1?query#fagment');
      let res = gaogao.normalize();
      expect(res.path).assertEqual("/path/path1");
      expect(res.toString()).assertEqual("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path/path1?query#fagment");
  })

  // Check the UriNormalize.
  /**
   * @tc.name   testNormalize002
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_4500
   * @tc.desc   Tests Normalizes this URI's path.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testNormalize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../path?query#fagment');
      let res = gaogao.normalize();
      expect(res.path).assertEqual("/../../path");
      expect(res.toString()).assertEqual("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../path?query#fagment");
  })

 // Check the UriNormalize.
  /**
   * @tc.name   testNormalize003
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_4600
   * @tc.desc   Tests Normalizes this URI's path.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testNormalize003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../path/.././../aa/bb/cc?query#fagment');
      let res = gaogao.normalize();
      expect(res.path).assertEqual("/../../../aa/bb/cc");
      expect(res.toString()).assertEqual("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../../aa/bb/cc?query#fagment");
  })

  // Check the UriNormalize.
  /**
   * @tc.name   testNormalize004
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_4700
   * @tc.desc   Tests Normalizes this URI's path.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testNormalize004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../path/.././../aa/bb/cc?query');
      let res = gaogao.normalize();
      expect(res.path).assertEqual("/../../aa/bb/cc");
      expect(res.toString()).assertEqual("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../aa/bb/cc?query");
  })

  // Check the UriNormalize.
  /**
   * @tc.name   testNormalize005
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_4800
   * @tc.desc   Tests Normalizes this URI's path.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testNormalize005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/./path/./aa/bb/cc?query#fagment');
      let res = gaogao.normalize();
      expect(res.path).assertEqual("/path/aa/bb/cc");
      expect(res.toString()).assertEqual("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path/aa/bb/cc?query#fagment");
  })

  // Check the UriToString.
  /**
   * @tc.name   testToString001
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_4900
   * @tc.desc   Returns the content of this URI as a US-ASCII string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../path/.././../aa/bb/cc?query#fagment');
      let res = gaogao.toString();
      expect(res).assertEqual('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../path/.././../aa/bb/cc?query#fagment');
  })

  // Check the UriToString.
  /**
   * @tc.name   testToString002
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_5000
   * @tc.desc   Returns the content of this URI as a US-ASCII string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let gaogao = new uri.URI('htt1p://gg:gaogao@[::192.9.5.5]:99/path/66path1?query#fagment');
      let res = gaogao.toString();
      expect(res).assertEqual('htt1p://gg:gaogao@[::192.9.5.5]:99/path/66path1?query#fagment');
  })

  // Check the UriToString.
  /**
   * @tc.name   testToString003
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_5100
   * @tc.desc   Returns the content of this URI as a US-ASCII string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let gaogao = new uri.URI('ftp://username:password@www.baidu.com:88/path?query#fagment');
      let res = gaogao.toString();
      expect(res).assertEqual('ftp://username:password@www.baidu.com:88/path?query#fagment');
  })

  // Check the UriToString.
  /**
   * @tc.name   testToString004
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_5200
   * @tc.desc   Returns the content of this URI as a US-ASCII string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let gaogao = new uri.URI('http://gg:gao你好gao@199.98.55.44:99/path/p你好ath?qu你好ery#fag你好ment');
      let res = gaogao.toString();
      expect(res).assertEqual('http://gg:gao%E4%BD%A0%E5%A5%BDgao@199.98.55.44:99/path/' +
      'p%E4%BD%A0%E5%A5%BDath?qu%E4%BD%A0%E5%A5%BDery#fag%E4%BD%A0%E5%A5%BDment');
  })

  // Check the UriToString.
  /**
   * @tc.name   testToString005
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_5300
   * @tc.desc   Returns the content of this URI as a US-ASCII string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let gaogao = new uri.URI('http://gg:gaogao@199.98.55.44:99/path/path?query#fagment');
      let res = gaogao.toString();
      expect(res).assertEqual('http://gg:gaogao@199.98.55.44:99/path/path?query#fagment');
  })

  // Check the UriCheckIsAbsolute.
  /**
   * @tc.name   testCheckIsAbsolute001
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_5400
   * @tc.desc   Tells whether or not this URI is absolute.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testCheckIsAbsolute001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let gaogao = new uri.URI('f/tp://username:password@www.baidu.com:88/path?query#fagment');
      let res = gaogao.checkIsAbsolute();
      expect(res).assertEqual(false);
  })

  // Check the UriCheckIsAbsolute.
  /**
   * @tc.name   testCheckIsAbsolute002
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_5500
   * @tc.desc   Tells whether or not this URI is absolute.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testCheckIsAbsolute002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let gaogao = new uri.URI('ftp://username:password@www.baidu.com:88/path?query#fagment');
      let res = gaogao.checkIsAbsolute();
      expect(res).assertEqual(true);
  })

  // Check the UriCheckIsAbsolute.
  /**
   * @tc.name   testCheckIsAbsolute003
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_5600
   * @tc.desc   Tells whether or not this URI is absolute.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testCheckIsAbsolute003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let gaogao = new uri.URI('htt/p://username:password@www.baidu.com:88/path?query#fagment');
      let res = gaogao.checkIsAbsolute();
      expect(res).assertEqual(false);
  })

  // Check the UriCheckIsAbsolute.
  /**
   * @tc.name   testCheckIsAbsolute004
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_5700
   * @tc.desc   Tells whether or not this URI is absolute.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testCheckIsAbsolute004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let gaogao = new uri.URI('https://username:password@www.baidu.com:88/path?query#fagment');
      let res = gaogao.checkIsAbsolute();
      expect(res).assertEqual(true);
  })

  // Check the UriCheckIsAbsolute.
  /**
   * @tc.name   testCheckIsAbsolute005
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_5800
   * @tc.desc   Tells whether or not this URI is absolute.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testCheckIsAbsolute005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let gaogao = new uri.URI('http1://username:password@www.baidu.com:88/path?query#fagment');
      let res = gaogao.checkIsAbsolute();
      expect(res).assertEqual(true);
  })

  // Check the UriCheckRelative.
   /**
    * @tc.name   testCheckRelative001
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_5900
    * @tc.desc   Tells whether or not this URI is relative.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('testCheckRelative001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let route = new uri.URI('http://www.test.com/images/pic.jpg');
    let res = route.checkRelative();
    expect(res).assertEqual(false);
  })

  // Check the UriCheckRelative.
  /**
   * @tc.name   testCheckRelative002
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_6000
   * @tc.desc   Tells whether or not this URI is relative.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('testCheckRelative002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
    let route = new uri.URI('/images/pic.jpg');
    let res = route.checkRelative();
    expect(res).assertEqual(true);
  })

  // Check the UriCheckRelative.
  /**
   * @tc.name   testCheckRelative003
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_6100
   * @tc.desc   Tells whether or not this URI is relative.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testCheckRelative003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com/images/logo.jpg');
    let res = route.checkRelative();
    expect(res).assertEqual(false);
  })

  // Check the UriCheckRelative.
  /**
   * @tc.name   testCheckRelative004
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_6200
   * @tc.desc   Tells whether or not this URI is relative.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testCheckRelative004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('aaa');
    let res = route.checkRelative();
    expect(res).assertEqual(true);
  })

  // Check the UriCheckRelative.
  /**
   * @tc.name   testCheckRelative005
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_6300
   * @tc.desc   Tells whether or not this URI is relative.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testCheckRelative005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let mailtoRoute = new uri.URI('mailto:user@test.com');
    expect(mailtoRoute.checkRelative()).assertEqual(false);
  })

  // Check the UriCheckOpaque.
  /**
   * @tc.name   testCheckOpaque001
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_6400
   * @tc.desc   Tells whether or not this URI is opaque.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testCheckOpaque001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('http://www.test.com/images/pic.jpg');
    let res = route.checkOpaque();
    expect(res).assertEqual(false);
  })

  // Check the UriCheckOpaque.
  /**
   * @tc.name   testCheckOpaque002
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_6500
   * @tc.desc   Tells whether or not this URI is Opaque.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testCheckOpaque002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('images/pic.jpg');
    let res = route.checkOpaque();
    expect(res).assertEqual(false);
  })

  // Check the UriCheckOpaque.
  /**
   * @tc.name   testCheckOpaque003
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_6600
   * @tc.desc   Tells whether or not this URI is Opaque.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testCheckOpaque003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('mailto:user@test.com');
    expect(route.checkOpaque()).assertEqual(true);
  })

  // Check the UriCheckOpaque.
  /**
   * @tc.name   testCheckOpaque004
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_6700
   * @tc.desc   Tells whether or not this URI is Opaque.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testCheckOpaque004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('tel:1234567890');
    let res = route.checkOpaque();
    expect(res).assertEqual(true);
  })

  // Check the UriCheckHierarchical.
  /**
   * @tc.name   testCheckHierarchical001
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_6800
   * @tc.desc   Tells whether or not this URI is Opaque.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testCheckHierarchical001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('http://www.test.com/images/pic.jpg');
    let res = route.checkHierarchical();
    expect(res).assertEqual(true);
  })

  // Check the UriCheckHierarchical.
  /**
   * @tc.name   testCheckHierarchical002
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_6900
   * @tc.desc   Tells whether or not this URI is Opaque.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testCheckHierarchical002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('mailto:test@test.com');
    let res = route.checkHierarchical();
    expect(res).assertEqual(false);
  })

  // Check the UriCheckHierarchical.
  /**
   * @tc.name   testCheckHierarchical003
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_7000
   * @tc.desc   Tells whether or not this URI is Opaque.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testCheckHierarchical003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('images/pic.jpg');
    let res = route.checkHierarchical();
    expect(res).assertEqual(true);
  })

  // Check the UriCheckHierarchical.
  /**
   * @tc.name   testCheckHierarchical004
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_7100
   * @tc.desc   Tells whether or not this URI is Opaque.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testCheckHierarchical004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('path');
    expect(route.checkHierarchical()).assertEqual(true);
    let testUri = new uri.URI('path:');
    expect(testUri.checkHierarchical()).assertEqual(false);
  })

  // Check the UriGetQueryValue.
  /**
   * @tc.name   testUriGetQueryValue001
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_7200
   * @tc.desc   Get specific query parameters from URI
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriGetQueryValue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com?param1=value1&param2=value2');
    let param1Value = route.getQueryValue("param1");
    let param2Value = route.getQueryValue("param2");
    expect(param1Value).assertEqual('value1');
    expect(param2Value).assertEqual('value2');
  })

  // Check the UriGetQueryValue.
  /**
   * @tc.name   testUriGetQueryValue002
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_7300
   * @tc.desc   Get specific query parameters from URI
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriGetQueryValue002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com');
    expect(route.getQueryValue("param1")).assertEqual(null);
    let include = new uri.URI('https://www.test.com?param1=value1');
    expect(include.getQueryValue("param")).assertEqual(null);
  })

  // Check the UriGetQueryValue.
  /**
   * @tc.name   testUriGetQueryValue003
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_7400
   * @tc.desc   Get specific query parameters from URI
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriGetQueryValue003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com?param1=value1&param1=value2&param1=value3');
    let param1Value = route.getQueryValue("param1");
    expect(param1Value).assertEqual("value1");
    expect(route.getQueryValues("param1")[0]).assertEqual("value1");
  })

  // Check the UriGetQueryValue.
  /**
   * @tc.name   testUriGetQueryValue004
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_7500
   * @tc.desc   Get specific query parameters from URI
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriGetQueryValue004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com?param1=hello%20world');
    expect(route.getQueryValue("param1")).assertEqual("hello world");
    let specialSymbol = new uri.URI('https://www.test.com?param1=hello+world');
    expect(specialSymbol.getQueryValue("param1")).assertEqual("hello world");
  })

  // Check the UriGetQueryValue.
  /**
   * @tc.name   testUriGetQueryValue005
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_7600
   * @tc.desc   Get specific query parameters from URI
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriGetQueryValue005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com?param%201=hello');
    expect(route.getQueryValue("param 1")).assertEqual("hello");
    expect(route.getQueryValue("1")).assertNull();
    expect(route.getQueryValue(" 1")).assertNull();
  })

  // Check the UriGetQueryValue.
  /**
   * @tc.name   testUriGetQueryValue006
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_7700
   * @tc.desc   Get specific query parameters from URI
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriGetQueryValue006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com?param1=&param2=');
    expect(route.getQueryValue("param1")).assertEqual("");
    expect(route.getQueryValue("param2")).assertEqual("");
    let noNameUri = new uri.URI('https://www.test.com?=value');
    expect(noNameUri.getQueryValue("")).assertEqual("value");
  })

  // Check the UriGetQueryValue.
  /**
   * @tc.name   testUriGetQueryValue007
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_7800
   * @tc.desc   Get specific query parameters from URI
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriGetQueryValue007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let emptyParameter1 = new uri.URI('https://www.test.com?param1=value1&&param3=value3');
    expect(emptyParameter1.getQueryValue("")).assertEqual("");
    let emptyParameter12 = new uri.URI('https://www.test.com?param1=value1&');
    expect(emptyParameter12.getQueryValue("")).assertEqual("");
    let router = new uri.URI('https://www.test.com?');
    expect(router.getQueryValue("")).assertEqual(null);
  })

  // Check the UriAddQueryValue.
  /**
   * @tc.name   testUriAddQueryValue001
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_7900
   * @tc.desc   Add query parameters for URI
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriAddQueryValue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com');
    let newRoute = route.addQueryValue("param1", "value1");
    expect(newRoute.getQueryValue("param1")).assertEqual("value1");
    expect(newRoute.toString()).assertEqual("https://www.test.com?param1=value1");
    let clearRoute = newRoute.clearQuery();
    expect(clearRoute.toString()).assertEqual("https://www.test.com");
  })

  // Check the UriAddQueryValue.
  /**
   * @tc.name   testUriAddQueryValue002
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_8000
   * @tc.desc   Add query parameters for URI
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriAddQueryValue002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com');
    let newRoute = route.addQueryValue("param1", "value1").addQueryValue("param2", "value2");
    expect(newRoute.getQueryValue('param1')).assertEqual("value1");
    expect(newRoute.getQueryValue('param2')).assertEqual("value2");
    expect(newRoute.toString()).assertEqual("https://www.test.com?param1=value1&param2=value2");
  })

  // Check the UriAddQueryValue.
  /**
   * @tc.name   testUriAddQueryValue003
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_8100
   * @tc.desc   Add query parameters for URI
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriAddQueryValue003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com');
    let newRoute = route.addQueryValue("param1", "hello world");
    expect(newRoute.toString()).assertEqual("https://www.test.com?param1=hello%20world");
    expect(newRoute.getQueryValue("param1")).assertEqual("hello world");
    let paramNames = newRoute.getQueryNames();
    expect(paramNames.length).assertEqual(1);
    expect(paramNames.values().next().value).assertEqual("param1");
  })

  // Check the UriAddQueryValue.
  /**
   * @tc.name   testUriAddQueryValue004
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_8200
   * @tc.desc   Add query parameters for URI
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriAddQueryValue004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com');
    let newRoute = route.addQueryValue("param1", "value1").addQueryValue("param1", "value2");
    expect(newRoute.toString()).assertEqual("https://www.test.com?param1=value1&param1=value2");
  })

  // Check the UriAddQueryValue.
  /**
   * @tc.name   testUriAddQueryValue005
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_8300
   * @tc.desc   Add query parameters for URI
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriAddQueryValue005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com');
    let newRoute = route.addQueryValue("param1", "value1").addQueryValue("param2", "null");
    expect(newRoute.toString()).assertEqual("https://www.test.com?param1=value1&param2=null");
    let values = newRoute.getQueryValues("param1");
    expect(values[0]).assertEqual("value1");
  })

  // Check the UriAddQueryValue.
  /**
   * @tc.name   testUriAddQueryValue006
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_8400
   * @tc.desc   Add query parameters for URI
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriAddQueryValue006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
   * @tc.name   testUriAddQueryValue007
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_8500
   * @tc.desc   Add query parameters for URI
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriAddQueryValue007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com');
    let newRoute = route.addQueryValue("param 1", "value 1");
    expect(newRoute.getQueryValue("param 1")).assertEqual("value 1");
  })

  // Check the UriGetQueryNames.
  /**
   * @tc.name   testUriGetQueryNames001
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_8600
   * @tc.desc   Get the names of all query parameters in the URI
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriGetQueryNames001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com?param1=value1&param2=value2');
    let paramNames = route.getQueryNames();
    expect(paramNames.length).assertEqual(2);
    expect(paramNames.values().next().value).assertEqual("param1");
  })

  // Check the UriGetQueryNames.
  /**
   * @tc.name   testUriGetQueryNames002
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_8700
   * @tc.desc   Get the names of all query parameters in the URI
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriGetQueryNames002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com');
    let paramNames = route.getQueryNames();
    expect(paramNames.length).assertEqual(0);
  })

  // Check the UriGetQueryNames.
  /**
   * @tc.name   testUriGetQueryNames003
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_8800
   * @tc.desc   Get the names of all query parameters in the URI
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriGetQueryNames003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com?param1=value1&&param3=value3');
    let paramNames = route.getQueryNames();
    let values = paramNames.values();
    expect(paramNames.length).assertEqual(3);
    expect(values.next().value).assertEqual("param1");
    expect(values.next().value).assertEqual("");
    expect(values.next().value).assertEqual("param3");
  })

  // Check the UriGetQueryNames.
  /**
   * @tc.name   testUriGetQueryNames004
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_8900
   * @tc.desc   Get the names of all query parameters in the URI
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriGetQueryNames004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com?param1=value1&=value2&param3=value3');
    let paramNames = route.getQueryNames();
    expect(paramNames.length).assertEqual(3);
    let values = paramNames.values();
    expect(values.next().value).assertEqual("param1");
    expect(values.next().value).assertEqual("");
    expect(values.next().value).assertEqual("param3");
  })

  // Check the UriGetQueryNames.
  /**
   * @tc.name   testUriGetQueryNames005
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_9000
   * @tc.desc   Get the names of all query parameters in the URI
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriGetQueryNames005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com?param1=value1&&&a&b=v&param3');
    let paramNames = route.getQueryNames();
    expect(paramNames.length).assertEqual(5);
    let values = paramNames.values();
    expect(values.next().value).assertEqual("param1");
    expect(values.next().value).assertEqual("");
    expect(values.next().value).assertEqual("a");
    expect(values.next().value).assertEqual("b");
    expect(values.next().value).assertEqual("param3");
  })

  // Check the UriGetQueryNames.
  /**
   * @tc.name   testUriGetQueryNames006
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_9100
   * @tc.desc   Get the names of all query parameters in the URI
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriGetQueryNames006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com?param%201=value1');
    let paramNames = route.getQueryNames();
    expect(paramNames.length).assertEqual(1);
    expect(paramNames.values().next().value).assertEqual("param 1");
    let route1 = new uri.URI('https://www.test.com?param+1=value1');
    let paramNames1 = route1.getQueryNames();
    expect(paramNames1.length).assertEqual(1);
    expect(paramNames1.values().next().value).assertEqual("param+1");
  })

  // Check the UriGetQueryValues.
  /**
   * @tc.name   testUriGetQueryValues001
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_9200
   * @tc.desc   Get all parameters and their corresponding values in the URI query string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriGetQueryValues001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com/search?query=name&sort=asc&filter=f');
    let values = route.getQueryValues("query");
    expect(values.length).assertEqual(1);
  })

  // Check the UriGetQueryValues.
  /**
   * @tc.name   testUriGetQueryValues002
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_9300
   * @tc.desc   Get all parameters and their corresponding values in the URI query string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriGetQueryValues002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com/search?query=name');
    let values = route.getQueryValues("query");
    expect(values[0]).assertEqual("name");
  })

  // Check the UriGetQueryValues.
  /**
   * @tc.name   testUriGetQueryValues003
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_9400
   * @tc.desc   Get all parameters and their corresponding values in the URI query string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriGetQueryValues003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let emptyParameter1 = new uri.URI('https://www.test.com/search?query=');
    let result1 = emptyParameter1.getQueryValues("query");
    expect(result1.length).assertEqual(1);
    expect(result1[0]).assertEqual("");
    let emptyParameter2 = new uri.URI('https://www.test.com/search?=value&');
    let result2 = emptyParameter2.getQueryValues("");
    expect(result2[0]).assertEqual("value");
    expect(result2[1]).assertEqual("");
    let emptyParameter3 = new uri.URI('https://www.test.com?');
    let result3 = emptyParameter3.getQueryValues("");
    expect(result3.length).assertEqual(0);
    let emptyParameter4 = new uri.URI('https://www.test.com?param');
    let result4 = emptyParameter4.getQueryValues("param");
    expect(result4.length).assertEqual(1);
    expect(result4[0]).assertEqual("");
    let emptyParameter5 = new uri.URI('https://www.test.com?param1=value1&&param3=value3');
    let result5 = emptyParameter5.getQueryValues("");
    expect(result5[0]).assertEqual("");
  })

  // Check the UriGetQueryValues.
  /**
   * @tc.name   testUriGetQueryValues004
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_9500
   * @tc.desc   Get all parameters and their corresponding values in the URI query string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriGetQueryValues004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com/search');
    let values = route.getQueryValues("query");
    expect(values.length).assertEqual(0);
  })

  // Check the UriGetQueryValues.
  /**
   * @tc.name   testUriGetQueryValues005
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_9600
   * @tc.desc   Get all parameters and their corresponding values in the URI query string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriGetQueryValues005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com/search?query=my%20query');
    let values = route.getQueryValues("query");
    expect(values[0]).assertEqual("my query");
  })

  // Check the UriGetQueryValues.
  /**
   * @tc.name   testUriGetQueryValues006
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_9700
   * @tc.desc   Get all parameters and their corresponding values in the URI query string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriGetQueryValues006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com/search?query=name&query=my');
    let values = route.getQueryValues("query");
    expect(values[0]).assertEqual("name");
    expect(values[1]).assertEqual("my");
  })

  // Check the UriGetQueryValues.
  /**
   * @tc.name   testUriGetQueryValues007
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_9800
   * @tc.desc   Get all parameters and their corresponding values in the URI query string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriGetQueryValues007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com?query=hello+world');
    let values = route.getQueryValues("query");
    expect(values[0]).assertEqual("hello+world");
  })

  // Check the UriGetQueryValues.
  /**
   * @tc.name   testUriGetQueryValues008
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_9900
   * @tc.desc   Get all parameters and their corresponding values in the URI query string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriGetQueryValues008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route1 = new uri.URI('https://www.test.com?param_g=value_1');
    let values1 = route1.getQueryValues("param_g");
    expect(values1[0]).assertEqual("value_1");
    expect(route1.getQueryValue('param_g')).assertEqual("value_1");
  })

  // Check the UriGetBooleanQueryValue.
  /**
   * @tc.name   testUriGetBooleanQueryValue001
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_10000
   * @tc.desc   Get the Boolean value of the URI query parameter
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriGetBooleanQueryValue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com/search?active=true');
    let isActive = route.getBooleanQueryValue("active", false);
    expect(isActive).assertEqual(true);
  })

  // Check the UriGetBooleanQueryValue.
  /**
   * @tc.name   testUriGetBooleanQueryValue002
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_10100
   * @tc.desc   Get the Boolean value of the URI query parameter
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriGetBooleanQueryValue002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com/search');
    let isActive = route.getBooleanQueryValue("active", false);
    expect(isActive).assertEqual(false);
  })

  // Check the UriGetBooleanQueryValue.
  /**
   * @tc.name   testUriGetBooleanQueryValue003
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_10200
   * @tc.desc   Get the Boolean value of the URI query parameter
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriGetBooleanQueryValue003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com/search?active=name');
    let isActive = route.getBooleanQueryValue("active", false);
    expect(isActive).assertEqual(true);
  })

  // Check the UriGetBooleanQueryValue.
  /**
   * @tc.name   testUriGetBooleanQueryValue004
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_10300
   * @tc.desc   Get the Boolean value of the URI query parameter
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testUriGetBooleanQueryValue004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let route = new uri.URI('https://www.test.com/search');
    let isActive = route.getBooleanQueryValue("active", true);
    expect(isActive).assertEqual(true);
  })
    })
  }
  
  