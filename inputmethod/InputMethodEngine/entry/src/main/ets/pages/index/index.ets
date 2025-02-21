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

import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
import { Hypium } from '@ohos/hypium'
import testsuite from '../../test/List.test'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State inputValue: string = 'inputMethodEngine1inputMethodEngine2inputMethodEngine3inputMethodEngine' +
  'inputMethodEngine4inputMethodEngine5inputMethodEngine6inputMethodEngine7inputMethodEngine8inputMethodEn' +
  'gine9inputMethodEngine10inputMethodEngine11inputMethodEngine12inputMethodEngine13inputMethodEngine14inputMet' +
  'hodEngine15inputMethodEngine16inputMethodEngine17inputMethodEngine18inputMethodEngine19inputMethodEngine20inputMethodEngine21';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .defaultFocus(true)
        TextArea({ text: this.inputValue })
          .onChange((value: string) => {
            this.inputValue = value;
          })
        Button() {
          Text('next page')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }.type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .width('35%')
        .height('5%')
        .onClick(() => {
        })
      }
      .width('100%')
    }
    .height('100%')
  }

  aboutToAppear(){
    let abilityDelegator: any
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments: any
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }
}