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
  AttributeModifier,
  DataPanelAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyModifier implements AttributeModifier<DataPanelAttribute> {
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
  public color3: ResourceColor = '#00FF00' as ResourceColor
  public color4: ResourceColor = '#20FF0000' as ResourceColor
  public offsetX: number = 15
  public offsetY: number = 15
  public radius: number = 5
  public colorArray: (LinearGradient | ResourceColor)[] = [this.color1, this.color2, this.color3, this.color4]
  public strokeWidth: Dimension = 10.0;
  public isCloseEffect: boolean = true;
  public isStrokeWidth: boolean = true;
  public isTrackBackgroundColor: boolean = true;
  public isTrackShadow: boolean = true;
  public isValueColors: boolean = true;

  applyNormalAttribute(instance: DataPanelAttribute): void {
    instance
      .strokeWidth(this.isStrokeWidth ? this.strokeWidth : undefined)
      .closeEffect(this.isCloseEffect ? true : undefined)
      .valueColors(this.isValueColors ? this.colorArray : undefined)
      .trackBackgroundColor(this.isTrackBackgroundColor ? Color.Green : undefined)
      .trackShadow(this.isTrackShadow ? {
        radius: this.radius,
        offsetX: this.offsetX,
        offsetY: this.offsetY
      } as DataPanelShadowOptions : undefined)
  }
}

@Entry
@Component
struct DataPanelAttrsModifierEventPage {
  public values1: number[] = [20.0, 20.0, 20.0, 20.0]
  @State myModifier: MyModifier = new MyModifier();


  build() {
    Column() {
      DataPanel({ values: this.values1, max: 100, type: DataPanelType.Circle })
        .width(100)
        .height(100)
        .id('MyDataPanelAttrsModifier')
        .attributeModifier(this.myModifier)

      DataPanel({ values: this.values1, max: 100, type: DataPanelType.Circle })
        .width(100)
        .height(100)
        .id('MyDataPanelAttrsModifier1')

      Blank().height(5)
      Column({ space: 5 } as ColumnOptions) {
        Button('isCloseEffect: ' + this.myModifier.isCloseEffect)
          .id('DataPanel_CloseEffect')
          .onClick((e: ClickEvent) => {
            this.myModifier.isCloseEffect = !this.myModifier.isCloseEffect
          })
          .height(20)
        Button('isStrokeWidth: ' + this.myModifier.isStrokeWidth)
          .id('DataPanel_StrokeWidth')
          .onClick((e: ClickEvent) => {
            this.myModifier.isStrokeWidth = !this.myModifier.isStrokeWidth
          })
          .height(20)
        Button('isTrackBackgroundColor: ' + this.myModifier.isTrackBackgroundColor)
          .id('DataPanel_TrackBackgroundColor')
          .onClick((e: ClickEvent) => {
            this.myModifier.isTrackBackgroundColor = !this.myModifier.isTrackBackgroundColor
          })
          .height(20)
        Button('isTrackShadow: ' + this.myModifier.isTrackShadow)
          .id('DataPanel_TrackShadow')
          .onClick((e: ClickEvent) => {
            this.myModifier.isTrackShadow = !this.myModifier.isTrackShadow
          })
          .height(20)
        Button('isValueColors: ' + this.myModifier.isValueColors)
          .id('DataPanel_ValueColors')
          .onClick((e: ClickEvent) => {
            this.myModifier.isValueColors = !this.myModifier.isValueColors
          })
          .height(20)

      }
    }.width('100%')
  }
}