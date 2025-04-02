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
struct HoverExample232 {
  @State isHoverValA17: boolean = false
  @State isHoverValB17: boolean = false

  build() {
    Column({ space: 5 }) {
      Column({ space: 5 }) {
        Column(){
          Column()
            .width('150%').height('100%').backgroundColor(Color.Gray)
            .position({ x: 150, y: 0 })
            .hoverEffect(HoverEffect.Highlight)
            .onHover((isHover?: boolean, event?: HoverEvent) => {
              console.info('Scale isHover: ' + isHover as string)
              this.isHoverValB17 = isHover as boolean
            })
          Text('B' + JSON.stringify(this.isHoverValB17))
            .fontSize(20).margin(15).position({ x: 100, y: 100 }).key('hoverB23')
        }
          .width('60%').height('100%').backgroundColor(Color.Green)
          .position({ x: 0, y: 0 })
          .hoverEffect(HoverEffect.Highlight)
          .onHover((isHover?: boolean, event?: HoverEvent) => {
            console.info('Scale isHover: ' + isHover as string)
            this.isHoverValA17 = isHover as boolean
          })
        Text('A' + JSON.stringify(this.isHoverValA17))
          .fontSize(20).margin(15).position({ x: 100, y: 100 }).key('hoverA23')
      }
      .hoverEffect(HoverEffect.None)
      .width('100%').height('100%').border({ width: 1 })

    }
  }
}