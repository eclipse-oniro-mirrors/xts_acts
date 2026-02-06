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
  Column, ColumnOptions, ImageAnalyzerType, CheckboxGroup, Checkbox, ToggleOptions, HorizontalAlign, Scroll, ToggleType,
  Flex, FlexDirection, ItemAlign, FlexAlign, ImageAIOptions,  ImageAnalyzerController, ImageBitmap,  ImageAnalyzerConfig,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, RenderingContextSettings, CanvasRenderingContext2D, Canvas,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
let toggleOptions:ToggleOptions = {type: ToggleType.Checkbox, isOn: false};

class MyNodeController extends  NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext)
    let col1 = typeNode.createColumnNode(uiContext)
    col1.initialize({ space: 10 } as ColumnOptions).borderColor(Color.Black).alignItems(HorizontalAlign.Center)
    let col = typeNode.createColumnNode(uiContext)
    col.initialize({ space: 10 } as ColumnOptions).borderColor(Color.Black).alignItems(HorizontalAlign.Center)
    let scroll = typeNode.createScrollNode(uiContext)
    scroll.initialize()
    let toggle = typeNode.createToggleNode(uiContext, toggleOptions)
    toggle.initialize( { type: ToggleType.Button, isOn: false }).width(50)
      .key('key_Toggle_001')
    col.appendChild(toggle)
    scroll.appendChild(col)
    col1.appendChild(scroll)
    node.appendChild(col1)
    return node
  }
}

@Entry
@Component
struct slider {
  private myNodeController: MyNodeController = new MyNodeController()
  build() {
    Column(){
      Scroll(){
        Column({ space: 20 } as ColumnOptions) {
          NodeContainer(this.myNodeController)
        }
      }
    }

  }
}

