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
import util from '@ohos.util'
import url from '@ohos.url'
import app from '@system.app'
import process from '@ohos.process'
import file from '@system.file';

class Temperature {
    constructor(value) {
        this._temp = value;
    }
    compareTo(value) {
        return this._temp >= value.getTemp();
    }
    getTemp() {
        return this._temp;
    }
    toString() {
        return this._temp.toString();
    }
}
var tempLower = new Temperature(30);
var tempUpper = new Temperature(40);
var tempLess = new Temperature(20);
var tempMiDF = new Temperature(35);
var tempMidS = new Temperature(39);
var tempMore = new Temperature(45);

var range = new util.Scope(tempLower, tempUpper);
var rangeFir = new util.Scope(tempMiDF, tempMidS);
var rangeSec = new util.Scope(tempLess, tempMore);
var rangeThi = new util.Scope(tempLess, tempMiDF);
var rangeFif = new util.Scope(tempMiDF, tempMore);

var rangeHp = new util.ScopeHelper(tempLower, tempUpper);
var rangeHpFir = new util.ScopeHelper(tempMiDF, tempMidS);
var rangeHpSec = new util.ScopeHelper(tempLess, tempMore);
var rangeHpThi = new util.ScopeHelper(tempLess, tempMiDF);
var rangeHpFif = new util.ScopeHelper(tempMiDF, tempMore);

