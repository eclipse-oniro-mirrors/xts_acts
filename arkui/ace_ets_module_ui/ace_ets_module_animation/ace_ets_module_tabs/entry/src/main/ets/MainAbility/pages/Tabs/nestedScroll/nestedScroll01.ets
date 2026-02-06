/**
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
struct NestedScroll01 {
  @State text: string = '文本';
  @State barMode: BarMode = BarMode.Fixed;
  @State nestedScrollList01: string =''
  @State nestedScroll: (TabsNestedScrollMode | undefined | null)[] =
    [TabsNestedScrollMode.SELF_ONLY, TabsNestedScrollMode.SELF_FIRST, 0, 1, 10, -5, undefined, null]
  @State nestedScrollIndex: number = 0

  build() {
    Column() {
      Row() {
          Button('Index')
          .key('Index')
          .onClick(() => {
            this.nestedScrollList01 =
              'nestedScroll:' + TabsNestedScrollMode.SELF_ONLY + ',nestedScroll:' + TabsNestedScrollMode.SELF_FIRST +
                ',nestedScroll:' + undefined
          })
      }

      Tabs() {
        TabContent() {
          Tabs() {
            TabContent() {
              Column(){
                Text(this.nestedScrollList01).key('Indextext')
              }
              .width('100%').height('100%').backgroundColor(Color.Blue)
            }.tabBar(SubTabBarStyle.of('子页a'))
          }
          .nestedScroll(this.nestedScroll[this.nestedScrollIndex])
        }.tabBar(SubTabBarStyle.of('首页1'))

        TabContent() {
          Tabs() {
            TabContent() {
              Column()
              .width('100%').height('100%').backgroundColor(Color.Pink)
            }.tabBar(SubTabBarStyle.of('子页b'))

          }
          .nestedScroll(this.nestedScroll[this.nestedScrollIndex])
        }.tabBar(SubTabBarStyle.of('首页2'))

      }
      .height('100%')
      .backgroundColor(0xf1f3f5)
      .barMode(this.barMode)
    }
    .width('50%')
    .height('50%')
  }

}