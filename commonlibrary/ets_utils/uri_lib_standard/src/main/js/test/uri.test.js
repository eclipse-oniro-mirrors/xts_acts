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
            expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string");
            expect(err.code).assertEqual(10200002)
            expect(err.message).assertEqual("Syntax Error. Invalid Uri string");
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
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${a} must be string`);
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${a} must be string`);
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
            expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string");
            expect(err.code).assertEqual(10200002)
            expect(err.message).assertEqual("Syntax Error. Invalid Uri string");
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
            expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string");
            expect(err.code).assertEqual(10200002)
            expect(err.message).assertEqual("Syntax Error. Invalid Uri string");
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
            expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string");
            expect(err.code).assertEqual(10200002)
            expect(err.message).assertEqual("Syntax Error. Invalid Uri string");
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
            expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string");
            expect(err.code).assertEqual(10200002)
            expect(err.message).assertEqual("Syntax Error. Invalid Uri string");
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
            expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string");
            expect(err.code).assertEqual(10200002)
            expect(err.message).assertEqual("Syntax Error. Invalid Uri string");
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
            expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string");
            expect(err.code).assertEqual(10200002)
            expect(err.message).assertEqual("Syntax Error. Invalid Uri string");
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
            expect(err.toString()).assertEqual("BusinessError: Syntax Error. Invalid Uri string");
            expect(err.code).assertEqual(10200002)
            expect(err.message).assertEqual("Syntax Error. Invalid Uri string");
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
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${gaogao1} must be URI`);
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${gaogao1} must be URI`);
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
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${gaogao1} must be URI`);
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${gaogao1} must be URI`);
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
})
}