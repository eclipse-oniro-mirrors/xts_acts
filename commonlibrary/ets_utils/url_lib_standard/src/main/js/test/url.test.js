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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import  Url from '@ohos.url'
export default function UrlFunTest() {
describe('UrlFunTest', function () {
    
  /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_00100
   * @tc.name: testParamsAppend001
   * @tc.desc: Appends a specified key/value pair as a new search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsAppend001', 0, function () {
        var that = new Url.URL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        var params = new Url.URLParams(that.search);
        params.append('ma','jk')
        var result = params.toString()
        expect(result).assertEqual('foo=1&bar=2&ma=jk')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_00200
   * @tc.name: testParamsAppend002
   * @tc.desc: Appends a specified key/value pair as a new search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsAppend002', 0, function () {
        var that = new Url.URL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        var params = new Url.URLParams(that.search);
        params.append("ma 大","jk￥")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&ma+%E5%A4%A7=jk%EF%BF%A5")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_00300
   * @tc.name: testParamsAppend003
   * @tc.desc: Appends a specified key/value pair as a new search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsAppend003', 0, function () {
        var that = new Url.URL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        var params = new Url.URLParams(that.search);
        params.append("foo~!@#$%^&*()_+-=","jk")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&foo%7E%21%40%23%24%25%5E%26*%28%29_%2B-%3D=jk")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_00400
   * @tc.name: testParamsAppend004
   * @tc.desc: Appends a specified key/value pair as a new search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsAppend004', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLParams(that.search)
        params.append("app","par")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&app=par")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_00500
   * @tc.name: testParamsAppend005
   * @tc.desc: Appends a specified key/value pair as a new search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsAppend005', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLParams(that.search)
        params.append("123","456")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&123=456")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_00600
   * @tc.name: testParamsAppend006
   * @tc.desc: Appends throw BusinessError: Parameter error.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsAppend006', 0, function () {
        try {
            let that = new Url.URL('https://example.com?foo=1&bar=2')
            let params = new Url.URLParams(that.search)
            params.append(123,"456")
            expect(0).assertEqual(1)
        } catch (err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of 123 must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual("Parameter error.The type of 123 must be string");
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_00700
   * @tc.name: testParamsAppend007
   * @tc.desc: Appends throw BusinessError: Parameter error.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsAppend007', 0, function () {
        try {
            let that = new Url.URL('https://example.com?foo=1&bar=2')
            let params = new Url.URLParams(that.search)
            var a = '123'
            var b = undefined;
            params.append(a, b)
            expect(0).assertEqual(1)
        } catch (err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${b} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${b} must be string`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_00800
   * @tc.name: testParamsDelete001
   * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsDelete001', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLParams(that.search)
        params.delete("foo")
        var result = params.toString()
        expect(result).assertEqual("bar=2")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_00900
   * @tc.name: testParamsDelete002
   * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsDelete002', 0, function () {
        let that = new Url.URL('https://example.com?foo大=1&bar=2');
        let params = new Url.URLParams(that.search);
        params.delete('foo');
        var result = params.toString();
        expect(result).assertEqual("foo%E5%A4%A7=1&bar=2");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_01000
   * @tc.name: testParamsDelete003
   * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsDelete003', 0, function () {
        let that = new Url.URL('https://example.com?foo大=1&bar=2');
        let params = new Url.URLParams(that.search);
        params.delete("foo大");
        var result = params.toString();
        expect(result).assertEqual("bar=2")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_01100
   * @tc.name: testParamsDelete004
   * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsDelete004', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2');
        let params = new Url.URLParams(that.search);
        params.delete('bar');
        var result = params.toString();
        expect(result).assertEqual("foo=1");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_01200
   * @tc.name: testParamsDelete005
   * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsDelete005', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2');
        let params = new Url.URLParams(that.search);
        params.delete("faa");
        var result = params.toString();
        expect(result).assertEqual("foo=1&bar=2")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_01300
   * @tc.name: testParamsDelete006
   * @tc.desc: Deletes throw BusinessError: Parameter error.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsDelete006', 0, function () {
        try {
            let that = new Url.URL('https://example.com?foo=1&bar=2');
            let params = new Url.URLParams(that.search);
            params.delete();
            expect(0).assertEqual(1)
        } catch (err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${arguments[0]} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${arguments[0]} must be string`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_01400
   * @tc.name: testParamsDelete007
   * @tc.desc: Deletes throw BusinessError: Parameter error.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsDelete007', 0, function () {
        try {
            let that = new Url.URL('https://example.com?foo=1&bar=2');
            let params = new Url.URLParams(that.search);
            params.delete(4);
            expect(0).assertEqual(1)
        } catch (err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of 4 must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of 4 must be string`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_01500
   * @tc.name: testNewURLParams001
   * @tc.desc: The input parameter for New URLParams is undefined or null.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testNewURLParams001', 0, function () {
        let params = new Url.URLParams(undefined);
        let result = params.toString();
        expect(result).assertEqual('');
        let params1 = new Url.URLParams(null);
        let result1 = params1.toString();
        expect(result1).assertEqual('');
    })
    
   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_01600
   * @tc.name: testParamsEntries001
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsEntries001', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_01700
   * @tc.name: testParamsEntries002
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsEntries002', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_01800
   * @tc.name: testParamsEntries003
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsEntries003', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_01900
   * @tc.name: testParamsEntries004
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsEntries004', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_02000
   * @tc.name: testParamsEntries005
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsEntries005', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_02100
   * @tc.name: testParams[Symbol.iterator]001
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParams[Symbol.iterator]001', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_02200
   * @tc.name: testParams[Symbol.iterator]002
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParams[Symbol.iterator]002', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_02300
   * @tc.name: testParams[Symbol.iterator]003
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParams[Symbol.iterator]003', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_02400
   * @tc.name: testParams[Symbol.iterator]004
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParams[Symbol.iterator]004', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_02500
   * @tc.name: testParams[Symbol.iterator]005
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParams[Symbol.iterator]005', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_02600
   * @tc.name: testParamsForEach001
   * @tc.desc: Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsForEach001', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_02700
   * @tc.name: testParamsForEach002
   * @tc.desc: Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsForEach002', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_02800
   * @tc.name: testParamsForEach003
   * @tc.desc: Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsForEach003', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_02900
   * @tc.name: testParamsForEach004
   * @tc.desc: Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsForEach004', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_03000
   * @tc.name: testParamsForEach005
   * @tc.desc: Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsForEach005', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_03100
   * @tc.name: testParamsForEach006
   * @tc.desc: forEach throw BusinessError: Parameter error.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsForEach006', 0, function () {
        try {
            let params = new Url.URLParams("foo=bar&jss=txt");
            var arr={};
            var i = 0;
            var func = [0, 2, 4, 6, 8];
            params.forEach(func);
            expect(0).assertEqual(1)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${func} must be function`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${func} must be function`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_03200
   * @tc.name: testParamsForEach007
   * @tc.desc: Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsForEach007', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_03300
   * @tc.name: testParamsGet001
   * @tc.desc: Returns the first value associated to the given search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsGet001', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        var result =  params.get("1")
        expect(result).assertEqual(undefined)
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_03400
   * @tc.name: testParamsGet002
   * @tc.desc: Returns the first value associated to the given search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsGet002', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        var result =  params.get("key2")
        expect(result).assertEqual("value2")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_03500
   * @tc.name: testParamsGet003
   * @tc.desc: Returns the first value associated to the given search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsGet003', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        params.append("5","JKL")
        var result =  params.get("5")
        expect(result).assertEqual("JKL")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_03600
   * @tc.name: testParamsGet004
   * @tc.desc: Returns the first value associated to the given search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsGet004', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        var result =  params.get("key1")
        expect(result).assertEqual("value1")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_03700
   * @tc.name: testParamsGet005
   * @tc.desc: Returns the first value associated to the given search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsGet005', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        params.append("jss","JL")
        var result =  params.get("jss")
        expect(result).assertEqual("JL")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_03800
   * @tc.name: testParamsGet006
   * @tc.desc: get throw BusinessError: Parameter error.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsGet006', 0, function () {
        try{
            let params = new Url.URLParams("key1=value1&key2=value2")
            params.append("jss","JL")
            var a = 666;
            var result =  params.get(a)
            expect(0).assertEqual(1)
        }catch(err){
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${a} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${a} must be string`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_03900
   * @tc.name: testParamsGetAll001
   * @tc.desc: Returns all key-value pairs associated with a given search parameter as an array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsGetAll001', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2")
        params.append("key1","AAA")
        var result =  params.getAll("key1")
        expect(result.toString()).assertEqual("value1,AAA")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_04000
   * @tc.name: testParamsGetAll002
   * @tc.desc: Returns all key-value pairs associated with a given search parameter as an array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsGetAll002', 0, function () {
        let params = new Url.URLParams("key1=value1&8=DEF")
        params.append("8","A8A")
        var result =  params.getAll("8")
        expect(result.toString()).assertEqual("DEF,A8A")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_04100
   * @tc.name: testParamsGetAll003
   * @tc.desc: Returns all key-value pairs associated with a given search parameter as an array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsGetAll003', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2&key3=da")
        params.append("key3","A3A")
        var result =  params.getAll("key3")
        expect(result.toString()).assertEqual("da,A3A")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_04200
   * @tc.name: testParamsGetAll004
   * @tc.desc: Returns all key-value pairs associated with a given search parameter as an array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsGetAll004', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2&key3=大")
        params.append("key3","A3A")
        var result =  params.getAll("key4")
        expect(result.toString()).assertEqual('')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_04300
   * @tc.name: testParamsGetAll005
   * @tc.desc: Returns all key-value pairs associated with a given search parameter as an array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsGetAll005', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2&key3=大")
        params.append("key3","A3A")
        var result =  params.getAll("key2")
        expect(result.toString()).assertEqual("value2")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_04400
   * @tc.name: testParamsGetAll006
   * @tc.desc: getAll throw BusinessError: Parameter error.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsGetAll006', 0, function () {
        try {
            let params = new Url.URLParams("key1=value1&key2=value2&key3=大")
            params.append("key3","A3A")
            var b = 666;
            var result =  params.getAll(b)
            expect(0).assertEqual(1)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${b} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${b} must be string`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_04500
   * @tc.name: testParamsHas001
   * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsHas001', 0, function () {
        let params = new Url.URLParams("key1=value1&key2=value2&key3=大")
        var result =  params.has("2")
        expect(result).assertEqual(false)
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_04600
   * @tc.name: testParamsHas002
   * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsHas002', 0, function () {
        let params = new Url.URLParams("小=value1&key2=value2&key3=大")
        var result =  params.has("小")
        expect(result).assertEqual(true)
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_04700
   * @tc.name: testParamsHas003
   * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsHas003', 0, function () {
        let params = new Url.URLParams("小=value1&￥=value2&key3=大")
        params.append("￥","ACA")
        var result =  params.has("￥")
        expect(result).assertEqual(true)
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_04800
   * @tc.name: testParamsHas004
   * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsHas004', 0, function () {
        let params = new Url.URLParams("小=value1&key2=value2&key3=大")
        var result =  params.has("无")
        expect(result).assertEqual(false)
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_04900
   * @tc.name: testParamsHas005
   * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsHas005', 0, function () {
        let params = new Url.URLParams("小=value1&￥=value2&key3=大")
        params.append("￥","ACA")
        var result =  params.has("￥11")
        expect(result).assertEqual(false)
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_05000
   * @tc.name: testParamsHas006
   * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsHas006', 0, function () {
        let params = new Url.URLParams("小=value1&￥=value2&key3=大")
        try {
            var a = 1;
            params.has(a);
        } catch(e) {
            expect(e.toString()).assertEqual(`BusinessError: Parameter error.The type of ${a} must be string`);
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual(`Parameter error.The type of ${a} must be string`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_05100
   * @tc.name: testParamsKeys001
   * @tc.desc: Returns an iterator allowing to go through all keys contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsKeys001', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_05200
   * @tc.name: testParamsKeys002
   * @tc.desc: Returns an iterator allowing to go through all keys contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsKeys002', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_05300
   * @tc.name: testParamsKeys003
   * @tc.desc: Returns an iterator allowing to go through all keys contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsKeys003', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_05400
   * @tc.name: testParamsKeys004
   * @tc.desc: Returns an iterator allowing to go through all keys contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsKeys004', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_05500
   * @tc.name: testParamsKeys005
   * @tc.desc: Returns an iterator allowing to go through all keys contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsKeys005', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_05600
   * @tc.name: testParamsSet001
   * @tc.desc: Sets the value associated with a given search parameter to the given value.
   * If there were several matching values, this method deletes the others.
   * If the search parameter doesn't exist, this method creates it.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsSet001', 0, function () {
        let params = new Url.URLParams("1=value1&2=value2&key3=3");
        // params.append("11","ACA");
        params.set("11","CCC");
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&11=CCC");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_05700
   * @tc.name: testParamsSet002
   * @tc.desc: Sets the value associated with a given search parameter to the given value.
   * If there were several matching values, this method deletes the others.
   * If the search parameter doesn't exist, this method creates it.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsSet002', 0, function () {
        let params = new Url.URLParams("1=value1&2=value2&key3=3");
        params.set('10','BBB');
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&10=BBB");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_05800
   * @tc.name: testParamsSet003
   * @tc.desc: Sets the value associated with a given search parameter to the given value.
   * If there were several matching values, this method deletes the others.
   * If the search parameter doesn't exist, this method creates it.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsSet003', 0, function () {
        let params = new Url.URLParams("1=value1&2=value2&key3=3");
        params.set("ma 大" ,"10￥");
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&ma+%E5%A4%A7=10%EF%BF%A5");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_05900
   * @tc.name: testParamsSet004
   * @tc.desc: Sets the value associated with a given search parameter to the given value.
   * If there were several matching values, this method deletes the others.
   * If the search parameter doesn't exist, this method creates it.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsSet004', 0, function () {
        let params = new Url.URLParams("1=value1&2=value2&key3=3");
        // params.append("1","ACA");
        params.set("1","CCC");
        var res = params.toString();
        expect(res).assertEqual("1=CCC&2=value2&key3=3");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_06000
   * @tc.name: testParamsSet005
   * @tc.desc: Sets the value associated with a given search parameter to the given value.
   * If there were several matching values, this method deletes the others.
   * If the search parameter doesn't exist, this method creates it.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsSet005', 0, function () {
        let params = new Url.URLParams("1=value1&2=value2&key3=3");
        params.set('12','BBB');
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&12=BBB");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_06100
   * @tc.name: testParamsSet006
   * @tc.desc: Sets the value associated with a given search parameter to the given value.
   * If there were several matching values, this method deletes the others.
   * If the search parameter doesn't exist, this method creates it.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsSet006', 0, function () {
        let params = new Url.URLParams();
        params.set('12','BBB');
        var res = params.toString();
        expect(res).assertEqual("12=BBB");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_06200
   * @tc.name: testParamsSet007
   * @tc.desc: Sets the value associated with a given search parameter to the given value.
   * If there were several matching values, this method deletes the others.
   * If the search parameter throw BusinessError: Parameter error.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsSet007', 0, function () {
        try {
            let params = new Url.URLParams("1=value1&2=value2&key3=3");
            var a = 12;
            params.set(a,'BBB');
            var res = params.toString();
            expect(0).assertEqual(1);
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${a} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${a} must be string`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_06300
   * @tc.name: testParamsSet007
   * @tc.desc: Sets the value associated with a given search parameter to the given value.
   * If there were several matching values, this method deletes the others.
   * If the search parameter throw BusinessError: Parameter error.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsSet007', 0, function () {
        try {
            let params = new Url.URLParams("1=value1&2=value2&key3=3");
            var b = undefined;
            params.set('12', b);
            var res = params.toString();
            expect(0).assertEqual(1);
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${b} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${b} must be string`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_06400
   * @tc.name: testParamsSort001
   * @tc.desc: Sort all key/value pairs contained in this object in place and return undefined.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsSort001', 0, function () {
        let params = new Url.URLParams("1=value1&3=value3&2=key2");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=key2&3=value3");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_06500
   * @tc.name: testParamsSort002
   * @tc.desc: Sort all key/value pairs contained in this object in place and return undefined.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsSort002', 0, function () {
        let params = new Url.URLParams("a=value1&c=value2&b=key2");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("a=value1&b=key2&c=value2");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_06600
   * @tc.name: testParamsSort003
   * @tc.desc: Sort all key/value pairs contained in this object in place and return undefined.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsSort003', 0, function () {
        let params = new Url.URLParams("d=value1&c=value2&b=33");
        params.append("a","ACA");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("a=ACA&b=33&c=value2&d=value1");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_06700
   * @tc.name: testParamsSort004
   * @tc.desc: Sort all key/value pairs contained in this object in place and return undefined.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsSort004', 0, function () {
        let params = new Url.URLParams("1=value1&3=value3&2=key2&4=key4");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=key2&3=value3&4=key4");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_06800
   * @tc.name: testParamsSort005
   * @tc.desc: Sort all key/value pairs contained in this object in place and return undefined.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsSort005', 0, function () {
        let params = new Url.URLParams("a=value1&c=value2&4=key4&b=key2");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("4=key4&a=value1&b=key2&c=value2");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_06900
   * @tc.name: testParamsValues001
   * @tc.desc: Returns an iterator allowing to go through all values contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsValues001', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_07000
   * @tc.name: testParamsValues002
   * @tc.desc: Returns an iterator allowing to go through all values contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsValues002', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_07100
   * @tc.name: testParamsValues003
   * @tc.desc: Returns an iterator allowing to go through all values contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsValues003', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_07200
   * @tc.name: testParamsValues004
   * @tc.desc: Returns an iterator allowing to go through all values contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsValues004', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_07300
   * @tc.name: testParamsValues005
   * @tc.desc: Returns an iterator allowing to go through all values contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsValues005', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_07400
   * @tc.name: testParamsToString001
   * @tc.desc: Returns a query string suitable for use in a URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsToString001', 0, function () {
        let params = new Url.URLParams("d=value1&c=value2&b=大")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=%E5%A4%A7")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_07500
   * @tc.name: testParamsToString002
   * @tc.desc: Returns a query string suitable for use in a URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsToString002', 0, function () {
        let params = new Url.URLParams("d=value1&c=value2&b= 大")
        params.append("1 12","QQQ")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=+%E5%A4%A7&1+12=QQQ")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_07600
   * @tc.name: testParamsToString003
   * @tc.desc: Returns a query string suitable for use in a URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsToString003', 0, function () {
        let params = new Url.URLParams("￥=)")
        params.delete("5")
        var result= params.toString()
        expect(result).assertEqual("%EF%BF%A5=%29")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_07700
   * @tc.name: testParamsToString004
   * @tc.desc: Returns a query string suitable for use in a URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsToString004', 0, function () {
        let params = new Url.URLParams("d=value1&c=value2&b=大&4=key4")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=%E5%A4%A7&4=key4")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_07800
   * @tc.name: testParamsToString005
   * @tc.desc: Returns a query string suitable for use in a URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsToString005', 0, function () {
        let params = new Url.URLParams("d=value1&c=value2&b= 大&4=key4&5=key5")
        params.append("1 12","QQQ")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=+%E5%A4%A7&4=key4&5=key5&1+12=QQQ")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_07900
   * @tc.name: testParamsConstruction001
   * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsConstruction001', 0, function () {
        let params = new Url.URLParams('?user=abc&query=xyz')
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=xyz")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_08000
   * @tc.name: testParamsConstruction002
   * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsConstruction002', 0, function () {
        let params = new Url.URLParams({
            user: 'abc',
            query: ['first', 'second']
        });
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=first%2Csecond")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_08100
   * @tc.name: testParamsConstruction003
   * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsConstruction003', 0, function () {
        let params = new Url.URLParams([
                ['user', 'abc'],
                ['query', 'first'],
                ['query', 'second'],
        ]);
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=first&query=second")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_08200
   * @tc.name: testParamsConstruction004
   * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsConstruction004', 0, function () {
        const map = new Map();
        map.set('user', 'abc');
        map.set('query', 'xyz');
        let params = new Url.URLParams(map)
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=xyz")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_08300
   * @tc.name: testParamsConstruction005
   * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsConstruction005', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_08400
   * @tc.name: testParamsConstruction006
   * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsConstruction006', 0, function () {
        let params = new Url.URLParams()
        params.append('abcde','fghki')
        var paramsResult = params.toString()
        expect(paramsResult).assertEqual('abcde=fghki')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_08500
   * @tc.name: testParamsConstruction007
   * @tc.desc: A parameterized constructor used to create an URLSearchParams instance.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsConstruction007', 0, function () {
        let param
        let params = new Url.URLParams(param)
        params.append('abcde','fghki')
        var paramsResult = params.toString()
        expect(paramsResult).assertEqual('abcde=fghki')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_08600
   * @tc.name: testParamsConstruction008
   * @tc.desc: The type of init must be string two-dimensional array or object list throw error.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsConstruction008', 0, function () {
        try {
            var param = 123456789;
            let params = new Url.URLParams(param)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${param} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${param} must be string`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_08700
   * @tc.name: testParamsConstruction009
   * @tc.desc: The type of init must be string two-dimensional array or object list throw error.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testParamsConstruction009', 0, function () {
        try {
            var param = [
                ['user', 'abc', 'error'],
              ];
            let params = new Url.URLParams(param);
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${param} must be string[][]`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${param} must be string[][]`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_08800
   * @tc.name: testNewURLSearchParams001
   * @tc.desc: The input parameter for New URLSearchParams is undefined or null.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testNewURLSearchParams001', 0, function () {
        let params = new Url.URLSearchParams(undefined);
        let result = params.toString()
        expect(result).assertEqual('')
        let params1 = new Url.URLSearchParams(null);
        let result2 = params1.toString()
        expect(result2).assertEqual('')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_08900
   * @tc.name: testUrlAppend001
   * @tc.desc: Appends a specified key/value pair as a new search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlAppend001', 0, function () {
        var that = new Url.URL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        var params = new Url.URLSearchParams(that.search);
        params.append('ma','jk')
        var result = params.toString()
        expect(result).assertEqual('foo=1&bar=2&ma=jk')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_09000
   * @tc.name: testUrlAppend002
   * @tc.desc: Appends a specified key/value pair as a new search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlAppend002', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLSearchParams(that.search)
        params.append("ma 大","jk￥")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&ma+%E5%A4%A7=jk%EF%BF%A5")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_09100
   * @tc.name: testUrlAppend003
   * @tc.desc: Appends a specified key/value pair as a new search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlAppend003', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLSearchParams(that.search)
        params.append("foo~!@#$%^&*()_+-=","jk")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&foo%7E%21%40%23%24%25%5E%26*%28%29_%2B-%3D=jk")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_09200
   * @tc.name: testUrlAppend004
   * @tc.desc: Appends a specified key/value pair as a new search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlAppend004', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLSearchParams(that.search)
        params.append("app","par")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&app=par")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_09300
   * @tc.name: testUrlAppend005
   * @tc.desc: Appends a specified key/value pair as a new search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlAppend005', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLSearchParams(that.search)
        params.append("123","456")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&123=456")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_09400
   * @tc.name: testUrlAppend006
   * @tc.desc: Appends a specified key/value pair as a new search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlAppend006', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLSearchParams(that.search)
        try {
            var a = 1;
            params.append(a, "123")
        } catch(e) {
            expect(e.toString()).assertEqual(`BusinessError: Parameter error.The type of ${a} must be string`);
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual(`Parameter error.The type of ${a} must be string`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_09500
   * @tc.name: testUrlDelete001
   * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlDelete001', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = new Url.URLSearchParams(that.search)
        params.delete("foo")
        var result = params.toString()
        expect(result).assertEqual("bar=2")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_09600
   * @tc.name: testUrlDelete002
   * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlDelete002', 0, function () {
        let that = new Url.URL('https://example.com?foo大=1&bar=2');
        let params = new Url.URLSearchParams(that.search);
        params.delete('foo');
        var result = params.toString();
        expect(result).assertEqual("foo%E5%A4%A7=1&bar=2");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_09700
   * @tc.name: testUrlDelete003
   * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlDelete003', 0, function () {
        let that = new Url.URL('https://example.com?foo大=1&bar=2');
        let params = new Url.URLSearchParams(that.search);
        params.delete("foo大");
        var result = params.toString();
        expect(result).assertEqual("bar=2")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_09800
   * @tc.name: testUrlDelete004
   * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlDelete004', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2');
        let params = new Url.URLSearchParams(that.search);
        params.delete('bar');
        var result = params.toString();
        expect(result).assertEqual("foo=1");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_09800
   * @tc.name: testUrlDelete005
   * @tc.desc: Deletes the given search parameter and its associated value,from the list of all search parameters.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlDelete005', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2');
        let params = new Url.URLSearchParams(that.search);
        params.delete("faa");
        var result = params.toString();
        expect(result).assertEqual("foo=1&bar=2")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_09900
   * @tc.name: testUrlEntries001
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlEntries001', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_10000
   * @tc.name: testUrlEntries002
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlEntries002', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_10100
   * @tc.name: testUrlEntries003
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlEntries003', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_10200
   * @tc.name: testUrlEntries004
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlEntries004', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_10300
   * @tc.name: testUrlEntries005
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlEntries005', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_10400
   * @tc.name: testUrl[Symbol.iterator]001
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrl[Symbol.iterator]001', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_10500
   * @tc.name: testUrl[Symbol.iterator]002
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrl[Symbol.iterator]()002', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_10600
   * @tc.name: testUrl[Symbol.iterator]003
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrl[Symbol.iterator]()003', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_10700
   * @tc.name: testUrl[Symbol.iterator]004
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrl[Symbol.iterator]()004', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_10800
   * @tc.name: testUrl[Symbol.iterator]005
   * @tc.desc: Returns an ES6 iterator. Each item of the iterator is a JavaScript Array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrl[Symbol.iterator]()005', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_10900
   * @tc.name: testUrlForEach001
   * @tc.desc: Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlForEach001', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_11000
   * @tc.name: testUrlForEach002
   * @tc.desc: Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlForEach002', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_11100
   * @tc.name: testUrlForEach003
   * @tc.desc: Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlForEach003', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_11200
   * @tc.name: testUrlForEach004
   * @tc.desc: Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlForEach004', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_11300
   * @tc.name: testUrlForEach005
   * @tc.desc: Callback functions are used to traverse key-value pairs on the URLSearchParams instance object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlForEach005', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_11400
   * @tc.name: testUrlForEach006
   * @tc.desc: The second parameter of forEach is undefined or null.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlForEach006', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_11500
   * @tc.name: testUrlGet001
   * @tc.desc: Returns the first value associated to the given search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlGet001', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        var result =  params.get("1")
        expect(result).assertEqual(undefined)
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_11600
   * @tc.name: testUrlGet002
   * @tc.desc: Returns the first value associated to the given search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlGet002', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        var result =  params.get("key2")
        expect(result).assertEqual("value2")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_11700
   * @tc.name: testUrlGet003
   * @tc.desc: Returns the first value associated to the given search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlGet003', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        params.append("5","JKL")
        var result =  params.get("5")
        expect(result).assertEqual("JKL")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_11800
   * @tc.name: testUrlGet004
   * @tc.desc: Returns the first value associated to the given search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlGet004', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        var result =  params.get("key1")
        expect(result).assertEqual("value1")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_11900
   * @tc.name: testUrlGet005
   * @tc.desc: Returns the first value associated to the given search parameter.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlGet005', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        params.append("jss","JL")
        var result =  params.get("jss")
        expect(result).assertEqual("JL")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_12000
   * @tc.name: testUrlGetAll001
   * @tc.desc: Returns all key-value pairs associated with a given search parameter as an array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlGetAll001', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2")
        params.append("key1","AAA")
        var result =  params.getAll("key1")
        expect(result.toString()).assertEqual("value1,AAA")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_12100
   * @tc.name: testUrlGetAll002
   * @tc.desc: Returns all key-value pairs associated with a given search parameter as an array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlGetAll002', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&8=DEF")
        params.append("8","A8A")
        var result =  params.getAll("8")
        expect(result.toString()).assertEqual("DEF,A8A")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_12200
   * @tc.name: testUrlGetAll003
   * @tc.desc: Returns all key-value pairs associated with a given search parameter as an array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlGetAll003', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2&key3=da")
        params.append("key3","A3A")
        var result =  params.getAll("key3")
        expect(result.toString()).assertEqual("da,A3A")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_12300
   * @tc.name: testUrlGetAll004
   * @tc.desc: Returns all key-value pairs associated with a given search parameter as an array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlGetAll004', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2&key3=大")
        params.append("key3","A3A")
        var result =  params.getAll("key4")
        expect(result.toString()).assertEqual('')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_12400
   * @tc.name: testUrlGetAll005
   * @tc.desc: Returns all key-value pairs associated with a given search parameter as an array.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlGetAll005', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2&key3=大")
        params.append("key3","A3A")
        var result =  params.getAll("key2")
        expect(result.toString()).assertEqual("value2")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_12500
   * @tc.name: testUrlHas001
   * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlHas001', 0, function () {
        let params = new Url.URLSearchParams("key1=value1&key2=value2&key3=大")
        var result =  params.has("2")
        expect(result).assertEqual(false)
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_12600
   * @tc.name: testUrlHas002
   * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlHas002', 0, function () {
        let params = new Url.URLSearchParams("小=value1&key2=value2&key3=大")
        var result =  params.has("小")
        expect(result).assertEqual(true)
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_12700
   * @tc.name: testUrlHas003
   * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlHas003', 0, function () {
        let params = new Url.URLSearchParams("小=value1&￥=value2&key3=大")
        params.append("￥","ACA")
        var result =  params.has("￥")
        expect(result).assertEqual(true)
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_12800
   * @tc.name: testUrlHas004
   * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlHas004', 0, function () {
        let params = new Url.URLSearchParams("小=value1&key2=value2&key3=大")
        var result =  params.has("无")
        expect(result).assertEqual(false)
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_12900
   * @tc.name: testUrlHas005
   * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlHas005', 0, function () {
        let params = new Url.URLSearchParams("小=value1&￥=value2&key3=大")
        params.append("￥","ACA")
        var result =  params.has("￥11")
        expect(result).assertEqual(false)
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_13000
   * @tc.name: testUrlHas006
   * @tc.desc: Returns a Boolean that indicates whether a parameter with the specified name exists.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlHas006', 0, function () {
        let params = new Url.URLSearchParams("小=value1&￥=value2&key3=大")
        params.append("￥","ACA")
        try {
            var a = 1;
            params.has(a);
        } catch(e) {
            expect(e.toString()).assertEqual(`BusinessError: Parameter error.The type of ${a} must be string`);
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual(`Parameter error.The type of ${a} must be string`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_13100
   * @tc.name: testUrlKeys001
   * @tc.desc: Returns an iterator allowing to go through all keys contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlKeys001', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_13200
   * @tc.name: testUrlKeys002
   * @tc.desc: Returns an iterator allowing to go through all keys contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlKeys002', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_13300
   * @tc.name: testUrlKeys003
   * @tc.desc: Returns an iterator allowing to go through all keys contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlKeys003', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_13400
   * @tc.name: testUrlKeys004
   * @tc.desc: Returns an iterator allowing to go through all keys contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlKeys004', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_13500
   * @tc.name: testUrlKeys005
   * @tc.desc: Returns an iterator allowing to go through all keys contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlKeys005', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_13600
   * @tc.name: testUrlSet001
   * @tc.desc: Sets the value associated with a given search parameter to the given value.
   * If there were several matching values, this method deletes the others.
   * If the search parameter doesn't exist, this method creates it.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSet001', 0, function () {
        let params = new Url.URLSearchParams("1=value1&2=value2&key3=3");
        // params.append("11","ACA");
        params.set("11","CCC");
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&11=CCC");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_13700
   * @tc.name: testUrlSet002
   * @tc.desc: Sets the value associated with a given search parameter to the given value.
   * If there were several matching values, this method deletes the others.
   * If the search parameter doesn't exist, this method creates it.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSet002', 0, function () {
        let params = new Url.URLSearchParams("1=value1&2=value2&key3=3");
        params.set('10','BBB');
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&10=BBB");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_13800
   * @tc.name: testUrlSet003
   * @tc.desc: Sets the value associated with a given search parameter to the given value.
   * If there were several matching values, this method deletes the others.
   * If the search parameter doesn't exist, this method creates it.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSet003', 0, function () {
        let params = new Url.URLSearchParams("1=value1&2=value2&key3=3");
        params.set("ma 大" ,"10￥");
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&ma+%E5%A4%A7=10%EF%BF%A5");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_13900
   * @tc.name: testUrlSet004
   * @tc.desc: Sets the value associated with a given search parameter to the given value.
   * If there were several matching values, this method deletes the others.
   * If the search parameter doesn't exist, this method creates it.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSet004', 0, function () {
        let params = new Url.URLSearchParams("1=value1&2=value2&key3=3");
        // params.append("1","ACA");
        params.set("1","CCC");
        var res = params.toString();
        expect(res).assertEqual("1=CCC&2=value2&key3=3");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_14000
   * @tc.name: testUrlSet005
   * @tc.desc: Sets the value associated with a given search parameter to the given value.
   * If there were several matching values, this method deletes the others.
   * If the search parameter doesn't exist, this method creates it.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSet005', 0, function () {
        let params = new Url.URLSearchParams("1=value1&2=value2&key3=3");
        params.set('12','BBB');
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=value2&key3=3&12=BBB");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_14100
   * @tc.name: testUrlSet006
   * @tc.desc: Sets the value associated with a given search parameter to the given value.
   * If there were several matching values, this method deletes the others.
   * If the search parameter doesn't exist, this method creates it.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSet006', 0, function () {
        try {
            let params = new Url.URLSearchParams("1=value1&2=value2&key3=3");
            var a = 12;
            params.set(a, 'BBB');
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${a} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${a} must be string`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_14200
   * @tc.name: testUrlSet006
   * @tc.desc: Sets the value associated with a given search parameter to the given value.
   * If there were several matching values, this method deletes the others.
   * If the search parameter doesn't exist, this method creates it.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSet007', 0, function () {
        let params = new Url.URLSearchParams();
        params.set('name', 'value');
        var res = params.toString();
        expect(res).assertEqual("name=value");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_14300
   * @tc.name: testUrlSort001
   * @tc.desc: Sort all key/value pairs contained in this object in place and return undefined.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSort001', 0, function () {
        let params = new Url.URLSearchParams("1=value1&3=value3&2=key2");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=key2&3=value3");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_14400
   * @tc.name: testUrlSort002
   * @tc.desc: Sort all key/value pairs contained in this object in place and return undefined.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSort002', 0, function () {
        let params = new Url.URLSearchParams("a=value1&c=value2&b=key2");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("a=value1&b=key2&c=value2");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_14500
   * @tc.name: testUrlSort003
   * @tc.desc: Sort all key/value pairs contained in this object in place and return undefined.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSort003', 0, function () {
        let params = new Url.URLSearchParams("d=value1&c=value2&b=33");
        params.append("a","ACA");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("a=ACA&b=33&c=value2&d=value1");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_14600
   * @tc.name: testUrlSort004
   * @tc.desc: Sort all key/value pairs contained in this object in place and return undefined.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSort004', 0, function () {
        let params = new Url.URLSearchParams("1=value1&3=value3&2=key2&4=key4");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("1=value1&2=key2&3=value3&4=key4");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_14700
   * @tc.name: testUrlSort005
   * @tc.desc: Sort all key/value pairs contained in this object in place and return undefined.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSort005', 0, function () {
        let params = new Url.URLSearchParams("a=value1&c=value2&4=key4&b=key2");
        params.sort();
        var res = params.toString();
        expect(res).assertEqual("4=key4&a=value1&b=key2&c=value2");
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_14800
   * @tc.name: testUrlValues001
   * @tc.desc: Returns an iterator allowing to go through all values contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlValues001', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_14900
   * @tc.name: testUrlValues002
   * @tc.desc: Returns an iterator allowing to go through all values contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlValues002', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_15000
   * @tc.name: testUrlValues003
   * @tc.desc: Returns an iterator allowing to go through all values contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlValues003', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_15100
   * @tc.name: testUrlValues004
   * @tc.desc: Returns an iterator allowing to go through all values contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlValues004', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_15200
   * @tc.name: testUrlValues005
   * @tc.desc: Returns an iterator allowing to go through all values contained in this object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlValues005', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_15300
   * @tc.name: testUrlSearchParamsToString001
   * @tc.desc: Returns a query string suitable for use in a URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSearchParamsToString001', 0, function () {
        let params = new Url.URLSearchParams("d=value1&c=value2&b=大")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=%E5%A4%A7")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_15400
   * @tc.name: testUrlSearchParamsToString002
   * @tc.desc: Returns a query string suitable for use in a URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSearchParamsToString002', 0, function () {
        let params = new Url.URLSearchParams("d=value1&c=value2&b= 大")
        params.append("1 12","QQQ")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=+%E5%A4%A7&1+12=QQQ")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_15500
   * @tc.name: testUrlSearchParamsToString003
   * @tc.desc: Returns a query string suitable for use in a URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSearchParamsToString003', 0, function () {
        let params = new Url.URLSearchParams("￥=)")
        params.delete("5")
        var result= params.toString()
        expect(result).assertEqual("%EF%BF%A5=%29")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_15600
   * @tc.name: testUrlSearchParamsToString004
   * @tc.desc: Returns a query string suitable for use in a URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSearchParamsToString004', 0, function () {
        let params = new Url.URLSearchParams("d=value1&c=value2&b=大&4=key4")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=%E5%A4%A7&4=key4")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_15700
   * @tc.name: testUrlSearchParamsToString005
   * @tc.desc: Returns a query string suitable for use in a URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSearchParamsToString005', 0, function () {
        let params = new Url.URLSearchParams("d=value1&c=value2&b= 大&4=key4&5=key5")
        params.append("1 12","QQQ")
        var result= params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=+%E5%A4%A7&4=key4&5=key5&1+12=QQQ")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_15800
   * @tc.name: testUrlSearchParamsConstruction001
   * @tc.desc:  A parameterized constructor used to create an URLSearchParams instance.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSearchParamsConstruction001', 0, function () {
        let params = new Url.URLSearchParams('?user=abc&query=xyz')
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=xyz")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_15900
   * @tc.name: testUrlSearchParamsConstruction002
   * @tc.desc:  A parameterized constructor used to create an URLSearchParams instance.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSearchParamsConstruction002', 0, function () {
        let params = new Url.URLSearchParams({
            user: 'abc',
            query: ['first', 'second']
        });
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=first%2Csecond")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_16000
   * @tc.name: testUrlSearchParamsConstruction003
   * @tc.desc:  A parameterized constructor used to create an URLSearchParams instance.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSearchParamsConstruction003', 0, function () {
        let params = new Url.URLSearchParams([
                ['user', 'abc'],
                ['query', 'first'],
                ['query', 'second'],
        ]);
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=first&query=second")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_16100
   * @tc.name: testUrlSearchParamsConstruction004
   * @tc.desc:  A parameterized constructor used to create an URLSearchParams instance.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSearchParamsConstruction004', 0, function () {
        const map = new Map();
        map.set('user', 'abc');
        map.set('query', 'xyz');
        let params = new Url.URLSearchParams(map)
        var result= params.toString()
        expect(result).assertEqual("user=abc&query=xyz")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_16200
   * @tc.name: testUrlSearchParamsConstruction005
   * @tc.desc:  A parameterized constructor used to create an URLSearchParams instance.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSearchParamsConstruction005', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_16300
   * @tc.name: testUrlSearchParamsConstruction006
   * @tc.desc:  A parameterized constructor used to create an URLSearchParams instance.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSearchParamsConstruction006', 0, function () {
        let params = new Url.URLSearchParams()
        params.append('abcde','fghki')
        var paramsResult = params.toString()
        expect(paramsResult).assertEqual('abcde=fghki')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_16400
   * @tc.name: testUrlSearchParamsConstruction007
   * @tc.desc:  A parameterized constructor used to create an URLSearchParams instance.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSearchParamsConstruction007', 0, function () {
        let param
        let params = new Url.URLSearchParams(param)
        params.append('abcde','fghki')
        var paramsResult = params.toString()
        expect(paramsResult).assertEqual('abcde=fghki')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_16500
   * @tc.name: testUrlSearchParamsConstruction008
   * @tc.desc:  A parameterized constructor used to create an URLSearchParams instance.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSearchParamsConstruction008', 0, function () {
        let params = new Url.URLSearchParams()
        params.append('abcde','fghki')
        var paramsResult = params.toString()
        expect(paramsResult).assertEqual('abcde=fghki')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_16600
   * @tc.name: testNewUrl001
   * @tc.desc:  The second parameter of Url construction is undefined or null.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testNewUrl001', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment', undefined)
        let result = params.toString()
        expect(result).assertEqual("http://username:password@host:8080/directory/file?query#fragment")
        let params1 = new Url.URL('http://username:password@host:8080/directory/file?query#fragment', null)
        let result2 = params1.toString()
        expect(result2).assertEqual("http://username:password@host:8080/directory/file?query#fragment")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_16700
   * @tc.name: testUrlToString001
   * @tc.desc:  Returns the serialized URL as a string.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlToString001', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        var result= params.toString()
        expect(result).assertEqual("http://username:password@host:8080/directory/file?query#fragment")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_16800
   * @tc.name: testUrlToString002
   * @tc.desc:  Returns the serialized URL as a string.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlToString002', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file')
        var result= params.toString()
        expect(result).assertEqual("http://username:password@host:8080/directory/file")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_16900
   * @tc.name: testUrlToString003
   * @tc.desc:  Returns the serialized URL as a string.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlToString003', 0, function () {
        let params = new Url.URL('http://username:password@host:8080#fragment')
        var result= params.toString()
        expect(result).assertEqual("http://username:password@host:8080/#fragment")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_17000
   * @tc.name: testUrlToString004
   * @tc.desc:  Returns the serialized URL as a string.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlToString004', 0, function () {
        let params = new Url.URL('http1://host/directory/file?query#fragment')
        var result= params.toString()
        expect(result).assertEqual("http1://host/directory/file?query#fragment")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_17100
   * @tc.name: testUrlToString005
   * @tc.desc:  Returns the serialized URL as a string.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlToString005', 0, function () {
        let params = new Url.URL('http:host:8080/directory/file?query#fragment')
        var result= params.toString()
        expect(result).assertEqual("http://host:8080/directory/file?query#fragment")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_17200
   * @tc.name: testUrlToString006
   * @tc.desc:  Returns the serialized URL as a string.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlToString006', 0, function () {
        let params = new Url.URL('https://255.16581375')
        var result= params.toString()
        expect(result).assertEqual("https://255.253.2.255/")
    })
    
   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_17300
   * @tc.name: testUrlToString007
   * @tc.desc:  Returns the serialized URL as a string.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlToString007', 0, function () {
        let params = new Url.URL('https://192.1.')
        var result= params.toString()
        expect(result).assertEqual("https://192.0.0.1/")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_17400
   * @tc.name: testUrlToString008
   * @tc.desc:  Returns the serialized URL as a string.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlToString008', 0, function () {
        let params = new Url.URL('https://192.1..')
        var result= params.toString()
        expect(result).assertEqual("https://192.1../")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_17500
   * @tc.name: testUrlToString009
   * @tc.desc:  Returns the serialized URL as a string.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlToString009', 0, function () {
        let params = new Url.URL('https://192.95645654354.8.f')
        var result= params.toString()
        expect(result).assertEqual("https://192.95645654354.8.f/")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_17600
   * @tc.name: testUrlHref001
   * @tc.desc:  Gets and sets the serialized URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlHref001', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        var result= params.href
        expect(result).assertEqual("http://username:password@host:8080/directory/file?query#fragment")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_17700
   * @tc.name: testUrlHref002
   * @tc.desc:  Gets and sets the serialized URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlHref002', 0, function () {
        let params = new Url.URL('http://host:8080/directory/file?query#fragment')
        var result= params.href
        expect(result).assertEqual("http://host:8080/directory/file?query#fragment")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_17800
   * @tc.name: testUrlHref003
   * @tc.desc:  Gets and sets the serialized URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlHref003', 0, function () {
        let params = new Url.URL('http://username:password@host:8080')
        var result= params.href
        expect(result).assertEqual("http://username:password@host:8080/")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_17900
   * @tc.name: testUrlHref004
   * @tc.desc:  Gets and sets the serialized URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlHref004', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.href = 'http1://myhost/path?sss=1#ff';
        var result= params.href
        expect(result).assertEqual("http1://myhost/path?sss=1#ff")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_18000
   * @tc.name: testUrlHref005
   * @tc.desc:  Gets and sets the serialized URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlHref005', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.href = 'http://myhost:99/path#ff';
        var result= params.href
        expect(result).assertEqual("http://myhost:99/path#ff")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_18100
   * @tc.name: testUrlOrigin001
   * @tc.desc:  Gets the read-only serialization of the URL's origin.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlOrigin001', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        var result= params.origin
        expect(result).assertEqual('http://host:8080')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_18200
   * @tc.name: testUrlOrigin002
   * @tc.desc:  Gets the read-only serialization of the URL's origin.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlOrigin002', 0, function () {
        let params = new Url.URL('http://username:password@host:11/directory/file?query#fragment')
        var result= params.origin
        expect(result).assertEqual('http://host:11')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_18300
   * @tc.name: testUrlOrigin003
   * @tc.desc:  Gets the read-only serialization of the URL's origin.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlOrigin003', 0, function () {
        let params = new Url.URL('http://username:password@host/directory/file?query#fragment')
        var result= params.origin
        expect(result).assertEqual('http://host')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_18400
   * @tc.name: testUrlOrigin004
   * @tc.desc:  Gets the read-only serialization of the URL's origin.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlOrigin004', 0, function () {
        let params = new Url.URL('http://username:password@aaaasshost:212/directory/file?query#fragment')
        var result= params.origin
        expect(result).assertEqual('http://aaaasshost:212')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_18500
   * @tc.name: testUrlOrigin005
   * @tc.desc:  Gets the read-only serialization of the URL's origin.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlOrigin005', 0, function () {
        let params = new Url.URL('http://username:password@host22:100#fragment')
        var result= params.origin
        expect(result).assertEqual('http://host22:100')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_18600
   * @tc.name: testUrlProtocol001
   * @tc.desc: Gets and sets the protocol portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlProtocol001', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        var result= params.protocol
        expect(result).assertEqual('http:')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_18700
   * @tc.name: testUrlProtocol002
   * @tc.desc: Gets and sets the protocol portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlProtocol002', 0, function () {
        let params = new Url.URL('http1://username:password@host:8080/directory/file?query#fragment')
        var result= params.protocol
        expect(result).assertEqual('http1:')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_18800
   * @tc.name: testUrlProtocol003
   * @tc.desc: Gets and sets the protocol portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlProtocol003', 0, function () {
        let params = new Url.URL('https://username:password@host:8080/directory/file?query#fragment')
        var result= params.protocol
        expect(result).assertEqual('https:')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_18900
   * @tc.name: testUrlProtocol004
   * @tc.desc: Gets and sets the protocol portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlProtocol004', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.protocol = 'https:';
        var result= params.protocol
        expect(result).assertEqual('https:')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_19000
   * @tc.name: testUrlProtocol005
   * @tc.desc: Gets and sets the protocol portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlProtocol005', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.protocol = 'ftp:';
        var result= params.protocol
        expect(result).assertEqual('ftp:')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_19100
   * @tc.name: testUrlUsername001
   * @tc.desc: Gets and sets the username portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlUsername001', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        var result= params.username
        expect(result).assertEqual('username')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_19200
   * @tc.name: testUrlUsername002
   * @tc.desc: Gets and sets the username portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlUsername002', 0, function () {
        let params = new Url.URL('http://zhao:password@host:8080/directory/file?query#fragment')
        var result= params.username
        expect(result).assertEqual('zhao')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_19300
   * @tc.name: testUrlUsername003
   * @tc.desc: Gets and sets the username portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlUsername003', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.username = 'skk'
        var result= params.username
        expect(result).assertEqual('skk')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_19400
   * @tc.name: testUrlUsername004
   * @tc.desc: Gets and sets the username portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlUsername004', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.username = 'skp111'
        var result= params.username
        expect(result).assertEqual('skp111')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_19500
   * @tc.name: testUrlUsername005
   * @tc.desc: Gets and sets the username portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlUsername005', 0, function () {
        let params = new Url.URL('http://usme@host:8080/directory/file?query#fragment')
        var result= params.username
        expect(result).assertEqual('usme')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_19600
   * @tc.name: testUrlPassword001
   * @tc.desc: Gets and sets the password portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlPassword001', 0, function () {
        let params = new Url.URL('http://username:11@host:8080/directory/file?query#fragment')
        var result= params.password
        expect(result).assertEqual('11')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_19700
   * @tc.name: testUrlPassword002
   * @tc.desc: Gets and sets the password portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlPassword002', 0, function () {
        let params = new Url.URL('http://username:23aa@host:8080/directory/file?query#fragment')
        var result= params.password
        expect(result).assertEqual('23aa')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_19800
   * @tc.name: testUrlPassword003
   * @tc.desc: Gets and sets the password portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlPassword003', 0, function () {
        let params = new Url.URL('http://username@host:8080/directory/file?query#fragment')
        var result= params.password
        expect(result).assertEqual('')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_19900
   * @tc.name: testUrlPassword004
   * @tc.desc: Gets and sets the password portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlPassword004', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.password = '1234'
        var result= params.password
        expect(result).assertEqual('1234')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_20000
   * @tc.name: testUrlPassword005
   * @tc.desc: Gets and sets the password portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlPassword005', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.password = '';
        var result= params.password
        expect(result).assertEqual('')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_20100
   * @tc.name: testUrlHost001
   * @tc.desc: Gets and sets the host portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlHost001', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        var result= params.host
        expect(result).assertEqual('host:8080')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_20200
   * @tc.name: testUrlHost002
   * @tc.desc: Gets and sets the host portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlHost002', 0, function () {
        let params = new Url.URL('http://username:password@hosthost/directory/file?query#fragment')
        var result= params.host
        expect(result).assertEqual('hosthost')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_20300
   * @tc.name: testUrlHost003
   * @tc.desc: Gets and sets the host portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlHost003', 0, function () {
        let params = new Url.URL('http://username:password@host:199/directory/file?query#fragment')
        var result= params.host
        expect(result).assertEqual('host:199')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_20400
   * @tc.name: testUrlHost004
   * @tc.desc: Gets and sets the host portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlHost004', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.host = 'jkjk'
        var result= params.host
        expect(result).assertEqual('jkjk:8080')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_20500
   * @tc.name: testUrlHost005
   * @tc.desc: Gets and sets the host portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlHost005', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.host = 'jkjk:100'
        var result= params.host
        expect(result).assertEqual('jkjk:100')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_20600
   * @tc.name: testUrlHostname001
   * @tc.desc: Gets and sets the host name portion of the URL，not include the port.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlHostname001', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        var result= params.hostname
        expect(result).assertEqual('host')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_20700
   * @tc.name: testUrlHostname002
   * @tc.desc: Gets and sets the host name portion of the URL，not include the port.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlHostname002', 0, function () {
        let params = new Url.URL('http://username:password@host123:8080/directory/file?query#fragment')
        var result= params.hostname
        expect(result).assertEqual('host123')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_20800
   * @tc.name: testUrlHostname003
   * @tc.desc: Gets and sets the host name portion of the URL，not include the port.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlHostname003', 0, function () {
        let params = new Url.URL('http://username:password@885ssa:8080/directory/file?query#fragment')
        var result= params.hostname
        expect(result).assertEqual('885ssa')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_20900
   * @tc.name: testUrlHostname004
   * @tc.desc: Gets and sets the host name portion of the URL，not include the port.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlHostname004', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.hostname = 'sksk'
        var result= params.hostname
        expect(result).assertEqual('sksk')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_21000
   * @tc.name: testUrlHostname005
   * @tc.desc: Gets and sets the host name portion of the URL，not include the port.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlHostname005', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.hostname = 'hosthost'
        var result= params.hostname
        expect(result).assertEqual('hosthost')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_21100
   * @tc.name: testUrlPort001
   * @tc.desc: Gets and sets the port portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlPort001', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        var result= params.port
        expect(result).assertEqual('8080')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_21200
   * @tc.name: testUrlPort002
   * @tc.desc: Gets and sets the port portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlPort002', 0, function () {
        let params = new Url.URL('http://username:password@host:100/directory/file?query#fragment')
        var result= params.port
        expect(result).assertEqual('100')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_21300
   * @tc.name: testUrlPort003
   * @tc.desc: Gets and sets the port portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlPort003', 0, function () {
        let params = new Url.URL('http://username:password@host/directory/file?query#fragment')
        var result= params.port
        expect(result).assertEqual('')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_21400
   * @tc.name: testUrlPort004
   * @tc.desc: Gets and sets the port portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlPort004', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.port = '99'
        var result= params.port
        expect(result).assertEqual('99')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_21500
   * @tc.name: testUrlPort005
   * @tc.desc: Gets and sets the port portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlPort005', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.port = '123'
        var result= params.port
        expect(result).assertEqual('123')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_21600
   * @tc.name: testUrlPathname001
   * @tc.desc: Gets and sets the path portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlPathname001', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        var result= params.pathname
        expect(result).assertEqual('/directory/file')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_21700
   * @tc.name: testUrlPathname002
   * @tc.desc: Gets and sets the path portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlPathname002', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory?query#fragment')
        var result= params.pathname
        expect(result).assertEqual('/directory')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_21800
   * @tc.name: testUrlPathname003
   * @tc.desc: Gets and sets the path portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlPathname003', 0, function () {
        let params = new Url.URL('http://username:password@host:8080?query#fragment')
        var result= params.pathname
        expect(result).assertEqual('/')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_21900
   * @tc.name: testUrlPathname004
   * @tc.desc: Gets and sets the path portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlPathname004', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.pathname = 'path'
        var result= params.pathname
        expect(result).assertEqual('/path')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_22000
   * @tc.name: testUrlPathname005
   * @tc.desc: Gets and sets the path portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlPathname005', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query#fragment')
        params.pathname = '/directory/file11'
        var result= params.pathname
        expect(result).assertEqual('/directory/file11')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_22100
   * @tc.name: testUrlSearch001
   * @tc.desc: Gets and sets the serialized query portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSearch001', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=qqqq#fragment')
        var result= params.search
        expect(result).assertEqual('?query=qqqq')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_22200
   * @tc.name: testUrlSearch002
   * @tc.desc: Gets and sets the serialized query portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSearch002', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=qqqq&ll=pp#fragment')
        var result= params.search
        expect(result).assertEqual('?query=qqqq&ll=pp')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_22300
   * @tc.name: testUrlSearch003
   * @tc.desc: Gets and sets the serialized query portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSearch003', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?ppp9875=77#fragment')
        var result= params.search
        expect(result).assertEqual('?ppp9875=77')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_22400
   * @tc.name: testUrlSearch004
   * @tc.desc: Gets and sets the serialized query portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSearch004', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=qqqq#fragment')
        params.search = 'kk=99'
        var result= params.search
        expect(result).assertEqual('?kk=99')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_22500
   * @tc.name: testUrlSearch005
   * @tc.desc: Gets and sets the serialized query portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSearch005', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=qqqq#fragment')
        params.search = 'pppk=99'
        var result= params.search
        expect(result).assertEqual('?pppk=99')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_22600
   * @tc.name: testUrlHash001
   * @tc.desc: Gets and sets the fragment portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlHash001', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=pppppp#fragment')
        var result= params.hash
        expect(result).assertEqual('#fragment')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_22700
   * @tc.name: testUrlHash002
   * @tc.desc: Gets and sets the fragment portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlHash002', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=pppppp#fragment')
        params.hash = '123456'
        var result= params.hash
        expect(result).assertEqual('#123456')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_22800
   * @tc.name: testUrlHash003
   * @tc.desc: Gets and sets the fragment portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlHash003', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=pppppp#poiu')
        var result= params.hash
        expect(result).assertEqual('#poiu')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_22900
   * @tc.name: testUrlHash004
   * @tc.desc: Gets and sets the fragment portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlHash004', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=pppppp')
        var result= params.hash
        expect(result).assertEqual('')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_23000
   * @tc.name: testUrlHash005
   * @tc.desc: Gets and sets the fragment portion of the URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlHash005', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=pppppp#fragment')
        params.hash = 'qwer'
        var result= params.hash
        expect(result).assertEqual('#qwer')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_23100
   * @tc.name: testUrlSearchParams001
   * @tc.desc: Gets the SearchParams portion of the URL
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
     it('testUrlSearchParams001', 0, function () {
        var that = new Url.URL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        var params = that.searchParams
        var result = params.toString()
        expect(result).assertEqual('foo=1&bar=2')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_23200
   * @tc.name: testUrlSearchParams002
   * @tc.desc: Gets the SearchParams portion of the URL
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSearchParams002', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = that.searchParams
        params.append("ma 大","jk￥")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&ma+%E5%A4%A7=jk%EF%BF%A5")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_23300
   * @tc.name: testUrlSearchParams003
   * @tc.desc: Gets the SearchParams portion of the URL
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSearchParams003', 0, function () {
        let that = new Url.URL('https://example.com?d=value1&c=value2&b=大&4=key4')
        let params = that.searchParams
        var result = params.toString()
        expect(result).assertEqual("d=value1&c=value2&b=%E5%A4%A7&4=key4")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_23400
   * @tc.name: testUrlSearchParams004
   * @tc.desc: Gets the SearchParams portion of the URL
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSearchParams004', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let params = that.searchParams
        params.append("foo~!@#$%^&*()_+-=","jk")
        var result = params.toString()
        expect(result).assertEqual("foo=1&bar=2&foo%7E%21%40%23%24%25%5E%26*%28%29_%2B-%3D=jk")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_23500
   * @tc.name: testUrlSearchParams005
   * @tc.desc: Gets the SearchParams portion of the URL
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlSearchParams005', 0, function () {
        let that = new Url.URL('http://username:password@host:8080/directory/file?你好=china#qwer=da')
        let params = that.searchParams
        var result = params.toString()
        expect(result).assertEqual("%E4%BD%A0%E5%A5%BD=china")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_23600
   * @tc.name: testUrlURLParams001
   * @tc.desc: Gets the SearchParams portion of the URL
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlURLParams001', 0, function () {
        var that = new Url.URL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        var seach = that.params
        var result = seach.toString()
        expect(result).assertEqual('foo=1&bar=2')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_23700
   * @tc.name: testUrlURLParams002
   * @tc.desc: Gets the SearchParams portion of the URL
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlURLParams002', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let seach = that.params
        seach.append("ma 大","jk￥")
        var result = seach.toString()
        expect(result).assertEqual("foo=1&bar=2&ma+%E5%A4%A7=jk%EF%BF%A5")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_23800
   * @tc.name: testUrlURLParams003
   * @tc.desc: Gets the SearchParams portion of the URL
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlURLParams003', 0, function () {
        let that = new Url.URL('https://example.com?d=value1&c=value2&b=大&4=key4')
        let seach = that.params
        var result = seach.toString()
        expect(result).assertEqual("d=value1&c=value2&b=%E5%A4%A7&4=key4")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_23900
   * @tc.name: testUrlURLParams004
   * @tc.desc: Gets the SearchParams portion of the URL
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlURLParams004', 0, function () {
        let that = new Url.URL('https://example.com?foo=1&bar=2')
        let seach = that.params
        seach.append("foo~!@#$%^&*()_+-=","jk")
        var result = seach.toString()
        expect(result).assertEqual("foo=1&bar=2&foo%7E%21%40%23%24%25%5E%26*%28%29_%2B-%3D=jk")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_24000
   * @tc.name: testUrlURLParams005
   * @tc.desc: Gets the SearchParams portion of the URL
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlURLParams005', 0, function () {
        let that = new Url.URL('http://username:password@host:8080/directory/file?你好=china#qwer=da')
        let seach = that.params
        var result = seach.toString()
        expect(result).assertEqual("%E4%BD%A0%E5%A5%BD=china")
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_24100
   * @tc.name: testUrlToJson001
   * @tc.desc: Returns the serialized URL as a string.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlToJson001', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory/file?query=pppppp#qwer=da')
        var result= params.toJSON()
        expect(result).assertEqual('http://username:password@host:8080/directory/file?query=pppppp#qwer=da')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_24200
   * @tc.name: testUrlToJson002
   * @tc.desc: Returns the serialized URL as a string.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlToJson002', 0, function () {
        let params = new Url.URL('http://host:8080/directory/file?query=pppppp#qwer=da')
        var result= params.toJSON()
        expect(result).assertEqual('http://host:8080/directory/file?query=pppppp#qwer=da')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_24300
   * @tc.name: testUrlToJson003
   * @tc.desc: Returns the serialized URL as a string.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlToJson003', 0, function () {
        let params = new Url.URL('http://username:password@host:8080')
        var result= params.toJSON()
        expect(result).assertEqual('http://username:password@host:8080/')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_24400
   * @tc.name: testUrlToJson004
   * @tc.desc: Returns the serialized URL as a string.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlToJson004', 0, function () {
        let params = new Url.URL('http11://username:password@host:8080?query=pppppp#qwer=da')
        var result= params.toJSON()
        expect(result).assertEqual('http11://username:password@host:8080?query=pppppp#qwer=da')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_24500
   * @tc.name: testUrlToJson005
   * @tc.desc: Returns the serialized URL as a string.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlToJson005', 0, function () {
        let params = new Url.URL('http://username:password@host:8080/directory')
        var result= params.toJSON()
        expect(result).assertEqual('http://username:password@host:8080/directory')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_24600
   * @tc.name: testUrlIPv6001
   * @tc.desc: Gets and sets the serialized URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlIPv6001', 0, function () {
        let params = new Url.URL('http://[FEDC:BA98:7654:3210:FEDC:BA98:7654:3210]:80/index.html')
        var result= params.href
        expect(result).assertEqual('http://[fedc:ba98:7654:3210:fedc:ba98:7654:3210]/index.html')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_24700
   * @tc.name: testUrlIPv6002
   * @tc.desc: Gets and sets the serialized URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlIPv6002', 0, function () {
        let params = new Url.URL('http://[1080:0:0:0:8:800:200C:417A]/index.html')
        var result= params.href
        expect(result).assertEqual('http://[1080::8:800:200c:417a]/index.html')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_24800
   * @tc.name: testUrlIPv6003
   * @tc.desc: Gets and sets the serialized URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlIPv6003', 0, function () {
        let params = new Url.URL('http://[::FFFF:129.144.52.38]:80/index.html')
        var result= params.href
        expect(result).assertEqual('http://[::ffff:8190:3426]/index.html')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_24900
   * @tc.name: testUrlIPv4001
   * @tc.desc: Gets and sets the serialized URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlIPv4001', 0, function () {
        let params = new Url.URL('http://0377.0xff.255.1:80/index.html')
        var result= params.href
        expect(result).assertEqual('http://255.255.255.1/index.html')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_25000
   * @tc.name: testUrlIPv4002
   * @tc.desc: Gets and sets the serialized URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlIPv4002', 0, function () {
        let params = new Url.URL('http://0377.0xff.255.g/index.html')
        var result= params.href
        expect(result).assertEqual('http://0377.0xff.255.g/index.html')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_25100
   * @tc.name: testUrlIPv4003
   * @tc.desc: Gets and sets the serialized URL.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlIPv4003', 0, function () {
        let params = new Url.URL('http://190.254.245.9:80/index.html')
        var result= params.href
        expect(result).assertEqual('http://190.254.245.9/index.html')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_25200
   * @tc.name: testUrlConstruction001
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlConstruction001', 0, function () {
        let params = new Url.URL('https://developer.mozilla.org',)
        var result= params.href
        expect(result).assertEqual('https://developer.mozilla.org/')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_25300
   * @tc.name: testUrlConstruction002
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlConstruction002', 0, function () {
        let params = new Url.URL('https://developer.mozilla.org','flie:/developer.mozilla.org')
        var result= params.href
        expect(result).assertEqual('https://developer.mozilla.org/')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_25400
   * @tc.name: testUrlConstruction003
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlConstruction003', 0, function () {
        let params = new Url.URL('https://developer.mozilla.org','ftp://www.example.com')
        var result= params.href
        expect(result).assertEqual('https://developer.mozilla.org/')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_25500
   * @tc.name: testUrlConstruction004
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlConstruction004', 0, function () {
        let params = new Url.URL(' ', 'http://www.example.com')
        var result= params.href
        expect(result).assertEqual('http://www.example.com/')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_25600
   * @tc.name: testUrlConstruction005
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlConstruction005', 0, function () {
        let params = new Url.URL('.', 'http://www.example.com')
        var result= params.href
        expect(result).assertEqual('http://www.example.com/')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_25700
   * @tc.name: testUrlConstruction006
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlConstruction006', 0, function () {
        let params = new Url.URL('../h:', 'http://www.example.com')
        var result= params.href
        expect(result).assertEqual('http://www.example.com/h:')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_25800
   * @tc.name: testUrlConstruction007
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlConstruction007', 0, function () {
        let params = new Url.URL('/sca/./path/path/../scasa/jjjjj', 'http://www.example.com')
        var result= params.href
        expect(result).assertEqual('http://www.example.com/sca/path/scasa/jjjjj')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_25900
   * @tc.name: testUrlConstruction008
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlConstruction008', 0, function () {
        let params = new Url.URL('/../sca/./path/path/../scasa/jjjjj', 'http://www.example.com')
        var result= params.href
        expect(result).assertEqual('http://www.example.com/sca/path/scasa/jjjjj')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_26000
   * @tc.name: testUrlConstruction009
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlConstruction009', 0, function () {
        let params = new Url.URL( '/../sca/./path/path/../scasa/jjjjj', 'file://www.example.com')
        var result= params.href
        expect(result).assertEqual('file://www.example.com/sca/path/scasa/jjjjj')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_26100
   * @tc.name: testUrlConstruction010
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlConstruction010', 0, function () {
        let params = new Url.URL('/../sca/./path/path/../scasa/jjjjj', 'file1://www.example.com')
        var result= params.href
        expect(result).assertEqual('file1://www.example.com/sca/path/scasa/jjjjj')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_26200
   * @tc.name: testUrlConstruction011
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlConstruction011', 0, function () {
        let params = new Url.URL('htt1p://www.0902zy.cn/path?abc=123&def=456#yyyy')
        let params1 = new Url.URL('www.baidu.com/ssaa',params)
        var result = params1.href
        expect(result).assertEqual('htt1p://www.0902zy.cn/www.baidu.com/ssaa')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_26300
   * @tc.name: testUrlConstruction012
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlConstruction012', 0, function () {
        let params = new Url.URL('htt1p://www.0902zy.cn/path?abc=123&def=456#yyyy')
        let params1 = new Url.URL('//www.baidu.com/ssaa',params)
        var result = params1.href
        expect(result).assertEqual('htt1p://www.baidu.com/ssaa')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_26400
   * @tc.name: testUrlConstruction013
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlConstruction013', 0, function () {
        let params = new Url.URL('htt1p://www.0902zy.cn/path?abc=123&def=456#yyyy')
        let params1 = new Url.URL('',params)
        var result = params1.href
        expect(result).assertEqual('htt1p://www.0902zy.cn/path?abc=123&def=456#yyyy')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_26500
   * @tc.name: testUrlConstruction014
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlConstruction014', 0, function () {
        let params = new Url.URL('htt1p://www.0902zy.cn/path?abc=123&def=456#yyyy')
        var result = params.searchParams.toString();
        expect(result).assertEqual('abc=123&def=456')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_26600
   * @tc.name: testUrlparseURL001
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlparseURL001', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('https://developer.mozilla.org',)
        var result= params2.href
        expect(result).assertEqual('https://developer.mozilla.org/')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_26700
   * @tc.name: testUrlparseURL002
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlparseURL002', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 = Url.URL.parseURL('https://developer.mozilla.org','flie:/developer.mozilla.org')
        var result= params2.href
        expect(result).assertEqual('https://developer.mozilla.org/')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_26800
   * @tc.name: testUrlparseURL003
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlparseURL003', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 = Url.URL.parseURL('https://developer.mozilla.org','ftp://www.example.com')
        var result= params2.href
        expect(result).assertEqual('https://developer.mozilla.org/')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_26900
   * @tc.name: testUrlparseURL004
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlparseURL004', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 = Url.URL.parseURL(' ', 'http://www.example.com')
        var result= params2.href
        expect(result).assertEqual('http://www.example.com/')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_27000
   * @tc.name: testUrlparseURL005
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlparseURL005', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 = Url.URL.parseURL('.', 'http://www.example.com')
        var result= params2.href
        expect(result).assertEqual('http://www.example.com/')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_27100
   * @tc.name: testUrlparseURL006
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlparseURL006', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 = Url.URL.parseURL('../h:', 'http://www.example.com')
        var result= params2.href
        expect(result).assertEqual('http://www.example.com/h:')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_27200
   * @tc.name: testUrlparseURL007
   * @tc.desc: URL constructor, BusinessError: Parameter error.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlparseURL007', 0, function () {
        try{
            let params = new Url.URL()
            expect(params != null).assertTrue()
            var a = undefined
            Url.URL.parseURL(a)
            expect(0).assertEqual(1)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${a} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${a} must be string`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_27300
   * @tc.name: testUrlparseURL008
   * @tc.desc: URL constructor, BusinessError: Parameter error.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlparseURL008', 0, function () {
        try{
            let params = new Url.URL()
            expect(params != null).assertTrue()
            var a = 666;
            var b = 666;
            Url.URL.parseURL(a, b)
            expect(0).assertEqual(1)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${a} must be string`)
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${a} must be string`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_27400
   * @tc.name: testUrlparseURL009
   * @tc.desc: URL constructor, BusinessError: Parameter error.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlparseURL009', 0, function () {
        try{
            let params = new Url.URL()
            expect(params != null).assertTrue()
            var a = '666666';
            var b = 666666;
            Url.URL.parseURL(a, b)
            expect(0).assertEqual(1)
        } catch(err) {
            expect(err.toString()).assertEqual(`BusinessError: Parameter error.The type of ${b} must be string or URL`);
            expect(err.code).assertEqual(401)
            expect(err.message).assertEqual(`Parameter error.The type of ${b} must be string or URL`);
        }
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_27500
   * @tc.name: testUrlparseURL0010
   * @tc.desc: URL constructor, BusinessError: Parameter error.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlparseURL0010', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_27600
   * @tc.name: testUrlparseURL0011
   * @tc.desc: The second parameter of parseURL is undefined or null.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlparseURL0011', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_27700
   * @tc.name: testUrlparseURL0012
   * @tc.desc: The second parameter of parseURL is undefined or null.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
     it('testUrlparseURL0012', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('http://168')
        var result= params2.href
        expect(result).assertEqual('http://0.0.0.168/')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_27800
   * @tc.name: testUrlparseURL0013
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlparseURL0013', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('http://168.')
        var result= params2.href
        expect(result).assertEqual('http://0.0.0.168/')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_27900
   * @tc.name: testUrlparseURL0014
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlparseURL0014', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('http://168.1')
        var result= params2.href
        expect(result).assertEqual('http://168.0.0.1/')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_28000
   * @tc.name: testUrlparseURL0015
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlparseURL0015', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('http://168.1.')
        var result= params2.href
        expect(result).assertEqual('http://168.0.0.1/')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_28100
   * @tc.name: testUrlparseURL0016
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlparseURL0016', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('http://168.1.1')
        var result= params2.href
        expect(result).assertEqual('http://168.1.0.1/')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_28200
   * @tc.name: testUrlparseURL0017
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlparseURL0017', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('http://168.60.114.105')
        var result= params2.href
        expect(result).assertEqual('http://168.60.114.105/')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_28300
   * @tc.name: testUrlparseURL0018
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlparseURL0018', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('http://168.1.399')
        var result= params2.href
        expect(result).assertEqual('http://168.1.1.143/')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_28400
   * @tc.name: testUrlparseURL0019
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlparseURL0019', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('http://168.3.0XFF')
        var result= params2.href
        expect(result).assertEqual('http://168.3.0.255/')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_28500
   * @tc.name: testUrlparseURL0020
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlparseURL0020', 0, function () {
        let params = new Url.URL()
        expect(params != null).assertTrue()
        let params2 =  Url.URL.parseURL('http://168.3.65535')
        var result= params2.href
        expect(result).assertEqual('http://168.3.255.255/')
    })

   /**
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_28600
   * @tc.name: testUrlparseURL0021
   * @tc.desc: URL constructor, throw BusinessError: Syntax Error. Invalid Url string.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlparseURL0021', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_28700
   * @tc.name: testUrlparseURL0022
   * @tc.desc: URL constructor, throw BusinessError: Syntax Error. Invalid Url string.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlparseURL0022', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_28800
   * @tc.name: testUrlparseURL0023
   * @tc.desc: URL constructor, throw BusinessError: Syntax Error. Invalid Url string.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlparseURL0023', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_28900
   * @tc.name: testUrlparseURL0024
   * @tc.desc: URL constructor, throw BusinessError: Syntax Error. Invalid Url string.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlparseURL0024', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_29000
   * @tc.name: testUrlparseURL0025
   * @tc.desc: URL constructor, throw BusinessError: Syntax Error. Invalid Url string.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
    it('testUrlparseURL0025', 0, function () {
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
   * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_URL_29100
   * @tc.name: testUrlparseURL0026
   * @tc.desc: URL constructor, which is used to instantiate a URL object.
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 2
   */
        it('testUrlparseURL0026', 0, function () {
        let params2 =  Url.URL.parseURL('http://192.0x.9.')
        var result= params2.toString();
        expect(result).assertEqual('http://192.0.0.9/')
    })
})}