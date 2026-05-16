'use static'
import {
  ForEach,
  Entry,
  Component,
  Scroll,
  GridItem,
  TextAlign,
  Column,
  Grid,
  Text,
  Button,
  Color,
  LazyForEach,
  ItemDragInfo,
  Alignment,
  BarState,
  NestedScrollOptions,
  GridAttribute,
  AttributeModifier
} from '@ohos.arkui.component';
import { State, Observed, Track } from '@ohos.arkui.stateManagement';
import { GridDataSource } from './GridDataSource';

@Observed
export class MyEnableModifier implements AttributeModifier<GridAttribute> {
  // 外部传入控制值，可以是 boolean | undefined
  @Track public columnsTemplate_: string | undefined = '1fr 1fr';
  @Track public change: boolean | undefined = true;

  applyNormalAttribute(instance: GridAttribute): void {
    // 情况 1、2、4 都调用 enabled，区别在于 controlValue 可能是 false、true 或 undefined
    if (this.change) {
      instance
        .height('30%')
        .rowsTemplate('1fr 1fr 1fr 1fr 1fr 1fr')
        .columnsTemplate(this.columnsTemplate_)
    } else {
      instance
        .height('30%')
        .rowsTemplate('1fr 1fr 1fr 1fr 1fr 1fr')
        .columnsTemplate(undefined)
    }
  }
}

//xxx.ets
@Entry
@Component
struct GridExample {
  @State numbers1: string[] = ['0', '1'];
  @State numbers2: string[] = ['0'];
  @State isChange: Boolean = false;
  @State modifier4: MyEnableModifier = new MyEnableModifier()

  aboutToAppear() {
    this.modifier4.change = true
  }

  build() {
    Scroll() {
      Column() {
        Grid() {
          ForEach(this.numbers1, (day: string) => {
            ForEach(this.numbers1, (day: string) => {
              GridItem() {
                Text(day)
                  .fontSize(16)
                  .width('10%')
                  .height('10%')
                  .textAlign(TextAlign.Center)
              }
            }, (day: string) => day)
          }, (day: string) => day)
        }
        .height('60%')
        .attributeModifier(this.modifier4)
        .id('columnsTemplateModifier')

        Button('Change').onClick(() => {
          this.modifier4.columnsTemplate_ = this.modifier4.columnsTemplate_ === undefined ? '1fr 1fr' : undefined
        }).id('changeButton')

      }.width('100%')
    }
  }
}