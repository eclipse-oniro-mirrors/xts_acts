/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level, beforeAll, afterEach } from '../../../hypium/index';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import application from '@ohos.app.ability.application';
import Want from '@ohos.app.ability.Want';
import common from '@ohos.app.ability.common';
import CommonEventManager from '@ohos.commonEventManager';
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import { BusinessError, RecordData } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';

const domain: int = 0x0000;
const tag: string = 'StartSpecifiedProcessStaticTest';
const TEST_SUITE_NAME: string = 'StartSpecifiedProcessStaticTest';
let testAbilityContext: common.UIAbilityContext | undefined;
let subscriber: CommonEventManager.CommonEventSubscriber | undefined;
let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

async function startAbility(context: common.UIAbilityContext, want: Want) {
  if (!context) {
    console.info(`${TEST_SUITE_NAME}====>abilityContext is not available in AppStorage====>`);
    expect().assertFail();
  }
  context.startAbility(want)
    .then(() => {
      console.info(`${TEST_SUITE_NAME}====>startAbility success====>`);
      if (want.parameters?.['isPromote'] === true) {
        console.info(`${TEST_SUITE_NAME}====>ispromote true====>`);
      }
    })
    .catch((err: Error): void => {
      expect().assertFail();
      console.info(`${TEST_SUITE_NAME}====>ACTS_startAbility err====> ${err}`);
    })
}

