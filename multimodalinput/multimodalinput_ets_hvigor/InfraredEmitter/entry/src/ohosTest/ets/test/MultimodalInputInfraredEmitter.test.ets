/*
 * Copyright (C) 2024 Huawei Device cO., lTD.
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
import { infraredEmitter } from '@kit.InputKit';

export default function MultimodalInputInfraredEmitterTest() {
  describe("MultimodalInputInfraredEmitterTest", ()=> {
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
     * @tc.number: SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0100
     * @tc.name: SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0100
     * @tc.desc: Test transmitInfrared interface to generate an infrared signal of a specific frequency and a special level.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0100";
      let ifTransmitInfraredSuccess = 0;
      try {
        let infraredFrequency: number = 38000;
        let pattern: Array<number> = [100, 200, 300, 400];
        infraredEmitter.transmitInfrared(infraredFrequency, pattern);
        console.info(`${caseName} transmitInfrared success.`);
        ifTransmitInfraredSuccess++;
        ExpectTrue(ifTransmitInfraredSuccess == 1);
        done();
      } catch (error) {
        console.info(`${caseName} transmitInfrared failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0200
     * @tc.name: SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0200
     * @tc.desc: Test transmitInfrared interface to generate an infrared signal of a specific frequency and a special level with 1024 pattern parameters.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0200", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0200";
      let ifTransmitInfraredSuccess = 0;
      try {
        let infraredFrequency: number = 38000;
        let pattern: Array<number> = [];
        for(let i=1; i<=1024; i++) {
          pattern.push(i*100);
        }
        infraredEmitter.transmitInfrared(infraredFrequency, pattern);
        console.info(`${caseName} transmitInfrared success.`);
        ifTransmitInfraredSuccess++;
        ExpectTrue(ifTransmitInfraredSuccess == 1);
        done();
      } catch (error) {
        console.info(`${caseName} transmitInfrared failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0300
     * @tc.name: SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0300
     * @tc.desc: Test transmitInfrared interface to generate an infrared signal of a specific frequency and a special level with 1025 pattern parameters.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0300", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0300";
      try {
        let infraredFrequency: number = 38000;
        let pattern: Array<number> = [];
        for(let i=1; i<=1025; i++) {
          pattern.push(i*100);
        }
        infraredEmitter.transmitInfrared(infraredFrequency, pattern);
        console.info(`${caseName} transmitInfrared success.`);
        ExpectFalse(true);
        done();
      } catch (error) {
        console.info(`${caseName} transmitInfrared failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectTrue(error.code == 401);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0400
     * @tc.name: SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0400
     * @tc.desc: Test transmitInfrared interface to generate an infrared signal of a specific frequency and a special level with error pattern(negative number).
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0400", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0400";
      try {
        let infraredFrequency: number = 38000;
        let pattern: Array<number> = [100, 200, -300, 400, 500, 600, 700, 800, 900, 1000];
        infraredEmitter.transmitInfrared(infraredFrequency, pattern);
        console.info(`${caseName} transmitInfrared success.`);
        ExpectFalse(true);
        done();
      } catch (error) {
        console.info(`${caseName} transmitInfrared failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectTrue(error.code == 401);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0500
     * @tc.name: SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0500
     * @tc.desc: Test transmitInfrared interface to generate an infrared signal of a specific frequency and a special level with error infraredFrequency.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0500", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0500";
      try {
        let infraredFrequency: number = -38000;
        let pattern: Array<number> = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000];
        infraredEmitter.transmitInfrared(infraredFrequency, pattern);
        console.info(`${caseName} transmitInfrared success.`);
        ExpectFalse(true);
        done();
      } catch (error) {
        console.info(`${caseName} transmitInfrared failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectTrue(error.code == 401);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0600
     * @tc.name: SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0600
     * @tc.desc: Test transmitInfrared interface to generate an infrared signal of a specific frequency and a special level with pattern(length is odd number).
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0600", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0600";
      let ifTransmitInfraredSuccess = 0;
      try {
        let infraredFrequency: number = 38000;
        let pattern: Array<number> = [100, 200, 300];
        infraredEmitter.transmitInfrared(infraredFrequency, pattern);
        console.info(`${caseName} transmitInfrared success.`);
        ifTransmitInfraredSuccess++;
        ExpectTrue(ifTransmitInfraredSuccess == 1);
        done();
      } catch (error) {
        console.info(`${caseName} transmitInfrared failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(error.code == 401);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0700
     * @tc.name: SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0700
     * @tc.desc: Test transmitInfrared interface to generate an infrared signal of a specific frequency and a special level with pattern(non-incremental).
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0700", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0700";
      let ifTransmitInfraredSuccess = 0;
      try {
        let infraredFrequency: number = 38000;
        let pattern: Array<number> = [400, 200, 300, 100, 500];
        infraredEmitter.transmitInfrared(infraredFrequency, pattern);
        console.info(`${caseName} transmitInfrared success.`);
        ifTransmitInfraredSuccess++;
        ExpectTrue(ifTransmitInfraredSuccess == 1);
        done();
      } catch (error) {
        console.info(`${caseName} transmitInfrared failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0800
     * @tc.name: SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0800
     * @tc.desc: Test transmitInfrared interface to generate an infrared signal of a specific frequency and a special level with pattern(empty).
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0800";
      let ifTransmitInfraredSuccess = 0;
      try {
        let infraredFrequency: number = 38000;
        let pattern: Array<number> = [];
        infraredEmitter.transmitInfrared(infraredFrequency, pattern);
        console.info(`${caseName} transmitInfrared success.`);
        ifTransmitInfraredSuccess++;
        ExpectTrue(ifTransmitInfraredSuccess == 1);
        done();
      } catch (error) {
        console.info(`${caseName} transmitInfrared failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_InfraredEmitter_getInfraredFrequencies_0100
     * @tc.name: SUB_MMI_Input_Api_InfraredEmitter_getInfraredFrequencies_0100
     * @tc.desc: Test getInfraredFrequencies interface to query the frequency range of infrared signals supported by the phone.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_InfraredEmitter_getInfraredFrequencies_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_InfraredEmitter_getInfraredFrequencies_0100";
      try {
        let frequencies: infraredEmitter.InfraredFrequency[] = [{
          max: 0,
          min: 0
        }];
        frequencies = infraredEmitter.getInfraredFrequencies();
        console.info(`${caseName} getInfraredFrequencies success, frequencies: ${JSON.stringify(frequencies)}`);
        ExpectTrue(Array.isArray(frequencies));
        done();
      } catch (error) {
        console.info(`${caseName} get infrared frequencies failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });
  });
}