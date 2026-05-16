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
import account from '@ohos.account.appAccount'
import Want from '@ohos.app.ability.Want';
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';

let tag: string = 'testTag';

let name: string = 'zhangsan'
let owner: string = 'com.acts.accountauthenticator'
let self_owner: string = 'com.example.actsaccountoperatetest.static'

export default function AppAccountResultCheckStatic() {
  describe('AppAccountResultCheckStatic', () => {
    let accountManager: account.AppAccountManager = account.createAppAccountManager();
    hilog.info(0x0000, tag, "AppAccountManager create finish====");


    /**
     * @tc.name   AppAccountResultCheckStatic_0100
     * @tc.number AppAccountResultCheckStatic_0100
     * @tc.desc   return of createAppAccountManager.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountResultCheckStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let logTag = "====>AppAccountResultCheckStatic_0100 "
      hilog.info(0x0000, tag, logTag + "start====");
      try {
        let appAccountManager: account.AppAccountManager = account.createAppAccountManager();
        hilog.info(0x0000, tag, logTag + "appAccountManager is: " + JSON.stringify(appAccountManager));
        expect(appAccountManager).not().assertUndefined();
      } catch (err) {
        hilog.info(0x0000, tag, logTag + "catch err: " + err.code);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AppAccountResultCheckStatic_0200
     * @tc.number AppAccountResultCheckStatic_0200
     * @tc.desc   getAuthCallback with empty string sessionId callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountResultCheckStatic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let logTag = "====>AppAccountResultCheckStatic_0200 "
      hilog.info(0x0000, tag, "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.getAuthCallback('', (err: BusinessError<void> | null, data: account.AuthCallback | undefined): void => {
        hilog.info(0x0000, tag, "err: " + JSON.stringify(err));
        hilog.info(0x0000, tag, "data: " + JSON.stringify(data));
        try {
          if (err) {
            expect(err.code).assertEqual(12300002);
          } else {
            hilog.info(0x0000, tag, logTag + "run err");
            expect().assertFail();
          }
          if (data) {
            expect(data.onResult).not().assertUndefined();
            expect(data.onRequestRedirected).not().assertUndefined();
            expect(data.onRequestContinued).not().assertUndefined();
          }
        } catch (e) {
          hilog.info(0x0000, tag, "Assert Fail:" + JSON.stringify(e));
        }
        done();
      });
    });

    /**
     * @tc.name   AppAccountResultCheckStatic_0300
     * @tc.number AppAccountResultCheckStatic_0300
     * @tc.desc   getAuthCallback promise with empty string sessionId.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountResultCheckStatic_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let logTag = "====>AppAccountResultCheckStatic_0300 "
      hilog.info(0x0000, tag, "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        let data = await appAccountManager.getAuthCallback('');
        if (data) {
          expect(data.onResult).not().assertUndefined();
          expect(data.onRequestRedirected).not().assertUndefined();
          expect(data.onRequestContinued).not().assertUndefined();
        }
        hilog.info(0x0000, tag, logTag + "run err");
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, tag, "catch err: " + err.code);
        expect(err.code).assertEqual(12300002);
        done();
      }
    });
  });
}
