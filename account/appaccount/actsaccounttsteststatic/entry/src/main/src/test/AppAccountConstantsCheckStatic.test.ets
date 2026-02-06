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
import account from '@ohos.account.appAccount'
import { describe, beforeAll, afterEach, it, expect, TestType, Hypium, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';

let tag: string = 'testTag';

export default function AppAccountConstantsCheckStatic() {
  describe('AppAccountConstantsCheckStatic', () => {

    /**
    * @tc.number     AppAccountConstantsCheckStatic_0100
    * @tc.name       AppAccountConstantsCheckStatic_0100
    * @tc.desc       test Constants value
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountConstantsCheckStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountConstantsCheckStatic_0100 start====");
        try {
          expect(account.Constants.ACTION_CREATE_ACCOUNT_IMPLICITLY).assertEqual('createAccountImplicitly');
          expect(account.Constants.ACTION_AUTH).assertEqual('auth');
          expect(account.Constants.ACTION_VERIFY_CREDENTIAL).assertEqual('verifyCredential');
          expect(account.Constants.ACTION_SET_AUTHENTICATOR_PROPERTIES).assertEqual('setAuthenticatorProperties');
          expect(account.Constants.KEY_NAME).assertEqual('name');
          expect(account.Constants.KEY_OWNER).assertEqual('owner');
          expect(account.Constants.KEY_TOKEN).assertEqual('token');
          expect(account.Constants.KEY_ACTION).assertEqual('action');
          expect(account.Constants.KEY_AUTH_TYPE).assertEqual('authType');
          expect(account.Constants.KEY_SESSION_ID).assertEqual('sessionId');
          expect(account.Constants.KEY_CALLER_PID).assertEqual('callerPid');
          expect(account.Constants.KEY_CALLER_UID).assertEqual('callerUid');
          expect(account.Constants.KEY_CALLER_BUNDLE_NAME).assertEqual('callerBundleName');
          expect(account.Constants.KEY_REQUIRED_LABELS).assertEqual('requiredLabels');
          expect(account.Constants.KEY_BOOLEAN_RESULT).assertEqual('booleanResult');
          hilog.info(0x0000, tag, "====>AppAccountConstantsCheckStatic_0100 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>AppAccountConstantsCheckStatic_0100 catch err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
  })
}