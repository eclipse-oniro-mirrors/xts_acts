/*
 * Copyright (C) 2026 Huawei Device cO., lTD.
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
import { inputEventClient, KeyCode, Axis, Button, } from '@kit.InputKit';

export default function MultimodalEventClientTest() {
  describe("MultimodalEventClientTest", ()=> {

    /**
     * @tc.name   SUB_MMI_Input_Api_InputEventClient_0100
     * @tc.number SUB_MMI_Input_Api_InputEventClient_0100
     * @tc.desc   Test createKeyboardController.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_InputEventClient_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_InputEventClient_0100";
      console.info(`${caseName} enter`);
      try {
        inputEventClient.createKeyboardController()
          .then((keyboardController: inputEventClient.KeyboardController) => {
            keyboardController.pressKey(KeyCode.KEYCODE_A);
            return keyboardController;
          })
          .then((keyboardController: inputEventClient.KeyboardController) => {
            keyboardController.releaseKey(KeyCode.KEYCODE_A);
          })
          .then(() => {
            console.info('Succeeded in releasing key');
          })
          .catch((error: BusinessError) => {
            console.error(`Failed to release key. Code: ${error.code}, message: ${error.message}.`);
          });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} Failed. Code: ${error.code}, message: ${error.message}.`);
        if (error.code === 801) {
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(201);
        }
        done();
      }
      console.info(`${caseName} exit`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_InputEventClient_0200
     * @tc.number SUB_MMI_Input_Api_InputEventClient_0200
     * @tc.desc   Test MouseController moveTo event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_InputEventClient_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_InputEventClient_0200";
      console.info(`${caseName} enter`);
      try {
        inputEventClient.createMouseController()
          .then(mouseController => {
            return mouseController.moveTo(0, 100, 200);
          })
          .then(() => {
            console.info('Succeeded in moving mouse');
          })
          .catch((error: BusinessError) => {
            console.error(`Failed to move mouse. Code: ${error.code}, message: ${error.message}.`);
          });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} Failed. Code: ${error.code}, message: ${error.message}.`);
        if (error.code === 801) {
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(201);
        }
        done();
      }
      console.info(`${caseName} exit`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_InputEventClient_0300
     * @tc.number SUB_MMI_Input_Api_InputEventClient_0300
     * @tc.desc   Test MouseController Axis event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_InputEventClient_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_InputEventClient_0300";
      console.info(`${caseName} enter`);
      try {
        inputEventClient.createMouseController()
          .then((mouseController: inputEventClient.MouseController) => {
            mouseController.beginAxis(Axis.SCROLL_VERTICAL, 10);
            return mouseController;
          })
          .then((mouseController: inputEventClient.MouseController) => {
            mouseController.updateAxis(Axis.SCROLL_VERTICAL, 20);
            return mouseController;
          })
          .then((mouseController: inputEventClient.MouseController) => {
            mouseController.endAxis(Axis.SCROLL_VERTICAL);
          })
          .then(() => {
            console.info('Succeeded in ending axis event');
          })
          .catch((error: BusinessError) => {
            console.error(`Failed to end axis event. Code: ${error.code}, message: ${error.message}.`);
          });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} Failed. Code: ${error.code}, message: ${error.message}.`);
        if (error.code === 801) {
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(201);
        }
        done();
      }
      console.info(`${caseName} exit`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_InputEventClient_0400
     * @tc.number SUB_MMI_Input_Api_InputEventClient_0400
     * @tc.desc   Test MouseController Button event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_InputEventClient_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_InputEventClient_0400";
      console.info(`${caseName} enter`);
      try {
        inputEventClient.createMouseController()
          .then((mouseController: inputEventClient.MouseController) => {
            mouseController.pressButton(Button.LEFT);
            return mouseController;
          })
          .then((mouseController: inputEventClient.MouseController) => {
            mouseController.releaseButton(Button.LEFT);
          })
          .then(() => {
            console.info('Succeeded in releasing mouse button');
          })
          .catch((error: BusinessError) => {
            console.error(`Failed to release mouse button. Code: ${error.code}, message: ${error.message}.`);
          });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} Failed. Code: ${error.code}, message: ${error.message}.`);
        if (error.code === 801) {
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(201);
        }
        done();
      }
      console.info(`${caseName} exit`);
    });
  });
}