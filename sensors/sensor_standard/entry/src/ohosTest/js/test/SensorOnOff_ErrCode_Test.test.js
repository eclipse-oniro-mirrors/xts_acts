/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import sensor from '@ohos.sensor'
import { UiDriver, BY } from '@ohos.UiTest'
import featureAbility from '@ohos.ability.featureAbility';
export default function SensorOnOff_ErrCode_Test() {
  function callback(data) {
    console.info("callback" + JSON.stringify(data));
    expect(typeof (data.timestamp)).assertEqual("number");
  }

  async function requestPermission() {
    try {
        console.info(`====>sensors getPermission is start`);
        let context = featureAbility.getContext();
        await context.requestPermissionsFromUser(['ohos.permission.ACTIVITY_MOTION'], 0, (data) => {
          console.info("====>sensors requestPermission success data: " + JSON.stringify(data));
        });
    } catch (err) {
        console.error('====>sensors requestPermissionsFromUser fail:' + JSON.stringify(err));
    }
  }

  async function driveFn() {
    try {
        let driver = await UiDriver.create();
        console.info(`====>sensors motion test come in driveFn`);
        console.info(`====>sensors motion test driver is ${JSON.stringify(driver)}`);
        let button = await driver.findComponent(BY.text('允许'));
        console.info(`====>button is ${JSON.stringify(button)}`);
        await button.click();
        await driver.delayMs(1000);
    } catch (err) {
        console.info('====>sensors motion test err code is ' + err);
        return;
    }
  }
  describe('SensorOnOff_ErrCode_Test', function () {

    beforeAll(async function (done) {
      console.info('beforeAll called')
      await requestPermission();
      console.info('====>sensors requestPermission success');
      await driveFn();
      console.info('====>sensors test beforeAll end');
      done();
    })

    afterAll(function () {
      console.info('afterAll called')
    })

    beforeEach(function () {
      console.info('beforeEach called')
    })

    afterEach(function () {
      console.info('afterEach called')
    })

    const SERVICE_EXCEPTION_CODE = 14500101
    const SENSOR_NO_SUPPORT_CODE = 14500102
    let TAG  = '';

    /**
     * @tc.number:SensorOnOff_ErrCode_Test_0001
     * @tc.name:SensorOnOff_ErrCode_Test_0001
     * @tc.desc:test get sensor data by wrong sensor id.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_ErrCode_Test_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0001';
      try{
        sensor.getSingleSensor(sensor.SensorId.WEAR_DETECTION,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.once(sensor.SensorId.WEAR_DETECTION, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /**
     * @tc.number:SensorOnOff_ErrCode_Test_0002
     * @tc.name: SensorOnOff_ErrCode_Test_0002
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_ErrCode_Test_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0002';
      try{
        sensor.getSingleSensor(sensor.SensorId.SIGNIFICANT_MOTION,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.once(sensor.SensorId.SIGNIFICANT_MOTION, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0003
    * @tc.name: SensorOnOff_ErrCode_Test_0003
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0003';
      try{
        sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.on(sensor.SensorId.ACCELEROMETER, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0004
    * @tc.name: SensorOnOff_ErrCode_Test_0004
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0004';
      try{
        sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER_UNCALIBRATED,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.on(sensor.SensorId.ACCELEROMETER_UNCALIBRATED, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0005
    * @tc.name: SensorOnOff_ErrCode_Test_0005
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0005';
      try{
        sensor.getSingleSensor(sensor.SensorId.AMBIENT_TEMPERATURE,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.on(sensor.SensorId.AMBIENT_TEMPERATURE, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0006
    * @tc.name: SensorOnOff_ErrCode_Test_0006
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0006';
      try{
        sensor.getSingleSensor(sensor.SensorId.GYROSCOPE_UNCALIBRATED,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.on(sensor.SensorId.GYROSCOPE_UNCALIBRATED, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0007
    * @tc.name: SensorOnOff_ErrCode_Test_0007
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0007';
      try{
        sensor.getSingleSensor(sensor.SensorId.HEART_RATE,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.on(sensor.SensorId.HEART_RATE, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0008
    * @tc.name: SensorOnOff_ErrCode_Test_0008
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0008';
      try{
        sensor.getSingleSensor(sensor.SensorId.HUMIDITY,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.on(sensor.SensorId.HUMIDITY, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0009
    * @tc.name: SensorOnOff_ErrCode_Test_0009
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0009';
      try{
        sensor.getSingleSensor(sensor.SensorId.LINEAR_ACCELEROMETER,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.on(sensor.SensorId.LINEAR_ACCELEROMETER, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0010
    * @tc.name: SensorOnOff_ErrCode_Test_0010
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0010';
      try{
        sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD_UNCALIBRATED,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.on(sensor.SensorId.MAGNETIC_FIELD_UNCALIBRATED, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0011
    * @tc.name: SensorOnOff_ErrCode_Test_0011
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0011';
      try{
        sensor.getSingleSensor(sensor.SensorId.PROXIMITY,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.on(sensor.SensorId.PROXIMITY, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0012
    * @tc.name: SensorOnOff_ErrCode_Test_0012
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0012';
      try{
        sensor.getSingleSensor(sensor.SensorId.SIGNIFICANT_MOTION,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.on(sensor.SensorId.SIGNIFICANT_MOTION, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0013
    * @tc.name: SensorOnOff_ErrCode_Test_0013
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0013';
      try{
        sensor.getSingleSensor(sensor.SensorId.WEAR_DETECTION,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.on(sensor.SensorId.WEAR_DETECTION, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0014
    * @tc.name: SensorOnOff_ErrCode_Test_0014
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0014';
      try{
        sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER_UNCALIBRATED,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.once(sensor.SensorId.ACCELEROMETER_UNCALIBRATED, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0015
    * @tc.name: SensorOnOff_ErrCode_Test_0015
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0015';
      try{
        sensor.getSingleSensor(sensor.SensorId.AMBIENT_LIGHT,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.once(sensor.SensorId.AMBIENT_LIGHT, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0016
    * @tc.name: SensorOnOff_ErrCode_Test_0016
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0016';
      try{
        sensor.getSingleSensor(sensor.SensorId.AMBIENT_TEMPERATURE,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.once(sensor.SensorId.AMBIENT_TEMPERATURE, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0017
    * @tc.name: SensorOnOff_ErrCode_Test_0017
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0017';
      try{
        sensor.getSingleSensor(sensor.SensorId.BAROMETER,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.once(sensor.SensorId.BAROMETER, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0018
    * @tc.name: SensorOnOff_ErrCode_Test_0018
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0018';
      try{
        sensor.getSingleSensor(sensor.SensorId.GRAVITY,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.once(sensor.SensorId.GRAVITY, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0019
    * @tc.name: SensorOnOff_ErrCode_Test_0019
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0019';
      try{
        sensor.getSingleSensor(sensor.SensorId.GYROSCOPE,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.once(sensor.SensorId.GYROSCOPE, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0020
    * @tc.name: SensorOnOff_ErrCode_Test_0020
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0020';
      try{
        sensor.getSingleSensor(sensor.SensorId.GYROSCOPE_UNCALIBRATED,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.once(sensor.SensorId.GYROSCOPE_UNCALIBRATED, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0021
    * @tc.name: SensorOnOff_ErrCode_Test_0021
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0021';
      try{
        sensor.getSingleSensor(sensor.SensorId.GYROSCOPE_UNCALIBRATED,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.once(sensor.SensorId.GYROSCOPE_UNCALIBRATED, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0022
    * @tc.name: SensorOnOff_ErrCode_Test_0022
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0022';
      try{
        sensor.getSingleSensor(sensor.SensorId.HALL,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.once(sensor.SensorId.HALL, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0024
    * @tc.name: SensorOnOff_ErrCode_Test_0024
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0024';
      try{
        sensor.getSingleSensor(sensor.SensorId.HUMIDITY,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.once(sensor.SensorId.HUMIDITY, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0025
    * @tc.name: SensorOnOff_ErrCode_Test_0025
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0025';
      try{
        sensor.getSingleSensor(sensor.SensorId.LINEAR_ACCELEROMETER,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.once(sensor.SensorId.LINEAR_ACCELEROMETER, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0026
    * @tc.name: SensorOnOff_ErrCode_Test_0026
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0026';
      try{
        sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.once(sensor.SensorId.MAGNETIC_FIELD, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0027
    * @tc.name: SensorOnOff_ErrCode_Test_0027
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0027';
      try{
        sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD_UNCALIBRATED,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.once(sensor.SensorId.MAGNETIC_FIELD_UNCALIBRATED, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0028
    * @tc.name: SensorOnOff_ErrCode_Test_0028
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0028';
      try{
        sensor.getSingleSensor(sensor.SensorId.ORIENTATION,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.once(sensor.SensorId.ORIENTATION, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0030
    * @tc.name: SensorOnOff_ErrCode_Test_0030
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0030';
      try{
        sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.once(sensor.SensorId.PEDOMETER_DETECTION, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0031
    * @tc.name: SensorOnOff_ErrCode_Test_0031
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0031';
      try{
        sensor.getSingleSensor(sensor.SensorId.PROXIMITY,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.once(sensor.SensorId.PROXIMITY, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0032
    * @tc.name: SensorOnOff_ErrCode_Test_0032
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0032';
      try{
        sensor.getSingleSensor(sensor.SensorId.ROTATION_VECTOR,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.once(sensor.SensorId.ROTATION_VECTOR, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })

    /*
    * @tc.number: SensorOnOff_ErrCode_Test_0033
    * @tc.name: SensorOnOff_ErrCode_Test_0033
    * @tc.desc:Verification results of the incorrect parameters of the test interface
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SensorOnOff_ErrCode_Test_0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      TAG = 'SensorOnOff_ErrCode_Test_0033';
      try{
        sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
          if (error) {
            console.info(TAG + ' error:' + error);
            done();
          } else {
            try {
              expect(typeof(data)).assertEqual("object");
              sensor.once(sensor.SensorId.ACCELEROMETER, callback, {'interval': -100000000});
              done();
            } catch (error) {
              console.info(TAG + ' catch error:' + error);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        })
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
    })
  })}