export default function UtilFunTest() {
describe('TextEncoderTest', function () {

    /**
     * @tc.name: testUtilPrintf001
     * @tc.desc: Returns the formatted string.
     */
    it('testUtilPrintf001', 0, function () {
        var format = "%i,%s";
        var value1 = 1.5;
        var value2 = "qwer";
        var value3 = 15;
        var result = util.printf(format, value1, value2, value3);
        expect(result).assertEqual("1,qwer 15");
    })

    /**
     * @tc.name: testUtilPrintf002
     * @tc.desc: Returns the formatted string.
     */
    it('testUtilPrintf002', 0, function () {
        var format = "%O";
        var value = { name: 'jack' ,age: 15 };
        var result = util.printf(format, value);
        expect(result).assertEqual("{ name: 'jack',\n  age: 15 }");
    })

    /**
     * @tc.name: testUtilPrintf003
     * @tc.desc: Returns the formatted string.
     */
    it('testUtilPrintf003', 0, function () {
        var format = "%o";
        var value = [1, 2, 3];
        var result = util.printf(format, value);
        var res = '[ 1, 2, 3, [length]: 3 ]'
        expect(result).assertEqual('[ 1, 2, 3, [length]: 3 ]');
    })

    /**
     * @tc.name: testUtilPrintf004
     * @tc.desc: Returns the formatted string.
     */
    it('testUtilPrintf004', 0, function () {
        var format = "%s,%s,%s";
        var value1 = "1.5";
        var value2 = "qwer";
        var result = util.printf(format, value1, value2);
        expect(result).assertEqual('1.5,qwer,%s');
    })

    /**
     * @tc.name: testUtilPrintf005
     * @tc.desc: Returns the formatted string.
     */
    it('testUtilPrintf005', 0, function () {
        var format = "%d,%d";
        var value1 = 6;
        var value2 = 16;
        var result = util.printf(format, value1, value2);
        expect(result).assertEqual('6,16');
    })

    /**
     * @tc.name: testUtilGetErrorString001
     * @tc.desc: Get the string name of the system errno.
     */
     it('testUtilGetErrorString001', 0, async function () {
        var errnum = 10;
        var result = util.getErrorString(errnum);
        expect(result).assertEqual('Unknown system error 10');
    })

    /**
     * @tc.name: testUtilGetErrorString002
     * @tc.desc: Get the string name of the system errno.
     */
    it('testUtilGetErrorString002', 0, async function () {
        var errnum = 0;
        var result = util.getErrorString(errnum);
        expect(result).assertEqual('Unknown system error 0');
    })

    /**
     * @tc.name: testUtilGetErrorString003
     * @tc.desc: Get the string name of the system errno.
     */
    it('testUtilGetErrorString003', 0, async function () {
        var errnum = -1;
        var result = util.getErrorString(errnum);
        expect(result).assertEqual('operation not permitted');
    })

    /**
     * @tc.name: testUtilGetErrorString004
     * @tc.desc: Get the string name of the system errno.
     */
    it('testUtilGetErrorString004', 0, async function () {
        var errnum = 9;
        var result = util.getErrorString(errnum);
        expect(result).assertEqual('Unknown system error 9');
    })

    /**
     * @tc.name: testUtilGetErrorString005
     * @tc.desc: Get the string name of the system errno.
     */
    it('testUtilGetErrorString005', 0, async function () {
        var errnum = 555;
        var result = util.getErrorString(errnum);
        expect(result).assertEqual('Unknown system error 555');
    })

    /**
     * @tc.name: testUtilPromisify_new_001
     * @tc.desc: Takes a function following the common error-first callback style,
       taking an callback as the last argument, and return a function that returns promises.
     */
    it('testUtilPromisify_new_001', 0, async function () {
        function fn(val, callback) {
            if (typeof val === 'string') {
                callback(null, val);
            } else {
                callback('type err');
            }
        }
        (async () => {
            const value = await util.promisify(fn);
            expect(value(null, "Hello")).strictEqual('Hello');
        })();
    })

    /**
     * @tc.name: testUtilPromisify_new_002
     * @tc.desc: Takes a function following the common error-first callback style,
       taking an callback as the last argument, and return a function that returns promises.
     */
    it('testUtilPromisify_new_002', 0, async function () {
        function fn(str, callback) {
            if (typeof str === 'string') {
                callback(null, str);
            } else {
                callback('type err');
            }
        }
        (async () => {
            const value = await util.promisify(fn);
            expect(value(null, [1, 2])).strictEqual('type err');
        })();
    })

    /**
     * @tc.name: testUtilPromisify_new_003
     * @tc.desc: Takes a function following the common error-first callback style,
       taking an callback as the last argument, and return a function that returns promises.
     */
    it('testUtilPromisify_new_003', 0, async function () {
        function fn(err, val, callback) {
            callback(err, val);
        }
        (async () => {
            const value = await util.promisify(fn);
            expect(value(null, 42)).strictEqual(42);
        })();
    })

    /**
     * @tc.name: testUtilPromisify_new_004
     * @tc.desc: Takes a function following the common error-first callback style,
       taking an callback as the last argument, and return a function that returns promises.
     */
    it('testUtilPromisify_new_004', 0, async function () {
        function fn(val, callback) {
            if (typeof val === 'boolen') {
                callback(null, val);
            } else {
                callback('type err');
            }
        }
        (async () => {
            const value = await util.promisify(fn);
            expect(value(null, true)).strictEqual(true);
        })();
    })

    /**
     * @tc.name: testUtilPromisify_new_005
     * @tc.desc: Takes a function following the common error-first callback style,
       taking an callback as the last argument, and return a function that returns promises.
     */
    it('testUtilPromisify_new_005', 0, async function () {
        function fn(val, callback) {
            if (typeof val === 'number') {
                callback(null, val);
            } else {
                callback('type err');
            }
        }
        (async () => {
            const value = await util.promisify(fn);
            expect(value(null, 100)).strictEqual(100);
        })();
    })
    
    /**
     * @tc.name: testUtilPromiseWrapper001
     * @tc.desc: Takes a function following the common error-first callback style,
       taking an callback as the last argument, and return a version that returns promises.
     */
       it('testUtilPromiseWrapper001', 0, async function () {
        function aysnFun(str1, str2, callback) {
            if (typeof str1 === 'string' && typeof str1 === 'string') {
                callback(null, str1 + str2);
            } else {
                callback('type err');
            }
        }
        let newPromiseObj = util.promiseWrapper(aysnFun)("Hello", 'World');
        newPromiseObj.then(res => {
            expect(res).strictEqual('HelloWorld');
        })
    })

    /**
     * @tc.name: testUtilPromiseWrapper002
     * @tc.desc: Takes a function following the common error-first callback style,
       taking an callback as the last argument, and return a version that returns promises.
     */
    it('testUtilPromiseWrapper002', 0, async function () {
        function aysnFun(str1, str2, callback) {
            if (typeof str1 === 'string' && typeof str1 === 'string') {
                callback(null, str1 + str2);
            } else {
                callback('type err');
            }
        }
        let newPromiseObj = util.promiseWrapper(aysnFun)([1, 2], 'World');
        newPromiseObj.catch(err => {
            expect(err).strictEqual('type err');
        })
    })

    /**
     * @tc.name: testUtilPromiseWrapper003
     * @tc.desc: Takes a function following the common error-first callback style,
       taking an callback as the last argument, and return a version that returns promises.
     */
    it('testUtilPromiseWrapper003', 0, async function () {
        let errToThrow;
        const thrower = util.promiseWrapper(function(a, b, c, cb) {
            errToThrow = new Error();
            throw errToThrow;
        });
        thrower(1, 2, 3).catch(err => {
            expect(err).strictEqual(errToThrow);
        })
    })

    /**
     * @tc.name: testUtilPromiseWrapper004
     * @tc.desc: Takes a function following the common error-first callback style,
       taking an callback as the last argument, and return a version that returns promises.
     */
    it('testUtilPromiseWrapper004', 0, async function () {
        const err = new Error();
        const a = util.promiseWrapper((cb) => cb(err))();
        const b = util.promiseWrapper(() => {throw err;})();
        Promise.all([
            a.then(e => {
                expect(e).strictEqual(err);
            }),
            b.then(e => {
                expect(e).strictEqual(err);
            })
        ]);
    })

    /**
     * @tc.name: testUtilPromiseWrapper005
     * @tc.desc: Takes a function following the common error-first callback style,
       taking an callback as the last argument, and return a version that returns promises.
     */
    it('testUtilPromiseWrapper005', 0, async function () {
        const err = new Error('callback with the error.');
        const stack = err.stack;
        const fn = util.promiseWrapper(function(cb) {
            cb(null);
            cb(err);
        });
        (async () => {
            await fn();
            await Promise.resolve();
            return expect(stack).strictEqual(err.stack);
        })();
    })

    /**
     * @tc.name: testUtilPromiseWrapper006
     * @tc.desc: Takes a function following the common error-first callback style,
       taking an callback as the last argument, and return a version that returns promises.
     */
    it('testUtilPromiseWrapper006', 0, async function () {
        function fn(err, val, callback) {
            callback(err, val);
        }
        (async () => {
            const value = await util.promiseWrapper(fn)(null, 42);
            expect(value).strictEqual(42);
        })();
    })

    /**
     * @tc.name: testUtilCallbackWrapper001
     * @tc.desc: Takes an async function (or a function that returns a Promise) and
       returns a function following the error-first callback style.
     */
    it('testUtilCallbackWrapper001', 0, async function () {
        const promiseFn = [1, 2];
        try {
            util.callbackWrapper(promiseFn);
        } catch(e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error.The type of 1,2 must be function');
        }
    })

    /**
     * @tc.name: testUtilCallbackWrapper002
     * @tc.desc: Takes an async function (or a function that returns a Promise) and
       returns a function following the error-first callback style.
     */
    it('testUtilCallbackWrapper002', 0, async function () {
        async function promiseFn() {
            return Promise.resolve('value');
        }
        var cb = util.callbackWrapper(promiseFn);
        (async () => {
            cb((err, ret) => {
                expect(err).assertEqual(null);
                expect(ret).assertEqual('value');
            })
        })();
    })

    /**
     * @tc.name: testUtilCallbackWrapper003
     * @tc.desc: Takes an async function (or a function that returns a Promise) and
       returns a function following the error-first callback style.
     */
    it('testUtilCallbackWrapper003', 0, async function () {
        async function promiseFn() {
            return 42;
        }
        var cb = util.callbackWrapper(promiseFn);
        (async () => {
            cb((err, ret) => {
                expect(err).assertEqual(null);
                expect(ret).assertEqual(42);
            })
        })();
    })

    /**
     * @tc.name: testUtilCallbackWrapper004
     * @tc.desc: Takes an async function (or a function that returns a Promise) and
       returns a function following the error-first callback style.
     */
    it('testUtilCallbackWrapper004', 0, async function () {
        async function promiseFn() {
            var err = Error('value');
            return Promise.reject(err);
        }
        var cb = util.callbackWrapper(promiseFn);
        (async () => {
            cb((err, ret) => {
                expect(err.message).strictEqual('value');
                expect(ret).assertEqual(undefined);
            })
        })();
    })

    /**
     * @tc.name: testUtilCallbackWrapper005
     * @tc.desc: Takes an async function (or a function that returns a Promise) and
       returns a function following the error-first callback style.
     */
    it('testUtilCallbackWrapper005', 0, async function () {
        async function promiseFn(a, b) {
            return a + b;
        }
        var cb = util.callbackWrapper(promiseFn);
        (async () => {
            cb(1, 2, (err, ret) => {
                expect(err).assertEqual(null);
                expect(ret).assertEqual(3);
            })
        })();
    })

    /**
     * @tc.name: testUtilCallbackWrapper006
     * @tc.desc: Takes an async function (or a function that returns a Promise) and
       returns a function following the error-first callback style.
     */
    it('testUtilCallbackWrapper006', 0, async function () {
        async function promiseFn() {
            return null;
        }
        var cb = util.callbackWrapper(promiseFn);
        try {
            cb([1, 2]);
        } catch (err) {
            expect(err.message).assertEqual('maybe is not function');
        }
    })

    /**
     * @tc.name: testencoding_textdecoder_001
     * @tc.desc: The source encoding's name, lowercased.
     */
    it('testencoding_textdecoder_001', 0, function () {
        var  that = new util.TextDecoder('utf-8', { ignoreBOM : true })
        var retStr = that.encoding
        expect(retStr).assertEqual('utf-8')
    })

    /**
     * @tc.name: testencoding_textdecoder_002
     * @tc.desc: The source encoding's name, lowercased.
     */
    it('testencoding_textdecoder_002', 0, function () {
        var that = new util.TextDecoder('utf-16le')
        var encodingStr = that.encoding
        expect(encodingStr).assertEqual('utf-16le')
    })

    /**
     * @tc.name: testencoding_textdecoder_003
     * @tc.desc: The source encoding's name, lowercased.
     */
    it('testencoding_textdecoder_003', 0, function () {
        var that = new util.TextDecoder('utf-16be')
        var encodingStr = that.encoding
        expect(encodingStr).assertEqual('utf-16be')
    })

    /**
     * @tc.name: testencoding_textdecoder_004
     * @tc.desc: The source encoding's name, lowercased.
     */
    it('testencoding_textdecoder_004', 0, function () {
        var that = new util.TextDecoder('utf-16be', { ignoreBOM : true })
        var encodingStr = that.encoding
        expect(encodingStr).assertEqual('utf-16be')
    })

    /**
     * @tc.name: testencoding_textdecoder_005
     * @tc.desc: The source encoding's name, lowercased.
     */
    it('testencoding_textdecoder_005', 0, function () {
        var that = new util.TextDecoder('utf-16be', { ignoreBOM : false })
        var encodingStr = that.encoding
        expect(encodingStr).assertEqual('utf-16be')
    })


    /**
     * @tc.name: testFatal001
     * @tc.desc: Returns `true` if error mode is "fatal", and `false` otherwise.
     */
    it('testFatal001', 0, function () {
        var that = new util.TextDecoder('utf-16be', { fatal : true })
        var fatalStr = that.fatal
        expect(fatalStr).assertEqual(true)
    })

    /**
     * @tc.name: testFatal002
     * @tc.desc: Returns `true` if error mode is "fatal", and `false` otherwise.
     */
    it('testFatal002', 0, function () {
        var that = new util.TextDecoder('utf-16be', { fatal : false })
        var fatalStr = that.fatal
        expect(fatalStr).assertEqual(false)
    })

    /**
     * @tc.name: testFatal003
     * @tc.desc: Returns `true` if error mode is "fatal", and `false` otherwise.
     */
    it('testFatal003', 0, function () {
        var that = new util.TextDecoder('utf-16be')
        var fatalStr = that.fatal
        expect(fatalStr).assertEqual(false)
    })

    /**
     * @tc.name: testFatal004
     * @tc.desc: Returns `true` if error mode is "fatal", and `false` otherwise.
     */
    it('testFatal004', 0, function () {
        var that = new util.TextDecoder('utf-8')
        var fatalStr = that.fatal
        expect(fatalStr).assertEqual(false)
    })

    /**
     * @tc.name: testFatal005
     * @tc.desc: Returns `true` if error mode is "fatal", and `false` otherwise.
     */
    it('testFatal005', 0, function () {
        var that = new util.TextDecoder('utf-16le')
        var fatalStr = that.fatal
        expect(fatalStr).assertEqual(false)
    })

    /**
     * @tc.name: testFatal006
     * @tc.desc: Returns `true` if error mode is "fatal", and `false` otherwise.
     */
     it('testFatal006', 0, function () {
        var that = new util.TextDecoder('gbk')
        var fatalStr = that.fatal
        expect(fatalStr).assertEqual(false)
    })

    /**
     * @tc.name: testFatal007
     * @tc.desc: Returns `true` if error mode is "fatal", and `false` otherwise.
     */
     it('testFatal007', 0, function () {
        var that = new util.TextDecoder('gb18030')
        var fatalStr = that.fatal
        expect(fatalStr).assertEqual(false)
    })

    /**
     * @tc.name: testFatal008
     * @tc.desc: Returns `true` if error mode is "fatal", and `false` otherwise.
     */
     it('testFatal008', 0, function () {
        var that = new util.TextDecoder('gb2312')
        var fatalStr = that.fatal
        expect(fatalStr).assertEqual(false)
    })

    /**
     * @tc.name: testIgnoreBOM001
     * @tc.desc: Returns `true` if ignore BOM flag is set, and `false` otherwise.
     */
    it('testIgnoreBOM001', 0, function () {
        var that = new util.TextDecoder('utf-16be', { ignoreBOM : true })
        var ignoreBOMStr = that.ignoreBOM
        expect(ignoreBOMStr).assertEqual(true)
    })

    /**
     * @tc.name: testIgnoreBOM002
     * @tc.desc: Returns `true` if ignore BOM flag is set, and `false` otherwise.
     */
    it('testIgnoreBOM002', 0, function () {
        var that = new util.TextDecoder('utf-16be', { ignoreBOM : false })
        var ignoreBOMStr = that.ignoreBOM
        expect(ignoreBOMStr).assertEqual(false)
    })

    /**
     * @tc.name: testIgnoreBOM003
     * @tc.desc: Returns `true` if ignore BOM flag is set, and `false` otherwise.
     */
    it('testIgnoreBOM003', 0, function () {
        var that = new util.TextDecoder('utf-16be')
        var ignoreBOMStr = that.ignoreBOM
        expect(ignoreBOMStr).assertEqual(false)
    })

    /**
     * @tc.name: testIgnoreBOM004
     * @tc.desc: Returns `true` if ignore BOM flag is set, and `false` otherwise.
     */
    it('testIgnoreBOM004', 0, function () {
        var that = new util.TextDecoder('utf-8')
        var ignoreBOMStr = that.ignoreBOM
        expect(ignoreBOMStr).assertEqual(false)
    })

    /**
     * @tc.name: testIgnoreBOM005
     * @tc.desc: Returns `true` if ignore BOM flag is set, and `false` otherwise.
     */
    it('testIgnoreBOM005', 0, function () {
        var that = new util.TextDecoder('utf-16le')
        var ignoreBOMStr = that.ignoreBOM
        expect(ignoreBOMStr).assertEqual(false)
    })

    /**
     * @tc.name: testIgnoreBOM006
     * @tc.desc: Returns `true` if ignore BOM flag is set, and `false` otherwise.
     */
     it('testIgnoreBOM006', 0, function () {
        var that = new util.TextDecoder('gbk')
        var ignoreBOMStr = that.ignoreBOM
        expect(ignoreBOMStr).assertEqual(false)
    })

    /**
     * @tc.name: testIgnoreBOM007
     * @tc.desc: Returns `true` if ignore BOM flag is set, and `false` otherwise.
     */
     it('testIgnoreBOM007', 0, function () {
        var that = new util.TextDecoder('gb18030')
        var ignoreBOMStr = that.ignoreBOM
        expect(ignoreBOMStr).assertEqual(false)
    })

    /**
     * @tc.name: testIgnoreBOM008
     * @tc.desc: Returns `true` if ignore BOM flag is set, and `false` otherwise.
     */
     it('testIgnoreBOM008', 0, function () {
        var that = new util.TextDecoder('gb2312')
        var ignoreBOMStr = that.ignoreBOM
        expect(ignoreBOMStr).assertEqual(false)
    })

    /**
     * @tc.name: testdecode_testdecode_001
     * @tc.desc: Returns the result of running encoding's decoder.
     */
    it('testdecode_testdecode_001', 0, function () {
        var that = new util.TextDecoder('utf-8');
        var arr = new Uint8Array(3);
        for (var i = 0; i < 3; i++) {
            arr[i] = 0x61 + i;
        }
        var retStr = that.decode(arr);
        var rel = 'abc';
        expect(retStr).assertEqual(rel);
    })

    /**
     * @tc.name: testdecode_testdecode_002
     * @tc.desc: Returns the result of running encoding's decoder.
     */
    it('testdecode_testdecode_002', 0, function () {
        var that = new util.TextDecoder('utf-16le')
        var arr = new Uint8Array(6)
        arr[0] = 0x61;
        arr[1] = 0x00;
        arr[2] = 0x62;
        arr[3] = 0x00;
        arr[4] = 0x63;
        arr[5] = 0x00;
        var retStr = that.decode(arr)
        var rel = 'abc'
        expect(retStr).assertEqual(rel)
    })

    /**
     * @tc.name: testdecode_testdecode_003
     * @tc.desc: Returns the result of running encoding's decoder.
     */
    it('testdecode_testdecode_003', 0, function () {
        var that = new util.TextDecoder('utf-16be');
        var arr = new Uint8Array(6);
        arr[0] = 0x00;
        arr[1] = 0x61;
        arr[2] = 0x00;
        arr[3] = 0x62;
        arr[4] = 0x00;
        arr[5] = 0x63;
        var retStr = that.decode(arr);
        var rel = 'abc'
        expect(retStr).assertEqual(rel);
    })

    /**
     * @tc.name: testdecode_testdecode_004
     * @tc.desc: Returns the result of running encoding's decoder.
     */
    it('testdecode_testdecode_004', 0, function () {
        var that = new  util.TextDecoder('utf-8', { ignoreBOM : true })
        var arr = new Uint8Array(6)
        arr[0] = 0xEF;
        arr[1] = 0xBB;
        arr[2] = 0xBF;
        arr[3] = 0x61;
        arr[4] = 0x62;
        arr[5] = 0x63;
        var retStr = that.decode(arr, {stream:true})
        var BOM = '\uFEFF'
        var rel = 'abc'
        var re = BOM + rel
        expect(retStr).assertEqual(re);
    })

    /**
     * @tc.name: testdecode_testdecode_005
     * @tc.desc: Returns the result of running encoding's decoder.
     */
    it('testdecode_testdecode_005', 0, function () {
        var that = new util.TextDecoder('utf-16le', { ignoreBOM : false })
        var arr = new Uint8Array(8)
        arr[0] = 0xFF;
        arr[1] = 0xFE;
        arr[2] = 0x61;
        arr[3] = 0x00;
        arr[4] = 0x62;
        arr[5] = 0x00
        arr[6] = 0x63;
        arr[7] = 0x00;
        var retStr = that.decode(arr, { stream : false })
        var BOM = '\uFEFF'
        var rel = 'abc'
        var re = BOM + rel
        expect(retStr).assertEqual(re)
    })

    /**
     * @tc.name: testdecode_testdecode_006
     * @tc.desc: Returns the result of running encoding's decoder.
     */
     it('testdecode_testdecode_006', 0, function () {
        var that = new util.TextDecoder('gbk')
        var arr = new Uint8Array(8)
        arr[0] = 0xC4;
        arr[1] = 0xE3;
        arr[2] = 0xBA;
        arr[3] = 0xC3;
        arr[4] = 0xCA;
        arr[5] = 0xC0;
        arr[6] = 0xBD;
        arr[7] = 0xE7;
        var retStr = that.decode(arr)
        var rel = '你好世界'
        expect(retStr).assertEqual(rel)
    })

    /**
     * @tc.name: testdecode_testdecode_007
     * @tc.desc: Returns the result of running encoding's decoder.
     */
     it('testdecode_testdecode_007', 0, function () {
        var that = new util.TextDecoder('gb18030')
        var arr = new Uint8Array(8)
        arr[0] = 0xC4;
        arr[1] = 0xE3;
        arr[2] = 0xBA;
        arr[3] = 0xC3;
        arr[4] = 0xCA;
        arr[5] = 0xC0;
        arr[6] = 0xBD;
        arr[7] = 0xE7;
        var retStr = that.decode(arr)
        var rel = '你好世界'
        expect(retStr).assertEqual(rel)
    })

    /**
     * @tc.name: testdecode_testdecode_008
     * @tc.desc: Returns the result of running encoding's decoder.
     */
     it('testdecode_testdecode_008', 0, function () {
        var that = new util.TextDecoder('gb2312')
        var arr = new Uint8Array(8)
        arr[0] = 0xC4;
        arr[1] = 0xE3;
        arr[2] = 0xBA;
        arr[3] = 0xC3;
        arr[4] = 0xCA;
        arr[5] = 0xC0;
        arr[6] = 0xBD;
        arr[7] = 0xE7;
        var retStr = that.decode(arr)
        var rel = '你好世界'
        expect(retStr).assertEqual(rel)
    })

    /**
     * @tc.name: decodeWithStream001
     * @tc.desc: Returns the result of running encoding's decoder.
     */
    it('decodeWithStream001', 0, function () {
        var that = new util.TextDecoder('utf-16le', { ignoreBOM : false });
        var arr = new Uint8Array(8)
        arr[0] = 0xFF;
        arr[1] = 0xFE;
        arr[2] = 0x61;
        arr[3] = 0x00;
        arr[4] = 0x62;
        arr[5] = 0x00;
        arr[6] = 0x63;
        arr[7] = 0x00;
        var retStr = that.decodeWithStream(arr, { stream : false });
        var BOM = '\uFEFF';
        var rel = 'abc';
        var re = BOM + rel;
        expect(retStr).assertEqual(re)
    })

    /**
     * @tc.name: decodeWithStream002
     * @tc.desc: Returns the result of running encoding's decoder.
     */
    it('decodeWithStream002', 0, function () {
        var that = new  util.TextDecoder('utf-8', { ignoreBOM : true })
        var arr = new Uint8Array(6)
        arr[0] = 0xEF;
        arr[1] = 0xBB;
        arr[2] = 0xBF;
        arr[3] = 0x61;
        arr[4] = 0x62;
        arr[5] = 0x63;
        var retStr = that.decodeWithStream(arr, {stream:true})
        var BOM = '\uFEFF'
        var rel = 'abc'
        var re = BOM + rel;
        expect(retStr).assertEqual(re)
    })

    /**
     * @tc.name: decodeWithStream003
     * @tc.desc: Returns the result of running encoding's decoder.
     */
    it('decodeWithStream003', 0, function () {
        var that = new util.TextDecoder('utf-16be');
        var arr = new Uint8Array(6);
        arr[0] = 0x00;
        arr[1] = 0x61;
        arr[2] = 0x00;
        arr[3] = 0x62;
        arr[4] = 0x00;
        arr[5] = 0x63;
        var retStr = that.decodeWithStream(arr);
        var rel = 'abc'
        expect(retStr).assertEqual(rel)
    })

    /**
     * @tc.name: decodeWithStream004
     * @tc.desc: Returns the result of running encoding's decoder.
     */
    it('decodeWithStream004', 0, function () {
        var that = new util.TextDecoder('utf-16le')
        var arr = new Uint8Array(6)
        arr[0] = 0x61;
        arr[1] = 0x00;
        arr[2] = 0x62;
        arr[3] = 0x00;
        arr[4] = 0x63;
        arr[5] = 0x00;
        var retStr = that.decodeWithStream(arr);
        var rel = 'abc'
        expect(retStr).assertEqual(rel)
    })

    /**
     * @tc.name: decodeWithStream005
     * @tc.desc: Returns the result of running encoding's decoder.
     */
    it('decodeWithStream005', 0, function () {
        var that = new util.TextDecoder('utf-8');
        var arr = new Uint8Array(3);
        for (var i = 0; i < 3; i++) {
        arr[i] = 0x61 + i;
        }
        var retStr = that.decodeWithStream(arr);
        var rel = 'abc';
        expect(retStr).assertEqual(rel)
    })

    /**
     * @tc.name: testencoding_textencoder_001
     * @tc.desc: Encoding format.
     */
    it('testencoding_textencoder_001', 0, function () {
        var that = new util.TextEncoder()
        var str = that.encoding
        expect(str).assertEqual('utf-8')
    })

    /**
     * @tc.name: testencoding_textencoder_002
     * @tc.desc: Encoding format test gb18030.
     */
    it('testencoding_textencoder_002', 0, function () {
        let that = new util.TextEncoder('gb18030')
        let str = that.encoding
        expect(str).assertEqual('gb18030')
        that = new util.TextEncoder('GB18030')
        str = that.encoding;
        expect(str).assertEqual('GB18030')
    })

    /**
     * @tc.name: testencoding_textencoder_003
     * @tc.desc: Encoding format test gbk.
     */
     it('testencoding_textencoder_003', 0, function () {
        let that = new util.TextEncoder('gbk')
        let str = that.encoding
        expect(str).assertEqual('gbk')
        that = new util.TextEncoder('GBK')
        str = that.encoding;
        expect(str).assertEqual('GBK')
    })

    /**
     * @tc.name: testencoding_textencoder_004
     * @tc.desc: Encoding format test gb2313.
     */
    it('testencoding_textencoder_004', 0, function () {
        let that = new util.TextEncoder('gb2312')
        let str = that.encoding
        expect(str).assertEqual('gb2312')
        that = new util.TextEncoder('GB2312')
        str = that.encoding;
        expect(str).assertEqual('GB2312')
    })

    /**
     * @tc.name: testEncode001
     * @tc.desc: Returns the result of encoder.
     */
     it('testEncode001', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encode('abc')
        expect(result[0]).assertEqual(0x61)
    })

    /**
     * @tc.name: testEncode002
     * @tc.desc: Returns the result of encoder.
     */
    it('testEncode002', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encode('\uD800楼楼')
        expect(result[5]).assertEqual(188)
    })

    /**
     * @tc.name: testEncode003
     * @tc.desc: Returns the result of encoder.
     */
    it('testEncode003', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encode('a\uD800楼楼')
        expect(result[0]).assertEqual(0x61)
    })

    /**
     * @tc.name: testEncode004
     * @tc.desc: Returns the result of encoder.
     */
    it('testEncode004', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encode('abc\uD800楼楼')
        expect(result[1]).assertEqual(0x62)
    })

    /**
     * @tc.name: testEncode005
     * @tc.desc: Returns the result of encoder.
     */
    it('testEncode005', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encode('123\uD800楼楼')
        expect(result[0]).assertEqual(49)
        expect(result[9]).assertEqual(230)
    })

    /**
     * @tc.name: testEncode006
     * @tc.desc: Returns the result of encoder.
     */
    it('testEncode006', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encode('123¥\uD800楼')
        expect(result[10]).assertEqual(0xbc)
    })

    /**
     * @tc.name: testEncode007
     * @tc.desc: Returns the result of encoder.
     */
    it('testEncode007', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encode('¥¥')
        expect(result[0]).assertEqual(0xc2)
    })

    /**
     * @tc.name: testEncode008
     * @tc.desc: Returns the result of encoder.
     */
    it('testEncode008', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encode('$$')
        expect(result[0]).assertEqual(0x24)
    })

    /**
     * @tc.name: testEncode009
     * @tc.desc: Returns the result of encoder for gb18030.
     */
     it('testEncode009', 0, function () {
        let that = new util.TextEncoder('gb18030')
        let buffer = new ArrayBuffer(20)
        let result = new Uint8Array(buffer)
        result = that.encode('abc哈哈熠熠')
        expect(result[0]).assertEqual(97)
        expect(result[3]).assertEqual(185)
        expect(result[4]).assertEqual(254)
        expect(result[7]).assertEqual(236)
        expect(result[8]).assertEqual(218)
    })

    /**
     * @tc.name: testEncode010
     * @tc.desc: Returns the result of encoder for GB18030.
     */
    it('testEncode0010', 0, function () {
        let that = new util.TextEncoder('GB18030')
        let buffer = new ArrayBuffer(20)
        let result = new Uint8Array(buffer)
        result = that.encode('abc哈哈熠熠')
        expect(result[0]).assertEqual(97)
        expect(result[3]).assertEqual(185)
        expect(result[4]).assertEqual(254)
        expect(result[7]).assertEqual(236)
        expect(result[8]).assertEqual(218)
    })

    /**
     * @tc.name: testEncode011
     * @tc.desc: Returns the result of encoder for GB18030.
     */
     it('testEncode0011', 0, function () {
        let that = new util.TextEncoder('GBK')
        let buffer = new ArrayBuffer(20)
        let result = new Uint8Array(buffer)
        result = that.encode('abc哈哈熠熠')
        expect(result[0]).assertEqual(97)
        expect(result[3]).assertEqual(185)
        expect(result[4]).assertEqual(254)
        expect(result[7]).assertEqual(236)
        expect(result[8]).assertEqual(218)
    })

    /**
     * @tc.name: testEncode012
     * @tc.desc: Returns the result of encoder for gbk.
     */
    it('testEncode012', 0, function () {
        let that = new util.TextEncoder('gbk')
        let buffer = new ArrayBuffer(20)
        let result = new Uint8Array(buffer)
        result = that.encode('abc哈哈熠熠')
        expect(result[0]).assertEqual(97)
        expect(result[3]).assertEqual(185)
        expect(result[4]).assertEqual(254)
        expect(result[7]).assertEqual(236)
        expect(result[8]).assertEqual(218)
    })

    /**
     * @tc.name: testEncode013
     * @tc.desc: Returns the result of encoder for gb2312.
     */
    it('testEncode013', 0, function () {
        let that = new util.TextEncoder('gb2312')
        let buffer = new ArrayBuffer(20)
        let result = new Uint8Array(buffer)
        result = that.encode('abc哈哈熠熠')
        expect(result[0]).assertEqual(97)
        expect(result[3]).assertEqual(185)
        expect(result[4]).assertEqual(254)
        expect(result[7]).assertEqual(236)
        expect(result[8]).assertEqual(218)
    })

    /**
     * @tc.name: testEncode014
     * @tc.desc: Returns the result of encoder for gb2312.
     */
     it('testEncode014', 0, function () {
        let that = new util.TextEncoder('GB2312')
        let buffer = new ArrayBuffer(20)
        let result = new Uint8Array(buffer)
        result = that.encode('abc哈哈熠熠')
        expect(result[0]).assertEqual(97)
        expect(result[3]).assertEqual(185)
        expect(result[4]).assertEqual(254)
        expect(result[7]).assertEqual(236)
        expect(result[8]).assertEqual(218)
    })

    /**
     * @tc.name: testEncode015
     * @tc.desc: Returns the result of encoder for gb2312, input long string.
     */
     it('testEncode015', 0, function () {
        let that = new util.TextEncoder('GB18030')
        let buffer = new ArrayBuffer(900)
        let result = new Uint8Array(buffer)
        result = that.encode('abcd哈哈哈哈哈哈哈哈哈哈哈哈哈abcd哈哈哈哈哈哈哈哈哈哈哈哈哈abcd哈哈哈哈哈哈哈哈哈哈哈哈哈abcd哈哈哈哈哈哈哈哈哈哈哈哈哈')
        expect(result[6]).assertEqual(185)
        expect(result[30]).assertEqual(97)
        expect(result[57]).assertEqual(254)
        expect(result[98]).assertEqual(185)
        expect(result[119]).assertEqual(254)
    })

    /**
     * @tc.name: testEncodeInto001
     * @tc.desc: encode string, write the result to dest array.
     */
    it('testEncodeInto001', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var dest = new Uint8Array(buffer, 0, 13)
        var result = new Uint32Array(20)
        result = that.encodeInto('\uD800A\uDF06A楼HiA', dest)
        expect(result.read).assertEqual(7)
        expect(result.written).assertEqual(13)
    })

    /**
     * @tc.name: testEncodeInto002
     * @tc.desc: encode string, write the result to dest array.
     */
    it('testEncodeInto002', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(6)
        var dest = new Uint8Array(buffer)
        var result = new Object()
        result = that.encodeInto('abc\u2603d', dest)
        expect(result.read).assertEqual(4)
        expect(result.written).assertEqual(6)
    })

    /**
     * @tc.name: testEncodeInto003
     * @tc.desc: encode string, write the result to dest array.
     */
    it('testEncodeInto003', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(4)
        var dest = new Uint8Array(buffer)
        var result = new Object()
        result = that.encodeInto('abcd', dest)
        expect(result.read).assertEqual(4)
        expect(result.written).assertEqual(4)
    })

    /**
     * @tc.name: testEncodeInto004
     * @tc.desc: encode string, write the result to dest array.
     */
    it('testEncodeInto004', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(4)
        var dest = new Uint8Array(buffer)
        var result = new Object()
        result = that.encodeInto('12345', dest)
        expect(result.read).assertEqual(4)
        expect(result.written).assertEqual(4)
    })

    /**
     * @tc.name: testEncodeInto005
     * @tc.desc: encode string, write the result to dest array.
     */
    it('testEncodeInto005', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(4)
        var dest = new Uint8Array(buffer)
        var result = new Object()
        result = that.encodeInto('123 4*!@#', dest)
        expect(result.read).assertEqual(4)
        expect(result.written).assertEqual(4)
    })

    /**
     * @tc.name: testEncodeInto006
     * @tc.desc: encode string, write the result to dest array.
     */
    it('testEncodeInto006', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(4)
        var dest = new Uint8Array(buffer)
        var result = new Object()
        result = that.encodeInto('', dest)
        expect(result.read).assertEqual(0)
        expect(result.written).assertEqual(0)
    })

    /**
     * @tc.name: testEncodeInto007
     * @tc.desc: encode string, write the result to dest array.
     */
    it('testEncodeInto007', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var dest = new Uint8Array(buffer)
        var result = new Uint32Array(20)
        result = that.encodeInto('12ab', dest)
        expect(result.read).assertEqual(4)
        expect(result.written).assertEqual(4)
    })

    /**
     * @tc.name: testEncodeInto008
     * @tc.desc: encode string, write the result to dest array.
     */
    it('testEncodeInto008', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var dest = new Uint8Array(buffer, 0, 0)
        var result = new Uint32Array(20)
        result = that.encodeInto('\uD800A\uDF06A楼HiA', dest)
        expect(result.read).assertEqual(0)
        expect(result.written).assertEqual(0)
    })
})

