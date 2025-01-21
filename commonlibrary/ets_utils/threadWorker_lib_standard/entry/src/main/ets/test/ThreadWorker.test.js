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

import app from '@system.app'
import worker from "@ohos.worker"
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
export default function threadWorkerTest() {
describe('threadWorkerTest', function () {

    afterAll(function () {
        console.info('total case over')
    })

    function promiseCase() {
        let p = new Promise(function (resolve, reject) {
            setTimeout(function () {
                resolve(0)
            }, 100)
        }).then(undefined, (error) => {
        })
        return p
    }

    // check worker constructor is ok
    /**
     * @tc.name: threadWorker_constructor_test_001
     * @tc.desc: worker constructor to Creates a worker instance.
     */
    it('threadWorker_constructor_test_001', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }

        expect(ss != null).assertTrue()

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        done()
    })

    /**
     * @tc.name: threadWorker_constructor_test_002
     * @tc.desc: worker constructor to Creates a worker instance.
     */
    it('threadWorker_constructor_test_002', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js", {name:"1st worker", shared: false})
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }

        expect(ss != null).assertTrue()

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        done()
    })

    /**
     * @tc.name: threadWorker_constructor_test_003
     * @tc.desc: worker constructor to Creates a worker instance.
     */
    it('threadWorker_constructor_test_003', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js",
                                         {type:"classic", name:"2st worker", shared: false})
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }

        expect(ss != null).assertTrue()

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        done()
    })

    /**
     * @tc.name: threadWorker_constructor_test_004
     * @tc.desc: worker constructor to Creates a worker instance.
     */
    it('threadWorker_constructor_test_004', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js", 
                                         {type:"classic", name:"3st worker", shared: true})
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }

        expect(ss != null).assertTrue()

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        done()
    })

    /**
     * @tc.name: threadWorker_constructor_test_005
     * @tc.desc: worker constructor to Creates a worker instance when throw error.
     */
    it('threadWorker_constructor_test_005', 0, async function (done) {
        var ss = []
        try {
            let a = 0
            while (a <= 8) {
                ss[a] = new worker.ThreadWorker("entry/ets/workers/newworker.js")
                a += 1
            }
        } catch (error) {
            expect(error.name == "BusinessError").assertTrue()
            let msg = "Worker initialization failure, the number of workers exceeds the maximum."
            expect(error.message).assertEqual(msg)
            let b = 7
            let flag = 0
            while (b >= 0) {
                ss[b].onexit = function () {
                    flag += 1
                }
                ss[b].terminate()
                b -= 1
            }
            while (flag != 8) {
                await promiseCase()
            }
            done()
        }
    })

    /**
     * @tc.name: threadWorker_constructor_test_006
     * @tc.desc: worker constructor to Creates a worker instance when throw error.
     */
    it('threadWorker_constructor_test_006', 0, async function (done) {
        try {
            let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js", {type:"other", name:"worker"})
        } catch (error) {
            expect(error.name == "BusinessError").assertTrue()
            expect(error.message == "the type must be classic, unsupport others now.").assertTrue()
            done()
        }
    })

    /**
     * @tc.name: threadWorker_constructor_test_007
     * @tc.desc: worker constructor to Creates a worker instance when throw error.
     */
    it('threadWorker_constructor_test_007', 0, async function (done) {
        try {
            let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js",
                                             {type:1, name:"new worker", shared: true})
        } catch (error) {
            expect(error.name == "BusinessError").assertTrue()
            expect(error.message == "the type of type must be string.").assertTrue()
            done()
        }
    })

    /**
     * @tc.name: threadWorker_constructor_test_008
     * @tc.desc: worker constructor to Creates a worker instance when throw error.
     */
    it('threadWorker_constructor_test_008', 0, async function (done) {
        try {
            let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js", {type:"classic", name:1, shared: true})
        } catch (error) {
            expect(error.name == "BusinessError").assertTrue()
            expect(error.message == "the type of name in worker must be string.").assertTrue()
            done()
        }
    })

    /**
     * @tc.name: threadWorker_constructor_test_009
     * @tc.desc: worker constructor to Creates a worker instance when throw error.
     */
     it('threadWorker_constructor_test_009', 0, async function (done) {
        try {
            let ss = new worker.ThreadWorker()
        } catch (error) {
            expect(error.name == "BusinessError").assertTrue()
            expect(error.message == "the number of create worker param must be more than 1 with new").assertTrue()
            done()
        }
    })

    /**
     * @tc.name: threadWorker_constructor_test_010
     * @tc.desc: worker constructor to Creates a worker instance.
     */
    it('threadWorker_constructor_test_010', 0, async function (done) {
        let ss = new worker.ThreadWorker("/entry/ets/workers/newworker.js");
        let isTerminate = false
        ss.onexit = function () {
            isTerminate = true
        }
        expect(ss != null).assertTrue()
        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        done()
    })

    /**
     * @tc.name: threadWorker_constructor_test_011
     * @tc.desc: worker constructor to Creates a worker instance.
     */
    it('threadWorker_constructor_test_011', 0, async function (done) {
        let ss = new worker.ThreadWorker("@bundle:com.example.threadWorkertest/entry/ets/workers/newworker.js");
        let isTerminate = false
        ss.onexit = function () {
            isTerminate = true
        }
        expect(ss != null).assertTrue()
        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        done()
    })

    // check postMessage is ok
    // main post "hello world", will receive "hello world worker"
    /**
     * @tc.name: threadWorker_postMessage_test_001
     * @tc.desc: Sends a message to the worker thread.
     */
    it('threadWorker_postMessage_test_001', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_002.js")

        let res = undefined
        let flag = false
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.onmessage = function (e) {
            res = e.data
            flag = true
        }

        ss.postMessage("hello world")
        while (!flag) {
            await promiseCase()
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(res).assertEqual("hello world worker")
        done()
    })

    // check postMessage is ok
    // main post 12 , will receive 12 * 2 + 1
    /**
     * @tc.name: threadWorker_postMessage_test_002
     * @tc.desc: Sends a message to the worker thread.
     */
    it('threadWorker_postMessage_test_002', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_003.js")

        let res = undefined
        let flag = false
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.onmessage = function (e) {
            res = e.data
            flag = true
        }

        ss.postMessage(12)
        while (!flag) {
            await promiseCase()
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(res).assertEqual(25)
        done()
    })

    // check postMessage is ok
    // main post {message:"hello world"} , will receive {message:"hello world worker"}
    /**
     * @tc.name: threadWorker_postMessage_test_003
     * @tc.desc: Sends a message to the worker thread.
     */
    it('threadWorker_postMessage_test_003', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_004.js")

        let res = undefined
        let flag = false
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.onmessage = function (e) {
            res = e.data.message
            flag = true
        }

        ss.postMessage({"message":"hello world"})
        while (!flag) {
            await promiseCase()
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(res).assertEqual("hello world worker")
        done()
    })

    // check worker name is ok
    /**
     * @tc.name: threadWorker_postMessage_test_004
     * @tc.desc: Sends a message to the worker thread.
     */
    it('threadWorker_postMessage_test_004', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_005.js", {name: "zhangsan"})

        let res = undefined
        let flag = false
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.onmessage = function (e) {
            res = e.data
            console.info("worker:: type " + e.type)
            console.info("worker:: timeStamp " + e.timeStamp)
            flag = true
        }

        ss.postMessage("hello world")
        while (!flag) {
            await promiseCase()
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(res).assertEqual("zhangsan")
        done()
    })

    // check worker transfer buffer is ok
    /**
     * @tc.name: threadWorker_postMessage_test_005
     * @tc.desc: Sends a message to the worker thread.
     */
    it('threadWorker_postMessage_test_005', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_006.js")
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }

        const buffer = new ArrayBuffer(8)
        expect(buffer.byteLength).assertEqual(8)
        ss.postMessage(buffer, [buffer])
        let length = undefined
        let exception = undefined
        try {
            length = buffer.byteLength
        } catch (e) {
            exception = e.message
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        console.log("worker:: length is " + length)
        console.log("worker:: exception is " + exception)

        if (typeof exception == "undefined") {
            expect(length).assertEqual(0)
        } else {
            expect(exception).assertEqual("IsDetachedBuffer")
        }
        done()
    })

    // check worker handle error is ok
    /**
     * @tc.name: threadWorker_postMessage_test_006
     * @tc.desc: Sends a message to the worker thread.
     */
    it('threadWorker_postMessage_test_006', 0, async function (done) {
        const ss = new worker.ThreadWorker("entry/ets/workers/newworker_007.js")

        let res = undefined
        let flag = false
        let isTerminate = false

        ss.onerror = function (e) {
            res = e.message
            console.info("worker:: filename " + e.filename)
            console.info("worker:: lineno " + e.lineno)
            console.info("worker:: colno " + e.colno)
            console.info("worker:: error " + e.error)
            flag = true
        }
        ss.onexit = function () {
            isTerminate = true
        }

        ss.postMessage("hello world")
        while (!flag) {
            await promiseCase()
        }

        expect(res).assertEqual("Error: 123")
        done()
    })

    // check worker handle error is ok
    /**
     * @tc.name: threadWorker_postMessage_test_007
     * @tc.desc: Sends a message to the worker thread when throw error.
     */
     it('threadWorker_postMessage_test_007', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_007.js");
        let isTerminate = false;
        ss.onexit = function () {
            isTerminate = true;
        }
        try {
            ss.postMessage();
        } catch (error) {
            ss.terminate();
            while (!isTerminate) {
                await promiseCase();
            }
            expect(error.name).assertEqual("BusinessError");
            expect(error.message).assertEqual("Worker messageObject must be not null with postMessage");
        }
        done();
    })

    // check worker handle error is ok
    /**
     * @tc.name: threadWorker_postMessage_test_008
     * @tc.desc: Sends a message to the worker thread when throw error.
     */
    it('threadWorker_postMessage_test_008', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_007.js");
        let isTerminate = false;
        ss.onexit = function () {
            isTerminate = true;
        }
        try {
            ss.postMessage("123", "123");
        } catch (error) {
            ss.terminate();
            while (!isTerminate) {
                await promiseCase();
            }
            expect(error.name).assertEqual("BusinessError");
            expect(error.message).assertEqual("transfer list must be an Array");
        }
        done();
    })

    // check worker terminate is ok
    /**
     * @tc.name: threadWorker_terminate_test_001
     * @tc.desc: Terminates the worker thread to stop the worker from receiving messages.
     */
    it('threadWorker_terminate_test_001', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")
        let res = 0
        let flag = false

        ss.onexit = function () {
            flag = true
            res++
        }

        ss.terminate()
        while (!flag) {
            await promiseCase()
        }

        expect(res).assertEqual(1)
        done()
    })

    // check worker terminate is ok
    /**
     * @tc.name: threadWorker_terminate_test_002
     * @tc.desc: Terminates the worker thread to stop the worker from receiving messages.
     */
    it('threadWorker_terminate_test_002', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")
        let res = 0
        let flag = false

        ss.onexit = function () {
            flag = true
            res++
        }

        // Repeated execution terminate
        ss.terminate()
        ss.terminate()

        while (!flag) {
            await promiseCase()
        }

        expect(res).assertEqual(1)
        done()
    })

    // check worker terminate is ok
    /**
     * @tc.name: threadWorker_terminate_test_003
     * @tc.desc: Terminates the worker thread to stop the worker from receiving messages.
     */
    it('threadWorker_terminate_test_003', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")
        let res = 0
        let flag = false

        ss.onexit = function () {
            flag = true
            res++
        }
        ss.onmessage = function (e) {
            res++
        }

        ss.terminate()
        while (!flag) {
            await promiseCase()
        }
        expect(res).assertEqual(1)
        
        try {
            ss.postMessage("hello world")
            await promiseCase()
        } catch (error) {
            let msg = "Worker instance is not running, maybe worker is terminated when PostMessage"
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual(msg)
            done()
        }
    })

    // check worker on function is ok
    /**
     * @tc.name: threadWorker_on_test_001
     * @tc.desc: Adds an event listener to the worker.
     */
    it('threadWorker_on_test_001', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.on("zhangsan", ()=>{
            times++
        })

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(times).assertEqual(1)
        done()
    })

    // check worker on function is ok
    /**
     * @tc.name: threadWorker_on_test_002
     * @tc.desc: Adds an event listener to the worker.
     */
    it('threadWorker_on_test_002', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.on("zhangsan", ()=>{
            times--
        })
        ss.on("lisi", ()=>{
            times++
        })

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        ss.dispatchEvent({type: "lisi", timeStamp: 0})

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(times).assertEqual(0)
        done()
    })

    // check worker on function is ok
    /**
     * @tc.name: threadWorker_on_test_003
     * @tc.desc: Adds an event listener to the worker.
     */
    it('threadWorker_on_test_003', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.on("zhangsan", ()=>{
            times++
        })

        for (let i=0;i<10;i++)
        {
            ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        console.log("times " + times)
        expect(times).assertEqual(10)
        done()
    })

    // check worker on function is ok
    /**
     * @tc.name: threadWorker_on_test_004
     * @tc.desc: Adds an event listener to the worker when throw error.
     */
     it('threadWorker_on_test_004', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let isTerminate = false
        try {
            ss.on(1, ()=>{})
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Worker add listener 1st param must be string")
            ss.onexit = function () {
                isTerminate = true
            }
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

    // check worker on function is ok
    /**
     * @tc.name: threadWorker_on_test_005
     * @tc.desc: Adds an event listener to the worker when throw error.
     */
     it('threadWorker_on_test_005', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let isTerminate = false
        try {
            ss.on("zhangSan", "error")
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Worker add listener 2st param must be callable")
            ss.onexit = function () {
                isTerminate = true
            }
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

    // check worker on function is ok
    /**
     * @tc.name: threadWorker_on_test_006
     * @tc.desc: Adds an event listener to the worker when throw error.
     */
     it('threadWorker_on_test_006', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let isTerminate = false
        try {
            ss.on()
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("worker add listener param count must be not less than 2.")
            ss.onexit = function () {
                isTerminate = true
            }
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

    /**
     * @tc.name: threadWorker_on_test_007
     * @tc.desc: Adds an event listener to the worker and removes the event listener automically
       after it is invoked once when throw error.
     */
       it('threadWorker_on_test_007', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let isTerminate = false
        let times = 0

        try {
            ss.on("zhangsan", ()=>{
                times++
            })
            ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
            ss.onexit = function () {
                isTerminate = true
            }
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            ss.on("lisi", ()=>{
                times++
            })
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Worker instance is not running, maybe worker is terminated")

            done()
        }
    })

    // check worker once function is ok
    /**
     * @tc.name: threadWorker_once_test_001
     * @tc.desc: Adds an event listener to the worker and removes the event listener automically
       after it is invoked once.
     */
    it('threadWorker_once_test_001', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.once("zhangsan", ()=>{
            times++
        })
        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(times).assertEqual(1)
        done()
    })

    // check worker once function is ok
    /**
     * @tc.name: threadWorker_once_test_002
     * @tc.desc: Adds an event listener to the worker and removes the event listener automically
       after it is invoked once.
     */
    it('threadWorker_once_test_002', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.once("zhangsan", ()=>{
            times++
        })

        for (let i=0;i<10;i++)
        {
            ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(times).assertEqual(1)
        done()
    })

    /**
     * @tc.name: threadWorker_once_test_003
     * @tc.desc: Adds an event listener to the worker and removes the event listener automically
       after it is invoked once.
     */
    it('threadWorker_once_test_003', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.once("zhangsan", ()=>{
            times--
        })

        ss.once("lisi", ()=>{
            times++
        })

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        ss.dispatchEvent({type: "lisi", timeStamp: 0})

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(times).assertEqual(0)
        done()
    })

    /**
     * @tc.name: threadWorker_once_test_004
     * @tc.desc: Adds an event listener to the worker and removes the event listener automically
       after it is invoked once when throw error.
     */
       it('threadWorker_once_test_004', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        try {
            ss.once(1, ()=>{
                times++
            })
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Worker add listener 1st param must be string")
            ss.onexit = function () {
                isTerminate = true
            }
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

    /**
     * @tc.name: threadWorker_once_test_005
     * @tc.desc: Adds an event listener to the worker and removes the event listener automically
       after it is invoked once when throw error.
     */
       it('threadWorker_once_test_005', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let isTerminate = false

        try {
            ss.once("zhangsan", "error")
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Worker add listener 2st param must be callable")
            ss.onexit = function () {
                isTerminate = true
            }
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

    /**
     * @tc.name: threadWorker_once_test_006
     * @tc.desc: Adds an event listener to the worker and removes the event listener automically
       after it is invoked once when throw error.
     */
       it('threadWorker_once_test_006', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let isTerminate = false

        try {
            ss.once()
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("worker add listener param count must be not less than 2.")
            ss.onexit = function () {
                isTerminate = true
            }
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

    /**
     * @tc.name: threadWorker_once_test_007
     * @tc.desc: Adds an event listener to the worker and removes the event listener automically
       after it is invoked once when throw error.
     */
       it('threadWorker_once_test_007', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let isTerminate = false
        let times = 0

        try {
            ss.once("zhangsan", ()=>{
                times++
            })
            ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
            ss.onexit = function () {
                isTerminate = true
            }
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            ss.once("lisi", ()=>{
                times++
            })
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Worker instance is not running, maybe worker is terminated")

            done()
        }
    })

    // check worker addEventListener function is ok
    /**
     * @tc.name: threadWorker_addEventListener_test_001
     * @tc.desc: Add an event listener to the Worker.
     */
    it('threadWorker_addEventListener_test_001', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.addEventListener("zhangsan", ()=>{
            times++
        })

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(times).assertEqual(2)
        done()
    })

    // check worker addEventListener function is ok
    /**
     * @tc.name: threadWorker_addEventListener_test_002
     * @tc.desc: Add an event listener to the Worker.
     */
    it('threadWorker_addEventListener_test_002', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.addEventListener("zhangsan", ()=>{
            times++
        })
        ss.addEventListener("lisi", ()=>{
            times++
        })

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        ss.dispatchEvent({type: "lisi", timeStamp: 0})

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(times).assertEqual(2)
        done()
    })

    // check worker addEventListener function is ok
    /**
     * @tc.name: threadWorker_addEventListener_test_003
     * @tc.desc: Add an event listener to the Worker.
     */
    it('threadWorker_addEventListener_test_003', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.addEventListener("zhangsan", ()=>{
            times++
        })

        for (let i=0;i<10;i++)
        {
            ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(times).assertEqual(10)
        done()
    })

    // check worker addEventListener function is ok
    /**
     * @tc.name: threadWorker_addEventListener_test_004
     * @tc.desc: Add an event listener to the Worker when throw error.
     */
     it('threadWorker_addEventListener_test_004', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        try {
            ss.addEventListener(1, ()=>{
                times++
            })
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Worker add listener 1st param must be string")
            ss.onexit = function () {
                isTerminate = true
            }
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

    // check worker addEventListener function is ok
    /**
     * @tc.name: threadWorker_addEventListener_test_005
     * @tc.desc: Add an event listener to the Worker when throw error.
     */
     it('threadWorker_addEventListener_test_005', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        try {
            ss.addEventListener("zhangsan", "error")
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Worker add listener 2st param must be callable")
            ss.onexit = function () {
                isTerminate = true
            }
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

    // check worker addEventListener function is ok
    /**
     * @tc.name: threadWorker_addEventListener_test_006
     * @tc.desc: Add an event listener to the Worker when throw error.
     */
     it('threadWorker_addEventListener_test_006', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        try {
            ss.addEventListener()
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("worker add listener param count must be not less than 2.")
            ss.onexit = function () {
                isTerminate = true
            }
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

    // check worker addEventListener function is ok
    /**
     * @tc.name: threadWorker_addEventListener_test_007
     * @tc.desc: Add an event listener to the Worker when throw error.
     */
     it('threadWorker_addEventListener_test_007', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        try {
            ss.addEventListener("zhangsan", ()=>{
                times++
            })

            ss.dispatchEvent({type: "zhangsan", timeStamp: 0})

            ss.onexit = function () {
                isTerminate = true
            }
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }

            ss.addEventListener("lisi", ()=>{
                times++
            })

        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Worker instance is not running, maybe worker is terminated")
            done()
        }
    })

    // check worker addEventListener function is ok
    /**
     * @tc.name: threadWorker_addEventListener_test_008
     * @tc.desc: Add an event listener to the Worker when throw error.
     */
     it('threadWorker_addEventListener_test_008', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        try {
            ss.addEventListener("zhangsan", ()=>{
                times++
            })

            ss.dispatchEvent({type: "zhangsan", timeStamp: 0})

            ss.onexit = function () {
                isTerminate = true
            }
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Worker instance is not running, maybe worker has been terminated")
            done()
        }
    })

    // check worker off function is ok
    /**
     * @tc.name: threadWorker_off_test_001
     * @tc.desc: Removes an event listener to the worker.
     */
    it('threadWorker_off_test_001', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let zhangSanTimes = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.on("zhangsan", ()=>{
            zhangSanTimes++
        })

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        expect(zhangSanTimes).assertEqual(1)

        ss.off("zhangsan")

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(zhangSanTimes).assertEqual(1)
        done()
    })

    // check worker off function is ok
    /**
     * @tc.name: threadWorker_off_test_002
     * @tc.desc: Removes an event listener to the worker.
     */
    it('threadWorker_off_test_002', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let zhangSanTimes = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.on("zhangsan", ()=>{
            zhangSanTimes++
        })

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        expect(zhangSanTimes).assertEqual(2)

        for (let i=0;i<3;i++)
        {
            ss.off("zhangsan")
        }

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(zhangSanTimes).assertEqual(2)
        done()
    })

    // check worker off function is ok
    /**
     * @tc.name: threadWorker_off_test_003
     * @tc.desc: Removes an event listener to the worker when throw error.
     */
     it('threadWorker_off_test_003', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let zhangSanTimes = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.on("zhangsan", ()=>{
            zhangSanTimes++
        })

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        try {
            ss.off("zhangsan")
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Worker instance is not running, maybe worker is terminated")
            done()
        }
    })

    // check worker off function is ok
    /**
     * @tc.name: threadWorker_off_test_004
     * @tc.desc: Removes an event listener to the worker when throw error.
     */
     it('threadWorker_off_test_004', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let zhangSanTimes = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.on("zhangsan", ()=>{
            zhangSanTimes++
        })
        try {
            ss.off()
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("the remove listener param must be not less than 1")
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

    // check worker off function is ok
    /**
     * @tc.name: threadWorker_off_test_005
     * @tc.desc: Removes an event listener to the worker when throw error.
     */
     it('threadWorker_off_test_005', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let zhangSanTimes = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.on("zhangsan", ()=>{
            zhangSanTimes++
        })
        try {
            ss.off(1)
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("the type of remove listener 1st param must be string")
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

    // check worker removeEventListener function is ok
    /**
     * @tc.name: threadWorker_removeListener_test_001
     * @tc.desc: Removes an event defined for the worker.
     */
    it('threadWorker_removeListener_test_001', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let zhangSanTimes = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.addEventListener("zhangsan", ()=>{
            zhangSanTimes++
        })

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        expect(zhangSanTimes).assertEqual(1)

        ss.removeEventListener("zhangsan")

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(zhangSanTimes).assertEqual(1)
        done()
    })

    // check worker removeEventListener function is ok
    /**
     * @tc.name: threadWorker_removeListener_test_002
     * @tc.desc: Removes an event defined for the worker.
     */
    it('threadWorker_removeListener_test_002', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let zhangSanTimes = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.addEventListener("zhangsan", ()=>{
            zhangSanTimes++
        })

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        expect(zhangSanTimes).assertEqual(2)

        for (let i=0;i<3;i++)
        {
            ss.removeEventListener("zhangsan")
        }

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(zhangSanTimes).assertEqual(2)
        done()
    })

    // check worker removeAllListener function is ok
    /**
     * @tc.name: threadWorker_removeListener_test_003
     * @tc.desc: Removes an event defined for the worker.
     */
    it('threadWorker_removeListener_test_003', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let zhangSanTimes = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.addEventListener("zhangsan", ()=>{
            zhangSanTimes++
        })

        let liSiTimes = 0
        ss.addEventListener("lisi", ()=>{
            liSiTimes++
        })

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        expect(zhangSanTimes).assertEqual(2)

        ss.dispatchEvent({type: "lisi", timeStamp: 0})
        ss.dispatchEvent({type: "lisi", timeStamp: 0})
        expect(liSiTimes).assertEqual(2)

        ss.removeAllListener()
        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        expect(zhangSanTimes).assertEqual(2)

        ss.dispatchEvent({type: "lisi", timeStamp: 0})
        ss.dispatchEvent({type: "lisi", timeStamp: 0})

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(liSiTimes).assertEqual(2)
        done()
    })

    // check worker removeAllListener function is ok
    /**
     * @tc.name: threadWorker_removeListener_test_004
     * @tc.desc: Removes an event defined for the worker when throw error.
     */
     it('threadWorker_removeListener_test_004', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let zhangSanTimes = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.addEventListener("zhangsan", ()=>{
            zhangSanTimes++
        })
        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        try {
            ss.removeAllListener()
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Worker instance is not running, maybe worker is terminated")
            done()
        }
    })

    // check worker removeAllListener function is ok
    /**
     * @tc.name: threadWorker_removeListener_test_005
     * @tc.desc: Removes an event defined for the worker when throw error.
     */
     it('threadWorker_removeListener_test_005', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let zhangSanTimes = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.addEventListener("zhangsan", ()=>{
            zhangSanTimes++
        })
        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        try {
            ss.removeEventListener("zhangsan")
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Worker instance is not running, maybe worker is terminated")
            done()
        }
    })

    // check worker removeAllListener function is ok
    /**
     * @tc.name: threadWorker_removeListener_test_006
     * @tc.desc: Removes an event defined for the worker when throw error.
     */
     it('threadWorker_removeListener_test_006', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let zhangSanTimes = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.addEventListener("zhangsan", ()=>{
            zhangSanTimes++
        })
        try {
            ss.removeEventListener()
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("the remove listener param must be not less than 1")
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

    // check worker removeAllListener function is ok
    /**
     * @tc.name: threadWorker_removeListener_test_007
     * @tc.desc: Removes an event defined for the worker when throw error.
     */
     it('threadWorker_removeListener_test_007', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker.js")

        let zhangSanTimes = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.addEventListener("zhangsan", ()=>{
            zhangSanTimes++
        })
        try {
            ss.removeEventListener(1)
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("the type of remove listener 1st param must be string")
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

    // check parentPort.close is ok
    /**
     * @tc.name: threadWorker_parentPortClose_test_001
     * @tc.desc: Close the worker thread to stop the worker from receiving messages.
     */
    it('threadWorker_parentPortClose_test_001', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_008.js")
        let res = 0
        let flag = false

        ss.onexit = function (e) {
            res++
            flag = true
        }

        ss.postMessage("abc")
        while (!flag) {
            await promiseCase()
        }

        expect(res).assertEqual(1)
        done()
    })

    // check parentPort.close is ok
    /**
     * @tc.name: threadWorker_parentPortClose_test_002
     * @tc.desc: Close the worker thread to stop the worker from receiving messages.
     */
    it('threadWorker_parentPortClose_test_002', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_008.js")
        let res = 0
        let flag = false

        ss.onexit = function () {
            flag = true
        }

        ss.onmessage = function (e) {
            res++
        }

        ss.postMessage("abc")
        while (!flag) {
            await promiseCase()
        }

        try {
            ss.postMessage("hello")
        } catch (error) {
            expect(res).assertEqual(0)
            expect(error.name).assertEqual("BusinessError")
            let msg = "Worker instance is not running, maybe worker is terminated when PostMessage"
            expect(error.message).assertEqual(msg)

            done()
        }        
    })

    // check onmessageerror is ok
    /**
     * @tc.name: threadWorker_onmessageerror_test_001
     * @tc.desc: The onmessage attribute of the worker specifies the event handler when the worker receives 
       a message that cannot be serialized. The event handler is executed in the host thread
     */
    it('threadWorker_onmessageerror_test_001', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_008.js")
        let res = 0
        let flag = false

        ss.onexit = function () {
            flag = true
        }

        ss.onmessageerror = function (e) {
            res++
        }

        ss.postMessage("abc")
        while (!flag) {
            await promiseCase()
        }
        expect(res).assertEqual(0)
        done()
    })

    // check onmessageerror is ok
    /**
     * @tc.name: threadWorker_onmessageerror_test_002
     * @tc.desc: The onmessage attribute of the worker specifies the event handler when the worker receives 
       a message that cannot be serialized. The event handler is executed in the host thread
     */
    it('threadWorker_onmessageerror_test_002', 0, async function (done) {
        try {
            var ss = new worker.ThreadWorker("entry/ets/workers/newworker_008.js")
            var res = 0
            var flag = false
            ss.onexit = function() {
                flag = true
                res++
            }
            ss.onmessageerror = function (e) {
                flag = true
                res++
            }
            var message = Symbol(42)
            ss.postMessage(message)
        } catch (error) {
            while (!flag) {
                await promiseCase()
            }
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Serializing an uncaught exception failed, failed to serialize message.")
            flag = false
            ss.terminate()
            while (!flag) {
                await promiseCase()
            }
            expect(res).assertEqual(2)
            done()
        }
    })

    // check new second worker is ok
    /**
     * @tc.name: threadWorker_new_second_worker_test_001
     * @tc.desc: Create a second worker.
     */
    it('threadWorker_new_second_worker_test_001', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_009.js")
        let flag = false
        let res = undefined
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }

        ss.onmessage = function (e) {
            flag = true
            res = e.data
        }

        ss.postMessage({type: "new", value: 12})
        while (!flag) {
            console.log("worker:: foo wait")
            await promiseCase()
        }

        console.log("worker:: " + res)
        expect(res).assertTrue()

        flag = false
        ss.postMessage({type: "terminate"})
        while (!flag) {
            ss.postMessage({type: "wait"})
            await promiseCase()
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        done()
    })

    // check new third worker is ok
    /**
     * @tc.name: threadWorker_new_second_worker_test_002
     * @tc.desc: Create a third worker.
     */
    it('threadWorker_new_second_worker_test_002', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_012.js")
        let flag = false
        let res = undefined
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.onmessage = function (e) {
            flag = true
            res = e.data
        }

        ss.onerror = function(ee) {
            console.log("worker:: " + ee.message)
        }

        ss.postMessage({type: "new", value: 12})
        while (!flag) {
            ss.postMessage({type: "wait"})
            await promiseCase()
        }
        expect(res).assertTrue()

        flag = false
        ss.postMessage({type: "terminate"})
        while (!flag) {
            ss.postMessage({type: "wait"})
            await promiseCase()
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        done()
    })

    // check second worker postMessage number is ok
    /**
     * @tc.name: threadWorker_second_worker_postMessage_test_001
     * @tc.desc: Check if the postMessage function of the second worker is ok.
     */
    it('threadWorker_second_worker_postMessage_test_001', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_010.js")
        let flag = false
        let res = undefined
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.onmessage = function (e) {
            flag = true
            res = e.data
        }

        ss.onerror = function(ee) {
            console.log("worker:: " + ee.message)
        }

        ss.postMessage({type: "new", value: 12})
        while (!flag) {
            ss.postMessage({type: "wait"})
            await promiseCase()
        }
        expect(res).assertEqual(25)

        flag = false
        ss.postMessage({type: "terminate"})
        while (!flag) {
            ss.postMessage({type: "wait"})
            await promiseCase()
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        done()
    })

    // check second worker postMessage string is ok
    /**
     * @tc.name: threadWorker_second_worker_postMessage_test_002
     * @tc.desc: Check if the postMessage function of the second worker is ok.
     */
    it('threadWorker_second_worker_postMessage_test_002', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_013.js")
        let flag = false
        let res = undefined
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.onmessage = function (e) {
            flag = true
            res = e.data
        }

        ss.onerror = function(ee) {
            console.log("worker:: " + ee.message)
        }

        ss.postMessage({type: "new", value: "hello world"})
        while (!flag) {
            ss.postMessage({type: "wait"})
            await promiseCase()
        }
        expect(res).assertEqual("hello world worker")

        flag = false
        ss.postMessage({type: "terminate"})
        while (!flag) {
            ss.postMessage({type: "wait"})
            await promiseCase()
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        done()
    })

    // check second worker postMessage array is ok
    /**
     * @tc.name: threadWorker_second_worker_postMessage_test_003
     * @tc.desc: Check if the postMessage function of the second worker is ok.
     */
    it('threadWorker_second_worker_postMessage_test_003', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_014.js")
        let flag = false
        let res = undefined
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.onmessage = function (e) {
            flag = true
            res = e.data
        }

        ss.onerror = function(ee) {
            console.log("worker:: " + ee.message)
        }

        ss.postMessage({type: "new", value: [1, 2]})
        while (!flag) {
            ss.postMessage({type: "wait"})
            await promiseCase()
        }
        expect(res[0]).assertEqual(2)
        expect(res[1]).assertEqual(2)

        flag = false
        ss.postMessage({type: "terminate"})
        while (!flag) {
            ss.postMessage({type: "wait"})
            await promiseCase()
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        done()
    })

    // check third worker postMessage is ok
    /**
     * @tc.name: threadWorker_third_worker_postMessage_test_001
     * @tc.desc: Check if the postMessage function of the third worker is ok.
     */
    it('threadWorker_third_worker_postMessage_test_001', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_015.js")
        let flag = false
        let res = undefined
        let isTerminate = false

        ss.onexit = function() {
            isTerminate = true
        }
        ss.onmessage = function(e) {
            flag = true
            res = e.data
        }
        ss.onerror = function(ee) {
            console.log("worker:: " + ee.message)
        }

        ss.postMessage({type: "new", value: 10})
        while (!flag) {
            ss.postMessage({type: "wait"})
            await promiseCase()
        }
        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(res).assertEqual(16)

        done()
    })

    // check second worker terminate is ok
    /**
     * @tc.name: threadWorker_second_worker_terminate_test_001
     * @tc.desc: Check if the terminate function of the second worker is ok.
     */
    it('threadWorker_second_worker_terminate_test_001', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_011.js")
        let flag = false
        let res = undefined
        let isTerminate = false

        ss.onexit = function() {
            isTerminate = true
        }

        ss.onmessage = function(e) {
            flag = true
            res = e.data
        }

        ss.onerror = function(ee) {
            console.log("worker:: " + ee.message)
        }

        ss.postMessage({type: "new", value: 12})
        while (!flag) {
            ss.postMessage({type: "wait"})
            await promiseCase()
        }

        flag = false
        ss.postMessage({type: "terminate"})
        while (!flag) {
            ss.postMessage({type: "wait"})
            await promiseCase()
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(res).assertEqual("terminate")
        done()
    })

    function CreateArray(type,b) {
        switch(type) {
            case 0 :
                return new Int8Array(b);
            case 1 :
                return new Int16Array(b);
            case 2 :
                return new Int32Array(b);
            case 3 :
                return new Uint8Array(b);
            case 4 :
                return new Uint16Array(b);
            case 5 :
                return new Uint32Array(b);
            case 6 :
                return new Float32Array(b);
            case 7 :
                return new Float64Array(b);
            case 8 :
                return new BigInt64Array(b);
            case 9 :
                return new BigUint64Array(b);
            default :
                return;
        }
    }

    // Check the transmission types supported by Worker is ok.
    /**
     * @tc.name: threadWorker_support_types_test_001
     * @tc.desc: Check the transmission types supported by Worker is ok.
     */
    it('threadWorker_support_types_test_001', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_016.js");
        let array = []
        for (let i = 0; i < 10; i++) {
            array[i] = CreateArray(i, 62);
        }

        let res = 0;
        let flag = 0;
        let isTerminate = false;
        ss.onmessage = function(d) {
            res += d.data;
            flag += 1;
        }
        ss.onexit = function() {
            isTerminate = true;
        }

        for (let i = 0; i < 10; i++) {
            ss.postMessage(array[i]);
        }

        while (flag != 10) {
            await promiseCase();
        }

        ss.terminate();
        while (!isTerminate) {
            await promiseCase();
        }
        expect(res).assertEqual(620)

        done();
    })

    // Check the transmission types supported by Worker is ok.
    /**
     * @tc.name: threadWorker_support_types_test_002
     * @tc.desc: Check the transmission types supported by Worker is ok.
     */
    it('threadWorker_support_types_test_002', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_017.js");
        let res;
        let flag = false;
        let isTerminate = false;
        ss.onmessage = function(d) {
            res = d.data.name;
            flag = true;
        }
        ss.onexit = function() {
            isTerminate = true;
        }
        ss.postMessage("start");
        while (!flag) {
            await promiseCase();
        }

        ss.terminate();
        while (!isTerminate) {
            await promiseCase();
        }
        expect(res).assertEqual("worker")

        done();
    })

    // Check the transmission types supported by Worker is ok.
    /**
     * @tc.name: threadWorker_support_types_test_003
     * @tc.desc: Check the transmission types supported by Worker is ok.
     */
    it('threadWorker_support_types_test_003', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_018.js");
        let res;
        let flag = false;
        let isTerminate = false;
        ss.onmessage = function(d) {
            res = d.data;
            flag = true;
        }
        ss.onexit = function() {
            isTerminate = true;
        }
        const data = new Set();
        ss.postMessage(data);
        while (!flag) {
            await promiseCase();
        }

        ss.terminate();
        while (!isTerminate) {
            await promiseCase();
        }
        expect(res.has(1)).assertTrue()
        expect(res.has(2)).assertTrue()
        expect(!res.has(1010)).assertTrue()
        done();
    })

    // Check the transmission types supported by Worker is ok.
    /**
     * @tc.name: threadWorker_support_types_test_004
     * @tc.desc: Check the transmission types supported by Worker is ok.
     */
    it('threadWorker_support_types_test_004', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_019.js");
        let res;
        let flag = false;
        let isTerminate = false;
        ss.onmessage = function(d) {
            res = d.data;
            flag = true;
        }
        ss.onexit = function() {
            isTerminate = true;
        }
        const data = new Map();
        ss.postMessage(data);
        while (!flag) {
            await promiseCase();
        }

        ss.terminate();
        while (!isTerminate) {
            await promiseCase();
        }
        expect(res.get("worker")).assertEqual("success");
        done();
    })

    // Check the transmission types supported by Worker is ok.
    /**
     * @tc.name: threadWorker_support_types_test_005
     * @tc.desc: Check the transmission types supported by Worker is ok.
     */
    it('threadWorker_support_types_test_005', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_020.js");
        let res;
        let flag = false;
        let isTerminate = false;
        ss.onmessage = function(d) {
            res = d.data;
            flag = true;
        }
        ss.onexit = function() {
            isTerminate = true;
        }
        const buffer = new ArrayBuffer(8);
        ss.postMessage(buffer);
        while (!flag) {
            await promiseCase();
        }

        ss.terminate();
        while (!isTerminate) {
            await promiseCase();
        }
        expect(res[res.length - 1]).assertEqual(3);
        done();
    })

    // Check the transmission types supported by Worker is ok.
    /**
     * @tc.name: threadWorker_support_types_test_006
     * @tc.desc: Check the transmission types supported by Worker is ok.
     */
    it('threadWorker_support_types_test_006', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_021.js");
        let res;
        let flag = false;
        let isTerminate = false;
        ss.onmessage = function(d) {
            res = d.data;
            flag = true;
        }
        ss.onexit = function() {
            isTerminate = true;
        }
        var re = new RegExp("(\\w+)\\s(\\w+)");
        ss.postMessage(re);
        while (!flag) {
            await promiseCase();
        }

        ss.terminate();
        while (!isTerminate) {
            await promiseCase();
        }
        expect(res).assertEqual("Worker, HI!");
        done();
    })

    // Check the transmission types supported by Worker is ok.
    /**
     * @tc.name: threadWorker_support_types_test_007
     * @tc.desc: Check the transmission types supported by Worker is ok.
     */
    it('threadWorker_support_types_test_007', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_021.js");
        let flag = false;
        let isTerminate = false;
        ss.onmessageerror = function(d) {
            flag = true;
        }
        ss.onexit = function() {
            isTerminate = true;
        }
        try {
            const data = Symbol();
            ss.postMessage(data);
        } catch (error) {
            console.info("worker:: recv error message: " + error.message);
            while (!flag) {
                await promiseCase();
            }
            ss.terminate();
            while (!isTerminate) {
                await promiseCase();
            }
        }
        expect(flag).assertTrue();
        done();
    })

    // Check the postmessage of worker is ok.
    /**
     * @tc.name: threadWorker_worker_postmessage_test_001
     * @tc.desc: Check the postmessage of worker is ok.
     */
    it('threadWorker_worker_postmessage_test_001', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_022.js");
        let res = "";
        let flag = false;
        let isTerminate = false;
        ss.onmessage = function (d) {
            res = d.data;
            flag = true;
        }
        ss.onexit = function() {
            isTerminate = true;
        }
        ss.postMessage("1");
        while (!flag) {
            await promiseCase();
        }
        ss.terminate();
        while (!isTerminate) {
            await promiseCase();
        }
        expect(res).assertEqual("Worker param count must be more than 1 with new");
        done();
    })


    // Check the postmessage of worker is ok.
    /**
     * @tc.name: threadWorker_worker_postmessage_test_002
     * @tc.desc: Check the postmessage of worker is ok.
     */
    it('threadWorker_worker_postmessage_test_002', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_023.js");
        let res = "";
        let flag = false;
        let isTerminate = false;
        ss.onmessage = function (d) {
            res = d.data;
            flag = true;
        }
        ss.onexit = function() {
            isTerminate = true;
        }
        ss.postMessage("1");
        while (!flag) {
            await promiseCase();
        }
        ss.terminate();
        while (!isTerminate) {
            await promiseCase();
        }
        expect(res).assertEqual("Transfer list must be an Array");
        done();
    })

    // Check the postmessage of worker is ok.
    /**
     * @tc.name: threadWorker_worker_postmessage_test_003
     * @tc.desc: Check the postmessage of worker is ok.
     */
    it('threadWorker_worker_postmessage_test_003', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_024.js");
        let res = "";
        let flag = false;
        let isTerminate = false;
        ss.onmessage = function (d) {
            res = d.data;
            flag = true;
        }
        ss.onexit = function() {
            isTerminate = true;
        }
        ss.postMessage("1")
        while (!flag) {
            await promiseCase();
        }
        ss.terminate();
        while (!isTerminate) {
            await promiseCase();
        }
        expect(res).assertEqual("Serializing an uncaught exception failed, failed to serialize message.");
        done();
    })

    // Check the close of worker is ok.
    /**
     * @tc.name: threadWorker_worker_close_test_001
     * @tc.desc: Check the close of worker is ok.
     */
    it('threadWorker_worker_close_test_001', 0, async function (done) {
        let ss = new worker.ThreadWorker("entry/ets/workers/newworker_025.js");
        let res = 0;
        let isTerminate = false;
        ss.onexit = function() {
            res += 1
            isTerminate = true;
        }
        ss.postMessage("1");
        while (!isTerminate) {
            await promiseCase();
        }

        expect(res == 1).assertTrue();
        done();
    })
})
}