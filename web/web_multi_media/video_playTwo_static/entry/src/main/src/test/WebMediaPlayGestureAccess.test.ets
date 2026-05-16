/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
export default function webMediaPlayGestureAccess() {
    describe('WebMediaPlayGestureAccessTest', (): void => {
      beforeAll(async (): Promise<void> => {
        await Utils.msSleep(3000);
        console.log("App start")
      });

      beforeEach(async () => {
        await Utils.msSleep(5000);
        console.info("componentLifeCycleTestOne beforeEach start");
      })

    /**
     * @tc.name   testMediaPlayGestureAccessStatic001
     * @tc.number SUB_WEB_MEDIAPLAYGESTUREACCESS_0100
     * @tc.desc   test mediaPlayGestureAccess true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMediaPlayGestureAccessStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("emitMediaPlayGestureAccessTrue", 10)
      Utils.registerEvent('testMediaPlayGestureAccess001', "false_", 300720, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMediaPlayGestureAccessTestButton', 10, '');
      await Utils.msSleep(3000);
      done()
    })

    /**
     * @tc.name   testMediaPlayGestureAccessStatic002
     * @tc.number SUB_WEB_MEDIAPLAYGESTUREACCESS_0200
     * @tc.desc   test mediaPlayGestureAccess false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMediaPlayGestureAccessStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("emitMediaPlayGestureAccessFalsePlay", 10)
      Utils.registerEvent('testMediaPlayGestureAccess002', "", 300730, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMediaPlayGestureAccessTestButton', 10, '');
      await Utils.msSleep(3000);
      done()
    })
    /**
     * @tc.name   testMediaPlayGestureAccessStatic003
     * @tc.number SUB_WEB_MEDIAPLAYGESTUREACCESS_0300
     * @tc.desc   test mediaPlayGestureAccess false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMediaPlayGestureAccessStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("emitMediaPlayGestureAccessUndefinedPause", 10)
      Utils.registerEvent('testMediaPlayGestureAccess003', "false_", 300740, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMediaPlayGestureAccessTestButton', 10, '');
      await Utils.msSleep(3000);
      done()
    })
    /**
     * @tc.name   testWebCursiveFontStatic001
     * @tc.number SUB_WEB_WebCursiveFont_0100
     * @tc.desc   test webCursiveFont string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebCursiveFontStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("webCursiveFontString", 10)
      Utils.registerEvent('testwebCursiveFontStatic001', "cursive", 300741, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMediaPlayGestureAccessTestButton', 10, '');
      await Utils.msSleep(3000);
      done()
    })
    /**
     * @tc.name   testWebCursiveFontStatic002
     * @tc.number SUB_WEB_WebCursiveFont_0200
     * @tc.desc   test webCursiveFont undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebCursiveFontStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("webCursiveFontundefined", 10)
      Utils.registerEvent('testwebCursiveFontStatic002', "cursive", 300742, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMediaPlayGestureAccessTestButton', 10, '');
      await Utils.msSleep(3000);
      done()
    })
    /**
     * @tc.name   testNativeEmbedOptionsStatic001
     * @tc.number SUB_WEB_NativeEmbedOptions_0100
     * @tc.desc   test NativeEmbedOptions default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeEmbedOptionsStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("nativeEmbedOptions", 10)
      Utils.registerEvent('testNativeEmbedOptionsStatic001', "success", 300743, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMediaPlayGestureAccessTestButton', 10, '');
      await Utils.msSleep(3000);
      done()
    })
    /**
     * @tc.name   testNativeEmbedOptionsStatic002
     * @tc.number SUB_WEB_NativeEmbedOptions_0200
     * @tc.desc   test NativeEmbedOptions undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeEmbedOptionsStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("nativeEmbedOptionsUndefined", 10)
      Utils.registerEvent('testNativeEmbedOptionsStatic001', "success", 300744, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMediaPlayGestureAccessTestButton', 10, '');
      await Utils.msSleep(3000);
      done()
    })
    /**
     * @tc.name   testNativeMediaPlayerConfigStatic001
     * @tc.number SUB_WEB_NativeMediaPlayerConfig_0100
     * @tc.desc   test NativeMediaPlayerConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeMediaPlayerConfigStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("NativeMediaPlayerConfig001", 10)
      Utils.registerEvent('testNativeEmbedOptionsStatic001', true, 300745, done);
      await Utils.msSleep(2000);
      Utils.registerEvent('testNativeEmbedOptionsStatic001', false, 300746, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMediaPlayGestureAccessTestButton', 10, '');
      await Utils.msSleep(3000);
      done()
    })
    /**
     * @tc.name   testNativeMediaPlayerConfigStatic002
     * @tc.number SUB_WEB_NativeMediaPlayerConfig_0200
     * @tc.desc   test NativeMediaPlayerConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeMediaPlayerConfigStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("NativeMediaPlayerConfig002", 10)
      Utils.registerEvent('testNativeMediaPlayerConfigStatic002', false, 300747, done);
      await Utils.msSleep(2000);
      Utils.registerEvent('testNativeMediaPlayerConfigStatic002', true, 300748, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMediaPlayGestureAccessTestButton', 10, '');
      await Utils.msSleep(3000);
      done()
    })
    /**
     * @tc.name   SwitchNextPageStatic
     * @tc.number UB_WEB_ONFULLSCREENENTER_0200678
     * @tc.desc   test mediaOptions single instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('SwitchNextPageStatic', 10)
      await Utils.msSleep(1000);
      inspector.sendEventByKey('WebMediaPlayGestureAccessTestButton', 10, '');
      await Utils.msSleep(5000);
      done();
    })
  })
}