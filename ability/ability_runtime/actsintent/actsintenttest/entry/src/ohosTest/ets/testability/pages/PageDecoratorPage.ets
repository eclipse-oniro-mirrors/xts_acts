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

import { InsightIntentPage, PageIntentDecoratorInfo } from '@ohos.app.ability.InsightIntentDecorator';

const validData: PageIntentDecoratorInfo = {
  intentName: 'TestIntentNamePage',
  domain: 'control',
  intentVersion: '1.0.2',
  displayName: 'TestName',
  displayDescription: 'TestDescription',
  schema: 'ControlPlayback',
  icon: $r('app.media.startIcon'),
  llmDescription: 'Description',
  keywords: ['keywords', 'testKeywords'],
  example: 'testExample',
  uiAbility: '',
  pagePath: 'ets/pages/Index',
  navigationId: 'navId',
  navDestinationName: 'PageOne',
  parameters: {
    'type': 'object'
  },
  result: {
  },
};

const validData2: PageIntentDecoratorInfo = {
  intentName: 'TestIntentNamePage',
  domain: 'control',
  intentVersion: '1.0.2',
  displayName: 'TestName',
  displayDescription: 'TestDescription',
  schema: 'ControlPlayback',
  icon: $r('app.media.startIcon'),
  llmDescription: 'Description',
  keywords: ['keywords', 'testKeywords'],
  example: 'testExample',
  pagePath: 'ets/pages/Index',
};

@Entry
@Component
@InsightIntentPage(validData)
@InsightIntentPage(validData2)
struct Index {
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