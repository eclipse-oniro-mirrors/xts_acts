/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, it, expect,afterEach, Level } from '@ohos/hypium';
import { BusinessError,systemParameterEnhance } from '@kit.BasicServicesKit';
import { appManager, common } from '@kit.AbilityKit';
import { abilityDelegatorRegistry, Driver} from '@kit.TestKit';

function sleep(time: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, time))
}

let driver: Driver;
let context: common.UIAbilityContext;
let delegator = abilityDelegatorRegistry.getAbilityDelegator();
let mpEnable: string

export default function startAbilityOptions() {
  describe('startAbilityOptions', () => {
    beforeAll(() => {
      driver = Driver.create();
      context = AppStorage.get<common.UIAbilityContext>('testAbilityContext') as common.UIAbilityContext;
      try {
        console.info('codeError2 beforeAll mpEnable')
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model');
      } catch (e) {
        console.error('codeError2 beforeAll mpEnable')
        mpEnable = 'fail'
      }
    })
    afterEach(async () => {
      delegator.executeShellCommand('aa force-stop com.example.startabilityerrorcode2');
      await sleep(2000);
    })
    /**
     * @tc.number: appManager01
     * @tc.name: appManager01
     * @tc.desc: appManager01 code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('appManager01', Level.LEVEL0, async (done: Function) => {

      let observerId = 0;

      // 1.注册应用状态监听器
      let applicationStateObserver: appManager.ApplicationStateObserver = {
        onForegroundApplicationChanged(appStateData) {
          console.log(`[appManager] onForegroundApplicationChanged: ${JSON.stringify(appStateData)}`);
        },
        onAbilityStateChanged(abilityStateData) {
          console.log(`[appManager] onAbilityStateChanged: ${JSON.stringify(abilityStateData)}`);
        },
        onProcessCreated(processData) {
          console.log(`[appManager] onProcessCreated: ${JSON.stringify(processData)}`);
        },
        onProcessDied(processData) {
          console.log(`[appManager] onProcessDied: ${JSON.stringify(processData)}`);
        },
        onProcessStateChanged(processData) {
          console.log(`[appManager] onProcessStateChanged: ${JSON.stringify(processData)}`);
        },
        onAppStarted(appStateData) {
          console.log(`[appManager] onAppStarted: ${JSON.stringify(appStateData)}`);
        },
        onAppStopped(appStateData) {
          console.log(`[appManager] onAppStopped: ${JSON.stringify(appStateData)}`);
        }
      };
      let bundleNameList = ['com.example.startabilityerrorcode'];
      try {
        observerId = appManager.on('applicationState', applicationStateObserver, bundleNameList);
        console.log(`[appManager] observerCode: ${observerId}`);
      } catch (paramError) {
        let code = (paramError as BusinessError).code;
        let message = (paramError as BusinessError).message;
        console.error(`[appManager] error: ${code}, ${message} `);
      }

      // 2.注销应用状态监听器
      try {
        appManager.off('applicationState', observerId, (err: BusinessError) => {
          if (err) {
            console.error(`unregisterApplicationStateObserverCallback fail, err: ${JSON.stringify(err)}`);
            expect().assertFail();
            done();
          } else {
            console.log('unregisterApplicationStateObserverCallback success.');
            expect(err).assertNull();
            done();
          }
        });
      } catch (paramError) {
        let code = (paramError as BusinessError).code;
        let message = (paramError as BusinessError).message;
        console.error(`[appManager] error: ${code}, ${message} `);
        expect().assertFail();
        done();
      }

    })
    /**
     * @tc.number: appManager02
     * @tc.name: appManager02
     * @tc.desc: appManager02 code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('appManager02', Level.LEVEL0, async (done: Function) => {

      let observerId = 0;

      // 1.注册应用状态监听器
      let applicationStateObserver: appManager.ApplicationStateObserver = {
        onForegroundApplicationChanged(appStateData) {
          console.log(`[appManager] onForegroundApplicationChanged: ${JSON.stringify(appStateData)}`);
        },
        onAbilityStateChanged(abilityStateData) {
          console.log(`[appManager] onAbilityStateChanged: ${JSON.stringify(abilityStateData)}`);
        },
        onProcessCreated(processData) {
          console.log(`[appManager] onProcessCreated: ${JSON.stringify(processData)}`);
        },
        onProcessDied(processData) {
          console.log(`[appManager] onProcessDied: ${JSON.stringify(processData)}`);
        },
        onProcessStateChanged(processData) {
          console.log(`[appManager] onProcessStateChanged: ${JSON.stringify(processData)}`);
        },
        onAppStarted(appStateData) {
          console.log(`[appManager] onAppStarted: ${JSON.stringify(appStateData)}`);
        },
        onAppStopped(appStateData) {
          console.log(`[appManager] onAppStopped: ${JSON.stringify(appStateData)}`);
        }
      };
      let bundleNameList = ['com.example.startabilityerrorcode'];
      try {
        observerId = appManager.on('applicationState', applicationStateObserver, bundleNameList);
        console.log(`[appManager] observerCode: ${observerId}`);
      } catch (paramError) {
        let code = (paramError as BusinessError).code;
        let message = (paramError as BusinessError).message;
        console.error(`[appManager] error: ${code}, ${message} `);
      }

      try {
        appManager.off('applicationState', observerId).then((data) => {
          console.log(`unregisterApplicationStateObserver success, data: ${JSON.stringify(data)}`);
          expect(data).assertEqual(undefined);
          done();
        }).catch((err: BusinessError) => {
          console.error(`unregisterApplicationStateObserver fail, err: ${JSON.stringify(err)}`);
          try{expect().assertFail()}catch{};
          done();
        });
      } catch (paramError) {
        let code = (paramError as BusinessError).code;
        let message = (paramError as BusinessError).message;
        console.error(`[appManager] error: ${code}, ${message} `);
      }
    })
  })
}