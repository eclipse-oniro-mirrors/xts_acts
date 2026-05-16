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

export default function WaitTest() {
    describe('WaitTest', function () {

        afterAll(function () {
            console.info('total case over');
        })

        function promiseCase() {
            let p = new Promise(function (resolve, reject) {
                setTimeout(function () {
                    resolve()
                }, 50)
            }).then(undefined, (error) => {
            })
            return p
        }

        /**
         * @tc.name   testNotify001
         * @tc.number testNotify001
         * @tc.desc   returns a string which is either "ok", "not-equal", or "timed-out".
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testNotify001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
            var sab = new SharedArrayBuffer(20);
            var int32 = new Int32Array(sab);
            var flag = false
            var res = 0;
            var res1 = 0;
            let ss = new worker.Worker("entry/ets/workers/worker010.js");
            let tt = new worker.Worker("entry/ets/workers/worker011.js");
            let uu = new worker.Worker("entry/ets/workers/worker012.js");

            ss.onmessage = function (e) {
                if (e.data == "end") {
                    res++;
                }
                flag = true;
            }
            tt.onmessage = function (e) {
                if (e.data == "end1") {
                    res1++;
                }
                if (e.data == "end2") {
                    res1 += 5;
                }
                flag = true;
            }
            uu.onmessage = function (e) {
                if (e.data == "end") {
                    flag = true;
                }
            }

            ss.onexit = function () {
                flag = true;
            }
            tt.onexit = function () {
                flag = true;
            }
            uu.onexit = function () {
                flag = true;
            }

            ss.postMessage(int32);
            while (!flag) {
                await promiseCase();
            }
            flag = false;
            tt.postMessage(int32);
            while (!flag) {
                await promiseCase();
            }
            flag = false;
            uu.postMessage(int32);
            while (!flag) {
                await promiseCase();
            }

            Atomics.notify(int32, 0, 1);
            Atomics.notify(int32, 2, 1);
            while (res == 0 || res1 == 0) {
                await promiseCase();
            }

            flag = false;
            ss.terminate()
            while (!flag) {
                await promiseCase();
            }
            flag = false;
            tt.terminate();
            while (!flag) {
                await promiseCase();
            }
            flag = false;
            uu.terminate();
            while (!flag) {
                await promiseCase();
            }

            expect(res).assertEqual(1)
            expect(res1).assertEqual(5)
            done()
        })

        /**
         * @tc.name   testWait001
         * @tc.number testWait001
         * @tc.desc   returns a string which is either "ok", "not-equal", or "timed-out".
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testWait001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            var sab = new SharedArrayBuffer(20);
            var flag = false;
            var int32 = new Int32Array(sab);
            var res = 0;
            const ss = new worker.Worker("entry/ets/workers/worker020.js");

            ss.onmessage = function (e) {
                if (e.data != 'wait') {
                    res = e.data;
                }
                flag = true;
            }

            ss.onexit = function () {
                flag = true;
            }

            ss.postMessage(int32);
            while (!flag) {
                await promiseCase();
            }

            flag = false
            Atomics.store(int32, 0, 2);
            Atomics.load(int32, 0);
            Atomics.notify(int32, 0, 1)
            while (!flag) {
                await promiseCase();
            }

            flag = false;
            ss.terminate();
            while (!flag) {
                await promiseCase();
            }

            expect(res).assertEqual(3)
            done()
        })

        /**
         * @tc.name   testAdd001
         * @tc.number testAdd001
         * @tc.desc   returns a string which is either "ok", "not-equal", or "timed-out".
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testAdd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
            var sab = new SharedArrayBuffer(20);
            var int32 = new Uint32Array(sab);
            int32[0] = 1;
            var flag = false;
            var count = 0;
            let ss = new worker.Worker("entry/ets/workers/worker030.js");
            let tt = new worker.Worker("entry/ets/workers/worker031.js");

            ss.onmessage = function () {
                count += 1;
            }
            tt.onmessage = function () {
                count += 1;
            }

            ss.onexit = function () {
                flag = true;
            }
            tt.onexit = function () {
                flag = true;
            }

            ss.postMessage(sab);
            tt.postMessage(sab);
            while (count != 2) {
                await promiseCase();
            }

            flag = false;
            ss.terminate();
            while (!flag) {
                await promiseCase();
            }
            flag = false;
            tt.terminate();
            while (!flag) {
                await promiseCase();
            }

            expect(int32[0]).assertEqual(21)
            done()
        })
    })
}