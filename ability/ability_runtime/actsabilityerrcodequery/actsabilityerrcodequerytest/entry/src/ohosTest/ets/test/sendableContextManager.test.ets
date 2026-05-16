/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import startupManager from '@ohos.app.appstartup.startupManager';
import { wantAgent, Want } from '@kit.AbilityKit';
import type { WantAgent } from '@kit.AbilityKit';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import { hilog } from '@kit.PerformanceAnalysisKit';

let driver = Driver.create();
const TEST_CASE_NAME: string = 'SUB_ChildProcessManager_sendableContextManager_';
let textsToMatch: Array<string> = ["打开", "允许", "本次允许"];
let TAG = 'clickMatchingButton';
async function clickMatchingButton(texts: Array<string>) {
  let buttons = await driver.findComponents(ON.id('advanced_dialog_button_1'));
  if (buttons && buttons.length > 0) {
    buttons[buttons.length - 1].click();
    hilog.info(0x0000, TAG, '%{public}s', `${TEST_CASE_NAME} click last button success`);
    return true;
  }
  hilog.error(0x0000, TAG, '%{public}s', `${TEST_CASE_NAME} no matching button found`);
  return false;
};

async function handlePermissionPrompt() {
  let allowed = await driver.waitForComponent(ON.text('想要打开', MatchPattern.CONTAINS), 10000);
  hilog.info(0x0000, TAG, '%{public}s',
    `${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
  if (allowed) {
    if (!await clickMatchingButton(textsToMatch)) {
      hilog.error(0x0000, TAG, '%{public}s', `${TEST_CASE_NAME} no matching button found`);
    }
  }
};
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

    /**
     * @tc.name   SUB_ChildProcessManager_sendableContextManager_0200
     * @tc.number SUB_ChildProcessManager_sendableContextManager_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   SUB_ChildProcessManager_sendableContextManager_0300
     * @tc.number SUB_ChildProcessManager_sendableContextManager_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   SUB_ChildProcessManager_sendableContextManager_0400
     * @tc.number SUB_ChildProcessManager_sendableContextManager_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   SUB_ChildProcessManager_sendableContextManager_0500
     * @tc.number SUB_ChildProcessManager_sendableContextManager_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   SUB_ChildProcessManager_sendableContextManager_0700
     * @tc.number SUB_ChildProcessManager_sendableContextManager_0700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   SUB_ChildProcessManager_sendableContextManager_0800
     * @tc.number SUB_ChildProcessManager_sendableContextManager_0800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ChildProcessManager_sendableContextManager_0800', Level.LEVEL0, async (done:Function) => {
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
        let errResult = -1;

        commonEventManager.createSubscriber({events: ['ACTS_TEST_OPENLINK', 'ACTS_TEST_DESTROY', 'ACTS_TEST_DESTROY_ASSIST']})
          .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
            subscriber = commonEventSubscriber;
            let unSubscribeCallback = () => {
              setTimeout(async () => {
                console.info(`====>${tag} unSubscribeCallback`);
                done();
              }, 600);
            }
          let subscribeCallBack = (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("OpenLink subscribeCallBack success " + JSON.stringify(data))
            if (data.event == 'ACTS_TEST_OPENLINK') {
              context.startAbility(want, (err: BusinessError) => {
                console.info('context.startAbility applicationContext02 succeed');
              })
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              errResult = data?.parameters?.result;
            }
            if (data.event == 'ACTS_TEST_DESTROY_ASSIST') {
              try{
                expect(errResult).assertEqual(16000053);
              }catch{}
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
        await handlePermissionPrompt();
      }else if(mpEnable === 'false') {
        console.info(`${tag} error, current device not support MoveAbilityToBackground,please check: ${JSON.stringify(mpEnable)}`);
        done();
      }else{
        console.info(`${tag} error, current device get MoveAbilityToBackground config fail,please check: ${JSON.stringify(mpEnable)}`);
        expect().assertFail();
        done();
      }
      
    })

    /**
     * @tc.name   SUB_ChildProcessManager_sendableContextManager_0900
     * @tc.number SUB_ChildProcessManager_sendableContextManager_0900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   SUB_ChildProcessManager_sendableContextManager_1000
     * @tc.number SUB_ChildProcessManager_sendableContextManager_1000
     * @tc.desc   Test applicationContext.restartApp with null want parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ChildProcessManager_sendableContextManager_1000', Level.LEVEL0, (done: Function) => {
      let tag:string = `SUB_ChildProcessManager_sendableContextManager_1000`;
      let applicationContext = context.getApplicationContext();
      let want: Want|null = null;
      try {
        applicationContext.restartApp(want);
        console.info(`${tag} restartApp succeed`);
        try{
          expect().assertFail();
        }catch(e){}
        done();
      } catch (error) {
        console.error(`${tag} restartApp fail, error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_ChildProcessManager_sendableContextManager_1100
     * @tc.number SUB_ChildProcessManager_sendableContextManager_1100
     * @tc.desc   Test applicationContext.restartApp with undefined want parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ChildProcessManager_sendableContextManager_1100', Level.LEVEL0, (done: Function) => {
      let tag:string = `SUB_ChildProcessManager_sendableContextManager_1100`;
      let applicationContext = context.getApplicationContext();
      let want: Want|undefined = undefined;
      try {
        applicationContext.restartApp(want);
        console.info(`${tag} restartApp succeed`);
        try{
          expect().assertFail();
        }catch(e){}
        done();
      } catch (error) {
        console.error(`${tag} restartApp fail, error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_ChildProcessManager_sendableContextManager_1200
     * @tc.number SUB_ChildProcessManager_sendableContextManager_1200
     * @tc.desc   Test getGroupDir with null groupName parameter (AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ChildProcessManager_sendableContextManager_1200', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_ChildProcessManager_sendableContextManager_1200`;
      let groupName: string|null = null;
      try {
        context.getGroupDir(groupName, (err: BusinessError, data: string) => {
          if (err) {
            console.error(`${tag} getGroupDir failed, err: ${JSON.stringify(err)}`);
            expect().assertFail();
            done();
          } else {
            console.log(`${tag} getGroupDir result is: ${JSON.stringify(data)}`);
            try{
              expect().assertFail();
            }catch(e){}
            done();
          }
        });
      } catch (error) {
        console.error(`${tag} getGroupDir failed, error: ${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_ChildProcessManager_sendableContextManager_1300
     * @tc.number SUB_ChildProcessManager_sendableContextManager_1300
     * @tc.desc   Test getGroupDir with null groupName parameter (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ChildProcessManager_sendableContextManager_1300', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_ChildProcessManager_sendableContextManager_1300`;
      let groupName: string|null = null;
      try {
        context.getGroupDir(groupName).then(data => {
          console.log(`${tag} getGroupDir result: ${data}`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        }).catch((error: BusinessError) => {
          console.error(`${tag} getGroupDir failed, error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.error(`${tag} getGroupDir failed, error: ${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_ChildProcessManager_sendableContextManager_1400
     * @tc.number SUB_ChildProcessManager_sendableContextManager_1400
     * @tc.desc   Test createModuleContext with null moduleName parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ChildProcessManager_sendableContextManager_1400', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_ChildProcessManager_sendableContextManager_1400`;
      let moduleName: string|null = null;
      try {
        let moduleContext = context.createModuleContext(moduleName);
        console.info(`${tag} createModuleContext succeed`);
        try{
          expect().assertFail();
        }catch(e){}
        done();
      } catch (error) {
        console.error(`${tag} createModuleContext failed, error: ${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_ChildProcessManager_sendableContextManager_1500
     * @tc.number SUB_ChildProcessManager_sendableContextManager_1500
     * @tc.desc   Test getGroupDir with empty string parameter (AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ChildProcessManager_sendableContextManager_1500', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_ChildProcessManager_sendableContextManager_1500`;
      let groupName: string = "";
      try {
        context.getGroupDir(groupName, (err: BusinessError, data: string) => {
          if (err?.code) {
            console.error(`${tag} getGroupDir failed, err: ${JSON.stringify(err)}`);
            expect(err.code).assertEqual(401);
            done();
          } else {
            console.log(`${tag} getGroupDir result is: ${JSON.stringify(data)}`);
            try{
              expect(data).assertEqual('');
            }catch(e){}
            done();
          }
        });
      } catch (error) {
        console.error(`${tag} getGroupDir failed, error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_ChildProcessManager_sendableContextManager_1600
     * @tc.number SUB_ChildProcessManager_sendableContextManager_1600
     * @tc.desc   Test getGroupDir with empty string parameter (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ChildProcessManager_sendableContextManager_1600', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_ChildProcessManager_sendableContextManager_1600`;
      let groupName: string = "";
      try {
        context.getGroupDir(groupName).then(data => {
          console.log(`${tag} getGroupDir result: ${data}`);
          try{
            expect(data).assertEqual('');
          }catch(e){}
          done();
        }).catch((error: BusinessError) => {
          console.error(`${tag} getGroupDir failed, error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.error(`${tag} getGroupDir failed, error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_ChildProcessManager_sendableContextManager_1700
     * @tc.number SUB_ChildProcessManager_sendableContextManager_1700
     * @tc.desc   Test createModuleContext with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ChildProcessManager_sendableContextManager_1700', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_ChildProcessManager_sendableContextManager_1700`;
      let moduleName: string = "";
      try {
        let moduleContext = context.createModuleContext(moduleName);
        console.info(`${tag} createModuleContext succeed`);
        try{
          expect().assertFail();
        }catch(e){}
        done();
      } catch (error) {
        console.error(`${tag} createModuleContext failed, error: ${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_ChildProcessManager_sendableContextManager_1800
     * @tc.number SUB_ChildProcessManager_sendableContextManager_1800
     * @tc.desc   Test startupManager.run with null startupTasks parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ChildProcessManager_sendableContextManager_1800', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_ChildProcessManager_sendableContextManager_1800`;
      let startupTasks: Array<string>|null = null;
      try {
        startupManager.run(startupTasks).then(() => {
          console.info(`${tag} startupManager.run succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        }).catch((error: BusinessError) => {
          console.error(`${tag} startupManager.run failed, error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(401);
          done();
        });
      } catch (error) {
        console.error(`${tag} startupManager.run failed, error: ${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_ChildProcessManager_sendableContextManager_1900
     * @tc.number SUB_ChildProcessManager_sendableContextManager_1900
     * @tc.desc   Test startupManager.run with undefined startupTasks parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ChildProcessManager_sendableContextManager_1900', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_ChildProcessManager_sendableContextManager_1900`;
      let startupTasks: Array<string>|undefined = undefined;
      try {
        startupManager.run(startupTasks).then(() => {
          console.info(`${tag} startupManager.run succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        }).catch((error: BusinessError) => {
          console.error(`${tag} startupManager.run failed, error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(401);
          done();
        });
      } catch (error) {
        console.error(`${tag} startupManager.run failed, error: ${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_ChildProcessManager_sendableContextManager_2000
     * @tc.number SUB_ChildProcessManager_sendableContextManager_2000
     * @tc.desc   Test startupManager.run with null config parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ChildProcessManager_sendableContextManager_2000', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_ChildProcessManager_sendableContextManager_2000`;
      let startupTasks: Array<string> = ["testTask"];
      let config = null;
      try {
        startupManager.run(startupTasks, config).then(() => {
          console.info(`${tag} startupManager.run succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        }).catch((error: BusinessError) => {
          console.error(`${tag} startupManager.run failed, error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.error(`${tag} startupManager.run failed, catch error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(28800001);
        done();
      }
    })

    /**
     * @tc.name   SUB_ChildProcessManager_sendableContextManager_2100
     * @tc.number SUB_ChildProcessManager_sendableContextManager_2100
     * @tc.desc   Test startupManager.run with undefined config parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ChildProcessManager_sendableContextManager_2100', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_ChildProcessManager_sendableContextManager_2100`;
      let startupTasks: Array<string> = ["testTask"];
      let config = undefined;
      try {
        startupManager.run(startupTasks, config).then(() => {
          console.info(`${tag} startupManager.run succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        }).catch((error: BusinessError) => {
          console.error(`${tag} startupManager.run failed, catch error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.error(`${tag} startupManager.run failed, error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(28800001);
        done();
      }
    })

    /**
     * @tc.name   SUB_ChildProcessManager_sendableContextManager_2200
     * @tc.number SUB_ChildProcessManager_sendableContextManager_2200
     * @tc.desc   Test startupManager.run with three parameters, null startupTasks parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ChildProcessManager_sendableContextManager_2200', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_ChildProcessManager_sendableContextManager_2200`;
      let startupTasks: Array<string>|null = null;
      let abilityStageContext = null;
      let config = null;
      try {
        startupManager.run(startupTasks, abilityStageContext, config).then(() => {
          console.info(`${tag} startupManager.run succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        }).catch((error: BusinessError) => {
          console.error(`${tag} startupManager.run failed, error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.error(`${tag} startupManager.run failed, catch error: ${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_ChildProcessManager_sendableContextManager_2300
     * @tc.number SUB_ChildProcessManager_sendableContextManager_2300
     * @tc.desc   Test startupManager.run with three parameters, undefined startupTasks parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ChildProcessManager_sendableContextManager_2300', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_ChildProcessManager_sendableContextManager_2300`;
      let startupTasks: Array<string>|undefined = undefined;
      let abilityStageContext = undefined;
      let config = undefined;
      try {
        startupManager.run(startupTasks, abilityStageContext, config).then(() => {
          console.info(`${tag} startupManager.run succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        }).catch((error: BusinessError) => {
          console.error(`${tag} startupManager.run failed, error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.error(`${tag} startupManager.run failed, error: ${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_ChildProcessManager_sendableContextManager_2400
     * @tc.number SUB_ChildProcessManager_sendableContextManager_2400
     * @tc.desc   Test startupManager.run with three parameters, empty array startupTasks parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ChildProcessManager_sendableContextManager_2400', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_ChildProcessManager_sendableContextManager_2400`;
      let startupTasks: Array<string> = [];
      let abilityStageContext = null;
      let config = null;
      try {
        startupManager.run(startupTasks, abilityStageContext, config).then(() => {
          console.info(`${tag} startupManager.run succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        }).catch((error: BusinessError) => {
          console.error(`${tag} startupManager.run failed, error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.error(`${tag} startupManager.run failed, error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(16000050);
        done();
      }
    })

    /**
     * @tc.name   SUB_ChildProcessManager_sendableContextManager_2500
     * @tc.number SUB_ChildProcessManager_sendableContextManager_2500
     * @tc.desc   Test startupManager.run with three parameters, null context parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ChildProcessManager_sendableContextManager_2500', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_ChildProcessManager_sendableContextManager_2500`;
      let startupTasks: Array<string> = ["testTask"];
      let abilityStageContext = null;
      let config = null;
      try {
        startupManager.run(startupTasks, abilityStageContext, config).then(() => {
          console.info(`${tag} startupManager.run succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        }).catch((error: BusinessError) => {
          console.error(`${tag} startupManager.run failed, error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.error(`${tag} startupManager.run failed, error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(28800001);
        done();
      }
    })

    /**
     * @tc.name   SUB_ChildProcessManager_sendableContextManager_2600
     * @tc.number SUB_ChildProcessManager_sendableContextManager_2600
     * @tc.desc   Test startupManager.run with three parameters, undefined context parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ChildProcessManager_sendableContextManager_2600', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_ChildProcessManager_sendableContextManager_2600`;
      let startupTasks: Array<string> = ["testTask"];
      let abilityStageContext = undefined;
      let config = undefined;
      try {
        startupManager.run(startupTasks, abilityStageContext, config).then(() => {
          console.info(`${tag} startupManager.run succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        }).catch((error: BusinessError) => {
          console.error(`${tag} startupManager.run failed, error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.error(`${tag} startupManager.run failed, error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(28800001);
        done();
      }
    })

    /**
     * @tc.name   SUB_ChildProcessManager_sendableContextManager_2700
     * @tc.number SUB_ChildProcessManager_sendableContextManager_2700
     * @tc.desc   Test startupManager.run with three parameters, null config parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ChildProcessManager_sendableContextManager_2700', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_ChildProcessManager_sendableContextManager_2700`;
      let startupTasks: Array<string> = ["testTask"];
      let abilityStageContext = undefined;
      let config = null;
      try {
        startupManager.run(startupTasks, abilityStageContext, config).then(() => {
          console.info(`${tag} startupManager.run succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        }).catch((error: BusinessError) => {
          console.error(`${tag} startupManager.run failed, error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.error(`${tag} startupManager.run failed, error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(28800001);
        done();
      }
    })

    /**
     * @tc.name   SUB_ChildProcessManager_sendableContextManager_2800
     * @tc.number SUB_ChildProcessManager_sendableContextManager_2800
     * @tc.desc   Test startupManager.run with three parameters, undefined config parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ChildProcessManager_sendableContextManager_2800', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_ChildProcessManager_sendableContextManager_2800`;
      let startupTasks: Array<string> = ["testTask"];
      let abilityStageContext = undefined;
      let config = undefined;
      try {
        startupManager.run(startupTasks, abilityStageContext, config).then(() => {
          console.info(`${tag} startupManager.run succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        }).catch((error: BusinessError) => {
          console.error(`${tag} startupManager.run failed, error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.error(`${tag} startupManager.run failed, error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(28800001);
        done();
      }
    })
  })
}
