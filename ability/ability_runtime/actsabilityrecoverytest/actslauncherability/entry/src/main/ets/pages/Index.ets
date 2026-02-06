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

import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog';

const TAG: string = 'testTag-LauncherAbility-Page ';

@Entry
@Component
struct Index {
  @State message: string = 'Hello LauncherAbility';
  context: common.UIAbilityContext = getContext() as common.UIAbilityContext;

  aboutToAppear() {
    hilog.info(0x0000, TAG, '%{public}s', 'EntryAbility index aboutToAppear');
  }

  onPageShow(): void {
    hilog.info(0x0000, TAG, '%{public}s', 'EntryAbility index onPageShow');
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('拉起EntryAbility')
          .fontSize('16fp')
          .onClick(() => {
            this.context.startAbility({
              bundleName: "com.example.recoveryability",
              moduleName: "entry",
              abilityName: "EntryAbility",
            })
          })
          .width('88.9%')
          .height('40vp')

        Button('拉起ShortAbility')
          .fontSize('16fp')
          .onClick(() => {
            this.context.startAbility({
              bundleName: "com.example.recoveryability",
              moduleName: "entry",
              abilityName: "ShortAbility",
            })
          })
          .width('88.9%')
          .height('40vp')

        Button('拉起ProtectAbility')
          .fontSize('16fp')
          .onClick(() => {
            this.context.startAbility({
              bundleName: "com.example.recoveryability",
              moduleName: "entry",
              abilityName: "ProtectAbility",
            })
          })
          .width('88.9%')
          .height('40vp')

        Button('拉起AnotherAbility')
          .fontSize('16fp')
          .onClick(() => {
            this.context.startAbility({
              bundleName: "com.example.recoveryability",
              moduleName: "entry",
              abilityName: "AnotherAbility",
            })
          })
          .width('88.9%')
          .height('40vp');

        Button('拉起StandardAbility')
          .fontSize('16fp')
          .onClick(() => {
            this.context.startAbility({
              bundleName: "com.example.recoveryability",
              moduleName: "entry",
              abilityName: "StandardAbility",
            })
          })
          .width('88.9%')
          .height('40vp')
      }
      .width('100%')
    }
    .height('100%')
  }
}