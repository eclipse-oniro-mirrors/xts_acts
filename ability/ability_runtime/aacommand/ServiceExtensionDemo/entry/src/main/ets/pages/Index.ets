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

@Entry
@Component
struct Index {
  @State message: string = 'ExtensionAbility';
  @State startExtensionMessage: string = 'Start Extension';
  @State startExtensionMessageAbnormally: string = 'Start Extension Abnormally';
  @State stopExtensionMessage: string = 'Stop Extension';
  @State startUIAbilityMessage: string = 'Start Ability';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontStyle(FontStyle.Italic)

        Button() {
          Text(this.startExtensionMessage)
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')
        }
        .type(ButtonType.Capsule)
        .margin({ top: 30 })
        .backgroundColor('#87CEEB')
        .width('90%')
        .height('6%')
        .onClick(() => {
          AppStorage.get<Function>("StartServiceAbility")!();
        })

        Button() {
          Text(this.startExtensionMessageAbnormally)
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')
        }
        .type(ButtonType.Capsule)
        .margin({ top: 30 })
        .backgroundColor('#87CEEB')
        .width('90%')
        .height('6%')
        .onClick(() => {
          AppStorage.get<Function>("StartServiceAbilityAbnormally")!();
        })

        Button() {
          Text(this.stopExtensionMessage)
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')
        }
        .type(ButtonType.Capsule)
        .margin({ top: 30 })
        .backgroundColor('#87CEEB')
        .width('90%')
        .height('6%')
        .onClick(() => {
          AppStorage.get<Function>("StopServiceAbility")!();
        })

        Button() {
          Text(this.startUIAbilityMessage)
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')
        }
        .type(ButtonType.Capsule)
        .margin({ top: 30 })
        .backgroundColor('#87CEEB')
        .width('90%')
        .height('6%')
        .onClick(() => {
          AppStorage.get<Function>("StartAbility")!();
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}