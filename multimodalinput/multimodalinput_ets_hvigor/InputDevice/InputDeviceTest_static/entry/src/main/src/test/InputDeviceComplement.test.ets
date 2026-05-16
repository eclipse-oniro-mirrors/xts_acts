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

export default function InputDeviceComplementTest() {

  describe("InputDeviceComplementTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   SUB_MMI_Input_Api_offChange_0150
     * @tc.number SUB_MMI_Input_Api_offChange_0150
     * @tc.desc   Call the method normally, and also test the callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_offChange_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_offChange_0150";
        hilog.info(domain, tag, `${caseName} enter`);
        let ifInputDeviceOffSuccess = 0;
        let callback = (data: inputDevice.DeviceListener) => {
          console.log(`Report device event info: ${JSON.stringify(data, [`type`, `deviceId`])}`);
        };
        try {
          inputDevice.onChange(callback);
        } catch (error) {
          console.error(`Listen device event failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        }
        try {
          inputDevice.offChange(callback);
          ifInputDeviceOffSuccess++;
          expect(ifInputDeviceOffSuccess).assertEqual(1);
          done();
        } catch (error) {
          console.error(`Cancel listening device event failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_getDeviceList_0150
     * @tc.number SUB_MMI_Input_Api_IptDev_getDeviceList_0150
     * @tc.desc   Determine whether the return value is empty or non empty, and both are expected to be successful(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_getDeviceList_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_getDeviceList_0150";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          inputDevice.getDeviceList((error: BusinessError<void> | null, ids: Array<int> | undefined) => {
            if (error) {
              console.info(`${caseName} Failed to get device id list, error: ${error}`);
              expect().assertFail();
              done();
            } else {
              console.info(`${caseName} Device id list: ${ids}`);
              if (ids) {
                if (ids.length == 0) {
                  expect(ids.length).assertEqual(0);
                  done();
                } else {
                  expect(ids.length > 0).assertTrue();
                  done();
                }
              }
            }
          });
        } catch (error) {
          error = error as BusinessError;  
          console.info(`${caseName} Failed to get device id list, error: ${error}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_getDeviceList_0250
     * @tc.number SUB_MMI_Input_Api_IptDev_getDeviceList_0250
     * @tc.desc   Determine whether the return value is empty or non empty, and both are expected to be successful(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_getDeviceList_0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_getDeviceList_0250";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          inputDevice.getDeviceList().then((ids: Array<int>) => {
            console.info(`${caseName} Device id list: ${ids}`);
            if (ids) {
              if (ids.length == 0) {
                expect(ids.length).assertEqual(0);
                done();
              } else {
                expect(ids.length > 0).assertTrue();
                done();
              }
            }
          });
        } catch (error) {
          error = error as BusinessError;  
          console.info(`${caseName} Failed to get device id list, error: ${error}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_getDeviceInfo_0150
     * @tc.number SUB_MMI_Input_Api_IptDev_getDeviceInfo_0150
     * @tc.desc   Test return value type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_getDeviceInfo_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_getDeviceInfo_0150";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          await inputDevice.getDeviceList().then((data: Array<int>) => {
            console.info(`${caseName} Device List: ${JSON.stringify(data)}`);
            inputDevice.getDeviceInfo(data[0],
              (error: BusinessError<void> | null, deviceData: inputDevice.InputDeviceData | undefined) => {
                if (error) {
                  console.info(`${caseName} Failed to get device info, error: ${JSON.stringify(error,
                    [`code`, `message`])}`);
                  expect().assertFail();
                  done();
                } else {
                  console.info(`${caseName} Device info: ${JSON.stringify(deviceData)}`);
                  if (deviceData) {
                    expect(deviceData!.isLocal).assertInstanceOf('Boolean');
                    expect(deviceData!.isVirtual).assertInstanceOf('Boolean');
                    expect(deviceData!.id).assertInstanceOf('Int');
                    expect(deviceData!.name).assertInstanceOf('String');
                    expect(deviceData!.sources).assertInstanceOf('Array');
                    expect(deviceData!.axisRanges).assertInstanceOf('Array');
                    expect(deviceData!.bus).assertInstanceOf('Int');
                    expect(deviceData!.product).assertInstanceOf('Int');
                    expect(deviceData!.vendor).assertInstanceOf('Int');
                    expect(deviceData!.version).assertInstanceOf('Int');
                    expect(deviceData!.phys).assertInstanceOf('String');
                    expect(deviceData!.uniq).assertInstanceOf('String');
                    expect(deviceData!).assertInstanceOf('Object');
                    for (let j = 0; j < deviceData.axisRanges.length; j++) {
                      expect(deviceData.axisRanges[j].source == 'keyboard' || deviceData.axisRanges[j].source == 'mouse'
                        || deviceData.axisRanges[j].source == 'touchpad' ||
                        deviceData.axisRanges[j].source == 'touchscreen'
                        || deviceData.axisRanges[j].source == 'joystick' ||
                        deviceData.axisRanges[j].source == 'trackball').assertTrue();
                      expect(deviceData.axisRanges[j].axis == 'touchmajor' ||
                        deviceData.axisRanges[j].axis == 'touchminor'
                        || deviceData.axisRanges[j].axis == 'orientation' || deviceData.axisRanges[j].axis == 'x'
                        || deviceData.axisRanges[j].axis == 'y' || deviceData.axisRanges[j].axis == 'pressure'
                        || deviceData.axisRanges[j].axis == 'toolminor' || deviceData.axisRanges[j].axis == 'toolmajor'
                        || deviceData.axisRanges[j].axis == 'null').assertTrue();
                      expect(deviceData.axisRanges[j].max).assertInstanceOf('Int');
                      expect(deviceData.axisRanges[j]).assertInstanceOf('Object');
                      expect(deviceData.axisRanges[j].min).assertInstanceOf('Int');
                      expect(deviceData.axisRanges[j].fuzz).assertInstanceOf('Int');
                      expect(deviceData.axisRanges[j].flat).assertInstanceOf('Int');
                      expect(deviceData.axisRanges[j].resolution).assertInstanceOf('Int');
                    }
                    done();
                  }
                }
              });
          })
        } catch (error) {
          error = error as BusinessError;  
          console.info(`${caseName} Failed to get device info, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_getDeviceInfo_0250
     * @tc.number SUB_MMI_Input_Api_IptDev_getDeviceInfo_0250
     * @tc.desc   Test whether the return value attribute id is normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_getDeviceInfo_0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_getDeviceInfo_0250";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          await inputDevice.getDeviceList().then((data: Array<int>) => {
            console.info(`${caseName} Device List: ${JSON.stringify(data)}`);
            inputDevice.getDeviceInfo(data[0]).then((deviceData: inputDevice.InputDeviceData) => {
              console.log(`Device info: ${JSON.stringify(deviceData)}`);
                if (deviceData) {
                    expect(deviceData.isLocal).assertInstanceOf('Boolean');
                    expect(deviceData.isVirtual).assertInstanceOf('Boolean');
                    expect(deviceData.id).assertInstanceOf('Int');
                    expect(deviceData.name).assertInstanceOf('String');
                    expect(deviceData.sources).assertInstanceOf('Array');
                    expect(deviceData.axisRanges).assertInstanceOf('Array');
                    expect(deviceData.bus).assertInstanceOf('Int');
                    expect(deviceData.product).assertInstanceOf('Int');
                    expect(deviceData.vendor).assertInstanceOf('Int');
                    expect(deviceData.version).assertInstanceOf('Int');
                    expect(deviceData.phys).assertInstanceOf('String');
                    expect(deviceData.uniq).assertInstanceOf('String');
                    expect(deviceData).assertInstanceOf('Object');
                    for (let j = 0; j < deviceData.axisRanges.length; j++) {
                      expect(deviceData.axisRanges[j].source == 'keyboard' || deviceData.axisRanges[j].source == 'mouse'
                        || deviceData.axisRanges[j].source == 'touchpad' ||
                        deviceData.axisRanges[j].source == 'touchscreen'
                        || deviceData.axisRanges[j].source == 'joystick' ||
                        deviceData.axisRanges[j].source == 'trackball').assertTrue();
                      expect(deviceData.axisRanges[j].axis == 'touchmajor' ||
                        deviceData.axisRanges[j].axis == 'touchminor'
                        || deviceData.axisRanges[j].axis == 'orientation' || deviceData.axisRanges[j].axis == 'x'
                        || deviceData.axisRanges[j].axis == 'y' || deviceData.axisRanges[j].axis == 'pressure'
                        || deviceData.axisRanges[j].axis == 'toolminor' || deviceData.axisRanges[j].axis == 'toolmajor'
                        || deviceData.axisRanges[j].axis == 'null').assertTrue();
                      expect(deviceData.axisRanges[j].max).assertInstanceOf('Int');
                      expect(deviceData.axisRanges[j]).assertInstanceOf('Object');
                      expect(deviceData.axisRanges[j].min).assertInstanceOf('Int');
                      expect(deviceData.axisRanges[j].fuzz).assertInstanceOf('Int');
                      expect(deviceData.axisRanges[j].flat).assertInstanceOf('Int');
                      expect(deviceData.axisRanges[j].resolution).assertInstanceOf('Int');
                    }
                    done();
                }
            });
          })
        } catch (error) {
          error = error as BusinessError;
          console.info(`${caseName} Failed to get device info, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_getDeviceInfoSync_0150
     * @tc.number SUB_MMI_Input_Api_IptDev_getDeviceInfoSync_0150
     * @tc.desc   Test whether the return value attribute id is normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_getDeviceInfoSync_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_getDeviceInfoSync_0150";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          await inputDevice.getDeviceList().then((data: Array<int>) => {
            console.info(`${caseName} Device List: ${JSON.stringify(data)}`);
            if (data.length > 0) {
              let deviceData: inputDevice.InputDeviceData = inputDevice.getDeviceInfoSync(data[0]);
              console.log(`Device info: ${JSON.stringify(deviceData)}`);
              expect(deviceData.isLocal).assertInstanceOf('Boolean');
              expect(deviceData.isVirtual).assertInstanceOf('Boolean');
              expect(deviceData.id).assertInstanceOf('Int');
              expect(deviceData.name).assertInstanceOf('String');
              expect(deviceData.sources).assertInstanceOf('Array');
              expect(deviceData.axisRanges).assertInstanceOf('Array');
              expect(deviceData.bus).assertInstanceOf('Int');
              expect(deviceData.product).assertInstanceOf('Int');
              expect(deviceData.vendor).assertInstanceOf('Int');
              expect(deviceData.version).assertInstanceOf('Int');
              expect(deviceData.phys).assertInstanceOf('String');
              expect(deviceData.uniq).assertInstanceOf('String');
              expect(deviceData).assertInstanceOf('Object');
              for (let j = 0; j < deviceData.axisRanges.length; j++) {
                expect(deviceData.axisRanges[j].source == 'keyboard' || deviceData.axisRanges[j].source == 'mouse'
                  || deviceData.axisRanges[j].source == 'touchpad' || deviceData.axisRanges[j].source == 'touchscreen'
                  || deviceData.axisRanges[j].source == 'joystick' || deviceData.axisRanges[j].source == 'trackball')
                  .assertTrue();
                expect(deviceData.axisRanges[j].axis == 'touchmajor' || deviceData.axisRanges[j].axis == 'touchminor'
                  || deviceData.axisRanges[j].axis == 'orientation' || deviceData.axisRanges[j].axis == 'x'
                  || deviceData.axisRanges[j].axis == 'y' || deviceData.axisRanges[j].axis == 'pressure'
                  || deviceData.axisRanges[j].axis == 'toolminor' || deviceData.axisRanges[j].axis == 'toolmajor'
                  || deviceData.axisRanges[j].axis == 'null').assertTrue();
                expect(deviceData.axisRanges[j].max).assertInstanceOf('Int');
                expect(deviceData.axisRanges[j]).assertInstanceOf('Object');
                expect(deviceData.axisRanges[j].min).assertInstanceOf('Int');
                expect(deviceData.axisRanges[j].fuzz).assertInstanceOf('Int');
                expect(deviceData.axisRanges[j].flat).assertInstanceOf('Int');
                expect(deviceData.axisRanges[j].resolution).assertInstanceOf('Int');
              }
              done();
            }
          })
        } catch (error) {
          error = error as BusinessError;  
          console.info(`${caseName} Failed to get device info, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_getDeviceInfoSync_0250
     * @tc.number SUB_MMI_Input_Api_IptDev_getDeviceInfoSync_0250
     * @tc.desc   Test normal calling interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_getDeviceInfoSync_0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_getDeviceInfoSync_0250";
        hilog.info(domain, tag, `${caseName} enter`);
        let flagExecuteCall = 0;
        try {
          await inputDevice.getDeviceList().then((data: Array<int>) => {
            console.info(`${caseName} Device List: ${JSON.stringify(data)}`);
            if (data.length > 0) {
              inputDevice.getDeviceInfoSync(data[0]);
              flagExecuteCall++;
              console.log(`Device info: ${data}`);
              expect(flagExecuteCall).assertEqual(1);
              done();
            }
          })
        } catch (error) {
          error = error as BusinessError;  
          console.info(`${caseName} Failed to get device info, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_supportKeys_0150
     * @tc.number SUB_MMI_Input_Api_IptDev_supportKeys_0150
     * @tc.desc   Test normal calling interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_supportKeys_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_supportKeys_0150";
        hilog.info(domain, tag, `${caseName} enter`);
        let flagExecuteCallSupportKeys = 0;
        try {
          let keys: Array<KeyCode> = [KeyCode.KEYCODE_VOLUME_DOWN, KeyCode.KEYCODE_VOLUME_MUTE, KeyCode.KEYCODE_DEL];
          inputDevice.supportKeys(1, keys,
            (error: BusinessError<void> | null, supportResult: Array<Boolean> | undefined) => {
              console.info(`${caseName} Query result: ${JSON.stringify(supportResult)}`);
              flagExecuteCallSupportKeys++;
              expect(flagExecuteCallSupportKeys).assertEqual(1);
              done();
            });
        } catch (error) {
          error = error as BusinessError;  
          console.info(`${caseName} Failed to get device info, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_supportKeys_0250
     * @tc.number SUB_MMI_Input_Api_IptDev_supportKeys_0250
     * @tc.desc   Test parameters that exceed specifications (keys length greater than 6)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_supportKeys_0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_supportKeys_0250";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let keys: Array<KeyCode> =
            [KeyCode.KEYCODE_VOLUME_DOWN, KeyCode.KEYCODE_VOLUME_MUTE, KeyCode.KEYCODE_DEL, KeyCode.KEYCODE_DPAD_CENTER,
              KeyCode.KEYCODE_4, KeyCode.KEYCODE_5];
          inputDevice.supportKeys(1, keys,
            (error: BusinessError<void> | null, supportResult: Array<Boolean> | undefined) => {
              if (error) {
                console.info(`${caseName} error result: ${error.code}`);
                expect(error.code).assertEqual(401);
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
        } catch (error) {
          error = error as BusinessError;  
          console.info(`${caseName} Failed to get device info, error: ${error}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_supportKeys_0350
     * @tc.number SUB_MMI_Input_Api_IptDev_supportKeys_0350
     * @tc.desc   Test return value type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_supportKeys_0350", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_supportKeys_0350";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let keys: Array<KeyCode> = [KeyCode.KEYCODE_VOLUME_DOWN, KeyCode.KEYCODE_VOLUME_MUTE, KeyCode.KEYCODE_DEL,
            KeyCode.KEYCODE_DPAD_CENTER];
          inputDevice.supportKeys(1, keys,
            (error: BusinessError<void> | null, supportResult: Array<Boolean> | undefined) => {
              console.info(`${caseName} Query result: ${JSON.stringify(supportResult)}`);
              expect(supportResult).assertInstanceOf('Array');
              done();
            });
        } catch (error) {
          error = error as BusinessError;  
          console.info(`${caseName} Failed to get device info, error: ${error}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_supportKeys_0450
     * @tc.number SUB_MMI_Input_Api_IptDev_supportKeys_0450
     * @tc.desc   Test normal calling interface(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_supportKeys_0450", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_supportKeys_0450";
        hilog.info(domain, tag, `${caseName} enter`);
        let flagExecuteCallSupportKeys = 0;
        try {
          let keys: Array<KeyCode> = [KeyCode.KEYCODE_VOLUME_DOWN, KeyCode.KEYCODE_VOLUME_MUTE, KeyCode.KEYCODE_DEL];
          inputDevice.supportKeys(1, keys).then((supportResult: Array<Boolean>) => {
            console.log(`Query result: ${JSON.stringify(supportResult)}`);
            flagExecuteCallSupportKeys++;
            expect(flagExecuteCallSupportKeys).assertEqual(1);
            done();
          });
        } catch (error) {
          error = error as BusinessError;  
          console.info(`${caseName} Failed to get device info, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_supportKeys_0550
     * @tc.number SUB_MMI_Input_Api_IptDev_supportKeys_0550
     * @tc.desc   Test parameters that exceed specifications (keys length greater than 6)(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_supportKeys_0550", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_supportKeys_0550";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let keys: Array<KeyCode> =
            [KeyCode.KEYCODE_VOLUME_DOWN, KeyCode.KEYCODE_VOLUME_MUTE, KeyCode.KEYCODE_DEL, KeyCode.KEYCODE_DPAD_CENTER,
              KeyCode.KEYCODE_4, KeyCode.KEYCODE_5];
          await inputDevice.supportKeys(1, keys).then((supportResult: Array<Boolean>) => {
            console.log(`Query result: ${JSON.stringify(supportResult)}`);
            expect().assertFail();
            done();
          });
        } catch (error) {
          error = error as BusinessError;  
          console.info(`${caseName} Failed to get device info, error: ${error.code}`);
          expect(error.code).assertEqual(401);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_supportKeys_0650
     * @tc.number SUB_MMI_Input_Api_IptDev_supportKeys_0650
     * @tc.desc   Test return value type(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_supportKeys_0650", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_supportKeys_0650";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let keys: Array<KeyCode> = [KeyCode.KEYCODE_VOLUME_DOWN, KeyCode.KEYCODE_VOLUME_MUTE, KeyCode.KEYCODE_DEL,
            KeyCode.KEYCODE_DPAD_CENTER];
          inputDevice.supportKeys(1, keys).then((supportResult: Array<Boolean>) => {
            console.log(`Query result: ${JSON.stringify(supportResult)}`);
            expect(supportResult).assertInstanceOf('Array');
            done();
          });
        } catch (error) {
          error = error as BusinessError;  
          console.info(`${caseName} Failed to get device info, error: ${error}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_supportKeys_0750
     * @tc.number SUB_MMI_Input_Api_IptDev_supportKeys_0750
     * @tc.desc   Test parameters that exceed specifications (Keys is an empty array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_supportKeys_0750", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_supportKeys_0750";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let keys: Array<KeyCode> = [];
          inputDevice.supportKeys(1, keys,
            (error: BusinessError<void> | null, supportResult: Array<Boolean> | undefined) => {
              if (error) {
                console.info(`${caseName} error result: ${error.code}`);
                expect(error.code).assertEqual(401);
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
        } catch (error) {
          error = error as BusinessError;  
          console.info(`${caseName} Failed to get device info, error: ${error}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_supportKeys_0850
     * @tc.number SUB_MMI_Input_Api_IptDev_supportKeys_0850
     * @tc.desc   Test parameters that exceed specifications (Keys is an empty array)(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_supportKeys_0850", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_supportKeys_0850";
        hilog.info(domain, tag, `${caseName} enter`);
        let flagExecuteCallSupportKeys = 0;
        try {
          let keys: Array<KeyCode> = [];
          await inputDevice.supportKeys(1, keys).then((supportResult: Array<Boolean>) => {
            console.log(`Query result: ${JSON.stringify(supportResult)}`);
            flagExecuteCallSupportKeys++;
            if (flagExecuteCallSupportKeys == 1) {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          error = error as BusinessError;  
          console.info(`${caseName} Failed to get device info, error: ${error.code}`);
          expect(error.code).assertEqual(401);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_supportKeysSync_0150
     * @tc.number SUB_MMI_Input_Api_IptDev_supportKeysSync_0150
     * @tc.desc   Test normal calling interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_supportKeysSync_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_supportKeysSync_0150";
        hilog.info(domain, tag, `${caseName} enter`);
        let flagExecuteCallSupportKeysSync = 0;
        try {
          let keys: Array<KeyCode> = [KeyCode.KEYCODE_VOLUME_DOWN, KeyCode.KEYCODE_VOLUME_MUTE, KeyCode.KEYCODE_DEL];
          let supportResult: Array<Boolean> = inputDevice.supportKeysSync(1, keys);
          flagExecuteCallSupportKeysSync++;
          expect(flagExecuteCallSupportKeysSync).assertEqual(1);
          done();
        } catch (error) {
          error = error as BusinessError;  
          console.info(`${caseName} Failed to get device info, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_supportKeysSync_0250
     * @tc.number SUB_MMI_Input_Api_IptDev_supportKeysSync_0250
     * @tc.desc   Test parameters that exceed specifications (keys length greater than 6)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_supportKeysSync_0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_supportKeysSync_0250";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let keys: Array<KeyCode> =
            [KeyCode.KEYCODE_VOLUME_DOWN, KeyCode.KEYCODE_VOLUME_MUTE, KeyCode.KEYCODE_DEL, KeyCode.KEYCODE_DPAD_CENTER,
              KeyCode.KEYCODE_4, KeyCode.KEYCODE_5];
          let supportResult: Array<Boolean> = inputDevice.supportKeysSync(1, keys);
          expect().assertFail();
          done();
        } catch (error) {
          error = error as BusinessError;  
          console.info(`${caseName} Failed to get device info, error: ${error}`);
          expect(error.code).assertEqual(401);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_supportKeysSync_0350
     * @tc.number SUB_MMI_Input_Api_IptDev_supportKeysSync_0350
     * @tc.desc   Test return value type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_supportKeysSync_0350", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_supportKeysSync_0350";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let keys: Array<KeyCode> = [KeyCode.KEYCODE_VOLUME_DOWN, KeyCode.KEYCODE_VOLUME_MUTE, KeyCode.KEYCODE_DEL,
            KeyCode.KEYCODE_DPAD_CENTER];
          let supportResult: Array<Boolean> = inputDevice.supportKeysSync(1, keys);
          expect(supportResult).assertInstanceOf('Array');
          done();
        } catch (error) {
          error = error as BusinessError;  
          console.info(`${caseName} Failed to get device info, error: ${error}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_supportKeysSync_0450
     * @tc.number SUB_MMI_Input_Api_IptDev_supportKeysSync_0450
     * @tc.desc   Test parameters that exceed specifications (Keys is an empty array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_supportKeysSync_0450", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_supportKeysSync_0450";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let keys: Array<KeyCode> = [];
          let supportResult: Array<Boolean> = inputDevice.supportKeysSync(1, keys);
          expect().assertFail();
          done();
        } catch (error) {
          error = error as BusinessError;  
          console.info(`${caseName} Failed to get device info, error: ${error.code}`);
          expect(error.code).assertEqual(401);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_getKeyboardType_0150
     * @tc.number SUB_MMI_Input_Api_IptDev_getKeyboardType_0150
     * @tc.desc   Test callback getKeyboardType interface to get the keyboard type of an input device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_getKeyboardType_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_getKeyboardType_0150";
        hilog.info(domain, tag, `${caseName} enter`);
        let flagExecuteCallgetKeyboardType = 0;
        try {
          let tempType: int = 1;
          let funCallback: AsyncCallback<inputDevice.KeyboardType> =
            (error: BusinessError<void> | null, type: inputDevice.KeyboardType | undefined) => {
              if (error) {
                console.error(`Failed to get keyboard type, error: ${JSON.stringify(error, [`code`, `message`])}`);
              }
              console.log(`Keyboard type: ${type}`);
            };
          inputDevice.getKeyboardType(tempType, funCallback);
          flagExecuteCallgetKeyboardType++;
          expect(flagExecuteCallgetKeyboardType).assertEqual(1);
          done();
        } catch (error) {
          console.info(`${caseName} Failed to get keyboard type, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_getKeyboardType_0250
     * @tc.number SUB_MMI_Input_Api_IptDev_getKeyboardType_0250
     * @tc.desc   Test interface return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_getKeyboardType_0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_getKeyboardType_0250";
        hilog.info(domain, tag, `${caseName} enter`);
        let flagExecuteCallgetKeyboardType = 0;
        try {
          let tempType: int = 1;
          let funCallback: AsyncCallback<inputDevice.KeyboardType> =
            (error: BusinessError<void> | null, type: inputDevice.KeyboardType | undefined) => {
              if (error) {
                console.error(`Failed to get keyboard type, error: ${JSON.stringify(error, [`code`, `message`])}`);
                expect().assertFail();
                done();
              } else {
                expect(type == inputDevice.KeyboardType.NONE ||
                  type == inputDevice.KeyboardType.UNKNOWN ||
                  type == inputDevice.KeyboardType.ALPHABETIC_KEYBOARD ||
                  type == inputDevice.KeyboardType.DIGITAL_KEYBOARD ||
                  type == inputDevice.KeyboardType.HANDWRITING_PEN ||
                  type == inputDevice.KeyboardType.REMOTE_CONTROL)
                  .assertTrue();
                done();
              }
              console.log(`Keyboard type: ${type}`);
            };
          inputDevice.getKeyboardType(tempType, funCallback);
          console.log(`getKeyboardType success`);
        } catch (error) {
          console.info(`${caseName} Failed to get keyboard type, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_getKeyboardType_0350
     * @tc.number SUB_MMI_Input_Api_IptDev_getKeyboardType_0350
     * @tc.desc   Test callback getKeyboardType interface to get the keyboard type of an input device(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_getKeyboardType_0350", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_getKeyboardType_0350";
        hilog.info(domain, tag, `${caseName} enter`);
        let flagExecuteCallgetKeyboardType = 0;
        try {
          let id: int = 1;
          let fun = (type: inputDevice.KeyboardType) => {
            console.log(`Keyboard type: ${JSON.stringify(type)}`);
          };
          inputDevice.getKeyboardType(id).then(fun);
          flagExecuteCallgetKeyboardType++;
          expect(flagExecuteCallgetKeyboardType).assertEqual(1);
          done();
        } catch (error) {
          console.info(`${caseName} Failed to get keyboard type, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_getKeyboardType_0450
     * @tc.number SUB_MMI_Input_Api_IptDev_getKeyboardType_0450
     * @tc.desc   Test interface return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_getKeyboardType_0450", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_getKeyboardType_0450";
        hilog.info(domain, tag, `${caseName} enter`);
        let flagExecuteCallgetKeyboardType = 0;
        try {
          let id: int = 1;
          await inputDevice.getKeyboardType(id).then((type: inputDevice.KeyboardType) => {
            console.log(`Keyboard type: ${JSON.stringify(type)}`);
            expect(type == inputDevice.KeyboardType.NONE ||
              type == inputDevice.KeyboardType.UNKNOWN ||
              type == inputDevice.KeyboardType.ALPHABETIC_KEYBOARD ||
              type == inputDevice.KeyboardType.DIGITAL_KEYBOARD ||
              type == inputDevice.KeyboardType.HANDWRITING_PEN ||
              type == inputDevice.KeyboardType.REMOTE_CONTROL)
              .assertTrue();
            done();
          });
          console.log(`getKeyboardType success`);
        } catch (error) {
          console.info(`${caseName} Failed to get keyboard type, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_getKeyboardTypeSync_0150
     * @tc.number SUB_MMI_Input_Api_IptDev_getKeyboardTypeSync_0150
     * @tc.desc   Test callback interface to get the keyboard type of an input device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_getKeyboardTypeSync_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_getKeyboardTypeSync_0150";
        hilog.info(domain, tag, `${caseName} enter`);
        let flagExecuteCallgetKeyboardTypeSync = 0;
        try {
          inputDevice.getKeyboardTypeSync(1);
          console.info(`${caseName} Keyboard success`);
          flagExecuteCallgetKeyboardTypeSync++;
          expect(flagExecuteCallgetKeyboardTypeSync).assertEqual(1);
          done();
        } catch (error) {
          console.info(`${caseName} Failed to get keyboard type, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_getKeyboardTypeSync_0250
     * @tc.number SUB_MMI_Input_Api_IptDev_getKeyboardTypeSync_0250
     * @tc.desc   Test interface return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_getKeyboardTypeSync_0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_getKeyboardTypeSync_0250";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let type: int = inputDevice.getKeyboardTypeSync(1);
          console.info(`${caseName} Keyboard type: ${JSON.stringify(type)}`);
          expect(type == inputDevice.KeyboardType.NONE ||
            type == inputDevice.KeyboardType.UNKNOWN ||
            type == inputDevice.KeyboardType.ALPHABETIC_KEYBOARD ||
            type == inputDevice.KeyboardType.DIGITAL_KEYBOARD ||
            type == inputDevice.KeyboardType.HANDWRITING_PEN ||
            type == inputDevice.KeyboardType.REMOTE_CONTROL)
            .assertTrue;
          done();
        } catch (error) {
          console.info(`${caseName} Failed to get keyboard type, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_getIntervalSinceLastInput_0150
     * @tc.number SUB_MMI_Input_Api_IptDev_getIntervalSinceLastInput_0150
     * @tc.desc   Test promise getIntervalSinceLastInput interface to get the time interval since the last system input event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_getIntervalSinceLastInput_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_getIntervalSinceLastInput_0150";
        hilog.info(domain, tag, `${caseName} enter`);
        let flagExecuteCallGetIntervalSinceLastInput = 0;
        try {
          inputDevice.getIntervalSinceLastInput().then((timeInterval: long) => {
            console.info(`${caseName} interval since last input: ${JSON.stringify(timeInterval)}`);
            flagExecuteCallGetIntervalSinceLastInput++;
            expect(flagExecuteCallGetIntervalSinceLastInput).assertEqual(1);
            done();
          });
        } catch (error) {
          console.info(`${caseName} failed to get interval since last input, error: ${JSON.stringify(error,
            [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_getIntervalSinceLastInput_0250
     * @tc.number SUB_MMI_Input_Api_IptDev_getIntervalSinceLastInput_0250
     * @tc.desc   Test return value type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_getIntervalSinceLastInput_0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_getIntervalSinceLastInput_0250";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          inputDevice.getIntervalSinceLastInput().then((timeInterval: long) => {
            console.info(`${caseName} interval since last input: ${JSON.stringify(timeInterval)}`);
            expect(timeInterval).assertInstanceOf('Long');
            done();
          });
        } catch (error) {
          console.info(`${caseName} failed to get interval since last input, error: ${JSON.stringify(error,
            [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_isFunctionKeyEnabled_0150
     * @tc.number SUB_MMI_Input_Api_IptDev_isFunctionKeyEnabled_0150
     * @tc.desc   Normal interface call, no keyboard device, error code 3900002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_isFunctionKeyEnabled_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_isFunctionKeyEnabled_0150";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          await inputDevice.isFunctionKeyEnabled(inputDevice.FunctionKey.CAPS_LOCK).then((state1: boolean) => {
            console.info(`${caseName} capslock state1: ${state1}`);
            expect().assertFail();
            done();
          });
        } catch (error) {
          console.info(`${caseName} failed to get capslock state, error: ${error.code}`);
          expect(error.code).assertEqual(3900002);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });
  })
}