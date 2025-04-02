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
import hilog from '@ohos.hilog';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../../test/List.test';
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
    
  }

  build() {
    Row() {
      Column() {
        Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
          Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
            .onChange((value: boolean) => {
              console.info('Checkbox1 change is' + value)
            })
            .key("ArkUX_CheckBox_Visual_0110")
            .width(30)
            .height(30)
            .enabled(false)
            .select(true)
            .shape(CheckBoxShape.CIRCLE)
          Text('Checkbox1').fontSize(20)
        }

        Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
          Checkbox({ name: 'checkbox2', group: 'checkboxGroup' })
            .key("ArkUX_CheckBox_Visual_0120")
            .width(30)
            .height(30)
            .enabled(false)
            .select(true)
            .shape(CheckBoxShape.ROUNDED_SQUARE)
          Text('Checkbox2').fontSize(20)
        }

        Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
          Checkbox({ name: 'checkbox3', group: 'checkboxGroup' })
            .key("ArkUX_CheckBox_Visual_0130")
            .width(30)
            .height(30)
            .enabled(false)
            .select(true)
            .shape(null)
          Text('Checkbox3').fontSize(20)
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}