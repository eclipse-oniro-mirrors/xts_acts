/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import { BusinessError } from '@ohos.base'
import Want from '@ohos.app.ability.Want';
import deviceInfo from '@ohos.deviceInfo';
import { Driver, ON } from '@ohos.UiTest'

let driver = Driver.create();

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok");
    }, time)
  });
}

let deviceType = deviceInfo.deviceType;
console.info("====>the value of the deviceinfo deviceType is: " + deviceType);

export default function ActsOsAccountTest() {
  describe('ActsOsAccountTest', () => {

    /*
    * @tc.number  : ActsOsAccountGetForegroundOsAccountLocalId_0100
    * @tc.name    : getForegroundOsAccountLocalId promise
    * @tc.desc    : Gets the local ID of the foreground OS account.
    * @tc.level   : Level3
    * @tc.size    : MediumTest
    * @tc.type    : Function
    */
    it('ActsOsAccountGetForegroundOsAccountLocalId_0100', 0, async (done: Function) => {
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

    /*
    * @tc.number  : ActsOsAccountGetOsAccountDomainInfo_0100
    * @tc.name    : getOsAccountDomainInfo promise test 401
    * @tc.desc    : Gets the domain account information associated with the specified OS account.
    * @tc.level   : Level3
    * @tc.size    : MediumTest
    * @tc.type    : Function
    */
    it('ActsOsAccountGetOsAccountDomainInfo_0100', 0, async (done: Function) => {
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

    /*
    * @tc.number  : ActsOsAccountGetOsAccountDomainInfo_0200
    * @tc.name    : getOsAccountDomainInfo promise test 401
    * @tc.desc    : Gets the domain account information associated with the specified OS account.
    * @tc.level   : Level3
    * @tc.size    : MediumTest
    * @tc.type    : Function
    */
    it('ActsOsAccountGetOsAccountDomainInfo_0200', 0, async (done: Function) => {
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


    /*
    * @tc.number  : ActsOsAccountGetOsAccountDomainInfo_0300
    * @tc.name    : getOsAccountDomainInfo promise test 13200003
    * @tc.desc    : Gets the domain account information associated with the specified OS account.
    * @tc.level   : Level3
    * @tc.size    : MediumTest
    * @tc.type    : Function
    */
    it('ActsOsAccountGetOsAccountDomainInfo_0300', 0, async (done: Function) => {
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

    /*
    * @tc.number  : ActsOsAccountGetOsAccountDomainInfo_0400
    * @tc.name    : getOsAccountDomainInfo promise test 13200003
    * @tc.desc    : Gets the domain account information associated with the specified OS account.
    * @tc.level   : Level3
    * @tc.size    : MediumTest
    * @tc.type    : Function
    */
    it('ActsOsAccountGetOsAccountDomainInfo_0400', 0, async (done: Function) => {
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

    /*
    * @tc.number  : ActsOsAccountGetOsAccountDomainInfo_0500
    * @tc.name    : getOsAccountDomainInfo promise test
    * @tc.desc    : Gets the domain account information associated with the specified OS account.
    * @tc.level   : Level3
    * @tc.size    : MediumTest
    * @tc.type    : Function
    */
    it('ActsOsAccountGetOsAccountDomainInfo_0500', 0, async (done: Function) => {
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

    /*
    * @tc.number  : ActsOsAccountGetOsAccountDomainInfo_0600
    * @tc.name    : getOsAccountDomainInfo promise test
    * @tc.desc    : Gets the domain account information associated with the specified OS account.
    * @tc.level   : Level3
    * @tc.size    : MediumTest
    * @tc.type    : Function
    */
    it('ActsOsAccountGetOsAccountDomainInfo_0600', 0, async (done: Function) => {
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

    /*
    * @tc.number  : ActsOsAccountGetOsAccountDomainInfo_0700
    * @tc.name    : getOsAccountDomainInfo promise test
    * @tc.desc    : Gets the domain account information associated with the specified OS account.
    * @tc.level   : Level3
    * @tc.size    : MediumTest
    * @tc.type    : Function
    */
    it('ActsOsAccountGetOsAccountDomainInfo_0700', 0, async (done: Function) => {
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

    /*
    * @tc.number  : ActsOsAccountGetOsAccountDomainInfo_0800
    * @tc.name    : getOsAccountDomainInfo promise test
    * @tc.desc    : Gets the domain account information associated with the specified OS account.
    * @tc.level   : Level3
    * @tc.size    : MediumTest
    * @tc.type    : Function
    */
    it('ActsOsAccountGetOsAccountDomainInfo_0800', 0, async (done: Function) => {
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
  });
}
