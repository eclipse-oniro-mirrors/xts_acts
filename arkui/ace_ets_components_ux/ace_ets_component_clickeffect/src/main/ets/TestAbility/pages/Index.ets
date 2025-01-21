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
//@ts-nocheck
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import testsuite from '../../test/List.test'

@Entry
@Component
struct ClickEffectTest {
  aboutToAppear() {
    var abilityDelegator: any
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    var abilityDelegatorArguments: any
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Row() {
      Column() {
        List({ space: 0, initialIndex: 0 }) {
          ListItem() {
            Toggle({ type: ToggleType.Switch, isOn: false })
              .selectedColor(0xed6f21)
              .switchPointColor(0xe5ffffff)
              .clickEffect({ level: ClickEffectLevel.LIGHT })
              .onChange((isOn: boolean) => {
                console.info('Component status:' + isOn)
              })
              .key('clickEffect_1')
          }
          ListItem() {
            Toggle({ type: ToggleType.Switch, isOn: false })
              .selectedColor(0xed6f21)
              .switchPointColor(0xe5ffffff)
              .clickEffect({ level: ClickEffectLevel.MIDDLE })
              .onChange((isOn: boolean) => {
                console.info('Component status:' + isOn)
              })
              .key('clickEffect_2')
          }
          ListItem() {
            Toggle({ type: ToggleType.Switch, isOn: false })
              .selectedColor(0xed6f21)
              .switchPointColor(0xe5ffffff)
              .clickEffect({ level: ClickEffectLevel.HEAVY })
              .onChange((isOn: boolean) => {
                console.info('Component status:' + isOn)
              })
              .key('clickEffect_3')
          }
          ListItem() {
            Toggle({ type: ToggleType.Switch, isOn: false })
              .selectedColor(0xed6f21)
              .switchPointColor(0xe5ffffff)
              .clickEffect({ level: ClickEffectLevel.LIGHT, scale: 0 })
              .onChange((isOn: boolean) => {
                console.info('Component status:' + isOn)
              })
              .key('clickEffect_4')
          }
          ListItem() {
            Toggle({ type: ToggleType.Switch, isOn: false })
              .selectedColor(0xed6f21)
              .switchPointColor(0xe5ffffff)
              .clickEffect({ level: ClickEffectLevel.LIGHT, scale: 1 })
              .onChange((isOn: boolean) => {
                console.info('Component status:' + isOn)
              })
              .key('clickEffect_5')
          }
          ListItem() {
            Toggle({ type: ToggleType.Switch, isOn: false })
              .selectedColor(0xed6f21)
              .switchPointColor(0xe5ffffff)
              .clickEffect({ level: ClickEffectLevel.LIGHT, scale: 0.5 })
              .onChange((isOn: boolean) => {
                console.info('Component status:' + isOn)
              })
              .key('clickEffect_6')
          }
          ListItem() {
            Toggle({ type: ToggleType.Switch, isOn: false })
              .selectedColor(0xed6f21)
              .switchPointColor(0xe5ffffff)
              .clickEffect({ level: ClickEffectLevel.LIGHT, scale: 0.8 })
              .onChange((isOn: boolean) => {
                console.info('Component status:' + isOn)
              })
              .key('clickEffect_7')
          }
          ListItem() {
            Toggle({ type: ToggleType.Switch, isOn: false })
              .selectedColor(0xed6f21)
              .switchPointColor(0xe5ffffff)
              .clickEffect({ level: ClickEffectLevel.LIGHT, scale: -1 })
              .onChange((isOn: boolean) => {
                console.info('Component status:' + isOn)
              })
              .key('clickEffect_8')
          }
          ListItem() {
            Toggle({ type: ToggleType.Switch, isOn: false })
              .selectedColor(0xed6f21)
              .switchPointColor(0xe5ffffff)
              .clickEffect({ level: null, scale: 0.1 })
              .onChange((isOn: boolean) => {
                console.info('Component status:' + isOn)
              })
              .key('clickEffect_9')
          }
          ListItem() {
            Toggle({ type: ToggleType.Switch, isOn: false })
              .selectedColor(0xed6f21)
              .switchPointColor(0xe5ffffff)
              .clickEffect({ level: undefined, scale: 0 })
              .onChange((isOn: boolean) => {
                console.info('Component status:' + isOn)
              })
              .key('clickEffect_10')
          }
          ListItem() {
            Toggle({ type: ToggleType.Switch, isOn: false })
              .selectedColor(0xed6f21)
              .switchPointColor(0xe5ffffff)
              .clickEffect({ level: ClickEffectLevel.MIDDLE, scale: 0.2 })
              .clickEffect({ level: ClickEffectLevel.HEAVY, scale: 0.1 })
              .onChange((isOn: boolean) => {
                console.info('Component status:' + isOn)
              })
              .key('clickEffect_11')
          }
          ListItem() {
            Toggle({ type: ToggleType.Switch, isOn: false })
              .selectedColor(0xed6f21)
              .switchPointColor(0xe5ffffff)
              .clickEffect({ level: ClickEffectLevel.MIDDLE })
              .clickEffect({ level: null })
              .onChange((isOn: boolean) => {
                console.info('Component status:' + isOn)
              })
              .key('clickEffect_12')
          }
          ListItem() {
            Toggle({ type: ToggleType.Switch, isOn: false })
              .selectedColor(0xed6f21)
              .switchPointColor(0xe5ffffff)
              .clickEffect({ level: null })
              .clickEffect({ level: ClickEffectLevel.MIDDLE })
              .onChange((isOn: boolean) => {
                console.info('Component status:' + isOn)
              })
              .key('clickEffect_13')
          }
          ListItem() {
            Toggle({ type: ToggleType.Switch, isOn: false })
              .selectedColor(0xed6f21)
              .switchPointColor(0xe5ffffff)
              .clickEffect({ level: ClickEffectLevel.HEAVY, scale: null })
              .onChange((isOn: boolean) => {
                console.info('Component status:' + isOn)
              })
              .key('clickEffect_14')
          }
          ListItem() {
            Toggle({ type: ToggleType.Switch, isOn: false })
              .selectedColor(0xed6f21)
              .switchPointColor(0xe5ffffff)
              .clickEffect({ level: ClickEffectLevel.MIDDLE, scale: undefined })
              .onChange((isOn: boolean) => {
                console.info('Component status:' + isOn)
              })
              .key('clickEffect_15')
          }
          ListItem() {
            Toggle({ type: ToggleType.Switch, isOn: false })
              .selectedColor(0xed6f21)
              .switchPointColor(0xe5ffffff)
              .clickEffect({ level: undefined, scale: null })
              .onChange((isOn: boolean) => {
                console.info('Component status:' + isOn)
              })
              .key('clickEffect_16')
          }
        }
        .alignListItem(ListItemAlign.Center)
      }
      .width('100%')
    }
    .height('100%')
  }
}
