/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:// www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import display from '@ohos.display'
import file from '@system.file';

async function asyncTest() {
    return 1;
}

class TestClass {
    async asyncFunction() {
        return 2;
    }
}

export default function softwareJsTest() {
    describe('SoftwareJsTest', function () {
      
        /**
         * @tc.name   testJsAsyncAwait0100
         * @tc.number STD-SOFTWARE-0200
         * @tc.desc   【STD-SOFTWARE-0200】为了方便应用的书写，JS 运行时必须支持 ES2017 中的async/await 特性
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testJsAsyncAwait0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let res1 = await asyncTest()
            expect(res1).assertEqual(1)
            let testClass = new TestClass()
            let res2 = await testClass.asyncFunction()
            expect(res2).assertEqual(2)
            done()
        })

        /**
         * @tc.name   testJsES50100
         * @tc.number G-SOFTWARE-0301
         * @tc.desc   【G-SOFTWARE-0301】JS 运行时支持 ES5、ES6 语法规范
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testJsES50100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            // ES5
            var array = [1, 2, 3, 4, 5, 6]
            expect(Array.isArray(array)).assertTrue()
            var arraymap = array.map(function (value) {
                return value -= 1
            })
            arraymap.forEach(function (index, value) {
                expect(value).assertEqual(index)
            })
            var arrayfilter = array.filter(function (item) {
                return item < 4
            })
            expect(arrayfilter.length).assertEqual(3)
            var sum = array.reduce(function (sum, value) {
                return sum + value;
            }, 0)
            expect(sum).assertEqual(21)
            var res1 = array.every(function (value) {
                return value < 4
            })
            expect(res1).assertFalse()
            var res2 = array.some(function (value) {
                return value < 4
            })
            expect(res2).assertTrue()
            expect(array.indexOf(2)).assertEqual(1)
            expect(array.lastIndexOf(5)).assertEqual(4)
            var jsonObj = {
                "str": "str", "num": 0
            }
            var jsonStr = JSON.stringify(jsonObj)
            expect(jsonStr).assertEqual('{"str":"str","num":0}')
            var jsonObj2 = JSON.parse(jsonStr)
            var str = "  test  "
            expect(str.trim()).assertEqual("test")
            var obj = {
                a: 1, b: 2, c: 3
            }
            expect(Object.keys(obj).toString()).assertEqual("a,b,c")
            expect(Object.values(obj).toString()).assertEqual("1,2,3")
            Object.defineProperty(obj, "c", {
                writable: false,
                value: 4,
            })
            expect(obj.c).assertEqual(4)
            done()
        })

        /**
         * @tc.name   testJsES60100
         * @tc.number G-SOFTWARE-0301
         * @tc.desc   【G-SOFTWARE-0301】JS 运行时支持 ES5、ES6 语法规范
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testJsES60100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            const num1 = 1
            let num2 = 1
            expect(num1).assertEqual(num2)
            const sumFunc = (num1, num2) => num1 + num2
            console.log("sssss %d", sumFunc(num1, num2))
            expect(sumFunc(num1, num2)).assertEqual(2)
            expect(`num1 = ${num1}`).assertEqual("num1 = 1")
            var obj = {
                a: 1, b: 2, c: 3
            }
            var { a, b, c } = obj
            expect(a).assertEqual(1)
            var array1 = [1, 2, 3]
            var array2 = [4, 5, 6]
            var array3 = [...array1, ...array2]
            expect(array3.length).assertEqual(6)
            var i = 1
            for (const num of array1) {
                expect(num).assertEqual(i)
                i++
            }
            expect(array1.includes(1)).assertTrue()
            var map = new Map([['a', 1], ['b', 2], ['c', 3]])
            expect(map.get('a')).assertEqual(1)
            const set = new Set([1, 2, 3])
            expect(set.has(1)).assertTrue()
            var obj1 = { a: 1 }
            var obj2 = { b: 2 }
            var obj3 = Object.assign({}, obj1, obj2)
            expect(obj3.a).assertEqual(1)
            expect(obj3.b).assertEqual(2)
            done()
        })

        /**
         * @tc.name   testJsStrictMode0100
         * @tc.number G-SOFTWARE-0302
         * @tc.desc   【G-SOFTWARE-0302】JS 运行时环境必须运行在严格模式
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testJsStrictMode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            expect(this).assertUndefined()
            done()
        })

        /**
         * @tc.name   testWeblikeAccessPath0100
         * @tc.number G-SOFTWARE-0603
         * @tc.desc   【G-SOFTWARE-0603】类 web 范式限制应用访问的绝对路径应统一用"/"开头、相对路径统一用"./"或"../"开头
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testWeblikeAccessPath0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let driver = Driver.create()
            await driver.delayMs(2000)
            file.readText({
                uri: 'internal://app/result.txt',
                success: function (data) {
                    let result = data.text
                    console.info('read file success. result = ' + result);
                    expect(result).assertContain('AbsolutionPathSuccess')
                    expect(result).assertContain('RelativePath1Success')
                    expect(result).assertContain('RelativePath2Success')
                    expect(result.includes('RelativePath3Success')).assertFalse()
                },
                fail: function (data, code) {
                    console.error('read file fail , code: ' + code + ', data: ' + data);
                },
            })
            await driver.delayMs(2000)
            done()
        })

        /**
         * @tc.name   testWeblikePrivateDirectoryPath0100
         * @tc.number G-SOFTWARE-0604
         * @tc.desc   【G-SOFTWARE-0604】类 web 范式限制应用私有目录的路径前缀应为 internal://app/，
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testWeblikePrivateDirectoryPath0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let driver = Driver.create()
            await driver.delayMs(2000)
            let result = ""
            file.readText({
                uri: 'internal://app/test.txt',
                success: function (data) {
                    result = data.text
                    console.info('read file success. result = ' + result);
                    expect(result).assertEqual('test text')
                },
                fail: function (data, code) {
                    console.error('read file fail , code: ' + code + ', data: ' + data);
                },
            })
            await driver.delayMs(2000)
            done()
        })
    })
}
