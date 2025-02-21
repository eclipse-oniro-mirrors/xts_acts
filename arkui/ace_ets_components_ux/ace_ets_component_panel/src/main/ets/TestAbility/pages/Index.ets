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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import testsuite from '../../test/List.test'

@Entry
@Component
struct PanelExample {
  @State show: boolean = true
  @State isShowCloseIcon: boolean = true

  aboutToAppear() {
    let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {

    Column() {
      Panel(true) {
        Text('true')
      }
      .showCloseIcon(true)
      .key('ArkUX_Stage_Panel_showCloseIcon_0100')

      Panel(true) {
        Text('false')
      }
      .showCloseIcon(false)
      .key('ArkUX_Stage_Panel_showCloseIcon_0200')

      Panel(true) {
        Text('true -> false')
      }
      .showCloseIcon(true)
      .showCloseIcon(false)
      .key('ArkUX_Stage_Panel_showCloseIcon_0300')

      Panel(true) {
        Text('false -> true')
      }
      .showCloseIcon(false)
      .showCloseIcon(true)
      .key('ArkUX_Stage_Panel_showCloseIcon_0400')

      Panel(true) {
        Text('空字符串')
      }
      .showCloseIcon(" ")
      .key('ArkUX_Stage_Panel_showCloseIcon_0500')

      Panel(true) {
        Text('null')
      }
      .showCloseIcon(null)
      .key('ArkUX_Stage_Panel_showCloseIcon_0600')

      Panel(true) {
        Text('0')
      }
      .showCloseIcon(0)
      .key('ArkUX_Stage_Panel_showCloseIcon_0700')

      Panel(true) {
        Text('1')
      }
      .showCloseIcon(1)
      .key('ArkUX_Stage_Panel_showCloseIcon_0800')

      Panel(true) {
        Text('100')
      }
      .showCloseIcon(100)
      .key('ArkUX_Stage_Panel_showCloseIcon_0900')

      Panel(true) {
        Text('undefined')
      }
      .showCloseIcon(undefined)
      .key('ArkUX_Stage_Panel_showCloseIcon_1000')

      Panel(true) {
        Text('字符串true')
      }
      .showCloseIcon("true")
      .key('ArkUX_Stage_Panel_showCloseIcon_1100')

      Panel(true) {
        Text('不设置')
      }
      .showCloseIcon()
      .key('ArkUX_Stage_Panel_showCloseIcon_1200')

      Panel(true) {
        Text('true -> undefined')
      }
      .showCloseIcon(true)
      .showCloseIcon(undefined)
      .key('ArkUX_Stage_Panel_showCloseIcon_1300')

      Panel(true) {
        Text('true -> null')
      }
      .showCloseIcon(true)
      .showCloseIcon(null)
      .key('ArkUX_Stage_Panel_showCloseIcon_1400')

      Panel(true) {
        Text('true -> 空字符串')
      }
      .showCloseIcon(true)
      .showCloseIcon(" ")
      .key('ArkUX_Stage_Panel_showCloseIcon_1500')

    }
  }
}