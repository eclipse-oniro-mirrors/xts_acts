/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

const THREAD_COUNT = 8;

async function promiseCase() {
    return new Promise(function (resolve, reject) {
        setTimeout(function () {
            resolve(0)
        }, 100)
    }).then(undefined, (error) => { })
}

async function terminateThreads(threadWorks, count) {
    let a = count;
    let threadExitFlags = 0;
    while (a > 0) {
        threadWorks[a].onexit = function () {
            threadExitFlags += 1;
        }
        threadWorks[a].terminate();
        a -= 1;
    }
    while (threadExitFlags != count) {
        await promiseCase();
    }
}
async function doTest(done, name, runner) {
    var threadWorks = [];
    let threadExitFlags = 0;
    console.info("Test " + name + " start!!");
    try {
        let a = 0;
        while (a < THREAD_COUNT) {
            threadWorks[a] = new worker.ThreadWorker(runner);
            threadWorks[a].onmessage = function (e) {
                console.info(name + "worker:: ending work " + e.data);
                if (e.data != undefined) {
                    threadWorks[e.data].terminate();
                }
            }
            threadWorks[a].onexit = function () {
                threadExitFlags += 1;
            }
            a += 1;
        }
        // For threads ready
        await promiseCase();

        let b = 0;
        while (b < THREAD_COUNT) {
            threadWorks[b].postMessage(b);
            b += 1;
        }

        while (threadExitFlags != THREAD_COUNT) {
            await promiseCase();
        }
        done();
    } catch (error) {
        console.info('Case error, ' + JSON.stringify(error));
        await terminateThreads(threadWorks, THREAD_COUNT);
        done();
    }
}
export default function multiThreadTest() {
    describe('multiThreadTest', function () {
        afterAll(function () {
            console.info('total case over');
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVER_MULTI_THREAD_0100
        * @tc.name      : multiple thread
        * @tc.desc      : 1.create receiver.js
        *                 2.invoked simultaneously by multiple thread
        * @tc.size      : MEDIUM
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_MULTI_THREAD_0100', 0, async function (done) {
            await doTest(done, "SUB_MULTIMEDIA_IMAGE_RECEIVER_MULTI_THREAD_0100", "entry/ets/workers/receiver.js");
        })

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVER_MULTI_THREAD_0200
        * @tc.name      : multiple thread
        * @tc.desc      : 1.create creator.js
        *                 2.invoked simultaneously by multiple thread
        * @tc.size      : MEDIUM
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_MULTI_THREAD_0200', 0, async function (done) {
            await doTest(done, "SUB_MULTIMEDIA_IMAGE_RECEIVER_MULTI_THREAD_0200", "entry/ets/workers/creator.js");
        })
    })
}