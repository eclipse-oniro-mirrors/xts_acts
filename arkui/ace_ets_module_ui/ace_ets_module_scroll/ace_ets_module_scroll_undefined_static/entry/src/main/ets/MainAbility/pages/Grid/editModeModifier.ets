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
  AttributeModifier,
  Scroller
} from '@ohos.arkui.component';
import { State, Observed, Track } from '@ohos.arkui.stateManagement';
import { GridDataSource } from './GridDataSource';

@Observed
export class MyEnableModifier implements AttributeModifier<GridAttribute> {
  // 外部传入控制值，可以是 boolean | undefined
  @Track public editMode_: boolean | undefined = true;
  @Track public change: boolean | undefined = true;

  applyNormalAttribute(instance: GridAttribute): void {
    // 情况 1、2、4 都调用 enabled，区别在于 controlValue 可能是 false、true 或 undefined
    if (this.change) {
      instance
        .editMode(this.editMode_)
    } else {
      instance
        .editMode(undefined)
    }
  }
}

@Entry
@Component
struct Index {
  @State numbers: Array<String> = ['1', '1', '1']
  scroller: Scroller = new Scroller()
  @State text: string = 'drag'
  @State isChange: Boolean = true;
  @State modifier4: MyEnableModifier = new MyEnableModifier()

  //拖拽过程中展示的样式
  @Builder
  pixelMapBuilder() {
    Column() {
      Text(this.text)
        .fontSize(16)
        .width(80)
        .height(80)
        .textAlign(TextAlign.Center)
    }
  }

  aboutToAppear() {
    for (let i = 1; i <= 6; i++) {
      this.numbers.push(i + '')
    }

    this.modifier4.change = true
  }

  build() {
    Scroll() {
      Column() {
        Grid() {
          ForEach(this.numbers, (day: string) => {
            GridItem() {
              Text(day)
                .fontSize(16)
                .width(80)
                .height(80)
                .textAlign(TextAlign.Center)
            }
          })
        }
        .attributeModifier(this.modifier4)
        .columnsTemplate('1fr 1fr 1fr')
        .supportAnimation(true)
        .onItemDragStart((event: ItemDragInfo, itemIndex: Int) => {
          console.log('wty onItemDragStart')
          return () => {
            this.pixelMapBuilder()
          }
        })
        .id('editModeModifier')

        Button('Change').onClick(() => {

          if (this.isChange) {
            this.modifier4.editMode_ = undefined;
          } else {
            this.modifier4.editMode_ = true;
          }

          this.isChange = !this.isChange;
        })
          .id('changeButton')
      }.width('100%')
    }
  }
}
