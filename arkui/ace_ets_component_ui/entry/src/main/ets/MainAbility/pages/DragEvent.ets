/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import UDMF from '@ohos.data.unifiedDataChannel';
import promptAction from '@ohos.promptAction';


@Entry
@Component
struct DragEvent {
  @State targetImage: string = '';
  @State targetText: string = 'Drag Text';
  @State hyperLinkText: string = 'HyperLink';
  @State hyperLinkContent: string = 'HyperLink';
  @State imageWidth: number = 100;
  @State imageHeight: number = 100;
  @State abstractContent: string = "abstract";
  @State textContent: string = "";
  @State dragBehavior: string = "dragBehavior";
  @State dragResult: string = "dragResult";
  @State useCustomDropAnimation1: string = "useCustomDropAnimation";
  @State imgState: Visibility = Visibility.Visible;

  @Builder DraggingBuilder() {
    Column() {
      Text("DraggingBuilder")
    }
    .width(100)
    .height(100)
    .backgroundColor(Color.Blue)
  }

  build() {
    Row() {
      Column() {
        Text(this.dragBehavior).id("dragBehavior").margin(5)
        Text(this.dragResult).id("dragResult").margin(5)
        Text(this.useCustomDropAnimation1).id("useCustomDropAnimation").margin(5)

        Image($r('app.media.icon')).margin(5)
          .width(100)
          .height(100)
          .draggable(true)
          .margin({left: 15})
          .visibility(this.imgState)
          .onDragStart((event)=>{
            event.dragBehavior = DragBehavior.COPY
            event.setResult(DragResult.DRAG_SUCCESSFUL);
          })
          .onDragEnd((event)=>{
            event.dragBehavior = DragBehavior.MOVE
            this.dragBehavior = event.dragBehavior.toString()
            event.useCustomDropAnimation === true
            if(event.useCustomDropAnimation === true){
              this.useCustomDropAnimation1 = "true"
              promptAction.showToast({duration: 100, message: 'useCustomDropAnimation==true'});
            }
            if (event.getResult() === DragResult.DRAG_SUCCESSFUL) {
              promptAction.showToast({duration: 100, message: 'Drag DRAG_SUCCESSFUL'});
            } else if (event.getResult() === DragResult.DRAG_FAILED) {
              promptAction.showToast({duration: 100, message: 'Drag Failed'});
            } else if (event.getResult() === DragResult.DRAG_CANCELED) {
              promptAction.showToast({duration: 100, message: 'Drag Canceled'});
            } else if (event.getResult() === DragResult.DROP_DISABLED) {
              promptAction.showToast({duration: 100, message: 'Drop Disabled'});
            }else if (event.getResult() === DragResult.DROP_ENABLED) {
              promptAction.showToast({duration: 100, message: 'Drop Enabled'});
            }
            this.dragResult = event.getResult().toString()
          })

        Button('touch to execute drag')
          .onTouch((event) => {
            if (event.type == TouchType.Down) {
              let text = new UDMF.Text()
              let unifiedData = new UDMF.UnifiedData(text)
              let dragInfo: dragController.DragInfo = {
                pointerId: 0,
                data: unifiedData,
                extraParams: ''
              }
              dragController.executeDrag(this.DraggingBuilder.bind(this), dragInfo, (err, {event, extraParams}) => {
                if (event.getResult() == DragResult.DRAG_SUCCESSFUL) {
                  // ...
                } else if (event.getResult() == DragResult.DRAG_FAILED) {
                  // ...
                }
              })
            }
          })
      }.width('90%')
      .height('100%')
      .margin({left: '5%'})
    }
    .height('100%')
  }
}