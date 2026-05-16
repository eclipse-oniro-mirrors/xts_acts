'use static'
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Color,
  TextAlign,
  Builder,
  ForEach,
  Row,
  Grid,
  GridItem,
  Blank,
  Scroll,
  CommonMethod
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct GridItemEventPage {
  @State numbers: string[] = ['0', '1', '2', '3', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15'];
  @State message: string = 'Hello World';
  @State isRowEnd: boolean = true;
  @State isRowStart: boolean = true;
  @State isColumnStart: boolean = true;
  @State isColumnEnd: boolean = true;
  @State isSelected: boolean = true;
  @State isSelectable: boolean = true;
  @State isOnSelect: boolean = true;

  build() {
    Scroll() {
      Column() {
        Text(this.message)
          .id('GridItem_text')
        Grid() {
          GridItem() {
            Text('4')
              .fontSize(16)
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
          }
          .id('GridItem')
          .rowStart(this.isRowStart ? 1 : undefined)
          .rowEnd(this.isRowEnd ? 2 : undefined)
          .columnStart(this.isColumnStart ? 1 : undefined)
          .columnEnd(this.isColumnEnd ? 2 : undefined)
          .selected(this.isSelected? true : undefined)
          .selectable(this.isSelectable ? false : undefined)
          .onSelect(this.isOnSelect ? (isSelected: boolean) => {
            this.message = 'onSelect'
          } : undefined)

          ForEach(this.numbers, (item: string) => {
            GridItem() {
              Text(item)
                .fontSize(16)
                .backgroundColor('#fff18572')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }
          }, (item: string) => item)
        }
        .multiSelectable(true)
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
        .width('90%')
        .height('50%')

        Blank().height('5vp')
        Button('resetText')
          .id('GridItem_resetText')
          .onClick((e: ClickEvent) => {
            this.message = 'Hello World';
          })
        Button('isRowEnd: ' + this.isRowEnd)
          .id('GridItem_rowEnd')
          .onClick((e: ClickEvent) => {
            this.isRowEnd = !this.isRowEnd
          })
        Button('isRowStart: ' + this.isRowStart)
          .id('GridItem_rowStart')
          .onClick((e: ClickEvent) => {
            this.isRowStart = !this.isRowStart
          })
        Button('isColumnStart: ' + this.isColumnStart)
          .id('GridItem_columnStart')
          .onClick((e: ClickEvent) => {
            this.isColumnStart = !this.isColumnStart
          })
        Button('isColumnEnd: ' + this.isColumnEnd)
          .id('GridItem_columnEnd')
          .onClick((e: ClickEvent) => {
            this.isColumnEnd = !this.isColumnEnd
          })
        Button('isSelected: ' + this.isSelected)
          .id('GridItem_selected')
          .onClick((e: ClickEvent) => {
            this.isSelected = !this.isSelected
          })
        Button('isSelectable: ' + this.isSelectable)
          .id('GridItem_selectable')
          .onClick((e: ClickEvent) => {
            this.isSelectable = !this.isSelectable
          })
        Button('isOnSelect: ' + this.isOnSelect)
          .id('GridItem_onSelect')
          .onClick((e: ClickEvent) => {
            this.isOnSelect = !this.isOnSelect
          })
      }

    }
    .width('100%').height('100%')
  }
}