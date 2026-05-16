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
struct CombinedTest {
  @State text: string = '文本';
  @State barMode: BarMode = BarMode.Fixed;
  @State nestedScrollList: string = 'TabsNestedScrollMode.SELF_ONLY'
  @State nestedScroll: (TabsNestedScrollMode | undefined | null)[] =
    [TabsNestedScrollMode.SELF_ONLY, TabsNestedScrollMode.SELF_FIRST, 0, 1, 10, -5, undefined, null]
  @State nestedScrollIndex: number = 0

  build() {
    Column() {
      Row() {
        Button('0')
          .key('CombinedIndex00')
          .onClick(() => {
            this.nestedScrollList = 'TabsNestedScrollMode.SELF_ONLY'
            this.nestedScrollIndex = 0
          })
        Button('1')
          .key('CombinedIndex01')
          .onClick(() => {
            this.nestedScrollList = 'TabsNestedScrollMode.SELF_FIRST'
            this.nestedScrollIndex = 1
          })
        Button('2')
          .key('CombinedIndex02')
          .onClick(() => {
            this.nestedScrollList = '0'
            this.nestedScrollIndex = 2
          })
        Button('3')
          .key('CombinedIndex03')
          .onClick(() => {
            this.nestedScrollList = '1'
            this.nestedScrollIndex = 3
          })
      }
      Row() {
        Button('4')
          .key('CombinedIndex04')
          .onClick(() => {
            this.nestedScrollList = '10'
            this.nestedScrollIndex = 4
          })
        Button('5')
          .key('CombinedIndex05')
          .onClick(() => {
            this.nestedScrollList = '-5'
            this.nestedScrollIndex = 5
          })
        Button('6')
          .key('CombinedIndex06')
          .onClick(() => {
            this.nestedScrollList = 'undefined'
            this.nestedScrollIndex = 6
          })
        Button('7')
          .key('CombinedIndex07')
          .onClick(() => {
            this.nestedScrollList = 'null'
            this.nestedScrollIndex = 7
          })
      }
      List() {
        ListItem() {
            Tabs() {
              TabContent() {
                Column() {
                  Text('nestedScroll:' + this.nestedScrollList).key('Combinedtext01')
                }
                .width('100%').height('100%').backgroundColor(Color.Blue)
              }.tabBar(SubTabBarStyle.of('子页a')).key('Combined')
            }
            .nestedScroll(this.nestedScroll[this.nestedScrollIndex])
          }

          ListItem() {
            Tabs() {
              TabContent() {
                Column() {
                  Text('nestedScroll:' + this.nestedScrollList).key('Combinedtext02')
                }
                .width('100%').height('100%').backgroundColor(Color.Pink)
              }.tabBar(SubTabBarStyle.of('子页b'))

            }
            .nestedScroll(this.nestedScroll[this.nestedScrollIndex])
          }

      }.listDirection(Axis.Horizontal)
      .height('100%')
      .backgroundColor(0xf1f3f5)
    }
    .width('50%')
    .height('50%')
  }

}