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
import osAccount from '@ohos.account.osAccount'
import Want from '@ohos.app.ability.Want';
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import { RecordData } from '@ohos.base';

let tag: string = 'testTag';

export default function OsAccountParamCheckStatic() {
  describe('OsAccountParamCheckStatic', () => {
    let accountManager: osAccount.AccountManager = osAccount.getAccountManager();
    let authorizationManager: osAccount.AuthorizationManager = osAccount.getAuthorizationManager();
    hilog.info(0x0000, tag, '====>osAccountManager get finish====');

    /**
     * @tc.number     OsAccountParamCheckStatic_0100
     * @tc.name       osAccountParamCheckStatic_0100
     * @tc.desc       isOsAccountConstraintEnabled with empty string parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('osAccountParamCheckStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>osAccountParamCheckStatic_0100 start====");
        let constraint: string = '';
        try {
          await accountManager.isOsAccountConstraintEnabled(constraint);
          hilog.info(0x0000, tag, "====>osAccountParamCheckStatic_0100 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>osAccountParamCheckStatic_0100 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     OsAccountParamCheckStatic_0200
     * @tc.name       OsAccountParamCheckStatic_0200
     * @tc.desc       getOsAccountLocalIdForDomain with empty serverConfigId parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('OsAccountParamCheckStatic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>OsAccountParamCheckStatic_0200 start====");
        let domainInfo: osAccount.DomainAccountInfo = {
          domain: 'testDomain',
          accountName: 'testAccount',
          serverConfigId: ''
        };
        try {
          await accountManager.getOsAccountLocalIdForDomain(domainInfo);
          hilog.info(0x0000, tag, "====>OsAccountParamCheckStatic_0200 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>OsAccountParamCheckStatic_0200 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300003);
        }
        done();
      });

    /**
     * @tc.number     OsAccountParamCheckStatic_0300
     * @tc.name       OsAccountParamCheckStatic_0300
     * @tc.desc       getOsAccountLocalIdForDomain with callback, empty serverConfigId parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('OsAccountParamCheckStatic_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>OsAccountParamCheckStatic_0300 start====");
        let domainInfo: osAccount.DomainAccountInfo = {
          domain: 'testDomain',
          accountName: 'testAccount',
          serverConfigId: ''
        };
        try {
          accountManager.getOsAccountLocalIdForDomain(domainInfo, (err: BusinessError | null, result: int | undefined) => {
            if (err) {
              hilog.info(0x0000, tag, "====>OsAccountParamCheckStatic_0300 err: " + JSON.stringify(err));
              expect(err.code).assertEqual(12300003);
              done();
            } else {
              hilog.info(0x0000, tag, "====>OsAccountParamCheckStatic_0300 run err");
              expect().assertFail();
              done();
            }
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>OsAccountParamCheckStatic_0300 err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });
      
    /**
     * @tc.number     OsAccountParamCheckStatic_0700
     * @tc.name       OsAccountParamCheckStatic_0700
     * @tc.desc       getAccountServerConfig with empty serverConfigId parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('OsAccountParamCheckStatic_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>OsAccountParamCheckStatic_0700 start====");
        let oldAccountInfo: osAccount.DomainAccountInfo = {
          accountName: 'testAccountName', domain: "test.domain", accountId: "123", serverConfigId: "" };
        let newAccountInfo: osAccount.DomainAccountInfo = {
          accountName: 'testAccountName', domain: "test.domain", accountId: "456", serverConfigId: "config" };
        try {
          await osAccount.DomainAccountManager.updateAccountInfo(oldAccountInfo, newAccountInfo);
          hilog.info(0x0000, tag, "====>OsAccountParamCheckStatic_0700 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>catch err: " + JSON.stringify(err));
          if (err.code === 801) {
            hilog.info(0x0000, tag, "====>Current device not support API: updateAccountInfo");
          } else {
            expect(err.code).assertEqual(12300003);
          }
        }
        done();
      });
    /**
     * @tc.number     OsAccountParamCheckStatic_0800
     * @tc.name       OsAccountParamCheckStatic_0800
     * @tc.desc       getAccountServerConfig with empty serverConfigId parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('OsAccountParamCheckStatic_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>OsAccountParamCheckStatic_0800 start====");
        let oldAccountInfo: osAccount.DomainAccountInfo = {
          accountName: 'testAccountName', domain: "test.domain", accountId: "123", serverConfigId: "config" };
        let newAccountInfo: osAccount.DomainAccountInfo = {
          accountName: 'testAccountName', domain: "test.domain", accountId: "456", serverConfigId: "" };
        try {
          await osAccount.DomainAccountManager.updateAccountInfo(oldAccountInfo, newAccountInfo);
          hilog.info(0x0000, tag, "====>OsAccountParamCheckStatic_0800 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>catch err: " + JSON.stringify(err));
          if (err.code === 801) {
            hilog.info(0x0000, tag, "====>Current device not support API: updateAccountInfo");
          } else {
            expect(err.code).assertEqual(12300003);
          }
        }
        done();
      });

    /**
     * @tc.name   OsAccountParamCheck_8400
     * @tc.number OsAccountParamCheck_8400
     * @tc.desc   return of getAccountManager.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let tag = "====>OsAccountParamCheck_8400 "
      hilog.info(0x0000, tag, "start====");
      try {
        let accountManager = osAccount.getAccountManager();
        hilog.info(0x0000, tag, "accountManager is: " + JSON.stringify(accountManager));
        expect(accountManager).not().assertUndefined();
      } catch (err) {
        hilog.info(0x0000, tag, "catch err: " + err.code);
        expect().assertFail();
      }
      done();
    });
  });
}
