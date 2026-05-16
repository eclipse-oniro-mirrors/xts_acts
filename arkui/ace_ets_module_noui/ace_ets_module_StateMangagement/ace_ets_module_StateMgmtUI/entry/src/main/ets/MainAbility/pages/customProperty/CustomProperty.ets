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
struct CustomProperty {
  @State result1: string = '';
  @State result2: string = '';
  @State result3: string = '';

  build() {
    Column() {
      Text('Test customProperty with object')
        .id('text_test1')
        .height('5%')

      Text(`Result1: ${this.result1}`)
        .id('text_result1')
        .height('5%')

      Text('Test customProperty with undefined')
        .id('text_test2')
        .height('5%')

      Text(`Result2: ${this.result2}`)
        .id('text_result2')
        .height('5%')

      Text('Test multiple customProperty')
        .id('text_test3')
        .height('5%')

      Text(`Result3: ${this.result3}`)
        .id('text_result3')
        .height('5%')

      Button('Verify Property1')
        .id('button_verify1')
        .height('5%')
        .onClick(() => {
          this.verifyProperty1();
        })

      Button('Verify Property2')
        .id('button_verify2')
        .height('5%')
        .onClick(() => {
          this.verifyProperty2();
        })

      Button('Verify Property3')
        .id('button_verify3')
        .height('5%')
        .onClick(() => {
          this.verifyProperty3();
        })
    }
    .id('column_custom_property')
    .customProperty('customProperty1', {
      'number': 10,
      'string': 'this is a string',
      'bool': true,
      'object': {
        'name': 'name',
        'value': 100
      }
    })
    .customProperty('customProperty2', undefined)
    .customProperty('customProperty3', {
      'width': 100,
      'height': 200
    })
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#F5F5F5')
  }

  verifyProperty1(): void {
    const uiContext: UIContext = this.getUIContext();
    const node: FrameNode | null = uiContext.getFrameNodeById('column_custom_property') || null;
    if (node) {
      const property: Object | undefined = node.getCustomProperty('customProperty1');
      this.result1 = JSON.stringify(property);
    }
  }

  verifyProperty2(): void {
    const uiContext: UIContext = this.getUIContext();
    const node: FrameNode | null = uiContext.getFrameNodeById('column_custom_property') || null;
    if (node) {
      const property: Object | undefined = node.getCustomProperty('customProperty2');
      this.result2 = JSON.stringify(property);
    }
  }

  verifyProperty3(): void {
    const uiContext: UIContext = this.getUIContext();
    const node: FrameNode | null = uiContext.getFrameNodeById('column_custom_property') || null;
    if (node) {
      const property: Object | undefined = node.getCustomProperty('customProperty3');
      this.result3 = JSON.stringify(property);
    }
  }
}