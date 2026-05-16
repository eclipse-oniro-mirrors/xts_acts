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

import { FrameNode, UIContext } from '@kit.ArkUI';

@Entry
@Component
struct CustomPropertyNullUndefinedTest {
  build() {
    Column() {
      Button('getCustomProperty')
        .id('CustomPropertyNullUndefinedTest_btn')
        .onClick(() => {
          // 获取Column对应的frameNode节点并查询设置的自定义属性
          const uiContext: UIContext = this.getUIContext();
          if (uiContext) {
            const node: FrameNode | null = uiContext.getFrameNodeById('CustomPropertyNullUndefinedTest_Column') || null;
            let property = node?.getCustomProperty('');
            console.info('CustomPropertyNullUndefinedTest', JSON.stringify(property));
            AppStorage.setOrCreate('CustomPropertyNullUndefinedTest_1', JSON.stringify(property))

            property = node?.getCustomProperty(null);
            console.info('CustomPropertyNullUndefinedTest', JSON.stringify(property));
            AppStorage.setOrCreate('CustomPropertyNullUndefinedTest_2', JSON.stringify(property))

            property = node?.getCustomProperty(undefined);
            console.info('CustomPropertyNullUndefinedTest', JSON.stringify(property));
            AppStorage.setOrCreate('CustomPropertyNullUndefinedTest_3', property)

            property = node?.getCustomProperty('customProperty2');
            console.info('CustomPropertyNullUndefinedTest', JSON.stringify(property));
            AppStorage.setOrCreate('CustomPropertyNullUndefinedTest_4', JSON.stringify(property))

            property = node?.getCustomProperty('customProperty3');
            console.info('CustomPropertyNullUndefinedTest', JSON.stringify(property));
            AppStorage.setOrCreate('CustomPropertyNullUndefinedTest_5', property)

            property = node?.getCustomProperty('customProperty4');
            console.info('CustomPropertyNullUndefinedTest', JSON.stringify(property));
            AppStorage.setOrCreate('CustomPropertyNullUndefinedTest_6', property)
          }
        })
    }
    .id('CustomPropertyNullUndefinedTest_Column')
    // 设置Column组件的自定义属性
    .customProperty('customProperty1', {
      'number': 10,
      'string': 'this is a string',
      'bool': true,
      'object': {
        'name': 'name',
        'value': 100
      }
    })
    .customProperty('customProperty2', {})
    .customProperty('customProperty3', null)
    .customProperty('customProperty4', undefined)
    .customProperty('', { 'number': 10 })
    .customProperty(null, { 'number': 20 })
    .customProperty(undefined, { 'number': 30 })
    .width('100%')
    .height('100%')
  }
}