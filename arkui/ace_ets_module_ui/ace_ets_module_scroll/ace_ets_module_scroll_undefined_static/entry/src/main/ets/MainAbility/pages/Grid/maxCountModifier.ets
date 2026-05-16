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
  @Track public maxCount_: Int | undefined = 4
  @Track public change: boolean | undefined = true;

  applyNormalAttribute(instance: GridAttribute): void {
    // 情况 1、2、4 都调用 enabled，区别在于 controlValue 可能是 false、true 或 undefined
    if (this.change) {
      instance
        .maxCount(this.maxCount_)
    } else {
      instance
        .maxCount(undefined)
    }
  }
}

@Entry
@Component
struct GridExample {
  numbers: GridDataSource = new GridDataSource([]);
  @State isChange: boolean = false;
  @State modifier4: MyEnableModifier = new MyEnableModifier()

  aboutToAppear() {
    let list: string[] = [];
    for (let i = 1; i <= 30; i++) {
      list.push(i + '');
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
              Text(day).fontSize(16)
            }.width(40).height(80).borderWidth(2).borderColor(Color.Red)
          }, (day: string) => day)
        }
        .attributeModifier(this.modifier4)
        .id('maxCountModifier')

        Button('Change').onClick(() => {
          this.modifier4.maxCount_ = this.modifier4.maxCount_ === undefined ? 4 : undefined
        })
          .id('changeButton')

      }
      .width('90%')
      .align(Alignment.Center)
    }
  }
}
