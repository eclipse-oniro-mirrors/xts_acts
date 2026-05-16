/*
 * Copyright (C) 2024 HiHope Open Source Organization
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, it, expect, Level } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import commonEvent from '@ohos.commonEventManager';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = 'AbilityRuntime';
const TEST_SUITE_NAME: string = 'StartAbility';
let testAbilityContext: common.UIAbilityContext;
let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time))
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    let ON_CREATE = 'on_Create';
    let ON_BACKGROUND = 'on_Background';
    let CREATE_EVENT = 'create_event';
    let ON_ERROR_BACK = 'on_Error_Back';
    let CALL_BACK = 'call_back';
    let ON_RELEASE_BACK = 'on_Release_Back';
    let ON_SECOND_RELEASE_BACK = 'ON_Second_Release_BacK';
    let ON_SECOND_ACCEPT_VALUE = 'on_second_accept_value';
    let FIRST_RELEASE_BACK = 'first_release_back';
    let SECOND_RELEASE_BACK = 'second_release_back';
    let CALL_BACK_MAIN = 'call_back_main';
    let CALL_BACK_MAINB = 'call_back_mainB';
    let CALL_BACK_SECOND = 'call_back_second';
    let CALL_BACK_SECONDB = 'call_back_secondB';
    let onCreateFlag = false;
    let onBackgroundFlag = false;
    let onReleaseBackFlag = false;
    let errCode = 0;
    let callBackValue = '';
    let onSecondReleaseBackFlag = false
    let secondCallBackValue = '';
    let secondAcceptValue = '';
    let enterIndex = 0;
    let returnBackValue = '';
    let enterCreateIndex = 0;
    let enterBackGroundIndex = 0;
    let firstData = '';
    let firstDataB = '';
    let secondData = '';
    let secondDataB = '';
    let secondBackValue = '';
    let secondBackBValue = '';
    let mainBackValue = '';
    let mainBackBValue = '';

    let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
      events: [CREATE_EVENT, ON_CREATE, ON_BACKGROUND, ON_ERROR_BACK, CALL_BACK, ON_RELEASE_BACK, ON_SECOND_RELEASE_BACK,
        ON_SECOND_ACCEPT_VALUE, FIRST_RELEASE_BACK, SECOND_RELEASE_BACK, CALL_BACK_MAIN, CALL_BACK_MAINB,
        CALL_BACK_SECOND, CALL_BACK_SECONDB],
    };
    let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
    let subscribeCallBack =
      async (err: BusinessError, data: commonEvent.CommonEventData, done: Function, tag: string): Promise<void> => {
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${tag} subscribeCallBack err: ${JSON.stringify(err)}, data: ${JSON.stringify(data)}`);
        if (err) {
          expect().assertFail();
          done();
        }
        switch (data.event) {
          case ON_CREATE: {
            onCreateFlag = true;
            enterCreateIndex++;
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${tag} subscribeCallBack onCreateFlag: ${onCreateFlag}`);
            break;
          }
          case ON_BACKGROUND: {
            onBackgroundFlag = true;
            enterBackGroundIndex++;
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${tag} subscribeCallBack onBackgroundFlag: ${onBackgroundFlag}`);
            break;
          }
          case ON_ERROR_BACK: {
            if (data.parameters) {
              let dataObj = data.parameters as Map<string, string>;
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${TAG} subscribeCallBack  data =${JSON.stringify(dataObj)}`);
              if (dataObj['num']) {
                errCode = dataObj['num'] as number;
                hilog.info(0x0000, TAG, '%{public}s',
                  `${TEST_SUITE_NAME}#${TAG} subscribeCallBack  data =${JSON.stringify(errCode)}`);
              }
            }
            break;
          }
          case CALL_BACK: {
            if (data.parameters) {
              let dataObj = data.parameters as Map<string, string>;
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${TAG} subscribeCallBack  data =${JSON.stringify(dataObj)}`);
              if (dataObj['data']) {
                callBackValue = dataObj['data'] as string;
                hilog.info(0x0000, TAG, '%{public}s',
                  `${TEST_SUITE_NAME}#${TAG} subscribeCallBack  data =${JSON.stringify(callBackValue)}`);
              }
            }
            enterIndex++;
            break;
          }
          case ON_RELEASE_BACK: {
            onReleaseBackFlag = true;
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${tag} subscribeCallBack onReleaseBackFlag====: ${onReleaseBackFlag}`);
            if (data.parameters) {
              let dataObj = data.parameters as Map<string, string>;
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${TAG} subscribeCallBack  data =${JSON.stringify(dataObj)}`);
              if (dataObj['data']) {
                returnBackValue = dataObj['data'] as string;
              }
            }
            break;
          }
          case ON_SECOND_RELEASE_BACK: {
            onSecondReleaseBackFlag = true;
            if (data.parameters) {
              let dataObj = data.parameters as Map<string, string>;
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${TAG} subscribeCallBack  data =${JSON.stringify(dataObj)}`);
              if (dataObj['data']) {
                secondCallBackValue = dataObj['data'] as string;
                hilog.info(0x0000, TAG, '%{public}s',
                  `${TEST_SUITE_NAME}#${TAG} subscribeCallBack  data =${JSON.stringify(callBackValue)}`);
              }
            }
            break;
          }
          case ON_SECOND_ACCEPT_VALUE: {
            if (data.parameters) {
              let dataObj = data.parameters as Map<string, string>;
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${TAG} subscribeCallBack  data =${JSON.stringify(dataObj)}`);
              if (dataObj['data']) {
                secondAcceptValue = dataObj['data'] as string;
                hilog.info(0x0000, TAG, '%{public}s',
                  `${TEST_SUITE_NAME}#${TAG} subscribeCallBack  data =${JSON.stringify(secondAcceptValue)}`);
              }
            }
            break;
          }
          case FIRST_RELEASE_BACK: {
            onReleaseBackFlag = true;
            if (data.parameters) {
              let dataObj = data.parameters as Map<string, string>;
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${TAG} subscribeCallBack  data =${JSON.stringify(dataObj)}`);
              if (dataObj['data']) {
                firstData = dataObj['data'] as string;
                hilog.info(0x0000, TAG, '%{public}s',
                  `${TEST_SUITE_NAME}#${TAG} subscribeCallBack  data =${JSON.stringify(firstData)}`);
              }
              if (dataObj['data2']) {
                firstDataB = dataObj['data2'] as string;
                hilog.info(0x0000, TAG, '%{public}s',
                  `${TEST_SUITE_NAME}#${TAG} subscribeCallBack  data =${JSON.stringify(firstDataB)}`);
              }
            }
            break;
          }
          case SECOND_RELEASE_BACK: {
            onSecondReleaseBackFlag = true;
            if (data.parameters) {
              let dataObj = data.parameters as Map<string, string>;
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${TAG} subscribeCallBack  data =${JSON.stringify(dataObj)}`);
              if (dataObj['data']) {
                secondData = dataObj['data'] as string;
                hilog.info(0x0000, TAG, '%{public}s',
                  `${TEST_SUITE_NAME}#${TAG} subscribeCallBack  data =${JSON.stringify(secondData)}`);
              }
              if (dataObj['data2']) {
                secondDataB = dataObj['data2'] as string;
                hilog.info(0x0000, TAG, '%{public}s',
                  `${TEST_SUITE_NAME}#${TAG} subscribeCallBack  data =${JSON.stringify(secondDataB)}`);
              }
            }
            break;
          }
          case CALL_BACK_MAIN: {
            if (data.parameters) {
              let dataObj = data.parameters as Map<string, string>;
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${TAG} subscribeCallBack  data =${JSON.stringify(dataObj)}`);
              if (dataObj['data']) {
                mainBackValue = dataObj['data'] as string;
                hilog.info(0x0000, TAG, '%{public}s',
                  `${TEST_SUITE_NAME}#${TAG} subscribeCallBack  data =${JSON.stringify(mainBackValue)}`);
              }
            }
            break;
          }
          case CALL_BACK_MAINB: {
            if (data.parameters) {
              let dataObj = data.parameters as Map<string, string>;
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${TAG} subscribeCallBack  data =${JSON.stringify(dataObj)}`);
              if (dataObj['data']) {
                mainBackBValue = dataObj['data'] as string;
                hilog.info(0x0000, TAG, '%{public}s',
                  `${TEST_SUITE_NAME}#${TAG} subscribeCallBack  data =${JSON.stringify(mainBackBValue)}`);
              }
            }
            break;
          }
          case CALL_BACK_SECOND: {
            if (data.parameters) {
              let dataObj = data.parameters as Map<string, string>;
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${TAG} subscribeCallBack  data =${JSON.stringify(dataObj)}`);
              if (dataObj['data']) {
                secondBackValue = dataObj['data'] as string;
                hilog.info(0x0000, TAG, '%{public}s',
                  `${TEST_SUITE_NAME}#${TAG} subscribeCallBack  data =${JSON.stringify(secondBackValue)}`);
              }
            }
            break;
          }
          case CALL_BACK_SECONDB: {
            if (data.parameters) {
              let dataObj = data.parameters as Map<string, string>;
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${TAG} subscribeCallBack  data =${JSON.stringify(dataObj)}`);
              if (dataObj['data']) {
                secondBackBValue = dataObj['data'] as string;
                hilog.info(0x0000, TAG, '%{public}s',
                  `${TEST_SUITE_NAME}#${TAG} subscribeCallBack  data =${JSON.stringify(secondBackBValue)}`);
              }
            }
            break;
          }
          default:
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${tag} subscribeCallBack event error: ${data.event}`);
            break;
        }
      }

    beforeAll(() => {
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
    })

    beforeEach(async () => {
      let cmda = 'aa force-stop com.acts.systemappa';
      let cmdb = 'aa force-stop com.acts.systemappb';
      await abilityDelegator.executeShellCommand(cmda).catch((error: BusinessError) => {
        console.log("====> executeShellCommand error : " + JSON.stringify(error));
      });
      await abilityDelegator.executeShellCommand(cmdb).catch((error: BusinessError) => {
        console.log("====> executeShellCommand error : " + JSON.stringify(error));
      });
      onCreateFlag = false;
      onBackgroundFlag = false;
      errCode = 0;
      callBackValue = '';
      onReleaseBackFlag = false;
      onSecondReleaseBackFlag = false;
      secondCallBackValue = '';
      secondAcceptValue = '';
      returnBackValue = '';
      enterCreateIndex = 0;
      enterBackGroundIndex = 0;
      firstData = '';
      firstDataB = '';
      secondData = '';
      secondDataB = '';
      secondBackValue = '';
      secondBackBValue = '';
      mainBackValue = '';
      mainBackBValue = '';
      enterIndex = 0;
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_3700
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_3700
     * @tc.desc   test the parameter method of Callee.off function is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_3700', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_3700';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      let errCode = 401;
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TAG} subscribeCallBack  data =${JSON.stringify(data)}`);
        if (err) {
          expect().assertFail();
          done();
        }
        if (data.event == CREATE_EVENT) {
          let dataObj = data.parameters as Map<string, string>;
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TAG} subscribeCallBack  data =${JSON.stringify(dataObj)}`);
          let code = dataObj['num'] as number;
          expect(code).assertEqual(errCode);
          commonEvent.unsubscribe(subscriber);
          done();
        }
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.systemappa',
        abilityName: 'EntryAbility',
      };
      try {
        console.log(`${TAG} startAssistAbility, ${JSON.stringify(want)}`);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility want ${JSON.stringify(want)}`);
        testAbilityContext.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
        });

      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  startAbility failed, code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4600
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4600
     * @tc.desc   test the callback parameter of the Callee.on function is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4600', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4600';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      let errCode = 401;
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TAG} subscribeCallBack  data =${JSON.stringify(data)}`);
        if (err) {
          expect().assertFail();
          done();
        }
        if (data.event == CREATE_EVENT) {
          let dataObj = data.parameters as Map<string, string>;
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TAG} subscribeCallBack  data =${JSON.stringify(dataObj)}`);
          let code = dataObj['num'] as number;
          expect(code).assertEqual(errCode);
          commonEvent.unsubscribe(subscriber);
          done();
        }
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.systemappa',
        abilityName: 'MainAbility',
      };
      try {
        console.log(`${TAG} startAssistAbility, ${JSON.stringify(want)}`);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility want ${JSON.stringify(want)}`);
        testAbilityContext.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
        });

      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  startAbility failed, code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4200
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4200
     * @tc.desc   test the parameter data of Caller.callWithResult function is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4200', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4200';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      let code = 401;
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.systemappa',
        abilityName: 'MainAbility1',
      };
      try {
        console.log(`${TAG} startAssistAbility, ${JSON.stringify(want)}`);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility want ${JSON.stringify(want)}`);
        testAbilityContext.startAbility(want, async (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
;          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
          await sleep(2000);
          expect(onCreateFlag).assertTrue();
          expect(onBackgroundFlag).assertTrue();
          expect(errCode).assertEqual(code)
          commonEvent.unsubscribe(subscriber);
          done();

        });

      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  startAbility failed, code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4100
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4100
     * @tc.desc   test the parameter data of Caller.callWithResult function is an empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4100', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4100';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      let code = 16000050;
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.systemappa',
        abilityName: 'MainAbility2',
      };
      try {
        console.log(`${TAG} startAssistAbility, ${JSON.stringify(want)}`);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility want ${JSON.stringify(want)}`);
        testAbilityContext.startAbility(want, async (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
          await sleep(2000);
          expect(onCreateFlag).assertTrue();
          expect(onBackgroundFlag).assertTrue();
          expect(errCode).assertEqual(code)
          commonEvent.unsubscribe(subscriber);
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  startAbility failed, code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_3000
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_3000
     * @tc.desc   test the parameter method of Caller.callWithResult function is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_3000', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_3000';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      let code = 401;
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.systemappa',
        abilityName: 'MainAbility3',
      };
      try {
        console.log(`${TAG} startAssistAbility, ${JSON.stringify(want)}`);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility want ${JSON.stringify(want)}`);
        testAbilityContext.startAbility(want, async (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
          await sleep(2000);
          expect(onCreateFlag).assertTrue();
          expect(onBackgroundFlag).assertTrue();
          expect(errCode).assertEqual(code);
          commonEvent.unsubscribe(subscriber);
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  startAbility failed, code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2900
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2900
     * @tc.desc   test the parameter method of Caller.callWithResult function is an empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2900', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2900';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      let code = 401;
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.systemappa',
        abilityName: 'MainAbility4',
      };
      try {
        console.log(`${TAG} startAssistAbility, ${JSON.stringify(want)}`);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility want ${JSON.stringify(want)}`);
        testAbilityContext.startAbility(want, async (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
          await sleep(2000);
          expect(onCreateFlag).assertTrue();
          expect(onBackgroundFlag).assertTrue();
          expect(errCode).assertEqual(code);
          commonEvent.unsubscribe(subscriber);
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  startAbility failed, code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_3900
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_3900
     * @tc.desc   test the parameter data of Caller.call function is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_3900', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_3900';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      let code = 401;
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.systemappa',
        abilityName: 'MainAbility5',
      };
      try {
        console.log(`${TAG} startAssistAbility, ${JSON.stringify(want)}`);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility want ${JSON.stringify(want)}`);
        testAbilityContext.startAbility(want, async (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
          await sleep(2000);
          expect(onCreateFlag).assertTrue();
          expect(onBackgroundFlag).assertTrue();
          expect(errCode).assertEqual(code);
          commonEvent.unsubscribe(subscriber);
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  startAbility failed, code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4000
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4000
     * @tc.desc   test the parameter data of Caller.call function is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4000', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4000';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      let code = 401;
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.systemappa',
        abilityName: 'MainAbility6',
      };
      try {
        console.log(`${TAG} startAssistAbility, ${JSON.stringify(want)}`);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility want ${JSON.stringify(want)}`);
        testAbilityContext.startAbility(want, async (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
          await sleep(2000);
          expect(onCreateFlag).assertTrue();
          expect(onBackgroundFlag).assertTrue();
          expect(errCode).assertEqual(code);
          commonEvent.unsubscribe(subscriber);
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  startAbility failed, code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2700
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2700
     * @tc.desc   test the parameter method of Caller.call function is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2700', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2700';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      let code = 401;
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.systemappa',
        abilityName: 'MainAbility7',
      };
      try {
        console.log(`${TAG} startAssistAbility, ${JSON.stringify(want)}`);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility want ${JSON.stringify(want)}`);
        testAbilityContext.startAbility(want, async (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
          await sleep(2000);
          expect(onCreateFlag).assertTrue();
          expect(onBackgroundFlag).assertTrue();
          expect(errCode).assertEqual(code);
          commonEvent.unsubscribe(subscriber);
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  startAbility failed, code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2800
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2800
     * @tc.desc   test the parameter method of Caller.call function is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2800', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2800';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      let code = 401;
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.systemappa',
        abilityName: 'MainAbility8',
      };
      try {
        console.log(`${TAG} startAssistAbility, ${JSON.stringify(want)}`);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility want ${JSON.stringify(want)}`);
        testAbilityContext.startAbility(want, async (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
          await sleep(2000);
          expect(onCreateFlag).assertTrue();
          expect(onBackgroundFlag).assertTrue();
          expect(errCode).assertEqual(code);
          commonEvent.unsubscribe(subscriber);
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  startAbility failed, code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2600
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2600
     * @tc.desc   test the parameter method of Caller.call function is an empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2600', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2600';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      let code = 401;
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.systemappa',
        abilityName: 'MainAbility9',
      };
      try {
        console.log(`${TAG} startAssistAbility, ${JSON.stringify(want)}`);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility want ${JSON.stringify(want)}`);
        testAbilityContext.startAbility(want, async (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
          await sleep(2000);
          expect(onCreateFlag).assertTrue();
          expect(onBackgroundFlag).assertTrue();
          expect(errCode).assertEqual(code);
          commonEvent.unsubscribe(subscriber);
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  startAbility failed, code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_3800
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_3800
     * @tc.desc   test the parameter of the Caller.call function is an empty string of data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_3800', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_3800';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      let code = 16000050;
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.systemappa',
        abilityName: 'MainAbility10',
      };
      try {
        console.log(`${TAG} startAssistAbility, ${JSON.stringify(want)}`);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility want ${JSON.stringify(want)}`);
        testAbilityContext.startAbility(want, async (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
          await sleep(2000);
          expect(onCreateFlag).assertTrue();
          expect(onBackgroundFlag).assertTrue();
          expect(errCode).assertEqual(code);
          commonEvent.unsubscribe(subscriber);
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  startAbility failed, code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4800
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4800
     * @tc.desc   test caller.call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4800', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4800';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.systemappa',
        abilityName: 'MainAbility11',
        parameters: {
          data: TEST_CASE_NAME,
        }
      };
      try {
        console.log(`${TAG} startAssistAbility, ${JSON.stringify(want)}`);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility want ${JSON.stringify(want)}`);
        testAbilityContext.startAbility(want, async (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
          await sleep(2000);
          expect(onCreateFlag).assertTrue();
          expect(onBackgroundFlag).assertTrue();
          expect(callBackValue).assertEqual(TEST_CASE_NAME);
          expect(onReleaseBackFlag).assertTrue();
          commonEvent.unsubscribe(subscriber);
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  startAbility failed, code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2000
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2000
     * @tc.desc   test the caller.call function and checked released function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2000', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2000';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.systemappa',
        abilityName: 'MainAbility12',
        parameters: {
          data: TEST_CASE_NAME,
        }
      };
      try {
        console.log(`${TAG} startAssistAbility, ${JSON.stringify(want)}`);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility want ${JSON.stringify(want)}`);
        testAbilityContext.startAbility(want, async (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility MainAbility12 failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
          await sleep(3000);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==secondBackValue==${secondBackValue}}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==firstData==${firstData}}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==mainBackValue==${mainBackValue}}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==secondData==${secondData}}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==secondBackBValue==${secondBackBValue}}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==firstDataB==${firstDataB}}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==mainBackBValue==${mainBackBValue}}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==secondDataB==${secondDataB}}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==onReleaseBackFlag==${onReleaseBackFlag}}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==onSecondReleaseBackFlag==${onSecondReleaseBackFlag}}`);
          expect(secondBackValue).assertEqual(TEST_CASE_NAME);
          expect(secondBackValue).assertEqual(firstData);
          expect(mainBackValue).assertEqual(TEST_CASE_NAME);
          expect(mainBackValue).assertEqual(secondData);
          expect(secondBackBValue).assertEqual(TEST_CASE_NAME);
          expect(secondBackBValue).assertEqual(firstDataB);
          expect(mainBackBValue).assertEqual(TEST_CASE_NAME);
          expect(mainBackBValue).assertEqual(secondDataB);
          expect(onReleaseBackFlag).assertTrue();
          expect(onSecondReleaseBackFlag).assertTrue();
          commonEvent.unsubscribe(subscriber);
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  startAbility MainAbility12 failed, code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_1300
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_1300
     * @tc.desc   test three party application calls other abilities of this application at once
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_1300', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_1300';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      let num = 1;
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.systemappa',
        abilityName: 'MainAbility21',
        parameters: {
          data: TEST_CASE_NAME,
        }
      };
      try {
        console.log(`${TAG} startAssistAbility, ${JSON.stringify(want)}`);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility want ${JSON.stringify(want)}`);
        testAbilityContext.startAbility(want, async (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
          await sleep(2000);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==onCreateFlag==${onCreateFlag}}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==onBackgroundFlag==${onBackgroundFlag}}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==enterCreateIndex==${enterCreateIndex}}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==enterBackGroundIndex==${enterBackGroundIndex}}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==callBackValue==${callBackValue}}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==onReleaseBackFlag==${onReleaseBackFlag}}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==secondAcceptValue==${secondAcceptValue}}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==onSecondReleaseBackFlag==${onSecondReleaseBackFlag}}`);
          expect(onCreateFlag).assertTrue();
          expect(onBackgroundFlag).assertTrue();
          expect(enterCreateIndex).assertEqual(num);
          expect(enterBackGroundIndex).assertEqual(num)
          expect(callBackValue).assertEqual(TEST_CASE_NAME);
          expect(onReleaseBackFlag).assertTrue();
          expect(secondAcceptValue).assertEqual(TEST_CASE_NAME);
          expect(onSecondReleaseBackFlag).assertTrue();
          commonEvent.unsubscribe(subscriber);
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  startAbility failed, code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2100
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2100
     * @tc.desc   test  service kill and checked caller.released function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2100', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2100';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.systemappa',
        abilityName: 'MainAbility13',
        parameters: {
          data: TEST_CASE_NAME,
        }
      };
      try {
        console.log(`${TAG} startAssistAbility, ${JSON.stringify(want)}`);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility want ${JSON.stringify(want)}`);
        testAbilityContext.startAbility(want, async (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
          await sleep(2000);
          expect(onReleaseBackFlag).assertTrue();
          commonEvent.unsubscribe(subscriber);
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  startAbility failed, code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2300
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2300
     * @tc.desc   test caller.call function and checked released function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2300', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2300';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.systemappa',
        abilityName: 'MainAbility14',
        parameters: {
          data: TEST_CASE_NAME,
        }
      };
      try {
        console.log(`${TAG} startAssistAbility, ${JSON.stringify(want)}`);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility want ${JSON.stringify(want)}`);
        testAbilityContext.startAbility(want, async (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
          await sleep(2000);
          expect(onReleaseBackFlag).assertTrue();
          expect(onSecondReleaseBackFlag).assertTrue();
          expect(callBackValue).assertEqual(TEST_CASE_NAME);
          expect(secondCallBackValue).assertEqual(secondAcceptValue);
          commonEvent.unsubscribe(subscriber);
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  startAbility failed, code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2400
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2400
     * @tc.desc   test  independent process called and checked released function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2400', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2400';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.systemappa',
        abilityName: 'MainAbility15',
        parameters: {
          data: TEST_CASE_NAME,
        }
      };
      try {
        console.log(`${TAG} startAssistAbility, ${JSON.stringify(want)}`);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility want ${JSON.stringify(want)}`);
        testAbilityContext.startAbility(want, async (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
          await sleep(2000);
          expect(onCreateFlag).assertTrue();
          expect(onBackgroundFlag).assertTrue();
          expect(onReleaseBackFlag).assertTrue();
          commonEvent.unsubscribe(subscriber);
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  startAbility failed, code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2200
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2200
     * @tc.desc   test callee.on function and checked caller.release function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2200', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2200';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.systemappa',
        abilityName: 'MainAbility16',
        parameters: {
          data: TEST_CASE_NAME,
        }
      };
      try {
        console.log(`${TAG} startAssistAbility, ${JSON.stringify(want)}`);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility want ${JSON.stringify(want)}`);
        testAbilityContext.startAbility(want, async (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
          await sleep(2000);
          expect(onReleaseBackFlag).assertTrue();
          expect(onSecondReleaseBackFlag).assertTrue();
          expect(callBackValue).assertEqual(TEST_CASE_NAME);
          expect(secondCallBackValue).assertEqual(secondAcceptValue);
          commonEvent.unsubscribe(subscriber);
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  startAbility failed, code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2500
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2500
     * @tc.desc   test callee.off function and checked released function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2500', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2500';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.systemappa',
        abilityName: 'MainAbility17',
        parameters: {
          data: TEST_CASE_NAME,
        }
      };
      try {
        console.log(`${TAG} startAssistAbility, ${JSON.stringify(want)}`);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility want ${JSON.stringify(want)}`);
        testAbilityContext.startAbility(want, async (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
          await sleep(2000);
          let enterNums = 1;
          expect(onCreateFlag).assertTrue();
          expect(onBackgroundFlag).assertTrue();
          expect(callBackValue).assertEqual(TEST_CASE_NAME);
          expect(enterIndex).assertEqual(enterNums);
          commonEvent.unsubscribe(subscriber);
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  startAbility failed, code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_1800
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_1800
     * @tc.desc   test target ability set launchType as  standard page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_1800', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_1800';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      let code = 16000050;
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.systemappa',
        abilityName: 'MainAbility18',
        parameters: {
          data: TEST_CASE_NAME,
        }
      };
      try {
        console.log(`${TAG} startAssistAbility, ${JSON.stringify(want)}`);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility want ${JSON.stringify(want)}`);
        testAbilityContext.startAbility(want, async (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
          await sleep(2000);
          expect(errCode).assertEqual(code);
          commonEvent.unsubscribe(subscriber);
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  startAbility failed, code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_1200
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_1200
     * @tc.desc   test target ability set launchType as  singleton
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_1200', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_1200';
      let errNum = 16000050;
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.systemappa',
        abilityName: 'MainAbility19',
        parameters: {
          data: TEST_CASE_NAME,
        }
      };
      try {
        console.log(`${TAG} startAssistAbility, ${JSON.stringify(want)}`);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility want ${JSON.stringify(want)}`);
        testAbilityContext.startAbility(want, async (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
          await sleep(2000);
          commonEvent.unsubscribe(subscriber);
          expect(errCode).assertEqual(errNum);
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  startAbility failed, code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_1400
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_1400
     * @tc.desc   test target ability set launchType as  singleton
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_1400', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_1400';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      let num = 1;
      subscriber = await commonEvent.createSubscriber(subscribeInfo);
      commonEvent.subscribe(subscriber, (err, data) => {
        subscribeCallBack(err, data, done, TEST_CASE_NAME);
      });
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.systemappa',
        abilityName: 'MainAbility20',
        parameters: {
          data: TEST_CASE_NAME,
        }
      };
      try {
        console.log(`${TAG} startAssistAbility, ${JSON.stringify(want)}`);
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility want ${JSON.stringify(want)}`);
        testAbilityContext.startAbility(want, async (err: BusinessError) => {
          if (err.code) {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed`);
          await sleep(2000);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==onCreateFlag==${onCreateFlag}}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==onBackgroundFlag==${onBackgroundFlag}}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==enterCreateIndex==${enterCreateIndex}}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==enterBackGroundIndex==${enterBackGroundIndex}}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==callBackValue==${callBackValue}}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==returnBackValue==${returnBackValue}}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==onReleaseBackFlag==${onReleaseBackFlag}}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==secondAcceptValue==${secondAcceptValue}}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==secondCallBackValue==${secondCallBackValue}}`);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility succeed==onSecondReleaseBackFlag==${onSecondReleaseBackFlag}}`);
          expect(onCreateFlag).assertTrue();
          expect(onBackgroundFlag).assertTrue();
          expect(enterCreateIndex).assertEqual(num);
          expect(enterBackGroundIndex).assertEqual(num)
          expect(callBackValue).assertEqual(TEST_CASE_NAME);
          expect(returnBackValue).assertEqual(callBackValue);
          expect(onReleaseBackFlag).assertTrue();
          expect(secondAcceptValue).assertEqual(TEST_CASE_NAME);
          expect(secondCallBackValue).assertEqual(secondAcceptValue);
          expect(onSecondReleaseBackFlag).assertTrue();
          commonEvent.unsubscribe(subscriber);
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  startAbility failed, code is ${code}, message is ${message} `);
        expect().assertFail();
        done();
      }
    });


  })
}