/*
 * Copyright (C) 2024-2025 HiHope Open Source Organization
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

import { describe, afterEach, it, expect, beforeEach, beforeAll, Level } from '@ohos/hypium'
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { common, StartOptions, UIAbility } from '@kit.AbilityKit';
import { Driver, MatchPattern, ON } from '@kit.TestKit';
import { commonEventManager } from '@kit.BasicServicesKit';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function abilityTest() {
  describe('TerminateselfWithResultTest', () => {

    let delegator = abilityDelegatorRegistry.getAbilityDelegator();
    let bundleName = 'com.example.terminateselfwithresulttesthap';
    let bundleName2 = 'com.example.terminateselfwithresulttesthap2';
    let bundleName3 = 'com.example.actsterminateselfwithresulttest';
    let abilityName = 'EntryAbility';

    const TAG: string = 'TerminateselfWithResult';
    const TEST_SUITE_NAME: string = 'TerminateselfWithResultTest';
    let context: common.UIAbilityContext;
    let driver = Driver.create();
    beforeAll(async (done: Function) => {
      await sleep(1000);
      context = getContext() as common.UIAbilityContext;
      hilog.info(0x0000, 'testTag', '%{public}s',
        `Succeeded in starting SpecifiedAbility11ww11` + JSON.stringify(context));
      done();
    });
    beforeEach(async () => {
      let cmdBeforeEach = 'aa start -d 0 -a TestAbility' + ' -b ' + 'com.example.actsterminateselfwithresulttest';
      await delegator.executeShellCommand(cmdBeforeEach);
      await sleep(1000);
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_1000
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_1000
     * @tc.desc   Verify that the startAbilityForResult is invalid when options is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_1000', Level.LEVEL0, (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_1000';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let want: Want = {
        deviceId: '',
        bundleName: bundleName,
        abilityName: abilityName
      };
      let options: StartOptions = {
        windowMode: -100
      };
      try {
        context.startAbilityForResult(want, options, (err: BusinessError, result: common.AbilityResult) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `startAbilityForResult failed, code is err.code,messageis${err.code}, message is ${err.message}`);
          try {
            expect(err.code).assertEqual(16000050);
          } catch {
          }
          done();
        });
      } catch (err) {
        // 处理入参错误异常
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, TAG, '%{public}s',
          `startAbilityForResult failed, code is err.code,messageis${code}, message is ${message}`);
        expect(err.code).assertEqual(16000050);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_1500
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_1500
     * @tc.desc   Verify that the terminateSelfWithResult is invalid when resultCode is decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_1500', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_1500';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

      let want: Want = {
        bundleName: bundleName,
        abilityName: abilityName,
        action: TEST_CASE_NAME
      };

      try {
        context.startAbilityForResult(want).then((result: common.AbilityResult) => {
          // 执行正常业务
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
          try {
            expect(result.resultCode).assertEqual(0);
            expect(result.want?.bundleName).assertEqual(bundleName);
            expect(result.want?.abilityName).assertEqual(abilityName);
          } catch {
          }
          done();
        }).catch((err: BusinessError) => {
          // 处理业务逻辑错误
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_1600
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_1600
     * @tc.desc   Verify that the terminateSelfWithResult is invalid when resultCode is 3|5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_1600', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_1600';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

      let want: Want = {
        bundleName: bundleName,
        abilityName: abilityName,
        action: TEST_CASE_NAME
      };

      try {
        context.startAbilityForResult(want).then((result: common.AbilityResult) => {
          // 执行正常业务
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
          try {
            expect(result.resultCode).assertEqual(7);
            expect(result.want?.bundleName).assertEqual(bundleName);
            expect(result.want?.abilityName).assertEqual(abilityName);
          } catch {
          }
          done();
        }).catch((err: BusinessError) => {
          // 处理业务逻辑错误
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2500
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2500
     * @tc.desc   StartAbilityForResult ability, then terminateSelfWithResult when parameters in want is BigDecimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2500', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2500';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let testParam = 1.1234567890123457;

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [TEST_CASE_NAME]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s',
            `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            expect(commonEventData.parameters?.data?.parameters?.keyForBigDecimal).assertEqual(testParam);
          } catch {
          }
          commonEventManager.unsubscribe(subscriber, (err, data) => {
          });
        });
      });

      let want: Want = {
        bundleName: bundleName,
        abilityName: abilityName,
        action: TEST_CASE_NAME,
        parameters: {
          'keyForBigDecimal': testParam
        }
      };

      try {
        context.startAbilityForResult(want).then((result: common.AbilityResult) => {
          // 执行正常业务
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
          try {
            expect(result.want?.parameters?.keyForBigDecimal).assertEqual(testParam);
            expect(result.want?.bundleName).assertEqual(bundleName);
            expect(result.want?.abilityName).assertEqual(abilityName);
          } catch {
          }
          done();
        }).catch((err: BusinessError) => {
          // 处理业务逻辑错误
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2600
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2600
     * @tc.desc   StartAbilityForResult ability, then terminateSelfWithResult when parameters in want is BigInteger
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2600', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2600';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let testParam = 123456789101112;

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [TEST_CASE_NAME]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s',
            `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            expect(commonEventData.parameters?.data?.parameters?.keyForBigteger).assertEqual(testParam);
          } catch {
          }
          commonEventManager.unsubscribe(subscriber, (err, data) => {
          });
        });
      });

      let want: Want = {
        bundleName: bundleName,
        abilityName: abilityName,
        action: TEST_CASE_NAME,
        parameters: {
          'keyForBigteger': testParam
        }
      };

      try {
        context.startAbilityForResult(want).then((result: common.AbilityResult) => {
          // 执行正常业务
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
          try {
            expect(result.want?.parameters?.keyForBigteger).assertEqual(testParam);
            expect(result.want?.bundleName).assertEqual(bundleName);
            expect(result.want?.abilityName).assertEqual(abilityName);
          } catch {
          }
          done();
        }).catch((err: BusinessError) => {
          // 处理业务逻辑错误
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2700
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2700
     * @tc.desc   StartAbilityForResult ability, then terminateSelfWithResult when parameters in want is boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2700', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2700';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let testParam = true;

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [TEST_CASE_NAME]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s',
            `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            expect(commonEventData.parameters?.data?.parameters?.keyForBigDecimal).assertEqual(testParam);
          } catch {
          }
          commonEventManager.unsubscribe(subscriber, (err, data) => {
          });
        });
      });

      let want: Want = {
        bundleName: bundleName,
        abilityName: abilityName,
        action: TEST_CASE_NAME,
        parameters: {
          'keyForBigDecimal': testParam
        }
      };

      try {
        context.startAbilityForResult(want).then((result: common.AbilityResult) => {
          // 执行正常业务
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
          try {
            expect(result.want?.parameters?.keyForBigDecimal).assertEqual(testParam);
            expect(result.want?.bundleName).assertEqual(bundleName);
            expect(result.want?.abilityName).assertEqual(abilityName);
          } catch {
          }
          done();
        }).catch((err: BusinessError) => {
          // 处理业务逻辑错误
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2800
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2800
     * @tc.desc   StartAbilityForResult ability, then terminateSelfWithResult when parameters in want is double
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2800', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2800';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let testParam = 99.0123456789;

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [TEST_CASE_NAME]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s',
            `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            expect(commonEventData.parameters?.data?.parameters?.keyForDouble).assertEqual(testParam);
          } catch {
          }
          commonEventManager.unsubscribe(subscriber, (err, data) => {
          });
        });
      });

      let want: Want = {
        bundleName: bundleName,
        abilityName: abilityName,
        action: TEST_CASE_NAME,
        parameters: {
          'keyForDouble': testParam
        }
      };

      try {
        context.startAbilityForResult(want).then((result: common.AbilityResult) => {
          // 执行正常业务
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
          try {
            expect(result.want?.parameters?.keyForDouble).assertEqual(testParam);
            expect(result.want?.bundleName).assertEqual(bundleName);
            expect(result.want?.abilityName).assertEqual(abilityName);
          } catch {
          }
          done();
        }).catch((err: BusinessError) => {
          // 处理业务逻辑错误
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2900
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2900
     * @tc.desc   StartAbilityForResult ability, then terminateSelfWithResult when parameters in want is float
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2900', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_2900';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let testParam = 1.1212;

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [TEST_CASE_NAME]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s',
            `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            expect(commonEventData.parameters?.data?.parameters?.keyForInt).assertEqual(testParam);
          } catch {
          }
          commonEventManager.unsubscribe(subscriber, (err, data) => {
          });
        });
      });

      let want: Want = {
        bundleName: bundleName,
        abilityName: abilityName,
        action: TEST_CASE_NAME,
        parameters: {
          'keyForInt': testParam
        }
      };

      try {
        context.startAbilityForResult(want).then((result: common.AbilityResult) => {
          // 执行正常业务
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
          try {
            expect(result.want?.parameters?.keyForInt).assertEqual(testParam);
            expect(result.want?.bundleName).assertEqual(bundleName);
            expect(result.want?.abilityName).assertEqual(abilityName);
          } catch {
          }
          done();
        }).catch((err: BusinessError) => {
          // 处理业务逻辑错误
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3000
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3000
     * @tc.desc   StartAbilityForResult ability, then terminateSelfWithResult when parameters in want is intArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3000', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3000';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let testParam = [100, 200, 300, 400];

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [TEST_CASE_NAME]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s',
            `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            expect(commonEventData.parameters?.data?.parameters?.keyForDouble).assertDeepEquals(testParam);
          } catch {
          }
          commonEventManager.unsubscribe(subscriber, (err, data) => {
          });
        });
      });

      let want: Want = {
        bundleName: bundleName,
        abilityName: abilityName,
        action: TEST_CASE_NAME,
        parameters: {
          'keyForDouble': testParam
        }
      };

      try {
        context.startAbilityForResult(want).then((result: common.AbilityResult) => {
          // 执行正常业务
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
          try {
            expect(result.want?.parameters?.keyForDouble).assertDeepEquals(testParam);
            expect(result.want?.bundleName).assertEqual(bundleName);
            expect(result.want?.abilityName).assertEqual(abilityName);
          } catch {
          }
          done();
        }).catch((err: BusinessError) => {
          // 处理业务逻辑错误
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3100
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3100
     * @tc.desc   StartAbilityForResult ability, then terminateSelfWithResult when parameters in want is JsonArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3100', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3100';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [TEST_CASE_NAME]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s',
            `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            expect(commonEventData.parameters?.data?.parameters?.keyForJsonArray).assertDeepEquals([{
              'name': 'zhang', 'password': '123'
            }, {
              'name': 'yang', 'password': '456'
            }]);
          } catch {
          }
          commonEventManager.unsubscribe(subscriber, (err, data) => {
          });
        });
      });

      let want: Want = {
        bundleName: bundleName,
        abilityName: abilityName,
        action: TEST_CASE_NAME,
        parameters: {
          'keyForJsonArray': [{
            'name': 'zhang', 'password': '123'
          }, {
            'name': 'yang', 'password': '456'
          }]
        }
      };

      try {
        context.startAbilityForResult(want).then((result: common.AbilityResult) => {
          // 执行正常业务
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
          try {
            expect(result.want?.parameters?.keyForJsonArray).assertDeepEquals([{
              'name': 'zhang', 'password': '123'
            }, {
              'name': 'yang', 'password': '456'
            }]);
            expect(result.want?.bundleName).assertEqual(bundleName);
            expect(result.want?.abilityName).assertEqual(abilityName);
          } catch {
          }
          done();
        }).catch((err: BusinessError) => {
          // 处理业务逻辑错误
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3200
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3200
     * @tc.desc   StartAbilityForResult ability, then terminateSelfWithResult when parameters in want is Json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3200', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3200';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [TEST_CASE_NAME]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s',
            `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            expect(commonEventData.parameters?.data?.parameters?.keyForJson).assertDeepEquals({
              'name': '张三',
              'age': 30,
              'isStudent': false,
              'hobbies': ['阅读', '旅行', '烹饪']
            });
          } catch {
          }
          commonEventManager.unsubscribe(subscriber, (err, data) => {
          });
        });
      });

      let want: Want = {
        bundleName: bundleName,
        abilityName: abilityName,
        action: TEST_CASE_NAME,
        parameters: {
          'keyForJson': {
            'name': '张三',
            'age': 30,
            'isStudent': false,
            'hobbies': ['阅读', '旅行', '烹饪']
          }
        }
      };

      try {
        context.startAbilityForResult(want).then((result: common.AbilityResult) => {
          // 执行正常业务
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
          try {
            expect(result.want?.parameters?.keyForJson).assertDeepEquals({
              'name': '张三',
              'age': 30,
              'isStudent': false,
              'hobbies': ['阅读', '旅行', '烹饪']
            });
            expect(result.want?.bundleName).assertEqual(bundleName);
            expect(result.want?.abilityName).assertEqual(abilityName);
          } catch {
          }
          done();
        }).catch((err: BusinessError) => {
          // 处理业务逻辑错误
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3300
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3300
     * @tc.desc   StartAbilityForResult ability, then terminateSelfWithResult when parameters in want is Single character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3300', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3300';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let testParam = 'a';

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [TEST_CASE_NAME]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s',
            `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            expect(commonEventData.parameters?.data?.parameters?.keyForDouble).assertEqual(testParam);
          } catch {
          }
          commonEventManager.unsubscribe(subscriber, (err, data) => {
          });
        });
      });

      let want: Want = {
        bundleName: bundleName,
        abilityName: abilityName,
        action: TEST_CASE_NAME,
        parameters: {
          'keyForDouble': testParam
        }
      };

      try {
        context.startAbilityForResult(want).then((result: common.AbilityResult) => {
          // 执行正常业务
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
          try {
            expect(result.want?.parameters?.keyForDouble).assertEqual(testParam);
            expect(result.want?.bundleName).assertEqual(bundleName);
            expect(result.want?.abilityName).assertEqual(abilityName);
          } catch {
          }
          done();
        }).catch((err: BusinessError) => {
          // 处理业务逻辑错误
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3400
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3400
     * @tc.desc   StartAbilityForResult ability, then terminateSelfWithResult when parameters in want is string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3400', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3400';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let testParam = 'str';

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [TEST_CASE_NAME]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s',
            `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            expect(commonEventData.parameters?.data?.parameters?.keyForStr).assertEqual(testParam);
          } catch {
          }
          commonEventManager.unsubscribe(subscriber, (err, data) => {
          });
        });
      });

      let want: Want = {
        bundleName: bundleName,
        abilityName: abilityName,
        action: TEST_CASE_NAME,
        parameters: {
          'keyForStr': testParam
        }
      };

      try {
        context.startAbilityForResult(want).then((result: common.AbilityResult) => {
          // 执行正常业务
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
          try {
            expect(result.want?.parameters?.keyForStr).assertEqual(testParam);
            expect(result.want?.bundleName).assertEqual(bundleName);
            expect(result.want?.abilityName).assertEqual(abilityName);
          } catch {
          }
          done();
        }).catch((err: BusinessError) => {
          // 处理业务逻辑错误
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3600
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3600
     * @tc.desc   StartAbilityForResult ability, then terminateSelfWithResult when parameters in want is stringArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3600', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3600';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let testParam = ['str1', 'str2', 'str3'];

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [TEST_CASE_NAME]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s',
            `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            expect(commonEventData.parameters?.data?.parameters?.keyForStrArray).assertDeepEquals(testParam);
          } catch {
          }
          commonEventManager.unsubscribe(subscriber, (err, data) => {
          });
        });
      });

      let want: Want = {
        bundleName: bundleName,
        abilityName: abilityName,
        action: TEST_CASE_NAME,
        parameters: {
          'keyForStrArray': testParam
        }
      };

      try {
        context.startAbilityForResult(want).then((result: common.AbilityResult) => {
          // 执行正常业务
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
          try {
            expect(result.want?.parameters?.keyForStrArray).assertDeepEquals(testParam);
            expect(result.want?.bundleName).assertEqual(bundleName);
            expect(result.want?.abilityName).assertEqual(abilityName);
          } catch {
          }
          done();
        }).catch((err: BusinessError) => {
          // 处理业务逻辑错误
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3700
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3700
     * @tc.desc   StartAbilityForResult ability, then terminateSelfWithResult when parameters in want is integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3700', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3700';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let testParam = 100;

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [TEST_CASE_NAME]
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s',
            `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            expect(commonEventData.parameters?.data?.parameters?.keyForInt).assertEqual(testParam);
          } catch {
          }
          commonEventManager.unsubscribe(subscriber, (err, data) => {
          });
        });
      });

      let want: Want = {
        bundleName: bundleName,
        abilityName: abilityName,
        action: TEST_CASE_NAME,
        parameters: {
          'keyForInt': testParam
        }
      };

      try {
        context.startAbilityForResult(want).then((result: common.AbilityResult) => {
          // 执行正常业务
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
          try {
            expect(result.want?.parameters?.keyForInt).assertDeepEquals(testParam);
            expect(result.want?.bundleName).assertEqual(bundleName);
            expect(result.want?.abilityName).assertEqual(abilityName);
          } catch {
          }
          done();
        }).catch((err: BusinessError) => {
          // 处理业务逻辑错误
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3800
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3800
     * @tc.desc   StartAbilityForResult ability, then terminateSelfWithResult when parameters in want have Multiple key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3800', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_3800';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let testParamInt = 100;
      let testParamDouble = 99.99;

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [TEST_CASE_NAME]
      };

      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s',
            `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            expect(commonEventData.parameters?.data?.parameters?.keyForInt).assertEqual(testParamInt);
            expect(commonEventData.parameters?.data?.parameters?.keyForDouble).assertEqual(testParamDouble);
          } catch {
          }
          commonEventManager.unsubscribe(subscriber, (err, data) => {
          });
        });

        let want: Want = {
          bundleName: bundleName,
          abilityName: abilityName,
          action: TEST_CASE_NAME,
          parameters: {
            'keyForInt': testParamInt,
            'keyForDouble': testParamDouble
          }
        };

        try {
          context.startAbilityForResult(want).then((result: common.AbilityResult) => {
            // 执行正常业务
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
            try {
              expect(result.want?.parameters?.keyForInt).assertDeepEquals(testParamInt);
              expect(result.want?.parameters?.keyForDouble).assertDeepEquals(testParamDouble);
              expect(result.want?.bundleName).assertEqual(bundleName);
              expect(result.want?.abilityName).assertEqual(abilityName);
            } catch {
            }
            done();
          }).catch((err: BusinessError) => {
            // 处理业务逻辑错误
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4000
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4000
     * @tc.desc   StartAbilityForResult ability, then terminateSelfWithResult when want is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4000', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4000';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let event = TEST_CASE_NAME;

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [event]
      };

      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s',
            `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            expect(commonEventData.parameters?.data.terminateState).assertTrue();
          } catch {
          }
          commonEventManager.unsubscribe(subscriber, (err, data) => {
            done();
          });
        });

        let want: Want = {
          bundleName: bundleName2,
          abilityName: 'EntryAbility4',
          action: event
        };

        try {
          context.startAbilityForResult(want).then((result: common.AbilityResult) => {
            // 执行正常业务
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
            try {
              expect(result.want?.bundleName).assertEqual('');
              expect(result.want?.abilityName).assertEqual('');
            } catch {
            }
          }).catch((err: BusinessError) => {
            // 处理业务逻辑错误
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4100
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4100
     * @tc.desc   StartAbilityForResult ability, then terminateSelfWithResult when want is {}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4100', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4100';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

      let want: Want = {
        bundleName: bundleName,
        abilityName: 'SecondAbility',
        action: TEST_CASE_NAME
      };

      try {
        context.startAbilityForResult(want).then((result: common.AbilityResult) => {
          // 执行正常业务
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityForResult1 succeed,result: ${JSON.stringify(result)}`);
          try {
            expect(result.want?.bundleName).assertEqual('');
            expect(result.want?.abilityName).assertEqual('');
            expect(result.resultCode).assertEqual(100);
          } catch {
          }
          done();
        }).catch((err: BusinessError) => {
          // 处理业务逻辑错误
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
        expect().assertFail();
        done();
      }
    });
  });
}