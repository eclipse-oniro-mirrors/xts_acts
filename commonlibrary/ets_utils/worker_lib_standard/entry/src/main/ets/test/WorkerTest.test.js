/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import worker from '@ohos.worker'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
export default function WorkerTest() {
describe('WorkerTest', function () {

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

    /**
     * @tc.name: worker_constructor_test_001
     * @tc.desc: worker constructor to Creates a worker instance.
     * @tc.author: hanyuqing
     */
    it('worker_constructor_test_001', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker.js")
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
     * @tc.name: worker_constructor_test_002
     * @tc.desc: worker constructor to Creates a worker instance.
     * @tc.author: hanyuqing
     */
    it('worker_constructor_test_002', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker.js", {name:"1st worker", shared: false})
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
     * @tc.name: worker_constructor_test_003
     * @tc.desc: worker constructor to Creates a worker instance.
     * @tc.author: hanyuqing
     */
    it('worker_constructor_test_003', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker.js", {type:"classic", name:"2st worker", shared: false})
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
     * @tc.name: worker_constructor_test_004
     * @tc.desc: worker constructor to Creates a worker instance.
     * @tc.author: hanyuqing
     */
    it('worker_constructor_test_004', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker.js", {type:"classic", name:"3st worker", shared: true})
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
     * @tc.name: worker_constructor_test_005
     * @tc.desc: worker constructor to Creates a worker instance.
     */
    it('worker_constructor_test_005', 0, async function (done) {
        let ss = new worker.Worker("/entry/ets/workers/worker.js");
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
     * @tc.name: worker_constructor_test_006
     * @tc.desc: worker constructor to Creates a worker instance.
     */
    it('worker_constructor_test_006', 0, async function (done) {
        let ss = new worker.Worker("@bundle:com.example.workertest/entry/ets/workers/worker.js");
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
     * @tc.name: worker_postMessage_test_001
     * @tc.desc: Sends a message to the worker thread.
     * @tc.author: hanyuqing
     */
    it('worker_postMessage_test_001', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker_002.js")

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
     * @tc.name: worker_postMessage_test_002
     * @tc.desc: Sends a message to the worker thread.
     * @tc.author: hanyuqing
     */
    it('worker_postMessage_test_002', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker_003.js")

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
     * @tc.name: worker_postMessage_test_003
     * @tc.desc: Sends a message to the worker thread.
     * @tc.author: hanyuqing
     */
    it('worker_postMessage_test_003', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker_004.js")

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
     * @tc.name: worker_postMessage_test_004
     * @tc.desc: Sends a message to the worker thread.
     * @tc.author: hanyuqing
     */
    it('worker_postMessage_test_004', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker_005.js", {name: "zhangsan"})

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
     * @tc.name: worker_postMessage_test_005
     * @tc.desc: Sends a message to the worker thread.
     * @tc.author: hanyuqing
     */
    it('worker_postMessage_test_005', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker_006.js")
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
     * @tc.name: worker_postMessage_test_006
     * @tc.desc: Sends a message to the worker thread.
     * @tc.author: hanyuqing
     */
    it('worker_postMessage_test_006', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker_007.js")

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

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(res).assertEqual("Error: 123")
        done()
    })

    // check worker terminate is ok
    /**
     * @tc.name: worker_terminate_test_001
     * @tc.desc: Terminates the worker thread to stop the worker from receiving messages.
     * @tc.author: hanyuqing
     */
    it('worker_terminate_test_001', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker.js")
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
     * @tc.name: worker_terminate_test_002
     * @tc.desc: Terminates the worker thread to stop the worker from receiving messages.
     * @tc.author: hanyuqing
     */
    it('worker_terminate_test_002', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker.js")
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
     * @tc.name: worker_terminate_test_003
     * @tc.desc: Terminates the worker thread to stop the worker from receiving messages.
     * @tc.author: hanyuqing
     */
    it('worker_terminate_test_003', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker.js")
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

        ss.postMessage("hello world")
        await promiseCase()
        expect(res).assertEqual(1)
        done()
    })

    // check worker on function is ok
    /**
     * @tc.name: worker_on_test_001
     * @tc.desc: Adds an event listener to the worker.
     * @tc.author: hanyuqing
     */
    it('worker_on_test_001', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker.js")

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
     * @tc.name: worker_on_test_002
     * @tc.desc: Adds an event listener to the worker.
     * @tc.author: hanyuqing
     */
    it('worker_on_test_002', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker.js")

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
     * @tc.name: worker_on_test_003
     * @tc.desc: Adds an event listener to the worker.
     * @tc.author: hanyuqing
     */
    it('worker_on_test_003', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker.js")

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

    // check worker once function is ok
    /**
     * @tc.name: worker_once_test_001
     * @tc.desc: Adds an event listener to the worker and removes the event listener automically
       after it is invoked once.
     * @tc.author: hanyuqing
     */
    it('worker_once_test_001', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker.js")

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
     * @tc.name: worker_once_test_002
     * @tc.desc: Adds an event listener to the worker and removes the event listener automically
       after it is invoked once.
     * @tc.author: hanyuqing
     */
    it('worker_once_test_002', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker.js")

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
     * @tc.name: worker_once_test_003
     * @tc.desc: Adds an event listener to the worker and removes the event listener automically
       after it is invoked once.
     * @tc.author: hanyuqing
     */
    it('worker_once_test_003', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker.js")

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

    // check worker addEventListener function is ok
    /**
     * @tc.name: worker_addEventListener_test_001
     * @tc.desc: Add an event listener to the Worker.
     * @tc.author: hanyuqing
     */
    it('worker_addEventListener_test_001', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker.js")

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
     * @tc.name: worker_addEventListener_test_002
     * @tc.desc: Add an event listener to the Worker.
     * @tc.author: hanyuqing
     */
    it('worker_addEventListener_test_002', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker.js")

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
     * @tc.name: worker_addEventListener_test_003
     * @tc.desc: Add an event listener to the Worker.
     * @tc.author: hanyuqing
     */
    it('worker_addEventListener_test_003', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker.js")

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

    // check worker off function is ok
    /**
     * @tc.name: worker_off_test_001
     * @tc.desc: Removes an event listener to the worker.
     * @tc.author: hanyuqing
     */
    it('worker_off_test_001', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker.js")

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
     * @tc.name: worker_off_test_002
     * @tc.desc: Removes an event listener to the worker.
     * @tc.author: hanyuqing
     */
    it('worker_off_test_002', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker.js")

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

    // check worker removeEventListener function is ok
    /**
     * @tc.name: worker_removeListener_test_001
     * @tc.desc: Removes an event defined for the worker.
     * @tc.author: hanyuqing
     */
    it('worker_removeListener_test_001', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker.js")

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
     * @tc.name: worker_removeListener_test_002
     * @tc.desc: Removes an event defined for the worker.
     * @tc.author: hanyuqing
     */
    it('worker_removeListener_test_002', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker.js")

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
     * @tc.name: worker_removeListener_test_003
     * @tc.desc: Removes an event defined for the worker.
     * @tc.author: hanyuqing
     */
    it('worker_removeListener_test_003', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker.js")

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

    // check parentPort.close is ok
    /**
     * @tc.name: worker_parentPortClose_test_001
     * @tc.desc: Close the worker thread to stop the worker from receiving messages.
     * @tc.author: hanyuqing
     */
    it('worker_parentPortClose_test_001', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker_008.js")
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
     * @tc.name: worker_parentPortClose_test_002
     * @tc.desc: Close the worker thread to stop the worker from receiving messages.
     * @tc.author: hanyuqing
     */
    it('worker_parentPortClose_test_002', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker_008.js")
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

        ss.postMessage("hello")
        await promiseCase()
        expect(res).assertEqual(0)
        done()
    })

    // check onmessageerror is ok
    /**
     * @tc.name: worker_onmessageerror_test_001
     * @tc.desc: The onmessage attribute of the worker specifies the event handler when the worker receives 
       a message that cannot be serialized. The event handler is executed in the host thread
     * @tc.author: hanyuqing
     */
    it('worker_onmessageerror_test_001', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker_008.js")
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
     * @tc.name: worker_onmessageerror_test_002
     * @tc.desc: The onmessage attribute of the worker specifies the event handler when the worker receives 
       a message that cannot be serialized. The event handler is executed in the host thread
     * @tc.author: hanyuqing
     */
    it('worker_onmessageerror_test_002', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker_008.js")
        let res = 0
        let flag = false

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
        while (!flag) {
            await promiseCase()
        }
        flag = false
        ss.terminate()
        while (!flag) {
            await promiseCase()
        }

        expect(res).assertEqual(2)
        done()
    })

    // check new second worker is ok
    /**
     * @tc.name: worker_new_second_worker_test_001
     * @tc.desc: Create a second worker.
     * @tc.author: hanyuqing
     */
    it('worker_new_second_worker_test_001', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker_009.js")
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
     * @tc.name: worker_new_second_worker_test_002
     * @tc.desc: Create a third worker.
     * @tc.author: hanyuqing
     */
    it('worker_new_second_worker_test_002', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker_012.js")
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
     * @tc.name: worker_second_worker_postMessage_test_001
     * @tc.desc: Check if the postMessage function of the second worker is ok.
     * @tc.author: hanyuqing
     */
    it('worker_second_worker_postMessage_test_001', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker_010.js")
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
     * @tc.name: worker_second_worker_postMessage_test_002
     * @tc.desc: Check if the postMessage function of the second worker is ok.
     * @tc.author: hanyuqing
     */
    it('worker_second_worker_postMessage_test_002', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker_013.js")
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
     * @tc.name: worker_second_worker_postMessage_test_003
     * @tc.desc: Check if the postMessage function of the second worker is ok.
     * @tc.author: hanyuqing
     */
    it('worker_second_worker_postMessage_test_003', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker_014.js")
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
     * @tc.name: worker_third_worker_postMessage_test_001
     * @tc.desc: Check if the postMessage function of the third worker is ok.
     * @tc.author: hanyuqing
     */
    it('worker_third_worker_postMessage_test_001', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker_015.js")
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
     * @tc.name: worker_second_worker_terminate_test_001
     * @tc.desc: Check if the terminate function of the second worker is ok.
     * @tc.author: hanyuqing
     */
    it('worker_second_worker_terminate_test_001', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker_011.js")
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
     * @tc.name: worker_support_types_test_001
     * @tc.desc: Check the transmission types supported by Worker is ok.
     */
    it('worker_support_types_test_001', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker_016.js");
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
     * @tc.name: worker_support_types_test_002
     * @tc.desc: Check the transmission types supported by Worker is ok.
     */
    it('worker_support_types_test_002', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker_017.js");
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
     * @tc.name: worker_support_types_test_003
     * @tc.desc: Check the transmission types supported by Worker is ok.
     */
    it('worker_support_types_test_003', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker_018.js");
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
     * @tc.name: worker_support_types_test_004
     * @tc.desc: Check the transmission types supported by Worker is ok.
     */
    it('worker_support_types_test_004', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker_019.js");
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
     * @tc.name: worker_support_types_test_005
     * @tc.desc: Check the transmission types supported by Worker is ok.
     */
    it('worker_support_types_test_005', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker_020.js");
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
     * @tc.name: worker_support_types_test_006
     * @tc.desc: Check the transmission types supported by Worker is ok.
     */
    it('worker_support_types_test_006', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker_021.js");
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
     * @tc.name: worker_support_types_test_007
     * @tc.desc: Check the transmission types supported by Worker is ok.
     */
    it('worker_support_types_test_007', 0, async function (done) {
        let ss = new worker.Worker("entry/ets/workers/worker_021.js");
        let flag = false;
        let isTerminate = false;
        ss.onmessageerror = function(d) {
            console.info("worker:: unsupport the Symbol.");
            flag = true;
        }
        ss.onexit = function() {
            isTerminate = true;
        }
        const data = Symbol();
        ss.postMessage(data);
        while (!flag) {
            await promiseCase();
        }
        ss.terminate();
        while (!isTerminate) {
            await promiseCase();
        }

        expect(flag).assertTrue();
        done();
    })
})
}