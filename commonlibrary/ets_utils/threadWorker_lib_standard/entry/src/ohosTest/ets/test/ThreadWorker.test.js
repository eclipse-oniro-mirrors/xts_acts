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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
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
     * @tc.name   threadWorker_constructor_test_001
     * @tc.number threadWorker_constructor_test_001
     * @tc.desc   worker constructor to Creates a worker instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_constructor_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")
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
     * @tc.name   threadWorker_constructor_test_002
     * @tc.number threadWorker_constructor_test_002
     * @tc.desc   worker constructor to Creates a worker instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_constructor_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js", {name:"1st worker", shared: false})
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
     * @tc.name   threadWorker_constructor_test_003
     * @tc.number threadWorker_constructor_test_003
     * @tc.desc   worker constructor to Creates a worker instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_constructor_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js",
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
     * @tc.name   threadWorker_constructor_test_004
     * @tc.number threadWorker_constructor_test_004
     * @tc.desc   worker constructor to Creates a worker instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_constructor_test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js",
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
     * @tc.name   threadWorker_constructor_test_005
     * @tc.number threadWorker_constructor_test_005
     * @tc.desc   worker constructor to Creates a worker instance when throw error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_constructor_test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        try {
            let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js", {type:"other", name:"worker"})
        } catch (error) {
            expect(error.name == "BusinessError").assertTrue()
            expect(error.message == "Parameter error. The input parameters are invalid, the type must be classic," +
                " unsupport others now.").assertTrue()
            done()
        }
    })

    /**
     * @tc.name   threadWorker_constructor_test_006
     * @tc.number threadWorker_constructor_test_006
     * @tc.desc   worker constructor to Creates a worker instance when throw error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_constructor_test_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        try {
            let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js",
                                             {type:1, name:"new worker", shared: true})
        } catch (error) {
            expect(error.name == "BusinessError").assertTrue()
            expect(error.message == "Parameter error. The input parameters are invalid, the type of type's value " +
                "must be string.").assertTrue()
            done()
        }
    })

    /**
     * @tc.name   threadWorker_constructor_test_007
     * @tc.number threadWorker_constructor_test_007
     * @tc.desc   worker constructor to Creates a worker instance when throw error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_constructor_test_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        try {
            let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js", {type:"classic", name:1, shared: true})
        } catch (error) {
            expect(error.name == "BusinessError").assertTrue()
            expect(error.message == "Parameter error. The input parameters are invalid, the type of name must be " +
                "string.").assertTrue()
            done()
        }
    })

     /**
      * @tc.name   threadWorker_constructor_test_008
      * @tc.number threadWorker_constructor_test_008
      * @tc.desc   worker constructor to Creates a worker instance when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('threadWorker_constructor_test_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        try {
            let ss = new worker.ThreadWorker()
        } catch (error) {
            expect(error.name == "BusinessError").assertTrue()
            expect(error.message == "Parameter error. The input parameters are invalid, the number of parameters " +
                "must be more than 1.").assertTrue()
            done()
        }
    })

    /**
     * @tc.name   threadWorker_constructor_test_009
     * @tc.number threadWorker_constructor_test_009
     * @tc.desc   worker constructor to Creates a worker instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_constructor_test_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("/entry_test/ets/workers/newworker.js");
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
     * @tc.name   threadWorker_constructor_test_010
     * @tc.number threadWorker_constructor_test_010
     * @tc.desc   worker constructor to Creates a worker instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_constructor_test_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("@bundle:com.example.threadWorkertest/entry_test/ets/workers/newworker.js");
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
     * @tc.name   threadWorker_postMessage_test_001
     * @tc.number threadWorker_postMessage_test_001
     * @tc.desc   Sends a message to the worker thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_postMessage_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_002.js")

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
     * @tc.name   threadWorker_postMessage_test_002
     * @tc.number threadWorker_postMessage_test_002
     * @tc.desc   Sends a message to the worker thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_postMessage_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_003.js")

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
    /**
     * @tc.name   threadWorker_postMessage_test_003
     * @tc.number threadWorker_postMessage_test_003
     * @tc.desc   Sends a message to the worker thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_postMessage_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_004.js")

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
     * @tc.name   threadWorker_postMessage_test_004
     * @tc.number threadWorker_postMessage_test_004
     * @tc.desc   Sends a message to the worker thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_postMessage_test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_005.js", {name: "zhangsan"})

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
     * @tc.name   threadWorker_postMessage_test_005
     * @tc.number threadWorker_postMessage_test_005
     * @tc.desc   Sends a message to the worker thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_postMessage_test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_006.js")
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
     * @tc.name   threadWorker_postMessage_test_006
     * @tc.number threadWorker_postMessage_test_006
     * @tc.desc   Sends a message to the worker thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_postMessage_test_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        const ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_007.js")

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
      * @tc.name   threadWorker_postMessage_test_007
      * @tc.number threadWorker_postMessage_test_007
      * @tc.desc   Sends a message to the worker thread when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('threadWorker_postMessage_test_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_007.js");
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
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, Worker " +
                "messageObject must be not null with postMessage");
        }
        done();
    })

    // check worker handle error is ok
    /**
     * @tc.name   threadWorker_postMessage_test_008
     * @tc.number threadWorker_postMessage_test_008
     * @tc.desc   Sends a message to the worker thread when throw error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_postMessage_test_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_007.js");
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
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the type of the " +
                "transfer list must be an array.");
        }
        done();
    })

    // check worker terminate is ok
    /**
     * @tc.name   threadWorker_terminate_test_001
     * @tc.number threadWorker_terminate_test_001
     * @tc.desc   Terminates the worker thread to stop the worker from receiving messages.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_terminate_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")
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
     * @tc.name   threadWorker_terminate_test_002
     * @tc.number threadWorker_terminate_test_002
     * @tc.desc   Terminates the worker thread to stop the worker from receiving messages.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_terminate_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")
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
     * @tc.name   threadWorker_terminate_test_003
     * @tc.number threadWorker_terminate_test_003
     * @tc.desc   Terminates the worker thread to stop the worker from receiving messages.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_terminate_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")
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
            let msg = "The Worker instance is not running, maybe worker is terminated when PostMessage"
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual(msg)
            done()
        }
    })

        // check worker terminate is ok
        /**
         * @tc.name   threadWorker_terminate_test_004
         * @tc.number threadWorker_terminate_test_004
         * @tc.desc   Terminates the worker thread to stop the worker from receiving messages.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('threadWorker_terminate_test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
            let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_002.js")
            let res = 0
            let flag = false

            ss.onexit = function () {
                flag = true
                res++
            }
            for (let i = 0; i < 10; i++) {
                ss.terminate();
            }
            while (!flag) {
                await promiseCase()
            }
            expect(res).assertEqual(1)
            done()
        })

    // check worker on function is ok
    /**
     * @tc.name   threadWorker_on_test_001
     * @tc.number threadWorker_on_test_001
     * @tc.desc   Adds an event listener to the worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_on_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

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
     * @tc.name   threadWorker_on_test_002
     * @tc.number threadWorker_on_test_002
     * @tc.desc   Adds an event listener to the worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_on_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

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
     * @tc.name   threadWorker_on_test_003
     * @tc.number threadWorker_on_test_003
     * @tc.desc   Adds an event listener to the worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_on_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

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
      * @tc.name   threadWorker_on_test_004
      * @tc.number threadWorker_on_test_004
      * @tc.desc   Adds an event listener to the worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('threadWorker_on_test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let isTerminate = false
        try {
            ss.on(1, ()=>{})
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the type of " +
                "listener first param must be string.")
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
      * @tc.name   threadWorker_on_test_005
      * @tc.number threadWorker_on_test_005
      * @tc.desc   Adds an event listener to the worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('threadWorker_on_test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let isTerminate = false
        try {
            ss.on("zhangSan", "error")
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the type of " +
                "listener the second param must be callable.")
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
      * @tc.name   threadWorker_on_test_006
      * @tc.number threadWorker_on_test_006
      * @tc.desc   Adds an event listener to the worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('threadWorker_on_test_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let isTerminate = false
        try {
            ss.on()
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the number of " +
                "listener parameters is not less than 2.")
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
        * @tc.name   threadWorker_on_test_007
        * @tc.number threadWorker_on_test_007
        * @tc.desc   Adds an event listener to the worker and removes the event listener automically
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL1
        */
       it('threadWorker_on_test_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

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
            expect(error.message).assertEqual("The Worker instance is not running, maybe worker is terminated")

            done()
        }
    })

    // check worker once function is ok
    /**
     * @tc.name   threadWorker_once_test_001
     * @tc.number threadWorker_once_test_001
     * @tc.desc   Adds an event listener to the worker and removes the event listener automically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_once_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

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
     * @tc.name   threadWorker_once_test_002
     * @tc.number threadWorker_once_test_002
     * @tc.desc   Adds an event listener to the worker and removes the event listener automically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_once_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

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
     * @tc.name   threadWorker_once_test_003
     * @tc.number threadWorker_once_test_003
     * @tc.desc   Adds an event listener to the worker and removes the event listener automically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_once_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

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
        * @tc.name   threadWorker_once_test_004
        * @tc.number threadWorker_once_test_004
        * @tc.desc   Adds an event listener to the worker and removes the event listener automically
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL1
        */
       it('threadWorker_once_test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        try {
            ss.once(1, ()=>{
                times++
            })
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the type of " +
                "listener first param must be string.")
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
        * @tc.name   threadWorker_once_test_005
        * @tc.number threadWorker_once_test_005
        * @tc.desc   Adds an event listener to the worker and removes the event listener automically
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL1
        */
       it('threadWorker_once_test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let isTerminate = false

        try {
            ss.once("zhangsan", "error")
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the type of " +
                "listener the second param must be callable.")
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
        * @tc.name   threadWorker_once_test_006
        * @tc.number threadWorker_once_test_006
        * @tc.desc   Adds an event listener to the worker and removes the event listener automically
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL1
        */
       it('threadWorker_once_test_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let isTerminate = false

        try {
            ss.once()
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the number of " +
                "listener parameters is not less than 2.")
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
        * @tc.name   threadWorker_once_test_007
        * @tc.number threadWorker_once_test_007
        * @tc.desc   Adds an event listener to the worker and removes the event listener automically
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL1
        */
       it('threadWorker_once_test_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

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
            expect(error.message).assertEqual("The Worker instance is not running, maybe worker is terminated")

            done()
        }
    })

    // check worker addEventListener function is ok
    /**
     * @tc.name   threadWorker_addEventListener_test_001
     * @tc.number threadWorker_addEventListener_test_001
     * @tc.desc   Add an event listener to the Worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_addEventListener_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

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
     * @tc.name   threadWorker_addEventListener_test_002
     * @tc.number threadWorker_addEventListener_test_002
     * @tc.desc   Add an event listener to the Worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_addEventListener_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

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
     * @tc.name   threadWorker_addEventListener_test_003
     * @tc.number threadWorker_addEventListener_test_003
     * @tc.desc   Add an event listener to the Worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_addEventListener_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

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
      * @tc.name   threadWorker_addEventListener_test_004
      * @tc.number threadWorker_addEventListener_test_004
      * @tc.desc   Add an event listener to the Worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('threadWorker_addEventListener_test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        try {
            ss.addEventListener(1, ()=>{
                times++
            })
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the type of " +
                "listener first param must be string.")
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
      * @tc.name   threadWorker_addEventListener_test_005
      * @tc.number threadWorker_addEventListener_test_005
      * @tc.desc   Add an event listener to the Worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('threadWorker_addEventListener_test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        try {
            ss.addEventListener("zhangsan", "error")
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the type of " +
                "listener the second param must be callable.")
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
      * @tc.name   threadWorker_addEventListener_test_006
      * @tc.number threadWorker_addEventListener_test_006
      * @tc.desc   Add an event listener to the Worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('threadWorker_addEventListener_test_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        try {
            ss.addEventListener()
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the number of " +
                "listener parameters is not less than 2.")
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
      * @tc.name   threadWorker_addEventListener_test_007
      * @tc.number threadWorker_addEventListener_test_007
      * @tc.desc   Add an event listener to the Worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('threadWorker_addEventListener_test_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

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
            expect(error.message).assertEqual("The Worker instance is not running, maybe worker is terminated")
            done()
        }
    })

    // check worker addEventListener function is ok
     /**
      * @tc.name   threadWorker_addEventListener_test_008
      * @tc.number threadWorker_addEventListener_test_008
      * @tc.desc   Add an event listener to the Worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('threadWorker_addEventListener_test_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

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
            expect(error.message).assertEqual("The Worker instance is not running, maybe worker has been terminated")
            done()
        }
    })

    // check worker off function is ok
    /**
     * @tc.name   threadWorker_off_test_001
     * @tc.number threadWorker_off_test_001
     * @tc.desc   Removes an event listener to the worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_off_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

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
     * @tc.name   threadWorker_off_test_002
     * @tc.number threadWorker_off_test_002
     * @tc.desc   Removes an event listener to the worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_off_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

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
      * @tc.name   threadWorker_off_test_003
      * @tc.number threadWorker_off_test_003
      * @tc.desc   Removes an event listener to the worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('threadWorker_off_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

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
            expect(error.message).assertEqual("The Worker instance is not running, maybe worker is terminated")
            done()
        }
    })

    // check worker off function is ok
     /**
      * @tc.name   threadWorker_off_test_004
      * @tc.number threadWorker_off_test_004
      * @tc.desc   Removes an event listener to the worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('threadWorker_off_test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

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
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the number of " +
                "parameters is not less than 1.")
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

    // check worker off function is ok
     /**
      * @tc.name   threadWorker_off_test_005
      * @tc.number threadWorker_off_test_005
      * @tc.desc   Removes an event listener to the worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('threadWorker_off_test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

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
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the type of " +
                "removelistener the first param must be string.")
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

    // check worker removeEventListener function is ok
    /**
     * @tc.name   threadWorker_removeListener_test_001
     * @tc.number threadWorker_removeListener_test_001
     * @tc.desc   Removes an event defined for the worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_removeListener_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

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
     * @tc.name   threadWorker_removeListener_test_002
     * @tc.number threadWorker_removeListener_test_002
     * @tc.desc   Removes an event defined for the worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_removeListener_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

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
     * @tc.name   threadWorker_removeListener_test_003
     * @tc.number threadWorker_removeListener_test_003
     * @tc.desc   Removes an event defined for the worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_removeListener_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

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
      * @tc.name   threadWorker_removeListener_test_004
      * @tc.number threadWorker_removeListener_test_004
      * @tc.desc   Removes an event defined for the worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('threadWorker_removeListener_test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

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
            expect(error.message).assertEqual("The Worker instance is not running, maybe worker is terminated")
            done()
        }
    })

    // check worker removeAllListener function is ok
     /**
      * @tc.name   threadWorker_removeListener_test_005
      * @tc.number threadWorker_removeListener_test_005
      * @tc.desc   Removes an event defined for the worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('threadWorker_removeListener_test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

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
            expect(error.message).assertEqual("The Worker instance is not running, maybe worker is terminated")
            done()
        }
    })

    // check worker removeAllListener function is ok
     /**
      * @tc.name   threadWorker_removeListener_test_006
      * @tc.number threadWorker_removeListener_test_006
      * @tc.desc   Removes an event defined for the worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('threadWorker_removeListener_test_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

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
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the number of " +
                "parameters is not less than 1.")
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

    // check worker removeAllListener function is ok
     /**
      * @tc.name   threadWorker_removeListener_test_007
      * @tc.number threadWorker_removeListener_test_007
      * @tc.desc   Removes an event defined for the worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('threadWorker_removeListener_test_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

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
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the type of " +
                "removelistener the first param must be string.")
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

    // check parentPort.close is ok
    /**
     * @tc.name   threadWorker_parentPortClose_test_001
     * @tc.number threadWorker_parentPortClose_test_001
     * @tc.desc   Close the worker thread to stop the worker from receiving messages.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_parentPortClose_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_008.js")
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
     * @tc.name   threadWorker_parentPortClose_test_002
     * @tc.number threadWorker_parentPortClose_test_002
     * @tc.desc   Close the worker thread to stop the worker from receiving messages.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_parentPortClose_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_008.js")
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
            let msg = "The Worker instance is not running, maybe worker is terminated when PostMessage"
            expect(error.message).assertEqual(msg)

            done()
        }
    })

    // check onmessageerror is ok
    /**
     * @tc.name   threadWorker_onmessageerror_test_001
     * @tc.number threadWorker_onmessageerror_test_001
     * @tc.desc   The onmessage attribute of the worker specifies the event handler when the worker receives
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_onmessageerror_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_008.js")
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
     * @tc.name   threadWorker_onmessageerror_test_002
     * @tc.number threadWorker_onmessageerror_test_002
     * @tc.desc   The onmessage attribute of the worker specifies the event handler when the worker receives
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_onmessageerror_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            var ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_008.js")
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
            expect(error.message).assertContain("An exception occurred during serialization, failed to serialize message.")
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
     * @tc.name   threadWorker_new_second_worker_test_001
     * @tc.number threadWorker_new_second_worker_test_001
     * @tc.desc   Create a second worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_new_second_worker_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_009.js")
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
     * @tc.name   threadWorker_new_second_worker_test_002
     * @tc.number threadWorker_new_second_worker_test_002
     * @tc.desc   Create a third worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_new_second_worker_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_012.js")
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
     * @tc.name   threadWorker_second_worker_postMessage_test_001
     * @tc.number threadWorker_second_worker_postMessage_test_001
     * @tc.desc   Check if the postMessage function of the second worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_second_worker_postMessage_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_010.js")
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
     * @tc.name   threadWorker_second_worker_postMessage_test_002
     * @tc.number threadWorker_second_worker_postMessage_test_002
     * @tc.desc   Check if the postMessage function of the second worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_second_worker_postMessage_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_013.js")
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
     * @tc.name   threadWorker_second_worker_postMessage_test_003
     * @tc.number threadWorker_second_worker_postMessage_test_003
     * @tc.desc   Check if the postMessage function of the second worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_second_worker_postMessage_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_014.js")
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
     * @tc.name   threadWorker_third_worker_postMessage_test_001
     * @tc.number threadWorker_third_worker_postMessage_test_001
     * @tc.desc   Check if the postMessage function of the third worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_third_worker_postMessage_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_015.js")
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
     * @tc.name   threadWorker_second_worker_terminate_test_001
     * @tc.number threadWorker_second_worker_terminate_test_001
     * @tc.desc   Check if the terminate function of the second worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_second_worker_terminate_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_011.js")
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
     * @tc.name   threadWorker_support_types_test_001
     * @tc.number threadWorker_support_types_test_001
     * @tc.desc   Check the transmission types supported by Worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_support_types_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_016.js");
        let array = []
        for (let i = 0; i < 10; i++) {
            array[i] = CreateArray(i, 65);
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
        expect(res).assertEqual(650)

        done();
    })

    // Check the transmission types supported by Worker is ok.
    /**
     * @tc.name   threadWorker_support_types_test_002
     * @tc.number threadWorker_support_types_test_002
     * @tc.desc   Check the transmission types supported by Worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_support_types_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_017.js");
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
     * @tc.name   threadWorker_support_types_test_003
     * @tc.number threadWorker_support_types_test_003
     * @tc.desc   Check the transmission types supported by Worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_support_types_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_018.js");
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
     * @tc.name   threadWorker_support_types_test_004
     * @tc.number threadWorker_support_types_test_004
     * @tc.desc   Check the transmission types supported by Worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_support_types_test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_019.js");
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
     * @tc.name   threadWorker_support_types_test_005
     * @tc.number threadWorker_support_types_test_005
     * @tc.desc   Check the transmission types supported by Worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_support_types_test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_020.js");
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
     * @tc.name   threadWorker_support_types_test_006
     * @tc.number threadWorker_support_types_test_006
     * @tc.desc   Check the transmission types supported by Worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_support_types_test_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_021.js");
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
     * @tc.name   threadWorker_support_types_test_007
     * @tc.number threadWorker_support_types_test_007
     * @tc.desc   Check the transmission types supported by Worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_support_types_test_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_021.js");
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

    // Check the transmission types supported by Worker is ok.
     /**
      * @tc.name   threadWorker_support_types_test_008
      * @tc.number threadWorker_support_types_test_008
      * @tc.desc   Check the transmission types supported by Worker is ok.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('threadWorker_support_types_test_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_026.js");
        let flag = false;
        let result;
        let isTerminate = false;
        class MyModel
        {
            name = "module";
            Init() {
                this.name = "Init";
            }
        }
        let model = new MyModel()
        ss.onmessage = function(d) {
            result = d.data;
            flag = true;
        }
        ss.onexit = function() {
            isTerminate = true;
        }
        ss.postMessage(model);
        while (!flag) {
            await promiseCase();
        }
        ss.terminate();
        while (!isTerminate) {
            await promiseCase();
        }

        expect(result).assertEqual("module");
        done();
    })

    // Check the transmission types supported by Worker is ok.
    /**
     * @tc.name   threadWorker_support_types_test_009
     * @tc.number threadWorker_support_types_test_009
     * @tc.desc   Check the transmission types supported by Worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_support_types_test_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_027.js");
        let result = "";
        let isTerminate = false;
        class MyModel
        {
            name = "module";
            Init() {
                this.name = "Init";
            }
        }
        let model = new MyModel()

        ss.onerror = function (e){
            result = "unInit";
        }
        ss.onexit = function() {
            isTerminate = true;
        }
        ss.postMessage(model);
        while (!isTerminate) {
            await promiseCase();
        }

        expect(result).assertEqual("unInit");
        done();
    })

    // Check the postmessage of worker is ok.
    /**
     * @tc.name   threadWorker_worker_postmessage_test_001
     * @tc.number threadWorker_worker_postmessage_test_001
     * @tc.desc   Check the postmessage of worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_worker_postmessage_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_022.js");
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
        expect(res).assertEqual("Parameter error. The input parameters are invalid, the number of parameters must " +
            "be more than 1.");
        done();
    })


    // Check the postmessage of worker is ok.
    /**
     * @tc.name   threadWorker_worker_postmessage_test_002
     * @tc.number threadWorker_worker_postmessage_test_002
     * @tc.desc   Check the postmessage of worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_worker_postmessage_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_023.js");
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
        expect(res).assertEqual("Parameter error. The input parameters are invalid, Transfer list must be an Array");
        done();
    })

    // Check the postmessage of worker is ok.
    /**
     * @tc.name   threadWorker_worker_postmessage_test_003
     * @tc.number threadWorker_worker_postmessage_test_003
     * @tc.desc   Check the postmessage of worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_worker_postmessage_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_024.js");
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
        expect(res).assertContain("An exception occurred during serialization, failed to serialize message.");
        done();
    })

    // Check the close of worker is ok.
    /**
     * @tc.name   threadWorker_worker_close_test_001
     * @tc.number threadWorker_worker_close_test_001
     * @tc.desc   Check the close of worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_worker_close_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_025.js");
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

    // Check the SharedArrayBuffer with worker.
    /**
     * @tc.name   threadWorker_worker_SharedArrayBuffer_test_001
     * @tc.number threadWorker_worker_SharedArrayBuffer_test_001
     * @tc.desc   Check the SharedArrayBuffer with worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_worker_SharedArrayBuffer_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_028.js");
        let sab = new SharedArrayBuffer(20);
        let int32 = new Uint32Array(sab);

        let res = 0;
        let isTerminate = false;
        ss.onmessage = function (d) {
            if (d.data == "success") {
                res = int32[0] + int32[1] + int32[2] + int32[3];
            }
            ss.terminate();
        }
        ss.onexit = function() {
            isTerminate = true;
        }
        ss.postMessage(int32);
        while (!isTerminate) {
            await promiseCase();
        }
        expect(res == 1000).assertTrue();
        done();
    })

    // Check the listener of worker.
    /**
     * @tc.name   threadWorker_worker_listener_test_001
     * @tc.number threadWorker_worker_listener_test_001
     * @tc.desc   Check the listener of worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_worker_listener_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_029.js");
        let res = undefined;
        let flag = false;
        let isTerminate = false;

        ss.on('message', (event) =>{
          flag = true;
          let jsonData = JSON.parse(JSON.stringify(event));
          res = jsonData.data;
          ss.terminate();
        });

        ss.on('exit', (code) => {
          isTerminate = true;
        })
        ss.postMessage("123");

        while (!isTerminate) {
          await promiseCase();
        }
        expect(res).assertEqual("hello worker")
        done();
    })

    // Check the listener of worker.
    /**
     * @tc.name   threadWorker_worker_listener_test_002
     * @tc.number threadWorker_worker_listener_test_002
     * @tc.desc   Check the listener of worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_worker_listener_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_029.js");
        let res = 0;
        let flag = false;
        let isTerminate = false;

        ss.addEventListener('messageerror', (event) =>{
            flag = true;
            res += 1;
        });

        ss.addEventListener('exit', (code) => {
          isTerminate = true;
        })

        try {
            const data = Symbol();
            ss.postMessage(data);
        } catch (error) {
            while (!flag) {
                await promiseCase();
            }
            ss.terminate();
            while (!isTerminate) {
                await promiseCase();
            }
        }
        expect(res).assertEqual(1)
        done();
    })

    // Check the listener of worker.
    /**
     * @tc.name   threadWorker_worker_listener_test_003
     * @tc.number threadWorker_worker_listener_test_003
     * @tc.desc   Check the listener of worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_worker_listener_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_007.js");
        let res = undefined;
        let isTerminate = false;

        ss.addEventListener('error', (event) =>{
            let jsonData = JSON.parse(JSON.stringify(event));
            res = jsonData.message;
            ss.terminate();
        });

        ss.addEventListener('exit', (code) => {
            isTerminate = true;
        })
        ss.postMessage("123");
        while (!isTerminate) {
          await promiseCase();
        }
        expect(res).assertEqual("Error: 123")
        done();
    })

    // Check the listener of worker.
    /**
     * @tc.name   threadWorker_worker_listener_test_004
     * @tc.number threadWorker_worker_listener_test_004
     * @tc.desc   Check the listener of worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_worker_listener_test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_007.js");
        let res = undefined;
        let isTerminate = false;

        ss.on('error', (event) =>{
            let jsonData = JSON.parse(JSON.stringify(event));
            res = jsonData.message;
            ss.terminate();
        });

        ss.on('exit', (code) => {
            isTerminate = true;
        })
        ss.postMessage("123");
        while (!isTerminate) {
          await promiseCase();
        }
        expect(res).assertEqual("Error: 123")
        done();
    })

    // Check the listener of worker.
    /**
     * @tc.name   threadWorker_worker_listener_test_005
     * @tc.number threadWorker_worker_listener_test_005
     * @tc.desc   Check the listener of worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_worker_listener_test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_029.js");
        let res1 = "";
        let res2 = "";
        let flag1 = false;
        let flag2 = false;
        let isTerminate = false;

        ss.on('message', (event) =>{
          flag1 = true;
          let jsonData = JSON.parse(JSON.stringify(event));
          res1 = jsonData.data;
        });

        ss.onmessage = function (d) {
            flag2 = true;
            let data = d.data;
            res2 = data;
        }

        ss.on('exit', (code) => {
          isTerminate = true;
        })
        ss.postMessage("123");
        while (!flag1 || !flag2) {
            await promiseCase();
        }
        ss.terminate();
        while (!isTerminate) {
          await promiseCase();
        }
        expect(res1).assertEqual("hello worker")
        expect(res2).assertEqual("hello worker")
        done();
    })

    // Check the listener of worker.
    /**
     * @tc.name   threadWorker_worker_listener_test_006
     * @tc.number threadWorker_worker_listener_test_006
     * @tc.desc   Check the listener of worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_worker_listener_test_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_030.js");
        let res = 0;
        let isTerminate = false;

        ss.on('message', (event) =>{
            res += 1;
            if (res == 3) {
                ss.terminate();
            }
        });
        ss.on('exit', (code) => {
            isTerminate = true;
        })

        ss.postMessage("123");

        while (!isTerminate) {
          await promiseCase();
        }
        expect(res).assertEqual(3)
        done();
    })

    function resolveAfterSeconds() {
        return new Promise((resolve, reject) => {
            resolve('resolved');
        })
    }

    class TestObj {
        message = "TestObj"
        getMessage() {
          return this.message;
        }
        getMessageWithInput(str) {
          return this.message + str;
        }
        executeForThreeSeconds() {
            let now = Date.now()
            while (now + 3000 > Date.now()) {
                let number = 2;
            }
            return "done";
        }
        async asyncGetMessage() {
            let res = await resolveAfterSeconds()
            console.log("asyncGetMessage log: " + res)
            return res
        }
    }

    // Check the CallObject of worker.
    /**
     * @tc.name   threadWorker_worker_callObject_test_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0003
     * @tc.desc   Check whether the method call on the object is successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_worker_callObject_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_031.js");
        let res = "";
        let isTerminate = false;

        ss.onmessage = function (d) {
            res = d.data
            ss.terminate()
        }
        ss.onexit = function () {
            isTerminate = true;
        }

        let obj = new TestObj();
        ss.registerGlobalCallObject("obj1", obj);
        ss.postMessage("123");

        while (!isTerminate) {
          await promiseCase();
        }
        expect(res).assertEqual("success")
        done();
    })

    // Check the CallObject of worker.
    /**
     * @tc.name   threadWorker_worker_callObject_test_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0004
     * @tc.desc   Check whether the method call on the object is successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_worker_callObject_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_032.js");
        let res = "";
        let isTerminate = false;

        ss.onmessage = function (d) {
            res = d.data
            ss.terminate()
        }
        ss.onexit = function () {
            isTerminate = true;
        }

        let obj = new TestObj();
        ss.registerGlobalCallObject("obj1", obj);
        ss.postMessage("123");

        while (!isTerminate) {
          await promiseCase();
        }
        expect(res).assertEqual("failed")
        done();
    })

    // Check the CallObject of worker.
    /**
     * @tc.name   threadWorker_worker_callObject_test_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0005
     * @tc.desc   Check whether the method call on the object is successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_worker_callObject_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_033.js");
        let res = "";
        let isTerminate = false;

        ss.onmessage = function (d) {
            res = d.data.message;
            ss.terminate();
        }
        ss.onexit = function () {
            isTerminate = true;
        }

        let obj = new TestObj();
        ss.registerGlobalCallObject("obj1", obj);
        ss.postMessage("123");

        while (!isTerminate) {
          await promiseCase();
        }
        let err =
             "The method to be called is not callable or is an async method or a generator.";
        expect(res).assertEqual(err);
        done();
    })

    // Check the CallObject of worker.
    /**
     * @tc.name   threadWorker_worker_callObject_test_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0006
     * @tc.desc   Check whether the method call on the object is successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_worker_callObject_test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_033.js");
        let res = "";
        let isTerminate = false;

        ss.onmessage = function (d) {
            res = d.data.message;
            ss.terminate();
        }
        ss.onexit = function () {
            isTerminate = true;
        }

        let obj = new TestObj();
        ss.registerGlobalCallObject("obj1", obj);
        ss.unregisterGlobalCallObject("obj1");
        ss.unregisterGlobalCallObject("obj2");
        ss.unregisterGlobalCallObject("obj3");
        ss.postMessage("1");

        while (!isTerminate) {
          await promiseCase();
        }
        expect(res).assertEqual("The globalCallObject is not registered");
        done();
    })

    // Check the CallObject of worker.
    /**
     * @tc.name   threadWorker_worker_callObject_test_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0007
     * @tc.desc   Check whether the method call on the object is successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_worker_callObject_test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_034.js");
        let res = "";
        let isTerminate = false;

        ss.onmessage = function (d) {
            res = d.data.message;
            ss.terminate();
        }
        ss.onexit = function () {
            isTerminate = true;
        }

        let obj = new TestObj();
        ss.registerGlobalCallObject("obj1", obj);
        ss.registerGlobalCallObject("obj2", obj);
        ss.registerGlobalCallObject("obj3", obj);
        ss.registerGlobalCallObject("obj4", obj);
        ss.unregisterGlobalCallObject();
        ss.postMessage("1");

        while (!isTerminate) {
          await promiseCase();
        }
        expect(res).assertEqual("The globalCallObject is not registered");
        done();
    })

    // Check the timer in worker thread.
    /**
     * @tc.name   threadWorker_timer_test_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0008
     * @tc.desc   Check whether the timer in the worker thread is normal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_timer_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_035.js");
        let res = "";
        let isTerminate = false;

        ss.onmessage = function (d) {
            res = d.data;
            ss.terminate();
        }
        ss.onexit = function () {
            isTerminate = true;
        }
        ss.postMessage("1");
        while (!isTerminate) {
          await promiseCase();
        }
        expect(res).assertEqual("123");
        done();
    })

    // Check the nested call in worker thread.
    /**
     * @tc.name   threadWorker_nestedCall_test_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0009
     * @tc.desc   Check whether nested call in the worker thread is normal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_nestedCall_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_036.js");
        let res = "";
        let isTerminate = false;

        ss.onmessage = function (d) {
            res = d.data;
            ss.terminate();
        }
        ss.onexit = function () {
            isTerminate = true;
        }
        ss.postMessage("1");
        while (!isTerminate) {
          await promiseCase();
        }
        expect(res).assertEqual("456");
        done();
    })

    // Check the napi_queue_async_work_with_qos in worker thread.
    /**
     * @tc.name   threadWorke_async_call_test_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0009
     * @tc.desc   Check whether napi_queue_async_work_with_qos in the worker thread is normal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorke_async_call_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_038.js");
        let res = "";
        let isTerminate = false;

        ss.onmessage = function (d) {
            res = d.data;
            ss.terminate();
        }
        ss.onexit = function () {
            isTerminate = true;
        }
        ss.postMessage("1");
        while (!isTerminate) {
          await promiseCase();
        }
        expect(res).assertEqual("97,98,99");
        done();
    })

    // Serialization support primitive.
    /**
     * @tc.name   threadWorker_primitive_serialization_test_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0010
     * @tc.desc   Serialization support primitive.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_primitive_serialization_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_039.js");
        let res = "";
        let isTerminate = false;

        ss.onmessage = function (d) {
            res = d.data;
            ss.terminate();
        }
        ss.onexit = function () {
            isTerminate = true;
        }
        ss.postMessage(new String("primitive_string"));
        while (!isTerminate) {
          await promiseCase();
        }
        expect(res.toString()).assertEqual("serialization_string");
        done();
    })

    // Serialization support primitive.
    /**
     * @tc.name   threadWorker_primitive_serialization_test_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0011
     * @tc.desc   Serialization support primitive.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_primitive_serialization_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_040.js");
        let res = "";
        let isTerminate = false;

        ss.onmessage = function (d) {
            res = d.data;
            ss.terminate();
        }
        ss.onexit = function () {
            isTerminate = true;
        }
        ss.postMessage(new Number(94));
        while (!isTerminate) {
          await promiseCase();
        }
        expect(Number(res)).assertEqual(83);
        done();
    })

    // Serialization support primitive.
    /**
     * @tc.name   threadWorker_primitive_serialization_test_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0012
     * @tc.desc   Serialization support primitive.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_primitive_serialization_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_041.js");
        let res = "";
        let isTerminate = false;

        ss.onmessage = function (d) {
            res = d.data;
            ss.terminate();
        }
        ss.onexit = function () {
            isTerminate = true;
        }
        ss.postMessage(new Boolean(false));
        while (!isTerminate) {
          await promiseCase();
        }
        expect(Boolean(res)).assertEqual(true);
        done();
    })

    // Multi-level worker termination test.
    /**
     * @tc.name   threadWorker_multi_level_test_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0013
     * @tc.desc   Multi-level worker life cycle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_multi_level_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let parentworker = new worker.ThreadWorker("entry_test/ets/workers/parentworker.ets");
        let res = "";
        let isTerminate = false;

        parentworker.onmessage = function (d) {
            res = d.data;
            parentworker.terminate();
        }
        parentworker.onexit = function () {
            isTerminate = true;
        }
        parentworker.onerror = function (err) {
            console.log("parentworker onerror is: " + err);
        }
        parentworker.postMessage(1);
        while (!isTerminate) {
          await promiseCase();
        }
        done();
    })

    // Multi-level worker termination test.
    /**
     * @tc.name   threadWorker_multi_level_test_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0014
     * @tc.desc   Multi-level worker life cycle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_multi_level_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let parentworker = new worker.ThreadWorker("entry_test/ets/workers/parentworker1.ets");
        let res = "";
        let isTerminate = false;

        parentworker.onmessage = function (d) {
            res = d.data;
            parentworker.terminate();
        }
        parentworker.onexit = function () {
            isTerminate = true;
        }
        parentworker.onerror = function (err) {
            console.log("parentworker onerror is: " + err);
        }
        parentworker.postMessage(1);
        while (!isTerminate) {
          await promiseCase();
        }
        done();
    })

    // Throw error in workerPort.postMessage.
    /**
     * @tc.name   threadWorker_onAllErrors_test_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0015
     * @tc.desc   Throw error in workerPort.postMessage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_onAllErrors_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let workerInstance = new worker.ThreadWorker("entry_test/ets/workers/newworker_042.js");
        let res = "";
        let isTerminate = false;
        let errorMessage = "";
        let flag = false;

        workerInstance.onmessage = function(d) {
            res = d.data;
        }

        workerInstance.onAllErrors = function(e) {
            flag = true;
            errorMessage = e.message;
            console.log("threadWorker_onAllErrors_test_001 onAllErrors is: " + e.message);
            workerInstance.terminate();
        }

        workerInstance.onexit = function() {
            isTerminate = true;
            console.log("threadWorker_onAllErrors_test_001 onexit");
        }

        workerInstance.onerror = function(err) {
            console.log("threadWorker_onAllErrors_test_001 onerror is: " + err.message);
        }

        workerInstance.onmessageerror = function(e) {
            console.log("threadWorker_onAllErrors_test_002 onmessageerror");
        }

        workerInstance.postMessage(1);

        while (!isTerminate) {
            await promiseCase();
        }

        expect(errorMessage).assertEqual("Error: newworker_042 test");
        expect(flag).assertTrue();
        done();
    })


    // Throw error in worker.js
    /**
     * @tc.name   threadWorker_onAllErrors_test_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0016
     * @tc.desc   Throw error in worker.js
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_onAllErrors_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let workerInstance = new worker.ThreadWorker("entry_test/ets/workers/newworker_043.js");
        let res = "";
        let isTerminate = false;
        let errorMessage = "";
        let flag = false;

        workerInstance.onmessage = function(d) {
            res = d.data;
        }

        workerInstance.onAllErrors = function(e) {
            flag = true;
            errorMessage = e.message;
            console.log("threadWorker_onAllErrors_test_002 onAllErrors is: " + e.message);
            workerInstance.terminate();
        }

        workerInstance.onexit = function() {
            isTerminate = true;
            console.log("threadWorker_onAllErrors_test_002 onexit");
        }

        workerInstance.onerror = function(err) {
            console.log("threadWorker_onAllErrors_test_002 onerror is: " + err.message);
        }

        workerInstance.onmessageerror = function(e) {
            console.log("threadWorker_onAllErrors_test_002 onmessageerror");
        }

        workerInstance.postMessage(1);

        while (!isTerminate) {
            await promiseCase();
        }

        expect(errorMessage).assertEqual("newworker_043 error");
        expect(flag).assertTrue();
        done();
    })

    // Worker post function to main thread.
    /**
     * @tc.name   threadWorker_onAllErrors_test_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0017
     * @tc.desc   Worker post function to main thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_onAllErrors_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let workerInstance = new worker.ThreadWorker("entry_test/ets/workers/newworker_044.js");
        let res = "";
        let isTerminate = false;
        let errorMessage = "";
        let flag = false;

        workerInstance.onmessage = function(d) {
            res = d.data;
        }

        workerInstance.onAllErrors = function(e) {
            flag = true;
            errorMessage = e.message;
            console.log("threadWorker_onAllErrors_test_003 onAllErrors is: " + e.message);
            if (errorMessage.includes("BusinessError: An exception occurred during serialization, failed to serialize message.")) {
                workerInstance.terminate();
            }
        }

        workerInstance.onexit = function() {
            isTerminate = true;
            console.log("threadWorker_onAllErrors_test_003 onexit");
        }

        workerInstance.onerror = function(err) {
            console.log("threadWorker_onAllErrors_test_003 onerror is: " + err.message);
        }

        workerInstance.onmessageerror = function(e) {
            console.log("threadWorker_onAllErrors_test_003 onmessageerror");
        }

        workerInstance.postMessage(1);

        while (!isTerminate) {
            await promiseCase();
        }

        expect(errorMessage).assertContain("BusinessError: An exception occurred during serialization, failed to serialize message.");
        expect(flag).assertTrue();
        done();
    })

    // Worker post function to main thread.
    /**
     * @tc.name   threadWorker_onAllErrors_test_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0018
     * @tc.desc   Worker post function to main thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_onAllErrors_test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        class MyModel
        {
            name = "module";
            Init() {
                this.name = "Init";
            }
        }
        let model = new MyModel();

        let workerInstance = new worker.ThreadWorker("entry_test/ets/workers/newworker_045.js");
        let res = "";
        let isTerminate = false;
        let errorMessage = "";
        let flag = false;

        workerInstance.onmessage = function(d) {
            res = d.data;
        }

        workerInstance.onAllErrors = function(e) {
            flag = true;
            errorMessage = e.message;
            console.log("threadWorker_onAllErrors_test_004 onAllErrors is: ", e.message);
            workerInstance.terminate();
        }

        workerInstance.onexit = function() {
            isTerminate = true;
            console.log("threadWorker_onAllErrors_test_004 onexit");
        }

        workerInstance.onerror = function() {
            console.log("threadWorker_onAllErrors_test_004 onerror");
        }

        workerInstance.onmessageerror = function() {
            console.log("threadWorker_onAllErrors_test_004 onmessageerror");
        }

        workerInstance.postMessage(model);

        while (!isTerminate) {
            await promiseCase();
        }

        expect(errorMessage).assertEqual("TypeError: undefined is not callable");
        expect(flag).assertTrue();
        done();
    })

    // worker.onerror throw error.
    /**
     * @tc.name   threadWorker_onAllErrors_test_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0019
     * @tc.desc   worker.onerror throw error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_onAllErrors_test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let workerInstance = new worker.ThreadWorker("entry_test/ets/workers/newworker_046.js");
        let res = "";
        let isTerminate = false;
        let errorMessage = "";
        let flag = false;

        workerInstance.onmessage = function(d) {
            res = d.data;
        }

        workerInstance.onAllErrors = function() {
            flag = true;
            console.log("threadWorker_onAllErrors_test_005 onAllErrors ");
            workerInstance.terminate();
        }

        workerInstance.onexit = function() {
            isTerminate = true;
            console.log("threadWorker_onAllErrors_test_005 onexit");
        }

        workerInstance.onerror = function() {
            console.log("threadWorker_onAllErrors_test_005 onerror");
        }

        workerInstance.onmessageerror = function(e) {
            console.log("threadWorker_onAllErrors_test_005 onmessageerror");
        }

        workerInstance.postMessage(1);

        while (!isTerminate) {
            await promiseCase();
        }

        expect(flag).assertTrue();
        expect(isTerminate).assertTrue();
        done();
    })

    // worker.onmessageerror throw error.
    /**
     * @tc.name   threadWorker_onAllErrors_test_006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0020
     * @tc.desc   worker.onerror throw error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_onAllErrors_test_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let workerInstance = new worker.ThreadWorker("entry_test/ets/workers/newworker_047.js");
        let res = "";
        let isTerminate = false;
        let errorMessage = "";
        let errorMessage1 = "";
        let flag = false;
        let count = 0;

        workerInstance.onmessage = function(d) {
            res = d.data;
        }

        workerInstance.onAllErrors = function(e) {
            count++;
            flag = true;
            if (e.message == "Error: newworker_047 onmessageerror throw error") {
                errorMessage = e.message;
                console.log("threadWorker_onAllErrors_test_006 onAllErrors with 1 is: ", e.message);
            }
            if (e.message.includes("BusinessError: An exception occurred during serialization, failed to serialize message.")) {
                errorMessage1 = e.message;
                console.log("threadWorker_onAllErrors_test_006 onAllErrors with 2 is: ", e.message);
            }
            if (errorMessage != "" && errorMessage1 != "") {
                workerInstance.terminate();
            }
        }

        workerInstance.onexit = function() {
            isTerminate = true;
            console.log("threadWorker_onAllErrors_test_006 onexit");
        }

        workerInstance.onerror = function() {
            console.log("threadWorker_onAllErrors_test_006 onerror");
        }

        workerInstance.onmessageerror = function(e) {
            console.log("threadWorker_onAllErrors_test_006 onmessageerror");
        }

        workerInstance.postMessage(1);

        while (!isTerminate) {
            await promiseCase();
        }

        expect(flag).assertTrue();
        expect(isTerminate).assertTrue();
        expect(errorMessage).assertEqual("Error: newworker_047 onmessageerror throw error");
        expect(errorMessage1).assertContain("BusinessError: An exception occurred during serialization, failed to serialize message.");
        done();
    })

    // throw error in addEventListener
    /**
     * @tc.name   threadWorker_onAllErrors_test_007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0021
     * @tc.desc   throw error in addEventListener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_onAllErrors_test_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        let workerInstance = new worker.ThreadWorker("entry_test/ets/workers/newworker_047.js");
        let res = "";
        let isTerminate = false;
        let errorMessage = "";
        let flag = false;

        workerInstance.onmessage = function(d) {
            res = d.data;
        }

        workerInstance.onAllErrors = function(e) {
            flag = true;
            console.log("threadWorker_onAllErrors_test_007 onAllErrors");
            workerInstance.terminate();
        }

        workerInstance.onexit = function() {
            isTerminate = true;
            console.log("threadWorker_onAllErrors_test_007 onexit");
        }

        workerInstance.onerror = function() {
            console.log("threadWorker_onAllErrors_test_007 onerror");
        }

        workerInstance.onmessageerror = function(e) {
            console.log("threadWorker_onAllErrors_test_007 onmessageerror");
        }

        workerInstance.postMessage(1);

        while (!isTerminate) {
            await promiseCase();
        }

        expect(flag).assertTrue();
        expect(isTerminate).assertTrue();
        done();
    })

    /**
     * @tc.name   threadWorker_finally_test_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0009
     * @tc.desc   worker constructor to Creates a worker instance when throw error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_finally_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        var ss = []
        let flag = 0
        try {
            let a = 0
            while (a <= 64) {
                ss[a] = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")
                a += 1
            }
        } catch (error) {
            expect(error.name == "BusinessError").assertTrue()
            let msg = "Worker initialization failed, the number of workers exceeds the maximum."
            expect(error.message).assertEqual(msg)
            done()
        }
    })
})
}