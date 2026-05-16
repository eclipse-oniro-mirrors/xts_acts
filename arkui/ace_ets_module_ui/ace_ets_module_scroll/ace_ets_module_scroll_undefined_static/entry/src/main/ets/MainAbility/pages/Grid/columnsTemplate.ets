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

  @State columnsTemplate_:string | undefined = '1fr 1fr';


  build() {
    Scroll(){
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
        .columnsTemplate(this.columnsTemplate_)
        .rowsTemplate('1fr 1fr')
        .id('TestGrid2')

        Button('Change').onClick(() => {
          this.columnsTemplate_ = undefined;
        })
          .id('changeButton')

      }.width('100%')
    }
  }
}