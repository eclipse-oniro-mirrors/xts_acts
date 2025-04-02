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
struct Navigation_L0_4 {
  @State text:string = '';
  @State titleMode:NavigationTitleMode = NavigationTitleMode.Free;
  @State arr:number[] = [1,2,3,4,5,6,7,8,9,10,11,12];

  build() {
    Navigation() {
      Text(this.text).id('Navigation_L0_4_text1')

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
          }.border({width:1})
        }, (item: number) => item.toString())
      }
      .id('Navigation_L0_4_list')
      .height(400)
      .width('100%')
      .margin({ top: 12, left: '10%' })

    }
    .onTitleModeChange((titleMode:NavigationTitleMode) => {
      this.text = 'onTitleModeChange'
    })
    .titleMode(this.titleMode)
    .height('100%')
    .width('100%')
    .title({main:'aaaaaaaaaaaaaaaaaaaaaaaa',sub:'bbbbbbbbbbbbbbbbbbbbbbbbb'})
  }
}

