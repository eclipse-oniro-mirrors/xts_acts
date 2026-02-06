import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import sensor from '@ohos.sensor'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;

function callback(data: sensor.OrientationResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'callback accuracy verified' + JSON.stringify(data));
    expect(true).assertTrue();
  } else {
    hilog.info(0x0000, 'testTag', 'callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.beta)).assertEqual("number");
  expect(typeof(data.gamma)).assertEqual("number");
  expect(typeof(data.alpha)).assertEqual("number");
  expect(typeof (data.timestamp)).assertEqual("number");
}

function onSensorCallback(data: sensor.OrientationResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'callback accuracy verified' + JSON.stringify(data));
    expect(true).assertTrue();
  } else {
    hilog.info(0x0000, 'testTag', 'callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.beta)).assertEqual("number");
  expect(typeof(data.gamma)).assertEqual("number");
  expect(typeof(data.alpha)).assertEqual("number");
  expect(typeof (data.timestamp)).assertEqual("number");
}

export default function SensorJsStaticTest() {
  describe("SensorJsStaticTest", ():void => {
    const PERMISSION_DENIED_CODE = 201;
    const NON_SYSTEM_API_CODE = 202;
    const PARAMETER_ERROR_CODE = 401
    const SERVICE_EXCEPTION_CODE = 14500101
    const SENSOR_NO_SUPPORT_CODE = 14500102
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_MSG = 'Service exception.'
    let invalid = -1;
    let TAG = '';

    /*
     * @tc.name:orientating_SensorJsTest_static_005
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0050
     */
    it("orientating_SensorJsTest_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------orientating_SensorJsTest_static_005--------------');
        try {
          sensor.on('orientationChange', callback, {'interval': 100000000});
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------orientating_SensorJsTest_static_005 off in--------------');
            sensor.off('orientationChange');
            hilog.info(0x0000, 'testTag', '---------orientating_SensorJsTest_static_005 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', ' orientating_SensorJsTest_static_005 fail, errCode:' + e.code);
          expect(PARAMETER_ERROR_CODE == e.code || PERMISSION_DENIED_CODE == e.code).assertTrue();
          done();
        }
      })

    /*
     * @tc.name:orientating_SensorJsTest_static_006
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0060
     */
    it("orientating_SensorJsTest_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------orientating_SensorJsTest_static_006--------------');
        try {
          sensor.on('orientationChange', onSensorCallback, {'interval': 100000000});
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------orientating_SensorJsTest_static_006 off in--------------');
            sensor.off('orientationChange');
            hilog.info(0x0000, 'testTag', '---------orientating_SensorJsTest_static_006 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;  
          hilog.info(0x0000, 'testTag', ' orientating_SensorJsTest_static_006 fail, errCode:' + e.code);
          expect(PARAMETER_ERROR_CODE == e.code || PERMISSION_DENIED_CODE == e.code).assertTrue();
          done();
        }
      })

    /*
     * @tc.name:orientatingParamError_SensorJsTest_static_050
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorsSystem_static_JsTest_0500
     */
    it("orientatingParamError_SensorJsTest_static_050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------orientatingParamError_SensorJsTest_static_050--------------');
        try {
          sensor.on('orientationChange', onSensorCallback, {'interval': -100000000});
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', ' orientatingParamError_SensorJsTest_static_050 fail, errCode:' + e.code);
          expect(SERVICE_EXCEPTION_CODE == e.code || PARAMETER_ERROR_CODE == e.code).assertTrue();
          done();
        }
      })

     /*
      * @tc.name:paramTest_SensorJsTest_static_073
      * @tc.desc:Verification results of the incorrect parameters of the test interface.
      * @tc.number:SUB_SensorsSystem_static_JsTest_0730
      */
    it("paramTest_SensorJsTest_static_073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------paramTest_SensorJsTest_static_073--------------');
        let accUnreliable: sensor.SensorAccuracy = sensor.SensorAccuracy.ACCURACY_UNRELIABLE;
        let accLow: sensor.SensorAccuracy = sensor.SensorAccuracy.ACCURACY_LOW;
        let accMedium: sensor.SensorAccuracy = sensor.SensorAccuracy.ACCURACY_MEDIUM;
        let accHigh: sensor.SensorAccuracy = sensor.SensorAccuracy.ACCURACY_HIGH;
        let orientationResponseParam: sensor.OrientationResponse = {
          accuracy: accUnreliable,
          timestamp: 100000000,
          beta: 1.0,
          gamma: 2.0,
          alpha: 3.0,
        };
        expect(true).assertTrue();
        done();
      })
  })
}