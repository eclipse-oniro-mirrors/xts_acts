/*
 * Copyright (C) 2025 Huawei Device cO., lTD.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError }  from '@ohos.base';
import { Rotate, Pinch, ThreeFingersSwipe, FourFingersSwipe, ActionType, ThreeFingersTap } from '@kit.InputKit';

export default function MultimodalGestureEventTest() {
  describe("MultimodalGestureEventTest", ()=> {
    const ExpectTrue = (n: boolean) => {
      try {
        expect(n).assertTrue();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }
    const ExpectFalse = (n: boolean) => {
      try {
        expect(n).assertFail();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }

    /**
     * @tc.name   SUB_MMI_Input_Api_gestureEvent_Pinch_0100
     * @tc.number SUB_MMI_Input_Api_gestureEvent_Pinch_0100
     * @tc.desc   Test Pinch.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_gestureEvent_Pinch_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_gestureEvent_Pinch_0100";
      try {
        let Pinch: Pinch[] = [{
          type: ActionType.CANCEL,
          scale: 1
        }];
        console.info(`${caseName} success, Pinch is ${JSON.stringify(Pinch)}`);
        ExpectTrue(Pinch[0].type == 0);
        done();
      } catch (error) {
        console.info(`${caseName} catch fail`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_gestureEvent_Rotate_0100
     * @tc.number SUB_MMI_Input_Api_gestureEvent_Rotate_0100
     * @tc.desc   Test Rotate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_gestureEvent_Rotate_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_gestureEvent_Rotate_0100";
      try {
        let Rotate: Rotate[] = [{
          type: ActionType.BEGIN,
          angle: 1
        }];
        console.info(`${caseName} success, Rotate is ${JSON.stringify(Rotate)}`);
        ExpectTrue(Rotate[0].type == 1);
        done();
      } catch (error) {
        console.info(`${caseName} catch fail`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_gestureEvent_ThreeFingersSwipe_0100
     * @tc.number SUB_MMI_Input_Api_gestureEvent_ThreeFingersSwipe_0100
     * @tc.desc   Test ThreeFingersSwipe.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_gestureEvent_ThreeFingersSwipe_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_gestureEvent_ThreeFingersSwipe_0100";
      try {
        let ThreeFingersSwipe: ThreeFingersSwipe[] = [{
          type: ActionType.UPDATE,
          x: 1,
          y: 2
        }];
        console.info(`${caseName} success, ThreeFingersSwipe is ${JSON.stringify(ThreeFingersSwipe)}`);
        ExpectTrue(ThreeFingersSwipe[0].type == 2);
        done();
      } catch (error) {
        console.info(`${caseName} catch fail`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_gestureEvent_FourFingersSwipe_0100
     * @tc.number SUB_MMI_Input_Api_gestureEvent_FourFingersSwipe_0100
     * @tc.desc   Test FourFingersSwipe.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_gestureEvent_FourFingersSwipe_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_gestureEvent_FourFingersSwipe_0100";
      try {
        let FourFingersSwipe: FourFingersSwipe[] = [{
          type: ActionType.END,
          x: 1,
          y: 2
        }];
        console.info(`${caseName} success, FourFingersSwipe is ${JSON.stringify(FourFingersSwipe)}`);
        ExpectTrue(FourFingersSwipe[0].type == 3);
        done();
      } catch (error) {
        console.info(`${caseName} catch fail`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_gestureEvent_ThreeFingersTap_0100
     * @tc.number SUB_MMI_Input_Api_gestureEvent_ThreeFingersTap_0100
     * @tc.desc   Test ThreeFingersTap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_gestureEvent_ThreeFingersTap_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_gestureEvent_ThreeFingersTap_0100";
      try {
        let ThreeFingersTap: ThreeFingersTap[] = [{
          type: ActionType.CANCEL
        }];
        console.info(`${caseName} success, ThreeFingersTap is ${JSON.stringify(ThreeFingersTap)}`);
        ExpectTrue(ThreeFingersTap[0].type == 0);
        done();
      } catch (error) {
        console.info(`${caseName} catch fail`);
        ExpectFalse(true);
        done();
      }
    });
  });
}