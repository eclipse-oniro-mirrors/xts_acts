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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../../test/List.test';
import common from '@ohos.app.ability.common';
import { colorsForCheck, SystemColorsFromResources } from '../themeTokensPages/SystemColorsForCheck';
import { Colors } from '../../themes/checkSystemTokens/colorValues/ColorsTokens';
import { frameTime, sleep } from '../../../test/Utils';

export const colorValuesKey: string = 'ColorValues';

@Entry
@Component
struct Index {
  @State message: string = 'XTS Tests';
  private context :  common.UIAbilityContext = getContext(this) as common.UIAbilityContext;

  async aboutToAppear() {
    let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator;
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs;
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    console.info(`${this.message} start run testcase!!!`);
    await sleep(frameTime) // wait till colors loaded from the system colors page
    let colorValues : Map <string, string> = new Map<string, string>();
    Colors.colors.forEach((_item, key)=> {
      const resourceJson : string = getInspectorByKey(`${key}${colorsForCheck}`);
      const checkColor : ResourceColor  = (JSON.parse(resourceJson).$attrs.backgroundColor as ResourceColor);
      colorValues.set(key, checkColor?.toString().toUpperCase());
    });
    AppStorage.setOrCreate(colorValuesKey, colorValues);
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }
  build() {
    Row() {
      Column() {
        Text(this.message)
        SystemColorsFromResources({postfix: ''})
      }.width('100%')
    }.height('100%')
  }
}