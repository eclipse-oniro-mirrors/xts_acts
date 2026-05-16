/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { UIExtensionContentSession } from '@kit.AbilityKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import './HapPageNoStorage';

let TAG: string = 'testTag';
const UI_EXTENSION_PAGE5_ON_READY: string = 'UIExtension_Page5_OnReady';
let UI_EXTENSION_LOAD_CONTENT_TEST0100: string = 'UIExtension_LoadContent_Test0100';
let UI_EXTENSION_LOAD_CONTENT_TEST0100_RET: string = 'UIExtension_LoadContent_Test0100_ret';

let UI_EXTENSION_LOAD_CONTENT_TEST0200: string = 'UIExtension_LoadContent_Test0200';
let UI_EXTENSION_LOAD_CONTENT_TEST0200_RET: string = 'UIExtension_LoadContent_Test0200_ret';

let UI_EXTENSION_LOAD_CONTENT_TEST0300: string = 'UIExtension_LoadContent_Test0300';
let UI_EXTENSION_LOAD_CONTENT_TEST0300_RET: string = 'UIExtension_LoadContent_Test0300_ret';

let UI_EXTENSION_LOAD_CONTENT_TEST0400: string = 'UIExtension_LoadContent_Test0400';
let UI_EXTENSION_LOAD_CONTENT_TEST0400_RET: string = 'UIExtension_LoadContent_Test0400_ret';

let UI_EXTENSION_LOAD_CONTENT_TEST0500: string = 'UIExtension_LoadContent_Test0500';
let UI_EXTENSION_LOAD_CONTENT_TEST0500_RET: string = 'UIExtension_LoadContent_Test0500_ret';

let UI_EXTENSION_LOAD_CONTENT_TEST0600: string = 'UIExtension_LoadContent_Test0600';
let UI_EXTENSION_LOAD_CONTENT_TEST0600_RET: string = 'UIExtension_LoadContent_Test0600_ret';

let UI_EXTENSION_LOAD_CONTENT_TEST0700: string = 'UIExtension_LoadContent_Test0700';
let UI_EXTENSION_LOAD_CONTENT_TEST0700_RET: string = 'UIExtension_LoadContent_Test0700_ret';

let UI_EXTENSION_LOAD_CONTENT_TEST0800: string = 'UIExtension_LoadContent_Test0800';

