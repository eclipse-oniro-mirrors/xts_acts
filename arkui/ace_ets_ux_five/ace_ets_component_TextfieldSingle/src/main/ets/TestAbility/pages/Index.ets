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
import hilog from '@ohos.hilog';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

@Entry
@Component
struct Index {
  aboutToAppear() {
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility index aboutToAppear');
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }

  @State text: string = ''
  controller: TextInputController = new TextInputController()

  build() {
    Column() {
      TextInput({ text: this.text, placeholder: 'input your word...', controller: this.controller })
        .key("ArkUX_Text_Visual_0040")
        .selectAll(true)
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 25, weight: 400 })
        .caretColor(Color.Blue)
        .width(400)
        .height(80)
        .margin(20)
        .fontSize(35)
        .fontColor(Color.Black)
        .onChange((value: string) => {
          this.text = value
        })

      TextInput({ text: this.text, placeholder: 'input your word...', controller: this.controller })
        .key("ArkUX_Text_Visual_0050")
        .selectAll(false)
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 25, weight: 400 })
        .caretColor(Color.Blue)
        .width(400)
        .height(80)
        .margin(20)
        .fontSize(35)
        .fontColor(Color.Black)
        .onChange((value: string) => {
          this.text = value
        })

      TextInput({ text: this.text, placeholder: 'input your word...', controller: this.controller })
        .key("ArkUX_Text_Visual_0060")
        .selectAll(null)
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 25, weight: 400 })
        .caretColor(Color.Blue)
        .width(400)
        .height(80)
        .margin(20)
        .fontSize(35)
        .fontColor(Color.Black)
        .onChange((value: string) => {
          this.text = value
        })
    }.width('100%')
  }
}