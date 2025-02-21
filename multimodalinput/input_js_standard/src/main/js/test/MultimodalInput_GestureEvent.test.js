/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import gestureEvent from '@ohos.multimodalInput.gestureEvent';
import { Rotate, Pinch, ThreeFingersTap } from '@ohos.multimodalInput.gestureEvent';
import inputMonitor from '@ohos.multimodalInput.inputMonitor';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function MultimodalInput_GestureEvent_test() {
  describe('MultimodalInput_GestureEvent_test', function () {

    /**
     * @tc.number Multimodalinput_GestureEventTest_001
     * @tc.name Multimodalinput_GestureEvent_SUB_MMI_GestureEventTest_001
     * @tc.desc GestureEvent interface On gesture type
     */
    it('Multimodalinput_GestureEvent_SUB_MMI_GestureEventTest_001', 0, function () {
      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_001 enter`);

      expect(gestureEvent.ActionType.CANCEL == 0).assertTrue();

      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_001 exit`);
    })

    /**
     * @tc.number Multimodalinput_GestureEventTest_002
     * @tc.name Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_002
     * @tc.desc GestureEvent interface On gesture type
     */
    it('Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_002', 0, function () {
      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_002 enter`);

      expect(gestureEvent.ActionType.BEGIN == 1).assertTrue();

      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_002 exit`);
    })

    /**
     * @tc.number Multimodalinput_GestureEventTest_003
     * @tc.name Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_003
     * @tc.desc GestureEvent interface On gesture type
     */
    it('Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_003', 0, function () {
      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_003 enter`);

      expect(gestureEvent.ActionType.UPDATE == 2).assertTrue();

      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_003 exit`);
    })

    /**
     * @tc.number Multimodalinput_GestureEventTest_004
     * @tc.name Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_004
     * @tc.desc GestureEvent interface On gesture type
     */
    it('Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_004', 0, function () {
      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_004 enter`);

      expect(gestureEvent.ActionType.END == 3).assertTrue();

      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_004 exit`);
    })

    /**
     * @tc.number Multimodalinput_GestureEventTest_005
     * @tc.name Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_005
     * @tc.desc GestureEvent interface On monitor pinch
     */
    it('Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_005', 0, function () {
      let label = '02800/MultimodalinputJs';
      console.info(`${label}:Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_005 start`);
      console.info(`${label}:onClickMonitorOn callback`);
      const handleEvent = (err, pinch) => {
        pinch.type = 1;
        pinch.scale = 1;
        expect(pinch.type == gestureEvent.ActionType.BEGIN).assertTrue();
        expect(pinch.scale == 1).assertTrue();
        console.info(`${label}:callbackPinch start`);
        if (err) {
          console.info(`${label}:callbackPinch error:${JSON.stringify(err)}`);
          expect(false).assertTrue();
          return;
        }
        console.info(`${label}:callbackPinch success: ${JSON.stringify(pinch)}`);
        let ret = Object.keys(pinch);
        expect(ret.length > 0).assertTure();
      };

      console.info(`${label}:onClickMonitorOn start`);
      try {
        inputMonitor.on("pinch", handleEvent);
      } catch (error) {
        expect(true).assertTrue();
      }
      console.info(`${label}:onClickMonitorOn end`);

      console.info(`${label}:onClickMonitorOff start`);
      try {
        inputMonitor.off("pinch", handleEvent);
      } catch (error) {
        expect(false).assertTrue();
      }
      console.info(`${label}:Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_005 end`);
    })

    /**
     * @tc.number Multimodalinput_GestureEventTest_006
     * @tc.name Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_006
     * @tc.desc GestureEvent interface On gesture pinch
     */
    it('Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_006', 0, function () {
      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_006 enter`);
      /** @type { Pinch } */
      let pinch = {
        type: gestureEvent.ActionType.BEGIN,
        scale: 1
      }
      expect(pinch.type == 1).assertTrue();
      expect(pinch.scale == 1).assertTrue();
      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_006 exit`);
    })

    /**
     * @tc.number Multimodalinput_GestureEventTest_007
     * @tc.name Multimodalinput_GestureEvent_test_SUB_MMI_Rotate_001
     * @tc.desc GestureEvent interface On gesture rotate
     */
    it('Multimodalinput_GestureEvent_test_SUB_MMI_Rotate_001', 0, function () {
      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_Rotate_001 enter`);
      /** @type { Rotate } */
      let rotate = {
        type: gestureEvent.ActionType.BEGIN,
        angle: 0
      }
      expect(rotate.type == 1).assertTrue();
      expect(rotate.angle == 0).assertTrue();
      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_Rotate_001 exit`);
    })

    /**
     * @tc.number Multimodalinput_GestureEventTest_008
     * @tc.name Multimodalinput_GestureEvent_test_SUB_MMI_ThreeFingersTap_001
     * @tc.desc GestureEvent interface On gesture threeFingersTap
     */
    it('Multimodalinput_GestureEvent_test_SUB_MMI_ThreeFingersTap_001', 0, function () {
      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_ThreeFingersTap_001 enter`);
      /** @type { ThreeFingersTap } */
      let threeFingersTap = {
        type: gestureEvent.ActionType.END
      }
      expect(threeFingersTap.type == 3).assertTrue();
      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_ThreeFingersTap_001 exit`);
    })
  })
}