describe('ScopeTest', function () {

    /**
     * @tc.name: test_getLower_001
     * @tc.desc: Obtains the lower bound of the current range.
     */
    it('test_getLower_001', 0, function () {
        var result = range.getLower()
        expect(result.toString()).assertEqual('30')
    })

    /**
     * @tc.name: test_getLower_002
     * @tc.desc: Obtains the lower bound of the current range.
     */
    it('test_getLower_002', 0, function () {
        var result = rangeFir.getLower()
        expect(result.toString()).assertEqual('35')
    })

    /**
     * @tc.name: test_getLower_003
     * @tc.desc: Obtains the lower bound of the current range.
     */
    it('test_getLower_003', 0, function () {
        var result = rangeSec.getLower()
        expect(result.toString()).assertEqual('20')
    })

    /**
     * @tc.name: test_getLower_004
     * @tc.desc: Obtains the lower bound of the current range.
     */
    it('test_getLower_004', 0, function () {
        var result = rangeThi.getLower()
        expect(result.toString()).assertEqual('20')
    })

    /**
     * @tc.name: test_getLower_005
     * @tc.desc: Obtains the lower bound of the current range.
     */
    it('test_getLower_005', 0, function () {
        var result = rangeFif.getLower()
        expect(result.toString()).assertEqual('35')
    })

    /**
     * @tc.name: test_getUpper_001
     * @tc.desc: Obtains the upper bound of the current range.
     */
    it('test_getUpper_001', 0, function () {
        var result = range.getUpper()
        expect(result.toString()).assertEqual('40')
    })

    /**
     * @tc.name: test_getUpper_002
     * @tc.desc: Obtains the upper bound of the current range.
     */
    it('test_getUpper_002', 0, function () {
        var result = rangeFir.getUpper()
        expect(result.toString()).assertEqual('39')
    })

    /**
     * @tc.name: test_getUpper_003
     * @tc.desc: Obtains the upper bound of the current range.
     */
    it('test_getUpper_003', 0, function () {
        var result = rangeSec.getUpper()
        expect(result.toString()).assertEqual('45')
    })

    /**
     * @tc.name: test_getUpper_004
     * @tc.desc: Obtains the upper bound of the current range.
     */
    it('test_getUpper_004', 0, function () {
        var result = rangeThi.getUpper()
        expect(result.toString()).assertEqual('35')
    })

    /**
     * @tc.name: test_getUpper_005
     * @tc.desc: Obtains the upper bound of the current range.
     */
    it('test_getUpper_005', 0, function () {
        var result = rangeFif.getUpper()
        expect(result.toString()).assertEqual('45')
    })

    /**
     * @tc.name: test_clamp_001
     * @tc.desc: Clamps a given value to the current range.
     */
    it('test_clamp_001', 0, function () {
        var result =range.clamp(tempLess)
        expect(result.toString()).assertEqual('30')
    })

    /**
     * @tc.name: test_clamp_002
     * @tc.desc: Clamps a given value to the current range.
     */
    it('test_clamp_002', 0, function () {
        var result =range.clamp(tempMiDF)
        expect(result.toString()).assertEqual('35')
    })

    /**
     * @tc.name: test_clamp_003
     * @tc.desc: Clamps a given value to the current range.
     */
    it('test_clamp_003', 0, function () {
        var result =range.clamp(tempMore)
        expect(result.toString()).assertEqual('40')
    })

    /**
     * @tc.name: test_clamp_004
     * @tc.desc: Clamps a given value to the current range.
     */
    it('test_clamp_004', 0, function () {
        var result =range.clamp(tempLower)
        expect(result.toString()).assertEqual('30')
    })

    /**
     * @tc.name: test_clamp_005
     * @tc.desc: Clamps a given value to the current range.
     */
    it('test_clamp_005', 0, function () {
        var result =range.clamp(tempUpper)
        expect(result.toString()).assertEqual('40')
    })

    /**
     * @tc.name: test_contains_001
     * @tc.desc: Checks whether a given value is within the current range.
     */
    it('test_contains_001', 0, function () {
        var result = range.contains(tempLess)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name: test_contains_002
     * @tc.desc: Checks whether a given value is within the current range.
     */
    it('test_contains_002', 0, function () {
        var result = range.contains(tempMiDF)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name: test_contains_003
     * @tc.desc: Checks whether a given value is within the current range.
     */
    it('test_contains_003', 0, function () {
        var result = range.contains(tempMore)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name: test_contains_004
     * @tc.desc: Checks whether a given value is within the current range.
     */
    it('test_contains_004', 0, function () {
        var result = range.contains(tempLower)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name: test_contains_005
     * @tc.desc: Checks whether a given value is within the current range.
     */
    it('test_contains_005', 0, function () {
        var result = range.contains(tempUpper)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name: test_contains_006
     * @tc.desc: Checks whether a given range is within the current range.
     */
    it('test_contains_006', 0, function () {
        var result = range.contains(rangeFir)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name: test_contains_007
     * @tc.desc: Checks whether a given range is within the current range.
     */
    it('test_contains_007', 0, function () {
        var result = range.contains(rangeSec)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name: test_contains_008
     * @tc.desc: Checks whether a given range is within the current range.
     */
    it('test_contains_008', 0, function () {
        var result = range.contains(rangeThi)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name: test_contains_009
     * @tc.desc: Checks whether a given range is within the current range.
     */
    it('test_contains_009', 0, function () {
        var result = range.contains(rangeFif)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name: test_contains_010
     * @tc.desc: Checks whether a given range is within the current range.
     */
    it('test_contains_010', 0, function () {
        var result = range.contains(range)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name: test_expand_001
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     */
    it('test_expand_001', 0, function () {
        var result = range.expand(tempMiDF, tempMidS)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name: test_expand_002
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     */
    it('test_expand_002', 0, function () {
        var result = range.expand(tempLess, tempMore)
        expect(result.toString()).assertEqual('[20, 45]')
    })

    /**
     * @tc.name: test_expand_003
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     */
    it('test_expand_003', 0, function () {
        var result = range.expand(tempLess, tempMiDF)
        expect(result.toString()).assertEqual('[20, 40]')
    })

    /**
     * @tc.name: test_expand_004
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     */
    it('test_expand_004', 0, function () {
        var result = range.expand(tempMiDF, tempMore)
        expect(result.toString()).assertEqual('[30, 45]')
    })

    /**
     * @tc.name: test_expand_005
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     */
    it('test_expand_005', 0, function () {
        var result = range.expand(tempLower, tempUpper)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name: test_expand_006
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     */
    it('test_expand_006', 0, function () {
        var result = range.expand(rangeFir)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name: test_expand_007
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     */
    it('test_expand_007', 0, function () {
        var result = range.expand(rangeSec)
        expect(result.toString()).assertEqual('[20, 45]')
    })

    /**
     * @tc.name: test_expand_008
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     */
    it('test_expand_008', 0, function () {
        var result = range.expand(rangeThi)
        expect(result.toString()).assertEqual('[20, 40]')
    })

    /**
     * @tc.name: test_expand_009
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     */
    it('test_expand_009', 0, function () {
        var result = range.expand(rangeFif)
        expect(result.toString()).assertEqual('[30, 45]')
    })

    /**
     * @tc.name: test_expand_010
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     */
    it('test_expand_010', 0, function () {
        var result = range.expand(range)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name: test_expand_011
     * @tc.desc: Creates the smallest range that includes the current range and a given value.
     */
    it('test_expand_011', 0, function () {
        var result = range.expand(tempMiDF)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name: test_expand_012
     * @tc.desc: Creates the smallest range that includes the current range and a given value.
     */
    it('test_expand_012', 0, function () {
        var result = range.expand(tempLess)
        expect(result.toString()).assertEqual('[20, 40]')
    })

    /**
     * @tc.name: test_expand_013
     * @tc.desc: Creates the smallest range that includes the current range and a given value.
     */
    it('test_expand_013', 0, function () {
        var result = range.expand(tempMore)
        expect(result.toString()).assertEqual('[30, 45]')
    })

    /**
     * @tc.name: test_expand_014
     * @tc.desc: Creates the smallest range that includes the current range and a given value.
     */
    it('test_expand_014', 0, function () {
        var result = range.expand(tempLower)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name: test_expand_015
     * @tc.desc: Creates the smallest range that includes the current range and a given value.
     */
    it('test_expand_015', 0, function () {
        var result = range.expand(tempUpper)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name: test_intersect_001
     * @tc.desc: Returns the intersection of a given range and the current range.
     */
    it('test_intersect_001', 0, function () {
        var result = range.intersect(rangeFir)
        expect(result.toString()).assertEqual('[35, 39]')
    })

    /**
     * @tc.name: test_intersect_002
     * @tc.desc: Returns the intersection of a given range and the current range.
     */
    it('test_intersect_002', 0, function () {
        var result = range.intersect(rangeSec)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name: test_intersect_003
     * @tc.desc: Returns the intersection of a given range and the current range.
     */
    it('test_intersect_003', 0, function () {
        var result = range.intersect(rangeThi)
        expect(result.toString()).assertEqual('[30, 35]')
    })

    /**
     * @tc.name: test_intersect_004
     * @tc.desc: Returns the intersection of a given range and the current range.
     */
    it('test_intersect_004', 0, function () {
        var result = range.intersect(rangeFif)
        expect(result.toString()).assertEqual('[35, 40]')
    })

    /**
     * @tc.name: test_intersect_005
     * @tc.desc: Returns the intersection of a given range and the current range.
     */
    it('test_intersect_005', 0, function () {
        var result = range.intersect(range)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name: test_intersect_006
     * @tc.desc: Returns the intersection of the current range and the range specified by
       the given lower and upper bounds.
     */
    it('test_intersect_006', 0, function () {
        var result = range.intersect(tempMiDF, tempMidS)
        expect(result.toString()).assertEqual('[35, 39]')
    })

    /**
     * @tc.name: test_intersect_007
     * @tc.desc: Returns the intersection of the current range and the range specified by
       the given lower and upper bounds.
     */
    it('test_intersect_007', 0, function () {
        var result = range.intersect(tempLess, tempMore)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name: test_intersect_008
     * @tc.desc: Returns the intersection of the current range and the range specified by
       the given lower and upper bounds.
     */
    it('test_intersect_008', 0, function () {
        var result = range.intersect(tempLess, tempMiDF)
        expect(result.toString()).assertEqual('[30, 35]')
    })

    /**
     * @tc.name: test_intersect_009
     * @tc.desc: Returns the intersection of the current range and the range specified by
       the given lower and upper bounds.
     */
    it('test_intersect_009', 0, function () {
        var result = range.intersect(tempMiDF, tempMore)
        expect(result.toString()).assertEqual('[35, 40]')
    })

    /**
     * @tc.name: test_intersect_010
     * @tc.desc: Returns the intersection of the current range and the range specified by
       the given lower and upper bounds.
     */
    it('test_intersect_010', 0, function () {
        var result = range.intersect(tempLower, tempUpper)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name: test_toString_001
     * @tc.desc: Obtains a string representation of the current range.
     */
    it('test_toString_001', 0, function () {
        var result = range.toString()
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name: test_toString_002
     * @tc.desc: Obtains a string representation of the current range.
     */
    it('test_toString_002', 0, function () {
        var result = rangeFir.toString()
        expect(result.toString()).assertEqual('[35, 39]')
    })

    /**
     * @tc.name: test_toString_003
     * @tc.desc: Obtains a string representation of the current range.
     */
    it('test_toString_003', 0, function () {
        var result = rangeSec.toString()
        expect(result.toString()).assertEqual('[20, 45]')
    })

    /**
     * @tc.name: test_toString_004
     * @tc.desc: Obtains a string representation of the current range.
     */
    it('test_toString_004', 0, function () {
        var result = rangeThi.toString()
        expect(result.toString()).assertEqual('[20, 35]')
    })

    /**
     * @tc.name: test_toString_005
     * @tc.desc: Obtains a string representation of the current range.
     */
    it('test_toString_005', 0, function () {
        var result = rangeFif.toString()
        expect(result.toString()).assertEqual('[35, 45]')
    })
})

describe('Base64Test', function () {

    /**
     * @tc.name: test_encodeSync_base64_001
     * @tc.desc: Encodes all bytes from the specified u8 array into a newly-allocated u8
       array using the Base64 encoding scheme.
     */
    it('test_encodeSync_base64_001', 0, function () {
        var that = new util.Base64()
        var array = new Uint8Array([115,49,51]);
        var rarray = new Uint8Array([99,122,69,122]);
        var result = that.encodeSync(array);
        for (var i = 0; i < 4; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.name: test_encodeSync_base64_002
     * @tc.desc: Encodes all bytes from the specified u8 array into a newly-allocated u8
       array using the Base64 encoding scheme.
     */
    it('test_encodeSync_base64_002', 0, function () {
        var that = new util.Base64()
        var array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
        var rarray = new Uint8Array([81,109,70,122,90,84,89,48,73,69,53,118,90,71,85,117,97,110,77,61]);
        var result = that.encodeSync(array);
        for (var i = 0; i < 20; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.name: test_encodeSync_base64_003
     * @tc.desc: Encodes all bytes from the specified u8 array into a newly-allocated u8
       array using the Base64 encoding scheme.
     */
    it('test_encodeSync_base64_003', 0, function () {
        var that = new util.Base64()
        var array = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,105,
        110,32,78,111,100,101,46,106,115]);
        var rarray = new Uint8Array([81,109,70,122,90,84,89,48,73,69,86,117,89,50,57,107,97,87,53,110,
        73,71,108,117,73,69,53,118,90,71,85,117,97,110,77,61]);
        var result = that.encodeSync(array);
        for (var i = 0; i < 36; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.name: test_encodeSync_base64_004
     * @tc.desc: Encodes all bytes from the specified u8 array into a newly-allocated u8
       array using the Base64 encoding scheme.
     */
    it('test_encodeSync_base64_004', 0, function () {
        var that = new util.Base64()
        var array = new Uint8Array([168, 174, 155, 255]);
        var rarray = new Uint8Array([113,75,54,98,47,119,61,61]);
        var result = that.encodeSync(array);
        for (var i = 0; i < 8; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.name: test_encodeSync_base64_005
     * @tc.desc: Encodes all bytes from the specified u8 array into a newly-allocated u8
       array using the Base64 encoding scheme.
     */
    it('test_encodeSync_base64_005', 0, function () {
        var that = new util.Base64()
        var array = new Uint8Array([66, 97, 115, 101, 54, 52]);
        var rarray = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48]);
        var result = that.encodeSync(array);
        for (var i = 0; i <8; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.name: test_encodeToStringSync_base64_001
     * @tc.desc: Encodes the specified byte array into a String using the Base64 encoding scheme.
     */
    it('test_encodeToStringSync_base64_001', 0, function () {
        var that = new util.Base64()
        var array = new Uint8Array([115,49,51]);
        var result = that.encodeToStringSync(array)
        expect(result).assertEqual('czEz')
    })

    /**
     * @tc.name: test_encodeToStringSync_base64_002
     * @tc.desc: Encodes the specified byte array into a String using the Base64 encoding scheme.
     */
    it('test_encodeToStringSync_base64_002', 0, function () {
        var that = new util.Base64()
        var array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
        var result = that.encodeToStringSync(array);
        expect(result).assertEqual('QmFzZTY0IE5vZGUuanM=')
    })

    /**
     * @tc.name: test_encodeToStringSync_base64_003
     * @tc.desc: Encodes the specified byte array into a String using the Base64 encoding scheme.
     */
    it('test_encodeToStringSync_base64_003', 0, function () {
        var that = new util.Base64()
        var array = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,105,110,
        32,78,111,100,101,46,106,115]);
        var result = that.encodeToStringSync(array);
        expect(result).assertEqual('QmFzZTY0IEVuY29kaW5nIGluIE5vZGUuanM=')
    })

    /**
     * @tc.name: test_encodeToStringSync_base64_004
     * @tc.desc: Encodes the specified byte array into a String using the Base64 encoding scheme.
     */
    it('test_encodeToStringSync_base64_004', 0, function () {
        var that = new util.Base64()
        var array = new Uint8Array([168, 174, 155, 255]);
        var result = that.encodeToStringSync(array);
        expect(result).assertEqual('qK6b/w==')
    })

    /**
     * @tc.name: test_encodeToStringSync_base64_005
     * @tc.desc: Encodes the specified byte array into a String using the Base64 encoding scheme.
     */
    it('test_encodeToStringSync_base64_005', 0, function () {
        var that = new util.Base64()
        var array = new Uint8Array([66, 97, 115, 101, 54, 52]);
        var result = that.encodeToStringSync(array);
        expect(result).assertEqual('QmFzZTY0')
    })

    /**
     * @tc.name: test_decodeSync_base64_001
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
       array using the Base64 encoding scheme.
     */
    it('test_decodeSync_base64_001', 0, function () {
        var that = new util.Base64()
        var buff = 'czEz';
        var rarray = new Uint8Array([115,49,51]);
        var result = that.decodeSync(buff);
        for (var i = 0; i < 3; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.name: test_decodeSync_base64_002
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
       array using the Base64 encoding scheme.
     */
    it('test_decodeSync_base64_002', 0, function () {
        var that = new util.Base64()
        var buff = 'QmFzZTY0IE5vZGUuanM=';
        var rarray = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
        var result = that.decodeSync(buff);
        for (var i = 0; i < 14; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.name: test_decodeSync_base64_003
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
       array using the Base64 encoding scheme.
     */
    it('test_decodeSync_base64_003', 0, function () {
        var that = new util.Base64()
        var buff = 'QmFzZTY0IEVuY29kaW5nIGluIE5vZGUuanM=';
        var rarray = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,
        105,110,32,78,111,100,101,46,106,115]);
        var result = that.decodeSync(buff);
        for (var i = 0; i < 26; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.name: test_decodeSync_base64_004
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
       array using the Base64 encoding scheme.
     */
    it('test_decodeSync_base64_004', 0, function () {
        var that = new util.Base64()
        var buff = 'qK6b/w==';
        var rarray = new Uint8Array([168, 174, 155, 255]);
        var result = that.decodeSync(buff);
        for (var i = 0; i < 4; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.name: test_decodeSync_base64_005
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
       array using the Base64 encoding scheme.
     */
    it('test_decodeSync_base64_005', 0, function () {
        var that = new util.Base64()
        var buff = 'QmFzZTY0';
        var rarray = new Uint8Array([66, 97, 115, 101, 54, 52]);
        var result = that.decodeSync(buff);
        for (var i = 0; i <6; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.name: test_decodeSync_base64_006
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
       array using the Base64 encoding scheme.
     */
    it('test_decodeSync_base64_006', 0, function () {
        var that = new util.Base64()
        var array = new Uint8Array([99,122,69,122]);
        var rarray = new Uint8Array([115,49,51]);
        var result = that.decodeSync(array);
        for (var i = 0; i < 3; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.name: test_decodeSync_base64_007
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
       array using the Base64 encoding scheme.
     */
    it('test_decodeSync_base64_007', 0, function () {
        var that = new util.Base64()
        var array = new Uint8Array([81,109,70,122,90,84,89,48,73,69,53,118,90,71,85,117,97,110,77,61]);
        var rarray = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
        var result = that.decodeSync(array);
        for (var i = 0; i < 14; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.name: test_decodeSync_base64_008
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
       array using the Base64 encoding scheme.
     */
    it('test_decodeSync_base64_008', 0, function () {
        var that = new util.Base64()
        var array = new Uint8Array([81,109,70,122,90,84,89,48,73,69,86,117,89,50,57,107,97,87,
        53,110,73,71,108,117,73,69,53,118,90,71,85,117,97,110,77,61]);
        var rarray = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,105,
        110,32,78,111,100,101,46,106,115]);
        var result = that.decodeSync(array);
        for (var i = 0; i < 26; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.name: test_decodeSync_base64_009
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
       array using the Base64 encoding scheme.
     */
    it('test_decodeSync_base64_009', 0, function () {
        var that = new util.Base64()
        var array = new Uint8Array([113,75,54,98,47,119,61,61]);
        var rarray = new Uint8Array([168, 174, 155, 255]);
        var result = that.decodeSync(array);
        for (var i = 0; i < 4; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.name: test_decodeSync_base64_010
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
       array using the Base64 encoding scheme.
     */
    it('test_decodeSync_base64_010', 0, function () {
        var that = new util.Base64()
        var array = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48]);
        var rarray = new Uint8Array([66, 97, 115, 101, 54, 52]);
        var result = that.decodeSync(array);
        for (var i = 0; i <6; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    //base64 EncodeAsync test
    /**
     * @tc.name: test_encodeAsync_base64_001
     * @tc.desc: Asynchronously encodes all bytes in the specified u8 array into the newly
       allocated u8 array using the Base64 encoding scheme.
     */
    it('test_encodeAsync_base64_001', 0, async function () {
        var that = await new util.Base64();
        var array = new Uint8Array([115,49,51]);
        var rarray = new Uint8Array([99,122,69,122]);
        that.encode(array).then(val=>{
            for (var i = 0; i < rarray.length; i++) {
                expect(val[i]).assertEqual(rarray[i])
            }
        })
    })

    /**
     * @tc.name: test_encodeAsync_base64_002
     * @tc.desc: Asynchronously encodes all bytes in the specified u8 array into the newly
       allocated u8 array using the Base64 encoding scheme.
     */
    it('test_encodeAsync_base64_002', 0, async function () {
        var that = new util.Base64()
        var array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
        var rarray = new Uint8Array([81,109,70,122,90,84,89,48,73,69,53,118,90,71,85,117,97,110,77,61]);
        that.encode(array).then(val=>{
            for (var i = 0; i < rarray.length; i++) {
                expect(val[i]).assertEqual(rarray[i])
            }
        })
    })

    /**
     * @tc.name: test_encodeAsync_base64_003
     * @tc.desc: Asynchronously encodes all bytes in the specified u8 array into the newly allocated u8
       array using the Base64 encoding scheme.
     */
    it('test_encodeAsync_base64_003', 0, async function () {
        var that = new util.Base64()
        var array = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,105,110,32,
        78,111,100,101,46,106,115]);
        var rarray = new Uint8Array([81,109,70,122,90,84,89,48,73,69,86,117,89,50,57,107,97,87,53,110,73,
        71,108,117,73,69,53,118,90,71,85,117,97,110,77,61]);
        that.encode(array).then(val=>{
            for (var i = 0; i < rarray.length; i++) {
                expect(val[i]).assertEqual(rarray[i])
            }
        })
    })

    /**
     * @tc.name: test_encodeAsync_base64_004
     * @tc.desc: Asynchronously encodes all bytes in the specified u8 array into the newly allocated u8
       array using the Base64 encoding scheme.
     */
    it('test_encodeAsync_base64_004', 0, async function () {
        var that = new util.Base64()
        var array = new Uint8Array([168, 174, 155, 255]);
        var rarray = new Uint8Array([113,75,54,98,47,119,61,61]);
        that.encode(array).then(val=>{
            for (var i = 0; i < rarray.length; i++) {
                expect(val[i]).assertEqual(rarray[i])
            }
        })
    })

    /**
     * @tc.name: test_encodeAsync_base64_005
     * @tc.desc: Asynchronously encodes all bytes in the specified u8 array into the newly allocated u8
       array using the Base64 encoding scheme.
     */
    it('test_encodeAsync_base64_005', 0, async function () {
        var that = new util.Base64()
        var array = new Uint8Array([66, 97, 115, 101, 54, 52]);
        var rarray = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48]);
        that.encode(array).then(val=>{
            for (var i = 0; i < rarray.length; i++) {
                expect(val[i]).assertEqual(rarray[i])
            }
        })
    })

    /**
     * @tc.name: test_encodeToString_base64_001
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     */
    it('test_encodeToString_base64_001', 0, async function () {
        var that = new util.Base64()
        var array = new Uint8Array([115,49,51]);
        that.encodeToString(array).then(val=>{
            expect(val).assertEqual('czEz')
        })
    })

    /**
     * @tc.name: test_encodeToString_base64_002
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     */
    it('test_encodeToString_base64_002', 0, async function () {
        var that = new util.Base64()
        var array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
        that.encodeToString(array).then(val=>{
            expect(val).assertEqual('QmFzZTY0IE5vZGUuanM=')
        })
    })

    /**
     * @tc.name: test_encodeToString_base64_003
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     */
    it('test_encodeToString_base64_003', 0, async function () {
        var that = new util.Base64()
        var array = new Uint8Array([81,109,70,122,90,84,89,48,73,69,86,117,89,50,57,107,97,87,53,110,73,71,108,
        117,73,69,53,118,90,71,85,117,97,110,77,61]);
        that.encodeToString(array).then(val=>{
            expect(val).assertEqual('QmFzZTY0IEVuY29kaW5nIGluIE5vZGUuanM=')
        })
    })

    /**
     * @tc.name: test_encodeToString_base64_004
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     */
    it('test_encodeToString_base64_004', 0, async function () {
        var that = new util.Base64()
        var array = new Uint8Array([168, 174, 155, 255]);
        that.encodeToString(array).then(val=>{
            expect(val).assertEqual('qK6b/w==')
        })
    })

    /**
     * @tc.name: test_encodeToString_base64_005
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     */
    it('test_encodeToString_base64_005', 0, async function () {
        var that = new util.Base64()
        var array = new Uint8Array([66, 97, 115, 101, 54, 52]);
        that.encodeToString(array).then(val=>{
            expect(val).assertEqual('QmFzZTY0')
        })
    })

    /**
     * @tc.name: test_decode_base64_001
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
       array into a newly allocated u8 array.
     */
    it('test_decode_base64_001', 0, async function () {
        var that = new util.Base64()
        var buff = 'czEz';
        var array = new Uint8Array([115,49,51]);
        that.decode(buff).then(val=>{
            for (var i = 0; i < array.length; i++) {
                expect(val[i]).assertEqual(array[i])
            }
        })
    })

    /**
     * @tc.name: test_decode_base64_002
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
       array into a newly allocated u8 array.
     */
    it('test_decode_base64_002', 0, async function () {
        var that = new util.Base64()
        var buff = 'QmFzZTY0IE5vZGUuanM=';
        var array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
        that.decode(buff).then(val=>{
            for (var i = 0; i < array.length; i++) {
                expect(val[i]).assertEqual(array[i])
            }
        })
    })

    /**
     * @tc.name: test_decode_base64_003
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
       array into a newly allocated u8 array.
     */
    it('test_decode_base64_003', 0, async function () {
        var that = new util.Base64()
        var buff = 'QmFzZTY0IEVuY29kaW5nIGluIE5vZGUuanM=';
        var array = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,105,110,32,78,
        111,100,101,46,106,115]);
        that.decode(buff).then(val=>{
            for (var i = 0; i < array.length; i++) {
                expect(val[i]).assertEqual(array[i])
            }
        })
    })

    /**
     * @tc.name: test_decode_base64_004
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
       array into a newly allocated u8 array.
     */
    it('test_decode_base64_004', 0, async function () {
        var that = new util.Base64()
        var buff = 'qK6b/w==';
        var array = new Uint8Array([168, 174, 155, 255]);
        that.decode(buff).then(val=>{
            for (var i = 0; i < array.length; i++) {
                expect(val[i]).assertEqual(array[i])
            }
        })
    })

    /**
     * @tc.name: test_decode_base64_005
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
       array into a newly allocated u8 array.
     */
    it('test_decode_base64_005', 0, async function () {
        var that = new util.Base64()
        var buff = 'QmFzZTY0';
        var rarray = new Uint8Array([66, 97, 115, 101, 54, 52]);
        that.decode(buff).then(val=>{
            for (var i = 0; i < rarray.length; i++) {
                expect(val[i]).assertEqual(rarray[i])
            }
        })
    })

    /**
     * @tc.name: test_decode_base64_006
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
       array into a newly allocated u8 array.
     */
    it('test_decode_base64_006', 0, async function () {
        var that = new util.Base64()
        var array = new Uint8Array([99,122,69,122]);
        var rarray = new Uint8Array([115,49,51]);
        that.decode(array).then(val=>{
            for (var i = 0; i < rarray.length; i++) {
                expect(val[i]).assertEqual(rarray[i])
            }
        })
    })

    /**
     * @tc.name: test_decode_base64_007
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
       array into a newly allocated u8 array.
     */
    it('test_decode_base64_007', 0, async function () {
        var that = new util.Base64()
        var array = new Uint8Array([81,109,70,122,90,84,89,48,73,69,53,118,90,71,85,117,97,110,77,61]);
        var rarray = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
        that.decode(array).then(val=>{
            for (var i = 0; i < rarray.length; i++) {
                expect(val[i]).assertEqual(rarray[i])
            }
        })
    })

    /**
     * @tc.name: test_decode_base64_008
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
       array into a newly allocated u8 array.
     */
    it('test_decode_base64_008', 0, async function () {
        var that = new util.Base64()
        var array = new Uint8Array([81,109,70,122,90,84,89,48,73,69,86,117,89,50,57,107,97,87,53,110,73,71,108,
        117,73,69,53,118,90,71,85,117,97,110,77,61]);
        var rarray = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,105,110,32,78,111,
        100,101,46,106,115]);
        that.decode(array).then(val=>{
            for (var i = 0; i < rarray.length; i++) {
                expect(val[i]).assertEqual(rarray[i])
            }
        })
    })

    /**
     * @tc.name: test_decode_base64_009
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8 array
       into a newly allocated u8 array.
     */
    it('test_decode_base64_009', 0, async function () {
        var that = new util.Base64()
        var array = new Uint8Array([113,75,54,98,47,119,61,61]);
        var rarray = new Uint8Array([168, 174, 155, 255]);
        that.decode(array).then(val=>{
            for (var i = 0; i < rarray.length; i++) {
                expect(val[i]).assertEqual(rarray[i])
            }
        })
    })

    /**
     * @tc.name: test_decode_base64_010
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
       array into a newly allocated u8 array.
     */
    it('test_decode_base64_010', 0, async function () {
        var that = new util.Base64()
        var array = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48]);
        var rarray = new Uint8Array([66, 97, 115, 101, 54, 52]);
        that.decode(array).then(val=>{
            for (var i = 0; i < rarray.length; i++) {
                expect(val[i]).assertEqual(rarray[i])
            }
        })
    })
})

describe('RationalNumberFunTest', function () {

    /**
     * @tc.name: test_createRationalFromString_001
     * @tc.desc: Creates a RationalNumber object based on a given string.
     */
    it('test_createRationalFromString_001', 0, function () {
        var res = util.RationalNumber.createRationalFromString('-1:2')
        var result1 = res.valueOf()
        expect(result1).assertEqual(-0.5)
    })

    /**
     * @tc.name: test_createRationalFromString_002
     * @tc.desc: Creates a RationalNumber object based on a given string.
     */
    it('test_createRationalFromString_002', 0, function () {
        var res = util.RationalNumber.createRationalFromString('+3/4')
        var result1 = res.valueOf()
        expect(result1).assertEqual(0.75)
    })

    /**
     * @tc.name: test_createRationalFromString_003
     * @tc.desc: Creates a RationalNumber object based on a given string.
     */
    it('test_createRationalFromString_003', 0, function () {
        var res = util.RationalNumber.createRationalFromString('+3:-4')
        var result1 = res.valueOf()
        expect(result1).assertEqual(-0.75)
    })

    /**
     * @tc.name: test_createRationalFromString_004
     * @tc.desc: Creates a RationalNumber object based on a given string.
     */
    it('test_createRationalFromString_004', 0, function () {
        var res = util.RationalNumber.createRationalFromString('+2:4')
        var result1 = res.valueOf()
        expect(result1).assertEqual(0.5)
    })

    /**
     * @tc.name: test_createRationalFromString_005
     * @tc.desc: Creates a RationalNumber object based on a given string.
     */
    it('test_createRationalFromString_005', 0, function () {
        var res = util.RationalNumber.createRationalFromString('-2:-4')
        var result1 = res.valueOf()
        expect(result1).assertEqual(0.5)
    })

    /**
     * @tc.name: test_compareTo_001
     * @tc.desc: Compares the current RationalNumber object with a given object.
     */
    it('test_compareTo_001', 0, function () {
        var pro = new util.RationalNumber(2, 1)
        var proc = new util.RationalNumber(3, 4)
        var res = pro.compareTo(proc)
        expect(res).assertEqual(1)
    })

    /**
     * @tc.name: test_compareTo_002
     * @tc.desc: Compares the current RationalNumber object with a given object.
     */
    it('test_compareTo_002', 0, function () {
        var pro = new util.RationalNumber(2, 1)
        var proc = new util.RationalNumber(0, 0)
        var res = pro.compareTo(proc)
        expect(res).assertEqual(-1)
    })

    /**
     * @tc.name: test_compareTo_003
     * @tc.desc: Compares the current RationalNumber object with a given object.
     */
    it('test_compareTo_003', 0, function () {
        var pro = new util.RationalNumber(2, 1)
        var proc = new util.RationalNumber(8, 3)
        var res = pro.compareTo(proc)
        expect(res).assertEqual(-1)
    })

    /**
     * @tc.name: test_compareTo_004
     * @tc.desc: Compares the current RationalNumber object with a given object.
     */
    it('test_compareTo_004', 0, function () {
        var pro = new util.RationalNumber(2, 1)
        var proc = new util.RationalNumber(2, 1)
        var res = pro.compareTo(proc)
        expect(res).assertEqual(0)
    })

    /**
     * @tc.name: test_compareTo_005
     * @tc.desc: Compares the current RationalNumber object with a given object.
     */
    it('test_compareTo_005', 0, function () {
        var pro = new util.RationalNumber(0, 0)
        var proc = new util.RationalNumber(2, 1)
        var res = pro.compareTo(proc)
        expect(res).assertEqual(1)
    })

    /**
     * @tc.name: test_equals_001
     * @tc.desc: Checks whether a given object is the same as the current RationalNumber object.
     */
    it('test_equals_001', 0, function () {
        var pro = new util.RationalNumber(2, 1)
        var proc = new util.RationalNumber(3, 4)
        var res = pro.equals(proc)
        expect(res).assertEqual(false)
    })

    /**
     * @tc.name: test_equals_002
     * @tc.desc: Checks whether a given object is the same as the current RationalNumber object.
     */
    it('test_equals_002', 0, function () {
        var pro = new util.RationalNumber(2, 1)
        var proc = new util.RationalNumber(4, 2)
        var res = pro.equals(proc)
        expect(res).assertEqual(true)
    })

    /**
     * @tc.name: test_equals_003
     * @tc.desc: Checks whether a given object is the same as the current RationalNumber object.
     */
    it('test_equals_003', 0, function () {
        var pro = new util.RationalNumber(0, 1)
        var proc = new util.RationalNumber(0, 2)
        var res = pro.equals(proc)
        expect(res).assertEqual(true)
    })

    /**
     * @tc.name: test_equals_004
     * @tc.desc: Checks whether a given object is the same as the current RationalNumber object.
     */
    it('test_equals_004', 0, function () {
        var pro = new util.RationalNumber(0, 0)
        var proc = new util.RationalNumber(0, 2)
        var res = pro.equals(proc)
        expect(res).assertEqual(false)
    })

    /**
     * @tc.name: test_equals_005
     * @tc.desc: Checks whether a given object is the same as the current RationalNumber object.
     */
    it('test_equals_005', 0, function () {
        var pro = new util.RationalNumber(-2, 0)
        var proc = new util.RationalNumber(2, 0)
        var res = pro.equals(proc)
        expect(res).assertEqual(false)
    })

    /**
     * @tc.name: testRationalNumberValueOf001
     * @tc.desc: Obtains the value of the current RationalNumber object as a number.
     */
    it('testRationalNumberValueOf001', 0, function () {
        var pro = new util.RationalNumber(2, 1)
        var res = pro.valueOf()
        expect(res).assertEqual(2)
    })

    /**
     * @tc.name: testRationalNumberValueOf002
     * @tc.desc: Obtains the value of the current RationalNumber object as a number.
     */
    it('testRationalNumberValueOf002', 0, function () {
        var pro = new util.RationalNumber(2, 10)
        var res = pro.valueOf()
        expect(res).assertEqual(0.2)
    })

    /**
     * @tc.name: testRationalNumberValueOf003
     * @tc.desc: Obtains the value of the current RationalNumber object as a number.
     */
    it('testRationalNumberValueOf003', 0, function () {
        var pro = new util.RationalNumber(1, 2)
        var res = pro.valueOf()
        expect(res).assertEqual(0.5)
    })

    /**
     * @tc.name: testRationalNumberValueOf004
     * @tc.desc: Obtains the value of the current RationalNumber object as a number.
     */
    it('testRationalNumberValueOf004', 0, function () {
        var pro = new util.RationalNumber(4, 2)
        var res = pro.valueOf()
        expect(res).assertEqual(2)
    })

    /**
     * @tc.name: testRationalNumberValueOf005
     * @tc.desc: Obtains the value of the current RationalNumber object as a number.
     */
    it('testRationalNumberValueOf005', 0, function () {
        var pro = new util.RationalNumber(4, 1)
        var res = pro.valueOf()
        expect(res).assertEqual(4)
    })

    /**
     * @tc.name: testGetCommonDivisor001
     * @tc.desc: Obtains the greatest common divisor of two specified numbers.
     */
    it('testGetCommonDivisor001', 0, function () {
        var pro = new util.RationalNumber(0, 0)
        var res = pro.getCommonDivisor(4, 8)
        expect(res).assertEqual(4)
    })

    /**
     * @tc.name: testGetCommonDivisor002
     * @tc.desc: Obtains the greatest common divisor of two specified numbers.
     */
    it('testGetCommonDivisor002', 0, function () {
        var pro = new util.RationalNumber(0, 0)
        var res = pro.getCommonDivisor(10, 15)
        expect(res).assertEqual(5)
    })

    /**
     * @tc.name: testGetCommonDivisor003
     * @tc.desc: Obtains the greatest common divisor of two specified numbers.
     */
    it('testGetCommonDivisor003', 0, function () {
        var pro = new util.RationalNumber(0, 0)
        var res = pro.getCommonDivisor(8, 4)
        expect(res).assertEqual(4)
    })

    /**
     * @tc.name: testGetCommonDivisor004
     * @tc.desc: Obtains the greatest common divisor of two specified numbers.
     */
    it('testGetCommonDivisor004', 0, function () {
        var pro = new util.RationalNumber(0, 0)
        var res = pro.getCommonDivisor(8, 16)
        expect(res).assertEqual(8)
    })

    /**
     * @tc.name: testGetCommonDivisor005
     * @tc.desc: Obtains the greatest common divisor of two specified numbers.
     */
    it('testGetCommonDivisor005', 0, function () {
        var pro = new util.RationalNumber(0, 0)
        var res = pro.getCommonDivisor(2, 16)
        expect(res).assertEqual(2)
    })

    /**
     * @tc.name: testGetDenominator001
     * @tc.desc: Obtains the denominator of the current RationalNumber object.
     */
    it('testGetDenominator001', 0, function () {
        var pro = new util.RationalNumber(2, 1)
        var res = pro.getDenominator()
        expect(res).assertEqual(1)
    })

    /**
     * @tc.name: testGetDenominator002
     * @tc.desc: Obtains the denominator of the current RationalNumber object.
     */
    it('testGetDenominator002', 0, function () {
        var pro = new util.RationalNumber(2, 3)
        var res = pro.getDenominator()
        expect(res).assertEqual(3)
    })

    /**
     * @tc.name: testGetDenominator003
     * @tc.desc: Obtains the denominator of the current RationalNumber object.
     */
    it('testGetDenominator003', 0, function () {
        var pro = new util.RationalNumber(2, 0)
        var res = pro.getDenominator()
        expect(res).assertEqual(0)
    })

    /**
     * @tc.name: testGetDenominator004
     * @tc.desc: Obtains the denominator of the current RationalNumber object.
     */
    it('testGetDenominator004', 0, function () {
        var pro = new util.RationalNumber(10, 5)
        var res = pro.getDenominator()
        expect(res).assertEqual(1)
    })

    /**
     * @tc.name: testGetDenominator005
     * @tc.desc: Obtains the denominator of the current RationalNumber object.
     */
    it('testGetDenominator005', 0, function () {
        var pro = new util.RationalNumber(6, 3)
        var res = pro.getDenominator()
        expect(res).assertEqual(1)
    })

    /**
     * @tc.name: testGetDenominator006
     * @tc.desc: Obtains the denominator of the current RationalNumber object.
     */
    it('testGetDenominator006', 0, function () {
        var pro = new util.RationalNumber(6, -3)
        var res = pro.getDenominator()
        expect(res).assertEqual(1)
    })

    /**
     * @tc.name: testGetNumerator001
     * @tc.desc: Obtains the numerator of the current RationalNumber object.
     */
    it('testGetNumerator001', 0, function () {
        var pro = new util.RationalNumber(-2, 1)
        var res = pro.getNumerator()
        expect(res).assertEqual(-2)
    })

    /**
     * @tc.name: testGetNumerator002
     * @tc.desc: Obtains the numerator of the current RationalNumber object.
     */
    it('testGetNumerator002', 0, function () {
        var pro = new util.RationalNumber(0, 3)
        var res = pro.getNumerator()
        expect(res).assertEqual(0)
    })

    /**
     * @tc.name: testGetNumerator003
     * @tc.desc: Obtains the numerator of the current RationalNumber object.
     */
    it('testGetNumerator003', 0, function () {
        var pro = new util.RationalNumber(2, 4)
        var res = pro.getNumerator()
        expect(res).assertEqual(1)
    })

    /**
     * @tc.name: testGetNumerator004
     * @tc.desc: Obtains the numerator of the current RationalNumber object.
     */
    it('testGetNumerator004', 0, function () {
        var pro = new util.RationalNumber(3, 6)
        var res = pro.getNumerator()
        expect(res).assertEqual(1)
    })

    /**
     * @tc.name: testGetNumerator005
     * @tc.desc: Obtains the numerator of the current RationalNumber object.
     */
    it('testGetNumerator005', 0, function () {
        var pro = new util.RationalNumber(10, 5)
        var res = pro.getNumerator()
        expect(res).assertEqual(2)
    })

    /**
     * @tc.name: testisFinite001
     * @tc.desc: Checks whether the current RationalNumber object represents a finite value.
     */
    it('testisFinite001', 0, function () {
        var pro = new util.RationalNumber(-2, 1)
        var res = pro.isFinite()
        expect(res).assertEqual(true)
    })

    /**
     * @tc.name: testisFinite002
     * @tc.desc: Checks whether the current RationalNumber object represents a finite value.
     */
    it('testisFinite002', 0, function () {
        var pro = new util.RationalNumber(0, 3)
        var res = pro.isFinite()
        expect(res).assertEqual(true)
    })

    /**
     * @tc.name: testisFinite003
     * @tc.desc: Checks whether the current RationalNumber object represents a finite value.
     */
    it('testisFinite003', 0, function () {
        var pro = new util.RationalNumber(2, 0)
        var res = pro.isFinite()
        expect(res).assertEqual(false)
    })

    /**
     * @tc.name: testisFinite004
     * @tc.desc: Checks whether the current RationalNumber object represents a finite value.
     */
    it('testisFinite004', 0, function () {
        var pro = new util.RationalNumber(1, 3)
        var res = pro.isFinite()
        expect(res).assertEqual(true)
    })

    /**
     * @tc.name: testisFinite005
     * @tc.desc: Checks whether the current RationalNumber object represents a finite value.
     */
    it('testisFinite005', 0, function () {
        var pro = new util.RationalNumber(10, 5)
        var res = pro.isFinite()
        expect(res).assertEqual(true)
    })

    /**
     * @tc.name: testisNaN001
     * @tc.desc: Checks whether the current RationalNumber object represents a finite value.
     */
    it('testisNaN001', 0, function () {
        var pro = new util.RationalNumber(-2, 1)
        var res = pro.isNaN()
        expect(res).assertEqual(false)
    })

    /**
     * @tc.name: testisNaN002
     * @tc.desc: Checks whether the current RationalNumber object represents a Not-a-Number (NaN) value.
     */
    it('testisNaN002', 0, function () {
        var pro = new util.RationalNumber(0, 3)
        var res = pro.isNaN()
        expect(res).assertEqual(false)
    })

    /**
     * @tc.name: testisNaN003
     * @tc.desc: Checks whether the current RationalNumber object represents a Not-a-Number (NaN) value.
     */
    it('testisNaN003', 0, function () {
        var pro = new util.RationalNumber(0, 0)
        var res = pro.isNaN()
        expect(res).assertEqual(true)
    })

    /**
     * @tc.name: testisNaN004
     * @tc.desc: Checks whether the current RationalNumber object represents a Not-a-Number (NaN) value.
     */
    it('testisNaN004', 0, function () {
        var pro = new util.RationalNumber(10, 0)
        var res = pro.isNaN()
        expect(res).assertEqual(false)
    })

    /**
     * @tc.name: testisNaN005
     * @tc.desc: Checks whether the current RationalNumber object represents a Not-a-Number (NaN) value.
     */
    it('testisNaN005', 0, function () {
        var pro = new util.RationalNumber(10, 1)
        var res = pro.isNaN()
        expect(res).assertEqual(false)
    })

    /**
     * @tc.name: testisZero001
     * @tc.desc: Checks whether the current RationalNumber object represents the value 0.
     */
    it('testisZero001', 0, function () {
        var pro = new util.RationalNumber(-2, 1)
        var res = pro.isZero()
        expect(res).assertEqual(false)
    })

    /**
     * @tc.name: testisZero002
     * @tc.desc: Checks whether the current RationalNumber object represents the value 0.
     */
    it('testisZero002', 0, function () {
        var pro = new util.RationalNumber(0, 3)
        var res = pro.isZero()
        expect(res).assertEqual(true)
    })

    /**
     * @tc.name: testisZero003
     * @tc.desc: Checks whether the current RationalNumber object represents the value 0.
     */
    it('testisZero003', 0, function () {
        var pro = new util.RationalNumber(0, 0)
        var res = pro.isZero()
        expect(res).assertEqual(false)
    })

    /**
     * @tc.name: testisZero004
     * @tc.desc: Checks whether the current RationalNumber object represents the value 0.
     */
    it('testisZero004', 0, function () {
        var pro = new util.RationalNumber(10, 2)
        var res = pro.isZero()
        expect(res).assertEqual(false)
    })

    /**
     * @tc.name: testisZero005
     * @tc.desc: Checks whether the current RationalNumber object represents the value 0.
     */
    it('testisZero005', 0, function () {
        var pro = new util.RationalNumber(1, 1)
        var res = pro.isZero()
        expect(res).assertEqual(false)
    })

    /**
     * @tc.name: testRationalNumberToString001
     * @tc.desc: Obtains a string representation of the current RationalNumber object.
     */
    it('testRationalNumberToString001', 0, function () {
        var pro = new util.RationalNumber(-2, 1)
        var res = pro.toString()
        expect(res).assertEqual("-2/1")
    })

    /**
     * @tc.name: testRationalNumberToString002
     * @tc.desc: Obtains a string representation of the current RationalNumber object.
     */
    it('testRationalNumberToString002', 0, function () {
        var pro = new util.RationalNumber(0, 0)
        var res = pro.toString()
        expect(res).assertEqual("NaN")
    })

    /**
     * @tc.name: testRationalNumberToString003
     * @tc.desc: Obtains a string representation of the current RationalNumber object.
     */
    it('testRationalNumberToString003', 0, function () {
        var pro = new util.RationalNumber(3, 0)
        var res = pro.toString()
        expect(res).assertEqual("Infinity")
    })

    /**
     * @tc.name: testRationalNumberToString004
     * @tc.desc: Obtains a string representation of the current RationalNumber object.
     */
    it('testRationalNumberToString004', 0, function () {
        var pro = new util.RationalNumber(-3, 0)
        var res = pro.toString()
        expect(res).assertEqual("-Infinity")
    })

    /**
     * @tc.name: testRationalNumberToString005
     * @tc.desc: Obtains a string representation of the current RationalNumber object.
     */
    it('testRationalNumberToString005', 0, function () {
        var pro = new util.RationalNumber(2, 3)
        var res = pro.toString()
        expect(res).assertEqual('2/3')
    })
})

describe('LruBufferFunTest', function () {

    /**
     * @tc.name: testLruBufferUpdateGetCapacity001
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     */
    it('testLruBufferUpdateGetCapacity001', 0, function () {
        var that = new util.LruBuffer()
        that.updateCapacity(10)
        var result = that.getCapacity()
        expect(result).assertEqual(10)
    })

    /**
     * @tc.name: testLruBufferUpdateGetCapacity002
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     */
    it('testLruBufferUpdateGetCapacity002', 0, function () {
        var that = new util.LruBuffer()
        that.updateCapacity(2147483646)
        var result = that.getCapacity()
        expect(result).assertEqual(2147483646)
    })

    /**
     * @tc.name: testLruBufferUpdateGetCapacity003
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     */
    it('testLruBufferUpdateGetCapacity003', 0, function () {
        var that = new util.LruBuffer(100)
        that.updateCapacity(20)
        var result = that.getCapacity()
        expect(result).assertEqual(20)
    })

    /**
     * @tc.name: testLruBufferUpdateGetCapacity004
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     */
    it('testLruBufferUpdateGetCapacity004', 0, function () {
        var that = new util.LruBuffer(50)
        that.updateCapacity(2)
        var result = that.getCapacity()
        expect(result).assertEqual(2)
    })

    /**
     * @tc.name: testLruBufferUpdateGetCapacity005
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     */
    it('testLruBufferUpdateGetCapacity005', 0, function () {
        var that = new util.LruBuffer(200)
        that.updateCapacity(100)
        var result = that.getCapacity()
        expect(result).assertEqual(100)
    })

    /**
     * @tc.name: testLruBufferGet001
     * @tc.desc: Obtains the value associated with a specified key.
     */
    it('testLruBufferGet001', 0, function () {
        var that = new util.LruBuffer(100)
        that.put(1,2)
        var result = that.get(1)
        expect(result).assertEqual(2)
    })

    /**
     * @tc.name: testLruBufferGet002
     * @tc.desc: Obtains the value associated with a specified key.
     */
    it('testLruBufferGet002', 0, function () {
        var that = new util.LruBuffer(100)
        that.put(1,2)
        var result = that.get(5)
        expect(result).assertEqual(undefined)
    })

    /**
     * @tc.name: testLruBufferGet003
     * @tc.desc: Obtains the value associated with a specified key.
     */
    it('testLruBufferGet003', 0, function () {
        var that = new util.LruBuffer(100)
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        var result1 = that.get(20)
        var result2 = that.get('abcd')
        var result3 = that.get(2)
        expect(result1).assertEqual(undefined)
        expect(result2).assertEqual(15)
        expect(result3).assertEqual(10)
    })

    /**
     * @tc.name: testLruBufferGet004
     * @tc.desc: Obtains the value associated with a specified key.
     */
    it('testLruBufferGet004', 0, function () {
        var that = new util.LruBuffer()
        that.put('1111','bcjdshc')
        that.put(20,'cdjcaxb')
        that.put('abcd',15)
        var result1 = that.get('1111')
        var result2 = that.get(20)
        var result3 = that.get('abcd')
        var result4 = that.get(25)
        expect(result1).assertEqual('bcjdshc')
        expect(result2).assertEqual('cdjcaxb')
        expect(result3).assertEqual(15)
        expect(result4).assertEqual(undefined)
    })

    /**
     * @tc.name: testLruBufferGet005
     * @tc.desc: Obtains the value associated with a specified key.
     */
    it('testLruBufferGet005', 0, function () {
        var that = new util.LruBuffer()
        that.put('1111','bcjdshc')
        that.put(20,'cdjcaxb')
        that.updateCapacity(2)
        that.put('abcd',15)
        var result1 = that.get('1111')
        var result2 = that.get(20)
        var result3 = that.get('abcd')
        var result4 = that.get(25)
        expect(result1).assertEqual(undefined)
        expect(result2).assertEqual('cdjcaxb')
        expect(result3).assertEqual(15)
        expect(result4).assertEqual(undefined)
    })

    /**
     * @tc.name: testLruBufferPut001
     * @tc.desc: Adds a key-value pair to the buffer.
     */
    it('testLruBufferPut001', 0, function () {
        var that = new util.LruBuffer()
        var temp = that.put('1111','bcjdshc')
        expect(temp).assertEqual(undefined)
    })

    /**
     * @tc.name: testLruBufferPut002
     * @tc.desc: Adds a key-value pair to the buffer.
     */
    it('testLruBufferPut002', 0, function () {
        var that = new util.LruBuffer()
        var temp1 = that.put('1111','bcjdshc')
        var temp2 = that.put('1111',13)
        expect(temp2).assertEqual('bcjdshc')
    })

    /**
     * @tc.name: testLruBufferPut003
     * @tc.desc: Adds a key-value pair to the buffer.
     */
    it('testLruBufferPut003', 0, function () {
        var that = new util.LruBuffer()
        var temp = that.put('1111','bcjdshc')
        var temp1 = that.put(1,12)
        var temp2 = that.put(2,5)
        var temp3 = that.put(2,'adasfdad')
        var temp4 = that.put('abc',10)
        expect(temp1).assertEqual(undefined)
        expect(temp2).assertEqual(undefined)
        expect(temp3).assertEqual(5)
        expect(temp4).assertEqual(undefined)
    })

    /**
     * @tc.name: testLruBufferPut004
     * @tc.desc: Adds a key-value pair to the buffer.
     */
    it('testLruBufferPut004', 0, function () {
        var that = new util.LruBuffer()
        var temp = that.put('1111','bcjdshc')
        var temp1 = that.put(1,12)
        var temp2 = that.put(2,5)
        that.updateCapacity(2)
        var temp3 = that.put(2,'adasfdad')
        var temp4 = that.put('1111',10)
        expect(temp).assertEqual(undefined)
        expect(temp1).assertEqual(undefined)
        expect(temp2).assertEqual(undefined)
        expect(temp3).assertEqual(5)
        expect(temp4).assertEqual(undefined)
    })

    /**
     * @tc.name: testLruBufferPut005
     * @tc.desc: Adds a key-value pair to the buffer.
     */
    it('testLruBufferPut005', 0, function () {
        var that = new util.LruBuffer()
        var temp = that.put('1111','bcjdshc')
        var temp1 = that.put(1,12)
        var temp2 = that.put(2,5)
        var temp3 = that.put(1,10)
        var temp4 = that.put(2,22)
        var temp5 = that.put(2,30)
        expect(temp).assertEqual(undefined)
        expect(temp1).assertEqual(undefined)
        expect(temp2).assertEqual(undefined)
        expect(temp3).assertEqual(12)
        expect(temp4).assertEqual(5)
        expect(temp5).assertEqual(22)
    })

    /**
     * @tc.name: testLruBufferGetCreateCount001
     * @tc.desc: Obtains the number of times createDefault(Object) returned a value.
     */
    it('testLruBufferGetCreateCount001', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.get(3)
        that.get(5)
        that.get(10)
        var result = that.getCreateCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.name: testLruBufferGetCreateCount002
     * @tc.desc: Obtains the number of times createDefault(Object) returned a value.
     */
    it('testLruBufferGetCreateCount002', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.get(6)
        that.get(8)
        that.get(20)
        var result = that.getCreateCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.name: testLruBufferGetCreateCount003
     * @tc.desc: Obtains the number of times createDefault(Object) returned a value.
     */
    it('testLruBufferGetCreateCount003', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(2,10)
        that.get('abc')
        that.get('cndk')
        var result = that.getCreateCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.name: testLruBufferGetCreateCount004
     * @tc.desc: Obtains the number of times createDefault(Object) returned a value.
     */
    it('testLruBufferGetCreateCount004', 0, function () {
        var that = new util.LruBuffer()
        that.put(5,2)
        that.put(10,10)
        that.put('abcd','abcd')
        that.get(3)
        that.get(20)
        that.get(12)
        var result = that.getCreateCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.name: testLruBufferGetCreateCount005
     * @tc.desc: Obtains the number of times createDefault(Object) returned a value.
     */
    it('testLruBufferGetCreateCount005', 0, function () {
        var that = new util.LruBuffer()
        that.put('xsjk','bcjds')
        that.put('ajc',10)
        that.put('abcd',15)
        that.get(2)
        that.get(10)
        that.get(30)
        var result = that.getCreateCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.name: testLruBufferGetMissCount001
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     */
    it('testLruBufferGetMissCount001', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.get(3)
        that.get(5)
        that.get(10)
        var result = that.getMissCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLruBufferGetMissCount002
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     */
    it('testLruBufferGetMissCount002', 0, function () {
        var that = new util.LruBuffer()
        that.put(5,2)
        that.put(1,10)
        that.put('abcd','bcjsc')
        that.get(2)
        that.get(10)
        that.get(15)
        var result = that.getMissCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLruBufferGetMissCount003
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     */
    it('testLruBufferGetMissCount003', 0, function () {
        var that = new util.LruBuffer()
        that.put(10,10)
        that.put(3,20)
        that.put(12,16)
        that.get(1)
        that.get(2)
        that.get(6)
        var result = that.getMissCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLruBufferGetMissCount004
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     */
    it('testLruBufferGetMissCount004', 0, function () {
        var that = new util.LruBuffer()
        that.put('acb','asdc')
        that.put('vfb',1)
        that.put('abcd','abcd')
        that.get(3)
        that.get(5)
        that.get(10)
        var result = that.getMissCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLruBufferGetMissCount005
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     */
    it('testLruBufferGetMissCount005', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.get(3)
        that.get(5)
        that.get(10)
        that.contains(2)
        that.contains(6)
        var result = that.getMissCount()
        expect(result).assertEqual(4)
    })

    /**
     * @tc.name: testLruBufferGetMissCount006
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     */
    it('testLruBufferGetMissCount006', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.get(1)
        that.get(2)
        that.get('abcd')
        var result = that.getMissCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.name: testLruBufferGetRemovalCount001
     * @tc.desc: Obtains the number of times that values are evicted from the buffer.
     */
    it('testLruBufferGetRemovalCount001', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.put(3,20)
        that.put(5,30)
        var result = that.getRemovalCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.name: testLruBufferGetRemovalCount002
     * @tc.desc: Obtains the number of times that values are evicted from the buffer.
     */
    it('testLruBufferGetRemovalCount002', 0, function () {
        var that = new util.LruBuffer()
        that.put(10,2)
        that.put(3,2)
        that.put(15,15)
        that.put(1,20)
        var result = that.getRemovalCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.name: testLruBufferGetRemovalCount003
     * @tc.desc: Obtains the number of times that values are evicted from the buffer.
     */
    it('testLruBufferGetRemovalCount003', 0, function () {
        var that = new util.LruBuffer()
        that.put('abc',2)
        that.put('abcd','abcd')
        that.put(3,2)
        var result = that.getRemovalCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.name: testLruBufferGetRemovalCount004
     * @tc.desc: Obtains the number of times that values are evicted from the buffer.
     */
    it('testLruBufferGetRemovalCount004', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.updateCapacity(2)
        that.put(3,20)
        that.put(5,30)
        var result = that.getRemovalCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLruBufferGetRemovalCount005
     * @tc.desc: Obtains the number of times that values are evicted from the buffer.
     */
    it('testLruBufferGetRemovalCount005', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.updateCapacity(3)
        that.put('string',20)
        that.put('abc',30)
        that.put(10,20)
        var result = that.getRemovalCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLruBufferGetMatchCount001
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     */
    it('testLruBufferGetMatchCount001', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.get(1)
        that.get(2)
        that.get('abcd')
        var result = that.getMatchCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLruBufferGetMatchCount002
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     */
    it('testLruBufferGetMatchCount002', 0, function () {
        var that = new util.LruBuffer()
        that.put(10,2)
        that.put(2,1)
        that.put('abcd',15)
        that.get(10)
        that.get(2)
        that.get('abcd')
        that.get('string')
        var result = that.getMatchCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLruBufferGetMatchCount003
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     */
    it('testLruBufferGetMatchCount003', 0, function () {
        var that = new util.LruBuffer()
        that.put(0,1)
        that.put(30,10)
        that.put('abcd',15)
        that.get(0)
        that.get(30)
        that.get('abcd')
        var result = that.getMatchCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLruBufferGetMatchCount004
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     */
    it('testLruBufferGetMatchCount004', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.get(1)
        that.get(2)
        that.get('abcd')
        that.contains(2)
        that.contains('abcd')
        that.contains(20)
        var result = that.getMatchCount()
        expect(result).assertEqual(5)
    })

    /**
     * @tc.name: testLruBufferGetMatchCount005
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     */
    it('testLruBufferGetMatchCount005', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.put('string','string')
        that.get(1)
        that.get(2)
        that.get('abcd')
        that.get('string')
        that.contains(2)
        that.contains('abcd')
        that.contains('string')
        that.contains(10)
        var result = that.getMatchCount()
        expect(result).assertEqual(7)
    })

    /**
     * @tc.name: testLruBufferGetMatchCount006
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     */
    it('testLruBufferGetMatchCount006', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.get(5)
        var result = that.getMatchCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.name: testLruBufferGetPutCount001
     * @tc.desc: Obtains the number of times that values are added to the buffer.
     */
    it('testLruBufferGetPutCount001', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        var result = that.getPutCount()
        expect(result).assertEqual(1)
    })

    /**
     * @tc.name: testLruBufferGetPutCount002
     * @tc.desc: Obtains the number of times that values are added to the buffer.
     */
    it('testLruBufferGetPutCount002', 0, function () {
        var that = new util.LruBuffer()
        that.put(5,3)
        that.put(2,10)
        var result = that.getPutCount()
        expect(result).assertEqual(2)
    })

    /**
     * @tc.name: testLruBufferGetPutCount003
     * @tc.desc: Obtains the number of times that values are added to the buffer.
     */
    it('testLruBufferGetPutCount003', 0, function () {
        var that = new util.LruBuffer()
        that.put('string',2)
        that.put('abcd',1)
        that.put('ab','a')
        var result = that.getPutCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLruBufferGetPutCount004
     * @tc.desc: Obtains the number of times that values are added to the buffer.
     */
    it('testLruBufferGetPutCount004', 0, function () {
        var that = new util.LruBuffer()
        that.put('string','string')
        that.put('ac','abc')
        that.put('abcd',15)
        var result = that.getPutCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLruBufferGetPutCount005
     * @tc.desc: Obtains the number of times that values are added to the buffer.
     */
    it('testLruBufferGetPutCount005', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(2,10)
        that.updateCapacity(2)
        that.put('abcd','abc')
        var result = that.getPutCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLruBufferGetCapacity001
     * @tc.desc: Obtains the capacity of the current buffer.
     */
    it('testLruBufferGetCapacity001', 0, function () {
        var that = new util.LruBuffer()
        var result = that.getCapacity()
        expect(result).assertEqual(64)
    })

    /**
     * @tc.name: testLruBufferGetCapacity002
     * @tc.desc: Obtains the capacity of the current buffer.
     */
    it('testLruBufferGetCapacity002', 0, function () {
        var that = new util.LruBuffer(2)
        var result = that.getCapacity()
        expect(result).assertEqual(2)
    })

    /**
     * @tc.name: testLruBufferGetCapacity003
     * @tc.desc: Obtains the capacity of the current buffer.
     */
    it('testLruBufferGetCapacity003', 0, function () {
        var that = new util.LruBuffer(100)
        var result = that.getCapacity()
        expect(result).assertEqual(100)
    })

    /**
     * @tc.name: testLruBufferGetCapacity004
     * @tc.desc: Obtains the capacity of the current buffer.
     */
    it('testLruBufferGetCapacity004', 0, function () {
        var that = new util.LruBuffer()
        that.updateCapacity(50)
        var result = that.getCapacity()
        expect(result).assertEqual(50)
    })

    /**
     * @tc.name: testLruBufferGetCapacity005
     * @tc.desc: Obtains the capacity of the current buffer.
     */
    it('testLruBufferGetCapacity005', 0, function () {
        var that = new util.LruBuffer(100)
        that.updateCapacity(10)
        var result = that.getCapacity()
        expect(result).assertEqual(10)
    })

    /**
     * @tc.name: testLruBufferLength001
     * @tc.desc: Obtains the total number of values in the current buffer.
     */
    it('testLruBufferLength001', 0, function () {
        var that = new util.LruBuffer()
        var result = that.length
        expect(result).assertEqual(0)
    })

    /**
     * @tc.name: testLruBufferLength002
     * @tc.desc: Obtains the total number of values in the current buffer.
     */
    it('testLruBufferLength002', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        var result = that.length
        expect(result).assertEqual(1)
    })

    /**
     * @tc.name: testLruBufferLength003
     * @tc.desc: Obtains the total number of values in the current buffer.
     */
    it('testLruBufferLength003', 0, function () {
        var that = new util.LruBuffer()
        that.put('abc',2)
        that.put('string','string')
        var result = that.length
        expect(result).assertEqual(2)
    })

    /**
     * @tc.name: testLruBufferLength004
     * @tc.desc: Obtains the total number of values in the current buffer.
     */
    it('testLruBufferLength004', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.put('abcd',20)
        var result = that.length
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLruBufferLength005
     * @tc.desc: Obtains the total number of values in the current buffer.
     */
    it('testLruBufferLength005', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.put('abcd',20)
        that.updateCapacity(3);
        that.put(5,33);
        that.put(25,35);
        var result = that.length
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLruBufferClear001
     * @tc.desc: Clears key-value pairs from the current buffer.
     */
    it('testLruBufferClear001', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        var result1 = that.length
        that.clear()
        var result2 = that.length
        expect(result1).assertEqual(1)
        expect(result2).assertEqual(0)
    })

    /**
     * @tc.name: testLruBufferClear002
     * @tc.desc: Clears key-value pairs from the current buffer.
     */
    it('testLruBufferClear002', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(2,10)
        that.put(5,33);
        that.put(25,35);
        var result1 = that.length
        that.clear()
        var result2 = that.length
        expect(result1).assertEqual(4)
        expect(result2).assertEqual(0)
    })

    /**
     * @tc.name: testLruBufferClear003
     * @tc.desc: Clears key-value pairs from the current buffer.
     */
    it('testLruBufferClear003', 0, function () {
        var that = new util.LruBuffer()
        that.put('abc',2)
        that.put(2,'abc')
        that.put('ancd','abcd')
        that.put(10,35)
        var result1 = that.length
        that.clear()
        var result2 = that.length
        expect(result1).assertEqual(4)
        expect(result2).assertEqual(0)
    })

    /**
     * @tc.name: testLruBufferClear004
     * @tc.desc: Clears key-value pairs from the current buffer.
     */
    it('testLruBufferClear004', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(2,10)
        that.put(5,33);
        that.updateCapacity(3);
        var result1 = that.length
        that.clear()
        var result2 = that.length
        expect(result1).assertEqual(3)
        expect(result2).assertEqual(0)
    })

    /**
     * @tc.name: testLruBufferClear005
     * @tc.desc: Clears key-value pairs from the current buffer.
     */
    it('testLruBufferClear005', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(2,10)
        that.put(5,33);
        that.put('abcd','string');
        that.updateCapacity(2);
        var result1 = that.length
        that.clear()
        var result2 = that.length
        expect(result1).assertEqual(2)
        expect(result2).assertEqual(0)
    })

    /**
     * @tc.name: testLruBufferIsEmpty001
     * @tc.desc: Checks whether the current buffer is empty.
     */
    it('testLruBufferIsEmpty001', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        var result = that.isEmpty()
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name: testLruBufferIsEmpty002
     * @tc.desc: Checks whether the current buffer is empty.
     */
    it('testLruBufferIsEmpty002', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(2,10)
        var result = that.isEmpty()
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name: testLruBufferIsEmpty003
     * @tc.desc: Checks whether the current buffer is empty.
     */
    it('testLruBufferIsEmpty003', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(2,10)
        that.put(5,33)
        var result = that.isEmpty()
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name: testLruBufferIsEmpty004
     * @tc.desc: Checks whether the current buffer is empty.
     */
    it('testLruBufferIsEmpty004', 0, function () {
        var that = new util.LruBuffer()
        that.put('abc',2)
        that.put('string',10)
        that.put('ab','abc')
        var result = that.isEmpty()
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name: testLruBufferIsEmpty005
     * @tc.desc: Checks whether the current buffer is empty.
     */
    it('testLruBufferIsEmpty005', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(2,10)
        that.put(5,33);
        that.clear()
        var result = that.isEmpty()
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name: testLruBufferContains001
     * @tc.desc: Checks whether the current buffer contains a specified key.
     */
    it('testLruBufferContains001', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        var result = that.contains(1)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name: testLruBufferContains002
     * @tc.desc: Checks whether the current buffer contains a specified key.
     */
    it('testLruBufferContains002', 0, function () {
        var that = new util.LruBuffer()
        that.put(0,5)
        var result = that.contains(0)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name: testLruBufferContains003
     * @tc.desc: Checks whether the current buffer contains a specified key.
     */
    it('testLruBufferContains003', 0, function () {
        var that = new util.LruBuffer()
        that.put('abc','abc')
        var result = that.contains(1)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name: testLruBufferContains004
     * @tc.desc: Checks whether the current buffer contains a specified key.
     */
    it('testLruBufferContains004', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put('abcd',20)
        var result1 = that.contains(1)
        var result2 = that.contains(20)
        expect(result1).assertEqual(true)
        expect(result2).assertEqual(false)
    })

    /**
     * @tc.name: testLruBufferContains005
     * @tc.desc: Checks whether the current buffer contains a specified key.
     */
    it('testLruBufferContains005', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put('string','string')
        var result1 = that.contains(1)
        var result2 = that.contains('string')
        var result3 = that.contains(0)
        expect(result1).assertEqual(true)
        expect(result2).assertEqual(true)
        expect(result3).assertEqual(false)
    })

    /**
     * @tc.name: testLruBufferRemove001
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     */
    it('testLruBufferRemove001', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        var result = that.remove(1)
        expect(result).assertEqual(2)
    })

    /**
     * @tc.name: testLruBufferRemove002
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     */
    it('testLruBufferRemove002', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put('abcd',20)
        var result1 = that.remove(1)
        var result2 = that.remove('abcd')
        expect(result1).assertEqual(2)
        expect(result2).assertEqual(20)
    })

    /**
     * @tc.name: testLruBufferRemove003
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     */
    it('testLruBufferRemove003', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        var result1 = that.remove(1)
        var result2 = that.remove(5)
        expect(result1).assertEqual(2)
        expect(result2).assertEqual(undefined)
    })

    /**
     * @tc.name: testLruBufferRemove004
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     */
    it('testLruBufferRemove004', 0, function () {
        var that = new util.LruBuffer()
        that.put(0,'abc')
        that.put('abcd',20)
        var result1 = that.remove(1)
        var result2 = that.remove('abcd')
        expect(result1).assertEqual(undefined)
        expect(result2).assertEqual(20)
    })

    /**
     * @tc.name: testLruBufferRemove005
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     */
    it('testLruBufferRemove005', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        var result1 = that.remove(1)
        var result2 = that.remove(3)
        var result3 = that.get(3)
        expect(result1).assertEqual(2)
        expect(result2).assertEqual(10)
        expect(result3).assertEqual(undefined)
    })

    /**
     * @tc.name: testLruBufferCreateDefault001
     * @tc.desc: Executes subsequent operations if miss to compute a value for the specific key.
     */
    it('testLruBufferCreateDefault001', 0, function () {
        var that = new util.LruBuffer()
        var result = that.createDefault(1)
        expect(result).assertEqual(undefined)
    })

    /**
     * @tc.name: testLruBufferCreateDefault002
     * @tc.desc: Executes subsequent operations if miss to compute a value for the specific key.
     */
    it('testLruBufferCreateDefault002', 0, function () {
        var that = new util.LruBuffer()
        var result = that.createDefault(0)
        expect(result).assertEqual(undefined)
    })

    /**
     * @tc.name: testLruBufferCreateDefault003
     * @tc.desc: Executes subsequent operations if miss to compute a value for the specific key.
     */
    it('testLruBufferCreateDefault003', 0, function () {
        var that = new util.LruBuffer()
        var result = that.createDefault('string')
        expect(result).assertEqual(undefined)
    })

    /**
     * @tc.name: testLruBufferCreateDefault004
     * @tc.desc: Executes subsequent operations if miss to compute a value for the specific key.
     */
    it('testLruBufferCreateDefault004', 0, function () {
        var that = new util.LruBuffer()
        var result = that.createDefault(10)
        expect(result).assertEqual(undefined)
    })

    /**
     * @tc.name: testLruBufferCreateDefault005
     * @tc.desc: Executes subsequent operations if miss to compute a value for the specific key.
     */
    it('testLruBufferCreateDefault005', 0, function () {
        var that = new util.LruBuffer()
        var result1 = that.createDefault('abc')
        var result2 = that.createDefault('ab')
        expect(result1).assertEqual(undefined)
        expect(result2).assertEqual(undefined)
    })

    /**
     * @tc.name: testLruBufferKeys001
     * @tc.desc: Obtains a list of keys for the values in the current buffer.
     */
    it('testLruBufferKeys001', 0, function () {
        var that = new util.LruBuffer()
        that.put('string','abc')
        var result = that.keys()
        expect(result[0]).assertEqual('string')
    })

    /**
     * @tc.name: testLruBufferKeys002
     * @tc.desc: Obtains a list of keys for the values in the current buffer.
     */
    it('testLruBufferKeys002', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        var result = that.keys()
        expect(result[0]).assertEqual(1)
        expect(result[1]).assertEqual(3)
        expect(result[2]).assertEqual(5)
        expect(result[3]).assertEqual('abc')
    })

    /**
     * @tc.name: testLruBufferKeys003
     * @tc.desc: Obtains a list of keys for the values in the current buffer.
     */
    it('testLruBufferKeys003', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        var result = that.keys()
        expect(result[0]).assertEqual(1)
        expect(result[1]).assertEqual(5)
        expect(result[2]).assertEqual('abc')
        expect(result[3]).assertEqual(3)
    })

    /**
     * @tc.name: testLruBufferKeys004
     * @tc.desc: Obtains a list of keys for the values in the current buffer.
     */
    it('testLruBufferKeys004', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        that.contains(1)
        var result = that.keys()
        expect(result[0]).assertEqual(5)
        expect(result[1]).assertEqual('abc')
        expect(result[2]).assertEqual(3)
        expect(result[3]).assertEqual(1)
    })

    /**
     * @tc.name: testLruBufferKeys005
     * @tc.desc: Obtains a list of keys for the values in the current buffer.
     */
    it('testLruBufferKeys005', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        that.remove(5)
        that.contains(3)
        that.get(1)
        that.contains('abc')
        var result = that.keys()
        expect(result[0]).assertEqual(3)
        expect(result[1]).assertEqual(1)
        expect(result[2]).assertEqual('abc')
    })

    /**
     * @tc.name: testLruBufferValues001
     * @tc.desc: Obtains a list of all values in the current buffer.
     */
    it('testLruBufferValues001', 0, function () {
        var that = new util.LruBuffer()
        that.put('string','abc')
        var result = that.values()
        expect(result[0]).assertEqual('abc')
    })

    /**
     * @tc.name: testLruBufferValues002
     * @tc.desc: Obtains a list of all values in the current buffer.
     */
    it('testLruBufferValues002', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        var result = that.values()
        expect(result[0]).assertEqual(2)
        expect(result[1]).assertEqual(10)
        expect(result[2]).assertEqual(15)
        expect(result[3]).assertEqual(20)
    })

    /**
     * @tc.name: testLruBufferValues003
     * @tc.desc: Obtains a list of all values in the current buffer.
     */
    it('testLruBufferValues003', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        var result = that.values()
        expect(result[0]).assertEqual(2)
        expect(result[1]).assertEqual(15)
        expect(result[2]).assertEqual(20)
        expect(result[3]).assertEqual(10)
    })

    /**
     * @tc.name: testLruBufferValues004
     * @tc.desc: Obtains a list of all values in the current buffer.
     */
    it('testLruBufferValues004', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        that.contains(1)
        var result = that.values()
        expect(result[0]).assertEqual(15)
        expect(result[1]).assertEqual(20)
        expect(result[2]).assertEqual(10)
        expect(result[3]).assertEqual(2)
    })

    /**
     * @tc.name: testLruBufferValues005
     * @tc.desc: Obtains a list of all values in the current buffer.
     */
    it('testLruBufferValues005', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        that.remove(5)
        that.contains(3)
        that.get(1)
        that.contains('abc')
        var result = that.values()
        expect(result[0]).assertEqual(10)
        expect(result[1]).assertEqual(2)
        expect(result[2]).assertEqual(20)
    })

    /**
     * @tc.name: testLruBufferToString001
     * @tc.desc: Returns a string representation of the object.
     */
    it('testLruBufferToString001', 0, function () {
        var that = new util.LruBuffer()
        that.put('1111','bcjdshc')
        that.put(1,2)
        var result = that.toString()
        expect(result).assertEqual('Lrubuffer[ maxSize = 64, hits = 0, misses = 0, hitRate = 0% ]')
    })

    /**
     * @tc.name: testLruBufferToString002
     * @tc.desc: Returns a string representation of the object.
     */
    it('testLruBufferToString002', 0, function () {
        var that = new util.LruBuffer()
        that.put('1111','bcjdshc')
        that.put(1,2)
        that.get(1)
        that.get('1111')
        var result = that.toString()
        expect(result).assertEqual('Lrubuffer[ maxSize = 64, hits = 2, misses = 0, hitRate = 100% ]')
    })

    /**
     * @tc.name: testLruBufferToString003
     * @tc.desc: Returns a string representation of the object.
     */
    it('testLruBufferToString003', 0, function () {
        var that = new util.LruBuffer(100)
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        var result = that.toString()
        expect(result).assertEqual('Lrubuffer[ maxSize = 100, hits = 1, misses = 0, hitRate = 100% ]')
    })

    /**
     * @tc.name: testLruBufferToString004
     * @tc.desc: Returns a string representation of the object.
     */
    it('testLruBufferToString004', 0, function () {
        var that = new util.LruBuffer(100)
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        that.get(2)
        var result = that.toString()
        expect(result).assertEqual('Lrubuffer[ maxSize = 100, hits = 1, misses = 1, hitRate = 50% ]')
    })

    /**
     * @tc.name: testLruBufferToString005
     * @tc.desc: Returns a string representation of the object.
     */
    it('testLruBufferToString005', 0, function () {
        var that = new util.LruBuffer(100)
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        that.get(2)
        that.get(1)
        that.contains(5)
        var result = that.toString()
        expect(result).assertEqual('Lrubuffer[ maxSize = 100, hits = 3, misses = 1, hitRate = 75% ]')
    })

    /**
     * @tc.name: testLruBufferEntries001
     * @tc.desc: Returns an array of key-value pairs of enumeratable properties of a given object.
     */
    it('testLruBufferEntries001', 0, function () {
        var that = new util.LruBuffer()
        that.put('string','abc')
        var i=0;
        var arr={};
        for (let entry of that.entries()) {
            arr[i]=entry[0];
            i++;
            arr[i]=entry[1];
            i++;
        }
        expect(arr[1]).assertEqual('abc');
    })

    /**
     * @tc.name: testLruBufferEntries002
     * @tc.desc: Returns an array of key-value pairs of enumeratable properties of a given object.
     */
    it('testLruBufferEntries002', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        var i=0;
        var arr={};
        for (let entry of that.entries()) {
            arr[i]=entry[0];
            i++;
            arr[i]=entry[1];
            i++;
        }
        expect(arr[1]).assertEqual(2);
    })

    /**
     * @tc.name: testLruBufferEntries003
     * @tc.desc: Returns an array of key-value pairs of enumeratable properties of a given object.
     */
    it('testLruBufferEntries003', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        var i=0;
        var arr={};
        for (let entry of that.entries()) {
            arr[i]=entry[0];
            i++;
            arr[i]=entry[1];
            i++;
        }
        expect(arr[0]).assertEqual(1);
    })

    /**
     * @tc.name: testLruBufferEntries004
     * @tc.desc: Returns an array of key-value pairs of enumeratable properties of a given object.
     */
    it('testLruBufferEntries004', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        that.contains(1)
        var i=0;
        var arr={};
        for (let entry of that.entries()) {
            arr[i]=entry[0];
            i++;
            arr[i]=entry[1];
            i++;
        }
        expect(arr[1]).assertEqual(15)
        expect(arr[3]).assertEqual(20)
    })

    /**
     * @tc.name: testLruBufferEntries005
     * @tc.desc: Returns an array of key-value pairs of enumeratable properties of a given object.
     */
    it('testLruBufferEntries005', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        that.remove(5)
        that.contains(3)
        that.get(1)
        that.contains('abc')
        var i=0;
        var arr={};
        for (let entry of that.entries()) {
            arr[i]=entry[0];
            i++;
            arr[i]=entry[1];
            i++;
        }
        expect(arr[1]).assertEqual(10)
        expect(arr[3]).assertEqual(2)
        expect(arr[5]).assertEqual(20)
    })

    /**
     * @tc.name: testLruBuffer[Symbol.iterator]001
     * @tc.desc: Returns a two - dimensional array in the form of key - value pairs.
     */
    it('testLruBuffer[Symbol.iterator]001', 0, function () {
        var that = new util.LruBuffer()
        that.put('string','abc')
        that.put('abc',20)
        var i=0;
        var arr={};
        for (let entry of that[Symbol.iterator]()) {
            arr[i]=entry[0];
            i++;
            arr[i]=entry[1];
            i++;
        }
        expect(arr[1]).assertEqual('abc');
    })

    /**
     * @tc.name: testLruBuffer[Symbol.iterator]002
     * @tc.desc: Returns a two - dimensional array in the form of key - value pairs.
     */
    it('testLruBuffer[Symbol.iterator]002', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        var i=0;
        var arr={};
        for (let entry of that[Symbol.iterator]()) {
            arr[i]=entry[0];
            i++;
            arr[i]=entry[1];
            i++;
        }
        expect(arr[1]).assertEqual(2);
    })

    /**
     * @tc.name: testLruBuffer[Symbol.iterator]003
     * @tc.desc: Returns a two - dimensional array in the form of key - value pairs.
     */
    it('testLruBuffer[Symbol.iterator]003', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        var i=0;
        var arr={};
        for (let entry of that[Symbol.iterator]()) {
            arr[i]=entry[0];
            i++;
            arr[i]=entry[1];
            i++;
        }
        expect(arr[0]).assertEqual(1);
    })

    /**
     * @tc.name: testLruBuffer[Symbol.iterator]004
     * @tc.desc: Returns a two - dimensional array in the form of key - value pairs.
     */
    it('testLruBuffer[Symbol.iterator]004', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        that.contains(1)
        var i=0;
        var arr={};
        for (let entry of that[Symbol.iterator]()) {
            arr[i]=entry[0];
            i++;
            arr[i]=entry[1];
            i++;
        }
        expect(arr[1]).assertEqual(15)
        expect(arr[3]).assertEqual(20)
    })

    /**
     * @tc.name: testLruBuffer[Symbol.iterator]005
     * @tc.desc: Returns a two - dimensional array in the form of key - value pairs.
     */
    it('testLruBuffer[Symbol.iterator]005', 0, function () {
        var that = new util.LruBuffer()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        that.remove(5)
        that.contains(3)
        that.get(1)
        that.contains('abc')
        var i=0;
        var arr={};
        for (let entry of that[Symbol.iterator]()) {
            arr[i]=entry[0];
            i++;
            arr[i]=entry[1];
            i++;
        }
        expect(arr[1]).assertEqual(10)
        expect(arr[3]).assertEqual(2)
        expect(arr[5]).assertEqual(20)
    })

    /**
     * @tc.name: testLruBufferAfterRemoval001
     * @tc.desc: Executes subsequent operations after a value is deleted.
     */
    it('testLruBufferAfterRemoval001', 0, function () {
        var arr = [];
        class ChildLruBuffer extends util.LruBuffer
        {
            constructor()
            {
                super();
            }
            static getInstance()
            {
                if(this.instance ==  null)
                {
                    this.instance = new ChildLruBuffer();
                }
                return this.instance;
            }
            afterRemoval(isEvict, key, value, newValue)
            {
                if (isEvict === false)
                {
                    arr = [key, value, newValue];
                }
            }
        }
        ChildLruBuffer.getInstance().afterRemoval(false,10,30,null)
        expect(arr[0]).assertEqual(10)
    })

    /**
     * @tc.name: testLruBufferAfterRemoval002
     * @tc.desc: Executes subsequent operations after a value is deleted.
     */
    it('testLruBufferAfterRemoval002', 0, function () {
        var arr = [];
        class ChildLruBuffer extends util.LruBuffer
        {
            constructor()
            {
                super();
            }
            static getInstance()
            {
                if(this.instance ==  null)
                {
                    this.instance = new ChildLruBuffer();
                }
                return this.instance;
            }
            afterRemoval(isEvict, key, value, newValue)
            {
                if (isEvict === false)
                {
                    arr = [key, value, newValue];
                }
            }
        }
        ChildLruBuffer.getInstance().afterRemoval(false,'string',10,null)
        expect(arr[0]).assertEqual('string')
    })

    /**
     * @tc.name: testLruBufferAfterRemoval003
     * @tc.desc: Executes subsequent operations after a value is deleted.
     */
    it('testLruBufferAfterRemoval003', 0, function () {
        var arr = [];
        class ChildLruBuffer extends util.LruBuffer
        {
            constructor()
            {
                super();
            }
            static getInstance()
            {
                if(this.instance ==  null)
                {
                    this.instance = new ChildLruBuffer();
                }
                return this.instance;
            }
            afterRemoval(isEvict, key, value, newValue)
            {
                if (isEvict === false)
                {
                    arr = [key, value, newValue];
                }
            }
        }
        ChildLruBuffer.getInstance().afterRemoval(false,10,30,12)
        expect(arr[2]).assertEqual(12)
    })

    /**
     * @tc.name: testLruBufferAfterRemoval004
     * @tc.desc: Executes subsequent operations after a value is deleted.
     */
    it('testLruBufferAfterRemoval004', 0, function () {
        var arr = [];
        class ChildLruBuffer extends util.LruBuffer
        {
            constructor()
            {
                super();
            }
            static getInstance()
            {
                if(this.instance ==  null)
                {
                    this.instance = new ChildLruBuffer();
                }
                return this.instance;
            }
            afterRemoval(isEvict, key, value, newValue)
            {
                if (isEvict === false)
                {
                    arr = [key, value, newValue];
                }
            }
        }
        ChildLruBuffer.getInstance().afterRemoval(false,'abc',30,'string')
        expect(arr[1]).assertEqual(30)
    })

    /**
     * @tc.name: testLruBufferAfterRemoval005
     * @tc.desc: Executes subsequent operations after a value is deleted.
     */
    it('testLruBufferAfterRemoval005', 0, function () {
        var arr = [];
        class ChildLruBuffer extends util.LruBuffer
        {
            constructor()
            {
                super();
            }
            static getInstance()
            {
                if(this.instance ==  null)
                {
                    this.instance = new ChildLruBuffer();
                }
                return this.instance;
            }
            afterRemoval(isEvict, key, value, newValue)
            {
                if (isEvict === true)
                {
                    arr = [key, value, newValue];
                }
            }
        }
        ChildLruBuffer.getInstance().afterRemoval(true,'abc','ab','string')
        expect(arr[2]).assertEqual('string')
    })

    /**
     * @tc.name: testLruBufferAfterRemoval006
     * @tc.desc: Executes subsequent operations after a value is deleted.
     */
    it('testLruBufferAfterRemoval006', 0, function () {
        var arr = [];
        class ChildLruBuffer extends util.LruBuffer
        {
            constructor(capacity)
            {
                super(capacity);
            }
            afterRemoval(isEvict, key, value, newValue)
            {
                if (isEvict === true)
                {
                    arr = [key, value];
                }
            }
        }
        var that = new ChildLruBuffer(2);
        that.put(1,2)
        that.put(3,10)
        that.put('abc',20)
        expect(arr[1]).assertEqual(20)
    })

    /**
     * @tc.name: testLruBufferAfterRemoval007
     * @tc.desc: Executes subsequent operations after a value is deleted.
     */
    it('testLruBufferAfterRemoval007', 0, function () {
        var arr = [];
        class ChildLruBuffer extends util.LruBuffer
        {
            constructor(capacity)
            {
                super(capacity);
            }
            afterRemoval(isEvict, key, value, newValue)
            {
                if (isEvict === false)
                {
                    arr = [key, value, newValue];
                }
            }
        }
        var that = new ChildLruBuffer(3);
        that.put(1,2)
        that.put(3,10)
        that.put(1,8)
        expect(arr[2]).assertEqual(8)
    })
})

describe('TypesTest', function() {

    /**
     * @tc.name: testIsAnyArrayBuffer001
     * @tc.desc: Check whether the entered value is of arraybuffer or sharedarraybuffer type.
     */
    it('testIsAnyArrayBuffer001', 0, function() {
        var proc = new util.types();
        var result = proc.isAnyArrayBuffer(new ArrayBuffer([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsAnyArrayBuffer002
     * @tc.desc: Check whether the entered value is of arraybuffer or sharedarraybuffer type.
     */
    it('testIsAnyArrayBuffer002', 0, function() {
        var proc = new util.types();
        var result = proc.isAnyArrayBuffer(true);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsAnyArrayBuffer003
     * @tc.desc: Check whether the entered value is of arraybuffer or sharedarraybuffer type.
     */
    it('testIsAnyArrayBuffer003', 0, function() {
        var proc = new util.types();
        var result = proc.isAnyArrayBuffer(false);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsAnyArrayBuffer004
     * @tc.desc: Check whether the entered value is of arraybuffer or sharedarraybuffer type.
     */
    it('testIsAnyArrayBuffer004', 0, function() {
        var proc = new util.types();
        var buf = new ArrayBuffer();
        var result = proc.isAnyArrayBuffer(buf);
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsAnyArrayBuffer005
     * @tc.desc: Check whether the entered value is of arraybuffer or sharedarraybuffer type.
     */
    it('testIsAnyArrayBuffer005', 0, function() {
        var proc = new util.types();
        var result = proc.isAnyArrayBuffer(new Boolean(false));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsArrayBufferView001
     * @tc.desc: Check whether the entered value is napi_ int8_ array or napi_ uint8_ array
       or naPi_ uint8_ clamped_ array or naPi_ int16_ array or naPi_ uint16_ array or napi_ int32_ array or napi_
       uint32_ array or napi_ float32_ array or napi_ float64_ array array or DataView type.
     */
    it('testIsArrayBufferView001', 0, function() {
        var proc = new util.types();
        var result = proc.isArrayBufferView(new Int8Array([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsArrayBufferView002
     * @tc.desc: Check whether the entered value is napi_ int8_ array or napi_ uint8_ array
       or naPi_ uint8_ clamped_ array or naPi_ int16_ array or naPi_ uint16_ array or napi_
       int32_ array or napi_ uint32_ array or napi_ float32_ array or napi_ float64_ array array or DataView type.
     */
    it('testIsArrayBufferView002', 0, function() {
        var proc = new util.types();
        var result = proc.isArrayBufferView(new Int32Array([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsArrayBufferView003
     * @tc.desc: Check whether the entered value is napi_ int8_ array or napi_ uint8_
       array or naPi_ uint8_ clamped_ array or naPi_ int16_ array or naPi_ uint16_ array or napi_ int32_ array or
       napi_ uint32_ array or napi_ float32_ array or napi_ float64_ array array or DataView type.
     */
    it('testIsArrayBufferView003', 0, function() {
        var proc = new util.types();
        var result = proc.isArrayBufferView(new DataView(new ArrayBuffer(16)));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsArrayBufferView004
     * @tc.desc: Check whether the entered value is napi_ int8_ array or napi_ uint8_ array or naPi_ uint8_
       clamped_ array or naPi_ int16_ array or naPi_ uint16_ array or napi_ int32_ array or napi_ uint32_ array or
       napi_ float32_ array or napi_ float64_ array array or DataView type.
     */
    it('testIsArrayBufferView004', 0, function() {
        var proc = new util.types();
        var result = proc.isArrayBufferView(false);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsArrayBufferView005
     * @tc.desc: Check whether the entered value is napi_ int8_ array or napi_ uint8_ array or naPi_ uint8_
       clamped_ array or naPi_ int16_ array or naPi_ uint16_ array or napi_ int32_ array or napi_ uint32_ array or
       napi_ float32_ array or napi_ float64_ array array or DataView type.
     */
    it('testIsArrayBufferView005', 0, function() {
        var proc = new util.types();
        var result = proc.isArrayBufferView(new Int16Array());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsArgumentsObject001
     * @tc.desc: Check whether the entered value is an arguments object type.
     */
    it('testIsArgumentsObject001', 0, function() {
        var proc = new util.types();
        function foo() {
            var result = proc.isArgumentsObject(arguments);
            expect(result).assertEqual(true);
        }
        var f = foo();
    })

    /**
     * @tc.name: testIsArgumentsObject002
     * @tc.desc: Check whether the entered value is an arguments object type.
     */
    it('testIsArgumentsObject002', 0, function() {
        var proc = new util.types();
        var result = proc.isArgumentsObject(new Int8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsArgumentsObject003
     * @tc.desc: Check whether the entered value is an arguments object type.
     */
    it('testIsArgumentsObject003', 0, function() {
        var proc = new util.types();
        var result = proc.isArgumentsObject(true);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsArgumentsObject004
     * @tc.desc: Check whether the entered value is an arguments object type.
     */
    it('testIsArgumentsObject004', 0, function() {
        var proc = new util.types();
        var result = proc.isArgumentsObject(false);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsArgumentsObject005
     * @tc.desc: Check whether the entered value is an arguments object type.
     */
    it('testIsArgumentsObject005', 0, function() {
        var proc = new util.types();
        var result = proc.isArgumentsObject(new Boolean());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsArrayBuffer001
     * @tc.desc: Check whether the entered value is of arraybuffer type.
     */
    it('testIsArrayBuffer001', 0, function() {
        var proc = new util.types();
        var result = proc.isArrayBuffer(new ArrayBuffer([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsArrayBuffer002
     * @tc.desc: Check whether the entered value is of arraybuffer type.
     */
    it('testIsArrayBuffer002', 0, function() {
        var proc = new util.types();
        var result = proc.isArrayBuffer(true);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsArrayBuffer003
     * @tc.desc: Check whether the entered value is of arraybuffer type.
     */
    it('testIsArrayBuffer003', 0, function() {
        var proc = new util.types();
        var result = proc.isArrayBuffer(false);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsArrayBuffer004
     * @tc.desc: Check whether the entered value is of arraybuffer type.
     */
    it('testIsArrayBuffer004', 0, function() {
        var proc = new util.types();
        var result = proc.isArrayBuffer(new Int8Array());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsArrayBuffer005
     * @tc.desc: Check whether the entered value is of arraybuffer type.
     */
    it('testIsArrayBuffer005', 0, function() {
        var proc = new util.types();
        var result = proc.isArrayBuffer(new Int16Array());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsAsyncFunction001
     * @tc.desc: Check whether the value entered is an asynchronous function type.
     */
    it('testIsAsyncFunction001', 0, function() {
        var proc = new util.types();
        var result = proc.isAsyncFunction(false);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsAsyncFunction002
     * @tc.desc: Check whether the value entered is an asynchronous function type.
     */
    it('testIsAsyncFunction002', 0, function() {
        var proc = new util.types();
        var result = proc.isAsyncFunction(function foo() {});
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsAsyncFunction003
     * @tc.desc: Check whether the value entered is an asynchronous function type.
     */
    it('testIsAsyncFunction003', 0, function() {
        var proc = new util.types();
        var result = proc.isAsyncFunction(new Int8Array());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsAsyncFunction004
     * @tc.desc: Check whether the value entered is an asynchronous function type.
     */
    it('testIsAsyncFunction004', 0, function() {
        var proc = new util.types();
        var result = proc.isAsyncFunction(true);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsBigInt64Array001
     * @tc.desc: Check whether the entered value is of bigint64array array type.
     */
    it('testIsBigInt64Array001', 0, function() {
        var proc = new util.types();
        var result = proc.isBigInt64Array(new BigInt64Array([]));
        expect(result).assertEqual(true);
    })
    
    /**
     * @tc.name: testIsBigInt64Array002
     * @tc.desc: Check whether the entered value is of bigint64array array type.
     */
     it('testIsBigInt64Array002', 0, function() {
        var proc = new util.types();
        var result = proc.isBigInt64Array(new Int32Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsBigInt64Array003
     * @tc.desc: Check whether the entered value is of bigint64array array type.
     */
     it('testIsBigInt64Array003', 0, function() {
        var proc = new util.types();
        var result = proc.isBigInt64Array(new Uint8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsBigInt64Array004
     * @tc.desc: Check whether the entered value is of bigint64array array type.
     */
     it('testIsBigInt64Array004', 0, function() {
        var proc = new util.types();
        var result = proc.isBigInt64Array(new Float64Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsBigInt64Array005
     * @tc.desc: Check whether the entered value is of bigint64array array type.
     */
     it('testIsBigInt64Array005', 0, function() {
        var proc = new util.types();
        var result = proc.isBigInt64Array(new Int8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsBigUint64Array001
     * @tc.desc: Check whether the entered value is of biguint64array array array type.
     */
    it('testIsBigUint64Array001', 0, function() {
        var proc = new util.types();
        var result = proc.isBigUint64Array(new BigUint64Array([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsBigUint64Array002
     * @tc.desc: Check whether the entered value is of biguint64array array array type.
     */
     it('testIsBigUint64Array002', 0, function() {
        var proc = new util.types();
        var result = proc.isBigUint64Array(new Int8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsBigUint64Array003
     * @tc.desc: Check whether the entered value is of biguint64array array array type.
     */
     it('testIsBigUint64Array003', 0, function() {
        var proc = new util.types();
        var result = proc.isBigUint64Array(new Float64Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsBigUint64Array004
     * @tc.desc: Check whether the entered value is of biguint64array array array type.
     */
     it('testIsBigUint64Array004', 0, function() {
        var proc = new util.types();
        var result = proc.isBigUint64Array(new Uint8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsBigUint64Array005
     * @tc.desc: Check whether the entered value is of biguint64array array array type.
     */
     it('testIsBigUint64Array005', 0, function() {
        var proc = new util.types();
        var result = proc.isBigUint64Array(new BigInt64Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsBigUint64Array006
     * @tc.desc: Check whether the entered value is of biguint64array array array type.
     */
     it('testIsBigUint64Array006', 0, function() {
        var proc = new util.types();
        var result = proc.isBigUint64Array(new Int8Array([]));
        expect(result).assertEqual(false);
    })


    /**
     * @tc.name: testIsBooleanObject001
     * @tc.desc: Check whether the entered value is a Boolean object type.
     */
    it('testIsBooleanObject001', 0, function() {
        var proc = new util.types();
        var result = proc.isBooleanObject(new Boolean(false));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsBooleanObject002
     * @tc.desc: Check whether the entered value is a Boolean object type.
     */
    it('testIsBooleanObject002', 0, function() {
        var proc = new util.types();
        var result = proc.isBooleanObject(new Boolean(true));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsBooleanObject003
     * @tc.desc: Check whether the entered value is a Boolean object type.
     */
    it('testIsBooleanObject003', 0, function() {
        var proc = new util.types();
        var result = proc.isBooleanObject(true);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsBooleanObject004
     * @tc.desc: Check whether the entered value is a Boolean object type.
     */
    it('testIsBooleanObject004', 0, function() {
        var proc = new util.types();
        var result = proc.isBooleanObject(false);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsBooleanObject005
     * @tc.desc: Check whether the entered value is a Boolean object type.
     */
    it('testIsBooleanObject005', 0, function() {
        var proc = new util.types();
        var result = proc.isBooleanObject(Boolean(true));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsBoxedPrimitive001
     * @tc.desc: Check whether the entered value is a Boolean or number or string or symbol object type.
     */
    it('testIsBoxedPrimitive001', 0, function() {
        var proc = new util.types();
        var result = proc.isBoxedPrimitive(false);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsBoxedPrimitive002
     * @tc.desc: Check whether the entered value is a Boolean or number or string or symbol object type.
     */
    it('testIsBoxedPrimitive002', 0, function() {
        var proc = new util.types();
        var result = proc.isBoxedPrimitive(new Boolean(false));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsBoxedPrimitive003
     * @tc.desc: Check whether the entered value is a Boolean or number or string or symbol object type.
     */
    it('testIsBoxedPrimitive003', 0, function() {
        var proc = new util.types();
        var result = proc.isBoxedPrimitive(Symbol('foo'));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsBoxedPrimitive004
     * @tc.desc: Check whether the entered value is a Boolean or number or string or symbol object type.
     */
    it('testIsBoxedPrimitive004', 0, function() {
        var proc = new util.types();
        var result = proc.isBoxedPrimitive(Object(Symbol('foo')));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsBoxedPrimitive005
     * @tc.desc: Check whether the entered value is a Boolean or number or string or symbol object type.
     */
    it('testIsBoxedPrimitive005', 0, function() {
        var proc = new util.types();
        var result = proc.isBoxedPrimitive(new Boolean(true));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsDataView001
     * @tc.desc: Check whether the entered value is of DataView type.
     */
    it('testIsDataView001', 0, function() {
        var proc = new util.types();
        const ab = new ArrayBuffer(20);
        var result = proc.isDataView(new DataView(ab));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsDataView002
     * @tc.desc: Check whether the entered value is of DataView type.
     */
    it('testIsDataView002', 0, function() {
        var proc = new util.types();
        var result = proc.isDataView(new Int8Array());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsDataView003
     * @tc.desc: Check whether the entered value is of DataView type.
     */
    it('testIsDataView003', 0, function() {
        var proc = new util.types();
        var result = proc.isDataView(new Float64Array());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsDataView004
     * @tc.desc: Check whether the entered value is of DataView type.
     */
    it('testIsDataView004', 0, function() {
        var proc = new util.types();
        var result = proc.isDataView(true);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsDataView005
     * @tc.desc: Check whether the entered value is of DataView type.
     */
    it('testIsDataView005', 0, function() {
        var proc = new util.types();
        var result = proc.isDataView(false);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsDate001
     * @tc.desc: Check whether the entered value is of type date.
     */
    it('testIsDate001', 0, function() {
        var proc = new util.types();
        var result = proc.isDate(new Date());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsDate002
     * @tc.desc: Check whether the entered value is of type date.
     */
    it('testIsDate002', 0, function() {
        var proc = new util.types();
        var result = proc.isDate(new Int8Array());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsDate003
     * @tc.desc: Check whether the entered value is of type date.
     */
    it('testIsDate003', 0, function() {
        var proc = new util.types();
        var result = proc.isDate(true);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsDate004
     * @tc.desc: Check whether the entered value is of type date.
     */
    it('testIsDate004', 0, function() {
        var proc = new util.types();
        var result = proc.isDate(new Int16Array());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsDate005
     * @tc.desc: Check whether the entered value is of type date.
     */
    it('testIsDate005', 0, function() {
        var proc = new util.types();
        var result = proc.isDate(new Float64Array());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsExternal001
     * @tc.desc: Check whether the entered value is a native external value type.
     */
    it('testIsExternal001', 0, function() {
        var proc = new util.types();
        var result = proc.isExternal(new Float32Array());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsExternal002
     * @tc.desc: Check whether the entered value is a native external value type.
     */
    it('testIsExternal002', 0, function() {
        var proc = new util.types();
        var result = proc.isExternal(new Int8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsExternal003
     * @tc.desc: Check whether the entered value is a native external value type.
     */
    it('testIsExternal003', 0, function() {
        var proc = new util.types();
        var result = proc.isExternal(true);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsExternal004
     * @tc.desc: Check whether the entered value is a native external value type.
     */
    it('testIsExternal004', 0, function() {
        var proc = new util.types();
        var result = proc.isExternal(false);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsExternal005
     * @tc.desc: Check whether the entered value is a native external value type.
     */
    it('testIsExternal005', 0, function() {
        var proc = new util.types();
        var result = proc.isExternal(new Int16Array());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsFloat32Array001
     * @tc.desc: Check whether the entered value is of float32array array type.
     */
    it('testIsFloat32Array001', 0, function() {
        var proc = new util.types();
        var result = proc.isFloat32Array(new Float32Array());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsFloat32Array002
     * @tc.desc: Check whether the entered value is of float32array array type.
     */
    it('testIsFloat32Array002', 0, function() {
        var proc = new util.types();
        var result = proc.isFloat32Array(new Int8Array());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsFloat32Array003
     * @tc.desc: Check whether the entered value is of float32array array type.
     */
    it('testIsFloat32Array003', 0, function() {
        var proc = new util.types();
        var result = proc.isFloat32Array(new Int16Array());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsFloat32Array004
     * @tc.desc: Check whether the entered value is of float32array array type.
     */
    it('testIsFloat32Array004', 0, function() {
        var proc = new util.types();
        var result = proc.isFloat32Array(new Float64Array());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsFloat32Array005
     * @tc.desc: Check whether the entered value is of float32array array type.
     */
    it('testIsFloat32Array005', 0, function() {
        var proc = new util.types();
        var result = proc.isFloat32Array(new Uint8Array());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsFloat64Array001
     * @tc.desc: Check whether the entered value is of float64array array type.
     */
    it('testIsFloat64Array001', 0, function() {
        var proc = new util.types();
        var result = proc.isFloat64Array(new Float64Array());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsFloat64Array002
     * @tc.desc: Check whether the entered value is of float64array array type.
     */
    it('testIsFloat64Array002', 0, function() {
        var proc = new util.types();
        var result = proc.isFloat64Array(new Int8Array());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsFloat64Array003
     * @tc.desc: Check whether the entered value is of float64array array type.
     */
    it('testIsFloat64Array003', 0, function() {
        var proc = new util.types();
        var result = proc.isFloat64Array(new Float32Array());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsFloat64Array004
     * @tc.desc: Check whether the entered value is of float64array array type.
     */
    it('testIsFloat64Array004', 0, function() {
        var proc = new util.types();
        var result = proc.isFloat64Array(new Uint8Array());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsFloat64Array005
     * @tc.desc: Check whether the entered value is of float64array array type.
     */
    it('testIsFloat64Array005', 0, function() {
        var proc = new util.types();
        var result = proc.isFloat64Array(new Int16Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsGeneratorFunction001
     * @tc.desc: Check whether the input value is a generator function type.
     */
    it('testIsGeneratorFunction001', 0, function() {
        var proc = new util.types();
        var result = proc.isGeneratorFunction(new Int8Array());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsGeneratorFunction002
     * @tc.desc: Check whether the input value is a generator function type.
     */
    it('testIsGeneratorFunction002', 0, function() {
        var proc = new util.types();
        var result = proc.isGeneratorFunction(function foo() {});
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsGeneratorFunction003
     * @tc.desc: Check whether the input value is a generator function type.
     */
    it('testIsGeneratorFunction003', 0, function() {
        var proc = new util.types();
        var result = proc.isGeneratorFunction(true);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsGeneratorFunction004
     * @tc.desc: Check whether the input value is a generator function type.
     */
    it('testIsGeneratorFunction004', 0, function() {
        var proc = new util.types();
        var result = proc.isGeneratorFunction(false);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsGeneratorObject001
     * @tc.desc: Check whether the entered value is a generator object type.
     */
    it('testIsGeneratorObject001', 0, function() {
        var proc = new util.types();
        var result = proc.isGeneratorObject(false);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsGeneratorObject002
     * @tc.desc: Check whether the entered value is a generator object type.
     */
    it('testIsGeneratorObject002', 0, function() {
        var proc = new util.types();
        var result = proc.isGeneratorObject(new Int8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsGeneratorObject003
     * @tc.desc: Check whether the entered value is a generator object type.
     */
    it('testIsGeneratorObject003', 0, function() {
        var proc = new util.types();
        var result = proc.isGeneratorObject(new Int16Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsGeneratorObject004
     * @tc.desc: Check whether the entered value is a generator object type.
     */
    it('testIsGeneratorObject004', 0, function() {
        var proc = new util.types();
        var result = proc.isGeneratorObject(true);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsInt8Array001
     * @tc.desc: Check whether the entered value is of int8array array type.
     */
    it('testIsInt8Array001', 0, function() {
        var proc = new util.types();
        var result = proc.isInt8Array(new Int8Array([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsInt8Array002
     * @tc.desc: Check whether the entered value is of int8array array type.
     */
    it('testIsInt8Array002', 0, function() {
        var proc = new util.types();
        var result = proc.isInt8Array(new ArrayBuffer([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsInt8Array003
     * @tc.desc: Check whether the entered value is of int8array array type.
     */
    it('testIsInt8Array003', 0, function() {
        var proc = new util.types();
        var result = proc.isInt8Array(new Int32Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsInt8Array004
     * @tc.desc: Check whether the entered value is of int8array array type.
     */
    it('testIsInt8Array004', 0, function() {
        var proc = new util.types();
        var result = proc.isInt8Array(new Float64Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsInt8Array005
     * @tc.desc: Check whether the entered value is of int8array array type.
     */
    it('testIsInt8Array005', 0, function() {
        var proc = new util.types();
        var result = proc.isInt8Array(new Uint8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsInt16Array001
     * @tc.desc: Check whether the entered value is the int16array type.
     */
    it('testIsInt16Array001', 0, function() {
        var proc = new util.types();
        var result = proc.isInt16Array(new Int16Array([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsInt16Array002
     * @tc.desc: Check whether the entered value is the int16array type.
     */
    it('testIsInt16Array002', 0, function() {
        var proc = new util.types();
        var result = proc.isInt16Array(new Int8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsInt16Array003
     * @tc.desc: Check whether the entered value is the int16array type.
     */
    it('testIsInt16Array003', 0, function() {
        var proc = new util.types();
        var result = proc.isInt16Array(new Int32Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsInt16Array004
     * @tc.desc: Check whether the entered value is the int16array type.
     */
    it('testIsInt16Array004', 0, function() {
        var proc = new util.types();
        var result = proc.isInt16Array(new Uint8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsInt16Array005
     * @tc.desc: Check whether the entered value is the int16array type.
     */
    it('testIsInt16Array005', 0, function() {
        var proc = new util.types();
        var result = proc.isInt16Array(new Float64Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsInt32Array001
     * @tc.desc: Check whether the entered value is the int32array type.
     */
    it('testIsInt32Array001', 0, function() {
        var proc = new util.types();
        var result = proc.isInt32Array(new Int32Array([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsInt32Array002
     * @tc.desc: Check whether the entered value is the int32array type.
     */
    it('testIsInt32Array002', 0, function() {
        var proc = new util.types();
        var result = proc.isInt32Array(new Int8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsInt32Array003
     * @tc.desc: Check whether the entered value is the int32array type.
     */
    it('testIsInt32Array003', 0, function() {
        var proc = new util.types();
        var result = proc.isInt32Array(new Int16Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsInt32Array004
     * @tc.desc: Check whether the entered value is the int32array type.
     */
    it('testIsInt32Array004', 0, function() {
        var proc = new util.types();
        var result = proc.isInt32Array(new Float64Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsInt32Array005
     * @tc.desc: Check whether the entered value is the int32array type.
     */
    it('testIsInt32Array005', 0, function() {
        var proc = new util.types();
        var result = proc.isInt32Array(new Uint8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsMap001
     * @tc.desc: Check whether the entered value is of map type.
     */
    it('testIsMap001', 0, function() {
        var proc = new util.types();
        var result = proc.isMap(new Map());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsMap002
     * @tc.desc: Check whether the entered value is of map type.
     */
    it('testIsMap002', 0, function() {
        var proc = new util.types();
        var result = proc.isMap(new Set());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsMap003
     * @tc.desc: Check whether the entered value is of map type.
     */
    it('testIsMap003', 0, function() {
        var proc = new util.types();
        var result = proc.isMap(new String());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsMap004
     * @tc.desc: Check whether the entered value is of map type.
     */
    it('testIsMap004', 0, function() {
        var proc = new util.types();
        var result = proc.isMap(new Object());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsMap005
     * @tc.desc: Check whether the entered value is of map type.
     */
    it('testIsMap005', 0, function() {
        var proc = new util.types();
        var result = proc.isMap(new Boolean());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsMapIterator001
     * @tc.desc: Check whether the entered value is the iterator type of map.
     */
    it('testIsMapIterator001', 0, function() {
        var proc = new util.types();
        const map = new Map();
        var result = proc.isMapIterator(map.keys());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsMapIterator002
     * @tc.desc: Check whether the entered value is the iterator type of map.
     */
    it('testIsMapIterator002', 0, function() {
        var proc = new util.types();
        const map = new Map();
        var result = proc.isMapIterator(map.values());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsMapIterator003
     * @tc.desc: Check whether the entered value is the iterator type of map.
     */
    it('testIsMapIterator003', 0, function() {
        var proc = new util.types();
        const map = new Map();
        var result = proc.isMapIterator(map.entries());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsMapIterator004
     * @tc.desc: Check whether the entered value is the iterator type of map.
     */
    it('testIsMapIterator004', 0, function() {
        var proc = new util.types();
        const map = new Map();
        var result = proc.isMapIterator(map[Symbol.iterator]());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsMapIterator005
     * @tc.desc: Check whether the entered value is the iterator type of map.
     */
    it('testIsMapIterator005', 0, function() {
        var proc = new util.types();
        const map = new Map();
        var result = proc.isMapIterator(map);
        expect(result).assertEqual(false);
    })


    /**
     * @tc.name: testIsModuleNamespaceObject002
     * @tc.desc: Check whether the entered value is the module namespace object object type.
     */
    it('testIsModuleNamespaceObject002', 0, function() {
        var proc = new util.types();
        var result = proc.isModuleNamespaceObject(url);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsModuleNamespaceObject003
     * @tc.desc: Check whether the entered value is the module namespace object object type.
     */
    it('testIsModuleNamespaceObject003', 0, function() {
        var proc = new util.types();
        var result = proc.isModuleNamespaceObject(file);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsModuleNamespaceObject004
     * @tc.desc: Check whether the entered value is the module namespace object object type.
     */
    it('testIsModuleNamespaceObject004', 0, function() {
        var proc = new util.types();
        var result = proc.isModuleNamespaceObject(process);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsModuleNamespaceObject005
     * @tc.desc: Check whether the entered value is the module namespace object object type.
     */
    it('testIsModuleNamespaceObject005', 0, function() {
        var proc = new util.types();
        var result = proc.isModuleNamespaceObject(app);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsNativeError001
     * @tc.desc: Check whether the value entered is of type error.
     */
    it('testIsNativeError001', 0, function() {
        var proc = new util.types();
        var result = proc.isNativeError(new TypeError());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsNativeError002
     * @tc.desc: Check whether the value entered is of type error.
     */
    it('testIsNativeError002', 0, function() {
        var proc = new util.types();
        var result = proc.isNativeError(new Error());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsNativeError003
     * @tc.desc: Check whether the value entered is of type error.
     */
    it('testIsNativeError003', 0, function() {
        var proc = new util.types();
        var result = proc.isNativeError(new RangeError());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsNativeError004
     * @tc.desc: Check whether the value entered is of type error.
     */
    it('testIsNativeError004', 0, function() {
        var proc = new util.types();
        var result = proc.isNativeError(true);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsNativeError005
     * @tc.desc: Check whether the value entered is of type error.
     */
    it('testIsNativeError005', 0, function() {
        var proc = new util.types();
        var result = proc.isNativeError(false);
        expect(result).assertEqual(false);
    })
})
}
