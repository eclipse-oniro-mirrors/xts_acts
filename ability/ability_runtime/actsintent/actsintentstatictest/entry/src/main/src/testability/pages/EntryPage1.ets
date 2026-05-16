/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { Entry, Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog'
import { InsightIntentEntry } from '@ohos.app.ability.InsightIntentDecorator';
import { insightIntent } from '@kit.AbilityKit';
import InsightIntentEntryExecutor from '@ohos.app.ability.InsightIntentEntryExecutor';
import { RecordData } from '@ohos.base';
import { insightIntent, InsightIntentEntity } from '@kit.AbilityKit';

const entityParameters = {
  '$schema': '',
  '$id': '/schemas/ArtistClassDef',
  'type': 'object',
  'description': 'Information about the artist',
  'properties': {
    'country': {
      'type': 'string',
      'description': 'The artist\'s country of origin',
      'default': 'zh'
    } as Record<string, RecordData>,
    'city': {
      'type': 'string',
      'description': 'The artist\'s city of origin'
    } as Record<string, RecordData>,
    'name': {
      'type': 'string',
      'description': 'The name of the artist',
      'minLength': 1
    } as Record<string, RecordData>
  } as Record<string, RecordData>
} as Record<string, RecordData>

@InsightIntentEntity({
  entityCategory: 'artist entity category',
  parameters: 'entityParameters',
  supportedQueryProperties: ['name']
})
export class ArtistClassDef implements insightIntent.IntentEntity {
  public entityId: string = 'id';
  public name: string = '';
}

@InsightIntentEntity({
  entityCategory: 'artist entity category Required',
})
export class ArtistClassOnlyRequired implements insightIntent.IntentEntity {
  public entityId: string = 'id';
  public name: string = '';
}

@InsightIntentEntity({
  entityCategory: 'artist entity category',
  parameters: 'entityParameters',
  supportedQueryProperties: ['name']
})
export class CustomAppIntentEntity extends insightIntent.AppIntentEntity<string> {
  public entityId: string = 'id';
  public displayName: string = 'displayName';
  public name: string = '';

  onQueryEntity(param: insightIntent.QueryEntityParam): Promise<Array<string>> {
    return Promise.resolve(['']);
  }
}

@InsightIntentEntry({
  intentName: 'TestIntentNameEntry1',
  domain: 'control',
  intentVersion: '1.0.2',
  displayName: 'TestName',
  displayDescription: 'TestDescription',
  schema: 'ControlPlayback',
  icon: "$r('app.media.startIcon')",
  llmDescription: 'Description',
  keywords: ['keywords', 'testKeywords'],
  abilityName: 'EntryPageAbility',
  executeMode: [insightIntent.ExecuteMode.UI_ABILITY_FOREGROUND,
    insightIntent.ExecuteMode.UI_ABILITY_BACKGROUND, insightIntent.ExecuteMode.UI_EXTENSION_ABILITY,
    insightIntent.ExecuteMode.SERVICE_EXTENSION_ABILITY]
})
export default class TestClass extends InsightIntentEntryExecutor<string>{
  public entityId: string = 'entityId'
  public songName: string = '123'
  public artistClassDef: ArtistClassDef = new ArtistClassDef();
  public artistClassOnlyRequired: ArtistClassOnlyRequired = new ArtistClassOnlyRequired();
  public customAppIntentEntity: CustomAppIntentEntity = new CustomAppIntentEntity();

  onExecute(): Promise<insightIntent.IntentResult<string>> {
    hilog.info(0x0000, 'PlayMusicDemo executeMode %{public}s', JSON.stringify(this.executeMode));
    hilog.info(0x0000, '%{public}s', JSON.stringify(this));
    let storage = new LocalStorage();
    // 根据executeMode参数的不同情况，提供不同拉起Index页面的方式。
    if (this.executeMode == insightIntent.ExecuteMode.UI_ABILITY_FOREGROUND) {
      this.windowStage?.loadContent('pages/Index', storage);
    } else if (this.executeMode == insightIntent.ExecuteMode.UI_EXTENSION_ABILITY) {
      this.uiExtensionSession?.loadContent('pages/Index', storage);
    }
    // 定义意图的执行结果
    let result: insightIntent.IntentResult<string> = {
      code: 123,
      result: 'aa'
    }
    hilog.info(0x0000, 'PlayMusicDemo return %{public}s', JSON.stringify(result));
    // 以Promise的方式返回意图执行结果
    return new Promise<insightIntent.IntentResult<string>>((resolve, reject) => { resolve(result) });
  }
}

@Entry
@Component
struct MyStateSample {
  @State stateVar: string = 'state var';
  message: string = 'var';
  changeValue() {
    this.stateVar+='~'
  }
  build() {
    Column(undefined) {
      Text('Hello World').fontSize(20)
      Button(this.message).backgroundColor('#FFFF00FF')
        .onClick((e: ClickEvent) => {
          hilog.info(0x0000, 'testTag', 'On Click');
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