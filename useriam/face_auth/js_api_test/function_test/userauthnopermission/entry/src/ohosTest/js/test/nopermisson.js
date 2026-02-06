/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import userAuth from '@ohos.userIAM.userAuth'

let UserAuthKit = new userAuth.UserAuth()
var index = require('../../../main/js/MainAbility/pages/index/index.js');
var waitFlag = false;
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium'

/**
 * test case
 */
export default function userAuthTestExecute() {
describe('userAuthTestExecute', function () {
    beforeEach(function(done) {
        let waitTime = 1000;
        if (waitFlag) {
            waitTime = 30000;
        }
        setTimeout(function() {
            done();
        }, waitTime);
    })
    afterEach(function() {
    })


     /**
    * @tc.name      execute_authentication_promise_Type_is_null
    * @tc.number    JSAPI_Function_Execute_2100
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level0
    */
      it('JSAPI_Function_Nopermission_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
        console.log("JSAPI_Function_Nopermission_2100 start");
        const auth = userAuth.getAuthenticator();
        auth.execute("FACE_ONLY", "S1").catch(function(data) {
            console.log("JSAPI_Function_Nopermission_2100 auth.execute:" + data);
            // general error
            expect(data).assertEqual(100);
            setTimeout(function() {
                done();
            }, 1);
        });
        console.log("JSAPI_Function_Nopermission_2100 end");
    })

      /**
    * @tc.name      execute_authentication_callback_Type_is_null
    * @tc.number    JSAPI_Function_Execute_1800
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
       it('JSAPI_Function_Nopermission_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.log("JSAPI_Function_Nopermission_1800 start");
        const auth = userAuth.getAuthenticator();
        auth.execute("FACE_ONLY", "S1", function(data) {
            console.log("JSAPI_Function_Nopermission_1800 auth.execute:" + data);
            // general error
            expect(data).assertEqual(100);
        });
        console.log("JSAPI_Function_Nopermission_1800 end");
    })

        /*
        * @tc.number    : Security_IAM_Nopermission_API8_Func_0101
        * @tc.name      : Kit interface get version
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
        it('Security_IAM_Nopermission_API8_Func_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        try {
            let getversionresult = null;
            getversionresult = UserAuthKit.getVersion();
            console.info('Security_IAM_Nopermission_API8_Func_0101 getversionresult = ' + getversionresult);
            //mini version 0
            expect(getversionresult).assertEqual(0);
            done();
        } catch (e) {
            console.log("testFace Security_IAM_Nopermission_API8_Func_0101 fail " + e.code);
            expect(null).assertFail();
            done();
        }
    })

            /*
        * @tc.number    : Security_IAM_Nopermission_API8_Func_0112
        * @tc.name      : Kit interface get AvailabeStatus
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
        it('Security_IAM_Nopermission_API8_Func_0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('testFace Security_IAM_Nopermission_API8_Func_0112 start');
        let authType = [2, 4]
        for (let idx0 = 0; idx0 < authType.length; idx0++){
            try {
                let AvailabeStatus = null
                AvailabeStatus = UserAuthKit.getAvailableStatus(authType[idx0], 10000);
                console.info('testFace Security_IAM_Nopermission_API8_Func_0112,2,10000 result = ' + JSON.stringify(AvailabeStatus));
                //201
                expect(201).assertEqual(AvailabeStatus);
                done()
            } catch (e) {
                console.log("Security_IAM_Nopermission_API8_Func_0112 fail " + e.code);
                expect(201).assertEqual(e.code);
                done()
            }
        }
    })

            /*
        * @tc.number    : Security_IAM_Nopermission_API8_Func_0103
        * @tc.name      : Kit interface auth & cancel auth
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
        it('Security_IAM_Nopermission_API8_Func_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
            let authType = [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT]
            for (let idx0 = 0; idx0 < authType.length; idx0++) {
                console.log("Security_IAM_Nopermission_API8_Func_0103 authtype:" + authType[idx0] + "trustlevel:10000");
                contextID1 = UserAuthKit.auth(challenge, authType[idx0], userAuth.AuthTrustLevel.ATL1, {
                    onResult: function(result,extraInfo){
                        console.log("Security_IAM_Nopermission_API8_Func_0103 auth result = " + result);
                        onresult.authresult = result;
                        //201
                        expect(201).assertEqual(result);
                        console.info('Security_IAM_Nopermission_API8_Func_0103 contextID1 = ' + contextID1);
                        let cancelResult = UserAuthKit.cancelAuth(contextID1);
                        console.info('Security_IAM_Nopermission_API8_Func_0103 cancelResult = ' + cancelResult);
                        done();
                    },
                    onAcquireInfo: function (modulea,acquire,extr){
                        console.info('faceTest publicauth auth onAcquireInfo in');
                        onacquireinfo.authmodule = modulea;
                        onacquireinfo.authacquire = acquire;
                        onacquireinfo.authextr = extr;
                        console.log("testFace faceDemo auth module = " + JSON.stringify(modulea));
                        console.info('testFace publicauth auth onAcquireInfo = ' + JSON.stringify(onacquireinfo));
                    }
                });
                done();
            }
        })

        /*
            * @tc.number    : Security_IAM_Nopermission_API9_Func_0104
            * @tc.name      : getAvailableStatus invalid parameters
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 0
        */
        it('Security_IAM_Nopermission_API9_Func_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testFace Security_IAM_Nopermission_API9_Func_0104 start');
            let authType = [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
            for (let idx0 = 0; idx0 < authType.length; idx0++) {
                try {
                    userAuth.getAvailableStatus(authType[idx0], userAuth.AuthTrustLevel.ATL1);
                    console.log("Security_IAM_Nopermission_API9_Func_0104  success " );
                    done()
                } catch (e) {
                    console.log("Security_IAM_Nopermission_API9_Func_0104  fail " + e.code);
                    expect(e.code).assertEqual(201);
                    done()
                }
            }
        })


         /*
         * @tc.number    : Security_IAM_Nopermission_API9_Func_0110
         * @tc.name      : getAuthInstance faceType ATL4
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('Security_IAM_Nopermission_API9_Func_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let challenge = new Uint8Array([253, 19, 58, 160, 67, 200, 247, 37])
            let authType = [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
            let authTrustLevel = userAuth.AuthTrustLevel.ATL1;
            for (let idx0 = 0; idx0 <authType.length; idx0++) {
                try {
                    var authInstance = userAuth.getAuthInstance(challenge, authType[idx0], authTrustLevel);
                    console.log("Security_IAM_Nopermission_API9_Func_0110 FACE ATL1 success");
                    done();
                } catch (e) {
                    console.log("Security_IAM_Nopermission_API9_Func_0110 FACE ATL1 fail" + e.code);
                    expect(e.code).assertEqual(201);
                    done();
                }
            }
        })

         /*
        * @tc.number    : Security_IAM_Nopermission_API9_Func_0103
        * @tc.name      : Kit interface auth 
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
         it('Security_IAM_Nopermission_API9_Func_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let challenge = new Uint8Array([253, 19, 58, 160, 67, 200, 247, 37])
            let authType = [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
            let authTrustLevel = userAuth.AuthTrustLevel.ATL1;

            for (let idx0 = 0; idx0 <authType.length; idx0++) {
                try {
                    var authInstance = userAuth.getAuthInstance(challenge, authType[idx0], authTrustLevel);
                    // register result and tip
                    authInstance.on("result", {
                        callback: (result) => {
                            console.log("authV9 result " + result.result);
                            console.log("authV9 token " + result.token);
                            console.log("authV9 remainAttempts " + result.remainAttempts);
                            console.log("authV9 lockoutDuration " + result.lockoutDuration);
                            expect(result.result).assertEqual(userAuth.UserAuthResultCode.NOT_ENROLLED);
                        }
                    });

                    authInstance.on("tip", {
                        callback: (result) => {
                            console.log("authV9 module " + result.module);
                            console.log("authV9 tip " + result.tip);
                        }
                    });

                    //start auth
                    authInstance.start();
                } catch (e) {
                    console.log("Security_IAM_Nopermission_API9_Func_0103 fail " + e.code);
                    expect(e.code).assertEqual(201);
                }

                // unregister result and tip
                try {
                    authInstance.off("result");
                    authInstance.off("tip");
                    done();
                } catch (e) {
                    console.log("Security_IAM_Nopermission_API9_Func_0103 fail " + e.code);
                    done();
                }
            }
        })
})
}
