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

import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext:common.UIAbilityContext;
// @ts-nocheck
export default function webViewNativeMediaPlayerProps() {
  describe('ActsAcewebViewNativeMediaPlayerProps', () => {

        beforeAll(async (): Promise<void> => {
          console.log("App start")
          let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
          abilityDelegator.addAbilityMonitor({
            abilityName: "EntryAbility",
            moduleName: "entry",
            onAbilityCreate: (abilitys: UIAbility): void => {
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
          abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.videohostingtwotest.static")
          await Utils.msSleep(2000)
          console.log("beforeAll end,%s", "Succeed!")
        });

        beforeEach(async () => {
          await Utils.msSleep(2000);
          console.info("componentLifeCycleTestOne beforeEach start");
        })

    /**
     * @tc.name   testWebViewNativeMediaPlayerNetworkErrorStatic
     * @tc.number SUB_ACE_WEB_MediaError_NETWORK_ERROR_API_0002
     * @tc.desc   test MediaError.NETWORK_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewNativeMediaPlayerNetworkErrorStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitWebViewNativeMediaPlayerNetworkError', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testWebViewNativeMediaPlayerNetworkError", true, 1300, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerProps', 10, '');
        await Utils.msSleep(3000);
        done();
    })

    /**
     * @tc.name   testWebViewNativeMediaPlayerFORMATERRORStatic
     * @tc.number SUB_ACE_WEB_MediaError_FORMAT_ERROR_API_0003
     * @tc.desc   test MediaError.FORMAT_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewNativeMediaPlayerFORMATERRORStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitWebViewNativeMediaPlayerFORMATERROR', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebViewNativeMediaPlayerFORMATERROR", true, 1301, done);
      await Utils.msSleep(3000);
      inspector.sendEventByKey('webViewNativeMediaPlayerProps', 10, '');
      await Utils.msSleep(3000);
      done();
    })

    /**
     * @tc.name   testWebViewNativeMediaPlayerDECODEERRORStatic
     * @tc.number SUB_ACE_WEB_MediaError_DECODE_ERROR_API_0004
     * @tc.desc   test MediaError.DECODE_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewNativeMediaPlayerDECODEERRORStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitWebViewNativeMediaPlayerDECODEERROR', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebViewNativeMediaPlayerDECODEERROR", true, 1302, done);
      await Utils.msSleep(3000);
      inspector.sendEventByKey('webViewNativeMediaPlayerProps', 10, '');
      await Utils.msSleep(3000);
      done();
    })

    /**
     * @tc.name   testWebViewNativeMediaPlayerCreateNativeMediaPlayerCallbackStatic
     * @tc.number SUB_ACE_WEB_CreateNativeMediaPlayerCallback_API_0005
     * @tc.desc   test CreateNativeMediaPlayerCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewNativeMediaPlayerCreateNativeMediaPlayerCallbackStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitWebViewNativeMediaPlayerCreateNativeMediaPlayerCallback', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebViewNativeMediaPlayerCreateNativeMediaPlayerCallback", true, 1303, done);
      await Utils.msSleep(3000);
      inspector.sendEventByKey('webViewNativeMediaPlayerProps', 10, '');
      await Utils.msSleep(3000);
      done();
    })

    /**
     * @tc.name   testWebViewNativeMediaPlayerNetworkStateEmptyStatic
     * @tc.number SUB_ACE_WEB_NetworkState_EMPTY_API_0006
     * @tc.desc   test NetworkState EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewNativeMediaPlayerNetworkStateEmptyStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitWebViewNativeMediaPlayerNetworkStateEmpty', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebViewNativeMediaPlayerNetworkStateEmpty", true, 1304, done);
      await Utils.msSleep(3000);
      inspector.sendEventByKey('webViewNativeMediaPlayerProps', 10, '');
      await Utils.msSleep(3000);
      done();
    })

    /**
     * @tc.name   testWebViewNativeMediaPlayerNetworkStateIDLEStatic
     * @tc.number SUB_ACE_WEB_NetworkState_IDLE_API_0007
     * @tc.desc   test NetworkState IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewNativeMediaPlayerNetworkStateIDLEStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitWebViewNativeMediaPlayerNetworkStateIDLE', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebViewNativeMediaPlayerNetworkStateIDLE", true, 1305, done);
      await Utils.msSleep(3000);
      inspector.sendEventByKey('webViewNativeMediaPlayerProps', 10, '');
      await Utils.msSleep(3000);
      done();
    })

    /**
     * @tc.name   testWebViewNativeMediaPlayerNetworkStateNETWORKERRORStatic
     * @tc.number SUB_ACE_WEB_NetworkState_NETWORK_ERROR_API_0008
     * @tc.desc   test NetworkState NETWORK_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewNativeMediaPlayerNetworkStateNETWORKERRORStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitWebViewNativeMediaPlayerNetworkStateNETWORKERROR', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebViewNativeMediaPlayerNetworkStateNETWORKERROR", true, 1305, done);
      await Utils.msSleep(3000);
      inspector.sendEventByKey('webViewNativeMediaPlayerProps', 10, '');
      await Utils.msSleep(3000);
      done();
    })

    /**
     * @tc.name   testWebViewNativeMediaPlayerReadyStateHAVENOTHINGStatic
     * @tc.number SUB_ACE_WEB_ReadyState_HAVE_NOTHING_API_0009
     * @tc.desc   test ReadyState.HAVE_NOTHING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewNativeMediaPlayerReadyStateHAVENOTHINGStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitWebViewNativeMediaPlayerReadyStateHAVENOTHING', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebViewNativeMediaPlayerReadyStateHAVENOTHING", true, 1308, done);
      await Utils.msSleep(3000);
      inspector.sendEventByKey('webViewNativeMediaPlayerProps', 10, '');
      await Utils.msSleep(3000);
      done();
    })

    /**
     * @tc.name   testWebViewNativeMediaPlayerPreloadStatic
     * @tc.number SUB_ACE_WEB_MediaPlayer_Preload_API_0010
     * @tc.desc   test MediaPlayerProps2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebViewNativeMediaPlayerPreloadStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitWebViewNativeMediaPlayerProps2', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebViewNativeMediaPlayerProps2", true, 1355, done);
      await Utils.msSleep(3000);
      inspector.sendEventByKey('webViewNativeMediaPlayerProps', 10, '');
      await Utils.msSleep(3000);
      done();
    })
  })
}
