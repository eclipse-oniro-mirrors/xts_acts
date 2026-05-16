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

import sim from '@ohos.telephony.sim';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../hypium/index';
import { BusinessError } from '@ohos.base';

const ExpectFail = () => {
    try {
        expect().assertFail();
    } catch (err) {
        console.info('expectInfo', 'test failed');
    }
}
const ExpectTrue = (n: boolean) => {
    try {
        expect(n).assertTrue();
    } catch (err) {
        console.info('expectInfo', 'test failed');
    }
}

export default function SimGetActiveSimAccountInfoList() {
    describe('SimGetActiveSimAccountInfoList',  () => {

        let TRUE_SLOT_ID_0: int = 0;
        let simAmount: int = 0;
        beforeAll(async() => {
            let result0: boolean = true;
            try {
                result0 = await sim.isSimActive(0);
            } catch (err) {
                console.info('isSimActive simCard0 Run failed');
            }
            if (result0 == true) {
                TRUE_SLOT_ID_0 = 0;
                simAmount = 1;
            }
           
            console.info(`beforeAll, slotId: ${TRUE_SLOT_ID_0}, simAmount: ${simAmount}`);
        });
        /**
         * @tc.number SUB_Telephony_DualSim_GetActiveSimAccountInfoList_Async_0500
         * @tc.name   testTelephonyDualSimGetActiveSimAccountInfoListAsync0500
         * @tc.desc   Test getActiveSimAccountInfoList(Async) no permission
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('testTelephonyDualSimGetActiveSimAccountInfoListAsync0500',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            const caseName: string = 'testTelephonyDualSimGetActiveSimAccountInfoListAsync0500';
            console.info(`${caseName} test start`);
            const recursive = async (n: int) => {
                if (n <= 0) {
                    console.info(`${caseName} test finish`);
                    done();
                    return;
                }
            }
            sim.getActiveSimAccountInfoList((err: BusinessError | null,
                data: Array<sim.IccAccountInfo> | undefined) => {
                if (data) {
                    console.info(`${caseName} getActiveSimAccountInfoList nopermission test success, data: ${JSON.stringify(data)}`);
                    ExpectTrue((data as Array<sim.IccAccountInfo>).some(item => item?.iccId === ""));
                    done();
                    
                } else {
                    console.info(`${caseName} getActiveSimAccountInfoList nopermission test fail, err: ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                    return;
                }
            });
            recursive(simAmount);
        });

        /**
         * @tc.number SUB_Telephony_DualSim_GetActiveSimAccountInfoList_Promise_0500
         * @tc.name   testTelephonyDualSimGetActiveSimAccountInfoListPromise0500
         * @tc.desc   Test getActiveSimAccountInfoList(Promise) no permission
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level 2
         */
        it('testTelephonyDualSimGetActiveSimAccountInfoListPromise0500',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDualSimGetActiveSimAccountInfoListPromise0500';
            console.info(`${caseName} test start`);
            const recursive = async (n: int) => {
                if (n <= 0) {
                    console.info(`${caseName} test finish`);
                    done();
                    return;
                }
            }
            sim.getActiveSimAccountInfoList().then((data: Array<sim.IccAccountInfo> | undefined) => {
                console.info(`${caseName}  000000, data: ${JSON.stringify(data)}`);
                ExpectTrue((data as Array<sim.IccAccountInfo>).some(item => item?.iccId === ""));
                done();
            }).catch((err: Error) => {
                console.info(`${caseName} getActiveSimAccountInfoList nopermission test fail, err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
                return;
            });
            recursive(simAmount);
        });
    });
}