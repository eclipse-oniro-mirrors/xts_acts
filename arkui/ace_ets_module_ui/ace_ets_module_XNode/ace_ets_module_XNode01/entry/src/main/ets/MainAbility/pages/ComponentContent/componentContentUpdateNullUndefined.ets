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

import { ComponentContent } from '@kit.ArkUI';

class Params {
  public text: string = '';

  constructor(text: string) {
    this.text = text;
  }
}

@Builder
function buildText(params: Params) {
  Column() {
    Text(params.text)
      .fontSize(50)
      .fontWeight(FontWeight.Bold)
      .margin({ bottom: 36 })
  }.backgroundColor('#FFF0F0F0')
}

@Entry
@Component
struct componentContentUpdateNullUndefined {
  @State str: string = 'hello';

  build() {
    Column({space:5}) {
      Column({space:5}) {
        Text(this.str).height(25).id('componentContentUpdateNullUndefinedText')
        Button('clickNull')
          .width(80)
          .height(25)
          .onClick(() => {
            try {
              let uiContext = this.getUIContext();
              let promptAction = uiContext.getPromptAction();
              let contentNode = new ComponentContent(uiContext, wrapBuilder(buildText), new Params('hello'));
              promptAction.openCustomDialog(contentNode);
              contentNode.update(null);
            } catch(e) {
              console.info('error code is error');
            }
            this.str = 'updateNull'
          })
          .id('componentContentUpdateNull')
        Button('clickUndefined')
          .width(110)
          .height(25)
          .onClick(() => {
            try {
              let uiContext = this.getUIContext();
              let promptAction = uiContext.getPromptAction();
              let contentNode = new ComponentContent(uiContext, wrapBuilder(buildText), new Params('hello'));
              promptAction.openCustomDialog(contentNode);
              contentNode.update(undefined);
            } catch(e) {
              console.info('error code is error');
              }
            this.str = 'updateUndefined'
          })
          .id('componentContentUpdateUndefined')
      }
    }
    .width('100%')
    .height('100%')
  }
}