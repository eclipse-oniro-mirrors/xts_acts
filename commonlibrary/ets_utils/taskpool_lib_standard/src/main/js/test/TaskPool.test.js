/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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
import taskpool from '@ohos.taskpool'
export default function TaskPoolTest() {
describe('ActsAbilityTest', function () {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.

    function promiseCase() {
        let p = new Promise(function (resolve, reject) {
            setTimeout(function () {
                resolve()
            }, 100)
        }).then(undefined, (error) => {
        })
        return p
    }

    it('TaskPoolTestClass001', 0,  async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        var result = await taskpool.execute(Sum, 10, 20);
        expect(result).assertEqual(30);
        done();
    })

    it('TaskPoolTestClass002', 0,  async function (done) {
        function Add(value1, value2) {
            "use concurrent"
            if (value1 & value2)
                return true;
            else
                return false;
        }
        var result = await taskpool.execute(Add, true, true);
        expect(result).assertEqual(true);
        done();
    })

    it('TaskPoolTestClass003', 0,  async function (done) {
        function StrCat(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        var result = await taskpool.execute(StrCat, "abc", "def");
        expect(result).assertEqual("abcdef");
        done();
    })

    it('TaskPoolTestClass004', 0,  async function (done) {
        function StrCat(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        var result = await taskpool.execute(StrCat, "abc", "def");
        result = await taskpool.execute(StrCat, "abc", "def");
        expect(result).assertEqual("abcdef");
        done();
    })

    it('TaskPoolTestClass005', 0,  async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            function StrCat(value1, value2) {
                return value1 + value2;
            }
            return value1+StrCat(value2,"hello");
        }
        var result = await taskpool.execute(Sum, "abc", "def");
        expect(result).assertEqual("abcdefhello");
        done();
    })

    it('TaskPoolTestClass006', 0,  async function (done) {
        function Sum(arg1, arg2) {
            "use concurrent"
            let value = [];
            value[0] = arg1[0] + arg2[0];
            value[1] = arg1[1] + arg2[1];
            return value;
        }
        var result = await taskpool.execute(Sum, [1,2], [3,4]);
        expect(result[0]).assertEqual(4);
        expect(result[1]).assertEqual(6);
        done();
    })

    it('TaskPoolTestClass007', 0,  async function (done) {
        function Sum(arg1, arg2) {
            "use concurrent"
            let value = arg1;
            value.a = arg1.a + arg2.a;
            value.b = arg1.b + arg2.b;
            return value;
        }
        var result = await taskpool.execute(Sum, {"a": 1, "b" : 2}, {"a": 3, "b" : 4});
        expect(JSON.stringify(result)).assertEqual("{\"a\":4,\"b\":6}");
        done();
    })

    it('TaskPoolTestClass008', 0,  async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        var result = await taskpool.execute(Sum, 10);
        expect(result.toString()).assertEqual("NaN");
        done();
    })

    it('TaskPoolTestClass009', 0,  async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        var result = await taskpool.execute(Sum, 10, 20, 30);
        expect(result).assertEqual(30);
        done();
    })

    it('TaskPoolTestClass010', 0,  async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        var result1 = await taskpool.execute(Sum, 10, 20);
        var result2 = await taskpool.execute(Sum, 30, 40);
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(70);
        done();
    })

    it('TaskPoolTestClass011', 0,  async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        var result1 = await taskpool.execute(Sum, 10, 20);
        var result2 = await taskpool.execute(Sum, 10, 20);
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(30);
        done();
    })

    it('TaskPoolTestClass012', 0,  async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        function Multi(value1, value2) {
            "use concurrent"
            return value1 * value2;
        }
        var result1 = await taskpool.execute(Sum, 10, 20);
        var result2 = await taskpool.execute(Multi, 10, 20);
        var result3 = await taskpool.execute(Sum, 10, 30);
        var result4 = await taskpool.execute(Multi, 20, 20);
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(200);
        expect(result3).assertEqual(40);
        expect(result4).assertEqual(400);
        done();
    })

    it('TaskPoolTestClass013', 0, async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        var task = new taskpool.Task(Sum, 10, 20);
        var result = await taskpool.execute(task);
        expect(result).assertEqual(30);
        done();
    })

    it('TaskPoolTestClass014', 0, async function (done) {
        function Add(value1, value2) {
            "use concurrent"
            if (value1 & value2)
                return true;
            else
                return false;
        }
        var task = new taskpool.Task(Add, true, true);
        var result = await taskpool.execute(task);
        expect(result).assertEqual(true);
        done();
    })

    it('TaskPoolTestClass015', 0,  async function (done) {
        function StrCat(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        var task = new taskpool.Task(StrCat, "abc", "def");
        var result = await taskpool.execute(task);
        expect(result).assertEqual("abcdef");
        done();
    })

    it('TaskPoolTestClass016', 0,  async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            function StrCat(value1, value2) {
                return value1 + value2;
            }
            return value1+StrCat(value2,"hello");
        }
        var task = new taskpool.Task(Sum, "abc", "def");
        var result = await taskpool.execute(task);
        expect(result).assertEqual("abcdefhello");
        done();
    })

    it('TaskPoolTestClass017', 0, async function (done) {
        function Sum(arg1, arg2) {
            "use concurrent"
            let value = [];
            value[0] = arg1[0] + arg2[0];
            value[1] = arg1[1] + arg2[1];
            return value;
        }
        var task = new taskpool.Task(Sum, [1,2], [3,4]);
        var result = await taskpool.execute(task);
        expect(result[0]).assertEqual(4);
        expect(result[1]).assertEqual(6);
        done();
    })

    it('TaskPoolTestClass018', 0, async function (done) {
        function Sum(arg1, arg2) {
            "use concurrent"
            let value = arg1;
            value.a = arg1.a + arg2.a;
            value.b = arg1.b + arg2.b;
            return value;
        }
        var task = new taskpool.Task(Sum, {"a": 1, "b" : 2}, {"a": 3, "b" : 4});
        var result = await taskpool.execute(task);
        expect(JSON.stringify(result)).assertEqual("{\"a\":4,\"b\":6}");
        done();
    })

    it('TaskPoolTestClass019', 0, async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        var task = new taskpool.Task(Sum, 10);
        var result = await taskpool.execute(task);
        expect(result.toString()).assertEqual("NaN");
        done();
    })

    it('TaskPoolTestClass020', 0, async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        var task = new taskpool.Task(Sum, 10, 20, 30);
        var result = await taskpool.execute(task);
        expect(result).assertEqual(30);
        done();
    })

    it('TaskPoolTestClass021', 0, async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        var task = new taskpool.Task(Sum, 10, 20);
        var result1 = await taskpool.execute(task);
        var result2 = await taskpool.execute(task);
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(30);
        done();
    })

    it('TaskPoolTestClass022', 0, async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        var task1 = new taskpool.Task(Sum, 10, 20);
        var task2 = new taskpool.Task(Sum, 30, 40);
        var result1 = await taskpool.execute(task1);
        var result2 = await taskpool.execute(task2);
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(70);
        done();
    })

    it('TaskPoolTestClass023', 0, async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        var task1 = new taskpool.Task(Sum, 10, 20);
        var task2 = new taskpool.Task(Sum, 10, 20);
        var result1 = await taskpool.execute(task1);
        var result2 = await taskpool.execute(task2);
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(30);
        done();
    })

    it('TaskPoolTestClass024', 0,  async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        function Multi(value1, value2) {
            "use concurrent"
            return value1 * value2;
        }
        var task1 = new taskpool.Task(Sum, 10, 20);
        var result1 = await taskpool.execute(task1);
        var task2 = new taskpool.Task(Multi, 10, 20);
        var result2 = await taskpool.execute(task2);
        var task3 = new taskpool.Task(Sum, 10, 30);
        var result3 = await taskpool.execute(task3);
        var task4 = new taskpool.Task(Multi, 20, 20);
        var result4 = await taskpool.execute(task4);
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(200);
        expect(result3).assertEqual(40);
        expect(result4).assertEqual(400);
        done();
    })

    it('TaskPoolTestClass025', 0, async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        var result;
        var isTerminate = false;
        var task = new taskpool.Task(Sum, 10, 20)
        taskpool.execute(task).then((ret) => {
            result = ret;
            isTerminate = true;
        })
        while (!isTerminate) {
            await promiseCase()
        }
        expect(result).assertEqual(30); 
        done();
    })

    it('TaskPoolTestClass026', 0, async function (done) {
        function Add(value1, value2) {
            "use concurrent"
            if (value1 & value2)
                return true;
            else
                return false;
        }
        var task = new taskpool.Task(Add, true, true)
        var result;
        var isTerminate = false;
        taskpool.execute(task).then((ret) => {
            result = ret;
            isTerminate = true;
        })
        while (!isTerminate) {
            await promiseCase()
        }
        expect(result).assertEqual(true);
        done();
    })

    it('TaskPoolTestClass027', 0, async function (done) {
        function StrCat(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        var task = new taskpool.Task(StrCat, "abc", "def")
        var result;
        var isTerminate = false;
        taskpool.execute(task).then((ret) => {
            result = ret;
            isTerminate = true;
        })
        while (!isTerminate) {
            await promiseCase()
        }
        expect(result).assertEqual("abcdef");
        done();
    })

    it('TaskPoolTestClass028', 0,  async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            function StrCat(value1, value2) {
                return value1 + value2;
            }
            return value1+StrCat(value2,"hello");
        }
        var task = new taskpool.Task(Sum, "abc", "def");
        var result;
        var isTerminate = false;
        taskpool.execute(task).then((ret) => {
            result = ret;
            isTerminate = true;
        })
        while (!isTerminate) {
            await promiseCase()
        }
        expect(result).assertEqual("abcdefhello");
        done();
    })

    it('TaskPoolTestClass029', 0, async function (done) {
        function Sum(arg1, arg2) {
            "use concurrent"
            let value = [];
            value[0] = arg1[0] + arg2[0];
            value[1] = arg1[1] + arg2[1];
            return value;
        }
        var task = new taskpool.Task(Sum, [1,2], [3,4]);
        var result;
        var isTerminate = false;
        taskpool.execute(task).then((ret) => {
            result = ret;
            isTerminate = true;
        })
        while (!isTerminate) {
            await promiseCase()
        }
        expect(result[0]).assertEqual(4);
        expect(result[1]).assertEqual(6);
        done();
    })

    it('TaskPoolTestClass030', 0, async function (done) {
        function Sum(arg1, arg2) {
            "use concurrent"
            let value = arg1;
            value.a = arg1.a + arg2.a;
            value.b = arg1.b + arg2.b;
            return value;
        }
        var task = new taskpool.Task(Sum, {"a": 1, "b" : 2}, {"a": 3, "b" : 4});
        var result;
        var isTerminate = false;
        taskpool.execute(task).then((ret) => {
            result = ret;
            isTerminate = true;
        })
        while (!isTerminate) {
            await promiseCase()
        }
        expect(JSON.stringify(result)).assertEqual("{\"a\":4,\"b\":6}");
        done();
    })

    it('TaskPoolTestClass031', 0, async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        var task = new taskpool.Task(Sum, 10);
        var result;
        var isTerminate = false;
        taskpool.execute(task).then((ret) => {
            result = ret;
            isTerminate = true;
        })
        while (!isTerminate) {
            await promiseCase()
        }
        expect(result.toString()).assertEqual("NaN");
        done();
    })

    it('TaskPoolTestClass032', 0, async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        var task = new taskpool.Task(Sum, 10, 20, 30);
        var result;
        var isTerminate = false;
        taskpool.execute(task).then((ret) => {
            result = ret;
            isTerminate = true;
        })
        while (!isTerminate) {
            await promiseCase()
        }
        expect(result).assertEqual(30);
        done();
    })

    it('TaskPoolTestClass033', 0, async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        var result1;
        var result2;
        var isTerminate1 = false;
        var isTerminate2 = false;

        var task1 = new taskpool.Task(Sum, 10, 20);
        taskpool.execute(task1).then((ret1) => {
            result1 = ret1;
            isTerminate1 = true;
        })
        
        var task2 = new taskpool.Task(Sum, 30, 40);
        taskpool.execute(task2).then((ret2) => {
            result2 = ret2;
            isTerminate2 = true;
        })
        while (!isTerminate1 || !isTerminate2) {
            await promiseCase()
        }
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(70);
        done();
    })

    it('TaskPoolTestClass034', 0, async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        var result1;
        var result2;
        var isTerminate1 = false;
        var isTerminate2 = false;

        var task1 = new taskpool.Task(Sum, 10, 20)
        taskpool.execute(task1).then((ret1) => {
            result1 = ret1;
            isTerminate1 = true;
        })
        var task2 = new taskpool.Task(Sum, 10, 20)
        taskpool.execute(task2).then((ret2) => {
            result2 = ret2;
            isTerminate2 = true;
        })
        while (!isTerminate1 || !isTerminate2) {
            await promiseCase()
        }
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(30);
        done();
    })

    it('TaskPoolTestClass035', 0, async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        var result1;
        var result2;
        var isTerminate1 = false;
        var isTerminate2 = false;

        var task = new taskpool.Task(Sum, 10, 20)
        taskpool.execute(task).then((ret1) => {
            result1 = ret1;
            isTerminate1 = true;
        })
        taskpool.execute(task).then((ret2) => {
            result2 = ret2;
            isTerminate2 = true;
        })
        while (!isTerminate1 || !isTerminate2) {
            await promiseCase()
        }
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(30);
        done();
    })

    it('TaskPoolTestClass036', 0, async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        function Multi(value1, value2) {
            "use concurrent"
            return value1 * value2;
        }

        var result1;
        var result2;
        var result3;
        var result4;
        var isTerminate1 = false;
        var isTerminate2 = false;
        var isTerminate3 = false;
        var isTerminate4 = false;

        var task1 = new taskpool.Task(Sum, 10, 20)
        taskpool.execute(task1).then((ret1) => {
            result1 = ret1;
            isTerminate1 = true;
        })
        var task2 = new taskpool.Task(Multi, 10, 20)
        taskpool.execute(task2).then((ret2) => {
            result2 = ret2;
            isTerminate2 = true;
        })
        var task3 = new taskpool.Task(Sum, 10, 30)
        taskpool.execute(task3).then((ret3) => {
            result3 = ret3;
            isTerminate3 = true;
        })
        var task4 = new taskpool.Task(Multi, 20, 20)
        taskpool.execute(task4).then((ret4) => {
            result4 = ret4;
            isTerminate4 = true;
        })

        while (!isTerminate1 || !isTerminate2 || !isTerminate3 || !isTerminate4) {
            await promiseCase()
        }
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(200);
        expect(result3).assertEqual(40);
        expect(result4).assertEqual(400);
        done();
    })

    it('TaskPoolTestClass037', 0, async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        var result;
        var isTerminate = false;
        taskpool.execute(Sum, 10, 20).then((ret) => {
            result = ret;
            isTerminate = true;
        })
        while (!isTerminate) {
            await promiseCase()
        }
        expect(result).assertEqual(30);
        done();
    })

    it('TaskPoolTestClass038', 0, async function (done) {
        function Add(value1, value2) {
            "use concurrent"
            if (value1 & value2)
                return true;
            else
                return false;
        }
        var result;
        var isTerminate = false;
        taskpool.execute(Add, true, false).then((ret) => {
            result = ret;
            isTerminate = true;
        })
        while (!isTerminate) {
            await promiseCase()
        }
        expect(result).assertEqual(false);
        done();
    })

    it('TaskPoolTestClass039', 0, async function (done) {
        function StrCat(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        var result;
        var isTerminate = false;
        taskpool.execute(StrCat, "abc", "def").then((ret) => {
            result = ret;
            isTerminate = true;
        })
        while (!isTerminate) {
            await promiseCase()
        }
        expect(result).assertEqual("abcdef");
        done();
    })

    it('TaskPoolTestClass040', 0,  async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            function StrCat(value1, value2) {
                return value1 + value2;
            }
            return value1+StrCat(value2,"hello");
        }
        var result;
        var isTerminate = false;
        taskpool.execute(Sum, "abc", "def").then((ret) => {
            result = ret;
            isTerminate = true;
        })
        while (!isTerminate) {
            await promiseCase()
        }
        expect(result).assertEqual("abcdefhello");
        done();
    })

    it('TaskPoolTestClass041', 0, async function (done) {
        function Sum(arg1, arg2) {
            "use concurrent"
            let value = [];
            value[0] = arg1[0] + arg2[0];
            value[1] = arg1[1] + arg2[1];
            return value;
        }
        var result;
        var isTerminate = false;
        taskpool.execute(Sum, [1,2], [3,4]).then((ret) => {
            result = ret;
            isTerminate = true;
        })
        while (!isTerminate) {
            await promiseCase()
        }
        expect(result[0]).assertEqual(4);
        expect(result[1]).assertEqual(6);
        done();
    })

    it('TaskPoolTestClass042', 0, async function (done) {
        function Sum(arg1, arg2) {
            "use concurrent"
            let value = arg1;
            value.a = arg1.a + arg2.a;
            value.b = arg1.b + arg2.b;
            return value;
        }
        var result;
        var isTerminate = false;
        taskpool.execute(Sum, {"a": 1, "b" : 2}, {"a": 3, "b" : 4}).then((ret) => {
            result = ret;
            isTerminate = true;
        })
        while (!isTerminate) {
            await promiseCase()
        }
        expect(JSON.stringify(result)).assertEqual("{\"a\":4,\"b\":6}");
        done();
    })

    it('TaskPoolTestClass043', 0, async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        var result;
        var isTerminate = false;
        taskpool.execute(Sum, 10).then((ret) => {
            result = ret;
            isTerminate = true;
        })
        while (!isTerminate) {
            await promiseCase()
        }
        expect(result.toString()).assertEqual("NaN");
        done();
    })

    it('TaskPoolTestClass044', 0, async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        var result;
        var isTerminate = false;
        taskpool.execute(Sum, 10, 20, 30).then((ret) => {
            result = ret;
            isTerminate = true;    
        })
        while (!isTerminate) {
            await promiseCase()
        }
        expect(result).assertEqual(30);
        done();
    })

    it('TaskPoolTestClass045', 0, async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        var result1;
        var result2;
        var isTerminate1 = false;
        var isTerminate2 = false;

        taskpool.execute(Sum, 10, 20).then((ret1) => {
            result1 = ret1;
            isTerminate1 = true;  
        })
        taskpool.execute(Sum, 30, 40).then((ret2) => {
            result2 = ret2;
            isTerminate2 = true;  
        })
        while (!isTerminate1 || !isTerminate2) {
            await promiseCase()
        }
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(70);
        done();
    })

    it('TaskPoolTestClass046', 0, async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        var result1;
        var result2;
        var isTerminate1 = false;
        var isTerminate2 = false;

        taskpool.execute(Sum, 10, 20).then((ret1) => {
            result1 = ret1;
            isTerminate1 = true;  
        })
        taskpool.execute(Sum, 10, 20).then((ret2) => {
            result2 = ret2;
            isTerminate2 = true;  
        })
        while (!isTerminate1 || !isTerminate2) {
            await promiseCase()
        }
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(30);
        done();
    })

    it('TaskPoolTestClass047', 0, async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        function Multi(value1, value2) {
            "use concurrent"
            return value1 * value2;
        }

        var result1;
        var result2;
        var result3;
        var result4;
        var isTerminate1 = false;
        var isTerminate2 = false;
        var isTerminate3 = false;
        var isTerminate4 = false;

        taskpool.execute(Sum, 10, 20).then((ret1) => {
            result1 = ret1;
            isTerminate1 = true;  
        })
        taskpool.execute(Multi, 10, 20).then((ret2) => {
            result2 = ret2;
            isTerminate2 = true; 
        })
        taskpool.execute(Sum, 10, 30).then((ret3) => {
            result3 = ret3;
            isTerminate3 = true;  
        })
        taskpool.execute(Multi, 20, 20).then((ret4) => {
            result4 = ret4;
            isTerminate4 = true;  
        })
        while (!isTerminate1 || !isTerminate2 || !isTerminate3 || !isTerminate4) {
            await promiseCase()
        }
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(200);
        expect(result3).assertEqual(40);
        expect(result4).assertEqual(400);
        done();
    })

    it('TaskPoolTestClass048', 0,  async function (done) {
        function Sum(value1, value2) {
            "use concurrent"
            return value1 + value2;
        }
        try {
            var result = await taskpool.execute(Sum);
        } catch(e) {
            expect(e.toString()).assertEqual("BusinessError: taskpool:: first param must be object when argc is one");
        }
        done();
    })

    it('TaskPoolTestClass061', 0,  async function (done) {
        function Sum(value1, value2) {
          "use concurrent"
          return value1 + value2;
        }
        var task1 = new taskpool.Task(Sum, 10, 20);
        var task2 = new taskpool.Task(Sum, 30, 40);
        var task3 = new taskpool.Task(Sum, 50, 60);
        var result1 = await taskpool.execute(task1,taskpool.Priority.LOW);
        var result2 = await taskpool.execute(task2,taskpool.Priority.HIGH);
        var result3 = await taskpool.execute(task3,taskpool.Priority.MEDIUM);
        expect(result1).assertEqual(30);
        expect(result2).assertEqual(70);
        expect(result3).assertEqual(110);
        done();
    })

    it('TaskPoolTestClass062', 0,  async function (done) {
        async function func(value1, value2) {
            "use concurrent"
            let result = await new Promise((resolve, reject) => {
                let value = value1 + value2;
                resolve(value);
            })
            return result;
        }
        var result = await taskpool.execute(func, 10, 20);
        expect(result).assertEqual(30);
        done();
    })
  
    it('TaskPoolTestClass063', 0,  async function (done) {
        async function func(value1, value2) {
            "use concurrent"
            let result = await new Promise((resolve, reject) => {
                let value = value1 + value2;
                resolve(value);
            })
            return result;
        }
        var task = new taskpool.Task(func, 10, 20);
        var result = await taskpool.execute(task);
        expect(result).assertEqual(30);
        done();
    })

    /**
     * @tc.number    : TaskPoolTestClass049
     * @tc.name      : Async Function Cancel task
     * @tc.desc      : Cancel tasks that have not been executed
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
     it('TaskPoolTestClass049', 0, async function (done) {
        function addition(arg) {
            "use concurrent"
            return arg + 1;
        }
        function additionDelay(arg) {
            "use concurrent"
            var start = new Date().getTime();
            while (new Date().getTime() - start < 200) {
              continue;
            }
            return arg + 1;
        }
        try {
            var task1 = new taskpool.Task(additionDelay, 100);
            var task2 = new taskpool.Task(additionDelay, 200);
            var task3 = new taskpool.Task(additionDelay, 200);
            var task4 = new taskpool.Task(additionDelay, 200);
            var task5 = new taskpool.Task(additionDelay, 200);
            var task6 = new taskpool.Task(additionDelay, 200);
            var task7 = new taskpool.Task(additionDelay, 200);
            var task8 = new taskpool.Task(additionDelay, 200);
            var task9 = new taskpool.Task(additionDelay, 200);
            var task10 = new taskpool.Task(additionDelay, 200);
            var task11 = new taskpool.Task(addition, 300);

            var result1 = taskpool.execute(task1);
            var result2 = taskpool.execute(task2);
            var result3 = taskpool.execute(task3);
            var result4 = taskpool.execute(task4);
            var result5 = taskpool.execute(task5);
            var result6 = taskpool.execute(task6);
            var result7 = taskpool.execute(task7);
            var result8 = taskpool.execute(task8);
            var result9 = taskpool.execute(task9);
            var result10 = taskpool.execute(task10);
            var result11 = taskpool.execute(task11);

            var start = new Date().getTime();
            while (new Date().getTime() - start < 20) {
                continue;
            }

            taskpool.cancel(task11);
        }
        catch (e) {
            expect(e.toString()).assertEqual("");
        }
        done();
    })

     /**
      * @tc.number    : TaskPoolTestClass050
      * @tc.name      : Sync Function Cancel task
      * @tc.desc      : Cancel tasks that have not been executed
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('TaskPoolTestClass050', 0, function (done) {
        function addition(arg) {
            "use concurrent"
            return arg + 1;
        }
        function additionDelay(arg) {
            "use concurrent"
            var start = new Date().getTime();
            while (new Date().getTime() - start < 200) {
              continue;
            }
            return arg + 1;
        }
        try {
            var task1 = new taskpool.Task(additionDelay, 100);
            var task2 = new taskpool.Task(additionDelay, 200);
            var task3 = new taskpool.Task(additionDelay, 200);
            var task4 = new taskpool.Task(additionDelay, 200);
            var task5 = new taskpool.Task(additionDelay, 200);
            var task6 = new taskpool.Task(additionDelay, 200);
            var task7 = new taskpool.Task(additionDelay, 200);
            var task8 = new taskpool.Task(additionDelay, 200);
            var task9 = new taskpool.Task(additionDelay, 200);
            var task10 = new taskpool.Task(additionDelay, 200);
            var task11 = new taskpool.Task(addition, 300);

            var result1 = taskpool.execute(task1);
            var result2 = taskpool.execute(task2);
            var result3 = taskpool.execute(task3);
            var result4 = taskpool.execute(task4);
            var result5 = taskpool.execute(task5);
            var result6 = taskpool.execute(task6);
            var result7 = taskpool.execute(task7);
            var result8 = taskpool.execute(task8);
            var result9 = taskpool.execute(task9);
            var result10 = taskpool.execute(task10);
            var result11 = taskpool.execute(task11);

            var start = new Date().getTime();
            while (new Date().getTime() - start < 20) {
                continue;
            }

            taskpool.cancel(task11);
        }
        catch (e) {
            expect(e.toString()).assertEqual("");
        }
        done();
    })

    /**
     * @tc.number    : TaskPoolTestClass051
     * @tc.name      : Async Function Cancel task
     * @tc.desc      : Cancel the task in progress
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass051', 0, async function (done) {
        function addition(arg) {
            "use concurrent"
            return arg + 1;
        }
        function additionDelay(arg) {
            "use concurrent"
            var start = new Date().getTime();
            while (new Date().getTime() - start < 3000) {
              continue;
            }
            return arg + 1;
        }
        try {
            var task1 = new taskpool.Task(additionDelay, 100);
            var task2 = new taskpool.Task(additionDelay, 200);
            var task3 = new taskpool.Task(addition, 300);

            var result1 = taskpool.execute(task1);
            var result2 = taskpool.execute(task2);
            var result3 = taskpool.execute(task3);

            var start = new Date().getTime();
            while (new Date().getTime() - start < 1000) {
              continue;
            }

            taskpool.cancel(task1);
        }
        catch (e) {
          expect(e.toString()).assertEqual(
              "BusinessError: The task is executing when it is canceled, taskpool:: can not cancel the running task");
        }
        done();
    })

    /**
     * @tc.number    : TaskPoolTestClass052
     * @tc.name      : Sync Function Cancel task
     * @tc.desc      : Cancel the task in progress
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass052', 0, function (done) {
        function addition(arg) {
            "use concurrent"
            return arg + 1;
        }
        function additionDelay(arg) {
            "use concurrent"
            var start = new Date().getTime();
            while (new Date().getTime() - start < 3000) {
              continue;
            }
            return arg + 1;
        }
        try {
            var task1 = new taskpool.Task(additionDelay, 100);
            var task2 = new taskpool.Task(additionDelay, 200);
            var task3 = new taskpool.Task(addition, 300);

            var result1 = taskpool.execute(task1);
            var result2 = taskpool.execute(task2);
            var result3 = taskpool.execute(task3);

            var start = new Date().getTime();
            while (new Date().getTime() - start < 1000) {
              continue;
            }

            taskpool.cancel(task1);
        }
        catch (e) {
          expect(e.toString()).assertEqual(
              "BusinessError: The task is executing when it is canceled, taskpool:: can not cancel the running task");
        }
        done();
    })

    /**
     * @tc.number    : TaskPoolTestClass053
     * @tc.name      : Async Function Cancel task
     * @tc.desc      : Cancel the executed task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass053', 0, async function (done) {
        function addition(arg) {
            "use concurrent"
            return arg + 1;
        }
        try {
            var task1 = new taskpool.Task(addition, 100);
            var task2 = new taskpool.Task(addition, 200);
            var task3 = new taskpool.Task(addition, 300);

            var result1 = taskpool.execute(task1);
            var result2 = taskpool.execute(task2);
            var result3 = taskpool.execute(task3);

            var start = new Date().getTime();
            while (new Date().getTime() - start < 1000) {
              continue;
            }

            taskpool.cancel(task1);
        }
        catch (e) {
            expect(e.toString()).assertEqual(
                "BusinessError: The task does not exist when it is canceled, taskpool:: can not find the task");
        }
        done();
    })

    /**
     * @tc.number    : TaskPoolTestClass054
     * @tc.name      : Sync Function Cancel task
     * @tc.desc      : Cancel the executed task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass054', 0, function (done) {
        function addition(arg) {
            "use concurrent"
            return arg + 1;
        }
        try {
            var task1 = new taskpool.Task(addition, 100);
            var task2 = new taskpool.Task(addition, 200);
            var task3 = new taskpool.Task(addition, 300);
            var task4 = new taskpool.Task(addition, 400);
            var task5 = new taskpool.Task(addition, 500);
            var task6 = new taskpool.Task(addition, 600);

            var result1 = taskpool.execute(task1);
            var result2 = taskpool.execute(task2);
            var result3 = taskpool.execute(task3);
            var result4 = taskpool.execute(task4);
            var result5 = taskpool.execute(task5);
            var result6 = taskpool.execute(task6);

            var start = new Date().getTime();
            while (new Date().getTime() - start < 1000) {
              continue;
            }

            taskpool.cancel(task3);
        }
        catch (e) {
            expect(e.toString()).assertEqual(
                "BusinessError: The task does not exist when it is canceled, taskpool:: can not find the task");
        }
        done();
    })

    /**
     * @tc.number    : TaskPoolTestClass055
     * @tc.name      : Async Function Cancel task
     * @tc.desc      : Cancel nonexistent task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass055', 0, async function (done) {
        function addition(arg) {
            "use concurrent"
            return arg + 1;
        }
        try {
            var task1 = new taskpool.Task(addition, 100);
            var task2 = new taskpool.Task(addition, 200);
            var task3 = new taskpool.Task(addition, 300);

            var result1 = taskpool.execute(task1);
            var result2 = taskpool.execute(task2);

            taskpool.cancel(task3);
        }
        catch (e) {
            expect(e.toString()).assertEqual(
                "BusinessError: The task does not exist when it is canceled, taskpool:: can not find the task");
        }
        done();
    })

    /**
     * @tc.number    : TaskPoolTestClass056
     * @tc.name      : Sync Function Cancel task
     * @tc.desc      : Cancel nonexistent task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass056', 0, function (done) {
        function addition(arg) {
            "use concurrent"
            return arg + 1;
        }
        try {
            var task1 = new taskpool.Task(addition, 100);
            var task2 = new taskpool.Task(addition, 200);
            var task3 = new taskpool.Task(addition, 300);

            var result1 = taskpool.execute(task1);
            var result2 = taskpool.execute(task2);

            taskpool.cancel(task3);
        }
        catch (e) {
            expect(e.toString()).assertEqual(
                "BusinessError: The task does not exist when it is canceled, taskpool:: can not find the task");
        }
        done();
    })

    /**
     * @tc.number    : TaskPoolTestClass057
     * @tc.name      : Async Function Cancel task
     * @tc.desc      : Canceling unexecuted tasks multiple times
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass057', 0, async function (done) {
        function addition(arg) {
            "use concurrent"
            return arg + 1;
        }
        function additionDelay(arg) {
            "use concurrent"
            var start = new Date().getTime();
            while (new Date().getTime() - start < 3000) {
                continue;
            }
            return arg + 1;
        }
        try {
            var task1 = new taskpool.Task(additionDelay, 100);
            var task2 = new taskpool.Task(additionDelay, 200);
            var task3 = new taskpool.Task(addition, 300);

            var result1 = taskpool.execute(task1);
            var result2 = taskpool.execute(task2);
            var result3 = taskpool.execute(task3);

            var start = new Date().getTime();
            while (new Date().getTime() - start < 1000) {
              continue;
            }

            taskpool.cancel(task3);
            taskpool.cancel(task3);
        }
        catch (e) {
            expect(e.toString()).assertEqual(
                "BusinessError: The task does not exist when it is canceled, taskpool:: can not find the task");
        }
        done();
    })

    /**
     * @tc.number    : TaskPoolTestClass058
     * @tc.name      : Sync Function Cancel task
     * @tc.desc      : Canceling unexecuted tasks multiple times
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass058', 0, function (done) {
        function addition(arg) {
            "use concurrent"
            return arg + 1;
        }
        function additionDelay(arg) {
            "use concurrent"
            var start = new Date().getTime();
            while (new Date().getTime() - start < 3000) {
                continue;
            }
            return arg + 1;
        }
        try {
            var task1 = new taskpool.Task(additionDelay, 100);
            var task2 = new taskpool.Task(additionDelay, 200);
            var task3 = new taskpool.Task(addition, 300);

            var result1 = taskpool.execute(task1);
            var result2 = taskpool.execute(task2);
            var result3 = taskpool.execute(task3);

            var start = new Date().getTime();
            while (new Date().getTime() - start < 1000) {
              continue;
            }

            taskpool.cancel(task3);
            taskpool.cancel(task3);
        }
        catch (e) {
            expect(e.toString()).assertEqual(
                "BusinessError: The task does not exist when it is canceled, taskpool:: can not find the task");
        }
        done();
    })

    /**
     * @tc.number    : TaskPoolTestClass059
     * @tc.name      : Async Function Cancel task
     * @tc.desc      : Cancel all tasks in sequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass059', 0, async function (done) {
        function addition(arg) {
            "use concurrent"
            return arg + 1;
        }
        try {
            var task1 = new taskpool.Task(addition, 100);
            var task2 = new taskpool.Task(addition, 200);
            var task3 = new taskpool.Task(addition, 300);
            var task4 = new taskpool.Task(addition, 400);
            var task5 = new taskpool.Task(addition, 500);
            var task6 = new taskpool.Task(addition, 600);

            var result1 = taskpool.execute(task1);
            var result2 = taskpool.execute(task2);
            var result3 = taskpool.execute(task3);
            var result4 = taskpool.execute(task4);
            var result5 = taskpool.execute(task5);
            var result6 = taskpool.execute(task6);

            var start = new Date().getTime();
            while (new Date().getTime() - start < 100) {
              continue;
            }

            taskpool.cancel(task6);
            taskpool.cancel(task5);
            taskpool.cancel(task4);
            taskpool.cancel(task3);
            taskpool.cancel(task2);
        }
        catch (e) {
            expect(e.toString()).assertEqual(
                "BusinessError: The task does not exist when it is canceled, taskpool:: can not find the task");
        }
        done();
    })

    /**
     * @tc.number    : TaskPoolTestClass060
     * @tc.name      : Sync Function Cancel task
     * @tc.desc      : Cancel all tasks in sequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass060', 0, function (done) {
        function addition(arg) {
            "use concurrent"
            return arg + 1;
        }
        try {
            var task1 = new taskpool.Task(addition, 100);
            var task2 = new taskpool.Task(addition, 200);
            var task3 = new taskpool.Task(addition, 300);
            var task4 = new taskpool.Task(addition, 400);
            var task5 = new taskpool.Task(addition, 500);
            var task6 = new taskpool.Task(addition, 600);

            var result1 = taskpool.execute(task1);
            var result2 = taskpool.execute(task2);
            var result3 = taskpool.execute(task3);
            var result4 = taskpool.execute(task4);
            var result5 = taskpool.execute(task5);
            var result6 = taskpool.execute(task6);

            var start = new Date().getTime();
            while (new Date().getTime() - start < 100) {
              continue;
            }

            taskpool.cancel(task6);
            taskpool.cancel(task5);
            taskpool.cancel(task4);
            taskpool.cancel(task3);
            taskpool.cancel(task2);
        }
        catch (e) {
            expect(e.toString()).assertEqual(
                "BusinessError: The task does not exist when it is canceled, taskpool:: can not find the task");
        }
        done();
    })
})
}