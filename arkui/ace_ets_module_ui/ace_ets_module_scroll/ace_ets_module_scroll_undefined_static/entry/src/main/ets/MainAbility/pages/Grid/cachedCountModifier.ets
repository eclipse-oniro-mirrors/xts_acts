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
  @Track public cachedCount_: Int | undefined = 50
  @Track public change: boolean | undefined = true;

  applyNormalAttribute(instance: GridAttribute): void {
    // 情况 1、2、4 都调用 enabled，区别在于 controlValue 可能是 false、true 或 undefined
    if (this.change) {
      instance
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .cachedCount(this.cachedCount_)
    } else {
      instance
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .cachedCount(undefined)
    }
  }
}


@Entry
@Component
struct GridExample {
  numbers: GridDataSource = new GridDataSource([]);
  @State isChange: Boolean = false;
  @State modifier4: MyEnableModifier = new MyEnableModifier()

  aboutToAppear() {
    let list: string[] = [];
    for (let i = 0; i < 100; i++) {
      for (let j = 0; j < 5; j++) {
        list.push(j.toString());
      }
    }
    this.numbers = new GridDataSource(list);

    this.modifier4.change = true
  }

  build() {
    Scroll() {
      Column() {
        Grid() {
          LazyForEach(this.numbers, (day: string) => {
            GridItem() {
              Text(day)
                .fontSize(16)
                .width(80)
                .height(80)
                .textAlign(TextAlign.Center)
            }
          }, (day: string) => day)
        }
        .height('60%')
        .attributeModifier(this.modifier4)
        .id('cachedCountModifier')

        Button('Change').onClick(() => {
          this.modifier4.cachedCount_ = this.modifier4.cachedCount_ === undefined ? 50 : undefined
        }).id('changeButton')
      }.width('100%')
    }
  }
}
