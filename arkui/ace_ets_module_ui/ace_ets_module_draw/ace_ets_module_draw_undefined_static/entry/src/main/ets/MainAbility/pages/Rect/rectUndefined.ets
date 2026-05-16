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
  Resource,
  Rect,
  RectOptions
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct RectExample {
  @State isRadiusWidth: boolean = true;
  @State isRadiusHeight: boolean = true;
  @State isRadius: boolean = true;

  build() {
    Column() {
      Rect({ width: '90%', height: 80 } as RectOptions)
        .id('Rect')
        .radiusWidth(this.isRadiusWidth ? '40px' : undefined)
        .radiusHeight(this.isRadiusHeight ? '40px' : undefined)
        .fill(Color.Pink)
      Rect({ width: '90%', height: 80 } as RectOptions)
        .id('Rect2')
        .fill(Color.Pink)
        .radius(this.isRadius ? '40px' : undefined)


      Blank().height(5)
      Button('isRadiusWidth : ' + this.isRadiusWidth)
        .id('Rect_radiusWidth')
        .onClick((e: ClickEvent) => {
        this.isRadiusWidth = !this.isRadiusWidth;
      })
      Button('isRadiusHeight : ' + this.isRadiusHeight)
        .id('Rect_radiusHeight')
        .onClick((e: ClickEvent) => {
        this.isRadiusHeight = !this.isRadiusHeight;
      })
      Button('isRadius : ' + this.isRadius)
        .id('Rect_radius')
        .onClick((e: ClickEvent) => {
        this.isRadius = !this.isRadius;
      })

    }.width('100%')
  }
}
