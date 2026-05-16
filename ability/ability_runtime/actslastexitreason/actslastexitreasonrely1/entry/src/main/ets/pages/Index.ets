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

import Want from '@ohos.app.ability.Want';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';

@Entry
@Component
struct Index {
  @State startSecond: string = 'Start Second';
  @State jsCrash: string = 'Js Crash';
  @State appFreeze: string = 'App Freeze';
  @State terminateSelf: string = 'TerminateSelf';
  @State startFeature: string = 'Start Feature';

  build() {
    Row() {
      Column() {
        Text(this.startSecond)
          .fontSize('2%')
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            let want: Want = {
              bundleName: 'com.acts.lastexitreasonrely1',
              abilityName: 'SecondAbility'
            };
            (getContext() as common.UIAbilityContext).startAbility(want);
          });

        Text(this.jsCrash)
          .fontSize('2%')
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            throw Error();
          });
        Text(this.appFreeze)
          .fontSize('2%')
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            while (true) {
            }
          });
        Text(this.terminateSelf)
          .fontSize('2%')
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            (getContext() as common.UIAbilityContext).terminateSelf();
          });
        Text(this.startFeature)
          .fontSize('2%')
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            let want: Want = {
              bundleName: 'com.acts.lastexitreasonrely1',
              moduleName: 'feature',
              abilityName: 'FeatureAbility'
            };
            (getContext() as common.UIAbilityContext).startAbility(want);
          });
      }
      .width('100%')
    }
    .height('100%')
  }
}