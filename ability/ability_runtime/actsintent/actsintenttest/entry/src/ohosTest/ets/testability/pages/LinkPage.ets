/*
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

import { InsightIntentLink,
  LinkIntentDecoratorInfo,
  LinkIntentParamMapping, LinkParamCategory } from '@ohos.app.ability.InsightIntentDecorator';

const linkParamMapping : LinkIntentParamMapping = {
  paramName : 'testParamName',
  paramMappingName : 'testParamMappingName',
}

const linkParamMapping2 : LinkIntentParamMapping = {
  paramName: 'testParamName',
  paramCategory : LinkParamCategory.LINK
}

const linkParamMapping3 : LinkIntentParamMapping = {
  paramName: 'testParamName',
  paramCategory : LinkParamCategory.WANT,
  paramMappingName : 'testParamMappingName'
}

const validDataLink: LinkIntentDecoratorInfo = {
  intentName: 'TestIntentNameLink',
  domain: 'control',
  intentVersion: '1.0.2',
  displayName: 'TestName',
  displayDescription: 'TestDescription',
  schema: 'ControlPlayback',
  icon: $r('app.media.startIcon'),
  llmDescription: 'Description',
  keywords: ['keywords', 'testKeywords'],
  example: 'testExample',
  uri: 'testUri',
  paramMappings : [linkParamMapping, linkParamMapping2, linkParamMapping3],
  parameters: {
    'type': 'object'
  },
  result: {
  },
};

const validDataLink2: LinkIntentDecoratorInfo = {
  intentName: 'TestIntentNameLink',
  domain: 'control',
  intentVersion: '1.0.2',
  displayName: 'TestName',
  uri: 'testUri'
};

@InsightIntentLink(validDataLink)
@InsightIntentLink(validDataLink2)
class TestClass {
  private entityId: string = 'entityId'
}

@Entry
@Component
struct IndexLink {
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