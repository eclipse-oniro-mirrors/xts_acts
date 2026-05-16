/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct ColumnMatchParentNewSecond {
  build() {
    Column(){
      Column({ space: 5}) {
        Column()
          .width(50)
          .height(50)
          .backgroundColor(Color.Red)
        Column({ space: 5 }) {
          Column()
            .width(100)
            .height(50)
        }
        .width(LayoutPolicy.wrapContent)
        .height(LayoutPolicy.matchParent)
        .backgroundColor(Color.Red)

        Column({ space: 5 }) {
          Column()
            .width(70)
            .height(30)
        }
        .width(LayoutPolicy.wrapContent)
        .height(LayoutPolicy.wrapContent)
        .backgroundColor(Color.Red)
      }
      .id('ColumnParentMatchParentSecond')
      .alignItems(HorizontalAlign.Start)
      .width(LayoutPolicy.wrapContent)
      .height(LayoutPolicy.wrapContent)
      .backgroundColor(Color.Yellow)
      .padding(5)
    }.width('100%').height('100%')
  }
}