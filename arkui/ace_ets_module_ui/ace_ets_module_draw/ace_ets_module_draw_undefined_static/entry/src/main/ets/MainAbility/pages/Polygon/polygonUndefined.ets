'use static'
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  Color,
  Builder,
  Row,
  Blank,
  Margin,
  Polygon,
  ShapePoint,
  Resource
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct PolygonExample {
  @State isPoint :Array<ShapePoint> | undefined = [[0, 0], [50, 100], [100, 0]] as Array<ShapePoint>;

  build() {
    Column() {
      Polygon({ width: 100, height: 100 })
        .id('Polygon')
        .points(this.isPoint)
        .fill(Color.Green)
      Blank().height('1%')

      Button('isPoint: '+ this.isPoint)
        .id('Polygon_points')
        .onClick((e: ClickEvent) => {
        if (this.isPoint != undefined) {
          this.isPoint = undefined;
        } else {
          this.isPoint = [[0, 0], [50, 100], [100, 0]] as Array<ShapePoint>;
        }
      })
    }
    .width('100%')
    .margin({ top: 10 } as Margin)
  }
}
