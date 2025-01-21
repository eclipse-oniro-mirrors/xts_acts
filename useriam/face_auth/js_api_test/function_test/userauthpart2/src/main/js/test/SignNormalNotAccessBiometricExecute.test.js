/*
 * Copyright (C) 2022-2023 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level } from '@ohos/hypium'
import userAuth from '@ohos.userIAM.userAuth'

const authParamDefault = {
  challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
  authType: [1],
  authTrustLevel: 10000,
};
const widgetParamDefault = {
  title: '使用密码验证',
};

export default function signNormalNotAccessBiometricExecute() {
  describe('signNormalNotAccessBiometricExecute', function () {
    /*
        * @tc.number    : Security_IAM_UserAuthInstance_Func_0042
        * @tc.name      : execute_userAuthInstance_on_off_result
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level.LEVEL2
    */
    it('Security_IAM_UserAuthInstance_Func_0042', Level.LEVEL2, async function (done) {
      console.info("Security_IAM_UserAuthInstance_Func_0042 start");
      try {
        const userAuthInstance = userAuth.getUserAuthInstance(authParamDefault, widgetParamDefault);
        userAuthInstance.on("result", { onResult: (result) => {} });
        userAuthInstance.off("result", { onResult: (result) => {} });
        console.info("Security_IAM_UserAuthInstance_Func_0042 success");
        expect(userAuthInstance).not().assertNull();
      } catch (e) {
        console.info("Security_IAM_UserAuthInstance_Func_0042 fail " + e.code);
        expect(null).assertFail();
      }
      done();
    });

    /*
        * @tc.number    : Security_IAM_UserAuthInstance_Func_0050
        * @tc.name      : execute_userAuthInstance_start
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level.LEVEL2
    */
    it('Security_IAM_UserAuthInstance_Func_0050', Level.LEVEL2, async function (done) {
      console.info("Security_IAM_UserAuthInstance_Func_0050 start");
      try {
        const userAuthInstance = userAuth.getUserAuthInstance(authParamDefault, widgetParamDefault);     
        userAuthInstance.start();
        console.info("Security_IAM_UserAuthInstance_Func_0050 success");
      } catch (e) {
        console.info("Security_IAM_UserAuthInstance_Func_0050 fail " + e.code);
        expect(e.code).assertEqual(201);
      }
      done();
    });

    /*
        * @tc.number    : Security_IAM_UserAuthInstance_Func_0090
        * @tc.name      : execute_userAuthInstance_cancel
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level.LEVEL2
    */
    it('Security_IAM_UserAuthInstance_Func_0090', Level.LEVEL2, async function (done) {
      console.info("Security_IAM_UserAuthInstance_Func_0090 start");
      try {
        const userAuthInstance = userAuth.getUserAuthInstance(authParamDefault, widgetParamDefault);
        userAuthInstance.cancel();
        console.info("Security_IAM_UserAuthInstance_Func_0090 success");
        expect(null).assertFail();
      } catch (e) {
        console.info("Security_IAM_UserAuthInstance_Func_0090 fail " + e.code);
        expect(e.code).assertEqual(userAuth.UserAuthResultCode.GENERAL_ERROR);
      }
      done();
    });
  });
};