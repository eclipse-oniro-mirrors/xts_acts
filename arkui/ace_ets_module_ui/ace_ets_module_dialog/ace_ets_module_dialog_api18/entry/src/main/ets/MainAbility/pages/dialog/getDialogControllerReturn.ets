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

import { BusinessError } from '@kit.BasicServicesKit';
import { ComponentContent } from '@kit.ArkUI';
class Params {
  public text: string = ''
  constructor(text: string) {
    this.text = text;
  }
}
@ComponentV2
struct MyComponent {
  build() {
    Column() {
    }
  }
}
@Builder
function buildText(params: Params) {
  Column() {
    Text(params.text)
      .fontWeight(FontWeight.Bold)
    MyComponent()
  }.backgroundColor('#FFF0F0F0')
}
@Entry
@ComponentV2
struct getDialogControllerReturn {
  @Local message: string = 'hello'
  @Local str: string = 'hello';
  build() {
    Column({ space: 5 }) {
      Text(this.str).height(30)
      Button('click')
        .id('GetDialogControllerReturnUndefined')
        .onClick(() => {
          let res: undefined = this.getDialogController()
          AppStorage.SetOrCreate('GetDialogControllerReturnUndefined', res)
          this.str = JSON.stringify(res)
          let ctx = this.getUIContext()
          let promptAction = ctx.getPromptAction()
          promptAction.openCustomDialog(new ComponentContent(ctx, wrapBuilder(buildText), new Params(this.message)))
            .catch((err: BusinessError) => {
              console.error('openCustomDialog error: ' + err.code + ' ' + err.message)
            })
        })
    }
    .width('100%')
  }
}