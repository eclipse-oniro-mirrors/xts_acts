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
export default function errorCodeTest2() {
  describe('errorCodeTest2', () => {
    let TAG = 'errorCodeTest2 ===>';
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
     * @tc.name   : To verify the errcode 16000077 when assithap "multiAppMode" with ability & startability three times
     * @tc.desc   : Expect: the errcode 16000077
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_ErrorCode_0001', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_ErrorCode_0001 start');
      if (mpEnable == 'true') {
        let want: Want = {
          bundleName: 'com.acts.ability.errcode2',
          abilityName: 'NewAbility',
          parameters: {
            [wantConstant.Params.CREATE_APP_INSTANCE_KEY]: true,
          }
        };
        let options: StartOptions = {
          displayId: 0
        };
        try {
          await AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility(want, options)
            .then(() => {
              console.info(TAG + 'startAbility succeed');
            }).catch((err: BusinessError) => {
              // 处理业务逻辑错误
              console.error(TAG + `startAbility failed, code is ${err.code}, message is ${err.message}`);
            });
        } catch(err) {
          // 处理入参错误异常
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          console.error(TAG + `failed, code is ${code}, message is ${message}`);
        }
        await Utils.sleep(1000);
        // two
        try {
          await AppStorage.get<common.UIAbilityContext>("errocode")!.startAbility(want, options)
            .then(() => {
              console.info(TAG + 'startAbility succeed');
            }).catch((err: BusinessError) => {
              // 处理业务逻辑错误
              console.error(TAG + `startAbility failed, code is ${err.code}, message is ${err.message}`);
              expect(err.code).assertEqual(16000077);
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
        console.error(`${TAG} startChildProcess error, current device not support feature.`);
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityBase_ErrorCode_0002
     * @tc.name   : To verify the errcode 16000076 when The APP_INSTANCE_KEY is invalid.
     * @tc.desc   : Expect: the errcode 16000076
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_ErrorCode_0002', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_ErrorCode_0002 start');
      if (mpEnable == 'true') {
        let want: Want = {
          bundleName: 'com.acts.ability.errcode2',
          abilityName: 'NewAbility',
          parameters: {
            [wantConstant.Params.APP_INSTANCE_KEY]: "app_instance_100"}
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
              expect(err.code).assertEqual(16000076);
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
        console.error(`${TAG} SUB_Ability_AbilityBase_ErrorCode_0002 error, current device not support feature.`);
        done();
      }
    })
    /*
     * @tc.number : SUB_Ability_AbilityBase_ErrorCode_0003
     * @tc.name   : To verify the errcode 16000079 when The APP_INSTANCE_KEY is invalid.
     * @tc.desc   : Expect: the errcode 16000079
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_ErrorCode_0003', Level.LEVEL0, async (done: Function)=> {
      hilog.info(0x0000, `${TAG}`, '%{public}s', 'SUB_Ability_AbilityBase_ErrorCode_0003 start');
      if (mpEnable == 'true') {
        let want: Want = {
          bundleName: 'com.ability.errcode.assist',
          abilityName: 'EntryAbility',
          parameters: {
            [wantConstant.Params.APP_INSTANCE_KEY]: "app_instance_100",
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
              console.info(TAG + 'SUB_Ability_AbilityBase_ErrorCode_0003 succeed');
              expect().assertFail();
              done();
            }).catch((err: BusinessError) => {
              // 处理业务逻辑错误
              console.error(TAG + `SUB_Ability_AbilityBase_ErrorCode_0003 failed, code is ${err.code}, message is ${err.message}`);
              expect(err.code).assertEqual(16000079);
              done();
            });
        } catch(err) {
          // 处理入参错误异常
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          console.error(TAG + `startAbility1100failed, code is ${code}, message is ${message}`);
          expect().assertFail();
          done();
        }
      } else {
        console.error(`${TAG} SUB_Ability_AbilityBase_ErrorCode_0003 error, current device not support feature.`);
        done();
      }
    })

    /*
     * @tc.number: SUB_Ability_AbilityBase_ErrorCode_0004
     * @tc.name:  To verify the errcode 16000076  when The APP_INSTANCE_KEY is invalid.
     * @tc.desc: When StartAbility In UIExtension, an error code is 16000076 .
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('SUB_Ability_AbilityBase_ErrorCode_0004', Level.LEVEL0, async (done: Function) => {
      let tag:string = 'SUB_Ability_AbilityBase_ErrorCode_0004';
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
              if (commonEventData.parameters?.result == 16000076) {
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
          bundleName:"com.acts.ability.errcode2",
          abilityName:"AssitAbility",
          parameters: {
            "case":"startErrorCodeCallBack16000076",
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
        console.error(`${TAG} SUB_Ability_AbilityBase_ErrorCode_0004 error, current device not support feature.`);
        done();
      }
    })

    /*
     * @tc.number: SUB_Ability_AbilityBase_ErrorCode_0005
     * @tc.name:  To verify the errcode 16000077 when assithap "multiAppMode" with ability & startability three times
     * @tc.desc: When StartAbility In UIExtension, an error code is 16000077 .
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('SUB_Ability_AbilityBase_ErrorCode_0005', Level.LEVEL0, async (done: Function) => {
      if (mpExtensionEnable == 'true') {
        let tag:string = 'SUB_Ability_AbilityBase_UIExtensionStartAbilityCallBackCode_16000077';
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
              if (commonEventData.parameters?.result == 16000077) {
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
          bundleName:"com.acts.ability.errcode2",
          abilityName:"AssitAbility",
          parameters: {
            "case":"startErrorCodeCallBack16000077",
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
        console.error(`${TAG} SUB_Ability_AbilityBase_ErrorCode_0005 error, current device not support feature.`);
        done();
      }
    })

    /*
     * @tc.number: SUB_Ability_AbilityBase_ErrorCode_0006
     * @tc.name:  To verify the errcode 16000079 when The APP_INSTANCE_KEY is invalid.
     * @tc.desc: When StartAbility In UIExtension, an error code is 16000079 .
     * @tc.size: MediumTest
     * @tc.type: Function
    * @tc.level: Level 0
   */
    it('SUB_Ability_AbilityBase_ErrorCode_0006', Level.LEVEL0, async (done: Function) => {
      let tag:string = 'SUB_Ability_AbilityBase_UIExtensionStartAbilityCallBackCode_16000079';
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
              if (commonEventData.parameters?.result == 16000079) {
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
          bundleName:"com.acts.ability.errcode2",
          abilityName:"AssitAbility",
          parameters: {
            "case":"startErrorCodeCallBack16000079",
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
        console.error(`${TAG} SUB_Ability_AbilityBase_ErrorCode_0006 error, current device not support feature.`);
        done();
      }
    })

    /*
     * @tc.number: SUB_Ability_AbilityBase_ErrorCode_0007
     * @tc.name:  To verify the errcode 16000077 when assithap "multiAppMode" with ability & startability three times
     * @tc.desc: When StartAbility In UIExtension, an error code is 16000077 .
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
   */
    it('SUB_Ability_AbilityBase_ErrorCode_0007', Level.LEVEL0, async (done: Function) => {
      let tag:string = 'SUB_Ability_AbilityBase_UIExtensionStartAbilityCallBackCodeOptions_16000077';
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
              if (commonEventData.parameters?.result == 16000077) {
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
          bundleName:"com.acts.ability.errcode2",
          abilityName:"AssitAbility",
          parameters: {
            "case":"startErrorCodeCallBackOptions16000077",
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
        console.error(`${TAG} SUB_Ability_AbilityBase_ErrorCode_0007 error, current device not support feature.`);
        done();
      }
    })

     /*
      * @tc.number: SUB_Ability_AbilityBase_ErrorCode_0008
      * @tc.name:  To verify the errcode 16000079 when The APP_INSTANCE_KEY is invalid.
      * @tc.desc: When StartAbility In UIExtension, an error code is 16000079 .
      * @tc.size: MediumTest
      * @tc.type: Function
     * @tc.level: Level 0
     */
    it('SUB_Ability_AbilityBase_ErrorCode_0008', Level.LEVEL0, async (done: Function) => {
      let tag:string = 'SUB_Ability_AbilityBase_UIExtensionStartAbilityCallBackCode_16000079';
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
              if (commonEventData.parameters?.result == 16000079) {
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
          bundleName:"com.acts.ability.errcode2",
          abilityName:"AssitAbility",
          parameters: {
            "case":"startErrorCodeCallBackOptions16000079",
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
        console.error(`${TAG} SUB_Ability_AbilityBase_ErrorCode_0008 error, current device not support feature.`);
        done();
      }
    })

    /*
     * @tc.number: SUB_Ability_AbilityBase_ErrorCode_0008
      * @tc.name:  To verify the errcode 16000076  when The APP_INSTANCE_KEY is invalid.
      * @tc.desc: When StartAbility In UIExtension, an error code is 16000076 .
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
    */
    it('SUB_Ability_AbilityBase_ErrorCode_0009', Level.LEVEL0, async (done: Function) => {
      let tag:string = 'SUB_Ability_AbilityBase_UIExtensionStartAbilityCallBackCodeOptions_16000076';
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
              if (commonEventData.parameters?.result == 16000076) {
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
          bundleName:"com.acts.ability.errcode2",
          abilityName:"AssitAbility",
          parameters: {
            "case":"startErrorCodeCallBackOptions16000076",
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
        console.error(`${TAG} SUB_Ability_AbilityBase_ErrorCode_0009 error, current device not support feature.`);
        done();
      }
    })
  })
}

