/*
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
import notificationManager from '@ohos.notificationManager'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '../../../hypium/index'
import {BusinessError} from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import { Component, Driver, ON } from '@ohos.UiTest'
let domain:number = 0x000
let bundle_name:string = "com.example.actsnotificationmanagerslot.static"
let testAbilityContext:common.UIAbilityContext;

export default function ActsNotificationManagerSlotTest() {
  describe('SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST', () => {
    let TAG:string = 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST START')
    beforeAll(() => {
      hilog.info(domain, TAG, '%{public}s', 'beforeAll start');
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          hilog.info(domain, TAG, '%{public}s', 'onAbilityCreate end');

        },
      }, (err : BusinessError | null) : void => {
        if (err != null ) {
          hilog.info(domain, TAG, '%{public}s', '-----'+ err.code);
        }
        hilog.info(domain, TAG, '%{public}s', 'BusinessError  end');
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b" + bundle_name)
      await Utils.msSleep(2000)
      hilog.info(domain, TAG, '%{public}s', 'beforeAll end');
    })


    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_8150
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_8150
     * @tc.desc      : SlotType
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_8150', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_8150 '
      console.info(`${TAG} Sub_Notification_Ans_Slot_CreateSlot_Static_8150 START`)
      expect(notificationManager.SlotType.UNKNOWN_TYPE as number).assertEqual(0)
      expect(notificationManager.SlotType.SOCIAL_COMMUNICATION as number).assertEqual(1)
      expect(notificationManager.SlotType.SERVICE_INFORMATION as number).assertEqual(2)
      expect(notificationManager.SlotType.CONTENT_INFORMATION as number).assertEqual(3)
      expect(notificationManager.SlotType.OTHER_TYPES as number).assertEqual(0xFFFF)
      expect(notificationManager.SlotLevel.LEVEL_NONE as number).assertEqual(0)
      expect(notificationManager.SlotLevel.LEVEL_MIN as number).assertEqual(1)
      expect(notificationManager.SlotLevel.LEVEL_LOW as number).assertEqual(2)
      expect(notificationManager.SlotLevel.LEVEL_DEFAULT as number).assertEqual(3)
      expect(notificationManager.SlotLevel.LEVEL_HIGH as number).assertEqual(4)
      done()
    })
    console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST END')
  })
}
