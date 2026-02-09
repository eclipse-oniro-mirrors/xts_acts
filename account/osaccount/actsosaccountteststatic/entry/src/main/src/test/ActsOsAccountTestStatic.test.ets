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

import osAccount from '@ohos.account.osAccount'
import commonEventManager from '@ohos.commonEventManager'
import { describe, beforeAll, beforeEach, afterEach, it, expect, TestType, Hypium, Size, Level } from "../../../hypium/index";
import { BusinessError, RecordData } from '@ohos.base'
import deviceInfo from '@ohos.deviceInfo';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import parameter from '@ohos.systemParameterEnhance'
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let tag: string = 'testTag';
let gContext: common.UIAbilityContext;
let nameLimit: int = -1;

let getNameLimit = async () => {
  try {
    let login_max_max: string = parameter.getSync("persist.account.login_name_max");
    nameLimit = parseInt(login_max_max).toInt();
    hilog.info(0x0000, tag, "====>parameter.getSync login_name_max: " + JSON.stringify(nameLimit));
  } catch (err) {
    err = err as BusinessError;
    hilog.info(0x0000, tag, "====>parameter.getSync catch err: " + JSON.stringify(err));
  }
}

export default function ActsOsAccountTestStatic() {
  describe('ActsOsAccountTestStatic', () => {
    hilog.info(0x0000, tag, "====>start describe ActsOsAccountTestStatic");
    let deviceType: string = deviceInfo.deviceType;
    hilog.info(0x0000, tag, "====>the value of the deviceinfo deviceType is: " + deviceType);

    let accountManager: osAccount.AccountManager = osAccount.getAccountManager();
    hilog.info(0x0000, tag, "====>get os AccountManager finish====");
    
    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.osaccounttest.static");
      await Utils.msSleep(2000);
      try {
        let configArray = await osAccount.DomainServerConfigManager.getAllServerConfigs();
        hilog.info(0x0000, tag, "getAllServerConfigs configArray: " + JSON.stringify(configArray));
        for (let i = 0; i < configArray.length; i++) {
          hilog.info(0x0000, tag, "start configArray: " + JSON.stringify(configArray[i].id));
          await osAccount.DomainServerConfigManager.removeServerConfig(configArray[i].id);
        }
        hilog.info(0x0000, tag, '%{public}s', 'beforeAll end');
      } catch (err) {
        err = err as BusinessError;
        hilog.info(0x0000, tag, "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          hilog.info(0x0000, tag, "Current device not support API: getAllServerConfigs");
        }
      }
      done();
    });

    /**
     * @tc.name   ActsOsAccountGetForegroundOsAccountLocalIdStatic_0100
     * @tc.number ActsOsAccountGetForegroundOsAccountLocalIdStatic_0100
     * @tc.desc   Gets the local ID of the foreground OS account.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
    */
    it('ActsOsAccountGetForegroundOsAccountLocalIdStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountGetForegroundOsAccountLocalId_0100 start====");
        try {
          let localId: int = await accountManager.getForegroundOsAccountLocalId();
          hilog.info(0x0000, tag, "====>GetForegroundOsAccountLocalId_0100 localId: " + localId);
          expect(localId).assertEqual(100);
          hilog.info(0x0000, tag, "====>GetForegroundOsAccountLocalId_0100 end====");
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>GetForegroundOsAccountLocalId_0100 catch err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number   ActsOsAccountGetOsAccountDomainInfo_0300
    * @tc.name     ActsOsAccountGetOsAccountDomainInfo_0300
    * @tc.desc     Gets the domain account information associated with the specified OS account.
    * @tc.type     FUNCTION
    * @tc.size     MEDIUMTEST
    * @tc.level    LEVEL3
    */
    it('ActsOsAccountGetOsAccountDomainInfo_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountGetOsAccountDomainInfo_0300 start====");
        try {
          let domainInfo: osAccount.DomainAccountInfo | null = await accountManager.getOsAccountDomainInfo(-1);
          hilog.info(0x0000, tag, "====>GetOsAccountDomainInfo_0300 domainInfo: " + domainInfo);
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>GetOsAccountDomainInfo_0300 catch err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300003);
          hilog.info(0x0000, tag, "====>GetOsAccountDomainInfo_0300 end====");
          done();
        }
      });

    /**
    * @tc.number   ActsOsAccountGetOsAccountDomainInfo_0400
    * @tc.name     ActsOsAccountGetOsAccountDomainInfo_0400
    * @tc.desc     Gets the domain account information associated with the specified OS account.
    * @tc.type     FUNCTION
    * @tc.size     MEDIUMTEST
    * @tc.level    LEVEL3
    */
    it('ActsOsAccountGetOsAccountDomainInfo_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountGetOsAccountDomainInfo_0400 start====");
        try {
          let domainInfo: osAccount.DomainAccountInfo | null = await accountManager.getOsAccountDomainInfo(100000);
          hilog.info(0x0000, tag, "====>GetOsAccountDomainInfo_0400 domainInfo: " + domainInfo);
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>GetOsAccountDomainInfo_0400 catch err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300003);
          hilog.info(0x0000, tag, "====>GetOsAccountDomainInfo_0400 end====");
          done();
        }
      });

    /**
    * @tc.number   ActsOsAccountGetOsAccountDomainInfo_0500
    * @tc.name     ActsOsAccountGetOsAccountDomainInfo_0500
    * @tc.desc     Gets the domain account information associated with the specified OS account.
    * @tc.type     FUNCTION
    * @tc.size     MEDIUMTEST
    * @tc.level    LEVEL0
    */
    it('ActsOsAccountGetOsAccountDomainInfo_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountGetOsAccountDomainInfo_0500 start====");
        try {
          let domainInfo: osAccount.DomainAccountInfo | null = await accountManager.getOsAccountDomainInfo(0);
          hilog.info(0x0000, tag, "====>GetOsAccountDomainInfo_0500 domainInfo: " + domainInfo);
          expect(domainInfo == null).assertTrue();
          hilog.info(0x0000, tag, "====>GetOsAccountDomainInfo_0500 end====");
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>GetOsAccountDomainInfo_0500 catch err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number   ActsOsAccountGetOsAccountDomainInfo_0600
    * @tc.name     ActsOsAccountGetOsAccountDomainInfo_0600
    * @tc.desc     Gets the domain account information associated with the specified OS account.
    * @tc.type     FUNCTION
    * @tc.size     MEDIUMTEST
    * @tc.level    LEVEL0
    */
    it('ActsOsAccountGetOsAccountDomainInfo_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountGetOsAccountDomainInfo_0600 start====");
        try {
          let domainInfo: osAccount.DomainAccountInfo | null = await accountManager.getOsAccountDomainInfo(100);
          hilog.info(0x0000, tag, "====>GetOsAccountDomainInfo_0600 domainInfo: " + domainInfo);
          expect(domainInfo == null).assertTrue();
          hilog.info(0x0000, tag, "====>GetOsAccountDomainInfo_0600 end====");
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>GetOsAccountDomainInfo_0600 catch err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number   ActsOsAccountGetOsAccountDomainInfo_0700
    * @tc.name     ActsOsAccountGetOsAccountDomainInfo_0700
    * @tc.desc     Gets the domain account information associated with the specified OS account.
    * @tc.type     FUNCTION
    * @tc.size     MEDIUMTEST
    * @tc.level    LEVEL3
    */
    it('ActsOsAccountGetOsAccountDomainInfo_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountGetOsAccountDomainInfo_0700 start====");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["os_account_permission1"]
        }
        hilog.info(0x0000, tag, "====>GetOsAccountDomainInfo_0700 createSubscriber");
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data: commonEventManager.CommonEventSubscriber | null) => {
          let subscriber: commonEventManager.CommonEventSubscriber | undefined;
          if (data) {
            subscriber = data;
          }
          hilog.info(0x0000, tag, "====>GetOsAccountDomainInfo_0700 subscribe start");
          commonEventManager.subscribe(subscriber!, (err: BusinessError<void> | null, data: commonEventManager.CommonEventData | undefined): void => {
            hilog.info(0x0000, tag, "====>GetDomainInfo_0700 subscriberCallback data: " + JSON.stringify(data));
            try {
              if (data) {
                expect(data?.event).assertEqual("os_account_permission1");
                expect(data?.data).assertEqual('201');
              } else {
                hilog.info(0x0000, tag, '====>subscribe fail');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            commonEventManager.unsubscribe(subscriber!, (err: BusinessError<void> | null, data: undefined): void => {
              hilog.info(0x0000, tag, "====>GetOsAccountDomainInfo_0700 unsubscribe err: " + JSON.stringify(err));
              Utils.msSleep(500).then(() => {
                done();
              });
            });
          });
        });
        let wantInfo: Want = {
          bundleName: "com.acts.osaccountassistappone",
          abilityName: "com.acts.osaccountassistappone.MainAbility"
        }
        hilog.info(0x0000, tag, "====>startAbilityForResult start");
        gContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
        if (gContext) {
          gContext.startAbility(wantInfo, (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>GetOsAccountDomainInfo_0700 startAbility success");
          });
        } else {
          hilog.error(0x0000, tag, '====>context is undefined====');
        }
      });

    /**
    * @tc.number   ActsOsAccountGetOsAccountDomainInfo_0800
    * @tc.name     ActsOsAccountGetOsAccountDomainInfo_0800
    * @tc.desc     Gets the domain account information associated with the specified OS account.
    * @tc.type     FUNCTION
    * @tc.size     MEDIUMTEST
    * @tc.level    LEVEL3
    */
    it('ActsOsAccountGetOsAccountDomainInfo_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountGetOsAccountDomainInfo_0800 start====");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["os_account_permission2"]
        }
        hilog.info(0x0000, tag, "====>GetOsAccountDomainInfo_0800 createSubscriber");
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data: commonEventManager.CommonEventSubscriber | null) => {
          let subscriber: commonEventManager.CommonEventSubscriber | undefined;
          if (data) {
            subscriber = data;
          }
          hilog.info(0x0000, tag, "====>GetOsAccountDomainInfo_0800 subscribe start");
          commonEventManager.subscribe(subscriber!, (err: BusinessError<void> | null, data: commonEventManager.CommonEventData | undefined): void => {
            hilog.info(0x0000, tag, "====>GetDomainInfo_0800 subscriberCallback data: " + JSON.stringify(data));
            try {
              if (data) {
                expect(data?.event).assertEqual("os_account_permission2");
                expect(data?.data).assertEqual('201');
              } else {
                hilog.info(0x0000, tag, '====>subscribe fail');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            commonEventManager.unsubscribe(subscriber!, (err: BusinessError<void> | null, data: undefined): void => {
              hilog.info(0x0000, tag, "====>GetOsAccountDomainInfo_0800 unsubscribe err: " + JSON.stringify(err));
              Utils.msSleep(500).then(() => {
                done();
              });
            });
          });
        });
        let wantInfo: Want = {
          bundleName: "com.acts.osaccountassistapptwo",
          abilityName: "com.acts.osaccountassistapptwo.MainAbility"
        }
        hilog.info(0x0000, tag, "====>startAbilityForResult start");
        gContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
        if (gContext) {
          gContext.startAbility(wantInfo, (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>GetOsAccountDomainInfo_0800 startAbility success");
          });
        } else {
          hilog.error(0x0000, tag, '====>context is undefined====');
        }
      });

    /**
    * @tc.number     OsAccountParamCheck_1300
    * @tc.name       OsAccountParamCheck_1300
    * @tc.desc       check 12300003 The old account not found
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('OsAccountParamCheck_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>OsAccountParamCheck_1300 ";
        hilog.info(0x0000, tag, logTag + "start====");
        let key: string = '';
        let oldDomainInfo: osAccount.DomainAccountInfo = {
          domain: 'testDomain',
          accountName: key
        };
        let newDomainInfo: osAccount.DomainAccountInfo = {
          domain: 'testDomain',
          accountName: 'newTestAccountName'
        };
        try {
          hilog.info(0x0000, tag, logTag + "start updateAccountInfo");
          await osAccount.DomainAccountManager.updateAccountInfo(oldDomainInfo, newDomainInfo);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          if (err.code == 801) {
            hilog.info(0x0000, tag, logTag + "Current device not support API: updateAccountInfo");
          } else {
            expect(err.code).assertEqual(12300003);
          }
          done();
        }
      });

    /**
    * @tc.number     OsAccountParamCheck_1400
    * @tc.name       OsAccountParamCheck_1400
    * @tc.desc       check 12300003 Invalid server config parameters
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('OsAccountParamCheck_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>OsAccountParamCheck_1400 ";
        await getNameLimit();
        hilog.info(0x0000, tag, logTag + "start====");
        let key: string = '';
        for (let i: int = 0; i < nameLimit + 1; i++) {
          key += 'i';
        }
        let oldDomainInfo: osAccount.DomainAccountInfo = {
          domain: 'testDomain',
          accountName: key
        };
        let newDomainInfo: osAccount.DomainAccountInfo = {
          domain: 'testDomain',
          accountName: 'newTestAccountName'
        };
        try {
          hilog.info(0x0000, tag, logTag + "start updateAccountInfo");
          await osAccount.DomainAccountManager.updateAccountInfo(oldDomainInfo, newDomainInfo);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          if (err.code == 801) {
            hilog.info(0x0000, tag, logTag + "Current device not support API: updateAccountInfo");
          } else {
            expect(err.code).assertEqual(12300003);
          }
          done();
        }
      });

    /**
    * @tc.number     OsAccountParamCheck_1500
    * @tc.name       OsAccountParamCheck_1500
    * @tc.desc       check 12300003 The old account not found
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('OsAccountParamCheck_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>OsAccountParamCheck_1500 ";
        hilog.info(0x0000, tag, logTag + "start====");
        let key: string = '';
        let oldDomainInfo: osAccount.DomainAccountInfo = {
          domain: key,
          accountName: 'testAccount'
        };
        let newDomainInfo: osAccount.DomainAccountInfo = {
          domain: 'testDomain',
          accountName: 'newTestAccountName'
        };
        try {
          hilog.info(0x0000, tag, logTag + "start updateAccountInfo");
          await osAccount.DomainAccountManager.updateAccountInfo(oldDomainInfo, newDomainInfo);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          if (err.code == 801) {
            hilog.info(0x0000, tag, logTag + "Current device not support API: updateAccountInfo");
          } else {
            expect(err.code).assertEqual(12300003);
          }
          done();
        }
      });

    /**
    * @tc.number     OsAccountParamCheck_1600
    * @tc.name       OsAccountParamCheck_1600
    * @tc.desc       check 12300002 Invalid server config parameters
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('OsAccountParamCheck_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>OsAccountParamCheck_1600 ";
        hilog.info(0x0000, tag, logTag + "start====");
        let key: string = '';
        for (let i: int = 0; i < 129; i++) {
          key += 'i';
        }
        let oldDomainInfo: osAccount.DomainAccountInfo = {
          domain: key,
          accountName: 'testAccount'
        };
        let newDomainInfo: osAccount.DomainAccountInfo = {
          domain: 'testDomain',
          accountName: 'newTestAccountName'
        };
        try {
          hilog.info(0x0000, tag, logTag + "start updateAccountInfo");
          await osAccount.DomainAccountManager.updateAccountInfo(oldDomainInfo, newDomainInfo);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          if (err.code == 801) {
            hilog.info(0x0000, tag, logTag + "Current device not support API: updateAccountInfo");
          } else {
            expect(err.code).assertEqual(12300003);
          }
          done();
        }
      });

    /**
    * @tc.number     OsAccountParamCheck_1700
    * @tc.name       OsAccountParamCheck_1700
    * @tc.desc       check 12300002 Invalid server config parameters
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('OsAccountParamCheck_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>OsAccountParamCheck_1700 ";
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
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          if (err.code == 801) {
            hilog.info(0x0000, tag, logTag + "Current device not support API: addServerConfig");
          } else {
            expect(err.code).assertEqual(12300002);
          }
          done();
        }
      });

    /**
    * @tc.number     OsAccountParamCheck_1800
    * @tc.name       OsAccountParamCheck_1800
    * @tc.desc       check 12300211 Server unreachable
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('OsAccountParamCheck_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>OsAccountParamCheck_1800 ";
        hilog.info(0x0000, tag, logTag + "start====");

        let adConfigData: Record<string, RecordData> = {
          'adDomain': 'test.example.com'
        }
        let pJson: Record<string, RecordData> = {
          'adConfig': adConfigData
        }
        let configParams: Record<string, RecordData> = {
          'accountName': '123456',
          'authServerName': 'CHINA',
          'parameters': pJson
        };
        try {
          hilog.info(0x0000, tag, logTag + "start addServerConfig");
          await osAccount.DomainServerConfigManager.addServerConfig(configParams);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          if (err.code == 801) {
            hilog.info(0x0000, tag, logTag + "Current device not support API: addServerConfig");
          } else {
            expect(err.code).assertEqual(12300211);
          }
          done();
        }
      });

    /**
    * @tc.number     OsAccountParamCheck_1900
    * @tc.name       OsAccountParamCheck_1900
    * @tc.desc       check 12300211 Server unreachable
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('OsAccountParamCheck_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>OsAccountParamCheck_1900 ";
        hilog.info(0x0000, tag, logTag + "start====");

        let ldapConfigData: Record<string, RecordData> = {
          'authServerAddress': 'test.example.com',
          'authenProtocol': 'GSSAPI/Kerberos',
          'kdcAddress': 'test.example.com',
          'accountIdAttributeName': 'fakeId',
          'accountNameAttributeName': 'fakeAccountName',
          'ldapPort': '389',
          'baseDN': ''
        }
        let pJson: Record<string, RecordData> = {
          'ldapConfig': ldapConfigData
        }
        let configParams: Record<string, RecordData> = {
          'accountName': '123456',
          'authServerName': 'CHINA',
          'parameters': pJson
        };
        try {
          hilog.info(0x0000, tag, logTag + "start addServerConfig");
          await osAccount.DomainServerConfigManager.addServerConfig(configParams);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          if (err.code == 801) {
            hilog.info(0x0000, tag, logTag + "Current device not support API: addServerConfig");
          } else {
            expect(err.code).assertEqual(12300211);
          }
          done();
        }
      });

    /**
    * @tc.number     OsAccountParamCheck_2000
    * @tc.name       OsAccountParamCheck_2000
    * @tc.desc       DomainServerConfigManager api test
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL0
    */
    it('OsAccountParamCheck_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>OsAccountParamCheck_2000 ";
        hilog.info(0x0000, tag, logTag + "start====");

        let oauthConfig: Record<string, RecordData> = {
          'userAuthenRequestUri': 'https://www.test.com/login',
          'authorizationRequestUri': 'https://www.test.com/login',
          'tokenRequestUri': 'https://www.test.com/fortest',
          'userInfoRequestUri': 'https://www.test.com/fortest',
          'clientId': 'www.test.com.iamclient',
          'clientSecret': '123',
          'scope': 'base.profile',
          'accountIdAttributeName': 'fakeId',
          'accountNameAttributeName': 'fakeAccountName'
        }
        let iDaasConfig: Record<string, RecordData> = {
          'authProtocol': 'OAuth 2.0',
          'oauthConfig': oauthConfig,
        }
        let map: Record<string, RecordData> = {
          'serverType': 'IDass',
          'idaasConfig': iDaasConfig
        }
        let configParams: Record<string, RecordData> = {
          'accountName': '123456',
          'authServerName': 'CHINA',
          'parameters': map
        };
        let fakeConfigParams: Record<string, RecordData> = {
          'uri': 'test.example.com',
          'port': 100
        };
        let adConfigData: Record<string, RecordData> = {
          'adDomain': 'www.test.com'
        }
        let pJson: Record<string, RecordData> = {
          'adConfig': adConfigData
        }
        let configParams1: Record<string, RecordData> = {
          'accountName': '123456',
          'authServerName': 'CHINA',
          'parameters': pJson
        };
        try {
          hilog.info(0x0000, tag, logTag + "start addServerConfig");
          let configInfo1 = await osAccount.DomainServerConfigManager.addServerConfig(configParams);
          hilog.info(0x0000, tag, logTag + "addServerConfig config: " + JSON.stringify(configInfo1));
          let configArrays = await osAccount.DomainServerConfigManager.getAllServerConfigs();
          hilog.info(0x0000, tag, logTag + "getAllServerConfigs Array length: " + JSON.stringify(configArrays.length));
          hilog.info(0x0000, tag, logTag + "getAllServerConfigs id0 is: " + JSON.stringify(configArrays[0].id));
          let configInfo12 = await osAccount.DomainServerConfigManager.addServerConfig(configParams1);
          hilog.info(0x0000, tag, logTag + "addServerConfig config: " + JSON.stringify(configInfo12));
          let configInfo2 = await osAccount.DomainServerConfigManager.getServerConfig(configArrays[0].id);
          hilog.info(0x0000, tag, logTag + "getServerConfig config: " + JSON.stringify(configInfo2));
          try {
            hilog.info(0x0000, tag, logTag + "start addServerConfig again");
            await osAccount.DomainServerConfigManager.addServerConfig(configParams);
            hilog.info(0x0000, tag, logTag + "addServerConfig success, but should not succeed");
            expect().assertFail();
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
            expect(err.code).assertEqual(12300213);
          }
          try {
            hilog.info(0x0000, tag, logTag + "start updateServerConfig fake params");
            await osAccount.DomainServerConfigManager.updateServerConfig(configArrays[0].id, fakeConfigParams);
            hilog.info(0x0000, tag, logTag + "updateServerConfig success, but should not succeed");
            expect().assertFail();
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
            expect(err.code).assertEqual(12300002);
          }
          adConfigData['adDomain'] = 'test.example.com';
          hilog.info(0x0000, tag, logTag + "adConfigData1: " + JSON.stringify(adConfigData));
          try {
            hilog.info(0x0000, tag, logTag + "start updateServerConfig unreachable");
            await osAccount.DomainServerConfigManager.updateServerConfig(configArrays[0].id, configParams1);
            hilog.info(0x0000, tag, logTag + "updateServerConfig success, but should not succeed");
            expect().assertFail();
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
            expect(err.code).assertEqual(12300211);
          }
          try {
            hilog.info(0x0000, tag, logTag + "start updateServerConfig success");
            await osAccount.DomainServerConfigManager.updateServerConfig(configArrays[0].id, configParams);
            hilog.info(0x0000, tag, logTag + "updateServerConfig success");
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
            expect().assertFail();
          }
          adConfigData['adDomain'] = 'www.test.com';
          hilog.info(0x0000, tag, logTag + "adConfigData2: " + JSON.stringify(adConfigData));
          try {
            hilog.info(0x0000, tag, logTag + "start updateServerConfig already exist");
            await osAccount.DomainServerConfigManager.updateServerConfig(configArrays[0].id, configParams1);
            hilog.info(0x0000, tag, logTag + "updateServerConfig success, but should not succeed");
            expect().assertFail();
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
            expect(err.code).assertEqual(12300213);
          }
          let configArray = await osAccount.DomainServerConfigManager.getAllServerConfigs();
          hilog.info(0x0000, tag, logTag + "getAllServerConfigs configArray: " + JSON.stringify(configArray));
          for (let i = 0; i < configArray.length; i++) {
            hilog.info(0x0000, tag, logTag + "start configArray: " + JSON.stringify(configArray));
            await osAccount.DomainServerConfigManager.removeServerConfig(configArray[i].id);
          }
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          if (err.code == 801) {
            hilog.info(0x0000, tag, logTag + "Current device not support API: addServerConfig");
          } else {
            expect(err.code).assertEqual(12300211);
          }
          done();
        }
      });

    /**
    * @tc.number     OsAccountParamCheck_2100
    * @tc.name       OsAccountParamCheck_2100
    * @tc.desc       check 12300212 Server config not found
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('OsAccountParamCheck_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>OsAccountParamCheck_2100 ";
        hilog.info(0x0000, tag, logTag + "start====");
        let configId: string = '';
        for (let i: int = 0; i < 513; i++) {
          configId += 'i';
        }
        try {
          hilog.info(0x0000, tag, logTag + "start removeServerConfig");
          await osAccount.DomainServerConfigManager.removeServerConfig(configId);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          if (err.code == 801) {
            hilog.info(0x0000, tag, logTag + "Current device not support API: removeServerConfig");
          } else {
            expect(err.code).assertEqual(12300212);
          }
          done();
        }
      });

    /**
    * @tc.number     OsAccountParamCheck_2200
    * @tc.name       OsAccountParamCheck_2200
    * @tc.desc       check 12300212 Server config not found
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('OsAccountParamCheck_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>OsAccountParamCheck_2200 ";
        hilog.info(0x0000, tag, logTag + "start====");
        let serverConfigId: string = '';
        for (let i: int = 0; i < 512; i++) {
          serverConfigId += 'i';
        }
        let configParams: Record<string, RecordData> = {
          'uri': 'test.example.com',
          'port': 100
        };
        try {
          hilog.info(0x0000, tag, logTag + "start updateServerConfig");
          await osAccount.DomainServerConfigManager.updateServerConfig(serverConfigId, configParams);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          if (err.code == 801) {
            hilog.info(0x0000, tag, logTag + "Current device not support API: updateServerConfig");
          } else {
            expect(err.code).assertEqual(12300212);
          }
          done();
        }
      });

    /**
    * @tc.number     OsAccountParamCheck_2300
    * @tc.name       OsAccountParamCheck_2300
    * @tc.desc       check 12300212 Invalid server config parameters
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('OsAccountParamCheck_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>OsAccountParamCheck_2300 ";
        hilog.info(0x0000, tag, logTag + "start====");
        let serverConfigId: string = '';
        for (let i: int = 0; i < 513; i++) {
          serverConfigId += 'i';
        }
        let configParams: Record<string, RecordData> = {
          'uri': 'test.example.com',
          'port': 100
        };
        try {
          hilog.info(0x0000, tag, logTag + "start updateServerConfig");
          await osAccount.DomainServerConfigManager.updateServerConfig(serverConfigId, configParams);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          if (err.code == 801) {
            hilog.info(0x0000, tag, logTag + "Current device not support API: updateServerConfig");
          } else {
            expect(err.code).assertEqual(12300212);
          }
          done();
        }
      });

    /**
    * @tc.number     OsAccountParamCheck_2400
    * @tc.name       OsAccountParamCheck_2400
    * @tc.desc       check 12300212 Invalid server config parameters
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('OsAccountParamCheck_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>OsAccountParamCheck_2400 ";
        hilog.info(0x0000, tag, logTag + "start====");
        let serverConfigId: string = '';
        let configParams: Record<string, RecordData> = {
          'uri': 'test.example.com',
          'port': 100
        };
        try {
          hilog.info(0x0000, tag, logTag + "start updateServerConfig");
          await osAccount.DomainServerConfigManager.updateServerConfig(serverConfigId, configParams);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          if (err.code == 801) {
            hilog.info(0x0000, tag, logTag + "Current device not support API: updateServerConfig");
          } else {
            expect(err.code).assertEqual(12300212);
          }
          done();
        }
      });

    /**
    * @tc.number     OsAccountParamCheck_2500
    * @tc.name       OsAccountParamCheck_2500
    * @tc.desc       check 12300212 Server config not found
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('OsAccountParamCheck_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>OsAccountParamCheck_2500 ";
        hilog.info(0x0000, tag, logTag + "start====");
        let configId: string = '';
        for (let i: int = 0; i < 513; i++) {
          configId += 'i';
        }
        try {
          hilog.info(0x0000, tag, logTag + "start getServerConfig");
          await osAccount.DomainServerConfigManager.getServerConfig(configId);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          if (err.code == 801) {
            hilog.info(0x0000, tag, logTag + "Current device not support API: getServerConfig");
          } else {
            expect(err.code).assertEqual(12300212);
          }
          done();
        }
      });

    /**
    * @tc.number     OsAccountParamCheck_2600
    * @tc.name       OsAccountParamCheck_2600
    * @tc.desc       check 12300003 Domain account not found
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('OsAccountParamCheck_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>OsAccountParamCheck_2600 ";
        await getNameLimit();
        hilog.info(0x0000, tag, logTag + "start====");
        let key: string = '';
        for (let i: int = 0; i < nameLimit + 1; i++) {
          key += 'i';
        }
        let accountInfo: osAccount.DomainAccountInfo = {
          accountName: key,
          domain: 'demoDomain',
          serverConfigId: 'testServerConfigId'
        };
        try {
          hilog.info(0x0000, tag, logTag + "start getAccountServerConfig");
          await osAccount.DomainServerConfigManager.getAccountServerConfig(accountInfo);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          if (err.code == 801) {
            hilog.info(0x0000, tag, logTag + "Current device not support API: getAccountServerConfig");
          } else {
            expect(err.code).assertEqual(12300003);
          }
          done();
        }
      });

    /**
    * @tc.number     OsAccountParamCheck_2700
    * @tc.name       OsAccountParamCheck_2700
    * @tc.desc       check 12300003 Domain account not found
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('OsAccountParamCheck_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>OsAccountParamCheck_2700 ";
        await getNameLimit();
        hilog.info(0x0000, tag, logTag + "start====");
        let key: string = '****';
        let accountInfo: osAccount.DomainAccountInfo = {
          accountName: key,
          domain: 'demoDomain',
          serverConfigId: 'testServerConfigId'
        };
        try {
          hilog.info(0x0000, tag, logTag + "start getAccountServerConfig");
          await osAccount.DomainServerConfigManager.getAccountServerConfig(accountInfo);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          if (err.code == 801) {
            hilog.info(0x0000, tag, logTag + "Current device not support API: getAccountServerConfig");
          } else {
            expect(err.code).assertEqual(12300003);
          }
          done();
        }
      });

    /**
    * @tc.number     OsAccountParamCheck_2800
    * @tc.name       OsAccountParamCheck_2800
    * @tc.desc       check 12300003 Domain account not found
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('OsAccountParamCheck_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>OsAccountParamCheck_2800 ";
        hilog.info(0x0000, tag, logTag + "start====");
        let key: string = '';
        for (let i: int = 0; i < 128 + 1; i++) {
          key += 'i';
        }
        let accountInfo: osAccount.DomainAccountInfo = {
          accountName: "demoName",
          domain: key,
          serverConfigId: 'testServerConfigId'
        };
        try {
          hilog.info(0x0000, tag, logTag + "start getAccountServerConfig");
          await osAccount.DomainServerConfigManager.getAccountServerConfig(accountInfo);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          if (err.code == 801) {
            hilog.info(0x0000, tag, logTag + "Current device not support API: getAccountServerConfig");
          } else {
            expect(err.code).assertEqual(12300003);
          }
          done();
        }
      });

    /**
    * @tc.number     OsAccountParamCheck_2900
    * @tc.name       OsAccountParamCheck_2900
    * @tc.desc       check 12300003 Domain account not found
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('OsAccountParamCheck_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>OsAccountParamCheck_2900 ";
        hilog.info(0x0000, tag, logTag + "start====");
        let key: string = '###### ';
        let accountInfo: osAccount.DomainAccountInfo = {
          accountName: "demoName",
          domain: key,
          serverConfigId: 'testServerConfigId'
        };
        try {
          hilog.info(0x0000, tag, logTag + "start getAccountServerConfig");
          await osAccount.DomainServerConfigManager.getAccountServerConfig(accountInfo);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          if (err.code == 801) {
            hilog.info(0x0000, tag, logTag + "Current device not support API: getAccountServerConfig");
          } else {
            expect(err.code).assertEqual(12300003);
          }
          done();
        }
      });

    /**
    * @tc.number     OsAccountParamCheck_3000
    * @tc.name       OsAccountParamCheck_3000
    * @tc.desc       check 12300003 Domain account not found
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('OsAccountParamCheck_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>OsAccountParamCheck_3000 ";
        hilog.info(0x0000, tag, logTag + "start====");
        let key: string = '';
        for (let i: int = 0; i < 512 + 1; i++) {
          key += 'i';
        }
        let accountInfo: osAccount.DomainAccountInfo = {
          accountName: "demoName",
          domain: 'demoDomain',
          serverConfigId: key
        };
        try {
          hilog.info(0x0000, tag, logTag + "start getAccountServerConfig");
          await osAccount.DomainServerConfigManager.getAccountServerConfig(accountInfo);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          if (err.code == 801) {
            hilog.info(0x0000, tag, logTag + "Current device not support API: getAccountServerConfig");
          } else {
            expect(err.code).assertEqual(12300003);
          }
          done();
        }
      });

    /**
    * @tc.number     OsAccountParamCheck_3100
    * @tc.name       OsAccountParamCheck_3100
    * @tc.desc       check 12300003 Domain account not found
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('OsAccountParamCheck_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>OsAccountParamCheck_3100 ";
        hilog.info(0x0000, tag, logTag + "start====");
        let key: string = '';
        let accountInfo: osAccount.DomainAccountInfo = {
          accountName: "demoName",
          domain: 'demoDomain',
          serverConfigId: key
        };
        try {
          hilog.info(0x0000, tag, logTag + "start getAccountServerConfig");
          await osAccount.DomainServerConfigManager.getAccountServerConfig(accountInfo);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          if (err.code == 801) {
            hilog.info(0x0000, tag, logTag + "Current device not support API: getAccountServerConfig");
          } else {
            expect(err.code).assertEqual(12300003);
          }
          done();
        }
      });
  });
}
