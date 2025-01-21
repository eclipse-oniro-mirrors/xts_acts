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

export default function RunningLockTest() {
    describe('RunningLockTest', function () {
        console.log("*************RunningLock Test Begin*************");

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0010
         * @tc.name testRunning_Lock_Lock_JSTest0010
         * @tc.desc Prevents the system from hibernating and sets the lock duration (deprecated since 9)
         * @tc.level: Level 1
         * @tc.type: Functiontion
         * @tc.size: MediumTest
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
                    done();
                })
                .catch(error => {
                    console.log('Running_Lock_Lock_JSTest0010 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0020
         * @tc.name testRunning_Lock_used_JSTest0020
         * @tc.desc Checks whether a lock is held or in use (deprecated since 9)
         * @tc.level: Level 1
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('Running_Lock_used_JSTest0020', 0, async function (done) {
            await runningLock.createRunningLock("Running_Lock_used_JSTest0020", runningLock.RunningLockType.BACKGROUND)
                .then(runninglock => {
                    expect(runninglock !== null).assertTrue();
                    let used = runninglock.isUsed();
                    console.info('Running_Lock_used_JSTest0020 used: ' + used);
                    expect(used).assertFalse();
                    console.info('Running_Lock_used_JSTest0020 success');
                    done();
                })
                .catch(error => {
                    console.log('Running_Lock_used_JSTest0020 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0030
         * @tc.name testRunning_Lock_Unlock_JSTest0030
         * @tc.desc Release running lock (deprecated since 9)
         * @tc.level: Level 1
         * @tc.type: Functiontion
         * @tc.size: MediumTest
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
                    done();
                })
                .catch(error => {
                    console.log('Running_Lock_Unlock_JSTest0030 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0040
         * @tc.name testRunning_Lock_Hold_IsHolding_UnHold_JSTest0040
         * @tc.desc hold lock, is holding , unhold
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
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
                        done();
                    })
                    .catch((error) => {
                        isExec = true;
                        console.info('Running_Lock_Hold_IsHolding_UnHold_JSTest0040 error:' + (typeof error));
                        expect(typeof error !== "undefined").assertTrue();
                        console.info('Running_Lock_Hold_IsHolding_UnHold_JSTest0040 error code:' + error.code + " msg: " + error.message);
                        done();
                    })
                    .finally(() => {
                        expect(isExec).assertTrue();
                        done();
                    })
            } catch (e) {
                console.info('Running_Lock_Hold_IsHolding_UnHold_JSTest0040 error:' + e);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0050
         * @tc.name testRunning_Lock_IsHolding_UnHold_JSTest0050
         * @tc.desc hold lock, is holding , unhold
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('Running_Lock_IsHolding_UnHold_JSTest0050', 0, async function (done) {
            try {
                let isExec = false;
                await runningLock.create("Running_Lock_IsHolding_UnHold_JSTest0050", runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL)
                    .then((runninglock) => {
                        isExec = true;
                        expect(runninglock !== null).assertTrue();
                        let holding = runninglock.isHolding();
                        console.info('Running_Lock_IsHolding_UnHold_JSTest0050 holding false:' + holding);
                        expect(holding).assertFalse();
                        runninglock.unhold();
                        expect(runninglock.isHolding()).assertFalse();
                        done();
                    })
                    .catch((error) => {
                        isExec = true;
                        console.info('Running_Lock_IsHolding_UnHold_JSTest0050 error:' + (typeof error));
                        expect(typeof error !== "undefined").assertTrue();
                        console.info('Running_Lock_IsHolding_UnHold_JSTest0050 error code:' + error.code + " msg: " + error.message);
                        done();
                    })
                    .finally(() => {
                        expect(isExec).assertTrue();
                        done();
                    })
            } catch (e) {
                console.info('Running_Lock_IsHolding_UnHold_JSTest0050 error:' + e);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0060
         * @tc.name testRunning_Lock_Hold_IsHolding_UnHold_JSTest0060
         * @tc.desc hold lock, is holding , unhold
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('Running_Lock_Hold_IsHolding_UnHold_JSTest0060', 0, async function (done) {
            try {
                let isExec = false;
                await runningLock.create("Running_Lock_Hold_IsHolding_UnHold_JSTest0060", runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL)
                    .then((runninglock) => {
                        isExec = true;
                        expect(runninglock !== null).assertTrue();
                        let holding = runninglock.isHolding();
                        console.info('Running_Lock_Hold_IsHolding_UnHold_JSTest0060 holding false:' + holding);
                        expect(holding).assertFalse();
                        runninglock.hold(-1);
                        holding = runninglock.isHolding();
                        console.info('Running_Lock_Hold_IsHolding_UnHold_JSTest0060 holding true:' + holding);
                        expect(holding).assertTrue();
                        runninglock.unhold();
                        expect(runninglock.isHolding()).assertFalse();
                        done();
                    })
                    .catch((error) => {
                        isExec = true;
                        console.info('Running_Lock_Hold_IsHolding_UnHold_JSTest0060 error:' + (typeof error));
                        expect(typeof error !== "undefined").assertTrue();
                        console.info('Running_Lock_Hold_IsHolding_UnHold_JSTest0060 error code:' + error.code + " msg: " + error.message);
                        done();
                    })
                    .finally(() => {
                        expect(isExec).assertTrue();
                        done();
                    })
            } catch (e) {
                console.info('Running_Lock_Hold_IsHolding_UnHold_JSTest0060 error:' + e);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0070
         * @tc.name testEnum_RunningLock_Type_Background_JSTest0070
         * @tc.desc The lock type is BACKGROUND
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('Enum_RunningLock_Type_Background_JSTest0070', 0, function () {
            let runningLockType = runningLock.RunningLockType.BACKGROUND;
            console.info('runningLockType = ' + runningLockType);
            expect(runningLockType == 1).assertTrue();
            console.info('Enum_RunningLock_Type_Background_JSTest0070 success');
        })

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0080
         * @tc.name testEnum_RunningLock_Type_Proximityscreencontrol_JSTest0080
         * @tc.desc The lock type is PROXIMITY_SCREEN_CONTROL
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('Enum_RunningLock_Type_Proximityscreencontrol_JSTest0080', 0, function () {
            let runningLockType = runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL;
            console.info('runningLockType = ' + runningLockType);
            expect(runningLockType == 2).assertTrue();
            console.info('Enum_RunningLock_Type_Proximityscreencontrol_JSTest0080 success');
        })

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0090
         * @tc.name testIs_Runninglock_Type_Supported_Promise_JSTest0090
         * @tc.desc Checks whether the specified RunningLockType is supported (deprecated since 9)
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('Is_Runninglock_Type_Supported_Promise_JSTest0090', 0, async function (done) {
            await runningLock.isRunningLockTypeSupported(runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL)
                .then(supported => {
                    console.info('Is_Runninglock_Type_Supported_Promise_JSTest0090 PROXIMITY_SCREEN_CONTROL supported is ' + supported);
                    expect(supported).assertTrue();
                    console.info('Is_Runninglock_Type_Supported_Promise_JSTest0090 success');
                    done();
                })
                .catch(error => {
                    console.log('Is_Runninglock_Type_Supported_Promise_JSTest0090 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0100
         * @tc.name testIs_Runninglock_Type_Supported_Promise_JSTest0100
         * @tc.desc Checks whether the specified RunningLockType is supported (deprecated since 9)
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('Is_Runninglock_Type_Supported_Promise_JSTest0100', 0, async function (done) {
            await runningLock.isRunningLockTypeSupported(runningLock.RunningLockType.BACKGROUND)
                .then(supported => {
                    console.info('Is_Runninglock_Type_Supported_Promise_JSTest0100 BACKGROUND supported is ' + supported);
                    expect(supported).assertTrue();
                    console.info('Is_Runninglock_Type_Supported_Promise_JSTest0100 success');
                    done();
                })
                .catch(error => {
                    console.log('Is_Runninglock_Type_Supported_Promise_JSTest0100 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0110
         * @tc.name testIs_Runninglock_Type_Supported_Callback_JSTest0110
         * @tc.desc Checks whether the specified RunningLockType is supported (deprecated since 9)
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('Is_Runninglock_Type_Supported_Callback_JSTest0110', 0, async function (done) {
            runningLock.isRunningLockTypeSupported(runningLock.RunningLockType.BACKGROUND, (error, supported) => {
                if (typeof error === "undefined") {
                    console.info('Is_Runninglock_Type_Supported_Callback_JSTest0110 supported is ' + supported);
                    expect(supported).assertTrue();
                    console.info('Is_Runninglock_Type_Supported_Callback_JSTest0110 success');
                } else {
                    console.log('Is_Runninglock_Type_Supported_Callback_JSTest0110: ' + error);
                    expect().assertFail();
                }
                done();
            })
        })

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0120
         * @tc.name testIs_Runninglock_Type_Supported_Callback_JSTest0120
         * @tc.desc Checks whether the specified RunningLockType is supported (deprecated since 9)
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('Is_Runninglock_Type_Supported_Callback_JSTest0120', 0, async function (done) {
            runningLock.isRunningLockTypeSupported(3, (error, supported) => {
                if (typeof error === "undefined") {
                    console.info('Is_Runninglock_Type_Supported_Callback_JSTest0120 supported is ' + supported);
                    expect(supported).assertFalse();
                    console.info('Is_Runninglock_Type_Supported_Callback_JSTest0120 success');
                } else {
                    console.log('Is_Runninglock_Type_Supported_Callback_JSTest0120: ' + error);
                    expect().assertFail();
                }
                done();
            })
        })

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0130
         * @tc.name testIs_Supported_JSTest0130
         * @tc.desc Checks whether the specified RunningLockType is supported.
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('Is_Supported_JSTest0130', 0, async function (done) {
            try {
                let background = runningLock.isSupported(runningLock.RunningLockType.BACKGROUND)
                expect(background).assertTrue();
                done();
            } catch (e) {
                console.info('Is_Supported_JSTest0130 code:' + e);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0140
         * @tc.name testIs_Supported_JSTest0140
         * @tc.desc Checks whether the specified RunningLockType is supported.
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('Is_Supported_JSTest0140', 0, async function (done) {
            try {
                let proximityScreenControl = runningLock.isSupported(runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL)
                expect(proximityScreenControl).assertTrue();
                done();
            } catch (e) {
                console.info('Is_Supported_JSTest0140 code:' + e);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0150
         * @tc.name testIs_Supported_JSTest0150
         * @tc.desc Checks whether the specified RunningLockType is supported.
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('Is_Supported_JSTest0150', 0, async function (done) {
            try {
                let other = runningLock.isSupported(0)
                expect(other).assertFalse();
                done();
            } catch (e) {
                console.info('Is_Supported_JSTest0150 code:' + e);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0160
         * @tc.name testIs_Supported_JSTest0160
         * @tc.desc Checks whether the specified RunningLockType is supported.
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('Is_Supported_JSTest0160', 0, async function (done) {
            try {
                let other = runningLock.isSupported(3)
                expect(other).assertFalse();
                done();
            } catch (e) {
                console.info('Is_Supported_JSTest0160 code:' + e);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0170
         * @tc.name testCreate_Running_Lock_Promise_JSTest0170
         * @tc.desc Create running lock promise (deprecated since 9)
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('Create_Running_Lock_Promise_JSTest0170', 0, async function (done) {
            await runningLock.createRunningLock("Create_Running_Lock_Promise_JSTest0170", runningLock.RunningLockType.BACKGROUND)
                .then(runninglock => {
                    expect(runninglock !== null).assertTrue();
                    console.info('Create_Running_Lock_Promise_JSTest0170 success');
                    done();
                })
                .catch(error => {
                    console.log('Create_Running_Lock_Promise_JSTest0170 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0180
         * @tc.name testCreate_Running_Lock_CallBack_JSTest0180
         * @tc.desc Create running lock callback (deprecated since 9)
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('Create_Running_Lock_CallBack_JSTest0180', 0, async function (done) {
            runningLock.createRunningLock("Create_Running_Lock_CallBack_JSTest0180", runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL,
                (error, runninglock) => {
                    if (typeof error === "undefined") {
                        console.info('Create_Running_Lock_CallBack_JSTest0180: runningLock is ' + runninglock);
                        expect(runninglock !== null).assertTrue();
                        let used = runninglock.isUsed();
                        console.info('Create_Running_Lock_CallBack_JSTest0180 is used: ' + used);
                        expect(used).assertFalse();
                        runninglock.lock(500);
                        used = runninglock.isUsed();
                        console.info('after lock Create_Running_Lock_CallBack_JSTest0180 is used: ' + used);
                        expect(used).assertTrue();
                        console.info('Create_Running_Lock_CallBack_JSTest0180 success');
                    } else {
                        console.log('Create_Running_Lock_CallBack_JSTest0180: ' + error);
                        expect().assertFail();
                    }
                    done();
                })
        })

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0190
         * @tc.name testCreate_Running_Lock_Promise_JSTest0190
         * @tc.desc Create lock promise
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('Create_Running_Lock_Promise_JSTest0190', 0, async function (done) {
            try {
                let isExec = false;
                await runningLock.create("Create_Running_Lock_Promise_JSTest0190", runningLock.RunningLockType.BACKGROUND)
                    .then((runninglock) => {
                        isExec = true;
                        expect(runninglock !== null).assertTrue();
                        console.info('Create_Running_Lock_Promise_JSTest0190 success');
                        done();
                    })
                    .catch((error) => {
                        isExec = true;
                        console.info('Create_Running_Lock_Promise_JSTest0190 error:' + (typeof error));
                        expect(typeof error !== "undefined").assertTrue();
                        console.info('Create_Running_Lock_Promise_JSTest0190 error code:' + error.code + " msg: " + error.message);
                        done();
                    })
                    .finally(() => {
                        expect(isExec).assertTrue();
                        done();
                    })
            } catch (e) {
                console.info('Create_Running_Lock_Promise_JSTest0190 error:' + e);
                expect().assertFail();
                done();
            }
            
        })

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0200
         * @tc.name testCreate_Running_Lock_Promise_JSTest0200
         * @tc.desc Create lock promise
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('Create_Running_Lock_Promise_JSTest0200', 0, async function (done) {
            try {
                let isExec = false;
                await runningLock.create("Create_Running_Lock_Promise_JSTest0200", runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL)
                    .then((runninglock) => {
                        isExec = true;
                        expect(runninglock !== null).assertTrue();
                        console.info('Create_Running_Lock_Promise_JSTest0200 success');
                        done();
                    })
                    .catch((error) => {
                        isExec = true;
                        console.info('Create_Running_Lock_Promise_JSTest0200 error:' + (typeof error));
                        expect(typeof error !== "undefined").assertTrue();
                        console.info('Create_Running_Lock_Promise_JSTest0200 error code:' + error.code + " msg: " + error.message);
                        done();
                    })
                    .finally(() => {
                        expect(isExec).assertTrue();
                        done();
                    })
            } catch (e) {
                console.info('Create_Running_Lock_Promise_JSTest0200 error:' + e);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0210
         * @tc.name testCreate_Running_Lock_Promise_Invalid_JSTest0210
         * @tc.desc Create lock input invalid value
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('Create_Running_Lock_Promise_Invalid_JSTest0210', 0, async function (done) {
            try {
                runningLock.create(0, runningLock.RunningLockType.BACKGROUND)
                    .then((runninglock) => {
                        expect().assertFail();
                        done();
                    })
            } catch (e) {
                console.info('Create_Running_Lock_Promise_Invalid_JSTest0210 code: ' + e.code + "msg: " + e.message);
                // 401: Invalid input parameter
                expect(e.code === 401).assertTrue();
                done();
            }
        })

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0220
         * @tc.name testCreate_Running_Lock_Promise_Invalid_JSTest0220
         * @tc.desc Create lock input invalid value
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('Create_Running_Lock_Promise_Invalid_JSTest0220', 0, async function (done) {
            try {
                runningLock.create("Create_Running_Lock_Promise_Invalid_JSTest0220", 0)
                    .then((runninglock) => {
                        expect(runninglock === null).assertTrue();
                        done();
                    })
                    .catch((error) => {
                        console.info('Create_Running_Lock_Promise_Invalid_JSTest0220 error:' + (typeof error));
                        expect(typeof error !== "undefined").assertTrue();
                        console.info('Create_Running_Lock_Promise_Invalid_JSTest0220 error code:' + error.code + " msg: " + error.message);
                        done();
                    })
            } catch (e) {
                console.info('Create_Running_Lock_Promise_Invalid_JSTest0220 code:' + e.code + "msg:" + e.message);
                // 401: Invalid input parameter
                expect(e.code === 401).assertTrue();
                done();
            }
        })

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0230
         * @tc.name testCreate_Running_Lock_Promise_Invalid_JSTest0230
         * @tc.desc Create lock input invalid value
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('Create_Running_Lock_Promise_Invalid_JSTest0230', 0, async function (done) {
            try {
                runningLock.create("Create_Running_Lock_Promise_Invalid_JSTest0230", 5)
                    .then((runninglock) => {
                        expect(runninglock === null).assertTrue();
                        done();
                    })
                    .catch((error) => {
                        console.info('Create_Running_Lock_Promise_Invalid_JSTest0230 error: ' + (typeof error));
                        expect(typeof error !== "undefined").assertTrue();
                        console.info('Create_Running_Lock_Promise_Invalid_JSTest0230 error code: ' + error.code + " msg: " + error.message);
                        done();
                    })
            } catch (e) {
                console.info('Create_Running_Lock_Promise_Invalid_JSTest0230 code: ' + e.code + "msg: " + e.message);
                // 401: Invalid input parameter
                expect(e.code === 401).assertTrue();
                done();
            }
        })

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0240
         * @tc.name testCreate_Running_Lock_Callback_JSTest0240
         * @tc.desc Create lock callback
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('Create_Running_Lock_Callback_JSTest0240', 0, async function (done) {
            try {
                runningLock.create("Create_Running_Lock_Callback_JSTest0240", runningLock.RunningLockType.BACKGROUND,
                    (error, runninglock) => {
                        expect(typeof error === "undefined").assertTrue();
                        expect(runninglock !== null).assertTrue();
                        console.info('Create_Running_Lock_Callback_JSTest0240 success');
                        done();
                    });
            } catch (e) {
                console.info('Create_Running_Lock_Callback_JSTest0240 error:' + e);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0250
         * @tc.name testCreate_Running_Lock_Callback_JSTest0250
         * @tc.desc Create lock callback
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('Create_Running_Lock_Callback_JSTest0250', 0, async function (done) {
            try {
                runningLock.create("Create_Running_Lock_Callback_JSTest0250", runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL,
                    (error, runninglock) => {
                        expect(typeof error === "undefined").assertTrue();
                        expect(runninglock !== null).assertTrue();
                        console.info('Create_Running_Lock_Callback_JSTest0250 success');
                        done();
                    });
            } catch (e) {
                console.info('Create_Running_Lock_Callback_JSTest0250 error:' + e);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0260
         * @tc.name testCreate_Running_Lock_Callback_Invalid_JSTest0260
         * @tc.desc Create lock input invalid value
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('Create_Running_Lock_Callback_Invalid_JSTest0260', 0, async function (done) {
            try {
                runningLock.create("Create_Running_Lock_Callback_Invalid_JSTest0260", "invalid",
                    (error, runninglock) => {
                        expect(typeof error !== "undefined").assertTrue();
                        expect(runninglock === null).assertTrue();
                        console.info('Create_Running_Lock_Callback_Invalid_JSTest0260 success');
                        expect().assertFail();
                        done();
                    });
            } catch (e) {
                console.info('Create_Running_Lock_Callback_Invalid_JSTest0260 code:' + e.code + "msg:" + e.message);
                // 401: Invalid input parameter
                expect(e.code === 401).assertTrue();
                done();
            }
        })

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0270
         * @tc.name testCreate_Running_Lock_Callback_Invalid_JSTest0270
         * @tc.desc Create lock input invalid value
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('Create_Running_Lock_Callback_Invalid_JSTest0270', 0, async function (done) {
            try {
                runningLock.create("Create_Running_Lock_Callback_Invalid_JSTest0270", -1,
                    (error, runninglock) => {
                        console.info('Create_Running_Lock_Callback_Invalid_JSTest0270 error code:' + error.code + " msg: " + error.message);
                        expect(typeof error !== "undefined").assertTrue();
                        expect(runninglock === null).assertTrue();
                    });
                done();
            } catch (e) {
                console.info('Create_Running_Lock_Callback_Invalid_JSTest0270 code:' + e.code + "msg:" + e.message);
                // 401: Invalid input parameter
                expect(e.code === 401).assertTrue();
                done();
            }
        })

        /**
         * @tc.number SUB_PowerSystem_RunningLock_JSTest_0280
         * @tc.name testCreate_Running_Lock_Callback_Invalid_JSTest0280
         * @tc.desc Create lock input invalid value
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('Create_Running_Lock_Callback_Invalid_JSTest0280', 0, async function (done) {
            try {
                runningLock.create("Create_Running_Lock_Callback_Invalid_JSTest0280", 3,
                    (error, runninglock) => {
                        console.info('Create_Running_Lock_Callback_Invalid_JSTest0280 error code:' + error.code + " msg: " + error.message);
                        expect(typeof error !== "undefined").assertTrue();
                        expect(runninglock === null).assertTrue();
                    });
                done();
            } catch (e) {
                console.info('Create_Running_Lock_Callback_Invalid_JSTest0280 code:' + e.code + "msg:" + e.message);
                // 401: Invalid input parameter
                expect(e.code === 401).assertTrue();
                done();
            }
        })
    })
}
