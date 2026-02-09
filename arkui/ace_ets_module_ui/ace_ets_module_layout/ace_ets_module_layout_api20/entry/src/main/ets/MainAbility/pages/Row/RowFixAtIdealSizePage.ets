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

@Entry
@Component
struct RowFixAtIdealSizePage {
  @State width1: number = 50
  @State height1: number = 50
  build() {
    Column() {
      Button('w=160 h=120').onClick(() => {
        this.width1 = 160
        this.height1 = 120
      }).key('RowFixAtIdealSizePage_Btn').padding({bottom: 10})

      Column() {
        Text('fixAtIdealSize')
        // fixAtIdealSize生效时，当前组件会与其子组件大小相等，可以超过父组件内容大小（100vp * 80vp）
        // 但会受自身constraintSize（150vp * 100vp）约束
        // 因此当width1=160、height1=120时， Row组件大小为150vp * 100vp
        Row() {
          Flex().width(this.width1).height(this.height1)
        }
        .key('RowFixAtIdealSizePage_Row')
        .backgroundColor(Color.Pink)
        .width(LayoutPolicy.fixAtIdealSize)
        .height(LayoutPolicy.fixAtIdealSize)
        .constraintSize({ maxWidth: 150, maxHeight: 100 })
      }.width(100).height(80)
    }.width('100%').height('100%')
  }
}