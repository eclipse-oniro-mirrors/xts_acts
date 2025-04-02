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
var index = require('../../../main/js/MainAbility/pages/index/index.js');
var waitFlag = false;
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

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
    * @tc.name      execute_authentication_callback_ALL_NO_SUPPORT
    * @tc.number    Security_IAM_Face_JSAPI_Function_Execute_1700
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('Security_IAM_Face_JSAPI_Function_Execute_1700', 0, function (done) {
        console.log("Security_IAM_Face_JSAPI_Function_Execute_1700 start");
        const auth = userAuth.getAuthenticator();
        auth.execute("ALL", "S2", function(data) {
            console.log("Security_IAM_Face_JSAPI_Function_Execute_1700 auth.execute:" + data);
            // NO_SUPPORT(-1)
            expect(data).assertEqual(-1);
            setTimeout(function() {
                done();
            }, 1);
        });
        console.log("Security_IAM_Face_JSAPI_Function_Execute_1700 end");
    })


    /**
    * @tc.name      execute_authentication_promise_ALL_NO_SUPPORT
    * @tc.number    Security_IAM_Face_JSAPI_Function_Execute_2000
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('Security_IAM_Face_JSAPI_Function_Execute_2000', 0, function (done) {
        console.log("Security_IAM_Face_JSAPI_Function_Execute_2000 start");
        const auth = userAuth.getAuthenticator();
        auth.execute("ALL", "S2").catch(function(data) {
            console.log("Security_IAM_Face_JSAPI_Function_Execute_2000 auth.execute:" + data);
            // NO_SUPPORT(-1)
            expect(data).assertEqual(-1);
            setTimeout(function() {
                done();
            }, 1);
        });
        console.log("Security_IAM_Face_JSAPI_Function_Execute_2000 end");
    })
    
    /**
    * @tc.name      execute_authentication_callback_Type_is_null
    * @tc.number    Security_IAM_Face_JSAPI_Function_Execute_1800
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('Security_IAM_Face_JSAPI_Function_Execute_1800', 0, function (done) {
        console.log("Security_IAM_Face_JSAPI_Function_Execute_1800 start");
        const auth = userAuth.getAuthenticator();
        auth.execute("", "S2", function(data) {
            console.log("Security_IAM_Face_JSAPI_Function_Execute_1800 auth.execute:" + data);
            // INVALID_PARAMETERS（6）
            expect(data).assertEqual(6);
            setTimeout(function() {
                done();
            }, 1);
        });
        console.log("Security_IAM_Face_JSAPI_Function_Execute_1800 end");
    })


    /**
    * @tc.name      execute_authentication_promise_Type_is_null
    * @tc.number    Security_IAM_Face_JSAPI_Function_Execute_2100
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('Security_IAM_Face_JSAPI_Function_Execute_2100', 0, function (done) {
        console.log("Security_IAM_Face_JSAPI_Function_Execute_2100 start");
        const auth = userAuth.getAuthenticator();
        auth.execute("", "S2").catch(function(data) {
            console.log("Security_IAM_Face_JSAPI_Function_Execute_2100 auth.execute:" + data);
            // INVALID_PARAMETERS（6）
            expect(data).assertEqual(6);
            setTimeout(function() {
                done();
            }, 1);
        });
        console.log("Security_IAM_Face_JSAPI_Function_Execute_2100 end");
    })

       /**
    * @tc.name      execute_authentication_callback_Type_is_null
    * @tc.number    JSAPI_Function_Execute_3100
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
        it('JSAPI_Function_Execute_3100', 0, function (done) {
            console.log("JSAPI_Function_Execute_3100 start");
            const auth = userAuth.getAuthenticator();
            auth.execute("FACE", "S1", function(data) {
                console.log("JSAPI_Function_Execute_3100 auth.execute, FACE,S1:" + data);
                // INVALID_PARAMETERS（6）
                expect(data).assertEqual(6);
                setTimeout(function() {
                }, 1);
            });

            auth.execute("FACE_ONLY", "S0", function(data) {
                console.log("JSAPI_Function_Execute_3100 auth.execute, FACE_ONLY,S0:" + data);
                // INVALID_PARAMETERS（6）
                expect(data).assertEqual(6);
                setTimeout(function() {
                }, 1);
            });

            auth.execute("FACE_ONLY", "S5", function(data) {
                console.log("JSAPI_Function_Execute_3100 auth.execute, FACE_ONLY,S5:" + data);
                // INVALID_PARAMETERS（6）
                expect(data).assertEqual(6);
                setTimeout(function() {
                }, 1);
            });

            auth.execute("FACE_ONLY", "", function(data) {
                console.log("JSAPI_Function_Execute_3100 auth.execute, FACE_ONLY,/:" + data);
                // INVALID_PARAMETERS（6）
                expect(data).assertEqual(6);
                setTimeout(function() {
                }, 1);
            });

            auth.execute("", "", function(data) {
                console.log("JSAPI_Function_Execute_3100 auth.execute, /,/:" + data);
                // INVALID_PARAMETERS（6）
                expect(data).assertEqual(6);
                setTimeout(function() {
                }, 1);
            });

            try{
                auth.execute("FACE_ONLY", "S1","S1", function(data) {
                    console.log("JSAPI_Function_Execute_3100 auth.execute, FACE_ONLY,S1,S1:" + data);
                    // INVALID_PARAMETERS（6）
                    setTimeout(function() {
                    }, 1);
                });
            }catch(e)
            {
                console.log("JSAPI_Function_Execute_3100 auth.execute, FACE_ONLY,S1,S1:" + e.code);
            }

            try{
                auth.execute("FACE_ONLY", function(data) {
                    console.log("JSAPI_Function_Execute_3100 auth.execute, FACE_ONLY" + data);
                    // INVALID_PARAMETERS（6）
                    setTimeout(function() {
                    }, 1);
                });
            }catch(e)
            {
                console.log("JSAPI_Function_Execute_3100 auth.execute, FACE_ONLY" + e.code);
            }

            auth.execute("FACE_ONLY", "S1", function(data) {
                console.log("JSAPI_Function_Execute_3100 auth.execute, FACE_ONLY,S1:" + data);
                // NOT ENROLL
                expect(data).assertEqual(8);
                setTimeout(function() {
                }, 1);
            });

            auth.execute("FACE_ONLY", "S2", function(data) {
                console.log("JSAPI_Function_Execute_3100 auth.execute, FACE_ONLY,S2:" + data);
                // NOT ENROLL
                expect(data).assertEqual(8);
                setTimeout(function() {
                }, 1);
            });

            auth.execute("FACE_ONLY", "S3", function(data) {
                console.log("JSAPI_Function_Execute_3100 auth.execute, FACE_ONLY,S3:" + data);
                // NOT ENROLL
                expect(data).assertEqual(8);
                setTimeout(function() {
                }, 1);
            });

            auth.execute("FACE_ONLY", "S4", function(data) {
                console.log("JSAPI_Function_Execute_3100 auth.execute, FACE_ONLY,S4:" + data);
                // NOT ENROLL
                expect(data).assertEqual(8);
                setTimeout(function() {
                    done();
                }, 1);
            });
            console.log("JSAPI_Function_Execute_3100 end");
        })
    
    
        /**
        * @tc.name      execute_authentication_promise_Type_is_null
        * @tc.number    JSAPI_Function_Execute_3101
        * @tc.size      MEDIUM
        * @tc.type      FUNC
        * @tc.level     Level2
        */
        it('JSAPI_Function_Execute_3101', 0, function (done) {
            console.log("JSAPI_Function_Execute_3101 start");
            const auth = userAuth.getAuthenticator();
            auth.execute("FACE", "S1").catch(function(data) {
                console.log("JSAPI_Function_Execute_3101 auth.execute,FACE,S1:" + data);
                // INVALID_PARAMETERS（6）
                expect(data).assertEqual(6);
                setTimeout(function() {
                }, 1);
            });

            auth.execute("FACE_ONLY", "S0").catch(function(data) {
                console.log("JSAPI_Function_Execute_3101 auth.execute,FACE_ONLY,S0:" + data);
                // INVALID_PARAMETERS（6）
                expect(data).assertEqual(6);
                setTimeout(function() {
                }, 1);
            });

            auth.execute("FACE_ONLY", "S5").catch(function(data) {
                console.log("JSAPI_Function_Execute_3101 auth.execute,FACE_ONLY,S5:" + data);
                // INVALID_PARAMETERS（6）
                expect(data).assertEqual(6);
                setTimeout(function() {
                }, 1);
            });

            auth.execute("FACE_ONLY", "").catch(function(data) {
                console.log("JSAPI_Function_Execute_3101 auth.execute,FACE_ONLY,/:" + data);
                // INVALID_PARAMETERS（6）
                expect(data).assertEqual(6);
                setTimeout(function() {
                }, 1);
            });

            auth.execute("", "").catch(function(data) {
                console.log("JSAPI_Function_Execute_3101 auth.execute,/,/:" + data);
                // INVALID_PARAMETERS（6）
                expect(data).assertEqual(6);
                setTimeout(function() {
                }, 1);
            });

            try{
                auth.execute("FACE_ONLY", "S1","S1").catch(function(data) {
                    console.log("JSAPI_Function_Execute_3101 auth.execute,FACE_ONLY,S1,S1:" + data);
                    // INVALID_PARAMETERS（6）
                    setTimeout(function() {
                    }, 1);
                });
            }catch(e)
            {
                console.log("JSAPI_Function_Execute_3101 auth.execute,FACE_ONLY,S1,S1:" + e.code);
            }
 
            try{
                auth.execute("FACE_ONLY").catch(function(data) {
                    console.log("JSAPI_Function_Execute_3101 auth.execute,FACE_ONLY:" + data);
                    // INVALID_PARAMETERS（6）
                    setTimeout(function() {
                    }, 1);
                });
            }catch(e)
            {
                console.log("JSAPI_Function_Execute_3101 auth.execute,FACE_ONLY:" + e.code);
            }

            auth.execute("FACE_ONLY", "S1").catch(function(data) {
                console.log("JSAPI_Function_Execute_3101 auth.execute,FACE_ONLY,S1:" + data);
                // NOT ENROLL(8)
                expect(data).assertEqual(8);
                setTimeout(function() {
                }, 1);
            });

            auth.execute("FACE_ONLY", "S2").catch(function(data) {
                console.log("JSAPI_Function_Execute_3101 auth.execute,FACE_ONLY,S2:" + data);
                // NOT ENROLL(8)
                expect(data).assertEqual(8);
                setTimeout(function() {
                }, 1);
            });

            auth.execute("FACE_ONLY", "S3").catch(function(data) {
                console.log("JSAPI_Function_Execute_3101 auth.execute,FACE_ONLY,S3:" + data);
                // NOT ENROLL(8)
                expect(data).assertEqual(8);
                setTimeout(function() {
                }, 1);
            });

            auth.execute("FACE_ONLY", "S4").catch(function(data) {
                console.log("JSAPI_Function_Execute_3101 auth.execute,FACE_ONLY,S4:" + data);
                // NOT ENROLL(8)
                expect(data).assertEqual(8);
                setTimeout(function() {
                    done();
                }, 1);
            });

            console.log("JSAPI_Function_Execute_3101 end");
        })
})
}
