/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
    } catch (err: BusinessError) {
        console.info("expectInfo", `test failed`);
    }
}
const ExpectTrue = (n: boolean) => {
    try {
        expect(n).assertTrue();
    } catch (err: BusinessError) {
        console.info("expectInfo", `test sucess`);
    }
}
export default function dataManagerTest() {

    describe("dataManagerTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');


        /**
         * @tc.name   testTelephonyDataGetDefaultCellularDataSlotIdSync_static_0200
         * @tc.number SUB_Telephony_Data_GetDefaultCellularDataSlotIdSync_0200
         * @tc.desc   Get the SIM card for default mobile data.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testTelephonyDataGetDefaultCellularDataSlotIdSync_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataGetDefaultCellularDataSlotIdSync_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                let cardSlot: number = data.getDefaultCellularDataSlotIdSync();
                hilog.info(domain, tag, '%{public}s', caseName +': cardSlot->'+JSON.stringify(cardSlot));
                ExpectTrue(cardSlot == 0 || cardSlot ==1 );
                done();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }
        });

        /**
         * @tc.name   testTelephonyDataGetCellularDataState_static_0200
         * @tc.number SUB_Telephony_Data_GetCellularDataState_0200
         * @tc.desc   Get the connection status of a packet switched domain (PS domain).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testTelephonyDataGetCellularDataState_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataGetCellularDataState_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                data.isCellularDataEnabled().then((isEnable: boolean )=>{
                    data.getCellularDataState((err: BusinessError<void>|null , data: data.DataConnectState| undefined) => {
                        if (err?.code != 0) {
                           
                            ExpectFail();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done();
                        } else {
                            ExpectTrue(true);
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done();
                        }
                    });
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            } catch (error: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }
        });

        /**
         * @tc.name   testTelephonyDataGetCellularDataState_static_0600
         * @tc.number SUB_Telephony_Data_GetCellularDataState_0600
         * @tc.desc   Get the connection status of a packet switched domain (PS domain).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testTelephonyDataGetCellularDataState_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataGetCellularDataState_static_0600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                let isEnable: boolean = await data.isCellularDataEnabled();
                if (isEnable) {
                    data.getCellularDataState().then((data: data.DataConnectState) => {
                        console.info(`${caseName} data->${JSON.stringify(data)}`);
                        ExpectTrue(true);
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    }).catch((error: Error) => {
                        let err = error as BusinessError;
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    });
                } else {
                    hilog.info(domain, tag, '%{public}s', caseName +' no sim card ');
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }
            } catch (error: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }
        });

        /**
         * @tc.name   testTelephonyDataIsCellularDataEnabled0100
         * @tc.number SUB_Telephony_Data_IsCellularDataEnabled_0100
         * @tc.desc   Check whether the cellular data service is enabled.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testTelephonyDataIsCellularDataEnabled0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataIsCellularDataEnabled0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                data.isCellularDataEnabled((err: BusinessError<void>|null, data: boolean| undefined) => {
                    if (err?.code != 0) {
                        ExpectFail();
                        done();
                    } else {
                        ExpectTrue(data !== undefined);
                        done();
                    }
                });
            } catch (err: BusinessError) {
                console.info(`${caseName} err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testTelephonyDataIsCellularDataEnabled_static_0300
         * @tc.number SUB_Telephony_Data_IsCellularDataEnabled_0300
         * @tc.desc   Check whether the cellular data service is enabled.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testTelephonyDataIsCellularDataEnabled_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataIsCellularDataEnabled_static_0300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                data.isCellularDataEnabled((err: BusinessError<void>|null, data: boolean| undefined) => {
                    if (err?.code != 0) {
                    
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        ExpectTrue(data != undefined);
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    }
                });
            } catch (error: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testTelephonyDataIsCellularDataEnabled_static_0500
         * @tc.number SUB_Telephony_Data_IsCellularDataEnabled_0500
         * @tc.desc   Check whether the cellular data service is enabled.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testTelephonyDataIsCellularDataEnabled_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataIsCellularDataEnabled_static_0500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                data.isCellularDataEnabled().then((data: boolean) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': data ->'+ data);
                    ExpectTrue(data);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }
        });

        /**
         * @tc.name   testTelephonyDataIsCellularDataEnabled_static_0700
         * @tc.number SUB_Telephony_Data_IsCellularDataEnabled_0700
         * @tc.desc   Check whether the cellular data service is enabled.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testTelephonyDataIsCellularDataEnabled_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataIsCellularDataEnabled_static_0700';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                data.isCellularDataEnabled((err: BusinessError<void>|null, data: boolean| undefined ) => {
                    if (err?.code != 0) {
                        
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                       
                        ExpectTrue(true);
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    }
                });
            } catch (error: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testTelephonyDataGetDefaultCellularDataSlotIdSync_static_0100
         * @tc.number SUB_Telephony_Data_GetDefaultCellularDataSlotIdSync_0100
         * @tc.desc   Get the SIM card for default mobile data.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testTelephonyDataGetDefaultCellularDataSlotIdSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataGetDefaultCellularDataSlotIdSync_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                let cardSlot: number = data.getDefaultCellularDataSlotIdSync();
                hilog.info(domain, tag, '%{public}s', caseName +': cardSlot->'+JSON.stringify(cardSlot));
                ExpectTrue(cardSlot ==0 || cardSlot == 1);
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            } catch (error: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }
        });
    })
}