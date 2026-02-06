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
    _temp = 0;
}

class MyClassBase {
    baseBuffer = 'baseData';
    strBuffer = 'intBase';
    setMethod(arg) {
        return arg + 100;
    }
    setBase(arg) {
        this.baseBuffer = arg;
    }
    setData(arg) {
        return arg + 2;
    }
    setBuffer(arg) {
        this.strBuffer = arg;
    }
}
class MyClass extends MyClassBase {
    msg = 'msg123';
    static buffer = 'data';
    static str = 'strData';
    foo(arg1, arg2) {
        return this.msg;
    }
    static bar(arg1) {
        return MyClass.buffer;
    }
    func(arg) {
        return arg;
    }
    async myAsync(arg) {
        return arg;
    }
    myFunc(arg) {
        this.msg = arg;
    }
    static async printData(arg) {
        return 0;
    }
    myFoo() {
        return 0;
    }
    getData(arg) {
        return 0;
    }
    async beforeAsync(arg) {
        return arg;
    }
    static getBar(arg1) {
        return MyClass.str;
    }
    async myBeforeAsync(arg) {
        return arg;
    }
}
class AfterClass extends MyClassBase {
    msg = 'msg123';
    message = 'messageData';
    static buffer = 'data';
    static str = 'strData';
    afterFoo(arg1, arg2) {
        return this.message;
    }
    foo(arg1, arg2) {
        return this.msg;
    }
    static bar(arg1) {
        return AfterClass.buffer;
    }
    func(arg) {
        return arg;
    }
    async myAsync(arg) {
        return arg;
    }
    myFunc(arg) {
        this.msg = arg;
    }
    afterFunc(arg) {
        this.message = arg;
    }
    static async printData(arg) {
        return 0;
    }
    myFoo() {
        return 0;
    }
    getData(arg) {
        return 0;
    }
    async afterAsync(arg) {
        return arg;
    }
    static getBar(arg1) {
        return AfterClass.str;
    }
    async myAfterAsync(arg) {
        return arg;
    }
}
class ReplaceClass extends MyClassBase {
    msg = 'msg123';
    static buffer = 'data';
    static str = 'strData';
    foo(arg1, arg2) {
        return this.msg;
    }
    static bar(arg1) {
        return ReplaceClass.buffer;
    }
    func(arg) {
        return arg;
    }
    async myAsync(arg) {
        return arg;
    }
    myFunc(arg) {
        this.msg = arg;
    }
    static async printData(arg) {
        return 0;
    }
    myFoo() {
        return 0;
    }
    getData(arg) {
        return 0;
    }
    async replaceAsync(arg) {
        return arg;
    }
    static getBar(arg1) {
        return ReplaceClass.str;
    }
}

class DeviceManageViewModel {
  static ans = '';
  constructor(heldValue) {
    util.AutoFinalizerCleaner.register(this, heldValue);
  }

  onFinalization(heldValue) {
    DeviceManageViewModel.ans = heldValue;
  }
}

let tempLower = new Temperature(30);
let tempUpper = new Temperature(40);
let tempLess = new Temperature(20);
let tempMiDF = new Temperature(35);
let tempMidS = new Temperature(39);
let tempMore = new Temperature(45);

let range = new util.Scope(tempLower, tempUpper);
let rangeFir = new util.Scope(tempMiDF, tempMidS);
let rangeSec = new util.Scope(tempLess, tempMore);
let rangeThi = new util.Scope(tempLess, tempMiDF);
let rangeFif = new util.Scope(tempMiDF, tempMore);

function promiseCase() {
  let p = new Promise(function (resolve, reject) {
    setTimeout(function () {
      resolve(0)
    }, 5)
  }).then(undefined, (error) => {
  })
  return p
}

