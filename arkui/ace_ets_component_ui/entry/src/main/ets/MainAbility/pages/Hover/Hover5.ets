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
@Entry
@Component
struct HoverExample5 {
  @State isHoverValA5: boolean = false
  @State isHoverValB5: boolean = false

  build() {
    Column({ space: 5 }) {
      Column({ space: 5 }) {

        Column()
          .width('60%').height('100%').backgroundColor(Color.Green)
          .position({ x: 0, y: 0 })
          .hoverEffect(HoverEffect.Highlight)
          .onHover((isHover?: boolean) => {
            console.info('Scale isHover: ' + isHover as string)
            this.isHoverValA5 = isHover as boolean
          })

        Column()
          .width('100%').height('100%').backgroundColor(Color.Gray)
          .position({ x: 150, y: 0 })
          .hoverEffect(HoverEffect.Highlight)
          .onHover((isHover?: boolean) => {
            console.info('Scale isHover: ' + isHover as string)
            this.isHoverValB5 = isHover as boolean
          })
        Text('A' + JSON.stringify(this.isHoverValA5) + 'B' + JSON.stringify(this.isHoverValB5))
          .fontSize(20).margin(15).position({ x: 100, y: 100 }).key('hover5')
      }
      .hoverEffect(HoverEffect.None)
      .width('100%').height('100%').border({ width: 1 })

    }
  }
}