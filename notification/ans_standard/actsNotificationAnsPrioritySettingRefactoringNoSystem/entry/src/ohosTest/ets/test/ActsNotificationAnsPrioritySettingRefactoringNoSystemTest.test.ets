/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import backgroundTaskManager from '@ohos.resourceschedule.backgroundTaskManager';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import notificationSubscribe from '@ohos.notificationSubscribe';
import { notificationManager } from '@kit.NotificationKit';
import { bundleManager } from '@kit.AbilityKit';
import CommonEventManager from '@ohos.commonEventManager';
import { image } from '@kit.ImageKit';
let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

async function cancelSuspendDelay() {
  hilog.info(0x0000, 'notificationansprioritysettingrefactoring', '%{public}s', 'cancelSuspendDelay delayId ' + globalThis.delayId);
  backgroundTaskManager.cancelSuspendDelay(globalThis.delayId);
}

function sleep(time:number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok");
    }, time)
  });
}
let context:common.UIAbilityContext;

export default function actsNotificationAnsPrioritySettingRefactoringNoSystem() {
  describe('actsNotificationAnsPrioritySettingRefactoringNoSystem', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>("abilityContext") as common.UIAbilityContext
      notificationManager.setNotificationEnable({
        bundle: "com.example.actsnotificationansprioritysettingrefactoring"
      }, true)
    })
    beforeEach(async () => {
      await abilityDelegator.executeShellCommand('hilog -r').then(data => {
        hilog.info(0x0000, 'notificationansprioritysettingrefactoring', '%{public}s',
          'beforeEach NotificationAnsPrioritySettingRefactoring hilog -r data is: ' + JSON.stringify(data));
      }).catch((err:BusinessError) => {
        hilog.info(0x0000, 'notificationansprioritysettingrefactoring', '%{public}s',
          'beforeEach NotificationAnsPrioritySettingRefactoring hilog -r err is: ' + JSON.stringify(err));
      });
    })
    afterEach(() => {})
    afterAll(async () => {
      await cancelSuspendDelay();
    })

    /**
     * @tc.name   Sub_Notification_Ans_Priority_Setting_Refactoring_006
     * @tc.number Sub_Notification_Ans_Priority_Setting_Refactoring_006
     * @tc.desc   [setPriorityIntelligentEnabled] When a third-party application invokes an interface, error 202 is reported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Priority_Setting_Refactoring_006', Level.LEVEL2, async (done:Function) => {
      // 执行测试前，需要在"C:\Users\zwx1494964\AppData\Local\OpenHarmony\Sdk\23\toolchains\lib\UnsgnedReleasedProfileTemplate.json"
      // 修改应用为三方应用，然后通过编译器自动化生成签名
      const testNum = 'Sub_Notification_Ans_Priority_Setting_Refactoring_006';
      let num=0
      try {
        await notificationManager.setPriorityIntelligentEnabled(true).then(() => {
          num++
          hilog.info(0x0000, 'testTag', `${testNum}setPriorityIntelligentEnabled success`);
          expect(num).assertEqual(1)
          done()
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'testTag', `${testNum}setPriorityIntelligentEnabled failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(err.code).assertEqual(202)
            expect(err.message).assertEqual('Not system application to call the interface')
            done();
          }
        });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   Sub_Notification_Ans_Priority_Setting_Refactoring_008
     * @tc.number Sub_Notification_Ans_Priority_Setting_Refactoring_008
     * @tc.desc   [IsPriorityIntelligentEnabled] When a third-party application invokes an interface, error 202 is reported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Priority_Setting_Refactoring_008', Level.LEVEL2, async (done:Function) => {
      // 执行测试前，需要在"C:\Users\zwx1494964\AppData\Local\OpenHarmony\Sdk\23\toolchains\lib\UnsgnedReleasedProfileTemplate.json"
      // 修改应用为三方应用，然后通过编译器自动化生成签名
      const testNum = 'Sub_Notification_Ans_Priority_Setting_Refactoring_008';
      try {
        await notificationManager.isPriorityIntelligentEnabled().then((result: boolean) => {
          hilog.info(0x0000, 'testTag', `${testNum}isPriorityIntelligentEnabled result: ${result}`);
          expect(result).assertEqual(true)
          done()
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'testTag', `${testNum}isPriorityIntelligentEnabled failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(err.code).assertEqual(202)
            expect(err.message).assertEqual('Not system application to call the interface')
            done();
          }
        });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   Sub_Notification_Ans_Priority_Setting_Refactoring_023
     * @tc.number Sub_Notification_Ans_Priority_Setting_Refactoring_023
     * @tc.desc   When the [setPriorityEnabledByBundles] third-party application invokes the interface, error 202 is reported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Priority_Setting_Refactoring_023', Level.LEVEL0, async (done:Function) => {
      // 执行测试前，需要在"C:\Users\zwx1494964\AppData\Local\OpenHarmony\Sdk\23\toolchains\lib\UnsgnedReleasedProfileTemplate.json"
      // 修改应用为三方应用，然后通过编译器自动化生成签名
      const testNum = 'Sub_Notification_Ans_Priority_Setting_Refactoring_023';
      let bundleOne:notificationManager.BundleOption={
        bundle:'com.example.hitsnotificationansprioritysettingrefactoring'
      }
      let num:number=0
      let switches: Map<notificationManager.BundleOption, boolean> = new Map([[bundleOne,true]]);
      try {
        await notificationManager.setPriorityEnabledByBundles(switches).then(() => {
          num++
          hilog.info(0x0000, 'testTag', `${testNum}setPriorityEnabledByBundles success`);
          expect(num).assertEqual(1)
          done()
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'testTag', `${testNum}isPriorityIntelligentEnabled failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(err.code).assertEqual(202)
            expect(err.message).assertEqual('Not system application to call the interface')
            done();
          }
        });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   Sub_Notification_Ans_Priority_Setting_Refactoring_030
     * @tc.number Sub_Notification_Ans_Priority_Setting_Refactoring_030
     * @tc.desc   When the [getPriorityEnabledByBundles] third-party application invokes the interface, error 202 is reported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Priority_Setting_Refactoring_030', Level.LEVEL2, async (done:Function) => {
      // 执行测试前，需要在"C:\Users\zwx1494964\AppData\Local\OpenHarmony\Sdk\23\toolchains\lib\UnsgnedReleasedProfileTemplate.json"
      // 修改应用为三方应用，然后通过编译器自动化生成签名
      const testNum = 'Sub_Notification_Ans_Priority_Setting_Refactoring_030';
      let bundleOne:notificationManager.BundleOption={
        bundle:'com.example.hitsnotificationansprioritysettingrefactoring',
      }
      let num:number=0
      let bundles: Array<notificationManager.BundleOption> = new Array(bundleOne);
      try {
        await notificationManager.getPriorityEnabledByBundles(bundles).then((switches: Map<notificationManager.BundleOption, boolean>) => {
          switches.forEach((value, key) => {
            num++
            hilog.info(0x0000, 'testTag', `${testNum}${num-1}getPriorityEnabledByBundles switches: ${key.bundle} ${key.uid}, ${value}`);
            expect(key.bundle).assertEqual("com.example.hitsnotificationansprioritysettingrefactoring")
            expect(value).assertEqual(true)
            done();
          })
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'testTag', `${testNum}getPriorityEnabledByBundles failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(err.code).assertEqual(202)
            expect(err.message).assertEqual('Not system application to call the interface')
            done();
          }
        });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   Sub_Notification_Ans_Priority_Setting_Refactoring_043
     * @tc.number Sub_Notification_Ans_Priority_Setting_Refactoring_043
     * @tc.desc   When the [setPriorityStrategyByBundles] third-party application invokes the interface, error 202 is reported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Priority_Setting_Refactoring_043', Level.LEVEL2, async (done:Function) =>  {
      // 执行测试前，需要在"C:\Users\zwx1494964\AppData\Local\OpenHarmony\Sdk\23\toolchains\lib\UnsgnedReleasedProfileTemplate.json"
      // 修改应用为三方应用，然后通过编译器自动化生成签名
      const testNum = 'Sub_Notification_Ans_Priority_Setting_Refactoring_043';
      let bundleOne:notificationManager.BundleOption={
        bundle:'com.example.hitsnotificationansprioritysettingrefactoring',
      }
      let num:number=0
      let strategies: Map<notificationManager.BundleOption, number> = new Map([[bundleOne, 30]])
      try {
        await notificationManager.setPriorityStrategyByBundles(strategies).then(() => {
          num++
          hilog.info(0x0000, 'testTag', `${testNum}${num}setPriorityStrategyByBundles success`);
          expect(num).assertEqual(1)
          done()
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'testTag', `${testNum}setPriorityStrategyByBundles failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(err.code).assertEqual(202)
            expect(err.message).assertEqual('Not system application to call the interface')
            done();
          }
        });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   Sub_Notification_Ans_Priority_Setting_Refactoring_050
     * @tc.number Sub_Notification_Ans_Priority_Setting_Refactoring_050
     * @tc.desc   When the [getPriorityStrategyByBundles] third-party application invokes the interface, error 202 is reported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Priority_Setting_Refactoring_050', Level.LEVEL2, async (done:Function) => {
      // 执行测试前，需要在"C:\Users\zwx1494964\AppData\Local\OpenHarmony\Sdk\23\toolchains\lib\UnsgnedReleasedProfileTemplate.json"
      // 修改应用为三方应用，然后通过编译器自动化生成签名
      const testNum = 'Sub_Notification_Ans_Priority_Setting_Refactoring_050';
      let bundleOne:notificationManager.BundleOption={
        bundle:'com.example.hitsnotificationansprioritysettingrefactoring',
      }
      let bundles: Array<notificationManager.BundleOption> = new Array(bundleOne);
      try {
        await notificationManager.getPriorityStrategyByBundles(bundles).then((strategies: Map<notificationManager.BundleOption, number>) => {
          strategies.forEach((value, key) => {
            hilog.info(0x0000, 'testTag', `${testNum}getPriorityStrategyByBundles strategies: ${key.bundle} ${key.uid}, ${value}`);
            expect(key.bundle).assertEqual("com.example.hitsnotificationansprioritysettingrefactoring")
            done();
          })
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'testTag', `${testNum}getPriorityStrategyByBundles failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(err.code).assertEqual(202)
            expect(err.message).assertEqual('Not system application to call the interface')
            done();
          }
        });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
        expect(err.code).assertEqual(202)
        done();
      }
    })

  })
}