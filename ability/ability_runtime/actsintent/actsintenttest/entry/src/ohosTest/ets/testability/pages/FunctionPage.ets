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

import {
  FunctionIntentDecoratorInfo,
  InsightIntentFunction,
  InsightIntentFunctionMethod
} from '@ohos.app.ability.InsightIntentDecorator';

const validData: FunctionIntentDecoratorInfo = {
  intentName: 'TestIntentNameFunction',
  domain: 'control',
  intentVersion: '1.0.2',
  displayName: 'TestName',
  displayDescription: 'TestDescription',
  schema: 'ControlPlayback',
  icon: $r('app.media.startIcon'),
  llmDescription: 'Description',
  keywords: ['keywords', 'testKeywords'],
  example: 'testExample',
  parameters: {
    'type': 'object'
  },
  result: {
  },
};

@InsightIntentFunction()
export default  class TestClass {
  @InsightIntentFunctionMethod(validData)
  static function(playbackProgress: number, entityId: number) {
  }
}

@Entry
@Component
struct IndexFunction {
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