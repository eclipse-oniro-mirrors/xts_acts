/*
 * Copyright (c) 2021-2023 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import notificationManager from '@ohos.notificationManager'
import notificationSubscribe from '@ohos.notificationSubscribe';
import { describe, it, expect, TestType, Size, Level, beforeAll, afterEach, beforeEach } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import {
  Component,
  Driver,
  ON,
  On,
  MatchPattern,
  MouseButton,
  WindowMode,
  UIElementInfo,
  UiDirection,
  PointerMatrix,
  DisplayRotation
} from '@ohos.UiTest'

let testAbilityContext: common.UIAbilityContext
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let bundle: string = 'com.example.actsnotificationslot.static'


export default function ActsNotificationSlotTest() {
  describe('SUB_NOTIFICATION_ANS_SLOT_TEST', () => {
    let TAG = 'SUB_NOTIFICATION_ANS_SLOT_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST START')

    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void => {
          testAbilityContext = abilitys.context
          hilog.info(domain, tag, '%{public}s', 'onAbilityCreate end');

        },
      }, (err: BusinessError | null): void => {
        if (err != null) {
          hilog.info(domain, tag, '%{public}s', '-----' + err.code);
        }
        hilog.info(domain, tag, '%{public}s', 'BusinessError  end');
      });
      await Utils.msSleep(1000)
      abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${JSON.stringify(bundle)}`)
      await Utils.msSleep(1000)
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })


    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_SLOT_ENUM_TEST_Static_0100
     * @tc.name      : SUB_NOTIFICATION_ANS_SLOT_ENUM_TEST_Static_0100
     * @tc.desc      : SlotType
     */
    it('SUB_NOTIFICATION_ANS_SLOT_ENUM_TEST_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_NOTIFICATION_ANS_SLOT_ENUM_TEST_Static_0100'
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SLOT_ENUM_TEST_0100 START`)
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
    console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST END')
  })
}
