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
import { ComponentContent, PromptAction, LevelOrder, promptAction, UIContext } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

class Params {
  public text: string = ''

  constructor(text: string) {
    this.text = text;
  }
}

@Builder
function buildText(params: Params) {
  Column({ space: 10 }) {
    Text(params.text)
      .fontWeight(FontWeight.Bold)
  }.backgroundColor('#FFF0F0F0')
  .width(200)
  .height(50)
}

@Entry
@Component
struct dialogTransitionTest {
  @State private isEnableTransition: boolean = true;
  @State message: string = '弹窗'
  @State text:string = ''
  private ctx: UIContext = this.getUIContext()
  private promptAction: PromptAction = this.ctx.getPromptAction()
  private contentNode: ComponentContent<Object> =
    new ComponentContent(this.ctx, wrapBuilder(buildText), new Params(this.message))
  private baseDialogOptions: promptAction.BaseDialogOptions = {
    showInSubWindow: false,
    transition: this.isEnableTransition ? TransitionEffect.move(TransitionEdge.BOTTOM)
      .animation({ duration: 2000 })
      .combine(TransitionEffect.OPACITY) : undefined,
    levelOrder: LevelOrder.clamp(30.1),
    onWillAppear:()=>{
      this.text = 'onWillAppear'
      AppStorage.setOrCreate('text',this.text)
      console.log('onWillAppear')
    },
    onDidAppear:()=>{
      console.log('onDidAppear')
    },
    onWillDisappear:()=>{
      console.log('onWillDisappear')
    },
    onDidDisappear:()=>{
      this.text = 'onDidDisappear'
      AppStorage.setOrCreate('text',this.text)
      console.log('onDidDisappear')
    }
  }

  build() {
    Column({ space: 10 }) {
      Button('openCustomDialog')
        .id('open')
        .onClick(() => {
          this.promptAction.openCustomDialog(this.contentNode, this.baseDialogOptions)
            .catch((err: BusinessError) => {
              console.error('openCustomDialog error: ' + err.code + ' ' + err.message)
            })
            .then(() => {
              let bottomOrder: LevelOrder = this.promptAction.getBottomOrder();
              if (bottomOrder !== undefined) {
                console.error('bottomOrder: ' + bottomOrder.getOrder());
              }
            })
        })
    }.height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}