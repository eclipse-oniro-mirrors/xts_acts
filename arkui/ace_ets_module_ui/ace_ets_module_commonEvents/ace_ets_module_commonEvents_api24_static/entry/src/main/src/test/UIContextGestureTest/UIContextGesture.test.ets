'use static';
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

import { describe, it, expect, Level } from '../../../../hypium/index';
import {
  GestureActionPhase,
  GestureListenerType,
  GestureObserverConfigs,
} from '@ohos.arkui.UIContext';

export default function UIContextGestureTest(): void {
  describe('UIContextGestureTest', () => {
    /**
     * @tc.number SUB_ArkUI_UIContext_GestureActionPhase_WillStart_0100
     * @tc.name SUB_ArkUI_UIContext_GestureActionPhase_WillStart_0100
     * @tc.desc Test GestureActionPhase WILL_START enum value, verify WILL_START=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_UIContext_GestureActionPhase_WillStart_0100', Level.LEVEL1, (done: () => void) => {
      console.info('UIContextGestureTest: SUB_ArkUI_UIContext_GestureActionPhase_WillStart_0100 begin');
      expect(GestureActionPhase.WILL_START).assertEqual(0);
      console.info('UIContextGestureTest: SUB_ArkUI_UIContext_GestureActionPhase_WillStart_0100 end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_UIContext_GestureActionPhase_WillEnd_0200
     * @tc.name SUB_ArkUI_UIContext_GestureActionPhase_WillEnd_0200
     * @tc.desc Test GestureActionPhase WILL_END enum value, verify WILL_END=1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_UIContext_GestureActionPhase_WillEnd_0200', Level.LEVEL1, (done: () => void) => {
      console.info('UIContextGestureTest: SUB_ArkUI_UIContext_GestureActionPhase_WillEnd_0200 begin');
      expect(GestureActionPhase.WILL_END).assertEqual(1);
      console.info('UIContextGestureTest: SUB_ArkUI_UIContext_GestureActionPhase_WillEnd_0200 end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_UIContext_GestureListenerType_Tap_0300
     * @tc.name SUB_ArkUI_UIContext_GestureListenerType_Tap_0300
     * @tc.desc Test GestureListenerType TAP enum value, verify TAP=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_UIContext_GestureListenerType_Tap_0300', Level.LEVEL1, (done: () => void) => {
      console.info('UIContextGestureTest: SUB_ArkUI_UIContext_GestureListenerType_Tap_0300 begin');
      expect(GestureListenerType.TAP).assertEqual(0);
      console.info('UIContextGestureTest: SUB_ArkUI_UIContext_GestureListenerType_Tap_0300 end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_UIContext_GestureListenerType_LongPress_0400
     * @tc.name SUB_ArkUI_UIContext_GestureListenerType_LongPress_0400
     * @tc.desc Test GestureListenerType LONG_PRESS enum value, verify LONG_PRESS=1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_UIContext_GestureListenerType_LongPress_0400', Level.LEVEL1, (done: () => void) => {
      console.info('UIContextGestureTest: SUB_ArkUI_UIContext_GestureListenerType_LongPress_0400 begin');
      expect(GestureListenerType.LONG_PRESS).assertEqual(1);
      console.info('UIContextGestureTest: SUB_ArkUI_UIContext_GestureListenerType_LongPress_0400 end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_UIContext_GestureListenerType_Pan_0500
     * @tc.name SUB_ArkUI_UIContext_GestureListenerType_Pan_0500
     * @tc.desc Test GestureListenerType PAN enum value, verify PAN=2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_UIContext_GestureListenerType_Pan_0500', Level.LEVEL1, (done: () => void) => {
      console.info('UIContextGestureTest: SUB_ArkUI_UIContext_GestureListenerType_Pan_0500 begin');
      expect(GestureListenerType.PAN).assertEqual(2);
      console.info('UIContextGestureTest: SUB_ArkUI_UIContext_GestureListenerType_Pan_0500 end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_UIContext_GestureListenerType_Pinch_0600
     * @tc.name SUB_ArkUI_UIContext_GestureListenerType_Pinch_0600
     * @tc.desc Test GestureListenerType PINCH enum value, verify PINCH=3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_UIContext_GestureListenerType_Pinch_0600', Level.LEVEL1, (done: () => void) => {
      console.info('UIContextGestureTest: SUB_ArkUI_UIContext_GestureListenerType_Pinch_0600 begin');
      expect(GestureListenerType.PINCH).assertEqual(3);
      console.info('UIContextGestureTest: SUB_ArkUI_UIContext_GestureListenerType_Pinch_0600 end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_UIContext_GestureListenerType_Swipe_0700
     * @tc.name SUB_ArkUI_UIContext_GestureListenerType_Swipe_0700
     * @tc.desc Test GestureListenerType SWIPE enum value, verify SWIPE=4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_UIContext_GestureListenerType_Swipe_0700', Level.LEVEL1, (done: () => void) => {
      console.info('UIContextGestureTest: SUB_ArkUI_UIContext_GestureListenerType_Swipe_0700 begin');
      expect(GestureListenerType.SWIPE).assertEqual(4);
      console.info('UIContextGestureTest: SUB_ArkUI_UIContext_GestureListenerType_Swipe_0700 end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_UIContext_GestureListenerType_Rotation_0800
     * @tc.name SUB_ArkUI_UIContext_GestureListenerType_Rotation_0800
     * @tc.desc Test GestureListenerType ROTATION enum value, verify ROTATION=5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_UIContext_GestureListenerType_Rotation_0800', Level.LEVEL1, (done: () => void) => {
      console.info('UIContextGestureTest: SUB_ArkUI_UIContext_GestureListenerType_Rotation_0800 begin');
      expect(GestureListenerType.ROTATION).assertEqual(5);
      console.info('UIContextGestureTest: SUB_ArkUI_UIContext_GestureListenerType_Rotation_0800 end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_UIContext_GestureObserverConfigs_ActionPhases_Single_0900
     * @tc.name SUB_ArkUI_UIContext_GestureObserverConfigs_ActionPhases_Single_0900
     * @tc.desc Test GestureObserverConfigs with one action phase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_UIContext_GestureObserverConfigs_ActionPhases_Single_0900', Level.LEVEL1, (done: () => void) => {
      console.info('UIContextGestureTest: SUB_ArkUI_UIContext_GestureObserverConfigs_ActionPhases_Single_0900 begin');
      let configs: GestureObserverConfigs = {
        actionPhases: [GestureActionPhase.WILL_START],
      };
      expect(configs.actionPhases.length).assertEqual(1);
      expect(configs.actionPhases[0]).assertEqual(GestureActionPhase.WILL_START);
      console.info('UIContextGestureTest: SUB_ArkUI_UIContext_GestureObserverConfigs_ActionPhases_Single_0900 end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_UIContext_GestureObserverConfigs_ActionPhases_StartAndEnd_1000
     * @tc.name SUB_ArkUI_UIContext_GestureObserverConfigs_ActionPhases_StartAndEnd_1000
     * @tc.desc Test GestureObserverConfigs with WILL_START and WILL_END
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_UIContext_GestureObserverConfigs_ActionPhases_StartAndEnd_1000', Level.LEVEL1, (done: () => void) => {
      console.info('UIContextGestureTest: SUB_ArkUI_UIContext_GestureObserverConfigs_ActionPhases_StartAndEnd_1000 begin');
      let configs: GestureObserverConfigs = {
        actionPhases: [GestureActionPhase.WILL_START, GestureActionPhase.WILL_END],
      };
      expect(configs.actionPhases.length).assertEqual(2);
      expect(configs.actionPhases[0]).assertEqual(GestureActionPhase.WILL_START);
      expect(configs.actionPhases[1]).assertEqual(GestureActionPhase.WILL_END);
      console.info('UIContextGestureTest: SUB_ArkUI_UIContext_GestureObserverConfigs_ActionPhases_StartAndEnd_1000 end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_UIContext_GestureObserverConfigs_ActionPhases_Empty_1100
     * @tc.name SUB_ArkUI_UIContext_GestureObserverConfigs_ActionPhases_Empty_1100
     * @tc.desc Test GestureObserverConfigs allows empty actionPhases array shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_UIContext_GestureObserverConfigs_ActionPhases_Empty_1100', Level.LEVEL1, (done: () => void) => {
      console.info('UIContextGestureTest: SUB_ArkUI_UIContext_GestureObserverConfigs_ActionPhases_Empty_1100 begin');
      let configs: GestureObserverConfigs = {
        actionPhases: [],
      };
      expect(configs.actionPhases.length).assertEqual(0);
      console.info('UIContextGestureTest: SUB_ArkUI_UIContext_GestureObserverConfigs_ActionPhases_Empty_1100 end');
      done();
    });
  });
}
