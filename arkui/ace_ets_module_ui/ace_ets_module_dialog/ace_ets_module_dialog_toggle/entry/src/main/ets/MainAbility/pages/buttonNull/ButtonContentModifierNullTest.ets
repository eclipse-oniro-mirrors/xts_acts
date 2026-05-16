/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

class MyButtonStyle implements ContentModifier<ButtonConfiguration> {
  applyContent(): WrappedBuilder<[ButtonConfiguration]> {
    return wrapBuilder(buildNormalStyle);
  }
}

@Builder
function buildNormalStyle(config: ButtonConfiguration) {
  Column() {
    Text(config.label)
      .fontSize(20)
  }
}

@Entry
@Component
struct ButtonContentModifierNullTest {
  @StorageLink('testResult') testResult: string = ''
  @StorageLink('errorCode') errorCode: number = -1
  private btnStyle: ContentModifier<ButtonConfiguration> = new MyButtonStyle()

  build() {
    Column() {
      Button('contentModifier_null')
        .id('button_contentModifier_null')
        .contentModifier(null)

      Button('contentModifier_undefined')
        .id('button_contentModifier_undefined')
        .contentModifier(undefined)

      Button('test_click')
        .id('button_test_click')
        .onClick(() => {
          this.testResult = 'clicked'
        })

      Text(`Result: ${this.testResult}`)
        .id('result_text')
      Text(`ErrorCode: ${this.errorCode}`)
        .id('error_code_text')
    }
  }
}