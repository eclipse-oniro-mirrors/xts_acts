'use static'
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  LengthMetrics,
  WaterFlow,
  LazyVGridLayout,
  LazyForEach,
  Color,
  ForEach,
  TextAlign,
  Builder,
  Row,
  FlowItem,
  LazyVGridLayout,
  AttributeModifier,
  LazyVGridLayoutAttribute,
  Blank
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { MyDataSource } from './MyDataSource'

@Entry
@Component
struct LazyVGridLayoutSample1 {
  private arr: MyDataSource<Int> = new MyDataSource<Int>();
  @State numbers: string[] = ['0', '1', '2', '3', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15'];
  @State rowsGapChange: boolean = true;
  @State columnsGapChange: boolean = true;
  @State columnsTemplateChange: boolean = true;

  build() {
    Column() {
      WaterFlow() {
        LazyVGridLayout() {
          LazyForEach(this.arr, (item: int, index: int) => {
            Text('item' + item.toString())
              .height('9%')
              .width('100%')
              .borderRadius(5)
              .backgroundColor(Color.White)
              .textAlign(TextAlign.Center)
          })
        }
        .id('LazyVGridLayout')
        .columnsTemplate(this.columnsTemplateChange ? '1fr 1fr 1fr' : undefined)
        .rowsGap(this.rowsGapChange ? LengthMetrics.vp(10) : undefined)
        .columnsGap(this.columnsGapChange ? LengthMetrics.vp(10) : undefined)
      }.height('55%')

      Blank().height('1%')

      Button('rowsGapChange: ' + this.rowsGapChange)
        .id('LazyVGridLayout_rowsGap')
        .onClick((e: ClickEvent) => {
          this.rowsGapChange = !this.rowsGapChange;
        })
      Button('columnsGapChange: ' + this.columnsGapChange)
        .id('LazyVGridLayout_columnsGap')
        .onClick((e: ClickEvent) => {
          this.columnsGapChange = !this.columnsGapChange;
        })
      Button('columnsTemplateChange: ' + this.columnsTemplateChange)
        .id('LazyVGridLayout_columnsTemplate')
        .onClick((e: ClickEvent) => {
          this.columnsTemplateChange = !this.columnsTemplateChange;
        })
    }
    .backgroundColor('#ffe94646')
    .width('100%')
    .height('100%')
    .backgroundColor('#DCDCDC')
  }

  aboutToAppear(): void {
    for (let i = 0; i < 10; i++) {
      this.arr.pushData(i);
    }
  }
}