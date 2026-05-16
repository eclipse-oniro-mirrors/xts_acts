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
import commonEventManager from '@ohos.commonEventManager'
import router from '@ohos.router'
import { Router } from '@ohos.arkui.UIContext';
import { UIContext } from '@ohos.arkui.UIContext'
import image from '@ohos.multimedia.image';
import { RecordData } from '@ohos.base';
import bundleManager from '@ohos.bundle.bundleManager'
import notificationExtensionSubscription from '@ohos.notificationExtensionSubscription';
import { notificationSubscribe } from '@kit.NotificationKit';
import deviceInfo from '@ohos.deviceInfo';
const TAG = 'NotificationHits';
const TEST_SUITE_NAME = 'Notification';
let DOMAIN_NUMBER: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let bundleName: string = "com.example.actsnotificationansopenwindowwithresultstatictest.static"
let context: common.UIAbilityContext;
let domain: int = 0x0000;
let tag: string = 'testTag';
export default function ActsNotificationAnsopenWindowWithResultWithoutAbilityStaticTest() {
  const TEST_Project_NAME = 'ActsNotificationAnsopenWindowWithResultWithoutAbilityStaticTest';
  describe('ActsNotificationAnsopenWindowWithResultWithoutAbilityStaticTest', () => {

    beforeAll(async() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.startAbility({
        abilityName: "EntryAbility",
        bundleName: "com.example.actsnotificationansopenwindowwithresultstatictest.static"
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
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_Static_0700
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_Static_0700
     * @tc.desc   [openNotificationSettingsWithResult] After the openNotificationSettingsWithResult API is called to display a semi-modal dialog and the user clicks OK, the callback is correctly executed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_openWindow_WithResult_Static_0700';
      let num:int=0
      let bundle: notificationManager.BundleOption = {
        bundle: bundleName,
      };
      let driver = Driver.create();
      let deviceTypeInfo: string = deviceInfo.deviceType;
      let testContext: common.UIAbilityContext= AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      try {
        notificationManager.openNotificationSettingsWithResult(testContext).then((data) => {
          hilog.info(0x0000, 'testTag', `${testNum}openNotificationSettingsWithResult success, data: ${JSON.stringify(data)}`);
          expect(data.notificationEnabled).assertEqual(false)
          expect(data.bannerEnabled).assertEqual(false)
          expect(data.badgeNumberEnabled).assertEqual(true)
          done()
        }).catch((error: Error) : void => {
          let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}openNotificationSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err?.code).assertEqual(801);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
        await Utils.msSleep(2000)
        await driver.assertComponentExist(ON.text('通知管理'));
        let buttonOne = await driver.findComponent(ON.text('确定'));
        console.info(`${testNum} button is ${JSON.stringify(buttonOne)}`);
        if (buttonOne !== null) {
          await Utils.msSleep(500)
          await buttonOne.click();
          await Utils.msSleep(500)
        } else {
          console.info(`${testNum} null button`);
          expect(buttonOne).assertContain('确定')
        }
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message},${testNum}`);
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
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_Static_0100
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_Static_0100
     * @tc.desc   [openNotificationSettingsWithResult] After the openNotificationSettingsWithResult method is called to enable or disable the ringing and vibration switch and then the user confirms the operation, the callback is correctly executed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_openWindow_WithResult_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_openWindow_WithResult_Static_0100';
      let num:int=0
      let bundle: notificationManager.BundleOption = {
        bundle: bundleName,
      };
      let driver = Driver.create();
      let deviceTypeInfo: string = deviceInfo.deviceType;
      let buttonName:string[]=['桌面角标','确定']

      let testContext: common.UIAbilityContext= AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      try {
        notificationManager.openNotificationSettingsWithResult(testContext).then((data) => {
          hilog.info(0x0000, 'testTag', `${testNum}openNotificationSettingsWithResult success, data: ${JSON.stringify(data)}`);
          expect(data.notificationEnabled).assertEqual(true)
          expect(data.bannerEnabled).assertEqual(false)
          expect(data.badgeNumberEnabled).assertEqual(false)
          done()
        }).catch((error: Error) : void => {
          let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}openNotificationSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err?.code).assertEqual(801);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
        await Utils.msSleep(2000)
        let buttonOne = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('允许通知')));
        console.info(`${testNum} button is ${JSON.stringify(buttonOne)}`);
        if (buttonOne !== null) {
          await Utils.msSleep(500)
          await buttonOne.click();
          await Utils.msSleep(500)
        } else {
          console.info(`${testNum} null button`);
          expect(buttonOne).assertContain('允许通知')
        }
        for (let index = 0; index < buttonName.length; index++) {
          await Utils.msSleep(500)
          let name = buttonName[index];
          if (name === '桌面角标') {
            let scrollBar = await driver.findComponent(ON.text('桌面角标'))
            console.info(testNum + `scrollToBottom scrollBar, ${JSON.stringify(scrollBar)} `);
            expect(scrollBar != null).assertTrue()
            scrollBar?.scrollToBottom()
            await Utils.msSleep(3000)
          }
          await Utils.msSleep(1000)
          let button = await driver.findComponent(ON.text(name));
          console.info(`${testNum} ${name} button is ${JSON.stringify(button)}`);
          if (button !== null) {
            await Utils.msSleep(500)
            await button.click();
            await Utils.msSleep(500)
          } else {
            console.info(`${testNum} null button`);
            expect(button).assertContain(name)
          }
          await Utils.msSleep(500)
        }
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message},${testNum}`);
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
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_Static_0200
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_Static_0200
     * @tc.desc   [openNotificationSettingsWithResult] After the openNotificationSettingsWithResult method is called to enable or disable the ringing and vibration switch and then the user confirms the operation, the callback is correctly executed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_openWindow_WithResult_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_openWindow_WithResult_Static_0200';
      let num:int=0
      let bundle: notificationManager.BundleOption = {
        bundle: bundleName,
      };
      let driver = Driver.create();
      let buttonName:string[]=['横幅通知','桌面角标','确定']
      let deviceTypeInfo: string = deviceInfo.deviceType;
      let testContext: common.UIAbilityContext= AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      try {
        await Utils.msSleep(1000)
        notificationManager.openNotificationSettingsWithResult(testContext).then((data) => {
          hilog.info(0x0000, 'testTag', `${testNum}openNotificationSettingsWithResult success, data: ${JSON.stringify(data)}`);
          expect(data?.bannerEnabled).assertEqual(true);
          expect(data?.badgeNumberEnabled).assertEqual(true);
          expect(data?.notificationEnabled).assertEqual(true);
          done()
        }).catch((error: Error) : void => {
          let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}openNotificationSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err?.code).assertEqual(801);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
        await Utils.msSleep(3000)
        for (let index = 0; index < buttonName.length; index++) {
          await Utils.msSleep(500)
          let name = buttonName[index];
          if (name === '桌面角标') {
            let scrollBar = await driver.findComponent(ON.text('桌面角标'))
            console.info(testNum + `scrollToBottom scrollBar, ${JSON.stringify(scrollBar)} `);
            expect(scrollBar != null).assertTrue()
            scrollBar?.scrollToBottom()
            await Utils.msSleep(6000)
          }
          let button = await driver.findComponent(ON.text(name));
          console.info(`${testNum} ${name} button is ${JSON.stringify(button)}`);
          if (button !== null) {
            await Utils.msSleep(500)
            await button.click();
            await Utils.msSleep(500)
          } else {
            console.info(`${testNum} null button`);
            expect(button).assertContain(name)
          }
          await Utils.msSleep(500)
        }
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message},${testNum}`);
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
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_Static_0400
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_Static_0400
     * @tc.desc   [openSubscriptionSettingsWithResult] The NotificationSubscriberExtensionAbility of an app does not implement the openSubscriptionSettingsWithResult API, and error 1600023 is reported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_openWindow_WithResult_Static_0400';
      let num:int=0
      let bundle: notificationManager.BundleOption = {
        bundle: bundleName,
      };
      let testContext: common.UIAbilityContext= AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      try {
        notificationExtensionSubscription.openSubscriptionSettingsWithResult(testContext).then((data) => {
          console.info(`${testNum}openSubscriptionSettingsWithResult success, data: ${JSON.stringify(data)}`);
          expect(false).assertTrue();
          done();
        }).catch((e:Error) => {
          let err = e as BusinessError
          console.error(`${testNum}failed to call openSubscriptionSettingsWithResult  ${err.code}, ${err.message}`)
          if (err?.code === 801) {
            expect(err?.code).assertEqual(801);
            done();
          } else if(err?.code === 201) {
            expect(err?.code).assertEqual(201);
            done();
          } else {
            expect(err?.code).assertEqual(1600023);
            done();
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
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_Static_0900
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_Static_0900
     * @tc.desc   [openNotificationSettingsWithResult] Invoke openNotificationSettingsWithResult, modify the lock screen notification, banner notification, desktop icon, ringing, vibration, and notification enable status, and then disable it. Invoke openNotificationSettingsWithResult again to close the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_openWindow_WithResult_Static_0900';
      let num:int=0
      let bundle: notificationManager.BundleOption = {
        bundle: bundleName,
      };
      let driver = Driver.create();
      let buttonName:string[]=['桌面角标','确定']
      let deviceTypeInfo: string = deviceInfo.deviceType;
      let testContext: common.UIAbilityContext= AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      try {
        notificationManager.openNotificationSettingsWithResult(testContext).then((data) => {
          hilog.info(0x0000, 'testTag', `${testNum}openNotificationSettingsWithResult success, data: ${JSON.stringify(data)}`);
          expect(data.notificationEnabled).assertEqual(true)
          expect(data.bannerEnabled).assertEqual(true)
          expect(data.badgeNumberEnabled).assertEqual(true)
        }).catch((error: Error) : void => {
          let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}openNotificationSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err?.code).assertEqual(801);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
        await Utils.msSleep(1000)
        for (let index = 0; index < buttonName.length; index++) {
          await Utils.msSleep(500)
          let name = buttonName[index];
          if (name === '桌面角标') {
            let scrollBar = await driver.findComponent(ON.text('桌面角标'))
            console.info(testNum + `scrollToBottom scrollBar, ${JSON.stringify(scrollBar)} `);
            expect(scrollBar != null).assertTrue()
            scrollBar?.scrollToBottom()
            await Utils.msSleep(3000)
          }else{
            let button = await driver.findComponent(ON.text(name));
            console.info(`${testNum} ${name} button is ${JSON.stringify(button)}`);
            if (button !== null) {
              await Utils.msSleep(500)
              await button.click();
              await Utils.msSleep(500)
            } else {
              console.info(`${testNum} null button`);
              expect(button).assertContain(name)
            }
          }
          await Utils.msSleep(500)
        }
        await Utils.msSleep(2000)
        notificationManager.openNotificationSettingsWithResult(testContext).then((data) => {
          hilog.info(0x0000, 'testTag', `${testNum}openNotificationSettingsWithResult success, data: ${JSON.stringify(data)}`);
          expect(data.notificationEnabled).assertEqual(true)
          expect(data.bannerEnabled).assertEqual(true)
          expect(data.badgeNumberEnabled).assertEqual(true)
          done()
        }).catch((error: Error) : void => {
          let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}openNotificationSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err?.code).assertEqual(801);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
        await Utils.msSleep(1000)
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
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_Static_1100
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_Static_1100
     * @tc.desc   [openNotificationSettingsWithResult] The openNotificationSettingsWithResult method is called, and the lock screen notification, banner notification, app icon badge, ringing, vibration, and notification enabling switches are turned on. Then, a notification is sent to remind the user of the new notification mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_openWindow_WithResult_Static_1100';
      let num:int=0
      let bundle: notificationManager.BundleOption = {
        bundle: bundleName,
      };
      let driver = Driver.create();
      let buttonName:string[]= ['桌面角标','确定']
      let deviceTypeInfo: string = deviceInfo.deviceType;
      let notificationRequest: notificationManager.NotificationRequest = {
        id: 1,
        notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "test_title",
            text: "test_text",
            additionalText: "test_additionalText"
          }
        },
      }
      let testContext: common.UIAbilityContext= AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      try {
        notificationManager.openNotificationSettingsWithResult(testContext).then((data) => {
          hilog.info(0x0000, 'testTag', `${testNum}openNotificationSettingsWithResult success, data: ${JSON.stringify(data)}`);
          expect(data?.bannerEnabled).assertEqual(true);
          expect(data?.badgeNumberEnabled).assertEqual(true);
          expect(data?.notificationEnabled).assertEqual(true);
        }).catch((error: Error) : void => {
          let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum}openNotificationSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err?.code).assertEqual(801);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
        await Utils.msSleep(1000)
        for (let index = 0; index < buttonName.length; index++) {
          await Utils.msSleep(500)
          let name = buttonName[index];
          if (name === '桌面角标') {
            let scrollBar = await driver.findComponent(ON.text('桌面角标'))
            console.info(testNum + `scrollToBottom scrollBar, ${JSON.stringify(scrollBar)} `);
            expect(scrollBar != null).assertTrue()
            scrollBar?.scrollToBottom()
            await Utils.msSleep(3000)
          }else{
            let button = await driver.findComponent(ON.text(name));
            console.info(`${testNum} ${name} button is ${JSON.stringify(button)}`);
            if (button !== null) {
              await Utils.msSleep(500)
              await button.click();
              await Utils.msSleep(500)
            } else {
              console.info(`${testNum} null button`);
              expect(button).assertContain(name)
            }
          }
          await Utils.msSleep(500)
        }
        await Utils.msSleep(1000)
        notificationManager.publish(notificationRequest).then(() => {
          num++
          console.info(testNum+"publish success");
          expect(num).assertEqual(1)
          done()
        }).catch((error: Error) : void => {
          let err:BusinessError=error as BusinessError
          console.error(`${testNum}publish failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
            done()
          }
        });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message},${testNum}`);
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
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_Static_1200
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_Static_1200
     * @tc.desc   Call the openNotificationSettingsWithResult API 500 times, and no crash, freeze, or black screen occurs on the device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_openWindow_WithResult_Static_1200';
      let num:int=0
      let bundle: notificationManager.BundleOption = {
        bundle: bundleName,
      };
      let driver = Driver.create();
      let testContext: common.UIAbilityContext= AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      try {
        await Utils.msSleep(1000)
        for (let index = 0; index < 500; index++) {
          notificationManager.openNotificationSettingsWithResult(testContext).then((data) => {
            hilog.info(0x0000, 'testTag', `${testNum}${index+1}openNotificationSettingsWithResult success, data: ${JSON.stringify(data)}`);
            expect(index).assertEqual(0);
          }).catch(async(e:Error) => {
            let err:BusinessError=e as BusinessError
            hilog.error(0x0000, 'testTag', `${testNum}${index+1}openNotificationSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
            if (err?.code === 801) {
              expect(err?.code).assertEqual(801);
              done();
            } else {
              expect(err?.code).assertEqual(1600018);
              if (index === 499) {
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
                await Utils.msSleep(500)
                done()
              }
            }
          });
        }
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message},${testNum}`);
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
