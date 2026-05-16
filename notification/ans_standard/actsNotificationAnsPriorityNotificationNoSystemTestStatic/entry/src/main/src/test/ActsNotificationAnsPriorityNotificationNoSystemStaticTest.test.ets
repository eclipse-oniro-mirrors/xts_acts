/*
* Copyright (c) 2026 Huawei Device Co., Ltd.
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
import Utils from './Util.test';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import emitter from '@ohos.events.emitter'
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError, Callback } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import notificationManager from '@ohos.notificationManager';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Size,
  TestType
} from '../../../hypium/index'
import { abilityAccessCtrl, bundleManager, bundleResourceManager, installer } from '@kit.AbilityKit';
import { Driver, ON } from '@ohos.UiTest'
import { AppStorage } from '@ohos.arkui.stateManagement'
import commonEventManager from '@ohos.commonEventManager'
import router from '@ohos.router'
import { Router } from '@ohos.arkui.UIContext';
import { UIContext } from '@ohos.arkui.UIContext'
import image from '@ohos.multimedia.image';
import { BusinessError, RecordData } from '@ohos.base';
import hilog from '@ohos.hilog';
import WantAgent from '@ohos.app.ability.wantAgent';
import wantagent from '@ohos.app.ability.wantAgent';
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager'
import notificationExtensionSubscription from '@ohos.notificationExtensionSubscription';
import { notificationSubscribe } from '@kit.NotificationKit';
const TAG = 'NotificationHits';
const TEST_SUITE_NAME = 'Notification';
let DOMAIN_NUMBER: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let bundleName: string = "com.example.actsnotificationansprioritynotificationnosystemstatictest.static"
let context: common.UIAbilityContext;
let domain: int = 0x0000;
let tag: string = 'testTag';
export default function actsNotificationAnsPriorityNotificationNoSystemStaticTest() {
  const TEST_Project_NAME = 'actsNotificationAnsPriorityNotificationNoSystemStaticTest';
  describe('actsNotificationAnsPriorityNotificationNoSystemStaticTest', () => {

    beforeAll(async() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.startAbility({
        abilityName: "EntryAbility",
        bundleName: "com.example.actsnotificationansprioritynotificationnosystemstatictest.static"
      }).then(async (): Promise<void> => {
        hilog.info(domain, tag, 'startAbility success');
        await Utils.msSleep(2000);
        context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
        hilog.info(domain, tag, '%{public}s', 'beforeAll end');
      }).catch(() => {
        hilog.info(domain, tag, 'startAbility fail');
      })
    });

    beforeEach(async() => {
      console.info(`${TAG} afterEach START`)
      notificationManager.removeAllSlots((e: Error | null) => {
        if (e) {
          let err:BusinessError=e as BusinessError
          console.info(`${TAG} removeAllSlots AsyncCallback err: ${err}, errMes: ${err.message}`)
        } else {
          console.info(`${TAG} removeAllSlots AsyncCallback success`)
        }
      })
      await Utils.msSleep(1000)
      console.info(`${TAG} afterEach END`)
    })

    /**
     * @tc.name   SUB_Notification_Ans_Priority_Notification_Static_0100
     * @tc.number SUB_Notification_Ans_Priority_Notification_Static_0100
     * @tc.desc   [setBundlePriorityConfig] Error Code 202 Is Reported When a Third-Party App Calls This Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Priority_Notification_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_Priority_Notification_Static_0100';
      const bundleOption : notificationManager.BundleOption = {
        bundle: 'com.example.actsnotificationansprioritynotificationnosystemstatictest.static',
      };
      try {
        notificationManager.setBundlePriorityConfig(bundleOption, '小红').then(() => {
          console.info(`${testNum}setBundlePriorityConfig success`);
          expect(false).assertTrue();
          done()
        }).catch((e: Error) => {
          let err = e as BusinessError
          console.error(`${testNum}setBundlePriorityConfig failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(err.code).assertEqual(202)
            expect(err.message).assertEqual('Not system application to call the interface')
            done()
          }
        });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Priority_Notification_Static_0200
     * @tc.number SUB_Notification_Ans_Priority_Notification_Static_0200
     * @tc.desc   [getBundlePriorityConfig] When a third-party application invokes the interface, error 202 is reported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Priority_Notification_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_Priority_Notification_Static_0200';
      const bundleOption : notificationManager.BundleOption = {
        bundle: 'com.example.actsnotificationansprioritynotificationnosystemstatictest.static',
      };
      try {
        notificationManager.getBundlePriorityConfig(bundleOption).then((value: string) => {
          console.info(`${testNum}getBundlePriorityConfig value is ${value}`);
          expect(false).assertTrue();
          done()
        }).catch((e: Error) => {
          let err = e as BusinessError
          console.error(`${testNum}getBundlePriorityConfig failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(err.code).assertEqual(202)
            expect(err.message).assertEqual('Not system application to call the interface')
            done()
          }
        });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Priority_Notification_Static_0300
     * @tc.number SUB_Notification_Ans_Priority_Notification_Static_0300
     * @tc.desc   [setPriorityEnabled] Error Code 202 Is Reported When a Third-Party App Calls This Interfaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Priority_Notification_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_Priority_Notification_Static_0300';
      const bundleOption : notificationManager.BundleOption = {
        bundle: 'com.example.actsnotificationansprioritynotificationnosystemstatictest.static',
      };
      try {
        notificationManager.setPriorityEnabled(true).then(() => {
          console.info(`${testNum}setPriorityEnabled success`);
          expect(false).assertTrue();
          done()
        }).catch((e: Error) => {
          let err = e as BusinessError
          console.error(`${testNum}setPriorityEnabled failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(err.code).assertEqual(202)
            expect(err.message).assertEqual('Not system application to call the interface')
            done()
          }
        });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Priority_Notification_Static_0400
     * @tc.number SUB_Notification_Ans_Priority_Notification_Static_0400
     * @tc.desc   [isPriorityEnabled] Error Code 202 Is Reported When a Third-Party App Calls This Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Priority_Notification_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_Priority_Notification_Static_0400';
      try {
        notificationManager.isPriorityEnabled().then((result : boolean) => {
          console.info(`${testNum}isPriorityEnabled result is ${result}`);
          expect(false).assertTrue();
          done()
        }).catch((e: Error) => {
          let err = e as BusinessError
          console.error(`${testNum}isPriorityEnabled failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(err.code).assertEqual(202)
            expect(err.message).assertEqual('Not system application to call the interface')
            done()
          }
        });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Priority_Notification_Static_0500
     * @tc.number SUB_Notification_Ans_Priority_Notification_Static_0500
     * @tc.desc   [setPriorityEnabledByBundle] Error Code 202 Is Reported When a Third-Party App Calls This Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Priority_Notification_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_Priority_Notification_Static_0500';
      const bundleOption : notificationManager.BundleOption = {
        bundle: 'com.example.actsnotificationansprioritynotificationnosystemstatictest.static',
      };
      try {
        notificationManager.setPriorityEnabledByBundle(bundleOption, notificationManager.PriorityEnableStatus.DISABLE).then(() => {
          console.info(`${testNum}setPriorityEnabledByBundle success`);
          expect(false).assertTrue();
          done()
        }).catch((e: Error) => {
          let err = e as BusinessError
          console.error(`${testNum}setPriorityEnabledByBundle failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(err.code).assertEqual(202)
            expect(err.message).assertEqual('Not system application to call the interface')
            done()
          }
        });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Priority_Notification_Static_0600
     * @tc.number SUB_Notification_Ans_Priority_Notification_Static_0600
     * @tc.desc   [isPriorityEnabledByBundle] Error Code 202 Is Reported When a Third-Party App Calls This Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Priority_Notification_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_Priority_Notification_Static_0600';
      const bundleOption : notificationManager.BundleOption = {
        bundle: 'com.example.actsnotificationansprioritynotificationnosystemstatictest.static',
      };
      try {
        notificationManager.isPriorityEnabledByBundle(bundleOption).then((result : notificationManager.PriorityEnableStatus) => {
          console.info(`${testNum}isPriorityEnabledByBundle result is ${result}`);
          expect(false).assertTrue();
          done()
        }).catch((e: Error) => {
          let err = e as BusinessError
          console.error(`${testNum}isPriorityEnabledByBundle failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(err.code).assertEqual(202)
            expect(err.message).assertEqual('Not system application to call the interface')
            done()
          }
        });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Priority_Notification_Static_0700
     * @tc.number SUB_Notification_Ans_Priority_Notification_Static_0700
     * @tc.desc   [setAdditionalConfig] Error Code 202 Is Reported When a Third-Party App Calls This Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Priority_Notification_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_Priority_Notification_Static_0700';
      const bundleOption : notificationManager.BundleOption = {
        bundle: 'com.example.actsnotificationansprioritynotificationnosystemstatictest.static',
      };
      try {
        notificationManager.setAdditionalConfig('notificationRuleConfig','{"rules":[{"appAllowList":["com.example.actsnotificationansprioritynotificationnosystemstatictest.static"],"appDenyList":[],"id":502,"messageSource":0,"messageCategoryList":["IM"],"negativeKeywords":["地图","轿车"],"ruleLabelList":["ACCOUNT_ALERT"],"ruleName":"优先通知","ruleType":0,"textCondition":[["早报","晚报"],["晴","雨"]],"titleCondition":[["早报","晚报"],["晴","雨"]],"titleTextRelation":"and"}]}').then((data: int) => {
          console.info(`${testNum}setAdditionalConfig success, data: ${JSON.stringify(data)}`);
          expect(false).assertTrue();
          done()
        }).catch((e: Error): void => {
          let err = e as BusinessError
          console.error(`${testNum}setAdditionalConfig failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(err.code).assertEqual(202)
            expect(err.message).assertEqual('Not system application to call the interface')
            done()
          }
        });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })
  })
}
