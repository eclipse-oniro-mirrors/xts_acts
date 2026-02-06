/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { BusinessError } from '@ohos.base'
import Want from '@ohos.app.ability.Want';
import deviceInfo from '@ohos.deviceInfo';
import { Driver, ON } from '@ohos.UiTest'
import parameter from '@ohos.systemParameterEnhance'

let driver = Driver.create();
let nameLimit = -1

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok");
    }, time)
  });
}

let getNameLimit = async () => {
  try {
    let login_max_max: string = parameter.getSync("persist.account.login_name_max");
    nameLimit = Number(login_max_max);
    console.info("====>parameter.getSync login_name_max: " + JSON.stringify(nameLimit));
  } catch (err) {
    console.info("====>parameter.getSync catch err: " + JSON.stringify(err));
  }
}

let deviceType = deviceInfo.deviceType;
console.info("====>the value of the deviceinfo deviceType is: " + deviceType);

export default function ActsOsAccountTest() {
  describe('ActsOsAccountTest', () => {

    /**
     * @tc.name   ActsOsAccountGetForegroundOsAccountLocalId_0100
     * @tc.number ActsOsAccountGetForegroundOsAccountLocalId_0100
     * @tc.desc   Gets the local ID of the foreground OS account.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsOsAccountGetForegroundOsAccountLocalId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info("====>ActsOsAccountGetForegroundOsAccountLocalId_0100 start====");
      let accountManager: osAccount.AccountManager = osAccount.getAccountManager();
      console.info("====>get os AccountManager finish====");
      try {
        let localId: number = await accountManager.getForegroundOsAccountLocalId();
        console.info("====>ActsOsAccountGetForegroundOsAccountLocalId_0100 localId: " + localId);
        expect(localId).assertEqual(100);
        console.info("====>ActsOsAccountGetForegroundOsAccountLocalId_0100 end====");
        done();
      } catch (err) {
        console.info("====>ActsOsAccountGetForegroundOsAccountLocalId_0100 catch err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        done();
      }
    });

    /**
     * @tc.name   ActsOsAccountGetOsAccountDomainInfo_0100
     * @tc.number ActsOsAccountGetOsAccountDomainInfo_0100
     * @tc.desc   Gets the domain account information associated with the specified OS account.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountGetOsAccountDomainInfo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      console.info("====>ActsOsAccountGetOsAccountDomainInfo_0100 start====");
      let accountManager: osAccount.AccountManager = osAccount.getAccountManager();
      console.info("====>get os AccountManager finish====");
      try {
        let domainInfo: osAccount.DomainAccountInfo = await accountManager.getOsAccountDomainInfo(null);
        console.info("====>ActsOsAccountGetOsAccountDomainInfo_0100 domainInfo: " + domainInfo);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>ActsOsAccountGetOsAccountDomainInfo_0100 catch err:" + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        console.info("====>ActsOsAccountGetOsAccountDomainInfo_0100 end====");
        done();
      }
    });

    /**
     * @tc.name   ActsOsAccountGetOsAccountDomainInfo_0200
     * @tc.number ActsOsAccountGetOsAccountDomainInfo_0200
     * @tc.desc   Gets the domain account information associated with the specified OS account.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountGetOsAccountDomainInfo_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      console.info("====>ActsOsAccountGetOsAccountDomainInfo_0200 start====");
      let accountManager: osAccount.AccountManager = osAccount.getAccountManager();
      console.info("====>get os AccountManager finish====");
      try {
        let domainInfo: osAccount.DomainAccountInfo = await accountManager.getOsAccountDomainInfo(undefined);
        console.info("====>ActsOsAccountGetOsAccountDomainInfo_0200 domainInfo: " + domainInfo);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>ActsOsAccountGetOsAccountDomainInfo_0200 catch err:" + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        console.info("====>ActsOsAccountGetOsAccountDomainInfo_0200 end====");
        done();
      }
    });


    /**
     * @tc.name   ActsOsAccountGetOsAccountDomainInfo_0300
     * @tc.number ActsOsAccountGetOsAccountDomainInfo_0300
     * @tc.desc   Gets the domain account information associated with the specified OS account.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountGetOsAccountDomainInfo_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      console.info("====>ActsOsAccountGetOsAccountDomainInfo_0300 start====");
      let accountManager: osAccount.AccountManager = osAccount.getAccountManager();
      console.info("====>get os AccountManager finish====");
      try {
        let domainInfo: osAccount.DomainAccountInfo = await accountManager.getOsAccountDomainInfo(-1);
        console.info("====>ActsOsAccountGetOsAccountDomainInfo_0300 domainInfo: " + domainInfo);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>ActsOsAccountGetOsAccountDomainInfo_0300 catch err:" + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        console.info("====>ActsOsAccountGetOsAccountDomainInfo_0300 end====");
        done();
      }
    });

    /**
     * @tc.name   ActsOsAccountGetOsAccountDomainInfo_0400
     * @tc.number ActsOsAccountGetOsAccountDomainInfo_0400
     * @tc.desc   Gets the domain account information associated with the specified OS account.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountGetOsAccountDomainInfo_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      console.info("====>ActsOsAccountGetOsAccountDomainInfo_0400 start====");
      let accountManager: osAccount.AccountManager = osAccount.getAccountManager();
      console.info("====>get os AccountManager finish====");
      try {
        let domainInfo: osAccount.DomainAccountInfo = await accountManager.getOsAccountDomainInfo(100000);
        console.info("====>ActsOsAccountGetOsAccountDomainInfo_0400 domainInfo: " + domainInfo);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>ActsOsAccountGetOsAccountDomainInfo_0400 catch err:" + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        console.info("====>ActsOsAccountGetOsAccountDomainInfo_0400 end====");
        done();
      }
    });

    /**
     * @tc.name   ActsOsAccountGetOsAccountDomainInfo_0500
     * @tc.number ActsOsAccountGetOsAccountDomainInfo_0500
     * @tc.desc   Gets the domain account information associated with the specified OS account.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsOsAccountGetOsAccountDomainInfo_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info("====>ActsOsAccountGetOsAccountDomainInfo_0500 start====");
      let accountManager: osAccount.AccountManager = osAccount.getAccountManager();
      console.info("====>get os AccountManager finish====");
      try {
        let domainInfo: osAccount.DomainAccountInfo = await accountManager.getOsAccountDomainInfo(0);
        console.info("====>ActsOsAccountGetOsAccountDomainInfo_0500 domainInfo: " + domainInfo);
        expect(domainInfo == null).assertTrue();
        console.info("====>ActsOsAccountGetOsAccountDomainInfo_0500 end====");
        done();
      } catch (err) {
        console.info("====>ActsOsAccountGetOsAccountDomainInfo_0500 catch err:" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ActsOsAccountGetOsAccountDomainInfo_0600
     * @tc.number ActsOsAccountGetOsAccountDomainInfo_0600
     * @tc.desc   Gets the domain account information associated with the specified OS account.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsOsAccountGetOsAccountDomainInfo_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info("====>ActsOsAccountGetOsAccountDomainInfo_0600 start====");
      let accountManager: osAccount.AccountManager = osAccount.getAccountManager();
      console.info("====>get os AccountManager finish====");
      try {
        let domainInfo: osAccount.DomainAccountInfo = await accountManager.getOsAccountDomainInfo(100);
        console.info("====>ActsOsAccountGetOsAccountDomainInfo_0600 domainInfo: " + domainInfo);
        expect(domainInfo == null).assertTrue();
        console.info("====>ActsOsAccountGetOsAccountDomainInfo_0600 end====");
        done();
      } catch (err) {
        console.info("====>ActsOsAccountGetOsAccountDomainInfo_0600 catch err:" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ActsOsAccountGetOsAccountDomainInfo_0700
     * @tc.number ActsOsAccountGetOsAccountDomainInfo_0700
     * @tc.desc   Gets the domain account information associated with the specified OS account.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountGetOsAccountDomainInfo_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      console.info("====>ActsOsAccountGetOsAccountDomainInfo_0700 start====");
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["os_account_permission1"]
      }
      console.info("====>ActsOsAccountGetOsAccountDomainInfo_0700 createSubscriber");
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        let subscriber: commonEventManager.CommonEventSubscriber = data;
        console.info("====>ActsOsAccountGetOsAccountDomainInfo_0700 subscribe start");
        commonEventManager.subscribe(subscriber, (err, data) => {
          console.info("====>ActsOsAccountGetOsAccountDomainInfo_0700 subscriberCallback data: " +
          JSON.stringify(data));
          try {
            expect(data.event).assertEqual("os_account_permission1");
            expect(Number(data.data)).assertEqual(201);
          } catch (err) {
            console.info("====>Assert Fail: " + JSON.stringify(err));
          }
          commonEventManager.unsubscribe(subscriber, async (err) => {
            console.info("====>ActsOsAccountGetOsAccountDomainInfo_0700 unsubscribe err:" + JSON.stringify(err));
            await sleep(500);
            done()
          });
        });
      })
      let wantInfo: Want = {
        bundleName: "com.acts.osaccountassistappone",
        abilityName: "com.acts.osaccountassistappone.MainAbility"
      }
      await globalThis.abilityContext.startAbility(wantInfo);
      try {
        console.info("====>ActsOsAccountGetOsAccountDomainInfo_0700 start findComponent");
        let allowed = await driver.findComponent(ON.text("允许"));
        let allowed1 = await driver.findComponent(ON.text("本次允许"));
        if (allowed != undefined && allowed != null) {
          await allowed.click();
          console.info("====>ActsOsAccountGetOsAccountDomainInfo_0700 click allowed");
        } else if (allowed1 != undefined && allowed1 != null) {
          await allowed1.click();
          console.info("====>ActsOsAccountGetOsAccountDomainInfo_0700 click allowed1");
        }
      } catch (err) {
        console.info("====>click button err:" + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   ActsOsAccountGetOsAccountDomainInfo_0800
     * @tc.number ActsOsAccountGetOsAccountDomainInfo_0800
     * @tc.desc   Gets the domain account information associated with the specified OS account.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountGetOsAccountDomainInfo_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      console.info("====>ActsOsAccountGetOsAccountDomainInfo_0800 start====");
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["os_account_permission2"]
      }
      console.info("====>ActsOsAccountGetOsAccountDomainInfo_0800 createSubscriber");
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        let subscriber: commonEventManager.CommonEventSubscriber = data;
        console.info("====>ActsOsAccountGetOsAccountDomainInfo_0800 subscribe start");
        commonEventManager.subscribe(subscriber, (err, data) => {
          console.info("====>ActsOsAccountGetOsAccountDomainInfo_0800 subscriberCallback data: " +
          JSON.stringify(data));
          try {
            expect(data.event).assertEqual("os_account_permission2");
            expect(Number(data.data)).assertEqual(201);
          } catch (err) {
            console.info("====>Assert Fail: " + JSON.stringify(err));
          }
          commonEventManager.unsubscribe(subscriber, async (err) => {
            console.info("====>ActsOsAccountGetOsAccountDomainInfo_0800 unsubscribe err:" + JSON.stringify(err));
            await sleep(500);
            done()
          });
        });
      })
      let wantInfo: Want = {
        bundleName: "com.acts.osaccountassistapptwo",
        abilityName: "com.acts.osaccountassistapptwo.MainAbility"
      }
      await globalThis.abilityContext.startAbility(wantInfo);
      try {
        console.info("====>ActsOsAccountGetOsAccountDomainInfo_0800 start findComponent");
        let allowed = await driver.findComponent(ON.text("允许"));
        let allowed1 = await driver.findComponent(ON.text("本次允许"));
        if (allowed != undefined && allowed != null) {
          await allowed.click();
          console.info("====>ActsOsAccountGetOsAccountDomainInfo_0700 click allowed");
        } else if (allowed1 != undefined && allowed1 != null) {
          await allowed1.click();
          console.info("====>ActsOsAccountGetOsAccountDomainInfo_0700 click allowed1");
        }
      } catch (err) {
        console.info("====>click button err:" + JSON.stringify(err));
      }
    });
    
    /**
     * @tc.name   OsAccountParamCheck_0100
     * @tc.number OsAccountParamCheck_0100
     * @tc.desc   401 param check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_0100 ";
      console.info(tag + "start====");
      try {
        console.info(tag + "start updateAccountInfo");
        await osAccount.DomainAccountManager.updateAccountInfo(null, undefined);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: updateAccountInfo");
        } else {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_0200
     * @tc.number OsAccountParamCheck_0200
     * @tc.desc   401 param check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_0200 ";
      console.info(tag + "start====");
      try {
        console.info(tag + "start updateAccountInfo");
        await osAccount.DomainAccountManager.updateAccountInfo(undefined, null);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: updateAccountInfo");
        } else {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_0300
     * @tc.number OsAccountParamCheck_0300
     * @tc.desc   401 param check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_0300 ";
      console.info(tag + "start====");
      try {
        console.info(tag + "start addServerConfig");
        await osAccount.DomainServerConfigManager.addServerConfig(null);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: addServerConfig");
        } else {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_0400
     * @tc.number OsAccountParamCheck_0400
     * @tc.desc   401 param check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_0400 ";
      console.info(tag + "start====");
      try {
        console.info(tag + "start addServerConfig");
        await osAccount.DomainServerConfigManager.addServerConfig(undefined);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: addServerConfig");
        } else {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_0500
     * @tc.number OsAccountParamCheck_0500
     * @tc.desc   401 param check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_0500 ";
      console.info(tag + "start====");
      try {
        console.info(tag + "start removeServerConfig");
        await osAccount.DomainServerConfigManager.removeServerConfig(null);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: removeServerConfig");
        } else {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_0600
     * @tc.number OsAccountParamCheck_0600
     * @tc.desc   401 param check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_0600 ";
      console.info(tag + "start====");
      try {
        console.info(tag + "start removeServerConfig");
        await osAccount.DomainServerConfigManager.removeServerConfig(undefined);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: removeServerConfig");
        } else {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_0700
     * @tc.number OsAccountParamCheck_0700
     * @tc.desc   401 param check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_0700 ";
      console.info(tag + "start====");
      try {
        console.info(tag + "start updateServerConfig");
        await osAccount.DomainServerConfigManager.updateServerConfig(null, undefined);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: updateServerConfig");
        } else {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_0800
     * @tc.number OsAccountParamCheck_0800
     * @tc.desc   401 param check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_0800 ";
      console.info(tag + "start====");
      try {
        console.info(tag + "start updateServerConfig");
        await osAccount.DomainServerConfigManager.updateServerConfig(undefined, null);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: updateServerConfig");
        } else {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_0900
     * @tc.number OsAccountParamCheck_0900
     * @tc.desc   401 param check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_0900 ";
      console.info(tag + "start====");
      try {
        console.info(tag + "start getServerConfig");
        await osAccount.DomainServerConfigManager.getServerConfig(null);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: getServerConfig");
        } else {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_1000
     * @tc.number OsAccountParamCheck_1000
     * @tc.desc   401 param check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_1000 ";
      console.info(tag + "start====");
      try {
        console.info(tag + "start getServerConfig");
        await osAccount.DomainServerConfigManager.getServerConfig(undefined);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: getServerConfig");
        } else {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_1100
     * @tc.number OsAccountParamCheck_1100
     * @tc.desc   401 param check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_1100 ";
      console.info(tag + "start====");
      try {
        console.info(tag + "start getAccountServerConfig");
        await osAccount.DomainServerConfigManager.getAccountServerConfig(null);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: getAccountServerConfig");
        } else {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_1200
     * @tc.number OsAccountParamCheck_1200
     * @tc.desc   401 param check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_1200 ";
      console.info(tag + "start====");
      try {
        console.info(tag + "start getAccountServerConfig");
        await osAccount.DomainServerConfigManager.getAccountServerConfig(undefined);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: getAccountServerConfig");
        } else {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_1300
     * @tc.number OsAccountParamCheck_1300
     * @tc.desc   check 12300003 The old account not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_1300 ";
      console.info(tag + "start====");
      let key = '';
      let oldDomainInfo: osAccount.DomainAccountInfo = {
        domain: 'testDomain',
        accountName: key
      };
      let newDomainInfo: osAccount.DomainAccountInfo = {
        domain: 'testDomain',
        accountName: 'newTestAccountName'
      };
      try {
        console.info(tag + "start updateAccountInfo");
        await osAccount.DomainAccountManager.updateAccountInfo(oldDomainInfo, newDomainInfo);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: updateAccountInfo");
        } else {
          expect(err.code).assertEqual(12300003);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_1400
     * @tc.number OsAccountParamCheck_1400
     * @tc.desc   check 12300002 Invalid server config parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_1400 ";
      await getNameLimit();
      console.info(tag + "start====");
      let key = '';
      for (let i = 0; i < nameLimit + 1; i++) {
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
        console.info(tag + "start updateAccountInfo");
        await osAccount.DomainAccountManager.updateAccountInfo(oldDomainInfo, newDomainInfo);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: updateAccountInfo");
        } else {
          expect(err.code).assertEqual(12300003);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_1500
     * @tc.number OsAccountParamCheck_1500
     * @tc.desc   check 12300003 The old account not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_1500 ";
      console.info(tag + "start====");
      let key = '';
      let oldDomainInfo: osAccount.DomainAccountInfo = {
        domain: key,
        accountName: 'testAccount'
      };
      let newDomainInfo: osAccount.DomainAccountInfo = {
        domain: 'testDomain',
        accountName: 'newTestAccountName'
      };
      try {
        console.info(tag + "start updateAccountInfo");
        await osAccount.DomainAccountManager.updateAccountInfo(oldDomainInfo, newDomainInfo);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: updateAccountInfo");
        } else {
          expect(err.code).assertEqual(12300003);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_1600
     * @tc.number OsAccountParamCheck_1600
     * @tc.desc   check 12300002 Invalid server config parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_1600 ";
      console.info(tag + "start====");
      let key = '';
      for (let i = 0; i < 129; i++) {
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
        console.info(tag + "start updateAccountInfo");
        await osAccount.DomainAccountManager.updateAccountInfo(oldDomainInfo, newDomainInfo);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: updateAccountInfo");
        } else {
          expect(err.code).assertEqual(12300003);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_1700
     * @tc.number OsAccountParamCheck_1700
     * @tc.desc   check 12300002 Invalid server config parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_1700 ";
      console.info(tag + "start====");
      let configParams: Record<string, Object> = {
        'uri': 'test.example.com',
        'port': 100
      };
      try {
        console.info(tag + "start addServerConfig");
        await osAccount.DomainServerConfigManager.addServerConfig(configParams);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: addServerConfig");
        } else {
          expect(err.code).assertEqual(12300002);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_1800
     * @tc.number OsAccountParamCheck_1800
     * @tc.desc   check 12300211 Server unreachable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_1800 ";
      console.info(tag + "start====");
      interface AdConfig {
        adDomain: string
      }
      interface ParamJson {
        adConfig: AdConfig
      }
      let adConfigData: AdConfig = {
        adDomain: 'test.example.com'
      }
      let pJson: ParamJson = {
        adConfig: adConfigData
      }
      let configParams: Record<string, Object> = {
        'accountName': '123456',
        'authServerName': 'CHINA',
        'parameters': pJson
      };
      try {
        console.info(tag + "start addServerConfig");
        await osAccount.DomainServerConfigManager.addServerConfig(configParams);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: addServerConfig");
        } else {
          expect(err.code).assertEqual(12300211);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_1900
     * @tc.number OsAccountParamCheck_1900
     * @tc.desc   check 12300211 Server unreachable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_1900 ";
      console.info(tag + "start====");
      interface LDAPConfig {
        authServerAddress: string,
        authenProtocol: string,
        kdcAddress: string,
        accountIdAttributeName: string,
        accountNameAttributeName: string,
        ldapPort: string,
        baseDN: string
      }
      interface ParamJson {
        ldapConfig: LDAPConfig
      }
      let ldapConfigData: LDAPConfig = {
        authServerAddress: 'test.example.com',
        authenProtocol: 'GSSAPI/Kerberos',
        kdcAddress: 'test.example.com',
        accountIdAttributeName: 'fakeId',
        accountNameAttributeName: 'fakeAccountName',
        ldapPort: '389',
        baseDN: ''
      }
      let pJson: ParamJson = {
        ldapConfig: ldapConfigData
      }
      let configParams: Record<string, Object> = {
        'accountName': '123456',
        'authServerName': 'CHINA',
        'parameters': pJson
      };
      try {
        console.info(tag + "start addServerConfig");
        await osAccount.DomainServerConfigManager.addServerConfig(configParams);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: addServerConfig");
        } else {
          expect(err.code).assertEqual(12300211);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_2000
     * @tc.number OsAccountParamCheck_2000
     * @tc.desc   DomainServerConfigManager api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OsAccountParamCheck_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_2000 ";
      console.info(tag + "start====");
      interface OauthConfig {
        userAuthenRequestUri: string,
        authorizationRequestUri: string,
        tokenRequestUri: string,
        userInfoRequestUri: string,
        clientId: string,
        clientSecret: string,
        scope: string,
        accountIdAttributeName: string,
        accountNameAttributeName: string
      }
      interface IDaasConfig {
        authProtocol: string,
        oauthConfig: OauthConfig,
      }
      interface AdConfig {
        adDomain: string
      }
      interface ParamJson {
        adConfig: AdConfig
      }
      let oauthConfig: OauthConfig = {
        userAuthenRequestUri: 'https://www.test.com/login',
        authorizationRequestUri: 'https://www.test.com/login',
        tokenRequestUri: 'https://www.test.com/fortest',
        userInfoRequestUri: 'https://www.test.com/fortest',
        clientId: 'www.test.com.iamclient',
        clientSecret: '123',
        scope: 'base.profile',
        accountIdAttributeName: 'fakeId',
        accountNameAttributeName: 'fakeAccountName'
      }
      let iDaasConfig: IDaasConfig = {
        authProtocol: 'OAuth 2.0',
        oauthConfig: oauthConfig,
      }
      let map: Record<string, Object> = {
        'serverType': 'IDass',
        'idaasConfig': iDaasConfig
      }
      let configParams: Record<string, Object> = {
        'accountName': '123456',
        'authServerName': 'CHINA',
        'parameters': map
      };
      let fakeConfigParams: Record<string, Object> = {
        'uri': 'test.example.com',
        'port': 100
      };
      let adConfigData: AdConfig = {
        adDomain: 'www.test.com'
      }
      let pJson: ParamJson = {
        adConfig: adConfigData
      }
      let configParams1: Record<string, Object> = {
        'accountName': '123456',
        'authServerName': 'CHINA',
        'parameters': pJson
      };
      try {
        console.info(tag + "start addServerConfig");
        let configInfo1 = await osAccount.DomainServerConfigManager.addServerConfig(configParams);
        console.info(tag + "addServerConfig config1: " + JSON.stringify(configInfo1));
        let configInfo12 = await osAccount.DomainServerConfigManager.addServerConfig(configParams1);
        console.info(tag + "addServerConfig config12: " + JSON.stringify(configInfo12));
        let configInfo2 = await osAccount.DomainServerConfigManager.getServerConfig(configInfo1.id);
        console.info(tag + "getServerConfig config1: " + JSON.stringify(configInfo2));
        try {
          console.info(tag + "start addServerConfig again");
          await osAccount.DomainServerConfigManager.addServerConfig(configParams);
          console.info(tag + "addServerConfig success, but should not succeed");
          expect().assertFail();
        } catch (err) {
          console.info(tag + "catch err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300213);
        }
        try {
          console.info(tag + "start updateServerConfig fake params");
          await osAccount.DomainServerConfigManager.updateServerConfig(configInfo1.id, fakeConfigParams);
          console.info(tag + "updateServerConfig success, but should not succeed");
          expect().assertFail();
        } catch (err) {
          console.info(tag + "catch err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
        }
        adConfigData.adDomain = 'test.example.com';
        console.info(tag + "adConfigData1: " + JSON.stringify(adConfigData));
        try {
          console.info(tag + "start updateServerConfig unreachable");
          await osAccount.DomainServerConfigManager.updateServerConfig(configInfo1.id, configParams1);
          console.info(tag + "updateServerConfig success, but should not succeed");
          expect().assertFail();
        } catch (err) {
          console.info(tag + "catch err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300211);
        }
        try {
          console.info(tag + "start updateServerConfig success");
          await osAccount.DomainServerConfigManager.updateServerConfig(configInfo1.id, configParams);
          console.info(tag + "updateServerConfig success");
        } catch (err) {
          console.info(tag + "catch err: " + JSON.stringify(err));
          expect().assertFail();
        }
        adConfigData.adDomain = 'www.test.com';
        console.info(tag + "adConfigData2: " + JSON.stringify(adConfigData));
        try {
          console.info(tag + "start updateServerConfig twice");
          await osAccount.DomainServerConfigManager.updateServerConfig(configInfo1.id, configParams1);
          console.info(tag + "updateServerConfig success, but should not succeed");
          expect().assertFail();
        } catch (err) {
          console.info(tag + "catch err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300213);
        }
        let configArray = await osAccount.DomainServerConfigManager.getAllServerConfigs();
        console.info(tag + "getAllServerConfigs configArray: " + JSON.stringify(configArray));
        for (let i = 0; i < configArray.length; i++) {
          console.info(tag + "start configArray: " + JSON.stringify(configArray));
          await osAccount.DomainServerConfigManager.removeServerConfig(configArray[i].id);
        }
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: addServerConfig");
        } else {
          expect(err.code).assertEqual(12300211);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_2100
     * @tc.number OsAccountParamCheck_2100
     * @tc.desc   check 12300212 Server config not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_2100 ";
      console.info(tag + "start====");
      let configId = '';
      for (let i = 0; i < 513; i++) {
        configId += 'i';
      }
      try {
        console.info(tag + "start removeServerConfig");
        await osAccount.DomainServerConfigManager.removeServerConfig(configId);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: removeServerConfig");
        } else {
          expect(err.code).assertEqual(12300212);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_2200
     * @tc.number OsAccountParamCheck_2200
     * @tc.desc   check 12300212 Server config not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_2200 ";
      console.info(tag + "start====");
      let serverConfigId = '';
      for (let i = 0; i < 512; i++) {
        serverConfigId += 'i';
      }
      let configParams: Record<string, Object> = {
        'uri': 'test.example.com',
        'port': 100
      };
      try {
        console.info(tag + "start updateServerConfig");
        await osAccount.DomainServerConfigManager.updateServerConfig(serverConfigId, configParams);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: updateServerConfig");
        } else {
          expect(err.code).assertEqual(12300212);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_2300
     * @tc.number OsAccountParamCheck_2300
     * @tc.desc   check 12300212 Invalid server config parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_2300 ";
      console.info(tag + "start====");
      let serverConfigId = '';
      for (let i = 0; i < 513; i++) {
        serverConfigId += 'i';
      }
      let configParams: Record<string, Object> = {
        'uri': 'test.example.com',
        'port': 100
      };
      try {
        console.info(tag + "start updateServerConfig");
        await osAccount.DomainServerConfigManager.updateServerConfig(serverConfigId, configParams);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: updateServerConfig");
        } else {
          expect(err.code).assertEqual(12300212);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_2400
     * @tc.number OsAccountParamCheck_2400
     * @tc.desc   check 12300212 Invalid server config parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_2400 ";
      console.info(tag + "start====");
      let serverConfigId = '';
      let configParams: Record<string, Object> = {
        'uri': 'test.example.com',
        'port': 100
      };
      try {
        console.info(tag + "start updateServerConfig");
        await osAccount.DomainServerConfigManager.updateServerConfig(serverConfigId, configParams);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: updateServerConfig");
        } else {
          expect(err.code).assertEqual(12300212);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_2500
     * @tc.number OsAccountParamCheck_2500
     * @tc.desc   check 12300212 Server config not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_2500 ";
      console.info(tag + "start====");
      let configId = '';
      for (let i = 0; i < 513; i++) {
        configId += 'i';
      }
      try {
        console.info(tag + "start getServerConfig");
        await osAccount.DomainServerConfigManager.getServerConfig(configId);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: getServerConfig");
        } else {
          expect(err.code).assertEqual(12300212);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_2600
     * @tc.number OsAccountParamCheck_2600
     * @tc.desc   check 12300003 Domain account not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_2600 ";
      await getNameLimit();
      console.info(tag + "start====");
      let key = '';
      for (let i = 0; i < nameLimit + 1; i++) {
        key += 'i';
      }
      let accountInfo: osAccount.DomainAccountInfo = {
        accountName: key,
        domain: 'demoDomain',
        serverConfigId: 'testServerConfigId'
      };
      try {
        console.info(tag + "start getAccountServerConfig");
        await osAccount.DomainServerConfigManager.getAccountServerConfig(accountInfo);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: getAccountServerConfig");
        } else {
          expect(err.code).assertEqual(12300003);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_2700
     * @tc.number OsAccountParamCheck_2700
     * @tc.desc   check 12300003 Domain account not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_2700 ";
      await getNameLimit();
      console.info(tag + "start====");
      let key = '****';
      let accountInfo: osAccount.DomainAccountInfo = {
        accountName: key,
        domain: 'demoDomain',
        serverConfigId: 'testServerConfigId'
      };
      try {
        console.info(tag + "start getAccountServerConfig");
        await osAccount.DomainServerConfigManager.getAccountServerConfig(accountInfo);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: getAccountServerConfig");
        } else {
          expect(err.code).assertEqual(12300003);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_2800
     * @tc.number OsAccountParamCheck_2800
     * @tc.desc   check 12300003 Domain account not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_2800 ";
      console.info(tag + "start====");
      let key = '';
      for (let i = 0; i < 128 + 1; i++) {
        key += 'i';
      }
      let accountInfo: osAccount.DomainAccountInfo = {
        accountName: "demoName",
        domain: key,
        serverConfigId: 'testServerConfigId'
      };
      try {
        console.info(tag + "start getAccountServerConfig");
        await osAccount.DomainServerConfigManager.getAccountServerConfig(accountInfo);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: getAccountServerConfig");
        } else {
          expect(err.code).assertEqual(12300003);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_2900
     * @tc.number OsAccountParamCheck_2900
     * @tc.desc   check 12300003 Domain account not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_2900 ";
      console.info(tag + "start====");
      let key = '###### ';
      let accountInfo: osAccount.DomainAccountInfo = {
        accountName: "demoName",
        domain: key,
        serverConfigId: 'testServerConfigId'
      };
      try {
        console.info(tag + "start getAccountServerConfig");
        await osAccount.DomainServerConfigManager.getAccountServerConfig(accountInfo);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: getAccountServerConfig");
        } else {
          expect(err.code).assertEqual(12300003);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_3000
     * @tc.number OsAccountParamCheck_3000
     * @tc.desc   check 12300003 Domain account not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_3000 ";
      console.info(tag + "start====");
      let key = '';
      for (let i = 0; i < 512 + 1; i++) {
        key += 'i';
      }
      let accountInfo: osAccount.DomainAccountInfo = {
        accountName: "demoName",
        domain: 'demoDomain',
        serverConfigId: key
      };
      try {
        console.info(tag + "start getAccountServerConfig");
        await osAccount.DomainServerConfigManager.getAccountServerConfig(accountInfo);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: getAccountServerConfig");
        } else {
          expect(err.code).assertEqual(12300003);
        }
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_3100
     * @tc.number OsAccountParamCheck_3100
     * @tc.desc   check 12300003 Domain account not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountParamCheck_3100 ";
      console.info(tag + "start====");
      let key = '';
      let accountInfo: osAccount.DomainAccountInfo = {
        accountName: "demoName",
        domain: 'demoDomain',
        serverConfigId: key
      };
      try {
        console.info(tag + "start getAccountServerConfig");
        await osAccount.DomainServerConfigManager.getAccountServerConfig(accountInfo);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: getAccountServerConfig");
        } else {
          expect(err.code).assertEqual(12300003);
        }
        done();
      }
    });

    /**
     * @tc.name   ActsOsAccountGetOsAccountDomainInfo_0900
     * @tc.number ActsOsAccountGetOsAccountDomainInfo_0900
     * @tc.desc   getAllServerConfigs promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountGetOsAccountDomainInfo_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>ActsOsAccountGetOsAccountDomainInfo_0900 ";
      console.info(tag + "start====");
      try {
        console.info(tag + "start getAllServerConfigs");
        let data: Array<osAccount.DomainServerConfig> = await osAccount.DomainServerConfigManager.getAllServerConfigs();
        console.info(tag + "getAllServerConfigs data: " + JSON.stringify(data));
        if (data.length == 0) {
          expect(data.length).assertEqual(0);
        } else {
          expect(data.length > 0).assertTrue();
        }
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        if (err.code == 801) {
          console.info(tag + "Current device not support API: getAllServerConfigs");
        } else {
          expect().assertFail();
        }
        done();
      }
    });
  });
}
