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
class MyClearModifier implements GestureModifier {
  supportDoubleTap: boolean = true
  value: string = 'clearGesture succ'

  applyGesture(event: UIGestureEvent): string {
    if (this.supportDoubleTap) {
      event.clearGestures()
      return this.value
    } else {
      event.addGesture(
        new PanGestureHandler()
          .onActionStart(()=>{
            console.log("Pan start");
            return 'Pan start'
          })
      )
    }
    return this.value
  }
}

@Entry
@Component
struct ClearGesture1 {
  @State modifier: MyClearModifier = new MyClearModifier()

  build() {
    Row() {
      Column() {
        Button(this.modifier.value).margin({bottom:20}).id('clearGesture_id')
        Column()
          .id('clearGestureColumn')
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