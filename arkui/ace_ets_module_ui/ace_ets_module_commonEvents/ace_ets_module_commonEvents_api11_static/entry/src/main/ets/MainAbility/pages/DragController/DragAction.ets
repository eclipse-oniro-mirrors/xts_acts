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
import dragController from "@ohos.arkui.dragController"
import componentSnapshot from '@ohos.arkui.componentSnapshot';
import image from '@ohos.multimedia.image';
import UDC from '@ohos.data.unifiedDataChannel';
import { Entry, Component, Column, Row, Text, ColumnOptions, TouchEvent, TouchType, CustomBuilder, DragItemInfo, Color, Button, Margin,Builder} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct DragControllerPage {
  @State pixmap: image.PixelMap|null = null
  @State text2: string = 'DragAction'
  private dragAction: dragController.DragAction|null = null;
  customBuilders:Array<CustomBuilder | DragItemInfo> = new Array<CustomBuilder | DragItemInfo>();
  @Builder DraggingBuilder() {
    Column() {
      Text("DraggingBuilder")
    }
    .width(100)
    .height(100)
    .backgroundColor(Color.Blue)
  }


  build() {
    Column() {

      Column() {
        Text(this.text2).key('text_value')
      }
      .width(100)
      .height(100)
      .backgroundColor(Color.Red)

      Button('多对象dragAction customBuilder拖拽')
      .key('drag_value')
      .draggable(true)
      .onTouch((event?:TouchEvent) => {
        if(event){
          if (event.type == TouchType.Down) {
            console.log("muti drag Down by listener");
            this.customBuilders.push(this.DraggingBuilder);
            this.customBuilders.push(this.DraggingBuilder);
            this.customBuilders.push(this.DraggingBuilder);
            let text = new UDC.Text()
            let unifiedData = new UDC.UnifiedData(text)
            let dragInfo: dragController.DragInfo = {
              pointerId: 0,
              data: unifiedData,
              extraParams: ''
            }
            try{
              this.dragAction = this.getUIContext().getDragController().createDragAction(this.customBuilders, dragInfo)
              if(!this.dragAction){
                console.log("listener dragAction is null");
                return
              }
			        this.text2 = 'success'
              // this.dragAction?.on('statusChange', (dragAndDropInfo)=>{
              //   if (dragAndDropInfo.status == dragController.DragStatus.STARTED) {
              //     console.log("drag has start");
              //   } else if (dragAndDropInfo.status == dragController.DragStatus.ENDED){
              //     console.log("drag has end");
              //     if (!this.dragAction) {
              //       return
              //     }
              //     this.customBuilders.splice(0, this.customBuilders.length)
              //     this.dragAction?.off('statusChange')
              //   }
              // })
              this.dragAction?.startDrag()?.then(()=>{})?.catch((err:Error)=>{
                console.log("start drag Error:" + err.message);
              })
            } catch(err:Error) {
              console.log("create dragAction Error:" + err.message);
            }
          }
        }
      }).margin({top:20} as Margin)
    }
  }
}