@Entry({ routeName: 'UIExtPage' })
@Component
struct UIExtAbilityPage {
  @State message: string = 'UIExtAbility';
  storage: LocalStorage | undefined = LocalStorage.getShared();
  private session: UIExtensionContentSession | undefined = this.storage?.get<UIExtensionContentSession>('session');
  subscriber: commonEventManager.CommonEventSubscriber | undefined;
  subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
    events: [UI_EXTENSION_LOAD_CONTENT_TEST0100, UI_EXTENSION_LOAD_CONTENT_TEST0200, UI_EXTENSION_LOAD_CONTENT_TEST0300,
      UI_EXTENSION_LOAD_CONTENT_TEST0400, UI_EXTENSION_LOAD_CONTENT_TEST0500, UI_EXTENSION_LOAD_CONTENT_TEST0600,
      UI_EXTENSION_LOAD_CONTENT_TEST0700, UI_EXTENSION_LOAD_CONTENT_TEST0800]
  };

  unSubscribeCb() {
    hilog.info(0x0000, TAG, '%{public}s', 'unSubscribeCb');
  }

  publishCb(err: BusinessError) {
    if (err) {
      hilog.info(0x0000, TAG, 'publish failed %{public}s', JSON.stringify(err));
    } else {
      hilog.info(0x0000, TAG, '%{public}s', 'publish success');
    }
  }

  aboutToDisappear(): void {
    commonEventManager.unsubscribe(this.subscriber, this.unSubscribeCb);
  }

  aboutToAppear() {
    console.info('testTag' + 'UIExtAbilityPage aboutToAppear');

    let subscribeCb: (err: BusinessError, data: commonEventManager.CommonEventData) => void =
      (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
          hilog.info(0x0000, TAG, 'subscribe failed %{public}s', JSON.stringify(err));
        } else if (data.event === UI_EXTENSION_LOAD_CONTENT_TEST0100) {
          hilog.info(0x0000, TAG, 'subscribe success, Consume 0100 callback %{public}s', JSON.stringify(data));
          try {
            this.session?.loadContentByName(null, this.storage);
          } catch (err) {
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error('testTag' + `loadContentByName failed, code is ${code}, message is ${message}`);
            let options: commonEventManager.CommonEventPublishData = {
              parameters: {
                'testCaseResultCode': code,
                'testCaseResultMsg': message,
              }
            }
            commonEventManager.publish(UI_EXTENSION_LOAD_CONTENT_TEST0100_RET, options, this.publishCb);
          }
        } else if (data.event === UI_EXTENSION_LOAD_CONTENT_TEST0200) {
          hilog.info(0x0000, TAG, 'subscribe success, Consume 0200 callback %{public}s', JSON.stringify(data));
          try {
            this.session?.loadContentByName(undefined, this.storage);
          } catch (err) {
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error('testTag' + `loadContentByName failed, code is ${code}, message is ${message}`);
            let options: commonEventManager.CommonEventPublishData = {
              parameters: {
                'testCaseResultCode': code,
                'testCaseResultMsg': message,
              }
            }
            commonEventManager.publish(UI_EXTENSION_LOAD_CONTENT_TEST0200_RET, options, this.publishCb);
          }
        } else if (data.event === UI_EXTENSION_LOAD_CONTENT_TEST0300) {
          hilog.info(0x0000, TAG, 'subscribe success, Consume 0300 callback %{public}s', JSON.stringify(data));
          try {
            this.session?.loadContentByName('UIExtPage', null);
          } catch (err) {
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error('testTag' + `loadContentByName failed, code is ${code}, message is ${message}`);
            let options: commonEventManager.CommonEventPublishData = {
              parameters: {
                'testCaseResultCode': code,
                'testCaseResultMsg': message,
              }
            }
            commonEventManager.publish(UI_EXTENSION_LOAD_CONTENT_TEST0300_RET, options, this.publishCb);
          }
        } else if (data.event === UI_EXTENSION_LOAD_CONTENT_TEST0400) {
          hilog.info(0x0000, TAG, 'subscribe success, Consume 0400 callback %{public}s', JSON.stringify(data));
          try {
            this.session?.loadContentByName('UIExtPage', undefined);
          } catch (err) {
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error('testTag' + `loadContentByName failed, code is ${code}, message is ${message}`);
            let options: commonEventManager.CommonEventPublishData = {
              parameters: {
                'testCaseResultCode': code,
                'testCaseResultMsg': message,
              }
            }
            commonEventManager.publish(UI_EXTENSION_LOAD_CONTENT_TEST0400_RET, options, this.publishCb);
          }
        } else if (data.event === UI_EXTENSION_LOAD_CONTENT_TEST0500) {
          hilog.info(0x0000, TAG, 'subscribe success, Consume 0500 callback %{public}s', JSON.stringify(data));
          let ret0500: boolean = true;
          try {
            this.session?.setWindowBackgroundColor('#0D9FFB');
          } catch (err) {
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error('testTag' + `setWindowBackgroundColor failed, code is ${code}, message is ${message}`);
            ret0500 = false;
          }
          let options: commonEventManager.CommonEventPublishData = {
            parameters: {
              'testCaseResultCode': ret0500,
            }
          }
          commonEventManager.publish(UI_EXTENSION_LOAD_CONTENT_TEST0500_RET, options, this.publishCb);
        } else if (data.event === UI_EXTENSION_LOAD_CONTENT_TEST0600) {
          hilog.info(0x0000, TAG, 'subscribe success, Consume 0600 callback %{public}s', JSON.stringify(data));
          let ret0600: boolean = true;
          try {
            this.session?.loadContentByName('', this.storage);
          } catch (err) {
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error('testTag' + `loadContentByName failed, code is ${code}, message is ${message}`);
            ret0600 = false;
          }
          let options: commonEventManager.CommonEventPublishData = {
            parameters: {
              'testCaseResultCode': ret0600,
            }
          }
          commonEventManager.publish(UI_EXTENSION_LOAD_CONTENT_TEST0600_RET, options, this.publishCb);
        } else if (data.event === UI_EXTENSION_LOAD_CONTENT_TEST0700) {
          hilog.info(0x0000, TAG, 'subscribe success, Consume 0700 callback %{public}s', JSON.stringify(data));
          let ret0700: boolean = true;
          try {
            this.session?.loadContentByName('HapSysCommonPageNotExist', this.storage);
          } catch (err) {
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error('testTag' + `loadContentByName failed, code is ${code}, message is ${message}`);
            ret0700 = false;
          }
          let options: commonEventManager.CommonEventPublishData = {
            parameters: {
              'testCaseResultCode': ret0700,
            }
          }
          commonEventManager.publish(UI_EXTENSION_LOAD_CONTENT_TEST0700_RET, options, this.publishCb);
        } else if (data.event === UI_EXTENSION_LOAD_CONTENT_TEST0800) {
          hilog.info(0x0000, TAG, 'subscribe success, Consume 0800 callback %{public}s', JSON.stringify(data));
          try {
            this.session?.loadContentByName('HapPageNoStorage');
          } catch (err) {
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error('testTag' + `loadContentByName failed, code is ${code}, message is ${message}`);
          }
        }
      }

    commonEventManager.createSubscriber(this.subscribeInfo)
      .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', 'createSubscriber success');
        this.subscriber = commonEventSubscriber;
        commonEventManager.subscribe(this.subscriber, subscribeCb);
        setTimeout(()=>{
          commonEventManager.publish(UI_EXTENSION_PAGE5_ON_READY, this.publishCb);
        }, 500)
      })
      .catch((err: BusinessError) => {
        hilog.info(0x0000, TAG, 'createSubscriber failed %{public}s', JSON.stringify(err));
      })
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('terminate self')
          .width('80%')
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          })
          .onClick(() => {
            hilog.info(0x0000, 'testTag', '%{public}s', 'terminateSelf');
            this.session?.terminateSelf();
            this.storage?.clear();
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
