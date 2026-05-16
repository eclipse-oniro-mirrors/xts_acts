'use static'
import {
  Entry,
  Column,
  Component,
  Button,
  Color,
  LinearGradient,
  ResourceColor,
  ColumnOptions,
  ClickEvent,
  Blank,
  Gauge,
  GaugeIndicatorOptions,
  $r,
  GaugeShadowOptions
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct GaugeEventPage {
  @State isStartAngle: boolean = true;
  @State isEndAngle: boolean = true;
  @State isColors: boolean = true;
  @State isStrokeWidth: boolean = true;
  @State isTrackShadow: boolean = true;
  @State isPrivacySensitive: boolean = true;
  @State isValue: boolean = true;
  build() {
    Column() {
      Gauge({ value: 50, min: 1, max: 100 })
        // .indicator({ space: 10, icon: $r('app.media.indicator') } as GaugeIndicatorOptions)
        .startAngle(this.isStartAngle ? 210.0 : undefined)
        .endAngle(this.isEndAngle ? 150.0 : undefined)
        .colors(this.isColors ? Color.Red : undefined)
        .strokeWidth(this.isStrokeWidth ? 18.0 : undefined)
        .trackShadow(this.isTrackShadow ? { radius: 7, offsetX: 15, offsetY: 15 } as GaugeShadowOptions : undefined)
        .privacySensitive(this.isPrivacySensitive ? true : undefined)
        .value(this.isValue ? 80.0 : undefined)
        .width(150)
        .height(150)
        .padding(18)
        .id('MyGauge')
      Blank().height(5)
      Column({ space: 5 } as ColumnOptions) {
        Button('isStartAngle: ' + this.isStartAngle)
          .id('Gauge_StartAngle')
          .onClick((e: ClickEvent) => {
            this.isStartAngle = !this.isStartAngle
          })
          .height(20)
        Button('isEndAngle: ' + this.isEndAngle)
          .id('Gauge_EndAngle')
          .onClick((e: ClickEvent) => {
            this.isEndAngle = !this.isEndAngle
          })
          .height(20)
        Button('isColors: ' + this.isColors)
          .id('Gauge_Colors')
          .onClick((e: ClickEvent) => {
            this.isColors = !this.isColors
          })
          .height(20)
        Button('isStrokeWidth: ' + this.isStrokeWidth)
          .id('Gauge_StrokeWidth')
          .onClick((e: ClickEvent) => {
            this.isStrokeWidth = !this.isStrokeWidth
          })
          .height(20)
        Button('isPrivacySensitive: ' + this.isPrivacySensitive)
          .id('Gauge_PrivacySensitive')
          .onClick((e: ClickEvent) => {
            this.isPrivacySensitive = !this.isPrivacySensitive
          })
          .height(20)
        Button('isTrackShadow: ' + this.isTrackShadow)
          .id('Gauge_TrackShadow')
          .onClick((e: ClickEvent) => {
            this.isTrackShadow = !this.isTrackShadow
          })
          .height(20)
        Button('isValue: ' + this.isValue)
          .id('Gauge_Value')
          .onClick((e: ClickEvent) => {
            this.isValue = !this.isValue
          })
          .height(20)
      }
    }
    .width('100%').height('100%')
  }
}
