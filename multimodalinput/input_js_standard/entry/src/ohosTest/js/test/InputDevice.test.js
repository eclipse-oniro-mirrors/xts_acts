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
      PARAMETER_CALLBACK_TYPE_MSG: `Parameter error. The type of callback must be function.`,
      PARAMETER_DELAY_TYPE_MSG: `Parameter error. The type of delay must be number.`,
      PARAMETER_RATE_TYPE_MSG: `Parameter error. The type of rate must be number.`
    }

    // 参数正确,返回一个数组
    /**
     * @tc.name   InputDevice_getDeviceIds_test_01
     * @tc.number InputDevice_getDeviceIds_test_01
     * @tc.desc   InputDevice_getDeviceIds_test_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_getDeviceIds_test_01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
    /**
     * @tc.name   InputDevice_getDeviceIds_test_02
     * @tc.number InputDevice_getDeviceIds_test_02
     * @tc.desc   InputDevice_getDeviceIds_test_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_getDeviceIds_test_02", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
    /**
     * @tc.name   InputDevice_getDeviceIds_test_03
     * @tc.number InputDevice_getDeviceIds_test_03
     * @tc.desc   InputDevice_getDeviceIds_test_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_getDeviceIds_test_03", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
    /**
     * @tc.name   InputDevice_getDeviceIds_test_04
     * @tc.number InputDevice_getDeviceIds_test_04
     * @tc.desc   InputDevice_getDeviceIds_test_04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_getDeviceIds_test_04", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
    /**
     * @tc.name   InputDevice_getDevice_test_01
     * @tc.number InputDevice_getDevice_test_01
     * @tc.desc   InputDevice_getDevice_test_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_getDevice_test_01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
/**
 * @tc.name   InputDevice_getDevice_test_02
 * @tc.number InputDevice_getDevice_test_02
 * @tc.desc   InputDevice_getDevice_test_02
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it("InputDevice_getDevice_test_02", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
              try {
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
                  expect(res.axisRanges[j].axis == 'touchmajor' || res.axisRanges[j].axis == 'touchminor'
                    || res.axisRanges[j].axis == 'orientation' || res.axisRanges[j].axis == 'x'
                    || res.axisRanges[j].axis == 'y' || res.axisRanges[j].axis == 'pressure'
                    || res.axisRanges[j].axis == 'toolminor' || res.axisRanges[j].axis == 'toolmajor'
                    || res.axisRanges[j].axis == 'null').assertTrue();
                  expect(res.axisRanges[j].max).assertInstanceOf('Number');
                  expect(res.axisRanges[j]).assertInstanceOf('Object');
                  expect(res.axisRanges[j].min).assertInstanceOf('Number');
                  expect(res.axisRanges[j].fuzz).assertInstanceOf('Number');
                  expect(res.axisRanges[j].flat).assertInstanceOf('Number');
                  expect(res.axisRanges[j].resolution).assertInstanceOf('Number');
                }
              } catch (error) {
                console.info(`InputDevice_getDevice_test_02  AssertException ${JSON.stringify(error)}`);
              }
              resolve(res);
            })
          })
        }
      }
      console.info(`InputDevice_getDevice_test_02 exit`);
    } catch (error) {
      console.info(`InputDevice_getDevice_test_02 error`);
      expect(false).assertTrue();
    }
    done();
    });
})

    // 参数正常,返回值正常
    /**
     * @tc.name   InputDevice_supportKeys_test_01
     * @tc.number InputDevice_supportKeys_test_01
     * @tc.desc   InputDevice_supportKeys_test_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_supportKeys_test_01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
    /**
     * @tc.name   InputDevice_supportKeys_test_02
     * @tc.number InputDevice_supportKeys_test_02
     * @tc.desc   InputDevice_supportKeys_test_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_supportKeys_test_02", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
    /**
     * @tc.name   InputDevice_getKeyboardType_test_01
     * @tc.number InputDevice_getKeyboardType_test_01
     * @tc.desc   InputDevice_getKeyboardType_test_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_getKeyboardType_test_01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
    /**
     * @tc.name   InputDevice_getKeyboardType_test_02
     * @tc.number InputDevice_getKeyboardType_test_02
     * @tc.desc   InputDevice_getKeyboardType_test_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_getKeyboardType_test_02", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
    /**
     * @tc.name   InputDevice_getKeyboardType_test_03
     * @tc.number InputDevice_getKeyboardType_test_03
     * @tc.desc   InputDevice_getKeyboardType_test_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_getKeyboardType_test_03", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

    //参数异常
    /**
     * @tc.name   InputDevice_getKeyboardTypeSync_test_04
     * @tc.number InputDevice_getKeyboardTypeSync_test_04
     * @tc.desc   InputDevice_getKeyboardTypeSync_test_04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_getKeyboardTypeSync_test_04", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info(`InputDevice_getKeyboardTypeSync_test_04 enter`);
      try {
        inputDevice.getKeyboardTypeSync(-1);
      } catch (error) {
        expect(error.message).assertEqual("Invalid input device id");
      }
      console.info(`InputDevice_getKeyboardTypeSync_test_04 exit`);
      done();
    });

    // 参数正常
    /**
     * @tc.name   InputDevice_getKeyboardTypeSync_test_05
     * @tc.number InputDevice_getKeyboardTypeSync_test_05
     * @tc.desc   InputDevice_getKeyboardTypeSync_test_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_getKeyboardTypeSync_test_05", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info(`InputDevice_getKeyboardTypeSync_test_05 enter`);
      try {
        inputDevice.getDeviceIds((err, data) => {
          if (err) {
            expect(false).assertTrue();
          } else {
            for (let i = 0; i < data.length; ++i) {
              let keyboardType = inputDevice.getKeyboardTypeSync(data[i]);
              expect(keyboardType).assertInstanceOf('Number');
            }
          }
          console.info(`InputDevice_getKeyboardTypeSync_test_05 exit`);
          done();
        });
      } catch (error) {
        console.info(`InputDevice_getKeyboardTypeSync_test_05 error`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   InputDevice_setKeyboardRepeatDelay_test_01
     * @tc.number InputDevice_setKeyboardRepeatDelay_test_01
     * @tc.desc   InputDevice_setKeyboardRepeatDelay_test_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InputDevice_setKeyboardRepeatDelay_test_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info(`InputDevice_setKeyboardRepeatDelay_test_01 enter`);
      try {
        inputDevice.setKeyboardRepeatDelay(500, (error) => {
          if (error) {
            console.info(`InputDevice_setKeyboardRepeatDelay_test_01 failed, error=${JSON.stringify(error)}`);
            expect(false).assertTrue();
          } else {
            console.info(`InputDevice_setKeyboardRepeatDelay_test_01 success`);
            expect(true).assertTrue();
          }
        });
      } catch (error) {
        console.info(`InputDevice_setKeyboardRepeatDelay_test_01 error`);
        expect(false).assertTrue();
      }
      console.info(`InputDevice_setKeyboardRepeatDelay_test_01 exit`);
      done();
    })

    /**
     * @tc.name   InputDevice_setKeyboardRepeatDelay_test_02
     * @tc.number InputDevice_setKeyboardRepeatDelay_test_02
     * @tc.desc   InputDevice_setKeyboardRepeatDelay_test_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InputDevice_setKeyboardRepeatDelay_test_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info(`InputDevice_setKeyboardRepeatDelay_test_02 enter`);
      try {
        inputDevice.setKeyboardRepeatDelay(500).then(() => {
          console.info(`InputDevice_setKeyboardRepeatDelay_test_02 success`);
          expect(true).assertTrue();
        }).catch((error) => {
          console.info(`InputDevice_setKeyboardRepeatDelay_test_02 failed, error=${JSON.stringify(error)}`);
          expect(false).assertTrue();
        });
      } catch (error) {
        console.info(`InputDevice_setKeyboardRepeatDelay_test_02 error`);
        expect(false).assertTrue();
      }
      console.info(`InputDevice_setKeyboardRepeatDelay_test_02 exit`);
      done();
    })

    /**
     * @tc.name   InputDevice_setKeyboardRepeatRate_test_01
     * @tc.number InputDevice_setKeyboardRepeatRate_test_01
     * @tc.desc   InputDevice_setKeyboardRepeatRate_test_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InputDevice_setKeyboardRepeatRate_test_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info(`InputDevice_setKeyboardRepeatRate_test_01 enter`);
      try {
        inputDevice.setKeyboardRepeatRate(60, (error) => {
          if (error) {
            console.info(`InputDevice_setKeyboardRepeatRate_test_01 failed, error=${JSON.stringify(error)}`);
            expect(false).assertTrue();
          } else {
            console.info(`InputDevice_setKeyboardRepeatRate_test_01 success`);
            expect(true).assertTrue();
          }
        });
      } catch (error) {
        console.info(`InputDevice_setKeyboardRepeatRate_test_01 error`);
        expect(false).assertTrue();
      }
      console.info(`InputDevice_setKeyboardRepeatRate_test_01 exit`);
      done();
    })

    /**
     * @tc.name   InputDevice_setKeyboardRepeatRate_test_02
     * @tc.number InputDevice_setKeyboardRepeatRate_test_02
     * @tc.desc   InputDevice_setKeyboardRepeatRate_test_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InputDevice_setKeyboardRepeatRate_test_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info(`InputDevice_setKeyboardRepeatRate_test_02 enter`);
      try {
        inputDevice.setKeyboardRepeatRate(60).then(() => {
          console.info(`InputDevice_setKeyboardRepeatRate_test_02 success`);
          expect(true).assertTrue();
        }).catch((error) => {
          console.info(`InputDevice_setKeyboardRepeatRate_test_02 failed, error=${JSON.stringify(error)}`);
          expect(false).assertTrue();
        });
      } catch (error) {
        console.info(`InputDevice_setKeyboardRepeatRate_test_02 error`);
        expect(false).assertTrue();
      }
      console.info(`InputDevice_setKeyboardRepeatRate_test_02 exit`);
      done();
    })

    /**
     * @tc.name   InputDevice_KeyboardType_NONE_test
     * @tc.number MultimodalInputDevice_js_0010
     * @tc.desc   inputDevice.KeyboardType.NONE test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_KeyboardType_NONE_test", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info('InputDevice_KeyboardType_NONE_test = ' + inputDevice.KeyboardType.NONE);
      expect(inputDevice.KeyboardType.NONE == 0).assertTrue();
    })

    /**
     * @tc.name   InputDevice_KeyboardType_UNKNOWN_test
     * @tc.number MultimodalInputDevice_js_0020
     * @tc.desc   inputDevice.KeyboardType.UNKNOWN test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_KeyboardType_UNKNOWN_test", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info('InputDevice_KeyboardType_UNKNOWN_test = ' + inputDevice.KeyboardType.UNKNOWN);
      expect(inputDevice.KeyboardType.UNKNOWN == 1).assertTrue();
    })

    /**
     * @tc.name   InputDevice_KeyboardType_ALPHABETIC_KEYBOARD_test
     * @tc.number MultimodalInputDevice_js_0030
     * @tc.desc   inputDevice.KeyboardType.ALPHABETIC_KEYBOARD test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_KeyboardType_ALPHABETIC_KEYBOARD_test", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info('InputDevice_KeyboardType_ALPHABETIC_KEYBOARD_test = '
        + inputDevice.KeyboardType.ALPHABETIC_KEYBOARD);
      expect(inputDevice.KeyboardType.ALPHABETIC_KEYBOARD == 2).assertTrue();
    })

    /**
     * @tc.name   InputDevice_KeyboardType_ALPHABETIC_DIGITAL_KEYBOARD_test
     * @tc.number MultimodalInputDevice_js_0040
     * @tc.desc   inputDevice.KeyboardType.DIGITAL_KEYBOARD test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_KeyboardType_ALPHABETIC_DIGITAL_KEYBOARD_test", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info('InputDevice_KeyboardType_ALPHABETIC_DIGITAL_KEYBOARD_test = '
        + inputDevice.KeyboardType.DIGITAL_KEYBOARD);
      expect(inputDevice.KeyboardType.DIGITAL_KEYBOARD == 3).assertTrue();
    })

    /**
     * @tc.name   InputDevice_KeyboardType_ALPHABETIC_HANDWRITING_PEN_test
     * @tc.number MultimodalInputDevice_js_0050
     * @tc.desc   inputDevice.KeyboardType.HANDWRITING_PEN test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_KeyboardType_ALPHABETIC_HANDWRITING_PEN_test", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info('InputDevice_KeyboardType_ALPHABETIC_HANDWRITING_PEN_test = '
        + inputDevice.KeyboardType.HANDWRITING_PEN);
      expect(inputDevice.KeyboardType.HANDWRITING_PEN == 4).assertTrue();
    })

    /**
     * @tc.name   InputDevice_KeyboardType_ALPHABETIC_REMOTE_CONTROL_test
     * @tc.number MultimodalInputDevice_js_0060
     * @tc.desc   inputDevice.KeyboardType.REMOTE_CONTROL test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_KeyboardType_ALPHABETIC_REMOTE_CONTROL_test", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      console.info('InputDevice_KeyboardType_ALPHABETIC_REMOTE_CONTROL_test = '
        + inputDevice.KeyboardType.REMOTE_CONTROL);
      expect(inputDevice.KeyboardType.REMOTE_CONTROL == 5).assertTrue();
    })

    /**
     * @tc.name   InputDevice_getDeviceIds_Promise_test
     * @tc.number MultimodalInputDevice_js_0070
     * @tc.desc   inputdevice interface getDeviceIds & supportKeys test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_getDeviceIds_Promise_test", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
     * @tc.name   InputDevice_getDevice_Promise_test
     * @tc.number MultimodalInputDevice_js_0080
     * @tc.desc   inputdevice interface getDevice test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_getDevice_Promise_test", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
     * @tc.name   InputDevice_on_test
     * @tc.number MultimodalInputDevice_js_0090
     * @tc.desc   inputdevice interface getDevice test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_on_test", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
     * @tc.name   InputDevice_off_test
     * @tc.number MultimodalInputDevice_js_0100
     * @tc.desc   inputdevice interface getDevice test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_off_test", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
     * @tc.name   InputDevice_getDeviceList_test_01
     * @tc.number MultimodalInputDevice_js_0110
     * @tc.desc   inputdevice interface getDeviceList test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_getDeviceList_test_01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
     * @tc.name   InputDevice_getDeviceList_test_02
     * @tc.number MultimodalInputDevice_js_0120
     * @tc.desc   inputdevice interface getDeviceList test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_getDeviceList_test_02", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
     * @tc.name   InputDevice_getDeviceInfo_test_01
     * @tc.number MultimodalInputDevice_js_0130
     * @tc.desc   inputdevice interface getDeviceInfo test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_getDeviceInfo_test_01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info(`InputDevice_getDeviceInfo_async_test enter`);
      try {
        await inputDevice.getDeviceList().then((data) => {
          console.info(`getDeviceInfo:data assertInstanceOf Array` + typeof (data));
          expect(data).assertInstanceOf('Array');
          console.info(`getDeviceInfo:data assertInstanceOf Array end ${data.length}`);
          if (data.length <= 0) {
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
                expect(res.axisRanges[j].axis == 'touchmajor' || res.axisRanges[j].axis == 'touchminor'
                  || res.axisRanges[j].axis == 'orientation' || res.axisRanges[j].axis == 'x'
                  || res.axisRanges[j].axis == 'y' || res.axisRanges[j].axis == 'pressure'
                  || res.axisRanges[j].axis == 'toolminor' || res.axisRanges[j].axis == 'toolmajor'
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
            }
            done()
          })
        })
      } catch (err) {
        console.info(`InputDevice_getDeviceInfo_test_01 inputDevice.getDeviceList ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done()
      console.info(`InputDevice_getDeviceInfo_async_test exit`);
    })

    /**
     * @tc.name   InputDevice_getDeviceInfoSync_test_01
     * @tc.number MultimodalInputDevice_js
     * @tc.desc   inputdevice interface getDeviceInfoSync test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_getDeviceInfoSync_test_01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info(`InputDevice_getDeviceInfoSync_test enter`);
      try {
        await inputDevice.getDeviceList().then((data) => {
          console.info(`getDeviceInfo:data assertInstanceOf Array` + typeof (data));
          expect(data).assertInstanceOf('Array');
          console.info(`getDeviceInfo:data assertInstanceOf Array end ${data.length}`);
          if (data.length <= 0) {
            return;
          }
          let InputDeviceData = inputDevice.getDeviceInfoSync(data[0]);
          expect(InputDeviceData.id).assertInstanceOf('Number');
          expect(InputDeviceData.name).assertInstanceOf('String');
          expect(InputDeviceData.sources).assertInstanceOf('Array');
          expect(InputDeviceData.axisRanges).assertInstanceOf('Array');
          expect(InputDeviceData.bus).assertInstanceOf('Number');
          expect(InputDeviceData.product).assertInstanceOf('Number');
          expect(InputDeviceData.vendor).assertInstanceOf('Number');
          expect(InputDeviceData.version).assertInstanceOf('Number');
          expect(InputDeviceData.phys).assertInstanceOf('String');
          expect(InputDeviceData.uniq).assertInstanceOf('String');
          expect(InputDeviceData).assertInstanceOf('Object');
          for (let j = 0; j < InputDeviceData.axisRanges.length; j++) {
            expect(InputDeviceData.axisRanges[j].source == 'keyboard'
              || InputDeviceData.axisRanges[j].source == 'mouse'
              || InputDeviceData.axisRanges[j].source == 'touchpad'
              || InputDeviceData.axisRanges[j].source == 'touchscreen'
              || InputDeviceData.axisRanges[j].source == 'joystick'
              || InputDeviceData.axisRanges[j].source == 'trackball').assertTrue();
            expect(InputDeviceData.axisRanges[j].axis == 'touchmajor'
              || InputDeviceData.axisRanges[j].axis == 'touchminor'
              || InputDeviceData.axisRanges[j].axis == 'orientation'
              || InputDeviceData.axisRanges[j].axis == 'x'
              || InputDeviceData.axisRanges[j].axis == 'y'
              || InputDeviceData.axisRanges[j].axis == 'pInputDeviceDatasure'
              || InputDeviceData.axisRanges[j].axis == 'toolminor'
              || InputDeviceData.axisRanges[j].axis == 'toolmajor'
              || InputDeviceData.axisRanges[j].axis == 'NULL').assertTrue();
            expect(InputDeviceData.axisRanges[j].max).assertInstanceOf('Number');
            expect(InputDeviceData.axisRanges[j]).assertInstanceOf('Object');
            expect(InputDeviceData.axisRanges[j].min).assertInstanceOf('Number');
            expect(InputDeviceData.axisRanges[j].fuzz).assertInstanceOf('Number');
            expect(InputDeviceData.axisRanges[j].flat).assertInstanceOf('Number');
            expect(InputDeviceData.axisRanges[j].resolution).assertInstanceOf('Number');
          }
        })
      } catch (err) {
        console.info(`InputDevice_getDeviceInfoSync_test_01 inputDevice.getDeviceList ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done()
      console.info(`InputDevice_getDeviceInfoSync_test exit`);
    })

    /**
     * @tc.name   InputDevice_getDeviceInfo_test_02
     * @tc.number MultimodalInputDevice_js_0140
     * @tc.desc   inputdevice interface getDeviceInfo test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_getDeviceInfo_test_02", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info(`InputDevice_getDeviceInfo_promise_test enter`);
      try {
        await inputDevice.getDeviceList().then((data) => {
          expect(data).assertInstanceOf('Array');
          if (data.length <= 0) {
            return;
          }
              inputDevice.getDeviceInfo(data[0]).then((res) => {
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
                expect(res.axisRanges[j].axis == 'touchmajor' || res.axisRanges[j].axis == 'touchminor'
                  || res.axisRanges[j].axis == 'orientation' || res.axisRanges[j].axis == 'x'
                  || res.axisRanges[j].axis == 'y' || res.axisRanges[j].axis == 'pressure'
                  || res.axisRanges[j].axis == 'toolminor' || res.axisRanges[j].axis == 'toolmajor'
                  || res.axisRanges[j].axis == 'NULL').assertTrue();
                expect(res.axisRanges[j].max).assertInstanceOf('Number');
                expect(res.axisRanges[j]).assertInstanceOf('Object');
                expect(res.axisRanges[j].min).assertInstanceOf('Number');
                expect(res.axisRanges[j].fuzz).assertInstanceOf('Number');
                expect(res.axisRanges[j].flat).assertInstanceOf('Number');
                expect(res.axisRanges[j].resolution).assertInstanceOf('Number');
              }
          }).catch(err => {
            expect(false).assertTrue();
            done();
      });
      })
      } catch (err) {
        expect(false).assertTrue();
      }
      console.info(`InputDevice_getDeviceInfo_promise_test exit`);
      done();
    })

    /**
     * @tc.name   InputDevice_GetkeyboardType_Exception_test_01
     * @tc.number MultimodalInputDevice_js_0150
     * @tc.desc   inputdevice interface getKeyboardType exception test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_GetkeyboardType_Exception_test_01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
     * @tc.name   InputDevice_GetkeyboardType_Exception_test_02
     * @tc.number MultimodalInputDevice_js_0160
     * @tc.desc   inputdevice interface getKeyboardType exception test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_GetkeyboardType_Exception_test_02", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
     * @tc.name   InputDevice_SupportKeys_Exception_test_01
     * @tc.number MultimodalInputDevice_js_0170
     * @tc.desc   inputdevice interface supportKeys exception test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_SupportKeys_Exception_test_01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
     * @tc.name   InputDevice_SupportKeys_Exception_test_02
     * @tc.number MultimodalInputDevice_js_0180
     * @tc.desc   inputdevice interface supportKeys exception test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_SupportKeys_Exception_test_02", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
     * @tc.name   InputDevice_SupportKeysSync_Exception_test
     * @tc.number MultimodalInputDevice_js
     * @tc.desc   inputdevice interface supportKeysSync exception test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_SupportKeysSync_Exception_test", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info("InputDevice_SupportKeysSync_Exception_test enter");
      try {
        let result = inputDevice.supportKeysSync(`id`, [17, 22, 2055]);
      } catch (result) {
        console.info(`SupportKeys_Exception_test: ${JSON.stringify(result, [`code`, `message`])}`);
        expect(result.code).assertEqual(errCode.COMMON_PARAMETER_CODE);
        expect(result.message).assertEqual(errMsg.PARAMETER_DEVICEID_TYPE_MSG);
      }
      console.info("InputDevice_SupportKeysSync_Exception_test exit");
      done();
    })

    /**
     * @tc.name   InputDevice_GetDeviceInfo_Exception_test_01
     * @tc.number MultimodalInputDevice_js_0190
     * @tc.desc   inputdevice interface getDeviceInfo exception test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_GetDeviceInfo_Exception_test_01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
     * @tc.name   InputDevice_GetDeviceInfo_Exception_test_02
     * @tc.number MultimodalInputDevice_js_0200
     * @tc.desc   inputdevice interface getDeviceInfo exception test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_GetDeviceInfo_Exception_test_02", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
     * @tc.name   InputDevice_GetDeviceList_Exception_test
     * @tc.number MultimodalInputDevice_js_0210
     * @tc.desc   inputdevice interface getDeviceList exception test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_GetDeviceList_Exception_test", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
     * @tc.name   InputDevice_On_Exception_test
     * @tc.number MultimodalInputDevice_js_0220
     * @tc.desc   inputdevice interface on test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_On_Exception_test", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
     * @tc.name   InputDevice_Off_Exception_test
     * @tc.number MultimodalInputDevice_js_0230
     * @tc.desc   inputdevice interface off test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("InputDevice_Off_Exception_test", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   InputDevice_SetKeyboardRepeatDelay_Exception_test_01
     * @tc.number MultimodalInputDevice_js_0240
     * @tc.desc   inputdevice interface setKeyboardRepeatDelay exception test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InputDevice_SetKeyboardRepeatDelay_Exception_test_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info(`InputDevice_SetKeyboardRepeatDelay_Exception_test_01 enter`);
      try {
        inputDevice.setKeyboardRepeatDelay();
      } catch (error) {
        console.info(`SetKeyboardRepeatDelay_Exception_Test_001: ${JSON.stringify(error, [`code`, `message`])}`);
        expect(error.code).assertEqual(errCode.COMMON_PARAMETER_CODE);
        expect(error.message).assertEqual(errMsg.PARAMETER_COUNT_MSG);
      }
      console.info(`InputDevice_SetKeyboardRepeatDelay_Exception_test_01 exit`);
      done();
    })

    /**
     * @tc.name   InputDevice_SetKeyboardRepeatDelay_Exception_test_02
     * @tc.number MultimodalInputDevice_js_0250
     * @tc.desc   inputdevice interface setKeyboardRepeatDelay exception test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InputDevice_SetKeyboardRepeatDelay_Exception_test_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info(`InputDevice_SetKeyboardRepeatDelay_Exception_test_02 enter`);
      try {
        inputDevice.setKeyboardRepeatDelay(`delay`, (error) => {
          if (error) {
            console.info(`SetKeyboardRepeatDelay_Exception_Test_002 failed, err=${JSON.stringify(error)}`);
            expect(false).assertTrue();
          } else {
            console.info(`SetKeyboardRepeatDelay_Exception_Test_002 success`);
            expect(true).assertTrue();
          }
        });
      } catch (error) {
        console.info(`SetKeyboardRepeatDelay_Exception_Test_002: ${JSON.stringify(error, [`code`, `message`])}`);
        expect(error.code).assertEqual(errCode.COMMON_PARAMETER_CODE);
        expect(error.message).assertEqual(errMsg.PARAMETER_DELAY_TYPE_MSG);
      }
      console.info(`InputDevice_SetKeyboardRepeatDelay_Exception_test_02 exit`);
      done();
    })

    /**
     * @tc.name   InputDevice_SetKeyboardRepeatRate_Exception_test_01
     * @tc.number MultimodalInputDevice_js_0260
     * @tc.desc   inputdevice interface setKeyboardRepeatRate exception test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InputDevice_SetKeyboardRepeatRate_Exception_test_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info(`InputDevice_SetKeyboardRepeatRate_Exception_test_01 enter`);
      try {
        inputDevice.setKeyboardRepeatRate();
      } catch (error) {
        console.info(`SetKeyboardRepeatRate_Exception_Test_001: ${JSON.stringify(error, [`code`, `message`])}`);
        expect(error.code).assertEqual(errCode.COMMON_PARAMETER_CODE);
        expect(error.message).assertEqual(errMsg.PARAMETER_COUNT_MSG);
      }
      console.info(`InputDevice_SetKeyboardRepeatRate_Exception_test_01 exit`);
      done();
    })

    /**
     * @tc.name   InputDevice_SetKeyboardRepeatRate_Exception_test_02
     * @tc.number MultimodalInputDevice_js_0270
     * @tc.desc   inputdevice interface setKeyboardRepeatRate exception test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InputDevice_SetKeyboardRepeatRate_Exception_test_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info(`InputDevice_SetKeyboardRepeatRate_Exception_test_02 enter`);
      try {
        inputDevice.setKeyboardRepeatRate(`rate`, (error) => {
          if (error) {
            console.info(`SetKeyboardRepeatRate_Exception_Test_002 failed, err=${JSON.stringify(error)}`);
            expect(false).assertTrue();
          } else {
            console.info(`SetKeyboardRepeatRate_Exception_Test_002 success`);
            expect(true).assertTrue();
          }
        });
      } catch (error) {
        console.info(`SetKeyboardRepeatRate_Exception_Test_002: ${JSON.stringify(error, [`code`, `message`])}`);
        expect(error.code).assertEqual(errCode.COMMON_PARAMETER_CODE);
        expect(error.message).assertEqual(errMsg.PARAMETER_RATE_TYPE_MSG);
      }
      console.info(`InputDevice_SetKeyboardRepeatRate_Exception_test_02 exit`);
      done();
    })
  })
}
