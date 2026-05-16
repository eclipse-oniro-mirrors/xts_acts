/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Level, Size, TestType, beforeAll, beforeEach, describe, it, afterEach } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Utils.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import { WebNetErrorList } from '@ohos.web.netErrorList';
import { BusinessError } from '@ohos.base'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext:common.UIAbilityContext;
export default function MediaPlaybackState() {

  describe('MediaPlaybackState', () => {
    beforeAll(async (): Promise<void> => {
      console.log("App start")
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void=> {
          testAbilityContext = abilitys.context
          console.log("onAbilityCreate end")
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null) {
          console.log("-----" + err.code)
        }
        console.log("BusinessError  end")
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.internetvideoplaybacksixtest.static")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    /**
    * @tc.name        GetMediaPlaybackStateStatic0100
    * @tc.number      SUB_WEB_GET_MEDIA_PLAYBACK_STATE_0100
    * @tc.desc        test GetMediaPlaybackState
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 0
    */
    it('GetMediaPlaybackStateStatic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000)
        Utils.emitEvent("GetMediaPlaybackState0100", 10)
        await Utils.msSleep(2000)
        Utils.registerEvent("GetMediaPlaybackState0100", 0, 20260309111, done);
        await Utils.msSleep(2000)
        inspector.sendEventByKey('MediaPlaybackState', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
    * @tc.name        GetMediaPlaybackStateStatic0200
    * @tc.number      SUB_WEB_GET_MEDIA_PLAYBACK_STATE_0200
    * @tc.desc        test GetMediaPlaybackState
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 0
    */
    it('GetMediaPlaybackStateStatic0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000)
        Utils.emitEvent("GetMediaPlaybackState0200", 10)
        await Utils.msSleep(2000)
        Utils.registerEvent("GetMediaPlaybackState0200", 1, 20260309222, done);
        await Utils.msSleep(2000)
        inspector.sendEventByKey('MediaPlaybackState', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
    * @tc.name        GetMediaPlaybackStateStatic0300
    * @tc.number      SUB_WEB_GET_MEDIA_PLAYBACK_STATE_0300
    * @tc.desc        test GetMediaPlaybackState
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 0
    */
    it('GetMediaPlaybackStateStatic0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000)
        Utils.emitEvent("GetMediaPlaybackState0300", 10)
        await Utils.msSleep(2000)
        Utils.registerEvent("GetMediaPlaybackState0300", 2, 20260309223, done);
        await Utils.msSleep(2000)
        inspector.sendEventByKey('MediaPlaybackState', 10, '');
        await Utils.msSleep(2000);
        done();
      })
  })
}
