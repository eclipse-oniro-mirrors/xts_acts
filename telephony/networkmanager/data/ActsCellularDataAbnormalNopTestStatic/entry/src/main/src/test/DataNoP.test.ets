/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
export default function dataNoPTest() {

    describe("DataNoPTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');

        /**
         * @tc.name   testTelephonyDataNop_static_0100
         * @tc.number SUB_telephony_data_nop0100
         * @tc.desc   Using the isCellularDataEnabled (callback) method without permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testTelephonyDataNop_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataNop_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.isCellularDataEnabled().then((contextData: boolean) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': contextData ->'+contextData);
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 201);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue((err as BusinessError).code == 201);
                hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
                done();
            }
        })

        /**
         * @tc.name   testTelephonyDataNop_static_0200
         * @tc.number SUB_telephony_data_nop002
         * @tc.desc   Using the isCellularDataEnabled (callback) method without permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testTelephonyDataNop_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataNop_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.isCellularDataEnabled((err: BusinessError<void>|null, contextData: boolean| undefined) => {
                    if(err?.code != 0){
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                        ExpectTrue(err?.code == 201);
                    }else{
                        hilog.info(domain, tag, '%{public}s', caseName +' get isCellularDataEnabled success ');
                        ExpectFail();
                    }
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue((err as BusinessError).code == 201);
                hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
                done();
            }
        })

        /**
         * @tc.name   testTelephonyDataNop_static_0300
         * @tc.number SUB_Telephony_Data_Nop_0300
         * @tc.desc   Using the isCellularDataEnabledSync method without permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testTelephonyDataNop_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataNop_static_0300';
            hilog.info(domain, tag, '%{public}s', caseName + ' start');
            try{
                let isEnabled: boolean = data.isCellularDataEnabledSync();
                hilog.info(domain, tag, '%{public}s', caseName + ' isEnabled: '+ isEnabled);
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                ExpectFail();
                done();
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName + ' catch error in '+ JSON.stringify(err))
                ExpectTrue((err as BusinessError).code === 201);
                hilog.info(domain, tag, '%{public}s', caseName + '--test end');
                done();
            }
        })

        /**
         * @tc.name   testTelephonyDataNop_static_0400
         * @tc.number SUB_Telephony_Data_Nop_0400
         * @tc.desc   Using the isCellularDataRoamingEnabled (promise) method without permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testTelephonyDataNop_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataNop_static_0400';
            hilog.info(domain, tag, '%{public}s', caseName + ' start');
            try{
                data.isCellularDataRoamingEnabled(0).then((data: boolean) => {
                    hilog.info(domain, tag, '%{public}s', caseName + ': data ->'+ data);
                    hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                    ExpectFail();
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName + '  get error is '+JSON.stringify(err));
                    hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                    ExpectTrue(err.code === 201);
                    done();
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName + ' catch error in '+ JSON.stringify(err))
                ExpectTrue((err as BusinessError).code === 201);
                hilog.info(domain, tag, '%{public}s', caseName + '--test end');
                done();
            }
        })

        /**
         * @tc.name   testTelephonyDataNop_static_0500
         * @tc.number SUB_Telephony_Data_Nop_0500
         * @tc.desc   Using the isCellularDataRoamingEnabled (callback) method without permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testTelephonyDataNop_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataNop_static_0500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.isCellularDataRoamingEnabled(0, (err: BusinessError<void>|null, data: boolean|undefined) => {
                    if(err?.code !== 0){
                        hilog.info(domain, tag, '%{public}s', caseName + '  get error is '+ JSON.stringify(err));
                        hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                        ExpectTrue(err?.code === 201);
                        done();
                    }else{
                        hilog.info(domain, tag, '%{public}s', caseName + ': data ->'+ data);
                        hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                        ExpectFail();
                        done();
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
                ExpectTrue((err as BusinessError).code === 201);
                hilog.info(domain, tag, '%{public}s', caseName + '--test end');
                done();
            }
        })

        /**
         * @tc.name   testTelephonyDataNop_static_0600
         * @tc.number SUB_Telephony_Data_Nop_0600
         * @tc.desc   Using the isCellularDataRoamingEnabledSync method without permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testTelephonyDataNop_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataNop_static_0600';
            hilog.info(domain, tag, '%{public}s', caseName + ' start');
            try{
                let isEnabled: boolean = data.isCellularDataRoamingEnabledSync(0);
                hilog.info(domain, tag, '%{public}s', caseName + ' isEnabled: '+ isEnabled);
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                ExpectFail();
                done();
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName + ' catch error in '+ JSON.stringify(err))
                ExpectTrue((err as BusinessError).code === 201);
                hilog.info(domain, tag, '%{public}s', caseName + '--test end');
                done();
            }
        })

        /**
         * @tc.name   testTelephonyDataNop_static_0700
         * @tc.number SUB_Telephony_Data_Nop_0700
         * @tc.desc   Using the queryAllApns (promise) method without permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testTelephonyDataNop_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataNop_static_0700';
            hilog.info(domain, tag, '%{public}s', caseName + ' start');
            try{
                data.queryAllApns().then((apnInfos: Array<data.ApnInfo>) => {
                    hilog.info(domain, tag, '%{public}s', caseName + ': apnInfos ->' + apnInfos);
                    hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                    ExpectFail();
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName + '  get error is '+ JSON.stringify(err));
                    hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                    ExpectTrue(err.code === 201);
                    done();
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName + ' catch error in '+ JSON.stringify(err))
                ExpectTrue((err as BusinessError).code === 201);
                hilog.info(domain, tag, '%{public}s', caseName + '--test end');
                done();
            }
        })

        /**
         * @tc.name   testTelephonyDataNop_static_0800
         * @tc.number SUB_Telephony_Data_Nop_0800
         * @tc.desc   Using the getActiveApnName (promise) method without permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testTelephonyDataNop_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataNop_static_0800';
            hilog.info(domain, tag, '%{public}s', caseName + ' start');
            try{
                data.getActiveApnName().then((apn: string) => {
                    hilog.info(domain, tag, '%{public}s', caseName + ': apn ->' + apn);
                    hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                    ExpectFail();
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
                    hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                    ExpectTrue(err.code === 201);
                    done();
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
                ExpectTrue((err as BusinessError).code === 201);
                hilog.info(domain, tag, '%{public}s', caseName + '--test end');
                done();
            }
        })

        /**
         * @tc.name   testTelephonyDataNop_static_0900
         * @tc.number SUB_Telephony_Data_Nop_0900
         * @tc.desc   Using the queryApnIds (promise) method without permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testTelephonyDataNop_static_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataNop_static_0900';
            hilog.info(domain, tag, '%{public}s', caseName + ' start');
            let apnInfoParameter: data.ApnInfo = {
                apnName: 'apnName',
                apn: 'apn',
                mcc: 'mcc',
                mnc: 'mnc',
                user: 'user',
                type: 'type',
                proxy: 'proxy',
                mmsproxy: 'mmsproxy'
            };
            try{
                data.queryApnIds(apnInfoParameter).then((apnIds: Array<int>) => {
                    hilog.info(domain, tag, '%{public}s', caseName + ': apnIds ->' + apnIds);
                    hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                    ExpectFail();
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
                    hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                    ExpectTrue(err.code === 201);
                    done();
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
                ExpectTrue((err as BusinessError).code === 201);
                hilog.info(domain, tag, '%{public}s', caseName + '--test end');
                done();
            }
        })

        /**
         * @tc.name   testTelephonyDataNop_static_1000
         * @tc.number SUB_Telephony_Data_Nop_1000
         * @tc.desc   Using the setPreferredApn (promise) method without permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testTelephonyDataNop_static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataNop_static_1000';
            hilog.info(domain, tag, '%{public}s', caseName + ' start');
            try{
                data.setPreferredApn(0).then((result: boolean) => {
                    hilog.info(domain, tag, '%{public}s', caseName + ': result ->' + result);
                    hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                    ExpectFail();
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
                    hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                    ExpectTrue(err.code === 201);
                    done();
                });
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
                ExpectTrue((err as BusinessError).code === 201);
                hilog.info(domain, tag, '%{public}s', caseName + '--test end');
                done();
            }
        })

    })
}