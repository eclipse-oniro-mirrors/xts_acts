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
struct XComponentCNodePage {
  private nodeContent: NodeContent | undefined = new NodeContent();

  aboutToAppear() {
    // 通过C-API创建节点，并添加到管理器nodeContent上
    nativeNode.createCrossLanguageXComponentNativeNode(this.nodeContent, 'ygb');
  }

  build() {
    Column() {
      Button('TS侧修改xc组件属性').onClick(() => {
        const node = this.getUIContext().getFrameNodeById('XComponentCrossLanguage_capiNode');
        console.info('ZRJ isModifiable:' + node?.isModifiable());
        if (node) {
          console.info('ZRJ XComponent TypeNode is exist')
          const a = typeNode.getAttribute(node, 'XComponent');
          if (a != undefined) {
            console.info('ZRJ XComponent TypeNode background Green')
            a.backgroundColor(Color.Green)
            a.size({width: 200, height: 200})
            a.enableSecure(true)
            a.enableAnalyzer(true)
          }
        } else {
          console.info('ZRJ XComponent TypeNode is null')
        }
      }).key('XComponentCNodePage_Btn_TS')

      Button('C侧修改xc组件属性').onClick(() => {
        nativeNode.crossLanguageSetXComponentAttribute('XComponentCrossLanguage_capiNode');
      }).key('XComponentCNodePage_Btn_C')

      Text('CNode创建SURFACE类型的XC')
      ContentSlot(this.nodeContent)
    }
    .padding({ left: 35, right: 35, top: 35 })
    .width('100%')
    .height('100%')
  }
}