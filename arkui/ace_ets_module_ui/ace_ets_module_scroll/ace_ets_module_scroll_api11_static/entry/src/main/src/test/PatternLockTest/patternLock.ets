'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import events_emitter from '@ohos.events.emitter';

let emitKey = "emitUserAgent";

export default function patternLockTest() {

  describe('ActsPatternLockInterfaceTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/PatternLock/PatternLockIndex",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get PatternLockIndex state success " + JSON.stringify(pages));
        if (!("PatternLockIndex" == pages.name)) {
          console.info("get PatternLockIndex state success " + JSON.stringify(pages.name));
          router.pushUrl(options)
          
          // console.info("push PatternLockIndex page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PatternLockIndex page error " + JSON.stringify(err));
      }
    });


    
    /**
     * @tc.number   ArkUX_Stage_PatternLock_setChallengeResult_static_0100
     * @tc.name     ArkUX_Stage_PatternLock_setChallengeResult_static_0100
     * @tc.desc     ArkUX_Stage_PatternLock_setChallengeResult_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_PatternLock_setChallengeResult_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
        console.info('ArkUX_Stage_PatternLock_setChallengeResult_static_0100 START');
        try {
          let strJson = inspector.getInspectorByKey('lock');
          console.info('ArkUX_Stage_PatternLock_setChallengeResult_static_0100 START  :' + strJson);
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_PatternLock_setChallengeResult_static_0100 component obj.getElement('$attrs').getElement('setChallengeResult') is: " +
          obj.getElement('$attrs').tryGetElement('setChallengeResult') ?? '');
          console.info('ArkUX_Stage_PatternLock_setChallengeResult_static_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_PatternLock_setChallengeResult_static_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      });


    
    /**
     * @tc.number   ArkUX_Stage_PatternLock_onDotConnect_0100
     * @tc.name     ArkUX_Stage_PatternLock_onDotConnect_0100
     * @tc.desc     ArkUX_Stage_PatternLock_onDotConnect_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_PatternLock_onDotConnect_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_PatternLock_onDotConnect_0100 START');
      try {
        let strJson = inspector.getInspectorByKey('lock');
        console.info('ArkUX_Stage_PatternLock_onDotConnect_0100 START  :' + strJson);
        let obj = JSON.parseJsonElement(strJson);
        console.info("ArkUX_Stage_PatternLock_onDotConnect_0100 component obj.$attrs.onDotConnect is: " +
        obj.getElement('$attrs').tryGetElement('onDotConnect') ?? '');
        console.info('ArkUX_Stage_PatternLock_onDotConnect_0100 END ');
      } catch (err) {
        expect().assertFail();
        console.info('ArkUX_Stage_PatternLock_onDotConnect_0100 ERR  ' + JSON.stringify(err));
      }
      done();
    });

  })
}
