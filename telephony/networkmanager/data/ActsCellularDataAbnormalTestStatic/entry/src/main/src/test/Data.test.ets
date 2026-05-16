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
          * @tc.number  SUB_Telephony_Data_IsCellularDataEnabledSync_0200
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
                    if (err?.code !== 0) {
                        ExpectTrue(err?.code === 8300001);
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
          * @tc.number  SUB_Telephony_CellularData_IsCellularDataRoamingEnabled_Async_0300
          * @tc.name    testTelephonyCellularDataIsCellularDataRoamingEnabledAsync_static_0300
          * @tc.desc    Check whether roaming is enabled for cellular data services.
          * @tc.size    MediumTest
          * @tc.type    Function
          * @tc.level   level 3
         */
        it('testTelephonyCellularDataIsCellularDataRoamingEnabledAsync_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyCellularDataIsCellularDataRoamingEnabledAsync_static_0300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.isCellularDataRoamingEnabled(0, (err: BusinessError<void>|null, enabled: boolean|undefined) => {
                    if (err?.code !== 0) {
                        ExpectFail();
                    } else {
                        ExpectTrue(enabled === false);
                    }
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            } catch(err) {
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })
		
		/**
         * @tc.number  SUB_Telephony_CellularData_IsCellularDataRoamingEnabled_Promise_0200
         * @tc.name    testTelephonyCellularDataIsCellularDataRoamingEnabledPromise_static_0200
         * @tc.desc    Check whether roaming is enabled for cellular data services.
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   level 3
         */
        it('testTelephonyCellularDataIsCellularDataRoamingEnabledPromise_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyCellularDataIsCellularDataRoamingEnabledPromise_static_0200';
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
                    ExpectTrue(err.code === 8300001);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            } catch(err) {
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.number  SUB_Telephony_CellularData_IsCellularDataRoamingEnabled_Promise_0300
         * @tc.name    testTelephonyCellularDataIsCellularDataRoamingEnabledPromise_static_0300
         * @tc.desc    Check whether roaming is enabled for cellular data services.
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   level 3
         */
        it('testTelephonyCellularDataIsCellularDataRoamingEnabledPromise_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyCellularDataIsCellularDataRoamingEnabledPromise_static_0300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.isCellularDataRoamingEnabled(0).then((data: boolean) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': data ->'+data);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    ExpectTrue(data === false);
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    ExpectFail();
                    done();
                });
            } catch(err) {
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.number  SUB_Telephony_CellularData_GetDefaultCellularDataSlotId_Callback_0100
         * @tc.name    testTelephonyCellularDataGetDefaultCellularDataSlotIdCallback_static_0100
         * @tc.desc    Get the default cellular data card by callback.
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   level 3
         */
        it('testTelephonyCellularDataGetDefaultCellularDataSlotIdCallback_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyCellularDataGetDefaultCellularDataSlotIdCallback_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.getDefaultCellularDataSlotId((err: BusinessError<void>|null, data: int|undefined) => {
                    if (err?.code !== 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +': data ->'+data);
                        ExpectTrue(data === 0 || data === 1);
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    }
                });
            } catch(err) {
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err));
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                ExpectFail();
                done();
            }
        })

        /**
         * @tc.number  SUB_Telephony_CellularData_GetCellularDataFlowType_0100
         * @tc.name    testTelephonyCellularDataGetCellularDataFlowType_static_0100
         * @tc.desc    Get the cellular data flow type by promise.
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   level 3
         */
         it('testTelephonyCellularDataGetCellularDataFlowType_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyCellularDataGetCellularDataFlowType_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.getCellularDataFlowType().then((flowType: data.DataFlowType) => {
                    hilog.info(domain, tag, '%{public}s', caseName + ': flowType ->' + flowType);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    ExpectTrue(flowType !== undefined);
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    ExpectFail();
                    done();
                });
            } catch(err) {
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err));
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                ExpectFail();
                done();
            }
        })

        /**
         * @tc.number  SUB_Telephony_CellularData_GetCellularDataFlowType_0200
         * @tc.name    testTelephonyCellularDataGetCellularDataFlowType_static_0200
         * @tc.desc    Get the cellular data flow type by callback.
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   level 3
         */
        it('testTelephonyCellularDataGetCellularDataFlowType_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyCellularDataGetCellularDataFlowType_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.getCellularDataFlowType((err: BusinessError<void>|null, flowType: data.DataFlowType|undefined) => {
                    if (err?.code !== 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName + ': flowType ->' + flowType);
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        ExpectTrue(flowType !== undefined);
                        done();
                    }
                });
            } catch(err) {
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err));
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                ExpectFail();
                done();
            }
        })

        /**
          * @tc.number  SUB_Telephony_Data_IsCellularDataRoamingEnabledSync_0100
          * @tc.name    testTelephonyDataIsCellularDataRoamingEnabledSync_static_0100
          * @tc.desc    isCellularDataRoamingEnabledSync.
          * @tc.size    MediumTest
          * @tc.type    Function
          * @tc.level   level 3
         */
        it('testTelephonyDataIsCellularDataRoamingEnabledSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataIsCellularDataRoamingEnabledSync_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let isEnabled: boolean = data.isCellularDataRoamingEnabledSync(0);
                hilog.info(domain, tag, '%{public}s', caseName+ ' isEnabled: '+ isEnabled);
                ExpectTrue(isEnabled === false);
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            } catch(err) {
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
          * @tc.number  SUB_Telephony_Data_IsCellularDataRoamingEnabledSync_0200
          * @tc.name    testTelephonyDataIsCellularDataRoamingEnabledSync_static_0200
          * @tc.desc    isCellularDataRoamingEnabledSync.
          * @tc.size    MediumTest
          * @tc.type    Function
          * @tc.level   level 3
         */
        it('testTelephonyDataIsCellularDataRoamingEnabledSync_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataIsCellularDataRoamingEnabledSync_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let isEnabled: boolean = data.isCellularDataRoamingEnabledSync(ERR_SLOT_ID);
                hilog.info(domain, tag, '%{public}s', caseName+ ' isEnabled: '+ isEnabled);
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                ExpectFail();
                done();
            } catch(err) {
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err));
                ExpectTrue(err.code === 8300001);
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
          * @tc.number  SUB_Telephony_Data_GetDefaultCellularDataSimId_0100
          * @tc.name    testTelephonyDataGetDefaultCellularDataSimId_static_0100
          * @tc.desc    getDefaultCellularDataSimId.
          * @tc.size    MediumTest
          * @tc.type    Function
          * @tc.level   level 3
         */
        it('testTelephonyDataGetDefaultCellularDataSimId_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataGetDefaultCellularDataSimId_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let simId: int = data.getDefaultCellularDataSimId();
                hilog.info(domain, tag, '%{public}s', caseName+ ' simId: '+ simId);
                ExpectTrue(simId !== undefined);
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            } catch(err) {
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.number  SUB_Telephony_CellularData_GetActiveApnName_0100
         * @tc.name    testTelephonyCellularDataGetActiveApnName_static_0100
         * @tc.desc    getActiveApnName by promise.
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   level 3
         */
        it('testTelephonyCellularDataGetActiveApnName_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyCellularDataGetActiveApnName_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.getActiveApnName().then((apn: string) => {
                    hilog.info(domain, tag, '%{public}s', caseName + ': apn ->' + apn);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    ExpectTrue(apn !== undefined);
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    ExpectFail();
                    done();
                });
            } catch(err) {
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err));
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                ExpectFail();
                done();
            }
        })

    })
}