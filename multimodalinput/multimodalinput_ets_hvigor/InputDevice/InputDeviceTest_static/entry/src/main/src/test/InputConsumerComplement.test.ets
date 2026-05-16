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

export default function InputConsumerComplementTest() {

  describe("InputConsumerComplementTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_getAllSystemHotkeys_0150
     * @tc.number SUB_MMI_Input_Api_IptDev_getAllSystemHotkeys_0150
     * @tc.desc   OH_Input_GetAllSystemHotkeys Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_getAllSystemHotkeys_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_getAllSystemHotkeys_0150";
        hilog.info(domain, tag, `${caseName} enter`);
        let ifTransmitInfraredSuccess = 0;
        try {
          inputConsumer.getAllSystemHotkeys().then((data: Array<inputConsumer.HotkeyOptions>) => {
            console.log(`List of system hotkeys : ${JSON.stringify(data)}`);
            ifTransmitInfraredSuccess++;
            expect(data.length >= 0).assertTrue();
            done();
          });
        } catch (err) {
          err = err as BusinessError;
          console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(801);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_onHotkeyChange_0150
     * @tc.number SUB_MMI_Input_Api_IptDev_onHotkeyChange_0150
     * @tc.desc   Can the test succeed when the property preKeys in the first parameter is an empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_onHotkeyChange_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_onHotkeyChange_0150";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let hotkeyOptions: inputConsumer.HotkeyOptions = {
            preKeys: [],
            finalKey: 2042,
            isRepeat: true
          };
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          try {
            inputConsumer.onHotkeyChange(hotkeyOptions, hotkeyCallback);
            console.info(`${caseName} success`);
            expect().assertFail();
            inputConsumer.offHotkeyChange(hotkeyOptions, hotkeyCallback);
            done();
          } catch (error) {
            error = error as BusinessError;
            console.info(`${caseName} Subscribe failed, error: ${error.code}`);
            expect(error.code).assertEqual(401);
            done();
          }
        } catch (error) {
          error = error as BusinessError;
          console.info(`${caseName} failed to subscribe, error: ${error.code} ${error.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_onHotkeyChange_0250
     * @tc.number SUB_MMI_Input_Api_IptDev_onHotkeyChange_0250
     * @tc.desc   Can the test succeed when the attribute isRepeat in the first parameter is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_onHotkeyChange_0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_onHotkeyChange_0250";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let hotkeyOptions: inputConsumer.HotkeyOptions = {
            preKeys: [2045],
            finalKey: 2042,
            isRepeat: false
          };
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          let ifInputConsumerOnSuccess = 0;
          try {
            inputConsumer.onHotkeyChange(hotkeyOptions, hotkeyCallback);
            console.info(`${caseName} success`);
            ifInputConsumerOnSuccess++;
            expect(ifInputConsumerOnSuccess).assertEqual(1);
            inputConsumer.offHotkeyChange(hotkeyOptions, hotkeyCallback);
            done();
          } catch (error) {
            error = error as BusinessError;
            console.info(`${caseName} Subscribe failed, error: ${error.code}`);
            expect().assertFail();
            done();
          }
        } catch (error) {
          error = error as BusinessError;
          console.info(`${caseName} failed to subscribe, error: ${error.code} ${error.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_offHotkeyChange_0150
     * @tc.number SUB_MMI_Input_Api_IptDev_offHotkeyChange_0150
     * @tc.desc   Can the test succeed when the property preKeys in the first parameter is an empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_offHotkeyChange_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_offHotkeyChange_0150";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          let hotkeyOption: inputConsumer.HotkeyOptions = {
            preKeys: [],
            finalKey: 2042,
            isRepeat: true
          };
          try {
            inputConsumer.onHotkeyChange(hotkeyOption, hotkeyCallback);
            inputConsumer.offHotkeyChange(hotkeyOption, hotkeyCallback);
            console.info(`${caseName} unsubscribe success`);
            expect().assertFail();
            done();
          } catch (error) {
            error = error as BusinessError;
            console.info(`${caseName} unsubscribe failed, error: ${error}`);
            expect(error.code).assertEqual(401);
            done();
          }
        } catch (error) {
          error = error as BusinessError;
          console.info(`${caseName} failed to unsubscribe, error: ${error}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_offHotkeyChange_0250
     * @tc.number SUB_MMI_Input_Api_IptDev_offHotkeyChange_0250
     * @tc.desc   Can the test succeed when the attribute isRepeat in the first parameter is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_offHotkeyChange_0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_offHotkeyChange_0250";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let hotkeyCallback = (hotkeyOptions: inputConsumer.HotkeyOptions) => {
            console.info(`${caseName} hotkeyOptions: ${JSON.stringify(hotkeyOptions)}`);
          }
          let hotkeyOption: inputConsumer.HotkeyOptions = {
            preKeys: [2045],
            finalKey: 2042,
            isRepeat: false
          };
          let ifInputConsumerOffSuccess = 0;
          try {
            inputConsumer.onHotkeyChange(hotkeyOption, hotkeyCallback);
            inputConsumer.offHotkeyChange(hotkeyOption, hotkeyCallback);
            console.info(`${caseName} unsubscribe success`);
            ifInputConsumerOffSuccess++;
            expect(ifInputConsumerOffSuccess).assertEqual(1);
            done();
          } catch (error) {
            error = error as BusinessError;
            console.info(`${caseName} unsubscribe failed, error: ${error}`);
            expect().assertFail();
            done();
          }
        } catch (error) {
          error = error as BusinessError;
          console.info(`${caseName} failed to unsubscribe, error: ${error}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

  })

}