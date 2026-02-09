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

 
class PinchGestureModifier implements GestureModifier {
  supportDoubleTap: boolean = true
  value: string = 'succ'
  PinchOptions: PinchGestureHandlerOptions = { fingers: 1 }

  applyGesture(event: UIGestureEvent): void {
    if (this.supportDoubleTap) {
      event.addGesture(
        new TapGestureHandler({ count: 1, fingers: 1 })
          .tag("aaa")
          .onAction((event: GestureEvent) => {
            console.log("button " +JSON.stringify(event.repeat))
            return this.value
          })
      )
    } else {
      event.addGesture(
        new PinchGestureHandler(this.PinchOptions)
          .onActionStart(()=>{
            return 'Pinch start'
          })
      )
    }
  }
}

@Entry
@Component
struct PinchGestureHandler1 {
  @State modifier: PinchGestureModifier = new PinchGestureModifier()

  build() {
    Row() {
      Column() {
        Button(this.modifier.value).margin({bottom:20}).id('PinchGestureHandler1')
        Column()
          .id('PinchGestureHandlerColumn')
          .gestureModifier(this.modifier)
          .width(400)
          .height(400)
          .backgroundColor(Color.Blue)
      }
      .width('100%')
    }
    .height('100%')
  }
}