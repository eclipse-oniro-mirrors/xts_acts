'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog';
import {
  $$,
  $r,
  Alignment,
  BindOptions,
  Button,
  ButtonType,
  ClickEffectLevel,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexOptions,
  FontWeight,
  Image,
  ItemAlign,
  Margin,
  Row,
  Scroll,
  SheetOptions,
  SheetType,
  Text,
  TextAlign,
  Toggle,
  ToggleType
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, Link, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';

@Entry
@Component
struct ClickEffectTest {
  aboutToAppear() {
    let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator
    abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs
    abilityDelegatorArguments = abilityDelegatorRegistry.getArguments()
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
  }

  build() {
    Column() {
      Row() {
        Toggle({ type: ToggleType.Switch, isOn: false })
          .selectedColor('0xed6f21')
          .switchPointColor('0xe5ffffff')
          .clickEffect({ level: ClickEffectLevel.LIGHT })
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })
          .key('clickEffect_1')
        Toggle({ type: ToggleType.Switch, isOn: false })
          .selectedColor('0xed6f21')
          .switchPointColor('0xe5ffffff')
          .clickEffect({ level: ClickEffectLevel.MIDDLE })
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })
          .key('clickEffect_2')
        Toggle({ type: ToggleType.Switch, isOn: false })
          .selectedColor('0xed6f21')
          .switchPointColor('0xe5ffffff')
          .clickEffect({ level: ClickEffectLevel.HEAVY })
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })
          .key('clickEffect_3')
      }

      Row() {
        Toggle({ type: ToggleType.Switch, isOn: false })
          .selectedColor('0xed6f21')
          .switchPointColor('0xe5ffffff')
          .clickEffect({ level: ClickEffectLevel.LIGHT, scale: 0 })
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })
          .key('clickEffect_4')
        Toggle({ type: ToggleType.Switch, isOn: false })
          .selectedColor('0xed6f21')
          .switchPointColor('0xe5ffffff')
          .clickEffect({ level: ClickEffectLevel.LIGHT, scale: 1 })
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })
          .key('clickEffect_5')
        Toggle({ type: ToggleType.Switch, isOn: false })
          .selectedColor('0xed6f21')
          .switchPointColor('0xe5ffffff')
          .clickEffect({ level: ClickEffectLevel.LIGHT, scale: 0.5 })
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })
          .key('clickEffect_6')
      }

      Row() {
        Toggle({ type: ToggleType.Switch, isOn: false })
          .selectedColor('0xed6f21')
          .switchPointColor('0xe5ffffff')
          .clickEffect({ level: ClickEffectLevel.LIGHT, scale: 0.8 })
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })
          .key('clickEffect_7')
        Toggle({ type: ToggleType.Switch, isOn: false })
          .selectedColor('0xed6f21')
          .switchPointColor('0xe5ffffff')
          .clickEffect({ level: ClickEffectLevel.LIGHT, scale: 0.9 })
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })
          .key('clickEffect_8')
        Toggle({ type: ToggleType.Switch, isOn: false })
          .selectedColor('0xed6f21')
          .switchPointColor('0xe5ffffff')
          .clickEffect({ level: ClickEffectLevel.LIGHT, scale: 0.1 })
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })
          .key('clickEffect_9')
      }

      Row() {
        Toggle({ type: ToggleType.Switch, isOn: false })
          .selectedColor('0xed6f21')
          .switchPointColor('0xe5ffffff')
          .clickEffect({ level: ClickEffectLevel.LIGHT, scale: 0 })
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })
          .key('clickEffect_10')
        Toggle({ type: ToggleType.Switch, isOn: false })
          .selectedColor('0xed6f21')
          .switchPointColor('0xe5ffffff')
          .clickEffect({ level: ClickEffectLevel.MIDDLE, scale: 0.2 })
          .clickEffect({ level: ClickEffectLevel.HEAVY, scale: 0.1 })
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })
          .key('clickEffect_11')
        Toggle({ type: ToggleType.Switch, isOn: false })
          .selectedColor('0xed6f21')
          .switchPointColor('0xe5ffffff')
          .clickEffect({ level: ClickEffectLevel.MIDDLE })
          .clickEffect({ level: ClickEffectLevel.LIGHT })
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })
          .key('clickEffect_12')
      }

      Row() {
        Toggle({ type: ToggleType.Switch, isOn: false })
          .selectedColor('0xed6f21')
          .switchPointColor('0xe5ffffff')
          .clickEffect({ level: ClickEffectLevel.LIGHT })
          .clickEffect({ level: ClickEffectLevel.MIDDLE })
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })
          .key('clickEffect_13')
        Toggle({ type: ToggleType.Switch, isOn: false })
          .selectedColor('0xed6f21')
          .switchPointColor('0xe5ffffff')
          .clickEffect({ level: ClickEffectLevel.HEAVY, scale: 0.95 })
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })
          .key('clickEffect_14')
        Toggle({ type: ToggleType.Switch, isOn: false })
          .selectedColor('0xed6f21')
          .switchPointColor('0xe5ffffff')
          .clickEffect({ level: ClickEffectLevel.MIDDLE, scale: 0.95 })
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })
          .key('clickEffect_15')
      }

      Row() {
        Toggle({ type: ToggleType.Switch, isOn: false })
          .selectedColor('0xed6f21')
          .switchPointColor('0xe5ffffff')
          .clickEffect({ level: ClickEffectLevel.LIGHT, scale: 0.9 })
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })
          .key('clickEffect_16')
      }
    }
    .width('100%')
    .height('100%')
  }
}
