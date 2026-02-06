/**
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from "../../../hypium/index";
import osAccount from '@ohos.account.osAccount'
import hilog from '@ohos.hilog'
import { BusinessError, RecordData } from '@ohos.base'

let tag: string = 'testTag';

export default function ActsOANoPermissionTestStatic() {
  describe('ActsOANoPermissionTestStatic', () => {
    /**
     * @tc.number   SUB_Account_OsAccount_NoPermission_static_0100
     * @tc.name     SUB_Account_OsAccount_NoPermission_static_0100
     * @tc.desc     no ohos.permission.MANAGE_LOCAL_ACCOUNTS.
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL3
     */
    it('SUB_Account_OsAccount_NoPermission_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_NoPermission_static_0100 start====");
        let accountManager: osAccount.AccountManager = osAccount.getAccountManager();
        try {
          accountManager.getOsAccountCount((err: BusinessError<void> | null, count: int | undefined): void => {
            hilog.info(0x0000, tag, '====>getOsAccountCount failed, error: ' + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(201);
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, '====>Assert err: ' + JSON.stringify(err));
            }
            done();
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, '====>getOsAccountCount exception: ' + JSON.stringify(err));
          expect(err.code).assertEqual(201);
          done();
        }
      });
    /**
     * @tc.number   SUB_Account_OsAccount_NoPermission_static_0200
     * @tc.name     SUB_Account_OsAccount_NoPermission_static_0200
     * @tc.desc     no ohos.permission.MANAGE_LOCAL_ACCOUNTS.
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL3
     */
    it('SUB_Account_OsAccount_NoPermission_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_NoPermission_static_0200 start====");
        let accountManager: osAccount.AccountManager = osAccount.getAccountManager();
        try {
          await accountManager.getOsAccountCount();
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, '====>getOsAccountCount err: ' + JSON.stringify(err));
          expect(err.code).assertEqual(201);
        }
        done();
      });
    /**
     * @tc.number   SUB_Account_OsAccount_NoPermission_static_0300
     * @tc.name     SUB_Account_OsAccount_NoPermission_static_0300
     * @tc.desc     no ohos.permission.MANAGE_LOCAL_ACCOUNTS.
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL3
     */
    it('SUB_Account_OsAccount_NoPermission_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_NoPermission_static_0300 start====");
        let domainInfo: osAccount.DomainAccountInfo = { domain: 'testDomain', accountName: 'testAccountName' };
        let accountManager: osAccount.AccountManager = osAccount.getAccountManager();
        try {
          accountManager.getOsAccountLocalIdForDomain(domainInfo,
            (err: BusinessError<void> | null, localId: int | undefined): void => {
              hilog.info(0x0000, tag, '====>getOsAccountLocalIdForDomain failed, error: ' + JSON.stringify(err));
              try {
                if (err) {
                  expect(err?.code).assertEqual(201);
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              } catch (err) {
                hilog.info(0x0000, tag, '====>Assert err: ' + JSON.stringify(err));
              }
              done();
            });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, '====>getOsAccountLocalIdForDomain exception: ' + JSON.stringify(err));
          expect(err.code).assertEqual(201);
          done();
        }
      });
    /**
     * @tc.number   SUB_Account_OsAccount_NoPermission_static_0400
     * @tc.name     SUB_Account_OsAccount_NoPermission_static_0400
     * @tc.desc     no ohos.permission.MANAGE_LOCAL_ACCOUNTS.
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL3
     */
    it('SUB_Account_OsAccount_NoPermission_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_NoPermission_static_0400 start====");
        let domainInfo: osAccount.DomainAccountInfo = { domain: 'testDomain', accountName: 'testAccountName' };
        let accountManager: osAccount.AccountManager = osAccount.getAccountManager();
        try {
          await accountManager.getOsAccountLocalIdForDomain(domainInfo);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, '====>checkDataSyncEnabled err: ' + JSON.stringify(err));
          expect(err.code).assertEqual(201);
        }
        done();
      });
    /**
     * @tc.number   SUB_Account_OsAccount_NoPermission_static_0500
     * @tc.name     SUB_Account_OsAccount_NoPermission_static_0500
     * @tc.desc     no ohos.permission.MANAGE_LOCAL_ACCOUNTS or ohos.permission.DISTRIBUTED_DATASYNC.
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL3
     */
    it('SUB_Account_OsAccount_NoPermission_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_NoPermission_static_0500 start====");
        let accountManager: osAccount.AccountManager = osAccount.getAccountManager();
        try {
          accountManager.queryDistributedVirtualDeviceId((err: BusinessError<void> | null,
            virtualID: string | undefined): void => {
            hilog.info(0x0000, tag, '====>queryDistributedVirtualDeviceId err: ' + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(201);
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, '====>Assert err: ' + JSON.stringify(err));
            }
            done();
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, '====>queryDistributedVirtualDeviceId exception: ' + JSON.stringify(err));
          expect(err.code).assertEqual(201);
          done();
        }
      });
    /**
     * @tc.number   SUB_Account_OsAccount_NoPermission_static_0600
     * @tc.name     SUB_Account_OsAccount_NoPermission_static_0600
     * @tc.desc     no ohos.permission.MANAGE_LOCAL_ACCOUNTS or ohos.permission.DISTRIBUTED_DATASYNC.
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL3
     */
    it('SUB_Account_OsAccount_NoPermission_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_NoPermission_static_0600 start====");
        let accountManager: osAccount.AccountManager = osAccount.getAccountManager();
        try {
          await accountManager.queryDistributedVirtualDeviceId();
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, '====>checkDataSyncEnabled err: ' + JSON.stringify(err));
          expect(err.code).assertEqual(201);
        }
        done();
      });

    /**
    * @tc.number     SUB_Account_OsAccount_NoPermission_static_1700
    * @tc.name       SUB_Account_OsAccount_NoPermission_static_1700
    * @tc.desc       permission check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('SUB_Account_OsAccount_NoPermission_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>SUB_Account_OsAccount_NoPermission_static_1700 ";
        hilog.info(0x0000, tag, logTag + "start====");
        let accountManager: osAccount.AccountManager = osAccount.getAccountManager();
        hilog.info(0x0000, tag, logTag + "start getCurrentOsAccount");
        try {
          let data: osAccount.DomainAccountInfo | null = await accountManager.getOsAccountDomainInfo(101);
          hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, logTag + "end====");
          expect(err.code).assertEqual(201);
        }
        done();
      });
    /**
     * @tc.number   SUB_Account_OsAccount_NoPermission_static_1800
     * @tc.name     SUB_Account_OsAccount_NoPermission_static_1800
     * @tc.desc     no ohos.permission.MANAGE_LOCAL_ACCOUNTS or ohos.permission.MANAGE_DOMAIN_ACCOUNTS.
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL3
     */
    it('SUB_Account_OsAccount_NoPermission_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>SUB_Account_OsAccount_NoPermission_static_1800 ";
        hilog.info(0x0000, tag, logTag + "start====");
        let oldDomainInfo: osAccount.DomainAccountInfo = { domain: 'testDomain', accountName: 'oldtestAccountName' };
        let newDomainInfo: osAccount.DomainAccountInfo = { domain: 'testDomain', accountName: 'newtestAccountName' };
        try {
          hilog.info(0x0000, tag, logTag + "start updateAccountInfo");
          await osAccount.DomainAccountManager.updateAccountInfo(oldDomainInfo, newDomainInfo);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          if (err.code == 801) {
            hilog.info(0x0000, tag, logTag + "Current device not support API: updateAccountInfo");
          } else {
            expect(err.code).assertEqual(201);
          }
        }
        done();
      });
    /**
     * @tc.number   SUB_Account_OsAccount_NoPermission_static_1900
     * @tc.name     SUB_Account_OsAccount_NoPermission_static_1900
     * @tc.desc     no ohos.permission.MANAGE_DOMAIN_ACCOUNT_SERVER_CONFIGS.
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL3
     */
    it('SUB_Account_OsAccount_NoPermission_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>SUB_Account_OsAccount_NoPermission_static_1900 ";
        hilog.info(0x0000, tag, logTag + "start====");
        let configParams: Record<string, RecordData> = {
          'uri': 'test.example.com',
          'port': 100
        };
        try {
          hilog.info(0x0000, tag, logTag + "start addServerConfig");
          await osAccount.DomainServerConfigManager.addServerConfig(configParams);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          if (err.code == 801) {
            hilog.info(0x0000, tag, logTag + "Current device not support API: addServerConfig");
          } else {
            expect(err.code).assertEqual(201);
          }
        }
        done();
      });
    /**
     * @tc.number   SUB_Account_OsAccount_NoPermission_static_2000
     * @tc.name     SUB_Account_OsAccount_NoPermission_static_2000
     * @tc.desc     no ohos.permission.MANAGE_DOMAIN_ACCOUNT_SERVER_CONFIGS.
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL3
     */
    it('SUB_Account_OsAccount_NoPermission_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>SUB_Account_OsAccount_NoPermission_static_2000 ";
        hilog.info(0x0000, tag, logTag + "start====");
        let configId: string = "configId";
        try {
          hilog.info(0x0000, tag, logTag + "start removeServerConfig");
          await osAccount.DomainServerConfigManager.removeServerConfig(configId);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          if (err.code == 801) {
            hilog.info(0x0000, tag, logTag + "Current device not support API: removeServerConfig");
          } else {
            expect(err.code).assertEqual(201);
          }
        }
        done();
      });
    /**
     * @tc.number   SUB_Account_OsAccount_NoPermission_static_2100
     * @tc.name     SUB_Account_OsAccount_NoPermission_static_2100
     * @tc.desc     no ohos.permission.MANAGE_DOMAIN_ACCOUNT_SERVER_CONFIGS.
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL3
     */
    it('SUB_Account_OsAccount_NoPermission_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>SUB_Account_OsAccount_NoPermission_static_2100 ";
        hilog.info(0x0000, tag, logTag + "start====");
        let configId: string = "configId";
        let configParams: Record<string, RecordData> = {
          'uri': 'test.example.com',
          'port': 100
        };
        try {
          hilog.info(0x0000, tag, logTag + "start updateServerConfig");
          await osAccount.DomainServerConfigManager.updateServerConfig(configId, configParams);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          if (err.code == 801) {
            hilog.info(0x0000, tag, logTag + "Current device not support API: updateServerConfig");
          } else {
            expect(err.code).assertEqual(201);
          }
        }
        done();
      });
    /**
     * @tc.number   SUB_Account_OsAccount_NoPermission_static_2200
     * @tc.name     SUB_Account_OsAccount_NoPermission_static_2200
     * @tc.desc     no ohos.permission.MANAGE_DOMAIN_ACCOUNT_SERVER_CONFIGS.
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL3
     */
    it('SUB_Account_OsAccount_NoPermission_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>SUB_Account_OsAccount_NoPermission_static_2200 ";
        hilog.info(0x0000, tag, logTag + "start====");
        let configId: string = "configId";
        try {
          hilog.info(0x0000, tag, logTag + "start getServerConfig");
          await osAccount.DomainServerConfigManager.getServerConfig(configId);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          if (err.code == 801) {
            hilog.info(0x0000, tag, logTag + "Current device not support API: getServerConfig");
          } else {
            expect(err.code).assertEqual(201);
          }
        }
        done();
      });
    /**
     * @tc.number   SUB_Account_OsAccount_NoPermission_static_2300
     * @tc.name     SUB_Account_OsAccount_NoPermission_static_2300
     * @tc.desc     no ohos.permission.MANAGE_DOMAIN_ACCOUNT_SERVER_CONFIGS.
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL3
     */
    it('SUB_Account_OsAccount_NoPermission_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>SUB_Account_OsAccount_NoPermission_static_2300 ";
        hilog.info(0x0000, tag, logTag + "start====");
        try {
          hilog.info(0x0000, tag, logTag + "start getAllServerConfigs");
          await osAccount.DomainServerConfigManager.getAllServerConfigs();
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          if (err.code == 801) {
            hilog.info(0x0000, tag, logTag + "Current device not support API: getAllServerConfigs");
          } else {
            expect(err.code).assertEqual(201);
          }
        }
        done();
      });
    /**
     * @tc.number   SUB_Account_OsAccount_NoPermission_static_2400
     * @tc.name     SUB_Account_OsAccount_NoPermission_static_2400
     * @tc.desc     no ohos.permission.MANAGE_DOMAIN_ACCOUNT_SERVER_CONFIGS.
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL3
     */
    it('SUB_Account_OsAccount_NoPermission_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>SUB_Account_OsAccount_NoPermission_static_2400 ";
        hilog.info(0x0000, tag, logTag + "start====");
        let accountInfo: osAccount.DomainAccountInfo = {
          'accountName': 'demoName',
          'accountId': 'demoId',
          'domain': 'demoDomain'
        };
        hilog.info(0x0000, tag, logTag + "start====");
        try {
          hilog.info(0x0000, tag, logTag + "start getAccountServerConfig");
          await osAccount.DomainServerConfigManager.getAccountServerConfig(accountInfo);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          if (err.code == 801) {
            hilog.info(0x0000, tag, logTag + "Current device not support API: getAccountServerConfig");
          } else {
            expect(err.code).assertEqual(201);
          }
        }
        done();
      });
  });
}