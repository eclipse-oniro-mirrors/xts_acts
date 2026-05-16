/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium'

/**
 * test case
 */
export default function userAuthTestEnum() {
describe('userAuthTestEnum', function () {
    beforeEach(function(done) {
        let waitTime = 1000;
        setTimeout(function() {
            done();
        }, waitTime);
    })
    afterEach(function() {
    })

    /**
     * @tc.name   Security_IAM_Face_JSAPI_Function_Enum_0100
     * @tc.number Security_IAM_Face_JSAPI_Function_Enum_0100
     * @tc.desc   Security_IAM_Face_JSAPI_Function_Enum_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Security_IAM_Face_JSAPI_Function_Enum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        expect(typeof userAuth.AuthenticationResult.NO_SUPPORT !==undefined).assertTrue()
        expect(userAuth.AuthenticationResult.NO_SUPPORT).assertEqual(-1)
    })

    /**
     * @tc.name   Security_IAM_Face_JSAPI_Function_Enum_0200
     * @tc.number Security_IAM_Face_JSAPI_Function_Enum_0200
     * @tc.desc   Security_IAM_Face_JSAPI_Function_Enum_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_IAM_Face_JSAPI_Function_Enum_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        expect(typeof userAuth.AuthenticationResult.SUCCESS !==undefined).assertTrue()
        expect(userAuth.AuthenticationResult.SUCCESS).assertEqual(0)
    })

    /**
     * @tc.name   Security_IAM_Face_JSAPI_Function_Enum_0300
     * @tc.number Security_IAM_Face_JSAPI_Function_Enum_0300
     * @tc.desc   Security_IAM_Face_JSAPI_Function_Enum_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_IAM_Face_JSAPI_Function_Enum_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        expect(typeof userAuth.AuthenticationResult.COMPARE_FAILURE !==undefined).assertTrue()
        expect(userAuth.AuthenticationResult.COMPARE_FAILURE).assertEqual(1)
    })

    /**
     * @tc.name   Security_IAM_Face_JSAPI_Function_Enum_0400
     * @tc.number Security_IAM_Face_JSAPI_Function_Enum_0400
     * @tc.desc   Security_IAM_Face_JSAPI_Function_Enum_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_IAM_Face_JSAPI_Function_Enum_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        expect(typeof userAuth.AuthenticationResult.CANCELED !==undefined).assertTrue()
        expect(userAuth.AuthenticationResult.CANCELED).assertEqual(2)
    })

    /**
     * @tc.name   Security_IAM_Face_JSAPI_Function_Enum_0500
     * @tc.number Security_IAM_Face_JSAPI_Function_Enum_0500
     * @tc.desc   Security_IAM_Face_JSAPI_Function_Enum_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_IAM_Face_JSAPI_Function_Enum_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        expect(typeof userAuth.AuthenticationResult.TIMEOUT !==undefined).assertTrue()
        expect(userAuth.AuthenticationResult.TIMEOUT).assertEqual(3)
    })

    /**
     * @tc.name   Security_IAM_Face_JSAPI_Function_Enum_0600
     * @tc.number Security_IAM_Face_JSAPI_Function_Enum_0600
     * @tc.desc   Security_IAM_Face_JSAPI_Function_Enum_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_IAM_Face_JSAPI_Function_Enum_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        expect(typeof userAuth.AuthenticationResult.CAMERA_FAIL !==undefined).assertTrue()
        expect(userAuth.AuthenticationResult.CAMERA_FAIL).assertEqual(4)
    })

    /**
     * @tc.name   Security_IAM_Face_JSAPI_Function_Enum_0700
     * @tc.number Security_IAM_Face_JSAPI_Function_Enum_0700
     * @tc.desc   Security_IAM_Face_JSAPI_Function_Enum_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_IAM_Face_JSAPI_Function_Enum_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        expect(typeof userAuth.AuthenticationResult.BUSY !==undefined).assertTrue()
        expect(userAuth.AuthenticationResult.BUSY).assertEqual(5)
    })

    /**
     * @tc.name   Security_IAM_Face_JSAPI_Function_Enum_0800
     * @tc.number Security_IAM_Face_JSAPI_Function_Enum_0800
     * @tc.desc   Security_IAM_Face_JSAPI_Function_Enum_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_IAM_Face_JSAPI_Function_Enum_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        expect(typeof userAuth.AuthenticationResult.INVALID_PARAMETERS !==undefined).assertTrue()
        expect(userAuth.AuthenticationResult.INVALID_PARAMETERS).assertEqual(6)
    })

    /**
     * @tc.name   Security_IAM_Face_JSAPI_Function_Enum_0900
     * @tc.number Security_IAM_Face_JSAPI_Function_Enum_0900
     * @tc.desc   Security_IAM_Face_JSAPI_Function_Enum_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_IAM_Face_JSAPI_Function_Enum_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        expect(typeof userAuth.AuthenticationResult.LOCKED !==undefined).assertTrue()
        expect(userAuth.AuthenticationResult.LOCKED).assertEqual(7)
    })

    /**
     * @tc.name   Security_IAM_Face_JSAPI_Function_Enum_1000
     * @tc.number Security_IAM_Face_JSAPI_Function_Enum_1000
     * @tc.desc   Security_IAM_Face_JSAPI_Function_Enum_1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_IAM_Face_JSAPI_Function_Enum_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        expect(typeof userAuth.AuthenticationResult.NOT_ENROLLED !==undefined).assertTrue()
        expect(userAuth.AuthenticationResult.NOT_ENROLLED).assertEqual(8)
    })

    /**
     * @tc.name   Security_IAM_Face_JSAPI_Function_Enum_1100
     * @tc.number Security_IAM_Face_JSAPI_Function_Enum_1100
     * @tc.desc   Security_IAM_Face_JSAPI_Function_Enum_1100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_IAM_Face_JSAPI_Function_Enum_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        expect(typeof userAuth.AuthenticationResult.GENERAL_ERROR !==undefined).assertTrue()
        expect(userAuth.AuthenticationResult.GENERAL_ERROR).assertEqual(100)
    })
})
}