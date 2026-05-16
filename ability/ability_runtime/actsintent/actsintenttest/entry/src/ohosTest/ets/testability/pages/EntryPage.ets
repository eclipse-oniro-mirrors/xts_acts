/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import hilog from '@ohos.hilog';
import { EntryIntentDecoratorInfo, InsightIntentEntry } from '@ohos.app.ability.InsightIntentDecorator';
import { insightIntent, InsightIntentEntryExecutor, InsightIntentEntity } from '@kit.AbilityKit';

@InsightIntentEntity({
  entityCategory: 'artist entity category',
  parameters: {
    '$schema': '',
    '$id': '/schemas/ArtistClassDef',
    'type': 'object',
    'description': 'Information about the artist',
    'properties': {
      'country': {
        'type': 'string',
        'description': 'The artist\'s country of origin',
        'default': 'zh'
      },
      'city': {
        'type': 'string',
        'description': 'The artist\'s city of origin'
      },
      'name': {
        'type': 'string',
        'description': 'The name of the artist',
        'minLength': 1
      }
    }
  },
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

const validData: EntryIntentDecoratorInfo = {
  intentName: 'TestIntentNameEntry',
  domain: 'control',
  intentVersion: '1.0.2',
  displayName: 'TestName',
  displayDescription: 'TestDescription',
  schema: 'ControlPlayback',
  icon: $r('app.media.startIcon'),
  llmDescription: 'Description',
  keywords: ['keywords', 'testKeywords'],
  example: 'testExample',
  abilityName: 'EntryPageAbility',
  executeMode: [insightIntent.ExecuteMode.UI_ABILITY_FOREGROUND],
  parameters: {
    'type': 'object'
  },
  result: {
  },
};

const validData2: EntryIntentDecoratorInfo = {
  intentName: 'TestIntentNameEntry',
  domain: 'control',
  intentVersion: '1.0.2',
  displayName: 'TestName',
  displayDescription: 'TestDescription',
  schema: 'ControlPlayback',
  icon: $r('app.media.startIcon'),
  llmDescription: 'Description',
  keywords: ['keywords', 'testKeywords'],
  example: 'testExample',
  abilityName: 'EntryPageAbility',
  executeMode: [insightIntent.ExecuteMode.UI_ABILITY_FOREGROUND,
    insightIntent.ExecuteMode.UI_ABILITY_BACKGROUND, insightIntent.ExecuteMode.UI_EXTENSION_ABILITY,
    insightIntent.ExecuteMode.SERVICE_EXTENSION_ABILITY]
};

@InsightIntentEntry(validData)
@InsightIntentEntry(validData2)
export default class TestClass extends InsightIntentEntryExecutor<string>{
  public entityId: string = 'entityId'
  public songName: string = "123"
  public customAppIntentEntity: CustomAppIntentEntity = new CustomAppIntentEntity();

  onExecute(): Promise<insightIntent.IntentResult<string>> {
    hilog.info(0x0000, 'PlayMusicDemo executeMode %{public}s', JSON.stringify(this.executeMode));
    hilog.info(0x0000, '%{public}s', JSON.stringify(this));
    let storage = new LocalStorage();
    // 根据executeMode参数的不同情况，提供不同拉起PlayMusicPage页面的方式。
    if (this.executeMode == insightIntent.ExecuteMode.UI_ABILITY_FOREGROUND) {
      this.windowStage?.loadContent('pages/PlayMusicPage', storage);
    } else if (this.executeMode == insightIntent.ExecuteMode.UI_EXTENSION_ABILITY) {
      this.uiExtensionSession?.loadContent('pages/PlayMusicPage', storage);
    }
    // 定义意图的执行结果
    let result: insightIntent.IntentResult<string> = {
      code: 123,
      result: 'aa'
    }
    hilog.info(0x0000, 'PlayMusicDemo return %{public}s', JSON.stringify(result));
    // 以Promise的方式返回意图执行结果
    return Promise.reject(result);
  }
}

@Entry
@Component
struct IndexEntry {
  build() {
    Row() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
        Text('Hello').fontSize(50)
      }
      .height('100%')
      .width('100%')
    }
  }
}
