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
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import hilog from '@ohos.hilog';

@Entry
@Component
struct popupFirstTest {
  @State handlePopup: boolean = false

  aboutToAppear() {
    let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    // Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Row() {
      Column() {
        Button('PopupOptions')
          .margin(100)
          .height(150)
          .width("65%")
          .backgroundColor("#ff4d5085")
          .onClick(() => {
            this.handlePopup = !this.handlePopup
          })
          .key("forPopup")
          .bindPopup(this.handlePopup, {
            message: 'Pop',
            enableArrow: true,
            placement: Placement.Top,
            messageOptions: { textColor: Color.Blue, font: { weight: FontWeight.Bolder, size: 25 } },
            onStateChange: (e) => {
              console.info(JSON.stringify(e.isVisible))
              if (!e.isVisible) {
                this.handlePopup = false
              }
            }
          })
        Button('PopupOptions')
          .margin(100)
          .height(150)
          .width("65%")
          .backgroundColor("#ff4d5085")
          .onClick(() => {
            this.handlePopup = !this.handlePopup
          })
          .bindPopup(this.handlePopup, {
            message: 'Pop',
            enableArrow: false,
            placement: Placement.TopLeft,
            messageOptions: { textColor: Color.Blue, font: { weight: FontWeight.Bolder, size: 25 } },
            onStateChange: (e) => {
              console.info(JSON.stringify(e.isVisible))
              if (!e.isVisible) {
                this.handlePopup = false
              }
            }
          })
        Button('PopupOptions')
          .margin(100)
          .height(150)
          .width("65%")
          .backgroundColor("#ff4d5085")
          .onClick(() => {
            this.handlePopup = !this.handlePopup
          })
          .bindPopup(this.handlePopup, {
            message: 'Pop',
            enableArrow: true,
            placement: Placement.TopRight,
            messageOptions: { textColor: Color.Blue, font: { weight: FontWeight.Bolder, size: 25 } },
            onStateChange: (e) => {
              console.info(JSON.stringify(e.isVisible))
              if (!e.isVisible) {
                this.handlePopup = false
              }
            }
          })
        Button('PopupOptions')
          .margin(100)
          .height(150)
          .width("65%")
          .backgroundColor("#ff4d5085")
          .onClick(() => {
            this.handlePopup = !this.handlePopup
          })
          .bindPopup(this.handlePopup, {
            message: 'Pop',
            enableArrow: true,
            placement: Placement.BottomLeft,
            messageOptions: { textColor: Color.Blue, font: { weight: FontWeight.Bolder, size: 25 } },
            onStateChange: (e) => {
              console.info(JSON.stringify(e.isVisible))
              if (!e.isVisible) {
                this.handlePopup = false
              }
            }
          })
        Button('PopupOptions')
          .margin(100)
          .height(150)
          .width("65%")
          .backgroundColor("#ff4d5085")
          .onClick(() => {
            this.handlePopup = !this.handlePopup
          })
          .bindPopup(this.handlePopup, {
            message: 'Pop',
            enableArrow: true,
            placement: Placement.Bottom,
            messageOptions: { textColor: Color.Blue, font: { weight: FontWeight.Bolder, size: 25 } },
            onStateChange: (e) => {
              console.info(JSON.stringify(e.isVisible))
              if (!e.isVisible) {
                this.handlePopup = false
              }
            }
          })
        Button('PopupOptions')
          .margin(100)
          .height(150)
          .width("65%")
          .backgroundColor("#ff4d5085")
          .onClick(() => {
            this.handlePopup = !this.handlePopup
          })
          .bindPopup(this.handlePopup, {
            message: 'Pop',
            enableArrow: true,
            placement: Placement.BottomRight,
            messageOptions: { textColor: Color.Blue, font: { weight: FontWeight.Bolder, size: 25 } },
            onStateChange: (e) => {
              console.info(JSON.stringify(e.isVisible))
              if (!e.isVisible) {
                this.handlePopup = false
              }
            }
          })
        Button('PopupOptions')
          .margin(100)
          .height(150)
          .width("65%")
          .backgroundColor("#ff4d5085")
          .onClick(() => {
            this.handlePopup = !this.handlePopup
          })
          .bindPopup(this.handlePopup, {
            message: 'Pop',
            enableArrow: true,
            placement: Placement.LeftTop,
            messageOptions: { textColor: Color.Blue, font: { weight: FontWeight.Bolder, size: 25 } },
            onStateChange: (e) => {
              console.info(JSON.stringify(e.isVisible))
              if (!e.isVisible) {
                this.handlePopup = false
              }
            }
          })
        Button('PopupOptions')
          .margin(100)
          .height(150)
          .width("65%")
          .backgroundColor("#ff4d5085")
          .onClick(() => {
            this.handlePopup = !this.handlePopup
          })
          .bindPopup(this.handlePopup, {
            message: 'Pop',
            enableArrow: true,
            placement: Placement.Left,
            messageOptions: { textColor: Color.Blue, font: { weight: FontWeight.Bolder, size: 25 } },
            onStateChange: (e) => {
              console.info(JSON.stringify(e.isVisible))
              if (!e.isVisible) {
                this.handlePopup = false
              }
            }
          })
        Button('PopupOptions')
          .margin(100)
          .height(150)
          .width("65%")
          .backgroundColor("#ff4d5085")
          .onClick(() => {
            this.handlePopup = !this.handlePopup
          })
          .bindPopup(this.handlePopup, {
            message: 'Pop',
            enableArrow: true,
            placement: Placement.LeftBottom,
            messageOptions: { textColor: Color.Blue, font: { weight: FontWeight.Bolder, size: 25 } },
            onStateChange: (e) => {
              console.info(JSON.stringify(e.isVisible))
              if (!e.isVisible) {
                this.handlePopup = false
              }
            }
          })
        Button('PopupOptions')
          .margin(100)
          .height(150)
          .width("65%")
          .backgroundColor("#ff4d5085")
          .onClick(() => {
            this.handlePopup = !this.handlePopup
          })
          .bindPopup(this.handlePopup, {
            message: 'Pop',
            enableArrow: true,
            placement: Placement.RightTop,
            messageOptions: { textColor: Color.Blue, font: { weight: FontWeight.Bolder, size: 25 } },
            onStateChange: (e) => {
              console.info(JSON.stringify(e.isVisible))
              if (!e.isVisible) {
                this.handlePopup = false
              }
            }
          })
        Button('PopupOptions')
          .margin(100)
          .height(150)
          .width("65%")
          .backgroundColor("#ff4d5085")
          .onClick(() => {
            this.handlePopup = !this.handlePopup
          })
          .bindPopup(this.handlePopup, {
            message: 'Pop',
            enableArrow: true,
            placement: Placement.Right,
            messageOptions: { textColor: Color.Blue, font: { weight: FontWeight.Bolder, size: 25 } },
            onStateChange: (e) => {
              console.info(JSON.stringify(e.isVisible))
              if (!e.isVisible) {
                this.handlePopup = false
              }
            }
          })
        Button('PopupOptions')
          .margin(100)
          .height(150)
          .width("65%")
          .backgroundColor("#ff4d5085")
          .onClick(() => {
            this.handlePopup = !this.handlePopup
          })
          .bindPopup(this.handlePopup, {
            message: 'Pop',
            enableArrow: true,
            placement: Placement.RightBottom,
            messageOptions: { textColor: Color.Blue, font: { weight: FontWeight.Bolder, size: 25 } },
            onStateChange: (e) => {
              console.info(JSON.stringify(e.isVisible))
              if (!e.isVisible) {
                this.handlePopup = false
              }
            }
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}