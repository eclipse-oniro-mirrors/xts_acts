'use static';
/**
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
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import { PlaybackSpeed } from '@ohos.arkui.component';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import events_emitter from '@ohos.events.emitter';
import { KeyCode } from '@ohos.multimodalInput.keyCode'
import { BusinessError } from '@ohos.base';
import { startAbility, stopApplication, UtilsTest } from './Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function VideoContentTransitionEffectTest() {
  describe('VideoContentTransitionEffectTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.video.api15.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("VideoContentTransitionEffectTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/VideoContentTransitionEffect',
      }
      try {
        const VideoContentTransitionEffect = AppStorage.get<Router>("router") as Router
        VideoContentTransitionEffect.clear();
        let pages = VideoContentTransitionEffect.getState();
        console.info("get VideoContentTransitionEffectTest state pages: " + JSON.stringify(pages));
        if (!("VideoContentTransitionEffect" == pages.name)) {
          console.info("get VideoContentTransitionEffectTest state pages.name: " + JSON.stringify(pages.name));
          VideoContentTransitionEffect.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push VideoContentTransitionEffectTest page error: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   VideoContentTransitionEffectTest_static_0100
     * @tc.name     VideoContentTransitionEffectTest_static_0100
     * @tc.desc     VideoContentTransitionEffectTest_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('VideoContentTransitionEffectTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('VideoContentTransitionEffectTest_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);

      console.info('[VideoContentTransitionEffectTest_static_0100] change IDENTITY');
      let button1 = await driver.findComponent(ON.id('VideoContentTransitionEffect_btn'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('VideoContentTransitionEffect_text');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('IDENTITY');

      console.info('[VideoContentTransitionEffectTest_static_0100] change OPACITY');
      let button2 = await driver.findComponent(ON.id('VideoContentTransitionEffect_btn'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('VideoContentTransitionEffect_text');
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('OPACITY');

      console.info('[VideoContentTransitionEffectTest_static_0100] change undefined');
      let button3 = await driver.findComponent(ON.id('VideoContentTransitionEffect_btn'));
      await (button3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson3 = inspector.getInspectorByKey('VideoContentTransitionEffect_text');
      let obj3 = JSON.parseJsonElement(strJson3);
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('UNDEFINED');

      console.info('[VideoContentTransitionEffectTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   VideoPlaybackSpeedTest_static_0100
     * @tc.name     VideoPlaybackSpeedTest_static_0100
     * @tc.desc     VideoPlaybackSpeedTest_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('VideoPlaybackSpeedTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('VideoPlaybackSpeedTest_static_0100 START');

      expect(PlaybackSpeed.Speed_Forward_0_75_X).assertEqual('0.75');
      expect(PlaybackSpeed.Speed_Forward_1_00_X).assertEqual('1.00');
      expect(PlaybackSpeed.Speed_Forward_1_25_X).assertEqual('1.25');
      expect(PlaybackSpeed.Speed_Forward_1_75_X).assertEqual('1.75');
      expect(PlaybackSpeed.Speed_Forward_2_00_X).assertEqual('2.00');
      expect(PlaybackSpeed.SPEED_FORWARD_0_50_X).assertEqual('0.50');
      expect(PlaybackSpeed.SPEED_FORWARD_1_50_X).assertEqual('1.50');
      expect(PlaybackSpeed.SPEED_FORWARD_3_00_X).assertEqual('3.00');
      expect(PlaybackSpeed.SPEED_FORWARD_0_25_X).assertEqual('0.25');
      expect(PlaybackSpeed.SPEED_FORWARD_0_125_X).assertEqual('0.125');

      console.info('[VideoPlaybackSpeedTest_static_0100] END');
      done();
    });
  })
}