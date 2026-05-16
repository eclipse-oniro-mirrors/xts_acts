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
  CommonMethod,
  AttributeModifier,
  GridItemAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MyPointModifier implements AttributeModifier<GridItemAttribute> {
  public message: string = 'Hello World';
  public isColumnEnd: boolean = true
  public isRowEnd: boolean = true;
  public isRowStart: boolean = true;
  public isColumnStart: boolean = true;
  public isSelected: boolean = true;
  public isSelectable: boolean = true;
  public isOnSelect: boolean = true;

  applyNormalAttribute(instance: GridItemAttribute): void {
    instance
      .rowStart(this.isRowStart ? 1 : undefined)
      .rowEnd(this.isRowEnd ? 2 : undefined)
      .columnStart(this.isColumnStart ? 1 : undefined)
      .columnEnd(this.isColumnEnd ? 2 : undefined)
      .selected(this.isSelected ? true : undefined)
      .selectable(this.isSelectable ? false : undefined)
      .onSelect(this.isOnSelect ? (isSelected: boolean) => {
        this.message = 'onSelect'
      } : undefined)
  }
}

@Entry
@Component
struct GridItemEventPage {
  @State numbers: string[] = ['0', '1', '2', '3', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15'];
  @State modifier: MyPointModifier = new MyPointModifier()

  build() {
    Scroll() {
      Column() {
        Text(this.modifier.message)
          .id('GridItemM_text')
        Grid() {
          GridItem() {
            Text('4')
              .fontSize(16)
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
          }
          .id('GridItemM')
          .attributeModifier(this.modifier)

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
          .id('GridItemM_resetText')
          .onClick((e: ClickEvent) => {
            this.modifier.message = 'Hello World';
          })
        Button('isRowEnd: ' + this.modifier.isRowEnd)
          .id('GridItemM_rowEnd')
          .onClick((e: ClickEvent) => {
            this.modifier.isRowEnd = !this.modifier.isRowEnd
          })
        Button('isRowStart: ' + this.modifier.isRowStart)
          .id('GridItemM_rowStart')
          .onClick((e: ClickEvent) => {
            this.modifier.isRowStart = !this.modifier.isRowStart
          })
        Button('isColumnStart: ' + this.modifier.isColumnStart)
          .id('GridItemM_columnStart')
          .onClick((e: ClickEvent) => {
            this.modifier.isColumnStart = !this.modifier.isColumnStart
          })
        Button('isColumnEnd: ' + this.modifier.isColumnEnd)
          .id('GridItemM_columnEnd')
          .onClick((e: ClickEvent) => {
            this.modifier.isColumnEnd = !this.modifier.isColumnEnd
          })
        Button('isSelected: ' + this.modifier.isSelected)
          .id('GridItemM_selected')
          .onClick((e: ClickEvent) => {
            this.modifier.isSelected = !this.modifier.isSelected
          })
        Button('isSelectable: ' + this.modifier.isSelectable)
          .id('GridItemM_selectable')
          .onClick((e: ClickEvent) => {
            this.modifier.isSelectable = !this.modifier.isSelectable
          })
        Button('isOnSelect: ' + this.modifier.isOnSelect)
          .id('GridItemM_onSelect')
          .onClick((e: ClickEvent) => {
            this.modifier.isOnSelect = !this.modifier.isOnSelect
          })
      }

    }
    .width('100%').height('100%')
  }
}