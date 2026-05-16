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
  LazyForEach
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

import { GridDataSource } from './GridDataSource';


@Entry
@Component
struct GridExample {
  numbers: GridDataSource = new GridDataSource([]);
  @State cachedCount_: Int | undefined = 50

  aboutToAppear() {
    let list: string[] = [];
    for (let i = 0; i < 100; i++) {
      for (let j = 0; j < 5; j++) {
        list.push(j.toString());
      }
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
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .cachedCount(this.cachedCount_)
        .height(300)
        .id('TestGridCachedCount')

        Button('Change').onClick(() => {
          this.cachedCount_ = undefined;
        })
          .id('changeButton')
      }.width('100%')
    }
  }
}
