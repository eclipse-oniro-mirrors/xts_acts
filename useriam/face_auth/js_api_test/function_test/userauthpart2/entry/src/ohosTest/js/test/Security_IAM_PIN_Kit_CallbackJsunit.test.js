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

import {describe, it, expect} from '@ohos/hypium'
import userAuthNorth from '@ohos.userIAM.userAuth'

let UserAuthKit = new userAuthNorth.UserAuth();

export default function userauthTest() {
    describe('userauthTest', function () {

        /*
            * @tc.number    : Security_IAM_PIN_Kit_Func_0101
            * @tc.name      : kit interface get version
            * @tc.desc      : A normal response is expected
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 0
        */
        it('Security_IAM_PIN_Kit_Func_0101', 0, async function (done) {
            try {
                let getversionresult = null;
                getversionresult = UserAuthKit.getVersion();
                console.info('GetVersionTest_0101 getversionresult = ' + getversionresult);
                expect(getversionresult).assertEqual(1);
                done();
            } catch (e) {
                console.log("testFace GetVersionTest_0101 fail " + e.code);
                expect(null).assertFail();
            }
        })

        /*
            * @tc.number    : Security_IAM_PIN_Kit_Func_0102
            * @tc.name      : kit interface get AvailabeStatus
            * @tc.desc      : Abnormal testing
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 0
        */
        it('Security_IAM_PIN_Kit_Func_0102', 0, async function (done) {
            console.info('testFace Security_IAM_PIN_Kit_Func_0102 start');
            let authType = [userAuthNorth.UserAuthType.FACE, userAuthNorth.UserAuthType.FINGERPRINT];
            let level = [userAuthNorth.AuthTrustLevel.ATL1, userAuthNorth.AuthTrustLevel.ATL2, userAuthNorth.AuthTrustLevel.ATL3];
            let availabeStatus;
            for (let idx0 = 0; idx0 < authType.length; idx0++) {
                for (let idx1 = 0; idx1 < level.length; idx1++) {
                    try {
                        console.info('Security_IAM_PIN_Kit_Func_0102 authtype:' + authType[idx0] + 'trustlevel:' + level[idx1])
                        availabeStatus = UserAuthKit.getAvailableStatus(authType[idx0], level[idx1]);
                        console.info(`Security_IAM_PIN_Kit_Func_0102 ${availabeStatus}`)
                        expect(availabeStatus).assertEqual(userAuthNorth.ResultCode.NOT_ENROLLED);
                    } catch (e) {
                        console.info(`Security_IAM_PIN_Kit_Func_0102 e ${JSON.stringify(e)}`)
                        console.log("Security_IAM_PIN_Kit_Func_0102 throw fail " + 'authType:' + authType[idx0] + 'trustlevel:' + level[idx1] + 'e.code:' + e.code);
                        expect(e.code).assertEqual(userAuthNorth.ResultCode.NOT_ENROLLED);
                    }
                    done();
                }
            }
            let authType1 = userAuthNorth.UserAuthType.FINGERPRINT;
            let level1 = userAuthNorth.AuthTrustLevel.ATL4;
            try {
                console.info('getAvailableStatusTest0102 authtype:' + authType1 + 'trustlevel:' + level1)
                userAuthNorth.getAvailableStatus(authType1, level1);
            } catch (e) {
                console.log("getAvailableStatusTest0102 fail " + 'authType:' + authType1 + 'trustlevel:' + level1 + 'e.code:' + e.code);
                expect(e.code).assertEqual(userAuthNorth.UserAuthResultCode.NOT_ENROLLED);
                done();
            }
            let authType2 = userAuthNorth.UserAuthType.FACE;
            try {
                console.info('getAvailableStatusTest0102 authtype:' + authType2 + 'trustlevel:' + level1)
                    userAuthNorth.getAvailableStatus(authType2, level1);
                } catch (e) {
                    console.log("getAvailableStatusTest0102 fail " + 'authType:' + authType2 + 'trustlevel:' + level1 + 'e.code:' + e.code);
                    expect((e.code == userAuthNorth.UserAuthResultCode.NOT_ENROLLED) || (e.code == userAuthNorth.UserAuthResultCode.TRUST_LEVEL_NOT_SUPPORT)).assertTrue();
                    done();
                }
            done();
        })

        /*
            * @tc.number    : Security_IAM_PIN_Kit_Func_0112
            * @tc.name      : kit interface get AvailabeStatus invalid param
            * @tc.desc      : Abnormal testing
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 0
        */
        it('Security_IAM_PIN_Kit_Func_0112', 0, async function (done) {
            console.info('testFace Security_IAM_PIN_Kit_Func_0112 start');
            let availabeStatus;
            //No AuthType
            try {
                availabeStatus = UserAuthKit.getAvailableStatus(userAuthNorth.AuthTrustLevel.ATL1);
                console.log("getAvailableStatus  noAuthType return fail " + availabeStatus);
                expect(availabeStatus).assertEqual(userAuthNorth.ResultCode.INVALID_PARAMETERS);
            } catch (e) {
                console.log("getAvailableStatus noAuthType throw fail " + e.code);
                expect(e.code).assertEqual(userAuthNorth.ResultCode.INVALID_PARAMETERS);
            }

            //No AuthTrustLevel
            try {
                availabeStatus = UserAuthKit.getAvailableStatus(userAuthNorth.UserAuthType.FACE);
                console.log("getAvailableStatus  AuthTrustLevel  return fail " + availabeStatus);
                expect(availabeStatus).assertEqual(userAuthNorth.ResultCode.INVALID_PARAMETERS);
            } catch (e) {
                console.log("getAvailableStatus no AuthTrustLevel throw fail " + e.code);
                expect(e.code).assertEqual(userAuthNorth.ResultCode.INVALID_PARAMETERS);
            }

            //No authtype and AuthTrustLevel
            try {
               availabeStatus = UserAuthKit.getAvailableStatus();
               console.log("getAvailableStatus  AuthTrustLevel return fail " + availabeStatus);
               expect(availabeStatus).assertEqual(userAuthNorth.ResultCode.INVALID_PARAMETERS);
            } catch (e) {
                console.log("getAvailableStatus no authtype and AuthTrustLevel  throw fail " + e.code);
                expect(e.code).assertEqual(userAuthNorth.ResultCode.INVALID_PARAMETERS);
            }

            //more param 2
            try {
                availabeStatus = UserAuthKit.getAvailableStatus(userAuthNorth.UserAuthType.FACE, userAuthNorth.AuthTrustLevel.ATL1, 2);
                console.log("getAvailableStatus  AuthTrustLevel  return fail " + availabeStatus);
                expect(availabeStatus).assertEqual(userAuthNorth.ResultCode.INVALID_PARAMETERS);
            } catch (e) {
                console.log("getAvailableStatus more param 2 throw fail  " + e.code);
                expect(e.code).assertEqual(userAuthNorth.ResultCode.INVALID_PARAMETERS);
            }

            let invalidauthType = [-1, 0, 1, 3, 5]
            for (let idx = 0; idx < invalidauthType.length; idx++) {
                //authType invalid
                try {
                    console.log("getAvailableStatus authType invalid: " + invalidauthType[idx]);
                    availabeStatus = UserAuthKit.getAvailableStatus(invalidauthType[idx], userAuthNorth.AuthTrustLevel.ATL1);
                    expect(availabeStatus).assertEqual(userAuthNorth.ResultCode.TYPE_NOT_SUPPORT);
                } catch (e) {
                    console.log("getAvailableStatus authType invalid throw:" + e.code);
                    expect(e.code).assertEqual(userAuthNorth.ResultCode.TYPE_NOT_SUPPORT);
                }
            }

            let invalidtrustLevel = [5000, 15000, 50000]
            for (let idx = 0; idx < invalidtrustLevel.length; idx++) {
                //trustlevel invalid
                try {
                    console.log("getAvailableStatus trustLevel invalid " + invalidtrustLevel[idx]);
                    availabeStatus = UserAuthKit.getAvailableStatus(2, invalidtrustLevel[idx]);
                    expect(availabeStatus).assertEqual(userAuthNorth.ResultCode.TRUST_LEVEL_NOT_SUPPORT);
                } catch (e) {
                    console.log("getAvailableStatus trustLevel invalid throw " + e.code);
                    expect(e.code).assertEqual(userAuthNorth.ResultCode.TRUST_LEVEL_NOT_SUPPORT);
                }
            }
            done()
        })

        /*
           * @tc.number    : Security_IAM_PIN_Kit_Func_0113
           * @tc.name      : kit interface auth & cancel auth
           * @tc.desc      : Abnormal testing
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level 0
           */
        it('Security_IAM_PIN_Kit_Func_0113', 0, async function (done) {
            let contextID1 = null
            let challenge = new Uint8Array([253, 19, 58, 160, 67, 200, 247, 37])
            let onresult = {
                authresult: null,
                authextr: null,
            }
            let onacquireinfo = {
                authmodule : null,
                authacquire : null,
                authextr : null
            }

            function authPromise(...args){
                return new Promise((res,rej) =>{
                    contextID1 = UserAuthKit.auth(args[0], args[1],args[2], {
                        onResult: function(result,extraInfo){
                            console.log(`testFace faceDemo auth  result is ${result}, challenge is ${args[0]}, authtype is ${args[1]}, trustlevel is ${args[2]} `);
                            onresult.authresult = result;
                            console.log("testFace faceDemo auth extraInfo = " + JSON.stringify(extraInfo));
                            onresult.authextr = extraInfo;
                            console.info('testFace publicauth auth onResult = ' + JSON.stringify(onresult));
                            try{
                                expect(result).assertEqual(args[3]);
                            }
                            catch(e){
                                console.log(`public auth error =${e.code}`)
                            }
                            console.info('testFace publicauth auth contextID1 = ' + contextID1);   
                            res()                        
                        }
                    })
                })
            }

            await authPromise(challenge, 0, 10000,5)
            await authPromise(challenge, 1, 10000,5)
            await authPromise(challenge, 3, 20000,5)
            await authPromise(challenge, 5, 20000,5)
            await authPromise(challenge, 2, 5000,6)
            await authPromise(challenge, 4, 15000,6)
            await authPromise(challenge, 2, 10000,10)
            await authPromise(challenge, 2, 20000,10)
            await authPromise(challenge, 2, 30000,10)
            await authPromise(challenge, 2, 40000,10)
            await authPromise(challenge, 4, 10000,10)
            await authPromise(challenge, 4, 20000,10)
            await authPromise(challenge, 4, 30000,10)
            await authPromise(challenge, 4, 40000,10)
            done()
        })

        /*
            * @tc.number    : Security_IAM_PIN_Kit_Func_0107
            * @tc.name      : kit interface enum ResultCode
            * @tc.desc      : Enumeration testing
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 0
        */
        it('Security_IAM_PIN_Kit_Func_0107', 0, async function (done) {
            console.info('testFace Security_IAM_PIN_Kit_Func_0107 start');
            expect(0).assertEqual(userAuthNorth.ResultCode.SUCCESS);
            expect(1).assertEqual(userAuthNorth.ResultCode.FAIL);
            expect(2).assertEqual(userAuthNorth.ResultCode.GENERAL_ERROR);
            expect(3).assertEqual(userAuthNorth.ResultCode.CANCELED);
            expect(4).assertEqual(userAuthNorth.ResultCode.TIMEOUT);
            expect(5).assertEqual(userAuthNorth.ResultCode.TYPE_NOT_SUPPORT);
            expect(6).assertEqual(userAuthNorth.ResultCode.TRUST_LEVEL_NOT_SUPPORT);
            expect(7).assertEqual(userAuthNorth.ResultCode.BUSY);
            expect(8).assertEqual(userAuthNorth.ResultCode.INVALID_PARAMETERS);
            expect(9).assertEqual(userAuthNorth.ResultCode.LOCKED);
            expect(10).assertEqual(userAuthNorth.ResultCode.NOT_ENROLLED);
            console.info('testFace Security_IAM_PIN_Kit_Func_0107 end');
            done();
        })

    })

}