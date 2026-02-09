'use static';
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
import { typeNode, NodeController, FrameNode } from  '@ohos.arkui.node';
import {
  Entry, Component, Builder,NodeContainer, CheckBoxShape,
  Column, ColumnOptions, ImageAnalyzerType, CheckboxGroup, Checkbox, HorizontalAlign,
  Flex, FlexDirection, ItemAlign, FlexAlign, ImageAIOptions,  ImageAnalyzerController, ImageBitmap,  ImageAnalyzerConfig,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, RenderingContextSettings, CanvasRenderingContext2D, Canvas,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';

class MyNodeController extends  NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext)
    let col = typeNode.createColumnNode(uiContext)
    col.initialize({ space: 10 } as ColumnOptions).borderColor(Color.Black).alignItems(HorizontalAlign.Center)
    let checkboxGroup = typeNode.createCheckboxGroupNode(uiContext)
    checkboxGroup.initialize({group:'checkboxGroup'}).key('key_checkboxGroup_001')
    let checkbox1 = typeNode.createCheckboxNode(uiContext)
    checkbox1.initialize({name:'checkbox1',group:'checkboxGroup'})
    let checkbox2 = typeNode.createCheckboxNode(uiContext)
    checkbox2.initialize({name:'checkbox2',group:'checkboxGroup'})
    let checkbox3 = typeNode.createCheckboxNode(uiContext)
    checkbox3.initialize({name:'checkbox3',group:'checkboxGroup'})
    col.appendChild(checkbox1)
    col.appendChild(checkbox2)
    col.appendChild(checkbox3)
    col.appendChild(checkboxGroup)
    node.appendChild(col)
    return node
  }
}

@Entry
@Component
struct checkboxGroup {
  private myNodeController: MyNodeController = new MyNodeController()
  build() {
    Column({ space: 20 } as ColumnOptions) {
      NodeContainer(this.myNodeController)
    }.width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}
