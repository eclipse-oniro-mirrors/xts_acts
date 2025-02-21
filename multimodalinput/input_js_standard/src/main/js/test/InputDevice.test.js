/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import inputDevice from '@ohos.multimodalInput.inputDevice';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
export default function InputDevice_test() {
  describe('InputDevice_test', function () {

    const errCode = {
      COMMON_PARAMETER_CODE: 401
    }
    const errMsg = {
      PARAMETER_COUNT_MSG: `Parameter count error`,
      PARAMETER_TYPE_MSG: `Parameter error. The type of type must be string.`,
      PARAMETER_DEVICEID_TYPE_MSG: `Parameter error. The type of deviceId must be number.`,
      PARAMETER_LISTENER_TYPE_MSG: `Parameter error. The type of listener must be function.`,
      PARAMETER_CALLBACK_TYPE_MSG: `Parameter error. The type of callback must be function.`
    }

    // 参数正确,返回一个数组
    it("InputDevice_getDeviceIds_test_01", 0, async function (done) {
      console.info(`InputDevice_getDeviceIds_test_01 enter`);
      try {
        inputDevice.getDeviceIds((err, data) => {
          if (err) {
            expect(false).assertTrue();
          } else {
            expect(data).assertInstanceOf('Array');
          }
          console.info(`InputDevice_getDeviceIds_test_01 exit`);
          done();
        })
      } catch (error) {
        console.info(`InputDevice_getDeviceIds_test_01 error`);
        expect(false).assertTrue();
        done();
      }
    })

    // 参数正确,判断一种或多种设备
    it("InputDevice_getDeviceIds_test_02", 0, async function (done) {
      console.info(`InputDevice_getDeviceIds_test_02 enter`);
      try {
        inputDevice.getDeviceIds((err, data) => {
          console.info(`InputDevice_getDeviceIds_test_02 err:${JSON.stringify(err)}`);
          console.info(`InputDevice_getDeviceIds_test_02 data:${JSON.stringify(data)}`);
          if (err) {
            expect(false).assertTrue();
          } else {
            expect(data.length > 0).assertTrue();
          }
          console.info(`InputDevice_getDeviceIds_test_02 exit`);
          done();
        })
      } catch (error) {
        console.info(`InputDevice_getDeviceIds_test_02 error`);
        expect(false).assertTrue();
        done();
      }
    })

    // 参数类型错误
    it("InputDevice_getDeviceIds_test_03", 0, async function (done) {
      console.info(`InputDevice_getDeviceIds_test_03 enter`);
      try {
        inputDevice.getDeviceIds(-1);
      } catch (error) {
        expect(error.message).assertEqual("GetDeviceIds: \"The first parameter type is wrong\"");
      }
      console.info(`InputDevice_getDeviceIds_test_03 exit`);
      done();
    })

    // 参数数量错误
    it("InputDevice_getDeviceIds_test_04", 0, async function (done) {
      console.info(`InputDevice_getDeviceIds_test_04 enter`);
      try {
        inputDevice.getDeviceIds(-1, (err, data) => {
          console.info(data);
        });
      } catch (error) {
        expect(error.message).assertEqual("GetDeviceIds: \"too many parameters\"");
      }
      console.info(`InputDevice_getDeviceIds_test_04 exit`);
      done();
    })

    // 无效的设备id
    it("InputDevice_getDevice_test_01", 0, async function (done) {
      console.info(`InputDevice_getDevice_test_01 enter`);
      try {
        inputDevice.getDevice(-1, (err, data) => {
          if (err) {
            expect(false).assertTrue();
            console.info(`InputDevice_getDevice_test_01 ${JSON.stringify(err)}`);
          } else {
            expect(JSON.stringify(data) !== "{}").assertTrue();
          }
          console.info(`InputDevice_getDevice_test_01 exit`);
        })
      } catch (error) {
        console.info(`InputDevice_getDevice_test_01 error`);
        expect(false).assertTrue();
      } finally {
        done();
      }
    })

    // 参数正常,返回值正常
    it("InputDevice_getDevice_test_02", 0, async function (done) {
      console.info(`InputDevice_getDevice_test_02 enter`);

        inputDevice.getDeviceIds(async (err, data) => {
          try { 
          console.info(`InputDevice_getDeviceIds_test_02 err:${JSON.stringify(err)}`);
          console.info(`InputDevice_getDeviceIds_test_02 data:${JSON.stringify(data)}`);
          if (err) {
            expect(false).assertTrue();
          } else {
            for (let i = 0; i < data.length; i++) {
              console.info(`InputDevice_getDevice_test_02 for`);
              await getDevicePromise(data[i])
            }
            function getDevicePromise(data) {
              console.info(`InputDevice_getDevice_test_02  getDevicePromise`)
              return new Promise((resolve, reject) => {
                inputDevice.getDevice(data, (err, res) => {
                  try{
                  console.info(`getDevice:data =${JSON.stringify(data)}`);
                  console.info(`getDevice:res =${JSON.stringify(res)}`);
                  let arr = Object.keys(res);
                  expect(res.id).assertInstanceOf('Number');
                  expect(res.name).assertInstanceOf('String');
                  expect(res.sources).assertInstanceOf('Array');
                  expect(res.axisRanges).assertInstanceOf('Array');
                  expect(res.bus).assertInstanceOf('Number');
                  expect(res.product).assertInstanceOf('Number');
                  expect(res.vendor).assertInstanceOf('Number');
                  expect(res.version).assertInstanceOf('Number');
                  expect(res.phys).assertInstanceOf('String');
                  expect(res.uniq).assertInstanceOf('String');
                  expect(res).assertInstanceOf('Object');
                  console.info(`InputDevice_getDevice_test_02  getDevice expect res`);
                  for (let j = 0; j < res.axisRanges.length; j++) {
                    expect(res.axisRanges[j].source == 'keyboard' || res.axisRanges[j].source == 'mouse'
                      || res.axisRanges[j].source == 'touchpad' || res.axisRanges[j].source == 'touchscreen'
                      || res.axisRanges[j].source == 'joystick' || res.axisRanges[j].source == 'trackball').assertTrue();
                    expect(res.axisRanges[j].axis == 'touchMajor' || res.axisRanges[j].axis == 'touchMinor'
                      || res.axisRanges[j].axis == 'orientation' || res.axisRanges[j].axis == 'x'
                      || res.axisRanges[j].axis == 'y' || res.axisRanges[j].axis == 'pressure'
                      || res.axisRanges[j].axis == 'toolMinor' || res.axisRanges[j].axis == 'toolMajor'
                      || res.axisRanges[j].axis == 'NULL').assertTrue();
                    expect(res.axisRanges[j].max).assertInstanceOf('Number');
                    expect(res.axisRanges[j]).assertInstanceOf('Object');
                    expect(res.axisRanges[j].min).assertInstanceOf('Number');
                    expect(res.axisRanges[j].fuzz).assertInstanceOf('Number');
                    expect(res.axisRanges[j].flat).assertInstanceOf('Number');
                    expect(res.axisRanges[j].resolution).assertInstanceOf('Number');
                  }
                } catch (err) {
                  console.info(`InputDevice_getDevice_test_02  AssertException ${JSON.stringify(error)}`);
                }
                resolve(res);
                })
              })
            }
          }
          console.info(`InputDevice_getDevice_test_02 exit`);
        } catch (err) {
          console.info(`InputDevice_getDevice_test_02 error`);
        }
        done();
        });

    })

    // 参数正常,返回值正常
    it("InputDevice_supportKeys_test_01", 0, async function (done) {
      console.info(`InputDevice_supportKeys_test_01 enter`);
      try {
        inputDevice.getDeviceIds((err, data) => {
          if (err) {
            expect(false).assertTrue();
          } else {
            for (let i = 0; i < data.length; ++i) {
              inputDevice.supportKeys(data[i], [17, 22, 2055], (err, res) => {
                expect(res).assertInstanceOf('Array');
              });
            }
          }
          console.info(`InputDevice_supportKeys_test_01 exit`);
          done();
        });
      } catch (error) {
        console.info(`InputDevice_supportKeys_test_01 error`);
        expect(false).assertTrue();
        done();
      }
    })

    // 第二个参数异常
    it("InputDevice_supportKeys_test_02", 0, async function (done) {
      console.info(`InputDevice_supportKeys_test_02 enter`);
      try {
        inputDevice.supportKeys(0, 2022, (err, res) => {
          console.info(res);
        });
      } catch (error) {
        expect(error.message).assertEqual("Parameter error. The type of keys must be array.");
      }
      console.info(`InputDevice_supportKeys_test_02 exit`);
      done();
    })

    // 参数正常
    it("InputDevice_getKeyboardType_test_01", 0, async function (done) {
      console.info(`InputDevice_getKeyboardType_test_01 enter`);
      try {
        inputDevice.getDeviceIds((err, data) => {
          if (err) {
            expect(false).assertTrue();
          } else {
            for (let i = 0; i < data.length; ++i) {
              inputDevice.getKeyboardType(data[i], (err, res) => {
                expect(res).assertInstanceOf('Number');
              });
            }
          }
          console.info(`InputDevice_getKeyboardType_test_01 exit`);
          done();
        });
      } catch (error) {
        console.info(`InputDevice_getKeyboardType_test_01 error`);
        expect(false).assertTrue();
        done();
      }
    })

    //参数异常
    it("InputDevice_getKeyboardType_test_02", 0, async function (done) {
      console.info(`InputDevice_getKeyboardType_test_02 enter`);
      try {
        inputDevice.getKeyboardType(-1);
      } catch (error) {
        expect(error.message).assertEqual("Invalid input device id");
      }
      console.info(`InputDevice_getKeyboardType_test_02 exit`);
      done();
    });

    // 参数正常
    it("InputDevice_getKeyboardType_test_03", 0, async function (done) {
      console.info(`InputDevice_getKeyboardType_test_03 enter`);
      try {
        inputDevice.getDeviceIds((err, data) => {
          if (err) {
            expect(false).assertTrue();
          } else {
            for (let i = 0; i < data.length; ++i) {
              inputDevice.getKeyboardType(data[i]).then((res) => {
                expect(res).assertInstanceOf('Number');
              }).catch((err) => {
                console.info(`InputDevice_getKeyboardType_test_03 failed, err=${JSON.stringify(err)}`);
                expect(false).assertTrue();
              });
            }
          }
          console.info(`InputDevice_getKeyboardType_test_03 exit`);
          done();
        });
      } catch (error) {
        console.info(`InputDevice_getKeyboardType_test_03 error`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number MultimodalInputDevice_js_0010
     * @tc.name MultimodalInputDevice_KeyboardType_NONE_test
     * @tc.desc inputDevice.KeyboardType.NONE test
     */
    it("InputDevice_KeyboardType_NONE_test", 0, function () {
      console.info('InputDevice_KeyboardType_NONE_test = ' + inputDevice.KeyboardType.NONE);
      expect(inputDevice.KeyboardType.NONE == 0).assertTrue();
    })

    /**
     * @tc.number MultimodalInputDevice_js_0020
     * @tc.name MultimodalInputDevice_KeyboardType_UNKNOWN_test
     * @tc.desc inputDevice.KeyboardType.UNKNOWN test
     */
    it("InputDevice_KeyboardType_UNKNOWN_test", 0, function () {
      console.info('InputDevice_KeyboardType_UNKNOWN_test = ' + inputDevice.KeyboardType.UNKNOWN);
      expect(inputDevice.KeyboardType.UNKNOWN == 1).assertTrue();
    })

    /**
     * @tc.number MultimodalInputDevice_js_0030
     * @tc.name MultimodalInputDevice_KeyboardType_ALPHABETIC_KEYBOARD_test
     * @tc.desc inputDevice.KeyboardType.ALPHABETIC_KEYBOARD test
     */
    it("InputDevice_KeyboardType_ALPHABETIC_KEYBOARD_test", 0, function () {
      console.info('InputDevice_KeyboardType_ALPHABETIC_KEYBOARD_test = '
        + inputDevice.KeyboardType.ALPHABETIC_KEYBOARD);
      expect(inputDevice.KeyboardType.ALPHABETIC_KEYBOARD == 2).assertTrue();
    })

    /**
     * @tc.number MultimodalInputDevice_js_0040
     * @tc.name MultimodalInputDevice_KeyboardType_ALPHABETIC_DIGITAL_KEYBOARD_test
     * @tc.desc inputDevice.KeyboardType.DIGITAL_KEYBOARD test
     */
    it("InputDevice_KeyboardType_ALPHABETIC_DIGITAL_KEYBOARD_test", 0, function () {
      console.info('InputDevice_KeyboardType_ALPHABETIC_DIGITAL_KEYBOARD_test = '
        + inputDevice.KeyboardType.DIGITAL_KEYBOARD);
      expect(inputDevice.KeyboardType.DIGITAL_KEYBOARD == 3).assertTrue();
    })

    /**
     * @tc.number MultimodalInputDevice_js_0050
     * @tc.name MultimodalInputDevice_KeyboardType_ALPHABETIC_HANDWRITING_PEN_test
     * @tc.desc inputDevice.KeyboardType.HANDWRITING_PEN test
     */
    it("InputDevice_KeyboardType_ALPHABETIC_HANDWRITING_PEN_test", 0, function () {
      console.info('InputDevice_KeyboardType_ALPHABETIC_HANDWRITING_PEN_test = '
        + inputDevice.KeyboardType.HANDWRITING_PEN);
      expect(inputDevice.KeyboardType.HANDWRITING_PEN == 4).assertTrue();
    })

    /**
     * @tc.number MultimodalInputDevice_js_0060
     * @tc.name MultimodalInputDevice_KeyboardType_ALPHABETIC_REMOTE_CONTROL_test
     * @tc.desc inputDevice.KeyboardType.REMOTE_CONTROL test
     */
    it("InputDevice_KeyboardType_ALPHABETIC_REMOTE_CONTROL_test", 0, function () {
      console.info('InputDevice_KeyboardType_ALPHABETIC_REMOTE_CONTROL_test = '
        + inputDevice.KeyboardType.REMOTE_CONTROL);
      expect(inputDevice.KeyboardType.REMOTE_CONTROL == 5).assertTrue();
    })

    /**
     * @tc.number MultimodalInputDevice_js_0070
     * @tc.name MultimodalInputDevice_getDeviceIds_Promise_test
     * @tc.desc inputdevice interface getDeviceIds & supportKeys test
     */
    it("InputDevice_getDeviceIds_Promise_test", 0, async function (done) {
      console.info(`InputDevice_getDeviceIds_Promise_test enter`);
      try {
        inputDevice.getDeviceIds().then(data => {
          console.info(`InputDevice_getDeviceIds_Promise_test data`);
          for (let i = 0; i < data.length; ++i) {
            inputDevice.supportKeys(data[i], [17, 22, 2055]).then(res => {
              console.info(`InputDevice_getDeviceIds_Promise_test res`);
              expect(res).assertInstanceOf('Array');
            }).catch((err) => {
              console.info(`InputDevice_getDeviceIds_Promise_test failed, err=${JSON.stringify(err)}`);
              expect(false).assertTrue();
            });
          }
          done();
        }).catch((err) => {
          console.info(`InputDevice_getDeviceIds_Promise_test failed, err=${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.info(`InputDevice_getDeviceIds_Promise_test error`);
        expect(false).assertTrue();
        done();
      }
      console.info(`InputDevice_getDeviceIds_Promise_test exit`);
    })

    /**
     * @tc.number MultimodalInputDevice_js_0080
     * @tc.name MultimodalInputDevice_getDevice_Promise_test
     * @tc.desc inputdevice interface getDevice test
     */
    it("InputDevice_getDevice_Promise_test", 0, async function (done) {
      console.info(`InputDevice_getDevice_Promise_test enter`);
      try {
        inputDevice.getDevice(-1).then(data => {
          console.info(`InputDevice_getDevice_Promise_test data`);
          expect(JSON.stringify(data) !== "{}").assertTrue();
        }).catch((err) => {
          console.info(`InputDevice_getDevice_Promise_test err`);
          expect(false).assertTrue();
        });
      } catch (error) {
        console.info(`InputDevice_getDeviceIds_Promise_test error`);
        expect(false).assertTrue();
      }
      console.info(`InputDevice_getDeviceIds_Promise_test exit`);
      done();
    })

    /**
     * @tc.number MultimodalInputDevice_js_0090
     * @tc.name MultimodalInputDevice_on_test
     * @tc.desc inputdevice interface getDevice test
     */
    it("InputDevice_on_test", 0, async function (done) {
      console.info(`InputDevice_on_test enter`);
      try {
        let isPhysicalKeyboardExist = true;
        inputDevice.on("change", (data) => {
          console.info("InputDevice_on_test type: " + data.type + ", deviceId: " + data.deviceId);
          inputDevice.getKeyboardType(data.deviceId, (err, ret) => {
            console.info("InputDevice_on_test The keyboard type of the device is: " + ret);
            if (ret == inputDevice.KeyboardType.ALPHABETIC_KEYBOARD && data.type == 'add') {
              // 监听物理键盘已连接。
              isPhysicalKeyboardExist = true;
            } else if (ret == inputDevice.KeyboardType.ALPHABETIC_KEYBOARD && data.type == 'remove') {
              // 监听物理键盘已断开。
              isPhysicalKeyboardExist = false;
            }
          });
        });
      } catch (error) {
        console.info(`InputDevice_on_test error`);
        expect(false).assertTrue();
      }
      console.info(`InputDevice_on_test exit`);
      done();
    })

    /**
     * @tc.number MultimodalInputDevice_js_0100
     * @tc.name MultimodalInputDevice_off_test
     * @tc.desc inputdevice interface getDevice test
     */
    it("InputDevice_off_test", 0, async function (done) {
      console.info(`InputDevice_off_test enter`);
      function listener(data) {
        console.info("type: " + data.type + ", deviceId: " + data.deviceId);
        expect(data.type == 'add' || data.type == 'remove').assertTrue();
        expect(data).assertInstanceOf('Object');
      }
      // 单独取消listener的监听。
      try {
        inputDevice.off("change", listener);
      } catch (error) {
        console.info(`InputDevice_on_test error`);
        expect(false).assertTrue();
      }
      console.info(`InputDevice_off_test exit`);
      done();
    })

    /**
     * @tc.number MultimodalInputDevice_js_0110
     * @tc.name MultimodalInputDevice_GetDeviceList_test
     * @tc.desc inputdevice interface getDeviceList test
     */
    it("InputDevice_getDeviceList_test_01", 0, async function (done) {
      console.info(`InputDevice_getDeviceList_async_test enter`);
      try {
        inputDevice.getDeviceList((err, data) => {
          if (err) {
            expect(false).assertTrue();
          } else {
            expect(data).assertInstanceOf('Array');
          }
          console.info(`InputDevice_getDeviceList_async_test exit`);
          done();
        })
      } catch (err) {
        expect(false).assertTrue();
        done();
      }

    })

    /**
     * @tc.number MultimodalInputDevice_js_0120
     * @tc.name MultimodalInputDevice_GetDeviceList_test
     * @tc.desc inputdevice interface getDeviceList test
     */
    it("InputDevice_getDeviceList_test_02", 0, async function (done) {
      console.info(`InputDevice_getDeviceList_promise_test enter`);
      try {
        inputDevice.getDeviceList().then(data => {
          expect(data).assertInstanceOf('Array');
        }).catch(error => {
          expect(false).assertTrue();
        });
      } catch (err) {
        expect(false).assertTrue();
      }
      console.info(`InputDevice_getDeviceList_promise_test exit`);
      done();
    })

    /**
     * @tc.number MultimodalInputDevice_js_0130
     * @tc.name MultimodalInputDevice_GetDeviceInfo_test
     * @tc.desc inputdevice interface getDeviceInfo test
     */
    it("InputDevice_getDeviceInfo_test_01", 0, async function (done) {
      console.info(`InputDevice_getDeviceInfo_async_test enter`);
      try {
        await inputDevice.getDeviceList().then((data) => {
          console.info(`getDeviceInfo:data assertInstanceOf Array` + typeof (data));
          expect(data).assertInstanceOf('Array');
          console.info(`getDeviceInfo:data assertInstanceOf Array end ${data.length}`);
          if (data.length <= 0) {
            done()
            return;
          }
            inputDevice.getDeviceInfo(data[0], (err, res) => {
              try {
              console.info(`getDeviceInfo:data enter`);
              if (err) {
                expect(false).assertTrue();
                return;
              }
              let arr = [];
              console.info(`getDeviceInfo:data ${JSON.stringify(res)}`);
              arr = Object.keys(res);
              expect(res.id).assertInstanceOf('Number');
              expect(res.name).assertInstanceOf('String');
              expect(res.sources).assertInstanceOf('Array');
              expect(res.axisRanges).assertInstanceOf('Array');
              expect(res.bus).assertInstanceOf('Number');
              expect(res.product).assertInstanceOf('Number');
              expect(res.vendor).assertInstanceOf('Number');
              expect(res.version).assertInstanceOf('Number');
              expect(res.phys).assertInstanceOf('String');
              expect(res.uniq).assertInstanceOf('String');
              expect(res).assertInstanceOf('Object');
              for (let j = 0; j < res.axisRanges.length; j++) {
                expect(res.axisRanges[j].source == 'keyboard' || res.axisRanges[j].source == 'mouse'
                  || res.axisRanges[j].source == 'touchpad' || res.axisRanges[j].source == 'touchscreen'
                  || res.axisRanges[j].source == 'joystick' || res.axisRanges[j].source == 'trackball').assertTrue();
                expect(res.axisRanges[j].axis == 'touchMajor' || res.axisRanges[j].axis == 'touchMinor'
                  || res.axisRanges[j].axis == 'orientation' || res.axisRanges[j].axis == 'x'
                  || res.axisRanges[j].axis == 'y' || res.axisRanges[j].axis == 'pressure'
                  || res.axisRanges[j].axis == 'toolMinor' || res.axisRanges[j].axis == 'toolMajor'
                  || res.axisRanges[j].axis == 'NULL').assertTrue();
                expect(res.axisRanges[j].max).assertInstanceOf('Number');
                expect(res.axisRanges[j]).assertInstanceOf('Object');
                expect(res.axisRanges[j].min).assertInstanceOf('Number');
                expect(res.axisRanges[j].fuzz).assertInstanceOf('Number');
                expect(res.axisRanges[j].flat).assertInstanceOf('Number');
                expect(res.axisRanges[j].resolution).assertInstanceOf('Number');
              }
            } catch (err) {
              console.info(`InputDevice_getDeviceInfo_test_01 inputDevice.getDeviceInfo ${JSON.stringify(err)}`);
              expect(false).assertTrue();
            }
            done();
            })
        })
      } catch (err) {
        console.info(`InputDevice_getDeviceInfo_test_01 inputDevice.getDeviceList ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
      console.info(`InputDevice_getDeviceInfo_async_test exit`);
    })

    /**
     * @tc.number MultimodalInputDevice_js_0140
     * @tc.name MultimodalInputDevice_GetDeviceInfo_test
     * @tc.desc inputdevice interface getDeviceInfo test
     */
    it("InputDevice_getDeviceInfo_test_02", 0, async function (done) {
      console.info(`InputDevice_getDeviceInfo_promise_test enter`);
      try {
        inputDevice.getDeviceList().then((data) => {
          expect(data).assertInstanceOf('Array');
          if (data.length <= 0) {
            return;
          }
            inputDevice.getDeviceInfo(data[0]).then((res) => {
              try {
              let arr = [];
              console.info(`getDeviceInfo:data ${JSON.stringify(res)}`);
              arr = Object.keys(res);
              expect(res.id).assertInstanceOf('Number');
              expect(res.name).assertInstanceOf('String');
              expect(res.sources).assertInstanceOf('Array');
              expect(res.axisRanges).assertInstanceOf('Array');
              expect(res.bus).assertInstanceOf('Number');
              expect(res.product).assertInstanceOf('Number');
              expect(res.vendor).assertInstanceOf('Number');
              expect(res.version).assertInstanceOf('Number');
              expect(res.phys).assertInstanceOf('String');
              expect(res.uniq).assertInstanceOf('String');
              expect(res).assertInstanceOf('Object');
              for (let j = 0; j < res.axisRanges.length; j++) {
                expect(res.axisRanges[j].source == 'keyboard' || res.axisRanges[j].source == 'mouse'
                  || res.axisRanges[j].source == 'touchpad' || res.axisRanges[j].source == 'touchscreen'
                  || res.axisRanges[j].source == 'joystick' || res.axisRanges[j].source == 'trackball').assertTrue();
                expect(res.axisRanges[j].axis == 'touchMajor' || res.axisRanges[j].axis == 'touchMinor'
                  || res.axisRanges[j].axis == 'orientation' || res.axisRanges[j].axis == 'x'
                  || res.axisRanges[j].axis == 'y' || res.axisRanges[j].axis == 'pressure'
                  || res.axisRanges[j].axis == 'toolMinor' || res.axisRanges[j].axis == 'toolMajor'
                  || res.axisRanges[j].axis == 'NULL').assertTrue();
                expect(res.axisRanges[j].max).assertInstanceOf('Number');
                expect(res.axisRanges[j]).assertInstanceOf('Object');
                expect(res.axisRanges[j].min).assertInstanceOf('Number');
                expect(res.axisRanges[j].fuzz).assertInstanceOf('Number');
                expect(res.axisRanges[j].flat).assertInstanceOf('Number');
                expect(res.axisRanges[j].resolution).assertInstanceOf('Number');
              }
            } catch (err) {
              expect(false).assertTrue();
              done();
            }
            }).catch(err => {
              expect(false).assertTrue();
              done();
            });
        })
      } catch (err) {
        expect(false).assertTrue();
        done();
      }
      console.info(`InputDevice_getDeviceInfo_promise_test exit`);
      done();
    })

    /**
     * @tc.number MultimodalInputDevice_js_0150
     * @tc.name MultimodalInputDevice_GetkeyboardType_Exception_test_01
     * @tc.desc inputdevice interface getKeyboardType exception test
     */
    it("InputDevice_GetkeyboardType_Exception_test_01", 0, async function (done) {
      console.info(`InputDevice_GetkeyboardType_Exception_test_01 enter`);
      try {
        inputDevice.getKeyboardType();
      } catch (error) {
        console.info(`GetkeyboardType_Exception_test_01: ${JSON.stringify(error, [`code`, `message`])}`);
        expect(error.code).assertEqual(errCode.COMMON_PARAMETER_CODE);
        expect(error.message).assertEqual(errMsg.PARAMETER_COUNT_MSG);
      }
      console.info("InputDevice_GetkeyboardType_Exception_test_01 exit");
      done();
    })

    /**
     * @tc.number MultimodalInputDevice_js_0160
     * @tc.name MultimodalInputDevice_GetkeyboardType_Exception_test_02
     * @tc.desc inputdevice interface getKeyboardType exception test
     */
    it("InputDevice_GetkeyboardType_Exception_test_02", 0, async function (done) {
      console.info("InputDevice_GetkeyboardType_Exception_test_02 enter");
      try {
        inputDevice.getKeyboardType(`id`).then((data) => {
          console.info(`GetkeyboardType_Exception_test_02 success`);
          expect(true).assertTrue();
        }, (error) => {
          console.info(`GetkeyboardType_Exception_test_02 failed, err=${JSON.stringify(error)}`);
          expect(false).assertTrue();
        });
      } catch (error) {
        console.info(`GetkeyboardType_Exception_test_02: ${JSON.stringify(error, [`code`, `message`])}`);
        expect(error.code).assertEqual(errCode.COMMON_PARAMETER_CODE);
        expect(error.message).assertEqual(errMsg.PARAMETER_DEVICEID_TYPE_MSG);
      }
      console.info("InputDevice_GetkeyboardType_Exception_test_02 exit");
      done();
    })

    /**
     * @tc.number MultimodalInputDevice_js_0170
     * @tc.name MultimodalInputDevice_SupportKeys_Exception_test_01
     * @tc.desc inputdevice interface supportKeys exception test
     */
    it("InputDevice_SupportKeys_Exception_test_01", 0, async function (done) {
      console.info("InputDevice_SupportKeys_Exception_test_01 enter");
      try {
        inputDevice.supportKeys((error, data) => {
          if (error) {
            console.info(`SupportKeys_Exception_test_01 failed, err=${JSON.stringify(error)}`);
            expect(false).assertTrue();
          } else {
            console.info(`SupportKeys_Exception_test_01 success`);
            expect(true).assertTrue();
          }
        })
      } catch (error) {
        console.info(`SupportKeys_Exception_test_01: ${JSON.stringify(error, [`code`, `message`])}`);
        expect(error.code).assertEqual(errCode.COMMON_PARAMETER_CODE);
        expect(error.message).assertEqual(errMsg.PARAMETER_COUNT_MSG);
      }
      console.info("InputDevice_SupportKeys_Exception_test_01 exit");
      done();
    })

    /**
     * @tc.number MultimodalInputDevice_js_0180
     * @tc.name MultimodalInputDevice_SupportKeys_Exception_test_02
     * @tc.desc inputdevice interface supportKeys exception test
     */
    it("InputDevice_SupportKeys_Exception_test_02", 0, async function (done) {
      console.info("InputDevice_SupportKeys_Exception_test_02 enter");
      try {
        inputDevice.supportKeys(`id`, [17, 22, 2055], (error, data) => {
          if (error) {
            console.info(`SupportKeys_Exception_test_02 failed, err=${JSON.stringify(error)}`);
            expect(false).assertTrue();
          } else {
            console.info(`SupportKeys_Exception_test_02 success`);
            expect(true).assertTrue();
          }
        })
      } catch (error) {
        console.info(`SupportKeys_Exception_test_02: ${JSON.stringify(error, [`code`, `message`])}`);
        expect(error.code).assertEqual(errCode.COMMON_PARAMETER_CODE);
        expect(error.message).assertEqual(errMsg.PARAMETER_DEVICEID_TYPE_MSG);
      }
      console.info("InputDevice_SupportKeys_Exception_test_02 exit");
      done();
    })

    /**
     * @tc.number MultimodalInputDevice_js_0190
     * @tc.name MultimodalInputDevice_GetDeviceInfo_Exception_test_01
     * @tc.desc inputdevice interface getDeviceInfo exception test
     */
    it("InputDevice_GetDeviceInfo_Exception_test_01", 0, async function (done) {
      console.info("InputDevice_GetDeviceInfo_Exception_test_01 enter");
      try {
        inputDevice.getDeviceInfo();
      } catch (error) {
        console.info(`GetDeviceInfo_Exception_test_01: ${JSON.stringify(error, [`code`, `message`])}`);
        expect(error.code).assertEqual(errCode.COMMON_PARAMETER_CODE);
        expect(error.message).assertEqual(errMsg.PARAMETER_COUNT_MSG);
      }
      console.info("InputDevice_GetDeviceInfo_Exception_test_01 exit");
      done();
    })

    /**
     * @tc.number MultimodalInputDevice_js_0200
     * @tc.name MultimodalInputDevice_GetDeviceInfo_Exception_test_02
     * @tc.desc inputdevice interface getDeviceInfo exception test
     */
    it("InputDevice_GetDeviceInfo_Exception_test_02", 0, async function (done) {
      console.info("InputDevice_GetDeviceInfo_Exception_test_02 enter");
      try {
        inputDevice.getDeviceList().then((data) => {
          expect(data).assertInstanceOf('Array');
          if (data.length <= 0) {
            return;
          }
          try {
            inputDevice.getDeviceInfo(`data[0]`).then((res) => {
              console.info(`GetDeviceInfo_Exception_test_02 success`);
              expect(true).assertTrue();
            }).catch(error => {
              console.info(`GetDeviceInfo_Exception_test_02 failed, err=${JSON.stringify(error)}`);
              expect(false).assertTrue();
            });
          } catch (error) {
            console.info(`GetDeviceInfo_Exception_test_02: ${JSON.stringify(error, [`code`, `message`])}`);
            expect(error.code).assertEqual(errCode.COMMON_PARAMETER_CODE);
            expect(error.message).assertEqual(errMsg.PARAMETER_DEVICEID_TYPE_MSG);
          }
        })
      } catch (error) {
        expect(false).assertTrue();
      }
      console.info("InputDevice_GetDeviceInfo_Exception_test_02 exit");
      done();
    })

    /**
     * @tc.number MultimodalInputDevice_js_0210
     * @tc.name MultimodalInputDevice_GetDeviceList_Exception_test
     * @tc.desc inputdevice interface getDeviceList exception test
     */
    it("InputDevice_GetDeviceList_Exception_test", 0, async function (done) {
      console.info("InputDevice_GetDeviceList_Exception_test enter");
      try {
        inputDevice.getDeviceList(null);
      } catch (error) {
        console.info(`GetDeviceList_Exception_test_01: ${JSON.stringify(error, [`code`, `message`])}`);
        expect(error.code).assertEqual(errCode.COMMON_PARAMETER_CODE);
        expect(error.message).assertEqual(errMsg.PARAMETER_CALLBACK_TYPE_MSG);
      }
      console.info(`InputDevice_GetDeviceList_Exception_test exit`);
      done();
    })

    /**
     * @tc.number MultimodalInputDevice_js_0220
     * @tc.name MultimodalInputDevice_On_Exception_test
     * @tc.desc inputdevice interface on test
     */
    it("InputDevice_On_Exception_test", 0, async function (done) {
      console.info(`InputDevice_On_Exception_test enter`);
      try {
        inputDevice.on();
      } catch (error) {
        console.info(`On_Exception_test: ${JSON.stringify(error, [`code`, `message`])}`);
        expect(error.code).assertEqual(errCode.COMMON_PARAMETER_CODE);
        expect(error.message).assertEqual(errMsg.PARAMETER_COUNT_MSG);
      }

      try {
        inputDevice.on(-1, (data) => {
          if (error) {
            console.info(`On_Exception_test failed, err=${JSON.stringify(error)}`);
            expect(false).assertTrue();
          } else {
            console.info(`On_Exception_test success`);
            expect(true).assertTrue();
          }
        });
      } catch (error) {
        console.info(`On_Exception_test: ${JSON.stringify(error, [`code`, `message`])}`);
        expect(error.code).assertEqual(errCode.COMMON_PARAMETER_CODE);
        expect(error.message).assertEqual(errMsg.PARAMETER_TYPE_MSG);
      }
      console.info(`InputDevice_On_Exception_test exit`);
      done();
    })

    /**
     * @tc.number MultimodalInputDevice_js_0230
     * @tc.name MultimodalInputDevice_Off_Exception_test
     * @tc.desc inputdevice interface off test
     */
    it("InputDevice_Off_Exception_test", 0, async function (done) {
      console.info(`InputDevice_Off_Exception_test enter`);
      try {
        inputDevice.off();
      } catch (error) {
        console.info(`Off_Exception_test: ${JSON.stringify(error, [`code`, `message`])}`);
        expect(error.code).assertEqual(errCode.COMMON_PARAMETER_CODE);
        expect(error.message).assertEqual(errMsg.PARAMETER_COUNT_MSG);
      }

      try {
        inputDevice.off('change', null);
      } catch (error) {
        console.info(`Off_Exception_test: ${JSON.stringify(error, [`code`, `message`])}`);
        expect(error.code).assertEqual(errCode.COMMON_PARAMETER_CODE);
        expect(error.message).assertEqual(errMsg.PARAMETER_LISTENER_TYPE_MSG);
      }
      console.info(`InputDevice_Off_Exception_test exit`);
      done();
    })
  })
}
