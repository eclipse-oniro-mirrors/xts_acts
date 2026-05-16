/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import ability_featureAbility from '@ohos.ability.featureAbility';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World FaSupportFunction 1'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Row() {
          Button() {
            Text('MainAbility1_setWakeUpScreen')
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
          }
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          })
          .backgroundColor('#0D9FFB')
          .width('30%')
          .height('5%')
          .onClick(() => {
            ability_featureAbility.startAbility({
              want: {
                bundleName: "ohos.acts.aafwk.test.fasupportfunction",
                abilityName: "ohos.acts.aafwk.test.fasupportfunction.ServiceAbility"
              }
            }).then((data) => {
              console.log('Fa:Auxiliary:MainAbility: ACTS_SerivceAbilityServer startAbility data:' + JSON.stringify(data));
            }).catch((error: BusinessError) => {
              console.log('Fa:Auxiliary:MainAbility: ACTS_SerivceAbilityServer startAbility error:' + JSON.stringify(error));
            });
          })
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}