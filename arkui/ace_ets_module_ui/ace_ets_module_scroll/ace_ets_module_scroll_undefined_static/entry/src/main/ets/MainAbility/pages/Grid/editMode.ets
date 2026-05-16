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
  ItemDragInfo
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { GridDataSource } from './GridDataSource';

@Entry
@Component
struct GridExample {
  numbers: GridDataSource = new GridDataSource([]);
  @State isChange: boolean = false;
  @State editMode_: Boolean | undefined = true;
  @State text: string = 'drag'

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
    let list: string[] = [];
    for (let i = 1; i <= 30; i++) {
      list.push(i + '');
    }
    this.numbers = new GridDataSource(list);
  }

  build() {
    Scroll() {
      Column() {
        Grid() {
          LazyForEach(this.numbers, (day: string) => {
            GridItem() {
              Text(day)
                .fontSize(16)
                .width('100%')
                .height(80)
                .textAlign(TextAlign.Center)
            }.selectable(false)
          }, (day: string) => day)
        }
        .id('TestGridEditMode')
        .columnsTemplate('1fr 1fr 1fr')
        .editMode(this.editMode_)
        .supportAnimation(true)
        .height('30%')
        .onItemDragStart((event: ItemDragInfo, itemIndex: Int) => {
          console.log('wty onItemDragStart')
          return () => {
            this.pixelMapBuilder()
          }
        })
        .onItemDragMove((event: ItemDragInfo, itemIndex: Int, insertIndex: Int) => {
          console.log('xxx onItemDragMove') //?
        })
        .onItemDragEnter((event: ItemDragInfo) => {
          console.log('xxx onItemDragEnter') //?
        })

        Button('Change').onClick(() => {
          this.editMode_ = undefined;
        })
          .id('changeButton')
      }.width('100%')
    }
  }
}