export default function UtilFunTest() {
describe('TextEncoderTest', function () {

    /**
     * @tc.name   testUtilPrintf001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0001
     * @tc.desc   Returns the formatted string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPrintf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let format = "%i,%s";
      let value1 = 1.5;
      let value2 = "qwer";
      let value3 = 15;
      let result = util.printf(format, value1, value2, value3);
      expect(result).assertEqual("1,qwer 15");
    })

    /**
     * @tc.name   testUtilPrintf002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0002
     * @tc.desc   Returns the formatted string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPrintf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let format = "%O";
      let value = { name: 'jack' ,age: 15 };
      let result = util.printf(format, value);
      expect(result).assertEqual("{ name: 'jack',\n  age: 15 }");
    })

    /**
     * @tc.name   testUtilPrintf003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0003
     * @tc.desc   Returns the formatted string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPrintf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let format = "%o";
      let value = [1, 2, 3];
      let result = util.printf(format, value);
      let res = '[ 1, 2, 3, [length]: 3 ]'
      expect(result).assertEqual('[ 1, 2, 3, [length]: 3 ]');
    })

    /**
     * @tc.name   testUtilPrintf004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0004
     * @tc.desc   Returns the formatted string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPrintf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let format = "%s,%s,%s";
      let value1 = "1.5";
      let value2 = "qwer";
      let result = util.printf(format, value1, value2);
      expect(result).assertEqual('1.5,qwer,%s');
    })

    /**
     * @tc.name   testUtilPrintf005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0005
     * @tc.desc   Returns the formatted string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPrintf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let format = "%d,%d";
      let value1 = 6;
      let value2 = 16;
      let result = util.printf(format, value1, value2);
      expect(result).assertEqual('6,16');
    })

    /**
     * @tc.name   testUtilGetErrorString001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0006
     * @tc.desc   Get the string name of the system errno.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilGetErrorString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let errnum = 10;
      let result = util.getErrorString(errnum);
      expect(result).assertEqual('Unknown system error 10');
    })

    /**
     * @tc.name   testUtilGetErrorString002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0007
     * @tc.desc   Get the string name of the system errno.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilGetErrorString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let errnum = 0;
      let result = util.getErrorString(errnum);
      expect(result).assertEqual('Unknown system error 0');
    })

    /**
     * @tc.name   testUtilGetErrorString003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0008
     * @tc.desc   Get the string name of the system errno.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilGetErrorString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let errnum = -1;
      let result = util.getErrorString(errnum);
      expect(result).assertEqual('operation not permitted');
    })

    /**
     * @tc.name   testUtilGetErrorString004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0009
     * @tc.desc   Get the string name of the system errno.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilGetErrorString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let errnum = 9;
      let result = util.getErrorString(errnum);
      expect(result).assertEqual('Unknown system error 9');
    })

    /**
     * @tc.name   testUtilGetErrorString005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0010
     * @tc.desc   Get the string name of the system errno.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilGetErrorString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let errnum = 555;
      let result = util.getErrorString(errnum);
      expect(result).assertEqual('Unknown system error 555');
    })

    /**
     * @tc.name   testUtilPromisify_new_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0011
     * @tc.desc   Takes a function following the common error-first callback style,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPromisify_new_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      function fn(val, callback) {
        if (typeof val === 'string') {
          callback(null, val);
        } else {
          callback('type err');
        }
      }
      let value = util.promisify(fn);
      let res = ""
      res = await value("Hello");
      expect(String(res)).assertEqual("Hello");
    })

    /**
     * @tc.name   testUtilPromisify_new_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0012
     * @tc.desc   Takes a function following the common error-first callback style,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPromisify_new_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      function fn(str, callback) {
        if (typeof str === 'string') {
          callback(null, str);
        } else {
          callback('type err');
        }
      }
      let value = util.promisify(fn);
      let res;
      let flag = false;
      value([1, 2]).then((d) => {
        flag = true;
        res = d;
      }).catch((e) => {
        flag = true;
        res = e;
      })
      while (!flag) {
        await promiseCase()
      }
      expect(res).assertEqual('type err');
    })

    /**
     * @tc.name   testUtilPromisify_new_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0013
     * @tc.desc   Takes a function following the common error-first callback style,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPromisify_new_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      function fn(val, callback) {
        callback(null, val);
      }
      const value = util.promisify(fn);
      let res = 0;
      res = await value(42);
      expect(Number(res)).assertEqual(42);
    })

    /**
     * @tc.name   testUtilPromisify_new_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0014
     * @tc.desc   Takes a function following the common error-first callback style,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPromisify_new_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      function fn(val, callback) {
        if (typeof val === 'boolean') {
          callback(null, val);
        } else {
          callback('type err');
        }
      }
      const value = util.promisify(fn);
      expect(Boolean(await value(true))).assertEqual(true);
    })

    /**
     * @tc.name   testUtilPromisify_new_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0015
     * @tc.desc   Takes a function following the common error-first callback style,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPromisify_new_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      function fn(val, callback) {
        if (typeof val === 'number') {
          callback(null, val);
        } else {
          callback('type err');
        }
      }
      const value = util.promisify(fn);
      expect(Number(await value(100))).assertEqual(100);
    })

    /**
     * @tc.name   testUtilPromiseWrapper001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0016
     * @tc.desc   Takes a function following the common error-first callback style,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPromiseWrapper001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      function aysnFun(str1, str2, callback) {
        if (typeof str1 === 'string' && typeof str1 === 'string') {
          callback(null, str1 + str2);
        } else {
          callback('type err');
        }
      }
      let newPromiseObj = util.promiseWrapper(aysnFun);
      let res = await newPromiseObj("Hello", 'World');
      expect(String(res)).assertEqual('HelloWorld');
    })

    /**
     * @tc.name   testUtilPromiseWrapper002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0017
     * @tc.desc   Takes a function following the common error-first callback style,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPromiseWrapper002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      function aysnFun(str1, str2, callback) {
        if (typeof str1 === 'string' && typeof str1 === 'string') {
          callback(null, str1 + str2);
        } else {
          callback('type err');
        }
      }
      let newPromiseObj = util.promiseWrapper(aysnFun);
      let res = "";
      let flag = false;
      newPromiseObj([1, 2], 'World').catch((err) => {
        flag = true;
        res = err;
      })
      while(!flag) {
        await promiseCase()
      }
      expect(String(res)).assertEqual('type err');
    })

    /**
     * @tc.name   testUtilPromiseWrapper003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0018
     * @tc.desc   Takes a function following the common error-first callback style,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPromiseWrapper003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      const thrower = util.promiseWrapper(function(a, b, c, cb) {
        throw new Error("123");
      });
      let res = "";
      let flag = false;
      thrower(1, 2, 3).catch((err) => {
        res = err;
        flag = true;
      })
      while(!flag) {
        await promiseCase()
      }
      expect(String(res)).assertEqual("Error: 123");
    })

    /**
     * @tc.name   testUtilPromiseWrapper004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0019
     * @tc.desc   Takes a function following the common error-first callback style,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPromiseWrapper004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      const err = new Error("123");
      const a = util.promiseWrapper((cb) => cb(err))();
      const b = util.promiseWrapper(() => {throw err;})();
      let res = "";
      let flag = 0;
      Promise.all([
        a.catch((e) => {
          res += e.message;
          flag += 1;
        }),
        b.catch((e) => {
          res += e.message;
          flag += 1;
        })
      ]);
      while(flag != 2) {
        await promiseCase()
      }
      expect(res).assertEqual("123123")
    })

    /**
     * @tc.name   testUtilPromiseWrapper005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0020
     * @tc.desc   Takes a function following the common error-first callback style,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPromiseWrapper005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      const err = new Error('callback with the error.');
      const stack = err.stack;
      const fn = util.promiseWrapper(function(cb) {
        cb(null, "success");
        cb(err);
      });
      let res = await fn();
      expect(String(res)).assertEqual("success");
    })

    /**
     * @tc.name   testUtilPromiseWrapper006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0021
     * @tc.desc   Takes a function following the common error-first callback style,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPromiseWrapper006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      function fn(err, val, callback) {
        callback(err, val);
      }
      const value = await util.promiseWrapper(fn)(null, 42);
      expect(Number(value)).assertEqual(42);
    })

    /**
     * @tc.name   testUtilCallbackWrapper001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0022
     * @tc.desc   Takes an async function (or a function that returns a Promise) and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilCallbackWrapper001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      const promiseFn = [1, 2];
      try {
        util.callbackWrapper(promiseFn);
      } catch(e) {
        expect(e.toString()).assertEqual('BusinessError: Parameter error. The type of 1,2 must be function');
      }
    })

    /**
     * @tc.name   testUtilCallbackWrapper002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0023
     * @tc.desc   Takes an async function (or a function that returns a Promise) and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilCallbackWrapper002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      async function promiseFn() {
        return Promise.resolve('value');
      }
      let cb = util.callbackWrapper(promiseFn);
      let resErr = ""
      let resRet = ""
      let flag = false
      cb((err, ret) => {
        resErr = err;
        resRet = ret;
        flag = true;
      })
      while(!flag) {
        await promiseCase()
      }
      expect(resErr).assertEqual(null);
      expect(resRet).assertEqual('value');
    })

    /**
     * @tc.name   testUtilCallbackWrapper003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0024
     * @tc.desc   Takes an async function (or a function that returns a Promise) and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilCallbackWrapper003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      async function promiseFn() {
        return 42;
      }
      let cb = util.callbackWrapper(promiseFn);
      let resErr = ""
      let resRet = ""
      let flag = false
      cb((err, ret) => {
        resErr = err;
        resRet = ret;
        flag = true;
      })
      while(!flag) {
        await promiseCase()
      }
      expect(resErr).assertEqual(null);
      expect(resRet).assertEqual(42);
    })

    /**
     * @tc.name   testUtilCallbackWrapper004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0025
     * @tc.desc   Takes an async function (or a function that returns a Promise) and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilCallbackWrapper004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      async function promiseFn() {
        let err = Error('value');
        return Promise.reject(err);
      }
      let cb = util.callbackWrapper(promiseFn);
      let resErr;
      let resRet = "";
      let flag = false
      cb((err, ret) => {
        resErr = err;
        resRet = ret;
        flag = true;
      })
      while(!flag) {
        await promiseCase()
      }
      expect(resErr.message).assertEqual('value');
      expect(resRet).assertEqual(undefined);
    })

    /**
     * @tc.name   testUtilCallbackWrapper005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0026
     * @tc.desc   Takes an async function (or a function that returns a Promise) and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilCallbackWrapper005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      async function promiseFn(a, b) {
        return a + b;
      }
      let cb = util.callbackWrapper(promiseFn);
      let resErr;
      let resRet = "";
      let flag = false
      cb(1, 2, (err, ret) => {
        resErr = err;
        resRet = ret;
        flag = true;
      })
      while(!flag) {
        await promiseCase()
      }
      expect(resErr).assertEqual(null);
      expect(resRet).assertEqual(3);
    })

    /**
     * @tc.name   testUtilCallbackWrapper006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0027
     * @tc.desc   Takes an async function (or a function that returns a Promise) and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilCallbackWrapper006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      async function promiseFn() {
        return null;
      }
      let cb = util.callbackWrapper(promiseFn);
      try {
        cb([1, 2]);
      } catch (err) {
        expect(err.message).assertEqual('maybe is not function');
      }
    })

    /**
     * @tc.name   testencoding_textdecoder_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0028
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textdecoder_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let  that = new util.TextDecoder('utf-8', { ignoreBOM : true })
      let retStr = that.encoding
      expect(retStr).assertEqual('utf-8')
    })

    /**
     * @tc.name   testencoding_textdecoder_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0029
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textdecoder_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('utf-16le')
      let encodingStr = that.encoding
      expect(encodingStr).assertEqual('utf-16le')
    })

    /**
     * @tc.name   testencoding_textdecoder_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0030
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textdecoder_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('utf-16be')
      let encodingStr = that.encoding
      expect(encodingStr).assertEqual('utf-16be')
    })

    /**
     * @tc.name   testencoding_textdecoder_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0031
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textdecoder_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('utf-16be', { ignoreBOM : true })
      let encodingStr = that.encoding
      expect(encodingStr).assertEqual('utf-16be')
    })

    /**
     * @tc.name   testencoding_textdecoder_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0032
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textdecoder_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('utf-16be', { ignoreBOM : false })
      let encodingStr = that.encoding
      expect(encodingStr).assertEqual('utf-16be')
    })

    /**
     * @tc.name   testencoding_textdecoder_006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0033
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textdecoder_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder(undefined);
      let encodingStr = that.encoding;
      expect(encodingStr).assertEqual('utf-8');
    })

    /**
     * @tc.name   testencoding_textdecoder_007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0034
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textdecoder_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('utf-8', undefined);
      let encodingStr = that.encoding;
      expect(encodingStr).assertEqual('utf-8');
    })

    /**
     * @tc.name   testencoding_textdecoder_008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0035
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textdecoder_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder(undefined, {ignoreBOM: true});
      let encodingStr = that.encoding;
      expect(encodingStr).assertEqual('utf-8');
    })

    /**
     * @tc.name   testencoding_textdecoder_009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0036
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textdecoder_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder(null);
      let encodingStr = that.encoding;
      expect(encodingStr).assertEqual('utf-8');
    })

    /**
     * @tc.name   testencoding_textdecoder_010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0037
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textdecoder_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('utf-8', null);
      let encodingStr = that.encoding;
      expect(encodingStr).assertEqual('utf-8');
    })

    /**
     * @tc.name   testencoding_textdecoder_011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0038
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textdecoder_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder(null, {ignoreBOM: true});
      let encodingStr = that.encoding;
      expect(encodingStr).assertEqual('utf-8');
    })

    /**
     * @tc.name   testFatal001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0039
     * @tc.desc   Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('utf-16be', { fatal : true })
      let fatalStr = that.fatal
      expect(fatalStr).assertEqual(true)
    })

    /**
     * @tc.name   testFatal002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0040
     * @tc.desc   Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('utf-16be', { fatal : false })
      let fatalStr = that.fatal
      expect(fatalStr).assertEqual(false)
    })

    /**
     * @tc.name   testFatal003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0041
     * @tc.desc   Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('utf-16be')
      let fatalStr = that.fatal
      expect(fatalStr).assertEqual(false)
    })

    /**
     * @tc.name   testFatal004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0042
     * @tc.desc   Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('utf-8')
      let fatalStr = that.fatal
      expect(fatalStr).assertEqual(false)
    })

    /**
     * @tc.name   testFatal005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0043
     * @tc.desc   Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatal005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('utf-16le')
      let fatalStr = that.fatal
      expect(fatalStr).assertEqual(false)
    })

    /**
     * @tc.name   testFatal006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0044
     * @tc.desc   Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatal006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('gbk')
      let fatalStr = that.fatal
      expect(fatalStr).assertEqual(false)
    })

    /**
     * @tc.name   testFatal007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0045
     * @tc.desc   Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatal007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('gb18030')
      let fatalStr = that.fatal
      expect(fatalStr).assertEqual(false)
    })

    /**
     * @tc.name   testFatal008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0046
     * @tc.desc   Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatal008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('gb2312')
      let fatalStr = that.fatal
      expect(fatalStr).assertEqual(false)
    })

    /**
     * @tc.name   testIgnoreBOM001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0047
     * @tc.desc   Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIgnoreBOM001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('utf-16be', { ignoreBOM : true })
      let ignoreBOMStr = that.ignoreBOM
      expect(ignoreBOMStr).assertEqual(true)
    })

    /**
     * @tc.name   testIgnoreBOM002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0048
     * @tc.desc   Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIgnoreBOM002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('utf-16be', { ignoreBOM : false })
      let ignoreBOMStr = that.ignoreBOM
      expect(ignoreBOMStr).assertEqual(false)
    })

    /**
     * @tc.name   testIgnoreBOM003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0049
     * @tc.desc   Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIgnoreBOM003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('utf-16be')
      let ignoreBOMStr = that.ignoreBOM
      expect(ignoreBOMStr).assertEqual(false)
    })

    /**
     * @tc.name   testIgnoreBOM004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0050
     * @tc.desc   Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIgnoreBOM004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('utf-8')
      let ignoreBOMStr = that.ignoreBOM
      expect(ignoreBOMStr).assertEqual(false)
    })

    /**
     * @tc.name   testIgnoreBOM005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0051
     * @tc.desc   Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIgnoreBOM005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('utf-16le')
      let ignoreBOMStr = that.ignoreBOM
      expect(ignoreBOMStr).assertEqual(false)
    })

    /**
     * @tc.name   testIgnoreBOM006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0052
     * @tc.desc   Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIgnoreBOM006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('gbk')
      let ignoreBOMStr = that.ignoreBOM
      expect(ignoreBOMStr).assertEqual(false)
    })

    /**
     * @tc.name   testIgnoreBOM007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0053
     * @tc.desc   Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIgnoreBOM007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('gb18030')
      let ignoreBOMStr = that.ignoreBOM
      expect(ignoreBOMStr).assertEqual(false)
    })

    /**
     * @tc.name   testIgnoreBOM008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0054
     * @tc.desc   Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIgnoreBOM008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('gb2312')
      let ignoreBOMStr = that.ignoreBOM
      expect(ignoreBOMStr).assertEqual(false)
    })

    /**
     * @tc.name   testdecode_testdecode_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0055
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testdecode_testdecode_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('utf-8');
      let arr = new Uint8Array(3);
      for (let i = 0; i < 3; i++) {
        arr[i] = 0x61 + i;
      }
      let retStr = that.decode(arr);
      let rel = 'abc';
      expect(retStr).assertEqual(rel);
    })

    /**
     * @tc.name   testdecode_testdecode_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0056
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testdecode_testdecode_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('utf-16le')
      let arr = new Uint8Array(6)
      arr[0] = 0x61;
      arr[1] = 0x00;
      arr[2] = 0x62;
      arr[3] = 0x00;
      arr[4] = 0x63;
      arr[5] = 0x00;
      let retStr = that.decode(arr)
      let rel = 'abc'
      expect(retStr).assertEqual(rel)
    })

    /**
     * @tc.name   testdecode_testdecode_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0057
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testdecode_testdecode_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('utf-16be');
      let arr = new Uint8Array(6);
      arr[0] = 0x00;
      arr[1] = 0x61;
      arr[2] = 0x00;
      arr[3] = 0x62;
      arr[4] = 0x00;
      arr[5] = 0x63;
      let retStr = that.decode(arr);
      let rel = 'abc'
      expect(retStr).assertEqual(rel);
    })

    /**
     * @tc.name   testdecode_testdecode_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0058
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testdecode_testdecode_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new  util.TextDecoder('utf-8', { ignoreBOM : true })
      let arr = new Uint8Array(6)
      arr[0] = 0xEF;
      arr[1] = 0xBB;
      arr[2] = 0xBF;
      arr[3] = 0x61;
      arr[4] = 0x62;
      arr[5] = 0x63;
      let retStr = that.decode(arr, {stream:false})
      let BOM = '\uFEFF'
      let rel = 'abc'
      let re = BOM + rel
      expect(retStr).assertEqual(re);
    })

    /**
     * @tc.name   testdecode_testdecode_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0059
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testdecode_testdecode_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('utf-16le', { ignoreBOM : false })
      let arr = new Uint8Array(8)
      arr[0] = 0xFF;
      arr[1] = 0xFE;
      arr[2] = 0x61;
      arr[3] = 0x00;
      arr[4] = 0x62;
      arr[5] = 0x00
      arr[6] = 0x63;
      arr[7] = 0x00;
      let retStr = that.decode(arr, { stream : false })
      let BOM = '\uFEFF'
      let rel = 'abc'
      let re = BOM + rel
      expect(retStr).assertEqual(re)
    })

    /**
     * @tc.name   testdecode_testdecode_006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0060
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testdecode_testdecode_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('gbk')
      let arr = new Uint8Array(8)
      arr[0] = 0xC4;
      arr[1] = 0xE3;
      arr[2] = 0xBA;
      arr[3] = 0xC3;
      arr[4] = 0xCA;
      arr[5] = 0xC0;
      arr[6] = 0xBD;
      arr[7] = 0xE7;
      let retStr = that.decode(arr)
      let rel = '你好世界'
      expect(retStr).assertEqual(rel)
    })

    /**
     * @tc.name   testdecode_testdecode_007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0061
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testdecode_testdecode_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('gb18030')
      let arr = new Uint8Array(8)
      arr[0] = 0xC4;
      arr[1] = 0xE3;
      arr[2] = 0xBA;
      arr[3] = 0xC3;
      arr[4] = 0xCA;
      arr[5] = 0xC0;
      arr[6] = 0xBD;
      arr[7] = 0xE7;
      let retStr = that.decode(arr)
      let rel = '你好世界'
      expect(retStr).assertEqual(rel)
    })

    /**
     * @tc.name   testdecode_testdecode_008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0062
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testdecode_testdecode_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('gb2312')
      let arr = new Uint8Array(8)
      arr[0] = 0xC4;
      arr[1] = 0xE3;
      arr[2] = 0xBA;
      arr[3] = 0xC3;
      arr[4] = 0xCA;
      arr[5] = 0xC0;
      arr[6] = 0xBD;
      arr[7] = 0xE7;
      let retStr = that.decode(arr)
      let rel = '你好世界'
      expect(retStr).assertEqual(rel)
    })

    /**
     * @tc.name   testdecode_testdecode_009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0063
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testdecode_testdecode_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new  util.TextDecoder('utf-8', { ignoreBOM : true })
      let arr = new Uint8Array(6)
      arr[0] = 0xEF;
      arr[1] = 0xBB;
      arr[2] = 0xBF;
      arr[3] = 0x61;
      arr[4] = 0x62;
      arr[5] = 0x63;
      let retStr = that.decode(arr, undefined)
      let BOM = '\uFEFF'
      let rel = 'abc'
      let res = BOM + rel
      expect(retStr).assertEqual(res);
    })

    /**
     * @tc.name   testdecode_testdecode_010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0064
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testdecode_testdecode_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new  util.TextDecoder('utf-8', { ignoreBOM : true });
      let arr = new Uint8Array(6);
      arr[0] = 0xEF;
      arr[1] = 0xBB;
      arr[2] = 0xBF;
      arr[3] = 0x61;
      arr[4] = 0x62;
      arr[5] = 0x63;
      let retStr = that.decode(arr, null);
      let BOM = '\uFEFF'
      let rel = 'abc'
      let res = BOM + rel
      expect(retStr).assertEqual(res);
    })

    /**
     * @tc.name   decodeWithStream001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0065
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('decodeWithStream001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('utf-16le', { ignoreBOM : false });
      let arr = new Uint8Array(8)
      arr[0] = 0xFF;
      arr[1] = 0xFE;
      arr[2] = 0x61;
      arr[3] = 0x00;
      arr[4] = 0x62;
      arr[5] = 0x00;
      arr[6] = 0x63;
      arr[7] = 0x00;
      let retStr = that.decodeWithStream(arr, { stream : false });
      let BOM = '\uFEFF';
      let rel = 'abc';
      let re = BOM + rel;
      expect(retStr).assertEqual(re)
    })

    /**
     * @tc.name   decodeWithStream002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0066
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('decodeWithStream002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new  util.TextDecoder('utf-8', { ignoreBOM : true })
      let arr = new Uint8Array(6)
      arr[0] = 0xEF;
      arr[1] = 0xBB;
      arr[2] = 0xBF;
      arr[3] = 0x61;
      arr[4] = 0x62;
      arr[5] = 0x63;
      let retStr = that.decodeWithStream(arr, {stream:true})
      let BOM = '\uFEFF'
      let rel = 'abc'
      let re = BOM + rel;
      expect(retStr).assertEqual(re)
    })

    /**
     * @tc.name   decodeWithStream003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0067
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('decodeWithStream003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('utf-16be');
      let arr = new Uint8Array(6);
      arr[0] = 0x00;
      arr[1] = 0x61;
      arr[2] = 0x00;
      arr[3] = 0x62;
      arr[4] = 0x00;
      arr[5] = 0x63;
      let retStr = that.decodeWithStream(arr);
      let rel = 'abc'
      expect(retStr).assertEqual(rel)
    })

    /**
     * @tc.name   decodeWithStream004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0068
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('decodeWithStream004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('utf-16le')
      let arr = new Uint8Array(6)
      arr[0] = 0x61;
      arr[1] = 0x00;
      arr[2] = 0x62;
      arr[3] = 0x00;
      arr[4] = 0x63;
      arr[5] = 0x00;
      let retStr = that.decodeWithStream(arr);
      let rel = 'abc'
      expect(retStr).assertEqual(rel)
    })

    /**
     * @tc.name   decodeWithStream005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0069
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('decodeWithStream005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('utf-8');
      let arr = new Uint8Array(3);
      for (let i = 0; i < 3; i++) {
        arr[i] = 0x61 + i;
      }
      let retStr = that.decodeWithStream(arr);
      let rel = 'abc';
      expect(retStr).assertEqual(rel)
    })

    /**
     * @tc.name   decodeWithStream006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0070
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('decodeWithStream006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('utf-16le')
      let arr = new Uint8Array(6)
      arr[0] = 0x61;
      arr[1] = 0x00;
      arr[2] = 0x62;
      arr[3] = 0x00;
      arr[4] = 0x63;
      arr[5] = 0x00;
      let retStr = that.decodeWithStream(arr, undefined);
      let rel = 'abc'
      expect(retStr).assertEqual(rel);
    })

    /**
     * @tc.name   decodeWithStream007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0071
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('decodeWithStream007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextDecoder('utf-16le')
      let arr = new Uint8Array(6)
      arr[0] = 0x61;
      arr[1] = 0x00;
      arr[2] = 0x62;
      arr[3] = 0x00;
      arr[4] = 0x63;
      arr[5] = 0x00;
      let retStr = that.decodeWithStream(arr, null);
      let rel = 'abc'
      expect(retStr).assertEqual(rel);
    })

    /**
     * @tc.name   testencoding_textencoder_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0072
     * @tc.desc   Encoding format.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textencoder_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextEncoder()
      let str = that.encoding
      expect(str).assertEqual('utf-8')
    })

    /**
     * @tc.name   testencoding_textencoder_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0073
     * @tc.desc   Encoding format test gb18030.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textencoder_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextEncoder('gb18030')
      let str = that.encoding
      expect(str).assertEqual('gb18030')
      that = new util.TextEncoder('GB18030')
      str = that.encoding;
      expect(str).assertEqual('GB18030')
    })

    /**
     * @tc.name   testencoding_textencoder_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0074
     * @tc.desc   Encoding format test gbk.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textencoder_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextEncoder('gbk')
      let str = that.encoding
      expect(str).assertEqual('gbk')
      that = new util.TextEncoder('GBK')
      str = that.encoding;
      expect(str).assertEqual('GBK')
    })

    /**
     * @tc.name   testencoding_textencoder_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0075
     * @tc.desc   Encoding format test gb2313.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textencoder_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextEncoder('gb2312')
      let str = that.encoding
      expect(str).assertEqual('gb2312')
      that = new util.TextEncoder('GB2312')
      str = that.encoding;
      expect(str).assertEqual('GB2312')
    })

    /**
     * @tc.name   testencoding_textencoder_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0076
     * @tc.desc   The TextEncoder construction parameter is undefined or null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textencoder_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let encode1 = new util.TextEncoder(undefined)
      let str1 = encode1.encoding
      expect(str1).assertEqual('utf-8')
      let encode2 = new util.TextEncoder(null)
      let str2 = encode2.encoding
      expect(str2).assertEqual('utf-8')
    })

    /**
     * @tc.name   testEncode001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0077
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(20)
      let result = new Uint8Array(buffer)
      result = that.encode('abc')
      expect(result[0]).assertEqual(0x61)
    })

    /**
     * @tc.name   testEncode002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0078
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(20)
      let result = new Uint8Array(buffer)
      result = that.encode('\uD800楼楼')
      expect(result[5]).assertEqual(188)
    })

    /**
     * @tc.name   testEncode003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0079
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(20)
      let result = new Uint8Array(buffer)
      result = that.encode('a\uD800楼楼')
      expect(result[0]).assertEqual(0x61)
    })

    /**
     * @tc.name   testEncode004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0080
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(20)
      let result = new Uint8Array(buffer)
      result = that.encode('abc\uD800楼楼')
      expect(result[1]).assertEqual(0x62)
    })

    /**
     * @tc.name   testEncode005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0081
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(20)
      let result = new Uint8Array(buffer)
      result = that.encode('123\uD800楼楼')
      expect(result[0]).assertEqual(49)
      expect(result[9]).assertEqual(230)
    })

    /**
     * @tc.name   testEncode006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0082
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(20)
      let result = new Uint8Array(buffer)
      result = that.encode('123¥\uD800楼')
      expect(result[10]).assertEqual(0xbc)
    })

    /**
     * @tc.name   testEncode007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0083
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(20)
      let result = new Uint8Array(buffer)
      result = that.encode('¥¥')
      expect(result[0]).assertEqual(0xc2)
    })

    /**
     * @tc.name   testEncode008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0084
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(20)
      let result = new Uint8Array(buffer)
      result = that.encode('$$')
      expect(result[0]).assertEqual(0x24)
    })

    /**
     * @tc.name   testEncode009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0085
     * @tc.desc   Returns the result of encoder for gb18030.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
     * @tc.name   testEncode0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0086
     * @tc.desc   Returns the result of encoder for GB18030.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
     * @tc.name   testEncode0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0087
     * @tc.desc   Returns the result of encoder for GB18030.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
     * @tc.name   testEncode012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0088
     * @tc.desc   Returns the result of encoder for gbk.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
     * @tc.name   testEncode013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0089
     * @tc.desc   Returns the result of encoder for gb2312.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
     * @tc.name   testEncode014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0090
     * @tc.desc   Returns the result of encoder for gb2312.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
     * @tc.name   testEncode015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0091
     * @tc.desc   Returns the result of encoder for gb2312, input long string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
     * @tc.name   testEncode016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0092
     * @tc.desc   The encode parameter is undefined or null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextEncoder()
      let result1 = that.encode(undefined)
      expect(result1).assertEqual(undefined)
      let result2 = that.encode(null)
      expect(result2).assertEqual(undefined)
    })

    /**
     * @tc.name   testEncodeInto001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0093
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(20)
      let dest = new Uint8Array(buffer, 0, 13)
      let result = that.encodeInto('\uD800A\uDF06A楼HiA', dest)
      expect(result.read).assertEqual(7)
      expect(result.written).assertEqual(13)
    })

    /**
     * @tc.name   testEncodeInto002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0094
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(6)
      let dest = new Uint8Array(buffer)
      let result = that.encodeInto('abc\u2603d', dest)
      expect(result.read).assertEqual(4)
      expect(result.written).assertEqual(6)
    })

    /**
     * @tc.name   testEncodeInto003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0095
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(4)
      let dest = new Uint8Array(buffer)
      let result = that.encodeInto('abcd', dest)
      expect(result.read).assertEqual(4)
      expect(result.written).assertEqual(4)
    })

    /**
     * @tc.name   testEncodeInto004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0096
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(4)
      let dest = new Uint8Array(buffer)
      let result = that.encodeInto('12345', dest)
      expect(result.read).assertEqual(4)
      expect(result.written).assertEqual(4)
    })

    /**
     * @tc.name   testEncodeInto005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0097
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(4)
      let dest = new Uint8Array(buffer)
      let result = that.encodeInto('123 4*!@#', dest)
      expect(result.read).assertEqual(4)
      expect(result.written).assertEqual(4)
    })

    /**
     * @tc.name   testEncodeInto006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0098
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(4)
      let dest = new Uint8Array(buffer)
      let result = that.encodeInto('', dest)
      expect(result.read).assertEqual(0)
      expect(result.written).assertEqual(0)
    })

    /**
     * @tc.name   testEncodeInto007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0099
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(20)
      let dest = new Uint8Array(buffer)
      let result = that.encodeInto('12ab', dest)
      expect(result.read).assertEqual(4)
      expect(result.written).assertEqual(4)
    })

    /**
     * @tc.name   testEncodeInto008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0100
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(20)
      let dest = new Uint8Array(buffer, 0, 0)
      let result = that.encodeInto('\uD800A\uDF06A楼HiA', dest)
      expect(result.read).assertEqual(0)
      expect(result.written).assertEqual(0)
    })

    /**
     * @tc.name   testEncodeInto009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0101
     * @tc.desc   The encodeInto parameter is undefined or null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextEncoder()
      let result1 = that.encodeInto(undefined)
      expect(result1).assertEqual(undefined)
      let result2 = that.encodeInto(null)
      expect(result2).assertEqual(undefined)
    })

    /**
     * @tc.name   testTextDecoderCreate_Options_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0102
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextDecoderCreate_Options_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let textDecoderOptions = util.TextDecoderOptions = {
        fatal: false,
        ignoreBOM : true
      }
      let  that = util.TextDecoder.create('utf-8', textDecoderOptions)
      let retStr = that.encoding
      expect(retStr).assertEqual('utf-8')
    })

    /**
     * @tc.name   testTextDecoderCreate_Options_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0103
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextDecoderCreate_Options_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let textDecoderOptions = util.TextDecoderOptions = {
        fatal: false,
        ignoreBOM : false
      }
      let that = util.TextDecoder.create('utf-16be', textDecoderOptions)
      let encodingStr = that.encoding
      expect(encodingStr).assertEqual('utf-16be')
    })

    /**
     * @tc.name   testTextDecoderCreate_Options_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0104
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextDecoderCreate_Options_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let textDecoderOptions = util.TextDecoderOptions = {
        fatal: false,
        ignoreBOM : false
      }
      let that = util.TextDecoder.create(undefined, textDecoderOptions)
      let encodingStr = that.encoding
      expect(encodingStr).assertEqual('utf-8')
    })

    /**
     * @tc.name   testTextDecoderCreate_Options_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0105
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextDecoderCreate_Options_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let textDecoderOptions = util.TextDecoderOptions = {
        fatal: false,
        ignoreBOM : true
      }
      let that = util.TextDecoder.create(undefined, textDecoderOptions);
      let encodingStr = that.encoding;
      expect(encodingStr).assertEqual('utf-8');
    })

    /**
     * @tc.name   decodeWithStream_Options_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0106
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('decodeWithStream_Options_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let textDecoderOptions = util.TextDecoderOptions = {
        fatal: false,
        ignoreBOM : false
      }
      let decodeWithStreamOptions = util.DecodeWithStreamOptions = {
        stream: false
      }
      let that = util.TextDecoder.create('utf-16le', textDecoderOptions);
      let arr = new Uint8Array(8)
      arr[0] = 0xFF;
      arr[1] = 0xFE;
      arr[2] = 0x61;
      arr[3] = 0x00;
      arr[4] = 0x62;
      arr[5] = 0x00;
      arr[6] = 0x63;
      arr[7] = 0x00;
      let retStr = that.decodeWithStream(arr, decodeWithStreamOptions);
      let BOM = '\uFEFF';
      let rel = 'abc';
      let re = BOM + rel;
      expect(retStr).assertEqual(re)
    })

    /**
     * @tc.name   decodeWithStream_Options_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0107
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('decodeWithStream_Options_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let textDecoderOptions =  util.TextDecoderOptions = {
        fatal: false,
        ignoreBOM : true
      }
      let decodeWithStreamOptions = util.DecodeWithStreamOptions = {
        stream: true
      }
      let that = util.TextDecoder.create('utf-8', textDecoderOptions);
      let arr = new Uint8Array(6)
      arr[0] = 0xEF;
      arr[1] = 0xBB;
      arr[2] = 0xBF;
      arr[3] = 0x61;
      arr[4] = 0x62;
      arr[5] = 0x63;
      let retStr = that.decodeWithStream(arr, decodeWithStreamOptions)
      let BOM = '\uFEFF'
      let rel = 'abc'
      let re = BOM + rel;
      expect(retStr).assertEqual(re)
    })

    /**
     * @tc.name   testencodeIntoUint8Array_Info_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0108
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencodeIntoUint8Array_Info_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let encodeIntoUint8ArrayInfo = util.EncodeIntoUint8ArrayInfo
      encodeIntoUint8ArrayInfo = {
        read: 0,
        written: 0
      }
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(6)
      let dest = new Uint8Array(buffer)
      encodeIntoUint8ArrayInfo = that.encodeIntoUint8Array('abc\u2603d', dest)
      expect(encodeIntoUint8ArrayInfo.read).assertEqual(4)
      expect(encodeIntoUint8ArrayInfo.written).assertEqual(6)
    })

    /**
     * @tc.name   testencodeIntoUint8Array_Info_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0109
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencodeIntoUint8Array_Info_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let encodeIntoUint8ArrayInfo = util.EncodeIntoUint8ArrayInfo = {
        read: 0,
        written: 0
      }
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(4)
      let dest = new Uint8Array(buffer)
      encodeIntoUint8ArrayInfo = that.encodeIntoUint8Array('', dest)
      expect(encodeIntoUint8ArrayInfo.read).assertEqual(0)
      expect(encodeIntoUint8ArrayInfo.written).assertEqual(0)
    })

    /**
     * @tc.name   testencodeIntoUint8Array_Info_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0109
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencodeIntoUint8Array_Info_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(4)
      let dest = new Uint8Array(buffer)
      let encodeIntoUint8ArrayInfo = that.encodeIntoUint8Array('abcd', dest)
      expect(encodeIntoUint8ArrayInfo.read).assertEqual(4)
      expect(encodeIntoUint8ArrayInfo.written).assertEqual(4)
      expect(dest[1]).assertEqual(98)
    })

    /**
     * @tc.name   testencodeIntoUint8Array_Info_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0109
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencodeIntoUint8Array_Info_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(3)
      let dest = new Uint8Array(buffer)
      let encodeIntoUint8ArrayInfo = that.encodeIntoUint8Array('*', dest)
      expect(encodeIntoUint8ArrayInfo.read).assertEqual(1)
      expect(encodeIntoUint8ArrayInfo.written).assertEqual(1)
      expect(dest[0]).assertEqual(42)
    })

    /**
     * @tc.name   testencodeIntoUint8Array_Info_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0109
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array_Info_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(10)
      let dest = new Uint8Array(buffer)
      let encodeIntoUint8ArrayInfo = that.encodeIntoUint8Array('@1h-+=&^', dest)
      expect(encodeIntoUint8ArrayInfo.read).assertEqual(8)
      expect(encodeIntoUint8ArrayInfo.written).assertEqual(8)
      expect(dest[1]).assertEqual(49)
      expect(dest[6]).assertEqual(38)
    })

    /**
     * @tc.name   testencodeIntoUint8Array_Info_006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0109
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array_Info_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.TextEncoder('utf-16le')
      let buffer = new ArrayBuffer(10)
      let dest = new Uint8Array(buffer)
      that.encodeIntoUint8Array('abcdefg', dest)
      expect(dest[0]).assertEqual(97)
      expect(dest[2]).assertEqual(98)
    })

    /**
     * @tc.name   testencodeIntoUint8Array_Info_007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0109
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array_Info_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.TextEncoder('utf-16be')
      let buffer = new ArrayBuffer(10)
      let dest = new Uint8Array(buffer)
      that.encodeIntoUint8Array('abcdefg', dest)
      expect(dest[1]).assertEqual(97)
      expect(dest[3]).assertEqual(98)
    })

    /**
     * @tc.name   testencodeIntoUint8Array_Info_008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0109
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array_Info_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(4)
      let dest = new Uint8Array(buffer)
      let encodeIntoUint8ArrayInfo = that.encodeIntoUint8Array('😃', dest)
      expect(encodeIntoUint8ArrayInfo.read).assertEqual(2)
      expect(encodeIntoUint8ArrayInfo.written).assertEqual(4)
      expect(dest[0]).assertEqual(240)
      expect(dest[3]).assertEqual(131)
    })

    /**
     * @tc.name   testencodeIntoUint8Array_Info_009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0109
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array_Info_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(10)
      let dest = new Uint8Array(buffer)
      let encodeIntoUint8ArrayInfo = that.encodeIntoUint8Array('aé中😃', dest)
      expect(encodeIntoUint8ArrayInfo.read).assertEqual(5)
      expect(encodeIntoUint8ArrayInfo.written).assertEqual(10)
      expect(dest[0]).assertEqual(97)
      expect(dest[3]).assertEqual(228)
    })

    /**
     * @tc.name   testencodeIntoUint8Array_Info_0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0109
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array_Info_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(7)
      let dest = new Uint8Array(buffer)
      let encodeIntoUint8ArrayInfo = that.encodeIntoUint8Array('😃🤞', dest)
      expect(encodeIntoUint8ArrayInfo.read).assertEqual(2)
      expect(encodeIntoUint8ArrayInfo.written).assertEqual(4)
      expect(dest[1]).assertEqual(159)
      expect(dest[3]).assertEqual(131)
    })

    /**
     * @tc.name   testencodeIntoUint8Array_Info_0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0109
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array_Info_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(10)
      let dest = new Uint8Array(buffer)
      let encodeIntoUint8ArrayInfo = that.encodeIntoUint8Array('😃🤞', dest)
      expect(encodeIntoUint8ArrayInfo.read).assertEqual(4)
      expect(encodeIntoUint8ArrayInfo.written).assertEqual(8)
      expect(dest[1]).assertEqual(159)
      expect(dest[3]).assertEqual(131)
    })

    /**
     * @tc.name   testencodeIntoUint8Array_Info_0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0109
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array_Info_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.TextEncoder()
      let buffer = new ArrayBuffer(15)
      let dest = new Uint8Array(buffer)
      let encodeIntoUint8ArrayInfo = that.encodeIntoUint8Array('a😃🤞b', dest)
      expect(encodeIntoUint8ArrayInfo.read).assertEqual(6)
      expect(encodeIntoUint8ArrayInfo.written).assertEqual(10)
      expect(dest[0]).assertEqual(97)
      expect(dest[3]).assertEqual(152)
    })
  })

  describe('ScopeTest', function () {

    /**
     * @tc.name   test_getLower_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0001
     * @tc.desc   Obtains the lower bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getLower_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.getLower()
      expect(result.toString()).assertEqual('30')
    })

    /**
     * @tc.name   test_getLower_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0002
     * @tc.desc   Obtains the lower bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getLower_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = rangeFir.getLower()
      expect(result.toString()).assertEqual('35')
    })

    /**
     * @tc.name   test_getLower_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0003
     * @tc.desc   Obtains the lower bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getLower_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = rangeSec.getLower()
      expect(result.toString()).assertEqual('20')
    })

    /**
     * @tc.name   test_getLower_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0004
     * @tc.desc   Obtains the lower bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getLower_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = rangeThi.getLower()
      expect(result.toString()).assertEqual('20')
    })

    /**
     * @tc.name   test_getLower_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0005
     * @tc.desc   Obtains the lower bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getLower_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = rangeFif.getLower()
      expect(result.toString()).assertEqual('35')
    })

    /**
     * @tc.name   test_getUpper_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0006
     * @tc.desc   Obtains the upper bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getUpper_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.getUpper()
      expect(result.toString()).assertEqual('40')
    })

    /**
     * @tc.name   test_getUpper_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0007
     * @tc.desc   Obtains the upper bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getUpper_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = rangeFir.getUpper()
      expect(result.toString()).assertEqual('39')
    })

    /**
     * @tc.name   test_getUpper_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0008
     * @tc.desc   Obtains the upper bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getUpper_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = rangeSec.getUpper()
      expect(result.toString()).assertEqual('45')
    })

    /**
     * @tc.name   test_getUpper_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0009
     * @tc.desc   Obtains the upper bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getUpper_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = rangeThi.getUpper()
      expect(result.toString()).assertEqual('35')
    })

    /**
     * @tc.name   test_getUpper_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0010
     * @tc.desc   Obtains the upper bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getUpper_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = rangeFif.getUpper()
      expect(result.toString()).assertEqual('45')
    })

    /**
     * @tc.name   test_clamp_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0011
     * @tc.desc   Clamps a given value to the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_clamp_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result =range.clamp(tempLess)
      expect(result.toString()).assertEqual('30')
    })

    /**
     * @tc.name   test_clamp_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0012
     * @tc.desc   Clamps a given value to the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_clamp_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result =range.clamp(tempMiDF)
      expect(result.toString()).assertEqual('35')
    })

    /**
     * @tc.name   test_clamp_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0013
     * @tc.desc   Clamps a given value to the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_clamp_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result =range.clamp(tempMore)
      expect(result.toString()).assertEqual('40')
    })

    /**
     * @tc.name   test_clamp_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0014
     * @tc.desc   Clamps a given value to the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_clamp_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result =range.clamp(tempLower)
      expect(result.toString()).assertEqual('30')
    })

    /**
     * @tc.name   test_clamp_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0015
     * @tc.desc   Clamps a given value to the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_clamp_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result =range.clamp(tempUpper)
      expect(result.toString()).assertEqual('40')
    })

    /**
     * @tc.name   test_contains_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0016
     * @tc.desc   Checks whether a given value is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.contains(tempLess)
      expect(result).assertEqual(false)
    })

    /**
     * @tc.name   test_contains_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0017
     * @tc.desc   Checks whether a given value is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.contains(tempMiDF)
      expect(result).assertEqual(true)
    })

    /**
     * @tc.name   test_contains_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0018
     * @tc.desc   Checks whether a given value is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.contains(tempMore)
      expect(result).assertEqual(false)
    })

    /**
     * @tc.name   test_contains_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0019
     * @tc.desc   Checks whether a given value is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.contains(tempLower)
      expect(result).assertEqual(true)
    })

    /**
     * @tc.name   test_contains_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0020
     * @tc.desc   Checks whether a given value is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.contains(tempUpper)
      expect(result).assertEqual(true)
    })

    /**
     * @tc.name   test_contains_006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0021
     * @tc.desc   Checks whether a given range is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.contains(rangeFir)
      expect(result).assertEqual(true)
    })

    /**
     * @tc.name   test_contains_007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0022
     * @tc.desc   Checks whether a given range is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.contains(rangeSec)
      expect(result).assertEqual(false)
    })

    /**
     * @tc.name   test_contains_008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0023
     * @tc.desc   Checks whether a given range is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.contains(rangeThi)
      expect(result).assertEqual(false)
    })

    /**
     * @tc.name   test_contains_009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0024
     * @tc.desc   Checks whether a given range is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.contains(rangeFif)
      expect(result).assertEqual(false)
    })

    /**
     * @tc.name   test_contains_010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0025
     * @tc.desc   Checks whether a given range is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.contains(range)
      expect(result).assertEqual(true)
    })

    /**
     * @tc.name   test_expand_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0026
     * @tc.desc   Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.expand(tempMiDF, tempMidS)
      expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name   test_expand_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0027
     * @tc.desc   Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.expand(tempLess, tempMore)
      expect(result.toString()).assertEqual('[20, 45]')
    })

    /**
     * @tc.name   test_expand_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0028
     * @tc.desc   Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.expand(tempLess, tempMiDF)
      expect(result.toString()).assertEqual('[20, 40]')
    })

    /**
     * @tc.name   test_expand_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0029
     * @tc.desc   Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.expand(tempMiDF, tempMore)
      expect(result.toString()).assertEqual('[30, 45]')
    })

    /**
     * @tc.name   test_expand_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0030
     * @tc.desc   Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.expand(tempLower, tempUpper)
      expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name   test_expand_006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0031
     * @tc.desc   Creates the smallest range that includes the current range and a given range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.expand(rangeFir)
      expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name   test_expand_007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0032
     * @tc.desc   Creates the smallest range that includes the current range and a given range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.expand(rangeSec)
      expect(result.toString()).assertEqual('[20, 45]')
    })

    /**
     * @tc.name   test_expand_008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0033
     * @tc.desc   Creates the smallest range that includes the current range and a given range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.expand(rangeThi)
      expect(result.toString()).assertEqual('[20, 40]')
    })

    /**
     * @tc.name   test_expand_009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0034
     * @tc.desc   Creates the smallest range that includes the current range and a given range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.expand(rangeFif)
      expect(result.toString()).assertEqual('[30, 45]')
    })

    /**
     * @tc.name   test_expand_010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0035
     * @tc.desc   Creates the smallest range that includes the current range and a given range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.expand(range)
      expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name   test_expand_011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0036
     * @tc.desc   Creates the smallest range that includes the current range and a given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.expand(tempMiDF)
      expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name   test_expand_012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0037
     * @tc.desc   Creates the smallest range that includes the current range and a given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.expand(tempLess)
      expect(result.toString()).assertEqual('[20, 40]')
    })

    /**
     * @tc.name   test_expand_013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0038
     * @tc.desc   Creates the smallest range that includes the current range and a given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.expand(tempMore)
      expect(result.toString()).assertEqual('[30, 45]')
    })

    /**
     * @tc.name   test_expand_014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0039
     * @tc.desc   Creates the smallest range that includes the current range and a given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.expand(tempLower)
      expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name   test_expand_015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0040
     * @tc.desc   Creates the smallest range that includes the current range and a given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.expand(tempUpper)
      expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name   test_intersect_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0041
     * @tc.desc   Returns the intersection of a given range and the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.intersect(rangeFir)
      expect(result.toString()).assertEqual('[35, 39]')
    })

    /**
     * @tc.name   test_intersect_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0042
     * @tc.desc   Returns the intersection of a given range and the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.intersect(rangeSec)
      expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name   test_intersect_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0043
     * @tc.desc   Returns the intersection of a given range and the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.intersect(rangeThi)
      expect(result.toString()).assertEqual('[30, 35]')
    })

    /**
     * @tc.name   test_intersect_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0044
     * @tc.desc   Returns the intersection of a given range and the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.intersect(rangeFif)
      expect(result.toString()).assertEqual('[35, 40]')
    })

    /**
     * @tc.name   test_intersect_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0045
     * @tc.desc   Returns the intersection of a given range and the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.intersect(range)
      expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name   test_intersect_006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0046
     * @tc.desc   Returns the intersection of the current range and the range specified by
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.intersect(tempMiDF, tempMidS)
      expect(result.toString()).assertEqual('[35, 39]')
    })

    /**
     * @tc.name   test_intersect_007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0047
     * @tc.desc   Returns the intersection of the current range and the range specified by
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.intersect(tempLess, tempMore)
      expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name   test_intersect_008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0048
     * @tc.desc   Returns the intersection of the current range and the range specified by
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.intersect(tempLess, tempMiDF)
      expect(result.toString()).assertEqual('[30, 35]')
    })

    /**
     * @tc.name   test_intersect_009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0049
     * @tc.desc   Returns the intersection of the current range and the range specified by
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.intersect(tempMiDF, tempMore)
      expect(result.toString()).assertEqual('[35, 40]')
    })

    /**
     * @tc.name   test_intersect_010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0050
     * @tc.desc   Returns the intersection of the current range and the range specified by
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.intersect(tempLower, tempUpper)
      expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name   test_toString_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0051
     * @tc.desc   Obtains a string representation of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_toString_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = range.toString()
      expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name   test_toString_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0052
     * @tc.desc   Obtains a string representation of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_toString_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = rangeFir.toString()
      expect(result.toString()).assertEqual('[35, 39]')
    })

    /**
     * @tc.name   test_toString_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0053
     * @tc.desc   Obtains a string representation of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_toString_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = rangeSec.toString()
      expect(result.toString()).assertEqual('[20, 45]')
    })

    /**
     * @tc.name   test_toString_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0054
     * @tc.desc   Obtains a string representation of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_toString_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = rangeThi.toString()
      expect(result.toString()).assertEqual('[20, 35]')
    })

    /**
     * @tc.name   test_toString_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_0055
     * @tc.desc   Obtains a string representation of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_toString_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = rangeFif.toString()
      expect(result.toString()).assertEqual('[35, 45]')
    })
  })

  describe('Base64Test', function () {
    /**
     * @tc.name   test_encodeSync_base64_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0001
     * @tc.desc   Encodes all bytes from the specified u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeSync_base64_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.Base64()
      let array = new Uint8Array([115,49,51]);
      let rarray = new Uint8Array([99,122,69,122]);
      let result = that.encodeSync(array);
      for (let i = 0; i < 4; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.name   test_encodeSync_base64_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0002
     * @tc.desc   Encodes all bytes from the specified u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeSync_base64_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.Base64()
      let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
      let rarray = new Uint8Array([81,109,70,122,90,84,89,48,73,69,53,118,90,71,85,117,97,110,77,61]);
      let result = that.encodeSync(array);
      for (let i = 0; i < 20; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.name   test_encodeSync_base64_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0003
     * @tc.desc   Encodes all bytes from the specified u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeSync_base64_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.Base64()
      let array = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,105,
        110,32,78,111,100,101,46,106,115]);
      let rarray = new Uint8Array([81,109,70,122,90,84,89,48,73,69,86,117,89,50,57,107,97,87,53,110,
        73,71,108,117,73,69,53,118,90,71,85,117,97,110,77,61]);
      let result = that.encodeSync(array);
      for (let i = 0; i < 36; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.name   test_encodeSync_base64_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0004
     * @tc.desc   Encodes all bytes from the specified u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeSync_base64_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.Base64()
      let array = new Uint8Array([168, 174, 155, 255]);
      let rarray = new Uint8Array([113,75,54,98,47,119,61,61]);
      let result = that.encodeSync(array);
      for (let i = 0; i < 8; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.name   test_encodeSync_base64_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0005
     * @tc.desc   Encodes all bytes from the specified u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeSync_base64_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.Base64()
      let array = new Uint8Array([66, 97, 115, 101, 54, 52]);
      let rarray = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48]);
      let result = that.encodeSync(array);
      for (let i = 0; i <8; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.name   test_encodeToStringSync_base64_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0006
     * @tc.desc   Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToStringSync_base64_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.Base64()
      let array = new Uint8Array([115,49,51]);
      let result = that.encodeToStringSync(array)
      expect(result).assertEqual('czEz')
    })

    /**
     * @tc.name   test_encodeToStringSync_base64_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0007
     * @tc.desc   Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToStringSync_base64_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.Base64()
      let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
      let result = that.encodeToStringSync(array);
      expect(result).assertEqual('QmFzZTY0IE5vZGUuanM=')
    })

    /**
     * @tc.name   test_encodeToStringSync_base64_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0008
     * @tc.desc   Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToStringSync_base64_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.Base64()
      let array = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,105,110,
        32,78,111,100,101,46,106,115]);
      let result = that.encodeToStringSync(array);
      expect(result).assertEqual('QmFzZTY0IEVuY29kaW5nIGluIE5vZGUuanM=')
    })

    /**
     * @tc.name   test_encodeToStringSync_base64_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0009
     * @tc.desc   Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToStringSync_base64_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.Base64()
      let array = new Uint8Array([168, 174, 155, 255]);
      let result = that.encodeToStringSync(array);
      expect(result).assertEqual('qK6b/w==')
    })

    /**
     * @tc.name   test_encodeToStringSync_base64_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0010
     * @tc.desc   Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToStringSync_base64_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.Base64()
      let array = new Uint8Array([66, 97, 115, 101, 54, 52]);
      let result = that.encodeToStringSync(array);
      expect(result).assertEqual('QmFzZTY0')
    })

    /**
     * @tc.name   test_decodeSync_base64_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0011
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.Base64()
      let buff = 'czEz';
      let rarray = new Uint8Array([115,49,51]);
      let result = that.decodeSync(buff);
      for (let i = 0; i < 3; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.name   test_decodeSync_base64_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0012
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.Base64()
      let buff = 'QmFzZTY0IE5vZGUuanM=';
      let rarray = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
      let result = that.decodeSync(buff);
      for (let i = 0; i < 14; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.name   test_decodeSync_base64_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0013
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.Base64()
      let buff = 'QmFzZTY0IEVuY29kaW5nIGluIE5vZGUuanM=';
      let rarray = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,
        105,110,32,78,111,100,101,46,106,115]);
      let result = that.decodeSync(buff);
      for (let i = 0; i < 26; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.name   test_decodeSync_base64_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0014
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.Base64()
      let buff = 'qK6b/w==';
      let rarray = new Uint8Array([168, 174, 155, 255]);
      let result = that.decodeSync(buff);
      for (let i = 0; i < 4; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.name   test_decodeSync_base64_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0015
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.Base64()
      let buff = 'QmFzZTY0';
      let rarray = new Uint8Array([66, 97, 115, 101, 54, 52]);
      let result = that.decodeSync(buff);
      for (let i = 0; i <6; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.name   test_decodeSync_base64_006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0016
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.Base64()
      let array = new Uint8Array([99,122,69,122]);
      let rarray = new Uint8Array([115,49,51]);
      let result = that.decodeSync(array);
      for (let i = 0; i < 3; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.name   test_decodeSync_base64_007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0017
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.Base64()
      let array = new Uint8Array([81,109,70,122,90,84,89,48,73,69,53,118,90,71,85,117,97,110,77,61]);
      let rarray = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
      let result = that.decodeSync(array);
      for (let i = 0; i < 14; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.name   test_decodeSync_base64_008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0018
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.Base64()
      let array = new Uint8Array([81,109,70,122,90,84,89,48,73,69,86,117,89,50,57,107,97,87,
        53,110,73,71,108,117,73,69,53,118,90,71,85,117,97,110,77,61]);
      let rarray = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,105,
        110,32,78,111,100,101,46,106,115]);
      let result = that.decodeSync(array);
      for (let i = 0; i < 26; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.name   test_decodeSync_base64_009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0019
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.Base64()
      let array = new Uint8Array([113,75,54,98,47,119,61,61]);
      let rarray = new Uint8Array([168, 174, 155, 255]);
      let result = that.decodeSync(array);
      for (let i = 0; i < 4; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    /**
     * @tc.name   test_decodeSync_base64_010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0020
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.Base64()
      let array = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48]);
      let rarray = new Uint8Array([66, 97, 115, 101, 54, 52]);
      let result = that.decodeSync(array);
      for (let i = 0; i <6; i++) {
        expect(result[i]).assertEqual(rarray[i]);
      }
    })

    //base64 EncodeAsync test
    /**
     * @tc.name   test_encodeAsync_base64_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0021
     * @tc.desc   Asynchronously encodes all bytes in the specified u8 array into the newly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeAsync_base64_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
      let that = await new util.Base64();
      let array = new Uint8Array([115,49,51]);
      let rarray = new Uint8Array([99,122,69,122]);
      that.encode(array).then(val=>{
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i])
        }
      })
    })

    /**
     * @tc.name   test_encodeAsync_base64_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0022
     * @tc.desc   Asynchronously encodes all bytes in the specified u8 array into the newly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeAsync_base64_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
      let rarray = new Uint8Array([81,109,70,122,90,84,89,48,73,69,53,118,90,71,85,117,97,110,77,61]);
      that.encode(array).then(val=>{
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i])
        }
      })
    })

    /**
     * @tc.name   test_encodeAsync_base64_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0023
     * @tc.desc   Asynchronously encodes all bytes in the specified u8 array into the newly allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeAsync_base64_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,105,110,32,
        78,111,100,101,46,106,115]);
      let rarray = new Uint8Array([81,109,70,122,90,84,89,48,73,69,86,117,89,50,57,107,97,87,53,110,73,
        71,108,117,73,69,53,118,90,71,85,117,97,110,77,61]);
      that.encode(array).then(val=>{
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i])
        }
      })
    })

    /**
     * @tc.name   test_encodeAsync_base64_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0024
     * @tc.desc   Asynchronously encodes all bytes in the specified u8 array into the newly allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeAsync_base64_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([168, 174, 155, 255]);
      let rarray = new Uint8Array([113,75,54,98,47,119,61,61]);
      that.encode(array).then(val=>{
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i])
        }
      })
    })

    /**
     * @tc.name   test_encodeAsync_base64_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0025
     * @tc.desc   Asynchronously encodes all bytes in the specified u8 array into the newly allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeAsync_base64_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([66, 97, 115, 101, 54, 52]);
      let rarray = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48]);
      that.encode(array).then(val=>{
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i])
        }
      })
    })

    /**
     * @tc.name   test_encodeToString_base64_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0026
     * @tc.desc   Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToString_base64_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([115,49,51]);
      that.encodeToString(array).then(val=>{
        expect(val).assertEqual('czEz')
      })
    })

    /**
     * @tc.name   test_encodeToString_base64_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0027
     * @tc.desc   Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToString_base64_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
      that.encodeToString(array).then(val=>{
        expect(val).assertEqual('QmFzZTY0IE5vZGUuanM=')
      })
    })

    /**
     * @tc.name   test_encodeToString_base64_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0028
     * @tc.desc   Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToString_base64_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([81,109,70,122,90,84,89,48,73,69,86,117,89,50,57,107,97,87,53,110,73,71,108,
        117,73,69,53,118,90,71,85,117,97,110,77,61]);
      that.encodeToString(array).then(val=>{
        expect(val).assertEqual('QmFzZTY0IEVuY29kaW5nIGluIE5vZGUuanM=')
      })
    })

    /**
     * @tc.name   test_encodeToString_base64_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0029
     * @tc.desc   Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToString_base64_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([168, 174, 155, 255]);
      that.encodeToString(array).then(val=>{
        expect(val).assertEqual('qK6b/w==')
      })
    })

    /**
     * @tc.name   test_encodeToString_base64_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0030
     * @tc.desc   Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToString_base64_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([66, 97, 115, 101, 54, 52]);
      that.encodeToString(array).then(val=>{
        expect(val).assertEqual('QmFzZTY0')
      })
    })

    /**
     * @tc.name   test_decode_base64_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0031
     * @tc.desc   Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
      let that = new util.Base64()
      let buff = 'czEz';
      let array = new Uint8Array([115,49,51]);
      that.decode(buff).then(val=>{
        for (let i = 0; i < array.length; i++) {
          expect(val[i]).assertEqual(array[i])
        }
      })
    })

    /**
     * @tc.name   test_decode_base64_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0032
     * @tc.desc   Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
      let that = new util.Base64()
      let buff = 'QmFzZTY0IE5vZGUuanM=';
      let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
      that.decode(buff).then(val=>{
        for (let i = 0; i < array.length; i++) {
          expect(val[i]).assertEqual(array[i])
        }
      })
    })

    /**
     * @tc.name   test_decode_base64_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0033
     * @tc.desc   Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
      let that = new util.Base64()
      let buff = 'QmFzZTY0IEVuY29kaW5nIGluIE5vZGUuanM=';
      let array = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,105,110,32,78,
        111,100,101,46,106,115]);
      that.decode(buff).then(val=>{
        for (let i = 0; i < array.length; i++) {
          expect(val[i]).assertEqual(array[i])
        }
      })
    })

    /**
     * @tc.name   test_decode_base64_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0034
     * @tc.desc   Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
      let that = new util.Base64()
      let buff = 'qK6b/w==';
      let array = new Uint8Array([168, 174, 155, 255]);
      that.decode(buff).then(val=>{
        for (let i = 0; i < array.length; i++) {
          expect(val[i]).assertEqual(array[i])
        }
      })
    })

    /**
     * @tc.name   test_decode_base64_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0035
     * @tc.desc   Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
      let that = new util.Base64()
      let buff = 'QmFzZTY0';
      let rarray = new Uint8Array([66, 97, 115, 101, 54, 52]);
      that.decode(buff).then(val=>{
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i])
        }
      })
    })

    /**
     * @tc.name   test_decode_base64_006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0036
     * @tc.desc   Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([99,122,69,122]);
      let rarray = new Uint8Array([115,49,51]);
      that.decode(array).then(val=>{
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i])
        }
      })
    })

    /**
     * @tc.name   test_decode_base64_007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0037
     * @tc.desc   Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([81,109,70,122,90,84,89,48,73,69,53,118,90,71,85,117,97,110,77,61]);
      let rarray = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
      that.decode(array).then(val=>{
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i])
        }
      })
    })

    /**
     * @tc.name   test_decode_base64_008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0038
     * @tc.desc   Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([81,109,70,122,90,84,89,48,73,69,86,117,89,50,57,107,97,87,53,110,73,71,108,
        117,73,69,53,118,90,71,85,117,97,110,77,61]);
      let rarray = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,105,110,32,78,111,
        100,101,46,106,115]);
      that.decode(array).then(val=>{
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i])
        }
      })
    })

    /**
     * @tc.name   test_decode_base64_009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0039
     * @tc.desc   Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8 array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([113,75,54,98,47,119,61,61]);
      let rarray = new Uint8Array([168, 174, 155, 255]);
      that.decode(array).then(val=>{
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i])
        }
      })
    })

    /**
     * @tc.name   test_decode_base64_010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_0040
     * @tc.desc   Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
      let that = new util.Base64()
      let array = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48]);
      let rarray = new Uint8Array([66, 97, 115, 101, 54, 52]);
      that.decode(array).then(val=>{
        for (let i = 0; i < rarray.length; i++) {
          expect(val[i]).assertEqual(rarray[i])
        }
      })
    })
  })

  describe('RationalNumberFunTest', function () {

    /**
     * @tc.name   test_createRationalFromString_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0001
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let res = util.RationalNumber.createRationalFromString('-1:2')
      let result1 = res.valueOf()
      expect(result1).assertEqual(-0.5)
    })

    /**
     * @tc.name   test_createRationalFromString_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0002
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let res = util.RationalNumber.createRationalFromString('+3/4')
      let result1 = res.valueOf()
      expect(result1).assertEqual(0.75)
    })

    /**
     * @tc.name   test_createRationalFromString_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0003
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let res = util.RationalNumber.createRationalFromString('+3:-4')
      let result1 = res.valueOf()
      expect(result1).assertEqual(-0.75)
    })

    /**
     * @tc.name   test_createRationalFromString_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0004
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let res = util.RationalNumber.createRationalFromString('+2:4')
      let result1 = res.valueOf()
      expect(result1).assertEqual(0.5)
    })

    /**
     * @tc.name   test_createRationalFromString_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0005
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let res = util.RationalNumber.createRationalFromString('-2:-4')
      let result1 = res.valueOf()
      expect(result1).assertEqual(0.5)
    })

    /**
     * @tc.name   test_createRationalFromString_006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0006
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try{
        let rational = util.RationalNumber.createRationalFromString('123');
        } catch(e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("Parameter error. The type of 123 must be effective string");
      }
    })

    /**
     * @tc.name   test_createRationalFromString_007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0007
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try{
        let rational = util.RationalNumber.createRationalFromString('abc');
        } catch(e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("Parameter error. The type of abc must be effective string");
      }
    })

    /**
     * @tc.name   test_createRationalFromString_008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0008
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try{
        let rational = util.RationalNumber.createRationalFromString('123abc');
        } catch(e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("Parameter error. The type of 123abc must be effective string");
      }
    })

    /**
     * @tc.name   test_createRationalFromString_009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0009
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try{
        let rational = util.RationalNumber.createRationalFromString('abc:');
        } catch(e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("Parameter error. The type of abc: must be character string");
      }
    })

    /**
     * @tc.name   test_createRationalFromString_010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0010
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try{
        let rational = util.RationalNumber.createRationalFromString(':abc');
        } catch(e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("Parameter error. The type of :abc must be character string");
      }
    })

    /**
     * @tc.name   test_createRationalFromString_011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0011
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try{
        let rational = util.RationalNumber.createRationalFromString('abc/');
        } catch(e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("Parameter error. The type of abc/ must be character string");
      }
    })

    /**
     * @tc.name   test_createRationalFromString_012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0012
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try{
        let rational = util.RationalNumber.createRationalFromString('123:abc');
        } catch(e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("Parameter error. The type of 123:abc must be character string");
      }
    })

    /**
     * @tc.name   test_createRationalFromString_013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0013
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try{
        let rational = util.RationalNumber.createRationalFromString('abc/123');
        } catch(e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("Parameter error. The type of abc/123 must be character string");
      }
    })
  
    /**
     * @tc.name   test_createRationalFromString_014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0014
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try{
        let rational = util.RationalNumber.createRationalFromString('abc/abcd');
        } catch(e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("Parameter error. The type of abc/abcd must be character string");
      }
    })

    /**
     * @tc.name   test_createRationalFromString_015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0015
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try{
        let rational = util.RationalNumber.createRationalFromString('');
        } catch(e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("Parameter error. The type of  must be effective string");
      }
    })

    /**
     * @tc.name   test_compareTo_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0016
     * @tc.desc   Compares the current RationalNumber object with a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_compareTo_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(2, 1)
      let proc = new util.RationalNumber(3, 4)
      let res = pro.compareTo(proc)
      expect(res).assertEqual(1)
    })

    /**
     * @tc.name   test_compareTo_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0017
     * @tc.desc   Compares the current RationalNumber object with a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_compareTo_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(2, 1)
      let proc = new util.RationalNumber(0, 0)
      let res = pro.compareTo(proc)
      expect(res).assertEqual(-1)
    })

    /**
     * @tc.name   test_compareTo_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0018
     * @tc.desc   Compares the current RationalNumber object with a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_compareTo_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(2, 1)
      let proc = new util.RationalNumber(8, 3)
      let res = pro.compareTo(proc)
      expect(res).assertEqual(-1)
    })

    /**
     * @tc.name   test_compareTo_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0019
     * @tc.desc   Compares the current RationalNumber object with a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_compareTo_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(2, 1)
      let proc = new util.RationalNumber(2, 1)
      let res = pro.compareTo(proc)
      expect(res).assertEqual(0)
    })

    /**
     * @tc.name   test_compareTo_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0020
     * @tc.desc   Compares the current RationalNumber object with a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_compareTo_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(0, 0)
      let proc = new util.RationalNumber(2, 1)
      let res = pro.compareTo(proc)
      expect(res).assertEqual(1)
    })

    /**
     * @tc.name   test_equals_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0021
     * @tc.desc   Checks whether a given object is the same as the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_equals_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(2, 1)
      let proc = new util.RationalNumber(3, 4)
      let res = pro.equals(proc)
      expect(res).assertEqual(false)
    })

    /**
     * @tc.name   test_equals_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0022
     * @tc.desc   Checks whether a given object is the same as the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_equals_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(2, 1)
      let proc = new util.RationalNumber(4, 2)
      let res = pro.equals(proc)
      expect(res).assertEqual(true)
    })

    /**
     * @tc.name   test_equals_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0023
     * @tc.desc   Checks whether a given object is the same as the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_equals_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(0, 1)
      let proc = new util.RationalNumber(0, 2)
      let res = pro.equals(proc)
      expect(res).assertEqual(true)
    })

    /**
     * @tc.name   test_equals_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0024
     * @tc.desc   Checks whether a given object is the same as the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_equals_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(0, 0)
      let proc = new util.RationalNumber(0, 2)
      let res = pro.equals(proc)
      expect(res).assertEqual(false)
    })

    /**
     * @tc.name   test_equals_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0025
     * @tc.desc   Checks whether a given object is the same as the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_equals_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(-2, 0)
      let proc = new util.RationalNumber(2, 0)
      let res = pro.equals(proc)
      expect(res).assertEqual(false)
    })

    /**
     * @tc.name   testRationalNumberValueOf001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0026
     * @tc.desc   Obtains the value of the current RationalNumber object as a number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRationalNumberValueOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(2, 1)
      let res = pro.valueOf()
      expect(res).assertEqual(2)
    })

    /**
     * @tc.name   testRationalNumberValueOf002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0027
     * @tc.desc   Obtains the value of the current RationalNumber object as a number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRationalNumberValueOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(2, 10)
      let res = pro.valueOf()
      expect(res).assertEqual(0.2)
    })

    /**
     * @tc.name   testRationalNumberValueOf003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0028
     * @tc.desc   Obtains the value of the current RationalNumber object as a number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRationalNumberValueOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(1, 2)
      let res = pro.valueOf()
      expect(res).assertEqual(0.5)
    })

    /**
     * @tc.name   testRationalNumberValueOf004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0029
     * @tc.desc   Obtains the value of the current RationalNumber object as a number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRationalNumberValueOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(4, 2)
      let res = pro.valueOf()
      expect(res).assertEqual(2)
    })

    /**
     * @tc.name   testRationalNumberValueOf005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0030
     * @tc.desc   Obtains the value of the current RationalNumber object as a number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRationalNumberValueOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(4, 1)
      let res = pro.valueOf()
      expect(res).assertEqual(4)
    })

    /**
     * @tc.name   testGetCommonDivisor001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0031
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCommonDivisor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(0, 0)
      let res = pro.getCommonDivisor(4, 8)
      expect(res).assertEqual(4)
    })

    /**
     * @tc.name   testGetCommonDivisor002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0032
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCommonDivisor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(0, 0)
      let res = pro.getCommonDivisor(10, 15)
      expect(res).assertEqual(5)
    })

    /**
     * @tc.name   testGetCommonDivisor003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0033
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCommonDivisor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(0, 0)
      let res = pro.getCommonDivisor(8, 4)
      expect(res).assertEqual(4)
    })

    /**
     * @tc.name   testGetCommonDivisor004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0034
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCommonDivisor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(0, 0)
      let res = pro.getCommonDivisor(8, 16)
      expect(res).assertEqual(8)
    })

    /**
     * @tc.name   testGetCommonDivisor005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0035
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCommonDivisor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(0, 0)
      let res = pro.getCommonDivisor(2, 16)
      expect(res).assertEqual(2)
    })

    /**
     * @tc.name   testGetCommonFactor001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0036
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCommonFactor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = util.RationalNumber.getCommonFactor(4, 6);
      expect(result).assertEqual(2)
    })

    /**
     * @tc.name   testGetCommonFactor002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0037
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCommonFactor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let result = util.RationalNumber.getCommonFactor(1, 6);
      expect(result).assertEqual(1)
    })

    /**
     * @tc.name   testGetCommonFactor003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0038
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCommonFactor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try{
        let result = util.RationalNumber.getCommonFactor(0, 6);
        } catch(e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("Parameter error. The Parameter cannot be zero");
      }
    })

    /**
     * @tc.name   testGetCommonFactor004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0039
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCommonFactor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try{
        let result = util.RationalNumber.getCommonFactor(0, 0);
        } catch(e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("Parameter error. The Parameter cannot be zero");
      }
    })

    /**
     * @tc.name   testGetCommonFactor005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0040
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCommonFactor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try{
        let result = util.RationalNumber.getCommonFactor(null, null);
        } catch(e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("Parameter error. The type of null must be number");
      }
    })

    /**
     * @tc.name   testGetCommonFactor006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0041
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCommonFactor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try{
        let result = util.RationalNumber.getCommonFactor('123', 456);
        } catch(e) {
        expect(e.code).assertEqual(401);
        expect(e.message).assertContain("Parameter error. The type of 123 must be number");
      }
    })
  
    /**
     * @tc.name   testGetDenominator001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0042
     * @tc.desc   Obtains the denominator of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetDenominator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(2, 1)
      let res = pro.getDenominator()
      expect(res).assertEqual(1)
    })

    /**
     * @tc.name   testGetDenominator002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0043
     * @tc.desc   Obtains the denominator of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetDenominator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(2, 3)
      let res = pro.getDenominator()
      expect(res).assertEqual(3)
    })

    /**
     * @tc.name   testGetDenominator003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0044
     * @tc.desc   Obtains the denominator of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetDenominator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(2, 0)
      let res = pro.getDenominator()
      expect(res).assertEqual(0)
    })

    /**
     * @tc.name   testGetDenominator004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0045
     * @tc.desc   Obtains the denominator of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetDenominator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(10, 5)
      let res = pro.getDenominator()
      expect(res).assertEqual(1)
    })

    /**
     * @tc.name   testGetDenominator005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0046
     * @tc.desc   Obtains the denominator of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetDenominator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(6, 3)
      let res = pro.getDenominator()
      expect(res).assertEqual(1)
    })

    /**
     * @tc.name   testGetDenominator006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0047
     * @tc.desc   Obtains the denominator of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetDenominator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(6, -3)
      let res = pro.getDenominator()
      expect(res).assertEqual(1)
    })

    /**
     * @tc.name   testGetNumerator001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0048
     * @tc.desc   Obtains the numerator of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetNumerator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(-2, 1)
      let res = pro.getNumerator()
      expect(res).assertEqual(-2)
    })

    /**
     * @tc.name   testGetNumerator002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0049
     * @tc.desc   Obtains the numerator of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetNumerator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(0, 3)
      let res = pro.getNumerator()
      expect(res).assertEqual(0)
    })

    /**
     * @tc.name   testGetNumerator003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0050
     * @tc.desc   Obtains the numerator of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetNumerator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(2, 4)
      let res = pro.getNumerator()
      expect(res).assertEqual(1)
    })

    /**
     * @tc.name   testGetNumerator004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0051
     * @tc.desc   Obtains the numerator of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetNumerator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(3, 6)
      let res = pro.getNumerator()
      expect(res).assertEqual(1)
    })

    /**
     * @tc.name   testGetNumerator005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0052
     * @tc.desc   Obtains the numerator of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetNumerator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(10, 5)
      let res = pro.getNumerator()
      expect(res).assertEqual(2)
    })

    /**
     * @tc.name   testisFinite001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0053
     * @tc.desc   Checks whether the current RationalNumber object represents a finite value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisFinite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(-2, 1)
      let res = pro.isFinite()
      expect(res).assertEqual(true)
    })

    /**
     * @tc.name   testisFinite002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0054
     * @tc.desc   Checks whether the current RationalNumber object represents a finite value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisFinite002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(0, 3)
      let res = pro.isFinite()
      expect(res).assertEqual(true)
    })

    /**
     * @tc.name   testisFinite003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0055
     * @tc.desc   Checks whether the current RationalNumber object represents a finite value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisFinite003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(2, 0)
      let res = pro.isFinite()
      expect(res).assertEqual(false)
    })

    /**
     * @tc.name   testisFinite004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0056
     * @tc.desc   Checks whether the current RationalNumber object represents a finite value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisFinite004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(1, 3)
      let res = pro.isFinite()
      expect(res).assertEqual(true)
    })

    /**
     * @tc.name   testisFinite005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0057
     * @tc.desc   Checks whether the current RationalNumber object represents a finite value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisFinite005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(10, 5)
      let res = pro.isFinite()
      expect(res).assertEqual(true)
    })

    /**
     * @tc.name   testisNaN001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0058
     * @tc.desc   Checks whether the current RationalNumber object represents a finite value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisNaN001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(-2, 1)
      let res = pro.isNaN()
      expect(res).assertEqual(false)
    })

    /**
     * @tc.name   testisNaN002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0059
     * @tc.desc   Checks whether the current RationalNumber object represents a Not-a-Number (NaN) value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisNaN002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(0, 3)
      let res = pro.isNaN()
      expect(res).assertEqual(false)
    })

    /**
     * @tc.name   testisNaN003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0060
     * @tc.desc   Checks whether the current RationalNumber object represents a Not-a-Number (NaN) value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisNaN003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(0, 0)
      let res = pro.isNaN()
      expect(res).assertEqual(true)
    })

    /**
     * @tc.name   testisNaN004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0061
     * @tc.desc   Checks whether the current RationalNumber object represents a Not-a-Number (NaN) value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisNaN004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(10, 0)
      let res = pro.isNaN()
      expect(res).assertEqual(false)
    })

    /**
     * @tc.name   testisNaN005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0062
     * @tc.desc   Checks whether the current RationalNumber object represents a Not-a-Number (NaN) value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisNaN005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(10, 1)
      let res = pro.isNaN()
      expect(res).assertEqual(false)
    })

    /**
     * @tc.name   testisZero001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0063
     * @tc.desc   Checks whether the current RationalNumber object represents the value 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisZero001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(-2, 1)
      let res = pro.isZero()
      expect(res).assertEqual(false)
    })

    /**
     * @tc.name   testisZero002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0064
     * @tc.desc   Checks whether the current RationalNumber object represents the value 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisZero002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(0, 3)
      let res = pro.isZero()
      expect(res).assertEqual(true)
    })

    /**
     * @tc.name   testisZero003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0065
     * @tc.desc   Checks whether the current RationalNumber object represents the value 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisZero003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(0, 0)
      let res = pro.isZero()
      expect(res).assertEqual(false)
    })

    /**
     * @tc.name   testisZero004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0066
     * @tc.desc   Checks whether the current RationalNumber object represents the value 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisZero004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(10, 2)
      let res = pro.isZero()
      expect(res).assertEqual(false)
    })

    /**
     * @tc.name   testisZero005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0067
     * @tc.desc   Checks whether the current RationalNumber object represents the value 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisZero005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(1, 1)
      let res = pro.isZero()
      expect(res).assertEqual(false)
    })

    /**
     * @tc.name   testRationalNumberToString001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0068
     * @tc.desc   Obtains a string representation of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRationalNumberToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(-2, 1)
      let res = pro.toString()
      expect(res).assertEqual("-2/1")
    })

    /**
     * @tc.name   testRationalNumberToString002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0069
     * @tc.desc   Obtains a string representation of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRationalNumberToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(0, 0)
      let res = pro.toString()
      expect(res).assertEqual("NaN")
    })

    /**
     * @tc.name   testRationalNumberToString003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0070
     * @tc.desc   Obtains a string representation of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRationalNumberToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(3, 0)
      let res = pro.toString()
      expect(res).assertEqual("Infinity")
    })

    /**
     * @tc.name   testRationalNumberToString004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0071
     * @tc.desc   Obtains a string representation of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRationalNumberToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(-3, 0)
      let res = pro.toString()
      expect(res).assertEqual("-Infinity")
    })

    /**
     * @tc.name   testRationalNumberToString005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_0072
     * @tc.desc   Obtains a string representation of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRationalNumberToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let pro = new util.RationalNumber(2, 3)
      let res = pro.toString()
      expect(res).assertEqual('2/3')
    })
  })

  describe('LruBufferFunTest', function () {

    /**
     * @tc.name   testLruBufferUpdateGetCapacity001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0001
     * @tc.desc   Updates the buffer capacity to a specified capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferUpdateGetCapacity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.updateCapacity(10)
      let result = that.getCapacity()
      expect(result).assertEqual(10)
    })

    /**
     * @tc.name   testLruBufferUpdateGetCapacity002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0002
     * @tc.desc   Updates the buffer capacity to a specified capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferUpdateGetCapacity002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.updateCapacity(2147483646)
      let result = that.getCapacity()
      expect(result).assertEqual(2147483646)
    })

    /**
     * @tc.name   testLruBufferUpdateGetCapacity003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0003
     * @tc.desc   Updates the buffer capacity to a specified capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferUpdateGetCapacity003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer(100)
      that.updateCapacity(20)
      let result = that.getCapacity()
      expect(result).assertEqual(20)
    })

    /**
     * @tc.name   testLruBufferUpdateGetCapacity004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0004
     * @tc.desc   Updates the buffer capacity to a specified capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferUpdateGetCapacity004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer(50)
      that.updateCapacity(2)
      let result = that.getCapacity()
      expect(result).assertEqual(2)
    })

    /**
     * @tc.name   testLruBufferUpdateGetCapacity005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0005
     * @tc.desc   Updates the buffer capacity to a specified capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferUpdateGetCapacity005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer(200)
      that.updateCapacity(100)
      let result = that.getCapacity()
      expect(result).assertEqual(100)
    })

    /**
     * @tc.name   testLruBufferGet001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0006
     * @tc.desc   Obtains the value associated with a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer(100)
      that.put(1,2)
      let result = that.get(1)
      expect(result).assertEqual(2)
    })

    /**
     * @tc.name   testLruBufferGet002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0007
     * @tc.desc   Obtains the value associated with a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer(100)
      that.put(1,2)
      let result = that.get(5)
      expect(result).assertEqual(undefined)
    })

    /**
     * @tc.name   testLruBufferGet003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0008
     * @tc.desc   Obtains the value associated with a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer(100)
      that.put(1,2)
      that.put(2,10)
      that.put('abcd',15)
      let result1 = that.get(20)
      let result2 = that.get('abcd')
      let result3 = that.get(2)
      expect(result1).assertEqual(undefined)
      expect(result2).assertEqual(15)
      expect(result3).assertEqual(10)
    })

    /**
     * @tc.name   testLruBufferGet004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0009
     * @tc.desc   Obtains the value associated with a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put('1111','bcjdshc')
      that.put(20,'cdjcaxb')
      that.put('abcd',15)
      let result1 = that.get('1111')
      let result2 = that.get(20)
      let result3 = that.get('abcd')
      let result4 = that.get(25)
      expect(result1).assertEqual('bcjdshc')
      expect(result2).assertEqual('cdjcaxb')
      expect(result3).assertEqual(15)
      expect(result4).assertEqual(undefined)
    })

    /**
     * @tc.name   testLruBufferGet005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0010
     * @tc.desc   Obtains the value associated with a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put('1111','bcjdshc')
      that.put(20,'cdjcaxb')
      that.updateCapacity(2)
      that.put('abcd',15)
      let result1 = that.get('1111')
      let result2 = that.get(20)
      let result3 = that.get('abcd')
      let result4 = that.get(25)
      expect(result1).assertEqual(undefined)
      expect(result2).assertEqual('cdjcaxb')
      expect(result3).assertEqual(15)
      expect(result4).assertEqual(undefined)
    })

    /**
     * @tc.name   testLruBufferPut001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0011
     * @tc.desc   Adds a key-value pair to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferPut001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      let temp = that.put('1111','bcjdshc')
      expect(temp).assertEqual('bcjdshc')
    })

    /**
     * @tc.name   testLruBufferPut002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0012
     * @tc.desc   Adds a key-value pair to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferPut002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      let temp1 = that.put('1111','bcjdshc')
      let temp2 = that.put('1111',13)
      expect(temp2).assertEqual(13)
    })

    /**
     * @tc.name   testLruBufferPut003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0013
     * @tc.desc   Adds a key-value pair to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferPut003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      let temp = that.put('1111','bcjdshc')
      let temp1 = that.put(1,12)
      let temp2 = that.put(2,5)
      let temp3 = that.put(2,'adasfdad')
      let temp4 = that.put('abc',10)
      expect(temp1).assertEqual(12)
      expect(temp2).assertEqual(5)
      expect(temp3).assertEqual('adasfdad')
      expect(temp4).assertEqual(10)
    })

    /**
     * @tc.name   testLruBufferPut004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0014
     * @tc.desc   Adds a key-value pair to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferPut004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      let temp = that.put('1111','bcjdshc')
      let temp1 = that.put(1,12)
      let temp2 = that.put(2,5)
      that.updateCapacity(2)
      let temp3 = that.put(2,'adasfdad')
      let temp4 = that.put('1111',10)
      expect(temp).assertEqual('bcjdshc')
      expect(temp1).assertEqual(12)
      expect(temp2).assertEqual(5)
      expect(temp3).assertEqual('adasfdad')
      expect(temp4).assertEqual(10)
    })

    /**
     * @tc.name   testLruBufferPut005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0015
     * @tc.desc   Adds a key-value pair to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferPut005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      let temp = that.put('1111','bcjdshc')
      let temp1 = that.put(1,12)
      let temp2 = that.put(2,5)
      let temp3 = that.put(1,10)
      let temp4 = that.put(2,22)
      let temp5 = that.put(2,30)
      expect(temp).assertEqual('bcjdshc')
      expect(temp1).assertEqual(12)
      expect(temp2).assertEqual(5)
      expect(temp3).assertEqual(10)
      expect(temp4).assertEqual(22)
      expect(temp5).assertEqual(30)
    })

    /**
     * @tc.name   testLruBufferGetCreateCount001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0016
     * @tc.desc   Obtains the number of times createDefault(Object) returned a value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetCreateCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(2,10)
      that.put('abcd',15)
      that.get(3)
      that.get(5)
      that.get(10)
      let result = that.getCreateCount()
      expect(result).assertEqual(0)
    })

    /**
     * @tc.name   testLruBufferGetCreateCount002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0017
     * @tc.desc   Obtains the number of times createDefault(Object) returned a value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetCreateCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(2,10)
      that.put('abcd',15)
      that.get(6)
      that.get(8)
      that.get(20)
      let result = that.getCreateCount()
      expect(result).assertEqual(0)
    })

    /**
     * @tc.name   testLruBufferGetCreateCount003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0018
     * @tc.desc   Obtains the number of times createDefault(Object) returned a value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetCreateCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(2,10)
      that.get('abc')
      that.get('cndk')
      let result = that.getCreateCount()
      expect(result).assertEqual(0)
    })

    /**
     * @tc.name   testLruBufferGetCreateCount004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0019
     * @tc.desc   Obtains the number of times createDefault(Object) returned a value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetCreateCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(5,2)
      that.put(10,10)
      that.put('abcd','abcd')
      that.get(3)
      that.get(20)
      that.get(12)
      let result = that.getCreateCount()
      expect(result).assertEqual(0)
    })

    /**
     * @tc.name   testLruBufferGetCreateCount005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0020
     * @tc.desc   Obtains the number of times createDefault(Object) returned a value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetCreateCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put('xsjk','bcjds')
      that.put('ajc',10)
      that.put('abcd',15)
      that.get(2)
      that.get(10)
      that.get(30)
      let result = that.getCreateCount()
      expect(result).assertEqual(0)
    })

    /**
     * @tc.name   testLruBufferGetMissCount001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0021
     * @tc.desc   Obtains the number of times that the queried values are not matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetMissCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(2,10)
      that.put('abcd',15)
      that.get(3)
      that.get(5)
      that.get(10)
      let result = that.getMissCount()
      expect(result).assertEqual(3)
    })

    /**
     * @tc.name   testLruBufferGetMissCount002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0022
     * @tc.desc   Obtains the number of times that the queried values are not matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetMissCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(5,2)
      that.put(1,10)
      that.put('abcd','bcjsc')
      that.get(2)
      that.get(10)
      that.get(15)
      let result = that.getMissCount()
      expect(result).assertEqual(3)
    })

    /**
     * @tc.name   testLruBufferGetMissCount003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0023
     * @tc.desc   Obtains the number of times that the queried values are not matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetMissCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(10,10)
      that.put(3,20)
      that.put(12,16)
      that.get(1)
      that.get(2)
      that.get(6)
      let result = that.getMissCount()
      expect(result).assertEqual(3)
    })

    /**
     * @tc.name   testLruBufferGetMissCount004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0024
     * @tc.desc   Obtains the number of times that the queried values are not matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetMissCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put('acb','asdc')
      that.put('vfb',1)
      that.put('abcd','abcd')
      that.get(3)
      that.get(5)
      that.get(10)
      let result = that.getMissCount()
      expect(result).assertEqual(3)
    })

    /**
     * @tc.name   testLruBufferGetMissCount005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0025
     * @tc.desc   Obtains the number of times that the queried values are not matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetMissCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(2,10)
      that.put('abcd',15)
      that.get(3)
      that.get(5)
      that.get(10)
      that.contains(2)
      that.contains(6)
      let result = that.getMissCount()
      expect(result).assertEqual(4)
    })

    /**
     * @tc.name   testLruBufferGetMissCount006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0026
     * @tc.desc   Obtains the number of times that the queried values are not matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetMissCount006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(2,10)
      that.put('abcd',15)
      that.get(1)
      that.get(2)
      that.get('abcd')
      let result = that.getMissCount()
      expect(result).assertEqual(0)
    })

    /**
     * @tc.name   testLruBufferGetRemovalCount001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0027
     * @tc.desc   Obtains the number of times that values are evicted from the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetRemovalCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(2,10)
      that.put('abcd',15)
      that.put(3,20)
      that.put(5,30)
      let result = that.getRemovalCount()
      expect(result).assertEqual(0)
    })

    /**
     * @tc.name   testLruBufferGetRemovalCount002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0028
     * @tc.desc   Obtains the number of times that values are evicted from the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetRemovalCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(10,2)
      that.put(3,2)
      that.put(15,15)
      that.put(1,20)
      let result = that.getRemovalCount()
      expect(result).assertEqual(0)
    })

    /**
     * @tc.name   testLruBufferGetRemovalCount003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0029
     * @tc.desc   Obtains the number of times that values are evicted from the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetRemovalCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put('abc',2)
      that.put('abcd','abcd')
      that.put(3,2)
      let result = that.getRemovalCount()
      expect(result).assertEqual(0)
    })

    /**
     * @tc.name   testLruBufferGetRemovalCount004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0030
     * @tc.desc   Obtains the number of times that values are evicted from the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetRemovalCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(2,10)
      that.put('abcd',15)
      that.updateCapacity(2)
      that.put(3,20)
      that.put(5,30)
      let result = that.getRemovalCount()
      expect(result).assertEqual(3)
    })

    /**
     * @tc.name   testLruBufferGetRemovalCount005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0031
     * @tc.desc   Obtains the number of times that values are evicted from the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetRemovalCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(2,10)
      that.put('abcd',15)
      that.updateCapacity(3)
      that.put('string',20)
      that.put('abc',30)
      that.put(10,20)
      let result = that.getRemovalCount()
      expect(result).assertEqual(3)
    })

    /**
     * @tc.name   testLruBufferGetMatchCount001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0032
     * @tc.desc   Obtains the number of times that the queried values are successfully matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetMatchCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(2,10)
      that.put('abcd',15)
      that.get(1)
      that.get(2)
      that.get('abcd')
      let result = that.getMatchCount()
      expect(result).assertEqual(3)
    })

    /**
     * @tc.name   testLruBufferGetMatchCount002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0033
     * @tc.desc   Obtains the number of times that the queried values are successfully matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetMatchCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(10,2)
      that.put(2,1)
      that.put('abcd',15)
      that.get(10)
      that.get(2)
      that.get('abcd')
      that.get('string')
      let result = that.getMatchCount()
      expect(result).assertEqual(3)
    })

    /**
     * @tc.name   testLruBufferGetMatchCount003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0034
     * @tc.desc   Obtains the number of times that the queried values are successfully matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetMatchCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(0,1)
      that.put(30,10)
      that.put('abcd',15)
      that.get(0)
      that.get(30)
      that.get('abcd')
      let result = that.getMatchCount()
      expect(result).assertEqual(3)
    })

    /**
     * @tc.name   testLruBufferGetMatchCount004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0035
     * @tc.desc   Obtains the number of times that the queried values are successfully matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetMatchCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(2,10)
      that.put('abcd',15)
      that.get(1)
      that.get(2)
      that.get('abcd')
      that.contains(2)
      that.contains('abcd')
      that.contains(20)
      let result = that.getMatchCount()
      expect(result).assertEqual(5)
    })

    /**
     * @tc.name   testLruBufferGetMatchCount005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0036
     * @tc.desc   Obtains the number of times that the queried values are successfully matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetMatchCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
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
      let result = that.getMatchCount()
      expect(result).assertEqual(7)
    })

    /**
     * @tc.name   testLruBufferGetMatchCount006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0037
     * @tc.desc   Obtains the number of times that the queried values are successfully matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetMatchCount006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(2,10)
      that.put('abcd',15)
      that.get(5)
      let result = that.getMatchCount()
      expect(result).assertEqual(0)
    })

    /**
     * @tc.name   testLruBufferGetPutCount001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0038
     * @tc.desc   Obtains the number of times that values are added to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetPutCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      let result = that.getPutCount()
      expect(result).assertEqual(1)
    })

    /**
     * @tc.name   testLruBufferGetPutCount002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0039
     * @tc.desc   Obtains the number of times that values are added to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetPutCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(5,3)
      that.put(2,10)
      let result = that.getPutCount()
      expect(result).assertEqual(2)
    })

    /**
     * @tc.name   testLruBufferGetPutCount003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0040
     * @tc.desc   Obtains the number of times that values are added to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetPutCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put('string',2)
      that.put('abcd',1)
      that.put('ab','a')
      let result = that.getPutCount()
      expect(result).assertEqual(3)
    })

    /**
     * @tc.name   testLruBufferGetPutCount004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0041
     * @tc.desc   Obtains the number of times that values are added to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetPutCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put('string','string')
      that.put('ac','abc')
      that.put('abcd',15)
      let result = that.getPutCount()
      expect(result).assertEqual(3)
    })

    /**
     * @tc.name   testLruBufferGetPutCount005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0042
     * @tc.desc   Obtains the number of times that values are added to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetPutCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(2,10)
      that.updateCapacity(2)
      that.put('abcd','abc')
      let result = that.getPutCount()
      expect(result).assertEqual(3)
    })

    /**
     * @tc.name   testLruBufferGetCapacity001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0043
     * @tc.desc   Obtains the capacity of the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetCapacity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      let result = that.getCapacity()
      expect(result).assertEqual(64)
    })

    /**
     * @tc.name   testLruBufferGetCapacity002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0044
     * @tc.desc   Obtains the capacity of the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetCapacity002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer(2)
      let result = that.getCapacity()
      expect(result).assertEqual(2)
    })

    /**
     * @tc.name   testLruBufferGetCapacity003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0045
     * @tc.desc   Obtains the capacity of the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetCapacity003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer(100)
      let result = that.getCapacity()
      expect(result).assertEqual(100)
    })

    /**
     * @tc.name   testLruBufferGetCapacity004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0046
     * @tc.desc   Obtains the capacity of the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetCapacity004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.updateCapacity(50)
      let result = that.getCapacity()
      expect(result).assertEqual(50)
    })

    /**
     * @tc.name   testLruBufferGetCapacity005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0047
     * @tc.desc   Obtains the capacity of the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetCapacity005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer(100)
      that.updateCapacity(10)
      let result = that.getCapacity()
      expect(result).assertEqual(10)
    })

    /**
     * @tc.name   testLruBufferLength001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0048
     * @tc.desc   Obtains the total number of values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferLength001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      let result = that.length
      expect(result).assertEqual(0)
    })

    /**
     * @tc.name   testLruBufferLength002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0049
     * @tc.desc   Obtains the total number of values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferLength002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      let result = that.length
      expect(result).assertEqual(1)
    })

    /**
     * @tc.name   testLruBufferLength003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0050
     * @tc.desc   Obtains the total number of values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferLength003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put('abc',2)
      that.put('string','string')
      let result = that.length
      expect(result).assertEqual(2)
    })

    /**
     * @tc.name   testLruBufferLength004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0051
     * @tc.desc   Obtains the total number of values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferLength004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(2,10)
      that.put('abcd',15)
      that.put('abcd',20)
      let result = that.length
      expect(result).assertEqual(3)
    })

    /**
     * @tc.name   testLruBufferLength005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0052
     * @tc.desc   Obtains the total number of values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferLength005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(2,10)
      that.put('abcd',15)
      that.put('abcd',20)
      that.updateCapacity(3);
      that.put(5,33);
      that.put(25,35);
      let result = that.length
      expect(result).assertEqual(3)
    })

    /**
     * @tc.name   testLruBufferClear001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0053
     * @tc.desc   Clears key-value pairs from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferClear001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      let result1 = that.length
      that.clear()
      let result2 = that.length
      expect(result1).assertEqual(1)
      expect(result2).assertEqual(0)
    })

    /**
     * @tc.name   testLruBufferClear002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0054
     * @tc.desc   Clears key-value pairs from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferClear002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(2,10)
      that.put(5,33);
      that.put(25,35);
      let result1 = that.length
      that.clear()
      let result2 = that.length
      expect(result1).assertEqual(4)
      expect(result2).assertEqual(0)
    })

    /**
     * @tc.name   testLruBufferClear003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0055
     * @tc.desc   Clears key-value pairs from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferClear003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put('abc',2)
      that.put(2,'abc')
      that.put('ancd','abcd')
      that.put(10,35)
      let result1 = that.length
      that.clear()
      let result2 = that.length
      expect(result1).assertEqual(4)
      expect(result2).assertEqual(0)
    })

    /**
     * @tc.name   testLruBufferClear004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0056
     * @tc.desc   Clears key-value pairs from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferClear004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(2,10)
      that.put(5,33);
      that.updateCapacity(3);
      let result1 = that.length
      that.clear()
      let result2 = that.length
      expect(result1).assertEqual(3)
      expect(result2).assertEqual(0)
    })

    /**
     * @tc.name   testLruBufferClear005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0057
     * @tc.desc   Clears key-value pairs from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferClear005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(2,10)
      that.put(5,33);
      that.put('abcd','string');
      that.updateCapacity(2);
      let result1 = that.length
      that.clear()
      let result2 = that.length
      expect(result1).assertEqual(2)
      expect(result2).assertEqual(0)
    })

    /**
     * @tc.name   testLruBufferIsEmpty001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0058
     * @tc.desc   Checks whether the current buffer is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferIsEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      let result = that.isEmpty()
      expect(result).assertEqual(false)
    })

    /**
     * @tc.name   testLruBufferIsEmpty002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0059
     * @tc.desc   Checks whether the current buffer is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferIsEmpty002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(2,10)
      let result = that.isEmpty()
      expect(result).assertEqual(false)
    })

    /**
     * @tc.name   testLruBufferIsEmpty003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0060
     * @tc.desc   Checks whether the current buffer is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferIsEmpty003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(2,10)
      that.put(5,33)
      let result = that.isEmpty()
      expect(result).assertEqual(false)
    })

    /**
     * @tc.name   testLruBufferIsEmpty004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0061
     * @tc.desc   Checks whether the current buffer is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferIsEmpty004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put('abc',2)
      that.put('string',10)
      that.put('ab','abc')
      let result = that.isEmpty()
      expect(result).assertEqual(false)
    })

    /**
     * @tc.name   testLruBufferIsEmpty005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0062
     * @tc.desc   Checks whether the current buffer is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferIsEmpty005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(2,10)
      that.put(5,33);
      that.clear()
      let result = that.isEmpty()
      expect(result).assertEqual(true)
    })

    /**
     * @tc.name   testLruBufferContains001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0063
     * @tc.desc   Checks whether the current buffer contains a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferContains001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      let result = that.contains(1)
      expect(result).assertEqual(true)
    })

    /**
     * @tc.name   testLruBufferContains002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0064
     * @tc.desc   Checks whether the current buffer contains a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferContains002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(0,5)
      let result = that.contains(0)
      expect(result).assertEqual(true)
    })

    /**
     * @tc.name   testLruBufferContains003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0065
     * @tc.desc   Checks whether the current buffer contains a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferContains003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put('abc','abc')
      let result = that.contains(1)
      expect(result).assertEqual(false)
    })

    /**
     * @tc.name   testLruBufferContains004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0066
     * @tc.desc   Checks whether the current buffer contains a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferContains004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put('abcd',20)
      let result1 = that.contains(1)
      let result2 = that.contains(20)
      expect(result1).assertEqual(true)
      expect(result2).assertEqual(false)
    })

    /**
     * @tc.name   testLruBufferContains005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0067
     * @tc.desc   Checks whether the current buffer contains a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferContains005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put('string','string')
      let result1 = that.contains(1)
      let result2 = that.contains('string')
      let result3 = that.contains(0)
      expect(result1).assertEqual(true)
      expect(result2).assertEqual(true)
      expect(result3).assertEqual(false)
    })

    /**
     * @tc.name   testLruBufferRemove001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0068
     * @tc.desc   Deletes a specified key and its associated value from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferRemove001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      let result = that.remove(1)
      expect(result).assertEqual(2)
    })

    /**
     * @tc.name   testLruBufferRemove002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0069
     * @tc.desc   Deletes a specified key and its associated value from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferRemove002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put('abcd',20)
      let result1 = that.remove(1)
      let result2 = that.remove('abcd')
      expect(result1).assertEqual(2)
      expect(result2).assertEqual(20)
    })

    /**
     * @tc.name   testLruBufferRemove003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0070
     * @tc.desc   Deletes a specified key and its associated value from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferRemove003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      let result1 = that.remove(1)
      let result2 = that.remove(5)
      expect(result1).assertEqual(2)
      expect(result2).assertEqual(undefined)
    })

    /**
     * @tc.name   testLruBufferRemove004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0071
     * @tc.desc   Deletes a specified key and its associated value from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferRemove004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(0,'abc')
      that.put('abcd',20)
      let result1 = that.remove(1)
      let result2 = that.remove('abcd')
      expect(result1).assertEqual(undefined)
      expect(result2).assertEqual(20)
    })

    /**
     * @tc.name   testLruBufferRemove005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0072
     * @tc.desc   Deletes a specified key and its associated value from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferRemove005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(3,10)
      that.put(5,15)
      let result1 = that.remove(1)
      let result2 = that.remove(3)
      let result3 = that.get(3)
      expect(result1).assertEqual(2)
      expect(result2).assertEqual(10)
      expect(result3).assertEqual(undefined)
    })

    /**
     * @tc.name   testLruBufferCreateDefault001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0073
     * @tc.desc   Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferCreateDefault001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      let result = that.createDefault(1)
      expect(result).assertEqual(undefined)
    })

    /**
     * @tc.name   testLruBufferCreateDefault002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0074
     * @tc.desc   Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferCreateDefault002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      let result = that.createDefault(0)
      expect(result).assertEqual(undefined)
    })

    /**
     * @tc.name   testLruBufferCreateDefault003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0075
     * @tc.desc   Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferCreateDefault003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      let result = that.createDefault('string')
      expect(result).assertEqual(undefined)
    })

    /**
     * @tc.name   testLruBufferCreateDefault004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0076
     * @tc.desc   Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferCreateDefault004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      let result = that.createDefault(10)
      expect(result).assertEqual(undefined)
    })

    /**
     * @tc.name   testLruBufferCreateDefault005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0077
     * @tc.desc   Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferCreateDefault005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      let result1 = that.createDefault('abc')
      let result2 = that.createDefault('ab')
      expect(result1).assertEqual(undefined)
      expect(result2).assertEqual(undefined)
    })

    /**
     * @tc.name   testLruBufferKeys001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0078
     * @tc.desc   Obtains a list of keys for the values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferKeys001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put('string','abc')
      let result = that.keys()
      expect(result[0]).assertEqual('string')
    })

    /**
     * @tc.name   testLruBufferKeys002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0079
     * @tc.desc   Obtains a list of keys for the values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferKeys002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(3,10)
      that.put(5,15)
      that.put('abc',20)
      let result = that.keys()
      expect(result[0]).assertEqual(1)
      expect(result[1]).assertEqual(3)
      expect(result[2]).assertEqual(5)
      expect(result[3]).assertEqual('abc')
    })

    /**
     * @tc.name   testLruBufferKeys003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0080
     * @tc.desc   Obtains a list of keys for the values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferKeys003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(3,10)
      that.put(5,15)
      that.put('abc',20)
      that.get(3)
      let result = that.keys()
      expect(result[0]).assertEqual(1)
      expect(result[1]).assertEqual(5)
      expect(result[2]).assertEqual('abc')
      expect(result[3]).assertEqual(3)
    })

    /**
     * @tc.name   testLruBufferKeys004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0081
     * @tc.desc   Obtains a list of keys for the values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferKeys004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(3,10)
      that.put(5,15)
      that.put('abc',20)
      that.get(3)
      that.contains(1)
      let result = that.keys()
      expect(result[0]).assertEqual(5)
      expect(result[1]).assertEqual('abc')
      expect(result[2]).assertEqual(3)
      expect(result[3]).assertEqual(1)
    })

    /**
     * @tc.name   testLruBufferKeys005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0082
     * @tc.desc   Obtains a list of keys for the values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferKeys005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(3,10)
      that.put(5,15)
      that.put('abc',20)
      that.get(3)
      that.remove(5)
      that.contains(3)
      that.get(1)
      that.contains('abc')
      let result = that.keys()
      expect(result[0]).assertEqual(3)
      expect(result[1]).assertEqual(1)
      expect(result[2]).assertEqual('abc')
    })

    /**
     * @tc.name   testLruBufferValues001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0083
     * @tc.desc   Obtains a list of all values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferValues001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put('string','abc')
      let result = that.values()
      expect(result[0]).assertEqual('abc')
    })

    /**
     * @tc.name   testLruBufferValues002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0084
     * @tc.desc   Obtains a list of all values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferValues002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(3,10)
      that.put(5,15)
      that.put('abc',20)
      let result = that.values()
      expect(result[0]).assertEqual(2)
      expect(result[1]).assertEqual(10)
      expect(result[2]).assertEqual(15)
      expect(result[3]).assertEqual(20)
    })

    /**
     * @tc.name   testLruBufferValues003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0085
     * @tc.desc   Obtains a list of all values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferValues003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(3,10)
      that.put(5,15)
      that.put('abc',20)
      that.get(3)
      let result = that.values()
      expect(result[0]).assertEqual(2)
      expect(result[1]).assertEqual(15)
      expect(result[2]).assertEqual(20)
      expect(result[3]).assertEqual(10)
    })

    /**
     * @tc.name   testLruBufferValues004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0086
     * @tc.desc   Obtains a list of all values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferValues004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(3,10)
      that.put(5,15)
      that.put('abc',20)
      that.get(3)
      that.contains(1)
      let result = that.values()
      expect(result[0]).assertEqual(15)
      expect(result[1]).assertEqual(20)
      expect(result[2]).assertEqual(10)
      expect(result[3]).assertEqual(2)
    })

    /**
     * @tc.name   testLruBufferValues005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0087
     * @tc.desc   Obtains a list of all values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferValues005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(3,10)
      that.put(5,15)
      that.put('abc',20)
      that.get(3)
      that.remove(5)
      that.contains(3)
      that.get(1)
      that.contains('abc')
      let result = that.values()
      expect(result[0]).assertEqual(10)
      expect(result[1]).assertEqual(2)
      expect(result[2]).assertEqual(20)
    })

    /**
     * @tc.name   testLruBufferToString001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0088
     * @tc.desc   Returns a string representation of the object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put('1111','bcjdshc')
      that.put(1,2)
      let result = that.toString()
      expect(result).assertEqual('Lrubuffer[ maxSize = 64, hits = 0, misses = 0, hitRate = 0% ]')
    })

    /**
     * @tc.name   testLruBufferToString002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0089
     * @tc.desc   Returns a string representation of the object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put('1111','bcjdshc')
      that.put(1,2)
      that.get(1)
      that.get('1111')
      let result = that.toString()
      expect(result).assertEqual('Lrubuffer[ maxSize = 64, hits = 2, misses = 0, hitRate = 100% ]')
    })

    /**
     * @tc.name   testLruBufferToString003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0090
     * @tc.desc   Returns a string representation of the object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer(100)
      that.put(1,2)
      that.put(3,10)
      that.put(5,15)
      that.put('abc',20)
      that.get(3)
      let result = that.toString()
      expect(result).assertEqual('Lrubuffer[ maxSize = 100, hits = 1, misses = 0, hitRate = 100% ]')
    })

    /**
     * @tc.name   testLruBufferToString004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0091
     * @tc.desc   Returns a string representation of the object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer(100)
      that.put(1,2)
      that.put(3,10)
      that.put(5,15)
      that.put('abc',20)
      that.get(3)
      that.get(2)
      let result = that.toString()
      expect(result).assertEqual('Lrubuffer[ maxSize = 100, hits = 1, misses = 1, hitRate = 50% ]')
    })

    /**
     * @tc.name   testLruBufferToString005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0092
     * @tc.desc   Returns a string representation of the object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer(100)
      that.put(1,2)
      that.put(3,10)
      that.put(5,15)
      that.put('abc',20)
      that.get(3)
      that.get(2)
      that.get(1)
      that.contains(5)
      let result = that.toString()
      expect(result).assertEqual('Lrubuffer[ maxSize = 100, hits = 3, misses = 1, hitRate = 75% ]')
    })

    /**
     * @tc.name   testLruBufferEntries001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0093
     * @tc.desc   Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferEntries001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put('string','abc')
      let i=0;
      let arr={};
      for (let entry of that.entries()) {
        arr[i]=entry[0];
        i++;
        arr[i]=entry[1];
        i++;
      }
      expect(arr[1]).assertEqual('abc');
    })

    /**
     * @tc.name   testLruBufferEntries002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0094
     * @tc.desc   Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferEntries002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(3,10)
      that.put(5,15)
      that.put('abc',20)
      let i=0;
      let arr={};
      for (let entry of that.entries()) {
        arr[i]=entry[0];
        i++;
        arr[i]=entry[1];
        i++;
      }
      expect(arr[1]).assertEqual(2);
    })

    /**
     * @tc.name   testLruBufferEntries003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0095
     * @tc.desc   Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferEntries003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(3,10)
      that.put(5,15)
      that.put('abc',20)
      that.get(3)
      let i=0;
      let arr={};
      for (let entry of that.entries()) {
        arr[i]=entry[0];
        i++;
        arr[i]=entry[1];
        i++;
      }
      expect(arr[0]).assertEqual(1);
    })

    /**
     * @tc.name   testLruBufferEntries004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0096
     * @tc.desc   Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferEntries004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(3,10)
      that.put(5,15)
      that.put('abc',20)
      that.get(3)
      that.contains(1)
      let i=0;
      let arr={};
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
     * @tc.name   testLruBufferEntries005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0097
     * @tc.desc   Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferEntries005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(3,10)
      that.put(5,15)
      that.put('abc',20)
      that.get(3)
      that.remove(5)
      that.contains(3)
      that.get(1)
      that.contains('abc')
      let i=0;
      let arr={};
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
     * @tc.name   testLruBufferSymboliterator001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0098
     * @tc.desc   Returns a two - dimensional array in the form of key - value pairs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferSymboliterator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put('string','abc')
      that.put('abc',20)
      let i=0;
      let arr= [];
      for (let entry of that[Symbol.iterator]()) {
        arr[i]=entry[0];
        i++;
        arr[i]=entry[1];
        i++;
      }
      expect(arr[1]).assertEqual('abc');
    })

    /**
     * @tc.name   testLruBufferSymboliterator002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0099
     * @tc.desc   Returns a two - dimensional array in the form of key - value pairs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferSymboliterator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(3,10)
      that.put(5,15)
      that.put('abc',20)
      let i=0;
      let arr={};
      for (let entry of that[Symbol.iterator]()) {
        arr[i]=entry[0];
        i++;
        arr[i]=entry[1];
        i++;
      }
      expect(arr[1]).assertEqual(2);
    })

    /**
     * @tc.name   testLruBufferSymboliterator003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0100
     * @tc.desc   Returns a two - dimensional array in the form of key - value pairs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferSymboliterator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(3,10)
      that.put(5,15)
      that.put('abc',20)
      that.get(3)
      let i=0;
      let arr={};
      for (let entry of that[Symbol.iterator]()) {
        arr[i]=entry[0];
        i++;
        arr[i]=entry[1];
        i++;
      }
      expect(arr[0]).assertEqual(1);
    })

    /**
     * @tc.name   testLruBufferSymboliterator004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0101
     * @tc.desc   Returns a two - dimensional array in the form of key - value pairs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferSymboliterator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(3,10)
      that.put(5,15)
      that.put('abc',20)
      that.get(3)
      that.contains(1)
      let i=0;
      let arr={};
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
     * @tc.name   testLruBufferSymboliterator005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0102
     * @tc.desc   Returns a two - dimensional array in the form of key - value pairs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferSymboliterator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.LruBuffer()
      that.put(1,2)
      that.put(3,10)
      that.put(5,15)
      that.put('abc',20)
      that.get(3)
      that.remove(5)
      that.contains(3)
      that.get(1)
      that.contains('abc')
      let i=0;
      let arr={};
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
     * @tc.name   testLruBufferAfterRemoval001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0103
     * @tc.desc   Executes subsequent operations after a value is deleted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferAfterRemoval001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let arr = [];
      class ChildLruBuffer extends util.LruBuffer
      {
        constructor()
        {
          super();
        }
        static getInstance()
        {
          return new ChildLruBuffer();
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
     * @tc.name   testLruBufferAfterRemoval002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0104
     * @tc.desc   Executes subsequent operations after a value is deleted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferAfterRemoval002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let arr = [];
      class ChildLruBuffer extends util.LruBuffer
      {
        constructor()
        {
          super();
        }
        static getInstance()
        {
          return new ChildLruBuffer();
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
     * @tc.name   testLruBufferAfterRemoval003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0105
     * @tc.desc   Executes subsequent operations after a value is deleted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferAfterRemoval003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let arr = [];
      class ChildLruBuffer extends util.LruBuffer
      {
        constructor()
        {
          super();
        }
        static getInstance()
        {
          return new ChildLruBuffer();
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
     * @tc.name   testLruBufferAfterRemoval004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0106
     * @tc.desc   Executes subsequent operations after a value is deleted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferAfterRemoval004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let arr = [];
      class ChildLruBuffer extends util.LruBuffer
      {
        constructor()
        {
          super();
        }
        static getInstance()
        {
          return new ChildLruBuffer();
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
     * @tc.name   testLruBufferAfterRemoval005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0107
     * @tc.desc   Executes subsequent operations after a value is deleted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferAfterRemoval005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let arr = [];
      class ChildLruBuffer extends util.LruBuffer
      {
        constructor()
        {
          super();
        }
        static getInstance()
        {
          return new ChildLruBuffer();
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
     * @tc.name   testLruBufferAfterRemoval006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0108
     * @tc.desc   Executes subsequent operations after a value is deleted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferAfterRemoval006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let arr = [];
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
      let that = new ChildLruBuffer(2);
      that.put(1,2)
      that.put(3,10)
      that.put('abc',20)
      expect(arr[1]).assertEqual(2)
    })

    /**
     * @tc.name   testLruBufferAfterRemoval007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_0109
     * @tc.desc   Executes subsequent operations after a value is deleted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferAfterRemoval007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let arr = [];
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
      let that = new ChildLruBuffer(3);
      that.put(1,2)
      that.put(3,10)
      that.put(1,8)
      expect(arr[2]).assertEqual(8)
    })

    /**
     * @tc.name   testLruBufferAfterRemoval008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UTIL_0110
     * @tc.desc   Executes subsequent operations after a value is deleted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferAfterRemoval008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let arrk = [];
      let arrv = [];
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
            arrk = Array.from(key);
            arrv = Array.from(value);
          }
        }
      }
      let that = new ChildLruBuffer(3);
      that.put(1,2)
      that.put(3,10)
      that.put(2,8)
      that.clear();
      expect(arrk[0]).assertEqual(1)
      expect(arrk[1]).assertEqual(3)
      expect(arrk[2]).assertEqual(2)
      expect(arrv[0]).assertEqual(2)
      expect(arrv[1]).assertEqual(10)
      expect(arrv[2]).assertEqual(8)
    })
  })

  describe('TypesTest', function() {

    /**
     * @tc.name   testIsAnyArrayBuffer001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0001
     * @tc.desc   Check whether the entered value is of arraybuffer or sharedarraybuffer type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsAnyArrayBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isAnyArrayBuffer(new ArrayBuffer(1));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsAnyArrayBuffer002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0002
     * @tc.desc   Check whether the entered value is of arraybuffer or sharedarraybuffer type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsAnyArrayBuffer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isAnyArrayBuffer(true);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsAnyArrayBuffer003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0003
     * @tc.desc   Check whether the entered value is of arraybuffer or sharedarraybuffer type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsAnyArrayBuffer003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isAnyArrayBuffer(false);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsAnyArrayBuffer004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0004
     * @tc.desc   Check whether the entered value is of arraybuffer or sharedarraybuffer type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsAnyArrayBuffer004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let buf = new ArrayBuffer(1);
      let result = proc.isAnyArrayBuffer(buf);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsAnyArrayBuffer005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0005
     * @tc.desc   Check whether the entered value is of arraybuffer or sharedarraybuffer type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsAnyArrayBuffer005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isAnyArrayBuffer(new Boolean(false));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsArrayBufferView001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0006
     * @tc.desc   Check whether the entered value is napi_ int8_ array or napi_ uint8_ array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArrayBufferView001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isArrayBufferView(new Int8Array([]));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsArrayBufferView002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0007
     * @tc.desc   Check whether the entered value is napi_ int8_ array or napi_ uint8_ array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArrayBufferView002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isArrayBufferView(new Int32Array([]));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsArrayBufferView003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0008
     * @tc.desc   Check whether the entered value is napi_ int8_ array or napi_ uint8_
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArrayBufferView003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isArrayBufferView(new DataView(new ArrayBuffer(16)));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsArrayBufferView004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0009
     * @tc.desc   Check whether the entered value is napi_ int8_ array or napi_ uint8_ array or naPi_ uint8_
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArrayBufferView004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isArrayBufferView(false);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsArrayBufferView005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0010
     * @tc.desc   Check whether the entered value is napi_ int8_ array or napi_ uint8_ array or naPi_ uint8_
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArrayBufferView005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isArrayBufferView(new Int16Array());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsArgumentsObject001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0011
     * @tc.desc   Check whether the entered value is an arguments object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArgumentsObject001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      function foo() {
        let result = proc.isArgumentsObject(arguments);
        expect(result).assertEqual(true);
      }
      let f = foo();
    })

    /**
     * @tc.name   testIsArgumentsObject002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0012
     * @tc.desc   Check whether the entered value is an arguments object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArgumentsObject002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isArgumentsObject(new Int8Array([]));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsArgumentsObject003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0013
     * @tc.desc   Check whether the entered value is an arguments object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArgumentsObject003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isArgumentsObject(true);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsArgumentsObject004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0014
     * @tc.desc   Check whether the entered value is an arguments object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArgumentsObject004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isArgumentsObject(false);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsArgumentsObject005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0015
     * @tc.desc   Check whether the entered value is an arguments object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArgumentsObject005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isArgumentsObject(new Boolean());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsArrayBuffer001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0016
     * @tc.desc   Check whether the entered value is of arraybuffer type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArrayBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isArrayBuffer(new ArrayBuffer(0));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsArrayBuffer002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0017
     * @tc.desc   Check whether the entered value is of arraybuffer type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArrayBuffer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isArrayBuffer(true);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsArrayBuffer003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0018
     * @tc.desc   Check whether the entered value is of arraybuffer type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArrayBuffer003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isArrayBuffer(false);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsArrayBuffer004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0019
     * @tc.desc   Check whether the entered value is of arraybuffer type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArrayBuffer004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isArrayBuffer(new Int8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsArrayBuffer005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0020
     * @tc.desc   Check whether the entered value is of arraybuffer type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArrayBuffer005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isArrayBuffer(new Int16Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsAsyncFunction001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0021
     * @tc.desc   Check whether the value entered is an asynchronous function type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsAsyncFunction001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isAsyncFunction(false);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsAsyncFunction002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0022
     * @tc.desc   Check whether the value entered is an asynchronous function type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsAsyncFunction002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isAsyncFunction(function foo() {});
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsAsyncFunction003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0023
     * @tc.desc   Check whether the value entered is an asynchronous function type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsAsyncFunction003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isAsyncFunction(new Int8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsAsyncFunction004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0024
     * @tc.desc   Check whether the value entered is an asynchronous function type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsAsyncFunction004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isAsyncFunction(true);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsBigInt64Array001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0025
     * @tc.desc   Check whether the entered value is of bigint64array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBigInt64Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isBigInt64Array(new BigInt64Array([]));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsBigInt64Array002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0026
     * @tc.desc   Check whether the entered value is of bigint64array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBigInt64Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isBigInt64Array(new Int32Array([]));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsBigInt64Array003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0027
     * @tc.desc   Check whether the entered value is of bigint64array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBigInt64Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isBigInt64Array(new Uint8Array([]));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsBigInt64Array004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0028
     * @tc.desc   Check whether the entered value is of bigint64array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBigInt64Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isBigInt64Array(new Float64Array([]));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsBigInt64Array005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0029
     * @tc.desc   Check whether the entered value is of bigint64array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBigInt64Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isBigInt64Array(new Int8Array([]));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsBigUint64Array001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0030
     * @tc.desc   Check whether the entered value is of biguint64array array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBigUint64Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isBigUint64Array(new BigUint64Array([]));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsBigUint64Array002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0031
     * @tc.desc   Check whether the entered value is of biguint64array array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBigUint64Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isBigUint64Array(new Int8Array([]));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsBigUint64Array003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0032
     * @tc.desc   Check whether the entered value is of biguint64array array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBigUint64Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isBigUint64Array(new Float64Array([]));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsBigUint64Array004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0033
     * @tc.desc   Check whether the entered value is of biguint64array array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBigUint64Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isBigUint64Array(new Uint8Array([]));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsBigUint64Array005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0034
     * @tc.desc   Check whether the entered value is of biguint64array array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBigUint64Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isBigUint64Array(new BigInt64Array([]));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsBigUint64Array006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0035
     * @tc.desc   Check whether the entered value is of biguint64array array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBigUint64Array006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isBigUint64Array(new Int8Array([]));
      expect(result).assertEqual(false);
    })


    /**
     * @tc.name   testIsBooleanObject001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0036
     * @tc.desc   Check whether the entered value is a Boolean object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBooleanObject001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isBooleanObject(new Boolean(false));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsBooleanObject002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0037
     * @tc.desc   Check whether the entered value is a Boolean object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBooleanObject002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isBooleanObject(new Boolean(true));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsBooleanObject003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0038
     * @tc.desc   Check whether the entered value is a Boolean object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBooleanObject003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isBooleanObject(true);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsBooleanObject004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0039
     * @tc.desc   Check whether the entered value is a Boolean object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBooleanObject004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isBooleanObject(false);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsBooleanObject005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0040
     * @tc.desc   Check whether the entered value is a Boolean object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBooleanObject005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isBooleanObject(Boolean(true));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsBoxedPrimitive001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0041
     * @tc.desc   Check whether the entered value is a Boolean or number or string or symbol object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBoxedPrimitive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isBoxedPrimitive(false);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsBoxedPrimitive002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0042
     * @tc.desc   Check whether the entered value is a Boolean or number or string or symbol object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBoxedPrimitive002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isBoxedPrimitive(new Boolean(false));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsBoxedPrimitive003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0043
     * @tc.desc   Check whether the entered value is a Boolean or number or string or symbol object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBoxedPrimitive003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isBoxedPrimitive(Symbol('foo'));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsBoxedPrimitive004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0044
     * @tc.desc   Check whether the entered value is a Boolean or number or string or symbol object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBoxedPrimitive004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isBoxedPrimitive(Object(Symbol('foo')));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsBoxedPrimitive005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0045
     * @tc.desc   Check whether the entered value is a Boolean or number or string or symbol object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBoxedPrimitive005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isBoxedPrimitive(new Boolean(true));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsDataView001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0046
     * @tc.desc   Check whether the entered value is of DataView type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsDataView001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      const ab = new ArrayBuffer(20);
      let result = proc.isDataView(new DataView(ab));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsDataView002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0047
     * @tc.desc   Check whether the entered value is of DataView type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsDataView002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isDataView(new Int8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsDataView003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0048
     * @tc.desc   Check whether the entered value is of DataView type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsDataView003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isDataView(new Float64Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsDataView004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0049
     * @tc.desc   Check whether the entered value is of DataView type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsDataView004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isDataView(true);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsDataView005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0050
     * @tc.desc   Check whether the entered value is of DataView type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsDataView005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isDataView(false);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsDate001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0051
     * @tc.desc   Check whether the entered value is of type date.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsDate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isDate(new Date());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsDate002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0052
     * @tc.desc   Check whether the entered value is of type date.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsDate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isDate(new Int8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsDate003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0053
     * @tc.desc   Check whether the entered value is of type date.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsDate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isDate(true);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsDate004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0054
     * @tc.desc   Check whether the entered value is of type date.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsDate004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isDate(new Int16Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsDate005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0055
     * @tc.desc   Check whether the entered value is of type date.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsDate005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isDate(new Float64Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsExternal001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0056
     * @tc.desc   Check whether the entered value is a native external value type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsExternal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isExternal(new Float32Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsExternal002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0057
     * @tc.desc   Check whether the entered value is a native external value type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsExternal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isExternal(new Int8Array([]));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsExternal003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0058
     * @tc.desc   Check whether the entered value is a native external value type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsExternal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isExternal(true);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsExternal004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0059
     * @tc.desc   Check whether the entered value is a native external value type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsExternal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isExternal(false);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsExternal005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0060
     * @tc.desc   Check whether the entered value is a native external value type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsExternal005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isExternal(new Int16Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsFloat32Array001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0061
     * @tc.desc   Check whether the entered value is of float32array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsFloat32Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isFloat32Array(new Float32Array());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsFloat32Array002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0062
     * @tc.desc   Check whether the entered value is of float32array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsFloat32Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isFloat32Array(new Int8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsFloat32Array003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0063
     * @tc.desc   Check whether the entered value is of float32array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsFloat32Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isFloat32Array(new Int16Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsFloat32Array004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0064
     * @tc.desc   Check whether the entered value is of float32array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsFloat32Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isFloat32Array(new Float64Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsFloat32Array005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0065
     * @tc.desc   Check whether the entered value is of float32array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsFloat32Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isFloat32Array(new Uint8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsFloat64Array001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0066
     * @tc.desc   Check whether the entered value is of float64array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsFloat64Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isFloat64Array(new Float64Array());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsFloat64Array002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0067
     * @tc.desc   Check whether the entered value is of float64array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsFloat64Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isFloat64Array(new Int8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsFloat64Array003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0068
     * @tc.desc   Check whether the entered value is of float64array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsFloat64Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isFloat64Array(new Float32Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsFloat64Array004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0069
     * @tc.desc   Check whether the entered value is of float64array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsFloat64Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isFloat64Array(new Uint8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsFloat64Array005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0070
     * @tc.desc   Check whether the entered value is of float64array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsFloat64Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isFloat64Array(new Int16Array([]));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsGeneratorFunction001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0071
     * @tc.desc   Check whether the input value is a generator function type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsGeneratorFunction001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isGeneratorFunction(new Int8Array());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsGeneratorFunction002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0072
     * @tc.desc   Check whether the input value is a generator function type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsGeneratorFunction002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isGeneratorFunction(function foo() {});
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsGeneratorFunction003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0073
     * @tc.desc   Check whether the input value is a generator function type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsGeneratorFunction003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isGeneratorFunction(true);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsGeneratorFunction004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0074
     * @tc.desc   Check whether the input value is a generator function type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsGeneratorFunction004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isGeneratorFunction(false);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsGeneratorObject001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0075
     * @tc.desc   Check whether the entered value is a generator object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsGeneratorObject001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isGeneratorObject(false);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsGeneratorObject002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0076
     * @tc.desc   Check whether the entered value is a generator object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsGeneratorObject002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isGeneratorObject(new Int8Array([]));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsGeneratorObject003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0077
     * @tc.desc   Check whether the entered value is a generator object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsGeneratorObject003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isGeneratorObject(new Int16Array([]));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsGeneratorObject004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0078
     * @tc.desc   Check whether the entered value is a generator object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsGeneratorObject004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isGeneratorObject(true);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsInt8Array001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0079
     * @tc.desc   Check whether the entered value is of int8array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt8Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isInt8Array(new Int8Array([]));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsInt8Array002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0080
     * @tc.desc   Check whether the entered value is of int8array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt8Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isInt8Array(new ArrayBuffer(0));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsInt8Array003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0081
     * @tc.desc   Check whether the entered value is of int8array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt8Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isInt8Array(new Int32Array([]));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsInt8Array004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0082
     * @tc.desc   Check whether the entered value is of int8array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt8Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isInt8Array(new Float64Array([]));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsInt8Array005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0083
     * @tc.desc   Check whether the entered value is of int8array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt8Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isInt8Array(new Uint8Array([]));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsInt16Array001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0084
     * @tc.desc   Check whether the entered value is the int16array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt16Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isInt16Array(new Int16Array([]));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsInt16Array002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0085
     * @tc.desc   Check whether the entered value is the int16array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt16Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isInt16Array(new Int8Array([]));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsInt16Array003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0086
     * @tc.desc   Check whether the entered value is the int16array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt16Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isInt16Array(new Int32Array([]));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsInt16Array004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0087
     * @tc.desc   Check whether the entered value is the int16array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt16Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isInt16Array(new Uint8Array([]));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsInt16Array005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0088
     * @tc.desc   Check whether the entered value is the int16array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt16Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isInt16Array(new Float64Array([]));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsInt32Array001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0089
     * @tc.desc   Check whether the entered value is the int32array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt32Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isInt32Array(new Int32Array([]));
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsInt32Array002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0090
     * @tc.desc   Check whether the entered value is the int32array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt32Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isInt32Array(new Int8Array([]));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsInt32Array003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0091
     * @tc.desc   Check whether the entered value is the int32array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt32Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isInt32Array(new Int16Array([]));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsInt32Array004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0092
     * @tc.desc   Check whether the entered value is the int32array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt32Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isInt32Array(new Float64Array([]));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsInt32Array005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0093
     * @tc.desc   Check whether the entered value is the int32array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt32Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isInt32Array(new Uint8Array([]));
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsMap001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0094
     * @tc.desc   Check whether the entered value is of map type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isMap(new Map());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsMap002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0095
     * @tc.desc   Check whether the entered value is of map type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsMap002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isMap(new Set());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsMap003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0096
     * @tc.desc   Check whether the entered value is of map type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsMap003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isMap(new String());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsMap004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0097
     * @tc.desc   Check whether the entered value is of map type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsMap004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isMap(new Object());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsMap005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0098
     * @tc.desc   Check whether the entered value is of map type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsMap005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isMap(new Boolean());
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsMapIterator001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0099
     * @tc.desc   Check whether the entered value is the iterator type of map.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsMapIterator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      const map = new Map();
      let result = proc.isMapIterator(map.keys());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsMapIterator002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0100
     * @tc.desc   Check whether the entered value is the iterator type of map.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsMapIterator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      const map = new Map();
      let result = proc.isMapIterator(map.values());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsMapIterator003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0101
     * @tc.desc   Check whether the entered value is the iterator type of map.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsMapIterator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      const map = new Map();
      let result = proc.isMapIterator(map.entries());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsMapIterator004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0102
     * @tc.desc   Check whether the entered value is the iterator type of map.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsMapIterator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      const map = new Map();
      let result = proc.isMapIterator(map[Symbol.iterator]());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsMapIterator005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0103
     * @tc.desc   Check whether the entered value is the iterator type of map.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsMapIterator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      const map = new Map();
      let result = proc.isMapIterator(map);
      expect(result).assertEqual(false);
    })


    /**
     * @tc.name   testIsModuleNamespaceObject002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0104
     * @tc.desc   Check whether the entered value is the module namespace object object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsModuleNamespaceObject002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isModuleNamespaceObject(url);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsModuleNamespaceObject003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0105
     * @tc.desc   Check whether the entered value is the module namespace object object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsModuleNamespaceObject003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isModuleNamespaceObject(file);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsModuleNamespaceObject004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0106
     * @tc.desc   Check whether the entered value is the module namespace object object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsModuleNamespaceObject004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isModuleNamespaceObject(process);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsModuleNamespaceObject005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0107
     * @tc.desc   Check whether the entered value is the module namespace object object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsModuleNamespaceObject005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isModuleNamespaceObject(app);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsNativeError001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0108
     * @tc.desc   Check whether the value entered is of type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsNativeError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isNativeError(new TypeError());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsNativeError002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0109
     * @tc.desc   Check whether the value entered is of type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsNativeError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isNativeError(new Error());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsNativeError003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0110
     * @tc.desc   Check whether the value entered is of type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsNativeError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isNativeError(new RangeError());
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testIsNativeError004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0111
     * @tc.desc   Check whether the value entered is of type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsNativeError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isNativeError(true);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testIsNativeError005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_0112
     * @tc.desc   Check whether the value entered is of type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsNativeError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let proc = new util.types();
      let result = proc.isNativeError(false);
      expect(result).assertEqual(false);
    })
  })

  describe('AspectTest', function() {

    /**
     * @tc.name   testAddBefore001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0001
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let res1 = ""
      let res2 = 0;
      util.Aspect.addBefore(MyClass, 'foo', false,  (instance, arg1, arg2) =>{
        instance.myFunc('intMsg');
        res1 = arg1;
        res2 = arg2;
      });
      let asp = new MyClass();
      let result = asp.foo('123', 111);
      expect(res1).assertEqual('123');
      expect(res2).assertEqual(111);
      expect(result).assertEqual('intMsg');
    })

    /**
     * @tc.name   testAddBefore002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0002
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let res1 = 0;
      let res2 = "";
      util.Aspect.addBefore(MyClass, 'bar', true, (MyClass, arg1) =>{
        res1 = arg1;
        res2 = new MyClass().msg;
      });
      let asp =  MyClass.bar(6);
      expect(res1).assertEqual(6);
      expect(res2).assertEqual('msg123');
      expect(asp).assertEqual('data');
    })

    /**
     * @tc.name   testAddBefore003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0003
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let res = 0;
      util.Aspect.addBefore(MyClass, 'bar', true, (This, arg1) =>{
        res = arg1;
        Reflect.set(This, 'buffer', 'intData');
      });
      let asp =  MyClass.bar(6);
      expect(res).assertEqual(6);
      expect(asp).assertEqual('intData');
    })

    /**
     * @tc.name   testAddBefore004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0004
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
      util.Aspect.addBefore(MyClass, 'myAsync', false, (This, arg1) =>{
        Reflect.set(This, 'msg', 'intMsg');
        expect(arg1).assertEqual('456');
        expect(This.msg).assertEqual('intMsg');
      });
      let asp = new MyClass();
      let res = await asp.myAsync('456')
      expect(res).assertEqual('456');
      expect(asp.msg).assertEqual('intMsg');

    })

    /**
     * @tc.name   testAddBefore005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0005
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
      util.Aspect.addBefore(MyClass, 'beforeAsync', false, (MyClass, arg1) =>{
        expect(arg1).assertEqual('123');
      });
      let asp = new MyClass();
      let res = await asp.beforeAsync('123')
      expect(res).assertEqual('123');
    })

    /**
     * @tc.name   testAddBefore006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0006
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try{
        util.Aspect.addBefore(MyClass, 'printFunc', false, () => {});
        let asp = new MyClass();
        let result = asp.func('111');
      } catch(e) {
        expect(e.message).assertEqual(`Parameter error. The type of printFunc must be a method of targetClass`);
      }
    })

    /**
     * @tc.name   testAddBefore007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0007
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try{
        util.Aspect.addBefore(MyClass, 123, false, () =>{
        });
        let asp = new MyClass();
        let result = asp.func('111');
      } catch(e) {
        expect(e.message).assertEqual(`Parameter error. The type of 123 must be string`);
      }
    })

    /**
     * @tc.name   testAddBefore008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0008
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.addBefore(MyClass, 'printData', true, (This, arg1, arg2) =>{
        Reflect.set(This, 'buffer', 'intData');
        return Promise.resolve(100);
      });
      MyClass.printData('456').then((res) => {
        expect(res).assertEqual(0);
        expect(MyClass.buffer).assertEqual('intData');
      });
    })

    /**
     * @tc.name   testAddBefore009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0009
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.addBefore(MyClass, 'myFoo', false, (This, arg1) =>{
        expect(arg1).assertEqual(undefined);
        expect(This.msg).assertEqual('msg123');
      });
      let asp = new MyClass();
      let result = asp.myFoo();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testAddBefore010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0010
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.addBefore(MyClass, 'getBar', true,  (This, arg1) =>{
        expect(arg1).assertEqual(6);
      });
      util.Aspect.addBefore(MyClass, 'getBar', true,  (This, arg2) =>{
        expect(arg2).assertEqual(6);
      });
      util.Aspect.addBefore(MyClass, 'getBar', true,  (This, arg3) =>{
        expect(arg3).assertEqual(6);
      });
      let asp = MyClass.getBar(6);
      expect(asp).assertEqual('strData');
    })

    /**
     * @tc.name   testAddBefore011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0011
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.addBefore(MyClassBase, 'setMethod', false,  (MyClassBase, arg) =>{
        expect(arg).assertEqual(123);
      });
      let asp = new MyClass();
      let result = asp.setMethod(123);
      expect(result).assertEqual(223);
    })

    /**
     * @tc.name   testAddBefore012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0012
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.addBefore(MyClassBase, 'setData', false,  (MyClassBase, arg) =>{
        MyClassBase.setBase('intDataBase');
        expect(arg).assertEqual(100);
      });
      let asp = new MyClass();
      let result = asp.setData(100);
      expect(result).assertEqual(102);
      expect(asp.baseBuffer).assertEqual('intDataBase');
    })

    /**
     * @tc.name   testAddBefore013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0013
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.addBefore(MyClass, 'foo', false,  (MyClass, arg1, arg2) =>{
        MyClass.myFunc('intMsg');
        expect(arg1).assertEqual('123');
        expect(arg2).assertEqual(111);
      });
      util.Aspect.addAfter(MyClass, 'foo', false,  (MyClass, arg1, arg2) =>{
        expect(arg1).assertEqual('intMsg');
        expect(arg2).assertEqual('123');
        return 0;
      });
      let asp = new MyClass();
      let result = asp.foo('123', 111);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testAddBefore014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0014
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let asp = new MyClass();
      expect(asp.myBeforeAsync.constructor.name).assertEqual('AsyncFunction');
      util.Aspect.addBefore(MyClass, 'myBeforeAsync', false, (This, arg1, arg2) =>{
        expect(arg1).assertEqual('string');
        expect(arg2).assertEqual(undefined);
        expect(This.msg).assertEqual('msg123');
      });
      asp.myBeforeAsync('string')
      expect(asp.myBeforeAsync.constructor.name).assertEqual('AsyncFunction');
    })

    /**
     * @tc.name   testAddBefore015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0015
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.addBefore(MyClass, 'foo', false,  (MyClass, arg1, arg2) =>{
        MyClass.myFunc('intMsg');
        return 100;
      });
      util.Aspect.replace(MyClass, 'foo', false,  (MyClass, arg1, arg2) =>{
        expect(arg1).assertEqual('123');
        expect(arg2).assertEqual(111);
        return 0;
      });
      let asp = new MyClass();
      let result = asp.foo('123', 111);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testAddAfter001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0016
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.addAfter(AfterClass, 'foo', false,  (AfterClass, arg1, arg2) =>{
        AfterClass.myFunc('intMsg');
        expect(arg1).assertEqual('msg123');
        expect(arg2).assertEqual('123');
      });
      let asp = new AfterClass();
      let result = asp.foo('123', 111);
      expect(result).assertEqual(undefined);
    })

    /**
     * @tc.name   testAddAfter002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0017
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.addAfter(AfterClass, 'getData', false,  (This, arg1, arg2) =>{
        This.msg = 'intMsg';
        expect(arg1).assertEqual(0);
        expect(arg2).assertEqual('123');
        return arg1 + 100;
      });
      let asp = new AfterClass();
      let result = asp.getData('123');
      expect(result).assertEqual(100);
      expect(asp.msg).assertEqual('intMsg');
    })

    /**
     * @tc.name   testAddAfter003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0018
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.addAfter(AfterClass, 'bar', true, (This, arg1) =>{
        expect(arg1).assertEqual('data');
        Reflect.set(This, 'buffer', 'intData');
      });
      let asp =  AfterClass.bar(6);
      expect(asp).assertEqual(undefined);
    })

    /**
     * @tc.name   testAddAfter004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0019
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.addAfter(AfterClass, 'myAsync', false, (This, ret, arg) =>{
        expect(arg).assertEqual('123');
        expect(This.msg).assertEqual('msg123');
        expect(ret instanceof Promise).assertTrue();
      });
      let asp = new AfterClass();
      asp.myAsync('123')
    })

    /**
     * @tc.name   testAddAfter005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0020
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.addAfter(AfterClass, 'afterAsync', false, (This, arg1) =>{
        Reflect.set(This, 'msg', 'intMsg');
        expect(This.msg).assertEqual('intMsg');
      });
      let asp = new AfterClass();
      asp.afterAsync('456');
    })

    /**
     * @tc.name   testAddAfter006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0021
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try{
        util.Aspect.addAfter(AfterClass, 'printFunc', false, () =>{
        });
        let asp = new AfterClass();
        let result = asp.func('111');
      } catch(e) {
        expect(e.message).assertEqual(`Parameter error. The type of printFunc must be a method of targetClass`);
      }
    })

    /**
     * @tc.name   testAddAfter007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0022
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try{
        util.Aspect.addAfter(AfterClass, 'func', 123, () =>{
        });
        let asp = new AfterClass();
        let result = asp.func('111');
      } catch(e) {
        expect(e.message).assertEqual(`Parameter error. The type of 123 must be boolean`);
      }
    })

    /**
     * @tc.name   testAddAfter008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0023
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.addAfter(AfterClass, 'printData', true, (This, arg1, arg2) =>{
        Reflect.set(This, 'buffer', 'intData');
        expect(arg2).assertEqual('456');
        return Promise.resolve(100);
      });
      AfterClass.printData('456').then((res) => {
        expect(res).assertEqual(100);
        expect(AfterClass.buffer).assertEqual('intData');
      });
    })

    /**
     * @tc.name   testAddAfter009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0024
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.addAfter(AfterClass, 'myFoo', false, (This, arg1) =>{
        expect(arg1).assertEqual(0);
        expect(This.msg).assertEqual('msg123');
        return 6;
      });
      let asp = new AfterClass();
      let result = asp.myFoo();
      expect(result).assertEqual(6);
    })

    /**
     * @tc.name   testAddAfter010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0025
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.addAfter(AfterClass, 'getBar', true,  (This, arg1) =>{
        expect(arg1).assertEqual('strData');
      });
      util.Aspect.addAfter(AfterClass, 'getBar', true,  (This, arg2) =>{
        expect(arg2).assertEqual(undefined);
      });
      util.Aspect.addAfter(AfterClass, 'getBar', true,  (This, arg3) =>{
        expect(arg3).assertEqual(undefined);
      });
      let asp = AfterClass.getBar(6);
      expect(asp).assertEqual(undefined);
    })

    /**
     * @tc.name   testAddAfter011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0026
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.addAfter(AfterClass, 'setMethod', false,  (MyClassBase, arg) =>{
        expect(arg).assertEqual(223);
      });
      let asp = new AfterClass();
      let result = asp.setMethod(123);
      expect(result).assertEqual(undefined);
    })

    /**
     * @tc.name   testAddAfter012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0027
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.addAfter(MyClassBase, 'setData', false,  (MyClassBase, arg) =>{
        MyClassBase.setBuffer('intDataBase');
        expect(arg).assertEqual(102);
        return 0;
      });
      let asp = new AfterClass();
      let result = asp.setData(100);
      expect(result).assertEqual(0);
      expect(asp.strBuffer).assertEqual('intDataBase');
    })

    /**
     * @tc.name   testAddAfter013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0028
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.addAfter(AfterClass, 'afterFoo', false,  (AfterClass, arg1, arg2) =>{
        AfterClass.afterFunc('intMessage');
        expect(arg1).assertEqual('messageData');
        expect(arg2).assertEqual('123');
        return 0;
      });
      util.Aspect.addBefore(AfterClass, 'afterFoo', false,  (AfterClass, arg1, arg2) =>{
        expect(arg1).assertEqual('123');
        expect(arg2).assertEqual(111);
        return 100;
      });
      let asp = new AfterClass();
      let result = asp.afterFoo('123', 111);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testAddAfter014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0029
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.addAfter(MyClass, 'foo', false,  (MyClass, arg1, arg2) =>{
        MyClass.myFunc('intMsg');
        return 0;
      });
      util.Aspect.replace(MyClass, 'foo', false,  (MyClass, arg1, arg2) =>{
        expect(arg1).assertEqual('123');
        expect(arg2).assertEqual(111);
        return 100;
      });
      let asp = new MyClass();
      let result = asp.foo('123', 111);
      expect(result).assertEqual(100);
    })

    /**
     * @tc.name   testAddAfter015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0030
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let asp = new AfterClass();
      expect(asp.myAfterAsync.constructor.name).assertEqual('AsyncFunction');
      util.Aspect.addAfter(AfterClass, 'myAfterAsync', false, (This, ret, arg) =>{
        expect(arg).assertEqual('str');
        expect(This.msg).assertEqual('msg123');
        expect(ret instanceof Promise).assertTrue();
      });
      asp.myAfterAsync('str')
      expect(asp.myAfterAsync.constructor.name).assertEqual('AsyncFunction');
    })

    /**
     * @tc.name   testReplace001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0031
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.replace(ReplaceClass, 'foo', false,  (ReplaceClass, arg1, arg2) =>{
        ReplaceClass.myFunc('intMsg');
        expect(arg1).assertEqual('123');
        expect(arg2).assertEqual(111);
        return 100;
      });
      let asp = new ReplaceClass();
      let result = asp.foo('123', 111);
      expect(result).assertEqual(100);
    })

    /**
     * @tc.name   testReplace002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0032
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.replace(ReplaceClass, 'getData', false,  (This, arg1, arg2) =>{
        This.msg = 'intMsg';
        expect(arg1).assertEqual('123');
        expect(arg2).assertEqual(undefined);
        return 100;
      });
      let asp = new ReplaceClass();
      let result = asp.getData('123');
      expect(result).assertEqual(100);
      expect(asp.msg).assertEqual('intMsg');
    })

    /**
     * @tc.name   testReplace003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0033
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.replace(ReplaceClass, 'bar', true, (This, arg1) =>{
        expect(arg1).assertEqual(6);
        Reflect.set(This, 'buffer', 'intData');
      });
      let asp =  ReplaceClass.bar(6);
      expect(asp).assertEqual(undefined);
    })

    /**
     * @tc.name   testReplace004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0034
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.replace(ReplaceClass, 'bar', true, (This, arg1) =>{
        expect(arg1).assertEqual(6);
        Reflect.set(This, 'buffer', 'intData');
        return 100;
      });
      let asp =  ReplaceClass.bar(6);
      expect(asp).assertEqual(100);
      expect(ReplaceClass.buffer).assertEqual('intData');
    })

    /**
     * @tc.name   testReplace005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0035
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.replace(ReplaceClass, 'myAsync', false, (MyClass, arg1) =>{
        expect(arg1).assertEqual('123');
      });
      let asp = new ReplaceClass();
      let result = asp.myAsync('123');
    })

    /**
     * @tc.name   testReplace006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0036
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let original = ReplaceClass.getBar;
      util.Aspect.replace(ReplaceClass, 'getBar', true, (This, arg) =>{
        expect(arg).assertEqual(6);
        return 100;
      });
      let asp =  ReplaceClass.getBar(6);
      expect(asp).assertEqual(100);
      util.Aspect.replace(ReplaceClass, 'getBar', true, (This, arg1) =>{
        expect(arg1).assertEqual(6);
        return original(arg1);
      });
      let result =  ReplaceClass.getBar(6);
      expect(result).assertEqual('strData');
    })

    /**
     * @tc.name   testReplace007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0037
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.replace(ReplaceClass, 'myAsync', false, (This, arg1) =>{
        Reflect.set(This, 'msg', 'intMsg');
        expect(arg1).assertEqual('456')
        expect(This.msg).assertEqual('intMsg');
      });
      let asp = new ReplaceClass();
      asp.myAsync('456');
    })

    /**
     * @tc.name   testReplace008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0038
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.replace(ReplaceClass, 'printData', true, (This, arg) =>{
        Reflect.set(This, 'buffer', 'intData');
        expect(arg).assertEqual('456');
        return Promise.resolve(100);
      });
      ReplaceClass.printData('456').then((res) => {
        expect(res).assertEqual(100);
        expect(ReplaceClass.buffer).assertEqual('intData');
      });
    })

    /**
     * @tc.name   testReplace009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0039
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try{
        util.Aspect.replace(ReplaceClass, 'printFunc', false, () =>{
        });
        let asp = new ReplaceClass();
        let result = asp.func('111');
      } catch(e) {
        expect(e.message).assertEqual(`Parameter error. The type of printFunc must be a method of targetClass`);
      }
    })

    /**
     * @tc.name   testReplace010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0040
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      try{
        util.Aspect.replace(ReplaceClass, 'func', 123, () =>{
        });
        let asp = new ReplaceClass();
        let result = asp.func('111');
      } catch(e) {
        expect(e.message).assertEqual(`Parameter error. The type of 123 must be boolean`);
      }
    })

    /**
     * @tc.name   testReplace011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0041
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.replace(ReplaceClass, 'myFoo', false, (This, arg1) =>{
        expect(arg1).assertEqual(undefined);
        expect(This.msg).assertEqual('msg123');
        return 6;
      });
      let asp = new ReplaceClass();
      let result = asp.myFoo();
      expect(result).assertEqual(6);
    })

    /**
     * @tc.name   testReplace012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0042
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.replace(ReplaceClass, 'bar', true,  (This, arg1) =>{
        expect(arg1).assertEqual('data');
      });
      util.Aspect.replace(ReplaceClass, 'bar', true,  (This, arg2) =>{
        expect(arg2).assertEqual(6);
      });
      util.Aspect.replace(ReplaceClass, 'bar', true,  (This, arg3) =>{
        expect(arg3).assertEqual(6);
      });
      let asp = ReplaceClass.bar(6);
      expect(asp).assertEqual(undefined);
    })

    /**
     * @tc.name   testReplace013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0043
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.replace(ReplaceClass, 'setMethod', false,  (MyClassBase, arg) =>{
        expect(arg).assertEqual(10);
      });
      let asp = new ReplaceClass();
      let result = asp.setMethod(10);
      expect(result).assertEqual(undefined);
    })

    /**
     * @tc.name   testReplace014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0044
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.replace(MyClassBase, 'setData', false,  (MyClassBase, arg) =>{
        MyClassBase.setBuffer('intDataBase');
        expect(arg).assertEqual(100);
        return 0;
      });
      let asp = new ReplaceClass();
      let result = asp.setData(100);
      expect(result).assertEqual(0);
      expect(asp.strBuffer).assertEqual('intDataBase');
    })

    /**
     * @tc.name   testReplace015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0045
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.replace(ReplaceClass, 'foo', false,  (MyClass, arg1, arg2) =>{
        MyClass.myFunc('intMsg');
        expect(arg1).assertEqual('123');
        expect(arg2).assertEqual(111);
        return 0;
      });
      util.Aspect.addBefore(ReplaceClass, 'foo', false,  (MyClass, arg1, arg2) =>{
        expect(arg1).assertEqual('123');
        expect(arg2).assertEqual(111);
        return 100;
      });
      let asp = new ReplaceClass();
      let result = asp.foo('123', 111);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testReplace016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0046
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      util.Aspect.replace(ReplaceClass, 'foo', false,  (ReplaceClass, arg1, arg2) =>{
        ReplaceClass.myFunc('intMsg');
        expect(arg1).assertEqual('123');
        expect(arg2).assertEqual(111);
        return 0;
      });
      util.Aspect.addAfter(ReplaceClass, 'foo', false,  (ReplaceClass, arg1, arg2) =>{
        expect(arg1).assertEqual(0);
        expect(arg2).assertEqual('123');
        return 100;
      });
      let asp = new ReplaceClass();
      let result = asp.foo('123', 111);
      expect(result).assertEqual(100);
    })

    /**
     * @tc.name   testReplace017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_0047
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let asp = new ReplaceClass();
      expect(asp.replaceAsync.constructor.name).assertEqual('AsyncFunction');
      util.Aspect.replace(ReplaceClass, 'replaceAsync', false, (This, arg1) =>{
        Reflect.set(This, 'msg', 'intMsg');
        expect(arg1).assertEqual('123')
        expect(This.msg).assertEqual('intMsg');
      });
      asp.replaceAsync('123');
      expect(asp.replaceAsync.constructor.name).assertEqual('AsyncFunction');
    })

    /**
     * @tc.name   testTextencoderencoding_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0001
     * @tc.desc   Encoding format test gB2313.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextencoderencoding_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let that = new util.TextEncoder('gB2312')
      let str = that.encoding
      expect(str).assertEqual('gB2312')

      that = new util.TextEncoder('Gb2312')
      str = that.encoding;
      expect(str).assertEqual('Gb2312')
    })

  /**
   * @tc.name   testTextencoderencoding_002
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0002
   * @tc.desc   Encoding format test utf-16le.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testTextencoderencoding_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let that = new util.TextEncoder('utf-16le')
    let str = that.encoding
    expect(str).assertEqual('utf-16le')

    that = new util.TextEncoder('Utf-16le')
    str = that.encoding;
    expect(str).assertEqual('Utf-16le')
  })

  /**
   * @tc.name   testTextencoderencoding_003
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0003
   * @tc.desc   Encoding format test GbK.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testTextencoderencoding_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let that = new util.TextEncoder('GbK')
    let str = that.encoding
    expect(str).assertEqual('GbK')

    that = new util.TextEncoder('GBK')
    str = that.encoding;
    expect(str).assertEqual('GBK')
  })

  /**
   * @tc.name   testTextencoderencoding_004
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0004
   * @tc.desc   Encoding format test UTF-16le.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testTextencoderencoding_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let that = new util.TextEncoder('UTF-16le')
    let str = that.encoding
    expect(str).assertEqual('UTF-16le')

    that = new util.TextEncoder('Utf-16le')
    str = that.encoding;
    expect(str).assertEqual('Utf-16le')
  })

  /**
   * @tc.name   testTextencoderencoding_005
   * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0005
   * @tc.desc   Encoding format test ISO-8859-3/IBM866.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('testTextencoderencoding_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
    let that = new util.TextEncoder('ISO-8859-3')
    let str = that.encoding
    expect(str).assertEqual('ISO-8859-3')

    that = new util.TextEncoder('IBM866')
    str = that.encoding;
    expect(str).assertEqual('IBM866')
  })
  })

  describe('AutoFinalizerTest', function () {
    /**
     * @tc.name   testAutoFinalizer_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_AUTO_FINALIZER_0001
     * @tc.desc   Auto finalizer test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAutoFinalizer_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      const originalFR = FinalizationRegistry;
      let gc, heldValue;
      try {
        FinalizationRegistry = class {
          constructor(cb) {
            gc = cb;
          }
          register(obj, val) {
            heldValue = val;
          }
        };
        new DeviceManageViewModel('test');
        gc(heldValue);
        expect(DeviceManageViewModel.ans).assertEqual('test');
      } finally {
        FinalizationRegistry = originalFR;
      }
    })
  })
}
