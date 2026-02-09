/*
  * Copyright (C) 2024-2025 HiHope Open Source Organization.
  * Licensed under the Apache License, Version 2.0 (the "License");
  * you may not use this file except in compliance with the License.
  * You may obtain a copy of the License at
  *
  *    http://www.apache.org/licenses/LICENSE-2.0
  *
  * Unless required by applicable law or agreed to in writing, software
  * distributed under the License is distributed on an "AS IS" BASIS,
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
*/

import { describe, it, expect, beforeAll, beforeEach, Level } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { common, wantConstant } from '@kit.AbilityKit';
import systemParameterEnhance from '@ohos.systemParameterEnhance';

let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator;
abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
let deviceType:string;
export default function actsApplicationStartAbilityTest() {

  describe('actsApplicationStartAbilityTest', () => {
    let expectErrCode = 16000001;
    const PARAM_ERRCODE = 401;
    let context: common.UIAbilityContext;
    beforeAll(async (done: Function) => {
      deviceType = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable');
      hilog.info(0x0000, 'testTag', '%{public}s',
          `current device is ` + deviceType);
      setTimeout(() => {
        context = getContext() as common.UIAbilityContext;
        hilog.info(0x0000, 'testTag', '%{public}s',
          `Succeeded in starting SpecifiedAbility11ww11` + JSON.stringify(context));
        done();
      }, 2000);
    });

    beforeEach(async () => {
      let startAbilityNoModuleNameCmd1 = 'aa force-stop com.example.actsapplicationstartabilityauxiliary';
      let startAbilityNoModuleNameCmd2 = 'aa force-stop com.example.actsapplicationstartabilityauxiliary2';
      await abilityDelegator.executeShellCommand(startAbilityNoModuleNameCmd1);
      await abilityDelegator.executeShellCommand(startAbilityNoModuleNameCmd2);
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2900
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2900
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2900', Level.LEVEL0, async (done: Function) => {
      let TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2900';
      // context为调用方UIAbility的UIAbilityContext;
      let KEY_NEW = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2900';
      let want: Want = {
        deviceId: '', // deviceId为空表示本设备
        bundleName: 'com.example11.actsapplicationstartabilityauxiliary',
        abilityName: 'EntryAbility',
        moduleName: 'entry', // moduleName非必选
        parameters: {
          instanceKey: KEY_NEW
        }
      };
      try {
        await context.startAbility(want).then(() => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_CASE_NAME} Succeeded in starting SpecifiedAbility`);
          expect().assertFail();
        }).catch((error: BusinessError) => {
          expect(error.code).assertEqual(expectErrCode)
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
          done();
        });
      } catch (error) {
        expect().assertFail();
        hilog.info(0x0000, 'testTag', '%{public}s',
          `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2800
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2800
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2800', Level.LEVEL0, async (done: Function) => {
      // context为调用方UIAbility的UIAbilityContext;
      let KEY_NEW = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2800';
      let TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2800';
      let want: Want = {
        deviceId: '', // deviceId为空表示本设备
        bundleName: 'com.example.actsapplicationstartabilityauxiliary',
        abilityName: 'Ability',
        moduleName: 'entry', // moduleName非必选
        parameters: {
          instanceKey: KEY_NEW
        }
      };
      await context.startAbility(want).then(() => {
        hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_CASE_NAME} Succeeded in starting SpecifiedAbility`);
        expect().assertFail();
      }).catch((error: BusinessError) => {
        expect(error.code).assertEqual(expectErrCode)
        hilog.info(0x0000, 'testTag', '%{public}s',
          `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
        done();
      });
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5700
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5700
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5700', Level.LEVEL0, async (done: Function) => {
      // context为调用方UIAbility的UIAbilityContext;
      let TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5700';
      let KEY_NEW = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5700';
      let want: Want = {
        deviceId: '-1', // deviceId为空表示本设备
        bundleName: 'com.example.actsapplicationstartabilityauxiliary',
        abilityName: 'EntryAbility',
        moduleName: 'entry', // moduleName非必选
        parameters: {
          instanceKey: KEY_NEW
        }
      };
      await context.startAbility(want).then(() => {
        hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_CASE_NAME} Succeeded in starting SpecifiedAbility`);
        expect().assertFail();
      }).catch((error: BusinessError) => {
        expect(error.code).assertEqual(PARAM_ERRCODE)
        hilog.info(0x0000, 'testTag', '%{public}s',
          `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
        done();
      });
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3000
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3000
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3000', Level.LEVEL0, async (done: Function) => {
      // context为调用方UIAbility的UIAbilityContext;
      let TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3000';
      let subscriberInfo_startdebugapp: commonEventManager.CommonEventSubscribeInfo = {
        events: [TEST_CASE_NAME],
      };
      await commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (subscriber) => {
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `eventInfosubscribe ${TEST_CASE_NAME}`);
          if (err) {
            hilog.info(0x0000, 'testTag', '%{public}s',
              `eventInfosubscribe ${TEST_CASE_NAME} fail:${JSON.stringify(err)}`);
            done();
          } else {
            try {
              if (commonEventData.event === TEST_CASE_NAME) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
                let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean
                let onWindowStageCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean
                let onForegroundFlag = commonEventData.parameters?.data?.onCreateFlag as boolean
                expect(onCreateFlag).assertTrue();
                expect(onWindowStageCreateFlag).assertTrue();
                expect(onForegroundFlag).assertTrue();
              }
              commonEventManager.unsubscribe(subscriber, (err, data) => {
                done();
              });

            } catch (error) {
              expect().assertFail();
              hilog.info(0x0000, 'testTag', '%{public}s',
                `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
              done();
            }
          }
        });
        let want: Want = {
          deviceId: undefined, // deviceId为空表示本设备
          bundleName: 'com.example.actsapplicationstartabilityauxiliary',
          abilityName: 'EntryAbility',
          moduleName: 'entry', // moduleName非必选
          action: TEST_CASE_NAME,
          parameters: {
            instanceKey: TEST_CASE_NAME
          }
        };
        context.startAbility(want).then(() => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_CASE_NAME} Succeeded in starting SpecifiedAbility`);

        }).catch((error: BusinessError) => {
          expect().assertFail();
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
          done();
        });
      });
    });


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3400
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3400
     * @tc.desc   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3400', Level.LEVEL0, async (done: Function) => {
      let TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3400';
      let subscriberInfo_startdebugapp: commonEventManager.CommonEventSubscribeInfo = {
        events: [TEST_CASE_NAME],
      };
      await commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (subscriber) => {
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `eventInfosubscribe ${TEST_CASE_NAME}`);
          if (err) {
            hilog.info(0x0000, 'testTag', '%{public}s',
              `eventInfosubscribe ${TEST_CASE_NAME} fail:${JSON.stringify(err)}`);
          } else {
            try {
              if (commonEventData.event === TEST_CASE_NAME) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
                let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
                let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
                let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
                expect(onCreateFlag).assertTrue();
                expect(onWindowStageCreateFlag).assertTrue();
                expect(onForegroundFlag).assertTrue();
                commonEventManager.unsubscribe(subscriber, (err, data) => {
                  done();
                });
              }
            } catch (error) {
              expect().assertFail();
              hilog.info(0x0000, 'testTag', '%{public}s',
                `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
              done();
            }
          }

        });
        let want: Want = {
          deviceId: '', // deviceId为空表示本设备
          bundleName: 'com.example.actsapplicationstartabilityauxiliary',
          abilityName: 'EntryAbility',
          moduleName: 'entry', // moduleName非必选
          action: TEST_CASE_NAME,
          flags: 1.5,
          parameters: {
            instanceKey: TEST_CASE_NAME
          }
        };

        context.startAbility(want).then(() => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_CASE_NAME} Succeeded in starting SpecifiedAbility`);
        }).catch((error: BusinessError) => {
          expect().assertFail();
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
          done();
        })
      });
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5200
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5200
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5200', Level.LEVEL0, async (done: Function) => {
      let TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5200';
      let subscriberInfo_startdebugapp: commonEventManager.CommonEventSubscribeInfo = {
        events: [TEST_CASE_NAME],
      };
      await commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (subscriber) => {
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `eventInfosubscribe ${TEST_CASE_NAME}`);
          if (err) {
            hilog.info(0x0000, 'testTag', '%{public}s',
              `eventInfosubscribe ${TEST_CASE_NAME} fail:${JSON.stringify(err)}`);
          } else {
            try {
              if (commonEventData.event === TEST_CASE_NAME) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
                let startAbility5200 = commonEventData.parameters?.data?.startAbility_5200 as boolean;
                expect(startAbility5200).assertTrue();
                commonEventManager.unsubscribe(subscriber, (err, data) => {
                  done();
                });
              }
            } catch (error) {
              expect().assertFail();
              hilog.info(0x0000, 'testTag', '%{public}s',
                `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
              done();
            }
          }

        });
        let want: Want = {
          deviceId: '', // deviceId为空表示本设备
          bundleName: 'com.example.actsapplicationstartabilityauxiliary',
          abilityName: 'EntryAbility',
          moduleName: 'entry', // moduleName非必选
          action: TEST_CASE_NAME,
          entities: [],
          parameters: {
            keyForString: 'str',
            keyForInt: 100,
            keyForDouble: 99.99,
            keyForBool: true,
            keyForObject: {
              keyForObjectString: 'str',
              keyForObjectInt: -200,
              keyForObjectDouble: 35.5,
              keyForObjectBool: false,
            },
            keyForArrayString: ['str1', 'str2', 'str3'],
            keyForArrayInt: [100, 200, 300, 400],
            keyForArrayDouble: [0.1, 0.2],
            keyForArrayObject: [{
              obj1: 'aaa'
            }, {
              obj2: 100
            }],
          }
        };
        context.startAbility(want).then(() => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_CASE_NAME} Succeeded in starting SpecifiedAbility`);
        }).catch((error: BusinessError) => {
          expect().assertFail();
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
          done();
        });
      });
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5300
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5300
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5300', Level.LEVEL0, async (done: Function) => {
      let TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5300';
      let subscriberInfo_startdebugapp: commonEventManager.CommonEventSubscribeInfo = {
        events: [TEST_CASE_NAME],
      };
      await commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (subscriber) => {
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `eventInfosubscribe ${TEST_CASE_NAME}`);
          if (err) {
            hilog.info(0x0000, 'testTag', '%{public}s',
              `eventInfosubscribe ${TEST_CASE_NAME} fail:${JSON.stringify(err)}`);
          } else {
            try {
              if (commonEventData.event === TEST_CASE_NAME) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
                let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
                let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
                let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
                expect(onCreateFlag).assertTrue();
                expect(onWindowStageCreateFlag).assertTrue();
                expect(onForegroundFlag).assertTrue();
                commonEventManager.unsubscribe(subscriber, (err, data) => {
                  done();
                });
              }
            } catch (error) {
              expect().assertFail();
              hilog.info(0x0000, 'testTag', '%{public}s',
                `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
              done();
            }
          }
        });
        let want: Want = {
          action: TEST_CASE_NAME,
          parameters: {
            instanceKey: TEST_CASE_NAME
          },
          flags: wantConstant.Flags.FLAG_START_WITHOUT_TIPS
        }
        context.startAbility(want).then(() => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_CASE_NAME} Succeeded in starting SpecifiedAbility`);
        }).catch((error: BusinessError) => {
          expect().assertFail();
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
          done();
        });
      });
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5400
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5400
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5400', Level.LEVEL0, async (done: Function) => {
      let TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5400';
      let subscriberInfo_startdebugapp: commonEventManager.CommonEventSubscribeInfo = {
        events: [TEST_CASE_NAME],
      };
      await commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (subscriber) => {
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `eventInfosubscribe ${TEST_CASE_NAME}`);
          if (err) {
            hilog.info(0x0000, 'testTag', '%{public}s',
              `eventInfosubscribe ${TEST_CASE_NAME} fail:${JSON.stringify(err)}`);
          } else {
            try {
              if (commonEventData.event === TEST_CASE_NAME) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
                let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
                let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
                let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
                expect(onCreateFlag).assertTrue();
                expect(onWindowStageCreateFlag).assertTrue();
                expect(onForegroundFlag).assertTrue();
                commonEventManager.unsubscribe(subscriber, (err, data) => {
                  done();
                });
              }
            } catch (error) {
              expect().assertFail();
              hilog.info(0x0000, 'testTag', '%{public}s',
                `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
              done();
            }
          }
        });
        let want: Want = {
          deviceId: '', // deviceId为空表示本设备
          action: TEST_CASE_NAME,
          entities: [TEST_CASE_NAME],
          parameters: {
            instanceKey: TEST_CASE_NAME
          },
          flags: wantConstant.Flags.FLAG_START_WITHOUT_TIPS
        }
        context.startAbility(want).then(() => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_CASE_NAME} Succeeded in starting SpecifiedAbility`);
        }).catch((error: BusinessError) => {
          expect().assertFail();
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
          done();
        });
      });
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5900
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5900
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5900', Level.LEVEL0, async (done: Function) => {
      let TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5900';
      let want: Want = {
        deviceId: '', // deviceId为空表示本设备
        action: TEST_CASE_NAME,
        entities: [TEST_CASE_NAME],
        parameters: {
          instanceKey: TEST_CASE_NAME
        },
        flags: wantConstant.Flags.FLAG_START_WITHOUT_TIPS
      };
      context.startAbility(want).then((data) => {
        hilog.info(0x0000, 'testTag', '%{public}s', ` SpecifiedAbility succeed ${JSON.stringify(data)}`);
        expect().assertFail();
        done();
      }).catch((err: BusinessError) => {
        expect(err.code).assertEqual(16000019)
        hilog.info(0x0000, 'testTag', '%{public}s', ` SpecifiedAbility err ${JSON.stringify(err)}`);
        done();
      });
    });


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_6000
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_6000
     * @tc.desc   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_6000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_6000', Level.LEVEL0, async (done: Function) => {
      let TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_6000';
      let subscriberInfo_startdebugapp: commonEventManager.CommonEventSubscribeInfo = {
        events: [TEST_CASE_NAME],
      };
      await commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (subscriber) => {
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `eventInfosubscribe ${TEST_CASE_NAME}`);
          if (err) {
            hilog.info(0x0000, 'testTag', '%{public}s',
              `eventInfosubscribe ${TEST_CASE_NAME} fail:${JSON.stringify(err)}`);
          } else {
            try {
              if (commonEventData.event === TEST_CASE_NAME) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
                let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean
                let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean
                let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean
                expect(onCreateFlag).assertTrue();
                expect(onWindowStageCreateFlag).assertTrue();
                expect(onForegroundFlag).assertTrue();
                commonEventManager.unsubscribe(subscriber, (err, data) => {
                  done();
                });
              }
            } catch (error) {
              expect().assertFail();
              hilog.info(0x0000, 'testTag', '%{public}s',
                `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
              done();
            }
          }
        });
        let want: Want = {
          deviceId: '', // deviceId为空表示本设备
          bundleName: 'com.example.actsapplicationstartabilityauxiliary',
          abilityName: 'EntryAbility',
          moduleName: 'entry', // moduleName非必选
          action: TEST_CASE_NAME,
          entities: [],
          parameters: {
            instanceKey: TEST_CASE_NAME
          }
        };
        context.startAbility(want).then(() => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_CASE_NAME} Succeeded in starting SpecifiedAbility`);
        }).catch((error: BusinessError) => {
          expect().assertFail();
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
          done();
        });
      });
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5100
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5100
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5100', Level.LEVEL0, async (done: Function) => {
      let TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5100';
      let subscriberInfo_startdebugapp: commonEventManager.CommonEventSubscribeInfo = {
        events: [TEST_CASE_NAME],
      };
      await commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (subscriber) => {
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `eventInfosubscribe ${TEST_CASE_NAME}`);
          if (err) {
            hilog.info(0x0000, 'testTag', '%{public}s',
              `eventInfosubscribe ${TEST_CASE_NAME} fail:${JSON.stringify(err)}`);
          } else {
            try {
              if (commonEventData.event === TEST_CASE_NAME) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
                let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
                let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
                let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
                expect(onCreateFlag).assertTrue();
                expect(onWindowStageCreateFlag).assertTrue();
                expect(onForegroundFlag).assertTrue();
                commonEventManager.unsubscribe(subscriber, (err, data) => {
                  done();
                });
              }
            } catch (error) {
              expect().assertFail();
              hilog.info(0x0000, 'testTag', '%{public}s',
                `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
              done();
            }

          }
        });
        let want: Want = {
          deviceId: '', // deviceId为空表示本设备
          bundleName: 'com.example.actsapplicationstartabilityauxiliary',
          abilityName: 'EntryAbility',
          moduleName: 'entry', // moduleName非必选
          action: TEST_CASE_NAME,
          parameters: {
            'ability.want.params.INTENT_ACTION': {
              'number': '123'
            }
          }
        };
        context.startAbility(want).then((data) => {
          hilog.info(0x0000, 'testTag', '%{public}s', ` SpecifiedAbility succeed ${JSON.stringify(data)}`);
        }).catch((error: BusinessError) => {
          expect().assertFail();
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
          done();
        });
      });
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1500
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1500
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1500', Level.LEVEL0, async (done: Function) => {
      let TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1500';
      let subscriberInfo_startdebugapp: commonEventManager.CommonEventSubscribeInfo = {
        events: [TEST_CASE_NAME],
      };
      await commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (subscriber) => {
        let onForegroundFlagNumber = 0;
        commonEventManager.subscribe(subscriber, async (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `eventInfosubscribe ${TEST_CASE_NAME}`);
          if (err) {
            hilog.info(0x0000, 'testTag', '%{public}s',
              `eventInfosubscribe ${TEST_CASE_NAME} fail:${JSON.stringify(err)}`);
          } else {
            if (commonEventData.event === TEST_CASE_NAME) {
              onForegroundFlagNumber = onForegroundFlagNumber + 1
              hilog.info(0x0000, 'testTag', '%{public}s',
                `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
              let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
              let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
              let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
              if (onForegroundFlagNumber == 1) {
                expect(onCreateFlag).assertTrue();
                expect(onWindowStageCreateFlag).assertTrue();
                expect(onForegroundFlag).assertTrue();

                let want: Want = {
                  deviceId: '', // deviceId为空表示本设备
                  bundleName: 'com.example.actsapplicationstartabilityauxiliary2',
                  abilityName: 'MultipleEntryAbility',
                  moduleName: 'entry', // moduleName非必选
                  action: TEST_CASE_NAME,
                  entities: [TEST_CASE_NAME],
                  parameters: {
                    instanceKey: TEST_CASE_NAME
                  }
                };
                await sleep(1000);
                context.startAbility(want).then(() => {
                  hilog.info(0x0000, 'testTag', '%{public}s',
                    `${TEST_CASE_NAME} Succeeded in starting SpecifiedAbility`);
                }).catch((error: BusinessError) => {
                  expect().assertFail();
                  hilog.info(0x0000, 'testTag', '%{public}s',
                    `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
                  done();
                });
              }
              if (onForegroundFlagNumber == 2) {
                expect(onCreateFlag).assertTrue();
                expect(onWindowStageCreateFlag).assertTrue();
                expect(onForegroundFlag).assertTrue();
                commonEventManager.unsubscribe(subscriber, (err, data) => {
                  done();
                });
              }
            }
          }
        });
        let want: Want = {
          deviceId: '', // deviceId为空表示本设备
          bundleName: 'com.example.actsapplicationstartabilityauxiliary2',
          abilityName: 'MultipleEntryAbility',
          moduleName: 'entry', // moduleName非必选
          action: TEST_CASE_NAME,
          entities: [TEST_CASE_NAME],
          parameters: {
            instanceKey: TEST_CASE_NAME
          }
        }
        context.startAbility(want).then(() => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_CASE_NAME} Succeeded in starting SpecifiedAbility`);
        }).catch((error: BusinessError) => {
          expect().assertFail();
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
          done();
        });
      });
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0400
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0400
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0400', Level.LEVEL0, async (done: Function) => {
      let TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0400';
      let subscriberInfo_startdebugapp: commonEventManager.CommonEventSubscribeInfo = {
        events: [TEST_CASE_NAME, 'singleentryability2', 'entryability1', 'SingleEntryAbility3'],
      };
      await commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (subscriber) => {
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `eventInfosubscribe ${TEST_CASE_NAME}`);
          if (err) {
            hilog.info(0x0000, 'testTag', '%{public}s',
              `eventInfosubscribe ${TEST_CASE_NAME} fail:${JSON.stringify(err)}`);
          } else {
            try {
              if (commonEventData.event === TEST_CASE_NAME) {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
                let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
                let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
                let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
                expect(onCreateFlag).assertTrue();
                expect(onWindowStageCreateFlag).assertTrue();
                expect(onForegroundFlag).assertTrue();
              }
              if (commonEventData.event === 'singleentryability2') {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
                let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
                let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
                let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
                expect(onCreateFlag).assertTrue();
                expect(onWindowStageCreateFlag).assertTrue();
                expect(onForegroundFlag).assertTrue();
              }
              if (commonEventData.event === 'entryability1') {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME} onBackgroundFlag: ${JSON.stringify(commonEventData)}`);
                let onBackgroundFlag = commonEventData.parameters?.data?.onBackgroundFlag as boolean;
                expect(onBackgroundFlag).assertTrue();
              }
              if (commonEventData.event === 'SingleEntryAbility3') {
                hilog.info(0x0000, 'testTag', '%{public}s', `SingleEntryAbility3: ${JSON.stringify(commonEventData)}`);
                let onDestroyFlag = commonEventData.parameters?.data?.onDestroyFlag as boolean;
                expect(onDestroyFlag).assertTrue();
                commonEventManager.unsubscribe(subscriber, (err, data) => {
                  done();
                });
              }
            } catch (error) {
              expect().assertFail();
              hilog.info(0x0000, 'testTag', '%{public}s',
                `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
              done();
            }
          }
        });
        let want: Want = {
          deviceId: '', // deviceId为空表示本设备
          bundleName: 'com.example.actsapplicationstartabilitytest',
          abilityName: 'EntryAbility1',
          action: TEST_CASE_NAME,
          parameters: {
            instanceKey: TEST_CASE_NAME
          }
        };
        context.startAbility(want).then((data) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Succeeded in starting SpecifiedAbility EntryAbility1 ${data}`);
        }).catch((error: BusinessError) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Failed to start SpecifiedAbility EntryAbility1. Code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        })
      });
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0500
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0500
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0500', Level.LEVEL0, async (done: Function) => {
      let TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0500';
      if(deviceType == 'false'){
        done();
      }
      let onForegroundFlagNumber = 0
      let subscriberInfo_startdebugapp: commonEventManager.CommonEventSubscribeInfo = {
        events: [TEST_CASE_NAME, 'singleentryability2', 'entryability1', 'SingleEntryAbility3_0500'],
      };
      await commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (subscriber) => {
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `eventInfosubscribe ${TEST_CASE_NAME}`);
          if (err) {
            hilog.info(0x0000, 'testTag', '%{public}s',
              `eventInfosubscribe ${TEST_CASE_NAME} fail:${JSON.stringify(err)}`);
          } else {
            try {
              if (commonEventData.event === TEST_CASE_NAME) {
                onForegroundFlagNumber = onForegroundFlagNumber + 1
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
                hilog.info(0x0000, 'testTag', '%{public}s', `onForegroundFlagNumber: ${onForegroundFlagNumber}`);
                let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
                let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
                let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
                if (onForegroundFlagNumber == 1) {
                  expect(onCreateFlag).assertTrue();
                  expect(onWindowStageCreateFlag).assertTrue();
                  expect(onForegroundFlag).assertTrue();
                }
                if (onForegroundFlagNumber == 2) {
                  expect(onForegroundFlag).assertTrue();
                  commonEventManager.unsubscribe(subscriber, (err, data) => {
                    done();
                  });
                }
              }
              if (commonEventData.event === 'singleentryability2') {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME}: ${JSON.stringify(commonEventData)}`);
                let onCreateFlag = commonEventData.parameters?.data?.onCreateFlag as boolean;
                let onWindowStageCreateFlag = commonEventData.parameters?.data?.onWindowStageCreateFlag as boolean;
                let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
                expect(onCreateFlag).assertTrue();
                expect(onWindowStageCreateFlag).assertTrue();
                expect(onForegroundFlag).assertTrue();
              }
              if (commonEventData.event === 'entryability1') {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `eventInfosubscribe ${TEST_CASE_NAME} onBackgroundFlag: ${JSON.stringify(commonEventData)}`);
                let onBackgroundFlag = commonEventData.parameters?.data?.onBackgroundFlag as boolean;
                expect(onBackgroundFlag).assertTrue();
              }
              if (commonEventData.event === 'SingleEntryAbility3_0500') {
                hilog.info(0x0000, 'testTag', '%{public}s',
                  `SingleEntryAbility3_0500: ${JSON.stringify(commonEventData)}`);
                let onDestroyFlag = commonEventData.parameters?.data?.onDestroyFlag as boolean;
                let onForegroundFlag = commonEventData.parameters?.data?.onForegroundFlag as boolean;
                expect(onDestroyFlag).assertTrue();
                expect(onForegroundFlag).assertTrue();
              }
            } catch (error) {
              expect().assertFail();
              hilog.info(0x0000, 'testTag', '%{public}s',
                `${TEST_CASE_NAME} Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
              done();
            }
          }
        });
        let want: Want = {
          deviceId: '', // deviceId为空表示本设备
          bundleName: 'com.example.actsapplicationstartabilitytest',
          abilityName: 'EntryAbility1',
          action: TEST_CASE_NAME,
          parameters: {
            instanceKey: TEST_CASE_NAME
          }
        };
        context.startAbility(want).then((data) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Succeeded in starting SpecifiedAbility EntryAbility1 ${data}`);
        }).catch((error: BusinessError) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${TEST_CASE_NAME} Failed to start SpecifiedAbility EntryAbility1. Code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        });
      });
    });
  });
}

function sleep(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
}



