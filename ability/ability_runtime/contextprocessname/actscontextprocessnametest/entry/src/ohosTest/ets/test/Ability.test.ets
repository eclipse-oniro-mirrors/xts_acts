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

import { describe, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { application, common, Want } from '@kit.AbilityKit';
import { Driver, ON} from '@ohos.UiTest';

export default function ActsContextProcessNameTest() {
  const PROCESS_NAME = 'com.acts.contextprocessname'
  const OTHER_BUNDLE_NAME = 'com.acts.contextprocessnameassist'
  describe('ActsContextProcessNameTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number : SUB_Ability_AbilityRuntime_processName_0100
     * @tc.name : SUB_Ability_AbilityRuntime_processName_0100
     * @tc.desc : UIAbilityContext calls the processName property
     * @tc.level: Level 2
     * @tc.type : Function
     * @tc.size : MediumTest
     */
    it('SUB_Ability_AbilityRuntime_processName_0100', Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_Ability_Ability_Runtime_processName_0100'
      console.log(`[${caseName}]: start`)
      try {
        let uiAbilityContext = AppStorage.get('uiAbilityContext') as common.UIAbilityContext;
        expect(uiAbilityContext.processName).assertEqual(PROCESS_NAME)
        done();
      } catch (err) {
        let e = err as BusinessError;
        console.error(`[${caseName}]: ` + e.code + e.message);
        expect().assertFail();
        done();
      }
      console.log(`[${caseName}]: end`)
    });

    /**
     * @tc.number : SUB_Ability_AbilityRuntime_processName_0200
     * @tc.name : SUB_Ability_AbilityRuntime_processName_0200
     * @tc.desc : applicationContext obtained by context calls the processName property
     * @tc.level: Level 2
     * @tc.type : Function
     * @tc.size : MediumTest
     */
    it('SUB_Ability_AbilityRuntime_processName_0200', Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_Ability_Ability_Runtime_processName_0200'
      console.log(`[${caseName}] create`)
      try {
        let uiAbilityContext = AppStorage.get('uiAbilityContext') as common.UIAbilityContext;
        let applicationContext = uiAbilityContext.getApplicationContext();
        expect(applicationContext.processName).assertEqual(PROCESS_NAME)
        done();
      } catch (err) {
        let e = err as BusinessError;
        console.error(`[${caseName}]: ` + e.code + e.message);
        expect().assertFail();
        done();
      }
      console.log(`[${caseName}]: end`)
    });

    /**
     * @tc.number : SUB_Ability_AbilityRuntime_processName_0300
     * @tc.name : SUB_Ability_AbilityRuntime_processName_0300
     * @tc.desc : applicationContext obtained by application calls the processName property
     * @tc.level: Level 2
     * @tc.type : Function
     * @tc.size : MediumTest
     */
    it('SUB_Ability_AbilityRuntime_processName_0300', Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_Ability_Ability_Runtime_processName_0300'
      try {
        let applicationContext = application.getApplicationContext();
        expect(applicationContext.processName).assertEqual(PROCESS_NAME)
        done();
      } catch (err) {
        let e = err as BusinessError;
        console.error(`[${caseName}]: ` + e.code + e.message);
        expect().assertFail();
        done();
      }
      console.log(`[${caseName}]: end`)
    });

    /**
     * @tc.number : SUB_Ability_AbilityRuntime_processName_0400
     * @tc.name : SUB_Ability_AbilityRuntime_processName_0400
     * @tc.desc : abilityStage calls the processName property
     * @tc.level: Level 2
     * @tc.type : Function
     * @tc.size : MediumTest
     */
    it('SUB_Ability_AbilityRuntime_processName_0400', Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_Ability_Ability_Runtime_processName_0400'
      console.log(`[${caseName}] create`)
      try {
        let abilityStageContext = AppStorage.get('abilityStageContext') as common.AbilityStageContext;
        expect(abilityStageContext.processName).assertEqual(PROCESS_NAME)
        done();
      } catch (err) {
        let e = err as BusinessError;
        console.error(`[${caseName}]: ` + e.code + e.message);
        expect().assertFail();
        done();
      }
      console.log(`[${caseName}]: end`)
    });

    /**
     * @tc.number : SUB_Ability_AbilityRuntime_processName_1500
     * @tc.name : SUB_Ability_AbilityRuntime_processName_1500
     * @tc.desc : startAbility to start another application process , get processName
     * @tc.level: Level 3
     * @tc.type : Function
     * @tc.size : MediumTest
     */
    it('SUB_Ability_AbilityRuntime_processName_1500', Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_processName_1500'
      let driver = Driver.create()
      console.log(`[${caseName}] create`)
      try {
        let uiAbilityContext = AppStorage.get('uiAbilityContext') as common.UIAbilityContext;
        let want: Want = {
          deviceId: '',
          bundleName: OTHER_BUNDLE_NAME,
          moduleName: 'entry',
          abilityName: 'EntryAbility'
        }
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['StartAbilityProcessName']
        }
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscribe) => {
          console.log(`[${caseName}] createSubscriber`)
          commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
            console.log(`[${caseName}] subscribe` + commonEventData.event + '： ' + commonEventData.parameters?.data)
            if (commonEventData.event == 'StartAbilityProcessName') {
              expect(OTHER_BUNDLE_NAME).assertEqual(commonEventData.parameters?.data);
              commonEventManager.unsubscribe(subscribe);
              done();
            }
          })
        })
        await uiAbilityContext.startAbility(want)
        await driver.delayMs(2000);
        let button = await driver.findComponent(ON.text('允许'));
        await button?.click();
      } catch (err) {
        let e = err as BusinessError;
        console.error(`[${caseName}]: ` + e.code + e.message);
        expect().assertFail();
        done();
      }
      console.log(`[${caseName}]: end`)
    });

    /**
     * @tc.number : SUB_Ability_AbilityRuntime_processName_3200
     * @tc.name : SUB_Ability_AbilityRuntime_processName_3200
     * @tc.desc : createModeAreaContext obtain processName
     * @tc.level: Level 3
     * @tc.type : Function
     * @tc.size : MediumTest
     */
    it('SUB_Ability_AbilityRuntime_processName_3200', Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_Ability_Ability_Runtime_processName_3200'
      console.log(`[${caseName}] create`)
      try {
        let uiAbilityContext = AppStorage.get('uiAbilityContext') as common.UIAbilityContext;
        let processName1 = uiAbilityContext.createAreaModeContext(1).processName;
        let processName2 = uiAbilityContext.createAreaModeContext(2).processName;
        let processName3 = uiAbilityContext.createAreaModeContext(3).processName;
        let processName4 = uiAbilityContext.createAreaModeContext(4).processName;
        let processName5 = uiAbilityContext.createAreaModeContext(5).processName;
        expect(processName1).assertEqual(PROCESS_NAME)
        expect(processName2).assertEqual(PROCESS_NAME)
        expect(processName3).assertEqual(PROCESS_NAME)
        expect(processName4).assertEqual(PROCESS_NAME)
        expect(processName5).assertEqual(PROCESS_NAME)
        done();
      } catch (err) {
        let e = err as BusinessError;
        console.error(`[${caseName}]: ` + e.code + e.message);
        expect().assertFail();
        done();
      }
      console.log(`[${caseName}]: end`)
    });

  })
}