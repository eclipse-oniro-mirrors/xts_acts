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
import UDC from '@ohos.data.unifiedDataChannel';

@Entry
@Component
struct APIPreDragStatus {
  @State text1: string = 'start'
  @State text2: string = 'start'
  @State text3: string = 'start'
  @State text4: string = 'start'
  @State text5: string = 'start'
  @State text6: string = 'start'
  @State text7: string = 'start'

  private PreDragChange(preDragStatus: PreDragStatus): void {
    if (preDragStatus == PreDragStatus.ACTION_DETECTING_STATUS) {
      this.text1 = 'ACTION_DETECTING_STATUS'
    } else if (preDragStatus == PreDragStatus.READY_TO_TRIGGER_DRAG_ACTION) {
      this.text2 = 'READY_TO_TRIGGER_DRAG_ACTION'
    } else if (preDragStatus == PreDragStatus.PREVIEW_LIFT_STARTED) {
      this.text3 = 'PREVIEW_LIFT_STARTED'
    } else if (preDragStatus == PreDragStatus.PREVIEW_LIFT_FINISHED) {
      this.text4 = 'PREVIEW_LIFT_FINISHED'
    } else if (preDragStatus == PreDragStatus.PREVIEW_LANDING_STARTED) {
      this.text5 = 'PREVIEW_LANDING_STARTED'
    } else if (preDragStatus == PreDragStatus.PREVIEW_LANDING_FINISHED) {
      this.text6 = 'PREVIEW_LANDING_FINISHED'
    } else if (preDragStatus == PreDragStatus.ACTION_CANCELED_BEFORE_DRAG) {
      this.text7 = 'ACTION_CANCELED_BEFORE_DRAG'
    }
  }

  build() {
    Column({space:10}) {
      Text(this.text1).key('APIPreDragStatusText01')
      Text(this.text2).key('APIPreDragStatusText02')
      Text(this.text3).key('APIPreDragStatusText03')
      Text(this.text4).key('APIPreDragStatusText04')
      Text(this.text5).key('APIPreDragStatusText05')
      Text(this.text6).key('APIPreDragStatusText06')
      Text(this.text7).key('APIPreDragStatusText07')
      Column() {
        Text('this is abstract')
          .fontSize(30).fontWeight(700)
          .width('100%')
      }
      .key('APIPreDragStatusColumn')
      .margin({ left: 40, top: 20 })
      .border({width:3})
      .width('80%')
      .height(100)
      .onDragStart((event) => {
        let data: UDC.PlainText = new UDC.PlainText();
        data.abstract = 'this is abstract';
        data.textContent = 'this is content this is content';
        (event as DragEvent).setData(new UDC.UnifiedData(data));
      })
      .onPreDrag((status: PreDragStatus) => {
        this.PreDragChange(status);
      })

      Button('Init').key('APIPreDragStatusButton')
        .onClick(()=>{
          this.text1 = 'start'
          this.text2= 'start'
          this.text3 = 'start'
          this.text4 = 'start'
          this.text5 = 'start'
          this.text6 = 'start'
          this.text7 = 'start'
        })
    }
  }
}