/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { Entry, Text, TextAttribute, Column, Component, Button, ClickEvent, EmbeddedComponent, EmbeddedType } from '@ohos.arkui.component';
import { State} from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';
import Want from '@ohos.app.ability.Want';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError, RecordData } from '@ohos.base';

const DOMAIN = 0x0000;
const TAG: string = 'testTag';
const BUNDLE_NAME: string = 'com.example.uiextensioncontexttest.static';
const ABILITY_NAME: string = 'EntryEmbeddedUIExtAbility';
const TEST_CASE_KEY: string = 'caseTag';
let testCaseName: string = '';

@Entry
@Component
struct TestIndex {
  @State stateVar: string = 'state var';
  private context: common.UIAbilityContext | undefined;
  message: string = 'var';

  changeValue() {
    this.stateVar+='~'
  }

  aboutToAppear() {
    hilog.info(DOMAIN, TAG, 'TestAbility index aboutToAppear');
    this.context = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
    let testAbilityWant: Want = AppStorage.get<Want>('TestAbilityWant') as Want;
    if (testAbilityWant?.parameters?.[TEST_CASE_KEY]) {
      testCaseName = testAbilityWant?.parameters?.[TEST_CASE_KEY] as string;
    }
    hilog.info(DOMAIN, TAG, `TestAbility index aboutToAppear ${JSON.stringify(testAbilityWant)}`);
  }

  build() {
    Column(undefined) {
      Text('Hello World').fontSize(20)
      EmbeddedComponent({
          bundleName: BUNDLE_NAME,
          abilityName: ABILITY_NAME,
          parameters: {
            'caseTag': testCaseName
          } as Record<string, RecordData>
        }, EmbeddedType.EMBEDDED_UI_EXTENSION)
        .width('100%')
        .height('90%')
        .onTerminated((info)=>{
          this.message = 'Termination: code = ' + info.code + ', want = ' + JSON.stringify(info.want);
          this.context?.terminateSelf()
        }).onError((error)=>{
          hilog.info(DOMAIN, TAG, 'EmbeddedComponent uiextension' + JSON.stringify(error));
          this.message = 'Error: code = ' + error.code;
        })
      Text(this.stateVar).fontSize(20)
      Child({stateVar: this.stateVar} as __Options_Child)
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
