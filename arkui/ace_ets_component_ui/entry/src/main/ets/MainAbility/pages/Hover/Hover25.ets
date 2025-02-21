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
struct HoverExample25 {
  @State isHoverVal25: string = 'unhover'
  @State color: ResourceColor = Color.Blue

  build() {
    Column({ space: 5 }) {
      Column({ space: 5 }) {
        Text(this.isHoverVal25)
          .key("hover25")
          .fontSize(50)
          .backgroundColor(this.color)
          .position({ x: 0, y: 0 })
          .hoverEffect(HoverEffect.Highlight)
          .onHover((isHover?: boolean) => {
            if(isHover){
              this.isHoverVal25 = 'onhover'
              this.color = Color.Pink
            }
          })
      }
      .hoverEffect(HoverEffect.None)
      .width('100%').height('100%').border({ width: 1 })

    }
  }
}