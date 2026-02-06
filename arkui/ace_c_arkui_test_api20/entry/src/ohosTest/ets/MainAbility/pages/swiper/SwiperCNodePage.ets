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
import nativeNode from 'libnativerender.so'
import {NodeContent, typeNode} from '@kit.ArkUI'

@Entry
@Component
struct SwiperCNodePage {
  private nodeContent: NodeContent | undefined = new NodeContent();

  aboutToAppear() {
    // 通过C-API创建节点，并添加到管理器nodeContent上
    nativeNode.createCrossLanguageSwiperNode(this.nodeContent, 'Swiper');
  }

  build() {
    Column() {
      Button('CAPINode_C侧').onClick(() => {
        const node = this.getUIContext().getFrameNodeById('SwiperCrossLanguage_capiNode');
        console.info('Swiper isModifiable:' + node?.isModifiable());
        if (node) {
          console.info('Swiper CAPINode is exist')
          const a = typeNode.getAttribute(node, 'Swiper');
          if (a != undefined) {
            console.info('Swiper CAPINode background Yellow')
            a.backgroundColor(Color.Yellow)
            a.size({width: 120, height: 120})
          }
        } else {
          console.info('Swiper CAPINode is null')
        }
      }).id('SwiperCNodePage_Btn')

      ContentSlot(this.nodeContent)
    }
    .width('100%')
    .height('100%')
  }
}