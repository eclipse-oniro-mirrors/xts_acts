/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Entry
@Component
struct NavigationModeRatio {
  private arr: number[] = [1,2,3]
  build() {
    Column(){
      Navigation() {
        Column() {
          List({space:10}){
            ForEach(this.arr, (item: number) => {
              ListItem() {
                NavRouter(){
                  Text('NavRouter' + item)
                    .width('100%')
                    .height('30%')
                    .backgroundColor('#FFFFFF')
                    .borderRadius(24)
                    .fontSize(16)
                    .fontWeight(1000)
                    .textAlign(TextAlign.Center)
                  NavDestination()
                    .backgroundColor(Color.Orange)
                    .title('nav_title'+ item)
                }
              }
            },(item: number) => item.toString())
          }
          .width('80%')
          .margin({top:12})
        }
      }.id('nav_mode_ratio')
      .mode(NavigationMode.AUTO_WITH_ASPECT_RATIO)
      .width('90%')
      .height('50%')
      .border({width: 1})
      .backgroundColor(Color.Pink)

    }
    .height('100%')
    .width('100%')
  }
}