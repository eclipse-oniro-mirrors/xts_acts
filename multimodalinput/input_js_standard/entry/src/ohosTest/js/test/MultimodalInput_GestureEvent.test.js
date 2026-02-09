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
     * @tc.name   Multimodalinput_GestureEvent_SUB_MMI_GestureEventTest_001
     * @tc.number Multimodalinput_GestureEventTest_001
     * @tc.desc   GestureEvent interface On gesture type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_GestureEvent_SUB_MMI_GestureEventTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_001 enter`);

      expect(gestureEvent.ActionType.CANCEL == 0).assertTrue();

      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_001 exit`);
    })

    /**
     * @tc.name   Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_002
     * @tc.number Multimodalinput_GestureEventTest_002
     * @tc.desc   GestureEvent interface On gesture type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_002 enter`);

      expect(gestureEvent.ActionType.BEGIN == 1).assertTrue();

      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_002 exit`);
    })

    /**
     * @tc.name   Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_003
     * @tc.number Multimodalinput_GestureEventTest_003
     * @tc.desc   GestureEvent interface On gesture type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_003 enter`);

      expect(gestureEvent.ActionType.UPDATE == 2).assertTrue();

      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_003 exit`);
    })

    /**
     * @tc.name   Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_004
     * @tc.number Multimodalinput_GestureEventTest_004
     * @tc.desc   GestureEvent interface On gesture type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_004 enter`);

      expect(gestureEvent.ActionType.END == 3).assertTrue();

      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_004 exit`);
    })

    /**
     * @tc.name   Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_006
     * @tc.number Multimodalinput_GestureEventTest_006
     * @tc.desc   GestureEvent interface On gesture pinch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
     * @tc.name   Multimodalinput_GestureEvent_test_SUB_MMI_Rotate_001
     * @tc.number Multimodalinput_GestureEventTest_007
     * @tc.desc   GestureEvent interface On gesture rotate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_GestureEvent_test_SUB_MMI_Rotate_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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
     * @tc.name   Multimodalinput_GestureEvent_test_SUB_MMI_ThreeFingersTap_001
     * @tc.number Multimodalinput_GestureEventTest_008
     * @tc.desc   GestureEvent interface On gesture threeFingersTap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multimodalinput_GestureEvent_test_SUB_MMI_ThreeFingersTap_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
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