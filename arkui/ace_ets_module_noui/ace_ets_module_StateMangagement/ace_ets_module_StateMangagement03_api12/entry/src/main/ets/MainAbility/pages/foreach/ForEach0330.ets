/**
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
@ComponentV2
struct ForEach0330 {
  @Local private oneSource: string[] = []
  @Local private twoSource: string[] = []
  private scroller: Scroller = new Scroller()
  private swipeStartIndex: number = -1

  aboutToAppear(): void {
    for (let i = 0; i < 50; i++) {
      this.oneSource.push('OneItem' + i)
      this.twoSource.push('TwoItem' + i)
    }
  }

  build() {
    Column() {
      Column() {
        Row() {
          Button('DelOne0')
            .id('btnDelOne0')
            .width('10%')
            .height('3%')
            .fontSize(9)
            .onClick(() => {
              this.oneSource.splice(0, 1)
            })
          Button('DelTwo49')
            .id('btnDelTwo49')
            .width('10%')
            .height('3%')
            .fontSize(9)
            .onClick(() => {
              this.twoSource.splice(49, 1)
            })
          Button('DelOne9')
            .id('btnDelOne9')
            .width('10%')
            .height('3%')
            .fontSize(9)
            .onClick(() => {
              this.oneSource.splice(9, 1)
            })
        }

        Row() {
          Button('InsertOne0')
            .id('btnInsertOne0')
            .width('10%')
            .height('3%')
            .fontSize(9)
            .onClick(() => {
              this.oneSource.splice(0, 0, 'HelloOne0')
            })
          Button('InsertTwo49')
            .id('btnInsertTwo49')
            .width('10%')
            .height('3%')
            .fontSize(9)
            .onClick(() => {
              this.twoSource.splice(49, 0, 'HelloTwo49')
            })
          Button('InsertOne9')
            .id('btnInsertOne9')
            .width('10%')
            .height('3%')
            .fontSize(9)
            .onClick(() => {
              this.oneSource.splice(9, 0, 'HelloOne9')
            })
        }

        Row() {
          Button('MakeOne0')
            .id('btnMakeOne0')
            .width('10%')
            .height('3%')
            .fontSize(9)
            .onClick(() => {
              this.oneSource[0] = 'HelloWorldOne0'
            })
          Button('MakeTwo49')
            .id('btnMakeTwo49')
            .width('10%')
            .height('3%')
            .fontSize(9)
            .onClick(() => {
              this.twoSource[49] = 'HelloWorldTwo49'
            })
          Button('MakeOne9')
            .id('btnMakeOne9')
            .width('10%')
            .height('3%')
            .fontSize(9)
            .onClick(() => {
              this.oneSource[9] = 'HelloWorldOne9'
            })
        }

        Row() {
          Button('Swipe to Top')
            .id('btnSwipeTop')
            .width('10%')
            .height('3%')
            .fontSize(9)
            .onClick(() => {
              let rect = this.scroller.getItemRect(this.swipeStartIndex) // Get child components size and position
              this.scroller.scrollToIndex(0); // Slide to the specified index
              this.scroller.scrollBy(0, -rect.y); // Slide a specified distance
            })

          Button('Swipe to Bottom')
            .id('btnSwipeBottom')
            .width('10%')
            .height('3%')
            .fontSize(9)
            .onClick(() => {
              let rect = this.scroller.getItemRect(this.swipeStartIndex) // Get child components size and position
              this.scroller.scrollToIndex(this.oneSource.length - 1 + this.twoSource.length -
                1); // Slide to the specified index
              this.scroller.scrollBy(0, -rect.y); // Slide a specified distance
            })
        }
      }

      List({ scroller: this.scroller }) {
        ListItem() {
          Text('Header1')
            .height('3%')
            .fontSize(9)
        }

        ListItem() {
          Text('Header2')
            .height('3%')
            .fontSize(9)
        }

        ForEach(this.oneSource, (item: string) => {
          ListItem() {
            Text(item)
              .height('3%')
              .fontSize(9)
          }
        }, (item: string) => item)
        ForEach(this.twoSource, (item: string) => {
          ListItem() {
            Text(item)
              .height('3%')
              .fontSize(9)
          }
        }, (item: string) => item)
        ListItem() {
          Text('Footer1')
            .height('3%')
            .fontSize(9)
        }

        ListItem() {
          Text('Footer2')
            .height('3%')
            .fontSize(9)
        }
      }
      .layoutWeight(1)
      .onScrollIndex((start: number, end: number) => {
        this.swipeStartIndex = start
      })
    }
  }
}