/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import hilog from '@ohos.hilog';
import { UIContext } from '@ohos.arkui.UIContext';
import curves from '@ohos.curves';
import dragController from '@ohos.arkui.dragController';
import image from '@ohos.multimedia.image';
import { BusinessError } from '@ohos.base';

let storages = LocalStorage.getShared();

@Entry(storages)
@Component
struct DragControllerPage {
  @State pixmap: image.PixelMap|null = null
  @State dragFlag: string = "Init"
  private arr: number[] = [0, 1, 2]

  aboutToAppear(): void {
    if(this.pixmap){
      try {
        loadNativeModule('global')
      } catch {
        console.log('loadNativeModule error')
      }
    }
  }

  @Builder DraggingBuilder() {
    Column() {
      Text("DraggingBuilder")
        .fontColor(Color.White)
        .fontSize(12)
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

  build() {
    Column() {
      Button(this.dragFlag).id("UIContextDragController2")
        .margin(10)
        .onDragEnter(() => {
          try {
            let uiContext: UIContext = this.getUIContext();
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
        .onDrop(() => {
          this.dragFlag = 'Drag Success'
        })

      Button('start drag').id("UIContextDragController1")
        .onTouch((event?:TouchEvent) => {
          if(event){
            if (event.type == TouchType.Down) {
              let text = new unifiedDataChannel.Text()
              let unifiedData = new unifiedDataChannel.UnifiedData(text)
              let dragInfo: dragController.DragInfo = {
                pointerId: 0,
                data: unifiedData,
                extraParams: ''
              }
              dragController.executeDrag(() => {
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
      }).margin({top:100})

    List({ space: 20, initialIndex: 0 }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item)
              .width('100%').height(100).fontSize(16)
              .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
          }
        }, (item: string) => item)
          .onMove((from:number, to: number)=>{
            console.log('onMove succ from:' + from + ' to:' + to)
          })
      }
    }
    .width('100%')
    .height('100%')
  }
}