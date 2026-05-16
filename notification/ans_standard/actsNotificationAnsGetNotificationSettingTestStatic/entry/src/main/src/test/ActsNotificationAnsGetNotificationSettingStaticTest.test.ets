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
import { BusinessError, RecordData } from '@ohos.base';
import hilog from '@ohos.hilog';
import WantAgent from '@ohos.app.ability.wantAgent';
import wantagent from '@ohos.app.ability.wantAgent';
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager'
import notificationExtensionSubscription from '@ohos.notificationExtensionSubscription';
import { notificationSubscribe } from '@kit.NotificationKit';
import deviceInfo from '@ohos.deviceInfo';
const TAG = 'NotificationHits';
const TEST_SUITE_NAME = 'Notification';
let DOMAIN_NUMBER: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let bundleName: string = "com.example.actsnotificationansgetnotificationsettingtest.static"
let context: common.UIAbilityContext;
let domain: int = 0x0000;
let tag: string = 'testTag';
export default function ActsNotificationAnsGetNotificationSettingStaticTest() {
  const TEST_Project_NAME = 'ActsNotificationAnsGetNotificationSettingStaticTest';
  describe('ActsNotificationAnsGetNotificationSettingStaticTest', () => {

    beforeAll(async() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.startAbility({
        abilityName: "EntryAbility",
        bundleName: "com.example.actsnotificationansgetnotificationsettingtest.static"
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
      await Utils.msSleep(5000)
      console.info(`${TAG} afterEach END`)
    })

    /**
     * @tc.name   SUB_Notification_Ans_GetNotificationSetting_Static_0100
     * @tc.number SUB_Notification_Ans_GetNotificationSetting_Static_0100
     * @tc.desc   [Half-modal setting] The half-modal setting screen is displayed when openNotificationSettings is called to disable lock screen, notification, and badge badge and enable notifications. getNotificationSetting is successfully called
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_GetNotificationSetting_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_GetNotificationSetting_Static_0100';
      let num:int=0
      let bundle: notificationManager.BundleOption = {
        bundle: bundleName,
      };
      let driver = Driver.create();
      let buttonName:string[]=['桌面角标','允许通知','确定']
      let testContext: common.UIAbilityContext= AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      try {
        notificationManager.openNotificationSettingsWithResult(testContext).then((data) => {
          num=0
          hilog.info(0x0000, 'testTag', `${testNum}openNotificationSettingsWithResult success, data: ${JSON.stringify(data)}`);
          num++
          expect(num).assertEqual(1);
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
        let buttonOne = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('允许通知')));
        console.info(`${testNum} button is ${JSON.stringify(buttonOne)}`);
        if (buttonOne !== null) {
          await Utils.msSleep(1500)
          await buttonOne.click();
          await Utils.msSleep(1500)
        } else {
          console.info(`${testNum} null button`);
          expect(buttonOne).assertContain('允许通知')
        }
        await Utils.msSleep(1500)
        for (let index = 0; index < buttonName.length; index++) {
          await Utils.msSleep(1500)
          let name = buttonName[index];
          await Utils.msSleep(1000)
          if (name==='允许通知') {
            let button = await driver.findComponent(ON.type('Toggle').isAfter(ON.text(name)));
            console.info(`${testNum} ${name} button is ${JSON.stringify(button)}`);
            if (button !== null) {
              await Utils.msSleep(1500)
              await button.click();
              await Utils.msSleep(1500)
            } else {
              console.info(`${testNum} null button`);
              expect(button).assertContain(name)
            }
          }else{
            let button = await driver.findComponent(ON.text(name));
            console.info(`${testNum} ${name} button is ${JSON.stringify(button)}`);
            if (button !== null) {
              await Utils.msSleep(1500)
              await button.click();
              await Utils.msSleep(1500)
            } else {
              console.info(`${testNum} null button`);
              expect(button).assertContain(name)
            }
          }
          await Utils.msSleep(1500)
        }
        notificationManager.getNotificationSetting().then((data: notificationManager.NotificationSetting) => {
          console.info(`${testNum}getNotificationSetting success, data: ${JSON.stringify(data)}`);
          expect(data.notificationEnabled).assertEqual(false)
          expect(data.bannerEnabled).assertEqual(false)
          expect(data.badgeNumberEnabled).assertEqual(false)
          done()
        }).catch((error: Error): void => {
          let err:BusinessError=error as BusinessError
          console.error(`${testNum}getNotificationSetting failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(false).assertTrue();
            done();
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
     * @tc.name   SUB_Notification_Ans_GetNotificationSetting_Static_0400
     * @tc.number SUB_Notification_Ans_GetNotificationSetting_Static_0400
     * @tc.desc   getNotificationSetting test of true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_GetNotificationSetting_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      let testNum: string = 'SUB_Notification_Ans_GetNotificationSetting_Static_0400'
      let num:int=0
      let bundle: notificationManager.BundleOption = {
        bundle: bundleName,
      };
      let driver = Driver.create();
      let buttonName:string[]=['桌面角标','横幅通知','确定']
      let testContext: common.UIAbilityContext= AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      try {
        notificationManager.openNotificationSettingsWithResult(testContext).then((data) => {
          num=0
          hilog.info(0x0000, 'testTag', `${testNum} openNotificationSettingsWithResult success, data: ${JSON.stringify(data)}`);
          num++
          expect(num).assertEqual(1);
        }).catch((error: Error) : void => {
          let err:BusinessError=error as BusinessError
          hilog.error(0x0000, 'testTag', `${testNum} openNotificationSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err?.code).assertEqual(801);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
        await driver.assertComponentExist(ON.text('通知管理'));
        await Utils.msSleep(2000)
        let buttonOne = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('允许通知')));
        console.info(`${testNum} button is ${JSON.stringify(buttonOne)}`);
        if (buttonOne !== null) {
          await Utils.msSleep(1500)
          await buttonOne.click();
          await Utils.msSleep(1500)
        } else {
          console.info(`${testNum} null button`);
          expect(buttonOne).assertContain('允许通知')
        }
        await Utils.msSleep(1500)
        for (let index = 0; index < buttonName.length; index++) {
          await Utils.msSleep(1500)
          let name = buttonName[index];
          await Utils.msSleep(1000)
          if (name==='允许通知') {
            let button = await driver.findComponent(ON.type('Toggle').isAfter(ON.text(name)));
            console.info(`${testNum} ${name} button is ${JSON.stringify(button)}`);
            if (button !== null) {
              await Utils.msSleep(1500)
              await button.click();
              await Utils.msSleep(1500)
            } else {
              console.info(`${testNum} null button`);
              expect(button).assertContain(name)
            }
          }else{
            let button = await driver.findComponent(ON.text(name));
            console.info(`${testNum} ${name} button is ${JSON.stringify(button)}`);
            if (button !== null) {
              await Utils.msSleep(1500)
              await button.click();
              await Utils.msSleep(1500)
            } else {
              console.info(`${testNum} null button`);
              expect(button).assertContain(name)
            }
          }
          await Utils.msSleep(1500)
        }
        notificationManager.getNotificationSetting().then((data: notificationManager.NotificationSetting) => {
          console.info(`${testNum}getNotificationSetting success, data: ${JSON.stringify(data)}`);
          expect(data.notificationEnabled).assertEqual(true)
          expect(data.bannerEnabled).assertEqual(true)
          expect(data.badgeNumberEnabled).assertEqual(true)
          done()
        }).catch((error: Error): void => {
          let err:BusinessError=error as BusinessError
          console.error(`${testNum}getNotificationSetting failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(false).assertTrue();
            done();
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
  })
}
