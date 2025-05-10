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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
export function UriTest() {
describe('UriTest', function () {

    // Check the UriConstruction.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_0100
     * @tc.name: testUriConstruction001
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriConstruction001', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_0200
     * @tc.name: testUriConstruction002
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriConstruction002', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_0300
     * @tc.name: testUriConstruction003
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriConstruction003', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_0400
     * @tc.name: testUriConstruction004
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriConstruction004', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_0500
     * @tc.name: testUriConstruction005
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriConstruction005', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_0600
     * @tc.name: testUriConstruction006
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriConstruction006', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_0700
     * @tc.name: testUriConstruction007
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriConstruction007', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_0800
     * @tc.name: testUriConstruction008
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriConstruction008', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_0900
     * @tc.name: testUriConstruction009
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriConstruction009', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_1000
     * @tc.name: testUriConstruction010
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriConstruction010', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_1100
     * @tc.name: testUriConstruction011
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriConstruction011', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_1200
     * @tc.name: testUriConstruction012
     * @tc.desc: Constructs a URI by parsing the given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriConstruction012', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriConstruction013', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriConstruction014', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriConstruction015', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriConstruction016', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriConstruction017', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriConstruction018', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriConstruction019', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriConstruction020', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriConstruction021', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriConstruction022', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriConstruction023', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriConstruction024', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriConstruction025', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriConstruction026', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriConstruction027', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriConstruction028', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriConstruction029', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriConstruction030', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriConstruction031', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testEquals001', 0, function () {
        let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
        let gaogao1 = gaogao;
        let res = gaogao.equals(gaogao1);
        expect(res).assertEqual(true);
    })

    // Check the UriEquals.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_3300
     * @tc.name: testEquals002
     * @tc.desc: Tests this URI for equality with another object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEquals002', 0, function () {
        let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
        let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
        let res = gaogao.equals(gaogao1);
        expect(res).assertEqual(true);
    })

    // Check the UriEquals.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_3400
     * @tc.name: testEquals003
     * @tc.desc: Tests this URI for equality with another object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEquals003', 0, function () {
        let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
        let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment123');
        let res = gaogao.equals(gaogao1);
        expect(res).assertEqual(false);
    })

    // Check the UriEquals.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_3500
     * @tc.name: testEquals004
     * @tc.desc: Tests this URI for equality with another object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEquals004', 0, function () {
        let gaogao = new uri.URI('http://gg:gaogao@wwwaaa:99/path1?query#fagment');
        let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment123');
        let res = gaogao.equals(gaogao1);
        expect(res).assertEqual(false);
    })

    // Check the UriEquals.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_3600
     * @tc.name: testEquals005
     * @tc.desc: Tests this URI for equality with another object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEquals005', 0, function () {
        let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
        let gaogao1 = new uri.URI('http://[1:0:0:1:2:1:2:1]/path1?query#fagment123');
        let res = gaogao.equals(gaogao1);
        expect(res).assertEqual(false);
    })

    // Check the UriEquals.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_3700
     * @tc.name: testEqualsTo001
     * @tc.desc: Tests this URI for equality with another object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEqualsTo001', 0, function () {
        let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
        let gaogao1 = gaogao;
        let res = gaogao.equalsTo(gaogao1);
        expect(res).assertEqual(true);
    })

    // Check the UriEquals.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_3800
     * @tc.name: testEqualsTo002
     * @tc.desc: Tests this URI for equality with another object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEqualsTo002', 0, function () {
        let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
        let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
        let res = gaogao.equalsTo(gaogao1);
        expect(res).assertEqual(true);
    })

    // Check the UriEquals.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_3900
     * @tc.name: testEqualsTo003
     * @tc.desc: Tests this URI for equality with another object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEqualsTo003', 0, function () {
        let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
        let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment123');
        let res = gaogao.equalsTo(gaogao1);
        expect(res).assertEqual(false);
    })

    // Check the UriEquals.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_4000
     * @tc.name: testEqualsTo004
     * @tc.desc: Tests this URI for equality with another object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEqualsTo004', 0, function () {
        let gaogao = new uri.URI('http://gg:gaogao@wwwaaa:99/path1?query#fagment');
        let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment123');
        let res = gaogao.equalsTo(gaogao1);
        expect(res).assertEqual(false);
    })

    // Check the UriEquals.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_4100
     * @tc.name: testEqualsTo005
     * @tc.desc: Tests this URI for equality with another object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEqualsTo005', 0, function () {
        let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
        let gaogao1 = new uri.URI('http://[1:0:0:1:2:1:2:1]/path1?query#fagment123');
        let res = gaogao.equalsTo(gaogao1);
        expect(res).assertEqual(false);
    })
    
    // Check the UriEquals.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_4200
     * @tc.name: testEqualsTo006
     * @tc.desc: Tests for wrong input parameter type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testEqualsTo006', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_4300
     * @tc.name: testEqualsTo007
     * @tc.desc: Tests for wrong input parameter type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
     it('testEqualsTo007', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_4400
     * @tc.name: testNormalize001
     * @tc.desc: Tests Normalizes this URI's path.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testNormalize001', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testNormalize002', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testNormalize003', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testNormalize004', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testNormalize005', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testToString001', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testToString002', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testToString003', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testToString004', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testToString005', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testCheckIsAbsolute001', 0, function () {
        let gaogao = new uri.URI('f/tp://username:password@www.baidu.com:88/path?query#fagment');
        let res = gaogao.checkIsAbsolute();
        expect(res).assertEqual(false);
    })

    // Check the UriCheckIsAbsolute.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_5500
     * @tc.name: testCheckIsAbsolute002
     * @tc.desc: Tells whether or not this URI is absolute.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCheckIsAbsolute002', 0, function () {
        let gaogao = new uri.URI('ftp://username:password@www.baidu.com:88/path?query#fagment');
        let res = gaogao.checkIsAbsolute();
        expect(res).assertEqual(true);
    })

    // Check the UriCheckIsAbsolute.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_5600
     * @tc.name: testCheckIsAbsolute003
     * @tc.desc: Tells whether or not this URI is absolute.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCheckIsAbsolute003', 0, function () {
        let gaogao = new uri.URI('htt/p://username:password@www.baidu.com:88/path?query#fagment');
        let res = gaogao.checkIsAbsolute();
        expect(res).assertEqual(false);
    })

    // Check the UriCheckIsAbsolute.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_5700
     * @tc.name: testCheckIsAbsolute004
     * @tc.desc: Tells whether or not this URI is absolute.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCheckIsAbsolute004', 0, function () {
        let gaogao = new uri.URI('https://username:password@www.baidu.com:88/path?query#fagment');
        let res = gaogao.checkIsAbsolute();
        expect(res).assertEqual(true);
    })

    // Check the UriCheckIsAbsolute.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_5800
     * @tc.name: testCheckIsAbsolute005
     * @tc.desc: Tells whether or not this URI is absolute.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCheckIsAbsolute005', 0, function () {
        let gaogao = new uri.URI('http1://username:password@www.baidu.com:88/path?query#fagment');
        let res = gaogao.checkIsAbsolute();
        expect(res).assertEqual(true);
    })

    // Check the UriCheckRelative.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_5900
     * @tc.name: testCheckRelative001
     * @tc.desc: Tells whether or not this URI is relative.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
     it('testCheckRelative001', 0, function () {
      let route = new uri.URI('http://www.test.com/images/pic.jpg');
      let res = route.checkRelative();
      expect(res).assertEqual(false);
    })

    // Check the UriCheckRelative.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_6000
     * @tc.name: testCheckRelative002
     * @tc.desc: Tells whether or not this URI is relative.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCheckRelative002', 0, function () {
      let route = new uri.URI('/images/pic.jpg');
      let res = route.checkRelative();
      expect(res).assertEqual(true);
    })

    // Check the UriCheckRelative.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_6100
     * @tc.name: testCheckRelative003
     * @tc.desc: Tells whether or not this URI is relative.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCheckRelative003', 0, function () {
      let route = new uri.URI('https://www.test.com/images/logo.jpg');
      let res = route.checkRelative();
      expect(res).assertEqual(false);
    })

    // Check the UriCheckRelative.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_6200
     * @tc.name: testCheckRelative004
     * @tc.desc: Tells whether or not this URI is relative.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCheckRelative004', 0, function () {
      let route = new uri.URI('aaa');
      let res = route.checkRelative();
      expect(res).assertEqual(true);
    })

    // Check the UriCheckRelative.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_6300
     * @tc.name: testCheckRelative005
     * @tc.desc: Tells whether or not this URI is relative.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCheckRelative005', 0, function () {
      let mailtoRoute = new uri.URI('mailto:user@test.com');
      expect(mailtoRoute.checkRelative()).assertEqual(false);
    })

    // Check the UriCheckOpaque.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_6400
     * @tc.name: testCheckOpaque001
     * @tc.desc: Tells whether or not this URI is opaque.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCheckOpaque001', 0, function () {
      let route = new uri.URI('http://www.test.com/images/pic.jpg');
      let res = route.checkOpaque();
      expect(res).assertEqual(false);
    })

    // Check the UriCheckOpaque.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_6500
     * @tc.name: testCheckOpaque002
     * @tc.desc: Tells whether or not this URI is Opaque.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCheckOpaque002', 0, function () {
      let route = new uri.URI('images/pic.jpg');
      let res = route.checkOpaque();
      expect(res).assertEqual(false);
    })

    // Check the UriCheckOpaque.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_6600
     * @tc.name: testCheckOpaque003
     * @tc.desc: Tells whether or not this URI is Opaque.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCheckOpaque003', 0, function () {
      let route = new uri.URI('mailto:user@test.com');
      expect(route.checkOpaque()).assertEqual(true);
    })

    // Check the UriCheckOpaque.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_6700
     * @tc.name: testCheckOpaque004
     * @tc.desc: Tells whether or not this URI is Opaque.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCheckOpaque004', 0, function () {
      let route = new uri.URI('tel:1234567890');
      let res = route.checkOpaque();
      expect(res).assertEqual(true);
    })

    // Check the UriCheckHierarchical.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_6800
     * @tc.name: testCheckHierarchical001
     * @tc.desc: Tells whether or not this URI is Opaque.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCheckHierarchical001', 0, function () {
      let route = new uri.URI('http://www.test.com/images/pic.jpg');
      let res = route.checkHierarchical();
      expect(res).assertEqual(true);
    })

    // Check the UriCheckHierarchical.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_6900
     * @tc.name: testCheckHierarchical002
     * @tc.desc: Tells whether or not this URI is Opaque.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCheckHierarchical002', 0, function () {
      let route = new uri.URI('mailto:test@test.com');
      let res = route.checkHierarchical();
      expect(res).assertEqual(false);
    })

    // Check the UriCheckHierarchical.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_7000
     * @tc.name: testCheckHierarchical003
     * @tc.desc: Tells whether or not this URI is Opaque.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCheckHierarchical003', 0, function () {
      let route = new uri.URI('images/pic.jpg');
      let res = route.checkHierarchical();
      expect(res).assertEqual(true);
    })

    // Check the UriCheckHierarchical.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_7100
     * @tc.name: testCheckHierarchical004
     * @tc.desc: Tells whether or not this URI is Opaque.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCheckHierarchical004', 0, function () {
      let route = new uri.URI('path');
      expect(route.checkHierarchical()).assertEqual(true);
      let testUri = new uri.URI('path:');
      expect(testUri.checkHierarchical()).assertEqual(false);
    })

    // Check the UriGetQueryValue.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_7200
     * @tc.name: testUriGetQueryValue001
     * @tc.desc: Get specific query parameters from URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriGetQueryValue001', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriGetQueryValue002', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriGetQueryValue003', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriGetQueryValue004', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriGetQueryValue005', 0, function () {
      let route = new uri.URI('https://www.test.com?param%201=hello');
      expect(route.getQueryValue("param 1")).assertEqual("hello");
      expect(route.getQueryValue("1")).assertNull();
      expect(route.getQueryValue(" 1")).assertNull();
    })

    // Check the UriGetQueryValue.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_7700
     * @tc.name: testUriGetQueryValue006
     * @tc.desc: Get specific query parameters from URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriGetQueryValue006', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriGetQueryValue007', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriAddQueryValue001', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriAddQueryValue002', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriAddQueryValue003', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_8200
     * @tc.name: testUriAddQueryValue004
     * @tc.desc: Add query parameters for URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriAddQueryValue004', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriAddQueryValue005', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriAddQueryValue006', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriAddQueryValue007', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriGetQueryNames001', 0, function () {
      let route = new uri.URI('https://www.test.com?param1=value1&param2=value2');
      let paramNames = route.getQueryNames();
      expect(paramNames.length).assertEqual(2);
      expect(paramNames.values().next().value).assertEqual("param1");
    })

    // Check the UriGetQueryNames.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_8700
     * @tc.name: testUriGetQueryNames002
     * @tc.desc: Get the names of all query parameters in the URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriGetQueryNames002', 0, function () {
      let route = new uri.URI('https://www.test.com');
      let paramNames = route.getQueryNames();
      expect(paramNames.length).assertEqual(0);
    })

    // Check the UriGetQueryNames.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_8800
     * @tc.name: testUriGetQueryNames003
     * @tc.desc: Get the names of all query parameters in the URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriGetQueryNames003', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_8900
     * @tc.name: testUriGetQueryNames004
     * @tc.desc: Get the names of all query parameters in the URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriGetQueryNames004', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_9000
     * @tc.name: testUriGetQueryNames005
     * @tc.desc: Get the names of all query parameters in the URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriGetQueryNames005', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_9100
     * @tc.name: testUriGetQueryNames006
     * @tc.desc: Get the names of all query parameters in the URI
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriGetQueryNames006', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_9200
     * @tc.name: testUriGetQueryValues001
     * @tc.desc: Get all parameters and their corresponding values in the URI query string
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriGetQueryValues001', 0, function () {
      let route = new uri.URI('https://www.test.com/search?query=name&sort=asc&filter=f');
      let values = route.getQueryValues("query");
      expect(values.length).assertEqual(1);
    })

    // Check the UriGetQueryValues.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_9300
     * @tc.name: testUriGetQueryValues002
     * @tc.desc: Get all parameters and their corresponding values in the URI query string
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriGetQueryValues002', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriGetQueryValues003', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_9500
     * @tc.name: testUriGetQueryValues004
     * @tc.desc: Get all parameters and their corresponding values in the URI query string
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriGetQueryValues004', 0, function () {
      let route = new uri.URI('https://www.test.com/search');
      let values = route.getQueryValues("query");
      expect(values.length).assertEqual(0);
    })

    // Check the UriGetQueryValues.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_9600
     * @tc.name: testUriGetQueryValues005
     * @tc.desc: Get all parameters and their corresponding values in the URI query string
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriGetQueryValues005', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriGetQueryValues006', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriGetQueryValues007', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriGetQueryValues008', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriGetBooleanQueryValue001', 0, function () {
      let route = new uri.URI('https://www.test.com/search?active=true');
      let isActive = route.getBooleanQueryValue("active", false);
      expect(isActive).assertEqual(true);
    })

    // Check the UriGetBooleanQueryValue.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_10100
     * @tc.name: testUriGetBooleanQueryValue002
     * @tc.desc: Get the Boolean value of the URI query parameter
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriGetBooleanQueryValue002', 0, function () {
      let route = new uri.URI('https://www.test.com/search');
      let isActive = route.getBooleanQueryValue("active", false);
      expect(isActive).assertEqual(false);
    })

    // Check the UriGetBooleanQueryValue.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_10200
     * @tc.name: testUriGetBooleanQueryValue003
     * @tc.desc: Get the Boolean value of the URI query parameter
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriGetBooleanQueryValue003', 0, function () {
      let route = new uri.URI('https://www.test.com/search?active=name');
      let isActive = route.getBooleanQueryValue("active", false);
      expect(isActive).assertEqual(true);
    })

    // Check the UriGetBooleanQueryValue.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_10300
     * @tc.name: testUriGetBooleanQueryValue004
     * @tc.desc: Get the Boolean value of the URI query parameter
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriGetBooleanQueryValue004', 0, function () {
      let route = new uri.URI('https://www.test.com/search');
      let isActive = route.getBooleanQueryValue("active", true);
      expect(isActive).assertEqual(true);
    })

    // Check the UriGetBooleanQueryValue.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_10400
     * @tc.name: testUriGetBooleanQueryValue005
     * @tc.desc: Get the Boolean value of the URI query parameter
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriGetBooleanQueryValue005', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_10500
     * @tc.name: testUriClearQuery001
     * @tc.desc: Clear URI query parameters
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriClearQuery001', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriClearQuery002', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriClearQuery003', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriClearQuery004', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriGetLastSegment001', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriGetLastSegment002', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriGetLastSegment003', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriGetLastSegment004', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriGetLastSegment005', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriGetLastSegment006', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriGetSegment007', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_11600
     * @tc.name: testUriGetSegment001
     * @tc.desc: Get all segments in the URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriGetSegment001', 0, function () {
      let route = new uri.URI('content://com.test.uri/files/images');
      let segments = route.getSegment();
      expect(segments.length).assertEqual(2);
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
     * @tc.level: Level 2
     */
    it('testUriGetSegment002', 0, function () {
      let route = new uri.URI('content://com.test.uri/');
      let segments = route.getSegment();
      expect(segments.length).assertEqual(0);
    })

    // Check the UriGetSegment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_11800
     * @tc.name: testUriGetSegment003
     * @tc.desc: Get all segments in the URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriGetSegment003', 0, function () {
      let route = new uri.URI('content://com.test.uri/files/');
      let segments = route.getSegment();
      expect(segments.length).assertEqual(1);
    })

    // Check the UriGetSegment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_11900
     * @tc.name: testUriGetSegment004
     * @tc.desc: Get all segments in the URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriGetSegment004', 0, function () {
      let route = new uri.URI('content://com.test.uri');
      let segments = route.getSegment();
      expect(segments.length).assertEqual(0);
      let mailRoute = new uri.URI('mailto:people');
      expect(mailRoute.getSegment().length).assertEqual(0);
    })

    // Check the UriGetSegment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_12000
     * @tc.name: testUriGetSegment005
     * @tc.desc: Get all segments in the URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriGetSegment005', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriGetSegment006', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriAddSegment001', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriAddSegment002', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriAddSegment003', 0, function () {
      let route = new uri.URI('http://www.test.com');
      let newRoute = route.addSegment("files");
      expect(newRoute.getLastSegment()).assertEqual("files");
      expect(newRoute.getSegment().length).assertEqual(1);
    })

    // Check the UriAddEncodedSegment.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_12500
     * @tc.name: testUriAddEncodedSegment001
     * @tc.desc: Encode the path segment and add it to the URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriAddEncodedSegment001', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriAddEncodedSegment002', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_12700
     * @tc.name: testUriAddEncodedSegment003
     * @tc.desc: Encode the path segment and add it to the URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriAddEncodedSegment003', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_12800
     * @tc.name: testUriCreateFromParts001
     * @tc.desc: Build a new URI object
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriCreateFromParts001', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriCreateFromParts002', 0, function () {
      let route = uri.URI.createFromParts("mailto", "no body", "top");
      expect(route.toString()).assertEqual("mailto:no%20body#top");
    })

    // Check the UriCreateFromParts.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_13000
     * @tc.name: testUriCreateFromParts003
     * @tc.desc: Build a new URI object
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriCreateFromParts003', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_13100
     * @tc.name: testUriCreateFromParts004
     * @tc.desc: Build a new URI object
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriCreateFromParts004', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriEncodedUserInfo001', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriEncodedUserInfo002', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriEncodedUserInfo003', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriEncodedUserInfo004', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriEncodedPath001', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriEncodedPath002', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriEncodedPath003', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriEncodedPath004', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriUriEncodedQuery001', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriUriEncodedQuery002', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriUriEncodedQuery003', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriUriEncodedQuery004', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriEncodedFragment001', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriEncodedFragment002', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriEncodedFragment003', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriEncodedFragment004', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriEncodedAuthority001', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriEncodedAuthority002', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriEncodedAuthority003', 0, function () {
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
     * @tc.level: Level 2
     */
    it('testUriEncodedAuthority004', 0, function () {
      let route = new uri.URI('https://www.test.com:8080/');
      expect(route.encodedAuthority).assertEqual("www.test.com:8080");
    })

    // Check the UriEncodedSSP.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_15200
     * @tc.name: testUriEncodedSSP001
     * @tc.desc:  Encoded URI specific scheme section
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriEncodedSSP001', 0, function () {
      let route = new uri.URI('http://username:name@www.test.com/path?query=example');
      expect(route.encodedSSP).assertEqual("//username:name@www.test.com/path?query=example");
    })

    // Check the UriEncodedSSP.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_15300
     * @tc.name: testUriEncodedSSP002
     * @tc.desc:  Encoded URI specific scheme section
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriEncodedSSP002', 0, function () {
      let route = new uri.URI('http://username:my%20name@www.test.com');
      expect(route.encodedSSP).assertEqual("//username:my%20name@www.test.com");
      let route1 = new uri.URI('http://username:my_20name@www.test.com');
      expect(route1.encodedSSP).assertEqual("//username:my_20name@www.test.com");
    })

    // Check the UriEncodedSSP.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_15400
     * @tc.name: testUriEncodedSSP003
     * @tc.desc:  Encoded URI specific scheme section
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriEncodedSSP003', 0, function () {
      let route = new uri.URI('https://www.test.com/');
      expect(route.encodedSSP).assertEqual("//www.test.com/");
    })

    // Check the UriCreateFromParts parameter.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_15500
     * @tc.name: testCreateFromPartsPara001
     * @tc.desc:  Encoded URI specific scheme section
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCreateFromPartsPara001', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_15600
     * @tc.name: testCreateFromPartsPara002
     * @tc.desc:  Encoded URI specific scheme section
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCreateFromPartsPara002', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_15700
     * @tc.name: testCreateFromPartsPara003
     * @tc.desc:  Encoded URI specific scheme section
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCreateFromPartsPara003', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_15800
     * @tc.name: testAddQueryValuePara001
     * @tc.desc:  Encoded URI specific scheme section
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAddQueryValuePara001', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_15900
     * @tc.name: testAddQueryValuePara002
     * @tc.desc:  Encoded URI specific scheme section
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAddQueryValuePara002', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_16000
     * @tc.name: testAddEncodedSegmentPara001
     * @tc.desc:  Encoded URI specific scheme section
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAddEncodedSegmentPara001', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_16100
     * @tc.name: testAddSegmentPara001
     * @tc.desc:  Encoded URI specific scheme section
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAddSegmentPara001', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_16200
     * @tc.name: testGetQueryValuePara001
     * @tc.desc:  Encoded URI specific scheme section
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetQueryValuePara001', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_16300
     * @tc.name: testGetQueryValuesPara001
     * @tc.desc:  Encoded URI specific scheme section
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetQueryValuesPara001', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_16400
     * @tc.name: testGetBooleanQueryValuePara001
     * @tc.desc:  Encoded URI specific scheme section
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetBooleanQueryValuePara001', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_16500
     * @tc.name: testGetBooleanQueryValuePara002
     * @tc.desc:  Encoded URI specific scheme section
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetBooleanQueryValuePara002', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_16600
     * @tc.name: testTildeUnderline001
     * @tc.desc:  Encoded URI specific scheme section
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
     it('testTildeUnderline001', 0, function () {
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
     * @tc.desc:  Encoded URI specific scheme section
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTildeUnderline002', 0, function () {
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
     * @tc.desc:  Encoded URI specific scheme section
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTildeUnderline003', 0, function () {
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
     * @tc.desc:  URI query add json
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
     it('testAddQueryJson001', 0, function () {
      let uriTest = new uri.URI('aaa://drive/page?need=false&bbb=true');
      let newUri = uriTest.addQueryValue("data", '{"type": 0, "from": "from"}');
      expect(newUri.toString()).assertEqual('aaa://drive/page?need=false&bbb=true&data=%7B%22type%22%3A%200%2C%20%22from%22%3A%20%22from%22%7D');
      expect(newUri.query).assertEqual('need=false&bbb=true&data={"type": 0, "from": "from"}');
      expect(newUri.getQueryValue('data')).assertEqual('{"type": 0, "from": "from"}');
      expect(newUri.encodedQuery).assertEqual('need=false&bbb=true&data=%7B%22type%22%3A%200%2C%20%22from%22%3A%20%22from%22%7D');
    })

    // Check the UriCreateFromParts parameter.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_17000
     * @tc.name: testCreateFromPartsPara004
     * @tc.desc: Abnormal parameters.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCreateFromPartsPara004', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_17100
     * @tc.name: testAddQueryValuePara003
     * @tc.desc: Abnormal parameters.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAddQueryValuePara003', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_17200
     * @tc.name: testAddEncodedSegmentPara002
     * @tc.desc: Abnormal parameters.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAddEncodedSegmentPara002', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_17300
     * @tc.name: testAddSegmentPara001
     * @tc.desc: Encoded URI specific scheme section
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAddSegmentPara002', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_17400
     * @tc.name: testGetQueryValuePara002
     * @tc.desc: Abnormal parameters.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetQueryValuePara002', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_17500
     * @tc.name: testGetQueryValuesPara002
     * @tc.desc:  Abnormal parameters.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetQueryValuesPara002', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_17600
     * @tc.name: testGetBooleanQueryValuePara003
     * @tc.desc: Abnormal parameters.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetBooleanQueryValuePara003', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_17700
     * @tc.name: testConstructorJson001
     * @tc.desc:  URI constructor json
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testConstructorJson001', 0, function () {
      let uriObj = new uri.URI("testUri://testHost/testNumPage?need=false&bbb=true&data={\"aaa\":0,\"bbb\":\"ccc\"}");
      expect(uriObj.query).assertEqual('need=false&bbb=true&data={"aaa":0,"bbb":"ccc"}');
      expect(JSON.parse(uriObj.getQueryValue('data')).aaa).assertEqual(0);
      expect(JSON.parse(uriObj.getQueryValue('data')).bbb).assertEqual('ccc');
    })
    // Check the Uri Special Characters.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_17800
     * @tc.name: testSpecialCharacters001
     * @tc.desc:  URI Special Characters
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testSpecialCharacters001', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_17900
     * @tc.name: testspecialPort001
     * @tc.desc:  URI Special Characters
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testspecialPort001', 0, function () {
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
     * @tc.desc:  URI Special Characters
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testspecialPort002', 0, function () {
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
     * @tc.desc:  URI Special Characters
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testspecialPort003', 0, function () {
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
     * @tc.desc:  URI Special Characters
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testspecialPort004', 0, function () {
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
     * @tc.desc:  URI Special Characters
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriConstruction032', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_18400
     * @tc.name: testUriConstruction033
     * @tc.desc:  URI Special Characters
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriConstruction033', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_18500
     * @tc.name: testUriConstruction034
     * @tc.desc:  URI Special Characters
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriConstruction034', 0, function () {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URI_18600
     * @tc.name: testUriAddEncodedSegment004
     * @tc.desc: Encode the path segment and add it to the URI path
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testUriAddEncodedSegment004', 0, function () {
        try {
          let route = new uri.URI('http://www.test.com/');
          let newRoute = route.addEncodedSegment("my`files");
        } catch (err) {
          expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string: The path does not conform to the rule");
          expect(err.code).assertEqual(10200002);
          expect(err.message).assertEqual("Syntax Error. Invalid Uri string: The path does not conform to the rule");
        }
    })
})
}