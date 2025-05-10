/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { BusinessError } from '@kit.BasicServicesKit';
import { ComponentContent, LevelOrder, promptAction, UIContext } from '@kit.ArkUI';

class Params {
  public text: string = '';
  public dialogController: promptAction.DialogController = new promptAction.DialogController();
  constructor(text: string, dialogController: promptAction.DialogController) {
    this.text = text;
    this.dialogController = dialogController;
  }
}

@Builder
function buildText(params: Params) {
  Column({ space: 10 }) {
    Text(params.text)
    Button('close')
      .id('close')
      .onClick(() => {
        if (params.dialogController != undefined) {
          params.dialogController.close()
        }
      })
  }
  .width('100%')
  .borderRadius(10)
  .margin({ bottom: 20 })
  .backgroundColor('#6582f8')
}

@Entry
@ComponentV2
struct openCustomDialogWithConOrder {
  @Local message: string = 'hello'
  public dialogController: promptAction.DialogController = new promptAction.DialogController()
  uiContext: UIContext = this.getUIContext();
  promptAction = this.uiContext.getPromptAction();

  build() {
    Column() {
      Row() {
        Button('100')
          .id('100')
          .height('8%')
          .onClick(() => {
            let contentNode = new ComponentContent(this.uiContext, wrapBuilder(buildText),
              new Params(this.message, this.dialogController));
            this.promptAction.openCustomDialogWithController(contentNode, this.dialogController, {
              levelOrder: LevelOrder.clamp(100),
              alignment: DialogAlignment.Bottom,
              isModal: false
            })
              .then(() => {
                console.info('succeeded')
              })
              .catch((error: BusinessError) => {
                console.error(`OpenCustomDialogWithController args error code is ${error.code}, message is ${error.message}`);
              })
          })
        Button('100001')
          .id('100001')
          .height('8%')
          .onClick(() => {
            let contentNode = new ComponentContent(this.uiContext, wrapBuilder(buildText),
              new Params(this.message, this.dialogController));
            this.promptAction.openCustomDialogWithController(contentNode, this.dialogController, {
              levelOrder: LevelOrder.clamp(100001),
              alignment: DialogAlignment.Bottom,
              isModal: false
            })
              .then(() => {
                console.info('succeeded')
              })
              .catch((error: BusinessError) => {
                console.error(`OpenCustomDialogWithController args error code is ${error.code}, message is ${error.message}`);
              })
          })
      }

      Row() {
        Button('-100001')
          .id('-100001')
          .height('8%')
          .onClick(() => {
            let contentNode = new ComponentContent(this.uiContext, wrapBuilder(buildText),
              new Params(this.message, this.dialogController));
            this.promptAction.openCustomDialogWithController(contentNode, this.dialogController, {
              levelOrder: LevelOrder.clamp(-100001),
              alignment: DialogAlignment.Bottom,
              isModal: false
            })
              .then(() => {
                console.info('succeeded')
              })
              .catch((error: BusinessError) => {
                console.error(`OpenCustomDialogWithController args error code is ${error.code}, message is ${error.message}`);
              })
          })
        Button('undefined')
          .id('undefined')
          .height('8%')
          .onClick(() => {
            let contentNode = new ComponentContent(this.uiContext, wrapBuilder(buildText),
              new Params(this.message, this.dialogController));
            this.promptAction.openCustomDialogWithController(contentNode, this.dialogController, {
              levelOrder: LevelOrder.clamp(undefined),
              alignment: DialogAlignment.Bottom,
              isModal: false
            })
              .then(() => {
                console.info('succeeded')
              })
              .catch((error: BusinessError) => {
                console.error(`OpenCustomDialogWithController args error code is ${error.code}, message is ${error.message}`);
              })
          })
      }

      Button('set levelOrder')
        .height('8%')
        .id('myOrder')
        .onClick(() => {
          let openCustomDialogWithConOrder = this.getUIContext().getPromptAction().getTopOrder()
          if (openCustomDialogWithConOrder !== undefined) {
            AppStorage.setOrCreate('openCustomDialogWithConOrder', openCustomDialogWithConOrder.getOrder())
            console.error('topOrder: ' + openCustomDialogWithConOrder.getOrder());
          }
        })
    }
    .width('100%')
    .height('100%')
  }
}