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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
// 加载js测试框架
import { common, sendableContextManager, StartOptions, WantAgent, wantAgent ,wantConstant,contextConstant,startupManager,
  Want} from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError ,systemParameterEnhance } from '@kit.BasicServicesKit';
import { rpc } from '@kit.IPCKit';
import Utils from './Utils';
import { commonEventManager } from '@kit.BasicServicesKit';
import { fileUri } from '@kit.CoreFileKit';
import {Driver,ON, Component} from '@ohos.UiTest'

let sub:commonEventManager.CommonEventSubscriber;
export default function errorCodeTest() {
  describe('errorCodeTest', () => {
    let TAG = 'errorCodeTest ===>';
    let mpEnable: string;
    let mpExtensionEnable: string;
    beforeAll(()=> {
      try {
        mpEnable = systemParameterEnhance.getSync('const.abilityms.support_multi_instance');
        mpExtensionEnable = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model');
        console.info('errorCodeTest Get system parameter info: ' + mpEnable);
      } catch (err) {
        console.error(`errorCodeTest Get system parameter error: ${JSON.stringify(err)}`);
        mpEnable = 'fail';
        mpExtensionEnable = 'fail';
      }
    })

    afterEach( async ()=> {
       await Utils.sleep(1800)
       let driver = await Driver.create();
       let text1:Component = await driver.findComponent(ON.text('暂无可用打开方式'));
       if (text1 != null || text1 != undefined) {
         // close the system dialog
          await driver.triggerKey(2070);
          await Utils.sleep(500)
       }
        console.info("errorCodeTest after");

    })
    /*
     * @tc.number : SUB_Ability_AbilityBase_ErrorCode_0001
     * @tc.name   : SUB_Ability_AbilityBase_ErrorCode_0001
     * @tc.desc   : To verify the errcode 16000001 when The specified ability does not exist
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_ErrorCode_0001', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_ErrorCode_0001 start');

      let want: Want = {
        bundleName: 'com.acts.ability.errcode',
        abilityName: 'xxx'
      };

      let options: StartOptions = {
        displayId: 0
      };
      // test errcode
      try {
        await AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility(want, options)
          .then(() => {
            console.info(TAG + 'startAbility succeed');
            expect().assertFail();
            done();
          }).catch((err: BusinessError) => {
            // 处理业务逻辑错误
            console.error(TAG + `startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000001);
            done();
          });

      } catch(err) {
        // 处理入参错误异常
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(TAG + `startAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityBase_ErrorCode_0002
     * @tc.name   : SUB_Ability_AbilityBase_ErrorCode_0002
     * @tc.desc   : To verify the errcode 16000071 when The App clone is not supported.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
    */
    it('SUB_Ability_AbilityBase_ErrorCode_0002', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_ErrorCode_0002 start');
      // test errcode
      try {
        let appCloneIndex = AppStorage.get<common.ApplicationContext>("ApplicationContext")!.getApplicationContext().getCurrentAppCloneIndex();
        console.info("the app clone is " + appCloneIndex);
        expect().assertFail();
        done();
      } catch(err) {
        // 处理入参错误异常
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(TAG + `startAbility failed, code is ${code}, message is ${message}`);
        expect(err.code).assertEqual(16000071)
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityBase_ErrorCode_0003
     * @tc.name   : SUB_Ability_AbilityBase_ErrorCode_0003
     * @tc.desc   : To verify the errcode 28800001 when The Startup task or its dependency not found.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
    */
    it('SUB_Ability_AbilityBase_ErrorCode_0003', Level.LEVEL0, async (done: Function)=> {
      console.info('SUB_Ability_AbilityBase_ErrorCode_0003 start');
      let startParams = ["StartupTask_001"];
      // test errcode
      try {
        startupManager.run(startParams).then(() => {
          console.info('StartupTest startupManager run then, startParams = ');
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info("StartupTest promise catch error, error = " + JSON.stringify(error));
          console.info("StartupTest promise catch error, startParams = "
            + JSON.stringify(startParams));
          expect().assertFail();
          done();
        })

      } catch(err) {
        // 处理入参错误异常
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(TAG + `startAbility failed, code is ${code}, message is ${message}`);
        expect(err.code).assertEqual(28800001);
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityBase_ErrorCode_0004
     * @tc.name   : SUB_Ability_AbilityBase_ErrorCode_0004
     * @tc.desc   : To verify the errcode 16000001 when The specified ability does not exist.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
    */
    it('SUB_Ability_AbilityBase_ErrorCode_0004', Level.LEVEL0, async (done: Function)=> {
      console.info('SUB_Ability_AbilityBase_ErrorCode_0004 start');
      let connection: number;
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.errcode',
        abilityName: 'ServiceExtensionAbility'
      };
      let commRemote: rpc.IRemoteObject;
      let options: common.ConnectOptions = {
        onConnect(elementName, remote) {
          commRemote = remote;
          console.info('onConnect...');
        },
        onDisconnect(elementName) {
          console.info('onDisconnect...');
        },
        onFailed(code) {
          console.info('onFailed...' + code);
          expect(code).assertEqual(16000001)
          done();
        }
      };
      // test errcode
      try {
        connection = AppStorage.get<common.UIAbilityContext>("errocode")!.connectServiceExtensionAbility(want, options);
      } catch(err) {
        // 处理入参错误异常
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(TAG + `startAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail()
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityBase_ErrorCode_0005
     * @tc.name   : SUB_Ability_AbilityBase_ErrorCode_0005
     * @tc.desc   : To verify the errcode 16000002 when Incorrect ability type.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
    */
    it('SUB_Ability_AbilityBase_ErrorCode_0005', Level.LEVEL0, async (done: Function)=> {
      console.info('SUB_Ability_AbilityBase_ErrorCode_0005 start');
      let connection: number;
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.errcode',
        abilityName: 'TestEmbeddedUIExtAbility'
      };
      let commRemote: rpc.IRemoteObject;
      let options: common.ConnectOptions = {
        onConnect(elementName, remote) {
          commRemote = remote;
          console.info('onConnect...');
        },
        onDisconnect(elementName) {
          console.info('onDisconnect...');
        },
        onFailed(code) {
          console.info('onFailed...' + code);
          expect(code).assertEqual(16000002)
          done();
        }
      };
      // test errcode
      try {
        connection = AppStorage.get<common.UIAbilityContext>("errocode")!.connectServiceExtensionAbility(want, options);
        console.info("the connection is " + connection)
      } catch(err) {
        // 处理入参错误异常
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(TAG + `startAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail()
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityBase_ErrorCode_0006
     * @tc.name      : SUB_Ability_AbilityBase_ErrorCode_0006
     * @tc.desc      : Test very the code 16000074 when requestCode is not correct & The caller does not exist.
     * @tc.level     : Level 0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityBase_ErrorCode_0006', Level.LEVEL0, async (done: Function) => {
      let callerRequestCode: string = 'xxxxxx';
      let want: Want = {};
      let resultCode = 100;
      let abilityResult: common.AbilityResult = {
        want,
        resultCode
      };
      try {
        await  AppStorage.get<common.UIAbilityContext>("errocode")!.backToCallerAbilityWithResult(abilityResult, callerRequestCode).then(() => {
          console.info('TAG backToCallerAbilityWithResult succeed');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(TAG + `backToCallerAbilityWithResult1 failed, code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(16000074);
          done();
        });
      } catch (err) {
        console.error(TAG + `backToCallerAbilityWithResult failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertFail();
        done();
      };

    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_ErrorCode_0007
     * @tc.name   : SUB_Ability_AbilityBase_ErrorCode_0007
     * @tc.desc   : To verify the errcode 16000050 when the parameters: ' { 'keyFd': { 'type': 'FD', 'value': -1 }'
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_ErrorCode_0007', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_ErrorCode_0007 start');
      let want: Want = {
        bundleName: 'com.acts.ability.errcode',
        abilityName: 'NewAbility',
        parameters:  { 'keyFd': { 'type': 'FD', 'value': -1}}
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        await AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility(want, options)
          .then(() => {
            console.info(TAG + 'startAbility succeed');
            expect().assertFail();
            done();
          }).catch((err: BusinessError) => {
            // 处理业务逻辑错误
            console.error(TAG + `startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000050);
            done();
          });

      } catch(err) {
        // 处理入参错误异常
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(TAG + `failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityBase_ErrorCode_0008
     * @tc.name   : SUB_Ability_AbilityBase_ErrorCode_0008
     * @tc.desc   : To verify the errcode 16000004 when assithap "export:false" with ability
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_ErrorCode_0008', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_ErrorCode_0008 start');
      let want: Want = {
        bundleName: 'com.ability.errcode.assist',
        abilityName: 'EntryAbility'
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        await AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility(want, options)
          .then(() => {
            console.info(TAG + 'startAbility succeed');
            expect().assertFail();
            done();
          }).catch((err: BusinessError) => {
            // 处理业务逻辑错误
            console.error(TAG + `startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000004);
            done();
          });

      } catch(err) {
        // 处理入参错误异常
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(TAG + `failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityBase_ErrorCode_0009
     * @tc.name   : SUB_Ability_AbilityBase_ErrorCode_0009
     * @tc.desc   : To verify the errcode 16000078 when assithap "multiAppMode" with ability & parameters with APP_INSTANCE_KEY ："app_instance_100"
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_ErrorCode_0009', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_ErrorCode_0009 start');
      let want: Want = {
        bundleName: 'com.ability.errcode.assist3',
        abilityName: 'EntryAbility',
        parameters: {
          [wantConstant.Params.APP_INSTANCE_KEY]: "app_instance_0",
        }
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        await AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility(want, options)
          .then(() => {
            console.info(TAG + 'startAbility succeed');
            expect().assertFail();
            done();
          }).catch((err: BusinessError) => {
            // 处理业务逻辑错误
            console.error(TAG + `startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000078);
            done();
          });

      } catch(err) {
        // 处理入参错误异常
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(TAG + `failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }

    })

    /*
    * @tc.number : SUB_Ability_AbilityBase_ErrorCode_0010
    * @tc.name   : SUB_Ability_AbilityBase_ErrorCode_0010
    * @tc.desc   : To verify the errcode 16000073 when assithap "multiAppMode" with ability & parameters with APP_CLONE_INDEX_KEY > 1000
    * @tc.type   : Function
    * @tc.size   : MediumTest
    * @tc.level  : 0
    */
    it('SUB_Ability_AbilityBase_ErrorCode_0010', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_ErrorCode_0010 start');
      let want: Want = {
        bundleName: 'com.ability.errcode.assist',
        abilityName: 'EntryAbility',
        parameters: {
          [wantConstant.Params.APP_CLONE_INDEX_KEY]: 1001,
        }
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        await AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility(want, options)
          .then(() => {
            console.info(TAG + 'startAbility succeed');
            expect().assertFail();
            done();
          }).catch((err: BusinessError) => {
            // 处理业务逻辑错误
            console.error(TAG + `startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000073);
            done();
          });

      } catch(err) {
        // 处理入参错误异常
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(TAG + `failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityBase_ErrorCode_0011
     * @tc.name   : SUB_Ability_AbilityBase_ErrorCode_0011
     * @tc.desc   : To verify the errcode 16000072 when assithap not config "multiAppMode"
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
    */
    it('SUB_Ability_AbilityBase_ErrorCode_0011', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_ErrorCode_0011 start');
      if (mpEnable == 'true') {
        let want: Want = {
          bundleName: 'com.acts.ability.errcode',
          abilityName: 'NewAbility',
          parameters: {
            [wantConstant.Params.APP_INSTANCE_KEY]: "app_instance_0",
          }
        };
        let options: StartOptions = {
          displayId: 0
        };
        // test errorcode
        try {
          await AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility(want, options)
            .then(() => {
              console.info(TAG + 'startAbility succeed');
            }).catch((err: BusinessError) => {
              // 处理业务逻辑错误
              console.error(TAG + `startAbility failed, code is ${err.code}, message is ${err.message}`);
              expect(err.code).assertEqual(16000072);
              done();
            });

        } catch(err) {
          // 处理入参错误异常
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          console.error(TAG + `failed, code is ${code}, message is ${message}`);
          expect().assertFail();
          done();
        }
      } else {
        console.error(`${TAG} SUB_Ability_AbilityBase_ErrorCode_0011 error, current device not support feature.`);
        done();
      }
    })


    /*
    * @tc.number : SUB_Ability_AbilityBase_ErrorCode_0012
    * @tc.name   : SUB_Ability_AbilityBase_ErrorCode_0012
    * @tc.desc   : To verify the errcode 16000067 when processMode "NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM"
    * @tc.type   : Function
    * @tc.size   : MediumTest
    * @tc.level  : 0
   */
    it('SUB_Ability_AbilityBase_ErrorCode_0012', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_ErrorCode_0012 start');
      if (mpEnable == 'true') {
        let want: Want = {
          bundleName: 'com.acts.ability.errcode',
          abilityName: 'NewAbility',
          parameters: {
            [wantConstant.Params.CREATE_APP_INSTANCE_KEY]: true,
          }
        };
        let options: StartOptions = {
          displayId: 0,
          processMode:contextConstant.ProcessMode.ATTACH_TO_STATUS_BAR_ITEM,
          startupVisibility:contextConstant.StartupVisibility.STARTUP_HIDE
        };
        // test errorcode
        try {
          await AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility(want, options)
            .then(() => {
              console.info(TAG + 'startAbility succeed');
            }).catch((err: BusinessError) => {
              // 处理业务逻辑错误
              if(err.code == 801){
                done();
              }else{
                console.error(TAG + `startAbility failed, code is ${err.code}, message is ${err.message}`);
                expect(err.code).assertEqual(16000067);
                done();
              }
            });
        } catch(err) {
          // 处理入参错误异常
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          console.error(TAG + `failed, code is ${code}, message is ${message}`);
          expect().assertFail();
          done();
        }
      } else {
        console.error(`${TAG} SUB_Ability_AbilityBase_ErrorCode_0012 error, current device not support feature.`);
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityBase_ErrorCode_0013
     * @tc.name   : SUB_Ability_AbilityBase_ErrorCode_0013
     * @tc.desc   : To verify the errcode 16000068 when The ability is already running.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
    */
    it('SUB_Ability_AbilityBase_ErrorCode_0013', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_ErrorCode_0013 start');
      if (mpEnable == 'true') {
        let want: Want = {
          bundleName: 'com.acts.ability.errcode',
          abilityName: 'NewAbility',
        };
        let options: StartOptions = {
          displayId: 0,
          processMode:contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT,
          startupVisibility:contextConstant.StartupVisibility.STARTUP_HIDE
        };
        let options1: StartOptions = {
          displayId: 0,
          processMode:contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT,
          startupVisibility:contextConstant.StartupVisibility.STARTUP_HIDE
        };
        // test errorcode
        try {
          await AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility(want, options)
            .then(() => {
              console.info(TAG + 'SUB_Ability_AbilityBase_ErrorCode_0013 succeed');
            }).catch((err: BusinessError) => {
              // 处理业务逻辑错误
              console.error(TAG + `SUB_Ability_AbilityBase_ErrorCode_00130 failed, code is ${err.code}, message is ${err.message}`);
              expect().assertFail();
            });
        } catch(err) {
          // 处理入参错误异常
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          console.error(TAG + `SUB_Ability_AbilityBase_ErrorCode_0013failed, code is ${code}, message is ${message}`);
          expect().assertFail();
        }
        await Utils.sleep(2500)
        // start again
        try {
          await AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility(want, options1)
            .then(() => {
              console.info(TAG + 'SUB_Ability_AbilityBase_ErrorCode_0013 succeed');
              expect().assertFail();
              done();
            }).catch((err: BusinessError) => {
              // 处理业务逻辑错误
              console.error(TAG + `startAbility0900 failed, code is ${err.code}, message is ${err.message}`);
              try{expect(err.code).assertEqual(16000068);}catch{}
            });
        } catch(err) {
          // 处理入参错误异常
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          console.error(TAG + `failed, code is ${code}, message is ${message}`);
          expect().assertFail();
          done();
        }
        try {
          AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility(want, options1, (err, data)=>{
            try{expect(err.code).assertEqual(16000068);}catch{}
            done();
          })
        } catch(err) {
          // 处理入参错误异常
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          console.error(TAG + `failed, code is ${code}, message is ${message}`);
          expect().assertFail();
          done();
        }
      } else {
        console.error(`${TAG} SUB_Ability_AbilityBase_ErrorCode_0013 error, current device not support feature.`);
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityBase_ErrorCode_0014
     * @tc.name   : SUB_Ability_AbilityBase_ErrorCode_0014
     * @tc.desc   : To verify the errcode 16000080 when The APP_INSTANCE_KEY is invalid.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_ErrorCode_0014', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_ErrorCode_0014 start');
      if (mpEnable == 'true') {
        let want: Want = {
          bundleName: 'com.ability.errcode.assist',
          abilityName: 'EntryAbility',
          parameters: {
            [wantConstant.Params.CREATE_APP_INSTANCE_KEY]: true,
          }
        };
        let options: StartOptions = {
          displayId: 0
        };
        // start
        try {
          await AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility(want, options)
            .then(() => {
              console.info(TAG + 'startAbility succeed');
              expect().assertFail();
              done();
            }).catch((err: BusinessError) => {
              // 处理业务逻辑错误
              console.error(TAG + `startAbility failed, code is ${err.code}, message is ${err.message}`);
              expect(err.code).assertEqual(16000080);
              done();
            });
        } catch(err) {
          // 处理入参错误异常
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          console.error(TAG + `failed, code is ${code}, message is ${message}`);
          expect().assertFail();
          done();
        }
      } else {
        console.error(`${TAG} SUB_Ability_AbilityBase_ErrorCode_0014 error, current device not support feature.`);
        done();
      }
    })

    /*
     * @tc.number: SUB_Ability_AbilityBase_ErrorCode_0015
     * @tc.name: SUB_Ability_AbilityBase_ErrorCode_0015
     * @tc.desc: To verify the errcode 16000001 when The specified ability does not exist
     * When StartAbility In UIExtension
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('SUB_Ability_AbilityBase_ErrorCode_0015', Level.LEVEL0, async (done: Function) => {
      if (mpExtensionEnable == 'true') {
        let tag:string = 'SUB_Ability_AbilityBase_ErrorCode_0015';
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [tag]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s',
              `tag onConnect=338=` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s',
              `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(16000001);
              AppStorage.get<common.UIAbilityContext>("errocode1")!.terminateSelf()
            } catch {
            }
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
        });
        AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility({
          bundleName:"com.acts.ability.errcode",
          abilityName:"AssitAbility",
          parameters: {
            "case":"startErrorCodeCallBack1600001",
            "caseName":tag
          }
        }).then(()=>{
          console.info(TAG + "start ability success");
        }).catch((err: BusinessError)=>{
          console.info(TAG + "start ability Error");
          expect().assertFail();
          done();
        })
      } else {
        console.error(`${TAG} SUB_Ability_AbilityBase_ErrorCode_0015 error, current device not support feature.`);
        done();
      }
    })

    /*
    * @tc.number: SUB_Ability_AbilityBase_ErrorCode_0016
    * @tc.name: SUB_Ability_AbilityBase_ErrorCode_0016
    * @tc.desc: To verify the errcode 16000050  when the parameters: ' { 'keyFd': { 'type': 'FD', 'value': -1 }'
    * When StartAbility In UIExtension
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 0
    */
    it('SUB_Ability_AbilityBase_ErrorCode_0016', Level.LEVEL0, async (done: Function) => {
      if (mpExtensionEnable == 'true') {
        await Utils.sleep(1500)
        let tag:string = 'SUB_Ability_AbilityBase_ErrorCode_0016';
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [tag]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s',
              `tag onConnect=338=` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s',
              `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(16000050);
              AppStorage.get<common.UIAbilityContext>("errocode1")!.terminateSelf();
            } catch {
            }
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
        });
        AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility({
          bundleName:"com.acts.ability.errcode",
          abilityName:"AssitAbility",
          parameters: {
            "case":"startErrorCodeCallBack16000050",
            "caseName":tag
          }
        }).then(()=>{
          console.info(TAG + "start ability success");
        }).catch((err: BusinessError)=>{
          console.info(TAG + "start ability Error");
          expect().assertFail();
          done();
        })
      } else {
        console.error(`${TAG} SUB_Ability_AbilityBase_ErrorCode_0016 error, current device not support feature.`);
        done();
      }
    })

    /*
     * @tc.number: SUB_Ability_AbilityBase_ErrorCode_0017
     * @tc.name:  SUB_Ability_AbilityBase_ErrorCode_0017
     * @tc.desc: To verify the errcode 16000004 when assithap "export:false" with ability
     * When StartAbility In UIExtension
     * @tc.size: MediumTest
     * @tc.type: Function
    * @tc.level: Level 0
     */
    it('SUB_Ability_AbilityBase_ErrorCode_0017', Level.LEVEL0, async (done: Function) => {
      let tag:string = 'SUB_Ability_AbilityBase_ErrorCode_0017';
      if (mpExtensionEnable == 'true') {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [tag]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s',
              `tag onConnect=338=` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s',
              `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(16000004);
              AppStorage.get<common.UIAbilityContext>("errocode1")!.terminateSelf();
            } catch {
            }
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
        });
        await AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility({
          bundleName:"com.acts.ability.errcode",
          abilityName:"AssitAbility",
          parameters: {
            "case":"startErrorCodeCallBack16000004",
            "caseName":tag
          }
        }).then(()=>{
          console.info(TAG + "start ability success");
        }).catch((err: BusinessError)=>{
          console.info(TAG + "start ability Error");
          expect().assertFail();
          done();
        })
      } else {
        console.error(`${TAG} SUB_Ability_AbilityBase_ErrorCode_0017 error, current device not support feature.`);
        done();
      }
    })

    /*
    * @tc.number: SUB_Ability_AbilityBase_ErrorCode_0018
    * @tc.name: SUB_Ability_AbilityBase_ErrorCode_0018
    * @tc.desc: To verify the errcode 16000001 when The specified ability does not exist
    * When StartAbility In UIExtension
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 0
    */
    it('SUB_Ability_AbilityBase_ErrorCode_0018', Level.LEVEL0, async (done: Function) => {
      if (mpExtensionEnable == 'true') {
        let tag:string = 'SUB_Ability_AbilityBase_ErrorCode_0018';
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [tag]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s',
              `tag onConnect=338=` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s',
              `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(16000019);
              AppStorage.get<common.UIAbilityContext>("errocode1")!.terminateSelf()
            } catch {
            }
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
        });
        AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility({
          bundleName:"com.acts.ability.errcode",
          abilityName:"AssitAbility",
          parameters: {
            "case":"startErrorCodeCallBack16000019",
            "caseName":tag
          }
        }).then(()=>{
          console.info(TAG + "start ability success");
        }).catch((err: BusinessError)=>{
          console.info(TAG + "start ability Error");
          expect().assertFail();
          done();
        })
      } else {
        console.error(`${TAG} SUB_Ability_AbilityBase_ErrorCode_0018 error, current device not support feature.`);
        done();
      }
    })

    /*
     * @tc.number: SUB_Ability_AbilityBase_ErrorCode_0019
     * @tc.name:  SUB_Ability_AbilityBase_ErrorCode_0019
     * @tc.desc: To verify the errcode 16000072 when  verify the errcode 16000072 when assithap not config "multiAppMode"
     * When StartAbility In UIExtension
     * @tc.size: MediumTest
     * @tc.type: Function
    * @tc.level: Level 0
    */
    it('SUB_Ability_AbilityBase_ErrorCode_0019', Level.LEVEL0, async (done: Function) => {
      let tag:string = 'SUB_Ability_AbilityBase_ErrorCode_0019';
      if (mpExtensionEnable == 'true') {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [tag]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s',
              `tag onConnect=338=` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s',
              `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(16000072);
              AppStorage.get<common.UIAbilityContext>("errocode1")!.terminateSelf();
            } catch {
            }
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
        });
        await AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility({
          bundleName:"com.acts.ability.errcode",
          abilityName:"AssitAbility",
          parameters: {
            "case":"startErrorCodeCallBack16000072",
            "caseName":tag
          }
        }).then(()=>{
          console.info(TAG + "start ability success");
        }).catch((err: BusinessError)=>{
          console.info(TAG + "start ability Error");
          expect().assertFail();
          done();
        })
      } else {
        console.error(`${TAG} SUB_Ability_AbilityBase_ErrorCode_0019 error, current device not support feature.`);
        done();
      }
    })

    /*
    * @tc.number: SUB_Ability_AbilityBase_ErrorCode_0020
    * @tc.name:  SUB_Ability_AbilityBase_ErrorCode_0020
    * @tc.desc: To verify the errcode 16000078 when assithap "multiAppMode" with ability & parameters with APP_INSTANCE_KEY ："app_instance_100"
    * When StartAbility In UIExtension
    * @tc.size: MediumTest
    * @tc.type: Function
   * @tc.level: Level 0
    */
    it('SUB_Ability_AbilityBase_ErrorCode_0020', Level.LEVEL0, async (done: Function) => {
      let tag:string = 'SUB_Ability_AbilityBase_ErrorCode_0020';
      if (mpExtensionEnable == 'true') {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [tag]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s',
              `tag onConnect=338=` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s',
              `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              if (commonEventData.parameters?.result == 16000078) {
                expect(true).assertTrue()
                AppStorage.get<common.UIAbilityContext>("errocode1")!.terminateSelf();
              } else {
                AppStorage.get<common.UIAbilityContext>("errocode1")!.terminateSelf();
                expect().assertFail()
              }
            } catch {
            }
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
        });
        await AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility({
          bundleName:"com.acts.ability.errcode",
          abilityName:"AssitAbility",
          parameters: {
            "case":"startErrorCodeCallBack16000078",
            "caseName":tag
          }
        }).then(()=>{
          console.info(TAG + "start ability success");
        }).catch((err: BusinessError)=>{
          console.info(TAG + "start ability Error");
          expect().assertFail();
          done();
        })
      } else {
        console.error(`${TAG} SUB_Ability_AbilityBase_ErrorCode_0020 error, current device not support feature.`);
        done();
      }
    })

    /*
    * @tc.number: SUB_Ability_AbilityBase_ErrorCode_0021
    * @tc.name:  SUB_Ability_AbilityBase_ErrorCode_0021
    * @tc.desc: To verify the errcode  16000073 when assithap "multiAppMode" with ability & parameters with APP_CLONE_INDEX_KEY > 1000
    * When StartAbility In UIExtension
    * @tc.size: MediumTest
    * @tc.type: Function
   * @tc.level: Level 0
    */
    it('SUB_Ability_AbilityBase_ErrorCode_0021', Level.LEVEL0, async (done: Function) => {
      let tag:string = 'SUB_Ability_AbilityBase_ErrorCode_0020';
      if (mpExtensionEnable == 'true') {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [tag]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s',
              `tag onConnect=338=` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s',
              `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              if (commonEventData.parameters?.result == 16000073) {
                expect(true).assertTrue();
                AppStorage.get<common.UIAbilityContext>("errocode1")!.terminateSelf();
              } else {
                AppStorage.get<common.UIAbilityContext>("errocode1")!.terminateSelf();
                expect().assertFail();
              }
            } catch {
            }
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
        });
        await AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility({
          bundleName:"com.acts.ability.errcode",
          abilityName:"AssitAbility",
          parameters: {
            "case":"startErrorCodeCallBack16000073",
            "caseName":tag
          }
        }).then(()=>{
          console.info(TAG + "start ability success");
        }).catch((err: BusinessError)=>{
          console.info(TAG + "start ability Error");
          expect().assertFail();
          done();
        })
      } else {
        console.error(`${TAG} SUB_Ability_AbilityBase_ErrorCode_0021 error, current device not support feature.`);
        done();
      }
    })

    /*
     * @tc.number: SUB_Ability_AbilityBase_ErrorCode_0022
     * @tc.name:  SUB_Ability_AbilityBase_ErrorCode_0022
     * @tc.desc: To verify the errcode 16000080 when The APP_INSTANCE_KEY is invalid.
     * When StartAbility In UIExtension
     * @tc.size: MediumTest
     * @tc.type: Function
    * @tc.level: Level 0
    */
    it('SUB_Ability_AbilityBase_ErrorCode_0022', Level.LEVEL0, async (done: Function) =>{
      let tag:string = 'SUB_Ability_AbilityBase_ErrorCode_0022';
      if (mpExtensionEnable == 'true') {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [tag]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s',
              `tag onConnect=338=` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s',
              `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              if (commonEventData.parameters?.result == 16000080) {
                expect(true).assertTrue()
                AppStorage.get<common.UIAbilityContext>("errocode1")!.terminateSelf();
              } else {
                AppStorage.get<common.UIAbilityContext>("errocode1")!.terminateSelf();
                expect().assertFail()
              }
            } catch {
            }
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
        });
        await AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility({
          bundleName:"com.acts.ability.errcode",
          abilityName:"AssitAbility",
          parameters: {
            "case":"startErrorCodeCallBack16000080",
            "caseName":tag
          }
        }).then(()=>{
          console.info(TAG + "start ability success");
        }).catch((err: BusinessError)=>{
          console.info(TAG + "start ability Error");
          expect().assertFail();
          done();
        })

      } else {
        console.error(`${TAG} SUB_Ability_AbilityBase_ErrorCode_0022 error, current device not support feature.`);
        done();
      }
    })

    /*
    * @tc.number: SUB_Ability_AbilityBase_ErrorCode_0023
    * @tc.name: SUB_Ability_AbilityBase_ErrorCode_0023
    * @tc.desc: To verify the errcode 16000050  when the parameters: ' { 'keyFd': { 'type': 'FD', 'value': -1 }'
    * When StartAbility In UIExtension, an error code is 16000050 .
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 0
    */
    it('SUB_Ability_AbilityBase_ErrorCode_0023', Level.LEVEL0, async (done: Function) => {
      let tag:string = 'SUB_Ability_AbilityBase_ErrorCode_0023';
      if (mpExtensionEnable == 'true') {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [tag]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s',
              `tag onConnect=338=` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s',
              `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              if (commonEventData.parameters?.result == 16000050) {
                expect(true).assertTrue()
                AppStorage.get<common.UIAbilityContext>("errocode1")!.terminateSelf();
              } else {
                AppStorage.get<common.UIAbilityContext>("errocode1")!.terminateSelf();
                expect().assertFail()
              }
            } catch {
            }
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
        });
        AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility({
          bundleName:"com.acts.ability.errcode",
          abilityName:"AssitAbility",
          parameters: {
            "case":"startErrorCodeCallBackOptions16000050",
            "caseName":tag
          }
        }).then(()=>{
          console.info(TAG + "start ability success");
        }).catch((err: BusinessError)=>{
          console.info(TAG + "start ability Error");
          expect().assertFail();
          done();
        })
      } else {
        console.error(`${TAG} SUB_Ability_AbilityBase_ErrorCode_0023 error, current device not support feature.`);
        done();
      }
    })

    /*
     * @tc.number: SUB_Ability_AbilityBase_ErrorCode_0024
     * @tc.name:  SUB_Ability_AbilityBase_ErrorCode_0024
     * @tc.desc: To verify the errcode 16000004 when assithap "export:false" with ability
     * When StartAbility In UIExtension, an error code is 16000004 .
     * @tc.size: MediumTest
     * @tc.type: Function
    * @tc.level: Level 0
     */
    it('SUB_Ability_AbilityBase_ErrorCode_0024', Level.LEVEL0, async (done: Function) => {
      let tag:string = 'SUB_Ability_AbilityBase_ErrorCode_0024';
      if (mpExtensionEnable == 'true') {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [tag]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s',
              `tag onConnect=338=` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s',
              `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              if (commonEventData.parameters?.result == 16000004) {
                expect(true).assertTrue()
                AppStorage.get<common.UIAbilityContext>("errocode1")!.terminateSelf();
              } else {
                AppStorage.get<common.UIAbilityContext>("errocode1")!.terminateSelf();
                expect().assertFail()
              }
            } catch {
            }
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
        });
        await AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility({
          bundleName:"com.acts.ability.errcode",
          abilityName:"AssitAbility",
          parameters: {
            "case":"startErrorCodeCallBackOptions16000004",
            "caseName":tag
          }
        }).then(()=>{
          console.info(TAG + "start ability success");
        }).catch((err: BusinessError)=>{
          console.info(TAG + "start ability Error");
          expect().assertFail();
          done();
        })
      } else {
        console.error(`${TAG} SUB_Ability_AbilityBase_ErrorCode_0024 error, current device not support feature.`);
        done();
      }
    })

    /*
    * @tc.number: SUB_Ability_AbilityBase_ErrorCode_0025
    * @tc.name:  SUB_Ability_AbilityBase_ErrorCode_0025
    * @tc.desc: To verify the errcode 16000078 when assithap "multiAppMode" with ability & parameters with APP_INSTANCE_KEY ："app_instance_100"
    * When StartAbility In UIExtension, an error code is 16000078 .
    * @tc.size: MediumTest
    * @tc.type: Function
   * @tc.level: Level 0
    */
    it(' SUB_Ability_AbilityBase_ErrorCode_0025', Level.LEVEL0, async (done: Function) => {
      let tag:string = ' SUB_Ability_AbilityBase_ErrorCode_0025';
      if (mpExtensionEnable == 'true') {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [tag]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s',
              `tag onConnect=338=` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s',
              `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              if (commonEventData.parameters?.result == 16000078) {
                expect(true).assertTrue()
                AppStorage.get<common.UIAbilityContext>("errocode1")!.terminateSelf();
              } else {
                AppStorage.get<common.UIAbilityContext>("errocode1")!.terminateSelf();
                expect().assertFail()
              }
            } catch {
            }
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
        });
        await AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility({
          bundleName:"com.acts.ability.errcode",
          abilityName:"AssitAbility",
          parameters: {
            "case":"startErrorCodeCallBackOptions16000078",
            "caseName":tag
          }
        }).then(()=>{
          console.info(TAG + "start ability success");
        }).catch((err: BusinessError)=>{
          console.info(TAG + "start ability Error");
          expect().assertFail();
          done();})

      } else {
        console.error(`${TAG} SUB_Ability_AbilityBase_ErrorCode_0025 error, current device not support feature.`);
        done();
      }
    })

    /*
    * @tc.number: SUB_Ability_AbilityBase_ErrorCode_0026
    * @tc.name:  SUB_Ability_AbilityBase_ErrorCode_0026
    * @tc.desc: To verify the errcode  16000073 when assithap "multiAppMode" with ability & parameters with APP_CLONE_INDEX_KEY > 1000
    * When StartAbility In UIExtension, an error code is 16000073 .
    * @tc.size: MediumTest
    * @tc.type: Function
   * @tc.level: Level 0
    */
    it('SUB_Ability_AbilityBase_ErrorCode_0026', Level.LEVEL0, async (done: Function) => {
      let tag:string = 'SUB_Ability_AbilityBase_ErrorCode_0026';
      if (mpExtensionEnable == 'true') {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [tag]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s',
              `tag onConnect=338=` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s',
              `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              if (commonEventData.parameters?.result == 16000073) {
                expect(true).assertTrue()
                AppStorage.get<common.UIAbilityContext>("errocode1")!.terminateSelf();
              } else {
                AppStorage.get<common.UIAbilityContext>("errocode1")!.terminateSelf();
                expect().assertFail()
              }
            } catch {
            }
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
        });
        await AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility({
          bundleName:"com.acts.ability.errcode",
          abilityName:"AssitAbility",
          parameters: {
            "case":"startErrorCodeCallBackOptions16000073",
            "caseName":tag
          }
        }).then(()=>{
          console.info(TAG + "start ability success");
        }).catch((err: BusinessError)=>{
          console.info(TAG + "start ability Error");
          expect().assertFail();
          done();
        })
      } else {
        console.error(`${TAG} SUB_Ability_AbilityBase_ErrorCode_0026 error, current device not support feature.`);
        done();
      }
    })

    /*
     * @tc.number: SUB_Ability_AbilityBase_ErrorCode_0027
     * @tc.name:  SUB_Ability_AbilityBase_ErrorCode_0027
     * @tc.desc: To verify the errcode 16000080 when The APP_INSTANCE_KEY is invalid.
     * When StartAbility In UIExtension, an error code is 16000080 .
     * @tc.size: MediumTest
     * @tc.type: Function
    * @tc.level: Level 0
    */
    it('SUB_Ability_AbilityBase_ErrorCode_0027', Level.LEVEL0, async (done: Function) => {
      let tag:string = 'SUB_Ability_AbilityBase_ErrorCode_0027';
      if (mpExtensionEnable == 'true') {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [tag]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s',
              `tag onConnect=338=` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s',
              `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              if (commonEventData.parameters?.result == 16000080) {
                expect(true).assertTrue()
                AppStorage.get<common.UIAbilityContext>("errocode1")!.terminateSelf();
              } else {
                AppStorage.get<common.UIAbilityContext>("errocode1")!.terminateSelf();
                expect().assertFail()
              }
            } catch {
            }
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
        });
        await AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility({
          bundleName:"com.acts.ability.errcode",
          abilityName:"AssitAbility",
          parameters: {
            "case":"startErrorCodeCallBackOptions16000080",
            "caseName":tag
          }
        }).then(()=>{
          console.info(TAG + "start ability success");
        }).catch((err: BusinessError)=>{
          console.info(TAG + "start ability Error");
          expect().assertFail();
          done();
        })
      } else {
        console.error(`${TAG} SUB_Ability_AbilityBase_ErrorCode_0027 error, current device not support feature.`);
        done();
      }
    })

    /*
    * @tc.number: SUB_Ability_AbilityBase_ErrorCode_0028
    * @tc.name:  SUB_Ability_AbilityBase_ErrorCode_0028
    * @tc.desc: To verify the errcode 16000072 when  verify the errcode 16000072 when assithap not config "multiAppMode"
    * When StartAbility In UIExtension, an error code is 16000072 .
    * @tc.size: MediumTest
    * @tc.type: Function
   * @tc.level: Level 0
   */
    it('SUB_Ability_AbilityBase_ErrorCode_0028', Level.LEVEL0, async (done: Function) => {
      let tag:string = 'SUB_Ability_AbilityBase_ErrorCode_0028';
      if (mpExtensionEnable == 'true') {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [tag]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s',
              `tag onConnect=338=` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s',
              `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              if (commonEventData.parameters?.result == 16000072) {
                expect(true).assertTrue()
                AppStorage.get<common.UIAbilityContext>("errocode1")!.terminateSelf();
              } else {
                AppStorage.get<common.UIAbilityContext>("errocode1")!.terminateSelf();
                expect().assertFail()
              }
            } catch {
            }
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
        });
        await AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility({
          bundleName:"com.acts.ability.errcode",
          abilityName:"AssitAbility",
          parameters: {
            "case":"startErrorCodeCallBackOptions16000072",
            "caseName":tag
          }
        }).then(()=>{
          console.info(TAG + "start ability success");
        }).catch((err: BusinessError)=>{
          console.info(TAG + "start ability Error");
          expect().assertFail();
          done();
        })
      }  else {
        console.error(`${TAG} SUB_Ability_AbilityBase_ErrorCode_0028 error, current device not support feature.`);
        done();
      }
    })

    /*
    * @tc.number: SUB_Ability_AbilityBase_ErrorCode_0029
    * @tc.name: SUB_Ability_AbilityBase_ErrorCode_0029
    * @tc.desc: To verify the errcode 16000001 when The specified ability does not exist
    * When StartAbility In UIExtension, an error code is 16000019.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 0
    */
    it('SUB_Ability_AbilityBase_ErrorCode_0029', Level.LEVEL0, async (done: Function) => {
      if (mpExtensionEnable == 'true') {
        let tag:string = 'SUB_Ability_AbilityBase_ErrorCode_0029';
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [tag]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s',
              `tag onConnect=338=` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s',
              `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              if (commonEventData.parameters?.result == 16000019) {
                expect(true).assertTrue()
                AppStorage.get<common.UIAbilityContext>("errocode1")!.terminateSelf();
              } else {
                AppStorage.get<common.UIAbilityContext>("errocode1")!.terminateSelf();
                expect().assertFail()
              }
            } catch {
            }
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
        });
        AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility({
          bundleName:"com.acts.ability.errcode",
          abilityName:"AssitAbility",
          parameters: {
            "case":"startErrorCodeCallBackOptions16000019",
            "caseName":tag
          }
        }).then(()=>{
          console.info(TAG + "start ability success");
        }).catch((err: BusinessError)=>{
          console.info(TAG + "start ability Error");
          expect().assertFail();
          done();
        })
      } else {
        console.error(`${TAG} SUB_Ability_AbilityBase_UIExtensionStartAbilityCallBackCodeOptions_16000019 error, current device not support feature.`);
        done();
      }
    })
  })
}

