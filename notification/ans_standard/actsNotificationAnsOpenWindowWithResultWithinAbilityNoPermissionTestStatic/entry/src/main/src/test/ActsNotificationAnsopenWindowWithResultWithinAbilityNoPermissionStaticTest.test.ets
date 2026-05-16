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
const TAG = 'NotificationHits';
const TEST_SUITE_NAME = 'Notification';
let DOMAIN_NUMBER: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let bundleName: string = "com.example.actsnotificationansopenwindowwithresultwithinabilitynopermissiontest.static"
let context: common.UIAbilityContext;
let domain: int = 0x0000;
let tag: string = 'testTag';
export default function ActsNotificationAnsopenWindowWithResultWithinAbilityNoPermissionStaticTest() {
  const TEST_Project_NAME = 'ActsNotificationAnsopenWindowWithResultWithinAbilityNoPermissionStaticTest';
  describe('ActsNotificationAnsopenWindowWithResultWithinAbilityNoPermissionStaticTest', () => {

    beforeAll(async() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.startAbility({
        abilityName: "EntryAbility",
        bundleName: "com.example.actsnotificationansopenwindowwithresultwithinabilitynopermissiontest.static"
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
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_Static_0300
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_Static_0300
     * @tc.desc   [openSubscriptionSettingsWithResult] The openSubscriptionSettingsWithResult API is called when the app does not request the ohos.permission.SUBSCRIBE_NOTIFICATION permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_openWindow_WithResult_Static_0300';
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
          } else {
            expect(err?.code).assertEqual(201);
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

  })
}
