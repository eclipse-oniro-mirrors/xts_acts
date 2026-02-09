/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  AtomicServiceOptions,
  common, OpenLinkOptions, StartOptions, UIExtensionContentSession, Want } from '@kit.AbilityKit';
import EmbeddedUIExtensionAbility from '@ohos.app.ability.EmbeddedUIExtensionAbility';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { rpc } from '@kit.IPCKit';
import eventBusPlue from '../lib/EventBusPlus';

const DOMAIN = 0x0000;
const TAG: string = '[ExampleEmbeddedAbility]';
const uiServiceProxy: common.UIServiceProxy | null = null;
export default class EntryEmbeddedUIExtAbility extends EmbeddedUIExtensionAbility {
  onCreate() {
    hilog.info(DOMAIN, 'testTag', `onCreate`);
  }

  onForeground() {
    hilog.info(DOMAIN, 'testTag', `onForeground`);
  }

  onBackground() {
    hilog.info(DOMAIN, 'testTag', `onBackground`);
  }

  async onDestroy(): Promise<void> {
    hilog.info(DOMAIN, 'testTag', `onDestroy`);
    await eventBusPlue.emit('UIExtension_onDestroy');
  }

  onSessionCreate(want: Want, session: UIExtensionContentSession) {
    const storage: LocalStorage = new LocalStorage();
    let tag = want?.parameters?.case as string;
    storage.setOrCreate('session', session);
    session.loadContent('entryembeddeduiextability/pages/EntryEmbeddedUIExtAbilityPage', storage);
    hilog.info(DOMAIN, 'testTag', `onSessionCreate done`);
    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_0100'){
      try{
        this.context.startAbility(null, (err: BusinessError) => {
          if (err.code) {
            // 处理业务逻辑错误
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          // 执行正常业务
          console.info('startAbility succeed');
        });
      }catch(err){
        console.log(TAG + `startAbility catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish("SUB_Ability_AbilityRuntime_UIExtensionContext_0100_event", commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_0200'){
      let options: StartOptions = {
        displayId: 0
      };
      try{
        this.context.startAbility(null, options, (err: BusinessError) => {
          if (err.code) {
            // 处理业务逻辑错误
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          // 执行正常业务
          console.info('startAbility succeed');
        });
      }catch(err){
        console.log(TAG + `startAbility catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_0200_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_0300'){
      let options: StartOptions = {
        displayId: 0
      };
      try{
        this.context.startAbility(null, options)
          .then(() => {
            // 执行正常业务
            console.info('startAbility succeed');
          })
          .catch((err: BusinessError) => {
            // 处理业务逻辑错误
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
          });
      }catch(err){
        console.log(TAG + `startAbility catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_0300_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_0400'){
      let openLinkOptions: OpenLinkOptions = {
        appLinkingOnly: true
      };
      try{
        this.context.openLink(null, openLinkOptions, (err, result) => {
            console.log(`openLink callback error.code: ${JSON.stringify(err)}`);
            console.log(`openLink callback result: ${JSON.stringify(result.resultCode)}`);
            console.log(`openLink callback result data: ${JSON.stringify(result.want)}`);
          }
        ).then(() => {
          console.log(`open link success.`);
        }).catch((err: BusinessError) => {
          console.log(`open link failed, errCode ${JSON.stringify(err.code)}`);
        });
      }catch(err){
        console.log(TAG + `openLink catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_0400_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_0500'){
      try{
        this.context.startAbilityForResult(null, (err: BusinessError, result: common.AbilityResult) => {
          if (err.code) {
            // 处理业务逻辑错误
            console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          // 执行正常业务
          console.info('startAbilityForResult succeed');
        });
      }catch(err){
        console.log(TAG + `startAbilityForResult catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_0500_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_0600'){
      let options: StartOptions = {
        displayId: 0,
      };
      try{
        this.context.startAbilityForResult(null, options, (err: BusinessError, result: common.AbilityResult) => {
          if (err.code) {
            // 处理业务逻辑错误
            console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          // 执行正常业务
          console.info('startAbilityForResult succeed');
        });
      }catch(err){
        console.log(TAG + `startAbilityForResult catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_0600_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_0700'){
      let options: StartOptions = {
        displayId: 0,
      };
      try{
        this.context.startAbilityForResult(null, options)
          .then((result: common.AbilityResult) => {
            // 执行正常业务
            console.info('startAbilityForResult succeed');
          })
          .catch((err: BusinessError) => {
            // 处理业务逻辑错误
            console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
          });
      }catch(err){
        console.log(TAG + `startAbilityForResult catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_0700_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_0800'){
      let commRemote: rpc.IRemoteObject;
      let options: common.ConnectOptions = {
        onConnect(elementName, remote) {
          commRemote = remote;
          console.info('onConnect...')
        },
        onDisconnect(elementName) {
          console.info('onDisconnect...')
        },
        onFailed(code) {
          console.info('onFailed...')
        }
      };
      let connection: number;
      try{
        connection = this.context.connectServiceExtensionAbility(null, options);
      }catch(err){
        console.log(TAG + `connectServiceExtensionAbility catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_0800_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_0900'){
      let connection = 1;
      let commRemote: rpc.IRemoteObject | null;
      try{
        this.context.disconnectServiceExtensionAbility(null, (err: BusinessError) => {
          commRemote = null;
          if (err.code) {
            // 处理业务逻辑错误
            console.error(`disconnectServiceExtensionAbility failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          // 执行正常业务
          console.info('disconnectServiceExtensionAbility succeed');
        });
      }catch(err){
        console.log(TAG + `disconnectServiceExtensionAbility catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_0900_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_1000'){
      let connection = 1;
      let commRemote: rpc.IRemoteObject | null;
      try{
        this.context.disconnectServiceExtensionAbility(null).then(() => {
          commRemote = null;
          // 执行正常业务
          console.info('disconnectServiceExtensionAbility succeed');
        }).catch((err: BusinessError) => {
          // 处理业务逻辑错误
          console.error(`disconnectServiceExtensionAbility failed, code is ${err.code}, message is ${err.message}`);
        })
      }catch(err){
        console.log(TAG + `disconnectServiceExtensionAbility catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_1000_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_1100'){
      try{
        this.context.terminateSelfWithResult(null, (err: BusinessError) => {
          if (err.code) {
            // 处理业务逻辑错误
            console.error(`terminateSelfWithResult failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          // 执行正常业务
          console.info('terminateSelfWithResult succeed');
        });
      }catch(err){
        console.log(TAG + `terminateSelfWithResult catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_1100_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_1200'){
      try{
        this.context.terminateSelfWithResult(null)
          .then(() => {
            // 执行正常业务
            console.info('terminateSelfWithResult succeed');
          })
          .catch((err: BusinessError) => {
            // 处理业务逻辑错误
            console.error(`terminateSelfWithResult failed, code is ${err.code}, message is ${err.message}`);
          });
      }catch(err){
        console.log(TAG + `terminateSelfWithResult catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_1200_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_1300'){
      try{
        let options: AtomicServiceOptions = {
          displayId: 0,
        };
        this.context.openAtomicService(null, options)
          .then((result: common.AbilityResult) => {
            // 执行正常业务
            console.info('openAtomicService succeed');
          })
          .catch((err: BusinessError) => {
            // 处理业务逻辑错误
            console.error(`openAtomicService failed, code is ${err.code}, message is ${err.message}`);
          });
      }catch(err){
        console.log(TAG + `openAtomicService catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_1300_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_1400'){
      try{
        this.context.startUIServiceExtensionAbility(null).then(() => {
          console.log('startUIServiceExtensionAbility success');
        }).catch((error: BusinessError) => {
          console.log('startUIServiceExtensionAbility error', JSON.stringify(error));
        })
      }catch(err){
        console.log(TAG + `startUIServiceExtensionAbility catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_1400_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_1500'){
      try{
        const callback: common.UIServiceExtensionConnectCallback = {
          onData: (data: Record<string, Object>): void => {
            console.log('onData:', JSON.stringify(data));
          },
          onDisconnect: (): void => {
            console.log('onDisconnect');
          }
        };
        this.context.connectUIServiceExtensionAbility(null, callback).then((uiServiceProxy: common.UIServiceProxy) => {
          uiServiceProxy = uiServiceProxy;
          console.log('connectUIServiceExtensionAbility success');
        }).catch((error: BusinessError) => {
          console.log('connectUIServiceExtensionAbility failed', JSON.stringify(error));
        })
      }catch(err){
        console.log(TAG + `connectUIServiceExtensionAbility catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_1500_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_1600'){
      try{
        this.context.disconnectUIServiceExtensionAbility(null).then(() => {
          console.log('disconnectUIServiceExtensionAbility success');
        }).catch((error: BusinessError) => {
          console.log('disconnectUIServiceExtensionAbility failed', JSON.stringify(error));
        })
      }catch(err){
        console.log(TAG + `disconnectUIServiceExtensionAbility catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_1600_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_1700'){
      try{
       let code = this.context.setColorMode(null);
        console.log('setcolor mode', JSON.stringify(code));
      }catch(err){
        console.log(TAG + `setColorMode catch failed, code is ${err}`);
        console.log(TAG + `setColorMode catch failed, code is ${err.code}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_1700_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_1800'){
      try{
        this.context.startAbility(undefined, (err: BusinessError) => {
          if (err.code) {
            // 处理业务逻辑错误
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          // 执行正常业务
          console.info('startAbility succeed');
        });
      }catch(err){
        console.log(TAG + `startAbility catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_1800_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_1900'){
      let options: StartOptions = {
        displayId: 0
      };
      try{
        this.context.startAbility(undefined, options, (err: BusinessError) => {
          if (err.code) {
            // 处理业务逻辑错误
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          // 执行正常业务
          console.info('startAbility succeed');
        });
      }catch(err){
        console.log(TAG + `startAbility catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_1900_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_2000'){
      let options: StartOptions = {
        displayId: 0
      };
      try{
        this.context.startAbility(undefined, options)
          .then(() => {
            // 执行正常业务
            console.info('startAbility succeed');
          })
          .catch((err: BusinessError) => {
            // 处理业务逻辑错误
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
          });
      }catch(err){
        console.log(TAG + `startAbility catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_2000_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_2100'){
      let openLinkOptions: OpenLinkOptions = {
        appLinkingOnly: true
      };
      try{
        this.context.openLink(undefined, openLinkOptions, (err, result) => {
          console.log(`openLink callback error.code: ${JSON.stringify(err)}`);
          console.log(`openLink callback result: ${JSON.stringify(result.resultCode)}`);
          console.log(`openLink callback result data: ${JSON.stringify(result.want)}`);
        }
        ).then(() => {
          console.log(`open link success.`);
        }).catch((err: BusinessError) => {
          console.log(`open link failed, errCode ${JSON.stringify(err.code)}`);
        });
      }catch(err){
        console.log(TAG + `openLink catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_2100_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_2200'){
      try{
        this.context.startAbilityForResult(undefined, (err: BusinessError, result: common.AbilityResult) => {
          if (err.code) {
            // 处理业务逻辑错误
            console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          // 执行正常业务
          console.info('startAbilityForResult succeed');
        });
      }catch(err){
        console.log(TAG + `startAbilityForResult catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_2200_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_2300'){
      let options: StartOptions = {
        displayId: 0,
      };
      try{
        this.context.startAbilityForResult(undefined, options, (err: BusinessError, result: common.AbilityResult) => {
          if (err.code) {
            // 处理业务逻辑错误
            console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          // 执行正常业务
          console.info('startAbilityForResult succeed');
        });
      }catch(err){
        console.log(TAG + `startAbilityForResult catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_2300_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_2400'){
      let options: StartOptions = {
        displayId: 0,
      };
      try{
        this.context.startAbilityForResult(undefined, options)
          .then((result: common.AbilityResult) => {
            // 执行正常业务
            console.info('startAbilityForResult succeed');
          })
          .catch((err: BusinessError) => {
            // 处理业务逻辑错误
            console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
          });
      }catch(err){
        console.log(TAG + `startAbilityForResult catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_2400_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_2500'){
      let commRemote: rpc.IRemoteObject;
      let options: common.ConnectOptions = {
        onConnect(elementName, remote) {
          commRemote = remote;
          console.info('onConnect...')
        },
        onDisconnect(elementName) {
          console.info('onDisconnect...')
        },
        onFailed(code) {
          console.info('onFailed...')
        }
      };
      let connection: number;
      try{
        connection = this.context.connectServiceExtensionAbility(undefined, options);
      }catch(err){
        console.log(TAG + `connectServiceExtensionAbility catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_2500_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_2600'){
      let connection = 1;
      let commRemote: rpc.IRemoteObject | null;
      try{
        this.context.disconnectServiceExtensionAbility(undefined, (err: BusinessError) => {
          commRemote = null;
          if (err.code) {
            // 处理业务逻辑错误
            console.error(`disconnectServiceExtensionAbility failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          // 执行正常业务
          console.info('disconnectServiceExtensionAbility succeed');
        });
      }catch(err){
        console.log(TAG + `disconnectServiceExtensionAbility catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_2600_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_2700'){
      let connection = 1;
      let commRemote: rpc.IRemoteObject | null;
      try{
        this.context.disconnectServiceExtensionAbility(undefined).then(() => {
          commRemote = null;
          // 执行正常业务
          console.info('disconnectServiceExtensionAbility succeed');
        }).catch((err: BusinessError) => {
          // 处理业务逻辑错误
          console.error(`disconnectServiceExtensionAbility failed, code is ${err.code}, message is ${err.message}`);
        })
      }catch(err){
        console.log(TAG + `disconnectServiceExtensionAbility catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_2700_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_2800'){
      try{
        this.context.terminateSelfWithResult(undefined, (err: BusinessError) => {
          if (err.code) {
            // 处理业务逻辑错误
            console.error(`terminateSelfWithResult failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          // 执行正常业务
          console.info('terminateSelfWithResult succeed');
        });
      }catch(err){
        console.log(TAG + `terminateSelfWithResult catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_2800_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_2900'){
      try{
        this.context.terminateSelfWithResult(undefined)
          .then(() => {
            // 执行正常业务
            console.info('terminateSelfWithResult succeed');
          })
          .catch((err: BusinessError) => {
            // 处理业务逻辑错误
            console.error(`terminateSelfWithResult failed, code is ${err.code}, message is ${err.message}`);
          });
      }catch(err){
        console.log(TAG + `terminateSelfWithResult catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_2900_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_3000'){
      try{
        let options: AtomicServiceOptions = {
          displayId: 0,
        };
        this.context.openAtomicService(undefined, options)
          .then((result: common.AbilityResult) => {
            // 执行正常业务
            console.info('openAtomicService succeed');
          })
          .catch((err: BusinessError) => {
            // 处理业务逻辑错误
            console.error(`openAtomicService failed, code is ${err.code}, message is ${err.message}`);
          });
      }catch(err){
        console.log(TAG + `openAtomicService catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_3000_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_3100'){
      try{
        this.context.startUIServiceExtensionAbility(undefined).then(() => {
          console.log('startUIServiceExtensionAbility success');
        }).catch((error: BusinessError) => {
          console.log('startUIServiceExtensionAbility error', JSON.stringify(error));
        })
      }catch(err){
        console.log(TAG + `startUIServiceExtensionAbility catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_3100_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_3200'){
      try{
        const callback: common.UIServiceExtensionConnectCallback = {
          onData: (data: Record<string, Object>): void => {
            console.log('onData:', JSON.stringify(data));
          },
          onDisconnect: (): void => {
            console.log('onDisconnect');
          }
        };
        this.context.connectUIServiceExtensionAbility(undefined, callback)
        .then((uiServiceProxy: common.UIServiceProxy) => {
          uiServiceProxy = uiServiceProxy;
          console.log('connectUIServiceExtensionAbility success');
        }).catch((error: BusinessError) => {
          console.log('connectUIServiceExtensionAbility failed', JSON.stringify(error));
        })
      }catch(err){
        console.log(TAG + `connectUIServiceExtensionAbility catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_3200_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_3300'){
      try{
        this.context.disconnectUIServiceExtensionAbility(undefined).then(() => {
          console.log('disconnectUIServiceExtensionAbility success');
        }).catch((error: BusinessError) => {
          console.log('disconnectUIServiceExtensionAbility failed', JSON.stringify(error));
        })
      }catch(err){
        console.log(TAG + `disconnectUIServiceExtensionAbility catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_3300_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if(want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_3400'){
      try{
        let code = this.context.setColorMode(undefined);
        console.log('setcolor mode', JSON.stringify(code));
      }catch(err){
        console.log(TAG + `setColorMode catch failed, code is ${err}`);
        console.log(TAG + `setColorMode catch failed, code is ${err.code}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_3400_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if (want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_3500') {
      try {
        let options: AtomicServiceOptions = {
          displayId: 0,
        };
        this.context.openAtomicService(null)
          .then((result: common.AbilityResult) => {
            // 执行正常业务
            console.info('openAtomicService succeed');
          })
          .catch((err: BusinessError) => {
            // 处理业务逻辑错误
            console.error(`openAtomicService failed, code is ${err.code}, message is ${err.message}`);
          });
      } catch (err) {
        console.log(TAG + `openAtomicService catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_3500_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if (want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_3600') {
      try {
        this.context.openLink(null).then(() => {
          console.log(`open link success.`);
        }).catch((err: BusinessError) => {
          console.log(`open link failed, errCode ${JSON.stringify(err.code)}`);
        });
      } catch (err) {
        console.log(TAG + `openLink catch failed, code is ${err}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_3600_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };

    if (want?.parameters?.case == 'SUB_Ability_AbilityRuntime_UIExtensionContext_3700') {
      try {
        session.loadContent(null);
      } catch (err) {
        console.log(TAG + `loadContent catch failed, code is ${err}`);
        console.log(TAG + `loadContent catch failed, code is ${err.code}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish('SUB_Ability_AbilityRuntime_UIExtensionContext_3700_event', commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      }
    };
  }

  onSessionDestroy(session: UIExtensionContentSession) {
    session.terminateSelf().catch(() => {
      // handle error
    });
    hilog.info(DOMAIN, 'testTag', `onSessionDestroy`);
  }
}
