/**
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import account_appAccount from '@ohos.account.appAccount';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement'
import { BusinessError } from '@ohos.base'
import Want from '@ohos.app.ability.Want';

let tag: string = 'testTag';
let gContext: common.UIAbilityContext;

let wantInfo: Want = {
  bundleName: 'com.acts.accountauthenticator.static',
  abilityName: 'EntryAbility'
}

@Entry
@Component
struct Index {

  @State stateVar: string = 'state let';
  message: string = 'let';

  changeValue() {
    this.stateVar += '~'
  }

  aboutToAppear(){
    waitForCompletion(async () => {
      console.info('====>ServiceAbility onStart');
      let accountMgr = account_appAccount.createAppAccountManager();
      hilog.info(0x0000, 'testTag', '====>ServiceAbility addAccount 01 onStart');
      await accountMgr.createAccount('zhangsan');
      hilog.info(0x0000, 'testTag', '====>ServiceAbility setAppAccess accounttstest.static zhangsan');
      await accountMgr.setAppAccess('zhangsan', 'com.example.accounttstest.static', true);
      hilog.info(0x0000, 'testTag', '====>ServiceAbility addAccount 02 onStart');
      await accountMgr.createAccount('lisi');
      hilog.info(0x0000, 'testTag', '====>ServiceAbility setAppAccess accounttstest.static lisi');
      await accountMgr.setAppAccess('lisi', 'com.example.accounttstest.static', true);
      hilog.info(0x0000, 'testTag', '====>ServiceAbility addAccount 03 onStart');
      await accountMgr.createAccount('wangwu');
      hilog.info(0x0000, 'testTag', '====>ServiceAbility setAppAccess accounttstest.static wangwu');
      await accountMgr.setAppAccess('wangwu', 'com.example.accounttstest.static', true);
      hilog.info(0x0000, tag, '====>AppStorage get');
      gContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
      if (gContext) {
        hilog.info(0x0000, tag, '====>terminateSelfWithResult start')
        gContext.terminateSelfWithResult({
          resultCode: 1,
          want: wantInfo
        });
      } else {
        hilog.error(0x0000, tag, '====>context is undefined====');
      }
      hilog.info(0x0000, 'testTag', '====>ServiceAbility onStart end');
    });
  }

  build() {
    Column(undefined) {
      Text('Hello World').fontSize(20)
      Button(this.message).backgroundColor('#FFFF00FF')
        .onClick((e: ClickEvent) => {
          hilog.info(0x0000, 'testTag', 'On Click');
          this.changeValue();
        })
      Text(this.stateVar).fontSize(20)
      Child({ stateVar: this.stateVar })
    }
  }
}

@Component
struct Child {
  @State stateVar: string = 'Child';

  build() {
    Text(this.stateVar).fontSize(50)
  }
}