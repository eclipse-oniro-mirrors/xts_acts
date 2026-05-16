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

import { describe, beforeAll, beforeEach, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  ON,
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function VideoUndefinedModifierTest() {
  describe('VideoUndefinedModifierTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.scroll.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('VideoUndefinedModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Video/videoUndefinedModifier',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get VideoUndefinedModifierTest state pages:' + JSON.stringify(pages));
        if (!('videoUndefinedModifier' == pages.name)) {
          console.info('get VideoUndefinedModifierTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push VideoUndefinedModifierTest page error:' + err);
      }
      console.info('VideoUndefinedModifierTest beforeEach end');
    });

    /**
     * @tc.number    VideoUndefinedModifierTest_static_0100
     * @tc.name      VideoUndefinedModifierTest_static_0100
     * @tc.desc      VideoUndefinedModifierTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('VideoUndefinedModifierTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[VideoUndefinedModifierTest_static_0100] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let onUpdate_action = await driver.findComponent(ON.id('onUpdate_action_modifier')) as Component;
      await onUpdate_action.click();
      await CommonFunc.sleep(500);

      let onUpdate = await driver.findComponent(ON.id('onUpdate_modifier')) as Component;
      await onUpdate.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('eventValue_modifier');
      let onUpdateValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content');
      expect(onUpdateValue.asString()).assertEqual('onUpdateValue');

      let reset = await driver.findComponent(ON.id('reset_modifier')) as Component;
      await reset.click();
      await CommonFunc.sleep(1000);

      await onUpdate_action.click();
      await CommonFunc.sleep(1000);

      await onUpdate.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('eventValue_modifier');
      let onUpdateValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content');
      expect(onUpdateValue1.asString()).assertEqual('value');

      console.info('[VideoUndefinedModifierTest_static_0100] END');
      done();
    });

    /**
     * @tc.number    VideoUndefinedModifierTest_static_0101
     * @tc.name      VideoUndefinedModifierTest_static_0101
     * @tc.desc      VideoUndefinedModifierTest_static_0101
     * @tc.level     Level.LEVEL1
     */
    it('VideoUndefinedModifierTest_static_0101', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[VideoUndefinedModifierTest_static_0101] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let onPrepared_action = await driver.findComponent(ON.id('onPrepared_action_modifier')) as Component;
      await onPrepared_action.click();
      await CommonFunc.sleep(500);

      let onPrepared = await driver.findComponent(ON.id('onPrepared_modifier')) as Component;
      await onPrepared.click();
      await CommonFunc.sleep(500);
      await onPrepared.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('eventValue_modifier');
      let onPreparedValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content');
      expect(onPreparedValue.asString()).assertEqual('onPreparedValue');

      let reset = await driver.findComponent(ON.id('reset_modifier')) as Component;
      await reset.click();
      await CommonFunc.sleep(1000);

      await onPrepared_action.click();
      await CommonFunc.sleep(1000);

      await onPrepared.click();
      await CommonFunc.sleep(500);
      await onPrepared.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('eventValue_modifier');
      let onPreparedValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content');
      expect(onPreparedValue1.asString()).assertEqual('value');

      console.info('[VideoUndefinedModifierTest_static_0101] END');
      done();
    });

    /**
    * @tc.number    VideoUndefinedModifierTest_static_0102
    * @tc.name      VideoUndefinedModifierTest_static_0102
    * @tc.desc      VideoUndefinedModifierTest_static_0102
    * @tc.level     Level.LEVEL1
    */
    it('VideoUndefinedModifierTest_static_0102', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[VideoUndefinedModifierTest_static_0102] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let onFullscreenChange_action = await driver.findComponent(ON.id('onFullscreenChange_action_modifier')) as Component;
      await onFullscreenChange_action.click();
      await CommonFunc.sleep(500);

      let onFullscreenChange = await driver.findComponent(ON.id('onFullscreenChange_modifier')) as Component;
      await onFullscreenChange.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('eventValue_modifier');
      let onFullscreenChangeValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content');
      expect(onFullscreenChangeValue.asString()).assertEqual('onFullscreenChangeValue');

      let reset = await driver.findComponent(ON.id('reset_modifier')) as Component;
      await reset.click();
      await CommonFunc.sleep(1000);

      await onFullscreenChange_action.click();
      await CommonFunc.sleep(1000);

      await onFullscreenChange.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('eventValue_modifier');
      let onFullscreenChangeValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content');
      expect(onFullscreenChangeValue1.asString()).assertEqual('value');

      console.info('[VideoUndefinedModifierTest_static_0102] END');
      done();
    });

    /**
    * @tc.number    VideoUndefinedModifierTest_static_0103
    * @tc.name      VideoUndefinedModifierTest_static_0103
    * @tc.desc      VideoUndefinedModifierTest_static_0103
    * @tc.level     Level.LEVEL1
    */
    it('VideoUndefinedModifierTest_static_0103', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[VideoUndefinedModifierTest_static_0103] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let onFinish_action = await driver.findComponent(ON.id('onFinish_action_modifier')) as Component;
      await onFinish_action.click();
      await CommonFunc.sleep(500);

      let onFinish = await driver.findComponent(ON.id('onFinish_modifier')) as Component;
      await onFinish.click();
      await CommonFunc.sleep(5000);

      let strJson = inspector.getInspectorByKey('eventValue_modifier');
      let onFinishValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content');
      expect(onFinishValue.asString()).assertEqual('onFinishValue');

      let reset = await driver.findComponent(ON.id('reset_modifier')) as Component;
      await reset.click();
      await CommonFunc.sleep(1000);

      await onFinish_action.click();
      await CommonFunc.sleep(1000);

      await onFinish.click();
      await CommonFunc.sleep(5000);

      let strJson1 = inspector.getInspectorByKey('eventValue_modifier');
      let onFinishValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content');
      expect(onFinishValue1.asString()).assertEqual('value');

      console.info('[VideoUndefinedModifierTest_static_0103] END');
      done();
    });

    /**
    * @tc.number    VideoUndefinedModifierTest_static_0104
    * @tc.name      VideoUndefinedModifierTest_static_0104
    * @tc.desc      VideoUndefinedModifierTest_static_0104
    * @tc.level     Level.LEVEL1
    */
    it('VideoUndefinedModifierTest_static_0104', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[VideoUndefinedModifierTest_static_0104] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let onPause_action = await driver.findComponent(ON.id('onPause_action_modifier')) as Component;
      await onPause_action.click();
      await CommonFunc.sleep(500);

      let onStart = await driver.findComponent(ON.id('onStart_modifier')) as Component;
      let onPause = await driver.findComponent(ON.id('onPause_modifier')) as Component;
      await onStart.click();
      await CommonFunc.sleep(500);
      await onPause.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('eventValue_modifier');
      let onPauseValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content');
      expect(onPauseValue.asString()).assertEqual('onPauseValue');

      let reset = await driver.findComponent(ON.id('reset_modifier')) as Component;
      await reset.click();
      await CommonFunc.sleep(500);

      await onPause_action.click();
      await CommonFunc.sleep(500);

      await onStart.click();
      await CommonFunc.sleep(500);
      await onPause.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('eventValue_modifier');
      let onPauseValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content');
      expect(onPauseValue1.asString()).assertEqual('value');

      console.info('[VideoUndefinedModifierTest_static_0104] END');
      done();
    });

    /**
    * @tc.number    VideoUndefinedModifierTest_static_0105
    * @tc.name      VideoUndefinedModifierTest_static_0105
    * @tc.desc      VideoUndefinedModifierTest_static_0105
    * @tc.level     Level.LEVEL1
    */
    it('VideoUndefinedModifierTest_static_0105', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[VideoUndefinedModifierTest_static_0105] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let onStart_action = await driver.findComponent(ON.id('onStart_action_modifier')) as Component;
      await onStart_action.click();
      await CommonFunc.sleep(500);

      let onStart = await driver.findComponent(ON.id('onStart_modifier')) as Component;
      let onPause = await driver.findComponent(ON.id('onPause_modifier')) as Component;
      await onStart.click();
      await CommonFunc.sleep(500);
      await onPause.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('eventValue_modifier');
      let onStartValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content');
      expect(onStartValue.asString()).assertEqual('onStartValue');

      let reset = await driver.findComponent(ON.id('reset_modifier')) as Component;
      await reset.click();
      await CommonFunc.sleep(500);

      await onStart_action.click();
      await CommonFunc.sleep(500);

      await onStart.click();
      await CommonFunc.sleep(500);
      await onPause.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('eventValue_modifier');
      let onStartValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content');
      expect(onStartValue1.asString()).assertEqual('value');

      console.info('[VideoUndefinedModifierTest_static_0105] END');
      done();
    });

    /**
    * @tc.number    VideoUndefinedModifierTest_static_0106
    * @tc.name      VideoUndefinedModifierTest_static_0106
    * @tc.desc      VideoUndefinedModifierTest_static_0106
    * @tc.level     Level.LEVEL1
    */
    it('VideoUndefinedModifierTest_static_0106', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[VideoUndefinedModifierTest_static_0106] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let onStop_action = await driver.findComponent(ON.id('onStop_action_modifier')) as Component;
      await onStop_action.click();
      await CommonFunc.sleep(500);

      let onStop = await driver.findComponent(ON.id('onStop_modifier')) as Component;
      await onStop.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('eventValue_modifier');
      let onStopValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content');
      expect(onStopValue.asString()).assertEqual('onStopValue');

      let reset = await driver.findComponent(ON.id('reset_modifier')) as Component;
      await reset.click();
      await CommonFunc.sleep(500);

      await onStop_action.click();
      await CommonFunc.sleep(500);

      await onStop.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('eventValue_modifier');
      let onStopValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content');
      expect(onStopValue1.asString()).assertEqual('value');

      console.info('[VideoUndefinedModifierTest_static_0106] END');
      done();
    });

    /**
    * @tc.number    VideoUndefinedModifierTest_static_0107
    * @tc.name      VideoUndefinedModifierTest_static_0107
    * @tc.desc      VideoUndefinedModifierTest_static_0107
    * @tc.level     Level.LEVEL1
    */
    it('VideoUndefinedModifierTest_static_0107', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[VideoUndefinedModifierTest_static_0107] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let loop_action = await driver.findComponent(ON.id('loop_action_modifier')) as Component;
      await loop_action.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('video_action_modifier');
      let loopValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('loop');
      expect(loopValue.asString()).assertEqual('true');

      await loop_action.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('video_action_modifier');
      let loopValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('loop');
      expect(loopValue1.asString()).assertEqual('false');

      console.info('[VideoUndefinedModifierTest_static_0107] END');
      done();
    });

    /**
    * @tc.number    VideoUndefinedModifierTest_static_0108
    * @tc.name      VideoUndefinedModifierTest_static_0108
    * @tc.desc      VideoUndefinedModifierTest_static_0108
    * @tc.level     Level.LEVEL1
    */
    it('VideoUndefinedModifierTest_static_0108', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[VideoUndefinedModifierTest_static_0108] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let muted_action = await driver.findComponent(ON.id('muted_action_modifier')) as Component;
      await muted_action.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('video_action_modifier');
      let mutedValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('muted');
      expect(mutedValue.asString()).assertEqual('true');

      await muted_action.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('video_action_modifier');
      let mutedValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('muted');
      expect(mutedValue1.asString()).assertEqual('false');

      console.info('[VideoUndefinedModifierTest_static_0108] END');
      done();
    });

    /**
    * @tc.number    VideoUndefinedModifierTest_static_0109
    * @tc.name      VideoUndefinedModifierTest_static_0109
    * @tc.desc      VideoUndefinedModifierTest_static_0109
    * @tc.level     Level.LEVEL1
    */
    it('VideoUndefinedModifierTest_static_0109', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[VideoUndefinedModifierTest_static_0109] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let autoPlay_action = await driver.findComponent(ON.id('autoPlay_action_modifier')) as Component;
      await autoPlay_action.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('video_action_modifier');
      let autoPlayValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('autoPlay');
      expect(autoPlayValue.asString()).assertEqual('true');

      await autoPlay_action.click();
      await CommonFunc.sleep(500);

      let onStop = await driver.findComponent(ON.id('onStop_modifier')) as Component;
      await onStop.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('video_action_modifier');
      let autoPlayValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('autoPlay');
      expect(autoPlayValue1.asString()).assertEqual('false');

      console.info('[VideoUndefinedModifierTest_static_0109] END');
      done();
    });

    /**
    * @tc.number    VideoUndefinedModifierTest_static_0110
    * @tc.name      VideoUndefinedModifierTest_static_0110
    * @tc.desc      VideoUndefinedModifierTest_static_0110
    * @tc.level     Level.LEVEL1
    */
    it('VideoUndefinedModifierTest_static_0110', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[VideoUndefinedModifierTest_static_0110] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let controls_action = await driver.findComponent(ON.id('controls_action_modifier')) as Component;
      await controls_action.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('video_action_modifier');
      let controlsValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('controls');
      expect(controlsValue.asString()).assertEqual('false');

      await controls_action.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('video_action_modifier');
      let controlsValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('controls');
      expect(controlsValue1.asString()).assertEqual('true');

      console.info('[VideoUndefinedModifierTest_static_0110] END');
      done();
    });

    /**
    * @tc.number    VideoUndefinedModifierTest_static_0111
    * @tc.name      VideoUndefinedModifierTest_static_0111
    * @tc.desc      VideoUndefinedModifierTest_static_0111
    * @tc.level     Level.LEVEL1
    */
    it('VideoUndefinedModifierTest_static_0111', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[VideoUndefinedModifierTest_static_0111] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let objectFit_action = await driver.findComponent(ON.id('objectFit_action_modifier')) as Component;
      await objectFit_action.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('video_action_modifier');
      let objectFitValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('objectFit');
      expect(objectFitValue.asString()).assertEqual('ImageFit.Contain');

      await objectFit_action.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('video_action_modifier');
      let objectFitValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('objectFit');
      expect(objectFitValue1.asString()).assertEqual('ImageFit.Cover');

      console.info('[VideoUndefinedModifierTest_static_0111] END');
      done();
    });

  })
}
