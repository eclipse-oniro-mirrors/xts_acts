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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
import  Url from '@ohos.url'
export default function UrlFunTest() {
describe('UrlFunTest', function () {
    
    /**
     * @tc.name   testParamsAppend001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_00100
     * @tc.desc   Appends a specified key/value pair as a new search parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsAppend001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var that = new Url.URL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        var params = new Url.URLParams(that.search);
        params.append('ma','jk')
        var result = params.toString()
        expect(result).assertEqual('foo=1&bar=2&ma=jk')
    })

    /**
     * @tc.name   testParamsAppend002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_00200
     * @tc.desc   Appends a specified key/value pair as a new search parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsAppend002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        var that = new Url.URL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        var params = new Url.URLParams(that.search);
        params.append("ma 大","jk￥")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&ma+%E5%A4%A7=jk%EF%BF%A5")
    })

    /**
     * @tc.name   testParamsAppend003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_00300
     * @tc.desc   Appends a specified key/value pair as a new search parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsAppend003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        var that = new Url.URL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        var params = new Url.URLParams(that.search);
        params.append("foo~!@#$%^&*()_+-=","jk")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&foo%7E%21%40%23%24%25%5E%26*%28%29_%2B-%3D=jk")
    })

    /**
     * @tc.name   testParamsAppend004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_00400
     * @tc.desc   Appends a specified key/value pair as a new search parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsAppend004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLParams(that.search)
        params.append("app","par")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&app=par")
    })

    /**
     * @tc.name   testParamsAppend005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_00500
     * @tc.desc   Appends a specified key/value pair as a new search parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsAppend005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLParams(that.search)
        params.append("123","456")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&123=456")
    })

    /**
     * @tc.name   testParamsAppend006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_00600
     * @tc.desc   Appends throw BusinessError: Parameter error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsAppend006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        try {
            let that = new Url.URL('https://example.com?foo=1&bar=2')
            let params = new Url.URLParams(that.search)
            params.append(123,"456")
            expect(0).assertEqual(1)
        } catch (err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error. The type of 123 must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual("Parameter error. The type of 123 must be string");
        }
    })

    /**
     * @tc.name   testParamsAppend007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_00700
     * @tc.desc   Appends throw BusinessError: Parameter error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsAppend007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        try {
            let that = new Url.URL('https://example.com?foo=1&bar=2')
            let params = new Url.URLParams(that.search)
            var a = '123'
            var b = undefined;
            params.append(a, b)
            expect(0).assertEqual(1)
        } catch (err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error. The type of ${b} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error. The type of ${b} must be string`);
        }
    })

    /**
     * @tc.name   testParamsDelete001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_00800
     * @tc.desc   Deletes the given search parameter and its associated value,from the list of all search parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsDelete001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLParams(that.search)
        params.delete("foo")
        var result = params.toString()
        expect(result).assertEqual("bar=2")
    })

    /**
     * @tc.name   testParamsDelete002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_00900
     * @tc.desc   Deletes the given search parameter and its associated value,from the list of all search parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsDelete002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let that = new Url.URL('https://example.com?foo大=1&bar=2');
        let params = new Url.URLParams(that.search);
        params.delete('foo');
        var result = params.toString();
        expect(result).assertEqual("foo%E5%A4%A7=1&bar=2");
    })

    /**
     * @tc.name   testParamsDelete003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_01000
     * @tc.desc   Deletes the given search parameter and its associated value,from the list of all search parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsDelete003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let that = new Url.URL('https://example.com?foo大=1&bar=2');
        let params = new Url.URLParams(that.search);
        params.delete("foo大");
        var result = params.toString();
        expect(result).assertEqual("bar=2")
    })

    /**
     * @tc.name   testParamsDelete004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_01100
     * @tc.desc   Deletes the given search parameter and its associated value,from the list of all search parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsDelete004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2');
        let params = new Url.URLParams(that.search);
        params.delete('bar');
        var result = params.toString();
        expect(result).assertEqual("foo=1");
    })

    /**
     * @tc.name   testParamsDelete005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_01200
     * @tc.desc   Deletes the given search parameter and its associated value,from the list of all search parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsDelete005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2');
        let params = new Url.URLParams(that.search);
        params.delete("faa");
        var result = params.toString();
        expect(result).assertEqual("foo=1&bar=2")
    })

    /**
     * @tc.name   testParamsDelete006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_01300
     * @tc.desc   Deletes throw BusinessError: Parameter error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsDelete006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        try {
            let that = new Url.URL('https://example.com?foo=1&bar=2');
            let params = new Url.URLParams(that.search);
            params.delete();
            expect(0).assertEqual(1)
        } catch (err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error. The type of ${arguments[0]} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error. The type of ${arguments[0]} must be string`);
        }
    })

    /**
     * @tc.name   testParamsDelete007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_01400
     * @tc.desc   Deletes throw BusinessError: Parameter error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsDelete007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        try {
            let that = new Url.URL('https://example.com?foo=1&bar=2');
            let params = new Url.URLParams(that.search);
            params.delete(4);
            expect(0).assertEqual(1)
        } catch (err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error. The type of 4 must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error. The type of 4 must be string`);
        }
    })

    /**
     * @tc.name   testNewURLParams001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_01500
     * @tc.desc   The input parameter for New URLParams is undefined or null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewURLParams001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams(undefined);
        let result = params.toString();
        expect(result).assertEqual('');
        let params1 = new Url.URLParams(null);
        let result1 = params1.toString();
        expect(result1).assertEqual('');
    })
    
    /**
     * @tc.name   testParamsEntries001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_01600
     * @tc.desc   Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsEntries001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2");

        var i=0;
        var arr={};
        for(var pair of params.entries()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[1]).assertEqual("value1");
    })

    /**
     * @tc.name   testParamsEntries002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_01700
     * @tc.desc   Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsEntries002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        var i=0;
        var arr={};
        for(var pair of params.entries()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[2]).assertEqual("key2")
    })

    /**
     * @tc.name   testParamsEntries003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_01800
     * @tc.desc   Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsEntries003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        params.append("foo","jk")
        var i=0;
        var arr={};
        for(var pair of params.entries()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[5]).assertEqual("jk")
    })

    /**
     * @tc.name   testParamsEntries004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_01900
     * @tc.desc   Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsEntries004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        var i=0;
        var arr={};
        for(var pair of params.entries()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[3]).assertEqual("value2")
    })

    /**
     * @tc.name   testParamsEntries005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_02000
     * @tc.desc   Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsEntries005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        params.append("jss","txt")
        var i=0;
        var arr={};
        for(var pair of params.entries()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[4]).assertEqual("jss")
    })

    /**
     * @tc.name   testParams[Symbol.iterator]001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_02100
     * @tc.desc   Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParams[Symbol.iterator]001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2");
        var i=0;
        var arr={};
        for(var pair of params[Symbol.iterator]()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[1]).assertEqual("value1");
    })

    /**
     * @tc.name   testParams[Symbol.iterator]002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_02200
     * @tc.desc   Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParams[Symbol.iterator]002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        var i=0;
        var arr={};
        for(var pair of params[Symbol.iterator]()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[2]).assertEqual("key2")
    })

    /**
     * @tc.name   testParams[Symbol.iterator]003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_02300
     * @tc.desc   Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParams[Symbol.iterator]003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        params.append("foo","jk")
        var i=0;
        var arr={};
        for(var pair of params[Symbol.iterator]()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[5]).assertEqual("jk")
    })

    /**
     * @tc.name   testParams[Symbol.iterator]004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_02400
     * @tc.desc   Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParams[Symbol.iterator]004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        var i=0;
        var arr={};
        for(var pair of params[Symbol.iterator]()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[3]).assertEqual("value2")
    })

    /**
     * @tc.name   testParams[Symbol.iterator]005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_02500
     * @tc.desc   Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParams[Symbol.iterator]005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        params.append("jss","txt")
        var i=0;
        var arr={};
        for(var pair of params[Symbol.iterator]()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[4]).assertEqual("jss")
    })

    /**
     * @tc.name   testParamsForEach001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_02600
     * @tc.desc   Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsForEach001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        var arr={};
        var i = 0;
        function func(value, key, SearchParams)
        {
            arr[i] = value + " " + key + " " + (params === SearchParams)
            i++
        }
        params.forEach(func);
        expect(arr[0]).assertEqual("value1 key1 true");
    })

    /**
     * @tc.name   testParamsForEach002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_02700
     * @tc.desc   Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsForEach002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2");
        var arr={};
        var i = 0;
        function func(value, key, SearchParams)
        {
            arr[i] = value + " " + key + " " + (params === SearchParams)
            i++
        }
        params.forEach(func);
        expect(arr[1]).assertEqual("value2 key2 true");
    })

    /**
     * @tc.name   testParamsForEach003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_02800
     * @tc.desc   Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsForEach003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2");
        params.append("foo","jk");
        var arr={};
        var i = 0;
        function func(value, key, SearchParams)
        {
            arr[i] = value + " " + key + " " + (params === SearchParams)
            i++
        }
        params.forEach(func);
        expect(arr[2]).assertEqual("jk foo true");
    })

    /**
     * @tc.name   testParamsForEach004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_02900
     * @tc.desc   Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsForEach004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("foo=bar&jss=txt");
        var arr={};
        var i = 0;
        function func(value, key, SearchParams)
        {
            arr[i] = value + " " + key + " " + (params === SearchParams)
            i++
        }
        params.forEach(func);
        expect(arr[1]).assertEqual("txt jss true");
    })

    /**
     * @tc.name   testParamsForEach005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_03000
     * @tc.desc   Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsForEach005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("foo=bar&jss=txt");
        params.append("foo","jk");
        var arr={};
        var i = 0;
        function func(value, key, SearchParams)
        {
            arr[i] = value + " " + key + " " + (params === SearchParams)
            i++
        }
        params.forEach(func);
        expect(arr[0]).assertEqual("bar foo true");
    })

    /**
     * @tc.name   testParamsForEach006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_03100
     * @tc.desc   forEach throw BusinessError: Parameter error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsForEach006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        try {
            let params = new Url.URLParams("foo=bar&jss=txt");
            var arr={};
            var i = 0;
            var func = [0, 2, 4, 6, 8];
            params.forEach(func);
            expect(0).assertEqual(1)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error. The type of ${func} must be function`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error. The type of ${func} must be function`);
        }
    })

    /**
     * @tc.name   testParamsForEach007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_03200
     * @tc.desc   Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsForEach007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        var arr = {};
        var i = 0;
        function func(value, key, SearchParams)
        {
            arr[i] = value + " " + key + " " + (params === SearchParams)
            i++
        }
        params.forEach(func, undefined);
        expect(arr[0]).assertEqual("value1 key1 true");
        arr = {};
        i = 0;
        params.forEach(func, null);
        expect(arr[0]).assertEqual("value1 key1 true");
    })

    /**
     * @tc.name   testParamsGet001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_03300
     * @tc.desc   Returns the first value associated to the given search parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsGet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        var result =  params.get("1")
        expect(result).assertEqual(undefined)
    })

    /**
     * @tc.name   testParamsGet002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_03400
     * @tc.desc   Returns the first value associated to the given search parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsGet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        var result =  params.get("key2")
        expect(result).assertEqual("value2")
    })

    /**
     * @tc.name   testParamsGet003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_03500
     * @tc.desc   Returns the first value associated to the given search parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsGet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        params.append("5","JKL")
        var result =  params.get("5")
        expect(result).assertEqual("JKL")
    })

    /**
     * @tc.name   testParamsGet004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_03600
     * @tc.desc   Returns the first value associated to the given search parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsGet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        var result =  params.get("key1")
        expect(result).assertEqual("value1")
    })

    /**
     * @tc.name   testParamsGet005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_03700
     * @tc.desc   Returns the first value associated to the given search parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsGet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        params.append("jss","JL")
        var result =  params.get("jss")
        expect(result).assertEqual("JL")
    })

    /**
     * @tc.name   testParamsGet006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_03800
     * @tc.desc   get throw BusinessError: Parameter error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsGet006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        try{
            let params = new Url.URLParams("key1=value1&key2=value2")
            params.append("jss","JL")
            var a = 666;
            var result =  params.get(a)
            expect(0).assertEqual(1)
        }catch(err){
            expect(err.toString()).assertEqual(`BusinessError: Parameter error. The type of ${a} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error. The type of ${a} must be string`);
        }
    })

    /**
     * @tc.name   testParamsGetAll001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_03900
     * @tc.desc   Returns all key-value pairs associated with a given search parameter as an array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsGetAll001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        params.append("key1","AAA")
        var result =  params.getAll("key1")
        expect(result.toString()).assertEqual("value1,AAA")
    })

    /**
     * @tc.name   testParamsGetAll002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_04000
     * @tc.desc   Returns all key-value pairs associated with a given search parameter as an array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsGetAll002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("key1=value1&8=DEF")
        params.append("8","A8A")
        var result =  params.getAll("8")
        expect(result.toString()).assertEqual("DEF,A8A")
    })

    /**
     * @tc.name   testParamsGetAll003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_04100
     * @tc.desc   Returns all key-value pairs associated with a given search parameter as an array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsGetAll003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2&key3=da")
        params.append("key3","A3A")
        var result =  params.getAll("key3")
        expect(result.toString()).assertEqual("da,A3A")
    })

    /**
     * @tc.name   testParamsGetAll004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_04200
     * @tc.desc   Returns all key-value pairs associated with a given search parameter as an array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsGetAll004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2&key3=大")
        params.append("key3","A3A")
        var result =  params.getAll("key4")
        expect(result.toString()).assertEqual('')
    })

    /**
     * @tc.name   testParamsGetAll005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_04300
     * @tc.desc   Returns all key-value pairs associated with a given search parameter as an array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsGetAll005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2&key3=大")
        params.append("key3","A3A")
        var result =  params.getAll("key2")
        expect(result.toString()).assertEqual("value2")
    })

    /**
     * @tc.name   testParamsGetAll006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_04400
     * @tc.desc   getAll throw BusinessError: Parameter error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsGetAll006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        try {
            let params = new Url.URLParams("key1=value1&key2=value2&key3=大")
            params.append("key3","A3A")
            var b = 666;
            var result =  params.getAll(b)
            expect(0).assertEqual(1)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error. The type of ${b} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error. The type of ${b} must be string`);
        }
    })

    /**
     * @tc.name   testParamsHas001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_04500
     * @tc.desc   Returns a Boolean that indicates whether a parameter with the specified name exists.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsHas001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2&key3=大")
        var result =  params.has("2")
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name   testParamsHas002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_04600
     * @tc.desc   Returns a Boolean that indicates whether a parameter with the specified name exists.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsHas002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("小=value1&key2=value2&key3=大")
        var result =  params.has("小")
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name   testParamsHas003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_04700
     * @tc.desc   Returns a Boolean that indicates whether a parameter with the specified name exists.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsHas003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("小=value1&￥=value2&key3=大")
        params.append("￥","ACA")
        var result =  params.has("￥")
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name   testParamsHas004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_04800
     * @tc.desc   Returns a Boolean that indicates whether a parameter with the specified name exists.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsHas004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("小=value1&key2=value2&key3=大")
        var result =  params.has("无")
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name   testParamsHas005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_04900
     * @tc.desc   Returns a Boolean that indicates whether a parameter with the specified name exists.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsHas005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("小=value1&￥=value2&key3=大")
        params.append("￥","ACA")
        var result =  params.has("￥11")
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name   testParamsHas006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_05000
     * @tc.desc   Returns a Boolean that indicates whether a parameter with the specified name exists.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsHas006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("小=value1&￥=value2&key3=大")
        try {
            var a = 1;
            params.has(a);
        } catch(e) {
            expect(e.toString()).assertEqual(`BusinessError: Parameter error. The type of ${a} must be string`);
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual(`Parameter error. The type of ${a} must be string`);
        }
    })

    /**
     * @tc.name   testParamsKeys001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_05100
     * @tc.desc   Returns an iterator allowing to go through all keys contained in this object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParamsKeys001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let params = new Url.URLParams("小=value1&￥=value2&key3=大");
        var arr={};
        var i = 0;
        for(var key of params.keys()) {
            arr[i] = key
            i++
        }
        expect(arr[0]).assertEqual("小");
    })

    /**
     * @tc.name   testParamsKeys002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_05200
     * @tc.desc   Returns an iterator allowing to go through all keys contained in this object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsKeys002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams("小=value1&￥=value2&key3=大");
        var arr={};
        var i = 0;
        for(var key of params.keys()) {
            arr[i] = key
            i++
        }
        expect(arr[1]).assertEqual("￥");
    })

    /**
     * @tc.name   testParamsKeys003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_05300
     * @tc.desc   Returns an iterator allowing to go through all keys contained in this object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsKeys003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams("小=value1&￥=value2&key3=大");
        var arr={};
        var i = 0;
        for(var key of params.keys()) {
            arr[i] = key
            i++
        }
        expect(arr[2]).assertEqual("key3");
    })

    /**
     * @tc.name   testParamsKeys004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_05400
     * @tc.desc   Returns an iterator allowing to go through all keys contained in this object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsKeys004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams("小=value1&￥=value2&key3=大&key4=六");
        var arr={};
        var i = 0;
        for(var key of params.keys()) {
            arr[i] = key
            i++
        }
        expect(arr[3]).assertEqual("key4");
    })

    /**
     * @tc.name   testParamsKeys005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_05500
     * @tc.desc   Returns an iterator allowing to go through all keys contained in this object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsKeys005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams("小=value1&￥=value2&key3=大&key4=六&key5=发");
        var arr={};
        var i = 0;
        for(var key of params.keys()) {
            arr[i] = key
            i++
        }
        expect(arr[4]).assertEqual("key5");
    })

    /**
     * @tc.name   testParamsSet001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_05600
     * @tc.desc   Sets the value associated with a given search parameter to the given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams("1=value1&2=value2&key3=3");
        // params.append("11","ACA");
        params.set("11","CCC");
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&11=CCC");
    })

    /**
     * @tc.name   testParamsSet002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_05700
     * @tc.desc   Sets the value associated with a given search parameter to the given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsSet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams("1=value1&2=value2&key3=3");
        params.set('10','BBB');
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&10=BBB");
    })

    /**
     * @tc.name   testParamsSet003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_05800
     * @tc.desc   Sets the value associated with a given search parameter to the given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsSet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams("1=value1&2=value2&key3=3");
        params.set("ma 大" ,"10￥");
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&ma+%E5%A4%A7=10%EF%BF%A5");
    })

    /**
     * @tc.name   testParamsSet004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_05900
     * @tc.desc   Sets the value associated with a given search parameter to the given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsSet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams("1=value1&2=value2&key3=3");
        // params.append("1","ACA");
        params.set("1","CCC");
        var res = params.toString();
        expect(res).assertEqual("1=CCC&2=value2&key3=3");
    })

    /**
     * @tc.name   testParamsSet005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_06000
     * @tc.desc   Sets the value associated with a given search parameter to the given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsSet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams("1=value1&2=value2&key3=3");
        params.set('12','BBB');
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&12=BBB");
    })

    /**
     * @tc.name   testParamsSet006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_06100
     * @tc.desc   Sets the value associated with a given search parameter to the given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsSet006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams();
        params.set('12','BBB');
        var res = params.toString();
        expect(res).assertEqual("12=BBB");
    })

    /**
     * @tc.name   testParamsSet007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_06200
     * @tc.desc   Sets the value associated with a given search parameter to the given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsSet007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try {
            let params = new Url.URLParams("1=value1&2=value2&key3=3");
            var a = 12;
            params.set(a,'BBB');
            var res = params.toString();
            expect(0).assertEqual(1);
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error. The type of ${a} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error. The type of ${a} must be string`);
        }
    })

    /**
     * @tc.name   testParamsSet007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_06300
     * @tc.desc   Sets the value associated with a given search parameter to the given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsSet007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try {
            let params = new Url.URLParams("1=value1&2=value2&key3=3");
            var b = undefined;
            params.set('12', b);
            var res = params.toString();
            expect(0).assertEqual(1);
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error. The type of ${b} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error. The type of ${b} must be string`);
        }
    })

    /**
     * @tc.name   testParamsSort001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_06400
     * @tc.desc   Sort all key/value pairs contained in this object in place and return undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsSort001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams("1=value1&3=value3&2=key2");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=key2&3=value3");
    })

    /**
     * @tc.name   testParamsSort002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_06500
     * @tc.desc   Sort all key/value pairs contained in this object in place and return undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsSort002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams("a=value1&c=value2&b=key2");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("a=value1&b=key2&c=value2");
    })

    /**
     * @tc.name   testParamsSort003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_06600
     * @tc.desc   Sort all key/value pairs contained in this object in place and return undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsSort003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams("d=value1&c=value2&b=33");
        params.append("a","ACA");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("a=ACA&b=33&c=value2&d=value1");
    })

    /**
     * @tc.name   testParamsSort004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_06700
     * @tc.desc   Sort all key/value pairs contained in this object in place and return undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsSort004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams("1=value1&3=value3&2=key2&4=key4");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=key2&3=value3&4=key4");
    })

    /**
     * @tc.name   testParamsSort005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_06800
     * @tc.desc   Sort all key/value pairs contained in this object in place and return undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsSort005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams("a=value1&c=value2&4=key4&b=key2");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("4=key4&a=value1&b=key2&c=value2");
    })

    /**
     * @tc.name   testParamsValues001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_06900
     * @tc.desc   Returns an iterator allowing to go through all values contained in this object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsValues001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams("d=value1&c=value2&b=大")
        var arr={}
        var i = 0
        for(var value  of params.values()) {
            arr[i] = value
            i++
        }
        expect(arr[0]).assertEqual("value1")
    })

    /**
     * @tc.name   testParamsValues002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_07000
     * @tc.desc   Returns an iterator allowing to go through all values contained in this object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsValues002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams("d=value1&c=value2&b=大")
        var arr={}
        var i = 0
        for(var value  of params.values()) {
            arr[i] = value
            i++
        }
        expect(arr[1]).assertEqual("value2")
    })

    /**
     * @tc.name   testParamsValues003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_07100
     * @tc.desc   Returns an iterator allowing to go through all values contained in this object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsValues003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams("d=value1&c=value2&b=大")
        params.append("a","ACA")
        var arr={}
        var i = 0
        for(var value  of params.values()) {
            arr[i] = value
            i++
        }
        expect(arr[3]).assertEqual("ACA")
    })

    /**
     * @tc.name   testParamsValues004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_07200
     * @tc.desc   Returns an iterator allowing to go through all values contained in this object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsValues004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams("d=value1&c=value2&b=大&4=key4")
        var arr={}
        var i = 0
        for(var value  of params.values()) {
            arr[i] = value
            i++
        }
        expect(arr[3]).assertEqual("key4")
    })

    /**
     * @tc.name   testParamsValues005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_07300
     * @tc.desc   Returns an iterator allowing to go through all values contained in this object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsValues005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams("d=value1&c=value2&b=大&4=key4&5=key5")
        var arr={}
        var i = 0
        for(var value  of params.values()) {
            arr[i] = value
            i++
        }
        expect(arr[4]).assertEqual("key5")
    })

    /**
     * @tc.name   testParamsToString001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_07400
     * @tc.desc   Returns a query string suitable for use in a URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams("d=value1&c=value2&b=大")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=%E5%A4%A7")
    })

    /**
     * @tc.name   testParamsToString002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_07500
     * @tc.desc   Returns a query string suitable for use in a URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams("d=value1&c=value2&b= 大")
        params.append("1 12","QQQ")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=+%E5%A4%A7&1+12=QQQ")
    })

    /**
     * @tc.name   testParamsToString003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_07600
     * @tc.desc   Returns a query string suitable for use in a URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams("￥=)")
        params.delete("5")
        var result= params.toString()
        expect(result).assertEqual("%EF%BF%A5=%29")
    })

    /**
     * @tc.name   testParamsToString004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_07700
     * @tc.desc   Returns a query string suitable for use in a URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams("d=value1&c=value2&b=大&4=key4")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=%E5%A4%A7&4=key4")
    })

    /**
     * @tc.name   testParamsToString005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_07800
     * @tc.desc   Returns a query string suitable for use in a URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams("d=value1&c=value2&b= 大&4=key4&5=key5")
        params.append("1 12","QQQ")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=+%E5%A4%A7&4=key4&5=key5&1+12=QQQ")
    })

    /**
     * @tc.name   testParamsConstruction001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_07900
     * @tc.desc   A parameterized constructor used to create an URLSearchParams instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsConstruction001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams('?user=abc&query=xyz')
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=xyz")
    })

    /**
     * @tc.name   testParamsConstruction002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_08000
     * @tc.desc   A parameterized constructor used to create an URLSearchParams instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsConstruction002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams({
            user: 'abc',
            query: ['first', 'second']
        });
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=first%2Csecond")
    })

    /**
     * @tc.name   testParamsConstruction003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_08100
     * @tc.desc   A parameterized constructor used to create an URLSearchParams instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsConstruction003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams([
                ['user', 'abc'],
                ['query', 'first'],
                ['query', 'second'],
        ]);
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=first&query=second")
    })

    /**
     * @tc.name   testParamsConstruction004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_08200
     * @tc.desc   A parameterized constructor used to create an URLSearchParams instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsConstruction004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const map = new Map();
        map.set('user', 'abc');
        map.set('query', 'xyz');
        let params = new Url.URLParams(map)
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=xyz")
    })

    /**
     * @tc.name   testParamsConstruction005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_08300
     * @tc.desc   A parameterized constructor used to create an URLSearchParams instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsConstruction005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        function* getQueryPairs() {
            yield ['user', 'abc'];
            yield ['query', 'first'];
            yield ['query', 'second'];
        }
        let params = new Url.URLParams(getQueryPairs());
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=first&query=second")
    })

    /**
     * @tc.name   testParamsConstruction006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_08400
     * @tc.desc   A parameterized constructor used to create an URLSearchParams instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsConstruction006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams()
        params.append('abcde','fghki')
        var paramsResult = params.toString()
        expect(paramsResult).assertEqual('abcde=fghki')
    })

    /**
     * @tc.name   testParamsConstruction007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_08500
     * @tc.desc   A parameterized constructor used to create an URLSearchParams instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsConstruction007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let param
        let params = new Url.URLParams(param)
        params.append('abcde','fghki')
        var paramsResult = params.toString()
        expect(paramsResult).assertEqual('abcde=fghki')
    })

    /**
     * @tc.name   testParamsConstruction008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_08600
     * @tc.desc   The type of init must be string two-dimensional array or object list throw error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsConstruction008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try {
            var param = 123456789;
            let params = new Url.URLParams(param)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error. The type of ${param} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error. The type of ${param} must be string`);
        }
    })

    /**
     * @tc.name   testParamsConstruction009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_08700
     * @tc.desc   The type of init must be string two-dimensional array or object list throw error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsConstruction009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try {
            var param = [
                ['user', 'abc', 'error'],
              ];
            let params = new Url.URLParams(param);
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error. The type of ${param} must be string[][]`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error. The type of ${param} must be string[][]`);
        }
    })

    /**
     * @tc.name   testNewURLSearchParams001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_08800
     * @tc.desc   The input parameter for New URLSearchParams is undefined or null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNewURLSearchParams001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams(undefined);
        let result = params.toString()
        expect(result).assertEqual('')
        let params1 = new Url.URLSearchParams(null);
        let result2 = params1.toString()
        expect(result2).assertEqual('')
    })

    /**
     * @tc.name   testUrlAppend001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_08900
     * @tc.desc   Appends a specified key/value pair as a new search parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlAppend001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var that = new Url.URL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        var params = new Url.URLSearchParams(that.search);
        params.append('ma','jk')
        var result = params.toString()
        expect(result).assertEqual('foo=1&bar=2&ma=jk')
    })

    /**
     * @tc.name   testUrlAppend002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_09000
     * @tc.desc   Appends a specified key/value pair as a new search parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlAppend002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLSearchParams(that.search)
        params.append("ma 大","jk￥")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&ma+%E5%A4%A7=jk%EF%BF%A5")
    })

    /**
     * @tc.name   testUrlAppend003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_09100
     * @tc.desc   Appends a specified key/value pair as a new search parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlAppend003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLSearchParams(that.search)
        params.append("foo~!@#$%^&*()_+-=","jk")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&foo%7E%21%40%23%24%25%5E%26*%28%29_%2B-%3D=jk")
    })

    /**
     * @tc.name   testUrlAppend004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_09200
     * @tc.desc   Appends a specified key/value pair as a new search parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlAppend004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLSearchParams(that.search)
        params.append("app","par")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&app=par")
    })

    /**
     * @tc.name   testUrlAppend005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_09300
     * @tc.desc   Appends a specified key/value pair as a new search parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlAppend005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLSearchParams(that.search)
        params.append("123","456")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&123=456")
    })

    /**
     * @tc.name   testUrlAppend006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_09400
     * @tc.desc   Appends a specified key/value pair as a new search parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlAppend006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLSearchParams(that.search)
        try {
            var a = 1;
            params.append(a, "123")
        } catch(e) {
            expect(e.toString()).assertEqual(`BusinessError: Parameter error. The type of ${a} must be string`);
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual(`Parameter error. The type of ${a} must be string`);
        }
    })

    /**
     * @tc.name   testUrlDelete001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_09500
     * @tc.desc   Deletes the given search parameter and its associated value,from the list of all search parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlDelete001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLSearchParams(that.search)
        params.delete("foo")
        var result = params.toString()
        expect(result).assertEqual("bar=2")
    })

    /**
     * @tc.name   testUrlDelete002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_09600
     * @tc.desc   Deletes the given search parameter and its associated value,from the list of all search parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlDelete002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let that = new Url.URL('https://example.com?foo大=1&bar=2');
        let params = new Url.URLSearchParams(that.search);
        params.delete('foo');
        var result = params.toString();
        expect(result).assertEqual("foo%E5%A4%A7=1&bar=2");
    })

    /**
     * @tc.name   testUrlDelete003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_09700
     * @tc.desc   Deletes the given search parameter and its associated value,from the list of all search parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlDelete003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let that = new Url.URL('https://example.com?foo大=1&bar=2');
        let params = new Url.URLSearchParams(that.search);
        params.delete("foo大");
        var result = params.toString();
        expect(result).assertEqual("bar=2")
    })

    /**
     * @tc.name   testUrlDelete004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_09800
     * @tc.desc   Deletes the given search parameter and its associated value,from the list of all search parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlDelete004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2');
        let params = new Url.URLSearchParams(that.search);
        params.delete('bar');
        var result = params.toString();
        expect(result).assertEqual("foo=1");
    })

    /**
     * @tc.name   testUrlDelete005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_09900
     * @tc.desc   Deletes the given search parameter and its associated value,from the list of all search parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlDelete005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2');
        let params = new Url.URLSearchParams(that.search);
        params.delete("faa");
        var result = params.toString();
        expect(result).assertEqual("foo=1&bar=2")
    })

    /**
     * @tc.name   testUrlEntries001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_10000
     * @tc.desc   Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlEntries001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2");

        var i=0;
        var arr={};
        for(var pair of params.entries()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[1]).assertEqual("value1");
    })

    /**
     * @tc.name   testUrlEntries002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_10100
     * @tc.desc   Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlEntries002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        var i=0;
        var arr={};
        for(var pair of params.entries()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[2]).assertEqual("key2")
    })

    /**
     * @tc.name   testUrlEntries003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_10200
     * @tc.desc   Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlEntries003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        params.append("foo","jk")
        var i=0;
        var arr={};
        for(var pair of params.entries()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[5]).assertEqual("jk")
    })

    /**
     * @tc.name   testUrlEntries004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_10300
     * @tc.desc   Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlEntries004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        var i=0;
        var arr={};
        for(var pair of params.entries()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[3]).assertEqual("value2")
    })

    /**
     * @tc.name   testUrlEntries005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_10400
     * @tc.desc   Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlEntries005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        params.append("jss","txt")
        var i=0;
        var arr={};
        for(var pair of params.entries()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[4]).assertEqual("jss")
    })

    /**
     * @tc.name   testUrl[Symbol.iterator]001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_10500
     * @tc.desc   Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrl[Symbol.iterator]001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2");
        var i=0;
        var arr={};
        for(var pair of params[Symbol.iterator]()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[1]).assertEqual("value1");
    })

    /**
     * @tc.name   testUrl[Symbol.iterator]()002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_10600
     * @tc.desc   Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrl[Symbol.iterator]()002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        var i=0;
        var arr={};
        for(var pair of params[Symbol.iterator]()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[2]).assertEqual("key2")
    })

    /**
     * @tc.name   testUrl[Symbol.iterator]()003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_10700
     * @tc.desc   Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrl[Symbol.iterator]()003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        params.append("foo","jk")
        var i=0;
        var arr={};
        for(var pair of params[Symbol.iterator]()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[5]).assertEqual("jk")
    })

    /**
     * @tc.name   testUrl[Symbol.iterator]()004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_10800
     * @tc.desc   Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrl[Symbol.iterator]()004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        var i=0;
        var arr={};
        for(var pair of params[Symbol.iterator]()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[3]).assertEqual("value2")
    })

    /**
     * @tc.name   testUrl[Symbol.iterator]()005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_10900
     * @tc.desc   Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrl[Symbol.iterator]()005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        params.append("jss","txt")
        var i=0;
        var arr={};
        for(var pair of params[Symbol.iterator]()) {
            arr[i]=pair[0];
            i++;
            arr[i]=pair[1];
            i++;
        }
        expect(arr[4]).assertEqual("jss")
    })

    /**
     * @tc.name   testUrlForEach001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_11000
     * @tc.desc   Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlForEach001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        var arr={};
        var i = 0;
        function func(value, key, SearchParams)
        {
            arr[i] = value + " " + key + " " + (params === SearchParams)
            i++
        }
        params.forEach(func);
        expect(arr[0]).assertEqual("value1 key1 true");
    })

    /**
     * @tc.name   testUrlForEach002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_11100
     * @tc.desc   Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlForEach002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2");
        var arr={};
        var i = 0;
        function func(value, key, SearchParams)
        {
            arr[i] = value + " " + key + " " + (params === SearchParams)
            i++
        }
        params.forEach(func);
        expect(arr[1]).assertEqual("value2 key2 true");
    })

    /**
     * @tc.name   testUrlForEach003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_11200
     * @tc.desc   Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlForEach003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2");
        params.append("foo","jk");
        var arr={};
        var i = 0;
        function func(value, key, SearchParams)
        {
            arr[i] = value + " " + key + " " + (params === SearchParams)
            i++
        }
        params.forEach(func);
        expect(arr[2]).assertEqual("jk foo true");
    })

    /**
     * @tc.name   testUrlForEach004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_11300
     * @tc.desc   Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlForEach004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("foo=bar&jss=txt");
        var arr={};
        var i = 0;
        function func(value, key, SearchParams)
        {
            arr[i] = value + " " + key + " " + (params === SearchParams)
            i++
        }
        params.forEach(func);
        expect(arr[1]).assertEqual("txt jss true");
    })

    /**
     * @tc.name   testUrlForEach005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_11400
     * @tc.desc   Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlForEach005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("foo=bar&jss=txt");
        params.append("foo","jk");
        var arr={};
        var i = 0;
        function func(value, key, SearchParams)
        {
            arr[i] = value + " " + key + " " + (params === SearchParams)
            i++
        }
        params.forEach(func);
        expect(arr[0]).assertEqual("bar foo true");
    })

    /**
     * @tc.name   testUrlForEach006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_11500
     * @tc.desc   The second parameter of forEach is undefined or null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlForEach006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        var arr = {};
        var i = 0;
        function func(value, key, SearchParams)
        {
            arr[i] = value + " " + key + " " + (params === SearchParams)
            i++
        }
        params.forEach(func, undefined);
        expect(arr[0]).assertEqual("value1 key1 true");
        arr = {}
        i = 0;
        params.forEach(func, null);
        expect(arr[0]).assertEqual("value1 key1 true");
    })

    /**
     * @tc.name   testUrlGet001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_11600
     * @tc.desc   Returns the first value associated to the given search parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlGet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        var result =  params.get("1")
        expect(result).assertEqual(undefined)
    })

    /**
     * @tc.name   testUrlGet002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_11700
     * @tc.desc   Returns the first value associated to the given search parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlGet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        var result =  params.get("key2")
        expect(result).assertEqual("value2")
    })

    /**
     * @tc.name   testUrlGet003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_11800
     * @tc.desc   Returns the first value associated to the given search parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlGet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        params.append("5","JKL")
        var result =  params.get("5")
        expect(result).assertEqual("JKL")
    })

    /**
     * @tc.name   testUrlGet004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_11900
     * @tc.desc   Returns the first value associated to the given search parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlGet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        var result =  params.get("key1")
        expect(result).assertEqual("value1")
    })

    /**
     * @tc.name   testUrlGet005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_12000
     * @tc.desc   Returns the first value associated to the given search parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlGet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        params.append("jss","JL")
        var result =  params.get("jss")
        expect(result).assertEqual("JL")
    })

    /**
     * @tc.name   testUrlGetAll001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_12100
     * @tc.desc   Returns all key-value pairs associated with a given search parameter as an array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlGetAll001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        params.append("key1","AAA")
        var result =  params.getAll("key1")
        expect(result.toString()).assertEqual("value1,AAA")
    })

    /**
     * @tc.name   testUrlGetAll002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_12200
     * @tc.desc   Returns all key-value pairs associated with a given search parameter as an array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlGetAll002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("key1=value1&8=DEF")
        params.append("8","A8A")
        var result =  params.getAll("8")
        expect(result.toString()).assertEqual("DEF,A8A")
    })

    /**
     * @tc.name   testUrlGetAll003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_12300
     * @tc.desc   Returns all key-value pairs associated with a given search parameter as an array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlGetAll003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2&key3=da")
        params.append("key3","A3A")
        var result =  params.getAll("key3")
        expect(result.toString()).assertEqual("da,A3A")
    })

    /**
     * @tc.name   testUrlGetAll004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_12400
     * @tc.desc   Returns all key-value pairs associated with a given search parameter as an array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlGetAll004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2&key3=大")
        params.append("key3","A3A")
        var result =  params.getAll("key4")
        expect(result.toString()).assertEqual('')
    })

    /**
     * @tc.name   testUrlGetAll005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_12500
     * @tc.desc   Returns all key-value pairs associated with a given search parameter as an array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlGetAll005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2&key3=大")
        params.append("key3","A3A")
        var result =  params.getAll("key2")
        expect(result.toString()).assertEqual("value2")
    })

    /**
     * @tc.name   testUrlHas001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_12600
     * @tc.desc   Returns a Boolean that indicates whether a parameter with the specified name exists.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHas001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2&key3=大")
        var result =  params.has("2")
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name   testUrlHas002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_12700
     * @tc.desc   Returns a Boolean that indicates whether a parameter with the specified name exists.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHas002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("小=value1&key2=value2&key3=大")
        var result =  params.has("小")
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name   testUrlHas003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_12800
     * @tc.desc   Returns a Boolean that indicates whether a parameter with the specified name exists.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHas003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("小=value1&￥=value2&key3=大")
        params.append("￥","ACA")
        var result =  params.has("￥")
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name   testUrlHas004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_12900
     * @tc.desc   Returns a Boolean that indicates whether a parameter with the specified name exists.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHas004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("小=value1&key2=value2&key3=大")
        var result =  params.has("无")
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name   testUrlHas005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_13000
     * @tc.desc   Returns a Boolean that indicates whether a parameter with the specified name exists.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHas005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("小=value1&￥=value2&key3=大")
        params.append("￥","ACA")
        var result =  params.has("￥11")
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name   testUrlHas006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_13100
     * @tc.desc   Returns a Boolean that indicates whether a parameter with the specified name exists.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHas006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("小=value1&￥=value2&key3=大")
        params.append("￥","ACA")
        try {
            var a = 1;
            params.has(a);
        } catch(e) {
            expect(e.toString()).assertEqual(`BusinessError: Parameter error. The type of ${a} must be string`);
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual(`Parameter error. The type of ${a} must be string`);
        }
    })

    /**
     * @tc.name   testUrlKeys001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_13200
     * @tc.desc   Returns an iterator allowing to go through all keys contained in this object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlKeys001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("小=value1&￥=value2&key3=大");
        var arr={};
        var i = 0;
        for(var key of params.keys()) {
            arr[i] = key
            i++
        }
        expect(arr[0]).assertEqual("小");
    })

    /**
     * @tc.name   testUrlKeys002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_13300
     * @tc.desc   Returns an iterator allowing to go through all keys contained in this object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlKeys002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("小=value1&￥=value2&key3=大");
        var arr={};
        var i = 0;
        for(var key of params.keys()) {
            arr[i] = key
            i++
        }
        expect(arr[1]).assertEqual("￥");
    })

    /**
     * @tc.name   testUrlKeys003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_13400
     * @tc.desc   Returns an iterator allowing to go through all keys contained in this object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlKeys003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("小=value1&￥=value2&key3=大");
        var arr={};
        var i = 0;
        for(var key of params.keys()) {
            arr[i] = key
            i++
        }
        expect(arr[2]).assertEqual("key3");
    })

    /**
     * @tc.name   testUrlKeys004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_13500
     * @tc.desc   Returns an iterator allowing to go through all keys contained in this object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlKeys004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("小=value1&￥=value2&key3=大&key4=六");
        var arr={};
        var i = 0;
        for(var key of params.keys()) {
            arr[i] = key
            i++
        }
        expect(arr[3]).assertEqual("key4");
    })

    /**
     * @tc.name   testUrlKeys005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_13600
     * @tc.desc   Returns an iterator allowing to go through all keys contained in this object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlKeys005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("小=value1&￥=value2&key3=大&key4=六&key5=发");
        var arr={};
        var i = 0;
        for(var key of params.keys()) {
            arr[i] = key
            i++
        }
        expect(arr[4]).assertEqual("key5");
    })

    /**
     * @tc.name   testUrlSet001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_13700
     * @tc.desc   Sets the value associated with a given search parameter to the given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("1=value1&2=value2&key3=3");
        // params.append("11","ACA");
        params.set("11","CCC");
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&11=CCC");
    })

    /**
     * @tc.name   testUrlSet002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_13800
     * @tc.desc   Sets the value associated with a given search parameter to the given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("1=value1&2=value2&key3=3");
        params.set('10','BBB');
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&10=BBB");
    })

    /**
     * @tc.name   testUrlSet003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_13900
     * @tc.desc   Sets the value associated with a given search parameter to the given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("1=value1&2=value2&key3=3");
        params.set("ma 大" ,"10￥");
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&ma+%E5%A4%A7=10%EF%BF%A5");
    })

    /**
     * @tc.name   testUrlSet004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_14000
     * @tc.desc   Sets the value associated with a given search parameter to the given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("1=value1&2=value2&key3=3");
        // params.append("1","ACA");
        params.set("1","CCC");
        var res = params.toString();
        expect(res).assertEqual("1=CCC&2=value2&key3=3");
    })

    /**
     * @tc.name   testUrlSet005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_14100
     * @tc.desc   Sets the value associated with a given search parameter to the given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("1=value1&2=value2&key3=3");
        params.set('12','BBB');
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&12=BBB");
    })

    /**
     * @tc.name   testUrlSet006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_14200
     * @tc.desc   Sets the value associated with a given search parameter to the given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSet006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try {
            let params = new Url.URLSearchParams("1=value1&2=value2&key3=3");
            var a = 12;
            params.set(a, 'BBB');
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error. The type of ${a} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error. The type of ${a} must be string`);
        }
    })

    /**
     * @tc.name   testUrlSet007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_14300
     * @tc.desc   Sets the value associated with a given search parameter to the given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSet007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams();
        params.set('name', 'value');
        var res = params.toString();
        expect(res).assertEqual("name=value");
    })

    /**
     * @tc.name   testUrlSort001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_14400
     * @tc.desc   Sort all key/value pairs contained in this object in place and return undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSort001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("1=value1&3=value3&2=key2");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=key2&3=value3");
    })

    /**
     * @tc.name   testUrlSort002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_14500
     * @tc.desc   Sort all key/value pairs contained in this object in place and return undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSort002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("a=value1&c=value2&b=key2");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("a=value1&b=key2&c=value2");
    })

    /**
     * @tc.name   testUrlSort003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_14600
     * @tc.desc   Sort all key/value pairs contained in this object in place and return undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSort003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("d=value1&c=value2&b=33");
        params.append("a","ACA");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("a=ACA&b=33&c=value2&d=value1");
    })

    /**
     * @tc.name   testUrlSort004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_14700
     * @tc.desc   Sort all key/value pairs contained in this object in place and return undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSort004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("1=value1&3=value3&2=key2&4=key4");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=key2&3=value3&4=key4");
    })

    /**
     * @tc.name   testUrlSort005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_14800
     * @tc.desc   Sort all key/value pairs contained in this object in place and return undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSort005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("a=value1&c=value2&4=key4&b=key2");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("4=key4&a=value1&b=key2&c=value2");
    })

    /**
     * @tc.name   testUrlValues001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_14900
     * @tc.desc   Returns an iterator allowing to go through all values contained in this object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlValues001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("d=value1&c=value2&b=大")
        var arr={}
        var i = 0
        for(var value  of params.values()) {
            arr[i] = value
            i++
        }
        expect(arr[0]).assertEqual("value1")
    })

    /**
     * @tc.name   testUrlValues002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_15000
     * @tc.desc   Returns an iterator allowing to go through all values contained in this object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlValues002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("d=value1&c=value2&b=大")
        var arr={}
        var i = 0
        for(var value  of params.values()) {
            arr[i] = value
            i++
        }
        expect(arr[1]).assertEqual("value2")
    })

    /**
     * @tc.name   testUrlValues003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_15100
     * @tc.desc   Returns an iterator allowing to go through all values contained in this object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlValues003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("d=value1&c=value2&b=大")
        params.append("a","ACA")
        var arr={}
        var i = 0
        for(var value  of params.values()) {
            arr[i] = value
            i++
        }
        expect(arr[3]).assertEqual("ACA")
    })

    /**
     * @tc.name   testUrlValues004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_15200
     * @tc.desc   Returns an iterator allowing to go through all values contained in this object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlValues004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("d=value1&c=value2&b=大&4=key4")
        var arr={}
        var i = 0
        for(var value  of params.values()) {
            arr[i] = value
            i++
        }
        expect(arr[3]).assertEqual("key4")
    })

    /**
     * @tc.name   testUrlValues005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_15300
     * @tc.desc   Returns an iterator allowing to go through all values contained in this object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlValues005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("d=value1&c=value2&b=大&4=key4&5=key5")
        var arr={}
        var i = 0
        for(var value  of params.values()) {
            arr[i] = value
            i++
        }
        expect(arr[4]).assertEqual("key5")
    })

    /**
     * @tc.name   testUrlSearchParamsToString001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_15400
     * @tc.desc   Returns a query string suitable for use in a URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSearchParamsToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("d=value1&c=value2&b=大")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=%E5%A4%A7")
    })

    /**
     * @tc.name   testUrlSearchParamsToString002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_15500
     * @tc.desc   Returns a query string suitable for use in a URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSearchParamsToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("d=value1&c=value2&b= 大")
        params.append("1 12","QQQ")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=+%E5%A4%A7&1+12=QQQ")
    })

    /**
     * @tc.name   testUrlSearchParamsToString003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_15600
     * @tc.desc   Returns a query string suitable for use in a URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSearchParamsToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("￥=)")
        params.delete("5")
        var result= params.toString()
        expect(result).assertEqual("%EF%BF%A5=%29")
    })

    /**
     * @tc.name   testUrlSearchParamsToString004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_15700
     * @tc.desc   Returns a query string suitable for use in a URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSearchParamsToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("d=value1&c=value2&b=大&4=key4")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=%E5%A4%A7&4=key4")
    })

    /**
     * @tc.name   testUrlSearchParamsToString005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_15800
     * @tc.desc   Returns a query string suitable for use in a URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSearchParamsToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams("d=value1&c=value2&b= 大&4=key4&5=key5")
        params.append("1 12","QQQ")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=+%E5%A4%A7&4=key4&5=key5&1+12=QQQ")
    })

    /**
     * @tc.name   testUrlSearchParamsConstruction001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_15900
     * @tc.desc   A parameterized constructor used to create an URLSearchParams instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSearchParamsConstruction001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams('?user=abc&query=xyz')
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=xyz")
    })

    /**
     * @tc.name   testUrlSearchParamsConstruction002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_16000
     * @tc.desc   A parameterized constructor used to create an URLSearchParams instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSearchParamsConstruction002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams({
            user: 'abc',
            query: ['first', 'second']
        });
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=first%2Csecond")
    })

    /**
     * @tc.name   testUrlSearchParamsConstruction003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_16100
     * @tc.desc   A parameterized constructor used to create an URLSearchParams instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSearchParamsConstruction003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams([
                ['user', 'abc'],
                ['query', 'first'],
                ['query', 'second'],
        ]);
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=first&query=second")
    })

    /**
     * @tc.name   testUrlSearchParamsConstruction004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_16200
     * @tc.desc   A parameterized constructor used to create an URLSearchParams instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSearchParamsConstruction004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const map = new Map();
        map.set('user', 'abc');
        map.set('query', 'xyz');
        let params = new Url.URLSearchParams(map)
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=xyz")
    })

    /**
     * @tc.name   testUrlSearchParamsConstruction005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_16300
     * @tc.desc   A parameterized constructor used to create an URLSearchParams instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSearchParamsConstruction005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        function* getQueryPairs() {
            yield ['user', 'abc'];
            yield ['query', 'first'];
            yield ['query', 'second'];
        }
        let params = new Url.URLSearchParams(getQueryPairs());
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=first&query=second")
    })

    /**
     * @tc.name   testUrlSearchParamsConstruction006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_16400
     * @tc.desc   A parameterized constructor used to create an URLSearchParams instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSearchParamsConstruction006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams()
        params.append('abcde','fghki')
        var paramsResult = params.toString()
        expect(paramsResult).assertEqual('abcde=fghki')
    })

    /**
     * @tc.name   testUrlSearchParamsConstruction007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_16500
     * @tc.desc   A parameterized constructor used to create an URLSearchParams instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSearchParamsConstruction007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let param
        let params = new Url.URLSearchParams(param)
        params.append('abcde','fghki')
        var paramsResult = params.toString()
        expect(paramsResult).assertEqual('abcde=fghki')
    })

    /**
     * @tc.name   testUrlSearchParamsConstruction008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_16600
     * @tc.desc   A parameterized constructor used to create an URLSearchParams instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSearchParamsConstruction008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLSearchParams()
        params.append('abcde','fghki')
        var paramsResult = params.toString()
        expect(paramsResult).assertEqual('abcde=fghki')
    })

    /**
     * @tc.name   testNewUrl001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_16700
     * @tc.desc   The second parameter of Url construction is undefined or null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNewUrl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment', undefined)
        let result = params.toString()
        expect(result).assertEqual("http://username:password@host:8080/directory/file?query#fragment")
        let params1 = new Url.URL('http://username:password@host:8080/directory/file?query#fragment', null)
        let result2 = params1.toString()
        expect(result2).assertEqual("http://username:password@host:8080/directory/file?query#fragment")
    })

    /**
     * @tc.name   testUrlToString001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_16800
     * @tc.desc   Returns the serialized URL as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        var result= params.toString()
        expect(result).assertEqual("http://username:password@host:8080/directory/file?query#fragment")
    })

    /**
     * @tc.name   testUrlToString002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_16900
     * @tc.desc   Returns the serialized URL as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file')
        var result= params.toString()
        expect(result).assertEqual("http://username:password@host:8080/directory/file")
    })

    /**
     * @tc.name   testUrlToString003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_17000
     * @tc.desc   Returns the serialized URL as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080#fragment')
        var result= params.toString()
        expect(result).assertEqual("http://username:password@host:8080/#fragment")
    })

    /**
     * @tc.name   testUrlToString004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_17100
     * @tc.desc   Returns the serialized URL as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http1://host/directory/file?query#fragment')
        var result= params.toString()
        expect(result).assertEqual("http1://host/directory/file?query#fragment")
    })

    /**
     * @tc.name   testUrlToString005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_17200
     * @tc.desc   Returns the serialized URL as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http:host:8080/directory/file?query#fragment')
        var result= params.toString()
        expect(result).assertEqual("http://host:8080/directory/file?query#fragment")
    })

    /**
     * @tc.name   testUrlToString006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_17300
     * @tc.desc   Returns the serialized URL as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlToString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('https://255.16581375')
        var result= params.toString()
        expect(result).assertEqual("https://255.253.2.255/")
    })
    
    /**
     * @tc.name   testUrlToString007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_17400
     * @tc.desc   Returns the serialized URL as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlToString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('https://192.1.')
        var result= params.toString()
        expect(result).assertEqual("https://192.0.0.1/")
    })

    /**
     * @tc.name   testUrlToString008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_17500
     * @tc.desc   Returns the serialized URL as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlToString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('https://192.1..')
        var result= params.toString()
        expect(result).assertEqual("https://192.1../")
    })

    /**
     * @tc.name   testUrlToString009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_17600
     * @tc.desc   Returns the serialized URL as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlToString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('https://192.95645654354.8.f')
        var result= params.toString()
        expect(result).assertEqual("https://192.95645654354.8.f/")
    })

    /**
     * @tc.name   testUrlHref001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_17700
     * @tc.desc   Gets and sets the serialized URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHref001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        var result= params.href
        expect(result).assertEqual("http://username:password@host:8080/directory/file?query#fragment")
    })

    /**
     * @tc.name   testUrlHref002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_17800
     * @tc.desc   Gets and sets the serialized URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHref002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://host:8080/directory/file?query#fragment')
        var result= params.href
        expect(result).assertEqual("http://host:8080/directory/file?query#fragment")
    })

    /**
     * @tc.name   testUrlHref003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_17900
     * @tc.desc   Gets and sets the serialized URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHref003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080')
        var result= params.href
        expect(result).assertEqual("http://username:password@host:8080/")
    })

    /**
     * @tc.name   testUrlHref004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_18000
     * @tc.desc   Gets and sets the serialized URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHref004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.href = 'http1://myhost/path?sss=1#ff';
        var result= params.href
        expect(result).assertEqual("http1://myhost/path?sss=1#ff")
    })

    /**
     * @tc.name   testUrlHref005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_18100
     * @tc.desc   Gets and sets the serialized URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHref005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.href = 'http://myhost:99/path#ff';
        var result= params.href
        expect(result).assertEqual("http://myhost:99/path#ff")
    })

    /**
     * @tc.name   testUrlOrigin001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_18200
     * @tc.desc   Gets the read-only serialization of the URL's origin.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlOrigin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        var result= params.origin
        expect(result).assertEqual('http://host:8080')
    })

    /**
     * @tc.name   testUrlOrigin002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_18300
     * @tc.desc   Gets the read-only serialization of the URL's origin.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlOrigin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:11/directory/file?query#fragment')
        var result= params.origin
        expect(result).assertEqual('http://host:11')
    })

    /**
     * @tc.name   testUrlOrigin003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_18400
     * @tc.desc   Gets the read-only serialization of the URL's origin.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlOrigin003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host/directory/file?query#fragment')
        var result= params.origin
        expect(result).assertEqual('http://host')
    })

    /**
     * @tc.name   testUrlOrigin004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_18500
     * @tc.desc   Gets the read-only serialization of the URL's origin.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlOrigin004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@aaaasshost:212/directory/file?query#fragment')
        var result= params.origin
        expect(result).assertEqual('http://aaaasshost:212')
    })

    /**
     * @tc.name   testUrlOrigin005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_18600
     * @tc.desc   Gets the read-only serialization of the URL's origin.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlOrigin005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host22:100#fragment')
        var result= params.origin
        expect(result).assertEqual('http://host22:100')
    })

    /**
     * @tc.name   testUrlProtocol001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_18700
     * @tc.desc   Gets and sets the protocol portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlProtocol001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        var result= params.protocol
        expect(result).assertEqual('http:')
    })

    /**
     * @tc.name   testUrlProtocol002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_18800
     * @tc.desc   Gets and sets the protocol portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlProtocol002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http1://username:password@host:8080/directory/file?query#fragment')
        var result= params.protocol
        expect(result).assertEqual('http1:')
    })

    /**
     * @tc.name   testUrlProtocol003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_18900
     * @tc.desc   Gets and sets the protocol portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlProtocol003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('https://username:password@host:8080/directory/file?query#fragment')
        var result= params.protocol
        expect(result).assertEqual('https:')
    })

    /**
     * @tc.name   testUrlProtocol004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_19000
     * @tc.desc   Gets and sets the protocol portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlProtocol004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.protocol = 'https:';
        var result= params.protocol
        expect(result).assertEqual('https:')
    })

    /**
     * @tc.name   testUrlProtocol005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_19100
     * @tc.desc   Gets and sets the protocol portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlProtocol005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.protocol = 'ftp:';
        var result= params.protocol
        expect(result).assertEqual('ftp:')
    })

    /**
     * @tc.name   testUrlUsername001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_19200
     * @tc.desc   Gets and sets the username portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlUsername001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        var result= params.username
        expect(result).assertEqual('username')
    })

    /**
     * @tc.name   testUrlUsername002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_19300
     * @tc.desc   Gets and sets the username portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlUsername002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://zhao:password@host:8080/directory/file?query#fragment')
        var result= params.username
        expect(result).assertEqual('zhao')
    })

    /**
     * @tc.name   testUrlUsername003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_19400
     * @tc.desc   Gets and sets the username portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlUsername003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.username = 'skk'
        var result= params.username
        expect(result).assertEqual('skk')
    })

    /**
     * @tc.name   testUrlUsername004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_19500
     * @tc.desc   Gets and sets the username portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlUsername004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.username = 'skp111'
        var result= params.username
        expect(result).assertEqual('skp111')
    })

    /**
     * @tc.name   testUrlUsername005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_19600
     * @tc.desc   Gets and sets the username portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlUsername005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://usme@host:8080/directory/file?query#fragment')
        var result= params.username
        expect(result).assertEqual('usme')
    })

    /**
     * @tc.name   testUrlPassword001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_19700
     * @tc.desc   Gets and sets the password portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlPassword001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:11@host:8080/directory/file?query#fragment')
        var result= params.password
        expect(result).assertEqual('11')
    })

    /**
     * @tc.name   testUrlPassword002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_19800
     * @tc.desc   Gets and sets the password portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlPassword002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:23aa@host:8080/directory/file?query#fragment')
        var result= params.password
        expect(result).assertEqual('23aa')
    })

    /**
     * @tc.name   testUrlPassword003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_19900
     * @tc.desc   Gets and sets the password portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlPassword003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username@host:8080/directory/file?query#fragment')
        var result= params.password
        expect(result).assertEqual('')
    })

    /**
     * @tc.name   testUrlPassword004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_20000
     * @tc.desc   Gets and sets the password portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlPassword004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.password = '1234'
        var result= params.password
        expect(result).assertEqual('1234')
    })

    /**
     * @tc.name   testUrlPassword005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_20100
     * @tc.desc   Gets and sets the password portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlPassword005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.password = '';
        var result= params.password
        expect(result).assertEqual('')
    })

    /**
     * @tc.name   testUrlHost001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_20200
     * @tc.desc   Gets and sets the host portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHost001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        var result= params.host
        expect(result).assertEqual('host:8080')
    })

    /**
     * @tc.name   testUrlHost002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_20300
     * @tc.desc   Gets and sets the host portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHost002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@hosthost/directory/file?query#fragment')
        var result= params.host
        expect(result).assertEqual('hosthost')
    })

    /**
     * @tc.name   testUrlHost003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_20400
     * @tc.desc   Gets and sets the host portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHost003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:199/directory/file?query#fragment')
        var result= params.host
        expect(result).assertEqual('host:199')
    })

    /**
     * @tc.name   testUrlHost004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_20500
     * @tc.desc   Gets and sets the host portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHost004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.host = 'jkjk'
        var result= params.host
        expect(result).assertEqual('jkjk:8080')
    })

    /**
     * @tc.name   testUrlHost005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_20600
     * @tc.desc   Gets and sets the host portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHost005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.host = 'jkjk:100'
        var result= params.host
        expect(result).assertEqual('jkjk:100')
    })

    /**
     * @tc.name   testUrlHostname001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_20700
     * @tc.desc   Gets and sets the host name portion of the URL，not include the port.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHostname001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        var result= params.hostname
        expect(result).assertEqual('host')
    })

    /**
     * @tc.name   testUrlHostname002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_20800
     * @tc.desc   Gets and sets the host name portion of the URL，not include the port.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHostname002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host123:8080/directory/file?query#fragment')
        var result= params.hostname
        expect(result).assertEqual('host123')
    })

    /**
     * @tc.name   testUrlHostname003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_20900
     * @tc.desc   Gets and sets the host name portion of the URL，not include the port.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHostname003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@885ssa:8080/directory/file?query#fragment')
        var result= params.hostname
        expect(result).assertEqual('885ssa')
    })

    /**
     * @tc.name   testUrlHostname004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_21000
     * @tc.desc   Gets and sets the host name portion of the URL，not include the port.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHostname004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.hostname = 'sksk'
        var result= params.hostname
        expect(result).assertEqual('sksk')
    })

    /**
     * @tc.name   testUrlHostname005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_21100
     * @tc.desc   Gets and sets the host name portion of the URL，not include the port.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHostname005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.hostname = 'hosthost'
        var result= params.hostname
        expect(result).assertEqual('hosthost')
    })

    /**
     * @tc.name   testUrlPort001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_21200
     * @tc.desc   Gets and sets the port portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlPort001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        var result= params.port
        expect(result).assertEqual('8080')
    })

    /**
     * @tc.name   testUrlPort002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_21300
     * @tc.desc   Gets and sets the port portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlPort002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:100/directory/file?query#fragment')
        var result= params.port
        expect(result).assertEqual('100')
    })

    /**
     * @tc.name   testUrlPort003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_21400
     * @tc.desc   Gets and sets the port portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlPort003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host/directory/file?query#fragment')
        var result= params.port
        expect(result).assertEqual('')
    })

    /**
     * @tc.name   testUrlPort004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_21500
     * @tc.desc   Gets and sets the port portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlPort004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.port = '99'
        var result= params.port
        expect(result).assertEqual('99')
    })

    /**
     * @tc.name   testUrlPort005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_21600
     * @tc.desc   Gets and sets the port portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlPort005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.port = '123'
        var result= params.port
        expect(result).assertEqual('123')
    })

    /**
     * @tc.name   testUrlPathname001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_21700
     * @tc.desc   Gets and sets the path portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlPathname001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        var result= params.pathname
        expect(result).assertEqual('/directory/file')
    })

    /**
     * @tc.name   testUrlPathname002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_21800
     * @tc.desc   Gets and sets the path portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlPathname002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory?query#fragment')
        var result= params.pathname
        expect(result).assertEqual('/directory')
    })

    /**
     * @tc.name   testUrlPathname003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_21900
     * @tc.desc   Gets and sets the path portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlPathname003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080?query#fragment')
        var result= params.pathname
        expect(result).assertEqual('/')
    })

    /**
     * @tc.name   testUrlPathname004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_22000
     * @tc.desc   Gets and sets the path portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlPathname004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.pathname = 'path'
        var result= params.pathname
        expect(result).assertEqual('/path')
    })

    /**
     * @tc.name   testUrlPathname005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_22100
     * @tc.desc   Gets and sets the path portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlPathname005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.pathname = '/directory/file11'
        var result= params.pathname
        expect(result).assertEqual('/directory/file11')
    })

    /**
     * @tc.name   testUrlSearch001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_22200
     * @tc.desc   Gets and sets the serialized query portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSearch001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=qqqq#fragment')
        var result= params.search
        expect(result).assertEqual('?query=qqqq')
    })

    /**
     * @tc.name   testUrlSearch002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_22300
     * @tc.desc   Gets and sets the serialized query portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSearch002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=qqqq&ll=pp#fragment')
        var result= params.search
        expect(result).assertEqual('?query=qqqq&ll=pp')
    })

    /**
     * @tc.name   testUrlSearch003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_22400
     * @tc.desc   Gets and sets the serialized query portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSearch003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?ppp9875=77#fragment')
        var result= params.search
        expect(result).assertEqual('?ppp9875=77')
    })

    /**
     * @tc.name   testUrlSearch004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_22500
     * @tc.desc   Gets and sets the serialized query portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSearch004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=qqqq#fragment')
        params.search = 'kk=99'
        var result= params.search
        expect(result).assertEqual('?kk=99')
    })

    /**
     * @tc.name   testUrlSearch005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_22600
     * @tc.desc   Gets and sets the serialized query portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSearch005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=qqqq#fragment')
        params.search = 'pppk=99'
        var result= params.search
        expect(result).assertEqual('?pppk=99')
    })

    /**
     * @tc.name   testUrlHash001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_22700
     * @tc.desc   Gets and sets the fragment portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHash001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=pppppp#fragment')
        var result= params.hash
        expect(result).assertEqual('#fragment')
    })

    /**
     * @tc.name   testUrlHash002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_22800
     * @tc.desc   Gets and sets the fragment portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHash002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=pppppp#fragment')
        params.hash = '123456'
        var result= params.hash
        expect(result).assertEqual('#123456')
    })

    /**
     * @tc.name   testUrlHash003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_22900
     * @tc.desc   Gets and sets the fragment portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHash003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=pppppp#poiu')
        var result= params.hash
        expect(result).assertEqual('#poiu')
    })

    /**
     * @tc.name   testUrlHash004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_23000
     * @tc.desc   Gets and sets the fragment portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHash004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=pppppp')
        var result= params.hash
        expect(result).assertEqual('')
    })

    /**
     * @tc.name   testUrlHash005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_23100
     * @tc.desc   Gets and sets the fragment portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHash005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=pppppp#fragment')
        params.hash = 'qwer'
        var result= params.hash
        expect(result).assertEqual('#qwer')
    })

     /**
      * @tc.name   testUrlSearchParams001
      * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_23200
      * @tc.desc   Gets the SearchParams portion of the URL
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('testUrlSearchParams001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var that = new Url.URL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        var params = that.searchParams
        var result = params.toString()
        expect(result).assertEqual('foo=1&bar=2')
    })

    /**
     * @tc.name   testUrlSearchParams002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_23300
     * @tc.desc   Gets the SearchParams portion of the URL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSearchParams002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = that.searchParams
        params.append("ma 大","jk￥")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&ma+%E5%A4%A7=jk%EF%BF%A5")
    })

    /**
     * @tc.name   testUrlSearchParams003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_23400
     * @tc.desc   Gets the SearchParams portion of the URL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSearchParams003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let that = new Url.URL('https://example.com?d=value1&c=value2&b=大&4=key4')
        let params = that.searchParams
        var result = params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=%E5%A4%A7&4=key4")
    })

    /**
     * @tc.name   testUrlSearchParams004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_23500
     * @tc.desc   Gets the SearchParams portion of the URL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSearchParams004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = that.searchParams
        params.append("foo~!@#$%^&*()_+-=","jk")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&foo%7E%21%40%23%24%25%5E%26*%28%29_%2B-%3D=jk")
    })

    /**
     * @tc.name   testUrlSearchParams005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_23600
     * @tc.desc   Gets the SearchParams portion of the URL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSearchParams005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let that = new Url.URL('http://username:password@host:8080/directory/file?你好=china#qwer=da')
        let params = that.searchParams
        var result = params.toString()
        expect(result).assertEqual("%E4%BD%A0%E5%A5%BD=china")
    })

    /**
     * @tc.name   testUrlURLParams001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_23700
     * @tc.desc   Gets the SearchParams portion of the URL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlURLParams001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        var that = new Url.URL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        var seach = that.params
        var result = seach.toString()
        expect(result).assertEqual('foo=1&bar=2')
    })

    /**
     * @tc.name   testUrlURLParams002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_23800
     * @tc.desc   Gets the SearchParams portion of the URL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlURLParams002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let seach = that.params
        seach.append("ma 大","jk￥")
        var result = seach.toString()
        expect(result).assertEqual("foo=1&bar=2&ma+%E5%A4%A7=jk%EF%BF%A5")
    })

    /**
     * @tc.name   testUrlURLParams003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_23900
     * @tc.desc   Gets the SearchParams portion of the URL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlURLParams003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let that = new Url.URL('https://example.com?d=value1&c=value2&b=大&4=key4')
        let seach = that.params
        var result = seach.toString()
        expect(result).assertEqual("d=value1&c=value2&b=%E5%A4%A7&4=key4")
    })

    /**
     * @tc.name   testUrlURLParams004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_24000
     * @tc.desc   Gets the SearchParams portion of the URL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlURLParams004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let seach = that.params
        seach.append("foo~!@#$%^&*()_+-=","jk")
        var result = seach.toString()
        expect(result).assertEqual("foo=1&bar=2&foo%7E%21%40%23%24%25%5E%26*%28%29_%2B-%3D=jk")
    })

    /**
     * @tc.name   testUrlURLParams005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_24100
     * @tc.desc   Gets the SearchParams portion of the URL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlURLParams005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let that = new Url.URL('http://username:password@host:8080/directory/file?你好=china#qwer=da')
        let seach = that.params
        var result = seach.toString()
        expect(result).assertEqual("%E4%BD%A0%E5%A5%BD=china")
    })

    /**
     * @tc.name   testUrlToJson001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_24200
     * @tc.desc   Returns the serialized URL as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlToJson001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=pppppp#qwer=da')
        var result= params.toJSON()
        expect(result).assertEqual('http://username:password@host:8080/directory/file?query=pppppp#qwer=da')
    })

    /**
     * @tc.name   testUrlToJson002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_24300
     * @tc.desc   Returns the serialized URL as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlToJson002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://host:8080/directory/file?query=pppppp#qwer=da')
        var result= params.toJSON()
        expect(result).assertEqual('http://host:8080/directory/file?query=pppppp#qwer=da')
    })

    /**
     * @tc.name   testUrlToJson003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_24400
     * @tc.desc   Returns the serialized URL as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlToJson003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080')
        var result= params.toJSON()
        expect(result).assertEqual('http://username:password@host:8080/')
    })

    /**
     * @tc.name   testUrlToJson004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_24500
     * @tc.desc   Returns the serialized URL as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlToJson004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http11://username:password@host:8080?query=pppppp#qwer=da')
        var result= params.toJSON()
        expect(result).assertEqual('http11://username:password@host:8080?query=pppppp#qwer=da')
    })

    /**
     * @tc.name   testUrlToJson005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_24600
     * @tc.desc   Returns the serialized URL as a string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlToJson005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://username:password@host:8080/directory')
        var result= params.toJSON()
        expect(result).assertEqual('http://username:password@host:8080/directory')
    })

    /**
     * @tc.name   testUrlIPv6001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_24700
     * @tc.desc   Gets and sets the serialized URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlIPv6001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://[FEDC:BA98:7654:3210:FEDC:BA98:7654:3210]:80/index.html')
        var result= params.href
        expect(result).assertEqual('http://[fedc:ba98:7654:3210:fedc:ba98:7654:3210]/index.html')
    })

    /**
     * @tc.name   testUrlIPv6002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_24800
     * @tc.desc   Gets and sets the serialized URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlIPv6002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://[1080:0:0:0:8:800:200C:417A]/index.html')
        var result= params.href
        expect(result).assertEqual('http://[1080::8:800:200c:417a]/index.html')
    })

    /**
     * @tc.name   testUrlIPv6003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_24900
     * @tc.desc   Gets and sets the serialized URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlIPv6003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://[::FFFF:129.144.52.38]:80/index.html')
        var result= params.href
        expect(result).assertEqual('http://[::ffff:8190:3426]/index.html')
    })

    /**
     * @tc.name   testUrlIPv4001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_25000
     * @tc.desc   Gets and sets the serialized URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlIPv4001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://0377.0xff.255.1:80/index.html')
        var result= params.href
        expect(result).assertEqual('http://255.255.255.1/index.html')
    })

    /**
     * @tc.name   testUrlIPv4002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_25100
     * @tc.desc   Gets and sets the serialized URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlIPv4002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://0377.0xff.255.g/index.html')
        var result= params.href
        expect(result).assertEqual('http://0377.0xff.255.g/index.html')
    })

    /**
     * @tc.name   testUrlIPv4003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_25200
     * @tc.desc   Gets and sets the serialized URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlIPv4003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('http://190.254.245.9:80/index.html')
        var result= params.href
        expect(result).assertEqual('http://190.254.245.9/index.html')
    })

    /**
     * @tc.name   testUrlConstruction001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_25300
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlConstruction001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('https://developer.mozilla.org',)
        var result= params.href
        expect(result).assertEqual('https://developer.mozilla.org/')
    })

    /**
     * @tc.name   testUrlConstruction002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_25400
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlConstruction002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('https://developer.mozilla.org','flie:/developer.mozilla.org')
        var result= params.href
        expect(result).assertEqual('https://developer.mozilla.org/')
    })

    /**
     * @tc.name   testUrlConstruction003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_25500
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlConstruction003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('https://developer.mozilla.org','ftp://www.example.com')
        var result= params.href
        expect(result).assertEqual('https://developer.mozilla.org/')
    })

    /**
     * @tc.name   testUrlConstruction004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_25600
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlConstruction004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL(' ', 'http://www.example.com')
        var result= params.href
        expect(result).assertEqual('http://www.example.com/')
    })

    /**
     * @tc.name   testUrlConstruction005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_25700
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlConstruction005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('.', 'http://www.example.com')
        var result= params.href
        expect(result).assertEqual('http://www.example.com/')
    })

    /**
     * @tc.name   testUrlConstruction006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_25800
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlConstruction006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('../h:', 'http://www.example.com')
        var result= params.href
        expect(result).assertEqual('http://www.example.com/h:')
    })

    /**
     * @tc.name   testUrlConstruction007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_25900
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlConstruction007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('/sca/./path/path/../scasa/jjjjj', 'http://www.example.com')
        var result= params.href
        expect(result).assertEqual('http://www.example.com/sca/path/scasa/jjjjj')
    })

    /**
     * @tc.name   testUrlConstruction008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_26000
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlConstruction008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('/../sca/./path/path/../scasa/jjjjj', 'http://www.example.com')
        var result= params.href
        expect(result).assertEqual('http://www.example.com/sca/path/scasa/jjjjj')
    })

    /**
     * @tc.name   testUrlConstruction009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_26100
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlConstruction009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL( '/../sca/./path/path/../scasa/jjjjj', 'file://www.example.com')
        var result= params.href
        expect(result).assertEqual('file://www.example.com/sca/path/scasa/jjjjj')
    })

    /**
     * @tc.name   testUrlConstruction010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_26200
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlConstruction010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('/../sca/./path/path/../scasa/jjjjj', 'file1://www.example.com')
        var result= params.href
        expect(result).assertEqual('file1://www.example.com/sca/path/scasa/jjjjj')
    })

    /**
     * @tc.name   testUrlConstruction011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_26300
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlConstruction011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('htt1p://www.0902zy.cn/path?abc=123&def=456#yyyy')
        let params1 = new Url.URL('www.baidu.com/ssaa',params)
        var result = params1.href
        expect(result).assertEqual('htt1p://www.0902zy.cn/www.baidu.com/ssaa')
    })

    /**
     * @tc.name   testUrlConstruction012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_26400
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlConstruction012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('htt1p://www.0902zy.cn/path?abc=123&def=456#yyyy')
        let params1 = new Url.URL('//www.baidu.com/ssaa',params)
        var result = params1.href
        expect(result).assertEqual('htt1p://www.baidu.com/ssaa')
    })

    /**
     * @tc.name   testUrlConstruction013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_26500
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlConstruction013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('htt1p://www.0902zy.cn/path?abc=123&def=456#yyyy')
        let params1 = new Url.URL('',params)
        var result = params1.href
        expect(result).assertEqual('htt1p://www.0902zy.cn/path?abc=123&def=456#yyyy')
    })

    /**
     * @tc.name   testUrlConstruction014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_26600
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlConstruction014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL('htt1p://www.0902zy.cn/path?abc=123&def=456#yyyy')
        var result = params.searchParams.toString();
        expect(result).assertEqual('abc=123&def=456')
    })

    /**
     * @tc.name   testUrlparseURL001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_26700
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('https://developer.mozilla.org',)
        var result= params2.href
        expect(result).assertEqual('https://developer.mozilla.org/')
    })

    /**
     * @tc.name   testUrlparseURL002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_26800
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 = Url.URL.parseURL('https://developer.mozilla.org','flie:/developer.mozilla.org')
        var result= params2.href
        expect(result).assertEqual('https://developer.mozilla.org/')
    })

    /**
     * @tc.name   testUrlparseURL003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_26900
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 = Url.URL.parseURL('https://developer.mozilla.org','ftp://www.example.com')
        var result= params2.href
        expect(result).assertEqual('https://developer.mozilla.org/')
    })

    /**
     * @tc.name   testUrlparseURL004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_27000
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 = Url.URL.parseURL(' ', 'http://www.example.com')
        var result= params2.href
        expect(result).assertEqual('http://www.example.com/')
    })

    /**
     * @tc.name   testUrlparseURL005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_27100
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 = Url.URL.parseURL('.', 'http://www.example.com')
        var result= params2.href
        expect(result).assertEqual('http://www.example.com/')
    })

    /**
     * @tc.name   testUrlparseURL006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_27200
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 = Url.URL.parseURL('../h:', 'http://www.example.com')
        var result= params2.href
        expect(result).assertEqual('http://www.example.com/h:')
    })

    /**
     * @tc.name   testUrlparseURL007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_27300
     * @tc.desc   URL constructor, BusinessError: Parameter error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try{
            let params = new Url.URL()
            expect(params != null).assertTrue()
            var a = undefined
            Url.URL.parseURL(a)
            expect(0).assertEqual(1)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error. The type of ${a} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error. The type of ${a} must be string`);
        }
    })

    /**
     * @tc.name   testUrlparseURL008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_27400
     * @tc.desc   URL constructor, BusinessError: Parameter error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try{
            let params = new Url.URL()
            expect(params != null).assertTrue()
            var a = 666;
            var b = 666;
            Url.URL.parseURL(a, b)
            expect(0).assertEqual(1)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error. The type of ${a} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error. The type of ${a} must be string`);
        }
    })

    /**
     * @tc.name   testUrlparseURL009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_27500
     * @tc.desc   URL constructor, BusinessError: Parameter error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try{
            let params = new Url.URL()
            expect(params != null).assertTrue()
            var a = '666666';
            var b = 666666;
            Url.URL.parseURL(a, b)
            expect(0).assertEqual(1)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error. The type of ${b} must be string or URL`);
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error. The type of ${b} must be string or URL`);
        }
    })

    /**
     * @tc.name   testUrlparseURL0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_27600
     * @tc.desc   URL constructor, BusinessError: Parameter error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try{
            let params = new Url.URL()
            expect(params != null).assertTrue()
            var a = '666666';
            var b = "666666";
            Url.URL.parseURL(a, b)
            expect(0).assertEqual(1)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Syntax Error. Invalid Url string`)
            expect(err.code).assertEqual(10200002)
            expect(err.message).assertEqual(`Syntax Error. Invalid Url string`);
        }
    })

    /**
     * @tc.name   testUrlparseURL0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_27700
     * @tc.desc   The second parameter of parseURL is undefined or null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params1 =  Url.URL.parseURL('https://developer.mozilla.org', undefined)
        let result = params1.href
        expect(result).assertEqual('https://developer.mozilla.org/')
        let params2 =  Url.URL.parseURL('https://developer.mozilla.org', null)
        let result1 = params2.href
        expect(result1).assertEqual('https://developer.mozilla.org/')
    })

     /**
      * @tc.name   testUrlparseURL0012
      * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_27800
      * @tc.desc   The second parameter of parseURL is undefined or null.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('testUrlparseURL0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('http://168')
        var result= params2.href
        expect(result).assertEqual('http://0.0.0.168/')
    })

    /**
     * @tc.name   testUrlparseURL0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_27900
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('http://168.')
        var result= params2.href
        expect(result).assertEqual('http://0.0.0.168/')
    })

    /**
     * @tc.name   testUrlparseURL0014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_28000
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('http://168.1')
        var result= params2.href
        expect(result).assertEqual('http://168.0.0.1/')
    })

    /**
     * @tc.name   testUrlparseURL0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_28100
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('http://168.1.')
        var result= params2.href
        expect(result).assertEqual('http://168.0.0.1/')
    })

    /**
     * @tc.name   testUrlparseURL0016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_28200
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('http://168.1.1')
        var result= params2.href
        expect(result).assertEqual('http://168.1.0.1/')
    })

    /**
     * @tc.name   testUrlparseURL0017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_28300
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('http://168.60.114.105')
        var result= params2.href
        expect(result).assertEqual('http://168.60.114.105/')
    })

    /**
     * @tc.name   testUrlparseURL0018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_28400
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('http://168.1.399')
        var result= params2.href
        expect(result).assertEqual('http://168.1.1.143/')
    })

    /**
     * @tc.name   testUrlparseURL0019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_28500
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('http://168.3.0XFF')
        var result= params2.href
        expect(result).assertEqual('http://168.3.0.255/')
    })

    /**
     * @tc.name   testUrlparseURL0020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_28600
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('http://168.3.65535')
        var result= params2.href
        expect(result).assertEqual('http://168.3.255.255/')
    })

    /**
     * @tc.name   testUrlparseURL0021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_28700
     * @tc.desc   URL constructor, throw BusinessError: Syntax Error. Invalid Url string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try{
            let params = new Url.URL()
            expect(params != null).assertTrue()
            var a = 'http://168.399.3';
            Url.URL.parseURL(a)
            expect(0).assertEqual(1)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Syntax Error. Invalid Url string`)
            expect(err.code).assertEqual(10200002)
            expect(err.message).assertEqual(`Syntax Error. Invalid Url string`);
        }
    })

    /**
     * @tc.name   testUrlparseURL0022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_28800
     * @tc.desc   URL constructor, throw BusinessError: Syntax Error. Invalid Url string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try{
            let params = new Url.URL()
            expect(params != null).assertTrue()
            var a = 'http://168.255.65536';
            Url.URL.parseURL(a)
            expect(0).assertEqual(1)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Syntax Error. Invalid Url string`)
            expect(err.code).assertEqual(10200002)
            expect(err.message).assertEqual(`Syntax Error. Invalid Url string`);
        }
    })

    /**
     * @tc.name   testUrlparseURL0023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_28900
     * @tc.desc   URL constructor, throw BusinessError: Syntax Error. Invalid Url string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try{
            let params = new Url.URL()
            expect(params != null).assertTrue()
            var a = 'http://168.555.0X10000';
            Url.URL.parseURL(a)
            expect(0).assertEqual(1)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Syntax Error. Invalid Url string`)
            expect(err.code).assertEqual(10200002)
            expect(err.message).assertEqual(`Syntax Error. Invalid Url string`);
        }
    })

    /**
     * @tc.name   testUrlparseURL0024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_29000
     * @tc.desc   URL constructor, throw BusinessError: Syntax Error. Invalid Url string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try{
            let params = new Url.URL()
            expect(params != null).assertTrue()
            var a = 'http://168.16777217';
            Url.URL.parseURL(a)
            expect(0).assertEqual(1)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Syntax Error. Invalid Url string`)
            expect(err.code).assertEqual(10200002)
            expect(err.message).assertEqual(`Syntax Error. Invalid Url string`);
        }
    })

    /**
     * @tc.name   testUrlparseURL0025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_29100
     * @tc.desc   URL constructor, throw BusinessError: Syntax Error. Invalid Url string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try{
            let params = new Url.URL()
            expect(params != null).assertTrue()
            var a = 'http://www.host.name:655348899994';
            Url.URL.parseURL(a)
            expect(0).assertEqual(1)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Syntax Error. Invalid Url string`)
            expect(err.code).assertEqual(10200002)
            expect(err.message).assertEqual(`Syntax Error. Invalid Url string`);
        }
    })

    /**
     * @tc.name   testUrlparseURL0026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_29200
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params2 =  Url.URL.parseURL('http://192.0x.9.')
        var result= params2.toString();
        expect(result).assertEqual('http://192.0.0.9/')
    })

    /**
     * @tc.name   testUrlparseURL0027
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_29300
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let urlObj =  Url.URL.parseURL('../2/2.html', 'http://xxx.com/hem1/1/1.html')
        var result = urlObj.toString();
        expect(result).assertEqual('http://xxx.com/hem1/2/2.html')
    })

    /**
     * @tc.name   testUrlparseURL0028
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_29400
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let urlObj =  Url.URL.parseURL('../2/2.html', 'http://xxx.com')
        var result = urlObj.toString();
        expect(result).assertEqual('http://xxx.com/2/2.html')
    })

    /**
     * @tc.name   testUrlparseURL0029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_29500
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strUrl = "bytedance://large_image?url=https%3A%2F%2Fp3-sign.toutiaoimg.com%2Flarge%2Ftos-cn-i-6w9my0ksv" +
        "p%2Fc2c8b671c3ea4f968ae3a89a21b5f952%3F_iz%3D67594%26from%3Darticle.detail%26x-expires%3D1703755589%26x" +
        "-signature%3DFUbhPcvUfgI%252BJLdkCiaj1S1pBSQ%253D&index=0";
        let res = "?url=https%3A%2F%2Fp3-sign.toutiaoimg.com%2Flarge%2Ftos-cn-i-6w9my0ksvp%2Fc2c8b671c3ea4f968ae3a89a21b" +
        "5f952%3F_iz%3D67594%26from%3Darticle.detail%26x-expires%3D1703755589%26x-signature%3DFUbhPcvUfgI%252BJLdkCia" +
        "j1S1pBSQ%253D&index=0";
        let urlObj =  Url.URL.parseURL(strUrl)
        var result = urlObj.search;
        expect(result).assertEqual(res)
    })

    /**
     * @tc.name   testUrlparseURL0030
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_29600
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strUrl = "bytedance://large_image?url=https%3A%2F%2Fp3-sign.toutiaoimg.com%2Flarge%2Ftos-cn-i-6w9my0ksv" +
        "p%2Fc2c8b671c3ea4f968ae3a89a21b5f952%3F_iz%3D67594%26from%3Darticle.detail%26x-expires%3D1703755589%26x" +
        "-signature%3DFUbhPcvUfgI%252BJLdkCiaj1S1pBSQ%253D&index=0";
        let res = "url=https%3A%2F%2Fp3-sign.toutiaoimg.com%2Flarge%2Ftos-cn-i-6w9my0ksvp%2Fc2c8b671c3ea4f968ae3a89" +
        "a21b5f952%3F_iz%3D67594%26from%3Darticle.detail%26x-expires%3D1703755589%26x-signature%3DFUbhPcvUfgI%252BJ" +
        "LdkCiaj1S1pBSQ%253D&index=0";
        let urlObj =  Url.URL.parseURL(strUrl)
        var result = urlObj.params.toString();
        expect(result).assertEqual(res)
    })

    /**
     * @tc.name   testUrlparseURL0031
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_29700
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strUrl = "bytedance://large_image?url=https%3A%2F%2Fp3-sign.toutiaoimg.com%2Flarge%2Ftos-cn-i-6w9my0ksv" +
        "p%2Fc2c8b671c3ea4f968ae3a89a21b5f952%3F_iz%3D67594%26from%3Darticle.detail%26x-expires%3D1703755589%26x" +
        "-signature%3DFUbhPcvUfgI%252BJLdkCiaj1S1pBSQ%253D&index=0";
        let res = "https://p3-sign.toutiaoimg.com/large/tos-cn-i-6w9my0ksvp/c2c8b671c3ea4f968ae3a89a21b5f952?_iz=" +
        "67594&from=article.detail&x-expires=1703755589&x-signature=FUbhPcvUfgI%2BJLdkCiaj1S1pBSQ%3D"
        let urlObj =  Url.URL.parseURL(strUrl)
        var result = urlObj.params.get("url")
        expect(result).assertEqual(res)
    })

    /**
     * @tc.name   testUrlparseURL0032
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_29800
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strUrl = "bytedance://large_image?url=https%3A%2F%2Fp3-sign.toutiaoimg.com%2Flarge%2Ftos-cn-i-6w9my0ksv" +
        "p%2Fc22%3F_iz%3D67594%26from%3Dal%26x-expires%3D19%26x-sie%3DFI%252BJ&index=0&url=https%3A%2F%2Fssse?iz=67" +
        "594&from=article.detail%26x-expires%3D17";
        let res = '["https://p3-sign.toutiaoimg.com/large/tos-cn-i-6w9my0ksvp/c22?_iz=675' +
        '94&from=al&x-expires=19&x-sie=FI%2BJ","https://ssse?iz=67594"]';
        let urlObj =  Url.URL.parseURL(strUrl)
        var result = JSON.stringify(urlObj.params.getAll("url"))
        expect(result).assertEqual(res)
    })

    /**
     * @tc.name   testUrlparseURL0033
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_29900
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strUrl = "?newsId=HB-1-snhs/index_v2-s&urlInfo=%7B%22hot_topic%22%3A%221%22%2C%22keyword%22%3A%22%25" +
          "E5%25B8%2583%25E6%259E%2597%25E8%2582%25AF%25E6%258A%25B5%25E8%25BE%25BE%25E4%25B8%258A%25E6%25" +
          "B5%25B7%25E5%25BC%2580%25E5%2590%25AF%25E8%25AE%25BF%25E5%258D%258E%22%2C%22query_class%22%3A%22" +
          "%25E5%259B%25BD%25E9%2599%2585%22%2C%22query_id%22%3A%227VO3B%22%2C%22query_rank%22%3A%2234%22%2C%22" +
          "query_resultVersion%22%3A%220%22%2C%22query_wordType%22%3A%22harmony%22%2C%22searchFrom%22" +
          "%3A%22hot_topic%22%7D";
        let res = '{"hot_topic":"1","keyword":"%E5%B8%83%E6%9E%97%E8%82%AF%E6%8A%B5%E8%BE%BE%E4%B8%8A%E6%B5' +
        '%B7%E5%BC%80%E5%90%AF%E8%AE%BF%E5%8D%8E","query_class":"%E5%9B%BD%E9%99%85","query_id":"7VO3B",' +
        '"query_rank":"34","query_resultVersion":"0","query_wordType":"harmony","searchFrom":"hot_topic"}';
        let urlObj = new Url.URLParams(strUrl)
        var result = urlObj.get("urlInfo")
        expect(result).assertEqual(res)
    })

    /**
     * @tc.name   testUrlparseURL0034
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_30000
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let strUrl = '?newsId=HB-1-snhs/index_v2-search&urlInfo=%7B%22hot_topic%22%3A%221%22%2C%22keyword%22%3A%22' +
            '%25E6%2598%25A5%25E8%2589%25B2%25E5%25AF%2584%25E6%2583%2585%25E4%25BA%25BA%2520%25E4%25BD%2595%25E5' +
            '%258F%2594%25E5%258E%25BB%25E4%25B8%2596%22%2C%22query_class%22%3A%22%25E6%2583%2585%25E6%2584%259F' +
            '%22%2C%22query_id%22%3A%227VZkV%22%2C%22query_rank%22%3A%2227%22%2C%22query_resultVersion%22%3A%220' +
            '%22%2C%22query_wordType%22%3A%22harmony%22%2C%22searchFrom%22%3A%22hot_topic%22%7D';
        let urlObj = new Url.URLParams(strUrl);
        let value1 = 'HB-1-snhs/index_v2-search';
        let value2 = '{"hot_topic":"1","keyword":"%E6%98%A5%E8%89%B2%E5%AF%84%E6%83%85%E4%BA%BA%20%E4%BD%95%E5%8F' +
            '%94%E5%8E%BB%E4%B8%96","query_class":"%E6%83%85%E6%84%9F","query_id":"7VZkV","query_rank":"27",' +
            '"query_resultVersion":"0","query_wordType":"harmony","searchFrom":"hot_topic"}'
        let a = urlObj.values();
        expect(a[0]).assertEqual(value1)
        expect(a[1]).assertEqual(value2)
    })

   /**
    * @tc.name   testUrlparseURL0035
    * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_30100
    * @tc.desc   URL constructor, which is used to instantiate a URL object.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it('testUrlparseURL0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    const u = Url.URL.parseURL(`https://a.cn?phone=lkasdjfj+d sa+=d+d`)
    const phone = u.params.get('phone')
    expect(u.params.toString()).assertEqual('phone=lkasdjfj+d+sa+%3Dd+d')
    expect(phone).assertEqual('lkasdjfj d sa =d d')
    let url1 = new Url.URLParams('MEYCIQDFq18GgOub1%2BDLIafKGY19uor8j0qCYc1Z9HzX2TEcPwIhAPg7VCBUPjOpp' +
        'JNbv9zoo0NqIIeHH4K0gFjm7oLLw8mD%3D=s+%2B')
    expect(url1.toString()).assertEqual('MEYCIQDFq18GgOub1%2BDLIafKGY19uor8j0qCYc1Z9HzX2TEcPwIh' +
        'APg7VCBUPjOppJNbv9zoo0NqIIeHH4K0gFjm7oLLw8mD%3D=s+%2B')
    })

    /**
     * @tc.name   testUrlparseURL0036
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_30200
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const schema = "bytedance://large_image?url=https%3A%2F%2Fp3-sign.toutiaoimg.com%2Flarge%2Ftos-cn-i-6w9my" +
            "0ksvp%2Fc2c8b671c3ea4f968ae3a89a21b5f952%3F_iz%3D67594%26from%3Darticle.detail%26x-expires%3D1703" +
            "755589%26x-signature%3DFUbhPcvUfgI%252BJLdkCiaj1S1pBSQ%253D&index=0"
        const parsedUrl = Url.URL.parseURL(schema)
        let src = 'https://p3-sign.toutiaoimg.com/large/tos-cn-i-6w9my0ksvp/c2c8b671c3ea4f968ae3a89a21b5f952?_iz=67594' +
            '&from=article.detail&x-expires=1703755589&x-signature=FUbhPcvUfgI%2BJLdkCiaj1S1pBSQ%3D'
        expect(parsedUrl.params.get("url")).assertEqual(src)
    })

    /**
     * @tc.name   testUrlparseURL0037
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_30300
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let urlz = Url.URL.parseURL('eleme://web?url=eleme%3A%2F%2Fweb%3Fur1%3Dhttps%253A%252F%252Fwww.ba+idu.com')
        let uriParams = urlz.params;
        uriParams.forEach((value, key) => {
            expect(key).assertEqual('url')
            expect(value).assertEqual('eleme://web?ur1=https%3A%2F%2Fwww.ba idu.com')
        })
    })

    /**
     * @tc.name   testUrlparseURL0038
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_30400
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2#ss');
        let paramsObject = urlObject.params;
        paramsObject.set('baz', 'test 你好');
        const s = urlObject.toString();
        expect(s).assertEqual('https://developer.exampleurl/?fod=1&bard=2&baz=test+%E4%BD%A0%E5%A5%BD#ss')
    })

    /**
     * @tc.name   testUrlparseURL0039
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_30500
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let urlString = '?url=http%3A%2F%2Ftest-aweme.snssdk.com%2Ffalcon%2Fjsb_tester_web%2Fdmt%2F%3FcaseId%3D%26' +
            'groupId%3D1379%26author%3Dliuhongyang.lhoin%26authorId%3D1951227%26isAutoTest%3D%26productionId%3D32%0A'
        const params = new Url.URLParams(urlString)
        let temp = 'url=http%3A%2F%2Ftest-aweme.snssdk.com%2Ffalcon%2Fjsb_tester_web%2Fdmt%2F%3FcaseId%3D%26' +
            'groupId%3D1379%26author%3Dliuhongyang.lhoin%26authorId%3D1951227%26isAutoTest%3D%26productionId%3D32%0A'
        expect(params.toString()).assertEqual(temp)
        let srcKey = 'url';
        let srcValue = 'http://test-aweme.snssdk.com/falcon/jsb_tester_web/dmt/?caseId=&groupId=1379&author=' +
        'liuhongyang.lhoin&authorId=1951227&isAutoTest=&productionId=32\n';
        params.forEach((value, key) => {
        expect(key).assertEqual(srcKey)
        expect(value).assertEqual(srcValue)
        })
        for (const param of params.entries()) {
        expect(param[0]).assertEqual(srcKey)
        expect(param[1]).assertEqual(srcValue)
        }
    })

    /**
     * @tc.name   testUrlparseURL0040
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_30600
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let urlString = '?url='
        const params = new Url.URLParams(urlString)
        expect(params.toString()).assertEqual('url=')
        for (const param of params.entries()) {
            expect(param[0]).assertEqual('url')
            expect(param[1]).assertEqual('')
        }
    })

    /**
     * @tc.name   testUrlparseURL0041
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_30700
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const u2 = Url.URL.parseURL(`https://a.cn?phone=%2B86`)
        const phone2 = u2.params.get('phone')
        expect(u2.params.toString()).assertEqual('phone=%2B86')
        expect(phone2.toString()).assertEqual('+86')
    })

    /**
     * @tc.name   testUrlparseURL0042
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_30800
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const u2 = Url.URL.parseURL(`https://a.cn?phone=%2B86+9`)
        const phone2 = u2.params.get('phone')
        expect(u2.params.toString()).assertEqual('phone=%2B86+9')
        expect(phone2.toString()).assertEqual('+86 9')
    })

    /**
     * @tc.name   testUrlparseURL0043
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_30900
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uu = Url.URL.parseURL('http://www.baidu.com/sajd中文测试/aa?xx=%26');
        let res = 'http://www.baidu.com/sajd%E4%B8%AD%E6%96%87%E6%B5%8B%E8%AF%95/aa?xx=%26';
        expect(uu.toString()).assertEqual(res);
    })

    /**
     * @tc.name   testUrlparseURL0044
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_31000
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uu = Url.URL.parseURL('http://www.baidu.com/sajd中文测试/aa?xx=%26%7D');
        let res = 'http://www.baidu.com/sajd%E4%B8%AD%E6%96%87%E6%B5%8B%E8%AF%95/aa?xx=%26%7D';
        let uu2 = Url.URL.parseURL(uu.toString());
        expect(uu2.toString()).assertEqual(res);
    })

    /**
     * @tc.name   testUrlparseURL0045
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_31100
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let uu = Url.URL.parseURL('http://www.baidu.com/sajd中文测试/aa?xx=%26优优');
      let uu2 = Url.URL.parseURL(uu.toString());
      let res = 'http://www.baidu.com/sajd%E4%B8%AD%E6%96%87%E6%B5%8B%E8%AF%95/aa?xx=%26优优';
      expect(uu2.toString()).assertEqual(res);
      expect(uu2.pathname).assertEqual('/sajd%E4%B8%AD%E6%96%87%E6%B5%8B%E8%AF%95/aa');
      expect(uu2.params.get('xx')).assertEqual('&优优');
    })

    /**
     * @tc.name   testUrlparseURL0046
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_31200
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let uu = Url.URL.parseURL('http://www.baidu.com/sajd%E4%B8%AD%E6%96%87%E6%B5%8B%E8%AF%95/aa?xx=%26优优');
      let uu2 = Url.URL.parseURL(uu.toString());
      let res = 'http://www.baidu.com/sajd%E4%B8%AD%E6%96%87%E6%B5%8B%E8%AF%95/aa?xx=%26优优';
      expect(uu2.toString()).assertEqual(res);
    })

    /**
     * @tc.name   testUrlparseURL0047
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_31300
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let uu = Url.URL.parseURL('http://www.baidu.com/sajd/aa#xx=%26优优');
      let res = 'http://www.baidu.com/sajd/aa#xx=%26%E4%BC%98%E4%BC%98';
      expect(uu.toString()).assertEqual(res);
    })

    /**
     * @tc.name   testUrlparseURL0048
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_31400
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let uu = Url.URL.parseURL('http://www.baidu.com/sajd中文测试/aa?xx=%26优优');
      let uu2 = Url.URL.parseURL(uu.toString());
      let res = 'http://www.baidu.com/sajd%E4%B8%AD%E6%96%87%E6%B5%8B%E8%AF%95/aa?xx=%26优优';
      expect(uu2.toString()).assertEqual(res);
      expect(uu2.pathname).assertEqual('/sajd%E4%B8%AD%E6%96%87%E6%B5%8B%E8%AF%95/aa');
      expect(uu2.params.get('xx')).assertEqual('&优优');
    })

    /**
     * @tc.name   testUrlparseURL0049
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_31500
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let uu = Url.URL.parseURL('http://k中%:ss8@www.baidu.com/s#a%jd中文测试q/aa?xx=%26%E4%B8%AD');
      let res = 'http://k%E4%B8%AD%:ss8@www.baidu.com/s#a%jd%E4%B8%AD%E6%96%87%E6%B5%8B%E8%AF%95q/aa?xx=%26%E4%B8%AD';
      expect(uu.toString()).assertEqual(res);
    })

    /**
     * @tc.name   testUrlparseURL0050
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_31600
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let uu = Url.URL.parseURL('http://k中%:ss8@www.baidu.com/s#a%jd中文测试q/aa?xx=%26%E4%B8%AD');
      expect(uu.params.get('xx')).assertEqual(undefined);
    })

    /**
     * @tc.name   testUrlparseURL0051
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_31700
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let uu = Url.URL.parseURL('http://k中%:ss8@www.baidu.com/s#a%jd中文测试q/aa?xx=%26%E4%B8%AD');
      let uu2 = Url.URL.parseURL(uu.toString());
      let res = 'http://www.baidu.com/sajd%E4%B8%AD%E6%96%87%E6%B5%8B%E8%AF%95/aa?xx=%26优优';
      expect(uu2.pathname).assertEqual('/s');
      uu2.pathname = '/sa%jd%E4%B8%AD%E6%96%87%E6%B5%8B%E8%AF%95q/aa优'
      expect(uu2.pathname).assertEqual('/sa%jd%E4%B8%AD%E6%96%87%E6%B5%8B%E8%AF%95q/aa%E4%BC%98');
    })

    /**
     * @tc.name   testUrlparseURL0052
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_31800
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let uu = Url.URL.parseURL('http://k中%:ss8@www.baidu.com/s#a%jd中文测试q/aa?xx=%26%E4%B8%AD');
      let yy = uu.toString();
      let uu2 = Url.URL.parseURL(yy);
      expect(uu2.username).assertEqual('k%E4%B8%AD%');
    })

    /**
     * @tc.name   testUrlparseURL0053
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_31900
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let uu = Url.URL.parseURL('http://www.baidu.com/sajd中文测试/aa?xx=%26优优');
      let uu2 = Url.URL.parseURL(uu.toString());
      let res = 'http://www.baidu.com/sajd%E4%B8%AD%E6%96%87%E6%B5%8B%E8%AF%95/aa?xx=%26优优';
      expect(uu2.toString()).assertEqual(res);
      expect(uu2.pathname).assertEqual('/sajd%E4%B8%AD%E6%96%87%E6%B5%8B%E8%AF%95/aa');
      expect(uu2.params.get('xx')).assertEqual('&优优');
    })

    /**
     * @tc.name   testUrlparseURL0054
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_32000
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let objectParams = new Url.URLParams("?a%20b=a&a%2Bb=a1");
      let objectParams1 = new Url.URLParams(objectParams);
      let str = objectParams1.toString();
      let res = 'a+b=a&a%2Bb=a1';
      expect(str).assertEqual(res);
      objectParams1.append('a+b', 'b2');
      objectParams1.append('a b', 'b2');
      expect(objectParams1.toString()).assertEqual('a+b=a&a%2Bb=a1&a%2Bb=b2&a+b=b2');
    })

    /**
     * @tc.name   testUrlparseURL0055
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_32100
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let objectParams = new Url.URLParams();
      objectParams.set('a b', 'c3');
      objectParams.set('a+b', 'c3');
      expect(objectParams.toString()).assertEqual('a+b=c3&a%2Bb=c3');
    })

    /**
     * @tc.name   testUrlparseURL0056
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_32200
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let objectParams = new Url.URLParams('1=3&1=6');
      objectParams.append('a b', 'abc1');
      objectParams.append('a&b', 'abc2');
      objectParams.append('a+b', 'abc3');
      objectParams.append('a+b', 'abc4');
      objectParams.sort();
      expect(objectParams.toString()).assertEqual('1=3&1=6&a+b=abc1&a%26b=abc2&a%2Bb=abc3&a%2Bb=abc4');
    })

    /**
     * @tc.name   testUrlparseURL0057
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_32300
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let objectParams = new Url.URLParams('?key=first2');
      objectParams.append('a&b', 'abc大2');
      objectParams.append('a+b', 'abc大2');
      objectParams.append('a b', 'abc大2');
      let res = 'key=first2&a%26b=abc%E5%A4%A72&a%2Bb=abc%E5%A4%A72&a+b=abc%E5%A4%A72';
      expect(objectParams.has('a&b')).assertTrue();
      expect(objectParams.has('a%26b')).assertFalse();
      expect(objectParams.toString()).assertEqual(res);
      expect(objectParams.get('a&b')).assertEqual('abc大2');
      expect(objectParams.get('a%26b')).assertEqual(undefined);
    })

    /**
     * @tc.name   testUrlparseURL0058
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_32400
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      const objectParams = new Url.URLParams('key=a   b   c');
      expect(objectParams.toString()).assertEqual('key=a+++b+++c');
      objectParams.append('key1', 'd   e   f');
      expect(objectParams.toString()).assertEqual('key=a+++b+++c&key1=d+++e+++f');
    })

    /**
     * @tc.name   testUrlparseURL0059
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_32500
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      const objectParams = new Url.URLParams('key=a%20b %3D%2Bc++=p%26p%25%E5%A4%A7');
      expect(objectParams.toString()).assertEqual('key=a+b+%3D%2Bc++%3Dp%26p%25%E5%A4%A7');
      expect(objectParams.get('key')).assertEqual('a b =+c  =p&p%大');
      objectParams.append('key1', 'a%20b%3D%2Bc+=%');
      let res = 'key=a+b+%3D%2Bc++%3Dp%26p%25%E5%A4%A7&key1=a%2520b%253D%252Bc%2B%3D%25';
      expect(objectParams.toString()).assertEqual(res);
      expect(objectParams.get('key1')).assertEqual('a%20b%3D%2Bc+=%');
    })

    /**
     * @tc.name   testUrlparseURL0060
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_32600
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      const object = Url.URL.parseURL('https://sssw.dasf?key=a%20b %3D%2Bc++=p%26p%25%E5%A4%A7!()~{}[]%大');
      let res = 'key=a+b+%3D%2Bc++%3Dp%26p%25%E5%A4%A7%21%28%29%7E%7B%7D%5B%5D%25%E5%A4%A7';
      expect(object.params.toString()).assertEqual(res);
      expect(object.params.get('key')).assertEqual('a b =+c  =p&p%大!()~{}[]%大');
      object.params.delete('');
      for(let tiem of object.params.entries()){
        expect(tiem[0]).assertEqual('key');
        expect(tiem[1]).assertEqual('a b =+c  =p&p%大!()~{}[]%大');
      }
    })

    /**
     * @tc.name   testUrlparseURL0061
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_32700
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const object = Url.URL.parseURL('https://sssw.dasf');
        object.params.sort();
        expect(object.params.toString()).assertEqual('');
    })

    /**
     * @tc.name   testUrlparseURL0062
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_32800
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const object = Url.URL.parseURL('https://sssw.dasf?9995=sss');
        object.params.sort();
        expect(object.params.toString()).assertEqual('9995=sss');
    })

    /**
     * @tc.name   testUrlparseURL0063
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_32900
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const object = new Url.URLParams('key2=val&key')
        object.sort();
        expect(object.toString()).assertEqual('key=&key2=val');
    })

    /**
     * @tc.name   testUrlparseURL0064
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_33000
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const object = new Url.URLSearchParams('')
        object.sort();
        expect(object.toString()).assertEqual('');
        object.append('ket2', 'sc');
        object.append('e%t2', 's@c');
        object.sort();
        expect(object.toString()).assertEqual('e%25t2=s%40c&ket2=sc');
    })

    /**
     * @tc.name   testUrlparseURL0065
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_33100
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const object = Url.URL.parseURL('https://sssw.dasf?key2=val&key');
        object.params.sort();
        expect(object.toString()).assertEqual('https://sssw.dasf/?key=&key2=val');
        object.params.delete('key2')
        object.params.delete('key')
        object.params.sort();
        expect(object.toString()).assertEqual('https://sssw.dasf/');
    })

    /**
     * @tc.name   testUrlparseURL0066
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_33200
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const object = Url.URL.parseURL('https://www.test.com/path?query#fagmengt😀');
        expect(object.toString()).assertEqual('https://www.test.com/path?query#fagmengt%F0%9F%98%80');
    })

    /**
     * @tc.name   testUrlparseURL0067
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_33300
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const object = Url.URL.parseURL('https://www.test.com/path?query#fagme🆒ngt😀');
        expect(object.toString()).assertEqual('https://www.test.com/path?query#fagme%F0%9F%86%92ngt%F0%9F%98%80');
    })

    /**
     * @tc.name   testUrlparseURL0068
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_33400
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const object = Url.URL.parseURL('https://www.test.com/p🤣at看ヾ(≧▽≦*)oh?query#fagmengt');
        let str = 'https://www.test.com/p%F0%9F%A4%A3at%E7%9C' +
                '%8B%E3%83%BE(%E2%89%A7%E2%96%BD%E2%89%A6*)oh?query#fagmengt';
        expect(object.toString()).assertEqual(str);
    })

    /**
     * @tc.name   testUrlparseURL0069
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_33500
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const object = Url.URL.parseURL('https://us啊🌹er:pass@www.test.com/patoh?query#fagmengt');
        let str = 'https://us%E5%95%8A%F0%9F%8C%B9er:pass@www.test.com/patoh?query#fagmengt';
        expect(object.toString()).assertEqual(str);
    })

    /**
     * @tc.name   testUrlparseURL0070
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_33600
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const object = Url.URL.parseURL('https://www.test.com/patoh?query#fagmengt');
        object.search = '?keyName-%E4%B8%AD&key2=%[ ]^|';
        expect(object.search).assertEqual('?keyName-%E4%B8%AD&key2=%[%20]^|');
    })

    /**
     * @tc.name   testUrlparseURL0071
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_33700
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const object = Url.URL.parseURL('https://www.test.com/patoh?query#fagmengt');
        object.search = 'key=中文%7B{'
        expect(object.search).assertEqual('?key=%E4%B8%AD%E6%96%87%7B{');
    })

    /**
     * @tc.name   testUrlparseURL0072
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_33800
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const object = Url.URL.parseURL('https://www.test.com/patoh?query#fagmengt');
        object.search = 'key=%7B{}]%3B'
        expect(object.search).assertEqual('?key=%7B{}]%3B');
    })

    /**
     * @tc.name   testUrlparseURL0073
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_33900
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const object = Url.URL.parseURL('https://www.test.com/patoh?query#fagmengt');
        object.search = '%7C|%5B[%5D]%5E^%7B{%7D}%60`%25%';
        expect(object.search).assertEqual('?%7C|%5B[%5D]%5E^%7B{%7D}%60`%25%');
    })

    /**
     * @tc.name   testUrlparseURL0074
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_34000
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const object = Url.URL.parseURL('https://www.test.com/patoh?query#fagmengt');
        object.search = '%7C|%5B[%5D]%5E^%7B{%7D}%60`%25%';
        expect(object.params.toString()).assertEqual('%7C%7C%5B%5B%5D%5D%5E%5E%7B%7B%7D%7D%60%60%25%25=');
    })

    /**
     * @tc.name   testUrlparseURL0075
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_34100
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const object = Url.URL.parseURL('https://www.test.com/patoh?query=unicode\ud83d#fagmengt');
        expect(object.params.toString()).assertEqual('query=unicode%EF%BF%BD');
    })

    /**
     * @tc.name   testUrlparseURL0076
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_34200
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const paramsObj = new Url.URLParams('\uDC00s');
        expect(paramsObj.toString()).assertEqual('%EF%BF%BDs=');
    })

    /**
     * @tc.name   testUrlparseURL0077
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_34300
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const paramsObj = new Url.URLParams('key=%F0%9F%98%80s');
        expect(paramsObj.get('key')).assertEqual('😀s')
    })

    /**
     * @tc.name   testUrlparseURL0078
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_34400
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const object = Url.URL.parseURL('https://www.test.com/patoh?query#fagmengt\ud83d');
        expect(object.hash).assertEqual('#fagmengt%EF%BF%BD');
    })

    /**
     * @tc.name   testUrlparseURL0079
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_34500
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const object = Url.URL.parseURL('https://www.test.com/patoh\ude01?query#fagmengt');
        expect(object.pathname).assertEqual('/patoh%EF%BF%BD');
    })

    /**
     * @tc.name   testUrlparseURL0080
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_34600
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const paramsObj = new Url.URLParams('测试非法字符输入\ude51用例');
        let res = '%E6%B5%8B%E8%AF%95%E9%9D%9E%E6%B3%95%E5%AD%97%E7%AC%A6%E8%BE%93%E5%85%A5%EF%BF%BD%E7%94%A8%E4%BE%8B=';
        expect(paramsObj.toString()).assertEqual(res);
    })

    /**
     * @tc.name   testUrlparseURL0081
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_34700
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const paramsObj = new Url.URLParams('key=value');
        paramsObj.append('key1', '\uD800abc')
        expect(paramsObj.toString()).assertEqual('key=value&key1=%EF%BF%BDabc');
    })

    /**
     * @tc.name   testUrlparseURL0082
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_34800
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let str = "ftp:!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ \\[]"
            + "^_`abcdefghijklmnopqrstuvwxyz{|}~€‚ƒ„…†‡ˆ‰Š‹ŒŽ‘’“”•–—˜™š›œžŸ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸"
            + "¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ";
        let object =  Url.URL.parseURL(str);
        const urlEncode = "ftp://!%22/#$%&'()*+,-./0123456789:;%3C=%3E?@ABCDEFGHIJKLMNOPQRSTUVWXYZ%20%5C[]%5E_"
            + "`abcdefghijklmnopqrstuvwxyz{|}~%E2%82%AC%E2%80%9A%C6%92%E2%80%9E%E2%80%A6%E2%80%A0%E2%80%A1"
            + "%CB%86%E2%80%B0%C5%A0%E2%80%B9%C5%92%C5%BD%E2%80%98%E2%80%99%E2%80%9C%E2%80%9D%E2%80%A2%E2"
            + "%80%93%E2%80%94%CB%9C%E2%84%A2%C5%A1%E2%80%BA%C5%93%C5%BE%C5%B8%C2%A1%C2%A2%C2%A3%C2%A4%C2"
            + "%A5%C2%A6%C2%A7%C2%A8%C2%A9%C2%AA%C2%AB%C2%AC%C2%AD%C2%AE%C2%AF%C2%B0%C2%B1%C2%B2%C2%B3%C2"
            + "%B4%C2%B5%C2%B6%C2%B7%C2%B8%C2%B9%C2%BA%C2%BB%C2%BC%C2%BD%C2%BE%C2%BF%C3%80%C3%81%C3%82%C3"
            + "%83%C3%84%C3%85%C3%86%C3%87%C3%88%C3%89%C3%8A%C3%8B%C3%8C%C3%8D%C3%8E%C3%8F%C3%90%C3%91%C3"
            + "%92%C3%93%C3%94%C3%95%C3%96%C3%97%C3%98%C3%99%C3%9A%C3%9B%C3%9C%C3%9D%C3%9E%C3%9F%C3%A0%C3"
            + "%A1%C3%A2%C3%A3%C3%A4%C3%A5%C3%A6%C3%A7%C3%A8%C3%A9%C3%AA%C3%AB%C3%AC%C3%AD%C3%AE%C3%AF%C3"
            + "%B0%C3%B1%C3%B2%C3%B3%C3%B4%C3%B5%C3%B6%C3%B7%C3%B8%C3%B9%C3%BA%C3%BB%C3%BC%C3%BD%C3%BE%C3%BF";
        expect(object.toString()).assertEqual(urlEncode);
    })

    /**
     * @tc.name   testUrlparseURL0083
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_34900
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const object = Url.URL.parseURL('patoh\ude01?query#fagmengt','https://www.test.com\ude01');
        expect(object.toString()).assertEqual('https://www.test.com%EF%BF%BD/patoh%EF%BF%BD?query#fagmengt');
    })

    /**
     * @tc.name   testUrlparseURL0084
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_35000
     * @tc.desc   URL constructor, which is used to instantiate a URL object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlparseURL0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        const object = new Url.URL('patoh\ude01?query#fagmengt','https://www.test.com\ude01');
        expect(object.toString()).assertEqual('https://www.test.com%EF%BF%BD/patoh%EF%BF%BD?query#fagmengt');
    })

    /**
     * @tc.name   testUrlHost006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_35100
     * @tc.desc   Gets and sets the host portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHost006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let str = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ\\[]^_`abcdefghijklmnopqrstuv"
            + "wxyz{|}~€‚ƒ„…†‡ˆ‰Š‹ŒŽ‘’“”•–—˜™š›œžŸ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝ"
            + "Þßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ"
        let params = new Url.URL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        params.host = str
        expect(params.host).assertEqual('host:8080')
    })

    /**
     * @tc.name   testUrlHostname006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_35200
     * @tc.desc   Gets and sets the host name portion of the URL，not include the port.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHostname006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let str = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ\\[]^_`abcdefghijklmnopqrstuv"
            + "wxyz{|}~€‚ƒ„…†‡ˆ‰Š‹ŒŽ‘’“”•–—˜™š›œžŸ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝ"
            + "Þßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ"
        let params = new Url.URL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        params.hostname = str
        expect(params.hostname).assertEqual('host')
    })

    /**
     * @tc.name   testUrlPort006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_35300
     * @tc.desc   Gets and sets the port portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlPort006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let str = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ\\[]^_`abcdefghijklmnopqrstuv"
            + "wxyz{|}~€‚ƒ„…†‡ˆ‰Š‹ŒŽ‘’“”•–—˜™š›œžŸ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝ"
            + "Þßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ"
        let params = new Url.URL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        params.port = str
        expect(params.port).assertEqual('8080')
    })

    /**
     * @tc.name   testUrlProtocol006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_35400
     * @tc.desc   Gets and sets the protocol portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlProtocol006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let str = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ\\[]^_`abcdefghijklmnopqrstuv"
            + "wxyz{|}~€‚ƒ„…†‡ˆ‰Š‹ŒŽ‘’“”•–—˜™š›œžŸ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝ"
            + "Þßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ"
        let params = new Url.URL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        params.protocol = str
        expect(params.protocol).assertEqual('http:')
    })

    /**
     * @tc.name   testUrlOrigin006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_35500
     * @tc.desc   Gets and sets the host portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlOrigin006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let str = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ\\[]^_`abcdefghijklmnopqrstuv"
            + "wxyz{|}~€‚ƒ„…†‡ˆ‰Š‹ŒŽ‘’“”•–—˜™š›œžŸ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝ"
            + "Þßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ"
        let params = new Url.URL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        params.host = str;
        params.port = str;
        expect(params.origin).assertEqual('http://host:8080')
    })

    /**
     * @tc.name   testUrlUsername006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_35600
     * @tc.desc   Gets and sets the username portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlUsername006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let str = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ\\[]"
            + "^_`abcdefghijklmnopqrstuvwxyz{|}~€‚ƒ„…†‡ˆ‰Š‹ŒŽ‘’“”•–—˜™š›œžŸ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸"
            + "¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ";
        let object = Url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        const userinfoEncode = "%20!%22%23$%&'()*+,-.%2F0123456789%3A%3B%3C%3D%3E%3F%40ABCDEFGHIJKLMNOPQRSTUVWXYZ%5C"
            + "%5B%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~%E2%82%AC%E2%80%9A%C6%92%E2%80%9E%E2%80%A6%E2%80%A0"
            + "%E2%80%A1%CB%86%E2%80%B0%C5%A0%E2%80%B9%C5%92%C5%BD%E2%80%98%E2%80%99%E2%80%9C%E2%80%9D%E2%80%A2%E2"
            + "%80%93%E2%80%94%CB%9C%E2%84%A2%C5%A1%E2%80%BA%C5%93%C5%BE%C5%B8%C2%A1%C2%A2%C2%A3%C2%A4%C2%A5%C2%A6"
            + "%C2%A7%C2%A8%C2%A9%C2%AA%C2%AB%C2%AC%C2%AD%C2%AE%C2%AF%C2%B0%C2%B1%C2%B2%C2%B3%C2%B4%C2%B5%C2%B6%C2"
            + "%B7%C2%B8%C2%B9%C2%BA%C2%BB%C2%BC%C2%BD%C2%BE%C2%BF%C3%80%C3%81%C3%82%C3%83%C3%84%C3%85%C3%86%C3%87"
            + "%C3%88%C3%89%C3%8A%C3%8B%C3%8C%C3%8D%C3%8E%C3%8F%C3%90%C3%91%C3%92%C3%93%C3%94%C3%95%C3%96%C3%97%C3"
            + "%98%C3%99%C3%9A%C3%9B%C3%9C%C3%9D%C3%9E%C3%9F%C3%A0%C3%A1%C3%A2%C3%A3%C3%A4%C3%A5%C3%A6%C3%A7%C3%A8"
            + "%C3%A9%C3%AA%C3%AB%C3%AC%C3%AD%C3%AE%C3%AF%C3%B0%C3%B1%C3%B2%C3%B3%C3%B4%C3%B5%C3%B6%C3%B7%C3%B8%C3"
            + "%B9%C3%BA%C3%BB%C3%BC%C3%BD%C3%BE%C3%BF";
        object.username = str;
        expect(object.username).assertEqual(userinfoEncode);
        object.username = userinfoEncode;
        expect(object.username).assertEqual(userinfoEncode);
    })

    /**
     * @tc.name   testUrlPassword006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_35700
     * @tc.desc   Gets and sets the password portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlPassword006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let str = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ\\[]"
            + "^_`abcdefghijklmnopqrstuvwxyz{|}~€‚ƒ„…†‡ˆ‰Š‹ŒŽ‘’“”•–—˜™š›œžŸ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸"
            + "¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ";
        let object = Url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        const userinfoEncode = "%20!%22%23$%&'()*+,-.%2F0123456789%3A%3B%3C%3D%3E%3F%40ABCDEFGHIJKLMNOPQRSTUVWXYZ%5C"
            + "%5B%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~%E2%82%AC%E2%80%9A%C6%92%E2%80%9E%E2%80%A6%E2%80%A0"
            + "%E2%80%A1%CB%86%E2%80%B0%C5%A0%E2%80%B9%C5%92%C5%BD%E2%80%98%E2%80%99%E2%80%9C%E2%80%9D%E2%80%A2%E2"
            + "%80%93%E2%80%94%CB%9C%E2%84%A2%C5%A1%E2%80%BA%C5%93%C5%BE%C5%B8%C2%A1%C2%A2%C2%A3%C2%A4%C2%A5%C2%A6"
            + "%C2%A7%C2%A8%C2%A9%C2%AA%C2%AB%C2%AC%C2%AD%C2%AE%C2%AF%C2%B0%C2%B1%C2%B2%C2%B3%C2%B4%C2%B5%C2%B6%C2"
            + "%B7%C2%B8%C2%B9%C2%BA%C2%BB%C2%BC%C2%BD%C2%BE%C2%BF%C3%80%C3%81%C3%82%C3%83%C3%84%C3%85%C3%86%C3%87"
            + "%C3%88%C3%89%C3%8A%C3%8B%C3%8C%C3%8D%C3%8E%C3%8F%C3%90%C3%91%C3%92%C3%93%C3%94%C3%95%C3%96%C3%97%C3"
            + "%98%C3%99%C3%9A%C3%9B%C3%9C%C3%9D%C3%9E%C3%9F%C3%A0%C3%A1%C3%A2%C3%A3%C3%A4%C3%A5%C3%A6%C3%A7%C3%A8"
            + "%C3%A9%C3%AA%C3%AB%C3%AC%C3%AD%C3%AE%C3%AF%C3%B0%C3%B1%C3%B2%C3%B3%C3%B4%C3%B5%C3%B6%C3%B7%C3%B8%C3"
            + "%B9%C3%BA%C3%BB%C3%BC%C3%BD%C3%BE%C3%BF";
        object.password = str;
        expect(object.password).assertEqual(userinfoEncode);
        object.password = userinfoEncode;
        expect(object.password).assertEqual(userinfoEncode);
    })

    /**
     * @tc.name   testUrlPathname006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_35800
     * @tc.desc   URL set pathname and get pathname.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlPathname006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let str = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ\\[]"
            + "^_`abcdefghijklmnopqrstuvwxyz{|}~€‚ƒ„…†‡ˆ‰Š‹ŒŽ‘’“”•–—˜™š›œžŸ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸"
            + "¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ";
        let object = Url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        const pathnameEncode = "/%20!%22#$%&'()*+,-./0123456789:;%3C=%3E?@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5C[]%5E_%60abcde"
            + "fghijklmnopqrstuvwxyz%7B|%7D~%E2%82%AC%E2%80%9A%C6%92%E2%80%9E%E2%80%A6%E2%80%A0%E2%80%A1%CB%86%E2%80"
            + "%B0%C5%A0%E2%80%B9%C5%92%C5%BD%E2%80%98%E2%80%99%E2%80%9C%E2%80%9D%E2%80%A2%E2%80%93%E2%80%94%CB%9C%E2"
            + "%84%A2%C5%A1%E2%80%BA%C5%93%C5%BE%C5%B8%C2%A1%C2%A2%C2%A3%C2%A4%C2%A5%C2%A6%C2%A7%C2%A8%C2%A9%C2%AA%C2"
            + "%AB%C2%AC%C2%AD%C2%AE%C2%AF%C2%B0%C2%B1%C2%B2%C2%B3%C2%B4%C2%B5%C2%B6%C2%B7%C2%B8%C2%B9%C2%BA%C2%BB%C2"
            + "%BC%C2%BD%C2%BE%C2%BF%C3%80%C3%81%C3%82%C3%83%C3%84%C3%85%C3%86%C3%87%C3%88%C3%89%C3%8A%C3%8B%C3%8C%C3"
            + "%8D%C3%8E%C3%8F%C3%90%C3%91%C3%92%C3%93%C3%94%C3%95%C3%96%C3%97%C3%98%C3%99%C3%9A%C3%9B%C3%9C%C3%9D%C3"
            + "%9E%C3%9F%C3%A0%C3%A1%C3%A2%C3%A3%C3%A4%C3%A5%C3%A6%C3%A7%C3%A8%C3%A9%C3%AA%C3%AB%C3%AC%C3%AD%C3%AE%C3"
            + "%AF%C3%B0%C3%B1%C3%B2%C3%B3%C3%B4%C3%B5%C3%B6%C3%B7%C3%B8%C3%B9%C3%BA%C3%BB%C3%BC%C3%BD%C3%BE%C3%BF";
        object.pathname = str;
        expect(object.pathname).assertEqual(pathnameEncode);
        object.pathname = pathnameEncode;
        expect(object.pathname).assertEqual(pathnameEncode);
    })

    /**
     * @tc.name   testUrlHash006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_35900
     * @tc.desc   Gets and sets the fragment portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHash006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let str = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ\\[]"
            + "^_`abcdefghijklmnopqrstuvwxyz{|}~€‚ƒ„…†‡ˆ‰Š‹ŒŽ‘’“”•–—˜™š›œžŸ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸"
            + "¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ";
        let object = Url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        const hashEncode = "#%20!%22#$%&'()*+,-./0123456789:;%3C=%3E?@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5C[]%5E_`abcdefghij"
            + "klmnopqrstuvwxyz{|}~%E2%82%AC%E2%80%9A%C6%92%E2%80%9E%E2%80%A6%E2%80%A0%E2%80%A1%CB%86%E2%80%B0%C5%A0"
            + "%E2%80%B9%C5%92%C5%BD%E2%80%98%E2%80%99%E2%80%9C%E2%80%9D%E2%80%A2%E2%80%93%E2%80%94%CB%9C%E2%84%A2%C5"
            + "%A1%E2%80%BA%C5%93%C5%BE%C5%B8%C2%A1%C2%A2%C2%A3%C2%A4%C2%A5%C2%A6%C2%A7%C2%A8%C2%A9%C2%AA%C2%AB%C2%AC"
            + "%C2%AD%C2%AE%C2%AF%C2%B0%C2%B1%C2%B2%C2%B3%C2%B4%C2%B5%C2%B6%C2%B7%C2%B8%C2%B9%C2%BA%C2%BB%C2%BC%C2%BD"
            + "%C2%BE%C2%BF%C3%80%C3%81%C3%82%C3%83%C3%84%C3%85%C3%86%C3%87%C3%88%C3%89%C3%8A%C3%8B%C3%8C%C3%8D%C3%8E"
            + "%C3%8F%C3%90%C3%91%C3%92%C3%93%C3%94%C3%95%C3%96%C3%97%C3%98%C3%99%C3%9A%C3%9B%C3%9C%C3%9D%C3%9E%C3%9F"
            + "%C3%A0%C3%A1%C3%A2%C3%A3%C3%A4%C3%A5%C3%A6%C3%A7%C3%A8%C3%A9%C3%AA%C3%AB%C3%AC%C3%AD%C3%AE%C3%AF%C3%B0"
            + "%C3%B1%C3%B2%C3%B3%C3%B4%C3%B5%C3%B6%C3%B7%C3%B8%C3%B9%C3%BA%C3%BB%C3%BC%C3%BD%C3%BE%C3%BF";
        object.hash = str;
        expect(object.hash).assertEqual(hashEncode);
        object.hash = hashEncode;
        expect(object.hash).assertEqual(hashEncode);
    })

    /**
     * @tc.name   testUrlSearch006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_36000
     * @tc.desc   Gets and sets the serialized query portion of the URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlSearch006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let str = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ\\[]"
            + "^_`abcdefghijklmnopqrstuvwxyz{|}~€‚ƒ„…†‡ˆ‰Š‹ŒŽ‘’“”•–—˜™š›œžŸ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸"
            + "¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ";
        const queryEncode = "?%20!%22%23$%&'()*+,-./0123456789:;%3C=%3E?@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5C[]^_`abcdefgh"
            + "ijklmnopqrstuvwxyz{|}~%E2%82%AC%E2%80%9A%C6%92%E2%80%9E%E2%80%A6%E2%80%A0%E2%80%A1%CB%86%E2%80%B0%C5"
            + "%A0%E2%80%B9%C5%92%C5%BD%E2%80%98%E2%80%99%E2%80%9C%E2%80%9D%E2%80%A2%E2%80%93%E2%80%94%CB%9C%E2%84"
            + "%A2%C5%A1%E2%80%BA%C5%93%C5%BE%C5%B8%C2%A1%C2%A2%C2%A3%C2%A4%C2%A5%C2%A6%C2%A7%C2%A8%C2%A9%C2%AA%C2"
            + "%AB%C2%AC%C2%AD%C2%AE%C2%AF%C2%B0%C2%B1%C2%B2%C2%B3%C2%B4%C2%B5%C2%B6%C2%B7%C2%B8%C2%B9%C2%BA%C2%BB"
            + "%C2%BC%C2%BD%C2%BE%C2%BF%C3%80%C3%81%C3%82%C3%83%C3%84%C3%85%C3%86%C3%87%C3%88%C3%89%C3%8A%C3%8B%C3"
            + "%8C%C3%8D%C3%8E%C3%8F%C3%90%C3%91%C3%92%C3%93%C3%94%C3%95%C3%96%C3%97%C3%98%C3%99%C3%9A%C3%9B%C3%9C"
            + "%C3%9D%C3%9E%C3%9F%C3%A0%C3%A1%C3%A2%C3%A3%C3%A4%C3%A5%C3%A6%C3%A7%C3%A8%C3%A9%C3%AA%C3%AB%C3%AC%C3"
            + "%AD%C3%AE%C3%AF%C3%B0%C3%B1%C3%B2%C3%B3%C3%B4%C3%B5%C3%B6%C3%B7%C3%B8%C3%B9%C3%BA%C3%BB%C3%BC%C3%BD"
            + "%C3%BE%C3%BF";
        let object = Url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        object.search = str;
        expect(object.search).assertEqual(queryEncode);
        object.search = queryEncode;
        expect(object.search).assertEqual(queryEncode);
    })

     /**
      * @tc.name   testUrlSearchParams006
      * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_36100
      * @tc.desc   Gets the SearchParams portion of the URL.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('testUrlSearchParams006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let str = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ\\[]"
            + "^_`abcdefghijklmnopqrstuvwxyz{|}~€‚ƒ„…†‡ˆ‰Š‹ŒŽ‘’“”•–—˜™š›œžŸ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸"
            + "¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ";
        const queryEncode = "?%20!%22%23$%&'()*+,-./0123456789:;%3C=%3E?@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5C[]^_`abcdefgh"
            + "ijklmnopqrstuvwxyz{|}~%E2%82%AC%E2%80%9A%C6%92%E2%80%9E%E2%80%A6%E2%80%A0%E2%80%A1%CB%86%E2%80%B0%C5"
            + "%A0%E2%80%B9%C5%92%C5%BD%E2%80%98%E2%80%99%E2%80%9C%E2%80%9D%E2%80%A2%E2%80%93%E2%80%94%CB%9C%E2%84"
            + "%A2%C5%A1%E2%80%BA%C5%93%C5%BE%C5%B8%C2%A1%C2%A2%C2%A3%C2%A4%C2%A5%C2%A6%C2%A7%C2%A8%C2%A9%C2%AA%C2"
            + "%AB%C2%AC%C2%AD%C2%AE%C2%AF%C2%B0%C2%B1%C2%B2%C2%B3%C2%B4%C2%B5%C2%B6%C2%B7%C2%B8%C2%B9%C2%BA%C2%BB"
            + "%C2%BC%C2%BD%C2%BE%C2%BF%C3%80%C3%81%C3%82%C3%83%C3%84%C3%85%C3%86%C3%87%C3%88%C3%89%C3%8A%C3%8B%C3"
            + "%8C%C3%8D%C3%8E%C3%8F%C3%90%C3%91%C3%92%C3%93%C3%94%C3%95%C3%96%C3%97%C3%98%C3%99%C3%9A%C3%9B%C3%9C"
            + "%C3%9D%C3%9E%C3%9F%C3%A0%C3%A1%C3%A2%C3%A3%C3%A4%C3%A5%C3%A6%C3%A7%C3%A8%C3%A9%C3%AA%C3%AB%C3%AC%C3"
            + "%AD%C3%AE%C3%AF%C3%B0%C3%B1%C3%B2%C3%B3%C3%B4%C3%B5%C3%B6%C3%B7%C3%B8%C3%B9%C3%BA%C3%BB%C3%BC%C3%BD"
            + "%C3%BE%C3%BF";
        const searchParamEncode = "+%21%22%23%24%25=&%27%28%29*+%2C-.%2F0123456789%3A%3B%3C=%3E%3F%40ABCDEFGHIJKL"
            + "MNOPQRSTUVWXYZ%5C%5B%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D%7E%E2%82%AC%E2%80%9A%C6%92%E2%80"
            + "%9E%E2%80%A6%E2%80%A0%E2%80%A1%CB%86%E2%80%B0%C5%A0%E2%80%B9%C5%92%C5%BD%E2%80%98%E2%80%99%E2%80%9C"
            + "%E2%80%9D%E2%80%A2%E2%80%93%E2%80%94%CB%9C%E2%84%A2%C5%A1%E2%80%BA%C5%93%C5%BE%C5%B8%C2%A1%C2%A2%C2"
            + "%A3%C2%A4%C2%A5%C2%A6%C2%A7%C2%A8%C2%A9%C2%AA%C2%AB%C2%AC%C2%AD%C2%AE%C2%AF%C2%B0%C2%B1%C2%B2%C2%B3"
            + "%C2%B4%C2%B5%C2%B6%C2%B7%C2%B8%C2%B9%C2%BA%C2%BB%C2%BC%C2%BD%C2%BE%C2%BF%C3%80%C3%81%C3%82%C3%83%C3"
            + "%84%C3%85%C3%86%C3%87%C3%88%C3%89%C3%8A%C3%8B%C3%8C%C3%8D%C3%8E%C3%8F%C3%90%C3%91%C3%92%C3%93%C3%94"
            + "%C3%95%C3%96%C3%97%C3%98%C3%99%C3%9A%C3%9B%C3%9C%C3%9D%C3%9E%C3%9F%C3%A0%C3%A1%C3%A2%C3%A3%C3%A4%C3"
            + "%A5%C3%A6%C3%A7%C3%A8%C3%A9%C3%AA%C3%AB%C3%AC%C3%AD%C3%AE%C3%AF%C3%B0%C3%B1%C3%B2%C3%B3%C3%B4%C3%B5"
            + "%C3%B6%C3%B7%C3%B8%C3%B9%C3%BA%C3%BB%C3%BC%C3%BD%C3%BE%C3%BF";
        let object =  Url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        object.search = str;
        expect(object.searchParams.toString()).assertEqual(searchParamEncode);
        object.search = queryEncode;
        expect(object.searchParams.toString()).assertEqual(searchParamEncode);
    })

    /**
     * @tc.name   testParamsToString006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_36200
     * @tc.desc   Returns a query string suitable for use in a URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamsToString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let str = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ\\[]"
            + "^_`abcdefghijklmnopqrstuvwxyz{|}~€‚ƒ„…†‡ˆ‰Š‹ŒŽ‘’“”•–—˜™š›œžŸ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸"
            + "¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ";
        let  queryEncode = "?%20!%22%23$%&'()*+,-./0123456789:;%3C=%3E?@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5C[]^_`abcdefgh"
            + "ijklmnopqrstuvwxyz{|}~%E2%82%AC%E2%80%9A%C6%92%E2%80%9E%E2%80%A6%E2%80%A0%E2%80%A1%CB%86%E2%80%B0%C5"
            + "%A0%E2%80%B9%C5%92%C5%BD%E2%80%98%E2%80%99%E2%80%9C%E2%80%9D%E2%80%A2%E2%80%93%E2%80%94%CB%9C%E2%84"
            + "%A2%C5%A1%E2%80%BA%C5%93%C5%BE%C5%B8%C2%A1%C2%A2%C2%A3%C2%A4%C2%A5%C2%A6%C2%A7%C2%A8%C2%A9%C2%AA%C2"
            + "%AB%C2%AC%C2%AD%C2%AE%C2%AF%C2%B0%C2%B1%C2%B2%C2%B3%C2%B4%C2%B5%C2%B6%C2%B7%C2%B8%C2%B9%C2%BA%C2%BB"
            + "%C2%BC%C2%BD%C2%BE%C2%BF%C3%80%C3%81%C3%82%C3%83%C3%84%C3%85%C3%86%C3%87%C3%88%C3%89%C3%8A%C3%8B%C3"
            + "%8C%C3%8D%C3%8E%C3%8F%C3%90%C3%91%C3%92%C3%93%C3%94%C3%95%C3%96%C3%97%C3%98%C3%99%C3%9A%C3%9B%C3%9C"
            + "%C3%9D%C3%9E%C3%9F%C3%A0%C3%A1%C3%A2%C3%A3%C3%A4%C3%A5%C3%A6%C3%A7%C3%A8%C3%A9%C3%AA%C3%AB%C3%AC%C3"
            + "%AD%C3%AE%C3%AF%C3%B0%C3%B1%C3%B2%C3%B3%C3%B4%C3%B5%C3%B6%C3%B7%C3%B8%C3%B9%C3%BA%C3%BB%C3%BC%C3%BD"
            + "%C3%BE%C3%BF";
        let searchParamEncode = "+%21%22%23%24%25=&%27%28%29*+%2C-.%2F0123456789%3A%3B%3C=%3E%3F%40ABCDEFGHIJKL"
            + "MNOPQRSTUVWXYZ%5C%5B%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D%7E%E2%82%AC%E2%80%9A%C6%92%E2%80"
            + "%9E%E2%80%A6%E2%80%A0%E2%80%A1%CB%86%E2%80%B0%C5%A0%E2%80%B9%C5%92%C5%BD%E2%80%98%E2%80%99%E2%80%9C"
            + "%E2%80%9D%E2%80%A2%E2%80%93%E2%80%94%CB%9C%E2%84%A2%C5%A1%E2%80%BA%C5%93%C5%BE%C5%B8%C2%A1%C2%A2%C2"
            + "%A3%C2%A4%C2%A5%C2%A6%C2%A7%C2%A8%C2%A9%C2%AA%C2%AB%C2%AC%C2%AD%C2%AE%C2%AF%C2%B0%C2%B1%C2%B2%C2%B3"
            + "%C2%B4%C2%B5%C2%B6%C2%B7%C2%B8%C2%B9%C2%BA%C2%BB%C2%BC%C2%BD%C2%BE%C2%BF%C3%80%C3%81%C3%82%C3%83%C3"
            + "%84%C3%85%C3%86%C3%87%C3%88%C3%89%C3%8A%C3%8B%C3%8C%C3%8D%C3%8E%C3%8F%C3%90%C3%91%C3%92%C3%93%C3%94"
            + "%C3%95%C3%96%C3%97%C3%98%C3%99%C3%9A%C3%9B%C3%9C%C3%9D%C3%9E%C3%9F%C3%A0%C3%A1%C3%A2%C3%A3%C3%A4%C3"
            + "%A5%C3%A6%C3%A7%C3%A8%C3%A9%C3%AA%C3%AB%C3%AC%C3%AD%C3%AE%C3%AF%C3%B0%C3%B1%C3%B2%C3%B3%C3%B4%C3%B5"
            + "%C3%B6%C3%B7%C3%B8%C3%B9%C3%BA%C3%BB%C3%BC%C3%BD%C3%BE%C3%BF";
        let object =  Url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        object.search = str;
        expect(object.params.toString()).assertEqual(searchParamEncode);
        object.search = queryEncode;
        expect(object.params.toString()).assertEqual(searchParamEncode);
    })

    /**
     * @tc.name   testUrlHref006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_36300
     * @tc.desc   URL get href.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlHref006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let object = Url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        let str = " !\"#$%&'()*+,-./09:;<=>?@A\\[]^_`a{|}~€‚ƒ„…†‡ˆ‰Š‹ŒŽ‘’“”•–—˜™š›œžŸ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁ"
        let hrefEncode = "http://%20!%22%23$%&'()*+,-.%2F09%3A%3B%3C%3D%3E%3F%40A%5C%5B%5D%5E_%60a%7B%7C%7D~%E2"
            + "%82%AC%E2%80%9A%C6%92%E2%80%9E%E2%80%A6%E2%80%A0%E2%80%A1%CB%86%E2%80%B0%C5%A0%E2%80%B9%C5%92%C5%BD"
            + "%E2%80%98%E2%80%99%E2%80%9C%E2%80%9D%E2%80%A2%E2%80%93%E2%80%94%CB%9C%E2%84%A2%C5%A1%E2%80%BA%C5%93"
            + "%C5%BE%C5%B8%C2%A1%C2%A2%C2%A3%C2%A4%C2%A5%C2%A6%C2%A7%C2%A8%C2%A9%C2%AA%C2%AB%C2%AC%C2%AD%C2%AE%C2"
            + "%AF%C2%B0%C2%B1%C2%B2%C2%B3%C2%B4%C2%B5%C2%B6%C2%B7%C2%B8%C2%B9%C2%BA%C2%BB%C2%BC%C2%BD%C2%BE%C2%BF"
            + "%C3%80%C3%81:%20!%22%23$%&'()*+,-.%2F09%3A%3B%3C%3D%3E%3F%40A%5C%5B%5D%5E_%60a%7B%7C%7D~%E2%82%AC%E2"
            + "%80%9A%C6%92%E2%80%9E%E2%80%A6%E2%80%A0%E2%80%A1%CB%86%E2%80%B0%C5%A0%E2%80%B9%C5%92%C5%BD%E2%80%98"
            + "%E2%80%99%E2%80%9C%E2%80%9D%E2%80%A2%E2%80%93%E2%80%94%CB%9C%E2%84%A2%C5%A1%E2%80%BA%C5%93%C5%BE%C5"
            + "%B8%C2%A1%C2%A2%C2%A3%C2%A4%C2%A5%C2%A6%C2%A7%C2%A8%C2%A9%C2%AA%C2%AB%C2%AC%C2%AD%C2%AE%C2%AF%C2%B0"
            + "%C2%B1%C2%B2%C2%B3%C2%B4%C2%B5%C2%B6%C2%B7%C2%B8%C2%B9%C2%BA%C2%BB%C2%BC%C2%BD%C2%BE%C2%BF%C3%80%C3"
            + "%81@host:8080/%20!%22#$%&'()*+,-./09:;%3C=%3E?@A%5C[]%5E_%60a%7B|%7D~%E2%82%AC%E2%80%9A%C6%92%E2%80"
            + "%9E%E2%80%A6%E2%80%A0%E2%80%A1%CB%86%E2%80%B0%C5%A0%E2%80%B9%C5%92%C5%BD%E2%80%98%E2%80%99%E2%80%9C"
            + "%E2%80%9D%E2%80%A2%E2%80%93%E2%80%94%CB%9C%E2%84%A2%C5%A1%E2%80%BA%C5%93%C5%BE%C5%B8%C2%A1%C2%A2%C2"
            + "%A3%C2%A4%C2%A5%C2%A6%C2%A7%C2%A8%C2%A9%C2%AA%C2%AB%C2%AC%C2%AD%C2%AE%C2%AF%C2%B0%C2%B1%C2%B2%C2%B3"
            + "%C2%B4%C2%B5%C2%B6%C2%B7%C2%B8%C2%B9%C2%BA%C2%BB%C2%BC%C2%BD%C2%BE%C2%BF%C3%80%C3%81?%20!%22%23$%&'"
            + "()*+,-./09:;%3C=%3E?@A%5C[]^_`a{|}~%E2%82%AC%E2%80%9A%C6%92%E2%80%9E%E2%80%A6%E2%80%A0%E2%80%A1%CB%86"
            + "%E2%80%B0%C5%A0%E2%80%B9%C5%92%C5%BD%E2%80%98%E2%80%99%E2%80%9C%E2%80%9D%E2%80%A2%E2%80%93%E2%80%94%CB"
            + "%9C%E2%84%A2%C5%A1%E2%80%BA%C5%93%C5%BE%C5%B8%C2%A1%C2%A2%C2%A3%C2%A4%C2%A5%C2%A6%C2%A7%C2%A8%C2%A9%C2"
            + "%AA%C2%AB%C2%AC%C2%AD%C2%AE%C2%AF%C2%B0%C2%B1%C2%B2%C2%B3%C2%B4%C2%B5%C2%B6%C2%B7%C2%B8%C2%B9%C2%BA%C2"
            + "%BB%C2%BC%C2%BD%C2%BE%C2%BF%C3%80%C3%81#%20!%22#$%&'()*+,-./09:;%3C=%3E?@A%5C[]%5E_`a{|}~%E2%82%AC%E2"
            + "%80%9A%C6%92%E2%80%9E%E2%80%A6%E2%80%A0%E2%80%A1%CB%86%E2%80%B0%C5%A0%E2%80%B9%C5%92%C5%BD%E2%80%98%E2"
            + "%80%99%E2%80%9C%E2%80%9D%E2%80%A2%E2%80%93%E2%80%94%CB%9C%E2%84%A2%C5%A1%E2%80%BA%C5%93%C5%BE%C5%B8%C2"
            + "%A1%C2%A2%C2%A3%C2%A4%C2%A5%C2%A6%C2%A7%C2%A8%C2%A9%C2%AA%C2%AB%C2%AC%C2%AD%C2%AE%C2%AF%C2%B0%C2%B1%C2"
            + "%B2%C2%B3%C2%B4%C2%B5%C2%B6%C2%B7%C2%B8%C2%B9%C2%BA%C2%BB%C2%BC%C2%BD%C2%BE%C2%BF%C3%80%C3%81";
        object.username = str;
        object.password = str;
        object.pathname = str;
        object.hash = str;
        object.search = str;
        expect(object.href).assertEqual(hrefEncode);
    })

    /**
     * @tc.name   testNewURLParams002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_36400
     * @tc.desc   The input parameter for New URLParams with the code can not tranform to utf-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNewURLParams002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams('aa=%E4%B8%AD%E5%9B%BD%BD');
        expect(params.toString()).assertEqual('aa=%E4%B8%AD%E5%9B%BD%25BD');
        expect(params.get('aa')).assertEqual('中国%BD');
    })

    /**
     * @tc.name   testNewURLParams003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_36500
     * @tc.desc   The input parameter for New URLParams with the emoji.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNewURLParams003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams('aa=bc%F0%9F%98%82%F0Ad');
        expect(params.toString()).assertEqual('aa=bc%F0%9F%98%82%25F0Ad');
        expect(params.get('aa')).assertEqual('bc😂%F0Ad');
    })

    /**
     * @tc.name   testNewURLParams004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_URL_36600
     * @tc.desc   The input parameter for New URLParams with the ܀ܟ.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNewURLParams004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let params = new Url.URLParams('aa=a%DC%80f%DC%9Fb');
        expect(params.toString()).assertEqual('aa=a%DC%80f%DC%9Fb');
        expect(params.get('aa')).assertEqual('a܀fܟb');
        params = new Url.URLParams('aa=a%DC%80%DC%9Fb');
        expect(params.toString()).assertEqual('aa=a%DC%80%DC%9Fb');
        expect(params.get('aa')).assertEqual('a܀ܟb');
    })
})}