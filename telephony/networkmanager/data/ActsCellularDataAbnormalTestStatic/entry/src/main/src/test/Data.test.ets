/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import data from '@ohos.telephony.data';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'DataTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail = () => {
    try {
        expect().assertFail();
    } catch (err) {
        console.info("expectInfo", `test failed`);
    }
}
const ExpectTrue = (n: boolean) => {
    try {
        expect(n).assertTrue();
    } catch (err) {
        console.info("expectInfo", `test sucess`);
    }
}

const apnInfoParameter: data.ApnInfo = {
    apnName: 'apnName',
    apn: 'apn',
    mcc: 'mcc',
    mnc: 'mnc',
    user: 'user',
    type: 'type',
    proxy: 'proxy',
    mmsproxy: 'mmsproxy'
}

export default function dataTest() {

    describe("DataTest", (): void => {
        const ERR_SLOT_ID = 3;
        hilog.info(domain, tag, '%{public}s', 'describe start');

        /**
          * @tc.number  SUB_Telephony_Data_IsCellularDataRoamingEnabledSync_0200
          * @tc.name    testTelephonyDataIsCellularDataEnabledSync_static_0200
          * @tc.desc    Check whether cellular data services are enabled.
          * @tc.size    MediumTest
          * @tc.type    Function
          * @tc.level   level 3
         */
        it('testTelephonyDataIsCellularDataEnabledSync_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataIsCellularDataEnabledSync_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let isEnabled: boolean = data.isCellularDataEnabledSync();
                hilog.info(domain, tag, '%{public}s', caseName+ ' isEnabled: '+ isEnabled);
                ExpectTrue(isEnabled == true);
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })
		
		/**
         * @tc.number  SUB_Telephony_CellularData_getDefaultCellularDataSlotId_Promise_0500
         * @tc.name    testTelephonyCellularDataGetDefaultCellularDataSlotIdPromise_static_0500
         * @tc.desc    Get the default cellular data card.
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   level 3
         */
        it('testTelephonyCellularDataGetDefaultCellularDataSlotIdPromise_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyCellularDataGetDefaultCellularDataSlotIdPromise_static_0500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.getDefaultCellularDataSlotId().then((data: int) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': data ->'+data);
                    ExpectTrue(data == 0 || data == 1);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })
		
		/**
          * @tc.number  SUB_Telephony_CellularData_getDefaultCellularDataSlotIdSync_0100
          * @tc.name    testTelephonyCellularDataGetDefaultCellularDataSlotIdSync_static_0100
          * @tc.desc    Get the default cellular data card.
          * @tc.size    MediumTest
          * @tc.type    Function
          * @tc.level   level 3
         */
        it('testTelephonyCellularDataGetDefaultCellularDataSlotIdSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyCellularDataGetDefaultCellularDataSlotIdSync_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let slotId: int = data.getDefaultCellularDataSlotIdSync();
                ExpectTrue(slotId == 0 || slotId == 1);
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })
		
		/**
          * @tc.number  SUB_Telephony_CellularData_isCellularDataRoamingEnabled_Async_0200
          * @tc.name    testTelephonyCellularDataisCellularDataRoamingEnabledAsync_static_0200
          * @tc.desc    Check whether roaming is enabled for cellular data services.
          * @tc.size    MediumTest
          * @tc.type    Function
          * @tc.level   level 3
         */
        it('testTelephonyCellularDataisCellularDataRoamingEnabledAsync_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyCellularDataisCellularDataRoamingEnabledAsync_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.isCellularDataRoamingEnabled(ERR_SLOT_ID, (err: BusinessError<void>|null, enabled: boolean|undefined) => {
                    if (err?.code != 0) {
                        ExpectTrue(true);
                    } else {
                        ExpectFail();
                    }
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })
		
		/**
         * @tc.number  SUB_Telephony_CellularData_isCellularDataRoamingEnabled_Promise_0200
         * @tc.name    testTelephonyCellularDataisCellularDataRoamingEnabledPromise_static_0200
         * @tc.desc    Check whether roaming is enabled for cellular data services.
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   level 3
         */
        it('testTelephonyCellularDataisCellularDataRoamingEnabledPromise_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyCellularDataisCellularDataRoamingEnabledPromise_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.isCellularDataRoamingEnabled(ERR_SLOT_ID).then((data: boolean) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': data ->'+data);
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(true);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })
    })
}