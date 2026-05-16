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
  BarState,
  LazyForEach,
  Alignment
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { GridDataSource } from './GridDataSource';

@Entry
@Component
struct GridExample {
  numbers: GridDataSource = new GridDataSource([]);
  @State maxCount_: Int | undefined = 4
  @State isChange: boolean = false;
  @State scrollBar_: BarState | undefined = BarState.Auto;
  @State scrollBarColor_: Color | undefined = Color.Blue;
  @State scrollBarWidth_: number | undefined = 20;

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
              Text(day).fontSize(16)
            }.width(40).height(80).borderWidth(2).borderColor(Color.Red)
          }, (day: string) => day)
        }
        .maxCount(this.maxCount_)
        .id('TestGridMaxCount')

        Button('Change').onClick(() => {
          this.maxCount_ = undefined;
        })
          .id('changeButton')
      }
      .width('90%')
      .align(Alignment.Center)
    }
  }
}
