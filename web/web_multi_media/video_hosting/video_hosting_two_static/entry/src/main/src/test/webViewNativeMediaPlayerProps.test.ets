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

import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
let testAbilityContext:common.UIAbilityContext;
// @ts-nocheck
export default function webViewNativeMediaPlayerProps() {
  describe('webViewNativeMediaPlayerPropsTest', () => {

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
          await Utils.msSleep(10000)
          abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.videohostingtwotest.static")
          await Utils.msSleep(10000)
          console.log("beforeAll end,%s", "Succeed!")
        });

        beforeEach(async () => {
          await Utils.msSleep(5000);
          console.info("componentLifeCycleTestOne beforeEach start");
        })

    /**
     * @tc.name   testLoadStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERBRIDGE_0000
     * @tc.desc   test NativeMediaPlayerBridge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let driver = Driver.create();
        await Utils.msSleep(15000);
        let button_1 = await driver.findComponent(ON.text('开始/暂停'));
        if(button_1){
          await button_1.click();
          await Utils.msSleep(5000);
          await button_1.click();
        }
        await Utils.msSleep(5000);
        let button_2 = await driver.findComponent(ON.text('全屏'));
        if(button_2){
          await button_2.click();
        }
        await Utils.msSleep(5000);
        inspector.sendEventByKey('ButtonHandleMutedChangedFalse', 10, '');
        await Utils.msSleep(5000);
        inspector.sendEventByKey('ButtonHandleMutedChangedTrue', 10, '');
        await Utils.msSleep(5000);
        let button_3 = await driver.findComponent(ON.text('重载'));
        if(button_3){
          await button_3.click();
        }
        await Utils.msSleep(5000);
        done();
      })

    /**
     * @tc.name   testUpdateRectStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERBRIDGE_0001
     * @tc.desc   test NativeMediaPlayerBridge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUpdateRectStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testUpdateRect', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testUpdateRect", 'NativeMediaPlayerBridge updateRect success.', 20260327, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
    })

    /**
     * @tc.name   testPlayStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERBRIDGE_0002
     * @tc.desc   test NativeMediaPlayerBridge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPlayStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testPlay', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testPlay", 'NativeMediaPlayerBridge play success.', 20260328, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testPauseStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERBRIDGE_0003
     * @tc.desc   test NativeMediaPlayerBridge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPauseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testPause', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testPause", 'NativeMediaPlayerBridge pause success.', 20260329, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testSeekStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERBRIDGE_0004
     * @tc.desc   test NativeMediaPlayerBridge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSeekStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testSeek', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testSeek", 'NativeMediaPlayerBridge seek success.', 20260330, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testSetVolumeStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERBRIDGE_0005
     * @tc.desc   test NativeMediaPlayerBridge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetVolumeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testSetVolume', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testSetVolume", 'NativeMediaPlayerBridge setVolume success.', 20260331, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testSetMutedStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERBRIDGE_0006
     * @tc.desc   test NativeMediaPlayerBridge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetMutedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testSetMuted', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testSetMuted", '', 20260332, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testSetPlaybackRateStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERBRIDGE_0007
     * @tc.desc   test NativeMediaPlayerBridge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetPlaybackRateStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testSetPlaybackRate', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testSetPlaybackRate", 'NativeMediaPlayerBridge setPlaybackRate success.', 20260333, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testReleaseStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERBRIDGE_0008
     * @tc.desc   test NativeMediaPlayerBridge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testReleaseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testRelease', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testRelease", 'NativeMediaPlayerBridge release success.', 20260334, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testEnterFullscreenStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERBRIDGE_0009
     * @tc.desc   test NativeMediaPlayerBridge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnterFullscreenStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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

    /**
     * @tc.name   testWebViewSuspendTypeEnumStatic001
     * @tc.number SUB_ACE_WEB_SUSPENDTYPE_0010
     * @tc.desc   test SuspendType
     * @tc.type   EnumValue
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSuspendTypeEnumStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitSuspendTypeEnum001', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("emitSuspendTypeEnum001", 0, 361080, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerProps', 10, '');
        await Utils.msSleep(2000);
        done();
    })
    /**
     * @tc.name   testWebViewEnterFullScreenStatic001
     * @tc.number SUB_ACE_WEB_FULLSCREEN_0100
     * @tc.desc   test SuspendType
     * @tc.type   EnumValue
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewEnterFullScreenStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testEnterFullscreen', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testEnterFullscreen", 'NativeMediaPlayerBridge enterFullscreen success.', 20260335, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testExitFullscreenStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERBRIDGE_0010
     * @tc.desc   test NativeMediaPlayerBridge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExitFullscreenStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testExitFullscreen', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testExitFullscreen", 'NativeMediaPlayerBridge exitFullscreen success.', 20260336, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testResumePlayerStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERBRIDGE_0011
     * @tc.desc   test NativeMediaPlayerBridge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResumePlayerStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testResumePlayer', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testResumePlayer", '', 20260337, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testSuspendPlayerStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERBRIDGE_0012
     * @tc.desc   test NativeMediaPlayerBridge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSuspendPlayerStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testSuspendPlayer', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testSuspendPlayer", '', 20260338, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testHandleVolumeChangedStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_0001
     * @tc.desc   test NativeMediaPlayerHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHandleVolumeChangedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testHandleVolumeChanged', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testHandleVolumeChanged", 'NativeMediaPlayerHandler handleVolumeChanged success.', 20260339, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testHandleMutedChangedTrueStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_0002
     * @tc.desc   test NativeMediaPlayerHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHandleMutedChangedTrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testHandleMutedChangedTrue', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testHandleMutedChangedTrue", 'NativeMediaPlayerHandler handleMutedChanged true success.', 20260340, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testWebViewSuspendTypeEnumStatic002
     * @tc.number SUB_ACE_WEB_SUSPENDTYPE_0020
     * @tc.desc   test SuspendType
     * @tc.type   EnumValue
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSuspendTypeEnumStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitSuspendTypeEnum002', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("emitSuspendTypeEnum002", 1, 361081, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerProps', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testHandleMutedChangedFalseStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_0003
     * @tc.desc   test NativeMediaPlayerHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHandleMutedChangedFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testHandleMutedChangedFalse', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testHandleMutedChangedFalse", 'NativeMediaPlayerHandler handleMutedChanged false success.', 20260341, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testWebViewSuspendTypeEnumStatic003
     * @tc.number SUB_ACE_WEB_SUSPENDTYPE_0030
     * @tc.desc   test SuspendType
     * @tc.type   EnumValue
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSuspendTypeEnumStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitSuspendTypeEnum003', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("emitSuspendTypeEnum003", 2, 361082, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerProps', 10, '');
        done();
      })
    /**
     * @tc.name   testHandlePlaybackRateChangedStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_0004
     * @tc.desc   test NativeMediaPlayerHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHandlePlaybackRateChangedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testHandlePlaybackRateChanged', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testHandlePlaybackRateChanged", 'NativeMediaPlayerHandler handlePlaybackRateChanged success.', 20260342, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testHandleDurationChangedStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_0005
     * @tc.desc   test NativeMediaPlayerHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHandleDurationChangedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testHandleDurationChanged', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testHandleDurationChanged", 'NativeMediaPlayerHandler handleDurationChanged success.', 20260343, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testHandleTimeUpdateStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_0006
     * @tc.desc   test NativeMediaPlayerHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHandleTimeUpdateStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testHandleTimeUpdate', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testHandleTimeUpdate", 'NativeMediaPlayerHandler handleTimeUpdate success.', 20260344, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testHandleBufferedEndTimeChangedStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_0007
     * @tc.desc   test NativeMediaPlayerHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHandleBufferedEndTimeChangedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testHandleBufferedEndTimeChanged', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testHandleBufferedEndTimeChanged", 'NativeMediaPlayerHandler handleBufferedEndTimeChanged success.', 20260345, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testHandleFullscreenChangedTrueStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_0008
     * @tc.desc   test NativeMediaPlayerHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHandleFullscreenChangedTrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testHandleFullscreenChangedTrue', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testHandleFullscreenChangedTrue", 'NativeMediaPlayerHandler handleFullscreenChanged true success.', 20260346, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testHandleFullscreenChangedFalseStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_0009
     * @tc.desc   test NativeMediaPlayerHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHandleFullscreenChangedFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testHandleFullscreenChangedFalse', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testHandleFullscreenChangedFalse", 'NativeMediaPlayerHandler handleFullscreenChanged false success.', 20260347, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testHandleVideoSizeChangedStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_0010
     * @tc.desc   test NativeMediaPlayerHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHandleVideoSizeChangedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testHandleVideoSizeChanged', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testHandleVideoSizeChanged", 'NativeMediaPlayerHandler handleVideoSizeChanged success.', 20260348, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testHandleNetworkStateChangedEmptyStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_0011
     * @tc.desc   test NativeMediaPlayerHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHandleNetworkStateChangedEmptyStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testHandleNetworkStateChangedEmpty', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testHandleNetworkStateChangedEmpty", 0, 20260349, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testHandleNetworkStateChangedIdleStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_0012
     * @tc.desc   test NativeMediaPlayerHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHandleNetworkStateChangedIdleStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testHandleNetworkStateChangedIdle', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testHandleNetworkStateChangedIdle", 1, 20260350, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testHandleNetworkStateChangedLoadingStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_0013
     * @tc.desc   test NativeMediaPlayerHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHandleNetworkStateChangedLoadingStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testHandleNetworkStateChangedLoading', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testHandleNetworkStateChangedLoading", 2, 20260351, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testHandleNetworkStateChangedNetworkErrorStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_0014
     * @tc.desc   test NativeMediaPlayerHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHandleNetworkStateChangedNetworkErrorStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testHandleNetworkStateChangedNetworkError', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testHandleNetworkStateChangedNetworkError", 3, 20260352, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testHandleReadyStateChangedHaveNothingStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_0015
     * @tc.desc   test NativeMediaPlayerHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHandleReadyStateChangedHaveNothingStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testHandleReadyStateChangedHaveNothing', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testHandleReadyStateChangedHaveNothing", 0, 20260353, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testHandleReadyStateChangedHaveMetadataStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_0016
     * @tc.desc   test NativeMediaPlayerHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHandleReadyStateChangedHaveMetadataStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testHandleReadyStateChangedHaveMetadata', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testHandleReadyStateChangedHaveMetadata", 1, 20260354, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testHandleReadyStateChangedHaveCurrentDataStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_0017
     * @tc.desc   test NativeMediaPlayerHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHandleReadyStateChangedHaveCurrentDataStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testHandleReadyStateChangedHaveCurrentData', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testHandleReadyStateChangedHaveCurrentData", 2, 20260355, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testHandleReadyStateChangedHaveFutureDataStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_0018
     * @tc.desc   test NativeMediaPlayerHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHandleReadyStateChangedHaveFutureDataStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testHandleReadyStateChangedHaveFutureData', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testHandleReadyStateChangedHaveFutureData", 3, 20260356, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testHandleReadyStateChangedHaveEnoughDataStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_0019
     * @tc.desc   test NativeMediaPlayerHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHandleReadyStateChangedHaveEnoughDataStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testHandleReadyStateChangedHaveEnoughData', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testHandleReadyStateChangedHaveEnoughData", 4, 20260357, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testHandleErrorHaveNetworkErrorStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_0020
     * @tc.desc   test NativeMediaPlayerHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHandleErrorHaveNetworkErrorStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testHandleErrorHaveNetworkError', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testHandleErrorHaveNetworkError", 1, 20260358, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testHandleErrorHaveFormatErrorStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_0021
     * @tc.desc   test NativeMediaPlayerHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHandleErrorHaveFormatErrorStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testHandleErrorHaveFormatError', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testHandleErrorHaveFormatError", 2, 20260359, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testHandleErrorHaveDecodeErrorStatic
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_0022
     * @tc.desc   test NativeMediaPlayerHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHandleErrorHaveDecodeErrorStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testHandleErrorHaveDecodeError', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testHandleErrorHaveDecodeError", 3, 20260360, done);
        await Utils.msSleep(3000);
        inspector.sendEventByKey('webViewNativeMediaPlayerButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })
  })
}
