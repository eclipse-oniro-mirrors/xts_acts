/**
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import { systemParameterEnhance} from '@kit.BasicServicesKit';
import { commonEventManager } from '@kit.BasicServicesKit';
import base from '@ohos.base';
import { common, sendableContextManager } from '@kit.AbilityKit';
import { wantAgent, Want } from '@kit.AbilityKit';
import type { WantAgent } from '@kit.AbilityKit';
import { router } from '@kit.ArkUI';

let ACTS_EVENT: commonEventManager.CommonEventSubscribeInfo = {
  events: ['ACTS_TEST_OPENLINK', 'ACTS_TEST_DESTROY']
};
let subscriber: commonEventManager.CommonEventSubscriber;
let context = getContext(this) as common.UIAbilityContext;
let wantAgentData: WantAgent;
let mpEnable="";
function publishCB(err: BusinessError) {
  if (err) {
    console.error(`Failed to publish common event. Code is ${err.code}, message is ${err.message}`);
  } else {
    console.info('====>publish ACTS_TEST_OPENLINK');
    console.info(`Succeeded in publishing common event.`);
  }
}

export default function sendableContextManagerTest() {
  describe('sendableContextManagerTest', () => {

    beforeAll(() => {
      context = globalThis.context;
      try {
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable', 'false');
      } catch(err) {
        console.info(`MoveAbilityToBackground Get system parameter error: ${JSON.stringify(err)}`);
      }
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /*
     * @tc.number : SUB_ChildProcessManager_sendableContextManager_0200
     * @tc.name   : call startChildProcess to create a child process
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 3
     */
    it('SUB_ChildProcessManager_sendableContextManager_0200', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_ChildProcessManager_sendableContextManager_0200`;
      let moduleContext: common.Context;
      try {
        moduleContext = context.createModuleContext(undefined);
      } catch (error) {
        console.error(`createModuleContext failed, error.code: ${(error as BusinessError).code}, error.message: ${(error as BusinessError).message}`);
        expect(error.code).assertEqual(401)
        done();
      }
    })

    /*
     * @tc.number : SUB_ChildProcessManager_sendableContextManager_0300
     * @tc.name   : getGroupDir callback
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_ChildProcessManager_sendableContextManager_0300', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_ChildProcessManager_sendableContextManager_0300`;
      try {
        context.getGroupDir(undefined, (err, data) => {
          if (err) {
            console.error(`${tag} getGroupDir faile, err: ${JSON.stringify(err)}`);
            expect(err.code).assertEqual(401)
            done();
          } else {
            console.log(`${tag} getGroupDir result is: ${JSON.stringify(data)}`);
          }
        })
      } catch (error) {
        console.error(`${tag} createModuleContext failed, error.code: ${(error as BusinessError).code}, error.message: ${(error as BusinessError).message}`);
        expect(error.code).assertEqual(401)
        done();
      }
    })

    /*
     * @tc.number : SUB_ChildProcessManager_sendableContextManager_0400
     * @tc.name   : getGroupDir promise with undefined
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_ChildProcessManager_sendableContextManager_0400', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_ChildProcessManager_sendableContextManager_0400`;
      try {
        context.getGroupDir(undefined).then(data => {
          console.log(`${tag} getGroupDir result:` + data);
        })
          .catch((error : BusinessError)=>{
            console.error(`${tag} createModuleContext failed, error.code: ${(error as BusinessError).code}, error.message: ${(error as BusinessError).message}`);
            expect(error.code).assertEqual(401)
            done();
          })
      } catch (error) {
        console.error(`${tag} createModuleContext failed, error.code: ${(error as BusinessError).code}, error.message: ${(error as BusinessError).message}`);
        expect(error.code).assertEqual(401)
        done();
      }
    })

    /*
     * @tc.number : SUB_ChildProcessManager_sendableContextManager_0500
     * @tc.name   : createAreaModeContext with undefined
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_ChildProcessManager_sendableContextManager_0500', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_ChildProcessManager_sendableContextManager_0500`;
      let moduleContext: common.Context;
      try {
        moduleContext = context.createAreaModeContext(undefined)
      } catch (error) {
        console.error(`${tag} createModuleContext failed, error.code: ${(error as BusinessError).code}, error.message: ${(error as BusinessError).message}`);
        expect(error.code).assertEqual(401)
        done();
      }
    })

    /*
     * @tc.number : SUB_ChildProcessManager_sendableContextManager_0700
     * @tc.name   : restartApp with undefined
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_ChildProcessManager_sendableContextManager_0700', Level.LEVEL0, (done: Function) => {
      let tag:string = `SUB_ChildProcessManager_sendableContextManager_0700`;
      let applicationContext = context.getApplicationContext();
      try {
        applicationContext.restartApp(undefined);
      } catch (error) {
        console.error(`${tag} restartApp fail, error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /*
     * @tc.number : SUB_ChildProcessManager_sendableContextManager_0800
     * @tc.name   : restartApp in background
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_ChildProcessManager_sendableContextManager_0800', Level.LEVEL0, (done:Function) => {
      let tag:string = `SUB_ChildProcessManager_sendableContextManager_0800`;
      if (mpEnable === 'true') {
        let link:string = 'https://www.applicationContext02.com'
        let want: Want = {
          bundleName:"com.test.actsabilityerrcodequerytest",
          abilityName:"applicationContext02",
          parameters: {
            appLinkingOnly: false,
            demo_num: 111
          }
        }
        commonEventManager.createSubscriber(ACTS_EVENT)
          .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
            subscriber = commonEventSubscriber;
            let unSubscribeCallback = () => {
              setTimeout(async () => {
                console.info(`====>${tag} unSubscribeCallback`);
                done();
              }, 600);
            }
          let subscribeCallBack = (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("OpenLink subscribeCallBack success")
            if (data.event == 'ACTS_TEST_OPENLINK') {
              context.startAbility(want, (err: BusinessError) => {
                console.info('context.startAbility applicationContext02 succeed');
              })
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_OPENLINK', publishCB);
          }, 100)
        })
      }else if(mpEnable === 'false') {
        console.info(`${tag} error, current device not support MoveAbilityToBackground,please check: ${JSON.stringify(mpEnable)}`);
        done();
      }else{
        console.info(`${tag} error, current device get MoveAbilityToBackground config fail,please check: ${JSON.stringify(mpEnable)}`);
        expect().assertFail();
        done();
      }
      
    })

    /*
     * @tc.number : SUB_ChildProcessManager_sendableContextManager_0900
     * @tc.name   : restartApp with other want
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_ChildProcessManager_sendableContextManager_0900', Level.LEVEL0, (done: Function) => {
      let tag:string = `SUB_ChildProcessManager_sendableContextManager_0900`;
      let applicationContext = context.getApplicationContext();
      let want: Want = {
        bundleName: 'ohos.example.myapplication',
        abilityName: 'entry'
      };
      try {
        applicationContext.restartApp(want);
      } catch (error) {
        console.error(`${tag} restartApp fail, error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(16000063);
        done();
      }
    })
  })
}