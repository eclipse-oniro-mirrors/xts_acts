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
import Want from '@ohos.app.ability.Want';
import UIExtensionContentSession from '@ohos.app.ability.UIExtensionContentSession';
import commonEventManager from '@ohos.commonEventManager';

const sleepTimeOne = 1000;
var storage = LocalStorage.GetShared();

@Entry(storage)
@Component
struct Page {
  @State message: string = 'UIExtAbility';
  @StorageLink('actionWant') want: Want = {
    action: "Acts_ActionExtensionAbility_1700",
    bundleName: 'com.example.actsactionextensionabilitytest',
    abilityName: 'ActsActionExtensionAbility',
    parameters: {
      'ability.want.params.uiExtensionType': 'action'
    }
  };
  private session: UIExtensionContentSession = storage.get<UIExtensionContentSession>('session');

  aboutToAppear() {
    var appearEvent = 'ACTS_UIExtension_AboutToAppear';
    var terminateSelfWithResultEvent = 'ACTS_UIExtension_TerminateSelfWithResult';
    var sendDataEvent = 'ACTS_UIExtension_SendData';

    var subscriber;
    var subscribeInfo = {
      events: [terminateSelfWithResultEvent, sendDataEvent]
    };
    commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
      console.log('createSubscriber data : ' + JSON.stringify(data));
      subscriber = data;

      commonEventManager.subscribe(subscriber, async (err, data) => {
        console.log('SubscribeInfoCallback : ' + JSON.stringify(data));
        if (data.event === terminateSelfWithResultEvent) {
          this.session.terminateSelfWithResult({
            'resultCode': 1,
            'want': {
              'action': 'ACTION'
            }
          });
          commonEventManager.unsubscribe(subscriber, async (err, data) => {
            console.log('UnSubscribeInfoCallback : ' + JSON.stringify(data));
          });
        } else if (data.event === sendDataEvent) {
          this.session.sendData({
            name: {
              test: 'actionExtensionTest'
            }
          });
          commonEventManager.unsubscribe(subscriber, async (err, data) => {
            console.log('UnSubscribeInfoCallback : ' + JSON.stringify(data));
          });
        }
      });
    }).catch((error) => {
      console.log('createSubscriber error : ' + JSON.stringify(error));
    })
    setTimeout(() => {
      commonEventManager.publish(appearEvent, function (){});
    }, sleepTimeOne);
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        UIExtensionComponent(this.want)
        .size({width:'100%',height:'100'})
        .backgroundColor(Color.Blue)
        .border({width:5,color:Color.Red})
      }
      .width('100%')
    }
    .height('100%')
  }
}