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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
import process from '@ohos.process'
export default function ProcessTest() {
describe('ProcessTest', function () {

    function delay(duration) {
        return new Promise(resolve => setTimeout(resolve, duration));
    }

    /**
     * @tc.name   testGetUid001
     * @tc.number testGetUid001
     * @tc.desc   returns the digital user id of the process.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetUid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let result = process.uid
        if (result > 0) {
            var flag = true
        }
        expect(flag).assertEqual(true)
    })

    /**
     * @tc.name   testGetUid002
     * @tc.number testGetUid002
     * @tc.desc   returns the digital user id of the process.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetUid002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        for (let i = 0; i < 3; i++) {
            let result = process.uid
            if (result != null) {
                if (result > 0) {
                    var flag = true
                }
                expect(flag).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name   testGetUid003
     * @tc.number testGetUid003
     * @tc.desc   returns the digital user id of the process.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetUid003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        for (let i = 0; i < 6; i++) {
            let result = process.uid
            if (result != null) {
                if (result > 0) {
                    var flag = true
                }
                expect(flag).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name   testGetUid004
     * @tc.number testGetUid004
     * @tc.desc   returns the digital user id of the process.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetUid004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        for (let i = 0; i < 8; i++) {
            let result = process.uid
            if (result != null) {
                if (result > 0) {
                    var flag = true
                }
                expect(flag).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name   testGetUid005
     * @tc.number testGetUid005
     * @tc.desc   returns the digital user id of the process.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetUid005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        for (let i = 0; i < 5; i++){
            let result = process.uid
            if (result != null) {
                if (result > 0) {
                    var flag = true
                }
                expect(flag).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name   testKill001
     * @tc.number testKill001
     * @tc.desc   Return whether the signal was sent successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testKill001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let result = process.kill(3, 123)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name   testKill002
     * @tc.number testKill002
     * @tc.desc   Return whether the signal was sent successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testKill002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let pres = process.pid
        let result = process.kill(23, pres)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name   testKill003
     * @tc.number testKill003
     * @tc.desc   Return whether the signal was sent successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testKill003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let pres = process.pid
        let result = process.kill(28, pres)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name   testKill004
     * @tc.number testKill004
     * @tc.desc   Return whether the signal was sent successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testKill004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let pres = process.pid
        let result = process.kill(17, pres)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name   testKill005
     * @tc.number testKill005
     * @tc.desc   Return whether the signal was sent successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testKill005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let result = process.kill(3, 113)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name   testKill006
     * @tc.number testKill006
     * @tc.desc   Return whether the signal was sent successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testKill006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let pres = process.pid
        let result = process.kill('17', pres)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name   testUptime001
     * @tc.number testUptime001
     * @tc.desc   Returns the running time of the system.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUptime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let result1 = process.uptime()
        function sleep(d){
            while(process.uptime() - result1 <= d);
        }
        sleep(3);
        let result2 = process.uptime()
        var flag = false
        if ((result2 - result1) >= 3) {
            flag = true
        }
        expect(flag).assertEqual(true)
    })

    /**
     * @tc.name   testUptime002
     * @tc.number testUptime002
     * @tc.desc   Returns the running time of the system.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUptime002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function ()  {
        let result1 = process.uptime()
        await delay(4000);
        let result2 = process.uptime()
        var flag = false
        if ((result2 - result1) >= 4) {
            flag = true
        }
        expect(flag).assertEqual(true)
    })

    /**
     * @tc.name   testUptime003
     * @tc.number testUptime003
     * @tc.desc   Returns the running time of the system.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUptime003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function ()  {
        let result1 = process.uptime()
        await delay(2000);
        let result2 = process.uptime()
        var flag = false
        if ((result2 - result1) >= 2) {
            flag = true
        }
        expect(flag).assertEqual(true)
    })

    /**
     * @tc.name   testUptime004
     * @tc.number testUptime004
     * @tc.desc   Returns the running time of the system.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUptime004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function ()  {
        let result1 = process.uptime()
        await delay(3000);
        let result2 = process.uptime()
        var flag = false
        if ((result2 - result1) >= 3) {
            flag = true
        }
        expect(flag).assertEqual(true)
    })

    /**
     * @tc.name   testUptime005
     * @tc.number testUptime005
     * @tc.desc   Returns the running time of the system.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUptime005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function ()  {
        let result1 = process.uptime()
        await delay(2000);
        let result2 = process.uptime()
        var flag = false
        if ((result2 - result1) >= 5) {
            flag = true
        }
        expect(flag).assertEqual(false)
    })

    /**
     * @tc.name   testPid001
     * @tc.number testPid001
     * @tc.desc   Return pid is the pid of the current process.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let result = process.pid
        if (result > 0) {
            var flag = true
        }
        expect(flag).assertEqual(true)
    })

    /**
     * @tc.name   testPid002
     * @tc.number testPid002
     * @tc.desc   Return pid is the pid of the current process.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPid002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i = 0; i < 3; i++) {
            let result = process.pid
            if (result > 0) {
                var flag = true
            }
            expect(flag).assertEqual(true)
        }
    })

    /**
     * @tc.name   testPid003
     * @tc.number testPid003
     * @tc.desc   Return pid is the pid of the current process.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPid003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i = 0; i < 5; i++) {
            let result = process.pid
            if (result > 0) {
                var flag = true
            }
            expect(flag).assertEqual(true)
        }
    })

    /**
     * @tc.name   testPid004
     * @tc.number testPid004
     * @tc.desc   Return pid is the pid of the current process.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPid004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i = 0; i < 6; i++) {
            let result = process.pid
            if (result > 0) {
                var flag = true
            }
            expect(flag).assertEqual(true)
        }
    })

    /**
     * @tc.name   testPid005
     * @tc.number testPid005
     * @tc.desc   Return pid is the pid of the current process.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPid005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i = 0; i < 8; i++) {
            let result = process.pid
            if (result > 0) {
                var flag = true
            }
            expect(flag).assertEqual(true)
        }
    })

    /**
     * @tc.name   testTid001
     * @tc.number testTid001
     * @tc.desc   Returns the tid of the current thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pres = process.tid
        if (pres > 0) {
            var flag = new Boolean(true)
        }
        expect(Boolean(flag)).assertEqual(true)
    })

    /**
     * @tc.name   testTid002
     * @tc.number testTid002
     * @tc.desc   Returns the tid of the current thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTid002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i < 5; i++) {
            let pres = process.tid
            if (pres > 0) {
                var flag = new Boolean(true)
            }
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name   testTid003
     * @tc.number testTid003
     * @tc.desc   Returns the tid of the current thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTid003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i < 3; i++) {
            let pres = process.tid
            if (pres > 0) {
                var flag = new Boolean(true)
            }
            expect(Boolean(flag)).assertEqual(true)
        }
    })


    /**
     * @tc.name   testisIsolatedProcess001
     * @tc.number testisIsolatedProcess001
     * @tc.desc   Returns a boolean whether the process is isolated.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisIsolatedProcess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pres = process.isIsolatedProcess()
        expect(pres).assertEqual(true)
    })

    /**
     * @tc.name   testisIsolatedProcess002
     * @tc.number testisIsolatedProcess002
     * @tc.desc   Returns a boolean whether the process is isolated.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisIsolatedProcess002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i < 3; i++) {
            let pres = process.isIsolatedProcess()
            expect(pres).assertEqual(true)
        }
    })

    /**
     * @tc.name   testisIsolatedProcess003
     * @tc.number testisIsolatedProcess003
     * @tc.desc   Returns a boolean whether the process is isolated.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisIsolatedProcess003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i < 5; i++) {
            let pres = process.isIsolatedProcess()
            expect(pres).assertEqual(true)
        }
    })


    /**
     * @tc.name   testIsappuid001
     * @tc.number testIsappuid001
     * @tc.desc   Returns a boolean whether the specified uid belongs to a particular application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsappuid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let isorno = process.isAppUid(167)
        expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name   testIsappuid002
     * @tc.number testIsappuid002
     * @tc.desc   Returns a boolean whether the specified uid belongs to a particular application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsappuid002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let isorno = process.isAppUid(123)
        expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name   testIsappuid003
     * @tc.number testIsappuid003
     * @tc.desc   Returns a boolean whether the specified uid belongs to a particular application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsappuid003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let isorno = process.isAppUid(80000)
        expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name   testIsappuid004
     * @tc.number testIsappuid004
     * @tc.desc   Returns a boolean whether the specified uid belongs to a particular application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsappuid004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let isorno = process.isAppUid(789)
        expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name   testIsappuid005
     * @tc.number testIsappuid005
     * @tc.desc   Returns a boolean whether the specified uid belongs to a particular application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsappuid005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let isorno = process.isAppUid(8569)
        expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name   testIs64Bit001
     * @tc.number testIs64Bit001
     * @tc.desc   Returns a boolean whether the process is running in a 64-bit environment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIs64Bit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let isorno = process.is64Bit()
        if (isorno) {
            expect(isorno).assertEqual(true)
        } else {
            expect(isorno).assertEqual(false)
        }
    })

    /**
     * @tc.name   testIs64Bit002
     * @tc.number testIs64Bit002
     * @tc.desc   Returns a boolean whether the process is running in a 64-bit environment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIs64Bit002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<3; i++) {
            let isorno = process.is64Bit()
            if (isorno) {
                expect(isorno).assertEqual(true)
            } else {
            expect(isorno).assertEqual(false)
         }
        }
    })

    /**
     * @tc.name   testIs64Bit004
     * @tc.number testIs64Bit004
     * @tc.desc   Returns a boolean whether the process is running in a 64-bit environment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIs64Bit004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<5; i++) {
            let isorno = process.is64Bit()
            if (isorno) {
                expect(isorno).assertEqual(true)
            } else {
            expect(isorno).assertEqual(false)
            }
        }
    })


    /**
     * @tc.name   testGetUidForName001
     * @tc.number testGetUidForName001
     * @tc.desc   Returns the uid based on the specified user name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUidForName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pres = process.getUidForName("root")
        if (pres != -1) {
            let flag = new Boolean(true)
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name   testGetUidForName002
     * @tc.number testGetUidForName002
     * @tc.desc   Returns the uid based on the specified user name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUidForName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<3; i++) {
            let pres = process.getUidForName("12356")
            expect(pres).assertEqual(-1)
        }
    })

    /**
     * @tc.name   testGetUidForName003
     * @tc.number testGetUidForName003
     * @tc.desc   Returns the uid based on the specified user name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUidForName003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<5; i++) {
            let pres = process.getUidForName("12356")
            expect(pres).assertEqual(-1)
        }
    })


    /**
     * @tc.name   testGetThreadPriority001
     * @tc.number testGetThreadPriority001
     * @tc.desc   Returns the thread priority based on the specified tid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetThreadPriority001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pres = process.tid
        let pri = process.getThreadPriority(pres)
        if (pri) {
            let flag = new Boolean(true)
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name   testGetThreadPriority002
     * @tc.number testGetThreadPriority002
     * @tc.desc   Returns the thread priority based on the specified tid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetThreadPriority002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pres = process.tid
        for (let i=0; i<3; i++) {
            let pri = process.getThreadPriority(pres)
            if (pri > 0) {
                let flag = new Boolean(true)
                expect(Boolean(flag)).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name   testGetThreadPriority003
     * @tc.number testGetThreadPriority003
     * @tc.desc   Returns the thread priority based on the specified tid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetThreadPriority003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pres = process.tid
        for (let i=0; i<5; i++) {
            let pri = process.getThreadPriority(pres)
            if (pri > 0) {
                let flag = new Boolean(true)
                expect(Boolean(flag)).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name   testGetStartRealtime001
     * @tc.number testGetStartRealtime001
     * @tc.desc   Returns the elapsed real time (in milliseconds) taken from the start of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetStartRealtime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<3; i++) {
            let pri = process.getStartRealtime()
            if (pri !== null) {
                var flag = new Boolean(true)
            }
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name   testGetStartRealtime002
     * @tc.number testGetStartRealtime002
     * @tc.desc   Returns the elapsed real time (in milliseconds) taken from the start of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetStartRealtime002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pri = process.getStartRealtime()
        if (pri !== null) {
            var flag = new Boolean(true)
        }
        expect(Boolean(flag)).assertEqual(true)
    })

    /**
     * @tc.name   testGetStartRealtime003
     * @tc.number testGetStartRealtime003
     * @tc.desc   Returns the elapsed real time (in milliseconds) taken from the start of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetStartRealtime003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<5; i++) {
            let pri = process.getStartRealtime()
            if (pri !== null) {
                var flag = new Boolean(true)
            }
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name   testGetStartRealtime004
     * @tc.number testGetStartRealtime004
     * @tc.desc   Returns the elapsed real time (in milliseconds)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetStartRealtime004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<8; i++) {
            let pri = process.getStartRealtime()
            if (pri !== null) {
                var flag = new Boolean(true)
            }
            expect(Boolean(flag)).assertEqual(true)
        }  
    })

    /**
     * @tc.name   testGetStartRealtime005
     * @tc.number testGetStartRealtime005
     * @tc.desc   Returns the elapsed real time (in milliseconds) taken from the start of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetStartRealtime005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<6; i++) {
            let pri = process.getStartRealtime()
            if (pri !== null) {
                var flag = new Boolean(true)
            }
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name   testGetpastCpuTime001
     * @tc.number testGetpastCpuTime001
     * @tc.desc   Returns the cpu time (in milliseconds) from the time when the process starts to the current time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetpastCpuTime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<3; i++) {
            let pri = process.getPastCpuTime()
            if (pri > 0) {
                var flag = new Boolean(true)
            }
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name   testGetpastCpuTime002
     * @tc.number testGetpastCpuTime002
     * @tc.desc   Returns the cpu time (in milliseconds) from the time when the process starts to the current time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetpastCpuTime002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pri = process.getPastCpuTime()
        if (pri > 0) {
            var flag = new Boolean(true)
        }
        expect(Boolean(flag)).assertEqual(true)
    })

    /**
     * @tc.name   testGetpastCpuTime003
     * @tc.number testGetpastCpuTime003
     * @tc.desc   Returns the cpu time (in milliseconds) from the time when the process starts to the current time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetpastCpuTime003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<5; i++) {
            let pri = process.getPastCpuTime()
            if (pri > 0) {
                var flag = new Boolean(true)
            }
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name   testGetpastCpuTime004
     * @tc.number testGetpastCpuTime004
     * @tc.desc   Returns the cpu time (in milliseconds) from the time when the process starts to the current time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetpastCpuTime004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<8; i++) {
            let pri = process.getPastCpuTime()
            if (pri > 0) {
                var flag = new Boolean(true)
            }
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name   testGetSystemConfig001
     * @tc.number testGetSystemConfig001
     * @tc.desc   Returns the system configuration at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetSystemConfig001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let _SC_ARG_MAX = 0
        let pri = process.getSystemConfig(_SC_ARG_MAX)
        if (pri > 0) {
            var flag = new Boolean(true)
        }
        expect(Boolean(flag)).assertEqual(true)
    })

    /**
     * @tc.name   testGetSystemConfig002
     * @tc.number testGetSystemConfig002
     * @tc.desc   Returns the system configuration at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetSystemConfig002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let _SC_ARG_MAX = 0
        for (let i=0; i<3; i++) {
            let pri = process.getSystemConfig(_SC_ARG_MAX)
            if (pri > 0) {
                var flag = new Boolean(true)
            }
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name   testGetSystemConfig003
     * @tc.number testGetSystemConfig003
     * @tc.desc   Returns the system configuration at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetSystemConfig003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let _SC_ARG_MAX = 0
        for (let i=0; i<5; i++) {
            let pri = process.getSystemConfig(_SC_ARG_MAX)
            if (pri > 0) {
                var flag = new Boolean(true)
            }
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name   testGetSystemConfig004
     * @tc.number testGetSystemConfig004
     * @tc.desc   Returns the system configuration at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetSystemConfig004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let _SC_OPEN_MAX = 4
        let pri = process.getSystemConfig(_SC_OPEN_MAX)
        if (pri > 0) {
            var flag = new Boolean(true)
        }
        expect(Boolean(flag)).assertEqual(true)
    })

    /**
     * @tc.name   testGetSystemConfig005
     * @tc.number testGetSystemConfig005
     * @tc.desc   Returns the system configuration at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetSystemConfig005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let _SC_PAGESIZE = 8
        let pri = process.getSystemConfig(_SC_PAGESIZE)
        if (pri > 0) {
            var flag = new Boolean(true)
        }
        expect(Boolean(flag)).assertEqual(true)
    })

    /**
     * @tc.name   testGetEnvironmentVar001
     * @tc.number testGetEnvironmentVar001
     * @tc.desc   Returns the system value for environment variables.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEnvironmentVar001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pri = process.getEnvironmentVar("USER")
        if (pri != null) {
            var flag = new Boolean(true)
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name   testGetEnvironmentVar002
     * @tc.number testGetEnvironmentVar002
     * @tc.desc   Returns the system value for environment variables.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEnvironmentVar002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<3; i++) {
            let pri = process.getEnvironmentVar("PATH")
            if (pri != null) {
                var flag = new Boolean(true)
                expect(Boolean(flag)).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name   testGetEnvironmentVar003
     * @tc.number testGetEnvironmentVar003
     * @tc.desc   Returns the system value for environment variables.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEnvironmentVar003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<5; i++) {
            let pri = process.getEnvironmentVar("PATH")
            if (pri != null) {
                var flag = new Boolean(true)
                expect(Boolean(flag)).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name   testGetEnvironmentVar004
     * @tc.number testGetEnvironmentVar004
     * @tc.desc   Returns the system value for environment variables.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEnvironmentVar004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<6; i++) {
            let pri = process.getEnvironmentVar("USER")
            if (pri != null) {
                var flag = new Boolean(true)
                expect(Boolean(flag)).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name   testGetEnvironmentVar005
     * @tc.number testGetEnvironmentVar005
     * @tc.desc   Returns the system value for environment variables.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEnvironmentVar005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<8; i++) {
            let pri = process.getEnvironmentVar("USER")
            if (pri != null) {
                var flag = new Boolean(true)
                expect(Boolean(flag)).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name   testGetEnvironmentVar006
     * @tc.number testGetEnvironmentVar006
     * @tc.desc   Returns the system value for environment variables.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEnvironmentVar006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        for (let i=0; i<100; i++) {
            let pri = process.getEnvironmentVar("i123")
            if (pri == null) {
                var flag = new Boolean(true)
                expect(Boolean(flag)).assertEqual(true)
            }
        }
    })
})
describe('ProcessManager', function () {
        /**
         * @tc.name   testProcessManagerIsappuid001
         * @tc.number testProcessManagerIsappuid001
         * @tc.desc   Returns a boolean whether the specified uid belongs to a particular application.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testProcessManagerIsappuid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let isorno = pro.isAppUid(167)
        expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name   testProcessManagerIsappuid002
     * @tc.number testProcessManagerIsappuid002
     * @tc.desc   Returns a boolean whether the specified uid belongs to a particular application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerIsappuid002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let isorno = pro.isAppUid(123)
        expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name   testProcessManagerIsappuid003
     * @tc.number testProcessManagerIsappuid003
     * @tc.desc   Returns a boolean whether the specified uid belongs to a particular application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerIsappuid003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let isorno = pro.isAppUid(80000)
        expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name   testProcessManagerIsappuid004
     * @tc.number testProcessManagerIsappuid004
     * @tc.desc   Returns a boolean whether the specified uid belongs to a particular application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerIsappuid004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let isorno = pro.isAppUid(789)
        expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name   testProcessManagerIsappuid005
     * @tc.number testProcessManagerIsappuid005
     * @tc.desc   Returns a boolean whether the specified uid belongs to a particular application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerIsappuid005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let isorno = pro.isAppUid(8569)
        expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name   testProcessManagerIsappuid006
     * @tc.number testProcessManagerIsappuid006
     * @tc.desc   Returns a boolean whether the specified uid belongs to a particular application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerIsappuid006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try {
            let pro = new process.ProcessManager()
            let mag = pro.isAppUid("asdad")
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: Parameter error. The type of code must be number.")
        }
    })
    /**
     * @tc.name   testProcessManagerKill001
     * @tc.number testProcessManagerKill001
     * @tc.desc   Return whether the signal was sent successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerKill001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let result = pro.kill(3, 123)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name   testProcessManagerKill002
     * @tc.number testProcessManagerKill002
     * @tc.desc   Return whether the signal was sent successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerKill002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let pres = process.pid
        let result = pro.kill(23, pres)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name   testProcessManagerKill003
     * @tc.number testProcessManagerKill003
     * @tc.desc   Return whether the signal was sent successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerKill003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let pres = process.pid
        let result = pro.kill(28, pres)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name   testProcessManagerKill004
     * @tc.number testProcessManagerKill004
     * @tc.desc   Return whether the signal was sent successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerKill004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let pres = process.pid
        let result = pro.kill(17, pres)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name   testProcessManagerKill005
     * @tc.number testProcessManagerKill005
     * @tc.desc   Return whether the signal was sent successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerKill005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let result = pro.kill(3, 113)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name   testProcessManagerKill006
     * @tc.number testProcessManagerKill006
     * @tc.desc   Return whether the signal was sent successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerKill006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try {
            let pro = new process.ProcessManager()
            let result = pro.kill("asd", 123)
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: Parameter error. The type of signal or pid must be " +
                "number.")
        }
    })

    /**
     * @tc.name   testProcessManagerGetUidForName001
     * @tc.number testProcessManagerGetUidForName001
     * @tc.desc   Returns the uid based on the specified user name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetUidForName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let pres = pro.getUidForName("root")
        if (pres != -1) {
            let flag = new Boolean(true)
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name   testProcessManagerGetUidForName002
     * @tc.number testProcessManagerGetUidForName002
     * @tc.desc   Returns the uid based on the specified user name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetUidForName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        for (let i=0; i<3; i++) {
            let pres = pro.getUidForName("12356")
            expect(pres).assertEqual(-1)
        }
    })

    /**
     * @tc.name   testProcessManagerGetUidForName003
     * @tc.number testProcessManagerGetUidForName003
     * @tc.desc   Returns the uid based on the specified user name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetUidForName003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        for (let i=0; i<5; i++) {
            let pres = pro.getUidForName("as123")
            expect(pres).assertEqual(-1)
        }
    })
    /**
     * @tc.name   testProcessManagerGetUidForName004
     * @tc.number testProcessManagerGetUidForName004
     * @tc.desc   Returns the uid based on the specified user name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetUidForName004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try {
            let pro = new process.ProcessManager()
            let pres = pro.getUidForName(12)
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: Parameter error. The type of code must be string.")
        }
    })

    /**
     * @tc.name   testProcessManagerGetThreadPriority001
     * @tc.number testProcessManagerGetThreadPriority001
     * @tc.desc   Returns the thread priority based on the specified tid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetThreadPriority001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let pres = process.tid
        let pri = pro.getThreadPriority(pres)
        if (pri) {
            let flag = new Boolean(true)
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name   testProcessManagerGetThreadPriority002
     * @tc.number testProcessManagerGetThreadPriority002
     * @tc.desc   Returns the thread priority based on the specified tid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetThreadPriority002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let pres = process.tid
        for (let i=0; i<3; i++) {
            let pri = pro.getThreadPriority(pres)
            if (pri > 0) {
                let flag = new Boolean(true)
                expect(Boolean(flag)).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name   testProcessManagerGetThreadPriority003
     * @tc.number testProcessManagerGetThreadPriority003
     * @tc.desc   Returns the thread priority based on the specified tid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetThreadPriority003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let pres = process.tid
        for (let i=0; i<5; i++) {
            let pri = pro.getThreadPriority(pres)
            if (pri > 0) {
                let flag = new Boolean(true)
                expect(Boolean(flag)).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name   testProcessManagerGetThreadPriority004
     * @tc.number testProcessManagerGetThreadPriority004
     * @tc.desc   Returns the thread priority based on the specified tid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetThreadPriority004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try {
            let pro = new process.ProcessManager()
            let pri = pro.getThreadPriority("asdad")
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: Parameter error. The type of code must be number.")
        }
    })

    /**
     * @tc.name   testProcessManagerGetSystemConfig001
     * @tc.number testProcessManagerGetSystemConfig001
     * @tc.desc   Returns the system configuration at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetSystemConfig001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let _SC_ARG_MAX = 0
        let pri = pro.getSystemConfig(_SC_ARG_MAX)
        if (pri > 0) {
            var flag = new Boolean(true)
        }
        expect(Boolean(flag)).assertEqual(true)
    })

    /**
     * @tc.name   testProcessManagerGetSystemConfig002
     * @tc.number testProcessManagerGetSystemConfig002
     * @tc.desc   Returns the system configuration at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetSystemConfig002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let _SC_ARG_MAX = 0
        for (let i=0; i<3; i++) {
            let pri = pro.getSystemConfig(_SC_ARG_MAX)
            if (pri > 0) {
                var flag = new Boolean(true)
            }
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name   testProcessManagerGetSystemConfig003
     * @tc.number testProcessManagerGetSystemConfig003
     * @tc.desc   Returns the system configuration at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetSystemConfig003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let _SC_ARG_MAX = 0
        for (let i=0; i<5; i++) {
            let pri = pro.getSystemConfig(_SC_ARG_MAX)
            if (pri > 0) {
                var flag = new Boolean(true)
            }
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name   testProcessManagerGetSystemConfig004
     * @tc.number testProcessManagerGetSystemConfig004
     * @tc.desc   Returns the system configuration at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetSystemConfig004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let _SC_OPEN_MAX = 4
        let pri = pro.getSystemConfig(_SC_OPEN_MAX)
        if (pri > 0) {
            var flag = new Boolean(true)
        }
        expect(Boolean(flag)).assertEqual(true)
    })

    /**
     * @tc.name   testProcessManagerGetSystemConfig005
     * @tc.number testProcessManagerGetSystemConfig005
     * @tc.desc   Returns the system configuration at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetSystemConfig005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let _SC_PAGESIZE = 8
        let pri = pro.getSystemConfig(_SC_PAGESIZE)
        if (pri > 0) {
            var flag = new Boolean(true)
        }
        expect(Boolean(flag)).assertEqual(true)
    })

    /**
     * @tc.name   testProcessManagerGetSystemConfig006
     * @tc.number testProcessManagerGetSystemConfig006
     * @tc.desc   Returns the system configuration at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetSystemConfig006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try {
            let pro = new process.ProcessManager()
            let pri = pro.getSystemConfig("asdad")
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: Parameter error. The type of name must be number.")
        }
    })

    /**
     * @tc.name   testProcessManagerGetEnvironmentVar001
     * @tc.number testProcessManagerGetEnvironmentVar001
     * @tc.desc   Returns the system value for environment variables.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetEnvironmentVar001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        let pri = pro.getEnvironmentVar("USER")
        if (pri != null) {
            var flag = new Boolean(true)
            expect(Boolean(flag)).assertEqual(true)
        }
    })

    /**
     * @tc.name   testProcessManagerGetEnvironmentVar002
     * @tc.number testProcessManagerGetEnvironmentVar002
     * @tc.desc   Returns the system value for environment variables.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetEnvironmentVar002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        for (let i=0; i<3; i++) {
            let pri = pro.getEnvironmentVar("PATH")
            if (pri != null) {
                var flag = new Boolean(true)
                expect(Boolean(flag)).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name   testProcessManagerGetEnvironmentVar003
     * @tc.number testProcessManagerGetEnvironmentVar003
     * @tc.desc   Returns the system value for environment variables.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetEnvironmentVar003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let pro = new process.ProcessManager()
        for (let i=0; i<100; i++) {
            let pri = pro.getEnvironmentVar("i123")
            if (pri == null) {
                var flag = new Boolean(true)
                expect(Boolean(flag)).assertEqual(true)
            }
        }
    })

    /**
     * @tc.name   testProcessManagerGetEnvironmentVar004
     * @tc.number testProcessManagerGetEnvironmentVar004
     * @tc.desc   Returns the system value for environment variables.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetEnvironmentVar004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try {
            let pro = new process.ProcessManager()
            let pri = pro.getEnvironmentVar(123)
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: Parameter error. The type of name must be string.")
        }
    })
})
}