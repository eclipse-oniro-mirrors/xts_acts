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
import UDC from '@ohos.data.unifiedDataChannel';
import hilog from '@ohos.hilog';
import { DragController } from "@ohos.arkui.UIContext"
import  dragController  from "@ohos.arkui.dragController"
import componentSnapshot from '@ohos.arkui.componentSnapshot';
import image from '@ohos.multimedia.image';
import curves from '@ohos.curves';
import { BusinessError } from '@ohos.base';
import { UIContext } from '@ohos.arkui.UIContext';
import {
  Entry, Component,
  Column, ColumnOptions, Row, Builder, TouchEvent,Color, WrappedBuilder, NodeContainer, DragEvent, TouchType, DragResult,
  Text, Button, FontWeight, ClickEvent, Margin, WidthBreakpoint, HeightBreakpoint, CustomBuilderT, ResourceColor,
} from '@ohos.arkui.component'

import { State , LocalStorage} from '@ohos.arkui.stateManagement';

class Tmp{
  event:DragEvent|undefined = undefined
  extraParams:string = ''
}


let storages: LocalStorage = new LocalStorage()
let _get_local_storage_ = ():LocalStorage => storages

@Entry({ storage:'_get_local_storage_' })
// @Entry
@Component
struct DragControllerPage {
  @State pixmap: image.PixelMap|null = null
  @State flag: number = 0
  @Builder DraggingBuilder() {
    Column() {
      Text("DraggingBuilder")
    }
    .width(100)
    .height(100)
    .backgroundColor(Color.Blue)
  }
  @Builder PixmapBuilder() {
    Column() {
      Text("PixmapBuilder")
    }
    .width(100)
    .height(100)
    .backgroundColor(Color.Blue)
  }
  @State DragController1:DragController = this.getUIContext().getDragController()


  build() {
    Column() {
      Text(this.flag.toString()).id('Do_id')
      Button('拖拽至此处')
        .onClick((e:ClickEvent)=>{
          this.flag = 1
        })
        .id('dragFlag')
        .onDragEnter((event: DragEvent, extraParams?: string):void => {
        try {
          let uiContext: UIContext = storages.get<UIContext>('uiContext') as UIContext;
          let previewObj: dragController.DragPreview = uiContext.getDragController().getDragPreview();
          let foregroundColor: ResourceColor = Color.Green;

          let previewAnimation: dragController.AnimationOptions = {
            curve: curves.cubicBezierCurve(0.2,0,0,1),
          }
          previewObj.animate(previewAnimation, () => {
            previewObj.setForegroundColor(foregroundColor);
          });
        } catch (error) {
          let msg = (error as BusinessError).message;
          let code = (error as BusinessError).code;
          hilog.error(0x0000, `show error code is ${code}, message is ${msg}`, '');
        }
      })
        .onDrop((event: DragEvent, extraParams?: string) => {
        })
      Button('拖起')
        .onTouch((event?:TouchEvent) => {
        if(event){
          if (event.type == TouchType.Down) {
            let text = new UDC.Text()
            let unifiedData = new UDC.UnifiedData(text)
            let dragInfo: dragController.DragInfo = {
              pointerId: 0,
              data: unifiedData,
              extraParams: ''
            }

            let eve:Tmp = new Tmp()
            this.DragController1!.executeDrag(() => {
              this.DraggingBuilder()
            }, dragInfo, (err , eve) => {
              hilog.info(0x0000, `ljx ${JSON.stringify(err)}`, '')
              if (eve && eve.event) {
                if (eve.event.getResult() == DragResult.DRAG_SUCCESSFUL) {
                  hilog.info(0x0000, 'success', '');
                } else if (eve.event.getResult() == DragResult.DRAG_FAILED) {
                  hilog.info(0x0000, 'failed', '');
                }
              }
            })
          }
        }
      })
        .margin({top:100} as Margin)
    }
    .width('100%')
    .height('100%')
  }
}