'use static';
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

import { FrameNode, NodeController } from '@ohos.arkui.node';
import {
  Entry,
  Component,
  $r,
  Column,
  ColumnOptions,
  Text,
  Color,
  Row,
  Margin,
  TextAlign,
  Button,
  ClickEvent,
  Stack,
  Visibility,
  PanGestureHandler,
  GestureEvent,
  NodeContainer
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

class MyNodeController extends NodeController {
  public rootNode: FrameNode | null = null;
  public text1: string = '';
  public text2: string = '';
  public text3: string = '';

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.rootNode?.commonAttribute.width(100)
      .overlay('This is a FrameNode')
      .backgroundColor(Color.Pink)
      .width('100%')
      .height('100%');
    if (this.rootNode !== null) {
      this.addGestureEvent(this.rootNode!);
    }
    return this.rootNode;
  }

  addGestureEvent(frameNode: FrameNode) {
    frameNode.gestureEvent.addGesture(new PanGestureHandler()
      .onActionStart((event: GestureEvent) => {
        console.log(`Pan start: ${JSON.stringify(event)}`);
        this.text1 = 'Pan start'; //未执行
      })
      .onActionUpdate((event: GestureEvent) => {
        console.log(`Pan update: ${JSON.stringify(event)}`);
        this.text2 = 'Pan update';//未执行
      })
      .onActionEnd((event: GestureEvent) => {
        console.log(`Pan end: ${JSON.stringify(event)}`);
        this.text3 = 'Pan end';//未执行
      })
      .onActionCancel(() => {
        console.log('Pan cancel');
      })
    )
  }
}

@Entry
@Component
struct gestureEventTest {
  private myNodeController: MyNodeController = new MyNodeController();
  @State str1: string = ''
  @State str2: string = ''
  @State str3: string = ''

  build() {
    Column() {
      Text(this.str1).id('panGesture_text1')
      Text(this.str2).id('panGesture_text2')
      Text(this.str3).id('panGesture_text3')

      Button('getpanGestureInfo')
        .onClick((e: ClickEvent)=>{
          this.str1 = this.myNodeController.text1
          this.str2 = this.myNodeController.text2
          this.str3 = this.myNodeController.text3
        })
        .id('getpanGestureInfo')

      NodeContainer(this.myNodeController)
        .id('gestureEventTest_node')
        .borderWidth(1)
        .width(300)
        .height(300)
    }.width('100%')
  }
}