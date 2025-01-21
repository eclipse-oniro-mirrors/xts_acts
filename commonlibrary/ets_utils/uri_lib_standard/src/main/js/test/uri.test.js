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

    /**
     * @tc.name: testUriConstruction001
     * @tc.desc: Constructs a URI by parsing the given string.
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

    /**
     * @tc.name: testUriConstruction002
     * @tc.desc: Constructs a URI by parsing the given string.
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

    /**
     * @tc.name: testUriConstruction003
     * @tc.desc: Constructs a URI by parsing the given string.
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

    /**
     * @tc.name: testUriConstruction004
     * @tc.desc: Constructs a URI by parsing the given string.
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

    /**
     * @tc.name: testUriConstruction005
     * @tc.desc: Constructs a URI by parsing the given string.
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

    /**
     * @tc.name: testUriConstruction006
     * @tc.desc: Constructs a URI by parsing the given string.
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

    /**
     * @tc.name: testUriConstruction007
     * @tc.desc: Constructs a URI by parsing the given string.
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

    /**
     * @tc.name: testUriConstruction008
     * @tc.desc: Constructs a URI by parsing the given string.
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

    /**
     * @tc.name: testUriConstruction009
     * @tc.desc: Constructs a URI by parsing the given string.
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

    /**
     * @tc.name: testUriConstruction010
     * @tc.desc: Constructs a URI by parsing the given string.
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

    /**
     * @tc.name: testUriConstruction011
     * @tc.desc: Constructs a URI by parsing the given string.
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

    /**
     * @tc.name: testUriConstruction012
     * @tc.desc: Constructs a URI by parsing the given string.
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

    /**
     * @tc.name: testUriConstruction013
     * @tc.desc: Constructs a URI by parsing the given string.
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

    /**
     * @tc.name: testUriConstruction014
     * @tc.desc: Constructs a URI by parsing the given string.
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

    /**
     * @tc.name: testUriConstruction015
     * @tc.desc: Constructs a URI by parsing the given string.
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

    /**
     * @tc.name: testUriConstruction016
     * @tc.desc: Constructs a URI by parsing the given string.
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

    /**
     * @tc.name: testUriConstruction017
     * @tc.desc: Constructs a URI by parsing the given string.
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

    /**
     * @tc.name: testUriConstruction018
     * @tc.desc: Constructs a URI by parsing the given string.
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

    /**
     * @tc.name: testUriConstruction019
     * @tc.desc: Constructs a URI by parsing the given string.
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

    /**
     * @tc.name: testUriConstruction020
     * @tc.desc: Constructs a URI by parsing the given string.
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

    /**
     * @tc.name: testUriConstruction021
     * @tc.desc: Constructs a URI by parsing the given string.
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

    /**
     * @tc.name: testUriConstruction022
     * @tc.desc: Constructs a URI by parsing the given string.
     */
    it('testUriConstruction022', 0, function () {
        let gaogao = new uri.URI('http://16.9.5.4:99/path/path?query#fagment');
        expect(gaogao.scheme).assertEqual("http");
        expect(gaogao.authority).assertEqual("16.9.5.4:99");
        expect(gaogao.ssp).assertEqual("//16.9.5.4:99/path/path?query");
        expect(gaogao.userInfo).assertEqual("null");
        expect(gaogao.host).assertEqual("16.9.5.4");
        expect(gaogao.port).assertEqual("99");
        expect(gaogao.path).assertEqual("/path/path");
        expect(gaogao.query).assertEqual("query");
        expect(gaogao.fragment).assertEqual("fagment");
    })

    /**
     * @tc.name: testUriConstruction023
     * @tc.desc: Constructs a URI by parsing the given string.
     */
    it('testUriConstruction023', 0, function () {
        let gaogao = new uri.URI('http://49.99.54.12:50/path/path23?query#fagment');
        expect(gaogao.scheme).assertEqual("http");
        expect(gaogao.authority).assertEqual("49.99.54.12:50");
        expect(gaogao.ssp).assertEqual("//49.99.54.12:50/path/path23?query");
        expect(gaogao.userInfo).assertEqual("null");
        expect(gaogao.host).assertEqual("49.99.54.12");
        expect(gaogao.port).assertEqual("50");
        expect(gaogao.path).assertEqual("/path/path23");
        expect(gaogao.query).assertEqual("query");
        expect(gaogao.fragment).assertEqual("fagment");
    })

    /**
     * @tc.name: testUriConstruction024
     * @tc.desc: Constructs a URI by parsing the given string.
     */
    it('testUriConstruction024', 0, function () {
        let gaogao = new uri.URI('http://user@49.10pe8.54.12:80/path/path23?query#qwer');
        expect(gaogao.scheme).assertEqual("http");
        expect(gaogao.authority).assertEqual("user@49.10pe8.54.12:80");
        expect(gaogao.ssp).assertEqual("//user@49.10pe8.54.12:80/path/path23?query");
        expect(gaogao.userInfo).assertEqual("null");
        expect(gaogao.host).assertEqual("null");
        expect(gaogao.port).assertEqual("-1");
        expect(gaogao.path).assertEqual("/path/path23");
        expect(gaogao.query).assertEqual("query");
        expect(gaogao.fragment).assertEqual("qwer");
    })

    /**
     * @tc.name: testUriConstruction025
     * @tc.desc: Constructs a URI by parsing the given string.
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

    /**
     * @tc.name: testUriConstruction026
     * @tc.desc: Constructs a URI by parsing the given string.
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

    /**
     * @tc.name: testUriConstruction027
     * @tc.desc: Constructs a URI by parsing the given string.
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

    /**
     * @tc.name: testUriConstruction028
     * @tc.desc: Constructs a URI by parsing the given string.
     */
    it('testUriConstruction028', 0, function () {
        let gaogao = new uri.URI('ht2tp://user@www.1hw.1com:77/path/path23?query#qwer');
        expect(gaogao.scheme).assertEqual("ht2tp");
        expect(gaogao.authority).assertEqual("user@www.1hw.1com:77");
        expect(gaogao.ssp).assertEqual("//user@www.1hw.1com:77/path/path23?query");
        expect(gaogao.userInfo).assertEqual("null");
        expect(gaogao.host).assertEqual("null");
        expect(gaogao.port).assertEqual("-1");
        expect(gaogao.path).assertEqual("/path/path23");
        expect(gaogao.query).assertEqual("query");
        expect(gaogao.fragment).assertEqual("qwer");
    })

    /**
     * @tc.name: testUriConstruction029
     * @tc.desc: Constructs a URI by parsing the given string.
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

    /**
     * @tc.name: testUriConstruction030
     * @tc.desc: Constructs a URI by parsing the given string.
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

    /**
     * @tc.name: testUriConstruction031
     * @tc.desc: Constructs a URI by parsing the given string.
     */
    it('testUriConstruction031', 0, function () {
        let gaogao = new uri.URI('http://[::192:0:5]/path/path23?query#qwer');
        expect(gaogao.scheme).assertEqual("http");
        expect(gaogao.authority).assertEqual("[::192:0:5]");
        expect(gaogao.ssp).assertEqual("//[::192:0:5]/path/path23?query");
        expect(gaogao.userInfo).assertEqual("null");
        expect(gaogao.host).assertEqual("[::192:0:5]");
        expect(gaogao.port).assertEqual("-1");
        expect(gaogao.path).assertEqual("/path/path23");
        expect(gaogao.query).assertEqual("query");
        expect(gaogao.fragment).assertEqual("qwer");
    })

    /**
     * @tc.name: testEquals001
     * @tc.desc: Tests this URI for equality with another object.
     */
    it('testEquals001', 0, function () {
        let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
        let gaogao1 = gaogao;
        let res = gaogao.equals(gaogao1);
        expect(res).assertEqual(true);
    })

    /**
     * @tc.name: testEquals002
     * @tc.desc: Tests this URI for equality with another object.
     */
    it('testEquals002', 0, function () {
        let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
        let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
        let res = gaogao.equals(gaogao1);
        expect(res).assertEqual(true);
    })

    /**
     * @tc.name: testEquals003
     * @tc.desc: Tests this URI for equality with another object.
     */
    it('testEquals003', 0, function () {
        let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
        let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment123');
        let res = gaogao.equals(gaogao1);
        expect(res).assertEqual(false);
    })

    /**
     * @tc.name: testEquals004
     * @tc.desc: Tests this URI for equality with another object.
     */
    it('testEquals004', 0, function () {
        let gaogao = new uri.URI('http://gg:gaogao@wwwaaa:99/path1?query#fagment');
        let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment123');
        let res = gaogao.equals(gaogao1);
        expect(res).assertEqual(false);
    })

    /**
     * @tc.name: testEquals005
     * @tc.desc: Tests this URI for equality with another object.
     */
    it('testEquals005', 0, function () {
        let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
        let gaogao1 = new uri.URI('http://[1:0:0:1:2:1:2:1]/path1?query#fagment123');
        let res = gaogao.equals(gaogao1);
        expect(res).assertEqual(false);
    })

    /**
    * @tc.name: testEqualsTo001
    * @tc.desc: Tests this URI for equality with another object.
    */
        it('testEqualsTo001', 0, function () {
        let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
        let gaogao1 = gaogao;
        let res = gaogao.equalsTo(gaogao1);
        expect(res).assertEqual(true);
    })

    /**
     * @tc.name: testEqualsTo002
     * @tc.desc: Tests this URI for equality with another object.
     */
    it('testEqualsTo002', 0, function () {
        let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
        let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
        let res = gaogao.equalsTo(gaogao1);
        expect(res).assertEqual(true);
    })

    /**
     * @tc.name: testEqualsTo003
     * @tc.desc: Tests this URI for equality with another object.
     */
    it('testEqualsTo003', 0, function () {
        let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
        let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment123');
        let res = gaogao.equalsTo(gaogao1);
        expect(res).assertEqual(false);
    })

    /**
     * @tc.name: testEqualsTo004
     * @tc.desc: Tests this URI for equality with another object.
     */
    it('testEqualsTo004', 0, function () {
        let gaogao = new uri.URI('http://gg:gaogao@wwwaaa:99/path1?query#fagment');
        let gaogao1 = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment123');
        let res = gaogao.equalsTo(gaogao1);
        expect(res).assertEqual(false);
    })

    /**
     * @tc.name: testEqualsTo005
     * @tc.desc: Tests this URI for equality with another object.
     */
    it('testEqualsTo005', 0, function () {
        let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path1?query#fagment');
        let gaogao1 = new uri.URI('http://[1:0:0:1:2:1:2:1]/path1?query#fagment123');
        let res = gaogao.equalsTo(gaogao1);
        expect(res).assertEqual(false);
    })
    
    /**
     * @tc.name: testEqualsTo006
     * @tc.desc: Tests for wrong input parameter type.
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

        
    /**
     * @tc.name: testEqualsTo007
     * @tc.desc: Tests for wrong input parameter type.
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

    /**
     * @tc.name: testNormalize001
     * @tc.desc: Normalizes this URI's path.
     */
    it('testNormalize001', 0, function () {
        let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path/66./../././mm/.././path1?query#fagment');
        let res = gaogao.normalize();
        expect(res.path).assertEqual("/path/path1");
        expect(res.toString()).assertEqual("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path/path1?query#fagment");
    })

    /**
     * @tc.name: testNormalize002
     * @tc.desc: Normalizes this URI's path.
     */
    it('testNormalize002', 0, function () {
        let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../path?query#fagment');
        let res = gaogao.normalize();
        expect(res.path).assertEqual("/../../path");
        expect(res.toString()).assertEqual("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../path?query#fagment");
    })

    /**
     * @tc.name: testNormalize003
     * @tc.desc: Normalizes this URI's path.
     */
    it('testNormalize003', 0, function () {
        let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../path/.././../aa/bb/cc?query#fagment');
        let res = gaogao.normalize();
        expect(res.path).assertEqual("/../../../aa/bb/cc");
        expect(res.toString()).assertEqual("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../../aa/bb/cc?query#fagment");
    })

    /**
     * @tc.name: testNormalize004
     * @tc.desc: Normalizes this URI's path.
     */
    it('testNormalize004', 0, function () {
        let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../path/.././../aa/bb/cc?query');
        let res = gaogao.normalize();
        expect(res.path).assertEqual("/../../aa/bb/cc");
        expect(res.toString()).assertEqual("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../aa/bb/cc?query");
    })

    /**
     * @tc.name: testNormalize005
     * @tc.desc: Normalizes this URI's path.
     */
    it('testNormalize005', 0, function () {
        let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/./path/./aa/bb/cc?query#fagment');
        let res = gaogao.normalize();
        expect(res.path).assertEqual("/path/aa/bb/cc");
        expect(res.toString()).assertEqual("http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/path/aa/bb/cc?query#fagment");
    })

    /**
     * @tc.name: testToString001
     * @tc.desc: Returns the content of this URI as a US-ASCII string.
     */
    it('testToString001', 0, function () {
        let gaogao = new uri.URI('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../path/.././../aa/bb/cc?query#fagment');
        let res = gaogao.toString();
        expect(res).assertEqual('http://gg:gaogao@[1:0:0:1:2:1:2:1]:99/../../path/.././../aa/bb/cc?query#fagment');
    })

    /**
     * @tc.name: testToString002
     * @tc.desc: Returns the content of this URI as a US-ASCII string.
     */
    it('testToString002', 0, function () {
        let gaogao = new uri.URI('htt1p://gg:gaogao@[::192.9.5.5]:99/path/66path1?query#fagment');
        let res = gaogao.toString();
        expect(res).assertEqual('htt1p://gg:gaogao@[::192.9.5.5]:99/path/66path1?query#fagment');
    })

    /**
     * @tc.name: testToString003
     * @tc.desc: Returns the content of this URI as a US-ASCII string.
     */
    it('testToString003', 0, function () {
        let gaogao = new uri.URI('ftp://username:password@www.baidu.com:88/path?query#fagment');
        let res = gaogao.toString();
        expect(res).assertEqual('ftp://username:password@www.baidu.com:88/path?query#fagment');
    })

    /**
     * @tc.name: testToString004
     * @tc.desc: Returns the content of this URI as a US-ASCII string.
     */
    it('testToString004', 0, function () {
        let gaogao = new uri.URI('http://gg:gao你好gao@199.98.55.44:99/path/p你好ath?qu你好ery#fag你好ment');
        let res = gaogao.toString();
        expect(res).assertEqual('http://gg:gao%E4%BD%A0%E5%A5%BDgao@199.98.55.44:99/path/' +
        'p%E4%BD%A0%E5%A5%BDath?qu%E4%BD%A0%E5%A5%BDery#fag%E4%BD%A0%E5%A5%BDment');
    })

    /**
     * @tc.name: testToString005
     * @tc.desc: Returns the content of this URI as a US-ASCII string.
     */
    it('testToString005', 0, function () {
        let gaogao = new uri.URI('http://gg:gaogao@199.98.55.44:99/path/path?query#fagment');
        let res = gaogao.toString();
        expect(res).assertEqual('http://gg:gaogao@199.98.55.44:99/path/path?query#fagment');
    })

    /**
     * @tc.name: testCheckIsAbsolute001
     * @tc.desc: Tells whether or not this URI is absolute.
     */
    it('testCheckIsAbsolute001', 0, function () {
        let gaogao = new uri.URI('f/tp://username:password@www.baidu.com:88/path?query#fagment');
        let res = gaogao.checkIsAbsolute();
        expect(res).assertEqual(false);
    })

    /**
     * @tc.name: testCheckIsAbsolute002
     * @tc.desc: Tells whether or not this URI is absolute.
     */
    it('testCheckIsAbsolute002', 0, function () {
        let gaogao = new uri.URI('ftp://username:password@www.baidu.com:88/path?query#fagment');
        let res = gaogao.checkIsAbsolute();
        expect(res).assertEqual(true);
    })

    /**
     * @tc.name: testCheckIsAbsolute003
     * @tc.desc: Tells whether or not this URI is absolute.
     */
    it('testCheckIsAbsolute003', 0, function () {
        let gaogao = new uri.URI('htt/p://username:password@www.baidu.com:88/path?query#fagment');
        let res = gaogao.checkIsAbsolute();
        expect(res).assertEqual(false);
    })

    /**
     * @tc.name: testCheckIsAbsolute004
     * @tc.desc: Tells whether or not this URI is absolute.
     */
    it('testCheckIsAbsolute004', 0, function () {
        let gaogao = new uri.URI('https://username:password@www.baidu.com:88/path?query#fagment');
        let res = gaogao.checkIsAbsolute();
        expect(res).assertEqual(true);
    })

    /**
     * @tc.name: testCheckIsAbsolute005
     * @tc.desc: Tells whether or not this URI is absolute.
     */
    it('testCheckIsAbsolute005', 0, function () {
        let gaogao = new uri.URI('http1://username:password@www.baidu.com:88/path?query#fagment');
        let res = gaogao.checkIsAbsolute();
        expect(res).assertEqual(true);
    })
})
}