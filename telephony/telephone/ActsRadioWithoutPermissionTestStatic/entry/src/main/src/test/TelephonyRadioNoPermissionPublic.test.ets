/**
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import radio from '@ohos.telephony.radio';
import sim from '@ohos.telephony.sim';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../hypium/index'
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

let domain: int = 0x0000;
let tag: string = 'EsimPublic1';

const SLOT_0: int = 0;
const SLOT_1: int = 1;

let isSim0Active: boolean = false;
let isSim1Active: boolean = false;
let hasCard0: boolean = false;
let hasCard1: boolean = false;

export default function telephonyRadioNoPermissionPublicTest() {
    const ExpectFail = () => {
        try {
            expect().assertFail();
        } catch (err) {
            hilog.info(domain, tag, '%{public}s', 'test failed');
        }
    }

    const ExpectTrue = (n: boolean) => {
        try {
            expect(n).assertTrue();
        } catch (err) {
            hilog.info(domain, tag, '%{public}s', 'test failed');
        }
    }

describe('telephonyRadioNoPermissionPublicTest',  () => {

    beforeAll(async (done: () => void): Promise<void> => {
        try {
            hasCard0 = sim.hasSimCardSync(SLOT_0);
            hasCard1 = sim.hasSimCardSync(SLOT_1);
            isSim0Active = sim.isSimActiveSync(SLOT_0);
            isSim1Active = sim.isSimActiveSync(SLOT_1);
            if (hasCard0) {
                hilog.info(domain, tag, `RTS--hasSimCard 0`);
            }
            if (hasCard1) {
                hilog.info(domain, tag, `RTS--hasSimCard 1`);
            }
            if (isSim0Active) {
                hilog.info(domain, tag, `RTS--isSimActiveSync 0`);
            }
            if (isSim1Active) {
                hilog.info(domain, tag, `RTS--isSimActiveSync 1`);
            }
            done();
        } catch (err) {
            hilog.info(domain, tag, `an error occurred to check SIM card activation status, ${JSON.stringify(err)}`);
            done();
        }
    });

    /**
     * @tc.number SUB_Telephony_Radio_GetRadioTech_0150
     * @tc.name   testTelephonyRadioGetRadioTech_static_0150
     * @tc.desc   Obtain the wireless access technologies for the CS and PS domains currently accessed. Using callback for asynchronous callback
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('testTelephonyRadioGetRadioTech_static_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioGetRadioTech_static_0150';
        hilog.info(domain, tag, `${caseName} test start`);
        let simState: sim.SimState = sim.getSimStateSync(0);
        if (simState === sim.SimState.SIM_STATE_UNKNOWN) {
            hilog.info(domain, tag,`${caseName} failed, SIM STATE IS UNKNOWN`);
            hilog.info(domain, tag,`${caseName} test end`);
            done();
        } else {
            if (!isSim0Active) {
                expect().assertFail();
                hilog.info(domain, tag,`${caseName} test end`);
                done();
            }
            else {
                radio.getRadioTech(SLOT_0, (err: BusinessError<void> | null, data:radio.NetworkRadioTech| undefined) => {
                    if (err?.code !== 0) {
                        hilog.info(domain, tag, `${caseName} callback: err->${JSON.stringify(err)}`);
                        ExpectTrue(err?.code === 201);
                        hilog.info(domain, tag,`${caseName} test end`);
                        done();
                    } else {
                        hilog.info(domain, tag,`${caseName} callback: data->${JSON.stringify(data)}`);
                        expect().assertFail();
                        hilog.info(domain, tag,`${caseName} test end`);
                        done();
                    }
                });
            }
        }
    });

    /**
     * @tc.number SUB_Telephony_Radio_GetRadioTech_0250
     * @tc.name   testTelephonyRadioGetRadioTech_static_0250
     * @tc.desc   Obtain the wireless access technologies for the CS and PS domains currently accessed. Use Promise asynchronous callback.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('testTelephonyRadioGetRadioTech_static_0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioGetRadioTech_static_0250';
        hilog.info(domain, tag, `${caseName} test start`);
        let simState: sim.SimState = sim.getSimStateSync(0);
        if (simState === sim.SimState.SIM_STATE_UNKNOWN) {
            hilog.info(domain, tag, `${caseName} failed, SIM STATE IS UNKNOWN`);
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        } else {
            if (!isSim0Active) {
                expect().assertFail();
                hilog.info(domain, tag,`${caseName} test end`);
                done();
            }
            else {
                try {
                    let data = await radio.getRadioTech(SLOT_0);
                    hilog.info(domain, tag, `${caseName} Promise: data->${JSON.stringify(data)}`);
                    expect().assertFail();
                    hilog.info(domain, tag,`${caseName} test end`);
                    done();
                } catch (error) {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, `${caseName} Promise: err->${err}`);
                    ExpectTrue(err?.code === 201);
                    hilog.info(domain, tag, `${caseName} test end`);
                    done();
                }
            }
        }
    });

    /**
    * @tc.number SUB_Telephony_Radio_GetRadioTechSync_0150
    * @tc.name   testTelephonyRadioGetRadioTechSync_static_0150
    * @tc.desc   Obtain the wireless access technologies for the CS and PS domains currently accessed. Use Promise asynchronous callback.
    * @tc.size   MediumTest
    * @tc.type   Function
    * @tc.level  Level 3
    */
    it('testTelephonyRadioGetRadioTechSync_static_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioGetRadioTechSync_static_0150';
        hilog.info(domain, tag, `${caseName} test start`);
        let simState: sim.SimState = sim.getSimStateSync(0);
        if (simState === sim.SimState.SIM_STATE_UNKNOWN) {
            hilog.info(domain, tag, `${caseName} failed, SIM STATE IS UNKNOWN`);
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        } else {
            if (!isSim0Active) {
                expect().assertFail();
                hilog.info(domain, tag,`${caseName} test end`);
                done();
            }
            else {
                try {
                    let data = radio.getRadioTechSync(SLOT_0);
                    hilog.info(domain, tag, `${caseName} Promise: data->${JSON.stringify(data)}`);
                    expect().assertFail();
                    hilog.info(domain, tag,`${caseName} test end`);
                    done();
                } catch (error) {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, `${caseName} Promise: err->${err}`);
                    ExpectTrue(err?.code === 201);
                    hilog.info(domain, tag, `${caseName} test end`);
                    done();
                }
            }
        }
    });

    /**
     * @tc.number SUB_Telephony_Radio_IsRadioOn_0150
     * @tc.name   testTelephonyRadioIsRadioOn_static_0150
     * @tc.desc   Check if the main card's Radio is turned on. Use callback for asynchronous callback.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('testTelephonyRadioIsRadioOn_static_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioIsRadioOn_static_0150';
        hilog.info(domain, tag, `${caseName} test start`);
        let simState: sim.SimState = sim.getSimStateSync(0);
        if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
            hilog.info(domain, tag, `${caseName} failed, SIM STATE IS UNKNOWN`);
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        } else {
            if (!isSim0Active) {
                expect().assertFail();
                console.info(`${caseName} test end`);
                done();
            }
            else {
                radio.isRadioOn(SLOT_0, (err: BusinessError<void> | null, data: boolean | undefined) => {
                    if (err?.code !== 0) {
                        hilog.info(domain, tag, `${caseName} failed, callback: err->${JSON.stringify(err)}`);
                        ExpectTrue(err?.code === 201);
                        hilog.info(domain, tag, `${caseName} test end`);
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} success, callback: data->${JSON.stringify(data)}`);
                        expect().assertFail();
                        hilog.info(domain, tag, `${caseName} test end`);
                        done();
                    }
                });
            }
        }
    });

    /**
     * @tc.number SUB_Telephony_Radio_IsRadioOn_0250
     * @tc.name   testTelephonyRadioIsRadioOn_static_0250
     * @tc.desc   Check if the Radio is turned on. Use Promise asynchronous callback.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('testTelephonyRadioIsRadioOn_static_0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioIsRadioOn_static_0250';
        hilog.info(domain, tag, `${caseName} test start`);
        let simState: sim.SimState = sim.getSimStateSync(0);
        if (simState === sim.SimState.SIM_STATE_UNKNOWN) {
            hilog.info(domain, tag, `${caseName} failed, SIM STATE IS UNKNOWN`);
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        } else {
            if (!isSim0Active) {
                expect().assertFail();
                hilog.info(domain, tag, `${caseName} test end`);
                done();
            }
            else {
                radio.isRadioOn(SLOT_0).then((data: boolean) => {
                    hilog.info(domain, tag, `${caseName} success, promise: data->${JSON.stringify(data)}`);
                    expect().assertFail();
                    hilog.info(domain, tag, `${caseName} test end`);
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, `${caseName} failed, promise: err->${JSON.stringify(err)}`);
                    ExpectTrue(err?.code === 201);
                    hilog.info(domain, tag, `${caseName} test end`);
                    done();
                });
            }
        }
    });

    /**
    * @tc.number SUB_Telephony_Radio_IsRadioOn_0350
    * @tc.name   testTelephonyRadioIsRadioOn_static_0350
    * @tc.desc   Check if the main card's Radio is turned on. Use callback for asynchronous callback.
    * @tc.size   MediumTest
    * @tc.type   Function
    * @tc.level  Level 1
    */
    it('testTelephonyRadioIsRadioOn_static_0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyRadioIsRadioOn_static_0350';
        hilog.info(domain, tag, `${caseName} test start`);
        let simState: sim.SimState = sim.getSimStateSync(0);
        if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
            hilog.info(domain, tag, `${caseName} failed, SIM STATE IS UNKNOWN`);
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        } else {
            if (!isSim0Active) {
                expect().assertFail();
                console.info(`${caseName} test end`);
                done();
            }
            else {
                radio.isRadioOn((err: BusinessError<void> | null, data: boolean | undefined) => {
                    if (err?.code !== 0) {
                        hilog.info(domain, tag, `${caseName} failed, callback: err->${JSON.stringify(err)}`);
                        ExpectTrue(err?.code === 201);
                        hilog.info(domain, tag, `${caseName} test end`);
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} success, callback: data->${JSON.stringify(data)}`);
                        expect().assertFail();
                        hilog.info(domain, tag, `${caseName} test end`);
                        done();
                    }
                });
            }
        }
    });
});
}