/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Entry
@Component
struct NavigationModel04 {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  @State currentIndex: number = 0
  @State strText: string = 'doing'
  @State Sizearr: number[] = [240,360,400,500,600,650, 100]
  @State columnWidthIndex: number = 5
  build() {
    Column() {
      Navigation() {
        Button('button').key('NavigationModel04button')
          .onClick(()=>{
            this.columnWidthIndex = 2
          })
        Text(this.strText).key('NavigationModel04text')

        List({ space: 12, initialIndex: 0 }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Text('' + item)
                .width('90%')
                .height(72)
                .backgroundColor('#FFFFFF')
                .borderRadius(24)
                .fontSize(16)
                .fontWeight(500)
                .textAlign(TextAlign.Center)
            }.editable(true)
          }, (item: number) => item.toString())
        }
        .height(324)
        .width('100%')
        .margin({ top: 12, left: '10%' })
      }
      .width(this.Sizearr[this.columnWidthIndex])
      .onNavigationModeChange(() => {
        this.currentIndex ++
        this.strText =  'doing' + `${ this.currentIndex }`
      })
    }.width(600).height('100%').backgroundColor('#F1F3F5')
  }
}