'use static'
import {
  Entry,
  Column,
  Component,
  Button,
  Color,
  LinearGradient,
  ResourceColor,
  DataPanel,
  DataPanelType,
  Dimension,
  DataPanelShadowOptions,
  ColumnOptions,
  ClickEvent,
  Blank,
  Gauge
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct DataPanelEventPage {
  public values1: number[] = [20.0, 20.0, 20.0, 20.0]
  public color1: LinearGradient =
    new LinearGradient([{ color: '#65EEC9A3', offset: 0 }, { color: '#FFEF629F', offset: 1 }])
  public color2: LinearGradient =
    new LinearGradient([{ color: '#FF67F9D4', offset: 0 }, { color: '#FFFF9554', offset: 1 }])
  public colorShadow1: LinearGradient =
    new LinearGradient([{ color: '#65EEC9A3', offset: 0 }, { color: '#65EF629F', offset: 1 }])
  public colorShadow2: LinearGradient =
    new LinearGradient([{ color: '#65e26709', offset: 0 }, { color: '#65efbd08', offset: 1 }])
  public colorShadow3: LinearGradient =
    new LinearGradient([{ color: '#6572B513', offset: 0 }, { color: '#6508efa6', offset: 1 }])
  public colorShadow4: LinearGradient =
    new LinearGradient([{ color: '#65ed08f5', offset: 0 }, { color: '#65ef0849', offset: 1 }])
  @State color3: ResourceColor = '#00FF00' as ResourceColor
  @State color4: ResourceColor = '#20FF0000' as ResourceColor
  @State offsetX: number = 15
  @State offsetY: number = 15
  @State radius: number = 5
  @State colorArray: (LinearGradient | ResourceColor)[] = [this.color1, this.color2, this.color3, this.color4]
  @State shadowColorArray: LinearGradient[] =
    [this.colorShadow1, this.colorShadow2, this.colorShadow3, this.colorShadow4]
  @State strokeWidth: Dimension = 10.0;
  @State isCloseEffect: boolean = true;
  @State isStrokeWidth: boolean = true;
  @State isTrackBackgroundColor: boolean = true;
  @State isTrackShadow: boolean = true;
  @State isValueColors: boolean = true;

  build() {
    Column() {
      DataPanel({ values: this.values1, max: 100, type: DataPanelType.Circle })
        .width(100)
        .height(100)
        .strokeWidth(this.isStrokeWidth ? this.strokeWidth : undefined)
        .closeEffect(this.isCloseEffect ? true : undefined)
        .valueColors(this.isValueColors ? this.colorArray : undefined)
        .trackBackgroundColor(this.isTrackBackgroundColor ? Color.Green : undefined)
        .trackShadow(this.isTrackShadow ? {
          radius: this.radius,
          offsetX: this.offsetX,
          offsetY: this.offsetY
        } as DataPanelShadowOptions : undefined)
        .id('MyDataPanel')

        DataPanel({ values: this.values1, max: 100, type: DataPanelType.Circle })
        .width(100)
        .height(100)
        .id('MyDataPanel1')

      Blank().height(5)
      Column({ space: 5 } as ColumnOptions) {
        Button('isCloseEffect: ' + this.isCloseEffect)
          .id('DataPanel_CloseEffect')
          .onClick((e: ClickEvent) => {
            this.isCloseEffect = !this.isCloseEffect
          })
          .height(20)
        Button('isStrokeWidth: ' + this.isStrokeWidth)
          .id('DataPanel_StrokeWidth')
          .onClick((e: ClickEvent) => {
            this.isStrokeWidth = !this.isStrokeWidth
          })
          .height(20)
        Button('isTrackBackgroundColor: ' + this.isTrackBackgroundColor)
          .id('DataPanel_TrackBackgroundColor')
          .onClick((e: ClickEvent) => {
            this.isTrackBackgroundColor = !this.isTrackBackgroundColor
          })
          .height(20)
        Button('isTrackShadow: ' + this.isTrackShadow)
          .id('DataPanel_TrackShadow')
          .onClick((e: ClickEvent) => {
            this.isTrackShadow = !this.isTrackShadow
          })
          .height(20)
        Button('isValueColors: ' + this.isValueColors)
          .id('DataPanel_ValueColors')
          .onClick((e: ClickEvent) => {
            this.isValueColors = !this.isValueColors
          })
          .height(20)

      }
    }.width('100%')
  }
}