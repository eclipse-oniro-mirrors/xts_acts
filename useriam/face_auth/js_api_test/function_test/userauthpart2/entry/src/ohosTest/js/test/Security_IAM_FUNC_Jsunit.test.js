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

import { describe, it, expect, Level, TestType, Size  } from '@ohos/hypium'
import userAuthNorth from '@ohos.userIAM.userAuth'
import { checkSupportOrNot } from './utils/commonFunc';

export default function userauthTest() {
    describe('userauthTest_API9', function () {

        /**
         * @tc.name   Security_IAM_Func_0102
         * @tc.number Security_IAM_Func_0102
         * @tc.desc   Abnormal testing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_IAM_Func_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('testFace getAvailableStatusTest0102 start');
            let authType = [userAuthNorth.UserAuthType.FACE, userAuthNorth.UserAuthType.FINGERPRINT, userAuthNorth.UserAuthType.PIN]
            let level = [userAuthNorth.AuthTrustLevel.ATL1, userAuthNorth.AuthTrustLevel.ATL2, userAuthNorth.AuthTrustLevel.ATL3]
            for (let idx0 = 0; idx0 < authType.length; idx0++) {
                let checkSupport = await checkSupportOrNot(authType[idx0]);
                if (checkSupport == 0) {
                    for (let idx1 = 0; idx1 < level.length; idx1++) {
                        try {
                            console.info('getAvailableStatusTest0102 authtype:' + authType[idx0] + 'trustlevel:' + level[idx1])
                            userAuthNorth.getAvailableStatus(authType[idx0], level[idx1]);
                        } catch (e) {
                            console.log("getAvailableStatusTest0102 fail " + 'authType:' + authType[idx0] + 'trustlevel:' + level[idx1] + 'e.code:' + e.code);
                            expect((e.code == userAuthNorth.UserAuthResultCode.NOT_ENROLLED) || (e.code == userAuthNorth.UserAuthResultCode.TYPE_NOT_SUPPORT)).assertTrue();
                            done();
                        }
                    }
                }
            }
            let authType1 = [userAuthNorth.UserAuthType.FINGERPRINT, userAuthNorth.UserAuthType.PIN];
            let level1 = userAuthNorth.AuthTrustLevel.ATL4;
            for (let idx2 = 0; idx2 < authType1.length; idx2++) {
                let checkSupport1 = await checkSupportOrNot(authType1[idx2]);
                if (checkSupport1 == 0) {
                    try {
                        console.info('getAvailableStatusTest0102 authtype:' + authType1[idx2] + 'trustlevel:' + level1)
                        userAuthNorth.getAvailableStatus(authType1[idx2], level1);
                    } catch (e) {
                        console.log("getAvailableStatusTest0102 fail " + 'authType:' + authType1[idx2] + 'trustlevel:' + level1 + 'e.code:' + e.code);
                        expect((e.code == userAuthNorth.UserAuthResultCode.NOT_ENROLLED) || (e.code == userAuthNorth.UserAuthResultCode.TRUST_LEVEL_NOT_SUPPORT)).assertTrue();
                        done();
                    }
                }
                
            }
            let authType2 = userAuthNorth.UserAuthType.FACE;
            let checkFace = await checkSupportOrNot(authType2);
            if (checkFace == 0) {
                try {
                    console.info('getAvailableStatusTest0102 authtype:' + authType2 + 'trustlevel:' + level1)
                        userAuthNorth.getAvailableStatus(authType2, level1);
                    } catch (e) {
                        console.log("getAvailableStatusTest0102 fail " + 'authType:' + authType2 + 'trustlevel:' + level1 + 'e.code:' + e.code);
                        expect((e.code == userAuthNorth.UserAuthResultCode.TYPE_NOT_SUPPORT) || 
                                (e.code == userAuthNorth.UserAuthResultCode.NOT_ENROLLED) || (e.code == userAuthNorth.UserAuthResultCode.TRUST_LEVEL_NOT_SUPPORT)).assertTrue();
                        done();
                    }
            }
            done();
        })


        /**
         * @tc.name   Security_IAM_Func_0104
         * @tc.number Security_IAM_Func_0104
         * @tc.desc   Abnormal testing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_IAM_Func_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('testFace getAvailableStatusTest0104 start');
            //No AuthType
            try {
                userAuthNorth.getAvailableStatus(userAuthNorth.AuthTrustLevel.ATL1);
            } catch (e) {
                console.log("getAvailableStatusTest0104 noAuthType fail " + e.code);
                expect(e.code).assertEqual(401);
            }

            //No AuthTrustLevel
            try {
                userAuthNorth.getAvailableStatus(userAuthNorth.UserAuthType.FACE);
            } catch (e) {
                console.log("getAvailableStatusTest0104 no AuthTrustLevel fail " + e.code);
                expect(e.code).assertEqual(401);
            }

            //No authtype and AuthTrustLevel
            try {
                userAuthNorth.getAvailableStatus();
            } catch (e) {
                console.log("getAvailableStatusTest0104 no authtype and AuthTrustLevel fail " + e.code);
                expect(e.code).assertEqual(401);
            }

            //more param 2
            try {
                userAuthNorth.getAvailableStatus(userAuthNorth.UserAuthType.FACE, userAuthNorth.AuthTrustLevel.ATL1, 2);
            } catch (e) {
                console.log("getAvailableStatusTest0104 more param 2 fail " + e.code);
                expect(e.code).assertEqual(401);
            }

            let invalidauthType = [-1, 0, 3, 5]
            for (let idx = 0; idx < invalidauthType.length; idx++) {
                //authType invalid
                try {
                    console.log("getAvailableStatusTest0104 authType invalid: " + invalidauthType[idx]);
                    userAuthNorth.getAvailableStatus(invalidauthType[idx], userAuthNorth.AuthTrustLevel.ATL1);
                } catch (e) {
                    console.log("getAvailableStatusTest0104 authType invalid:" + e.code);
                    expect(e.code).assertEqual(userAuthNorth.UserAuthResultCode.TYPE_NOT_SUPPORT);
                }
            }

            let invalidtrustLevel = [5000, 15000, 50000]
            for (let idx = 0; idx < invalidtrustLevel.length; idx++) {
                //trustlevel invalid
                try {
                    console.log("getAvailableStatusTest0104 trustLevel invalid " + invalidtrustLevel[idx]);
                    userAuthNorth.getAvailableStatus(2, invalidtrustLevel[idx]);
                } catch (e) {
                    console.log("getAvailableStatusTest0104 trustLevel invalid :1 " + e.code);
                    expect(e.code).assertEqual(userAuthNorth.UserAuthResultCode.TRUST_LEVEL_NOT_SUPPORT);
                }
            }
            done()
        })

        /**
         * @tc.name   Security_IAM_Func_0111
         * @tc.number Security_IAM_Func_0111
         * @tc.desc   Abnormal testing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_IAM_Func_0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('testFace getAuthInstance start');
            let challenge = new Uint8Array([253, 19, 58, 160, 67, 200, 247, 37])
            let authType = [userAuthNorth.UserAuthType.FACE, userAuthNorth.UserAuthType.FINGERPRINT]
            let level = [userAuthNorth.AuthTrustLevel.ATL1, userAuthNorth.AuthTrustLevel.ATL2, userAuthNorth.AuthTrustLevel.ATL3, userAuthNorth.AuthTrustLevel.ATL4]
            var authInstance;

            for (let idx1 = 0; idx1 < authType.length; idx1++) {
                let checkSupport = await checkSupportOrNot(authType[idx1]);
                if (checkSupport == 0) {
                    for (let idx2 = 0; idx2 < level.length; idx2++) {
                        try {
                            console.info('getAuthInstance authtype:' + authType[idx1] + 'trustlevel:' + level[idx2])
                            authInstance = userAuthNorth.getAuthInstance(challenge, authType[idx1], level[idx2]);
                            authInstance.on("result", {
                                callback: (result) => {
                                    console.log("authV9 result " + result.result);
                                    expect(result.result).assertEqual(userAuthNorth.UserAuthResultCode.NOT_ENROLLED);
                                }
                            });
                            //start auth
                            authInstance.start();
                        } catch (e) {
                            console.log("getAuthInstance/start fail " + e.code + 'authType:' + authType[idx1] + 'trustlevel:' + level[idx2] + 'e.code:' + e.code);
                            expect(e.code).assertEqual(userAuthNorth.UserAuthResultCode.NOT_ENROLLED);
                        }
                    }
                }

            }
            done()
        })

        /**
         * @tc.name   Security_IAM_Func_0105
         * @tc.number Security_IAM_Func_0105
         * @tc.desc   Abnormal testing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_IAM_Func_0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('testFace Security_IAM_Func_0105 start');
            let challenge = new Uint8Array([253, 19, 58, 160, 67, 200, 247, 37])
            let authType = userAuthNorth.UserAuthType.FACE;
            let authTrustLevel = userAuthNorth.AuthTrustLevel.ATL1;

            // no challenge
            try {
                var authInstance = userAuthNorth.getAuthInstance(authType, authTrustLevel);
            } catch (e) {
                console.log("Security_IAM_Func_0105 no challenge fail " + e.code);
                expect(e.code).assertEqual(401);
            }

            // no authType
            try {
                var authInstance = userAuthNorth.getAuthInstance(challenge, authTrustLevel);
            } catch (e) {
                console.log("Security_IAM_Func_0105 noAuthType fail " + e.code);
                expect(e.code).assertEqual(401);
            }

            // no AuthTrustLevel
            try {
                var authInstance = userAuthNorth.getAuthInstance(challenge, authType);
            } catch (e) {
                console.log("Security_IAM_Func_0105 noAuthTrustLevel fail " + e.code);
                expect(e.code).assertEqual(401);
            }

            // no param
            try {
                var authInstance = userAuthNorth.getAuthInstance();
            } catch (e) {
                console.log("Security_IAM_Func_0105 noAuthType fail " + e.code);
                expect(e.code).assertEqual(401);
            }

            // more param
            try {
                var authInstance = userAuthNorth.getAuthInstance(challenge, 2, 10000, 10000);
            } catch (e) {
                console.log("Security_IAM_Func_0105 more param fail " + e.code);
                expect(e.code).assertEqual(401);
            }


            let invalidauthType = [-1, 0, 1, 3, 5]
            for (let idx = 0; idx < invalidauthType.length; idx++) {
                //authType invalid
                try {
                    console.log("getAuthInstance authType invalid " + invalidauthType[idx]);
                    var authInstance = userAuthNorth.getAuthInstance(challenge, invalidauthType[idx], userAuthNorth.AuthTrustLevel.ATL1);
                } catch (e) {
                    console.log("getAuthInstance authType invalid : " + "invalidauthType[idx]" + invalidauthType[idx] + e.code);
                    expect(e.code).assertEqual(userAuthNorth.UserAuthResultCode.TYPE_NOT_SUPPORT);
                }
            }

            let invalidtrustLevel = [5000, 15000, 50000]
            for (let idx = 0; idx < invalidtrustLevel.length; idx++) {
                //trustlevel invalid
                try {
                    console.log("getAuthInstance trustLevel invalid " + invalidtrustLevel[idx]);
                    var authInstance = userAuthNorth.getAuthInstance(challenge, 2, invalidtrustLevel[idx]);
                } catch (e) {
                    console.log("getAuthInstance trustLevel invalid : " + "invalidtrustLevel[idx]" + invalidtrustLevel[idx] + e.code);
                    expect(e.code).assertEqual(userAuthNorth.UserAuthResultCode.TRUST_LEVEL_NOT_SUPPORT);
                }
            }
            done()
        })

        /**
         * @tc.name   Security_IAM_Func_0106
         * @tc.number Security_IAM_Func_0106
         * @tc.desc   Abnormal testing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_IAM_Func_0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('testFace Security_IAM_Func_0106 start');
            let challenge = new Uint8Array([253, 19, 58, 160, 67, 200, 247, 37])
            let authType = userAuthNorth.UserAuthType.FACE;
            let authTrustLevel = userAuthNorth.AuthTrustLevel.ATL1;

            //on: invalid parameter
            try {
                var authInstance = userAuthNorth.getAuthInstance(challenge, authType, authTrustLevel);
                authInstance.on("results", {
                    callback: function (result) {
                        if (result.result != userAuthNorth.UserAuthResultCode.SUCCESS) {
                            console.log("Security_IAM_Func_0106 on result = " + result.result);
                        }
                    }
                });
            } catch (e) {
                console.log("Security_IAM_Func_0106 invalid results fail " + e.code);
                expect(e.code).assertEqual(401);
            }

            //on: invalid parameter
            try {
                var authInstance = userAuthNorth.getAuthInstance(challenge, authType, authTrustLevel);
                authInstance.on("tips", {
                    callback: function (result) {
                        if (result.result != userAuthNorth.UserAuthResultCode.SUCCESS) {
                            console.log("Security_IAM_Func_0106 on result = " + result.result);
                        }
                    }
                });
            } catch (e) {
                console.log("Security_IAM_Func_0106 invalid tips fail " + e.code);
                expect(e.code).assertEqual(401);
            }

            //on: more parameter
            try {
                var authInstance = userAuthNorth.getAuthInstance(challenge, authType, authTrustLevel);
                authInstance.on("tip", "result", {
                    callback: function (result) {
                        if (result.result != userAuthNorth.UserAuthResultCode.SUCCESS) {
                            console.log("Security_IAM_Func_0106 on result = " + result.result);
                        }
                    }
                });
            } catch (e) {
                console.log("Security_IAM_Func_0106 more param fail " + e.code);
                expect(e.code).assertEqual(401);
            }

            //on: invalid parameter
            try {
                var authInstance = userAuthNorth.getAuthInstance(challenge, authType, authTrustLevel);
                authInstance.on("", {
                    callback: function (result) {
                        if (result.result != userAuthNorth.UserAuthResultCode.SUCCESS) {
                            console.log("Security_IAM_Func_0106 on result = " + result.result);
                        }
                    }
                });
            } catch (e) {
                console.log("Security_IAM_Func_0106 invalid  fail " + e.code);
                expect(e.code).assertEqual(401);
            }

            //on: invalid parameter
            try {
                var authInstance = userAuthNorth.getAuthInstance(challenge, authType, authTrustLevel);
                authInstance.on("result");
            } catch (e) {
                console.log("Security_IAM_Func_0106 no callback fail " + e.code);
                expect(e.code).assertEqual(401);
            }

            //off: invalid parameter
            try {
                var authInstance = userAuthNorth.getAuthInstance(challenge, authType, authTrustLevel);
                authInstance.off("results");
            } catch (e) {
                console.log("Security_IAM_Func_0106 invalid results fail " + e.code);
                expect(e.code).assertEqual(401);
            }

            //off: more parameter
            try {
                var authInstance = userAuthNorth.getAuthInstance(challenge, authType, authTrustLevel);
                authInstance.off("result", "tip");
            } catch (e) {
                console.log("Security_IAM_Func_0106 more param fail " + e.code);
                expect(e.code).assertEqual(401);
            }


            //off: invalid parameter
            try {
                var authInstance = userAuthNorth.getAuthInstance(challenge, authType, authTrustLevel);
                authInstance.off("tips");
            } catch (e) {
                console.log("Security_IAM_Func_0106 invalid tips fail " + e.code);
                expect(e.code).assertEqual(401);
            }

            //off: invalid parameter
            try {
                var authInstance = userAuthNorth.getAuthInstance(challenge, authType, authTrustLevel);
                authInstance.off("");
            } catch (e) {
                console.log("Security_IAM_Func_0106 invalid param fail " + e.code);
                expect(e.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   Security_IAM_Func_0103
         * @tc.number Security_IAM_Func_0103
         * @tc.desc   Abnormal testing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_IAM_Func_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let challenge = new Uint8Array([253, 19, 58, 160, 67, 200, 247, 37])
            let authType = [userAuthNorth.UserAuthType.FACE, userAuthNorth.UserAuthType.FINGERPRINT];
            let authTrustLevel = userAuthNorth.AuthTrustLevel.ATL1;
            for (let idx0 = 0; idx0 < authType.length; idx0++) {
                let checkSupport = await checkSupportOrNot(authType[idx0]);
                if (checkSupport == 0) {
                    try {
                        var authInstance = userAuthNorth.getAuthInstance(challenge, authType[idx0], authTrustLevel);
                        // register result and tip
                        authInstance.on("result", {
                            callback: (result) => {
                                console.log("authV9 result " + result.result);
                                console.log("authV9 token " + result.token);
                                console.log("authV9 remainAttempts " + result.remainAttempts);
                                console.log("authV9 lockoutDuration " + result.lockoutDuration);
                                expect(result.result).assertEqual(userAuthNorth.UserAuthResultCode.NOT_ENROLLED);
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
                        console.log("Security_IAM_Func_0103 fail " + e);
                    }
    
                    // unregister result and tip
                    try {
                        authInstance.off("result");
                        authInstance.off("tip");
                        done();
                    } catch (e) {
                        console.log("Security_IAM_Func_0103 fail " + e);
                        expect(e.code).assertEqual(userAuthNorth.UserAuthResultCode.GENERAL_ERROR);
                        done();
                    }
                }
                
            }
            done();
        })

        /**
         * @tc.name   Security_IAM_Func_0108
         * @tc.number Security_IAM_Func_0108
         * @tc.desc   Abnormal testing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_IAM_Func_0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let challenge = new Uint8Array([253, 19, 58, 160, 67, 200, 247, 37])
            let authType = userAuthNorth.UserAuthType.FACE;
            let authTrustLevel = userAuthNorth.AuthTrustLevel.ATL1;
            let checkFace = await checkSupportOrNot(authType);
            if (checkFace == 0) {
                try {
                    var authInstance = userAuthNorth.getAuthInstance(challenge, authType, authTrustLevel);
                    authInstance.off("result");
                    done();
                } catch (e) {
                    console.log("Security_IAM_Func_0108 fail " + e.code);
                    expect(e.code).assertEqual(userAuthNorth.UserAuthResultCode.GENERAL_ERROR);
                    done();
                }
            }
            done();
        })

        /**
         * @tc.name   Security_IAM_Func_0109
         * @tc.number Security_IAM_Func_0109
         * @tc.desc   Abnormal testing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_IAM_Func_0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let challenge = new Uint8Array([253, 19, 58, 160, 67, 200, 247, 37])
            let authType = [userAuthNorth.UserAuthType.FACE, userAuthNorth.UserAuthType.FINGERPRINT];
            let authTrustLevel = userAuthNorth.AuthTrustLevel.ATL1;
            for (let idx0 = 0; idx0 < authType.length; idx0++) {
                try {
                    var authInstance = userAuthNorth.getAuthInstance(challenge, authType[idx0], authTrustLevel);
                    authInstance.cancel();
                } catch (e) {
                    console.log("Security_IAM_Func_0109 fail " + e);
                    expect(e.code).assertEqual(userAuthNorth.UserAuthResultCode.GENERAL_ERROR);
                    done();
                }
            }
        })

        /**
         * @tc.name   Security_IAM_Func_0110
         * @tc.number Security_IAM_Func_0110
         * @tc.desc   A normal response is expected
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_IAM_Func_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let challenge = new Uint8Array([253, 19, 58, 160, 67, 200, 247, 37])
            let authType = userAuthNorth.UserAuthType.FACE;
            let authTrustLevel = userAuthNorth.AuthTrustLevel.ATL4;

            try {
                var authInstance = userAuthNorth.getAuthInstance(challenge, authType, authTrustLevel);
                done();
            } catch (e) {
                console.log("Security_IAM_Func_0110 FACE ATL4 fail" + e);
                expect(null).assertFail();
                done();
            }
        })

        /**
         * @tc.name   Security_IAM_PIN_Kit_Func_0104
         * @tc.number Security_IAM_PIN_Kit_Func_0104
         * @tc.desc   Enumeration testing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_IAM_PIN_Kit_Func_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('testFace Security_IAM_PIN_Kit_Func_0104 start');
            expect(10000).assertEqual(userAuthNorth.AuthTrustLevel.ATL1);
            expect(20000).assertEqual(userAuthNorth.AuthTrustLevel.ATL2);
            expect(30000).assertEqual(userAuthNorth.AuthTrustLevel.ATL3);
            expect(40000).assertEqual(userAuthNorth.AuthTrustLevel.ATL4);
            console.info('testFace Security_IAM_PIN_Kit_Func_0104 end');
            done();
        })

        /**
         * @tc.name   Security_IAM_PIN_Kit_Func_0105
         * @tc.number Security_IAM_PIN_Kit_Func_0105
         * @tc.desc   Enumeration testing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_IAM_PIN_Kit_Func_0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('testFace Security_IAM_PIN_Kit_Func_0105 start');
            expect(1).assertEqual(userAuthNorth.FaceTips.FACE_AUTH_TIP_TOO_BRIGHT);
            expect(2).assertEqual(userAuthNorth.FaceTips.FACE_AUTH_TIP_TOO_DARK);
            expect(3).assertEqual(userAuthNorth.FaceTips.FACE_AUTH_TIP_TOO_CLOSE);
            expect(4).assertEqual(userAuthNorth.FaceTips.FACE_AUTH_TIP_TOO_FAR);
            expect(5).assertEqual(userAuthNorth.FaceTips.FACE_AUTH_TIP_TOO_HIGH);
            expect(6).assertEqual(userAuthNorth.FaceTips.FACE_AUTH_TIP_TOO_LOW);
            expect(7).assertEqual(userAuthNorth.FaceTips.FACE_AUTH_TIP_TOO_RIGHT);
            expect(8).assertEqual(userAuthNorth.FaceTips.FACE_AUTH_TIP_TOO_LEFT);
            expect(9).assertEqual(userAuthNorth.FaceTips.FACE_AUTH_TIP_TOO_MUCH_MOTION);
            expect(10).assertEqual(userAuthNorth.FaceTips.FACE_AUTH_TIP_POOR_GAZE);
            expect(11).assertEqual(userAuthNorth.FaceTips.FACE_AUTH_TIP_NOT_DETECTED);
            console.info('testFace Security_IAM_PIN_Kit_Func_0105 end');
            done();
        })

        /**
         * @tc.name   Security_IAM_PIN_Kit_Func_0106
         * @tc.number Security_IAM_PIN_Kit_Func_0106
         * @tc.desc   Enumeration testing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_IAM_PIN_Kit_Func_0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('testFace Security_IAM_PIN_Kit_Func_0106 start');
            expect(2).assertEqual(userAuthNorth.UserAuthType.FACE);
            expect(4).assertEqual(userAuthNorth.UserAuthType.FINGERPRINT);
            console.info('testFace Security_IAM_PIN_Kit_Func_0106 end');
            done();
        })

        /**
         * @tc.name   Security_IAM_Func_0107
         * @tc.number Security_IAM_Func_0107
         * @tc.desc   Enumeration testing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_IAM_Func_0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('testFace Security_IAM_Func_0107 start');
            expect(12500000).assertEqual(userAuthNorth.UserAuthResultCode.SUCCESS);
            expect(12500001).assertEqual(userAuthNorth.UserAuthResultCode.FAIL);
            expect(12500002).assertEqual(userAuthNorth.UserAuthResultCode.GENERAL_ERROR);
            expect(12500003).assertEqual(userAuthNorth.UserAuthResultCode.CANCELED);
            expect(12500004).assertEqual(userAuthNorth.UserAuthResultCode.TIMEOUT);
            expect(12500005).assertEqual(userAuthNorth.UserAuthResultCode.TYPE_NOT_SUPPORT);
            expect(12500006).assertEqual(userAuthNorth.UserAuthResultCode.TRUST_LEVEL_NOT_SUPPORT);
            expect(12500007).assertEqual(userAuthNorth.UserAuthResultCode.BUSY);
            expect(12500008).assertEqual(userAuthNorth.UserAuthResultCode.INVALID_PARAMETERS);
            expect(12500009).assertEqual(userAuthNorth.UserAuthResultCode.LOCKED);
            expect(12500010).assertEqual(userAuthNorth.UserAuthResultCode.NOT_ENROLLED);
            expect(12500011).assertEqual(userAuthNorth.UserAuthResultCode.CANCELED_FROM_WIDGET);
            expect(12500013).assertEqual(userAuthNorth.UserAuthResultCode.PIN_EXPIRED);
            console.info('testFace Security_IAM_Func_0107 end');
            done();
        })

        /**
         * @tc.name   Security_IAM_PIN_Kit_Func_0108
         * @tc.number Security_IAM_PIN_Kit_Func_0108
         * @tc.desc   Enumeration testing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_IAM_PIN_Kit_Func_0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('testFace Security_IAM_PIN_Kit_Func_0108 start');
            expect(0).assertEqual(userAuthNorth.FingerprintTips.FINGERPRINT_AUTH_TIP_GOOD);
            expect(1).assertEqual(userAuthNorth.FingerprintTips.FINGERPRINT_AUTH_TIP_DIRTY);
            expect(2).assertEqual(userAuthNorth.FingerprintTips.FINGERPRINT_AUTH_TIP_INSUFFICIENT);
            expect(3).assertEqual(userAuthNorth.FingerprintTips.FINGERPRINT_AUTH_TIP_PARTIAL);
            expect(4).assertEqual(userAuthNorth.FingerprintTips.FINGERPRINT_AUTH_TIP_TOO_FAST);
            expect(5).assertEqual(userAuthNorth.FingerprintTips.FINGERPRINT_AUTH_TIP_TOO_SLOW);
            console.info('testFace Security_IAM_PIN_Kit_Func_0108 end');
            done();
        })

        /**
         * @tc.name   SUB_Security_IAM_UserAuth_FUNC_0110
         * @tc.number SUB_Security_IAM_UserAuth_FUNC_0110
         * @tc.desc   getAuthLockState parameter validity check
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Security_IAM_UserAuth_FUNC_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('testFace SUB_Security_IAM_UserAuth_FUNC_0110 start');
            let checkFace = await checkSupportOrNot(userAuthNorth.UserAuthType.FACE);
            let checkPin = await checkSupportOrNot(userAuthNorth.UserAuthType.PIN);
            let checkFingerprint = await checkSupportOrNot(userAuthNorth.UserAuthType.FINGERPRINT);
            let authTypeParamError = [0, -1];
            let authType = [userAuthNorth.UserAuthType.FACE, userAuthNorth.UserAuthType.FINGERPRINT, userAuthNorth.UserAuthType.PIN];
            let permaentLockoutDuration = userAuthNorth.PERMANENT_LOCKOUT_DURATION;
            if (checkPin == 0 && checkFace == 0 && checkFingerprint == 0) {
                for (let idx0 = 0; idx0 < authTypeParamError.length; idx0++) {
                    try {
                        console.info(`SUB_Security_IAM_UserAuth_FUNC_0110 authType: ${authTypeParamError[idx0]}`);
                        await userAuthNorth.getAuthLockState(authTypeParamError[idx0]);
                        expect(null).assertFail();
                    } catch (error) {
                        console.error(`SUB_Security_IAM_UserAuth_FUNC_0110 fail code: ${error.code} authType: ${authTypeParamError[idx0]}`);
                        expect(error.code).assertEqual(userAuthNorth.UserAuthResultCode.TYPE_NOT_SUPPORT);
                    }
                };

                try {
                    console.info(`SUB_Security_IAM_UserAuth_FUNC_0110 authType is empty`);
                    await userAuthNorth.getAuthLockState();
                    expect(null).assertFail();
                } catch (error) {
                    console.error(`SUB_Security_IAM_UserAuth_FUNC_0110 fail code: ${error.code} authType is empty`);
                    expect(error.code).assertEqual(userAuthNorth.UserAuthResultCode.INVALID_PARAMETERS);
                };

                try {
                    console.info(`SUB_Security_IAM_UserAuth_FUNC_0110 authType is NULL`);
                    await userAuthNorth.getAuthLockState(null);
                    expect(null).assertFail();
                } catch (error) {
                    console.error(`SUB_Security_IAM_UserAuth_FUNC_0110 fail code: ${error.code} authType is NULL`);
                    expect(error.code).assertEqual(userAuthNorth.UserAuthResultCode.INVALID_PARAMETERS);
                };

                for (let idx0 = 0; idx0 < authType.length; idx0++) {
                    try {
                        console.info(`SUB_Security_IAM_UserAuth_FUNC_0110 authType: ${authType[idx0]}`);
                        let AuthLockState = await userAuthNorth.getAuthLockState(authType[idx0]);
                        console.info(`SUB_Security_IAM_UserAuth_FUNC_0110 AuthLockState.isLocked : ${AuthLockState.isLocked}`);
                        console.info(`SUB_Security_IAM_UserAuth_FUNC_0110 AuthLockState.remainingAuthAttempts : ${AuthLockState.remainingAuthAttempts}`);
                        console.info(`SUB_Security_IAM_UserAuth_FUNC_0110 AuthLockState.lockoutDuration : ${AuthLockState.lockoutDuration}`);
                        expect(null).assertFail();
                    } catch (error) {
                        console.error(`SUB_Security_IAM_UserAuth_FUNC_0110 fail code: ${error.code} authType: ${authType[idx0]}`);
                        expect(error.code).assertEqual(userAuthNorth.UserAuthResultCode.NOT_ENROLLED);
                    }
                };
            }
            done();
        })
    })

}
