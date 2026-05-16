/**
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
import { ComponentContent, OverlayManager } from '@kit.ArkUI';

class Params {
  public text: string = ''

  constructor(text: string) {
    this.text = text
  }
}

@Builder
function builderText(params: Params) {
  Column() {
    Text(params.text)
      .fontWeight(FontWeight.Bold)
  }
  .alignItems(HorizontalAlign.Center)
  .justifyContent(FlexAlign.End)
  .width(150)
  .height(80)
  .backgroundColor(Color.Red)
}

@Entry
@Component
struct HideComponentContentNullTest {
  private ctx: UIContext = this.getUIContext()
  private overlayNode: OverlayManager = this.ctx.getOverlayManager()
  @StorageLink('testResult') testResult: string = ''
  @StorageLink('errorCode') errorCode: number = -1

  build() {
    Column({ space: 5 }) {
      Button('test_componentContent_null')
        .id('test_componentContent_null')
        .onClick(() => {
          try {
            this.overlayNode.hideComponentContent(null)
            this.testResult = 'no_error'
            this.errorCode = 0
          } catch (e) {
            this.testResult = 'error'
            this.errorCode = (e as BusinessError).code
            console.info('test_componentContent_null error: ' + (e as BusinessError).code)
          }
        })

      Button('test_componentContent_undefined')
        .id('test_componentContent_undefined')
        .onClick(() => {
          try {
            this.overlayNode.hideComponentContent(undefined)
            this.testResult = 'no_error'
            this.errorCode = 0
          } catch (e) {
            this.testResult = 'error'
            this.errorCode = (e as BusinessError).code
            console.info('test_componentContent_undefined error: ' + (e as BusinessError).code)
          }
        })

      Text(`Result: ${this.testResult}`)
        .id('result_text')
      Text(`ErrorCode: ${this.errorCode}`)
        .id('error_code_text')
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
