/*
* Copyright (c) 2021 Huawei Device Co., Ltd.
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

const TAG = 'NotificationHits';
const TEST_SUITE_NAME = 'Notification';
let DOMAIN_NUMBER: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let bundleName: string = "com.example.actsnotificationansenablebatchnosystemstatictest.static"
let context: common.UIAbilityContext;
let domain: int = 0x0000;
let tag: string = 'testTag';
export default function actsNotificationAnsEnableBatchNoSystemStaticTest() {
  const TEST_Project_NAME = 'actsNotificationAnsEnableBatchNoSystemStaticTest';
  describe('actsNotificationAnsEnableBatchNoSystemStaticTest', () => {

    beforeAll(async() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.startAbility({
        abilityName: "EntryAbility",
        bundleName: "com.example.actsnotificationansenablebatchnosystemstatictest.static"
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
     * @tc.name   SUB_Notification_Ans_Enable_Batch_Static_0100
     * @tc.number SUB_Notification_Ans_Enable_Batch_Static_0100
     * @tc.desc   1.2 Call the setReminderInfoByBundles, getReminderInfoByBundles, getBadgeDisplayStatusByBundles, and setBadgeDisplayStatusByBundles interfaces, where hap is a third-party application, and an error 202 is reported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Notification_Ans_Enable_Batch_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_Enable_Batch_Static_0100';
      let nullStr:string=''
      let reminderInfosOne: Array<notificationManager.NotificationReminderInfo> = [
        {
          bundle: {
            bundle:"com.example.actsnotificationansenablebatchnosystemstatictest.static"
          },
          reminderFlags: 58,
          silentReminderEnabled: false
        },
      ];
      let bundles: Array<notificationManager.BundleOption> = [
        {
          bundle:"com.example.actsnotificationansenablebatchnosystemstatictest.static",
        }
      ];
      let badges = new Map<notificationManager.BundleOption, boolean>();
      let bundle: notificationManager.BundleOption = {
        bundle: 'com.example.actsnotificationansenablebatchnosystemstatictest.static',
      };
      badges.set(bundle, true);
      try {
          notificationManager.setReminderInfoByBundles(reminderInfosOne).then(() => {
            console.info(`${testNum}setReminderInfoByBundles success`);
            expect(false).assertTrue();
            done()
          }).catch((error)=>{
            let err:BusinessError=error as BusinessError
            console.error(`${testNum}setReminderInfoByBundles fail: ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(202)
          })
        try{
          await notificationManager.getReminderInfoByBundles(bundles).then((data: Array<notificationManager.NotificationReminderInfo>) => {
            console.info(`${testNum}Reminder data is ${JSON.stringify(data)}`);
            expect(false).assertTrue();
            done()
          }).catch((error)=>{
            let err:BusinessError=error as BusinessError
            console.error(`${testNum}setReminderInfoByBundles fail: ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(202)
          })
        } catch(err) {
          console.error(`${testNum}GetReminderInfoByBundles failed, code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(202)
        };
        try{
          await notificationManager.getBadgeDisplayStatusByBundles(bundles).then((data: Map<notificationManager.BundleOption, boolean>) => {
            console.info(`${testNum}getBadgeDisplayStatusByBundles`);
            console.info(`${testNum} data is ${JSON.stringify(data)}`);
            expect(false).assertTrue();
            done()
          }).catch((error)=>{
            let err:BusinessError=error as BusinessError
            console.error(`${testNum}setReminderInfoByBundles fail: ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(202)
          })
        } catch(err) {
          console.error(`${testNum}GetBadgeDisplayStatusByBundles failed, code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(202)
        };
          notificationManager.setBadgeDisplayStatusByBundles(badges).then(() => {
            console.info(`${testNum}setReminderInfoByBundles success`);
            expect(false).assertTrue();
            done()
          }).catch((error)=>{
            let err:BusinessError=error as BusinessError
            console.error(`${testNum}setReminderInfoByBundles fail: ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(202)
            done()
          })
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message},${testNum}`);
        expect(err).assertEqual(0)
        done();
      }
    })

  })
}
