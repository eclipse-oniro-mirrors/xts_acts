/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { beforeAll, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import hilog from '@ohos.hilog';
import Utils from './Util.test';

import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import notificationExtensionSubscription from '@ohos.notificationExtensionSubscription';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';

let domain: int = 0x0000;
let tag: string = 'testTag';

let context: common.UIAbilityContext;

const VALID_WEARABLE_BUNDLE: notificationExtensionSubscription.BundleOption = {
  bundle: 'com.example.helloworld', uid: 20010043
};

function createBundleWithoutUid(bundle: string): notificationExtensionSubscription.BundleOption {
  return { bundle: bundle };
}

export default function ActsNotificationThirdPartyWatchPermissionTest() {

  describe("ActsNotificationThirdPartyWatchPermissionTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.startAbility({
        abilityName: "EntryAbility", bundleName: "com.example.permission.static"
      }).then(async (): Promise<void> => {
        hilog.info(domain, tag, 'startAbility success');
        await Utils.msSleep(2000);
        context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
        hilog.info(domain, tag, '%{public}s', 'beforeAll end');
      }).catch(() => {
        hilog.info(domain, tag, 'startAbility fail');
      })
    });


    /**
     * @tc.number     Sub_Notification_Ans_ThreePartyWatch_Static_1000
     * @tc.name       Sub_Notification_Ans_ThreePartyWatch_Static_1000
     * @tc.desc       test openSubscriptionSettings Permission denied 201
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("Sub_Notification_Ans_ThreePartyWatch_Static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "Sub_Notification_Ans_ThreePartyWatch_Static_1000";
        let NAME = "openSubscriptionSettings";
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} start`);
          await notificationExtensionSubscription.openSubscriptionSettings(context).then(() => {
            hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} success`);
            expect().assertFail();
            done();
          }).catch((e: Error) => {
            let err = e as BusinessError;
            hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(201);
            done();
          });
        } catch (err: BusinessError) {
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      })


    /**
     * @tc.number     Sub_Notification_Ans_ThreePartyWatch_Static_1013
     * @tc.name       Sub_Notification_Ans_ThreePartyWatch_Static_1013
     * @tc.desc       test unsubscribe Permission denied 201
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("Sub_Notification_Ans_ThreePartyWatch_Static_1013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "Sub_Notification_Ans_ThreePartyWatch_Static_1013";
        let NAME = "unsubscribe";
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE}  start`);
          await notificationExtensionSubscription.unsubscribe().then(() => {
            hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} success`);
            expect().assertFail();
            done();
          }).catch((e: Error) => {
            let err = e as BusinessError;
            hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(201);
            done();
          });
        } catch (err: BusinessError) {
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number     Sub_Notification_Ans_ThreePartyWatch_Static_1016
     * @tc.name       Sub_Notification_Ans_ThreePartyWatch_Static_1016
     * @tc.desc       test getSubscribeInfo Permission denied 201
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("Sub_Notification_Ans_ThreePartyWatch_Static_1016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "Sub_Notification_Ans_ThreePartyWatch_Static_1016";
        let NAME = "getSubscribeInfo";
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE}  start`);
          await notificationExtensionSubscription.getSubscribeInfo()
            .then((data: notificationExtensionSubscription.NotificationExtensionSubscriptionInfo[]) => {
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} success. data: ${JSON.stringify(data)}`);
              expect().assertFail();
              done();
            })
            .catch((e: Error) => {
              let err = e as BusinessError;
              hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err.code}, message: ${err.message}`);
              expect(err.code).assertEqual(201);
              done();
            });
        } catch (err: BusinessError) {
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number     Sub_Notification_Ans_ThreePartyWatch_Static_1019
     * @tc.name       Sub_Notification_Ans_ThreePartyWatch_Static_1019
     * @tc.desc       test getAllSubscriptionBundles Permission denied 202
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("Sub_Notification_Ans_ThreePartyWatch_Static_1019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "Sub_Notification_Ans_ThreePartyWatch_Static_1019";
        let NAME = "getAllSubscriptionBundles";
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE}  start`);
          await notificationExtensionSubscription.getAllSubscriptionBundles()
            .then((data: notificationExtensionSubscription.BundleOption[]) => {
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} success. data: ${JSON.stringify(data)}`);
              expect().assertFail();
              done();
            })
            .catch((e: Error) => {
              let err = e as BusinessError;
              hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err.code}, message: ${err.message}`);
            if (err.code == 201) {
              expect(err.code).assertEqual(201);
              done();
            } else {
              expect(err.code).assertEqual(202);
              done();
            }
            });
        } catch (err: BusinessError) {
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number     Sub_Notification_Ans_ThreePartyWatch_Static_1022
     * @tc.name       Sub_Notification_Ans_ThreePartyWatch_Static_1022
     * @tc.desc       test getAllSubscriptionBundles Permission denied 201
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("Sub_Notification_Ans_ThreePartyWatch_Static_1022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "Sub_Notification_Ans_ThreePartyWatch_Static_1022";
        let NAME = "isUserGranted";
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE}  start`);
          await notificationExtensionSubscription.isUserGranted().then((data: boolean) => {
            hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} success. data: ${JSON.stringify(data)}`);
            expect().assertFail();
            done();
          }).catch((e: Error) => {
            let err = e as BusinessError;
            hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(201);
            done();
          });
        } catch (err: BusinessError) {
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number     Sub_Notification_Ans_ThreePartyWatch_Static_1025
     * @tc.name       Sub_Notification_Ans_ThreePartyWatch_Static_1025
     * @tc.desc       test getUserGrantedState Permission denied 201
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("Sub_Notification_Ans_ThreePartyWatch_Static_1025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "Sub_Notification_Ans_ThreePartyWatch_Static_1025";
        let NAME = "getUserGrantedState";
        let targetBundle: notificationExtensionSubscription.BundleOption = {
          bundle: 'com.example.helloworld', uid: 100
        };
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE}  start`);
          await notificationExtensionSubscription.getUserGrantedState(targetBundle).then((data: boolean) => {
            hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} success. data: ${JSON.stringify(data)}`);
            expect().assertFail();
            done();
          }).catch((e: Error) => {
            let err = e as BusinessError;
            hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err.code}, message: ${err.message}`);
            if (err.code == 201) {
              expect(err.code).assertEqual(201);
              done();
            } else {
              expect(err.code).assertEqual(202);
              done();
            }
          });
        } catch (err: BusinessError) {
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number     Sub_Notification_Ans_ThreePartyWatch_Static_1034
     * @tc.name       Sub_Notification_Ans_ThreePartyWatch_Static_1034
     * @tc.desc       test setUserGrantedState Permission denied 201
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("Sub_Notification_Ans_ThreePartyWatch_Static_1034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "Sub_Notification_Ans_ThreePartyWatch_Static_1034";
        let NAME = "setUserGrantedState";
        let targetBundle: notificationExtensionSubscription.BundleOption = {
          bundle: 'com.example.helloworld', uid: 100
        };

        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE}  start`);
          await notificationExtensionSubscription.setUserGrantedState(targetBundle, true).then(() => {
            hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} success.`);
            expect().assertFail();
            done();
          }).catch((e: Error) => {
            let err = e as BusinessError;
            hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err.code}, message: ${err.message}`);
            if (err.code == 201) {
              expect(err.code).assertEqual(201);
              done();
            } else {
              expect(err.code).assertEqual(202);
              done();
            }
          });
        } catch (err: BusinessError) {
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number     Sub_Notification_Ans_ThreePartyWatch_Static_1056
     * @tc.name       Sub_Notification_Ans_ThreePartyWatch_Static_1056
     * @tc.desc       Verify third-party app without NOTIFICATION_CONTROLLER permission gets error 201
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('Sub_Notification_Ans_ThreePartyWatch_Static_1056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TESTCASE = 'Sub_Notification_Ans_ThreePartyWatch_Static_1056';
        let NAME = 'getUserGrantedEnabledBundles';

        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} start`);
          await notificationExtensionSubscription.getUserGrantedEnabledBundles().then(() => {
            hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} success`);
            expect().assertFail();
            done();
          }).catch((e: Error) => {
            let err = e as BusinessError;
            hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err.code}, message: ${err.message}`);
            if (err.code == 201) {
              expect(err.code).assertEqual(201);
              done();
            } else {
              expect(err.code).assertEqual(202);
              done();
            }
          });
        } catch (err: BusinessError) {
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      })


    /**
     * @tc.number   Sub_Notification_Ans_ThreePartyWatch_Static_1047
     * @tc.name     Sub_Notification_Ans_ThreePartyWatch_Static_1047
     * @tc.desc     Verify third-party app gets error 202 when calling getUserGrantedEnabledBundles
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.leve     lLevel 2
     */
    it('Sub_Notification_Ans_ThreePartyWatch_Static_1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TESTCASE = 'Sub_Notification_Ans_ThreePartyWatch_Static_1047';
        let NAME = 'getUserGrantedEnabledBundles';
        let wearableBundle: notificationExtensionSubscription.BundleOption =
          createBundleWithoutUid(VALID_WEARABLE_BUNDLE.bundle);

        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} start`);
          await notificationExtensionSubscription.getUserGrantedEnabledBundles(wearableBundle).then(() => {
            hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} success`);
            expect().assertFail();
            done();
          }).catch((e: Error) => {
            let err = e as BusinessError;
            hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err.code}, message: ${err.message}`);
            if (err.code == 201) {
              expect(err.code).assertEqual(201);
              done();
            } else {
              expect(err.code).assertEqual(202);
              done();
            }

          });
        } catch (err: BusinessError) {
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      })


    /**
     * @tc.number    Sub_Notification_Ans_ThreePartyWatch_Static_1060
     * @tc.name      Sub_Notification_Ans_ThreePartyWatch_Static_1060
     * @tc.desc      Verify error 201 when calling setUserGrantedBundleState without NOTIFICATION_CONTROLLER permission
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Sub_Notification_Ans_ThreePartyWatch_Static_1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TESTCASE = 'Sub_Notification_Ans_ThreePartyWatch_Static_1060';
        let NAME = 'setUserGrantedBundleState';
        let targetBundle: notificationExtensionSubscription.BundleOption =
          createBundleWithoutUid(VALID_WEARABLE_BUNDLE.bundle);
        let enabledBundles: notificationExtensionSubscription.BundleOption[] = [];
        let testApps: notificationExtensionSubscription.BundleOption[] = [VALID_WEARABLE_BUNDLE];

        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} start`);
          for (let i: int = 0; i < testApps.length; i++) {
            let app: notificationExtensionSubscription.BundleOption = testApps[i];
            enabledBundles.push(createBundleWithoutUid(app.bundle));
          }
          let enabled: boolean = true;
          await notificationExtensionSubscription.setUserGrantedBundleState(targetBundle, enabledBundles, enabled)
            .then(() => {
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} success`);
              expect().assertFail();
              done();
            })
            .catch((e: Error) => {
              let err = e as BusinessError;
              hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err.code}, message: ${err.message}`);
            if (err.code == 201) {
              expect(err.code).assertEqual(201);
              done();
            } else {
              expect(err.code).assertEqual(202);
              done();
            }
            });
        } catch (err: BusinessError) {
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      })

  })
}