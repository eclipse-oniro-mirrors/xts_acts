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
struct getcomponentadd {
  private scroller: Scroller = new Scroller();
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  @State Number: String[] = ['0', '1', '2', '3', '4'];
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {

        Button() {
          Text('next page')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .key('ArkUX_Get_component_add_0010')
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .width('35%')
        .height('5%')

        Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
          .select(true)
          .selectedColor(0xed6f21)
          .position({ x: 100, y: 100 })
          .key('ArkUX_Get_component_add_0020')

        Image($r('app.media.icon'))
          .width(110)
          .height(110)
          .border({ width: 1 })
          .borderStyle(BorderStyle.Dashed)
          .overlay('png', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
          .position({ x: 200, y: 200 })
          .key('ArkUX_Get_component_add_0030')

        Text('Radio1')
        Radio({ value: 'Radio1', group: 'radioGroup' })
          .checked(true)
          .height(50)
          .width(50)
          .position({ x: 300, y: 300 })
          .key('ArkUX_Get_component_add_0040')

        Scroll(this.scroller) {
          Flex({ direction: FlexDirection.Column }) {
            ForEach(this.arr, (item: string) => {
              Row() {
                Text(item.toString())
                  .width('80%')
                  .height(60)
                  .backgroundColor('#3366CC')
                  .borderRadius(15)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .margin({ top: 5 })
              }
            }, (item: string) => item)
          }.margin({ right: 15 })
        }
        .width('90%')
        .scrollBar(BarState.Off)
        .scrollable(ScrollDirection.Vertical)

        ScrollBar({ scroller: this.scroller, direction: ScrollBarDirection.Vertical, state: BarState.Auto }) {
          Text()
            .width(20)
            .height(100)
            .borderRadius(10)
            .backgroundColor('#C0C0C0')
        }.width(20).backgroundColor('#ededed')
        .position({ x: 400, y: 400 })
        .key('ArkUX_Get_component_add_0050')

        Select([{ value: 'aaa' }, { value: 'bbb' }, { value: 'ccc' }])
          .selected(2)
          .value('TTTTT')
          .font({ size: 16, weight: 500 })
          .fontColor('#182431')
          .selectedOptionFont({ size: 16, weight: 400 })
          .optionFont({ size: 16, weight: 400 })
          .position({ x: 500, y: 500 })
          .key('ArkUX_Get_component_add_0060')

        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .position({ x: 600, y: 600 })
          .key('ArkUX_Get_component_add_0070')

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
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
        .columnsGap(10)
        .rowsGap(10)
        .width('90%')
        .backgroundColor(0xFAEEE0)
        .height(300)
        .position({ x: 700, y: 700 })
        .key('ArkUX_Get_component_add_0080')


        List({ space: 20, initialIndex: 0 }) {
          ForEach(this.arr, (item: string) => {
            ListItem() {
              Text('' + item)
                .width('100%')
                .height(100)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .borderRadius(10)
                .backgroundColor(0xFFFFFF)
            }
          }, (item: string) => item)
        }
        .position({ x: 800, y: 800 })
        .key('ArkUX_Get_component_add_0090')
        .listDirection(Axis.Vertical)
        .divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 20, endMargin: 20 })
        .edgeEffect(EdgeEffect.Spring)
        .onScrollIndex((firstIndex: number, lastIndex: number) => {
          console.info('first' + firstIndex)
          console.info('last' + lastIndex)
        })
        .width('90%')

        TextInput({ placeholder: 'input your password...' })
          .width(400)
          .height(40)
          .margin(20)
          .type(InputType.Password)
          .maxLength(9)
          .showPasswordIcon(true)
          .position({ x: 900, y: 900 })
          .key('ArkUX_Get_component_add_0100')

        Button() {
          Text('next page')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }.type(ButtonType.Capsule)
        .key('ArkUX_Get_component_add_0110')
      }.width('100%')
    }.height('100%')
  }
}