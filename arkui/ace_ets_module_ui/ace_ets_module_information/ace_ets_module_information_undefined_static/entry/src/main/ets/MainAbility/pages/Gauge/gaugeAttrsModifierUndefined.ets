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
  GaugeShadowOptions,
  AttributeModifier,
  GaugeAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyModifier implements AttributeModifier<GaugeAttribute> {
  public isStartAngle: boolean = true;
  public isEndAngle: boolean = true;
  public isColors: boolean = true;
  public isStrokeWidth: boolean = true;
  public isTrackShadow: boolean = true;
  public isPrivacySensitive: boolean = true;
  public isValue: boolean = true;

  applyNormalAttribute(instance: GaugeAttribute): void {
    instance
      .startAngle(this.isStartAngle ? 210.0 : undefined)
      .endAngle(this.isEndAngle ? 150.0 : undefined)
      .colors(this.isColors ? Color.Red : undefined)
      .strokeWidth(this.isStrokeWidth ? 18.0 : undefined)
      .trackShadow(this.isTrackShadow ? { radius: 7, offsetX: 15, offsetY: 15 } as GaugeShadowOptions : undefined)
      .privacySensitive(this.isPrivacySensitive ? true : undefined)
      .value(this.isValue ? 80.0 : undefined)
  }
}

@Entry
@Component
struct GaugeEventPage {
  @State myModifier: MyModifier = new MyModifier();

  build() {
    Column() {
      Gauge({ value: 50, min: 1, max: 100 })
      // .indicator({ space: 10, icon: $r('app.media.indicator') } as GaugeIndicatorOptions)
        .width(150)
        .height(150)
        .padding(18)
        .id('MyGaugeAttrsModifier')
        .attributeModifier(this.myModifier)
      Blank().height(5)
      Column({ space: 5 } as ColumnOptions) {
        Button('isStartAngle: ' + this.myModifier.isStartAngle)
          .id('Gauge_StartAngle')
          .onClick((e: ClickEvent) => {
            this.myModifier.isStartAngle = !this.myModifier.isStartAngle
          })
          .height(20)
        Button('isEndAngle: ' + this.myModifier.isEndAngle)
          .id('Gauge_EndAngle')
          .onClick((e: ClickEvent) => {
            this.myModifier.isEndAngle = !this.myModifier.isEndAngle
          })
          .height(20)
        Button('isColors: ' + this.myModifier.isColors)
          .id('Gauge_Colors')
          .onClick((e: ClickEvent) => {
            this.myModifier.isColors = !this.myModifier.isColors
          })
          .height(20)
        Button('isStrokeWidth: ' + this.myModifier.isStrokeWidth)
          .id('Gauge_StrokeWidth')
          .onClick((e: ClickEvent) => {
            this.myModifier.isStrokeWidth = !this.myModifier.isStrokeWidth
          })
          .height(20)
        Button('isPrivacySensitive: ' + this.myModifier.isPrivacySensitive)
          .id('Gauge_PrivacySensitive')
          .onClick((e: ClickEvent) => {
            this.myModifier.isPrivacySensitive = !this.myModifier.isPrivacySensitive
          })
          .height(20)
        Button('isTrackShadow: ' + this.myModifier.isTrackShadow)
          .id('Gauge_TrackShadow')
          .onClick((e: ClickEvent) => {
            this.myModifier.isTrackShadow = !this.myModifier.isTrackShadow
          })
          .height(20)
        Button('isValue: ' + this.myModifier.isValue)
          .id('Gauge_Value')
          .onClick((e: ClickEvent) => {
            this.myModifier.isValue = !this.myModifier.isValue
          })
          .height(20)
      }
    }
    .width('100%').height('100%')
  }
}