export default function StartSpecifiedProcessStaticTest() {

  describe('StartSpecifiedProcessStaticTest', () => {
    beforeAll(async() => {
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start');
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start1');
      await Utils.msSleep(2000)
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start2');
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.actsspecifiedprocess.static')
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start3');
      await Utils.msSleep(5000)
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll end');
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
    })

    afterEach(async() => {
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.actsspecifiedprocess.static')
      hilog.info(0x0000, tag, '%{public}s', 'EntryAbility start');
      await Utils.msSleep(2000)
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0100
     * @tc.desc   The testcase is for testing promoteCurrentToCandidateMasterProcess failed and errcode is 16000115.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0100';
      console.log("====>in SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0100====>");
      try {
        let commonEventSubscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
          events: ['START_ABILITY_CALLBACK_000']
        }
        let SubscribeCallBack = (err: BusinessError | null, commonEventData: CommonEventManager.CommonEventData | undefined):void => {
          if (err) {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>Failed to subscribe. Code is ${err.code}, message is ${err.message}`);
          }
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> ACTS_startAbility subcribed success 100=====> data: ${JSON.stringify(commonEventData)}`);
          if (commonEventData?.code === 801) {
          } else {
            expect(16000115).assertEqual(commonEventData?.code);
          }
          CommonEventManager.unsubscribe(subscriber!, (err, data) => {
            done();
          });
        }

        CommonEventManager.createSubscriber(commonEventSubscribeInfo)
          .then((data: CommonEventManager.CommonEventSubscriber | null) => {
            subscriber = data as CommonEventManager.CommonEventSubscriber;
            CommonEventManager.subscribe(subscriber!, SubscribeCallBack)
          })
        await Utils.msSleep(1000)
        let want : Want = {
          bundleName: 'com.example.actsspecifiedprocess.static',
          moduleName: 'entry',
          abilityName: 'EntryAbility1',
          parameters:
          {
            'isHead': true,
            'isPromote': true,
            'isDemote': false,
          } as Record<String,RecordData>
        };
        startAbility(testAbilityContext!, want);
        await Utils.msSleep(2000);
      }catch(err){
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0200
     * @tc.desc   The testcase is for testing demoteCurrentFromCandidateMasterProcess failed and errcode is 16000117.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0200';
      console.log("====>in SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0200====>");
      try {
        let commonEventSubscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
          events: ['START_ABILITY_CALLBACK_100']
        }
        let SubscribeCallBack = (err: BusinessError | null, commonEventData: CommonEventManager.CommonEventData | undefined):void => {
          if (err) {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>Failed to subscribe. Code is ${err.code}, message is ${err.message}`);
          }
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> ACTS_startAbility subcribed success 200=====> data: ${JSON.stringify(commonEventData)}`);
          if (commonEventData?.code === 801) {
          } else {
            expect(16000117).assertEqual(commonEventData?.code);
          }
          CommonEventManager.unsubscribe(subscriber!, (err, data) => {
            done();
          });
        }

        await CommonEventManager.createSubscriber(commonEventSubscribeInfo)
          .then((data: CommonEventManager.CommonEventSubscriber | null) => {
            subscriber = data as CommonEventManager.CommonEventSubscriber;
            CommonEventManager.subscribe(subscriber!, SubscribeCallBack)
          })
        let want : Want = {
          bundleName: 'com.example.actsspecifiedprocess.static',
          moduleName: 'entry',
          abilityName: 'EntryAbility2',
          parameters:
          {
            'isHead': false,
            'isPromote': false,
            'isDemote': true,
          } as Record<String,RecordData>
        };
        startAbility(testAbilityContext!, want);
        await Utils.msSleep(2000);
      }catch(err){
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0300
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0300
     * @tc.desc   The testcase is for testing promoteCurrentToCandidateMasterProcess success.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0300';
      console.log("====>in SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0300====>");
      try {
        let commonEventSubscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
          events: ['START_ABILITY_CALLBACK_200']
        }
        let SubscribeCallBack = (err: BusinessError | null, commonEventData: CommonEventManager.CommonEventData | undefined):void => {
          if (err) {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>Failed to subscribe. Code is ${err.code}, message is ${err.message}`);
          }
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> ACTS_startAbility  subcribed success 300=====> data: ${JSON.stringify(commonEventData)}`);
          if (commonEventData?.code === 801) {
          } else {
            expect(0).assertEqual(commonEventData?.code);
          }
          CommonEventManager.unsubscribe(subscriber!, (err, data) => {
            done();
          });
        }

        await CommonEventManager.createSubscriber(commonEventSubscribeInfo)
          .then((data: CommonEventManager.CommonEventSubscriber | null) => {
            subscriber = data as CommonEventManager.CommonEventSubscriber;
            CommonEventManager.subscribe(subscriber!, SubscribeCallBack)
          })
        let want : Want = {
          bundleName: 'com.example.actsspecifiedprocess.static',
          moduleName: 'entry',
          abilityName: 'EntryAbility3',
          parameters:
          {
            'isHead': true,
            'isPromote': true,
            'isDemote': false,
          } as Record<String,RecordData>
        };
        startAbility(testAbilityContext!, want);
        await Utils.msSleep(2000);
      }catch(err){
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0400
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0400
     * @tc.desc   The testcase is for testing demoteCurrentFromCandidateMasterProcess falied and errcode is 16000116.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0400';
      console.log("====>in SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0400====>");
      try {
        let commonEventSubscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
          events: ['START_ABILITY_CALLBACK_300']
        }
        let SubscribeCallBack = (err: BusinessError | null, commonEventData: CommonEventManager.CommonEventData | undefined):void => {
          if (err) {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>Failed to subscribe. Code is ${err.code}, message is ${err.message}`);
          }
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> ACTS_startAbility  subcribed success 400=====> data: ${JSON.stringify(commonEventData)}`);
          if (commonEventData?.code === 801) {
          } else {
            expect(16000116).assertEqual(commonEventData?.code);
          }
          CommonEventManager.unsubscribe(subscriber!, (err, data) => {
            done();
          });
        }

        await CommonEventManager.createSubscriber(commonEventSubscribeInfo)
          .then((data: CommonEventManager.CommonEventSubscriber | null) => {
            subscriber = data as CommonEventManager.CommonEventSubscriber;
            CommonEventManager.subscribe(subscriber!, SubscribeCallBack)
          })
        let want : Want = {
          bundleName: 'com.example.actsspecifiedprocess.static',
          moduleName: 'entry',
          abilityName: 'EntryAbility4',
          parameters:
          {
            'isHead': false,
            'isPromote': false,
            'isDemote': true,
          } as Record<String,RecordData>
        };
        startAbility(testAbilityContext!, want);
        await Utils.msSleep(2000);
      }catch(err){
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0500
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0500
     * @tc.desc   The testcase is for testing exitMasterProcessRole falied and errcode is 16000118.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0500';
      console.log("====>in SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0500====>");
      try {
        let commonEventSubscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
          events: ['START_ABILITY_CALLBACK_200']
        }
        let SubscribeCallBack = (err: BusinessError | null, commonEventData: CommonEventManager.CommonEventData | undefined):void => {
          if (err) {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>Failed to subscribe. Code is ${err.code}, message is ${err.message}`);
          }
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> ACTS_startAbility  subcribed success 400=====> data: ${JSON.stringify(commonEventData)}`);
          if (commonEventData?.code === 801) {
          } else {
            expect(16000118).assertEqual(commonEventData?.code);
          }
          CommonEventManager.unsubscribe(subscriber!, (err, data) => {
            done();
          });
        }

        await CommonEventManager.createSubscriber(commonEventSubscribeInfo)
          .then((data: CommonEventManager.CommonEventSubscriber | null) => {
            subscriber = data as CommonEventManager.CommonEventSubscriber;
            CommonEventManager.subscribe(subscriber!, SubscribeCallBack)
          })
        let want : Want = {
          bundleName: 'com.example.actsspecifiedprocess.static',
          moduleName: 'entry',
          abilityName: 'EntryAbility3',
          parameters:
          {
            'isHead': false,
            'isPromote': false,
            'isDemote': false,
            'isExit': true,
          } as Record<String,RecordData>
        };
        startAbility(testAbilityContext!, want);
        await Utils.msSleep(2000);
      }catch(err){
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0600
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0600
     * @tc.desc   The testcase is for testing exitMasterProcessRole falied and errcode is 16000119.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0600';
      console.log("====>in SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_Static_0600====>");
      try {
        let commonEventSubscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
          events: ['START_ABILITY_CALLBACK_400']
        }
        let SubscribeCallBack = (err: BusinessError | null, commonEventData: CommonEventManager.CommonEventData | undefined):void => {
          if (err) {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>Failed to subscribe. Code is ${err.code}, message is ${err.message}`);
          }
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> ACTS_startAbility  subcribed success 400=====> data: ${JSON.stringify(commonEventData)}`);
          if (commonEventData?.code === 801) {
          } else {
            expect(16000119).assertEqual(commonEventData?.code);
          }
          CommonEventManager.unsubscribe(subscriber!, (err, data) => {
            done();
          });
        }

        await CommonEventManager.createSubscriber(commonEventSubscribeInfo)
          .then((data: CommonEventManager.CommonEventSubscriber | null) => {
            subscriber = data as CommonEventManager.CommonEventSubscriber;
            CommonEventManager.subscribe(subscriber!, SubscribeCallBack)
          })
        let want : Want = {
          bundleName: 'com.example.actsspecifiedprocess.static',
          moduleName: 'entry',
          abilityName: 'EntryAbility3',
          parameters:
          {
            'isHead': false,
            'isPromote': false,
            'isDemote': false,
            'isExit': false,
            'isOnNewProcessRequest': true,
          } as Record<String,RecordData>
        };
        startAbility(testAbilityContext!, want);
        await Utils.msSleep(2000);
      }catch(err){
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> err: ${err}`)
        expect().assertFail()
        done()
      }
    })
  })
}