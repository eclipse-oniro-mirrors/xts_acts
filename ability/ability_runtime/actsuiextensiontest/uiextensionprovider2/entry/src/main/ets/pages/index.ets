/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import UIExtensionContentSession from '@ohos.app.ability.UIExtensionContentSession'
import IdlServiceExtProxy from '../IdlServiceExt/idl_service_ext_proxy';
import commonEventManager from '@ohos.commonEventManager'
import Logger from '../model/Logger'
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import { bundleManager } from '@kit.AbilityKit';
import { rpc } from '@kit.IPCKit';

const TAG: string = '[UIExtAbility]'
const sleepTimeOne = 1000;

let storage = LocalStorage.GetShared();

@Entry(storage)
@Component
struct Index {
  @State message: string = 'UIExtension'
  private session: UIExtensionContentSession = storage.get<UIExtensionContentSession>('session')!;
  
  aboutToAppear() {
    let appearEvent = 'ACTS_UIExtension_AboutToAppear';
    let differentAppEvent007 = 'ACTS_UIExtension_DifferentApp007';
    let differentAppEvent009 = 'ACTS_UIExtension_DifferentApp009';
    let differentAppEvent010 = 'ACTS_UIExtension_DifferentApp010';
    let subscriber:commonEventManager.CommonEventSubscriber;
    let subscribeInfo:commonEventManager.CommonEventSubscribeInfo = {
      events: [differentAppEvent007,differentAppEvent009,differentAppEvent010]
    }
    commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
      console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
      subscriber = data;

      commonEventManager.subscribe(subscriber, async (err, data) => {
        console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));
        console.log(TAG + "get data event ->" + data.event);
       if (data.event == differentAppEvent007) { 
          commonEventManager.unsubscribe(subscriber, async (err, data) => {
            console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
          });
          this.doDifferentAppEvent007();
        } else if (data.event == differentAppEvent009) { 
          commonEventManager.unsubscribe(subscriber, async (err, data) => {
            console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
          });
          this.doDifferentAppEvent009();
        } else if (data.event == differentAppEvent010) { 
          commonEventManager.unsubscribe(subscriber, async (err, data) => {
            console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
          });
          this.doDifferentAppEvent010();
        } 
      });
    }).catch((error:BusinessError) => {
      console.log(TAG + "createSubscriber error : " + JSON.stringify(error));
    })
    setTimeout(async () => {
      commonEventManager.publish(appearEvent, (err) => {
        if (err) {
          Logger.log(TAG + `publish ACTS_UIExtension_AboutToAppear failed, code is ${err.code}, message is ${err.message}`);
        } else {
          Logger.log(TAG + 'publish ACTS_UIExtension_AboutToAppear success');
        }
      });
    }, sleepTimeOne);
  }

  async doDifferentAppEvent007(){
    let successDifferentAppEvent007_visible = 'ACTS_UIExtension_DifferentApp007_visibleSuccess';
    let successDifferentAppEvent007_unvisible = 'ACTS_UIExtension_DifferentApp007_unvisibleSuccess';
    console.log(TAG + "start doDifferentAppEvent007");
    let wantUnvisible:Want = {
      "bundleName": "com.acts.uiextensionservice",
      "abilityName": "TestServiceExtAbilityUnvisible"
    };
    let optionsUnvisible:common.ConnectOptions = {
      onConnect(elementName:bundleManager.ElementName, remote: rpc.IRemoteObject) {
        commonEventManager.publish(successDifferentAppEvent007_unvisible, (err) => { }); 
        console.info('successDifferentAppEvent006_unvisible___')
      },
      onDisconnect(elementName:bundleManager.ElementName) {
      },
      onFailed(code:number) {
      }
    }
    let want:Want = {
      "bundleName": "com.acts.uiextensionservice",
      "abilityName": "TestServiceExtAbility"
    };
    let options:common.ConnectOptions = {
      onConnect(elementName:bundleManager.ElementName, remote:rpc.IRemoteObject) {
        commonEventManager.publish(successDifferentAppEvent007_visible, (err) => { }); 
        console.info('successDifferentAppEvent006_visible___' + elementName);
      },
      onDisconnect(elementName:bundleManager.ElementName) {
      },
      onFailed(code:number) {
      }
    }
    let connectid:number = globalThis.context2.connectServiceExtensionAbility(want, options);
    connectid = globalThis.context2.connectServiceExtensionAbility(wantUnvisible, optionsUnvisible);
    await this.sleep(400);
  }

  async doDifferentAppEvent009(){
    let successDifferentAppEvent009_visible = 'ACTS_UIExtension_DifferentApp009_visibleSuccess';
    let successDifferentAppEvent009_unvisible = 'ACTS_UIExtension_DifferentApp009_unvisibleSuccess';
    console.log(TAG + "start doDifferentAppEvent009");
    let wantUnvisible:Want = {
      "bundleName": "com.acts.uiextensionservice",
      "abilityName": "TestServiceExtAbilityUnvisible"
    };
    let optionsUnvisible:common.ConnectOptions = {
      onConnect(elementName:bundleManager.ElementName, remote:rpc.IRemoteObject) {
        commonEventManager.publish(successDifferentAppEvent009_unvisible, (err) => { }); 
        console.info('successDifferentAppEvent006_unvisible___')
      },
      onDisconnect(elementName:bundleManager.ElementName) {
      },
      onFailed(code:number) {
      }
    }
    let want:Want = {
      "bundleName": "com.acts.uiextensionservice",
      "abilityName": "TestServiceExtAbility"
    };
    let options:common.ConnectOptions = {
      onConnect(elementName:bundleManager.ElementName, remote:rpc.IRemoteObject) {
        commonEventManager.publish(successDifferentAppEvent009_visible, (err) => { }); 
        console.info('successDifferentAppEvent006_visible___' + elementName);
      },
      onDisconnect(elementName:bundleManager.ElementName) {
      },
      onFailed(code:number) {
      }
    }

    // to the background
    await globalThis.context2.startAbility(
      {
        bundleName: 'com.acts.uiextensionprovider2',
        abilityName: 'MainAbility'
      })
    await this.sleep(1000);
    let connectid:number = globalThis.context2.connectServiceExtensionAbility(want, options);
    await this.sleep(400);
    connectid = globalThis.context2.connectServiceExtensionAbility(wantUnvisible, optionsUnvisible);
    await this.sleep(400);
  }

  doDifferentAppEvent010(){
    let successDifferentAppEvent010_ext2 = 'ACTS_UIExtension_DifferentApp010_ext2_Success';
    console.log(TAG + "recv connectAbilityEvent");
    let want:Want = {
      "bundleName": "com.acts.uiextensionservice",
      "abilityName": "TestServiceExtAbility"
    };
    let options:common.ConnectOptions ={
      onConnect(elementName:bundleManager.ElementName, remote:rpc.IRemoteObject) {
        commonEventManager.publish(successDifferentAppEvent010_ext2, (err) => { }); 
      },
      onDisconnect(elementName:bundleManager.ElementName) {
      },
      onFailed(code:number) {
      }
    }
    globalThis.context2.connectServiceExtensionAbility(want, options);
  }

  sleep(ms: number): Promise<void> {
    return new Promise((resolve) => setTimeout(resolve, ms));
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}