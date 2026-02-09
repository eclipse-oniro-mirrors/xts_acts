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
import commonevent from '@ohos.commonEventManager'
import account from '@ohos.account.appAccount'
import { describe, beforeAll, afterEach, it, expect, TestType, Hypium, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base'
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let tag: string = 'testTag';
let gContext: common.UIAbilityContext;

export default function ActsAccountOnOffStatic() {
  describe('ActsAccountOnOffStatic', () => {
    let accountManager: account.AppAccountManager = account.createAppAccountManager();
    hilog.info(0x0000, tag, "====>AppAccountManager create finish====");

    let want: Want = {
      deviceId: "",
      bundleName: "com.example.actsaccountsceneonoff",
      abilityName: "com.example.actsaccountsceneonoff.MainAbility",
      action: "action1",
    }

    let testInit = async () => {
      hilog.info(0x0000, tag, "====>testInit startAbility start====");
      gContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
      if (gContext) {
        hilog.info(0x0000, tag, "====>startAbilityForResult start");
        gContext.startAbilityForResult(want,
          (err: BusinessError<void> | null, data: common.AbilityResult | undefined): void => {
            hilog.info(0x0000, tag, "====>beforeAll startAbilityForResult err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>beforeAll startAbilityForResult data: " + data);
          });
      } else {
        hilog.error(0x0000, tag, '====>context is undefined====');
      }
    }    
    
    beforeAll(() => {
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.actsaccountoperatetest.static");
      await Utils.msSleep(2000);
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll end');
    });

    /**
    * @tc.number     ActsAccountChangeOnOff_0200
    * @tc.name       ActsAccountChangeOnOff_0200
    * @tc.desc       Received the account information change to the authorized account of the subscription to change
    *                 the associatal data
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL0
    */
    it('ActsAccountChangeOnOff_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await testInit();
        await Utils.msSleep(500);
        hilog.info(0x0000, tag, "====>ActsAccountChangeOnOff_0200 start====");
        await accountManager.createAccount("onoff_associatedata");
        hilog.info(0x0000, tag, "====>enableAppAccess ActsAccountChangeOnOff_0200 start");
        await accountManager.setAppAccess("onoff_associatedata", "com.example.actsaccountsceneonoff", true);
        let commonEventSubscribeInfo: commonevent.CommonEventSubscribeInfo = {
          events: ["account_on_change_associatedata"]
        }
        await Utils.msSleep(500);
        let subscriber: commonevent.CommonEventSubscriber;
        commonevent.createSubscriber(commonEventSubscribeInfo).then((data: commonevent.CommonEventSubscriber | null) => {
          if (data) {
            subscriber = data;
          }
          commonevent.subscribe(subscriber,
            (err: BusinessError<void> | null, data: commonevent.CommonEventData | undefined): void => {
              hilog.info(0x0000, tag, "====>subscriberCallback 0200 data: " + JSON.stringify(data));
              try {
                if (err) {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                } else {
                  if (data) {
                    expect(data?.event).assertEqual("account_on_change_associatedata");
                    if (data?.data == "ON_SUCCESS") {
                      hilog.info(0x0000, tag, "====>setAssociatedData start");
                      accountManager.setCustomData("onoff_associatedata", "change_key", "change_value").then(() => {
                        hilog.info(0x0000, tag, "====>setAssociatedData finish====");
                      });
                    } else {
                      expect(data?.data).assertEqual("SUCCESS");
                      commonevent.unsubscribe(subscriber, (err: BusinessError<void> | null): void => {
                        hilog.info(0x0000, tag, "====>unsubscribe 0200 err: " + JSON.stringify(err));
                        accountManager.removeAccount("onoff_associatedata", (err: BusinessError<void> | null): void => {
                          hilog.info(0x0000, tag, "====>delete account 0200 err: " + JSON.stringify(err));
                          Utils.msSleep(500).then(() => {
                            done();
                          });
                        });
                      });
                    }
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                }
              } catch (err) {
                hilog.info(0x0000, tag, '====>Assert err: ' + JSON.stringify(err));
              }
            });
          hilog.info(0x0000, tag, "====>subscribe ActsAccountChangeOnOff_0200 finish====");
        });

        let commonEventPublishData: commonevent.CommonEventPublishData = {
          code: 2
        }
        await Utils.msSleep(500);
        hilog.info(0x0000, tag, "====>publish event account_on_change 0200====");
        commonevent.publish("account_on_change_static", commonEventPublishData, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>main publish call back err: " + JSON.stringify(err));
        });
      });

    /**
    * @tc.number     ActsAccountOnOff_0300
    * @tc.name       ActsAccountOnOff_0300
    * @tc.desc       Received the account information change to the authorized account of the subscription to change
    *                 the credential
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL0
    */
    it('ActsAccountOnOff_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await testInit();
        await Utils.msSleep(500)
        hilog.info(0x0000, tag, "====>ActsAccountOnOff_0300 start====");
        hilog.info(0x0000, tag, "====>creat appAccountManager finish");
        hilog.info(0x0000, tag, "====>add account ActsAccountOnOff_0300 start");
        await accountManager.createAccount("onoff_setcredential");
        hilog.info(0x0000, tag, "====>enableAppAccess ActsAccountOnOff_0300 start");
        await accountManager.setAppAccess("onoff_setcredential", "com.example.actsaccountsceneonoff", true);
        let commonEventSubscribeInfo: commonevent.CommonEventSubscribeInfo = {
          events: ["account_on_change_setcredential"]
        }
        await Utils.msSleep(500);
        let subscriber: commonevent.CommonEventSubscriber;
        commonevent.createSubscriber(commonEventSubscribeInfo).then((data: commonevent.CommonEventSubscriber | null) => {
          if (data) {
            subscriber = data;
          }
          commonevent.subscribe(subscriber,
            (err: BusinessError<void> | null, data: commonevent.CommonEventData | undefined): void => {
              hilog.info(0x0000, tag, "====>subscriberCallback 0300 data: " + JSON.stringify(data));
              try {
                if (err) {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                } else {
                  if (data) {
                    expect(data?.event).assertEqual("account_on_change_setcredential");
                    if (data?.data == "ON_SUCCESS") {
                      hilog.info(0x0000, tag, "====>setCredential start====");
                      accountManager.setCredential("onoff_setcredential", "credentialType", "credential").then(() => {
                        hilog.info(0x0000, tag, "====>setCredential finish====");
                      });
                    } else {
                      expect(data?.data).assertEqual("SUCCESS");
                      commonevent.unsubscribe(subscriber, (err: BusinessError<void> | null): void => {
                        hilog.info(0x0000, tag, "====>unsubscribe 0300 err: " + JSON.stringify(err));
                        accountManager.removeAccount("onoff_setcredential", (err: BusinessError<void> | null): void => {
                          hilog.info(0x0000, tag, "====>delete account 0300 err: " + JSON.stringify(err));
                          Utils.msSleep(500).then(() => {
                            done();
                          });
                        });
                      });
                    }
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                }
              } catch (err) {
                hilog.info(0x0000, tag, '====>Assert err: ' + JSON.stringify(err));
              }
            });
          hilog.info(0x0000, tag, "====>subscribe ActsAccountChangeOnOff_0300 finish====");
        });
        let commonEventPublishData: commonevent.CommonEventPublishData = {
          code: 9
        }
        await Utils.msSleep(500)
        hilog.info(0x0000, tag, "====>publish event account_on_change 0300====");
        commonevent.publish("account_on_change_static", commonEventPublishData, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>main publish call back err: " + JSON.stringify(err));
        });
      });

    /**
    * @tc.number     ActsAccountOnOff_0400
    * @tc.name       ActsAccountOnOff_0400
    * @tc.desc       Received the account information change to the authorized account of the subscription to delete
    *                 authorized account
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL0
    */
    it('ActsAccountOnOff_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await testInit();
        await Utils.msSleep(500)
        hilog.info(0x0000, tag, "====>ActsAccountOnOff_0400 start====");
        hilog.info(0x0000, tag, "====>creat appAccountManager finish");
        hilog.info(0x0000, tag, "====>add first account ActsAccountOnOff_0400 start");
        await accountManager.createAccount("onoff_removeFir");
        hilog.info(0x0000, tag, "====>add second account ActsAccountOnOff_0400 start");
        await accountManager.createAccount("onoff_removeSec");
        hilog.info(0x0000, tag, "====>enableAppAccess first ActsAccountOnOff_0400 start");
        await accountManager.setAppAccess("onoff_removeFir", "com.example.actsaccountsceneonoff", true);
        hilog.info(0x0000, tag, "====>enableAppAccess second ActsAccountOnOff_0400 start");
        await accountManager.setAppAccess("onoff_removeSec", "com.example.actsaccountsceneonoff", true);
        let commonEventSubscribeInfo: commonevent.CommonEventSubscribeInfo = {
          events: ["account_on_remove_another"]
        }
        await Utils.msSleep(500)
        let subscriber: commonevent.CommonEventSubscriber;
        hilog.info(0x0000, tag, "====>createSubscriber start");
        commonevent.createSubscriber(commonEventSubscribeInfo).then((data: commonevent.CommonEventSubscriber | null) => {
          if (data) {
            subscriber = data;
          }
          hilog.info(0x0000, tag, "====>subscribe start");
          commonevent.subscribe(subscriber,
            (err: BusinessError<void> | null, data: commonevent.CommonEventData | undefined): void => {
              hilog.info(0x0000, tag, "====>subscriberCallback 0400 data: " + JSON.stringify(data));
              try {
                if (err) {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                } else {
                  if (data) {
                    expect(data?.event).assertEqual("account_on_remove_another");
                    if (data?.data == "ON_SUCCESS") {
                      hilog.info(0x0000, tag, "====>removeAccount start====");
                      accountManager.removeAccount("onoff_removeSec").then(() => {
                        hilog.info(0x0000, tag, "====>removeAccount finish====");
                      });
                    } else {
                      expect(data?.data).assertEqual("SUCCESS");
                      commonevent.unsubscribe(subscriber, (err: BusinessError<void> | null): void => {
                        hilog.info(0x0000, tag, "====>unsubscribe 0400 err: " + JSON.stringify(err));
                        accountManager.removeAccount("onoff_removeFir", (err: BusinessError<void> | null): void => {
                          hilog.info(0x0000, tag, "====>remove account 0400 err: " + JSON.stringify(err));
                          Utils.msSleep(500).then(() => {
                            done();
                          });
                        });
                      });
                    }
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                }
              } catch (err) {
                hilog.info(0x0000, tag, '====>Assert err: ' + JSON.stringify(err));
              }
            });
        });
        let commonEventPublishData: commonevent.CommonEventPublishData = {
          code: 10
        }
        await Utils.msSleep(500)
        hilog.info(0x0000, tag, "====>publish event account_on_change 0400====");
        commonevent.publish("account_on_change_static", commonEventPublishData, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>main publish call back err: " + JSON.stringify(err));
        });
      });

    /**
    * @tc.number     ActsAccountOnOff_0500
    * @tc.name       ActsAccountOnOff_0500
    * @tc.desc       Received the account information change to the authorized account of the subscription to delete
    *                 the only authorized account
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL4
    */
    it('ActsAccountOnOff_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        await testInit();
        await Utils.msSleep(500)
        hilog.info(0x0000, tag, "====>ActsAccountOnOff_0500 start====");
        hilog.info(0x0000, tag, "====>creat appAccountManager finish");
        hilog.info(0x0000, tag, "====>add account ActsAccountOnOff_0500 start");
        await accountManager.createAccount("onoff_remove");
        hilog.info(0x0000, tag, "====>enableAppAccess ActsAccountOnOff_0500 start");
        await accountManager.setAppAccess("onoff_remove", "com.example.actsaccountsceneonoff", true);
        let commonEventSubscribeInfo: commonevent.CommonEventSubscribeInfo = {
          events: ["account_on_change_remove"]
        }
        await Utils.msSleep(500)
        let subscriber: commonevent.CommonEventSubscriber;
        hilog.info(0x0000, tag, "====>createSubscriber start");
        commonevent.createSubscriber(commonEventSubscribeInfo).then((data: commonevent.CommonEventSubscriber | null) => {
          if (data) {
            subscriber = data;
          }
          hilog.info(0x0000, tag, "====>subscribe start");
          commonevent.subscribe(subscriber,
            (err: BusinessError<void> | null, data: commonevent.CommonEventData | undefined): void => {
              hilog.info(0x0000, tag, "====>subscriberCallback 0500 data: " + JSON.stringify(data));
              try {
                if (err) {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                } else {
                  if (data) {
                    expect(data?.event).assertEqual("account_on_change_remove");
                    if (data?.data == "ON_SUCCESS") {
                      hilog.info(0x0000, tag, "====>setCredential start====");
                      accountManager.removeAccount("onoff_remove").then(() => {
                        hilog.info(0x0000, tag, "====>setCredential finish====");
                      });
                    } else {
                      expect(data?.data).assertEqual("SUCCESS");
                      commonevent.unsubscribe(subscriber, (err: BusinessError<void> | null): void => {
                        hilog.info(0x0000, tag, "====>unsubscribe 0500 err: " + JSON.stringify(err));
                        Utils.msSleep(500).then(() => {
                          done();
                        });
                      });
                    }
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                }
              } catch (err) {
                hilog.info(0x0000, tag, '====>Assert err: ' + JSON.stringify(err));
              }
            });
        });
        let commonEventPublishData: commonevent.CommonEventPublishData = {
          code: 11
        }
        await Utils.msSleep(500)
        hilog.info(0x0000, tag, "====>publish event account_on_change 0500====");
        commonevent.publish("account_on_change_static", commonEventPublishData, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>main publish call back err: " + JSON.stringify(err));
        });
      });

    /**
    * @tc.number     ActsAccountOnOff_0600
    * @tc.name       ActsAccountOnOff_0600
    * @tc.desc       Received the account information change to the authorized account of the subscription to cancel
    *                 authorized account
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL4
    */
    it('ActsAccountOnOff_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        await testInit();
        await Utils.msSleep(500)
        hilog.info(0x0000, tag, "====>ActsAccountOnOff_0600 start====");
        hilog.info(0x0000, tag, "====>creat appAccountManager finish");
        hilog.info(0x0000, tag, "====>add first account ActsAccountOnOff_0600 start");
        await accountManager.createAccount("onoff_disableFir");
        hilog.info(0x0000, tag, "====>add second account ActsAccountOnOff_0600 start");
        await accountManager.createAccount("onoff_disableSec");
        hilog.info(0x0000, tag, "====>enableAppAccess first ActsAccountOnOff_0600 start");
        await accountManager.setAppAccess("onoff_disableFir", "com.example.actsaccountsceneonoff", true);
        hilog.info(0x0000, tag, "====>enableAppAccess second ActsAccountOnOff_0600 start");
        await accountManager.setAppAccess("onoff_disableSec", "com.example.actsaccountsceneonoff", true);
        let commonEventSubscribeInfo: commonevent.CommonEventSubscribeInfo = {
          events: ["account_on_set_another_disable"]
        }
        await Utils.msSleep(500)
        let subscriber: commonevent.CommonEventSubscriber;
        hilog.info(0x0000, tag, "====>createSubscriber start");
        commonevent.createSubscriber(commonEventSubscribeInfo).then((data: commonevent.CommonEventSubscriber | null) => {
          if (data) {
            subscriber = data;
          }
          hilog.info(0x0000, tag, "====>subscribe start");
          commonevent.subscribe(subscriber,
            (err: BusinessError<void> | null, data: commonevent.CommonEventData | undefined): void => {
              hilog.info(0x0000, tag, "====>subscriberCallback 0400 data: " + JSON.stringify(data));
              try {
                if (err) {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                } else {
                  if (data) {
                    expect(data?.event).assertEqual("account_on_set_another_disable");
                    if (data?.data == "ON_SUCCESS") {
                      hilog.info(0x0000, tag, "====>disableAppAccess start====");
                      accountManager.setAppAccess("onoff_disableSec", "com.example.actsaccountsceneonoff", false).then(() => {
                        hilog.info(0x0000, tag, "====>disableAppAccess finish====");
                      });
                    } else {
                      expect(data?.data).assertEqual("SUCCESS");
                      commonevent.unsubscribe(subscriber, (err: BusinessError<void> | null): void => {
                        hilog.info(0x0000, tag, "====>unsubscribe 0600 err: " + JSON.stringify(err));
                        accountManager.removeAccount("onoff_disableFir", (err: BusinessError<void> | null): void => {
                          hilog.info(0x0000, tag, "====>remove account 0600 err: " + JSON.stringify(err));
                          accountManager.removeAccount("onoff_disableSec",
                            (err: BusinessError<void> | null): void => {
                              hilog.info(0x0000, tag, "====>remove second account 0600 err: " + JSON.stringify(err));
                              hilog.info(0x0000, tag, "====>subscribe ActsAccountOnOff_0600 finish====")
                              try {
                                expect(err).assertEqual(null);
                              } catch (err) {
                                hilog.info(0x0000, tag, '====>Assert err: ' + JSON.stringify(err));
                              }
                              Utils.msSleep(500).then(() => {
                                done();
                              });
                            });
                        });
                      });
                    }
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                }
              } catch (err) {
                hilog.info(0x0000, tag, '====>Assert err: ' + JSON.stringify(err));
              }
            });
        })
        let commonEventPublishData: commonevent.CommonEventPublishData = {
          code: 12
        }
        await Utils.msSleep(500)
        hilog.info(0x0000, tag, "====>publish event account_on_change 0600====");
        commonevent.publish("account_on_change_static", commonEventPublishData, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>main publish call back err: " + JSON.stringify(err));
        });
      });

    /**
    * @tc.number     ActsAccountChangeOnOff_0700
    * @tc.name       ActsAccountChangeOnOff_0700
    * @tc.desc       Received the account information change to the authorized account of the subscription to cancel
    *                 the only authorized account
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL4
    */
    it('ActsAccountChangeOnOff_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        await testInit();
        await Utils.msSleep(500)
        hilog.info(0x0000, tag, "====>ActsAccountChangeOnOff_0700 start====");
        hilog.info(0x0000, tag, "====>creat appAccountManager finish");
        hilog.info(0x0000, tag, "====>add account OnOff_0700 start");
        await accountManager.createAccount("onoff_disable");
        hilog.info(0x0000, tag, "====>enableAppAccess ActsAccountChangeOnOff_0700 start");
        await accountManager.setAppAccess("onoff_disable", "com.example.actsaccountsceneonoff", true);
        let commonEventSubscribeInfo: commonevent.CommonEventSubscribeInfo = {
          events: ["account_on_change_disable"]
        }
        await Utils.msSleep(500)
        let subscriber: commonevent.CommonEventSubscriber;
        hilog.info(0x0000, tag, "====>createSubscriber start");
        commonevent.createSubscriber(commonEventSubscribeInfo).then((data: commonevent.CommonEventSubscriber | null) => {
          if (data) {
            subscriber = data;
          }
          commonevent.subscribe(subscriber,
            (err: BusinessError<void> | null, data: commonevent.CommonEventData | undefined): void => {
              hilog.info(0x0000, tag, "====>subscriberCallback 0700 data: " + JSON.stringify(data));
              try {
                if (err) {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                } else {
                  if (data) {
                    expect(data?.event).assertEqual("account_on_change_disable");
                    if (data?.data == "ON_SUCCESS") {
                      hilog.info(0x0000, tag, "====>disableAppAccess start====");
                      accountManager.setAppAccess("onoff_disable", "com.example.actsaccountsceneonoff", false).then(() => {
                        hilog.info(0x0000, tag, "====>disableAppAccess finish====");
                      });
                    } else {
                      expect(data?.data).assertEqual("SUCCESS");
                      commonevent.unsubscribe(subscriber, (err: BusinessError<void> | null): void => {
                        hilog.info(0x0000, tag, "====>unsubscribe 0700 err: " + JSON.stringify(err));
                        accountManager.removeAccount("onoff_disable", (err: BusinessError<void> | null): void => {
                          hilog.info(0x0000, tag, "====>delete account 0700 err: " + JSON.stringify(err));
                          hilog.info(0x0000, tag, "====>subscribe ActsAccountChangeOnOff_0700 finish====");
                          Utils.msSleep(500).then(() => {
                            done();
                          });
                        });
                      });
                    }
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                }
              } catch (err) {
                hilog.info(0x0000, tag, '====>Assert err: ' + JSON.stringify(err));
              }
            });
        });
        let commonEventPublishData: commonevent.CommonEventPublishData = {
          code: 7
        }
        await Utils.msSleep(500);
        hilog.info(0x0000, tag, "====>publish event account_on_change 0700====");
        commonevent.publish("account_on_change_static", commonEventPublishData, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>main publish call back err: " + JSON.stringify(err));
        });
      });

    /**
    * @tc.number     ActsAccountChangeOnOff_0800
    * @tc.name       ActsAccountChangeOnOff_0800
    * @tc.desc       Receive account information after the app subscribes to itself and changes additional information
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountChangeOnOff_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountChangeOnOff_0800 start====");
        let dataMap: Map<string, string> = new Map<string, string>();
        hilog.info(0x0000, tag, "====>creat appAccountManager finish");
        hilog.info(0x0000, tag, "====>add account OnOff_0800 start");
        await accountManager.createAccount("onoff_self");
        let changeOnCallback = (data: Array<account.AppAccountInfo>) => {
          hilog.info(0x0000, tag, "====>receive change 0800 data: " + data);
          try {
            if (data) {
              hilog.info(0x0000, tag, "====>data.length: " + data.length);
              for (let i: int = 0; i < data.length; i++) {
                if (data[i]) {
                  dataMap.set(data[i]!.name, data[i]!.owner)
                }
              }
              expect(dataMap.has("onoff_self")).assertTrue();
              if (dataMap.has("onoff_self")) {
                let data: string | undefined = dataMap.get("onoff_self");
                hilog.info(0x0000, tag, "====>the account owner is: " + data);
                expect(data).assertEqual("com.example.actsaccountoperatetest.static");
              }
            } else {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            }
          } catch (err) {
            hilog.info(0x0000, tag, '====>Assert Fail, err:' + JSON.stringify(err));
          }
        }
        hilog.info(0x0000, tag, "====>on OnOff_0800 start");
        accountManager.onAccountChange(["com.example.actsaccountoperatetest.static"], changeOnCallback);
        hilog.info(0x0000, tag, "====>setCustomData start====");
        try {
          await accountManager.setCustomData("onoff_self", "key", "value");
          Utils.msSleep(500).then(() => {
            accountManager.offAccountChange(changeOnCallback);
            hilog.info(0x0000, tag, "====>off ActsAccountChangeOnOff_0800 finish====");
            accountManager.removeAccount("onoff_self", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>delete account OnOff_0800 err: " + JSON.stringify(err));
              done();
            });
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>setCustomData fail err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number     ActsAccountChangeOnOff_0900
    * @tc.name       ActsAccountChangeOnOff_0900
    * @tc.desc       Receiving account information after adding two accounts to the app, subscribing to itself,
    *                 and changing one of the associatal data
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountChangeOnOff_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountChangeOnOff_0900 start====");
        let dataMap: Map<string, string> = new Map<string, string>();
        hilog.info(0x0000, tag, "====>creat appAccountManager finish");
        hilog.info(0x0000, tag, "====>add first account OnOff_0900 start");
        await accountManager.createAccount("onoff_self_first");
        hilog.info(0x0000, tag, "====>add second account OnOff_0900 start");
        await accountManager.createAccount("onoff_self_second");
        let changeOnCallback = (data: Array<account.AppAccountInfo>) => {
          hilog.info(0x0000, tag, "====>receive change 0900 data: " + data);
          try {
            if (data) {
              hilog.info(0x0000, tag, "====>data.length: " + data.length);
              for (let i: int = 0; i < data.length; i++) {
                if (data[i]) {
                  dataMap.set(data[i]!.name, data[i]!.owner)
                }
              }
              expect(dataMap.has("onoff_self_first")).assertTrue();
              if (dataMap.has("onoff_self_first")) {
                let data: string | undefined = dataMap.get("onoff_self_first");
                hilog.info(0x0000, tag, "====>the account owner is: " + data);
                expect(data).assertEqual("com.example.actsaccountoperatetest.static");
              }
              expect(dataMap.has("onoff_self_second")).assertTrue();
              if (dataMap.has("onoff_self_second")) {
                let data: string | undefined = dataMap.get("onoff_self_second");
                hilog.info(0x0000, tag, "====>the account owner is: " + data);
                expect(data).assertEqual("com.example.actsaccountoperatetest.static");
              }
            } else {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            }
          } catch (err) {
            hilog.info(0x0000, tag, '====>Assert Fail, err:' + JSON.stringify(err));
          }
        }
        hilog.info(0x0000, tag, "====>on OnOff_0900 start");
        accountManager.onAccountChange(["com.example.actsaccountoperatetest.static"], changeOnCallback);
        hilog.info(0x0000, tag, "====>setCustomData start====");
        try {
          await accountManager.setCustomData("onoff_self_second", "change_key", "change_value");
          Utils.msSleep(500).then(() => {
            accountManager.offAccountChange(changeOnCallback);
            hilog.info(0x0000, tag, "====>off ActsAccountChangeOnOff_0900 finish====");
            accountManager.removeAccount("onoff_self_first", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>delete first account 0900 err: " + JSON.stringify(err));
              accountManager.removeAccount("onoff_self_second",
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>delete second account 0900 err: " + JSON.stringify(err));
                  try {
                    expect(err).assertEqual(null);
                  } catch (err) {
                    hilog.info(0x0000, tag, '====>Assert err: ' + JSON.stringify(err));
                  }
                  hilog.info(0x0000, tag, "====>ActsAccountChangeOnOff_0900 end====");
                  done();
                });
            });
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>setAssociatedData fail err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number     ActsAccountChangeOnOff_1000
    * @tc.name       ActsAccountChangeOnOff_1000
    * @tc.desc       Repeat subscription account information changes, the subscription behavior is independent
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountChangeOnOff_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountChangeOnOff_1000 start====");
        let dataMapFir: Map<string, string> = new Map<string, string>();
        let dataMapSec: Map<string, string> = new Map<string, string>();
        hilog.info(0x0000, tag, "====>creat appAccountManager finish");
        hilog.info(0x0000, tag, "====>add account OnOff_1000 start");
        await accountManager.createAccount("onoff_twice");
        hilog.info(0x0000, tag, "====>on OnOff_1000 start");
        let twiceSign: int = 0;
        let changeOnFirstCallback = (data: Array<account.AppAccountInfo>) => {
          hilog.info(0x0000, tag, "====>first receive change 1000 data: " + data);
          try {
            if (data) {
              hilog.info(0x0000, tag, "====>data.length: " + data.length);
              for (let i: int = 0; i < data.length; i++) {
                if (data[i]) {
                  dataMapFir.set(data[i]!.name, data[i]!.owner);
                }
              }
              expect(dataMapFir.has("onoff_twice")).assertTrue();
              if (dataMapFir.has("onoff_twice")) {
                let data: string | undefined = dataMapFir.get("onoff_twice");
                hilog.info(0x0000, tag, "====>the account owner is: " + data);
                expect(data).assertEqual("com.example.actsaccountoperatetest.static");
              }
              twiceSign = twiceSign + 1;
            } else {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            }
          } catch (err) {
            hilog.info(0x0000, tag, '====>Assert Fail, err:' + JSON.stringify(err));
          }
        }
        let changeOnSecondCallback = (data: Array<account.AppAccountInfo>) => {
          hilog.info(0x0000, tag, "====>second receive change 1000 data: " + data);
          try {
            if (data) {
              hilog.info(0x0000, tag, "====>data.length: " + data.length);
              for (let i: int = 0; i < data.length; i++) {
                if (data[i]) {
                  dataMapSec.set(data[i]!.name, data[i]!.owner);
                }
              }
              expect(dataMapSec.has("onoff_twice")).assertTrue();
              if (dataMapSec.has("onoff_twice")) {
                let data: string | undefined = dataMapSec.get("onoff_twice");
                hilog.info(0x0000, tag, "====>the account owner is: " + data);
                expect(data).assertEqual("com.example.actsaccountoperatetest.static");
              }
              twiceSign = twiceSign + 1;
            } else {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            }
          } catch (err) {
            hilog.info(0x0000, tag, '====>Assert Fail, err:' + JSON.stringify(err));
          }
        }
        accountManager.onAccountChange(["com.example.actsaccountoperatetest.static"], changeOnFirstCallback);
        accountManager.onAccountChange(["com.example.actsaccountoperatetest.static"], changeOnSecondCallback);
        hilog.info(0x0000, tag, "====>setCustomData start====");
        try {
          await accountManager.setCustomData("onoff_twice", "key", "value");
          await Utils.msSleep(500)
          hilog.info(0x0000, tag, "====>off start====");
          accountManager.offAccountChange();
          hilog.info(0x0000, tag, "====>off ActsAccountChangeOnOff_1000 finish====");
          accountManager.removeAccount("onoff_twice", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>delete account OnOff_1000 err: " + JSON.stringify(err));
            try {
              if (err) {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              } else {
                expect(twiceSign).assertEqual(2);
                hilog.info(0x0000, tag, "====>ActsAccountChangeOnOff_1000 end====");
              }
            } catch (err) {
              hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
            }
            Utils.msSleep(500).then(() => {
              done();
            });
          });
        } catch (err) {
          hilog.error(0x0000, tag, "====>setCustomData fail err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number     ActsAccountChangeOnOff_1100
    * @tc.name       ActsAccountChangeOnOff_1100
    * @tc.desc       Subscription account information changes, where the bundleName in the parameter owners is
    *                 duplicated
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountChangeOnOff_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountChangeOnOff_1100 start====");
        let dataMap: Map<string, string> = new Map<string, string>();
        let sameSign: int = 0;
        hilog.info(0x0000, tag, "====>creat appAccountManager finish");
        hilog.info(0x0000, tag, "====>add account OnOff_1100 start");
        await accountManager.createAccount("onoff_same");
        let onCallBack = (data: Array<account.AppAccountInfo>) => {
          hilog.info(0x0000, tag, "====>receive change 1100 data: " + data);
          try {
            if (data) {
              sameSign = sameSign + 1;
              hilog.info(0x0000, tag, "====>data.length: " + data.length);
              for (let i: int = 0; i < data.length; i++) {
                if (data[i]) {
                  dataMap.set(data[i]!.name, data[i]!.owner)
                }
              }
              expect(dataMap.has("onoff_same")).assertTrue();
              if (dataMap.has("onoff_same")) {
                let data: string | undefined = dataMap.get("onoff_same");
                hilog.info(0x0000, tag, "====>the account owner is: " + data);
                expect(data).assertEqual("com.example.actsaccountoperatetest.static");
              }
            } else {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            }
          } catch (err) {
            hilog.info(0x0000, tag, '====>Assert Fail, err:' + JSON.stringify(err));
          }
        }
        hilog.info(0x0000, tag, "====>on OnOff_1100 start");
        accountManager.onAccountChange(["com.example.actsaccountoperatetest.static", "com.example.actsaccountoperatetest.static"], onCallBack);
        hilog.info(0x0000, tag, "====>setCustomData start====");
        try {
          await accountManager.setCustomData("onoff_same", "key", "value");
          await Utils.msSleep(500)
          hilog.info(0x0000, tag, "====>off 1100 start====");
          accountManager.offAccountChange();
          hilog.info(0x0000, tag, "====>off ActsAccountChangeOnOff_1100 finish====");
          accountManager.removeAccount("onoff_same", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>delete account OnOff_1100 err: " + JSON.stringify(err));
            try {
              if (err) {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              } else {
                expect(sameSign).assertEqual(1);
                hilog.info(0x0000, tag, "====>ActsAccountChangeOnOff_1100 end====");
              }
            } catch (err) {
              hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
            }
            Utils.msSleep(500).then(() => {
              done();
            });
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>setCustomData fail err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number     ActsAccountChangeOnOff_1200
    * @tc.name       ActsAccountChangeOnOff_1200
    * @tc.desc       Repeatedly cancel the subscription after the subscription account information is changed
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountChangeOnOff_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountChangeOnOff_1200 start====");
        let dataMap: Map<string, string> = new Map<string, string>();
        hilog.info(0x0000, tag, "====>creat appAccountManager finish");
        hilog.info(0x0000, tag, "====>add account OnOff_1200 start");
        await accountManager.createAccount("onoff_repeatoff");
        let changeOnCallback = (data: Array<account.AppAccountInfo>) => {
          hilog.info(0x0000, tag, "====>receive change 1200 data: " + data);
          try {
            if (data) {
              hilog.info(0x0000, tag, "====>data.length: " + data.length);
              for (let i: int = 0; i < data.length; i++) {
                if (data[i]) {
                  dataMap.set(data[i]!.name, data[i]!.owner)
                }
              }
              expect(dataMap.has("onoff_repeatoff")).assertTrue();
              if (dataMap.has("onoff_repeatoff")) {
                let data: string | undefined = dataMap.get("onoff_repeatoff");
                hilog.info(0x0000, tag, "====>the account owner is: " + data);
                expect(data).assertEqual("com.example.actsaccountoperatetest.static");
              }
            } else {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            }
          } catch (err) {
            hilog.info(0x0000, tag, '====>Assert Fail, err:' + JSON.stringify(err));
          }
        }
        hilog.info(0x0000, tag, "====>on OnOff_1200 start");
        accountManager.onAccountChange(["com.example.actsaccountoperatetest.static"], changeOnCallback);
        hilog.info(0x0000, tag, "====>setCustomData start====");
        try {
          await accountManager.setCustomData("onoff_repeatoff", "key", "value");
          await Utils.msSleep(500)
          hilog.info(0x0000, tag, "====>off start====");
          accountManager.offAccountChange(changeOnCallback);
          hilog.info(0x0000, tag, "====>first off ActsAccountChangeOnOff_1200 finish====");
          accountManager.offAccountChange(changeOnCallback);
          hilog.info(0x0000, tag, "====>second off ActsAccountChangeOnOff_1200 finish====");
          await Utils.msSleep(500)
          hilog.info(0x0000, tag, "====>delete account 1200 start====");
          accountManager.removeAccount("onoff_repeatoff",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>delete account OnOff_1200 err: " + JSON.stringify(err));
              try {
                expect(err).assertEqual(null);
              } catch (err) {
                hilog.info(0x0000, tag, '====>Assert err: ' + JSON.stringify(err));
              }
              hilog.info(0x0000, tag, "====>ActsAccountChangeOnOff_1200 end====");
              Utils.msSleep(500).then(() => {
                done();
              });
            })
        } catch (err) {
          hilog.error(0x0000, tag, "====>setCustomData fail err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number     ActsAccountChangeOnOff_1300
    * @tc.name       ActsAccountChangeOnOff_1300
    * @tc.desc       There is an unauthorized bundleName in the subscription parameter owners array, and the
    *                 subscription fails
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountChangeOnOff_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountChangeOnOff_1300 start====");
        hilog.info(0x0000, tag, "====>creat appAccountManager finish");
        hilog.info(0x0000, tag, "====>add account OnOff_1300 start");
        await accountManager.createAccount("onoff_1300");
        hilog.info(0x0000, tag, "====>on OnOff_1300 start");
        let unauthorizedBundle: string = "com.example.actsaccountsceneonoff";
        try{
          accountManager.onAccountChange(["com.example.actsaccountoperatetest.static", unauthorizedBundle],
            (data: Array<account.AppAccountInfo>) => {
              hilog.info(0x0000, tag, "====>receive change 1300 data: " + data);
              accountManager.offAccountChange();
              expect().assertFail();
            });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>on ActsAccountChangeOnOff_1300 err:" + JSON.stringify(err));
        }
        hilog.info(0x0000, tag, "====>setCustomData start====");
        try {
          await accountManager.setCustomData("onoff_1300", "key", "value");
          await Utils.msSleep(500)
          hilog.info(0x0000, tag, "====>delete account 1300 start====");
          accountManager.removeAccount("onoff_1300", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>delete account OnOff_1300 err: " + JSON.stringify(err));
            try {
              expect(err).assertEqual(null);
            } catch (err) {
              hilog.info(0x0000, tag, '====>Assert err: ' + JSON.stringify(err));
            }
            hilog.info(0x0000, tag, "====>ActsAccountChangeOnOff_1300 end====");
            Utils.msSleep(500).then(() => {
              done();
            });
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>setCustomData fail err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number     ActsAccountChangeOnOff_1400
    * @tc.name       ActsAccountChangeOnOff_1400
    * @tc.desc       There is a bundleName that does not exist in the subscription parameter owners array, and the
    *                 subscription fails
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountChangeOnOff_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountChangeOnOff_1400 start====");
        hilog.info(0x0000, tag, "====>creat appAccountManager finish");
        hilog.info(0x0000, tag, "====>add account OnOff_1400 start");
        await accountManager.createAccount("onoff_1400");
        hilog.info(0x0000, tag, "====>on OnOff_1400 start");
        let nonexistentBundle: string = "com.example.actsaccountnoneexistent";
        accountManager.onAccountChange(["com.example.actsaccountoperatetest.static", nonexistentBundle],
          (data: Array<account.AppAccountInfo>) => {
            hilog.info(0x0000, tag, "====>receive change 1400 data: " + data);
            accountManager.offAccountChange();
            expect().assertFail();
          });
        hilog.info(0x0000, tag, "====>setCustomData start====");
        try {
          await accountManager.setCustomData("onoff_1400", "key", "value");
          await Utils.msSleep(500)
          hilog.info(0x0000, tag, "====>delete account 1400 start====");
          accountManager.removeAccount("onoff_1400", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>delete account OnOff_1400 err: " + JSON.stringify(err));
            try {
              expect(err).assertEqual(null);
            } catch (err) {
              hilog.info(0x0000, tag, '====>Assert err: ' + JSON.stringify(err));
            }
            hilog.info(0x0000, tag, "====>ActsAccountChangeOnOff_1400 end====");
            Utils.msSleep(500).then(() => {
              done();
            });
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>setCustomData fail err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });
  });
}