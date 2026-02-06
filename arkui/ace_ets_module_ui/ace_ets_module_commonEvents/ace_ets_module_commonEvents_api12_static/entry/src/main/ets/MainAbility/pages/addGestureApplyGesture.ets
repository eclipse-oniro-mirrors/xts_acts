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
import { Entry, Component, Column, Row, Text, ColumnOptions, TouchType, CustomBuilder, DragItemInfo, Color, Button, TouchEvent, Margin, GestureModifier, UIGestureEvent, TapGestureHandler, GestureEvent, PanGestureHandler, GesturePriority} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
class MyButtonModifier implements GestureModifier {
  supportDoubleTap: boolean = true
  value: string = '666'

  applyGesture(event: UIGestureEvent): void {
    if (this.supportDoubleTap) {
      event.addGesture(
        new TapGestureHandler({ count: 2, fingers: 1 })
          .tag("aaa")
          .onAction((event: GestureEvent):void => {
            console.log("button tap " +JSON.stringify(event.repeat))
            // return this.value
          }),
        GesturePriority.PRIORITY
      )
    } else {
      event.addGesture(
        new PanGestureHandler()
          .onActionStart(():void=>{
            console.log("Pan start");
            // return 'Pan start'
          })
      )
    }
  }
}

@Entry
@Component
struct applyGesture1 {
  @State modifier: MyButtonModifier = new MyButtonModifier()


  build() {
    Row() {
      Column() {
        Button(this.modifier.value).margin({bottom:20} as Margin).id('gestureText1')
        Column()
          .id('gestureColumn')
          .gestureModifier(this.modifier)
          .width(200)
          .height(200)
          .backgroundColor(Color.Blue)
      }
      .width('100%')
    }
    .height('100%')
  }
}