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
import { ComponentContent, FrameNode } from '@kit.ArkUI';

class Params {
  private text: string = ''

  constructor(text: string) {
    this.text = text;
  }
}
@Builder
function buildText(param?: Params) {
  Column() {
    Menu(){
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项1' })
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项2' })
    }
  }
  .width('80%')
}

@Entry
@Component
struct Index {
  @State openMenu: string = 'init'
  build() {
    Column() {
      Text(this.openMenu)
        .id('openMenu')
      Button('openMenu')
        .id('btn')
        .fontSize(20)
        .onClick(() => {
          let context = this.getUIContext()
          const contentNode = new ComponentContent(context, wrapBuilder(buildText));
          const promptAction = context.getPromptAction();
          let uniqueId = this.getUniqueId();
          let frameNode: FrameNode | null = context.getFrameNodeByUniqueId(uniqueId);
          promptAction.openMenu(contentNode, {id: 'btn', componentId: frameNode?.getUniqueId() },{
            enableArrow: true,
          })
            .then(() => {
              console.info('openMenu success');
              this.openMenu = 'openMenu'
            })
        })
    }
  }
}