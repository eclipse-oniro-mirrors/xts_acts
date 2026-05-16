import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';

import common from '@ohos.app.ability.common';

import { inputDevice } from '@kit.InputKit';
import { inputConsumer } from '@kit.InputKit';
import { KeyEvent, Action, KeyCode } from '@kit.InputKit';
import { AsyncCallback } from '@kit.BasicServicesKit';
import { BusinessError } from "@ohos.base"

import { infraredEmitter } from '@kit.InputKit';
import { image } from '@kit.ImageKit';

import pointer from '@ohos.multimodalInput.pointer';
import window from '@ohos.window';
import { AppStorage } from '@ohos.arkui.stateManagement'

import { inputDevice, pointer } from '@kit.InputKit';

import { KeyCode } from '@ohos.multimodalInput.keyCode';

let domain: int = 0x0000; 
let tag: string = 'testTag'; 

export default function InfraredEmitterComplementTest() {

  describe("InfraredEmitterComplementTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0350
     * @tc.number SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0350
     * @tc.desc   Test transmitInfrared interface to generate an infrared signal of a specific frequency and a special level with 1025 pattern parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0350", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0350";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let infraredFrequency: long = 38000;
          let pattern: Array<long> = [];
          for (let i = 1; i <= 1025; i++) {
            pattern.push(i * 100);
          }
          infraredEmitter.transmitInfrared(infraredFrequency, pattern);
          console.info(`${caseName} transmitInfrared success.`);
          expect().assertFail();
          done();
        } catch (error) {
          error = error as BusinessError;
          console.info(`${caseName} transmitInfrared failed, error: ${error.code} ${error.message}`);
          expect(error.code).assertEqual(401);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0450
     * @tc.number SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0450
     * @tc.desc   Test transmitInfrared interface to generate an infrared signal of a specific frequency and a special level with error pattern(negative number).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0450", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0450";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let infraredFrequency: long = 38000;
          let pattern: Array<long> = [100, 200, -300, 400, 500, 600, 700, 800, 900, 1000];
          infraredEmitter.transmitInfrared(infraredFrequency, pattern);
          console.info(`${caseName} transmitInfrared success.`);
          expect().assertFail();
          done();
        } catch (error) {
          error = error as BusinessError;
          console.info(`${caseName} transmitInfrared failed, error: ${error.code} ${error.message}`);
          expect(error.code).assertEqual(401);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0550
     * @tc.number SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0550
     * @tc.desc   Test transmitInfrared interface to generate an infrared signal of a specific frequency and a special level with error infraredFrequency.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0550", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0550";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let infraredFrequency: long = -38000;
          let pattern: Array<long> = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000];
          infraredEmitter.transmitInfrared(infraredFrequency, pattern);
          console.info(`${caseName} transmitInfrared success.`);
          expect().assertFail();
          done();
        } catch (error) {
          error = error as BusinessError;
          console.info(`${caseName} transmitInfrared failed, error: ${error.code} ${error.message}`);
          expect(error.code).assertEqual(401);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0650
     * @tc.number SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0650
     * @tc.desc   Test the interface condition when the number of level signals is odd, and it is expected no errors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0650", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0650";
        hilog.info(domain, tag, `${caseName} enter`);
        let ifTransmitInfraredSuccess = 0;
        try {
          let infraredFrequency: long = 38000;
          let pattern: Array<long> = [100, 200, 300, 400, 500, 600, 700, 800, 900];
          infraredEmitter.transmitInfrared(infraredFrequency, pattern);
          console.info(`${caseName} transmitInfrared success.`);
          ifTransmitInfraredSuccess++;
          expect(ifTransmitInfraredSuccess).assertEqual(1);
          done();
        } catch (error) {
          error = error as BusinessError;
          console.info(`${caseName} transmitInfrared failed, error: ${error.code} ${error.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_InfraredEmitter_getInfraredFrequencies_0150
     * @tc.number SUB_MMI_Input_Api_InfraredEmitter_getInfraredFrequencies_0150
     * @tc.desc   Test interface non null return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_InfraredEmitter_getInfraredFrequencies_0150",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_InfraredEmitter_getInfraredFrequencies_0150";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          infraredEmitter.hasIrEmitter().then((result: boolean) => {
            console.info(`${caseName} hasIrEmitter success, result: ${result}`);
            let frequencies = infraredEmitter.getInfraredFrequencies();
            console.info(`${caseName} getInfraredFrequencies success, frequencies: ${JSON.stringify(frequencies)}`);
            if (result) {
              expect(result).assertEqual(true);
              expect(frequencies.length > 0).assertTrue();
              expect(frequencies[0].max > 0).assertTrue();
            } else {
              expect(result).assertEqual(false);
              expect(frequencies[0].max).assertEqual(0);
              expect(frequencies[0].min).assertEqual(0);
            }
            done();
          })
        } catch (error) {
          console.info(`${caseName} Failed to set capslock state, error: ${JSON.stringify(error,
            [`code`, `message`])}`);
          expect(error.code).assertEqual(3800001);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

  })

}