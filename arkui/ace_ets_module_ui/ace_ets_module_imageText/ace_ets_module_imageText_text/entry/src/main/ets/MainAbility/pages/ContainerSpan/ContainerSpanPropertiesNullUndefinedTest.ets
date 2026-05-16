/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of a License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { ContainerSpanModifier } from '@kit.ArkUI';

class MyContainerSpanModifier extends ContainerSpanModifier {
  applyNormalAttribute(instance: ContainerSpanAttribute): void {
    super.applyNormalAttribute?.(instance);
    this.textBackgroundStyle({ color: '#7F007DFF', radius: '12vp' });
  }
}

@Entry
@Component
struct ContainerSpanPropertiesNullUndefinedTest {
  @State containerSpanModifier: ContainerSpanModifier = new MyContainerSpanModifier();

  build() {
    Column() {
      Scroll() {
        Column() {
          // ========== textBackgroundStyle tests ==========
          Text('textBackgroundStyle Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Text() {
              ContainerSpan() {
                Span('Hello World')
              }
            }
            .id('ContainerSpan_textBackgroundStyle_default')
            .width('30%')

            // Null
            Text() {
              ContainerSpan() {
                Span('Hello World')
              }
              .textBackgroundStyle(null)
            }
            .id('ContainerSpan_textBackgroundStyle_null')
            .width('30%')

            // Undefined
            Text() {
              ContainerSpan() {
                Span('Hello World')
              }

              .textBackgroundStyle(undefined)
            }
            .id('ContainerSpan_textBackgroundStyle_undefined')
            .width('30%')
          }
          .width('100%')

          // ========== attributeModifier tests ==========
          Text('attributeModifier Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Text() {
              ContainerSpan() {
                Span('Hello World')
              }
            }
            .id('ContainerSpan_attributeModifier_default')
            .width('30%')

            // Null
            Text() {
              ContainerSpan() {
                Span('Hello World')
              }
              .attributeModifier(null)
            }
            .id('ContainerSpan_attributeModifier_null')
            .width('30%')

            // Undefined
            Text() {
              ContainerSpan() {
                Span('Hello World')
              }
              .attributeModifier(undefined)
            }
            .id('ContainerSpan_attributeModifier_undefined')
            .width('30%')
          }
          .width('100%')
        }
      }
    }
    .width('100%')
    .height('100%')
  }
}
