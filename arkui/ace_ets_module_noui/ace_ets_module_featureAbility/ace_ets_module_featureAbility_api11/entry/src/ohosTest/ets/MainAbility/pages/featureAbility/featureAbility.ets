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

import Log from '../../common/Log';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct FeatureAbilityStartAbility {
  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear FeatureAbilityStartAbility start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear FeatureAbilityStartAbility end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("featureAbility-StartAbility")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("startAbilityText")
        .onClick(() => {
          FeatureAbility.startAbility({
            bundleName: "com.example.testapp",
            abilityName: "com.example.testApp.MainAbility"
          })
        })

      Text("featureAbility-StartAbilityForResult")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("startAbilityForResultText")
        .onClick(() => {
          FeatureAbility.startAbilityForResult({
            bundleName: "com.example.testapp",
            abilityName: "com.example.testApp.MainAbility"
          })
        })

      Text("featureAbility-FinishWithResult")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("finishWithResultText")
        .onClick(() => {
          FeatureAbility.finishWithResult({ code: 200, result: null })
        })

      Text("featureAbility-GetDeviceList")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("getDeviceListText")
        .onClick(() => {
          FeatureAbility.getDeviceList(1)
        })

      Text("featureAbility-CallAbility")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("callAbilityText")
        .onClick(() => {
          FeatureAbility.callAbility({
            bundleName: "com.example.testapp",
            abilityName: "com.example.testApp.MainAbility",
            messageCode: 200,
            abilityType: 1
          })
        })

      Text("featureAbility-ContinueAbility")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("continueAbilityText")
        .onClick(() => {
          FeatureAbility.continueAbility()
        })

      Text("featureAbility-SubscribeAbilityEvent")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("subscribeAbilityEventText")
        .onClick(() => {
          FeatureAbility.subscribeAbilityEvent({
            bundleName: "com.example.testapp",
            abilityName: "com.example.testApp.MainAbility",
            messageCode: 200,
            abilityType: 1
          }, () => {
          })
        })

      Text("featureAbility-UnsubscribeAbilityEvent")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("unsubscribeAbilityEventText")
        .onClick(() => {
          FeatureAbility.unsubscribeAbilityEvent({
            bundleName: "com.example.testapp",
            abilityName: "com.example.testApp.MainAbility",
            messageCode: 200,
            abilityType: 1
          })
        })

      Text("featureAbility-SendMsg")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("sendMsgText")
        .onClick(() => {
          FeatureAbility.sendMsg({
            deviceId: '1001',
            bundleName: "com.example.testapp",
            abilityName: "com.example.testApp.MainAbility",
            message: 'success',
            success: () => {
              Log.showInfo(TAG, `FeatureAbility.sendMsg success`)
            },
            fail: (data, code) => {
              Log.showInfo(TAG, `FeatureAbility.sendMsg fail: data: ${data},code: ${code}`)
            },
            complete: () => {
              Log.showInfo(TAG, `FeatureAbility.sendMsg complete`)
            }
          })
        })

      Text("featureAbility-SubscribeMsg")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("subscribeMsgText")
        .onClick(() => {
          FeatureAbility.subscribeMsg({
            success: (data) => {
              Log.showInfo(TAG, `FeatureAbility.subscribeMsg success: data: ${JSON.stringify(data)}`)
            },
            fail: (data, code) => {
              Log.showInfo(TAG, `FeatureAbility.subscribeMsg fail: data: ${data},code: ${code}`)
            }
          })
        })

      Text("featureAbility-UnsubscribeMsg")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("unsubscribeMsgText")
        .onClick(() => {
          FeatureAbility.unsubscribeMsg()
        })

      Text("featureAbility-StartAbility")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("featureAbility-StartAbility")
        .onClick(() => {
          FeatureAbility.startAbility(
            {

              bundleName: "com.example.myapplication",
              abilityName: "com.example.entry.secondAbility",
              entities: ['a', 'b'],
              url: ""
            }
          ).then((data) => {
            console.info("==========================>startAbility=======================>");
          });
        })

      Text("featureAbility-startAbilityForResult")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("featureAbility-startAbilityForResult")
        .onClick(() => {
          FeatureAbility.startAbilityForResult(
            {
              bundleName: "com.example.myapplication",
              abilityName: "com.example.entry.secondAbility",
              entities: ['a', 'b'],
              url: ""
            },
          ).then((data) => {
            console.info("==========================>startAbilityForResult=======================>");
          });
        })

      Text("featureAbility-finishWithResult")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("featureAbility-finishWithResult")
        .onClick(() => {
          FeatureAbility.finishWithResult({
            code: 20002,
            result: {}
          }).then((data) => {
            console.info("==========================>startAbilityForResult=======================>");
          });
        })

      Text("featureAbility-getDeviceList")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("featureAbility-finishWithResult")
        .onClick(() => {
          FeatureAbility.getDeviceList(23).then((data) => {
            console.info("==========================>startAbilityForResult=======================>");
          });
        })

      Text("featureAbility-getDeviceList")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("featureAbility-finishWithResult")
        .onClick(() => {
          FeatureAbility.getDeviceList(23).then((data) => {
            console.info("==========================>startAbilityForResult=======================>");
          });
        })

      Text("featureAbility-callAbility")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("featureAbility-callAbility")
        .onClick(() => {
          FeatureAbility.callAbility({
            bundleName: "com.example.myapplication",
            abilityName: "com.example.entry.secondAbility",
            messageCode: 50,
            abilityType: 12
          }).then((data) => {
            console.info("==========================>startAbilityForResult=======================>");
          });
        })

      Text("featureAbility-continueAbility")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("featureAbility-continueAbility")
        .onClick(() => {
          FeatureAbility.continueAbility().then((data) => {
            console.info("==========================>startAbilityForResult=======================>");
          });
        })
      Text("featureAbility-subscribeAbilityEvent")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("featureAbility-subscribeAbilityEvent")
        .onClick(() => {
          FeatureAbility.subscribeAbilityEvent({
            bundleName: "ss",
            abilityName: "d",
            messageCode: 50,
            abilityType: 60,
            syncOption: 20
          }, () => {
            console.info("hello subscribeAbilityEvent")
          }).then((data) => {
            console.info("==========================>startAbilityForResult=======================>");
          });
        })
      Text("featureAbility-unsubscribeAbilityEvent")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("featureAbility-unsubscribeAbilityEvent")
        .onClick(() => {
          FeatureAbility.unsubscribeAbilityEvent({
            bundleName: "d",
            abilityName: "s",
            messageCode: 20,
            abilityType: 30,
            syncOption: 40
          }).then((data) => {
            console.info("==========================>startAbilityForResult=======================>");
          });
        })

    }
    .width("100%")
    .height("100%")
  }
}

