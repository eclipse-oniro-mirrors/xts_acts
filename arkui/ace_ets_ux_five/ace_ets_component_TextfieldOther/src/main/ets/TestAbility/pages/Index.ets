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
  @State input: number = 40
  controller: TextAreaController = new TextAreaController()
  inputCounterOptions: InputCounterOptions = {
    thresholdPercentage: 50
  }

  build() {
    Column() {
      TextArea({
        text: this.text,
        controller: this.controller
      })
        .key("ArkUX_Text_Visual_0070")
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .height(56)
        .showCounter(true, { thresholdPercentage: this.input, highlightBorder: true })
        .maxLength(5)

      TextArea({
        text: this.text,
        controller: this.controller
      })
        .key("ArkUX_Text_Visual_0080")
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .height(56)
        .showCounter(false, { thresholdPercentage: this.input, highlightBorder: false })
        .maxLength(5)

      TextArea({
        text: this.text,
        controller: this.controller
      })
        .key("ArkUX_Text_Visual_0090")
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .height(56)
        .showCounter(true, { thresholdPercentage: this.input, highlightBorder: false })
        .maxLength(5)

      TextArea({
        text: this.text,
        controller: this.controller
      })
        .key("ArkUX_Text_Visual_0100")
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .height(56)
        .showCounter(null)
        .maxLength(5)
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}