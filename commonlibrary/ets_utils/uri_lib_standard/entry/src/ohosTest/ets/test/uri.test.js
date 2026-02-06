/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import  uri from '@ohos.uri'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
export function UriTest() {
describe('UriTest', function () {

    // Check the UriConstruction.
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

    // Check the UriGetBooleanQueryValue.
    /**
     * @tc.name   testUriGetBooleanQueryValue005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_10400
     * @tc.desc   Get the Boolean value of the URI query parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetBooleanQueryValue005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('https://www.test.com/search?active=true&active=false');
      let isActive = route.getBooleanQueryValue("active", false);
      expect(isActive).assertEqual(true);
      let uriInstance1 = new uri.URI("https://www.test.com/search?active=aa&active=false");
      expect(uriInstance1.getBooleanQueryValue("active", false)).assertEqual(true);
      let uriInstance2 = new uri.URI("https://www.test.com/search?active=0");
      expect(uriInstance2.getBooleanQueryValue("active", true)).assertEqual(false);
    })

    // Check the UriClearQuery.
    /**
     * @tc.name   testUriClearQuery001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_10500
     * @tc.desc   Clear URI query parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriClearQuery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('https://www.test.com');
      let newRoute = route.clearQuery();
      expect(newRoute.toString()).assertEqual("https://www.test.com");
    })

    // Check the UriClearQuery.
    /**
     * @tc.name   testUriClearQuery002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_10600
     * @tc.desc   Clear URI query parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriClearQuery002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('https://www.test.com?param1=value1');
      let newRoute = route.clearQuery();
      expect(newRoute.toString()).assertEqual("https://www.test.com");
    })

    // Check the UriClearQuery.
    /**
     * @tc.name   testUriClearQuery003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_10700
     * @tc.desc   Clear URI query parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriClearQuery003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('https://www.test.com?param1=value1%');
      let newRoute = route.clearQuery();
      expect(newRoute.toString()).assertEqual("https://www.test.com");
    })

    // Check the UriClearQuery.
    /**
     * @tc.name   testUriClearQuery004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_10800
     * @tc.desc   Clear URI query parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriClearQuery004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('https://www.test.com?param1=value1&param1=value2');
      let newRoute = route.clearQuery();
      expect(newRoute.toString()).assertEqual("https://www.test.com");
    })

    // Check the UriGetLastSegment.
    /**
     * @tc.name   testUriGetLastSegment001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_10900
     * @tc.desc   Get the last segment of URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetLastSegment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('content://com.test.uri/files/image.jpg');
      let lastSegment = route.getLastSegment();
      expect(lastSegment).assertEqual("image.jpg");
    })

    // Check the UriGetLastSegment.
    /**
     * @tc.name   testUriGetLastSegment002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_11000
     * @tc.desc   Get the last segment of URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetLastSegment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('content://com.test.uri/');
      let lastSegment = route.getLastSegment();
      expect(lastSegment).assertEqual("");
    })

    // Check the UriGetLastSegment.
    /**
     * @tc.name   testUriGetLastSegment003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_11100
     * @tc.desc   Get the last segment of URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetLastSegment003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('content://com.test.uri');
      let lastSegment = route.getLastSegment();
      expect(lastSegment).assertEqual("");
    })

    // Check the UriGetLastSegment.
    /**
     * @tc.name   testUriGetLastSegment004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_11200
     * @tc.desc   Get the last segment of URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetLastSegment004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('content://com.test.uri/files/');
      let lastSegment = route.getLastSegment();
      expect(lastSegment).assertEqual("files");
    })

    // Check the UriGetLastSegment.
    /**
     * @tc.name   testUriGetLastSegment005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_11300
     * @tc.desc   Get the last segment of URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetLastSegment005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('content://com.test.uri/files/my%20file.jpg');
      let lastSegment = route.getLastSegment();
      expect(lastSegment).assertEqual("my file.jpg");
    })

    // Check the UriGetLastSegment.
    /**
     * @tc.name   testUriGetLastSegment006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_11400
     * @tc.desc   Get the last segment of URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetLastSegment006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('content://com.test.uri/files/my+file.jpg');
      let lastSegment = route.getLastSegment();
      expect(lastSegment).assertEqual("my+file.jpg");
    })

    // Check the UriGetSegment.
    /**
     * @tc.name   testUriGetSegment007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_11500
     * @tc.desc   Get all segments in the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetSegment007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try {
        let route = new uri.URI('content://com.test.uri/files/a a');
        let segments = route.getSegment();
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string");
        expect(err.code).assertEqual(10200002);
        expect(err.message).assertEqual("Syntax Error. Invalid Uri string");
      }
    })

    // Check the UriGetSegment.
    /**
     * @tc.name   testUriGetSegment001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_11600
     * @tc.desc   Get all segments in the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetSegment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('content://com.test.uri/files/images');
      let segments = route.getSegment();
      expect(segments.length).assertEqual(2);
      expect(segments[0]).assertEqual("files");
      expect(segments[1]).assertEqual("images");
    })

    // Check the UriGetSegment.
    /**
     * @tc.name   testUriGetSegment002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_11700
     * @tc.desc   Get all segments in the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetSegment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('content://com.test.uri/');
      let segments = route.getSegment();
      expect(segments.length).assertEqual(0);
    })

    // Check the UriGetSegment.
    /**
     * @tc.name   testUriGetSegment003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_11800
     * @tc.desc   Get all segments in the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetSegment003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('content://com.test.uri/files/');
      let segments = route.getSegment();
      expect(segments.length).assertEqual(1);
    })

    // Check the UriGetSegment.
    /**
     * @tc.name   testUriGetSegment004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_11900
     * @tc.desc   Get all segments in the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetSegment004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('content://com.test.uri');
      let segments = route.getSegment();
      expect(segments.length).assertEqual(0);
      let mailRoute = new uri.URI('mailto:people');
      expect(mailRoute.getSegment().length).assertEqual(0);
    })

    // Check the UriGetSegment.
    /**
     * @tc.name   testUriGetSegment005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_12000
     * @tc.desc   Get all segments in the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetSegment005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('content://com.test.uri/files/a%20a/b%20b');
      let segments = route.getSegment();
      expect(segments[0]).assertEqual("files");
      expect(segments[1]).assertEqual("a a");
      expect(segments[2]).assertEqual("b b");
    })

    // Check the UriGetSegment.
    /**
     * @tc.name   testUriGetSegment006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_12100
     * @tc.desc   Get all segments in the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriGetSegment006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('http://www.test.com/path/to/image.jpg');
      let segments = route.getSegment();
      expect(segments[2]).assertEqual("image.jpg");
    })

    // Check the UriAddSegment.
    /**
     * @tc.name   testUriAddSegment001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_12200
     * @tc.desc   Add a path segment to the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriAddSegment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('http://www.test.com/');
      let newRoute = route.addSegment("files").addSegment("image.jpg");
      expect(newRoute.toString()).assertEqual("http://www.test.com/files/image.jpg");
      expect(newRoute.getLastSegment()).assertEqual("image.jpg");
    })

    // Check the UriAddSegment.
    /**
     * @tc.name   testUriAddSegment002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_12300
     * @tc.desc   Add a path segment to the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriAddSegment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.name   testUriAddSegment003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_12400
     * @tc.desc   Add a path segment to the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriAddSegment003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('http://www.test.com');
      let newRoute = route.addSegment("files");
      expect(newRoute.getLastSegment()).assertEqual("files");
      expect(newRoute.getSegment().length).assertEqual(1);
    })

    // Check the UriAddEncodedSegment.
    /**
     * @tc.name   testUriAddEncodedSegment001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_12500
     * @tc.desc   Encode the path segment and add it to the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriAddEncodedSegment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('http://www.test.com');
      let newRoute = route.addEncodedSegment("files").addEncodedSegment("image.jpg");
      expect(newRoute.getSegment()[1]).assertEqual("image.jpg");
    })

    // Check the UriAddEncodedSegment.
    /**
     * @tc.name   testUriAddEncodedSegment002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_12600
     * @tc.desc   Encode the path segment and add it to the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriAddEncodedSegment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route1 = new uri.URI('http://www.test.com?param%2B1=value1&param+2=value%202#fra+gemnt');
      let newRoute1 = route1.addSegment("my+files").addEncodedSegment("my+image.jpg");
      expect(newRoute1.toString()).
      assertEqual("http://www.test.com/my%2Bfiles/my+image.jpg?param%2B1=value1&param+2=value%202#fra+gemnt");
      expect(newRoute1.encodedUserInfo).assertEqual(null);
      expect(newRoute1.encodedPath).assertEqual("/my%2Bfiles/my+image.jpg");
      expect(newRoute1.encodedQuery).assertEqual('param%2B1=value1&param+2=value%202');
      expect(newRoute1.encodedFragment).assertEqual("fra+gemnt");
      expect(newRoute1.encodedAuthority).assertEqual("www.test.com");
      expect(newRoute1.encodedSSP).
      assertEqual("//www.test.com/my%2Bfiles/my+image.jpg?param%2B1=value1&param+2=value%202");
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
      expect(newRoute3.toString()).
      assertEqual("http://username:my%20name@www.test.com/my%252Bfiles/my%2Bimage.jpg");
      expect(newRoute3.encodedUserInfo).assertEqual("username:my%20name");
      expect(newRoute3.encodedPath).assertEqual("/my%252Bfiles/my%2Bimage.jpg");
      expect(newRoute3.encodedQuery).assertEqual(null);
      expect(newRoute3.encodedFragment).assertEqual(null);
      expect(newRoute3.encodedAuthority).assertEqual("username:my%20name@www.test.com");
      expect(newRoute3.encodedSSP).assertEqual("//username:my%20name@www.test.com/my%252Bfiles/my%2Bimage.jpg");
    })

    // Check the UriAddEncodedSegment.
    /**
     * @tc.name   testUriAddEncodedSegment003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_12700
     * @tc.desc   Encode the path segment and add it to the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriAddEncodedSegment003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try {
        let route = new uri.URI('http://www.test.com/');
        let newRoute = route.addEncodedSegment("my files");
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string");
        expect(err.code).assertEqual(10200002);
        expect(err.message).assertEqual("Syntax Error. Invalid Uri string");
      }
    })

    // Check the UriCreateFromParts.
    /**
     * @tc.name   testUriCreateFromParts001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_12800
     * @tc.desc   Build a new URI object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriCreateFromParts001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = uri.URI.createFromParts("http", "", "fragment");
      expect(route.toString()).assertEqual("http:#fragment");
    })

    // Check the UriCreateFromParts.
    /**
     * @tc.name   testUriCreateFromParts002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_12900
     * @tc.desc   Build a new URI object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriCreateFromParts002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = uri.URI.createFromParts("mailto", "no body", "top");
      expect(route.toString()).assertEqual("mailto:no%20body#top");
    })

    // Check the UriCreateFromParts.
    /**
     * @tc.name   testUriCreateFromParts003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_13000
     * @tc.desc   Build a new URI object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriCreateFromParts003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = uri.URI.createFromParts("foo", "", "");
      expect(route.toString()).assertEqual("foo:");
      try {
        uri.URI.createFromParts("", "", "");
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string: The Scheme the first character must be a letter");
        expect(err.code).assertEqual(10200002);
        expect(err.message).assertEqual("Syntax Error. Invalid Uri string: The Scheme the first character must be a letter");
      }
      try {
        uri.URI.createFromParts(null, null, null);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of null must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of null must be string");
      }
      try {
        uri.URI.createFromParts("foo", null, "fragment");
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of null must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of null must be string");
      }
    })

    // Check the UriCreateFromParts.
    /**
     * @tc.name   testUriCreateFromParts004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_13100
     * @tc.desc   Build a new URI object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriCreateFromParts004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let scheme = "https";
      let ssp = "www.test.com";
      let fragment = "fragment";
      let route = uri.URI.createFromParts(scheme, ssp, fragment);
      expect(route.toString()).assertEqual("https:www.test.com#fragment");
    })

    // Check the UriEncodedUserInfo.
    /**
     * @tc.name   testUriEncodedUserInfo001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_13200
     * @tc.desc   Encoded URI user information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedUserInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('http://username:name@www.test.com/');
      expect(route.encodedUserInfo).assertEqual("username:name");
    })

    // Check the UriEncodedUserInfo.
    /**
     * @tc.name   testUriEncodedUserInfo002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_13300
     * @tc.desc   Encoded URI user information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedUserInfo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('http://username:@www.test.com/');
      expect(route.encodedUserInfo).assertEqual("username:");
    })

    // Check the UriEncodedUserInfo.
    /**
     * @tc.name   testUriEncodedUserInfo003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_13400
     * @tc.desc   Encoded URI user information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedUserInfo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('http://username:my%20name@www.test.com/');
      expect(route.encodedUserInfo).assertEqual("username:my%20name");
    })

    // Check the UriEncodedUserInfo.
    /**
     * @tc.name   testUriEncodedUserInfo004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_13500
     * @tc.desc   Encoded URI user information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedUserInfo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('http://www.test.com');
      expect(route.encodedUserInfo).assertEqual(null);
      let mailRoute = new uri.URI('mailto:body');
      expect(mailRoute.encodedUserInfo).assertEqual(null);
    })

    // Check the UriEncodedPath.
    /**
     * @tc.name   testUriEncodedPath001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_13600
     * @tc.desc   Encoded URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedPath001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('http://www.test.com/file/image.jpg');
      expect(route.encodedPath).assertEqual("/file/image.jpg");
    })

    // Check the UriEncodedPath.
    /**
     * @tc.name   testUriEncodedPath002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_13700
     * @tc.desc   Encoded URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedPath002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('http://www.test.com/');
      expect(route.encodedPath).assertEqual("/");
    })

    // Check the UriEncodedPath.
    /**
     * @tc.name   testUriEncodedPath003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_13800
     * @tc.desc   Encoded URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedPath003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('http://www.test.com');
      expect(route.encodedPath).assertEqual(null);
      let mailRoute = new uri.URI('mailto:body');
      expect(mailRoute.encodedPath).assertEqual(null);
    })

    // Check the UriEncodedPath.
    /**
     * @tc.name   testUriEncodedPath004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_13900
     * @tc.desc   Encoded URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedPath004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('http://www.test.com/my%20file');
      expect(route.encodedPath).assertEqual("/my%20file");
    })

    // Check the UriEncodedQuery.
    /**
     * @tc.name   testUriUriEncodedQuery001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_14000
     * @tc.desc   Encoded URI parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriEncodedQuery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('https://www.test.com/search?query=name&query=my');
      expect(route.encodedQuery).assertEqual("query=name&query=my");
    })

    // Check the UriEncodedQuery.
    /**
     * @tc.name   testUriUriEncodedQuery002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_14100
     * @tc.desc   Encoded URI parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriEncodedQuery002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('https://www.test.com/search?');
      expect(route.encodedQuery).assertEqual(null);
    })

    // Check the UriEncodedQuery.
    /**
     * @tc.name   testUriUriEncodedQuery003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_14200
     * @tc.desc   Encoded URI parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriEncodedQuery003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('https://www.test.com/');
      expect(route.encodedQuery).assertEqual(null);
    })

    // Check the UriEncodedQuery.
    /**
     * @tc.name   testUriUriEncodedQuery004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_14300
     * @tc.desc   Encoded URI parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriEncodedQuery004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('https://www.test.com/search?query=my%20test');
      expect(route.encodedQuery).assertEqual("query=my%20test");
    })

    // Check the UriEncodedFragment.
    /**
     * @tc.name   testUriEncodedFragment001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_14400
     * @tc.desc   Encoded URI fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedFragment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('mailto:body#top');
      expect(route.encodedFragment).assertEqual("top");
    })

    // Check the UriEncodedFragment.
    /**
     * @tc.name   testUriEncodedFragment002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_14500
     * @tc.desc   Encoded URI fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedFragment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('mailto:body#');
      expect(route.encodedFragment).assertEqual(null);
    })

    // Check the UriEncodedFragment.
    /**
     * @tc.name   testUriEncodedFragment003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_14600
     * @tc.desc   Encoded URI fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedFragment003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('mailto:body#te%20st');
      expect(route.encodedFragment).assertEqual("te%20st");
    })

    // Check the UriEncodedFragment.
    /**
     * @tc.name   testUriEncodedFragment004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_14700
     * @tc.desc   Encoded URI fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedFragment004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('mailto:body');
      expect(route.encodedFragment).assertEqual(null);
    })

    // Check the UriEncodedAuthority.
    /**
     * @tc.name   testUriEncodedAuthority001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_14800
     * @tc.desc   Encoded resource location information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedAuthority001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('https://www.test.com/search?query=name&query=my');
      expect(route.encodedAuthority).assertEqual("www.test.com");
    })

    // Check the UriEncodedAuthority.
    /**
     * @tc.name   testUriEncodedAuthority002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_14900
     * @tc.desc   Encoded resource location information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedAuthority002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('http://username:my%20name@www.test.com/');
      expect(route.encodedAuthority).assertEqual("username:my%20name@www.test.com");
    })

    // Check the UriEncodedAuthority.
    /**
     * @tc.name   testUriEncodedAuthority003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_15000
     * @tc.desc   Encoded resource location information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedAuthority003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('mailto:body#top');
      expect(route.encodedAuthority).assertEqual(null);
    })

    // Check the UriEncodedAuthority.
    /**
     * @tc.name   testUriEncodedAuthority004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_15100
     * @tc.desc   Encoded resource location information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedAuthority004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('https://www.test.com:8080/');
      expect(route.encodedAuthority).assertEqual("www.test.com:8080");
    })

    // Check the UriEncodedSSP.
    /**
     * @tc.name   testUriEncodedSSP001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_15200
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedSSP001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('http://username:name@www.test.com/path?query=example');
      expect(route.encodedSSP).assertEqual("//username:name@www.test.com/path?query=example");
    })

    // Check the UriEncodedSSP.
    /**
     * @tc.name   testUriEncodedSSP002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_15300
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedSSP002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('http://username:my%20name@www.test.com');
      expect(route.encodedSSP).assertEqual("//username:my%20name@www.test.com");
      let route1 = new uri.URI('http://username:my_20name@www.test.com');
      expect(route1.encodedSSP).assertEqual("//username:my_20name@www.test.com");
    })

    // Check the UriEncodedSSP.
    /**
     * @tc.name   testUriEncodedSSP003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_15400
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriEncodedSSP003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let route = new uri.URI('https://www.test.com/');
      expect(route.encodedSSP).assertEqual("//www.test.com/");
    })

    // Check the UriCreateFromParts parameter.
    /**
     * @tc.name   testCreateFromPartsPara001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_15500
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateFromPartsPara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try {
        // @ts-ignore
        uri.URI.createFromParts(1, "ssp", "fragment");
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of 1 must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of 1 must be string");
      }
    })

    // Check the UriCreateFromParts parameter.
    /**
     * @tc.name   testCreateFromPartsPara002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_15600
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateFromPartsPara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try {
        // @ts-ignore
        uri.URI.createFromParts("aaa", 1, "fragment");
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of 1 must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of 1 must be string");
      }
    })

    // Check the UriCreateFromParts parameter.
    /**
     * @tc.name   testCreateFromPartsPara003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_15700
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateFromPartsPara003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try {
        // @ts-ignore
        uri.URI.createFromParts("aaa", "bbb", 1);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of 1 must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of 1 must be string");
      }
    })

    // Check the UriAddQueryValue parameter.
    /**
     * @tc.name   testAddQueryValuePara001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_15800
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddQueryValuePara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try {
        let route = new uri.URI('https://www.test.com');
        // @ts-ignore
        route.addQueryValue(1, "value 1");
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of 1 must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of 1 must be string");
      }
    })

    // Check the UriAddQueryValue parameter.
    /**
     * @tc.name   testAddQueryValuePara002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_15900
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddQueryValuePara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try {
        let route = new uri.URI('https://www.test.com');
        // @ts-ignore
        route.addQueryValue("1", 1);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of 1 must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of 1 must be string");
      }
    })

    // Check the UriAddEncodedSegment parameter.
    /**
     * @tc.name   testAddEncodedSegmentPara001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_16000
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddEncodedSegmentPara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try {
        let route = new uri.URI('https://www.test.com');
        // @ts-ignore
        route.addEncodedSegment(1);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of 1 must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of 1 must be string");
      }
    })

    // Check the UriAddSegment parameter.
    /**
     * @tc.name   testAddSegmentPara001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_16100
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddSegmentPara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try {
        let route = new uri.URI('https://www.test.com');
        // @ts-ignore
        route.addSegment(1);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of 1 must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of 1 must be string");
      }
    })

    // Check the UriGetQueryValue parameter.
    /**
     * @tc.name   testGetQueryValuePara001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_16200
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetQueryValuePara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try {
        let route1 = new uri.URI('https://www.test.com?param_g=value_1');
        // @ts-ignore
        route1.getQueryValue(2);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of 2 must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of 2 must be string");
      }
    })

    // Check the UriGetQueryValues parameter.
    /**
     * @tc.name   testGetQueryValuesPara001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_16300
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetQueryValuesPara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try {
        let route1 = new uri.URI('https://www.test.com?param_g=value_1');
        // @ts-ignore
        route1.getQueryValues(2);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of 2 must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of 2 must be string");
      }
    })

    // Check the UriGetBooleanQueryValue parameter.
    /**
     * @tc.name   testGetBooleanQueryValuePara001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_16400
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetBooleanQueryValuePara001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try {
        let route1 = new uri.URI('https://www.test.com?param_g=value_1');
        // @ts-ignore
        route1.getBooleanQueryValue(2, true);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of 2 must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of 2 must be string");
      }
    })

    // Check the UriGetBooleanQueryValue parameter.
    /**
     * @tc.name   testGetBooleanQueryValuePara002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_16500
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetBooleanQueryValuePara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try {
        let route1 = new uri.URI('https://www.test.com?param_g=value_1');
        // @ts-ignore
        route1.getBooleanQueryValue("param_g", 2);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of param_g must be boolean");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of param_g must be boolean");
      }
    })
     /**
      * @tc.name   testTildeUnderline001
      * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_16600
      * @tc.desc   Encoded URI specific scheme section
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('testTildeUnderline001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.name   testTildeUnderline002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_16700
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTildeUnderline002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.name   testTildeUnderline003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_16800
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTildeUnderline003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
      * @tc.name   testAddQueryJson001
      * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_16900
      * @tc.desc   URI query add json
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('testAddQueryJson001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let uriTest = new uri.URI('aaa://drive/page?need=false&bbb=true');
      let newUri = uriTest.addQueryValue("data", '{"type": 0, "from": "from"}');
      expect(newUri.toString()).assertEqual('aaa://drive/page?need=false&bbb=true&data=%7B%22type%22%3A%200%2C%20%22from%22%3A%20%22from%22%7D');
      expect(newUri.query).assertEqual('need=false&bbb=true&data={"type": 0, "from": "from"}');
      expect(newUri.getQueryValue('data')).assertEqual('{"type": 0, "from": "from"}');
      expect(newUri.encodedQuery).assertEqual('need=false&bbb=true&data=%7B%22type%22%3A%200%2C%20%22from%22%3A%20%22from%22%7D');
    })

    // Check the UriCreateFromParts parameter.
    /**
     * @tc.name   testCreateFromPartsPara004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_17000
     * @tc.desc   Abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateFromPartsPara004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try {
        uri.URI.createFromParts(null, "bbb", "ccc");
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of null must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of null must be string");
      }
      try {
        uri.URI.createFromParts("aaa", null, "ccc");
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of null must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of null must be string");
      }
      try {
        uri.URI.createFromParts("aaa", "bbb", null);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of null must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of null must be string");
      }
    })

    // Check the UriAddQueryValue parameter.
    /**
     * @tc.name   testAddQueryValuePara003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_17100
     * @tc.desc   Abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddQueryValuePara003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try {
        let route = new uri.URI('https://www.test.com');
        route.addQueryValue("param", null);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of null must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of null must be string");
      }
      try {
        let route = new uri.URI('https://www.test.com');
        route.addQueryValue(null, "value");
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of null must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of null must be string");
      }
    })

    // Check the UriAddEncodedSegment parameter.
    /**
     * @tc.name   testAddEncodedSegmentPara002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_17200
     * @tc.desc   Abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddEncodedSegmentPara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try {
        let route = new uri.URI('https://www.test.com');
        route.addEncodedSegment(null);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of null must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of null must be string");
      }
    })

    // Check the UriAddSegment parameter.
    /**
     * @tc.name   testAddSegmentPara002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_17300
     * @tc.desc   Encoded URI specific scheme section
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddSegmentPara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try {
        let route = new uri.URI('https://www.test.com');
        route.addSegment(null);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of null must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of null must be string");
      }
    })

    // Check the UriGetQueryValue parameter.
    /**
     * @tc.name   testGetQueryValuePara002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_17400
     * @tc.desc   Abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetQueryValuePara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try {
        let route1 = new uri.URI('https://www.test.com?param_g=value_1');
        route1.getQueryValue(null);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of null must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of null must be string");
      }
    })
  
    // Check the UriGetQueryValues parameter.
    /**
     * @tc.name   testGetQueryValuesPara002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_17500
     * @tc.desc   Abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetQueryValuesPara002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try {
        let route1 = new uri.URI('https://www.test.com?param_g=value_1');
        route1.getQueryValues(null);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of null must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of null must be string");
      }
    })

    // Check the UriGetBooleanQueryValue parameter.
    /**
     * @tc.name   testGetBooleanQueryValuePara003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_17600
     * @tc.desc   Abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetBooleanQueryValuePara003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try {
        let route1 = new uri.URI('https://www.test.com?param_g=value_1');
        route1.getBooleanQueryValue("param_g", null);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of param_g must be boolean");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of param_g must be boolean");
      }
      try {
        let route1 = new uri.URI('https://www.test.com?param_g=value_1');
        route1.getBooleanQueryValue(null, true);
      } catch (err) {
        expect(err.toString()).assertEqual("BusinessError: Parameter error. The type of null must be string");
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error. The type of null must be string");
      }
    })
    // Check the Uri constructor json.
    /**
     * @tc.name   testConstructorJson001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_17700
     * @tc.desc   URI constructor json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstructorJson001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let uriObj = new uri.URI("testUri://testHost/testNumPage?need=false&bbb=true&data={\"aaa\":0,\"bbb\":\"ccc\"}");
      expect(uriObj.query).assertEqual('need=false&bbb=true&data={"aaa":0,"bbb":"ccc"}');
      expect(JSON.parse(uriObj.getQueryValue('data')).aaa).assertEqual(0);
      expect(JSON.parse(uriObj.getQueryValue('data')).bbb).assertEqual('ccc');
    })
    // Check the Uri Special Characters.
    /**
     * @tc.name   testSpecialCharacters001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_17800
     * @tc.desc   URI Special Characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpecialCharacters001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let uriStr = "hta{}_b- c|~d!a$b&c=d+e,;'()*vvtp://www.bi an'|{}()$~,;*!_-+:80/index?par(,;/) '_$:?+a{}|m=10-!*&pa ra~m1=20!-~#par(,;/) '_$:?+a{}|m=10-!*&para~m1=20!-~";
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
     * @tc.name   testspecialPort001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_17900
     * @tc.desc   URI Special Characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testspecialPort001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriStr = "http://publickinfo:-1";
        let newUri = new uri.URI(uriStr);
        expect(newUri.toString()).assertEqual("http://publickinfo:-1");
        expect(newUri.port).assertEqual("-1");
        expect(newUri.host).assertEqual(null);
        expect(newUri.authority).assertEqual("publickinfo:-1");
    })
    // Check the Uri Port.
    /**
     * @tc.name   testspecialPort002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_18000
     * @tc.desc   URI Special Characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testspecialPort002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriStr = "http://publickinfo:2147483647";
        let newUri = new uri.URI(uriStr);
        expect(newUri.toString()).assertEqual("http://publickinfo:2147483647");
        expect(newUri.port).assertEqual("2147483647");
        expect(newUri.host).assertEqual('publickinfo');
        expect(newUri.authority).assertEqual("publickinfo:2147483647");
    })
    // Check the Uri Port.
    /**
     * @tc.name   testspecialPort003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_18100
     * @tc.desc   URI Special Characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testspecialPort003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriStr = "http://publickinfo:600000000332";
        let newUri = new uri.URI(uriStr);
        expect(newUri.toString()).assertEqual("http://publickinfo:600000000332");
        expect(newUri.port).assertEqual("-1");
        expect(newUri.host).assertEqual(null);
        expect(newUri.authority).assertEqual("publickinfo:600000000332");
    })
    // Check the Uri Port.
    /**
     * @tc.name   testspecialPort004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_18200
     * @tc.desc   URI Special Characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testspecialPort004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriStr = "http://publickinfo:0";
        let newUri = new uri.URI(uriStr);
        expect(newUri.toString()).assertEqual("http://publickinfo:0");
        expect(newUri.port).assertEqual("0");
        expect(newUri.host).assertEqual("publickinfo");
        expect(newUri.authority).assertEqual("publickinfo:0");
    })
    // Check the UriConstruction.
    /**
     * @tc.name   testUriConstruction032
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_18300
     * @tc.desc   URI Special Characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriConstruction032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try {
          let that = new uri.URI('ht/tp://username:pas sword@host:8080/di[rectory/file?foo=1&bar=2');
        } catch (err) {
          expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string: The SpecialPath does not conform to the rule");
          expect(err.code).assertEqual(10200002)
          expect(err.message).assertEqual("Syntax Error. Invalid Uri string: The SpecialPath does not conform to the rule");
        }
    })
    // Check the UriConstruction.
    /**
     * @tc.name   testUriConstruction033
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_18400
     * @tc.desc   URI Special Characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriConstruction033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try {
          let that = new uri.URI('http://username:password@[::]:8080/directory/file?Query#abc^de');
        } catch (err) {
          expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string: The Fragment does not conform to the rule");
          expect(err.code).assertEqual(10200002)
          expect(err.message).assertEqual("Syntax Error. Invalid Uri string: The Fragment does not conform to the rule");
        }
    })
    // Check the UriConstruction.
    /**
     * @tc.name   testUriConstruction034
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_18500
     * @tc.desc   URI Special Characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriConstruction034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try {
          let route = new uri.URI('content://com.test.uri/files/a^a');
          let segments = route.getSegment();
        } catch (err) {
          expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string: The path does not conform to the rule");
          expect(err.code).assertEqual(10200002);
          expect(err.message).assertEqual("Syntax Error. Invalid Uri string: The path does not conform to the rule");
        }
    })
    // Check the UriAddEncodedSegment.
    /**
     * @tc.name   testUriAddEncodedSegment004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_18600
     * @tc.desc   Encode the path segment and add it to the URI path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriAddEncodedSegment004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try {
          let route = new uri.URI('http://www.test.com/');
          let newRoute = route.addEncodedSegment("my`files");
        } catch (err) {
          expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string: The path does not conform to the rule");
          expect(err.code).assertEqual(10200002);
          expect(err.message).assertEqual("Syntax Error. Invalid Uri string: The path does not conform to the rule");
        }
    })
    // Check the UriSetScheme.
    /**
     * @tc.name   testUriUriSetScheme001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_18700
     * @tc.desc   Encode Scheme and set it to the URI Scheme
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetScheme001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("ht2tp://user@www.1hw.1com:77/path/path23?query#qwer");
        uriObj.scheme = "https:"
        expect(uriObj.toString()).assertEqual('https://user@www.1hw.1com:77/path/path23?query#qwer');
    })
    // Check the UriSetScheme.
    /**
     * @tc.name   testUriUriSetScheme002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_18800
     * @tc.desc   Encode Scheme and set it to the URI Scheme
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetScheme002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("ht2tp://user@www.1hw.1com:77/path/path23?query#qwer");
        uriObj.scheme = "3https:"
        expect(uriObj.toString()).assertEqual('ht2tp://user@www.1hw.1com:77/path/path23?query#qwer');
    })
    // Check the UriSetScheme.
    /**
     * @tc.name   testUriUriSetScheme003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_18900
     * @tc.desc   Encode Scheme and set it to the URI Scheme
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetScheme003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("ht2tp://user@www.1hw.1com:77/path/path23?query#qwer");
        uriObj.scheme = "asffdsa"
        expect(uriObj.toString()).assertEqual('asffdsa://user@www.1hw.1com:77/path/path23?query#qwer');
    })
    // Check the UriSetScheme.
    /**
     * @tc.name   testUriUriSetScheme004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_19000
     * @tc.desc   Encode Scheme and set it to the URI Scheme
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetScheme004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("ht2tp://user@www.1hw.1com:77/path/path23?query#qwer");
        uriObj.scheme = "%asffdsa"
        expect(uriObj.toString()).assertEqual('ht2tp://user@www.1hw.1com:77/path/path23?query#qwer');
    })
    // Check the UriSetScheme.
    /**
     * @tc.name   testUriUriSetScheme005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_19100
     * @tc.desc   Encode Scheme and set it to the URI Scheme
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetScheme005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://user@www.1hw.1com:77/path/path23?query#qwer");
        uriObj.scheme = ""
        expect(uriObj.toString()).assertEqual('http://user@www.1hw.1com:77/path/path23?query#qwer');
    })
    // Check the UriSetScheme.
    /**
     * @tc.name   testUriUriSetScheme006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_19200
     * @tc.desc   Encode Scheme and set it to the URI Scheme
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetScheme006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://user@www.1hw.1com:77?query#qwer");
        uriObj.scheme = "testuri006"
        expect(uriObj.scheme).assertEqual('testuri006');
    })
    // Check the UriSetUserInfo.
    /**
     * @tc.name   testUriUriSetUserInfo001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_19300
     * @tc.desc   Encode UserInfo and set it to the URI UserInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetUserInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://user@www.hw.com:77/path/path23?query#qwer");
        uriObj.userInfo = "testuri007"
        expect(uriObj.userInfo).assertEqual('testuri007');
        expect(uriObj.toString()).assertEqual('http://testuri007@www.hw.com:77/path/path23?query#qwer');
    })
    // Check the UriSetUserInfo.
    /**
     * @tc.name   testUriUriSetUserInfo002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_19400
     * @tc.desc   Encode UserInfo and set it to the URI UserInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetUserInfo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://www.test.com:77/path/path23?query#qwer");
        uriObj.userInfo = "testuri008"
        expect(uriObj.userInfo).assertEqual('testuri008');
        expect(uriObj.toString()).assertEqual('http://testuri008@www.test.com:77/path/path23?query#qwer');
    })
    // Check the UriSetUserInfo.
    /**
     * @tc.name   testUriUriSetUserInfo003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_19500
     * @tc.desc   Encode UserInfo and set it to the URI UserInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetUserInfo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
        uriObj.userInfo = "sji<+s大"
        expect(uriObj.userInfo).assertEqual('sji<+s大');
        expect(uriObj.toString()).assertEqual('http://sji%3C%2Bs%E5%A4%A7@www.test.com:77/path/path23?query#qwer');
    })
    // Check the UriSetUserInfo.
    /**
     * @tc.name   testUriUriSetUserInfo004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_19600
     * @tc.desc   Encode UserInfo and set it to the URI UserInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetUserInfo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http:/userinfo@www.test.com:77/path/path23?query#qwer");
        uriObj.userInfo = "sji<+s大"
        expect(uriObj.userInfo).assertEqual(null);
        expect(uriObj.toString()).assertEqual('http:/userinfo@www.test.com:77/path/path23?query#qwer');
    })
    // Check the UriSetUserInfo.
    /**
     * @tc.name   testUriUriSetUserInfo005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_19700
     * @tc.desc   Encode UserInfo and set it to the URI UserInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetUserInfo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
        uriObj.userInfo = ""
        expect(uriObj.userInfo).assertEqual(null);
        expect(uriObj.toString()).assertEqual('http://www.test.com:77/path/path23?query#qwer');
    })
    // Check the UriSetPath.
    /**
     * @tc.name   testUriUriSetPath001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_19800
     * @tc.desc   Encode Path and set it to the URI Path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetPath001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
        uriObj.path = ""
        expect(uriObj.path).assertEqual(null);
        expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77?query#qwer');
    })
    // Check the UriSetPath.
    /**
     * @tc.name   testUriUriSetPath002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_19900
     * @tc.desc   Encode Path and set it to the URI Path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetPath002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
        uriObj.path = "pathtest/pp"
        expect(uriObj.path).assertEqual('pathtest/pp');
        expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/pathtest/pp?query#qwer');
    })
    // Check the UriSetPath.
    /**
     * @tc.name   testUriUriSetPath003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_20000
     * @tc.desc   Encode Path and set it to the URI Path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetPath003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
        uriObj.path = "pathtest/p大p"
        expect(uriObj.path).assertEqual('pathtest/p大p');
        expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/pathtest/p%E5%A4%A7p?query#qwer');
    })
    // Check the UriSetPath.
    /**
     * @tc.name   testUriUriSetPath004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_20100
     * @tc.desc   Encode Path and set it to the URI Path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetPath004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://userinfo@www.test.com:77?query#qwer");
        uriObj.path = "/testuri015/p大p/"
        expect(uriObj.path).assertEqual('/testuri015/p大p/');
        expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/testuri015/p%E5%A4%A7p/?query#qwer');
    })
    // Check the UriSetPath.
    /**
     * @tc.name   testUriUriSetPath005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_20200
     * @tc.desc   Encode Path and set it to the URI Path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetPath005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://userinfo@www.test.com:77?query#qwer");
        uriObj.path = "/testuri016/p大p/"
        expect(uriObj.ssp).assertEqual('//userinfo@www.test.com:77/testuri016/p大p/?query');
        expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/testuri016/p%E5%A4%A7p/?query#qwer');
    })
    // Check the UriSetPath.
    /**
     * @tc.name   testUriUriSetPath006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_20300
     * @tc.desc   Encode Path and set it to the URI Path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetPath006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http:userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
        uriObj.path = "/testuri017/p大p/"
        expect(uriObj.path).assertEqual('/testuri017/p大p/');
        expect(uriObj.toString()).assertEqual('http:/testuri017/p%E5%A4%A7p/#qwer');
    })
    // Check the UriSetQuery.
    /**
     * @tc.name   testUriUriSetQuery001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_20400
     * @tc.desc   Encode Query and set it to the URI Query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetQuery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
        uriObj.query = "/testuri018/p大p/=sasf"
        expect(uriObj.query).assertEqual('/testuri018/p大p/=sasf');
        let res = 'http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?%2Ftesturi018%2Fp%E5%A4%A7p%2F%3Dsasf#qwer';
        expect(uriObj.toString()).assertEqual(res);
    })
    // Check the UriSetQuery.
    /**
     * @tc.name   testUriUriSetQuery002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_20500
     * @tc.desc   Encode Query and set it to the URI Query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetQuery002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
        uriObj.query = "key=value&key1=value1"
        expect(uriObj.query).assertEqual('key=value&key1=value1');
        let res = 'http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?key%3Dvalue%26key1%3Dvalue1#qwer';
        expect(uriObj.toString()).assertEqual(res);
    })
    // Check the UriSetQuery.
    /**
     * @tc.name   testUriUriSetQuery003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_20600
     * @tc.desc   Encode Query and set it to the URI Query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetQuery003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
        uriObj.query = '';
        expect(uriObj.query).assertEqual(null);
        expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/#qwer');
    })
    // Check the UriSetQuery.
    /**
     * @tc.name   testUriUriSetQuery004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_20700
     * @tc.desc   Encode Query and set it to the URI Query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetQuery004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
        uriObj.query = 'kkey=sal';
        expect(uriObj.query).assertEqual("kkey=sal");
        expect(uriObj.ssp).assertEqual("//userinfo@www.test.com:77/testuri017/p大p/?kkey=sal");
        let res = 'http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?kkey%3Dsal#qwer';
        expect(uriObj.toString()).assertEqual(res);
    })
    // Check the UriSetQuery.
    /**
     * @tc.name   testUriUriSetQuery005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_20800
     * @tc.desc   Encode Query and set it to the URI Query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetQuery005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http:/userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
        uriObj.query = 'kkey=sal&jj=oi';
        expect(uriObj.query).assertEqual("kkey=sal&jj=oi");
        expect(uriObj.ssp).assertEqual("/userinfo@www.test.com:77/testuri017/p大p/?kkey=sal&jj=oi");
        let res = 'http:/userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?kkey%3Dsal%26jj%3Doi#qwer';
        expect(uriObj.toString()).assertEqual(res);
    })
    // Check the UriSetFragment.
    /**
     * @tc.name   testUriUriSetFragment001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_20900
     * @tc.desc   Encode Fragment and set it to the URI Fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetFragment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http:/userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
        uriObj.fragment = 'kkey=sal&jj=oi';
        expect(uriObj.fragment).assertEqual("kkey=sal&jj=oi");
        expect(uriObj.ssp).assertEqual("/userinfo@www.test.com:77/testuri017/p大p/?query");
        let res = 'http:/userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query#kkey%3Dsal%26jj%3Doi';
        expect(uriObj.toString()).assertEqual(res);
    })
    // Check the UriSetFragment.
    /**
     * @tc.name   testUriUriSetFragment002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_21000
     * @tc.desc   Encode Fragment and set it to the URI Fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetFragment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http:/userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
        uriObj.fragment = '';
        expect(uriObj.fragment).assertEqual(null);
        expect(uriObj.toString()).assertEqual('http:/userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query');
    })
    // Check the UriSetFragment.
    /**
     * @tc.name   testUriUriSetFragment003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_21100
     * @tc.desc   Encode Fragment and set it to the URI Fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetFragment003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http:/userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
        uriObj.fragment = '#jia片段';
        expect(uriObj.fragment).assertEqual("#jia片段");
        let res = 'http:/userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query#%23jia%E7%89%87%E6%AE%B5';
        expect(uriObj.toString()).assertEqual(res);
    })
    // Check the UriSetFragment.
    /**
     * @tc.name   testUriUriSetFragment004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_21200
     * @tc.desc   Encode Fragment and set it to the URI Fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetFragment004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query");
        uriObj.fragment = '#jia片段f';
        expect(uriObj.fragment).assertEqual("#jia片段f");
        let res = 'http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query#%23jia%E7%89%87%E6%AE%B5f';
        expect(uriObj.toString()).assertEqual(res);
    })
    // Check the UriSetFragment.
    /**
     * @tc.name   testUriUriSetFragment005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_21300
     * @tc.desc   Encode Fragment and set it to the URI Fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetFragment005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http:userinfo@www.test.com:77/testuri017/p大p/?query");
        uriObj.fragment = 'jia片段f';
        expect(uriObj.fragment).assertEqual("jia片段f");
        let res = 'http:userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query#jia%E7%89%87%E6%AE%B5f';
        expect(uriObj.toString()).assertEqual(res);
    })
    // Check the UriSetAuthority.
    /**
     * @tc.name   testUriUriSetAuthority001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_21400
     * @tc.desc   Encode Authority and set it to the URI Authority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetAuthority001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
        uriObj.authority = 'www.test11.cn:88';
        expect(uriObj.userInfo).assertEqual(null);
        expect(uriObj.host).assertEqual("www.test11.cn");
        expect(uriObj.port).assertEqual("88");
        expect(uriObj.toString()).assertEqual('http://www.test11.cn:88/testuri017/p%E5%A4%A7p/?query#asd');
    })
    // Check the UriSetAuthority.
    /**
     * @tc.name   testUriUriSetAuthority002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_21500
     * @tc.desc   Encode Authority and set it to the URI Authority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetAuthority002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.name   testUriUriSetAuthority003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_21600
     * @tc.desc   Encode Authority and set it to the URI Authority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetAuthority003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.name   testUriUriSetAuthority004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_21700
     * @tc.desc   Encode Authority and set it to the URI Authority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetAuthority004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.name   testUriUriSetSsp001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_21800
     * @tc.desc   Encode Ssp and set it to the URI Ssp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetSsp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.name   testUriUriSetSsp002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_21900
     * @tc.desc   Encode Ssp and set it to the URI Ssp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetSsp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.name   testUriUriSetSsp003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_22000
     * @tc.desc   Encode Ssp and set it to the URI Ssp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetSsp003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.name   testUriUriSetSsp004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_22100
     * @tc.desc   Encode Ssp and set it to the URI Ssp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetSsp004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.name   testUriUriSetEncodedUserInfo001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_22200
     * @tc.desc   set EncodedUserInfo to the URI UserInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedUserInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://user@www.hw.com:77/path/path23?query#qwer");
        uriObj.encodedUserInfo = "testuri007"
        expect(uriObj.encodedUserInfo).assertEqual('testuri007');
        expect(uriObj.toString()).assertEqual('http://testuri007@www.hw.com:77/path/path23?query#qwer');
    })
    // Check the UriSetEncodedUserInfo.
    /**
     * @tc.name   testUriUriSetEncodedUserInfo002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_22300
     * @tc.desc   set EncodedUserInfo to the URI UserInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedUserInfo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://www.test.com:77/path/path23?query#qwer");
        uriObj.encodedUserInfo = "testuri008"
        expect(uriObj.encodedUserInfo).assertEqual('testuri008');
        expect(uriObj.toString()).assertEqual('http://testuri008@www.test.com:77/path/path23?query#qwer');
    })
    // Check the UriSetEncodedUserInfo.
    /**
     * @tc.name   testUriUriSetEncodedUserInfo003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_22400
     * @tc.desc   set EncodedUserInfo to the URI UserInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedUserInfo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
        uriObj.encodedUserInfo = "sji<+s大"
        expect(uriObj.encodedUserInfo).assertEqual('userinfo');
        expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/path/path23?query#qwer');
    })
    // Check the UriSetEncodedUserInfo.
    /**
     * @tc.name   testUriUriSetEncodedUserInfo004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_22500
     * @tc.desc   set EncodedUserInfo to the URI UserInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedUserInfo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http:/userinfo@www.test.com:77/path/path23?query#qwer");
        uriObj.encodedUserInfo = "sji<+s大"
        expect(uriObj.encodedUserInfo).assertEqual(null);
        expect(uriObj.toString()).assertEqual('http:/userinfo@www.test.com:77/path/path23?query#qwer');
    })
    // Check the UriSetEncodedUserInfo.
    /**
     * @tc.name   testUriUriSetEncodedUserInfo005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_22600
     * @tc.desc   set EncodedUserInfo to the URI UserInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedUserInfo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
        uriObj.encodedUserInfo = ""
        expect(uriObj.userInfo).assertEqual(null);
        expect(uriObj.toString()).assertEqual('http://www.test.com:77/path/path23?query#qwer');
    })
    // Check the UriSetEncodedPath.
    /**
     * @tc.name   testUriUriSetEncodedPath001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_22700
     * @tc.desc   set EncodedPath to the URI Path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedPath001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
        uriObj.encodedPath = ""
        expect(uriObj.encodedPath).assertEqual(null);
        expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77?query#qwer');
    })
    // Check the UriSetEncodedPath.
    /**
     * @tc.name   testUriUriSetEncodedPath002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_22800
     * @tc.desc   set EncodedPath to the URI Path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedPath002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
        uriObj.encodedPath = "pathtest/pp"
        expect(uriObj.encodedPath).assertEqual('pathtest/pp');
        expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/pathtest/pp?query#qwer');
    })
    // Check the UriSetEncodedPath.
    /**
     * @tc.name   testUriUriSetEncodedPath003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_22900
     * @tc.desc   set EncodedPath to the URI Path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedPath003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://userinfo@www.test.com:77/path/path23?query#qwer");
        uriObj.encodedPath = "pathtest/p%E5%A4%A7p"
        expect(uriObj.encodedPath).assertEqual('pathtest/p%E5%A4%A7p');
        expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/pathtest/p%E5%A4%A7p?query#qwer');
    })
    // Check the UriSetEncodedPath.
    /**
     * @tc.name   testUriUriSetEncodedPath004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_23000
     * @tc.desc   set EncodedPath to the URI Path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedPath004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://userinfo@www.test.com:77?query#qwer");
        uriObj.encodedPath = "/testuri015/p大p/"
        expect(uriObj.encodedPath).assertEqual('/testuri015/p大p/');
        expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/testuri015/p%E5%A4%A7p/?query#qwer');
    })
    // Check the UriSetEncodedPath.
    /**
     * @tc.name   testUriUriSetEncodedPath005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_23100
     * @tc.desc   set EncodedPath to the URI Path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedPath005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://userinfo@www.test.com:77");
        uriObj.encodedPath = "testuri016/p%E5%A4%A7/"
        expect(uriObj.encodedPath).assertEqual('testuri016/p%E5%A4%A7/');
        expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/testuri016/p%E5%A4%A7/');
    })
    // Check the UriSetEncodedQuery.
    /**
     * @tc.name   testUriUriSetEncodedQuery001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_23200
     * @tc.desc   set EncodedQuery to the URI Query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedQuery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
        uriObj.encodedQuery = "/testuri018/p大p/=sasf"
        expect(uriObj.encodedQuery).assertEqual('/testuri018/p大p/=sasf');
        let res = 'http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?/testuri018/p%E5%A4%A7p/=sasf#qwer';
        expect(uriObj.toString()).assertEqual(res);
    })
    // Check the UriSetEncodedQuery.
    /**
     * @tc.name   testUriUriSetEncodedQuery002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_23300
     * @tc.desc   set EncodedQuery to the URI Query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedQuery002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
        uriObj.encodedQuery = "key=value&key1=value1"
        expect(uriObj.encodedQuery).assertEqual('key=value&key1=value1');
        expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?key=value&key1=value1#qwer');
    })
    // Check the UriSetEncodedQuery.
    /**
     * @tc.name   testUriUriSetEncodedQuery003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_23400
     * @tc.desc   set EncodedQuery to the URI Query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedQuery003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
        uriObj.encodedQuery = '';
        expect(uriObj.encodedQuery).assertEqual(null);
        expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/#qwer');
    })
    // Check the UriSetEncodedQuery.
    /**
     * @tc.name   testUriUriSetEncodedQuery004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_23500
     * @tc.desc   set EncodedQuery to the URI Query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedQuery004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
        uriObj.encodedQuery = 'kkey=sal';
        expect(uriObj.encodedQuery).assertEqual("kkey=sal");
        expect(uriObj.ssp).assertEqual("//userinfo@www.test.com:77/testuri017/p大p/?kkey=sal");
        expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?kkey=sal#qwer');
    })
    // Check the UriSetEncodedQuery.
    /**
     * @tc.name   testUriUriSetEncodedQuery005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_23600
     * @tc.desc   set EncodedQuery to the URI Query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedQuery005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http:/userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
        uriObj.encodedQuery = 'kkey=sal&jj=oi';
        expect(uriObj.encodedQuery).assertEqual("kkey=sal&jj=oi");
        expect(uriObj.ssp).assertEqual("/userinfo@www.test.com:77/testuri017/p大p/?kkey=sal&jj=oi");
        expect(uriObj.toString()).assertEqual('http:/userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?kkey=sal&jj=oi#qwer');
    })
    // Check the UriSetEncodedFragment.
    /**
     * @tc.name   testUriUriSetEncodedFragment001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_23700
     * @tc.desc   set EncodedFragment to the URI Fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedFragment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http:/userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
        uriObj.encodedFragment = 'kkey=sal&jj=oi';
        expect(uriObj.encodedFragment).assertEqual("kkey=sal&jj=oi");
        expect(uriObj.ssp).assertEqual("/userinfo@www.test.com:77/testuri017/p大p/?query");
        expect(uriObj.toString()).assertEqual('http:/userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query#kkey=sal&jj=oi');
    })
    // Check the UriSetEncodedFragment.
    /**
     * @tc.name   testUriUriSetEncodedFragment002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_23800
     * @tc.desc   set EncodedFragment to the URI Fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedFragment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http:/userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
        uriObj.encodedFragment = '';
        expect(uriObj.encodedFragment).assertEqual(null);
        expect(uriObj.toString()).assertEqual('http:/userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query');
    })
    // Check the UriSetEncodedFragment.
    /**
     * @tc.name   testUriUriSetEncodedFragment003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_23900
     * @tc.desc   set EncodedFragment to the URI Fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedFragment003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http:/userinfo@www.test.com:77/testuri017/p大p/?query#qwer");
        uriObj.encodedFragment = '#jia片段';
        expect(uriObj.encodedFragment).assertEqual("qwer");
        expect(uriObj.toString()).assertEqual('http:/userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query#qwer');
    })
    // Check the UriSetEncodedFragment.
    /**
     * @tc.name   testUriUriSetEncodedFragment004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_24000
     * @tc.desc   set EncodedFragment to the URI Fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedFragment004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query");
        uriObj.encodedFragment = 'jia片段f';
        expect(uriObj.encodedFragment).assertEqual("jia片段f");
        expect(uriObj.toString()).assertEqual('http://userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query#jia%E7%89%87%E6%AE%B5f');
    })
    // Check the UriSetEncodedFragment.
    /**
     * @tc.name   testUriUriSetEncodedFragment005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_24100
     * @tc.desc   set EncodedFragment to the URI Fragment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedFragment005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http:userinfo@www.test.com:77/testuri017/p大p/?query");
        uriObj.encodedFragment = 'jia片段f';
        expect(uriObj.encodedFragment).assertEqual("jia片段f");
        expect(uriObj.toString()).assertEqual('http:userinfo@www.test.com:77/testuri017/p%E5%A4%A7p/?query#jia%E7%89%87%E6%AE%B5f');
    })
    // Check the UriSetEncodedAuthority.
    /**
     * @tc.name   testUriUriSetEncodedAuthority001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_24200
     * @tc.desc   set EncodedAuthority to the URI Authority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedAuthority001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uriObj = new uri.URI("http://userinfo@www.test.com:77/testuri017/p大p/?query#asd");
        uriObj.encodedAuthority = 'www.test11.cn:88';
        expect(uriObj.encodedUserInfo).assertEqual(null);
        expect(uriObj.host).assertEqual("www.test11.cn");
        expect(uriObj.port).assertEqual("88");
        expect(uriObj.toString()).assertEqual('http://www.test11.cn:88/testuri017/p%E5%A4%A7p/?query#asd');
    })
    // Check the UriSetEncodedAuthority.
    /**
     * @tc.name   testUriUriSetEncodedAuthority002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_24300
     * @tc.desc   set EncodedAuthority to the URI Authority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedAuthority002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.name   testUriUriSetEncodedAuthority003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_24400
     * @tc.desc   set EncodedAuthority to the URI Authority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedAuthority003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.name   testUriUriSetEncodedAuthority004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_24500
     * @tc.desc   set EncodedAuthority to the URI Authority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedAuthority004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.name   testUriUriSetEncodedSsp001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_24600
     * @tc.desc   set EncodedSsp to the URI Ssp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedSsp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.name   testUriUriSetEncodedSsp002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_24700
     * @tc.desc   set EncodedSsp to the URI Ssp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedSsp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.name   testUriUriSetEncodedSsp003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_24800
     * @tc.desc   set EncodedSsp to the URI Ssp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedSsp003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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
     * @tc.name   testUriUriSetEncodedSsp004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URI_24900
     * @tc.desc   set EncodedSsp to the URI Ssp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUriUriSetEncodedSsp004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
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