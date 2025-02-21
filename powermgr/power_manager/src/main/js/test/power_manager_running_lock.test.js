/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import runningLock from '@ohos.runningLock'

import { describe, it, expect } from '@ohos/hypium'

export default function PowerManagerRunningLockTest() {
    describe('PowerManagerRunningLockTest', function () {
        console.log("*************RunningLock Unit Test Begin*************");

        /**
         * @tc.number SUB_PowerSystem_PowerManager_JSTest_0010
         * @tc.name Running_Lock_Lock_JSTest0010
         * @tc.desc Prevents the system from hibernating and sets the lock duration (deprecated since 9)
         */
        it('Running_Lock_Lock_JSTest0010', 0, async function (done) {
            await runningLock.createRunningLock("Running_Lock_Lock_JSTest0010", runningLock.RunningLockType.BACKGROUND)
                .then(runninglock => {
                    expect(runninglock !== null).assertTrue();
                    let used = runninglock.isUsed();
                    console.info('Running_Lock_Lock_JSTest0010 is used: ' + used);
                    expect(used).assertFalse();
                    runninglock.lock(500);
                    used = runninglock.isUsed();
                    console.info('after lock Running_Lock_Lock_JSTest0010 is used: ' + used);
                    expect(used).assertTrue();
                })
                .catch(error => {
                    console.log('Running_Lock_Lock_JSTest0010 error: ' + error);
                    expect().assertFail();
                })
            done();
        })

        /**
         * @tc.number SUB_PowerSystem_PowerManager_JSTest_0020
         * @tc.name Running_Lock_used_JSTest0020
         * @tc.desc Checks whether a lock is held or in use (deprecated since 9)
         */
        it('Running_Lock_used_JSTest0020', 0, async function (done) {
            await runningLock.createRunningLock("Running_Lock_used_JSTest0020", runningLock.RunningLockType.BACKGROUND)
                .then(runninglock => {
                    expect(runninglock !== null).assertTrue();
                    let used = runninglock.isUsed();
                    console.info('Running_Lock_used_JSTest0020 used: ' + used);
                    expect(used).assertFalse();
                    console.info('Running_Lock_used_JSTest0020 success');
                })
                .catch(error => {
                    console.log('Running_Lock_used_JSTest0020 error: ' + error);
                    expect().assertFail();
                })
            done();
        })

        /**
         * @tc.number SUB_PowerSystem_PowerManager_JSTest_0030
         * @tc.name Running_Lock_Unlock_JSTest0030
         * @tc.desc Release running lock (deprecated since 9)
         */
        it('Running_Lock_Unlock_JSTest0030', 0, async function (done) {
            await runningLock.createRunningLock("Running_Lock_Unlock_JSTest0030", runningLock.RunningLockType.BACKGROUND)
                .then(runninglock => {
                    expect(runninglock !== null).assertTrue();
                    let used = runninglock.isUsed();
                    console.info('Running_Lock_Unlock_JSTest0030 is used: ' + used);
                    expect(used).assertFalse();
                    runninglock.lock(500);
                    used = runninglock.isUsed();
                    console.info('after lock Running_Lock_Unlock_JSTest0030 is used: ' + used);
                    expect(used).assertTrue();
                    runninglock.unlock();
                    used = runninglock.isUsed();
                    console.info('after unlock Running_Lock_Unlock_JSTest0030 is used: ' + used);
                    expect(used).assertFalse();
                    console.info('Running_Lock_Unlock_JSTest0030 success');
                })
                .catch(error => {
                    console.log('Running_Lock_Unlock_JSTest0030 error: ' + error);
                    expect().assertFail();
                })
            done();
        })

        /**
        * @tc.number SUB_PowerSystem_PowerManager_JSTest_0040
        * @tc.name Running_Lock_Hold_IsHolding_UnHold_JSTest0040
        * @tc.desc hold lock, is holding , unhold
        */
        it('Running_Lock_Hold_IsHolding_UnHold_JSTest0040', 0, async function (done) {
            try {
                let isExec = false;
                await runningLock.create("Running_Lock_Hold_IsHolding_UnHold_JSTest0040", runningLock.RunningLockType.BACKGROUND)
                    .then((runninglock) => {
                        isExec = true;
                        expect(runninglock !== null).assertTrue();
                        let holding = runninglock.isHolding();
                        console.info('Running_Lock_Hold_IsHolding_UnHold_JSTest0040 holding false:' + holding);
                        expect(holding).assertFalse();
                        runninglock.hold(1000); // hold 1000ms
                        holding = runninglock.isHolding();
                        console.info('Running_Lock_Hold_IsHolding_UnHold_JSTest0040 holding true:' + holding);
                        expect(holding).assertTrue();
                        runninglock.unhold();
                        expect(runninglock.isHolding()).assertFalse();
                    })
                    .catch((error) => {
                        isExec = true;
                        console.info('Running_Lock_Hold_IsHolding_UnHold_JSTest0040 error:' + (typeof error));
                        expect(typeof error !== "undefined").assertTrue();
                        console.info('Running_Lock_Hold_IsHolding_UnHold_JSTest0040 error code:' + error.code + " msg: " + error.message);
                    })
                    .finally(() => {
                        expect(isExec).assertTrue();
                    })
            } catch (e) {
                console.info('Running_Lock_Hold_IsHolding_UnHold_JSTest0040 error:' + e);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number SUB_PowerSystem_PowerManager_JSTest_0050
         * @tc.name Enum_RunningLock_Type_Background_JSTest0050
         * @tc.desc The lock type is BACKGROUND
         */
        it('Enum_RunningLock_Type_Background_JSTest0050', 0, function () {
            let runningLockType = runningLock.RunningLockType.BACKGROUND;
            console.info('runningLockType = ' + runningLockType);
            expect(runningLockType == 1).assertTrue();
            console.info('Enum_RunningLock_Type_Background_JSTest0050 success');
        })

        /**
         * @tc.number SUB_PowerSystem_PowerManager_JSTest_0060
         * @tc.name Enum_RunningLock_Type_Proximityscreencontrol_JSTest0060
         * @tc.desc The lock type is PROXIMITY_SCREEN_CONTROL
         */
        it('Enum_RunningLock_Type_Proximityscreencontrol_JSTest0060', 0, function () {
            let runningLockType = runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL;
            console.info('runningLockType = ' + runningLockType);
            expect(runningLockType == 2).assertTrue();
            console.info('Enum_RunningLock_Type_Proximityscreencontrol_JSTest0060 success');
        })

        /**
         * @tc.number SUB_PowerSystem_PowerManager_JSTest_0070
         * @tc.name Is_Runninglock_Type_Supported_Promise_JSTest0070
         * @tc.desc Checks whether the specified RunningLockType is supported (deprecated since 9)
         */
        it('Is_Runninglock_Type_Supported_Promise_JSTest0070', 0, async function (done) {
            await runningLock.isRunningLockTypeSupported(runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL)
                .then(supported => {
                    console.info('Is_Runninglock_Type_Supported_Promise_JSTest0070 PROXIMITY_SCREEN_CONTROL supported is ' + supported);
                    expect(supported).assertTrue();
                    console.info('Is_Runninglock_Type_Supported_Promise_JSTest0070 success');
                })
                .catch(error => {
                    console.log('Is_Runninglock_Type_Supported_Promise_JSTest0070 error: ' + error);
                    expect().assertFail();
                })
            done();
        })

        /**
         * @tc.number SUB_PowerSystem_PowerManager_JSTest_0080
         * @tc.name Is_Runninglock_Type_Supported_Promise_JSTest0080
         * @tc.desc Checks whether the specified RunningLockType is supported (deprecated since 9)
         */
        it('Is_Runninglock_Type_Supported_Promise_JSTest0080', 0, async function (done) {
            await runningLock.isRunningLockTypeSupported(runningLock.RunningLockType.BACKGROUND)
                .then(supported => {
                    console.info('Is_Runninglock_Type_Supported_Promise_JSTest0080 BACKGROUND supported is ' + supported);
                    expect(supported).assertTrue();
                    console.info('Is_Runninglock_Type_Supported_Promise_JSTest0080 success');
                })
                .catch(error => {
                    console.log('Is_Runninglock_Type_Supported_Promise_JSTest0080 error: ' + error);
                    expect().assertFail();
                })
            done();
        })

        /**
         * @tc.number SUB_PowerSystem_PowerManager_JSTest_0090
         * @tc.name Is_Runninglock_Type_Supported_Callback_JSTest0090
         * @tc.desc Checks whether the specified RunningLockType is supported (deprecated since 9)
         */
        it('Is_Runninglock_Type_Supported_Callback_JSTest0090', 0, async function (done) {
            runningLock.isRunningLockTypeSupported(runningLock.RunningLockType.BACKGROUND, (error, supported) => {
                if (typeof error === "undefined") {
                    console.info('Is_Runninglock_Type_Supported_Callback_JSTest0090 supported is ' + supported);
                    expect(supported).assertTrue();
                    console.info('Is_Runninglock_Type_Supported_Callback_JSTest0090 success');
                } else {
                    console.log('Is_Runninglock_Type_Supported_Callback_JSTest0090: ' + error);
                    expect().assertFail();
                }
                done();
            })
        })

        /**
         * @tc.number SUB_PowerSystem_PowerManager_JSTest_0100
         * @tc.name Is_Supported_JSTest0100
         * @tc.desc Checks whether the specified RunningLockType is supported.
         */
        it('Is_Supported_JSTest0100', 0, async function (done) {
            try {
                let background = runningLock.isSupported(runningLock.RunningLockType.BACKGROUND)
                expect(background).assertTrue();
            } catch (e) {
                console.info('Is_Supported_JSTest0100 code:' + e);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number SUB_PowerSystem_PowerManager_JSTest_0110
         * @tc.name Create_Running_Lock_Promise_JSTest0110
         * @tc.desc Create running lock promise (deprecated since 9)
         */
        it('Create_Running_Lock_Promise_JSTest0110', 0, async function (done) {
            await runningLock.createRunningLock("running_lock_test_1", runningLock.RunningLockType.BACKGROUND)
                .then(runninglock => {
                    expect(runninglock !== null).assertTrue();
                    console.info('Create_Running_Lock_Promise_JSTest0110 success');
                })
                .catch(error => {
                    console.log('Create_Running_Lock_Promise_JSTest0110 error: ' + error);
                    expect().assertFail();
                })
            done();
        })

        /**
         * @tc.number SUB_PowerSystem_PowerManager_JSTest_0120
         * @tc.name Create_Running_Lock_CallBack_JSTest0120
         * @tc.desc Create running lock callback (deprecated since 9)
         */
        it('Create_Running_Lock_CallBack_JSTest0120', 0, async function (done) {
            runningLock.createRunningLock("Create_Running_Lock_CallBack_JSTest0120", runningLock.RunningLockType.BACKGROUND,
                (error, runninglock) => {
                    if (typeof error === "undefined") {
                        console.info('Create_Running_Lock_CallBack_JSTest0120: runningLock is ' + runninglock);
                        expect(runninglock !== null).assertTrue();
                        let used = runninglock.isUsed();
                        console.info('Create_Running_Lock_CallBack_JSTest0120 is used: ' + used);
                        expect(used).assertFalse();
                        runninglock.lock(500);
                        used = runninglock.isUsed();
                        console.info('after lock Create_Running_Lock_CallBack_JSTest0120 is used: ' + used);
                        expect(used).assertTrue();
                        console.info('Create_Running_Lock_CallBack_JSTest0120 success');
                    } else {
                        console.log('Create_Running_Lock_CallBack_JSTest0120: ' + error);
                        expect().assertFail();
                    }
                    done();
                })
        })

        /**
        * @tc.number SUB_PowerSystem_PowerManager_JSTest_0130
        * @tc.name Create_Running_Lock_Promise_JSTest0130
        * @tc.desc Create lock promise
        */
        it('Create_Running_Lock_Promise_JSTest0130', 0, async function (done) {
            try {
                let isExec = false;
                await runningLock.create("Create_Running_Lock_Promise_JSTest0130", runningLock.RunningLockType.BACKGROUND)
                    .then((runninglock) => {
                        isExec = true;
                        expect(runninglock !== null).assertTrue();
                        console.info('Create_Running_Lock_Promise_JSTest0130 success');
                    })
                    .catch((error) => {
                        isExec = true;
                        console.info('Create_Running_Lock_Promise_JSTest0130 error:' + (typeof error));
                        expect(typeof error !== "undefined").assertTrue();
                        console.info('Create_Running_Lock_Promise_JSTest0130 error code:' + error.code + " msg: " + error.message);
                    })
                    .finally(() => {
                        expect(isExec).assertTrue();
                    })
            } catch (e) {
                console.info('Create_Running_Lock_Promise_JSTest0130 error:' + e);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number SUB_PowerSystem_PowerManager_JSTest_0140
         * @tc.name Create_Running_Lock_Promise_Invalid_JSTest0130
         * @tc.desc Create lock input invalid value
         */
        it('Create_Running_Lock_Promise_Invalid_JSTest0130', 0, async function (done) {
            try {
                runningLock.create(0, runningLock.RunningLockType.BACKGROUND)
                    .then((runninglock) => {
                        expect().assertFail();
                    })
            } catch (e) {
                console.info('Create_Running_Lock_Promise_Invalid_JSTest0130 code:' + e.code + "msg:" + e.message);
                // 401: Invalid input parameter
                expect(e.code === 401).assertTrue();
            }
            done();
        })

        /**
         * @tc.number SUB_PowerSystem_PowerManager_JSTest_0140
         * @tc.name Create_Running_Lock_Callback_JSTest0140
         * @tc.desc Create lock callback
         */
        it('Create_Running_Lock_Callback_JSTest0140', 0, async function (done) {
            try {
                runningLock.create("Create_Running_Lock_Callback_JSTest0140", runningLock.RunningLockType.BACKGROUND,
                    (error, runninglock) => {
                        expect(typeof error === "undefined").assertTrue();
                        expect(runninglock !== null).assertTrue();
                        console.info('Create_Running_Lock_Callback_JSTest0140 success');
                        done();
                    });
            } catch (e) {
                console.info('Create_Running_Lock_Callback_JSTest0230 error:' + e);
                expect().assertFail();
            }
        })

        /**
         * @tc.number SUB_PowerSystem_PowerManager_JSTest_0150
         * @tc.name Create_Running_Lock_Callback_JSTest0150
         * @tc.desc Create lock input invalid value
         */
        it('Create_Running_Lock_Callback_Invalid_JSTest0150', 0, async function (done) {
            try {
                runningLock.create("Create_Running_Lock_Callback_Invalid_JSTest0150", "invalid",
                    (error, runninglock) => {
                        expect().assertFail();
                    });
            } catch (e) {
                console.info('Create_Running_Lock_Callback_Invalid_JSTest0150 code:' + e.code + "msg:" + e.message);
                // 401: Invalid input parameter
                expect(e.code === 401).assertTrue();
            }
            done();
        })
    })
}
