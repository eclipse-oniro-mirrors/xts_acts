/*
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
struct noBarriersGroup {
  @State Number: String[] = ['0', '1'];
  scroller: Scroller = new Scroller();
  @State arr: string[] = ["0", "1"];
  @State alignListItem: ListItemAlign = ListItemAlign.Start;
  @State arr1: string[] = ["0", "1"];
  @State alignListItem1: ListItemAlign = ListItemAlign.Start;

  build() {
    Scroll(this.scroller) {
      Column() {

        Column() {
          Text('CASE1').fontSize(40).fontColor(0xCCCCCC)
          Button("click me")
            .onClick((event: ClickEvent) => {
            })
            .width(100)
            .height(50)
            .margin(10)
            .accessibilityText("I am Button")
          Grid() {
            ForEach(this.Number, (day: string) => {
              ForEach(this.Number, (day: string) => {
                GridItem() {
                  Text(day)
                    .fontSize(16)
                    .backgroundColor(0xF9CF93)
                    .width('100%')
                    .height('100%')
                    .textAlign(TextAlign.Center)
                }
              }, (day: string) => day)
            }, (day: string) => day)
          }
          .columnsTemplate('1fr 1fr ')
          .rowsTemplate('1fr')
          .columnsGap(10)
          .rowsGap(10)
          .width('90%')
          .backgroundColor(0xFAEEE0)
          .margin(20)
          .height(300)
          .accessibilityGroup(true)
          .accessibilityLevel("yes")
          .accessibilityText("I am Grid")

          List({ space: 20, initialIndex: 0 }) {
            ForEach(this.arr, (item: string) => {
              ListItem() {
                Text('list' + item)
                  .width("100%")
                  .height(40)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xFFFFFF)
              }
              .border({ width: 2, color: Color.Green })
            }, (item: string) => item)
          }
          .height(100)
          .accessibilityGroup(true)
          .width("90%")
          .editMode(true)
          .lanes({ minLength: 40, maxLength: 40 })
          .alignListItem(this.alignListItem)

        }
        .key("noBarriersGroup1")
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .backgroundColor(0xAFEEEE)
        .margin(10)
        .accessibilityGroup(true)
        .accessibilityLevel("yes")
        .accessibilityText("I am Outermost layer")

        Column() {
          Text('CASE2').fontSize(40).fontColor(0xCCCCCC)
          Button("click me")
            .onClick((event: ClickEvent) => {
            })
            .width(100)
            .height(50)
            .margin(10)
            .accessibilityText("I am Button")
          Grid() {
            ForEach(this.Number, (day: string) => {
              ForEach(this.Number, (day: string) => {
                GridItem() {
                  Text(day)
                    .fontSize(16)
                    .backgroundColor(0xF9CF93)
                    .width('100%')
                    .height('100%')
                    .textAlign(TextAlign.Center)
                }
              }, (day: string) => day)
            }, (day: string) => day)
          }
          .columnsTemplate('1fr 1fr ')
          .rowsTemplate('1fr')
          .columnsGap(10)
          .rowsGap(10)
          .width('90%')
          .backgroundColor(0xFAEEE0)
          .margin(20)
          .height(300)
          .accessibilityGroup(true)
          .accessibilityLevel("yes")
          .accessibilityText("I am Grid")

          List({ space: 20, initialIndex: 0 }) {
            ForEach(this.arr, (item: string) => {
              ListItem() {
                Text('list' + item)
                  .width("100%")
                  .height(40)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xFFFFFF)
              }
              .key("listItem")
              .accessibilityGroup(true)
              .accessibilityLevel("yes")
              .border({ width: 2, color: Color.Green })
            }, (item: string) => item)
          }
          .key("IamList")
          .height(100)
          .accessibilityGroup(true)
          .accessibilityLevel("yes")
          .width("90%")
          .editMode(true)
          .lanes({ minLength: 40, maxLength: 40 })
          .alignListItem(this.alignListItem)
        }
        .key("noBarriersGroup2")
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .backgroundColor(0xAFEEEE)
        .margin(10)
        .accessibilityGroup(true)
        .accessibilityLevel("yes")

        Column() {
          Text('CASE3').fontSize(40).fontColor(0xCCCCCC)
          Button("click me")
            .onClick((event: ClickEvent) => {

            })
            .width(100)
            .height(50)
            .margin(10)
            .accessibilityText("I am Button")

          Grid() {
            ForEach(this.Number, (day: string) => {
              ForEach(this.Number, (day: string) => {
                GridItem() {
                  Text(day)
                    .fontSize(16)
                    .backgroundColor(0xF9CF93)
                    .width('100%')
                    .height('100%')
                    .textAlign(TextAlign.Center)
                }
              }, (day: string) => day)
            }, (day: string) => day)
          }
          .columnsTemplate('1fr 1fr ')
          .rowsTemplate('1fr')
          .columnsGap(10)
          .rowsGap(10)
          .width('90%')
          .backgroundColor(0xFAEEE0)
          .margin(20)
          .height(300)
          .accessibilityGroup(true)
          .accessibilityLevel("yes")
          .accessibilityText("I am Grid")

          List({ space: 20, initialIndex: 0 }) {
            ForEach(this.arr, (item: string) => {
              ListItem() {
                Text('list' + item)
                  .width("100%")
                  .height(40)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xFFFFFF)
              }
              .border({ width: 2, color: Color.Green })
            }, (item: string) => item)
          }
          .height(100)
          .width("90%")
          .accessibilityGroup(true)
          .editMode(true)
          .lanes({ minLength: 40, maxLength: 40 })
          .alignListItem(this.alignListItem)

        }
        .key("noBarriersGroup3")
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .backgroundColor(0xAFEEEE)
        .margin(10)
        .accessibilityGroup(true)
        .accessibilityLevel("auto")
        .accessibilityText("I am Outermost layer")

        Column() {
          Text('CASE4').fontSize(40).fontColor(0xCCCCCC)
          Button("click me")
            .onClick((event: ClickEvent) => {
            })
            .width(100)
            .height(50)
            .margin(10)
            .accessibilityText("I am Button")

          Grid() {
            ForEach(this.Number, (day: string) => {
              ForEach(this.Number, (day: string) => {
                GridItem() {
                  Text(day)
                    .fontSize(16)
                    .backgroundColor(0xF9CF93)
                    .width('100%')
                    .height('100%')
                    .textAlign(TextAlign.Center)
                }
              }, (day: string) => day)
            }, (day: string) => day)
          }
          .columnsTemplate('1fr 1fr ')
          .rowsTemplate('1fr')
          .columnsGap(10)
          .rowsGap(10)
          .width('90%')
          .backgroundColor(0xFAEEE0)
          .margin(20)
          .height(300)
          .accessibilityGroup(true)
          .accessibilityLevel("yes")
          .accessibilityText("I am Grid")

          List({ space: 20, initialIndex: 0 }) {
            ForEach(this.arr, (item: string) => {
              ListItem() {
                Text('list' + item)
                  .width("100%")
                  .height(40)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xFFFFFF)
              }
              .border({ width: 2, color: Color.Green })
            }, (item: string) => item)
          }
          .height(100)
          .width("90%")
          .accessibilityGroup(true)
          .editMode(true)
          .lanes({ minLength: 40, maxLength: 40 })
          .alignListItem(this.alignListItem)

        }
        .key("noBarriersGroup4")
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .backgroundColor(0xAFEEEE)
        .margin(10)
        .accessibilityGroup(true)
        .accessibilityLevel("auto")

        Column() {
          Text('CASE5').fontSize(40).fontColor(0xCCCCCC)
          Button("click me")
            .onClick((event: ClickEvent) => {

            })
            .width(100)
            .height(50)
            .margin(10)
            .accessibilityText("I am Button")

          Grid() {
            ForEach(this.Number, (day: string) => {
              ForEach(this.Number, (day: string) => {
                GridItem() {
                  Text(day)
                    .fontSize(16)
                    .backgroundColor(0xF9CF93)
                    .width('100%')
                    .height('100%')
                    .textAlign(TextAlign.Center)
                }
              }, (day: string) => day)
            }, (day: string) => day)
          }
          .columnsTemplate('1fr 1fr ')
          .rowsTemplate('1fr')
          .columnsGap(10)
          .rowsGap(10)
          .width('90%')
          .backgroundColor(0xFAEEE0)
          .margin(20)
          .height(300)
          .accessibilityGroup(true)
          .accessibilityLevel("yes")
          .accessibilityText("I am Grid")

          List({ space: 20, initialIndex: 0 }) {
            ForEach(this.arr, (item: string) => {
              ListItem() {
                Text('list' + item)
                  .width("100%")
                  .height(40)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xFFFFFF)
              }
              .border({ width: 2, color: Color.Green })
            }, (item: string) => item)
          }
          .height(100)
          .width("90%")
          .accessibilityGroup(true)
          .editMode(true)
          .lanes({ minLength: 40, maxLength: 40 })
          .alignListItem(this.alignListItem)

        }
        .key("noBarriersGroup5")
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .backgroundColor(0xAFEEEE)
        .margin(10)
        .accessibilityGroup(true)
        .accessibilityLevel("no")
        .accessibilityText("I am Outermost layer")

        Column() {
          Text('CASE6').fontSize(40).fontColor(0xCCCCCC)
          Button("click me")
            .onClick((event: ClickEvent) => {

            })
            .width(100)
            .height(50)
            .margin(10)
            .accessibilityText("I am Button")

          Grid() {
            ForEach(this.Number, (day: string) => {
              ForEach(this.Number, (day: string) => {
                GridItem() {
                  Text(day)
                    .fontSize(16)
                    .backgroundColor(0xF9CF93)
                    .width('100%')
                    .height('100%')
                    .textAlign(TextAlign.Center)
                }
              }, (day: string) => day)
            }, (day: string) => day)
          }
          .columnsTemplate('1fr 1fr ')
          .rowsTemplate('1fr')
          .columnsGap(10)
          .rowsGap(10)
          .width('90%')
          .backgroundColor(0xFAEEE0)
          .margin(20)
          .height(300)
          .accessibilityGroup(true)
          .accessibilityLevel("yes")
          .accessibilityText("I am Grid")

          List({ space: 20, initialIndex: 0 }) {
            ForEach(this.arr, (item: string) => {
              ListItem() {
                Text('list' + item)
                  .width("100%")
                  .height(40)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xFFFFFF)
              }
              .border({ width: 2, color: Color.Green })
            }, (item: string) => item)
          }
          .height(100)
          .width("90%")
          .accessibilityGroup(true)
          .editMode(true)
          .lanes({ minLength: 40, maxLength: 40 })
          .alignListItem(this.alignListItem)

        }
        .key("noBarriersGroup6")
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .backgroundColor(0xAFEEEE)
        .margin(10)
        .accessibilityGroup(true)
        .accessibilityLevel("no")

        Column() {
          Text('CASE7').fontSize(40).fontColor(0xCCCCCC)
          Button("click me")
            .onClick((event: ClickEvent) => {

            })
            .width(100)
            .height(50)
            .margin(10)
            .accessibilityText("I am Button")

          Grid() {
            ForEach(this.Number, (day: string) => {
              ForEach(this.Number, (day: string) => {
                GridItem() {
                  Text(day)
                    .fontSize(16)
                    .backgroundColor(0xF9CF93)
                    .width('100%')
                    .height('100%')
                    .textAlign(TextAlign.Center)
                }
              }, (day: string) => day)
            }, (day: string) => day)
          }
          .columnsTemplate('1fr 1fr ')
          .rowsTemplate('1fr')
          .columnsGap(10)
          .rowsGap(10)
          .width('90%')
          .backgroundColor(0xFAEEE0)
          .margin(20)
          .height(300)
          .accessibilityGroup(true)
          .accessibilityLevel("yes")
          .accessibilityText("I am Grid")

          List({ space: 20, initialIndex: 0 }) {
            ForEach(this.arr, (item: string) => {
              ListItem() {
                Text('list' + item)
                  .width("100%")
                  .height(40)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xFFFFFF)
              }
              .border({ width: 2, color: Color.Green })
            }, (item: string) => item)
          }
          .height(100)
          .width("90%")
          .accessibilityGroup(true)
          .editMode(true)
          .lanes({ minLength: 40, maxLength: 40 })
          .alignListItem(this.alignListItem)

        }
        .key("noBarriersGroup7")
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .backgroundColor(0xAFEEEE)
        .margin(10)
        .accessibilityGroup(true)
        .accessibilityLevel("no-hide-descendants")
        .accessibilityText("I am Outermost layer")

        Column() {
          Text('CASE8').fontSize(40).fontColor(0xCCCCCC)
          Button("click me")
            .onClick((event: ClickEvent) => {

            })
            .width(100)
            .height(50)
            .margin(10)
            .accessibilityText("I am Button")

          Grid() {
            ForEach(this.Number, (day: string) => {
              ForEach(this.Number, (day: string) => {
                GridItem() {
                  Text(day)
                    .fontSize(16)
                    .backgroundColor(0xF9CF93)
                    .width('100%')
                    .height('100%')
                    .textAlign(TextAlign.Center)
                }
              }, (day: string) => day)
            }, (day: string) => day)
          }
          .columnsTemplate('1fr 1fr ')
          .rowsTemplate('1fr')
          .columnsGap(10)
          .rowsGap(10)
          .width('90%')
          .backgroundColor(0xFAEEE0)
          .margin(20)
          .height(300)
          .accessibilityGroup(true)
          .accessibilityLevel("yes")
          .accessibilityText("I am Grid")

          List({ space: 20, initialIndex: 0 }) {
            ForEach(this.arr, (item: string) => {
              ListItem() {
                Text('list' + item)
                  .width("100%")
                  .height(40)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xFFFFFF)
              }
              .border({ width: 2, color: Color.Green })
            }, (item: string) => item)
          }
          .height(100)
          .width("90%")
          .accessibilityGroup(true)
          .editMode(true)
          .lanes({ minLength: 40, maxLength: 40 })
          .alignListItem(this.alignListItem)

        }
        .key("noBarriersGroup8")
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .backgroundColor(0xAFEEEE)
        .margin(10)
        .accessibilityGroup(true)
        .accessibilityLevel("no-hide-descendants")

        Column() {
          Text('CASE9').fontSize(40).fontColor(0xCCCCCC)
          Button("click me")
            .onClick((event: ClickEvent) => {
            })
            .width(100)
            .height(50)
            .margin(10)
            .accessibilityText("I am Button")

          Grid() {
            ForEach(this.Number, (day: string) => {
              ForEach(this.Number, (day: string) => {
                GridItem() {
                  Text(day)
                    .fontSize(16)
                    .backgroundColor(0xF9CF93)
                    .width('100%')
                    .height('100%')
                    .textAlign(TextAlign.Center)
                }
              }, (day: string) => day)
            }, (day: string) => day)
          }
          .columnsTemplate('1fr 1fr ')
          .rowsTemplate('1fr')
          .columnsGap(10)
          .rowsGap(10)
          .width('90%')
          .backgroundColor(0xFAEEE0)
          .margin(20)
          .height(300)
          .accessibilityGroup(true)
          .accessibilityLevel("yes")
          .accessibilityText("I am Grid")

          List({ space: 20, initialIndex: 0 }) {
            ForEach(this.arr, (item: string) => {
              ListItem() {
                Text('list' + item)
                  .width("100%")
                  .height(40)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xFFFFFF)
              }
              .border({ width: 2, color: Color.Green })
            }, (item: string) => item)
          }
          .height(100)
          .width("90%")
          .accessibilityGroup(true)
          .editMode(true)
          .lanes({ minLength: 40, maxLength: 40 })
          .alignListItem(this.alignListItem)

        }
        .key("noBarriersGroup9")
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .backgroundColor(0xAFEEEE)
        .margin(10)
        .accessibilityGroup(false)
        .accessibilityLevel("yes")
        .accessibilityText("I am Outermost layer")

        Column() {
          Text('CASE10').fontSize(40).fontColor(0xCCCCCC)
          Button("click me")
            .onClick((event: ClickEvent) => {
            })
            .width(100)
            .height(50)
            .margin(10)
            .accessibilityText("I am Button")

          Grid() {
            ForEach(this.Number, (day: string) => {
              ForEach(this.Number, (day: string) => {
                GridItem() {
                  Text(day)
                    .fontSize(16)
                    .backgroundColor(0xF9CF93)
                    .width('100%')
                    .height('100%')
                    .textAlign(TextAlign.Center)
                }
              }, (day: string) => day)
            }, (day: string) => day)
          }
          .columnsTemplate('1fr 1fr ')
          .rowsTemplate('1fr')
          .columnsGap(10)
          .rowsGap(10)
          .width('90%')
          .backgroundColor(0xFAEEE0)
          .margin(20)
          .height(300)
          .accessibilityGroup(true)
          .accessibilityLevel("yes")
          .accessibilityText("I am Grid")

          List({ space: 20, initialIndex: 0 }) {
            ForEach(this.arr, (item: string) => {
              ListItem() {
                Text('list' + item)
                  .width("100%")
                  .height(40)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xFFFFFF)
              }
              .border({ width: 2, color: Color.Green })
            }, (item: string) => item)
          }
          .height(100)
          .width("90%")
          .accessibilityGroup(true)
          .editMode(true)
          .lanes({ minLength: 40, maxLength: 40 })
          .alignListItem(this.alignListItem)

        }
        .key("noBarriersGroup10")
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .backgroundColor(0xAFEEEE)
        .margin(10)
        .accessibilityGroup(false)
        .accessibilityLevel("yes")
        .accessibilityText("I am Outermost layer")

        Column() {
          Text('CASE11').fontSize(40).fontColor(0xCCCCCC)
          Button("click me")
            .onClick((event: ClickEvent) => {
            })
            .width(100)
            .height(50)
            .margin(10)
            .accessibilityText("I am Button")

          Grid() {
            ForEach(this.Number, (day: string) => {
              ForEach(this.Number, (day: string) => {
                GridItem() {
                  Text(day)
                    .fontSize(16)
                    .backgroundColor(0xF9CF93)
                    .width('100%')
                    .height('100%')
                    .textAlign(TextAlign.Center)
                }
              }, (day: string) => day)
            }, (day: string) => day)
          }
          .columnsTemplate('1fr 1fr ')
          .rowsTemplate('1fr')
          .columnsGap(10)
          .rowsGap(10)
          .width('90%')
          .backgroundColor(0xFAEEE0)
          .margin(20)
          .height(300)
          .accessibilityGroup(true)
          .accessibilityLevel("yes")
          .accessibilityText("I am Grid")

          List({ space: 20, initialIndex: 0 }) {
            ForEach(this.arr, (item: string) => {
              ListItem() {
                Text('list' + item)
                  .width("100%")
                  .height(40)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xFFFFFF)
              }
              .border({ width: 2, color: Color.Green })
            }, (item: string) => item)
          }
          .height(100)
          .width("90%")
          .accessibilityGroup(true)
          .editMode(true)
          .lanes({ minLength: 40, maxLength: 40 })
          .alignListItem(this.alignListItem)

        }
        .key("noBarriersGroup11")
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .backgroundColor(0xAFEEEE)
        .margin(10)
        .accessibilityGroup(false)
        .accessibilityLevel("auto")
        .accessibilityText("I am Outermost layer")

        Column() {
          Text('CASE12').fontSize(40).fontColor(0xCCCCCC)
          Button("click me")
            .onClick((event: ClickEvent) => {
            })
            .width(100)
            .height(50)
            .margin(10)
            .accessibilityText("I am Button")

          Grid() {
            ForEach(this.Number, (day: string) => {
              ForEach(this.Number, (day: string) => {
                GridItem() {
                  Text(day)
                    .fontSize(16)
                    .backgroundColor(0xF9CF93)
                    .width('100%')
                    .height('100%')
                    .textAlign(TextAlign.Center)
                }
              }, (day: string) => day)
            }, (day: string) => day)
          }
          .columnsTemplate('1fr 1fr ')
          .rowsTemplate('1fr')
          .columnsGap(10)
          .rowsGap(10)
          .width('90%')
          .backgroundColor(0xFAEEE0)
          .margin(20)
          .height(300)
          .accessibilityGroup(true)
          .accessibilityLevel("yes")
          .accessibilityText("I am Grid")

          List({ space: 20, initialIndex: 0 }) {
            ForEach(this.arr, (item: string) => {
              ListItem() {
                Text('list' + item)
                  .width("100%")
                  .height(40)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xFFFFFF)
              }
              .border({ width: 2, color: Color.Green })
            }, (item: string) => item)
          }
          .height(100)
          .width("90%")
          .accessibilityGroup(true)
          .editMode(true)
          .lanes({ minLength: 40, maxLength: 40 })
          .alignListItem(this.alignListItem)

        }
        .key("noBarriersGroup12")
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .backgroundColor(0xAFEEEE)
        .margin(10)
        .accessibilityGroup(false)
        .accessibilityLevel("auto")

      }
    }
  }
}