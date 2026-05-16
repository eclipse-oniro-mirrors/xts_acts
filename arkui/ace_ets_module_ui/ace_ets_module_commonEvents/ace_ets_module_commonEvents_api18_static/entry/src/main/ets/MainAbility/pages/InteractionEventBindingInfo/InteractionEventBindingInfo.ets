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
import {
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  List,
  Margin,
  NodeContainer,
  Radio,
  Row,
  Text,
  TouchEvent
} from '@ohos.arkui.component';
import { AppStorage, Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { FrameNode, NodeController, typeNode } from '@ohos.arkui.node';

const TEST_TAG: string = "FrameNode "

class MyNodeControllerBindOnClick extends NodeController {
  public node: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext);
    this.node!.commonAttribute
      .width('90%')
      .height(50)
      .borderColor(Color.Gray)
      .borderWidth(1)
      .focusable(true)
      .margin({ left: '5%' } as Margin);
    let col = typeNode.createColumnNode(uiContext);
    col.initialize({ space: 5 } as ColumnOptions)
      .width('100%').height('100%').focusable(true);
    this.node!.appendChild(col);
    let Column2 = typeNode.createColumnNode(uiContext);
    Column2.initialize().id("column5").onClick((e: ClickEvent) => {
    })
    col.appendChild(Column2);
    this.addCommonEvent(Column2)
    return this.node;
  }

  addCommonEvent(frameNode: FrameNode) {
    frameNode.commonEvent.setOnClick((event: ClickEvent) => {
      console.log(`Click FrameNode: ${JSON.stringify(event)}`)
    })
    frameNode.commonEvent.setOnTouch((event: TouchEvent) => {
      console.log(`touch FrameNode: ${JSON.stringify(event)}`)
    })
  }
}

@Entry
@Component
struct InteractionEventBindingInfoExample {
  @State text: string = ''
  @State text1: string = ''
  @State text2: string = ''
  @State text3: string = ''
  @State text4: string = ''
  @State text5: string = ''
  @State text6: string = ''
  @State text7: string = ''
  @State text8: string = ''
  private myNodeControllerBindOnClick: MyNodeControllerBindOnClick = new MyNodeControllerBindOnClick();

  build() {
    Column() {
      Row() {
        Radio({ value: 'Radio1', group: 'radioGroup' })
          .onClick((e: ClickEvent) => {
            console.log()
          })
          .id("radio1")

        Radio({ value: 'Radio2', group: 'radioGroup' })
          .id("radio2")

        Column().id("column1").onClick((e: ClickEvent) => {

        })

        Column().id("column2")
      }

      NodeContainer(this.myNodeControllerBindOnClick).focusable(true)
        .width(300).height(500).borderWidth(1)

      Row() {
        Text(this.text1).key('value1')
        Text(this.text2).key('value2')
        Text(this.text3).key('value3')
        Text(this.text4).key('value4')
        Text(this.text5).key('value5')
        Text(this.text6).key('value6')
        Text(this.text7).key('value7')
        Text(this.text8).key('value8')
        Button(this.text8).id('undefined')
          .onClick((e: ClickEvent) => {
            // this.text8 =
            //   String(this.getUIContext().getFrameNodeById("Radio1")?.getInteractionEventBindingInfo(undefined))
          })
      }


      Row() {
        Button(this.text1).id('baseTrue')
          .onClick((e: ClickEvent) => {
            console.log('test click start 11')
            // this.text1 = String(this.getUIContext()
            // .getFrameNodeById("column1")?.getInteractionEventBindingInfo(EventQueryType.ON_CLICK)?.baseEventRegistered)
          })
        Button(this.text2).id("nodeTrue")
          .onClick((e: ClickEvent) => {
            // this.text2 = String(this.getUIContext()
            //   .getFrameNodeById("column5")?.getInteractionEventBindingInfo(EventQueryType.ON_CLICK)?.nodeEventRegistered)
          })
        Button(this.text3).id('builtInTrue')
          .onClick((e: ClickEvent) => {
            // this.text3 = String(this.getUIContext()
            //   .getFrameNodeById("radio1")?.getInteractionEventBindingInfo(EventQueryType.ON_CLICK)?.builtInEventRegistered)
          })

      }

      Row() {
        Button(this.text4).id('baseFalse')
          .onClick((e: ClickEvent) => {
            // this.text4 = String(this.getUIContext()
            //   .getFrameNodeById("radio2")?.getInteractionEventBindingInfo(EventQueryType.ON_CLICK)?.baseEventRegistered)
          })
        Button(this.text5).id('nodeFalse')
          .onClick((e: ClickEvent) => {
            // this.text5 = String(this.getUIContext()
            //   .getFrameNodeById("radio2")?.getInteractionEventBindingInfo(EventQueryType.ON_CLICK)?.nodeEventRegistered)
          })
        Button(this.text6).id('nativeFalse')
          .onClick((e: ClickEvent) => {
            // this.text6 = String(this.getUIContext()
            //   .getFrameNodeById("radio2")?.getInteractionEventBindingInfo(EventQueryType.ON_CLICK)?.nativeEventRegistered)
          })
        Button(this.text7).id('builtInFalse')
          .onClick((e: ClickEvent) => {
            // this.text7 = String(this.getUIContext()
            //   .getFrameNodeById("column1")?.getInteractionEventBindingInfo(EventQueryType.ON_CLICK)?.builtInEventRegistered)
          })

      }
    }
  }
}