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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import infraredEmitter from '@ohos.multimodalInput.infraredEmitter';
import inputDevice from '@ohos.multimodalInput.inputDevice';
import { BusinessError } from "@ohos.base";
import hilog from '@ohos.hilog';
import Utils from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function MultimodalNoPermissionTest() {

  describe("MultimodalNoPermissionTest", (): void => {
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
     * @tc.name   SUB_MMI_Input_Api_NoPermission_0100
     * @tc.number SUB_MMI_Input_Api_NoPermission_0100
     * @tc.desc   Test promise setFunctionKeyEnabled interface to set non-permission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_MMI_Input_Api_NoPermission_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_NoPermission_0100";
        try {
          await inputDevice.setFunctionKeyEnabled(inputDevice.FunctionKey.CAPS_LOCK, true);
          console.info(`${caseName} Set capslock state success`);
          ExpectFalse(true);
          done();
        } catch (error) {
          error = error as BusinessError;
          console.info(`${caseName} Failed to set capslock state, error: ${JSON.stringify(error,
            [`code`, `message`])}`);
          ExpectTrue(error.code === 201);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_NoPermission_0200
     * @tc.number SUB_MMI_Input_Api_NoPermission_0200
     * @tc.desc   Test transmitInfrared interface to set non-permission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_NoPermission_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_NoPermission_0200";
        try {
          let infraredFrequency: long = 38000;
          let pattern: Array<long> = [100, 200, 300, 400];
          infraredEmitter.transmitInfrared(infraredFrequency, pattern);
          console.info(`${caseName} transmitInfrared success.`);
          ExpectFalse(true);
          done();
        } catch (error) {
          error = error as BusinessError;
          console.info(`${caseName} transmitInfrared failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 201);
          done();
        }
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_NoPermission_0300
     * @tc.number SUB_MMI_Input_Api_NoPermission_0300
     * @tc.desc   Test getInfraredFrequencies interface to set non-permission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_NoPermission_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_NoPermission_0300";
        try {
          let frequencies = infraredEmitter.getInfraredFrequencies();
          console.info(`${caseName} getInfraredFrequencies success, frequencies: ${JSON.stringify(frequencies)}`);
          ExpectFalse(true);
          done();
        } catch (error) {
          error = error as BusinessError;
          console.info(`${caseName} transmitInfrared failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 201);
          done();
        }
      });
  })
}