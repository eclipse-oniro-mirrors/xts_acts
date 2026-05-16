/*
* Copyright (c) 2021 Huawei Device Co., Ltd.
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
import Utils from './Util.test';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import emitter from '@ohos.events.emitter'
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError, Callback } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import notificationManager from '@ohos.notificationManager';
import notificationSubscribe from '@ohos.notificationSubscribe';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Size,
  TestType
} from '../../../hypium/index'
import { Driver, ON } from '@ohos.UiTest'
import { AppStorage } from '@ohos.arkui.stateManagement'
import commonEventManager from '@ohos.commonEventManager'
import { BusinessError, RecordData } from '@ohos.base';
import hilog from '@ohos.hilog';
import bundleManager from '@ohos.bundle.bundleManager'

const TAG = 'NotificationHits';
const TEST_SUITE_NAME = 'Notification';
let DOMAIN_NUMBER: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let bundleName: string = "com.example.actsnotificationpriorityrefactornosystemtest.static"
let testAbilityContext: common.UIAbilityContext;
let count :int = 0


export default function actsNotificationPriorityRefactorNoSystemTest() {
  describe('actsNotificationPriorityRefactorNoSystemTest', () => {

    beforeAll(async () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'beforeAll start');

      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()

      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b " + bundleName)
      await Utils.msSleep(2000)
      testAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'beforeAll end');

    })

    /**
     * @tc.name   Sub_Notification_Ans_Priority_Setting_Refactoring_static_030
     * @tc.number Sub_Notification_Ans_Priority_Setting_Refactoring_static_030
     * @tc.desc   test getPriorityEnabledByBundles function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Priority_Setting_Refactoring_static_030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let TAG: string = "Sub_Notification_Ans_Priority_Setting_Refactoring_static_030"
        const bundleOption: notificationManager.BundleOption = { bundle: 'bundleName' };
        let bundles: Array<notificationManager.BundleOption> = [bundleOption];
        console.info(TAG + `getPriorityEnabledByBundles start`);
        try {
          notificationManager.getPriorityEnabledByBundles(bundles)
            .then((switches: Map<notificationManager.BundleOption, boolean>) => {
              console.info(TAG + `getPriorityEnabledByBundles success switches: ${JSON.stringify(switches)}`);
              expect(false).assertTrue()
              done()
            })
            .catch((err: Error): void => {
              console.error(TAG + `getPriorityEnabledByBundles failed, code is ${err.code}, message is ${err.message}`);
              if (err.code == 801) {
                expect(err.code).assertEqual(801);
                done()
              } else {
                expect(err.code).assertEqual(202);
                done()
              }
            });
        }catch(err){
          console.error(TAG + `getPriorityEnabledByBundles trycatch failed, err is ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801);
            done()
          } else {
            expect(false).assertTrue()
            done()
          }
        }
      })

    /**
     * @tc.name   Sub_Notification_Ans_Priority_Setting_Refactoring_static_050
     * @tc.number Sub_Notification_Ans_Priority_Setting_Refactoring_static_050
     * @tc.desc   test getPriorityStrategyByBundles function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Priority_Setting_Refactoring_static_050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let TAG: string = "Sub_Notification_Ans_Priority_Setting_Refactoring_static_050"
        const bundleOption: notificationManager.BundleOption = { bundle: bundleName };
        let bundles: Array<notificationManager.BundleOption> = [bundleOption];
        console.info(TAG + `getPriorityStrategyByBundles start`);
        try{
          notificationManager.getPriorityStrategyByBundles(bundles).then((strategies: Map<notificationManager.BundleOption, long>) => {
            console.info(TAG + `getPriorityStrategyByBundles success strategies: ${JSON.stringify(strategies)}`);
            expect(false).assertTrue()
            done()
          }).catch((err: Error) :void=> {
            console.info(TAG + `getPriorityStrategyByBundles failed, code is ${err.code}, message is ${err.message}`);
            if (err.code == 801) {
              expect(err.code).assertEqual(801);
              done()
            } else {
              expect(err.code).assertEqual(202);
              done()
            }
          });
        }catch(err){
          console.error(TAG + `getPriorityStrategyByBundles trycatch failed, err is ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801);
            done()
          } else {
            expect(false).assertTrue()
            done()
          }
        }
        
      })

    /**
     * @tc.name   Sub_Notification_Ans_Priority_Setting_Refactoring_static_008
     * @tc.number Sub_Notification_Ans_Priority_Setting_Refactoring_static_008
     * @tc.desc   test isPriorityIntelligentEnabled function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Priority_Setting_Refactoring_static_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let TAG: string = "Sub_Notification_Ans_Priority_Setting_Refactoring_static_008"
        try{
          notificationManager.isPriorityIntelligentEnabled().then((result: boolean) => {
            console.info(TAG + `isPriorityIntelligentEnabled result: ${result}`);
            expect(false).assertTrue()
            done()
          }).catch((err: Error):void => {
            console.info(TAG + `isPriorityIntelligentEnabled failed, code is ${err.code}, message is ${err.message}`);
            if (err.code == 801) {
              expect(err.code).assertEqual(801);
              done()
            } else {
              expect(err.code).assertEqual(202);
              done()
            }
          });
        }catch(err){
          console.error(TAG + `isPriorityIntelligentEnabled trycatch failed, err is ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801);
            done()
          } else {
            expect(false).assertTrue()
            done()
          }
        }
      })

    /**
     * @tc.name   Sub_Notification_Ans_Priority_Setting_Refactoring_static_023
     * @tc.number Sub_Notification_Ans_Priority_Setting_Refactoring_static_023
     * @tc.desc   test setPriorityEnabledByBundles function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Priority_Setting_Refactoring_static_023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let TAG: string = "Sub_Notification_Ans_Priority_Setting_Refactoring_static_023"
        const bundleOption: notificationManager.BundleOption = { bundle: bundleName };
        let switches: Map<notificationManager.BundleOption, boolean> = new Map<notificationManager.BundleOption, boolean>([[bundleOption, false]]);
        try{
          notificationManager.setPriorityEnabledByBundles(switches).then(() => {
            console.info(TAG + `setPriorityEnabledByBundles success`);
            expect(false).assertTrue()
            done()
          }).catch((err: Error) :void=> {
            console.info(TAG + `setPriorityEnabledByBundles failed, code is ${err.code}, message is ${err.message}`);
            if (err.code == 801) {
              expect(err.code).assertEqual(801);
              done()
            } else {
              expect(err.code).assertEqual(202);
              done()
            }
          });
        }catch(err){
          console.error(TAG + `setPriorityEnabledByBundles trycatch failed, err is ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801);
            done()
          } else {
            expect(false).assertTrue()
            done()
          }
        }
      })

    /**
     * @tc.name   Sub_Notification_Ans_Priority_Setting_Refactoring_static_006
     * @tc.number Sub_Notification_Ans_Priority_Setting_Refactoring_static_006
     * @tc.desc   test setPriorityIntelligentEnabled function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Priority_Setting_Refactoring_static_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let TAG: string = "Sub_Notification_Ans_Priority_Setting_Refactoring_static_006"
        try{
          notificationManager.setPriorityIntelligentEnabled(false).then(() => {
            console.info(TAG + `setPriorityIntelligentEnabled success`);
            expect(false).assertTrue()
            done()
          }).catch((err: Error) :void=> {
            console.info(TAG + `setPriorityIntelligentEnabled failed, code is ${err.code}, message is ${err.message}`);
            if (err.code == 801) {
              expect(err.code).assertEqual(801);
              done()
            } else {
              expect(err.code).assertEqual(202);
              done()
            }
          });
        }catch(err){
          console.error(TAG + `setPriorityIntelligentEnabled trycatch failed, err is ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801);
            done()
          } else {
            expect(false).assertTrue()
            done()
          }
        }
      })

    /**
     * @tc.name   Sub_Notification_Ans_Priority_Setting_Refactoring_static_043
     * @tc.number Sub_Notification_Ans_Priority_Setting_Refactoring_static_043
     * @tc.desc   test setPriorityStrategyByBundles function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Priority_Setting_Refactoring_static_043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let TAG: string = "Sub_Notification_Ans_Priority_Setting_Refactoring_static_043"
        const bundleOption: notificationManager.BundleOption = { bundle: bundleName };
        let strategies: Map<notificationManager.BundleOption, long> =
          new Map<notificationManager.BundleOption, long>([[bundleOption, notificationManager.PriorityStrategyStatus.STATUS_INTELLIGENT | notificationManager.PriorityStrategyStatus.STATUS_USER_DEFINED ]]);
        try{
          notificationManager.setPriorityStrategyByBundles(strategies).then(() => {
            console.info(TAG + `setPriorityStrategyByBundles success`);
            expect(false).assertTrue()
            done()
          }).catch((err: Error) :void=> {
            console.info(TAG + `setPriorityStrategyByBundles failed, code is ${err.code}, message is ${err.message}`);
            if (err.code == 801) {
              expect(err.code).assertEqual(801);
              done()
            } else {
              expect(err.code).assertEqual(202);
              done()
            }
          });
        }catch(err){
          console.error(TAG + `setPriorityStrategyByBundles trycatch failed, err is ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801);
            done()
          } else {
            expect(false).assertTrue()
            done()
          }
        }
      })
  })
}
