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
import { Driver, ON } from '@ohos.UiTest'
import { AppStorage } from '@ohos.arkui.stateManagement'
import router from '@ohos.router'
import { Router } from '@ohos.arkui.UIContext';
import { UIContext } from '@ohos.arkui.UIContext'
import image from '@ohos.multimedia.image';
import {RecordData } from '@ohos.base';
import bundleManager from '@ohos.bundle.bundleManager'
import notificationExtensionSubscription from '@ohos.notificationExtensionSubscription';
import { notificationSubscribe } from '@kit.NotificationKit';
const TAG = 'NotificationHits';
const TEST_SUITE_NAME = 'Notification';
let DOMAIN_NUMBER: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let bundleName: string = "com.example.actsnotificationansopenwindowwithresultwithinabilitytest.static"
let context: common.UIAbilityContext;
let domain: int = 0x0000;
let tag: string = 'testTag';
export default function ActsNotificationAnsopenWindowWithResultWithinAbilityStaticTest() {
  const TEST_Project_NAME = 'ActsNotificationAnsopenWindowWithResultWithinAbilityStaticTest';
  describe('ActsNotificationAnsopenWindowWithResultWithinAbilityStaticTest', () => {

    beforeAll(async() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.startAbility({
        abilityName: "EntryAbility",
        bundleName: "com.example.actsnotificationansopenwindowwithresultwithinabilitytest.static"
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
      await notificationManager.removeAllSlots()
      await Utils.msSleep(1000)
      console.info(`${TAG} afterEach END`)
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_Static_1300
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_Static_1300
     * @tc.desc   After the openSubscriptionSettingsWithResult API is called to display a semi-modal dialog, the ability to receive local notifications is disabled. After the user clicks OK, the callback is correctly execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_Static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_openWindow_WithResult_Static_1300';
      let num:int=0
      let bundle: notificationManager.BundleOption = {
        bundle: bundleName,
      };
      let driver = Driver.create();
      let testContext: common.UIAbilityContext= AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      try {
        for (let index = 0; index < 500; index++) {
          notificationExtensionSubscription.openSubscriptionSettingsWithResult(testContext).then((data) => {
            console.info(`${testNum}${index+1}openSubscriptionSettingsWithResult success, data: ${JSON.stringify(data)}`);
            expect(index).assertEqual(0);
            done();
          }).catch(async(e:Error) => {
            let err = e as BusinessError
            console.error(`${testNum}${index+1}failed to call openSubscriptionSettingsWithResult  ${err.code}, ${err.message}`)
            if (err?.code === 801) {
              expect(err?.code).assertEqual(801);
              done();
            }else if (err?.code === 201) {
              expect(err?.code).assertEqual(201);
              if (index === 499) {
                done();
              }
            }else {
              expect(err?.code).assertEqual(1600018);
              if (index === 499) {
                await Utils.msSleep(1000)
                let buttonThree = await driver.findComponent(ON.text('确定'));
                console.info(`${testNum} button is ${JSON.stringify(buttonThree)}`);
                if (buttonThree !== null) {
                  await Utils.msSleep(500)
                  await buttonThree.click();
                  await Utils.msSleep(500)
                } else {
                  console.info(`${testNum} null button`);
                  expect(buttonThree).assertContain('确定')
                  await Utils.msSleep(1000)
                }
              }
            }
          });
        }

      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err?.code).assertEqual(801);
          done();
        }else if (err?.code === 201) {
          expect(err?.code).assertEqual(201);
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_Static_0800
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_Static_0800
     * @tc.desc   [openSubscriptionSettingsWithResult] After the openSubscriptionSettingsWithResult API is called to display a semi-modal dialog box and the user clicks OK, the callback is correctly executed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_openWindow_WithResult_Static_0800';
      let num:int=0
      let bundle: notificationManager.BundleOption = {
        bundle: bundleName,
      };
      let driver = Driver.create();
      let testContext: common.UIAbilityContext= AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      try {
        notificationExtensionSubscription.openSubscriptionSettingsWithResult(testContext).then((data) => {
          console.info(`${testNum}openSubscriptionSettingsWithResult success, data: ${JSON.stringify(data)}`);
          expect(data?.userGrantEnabled).assertEqual(false)
          expect(JSON.stringify(data?.grantedBundleInfos)).assertEqual('[]')
          done()
        }).catch((e:Error) => {
          let err = e as BusinessError
          console.error(`${testNum}failed to call openSubscriptionSettingsWithResult  ${err.code}, ${err.message}`)
          if (err?.code === 801) {
            expect(err?.code).assertEqual(801);
            done();
          }else if (err?.code === 201) {
            expect(err?.code).assertEqual(201);
            done();
          }else {
            expect(false).assertTrue();
            done();
          }
        });
        await Utils.msSleep(5000)
        await driver.assertComponentExist(ON.text('应用获取本机通知'));
        let buttonThree = await driver.findComponent(ON.text('确定'));
        console.info(`${testNum} button is ${JSON.stringify(buttonThree)}`);
        if (buttonThree !== null) {
          await Utils.msSleep(500)
          await buttonThree.click();
          await Utils.msSleep(500)
        } else {
          console.info(`${testNum} null button`);
          expect(buttonThree).assertContain('允许获取本机通知')
        }
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err?.code).assertEqual(801);
          done();
        }else if (err?.code === 201) {
          expect(err?.code).assertEqual(201);
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_Static_0500
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_Static_0500
     * @tc.desc   [openSubscriptionSettingsWithResult] After the openSubscriptionSettingsWithResult API is called to display a semi-modal dialog, the "Allow Notifications from This App" switch is turned on. The obtained local notifications remain unchanged, and the callback is correctly executed after the user clicks OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_openWindow_WithResult_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_openWindow_WithResult_Static_0500';
      let num:int=0
      let bundle: notificationManager.BundleOption = {
        bundle: bundleName,
      };
      let driver = Driver.create();
      let testContext: common.UIAbilityContext= AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      try {
        notificationExtensionSubscription.openSubscriptionSettingsWithResult(testContext).then((data) => {
          console.info(`${testNum}openSubscriptionSettingsWithResult success, data: ${JSON.stringify(data)}`);
          expect(data?.userGrantEnabled).assertEqual(true)
          expect(JSON.stringify(data?.grantedBundleInfos?.[3])).assertEqual('{"bundleName":"com.ohos.contacts","appIndex":0,"appName":"联系人"}')
          done()
        }).catch((e:Error) => {
          let err = e as BusinessError
          console.error(`${testNum}failed to call openSubscriptionSettingsWithResult  ${err.code}, ${err.message}`)
          if (err?.code === 801) {
            expect(err?.code).assertEqual(801);
            done();
          }else if (err?.code === 201) {
            expect(err?.code).assertEqual(201);
            done();
          }else {
            expect(false).assertTrue();
            done();
          }
        });
        await Utils.msSleep(5000)
        await driver.assertComponentExist(ON.text('应用获取本机通知'));
        let buttonOne = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('允许获取本机通知')));
        console.info(`${testNum} button is ${JSON.stringify(buttonOne)}`);
        if (buttonOne !== null) {
          await Utils.msSleep(500)
          await buttonOne.click();
          await Utils.msSleep(500)
        } else {
          console.info(`${testNum} null button`);
          expect(buttonOne).assertContain('允许获取本机通知')
        }
        let buttonTwo = await driver.findComponent(ON.text('允许'));
        console.info(`${testNum} button is ${JSON.stringify(buttonTwo)}`);
        if (buttonTwo !== null) {
          await Utils.msSleep(500)
          await buttonTwo.click();
          await Utils.msSleep(500)
        } else {
          console.info(`${testNum} null button`);
          expect(buttonTwo).assertContain('允许获取本机通知')
        }
        let buttonThree = await driver.findComponent(ON.text('确定'));
        console.info(`${testNum} button is ${JSON.stringify(buttonThree)}`);
        if (buttonThree !== null) {
          await Utils.msSleep(500)
          await buttonThree.click();
          await Utils.msSleep(500)
        } else {
          console.info(`${testNum} null button`);
          expect(buttonThree).assertContain('允许获取本机通知')
        }
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err?.code).assertEqual(801);
          done();
        }else if (err?.code === 201) {
          expect(err?.code).assertEqual(201);
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_Static_0600
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_Static_0600
     * @tc.desc   After the openSubscriptionSettingsWithResult API is called to display a semi-modal dialog, the ability to receive local notifications is disabled. After the user clicks OK, the callback is correctly executed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_openWindow_WithResult_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_openWindow_WithResult_Static_0600';
      let num:int=0
      let bundle: notificationManager.BundleOption = {
        bundle: bundleName,
      };
      let driver = Driver.create();
      let testContext: common.UIAbilityContext= AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      try {
        notificationExtensionSubscription.openSubscriptionSettingsWithResult(testContext).then((data) => {
          console.info(`${testNum}openSubscriptionSettingsWithResult success, data: ${JSON.stringify(data)}`);
          expect(data?.userGrantEnabled).assertEqual(false)
          expect(JSON.stringify(data?.grantedBundleInfos)).assertEqual('[]')
          done()
        }).catch((e:Error) => {
          let err = e as BusinessError
          console.error(`${testNum}failed to call openSubscriptionSettingsWithResult  ${err.code}, ${err.message}`)
          if (err?.code === 801) {
            expect(err?.code).assertEqual(801);
            done();
          }else if (err?.code === 201) {
            expect(err?.code).assertEqual(201);
            done();
          }else {
            expect(false).assertTrue();
            done();
          }
        });
        await Utils.msSleep(5000)
        await driver.assertComponentExist(ON.text('应用获取本机通知'));
        let buttonOne = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('允许获取本机通知')));
        console.info(`${testNum} button is ${JSON.stringify(buttonOne)}`);
        if (buttonOne !== null) {
          await Utils.msSleep(500)
          await buttonOne.click();
          await Utils.msSleep(500)
        } else {
          console.info(`${testNum} null button`);
          expect(buttonOne).assertContain('允许获取本机通知')
        }
        let buttonThree = await driver.findComponent(ON.text('确定'));
        console.info(`${testNum} button is ${JSON.stringify(buttonThree)}`);
        if (buttonThree !== null) {
          await Utils.msSleep(500)
          await buttonThree.click();
          await Utils.msSleep(500)
        } else {
          console.info(`${testNum} null button`);
          expect(buttonThree).assertContain('允许获取本机通知')
        }
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err?.code).assertEqual(801);
          done();
        }else if (err?.code === 201) {
          expect(err?.code).assertEqual(201);
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_Static_1000
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_Static_1000
     * @tc.desc   [openSubscriptionSettingsWithResult] After the call to openSubscriptionSettingsWithResult is used to modify the setting of whether to allow the app to obtain local notifications and the setting is confirmed, the app is closed. Then, the openSubscriptionSettingsWithResult call is used again to directly close the app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_openWindow_WithResult_Static_1000';
      let num:int=0
      let bundle: notificationManager.BundleOption = {
        bundle: bundleName,
      };
      let driver = Driver.create();
      let testContext: common.UIAbilityContext= AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      try {
        notificationExtensionSubscription.openSubscriptionSettingsWithResult(testContext).then((data) => {
          console.info(`${testNum}openSubscriptionSettingsWithResult success, data: ${JSON.stringify(data)}`);
          expect(data?.userGrantEnabled).assertEqual(true)
          expect(JSON.stringify(data?.grantedBundleInfos?.[0])).assertEqual('{"bundleName":"com.example.actsnotificationansopenwindowwithresultwithinabilitytest.static","appIndex":0,"appName":"zzztest"}')
        }).catch((e:Error) => {
          let err = e as BusinessError
          console.error(`${testNum}failed to call openSubscriptionSettingsWithResult  ${err.code}, ${err.message}`)
          if (err?.code === 801) {
            expect(err?.code).assertEqual(801);
            done();
          }else if (err?.code === 201) {
            expect(err?.code).assertEqual(201);
            done();
          }else {
            expect(false).assertTrue();
            done();
          }
        });
        await Utils.msSleep(5000)
        await driver.assertComponentExist(ON.text('应用获取本机通知'));
        let buttonOne = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('允许获取本机通知')));
        console.info(`${testNum} button is ${JSON.stringify(buttonOne)}`);
        if (buttonOne !== null) {
          await Utils.msSleep(500)
          await buttonOne.click();
          await Utils.msSleep(500)
        } else {
          console.info(`${testNum} null button`);
          expect(buttonOne).assertContain('允许获取本机通知')
        }
        await Utils.msSleep(2000)
        let buttonTwo = await driver.findComponent(ON.text('允许'));
        console.info(`${testNum} button is ${JSON.stringify(buttonTwo)}`);
        if (buttonTwo !== null) {
          await Utils.msSleep(500)
          await buttonTwo.click();
          await Utils.msSleep(500)
        } else {
          console.info(`${testNum} null button`);
          expect(buttonTwo).assertContain('允许获取本机通知')
        }
        await Utils.msSleep(2000)
        let scrollBar = await driver.findComponent(ON.type('List').isAfter(ON.text('应用获取本机通知')))
        console.info(testNum + `scrollToBottom scrollBar, ${JSON.stringify(scrollBar)} `);
        expect(scrollBar != null).assertTrue()
        scrollBar?.scrollToBottom()
        await Utils.msSleep(60000)
        let button = await driver.findComponent(ON.type('Toggle').isAfter(ON.originalText('zzztest')));
        console.info(`${testNum} button is ${JSON.stringify(button)}`);
        if (button !== null) {
          await Utils.msSleep(500)
          await button.click();
          await Utils.msSleep(500)
        } else {
          console.info(`${testNum} null button`);
          expect(button).assertContain('zzztest')
        }
        let buttonThree = await driver.findComponent(ON.text('确定'));
        console.info(`${testNum} button is ${JSON.stringify(buttonThree)}`);
        if (buttonThree !== null) {
          await Utils.msSleep(500)
          await buttonThree.click();
          await Utils.msSleep(500)
        } else {
          console.info(`${testNum} null button`);
          expect(buttonThree).assertContain('确定')
        }
        notificationExtensionSubscription.openSubscriptionSettingsWithResult(testContext).then((data) => {
          console.info(`${testNum}openSubscriptionSettingsWithResult success, data: ${JSON.stringify(data)}`);
          expect(data?.userGrantEnabled).assertEqual(true)
          expect(JSON.stringify(data?.grantedBundleInfos?.[0])).assertEqual('{"bundleName":"com.example.actsnotificationansopenwindowwithresultwithinabilitytest.static","appIndex":0,"appName":"zzztest"}')
          done()
        }).catch((e:Error) => {
          let err = e as BusinessError
          console.error(`${testNum}failed to call openSubscriptionSettingsWithResult  ${err.code}, ${err.message}`)
          if (err?.code === 801) {
            expect(err?.code).assertEqual(801);
            done();
          }else if (err?.code === 201) {
            expect(err?.code).assertEqual(201);
            done();
          }else {
            expect(false).assertTrue();
            done();
          }
        });
        await Utils.msSleep(2000)
        let buttonStack = await driver.findComponent(ON.type("SymbolGlyph"));
        console.info(`${testNum} buttonStack is ${JSON.stringify(buttonStack)}`);
        if (buttonStack !== null) {
          console.info(`${testNum} buttonStack is ${JSON.stringify(buttonStack)}`);
          await Utils.msSleep(500)
          await buttonStack?.click();
          await Utils.msSleep(500)
        } else {
          console.info(`${testNum} null button`);
          expect(buttonStack).assertContain('SymbolGlyph')
        }
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err?.code).assertEqual(801);
          done();
        }else if (err?.code === 201) {
          expect(err?.code).assertEqual(201);
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    })

  })
}
