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
  Color
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct GridExample {
  @State numbers1: string[] = ['0', '1'];
  @State columnsGap_: number | undefined = 20;

  build() {
    Scroll() {
      Column() {
        Grid() {
          ForEach(this.numbers1, (day: string) => {
            ForEach(this.numbers1, (day: string) => {
              GridItem() {
                Text(day)
                  .fontSize(16)
                  .borderColor(Color.Red)
                  .width('30%')
                  .height('30%')
                  .textAlign(TextAlign.Center)
              }
            }, (day: string) => day)
          }, (day: string) => day)
        }
        .width('30%')
        .height('30%')
        .columnsTemplate('1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .columnsGap(this.columnsGap_)
        .id('TestGrid1')

        Button('Change').onClick(() => {
          this.columnsGap_ = undefined;
        })
          .id('changeButton')

      }.width('100%')
    }
  }
}