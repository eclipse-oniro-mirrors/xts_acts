'use static'
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Color,
  TextAlign,
  Row,
  Blank,
  PatternLockController,
  Margin,
  PatternLock,
  ResourceColor,
  Length,
  CircleStyleOptions,
  AttributeModifier,
  PatternLockAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MyPointModifier implements AttributeModifier<PatternLockAttribute> {
  public isSkipUnselectedPoint: boolean = true;
  public isActivateCircleStyle: boolean = true;
  public isAutoReset: boolean = true;
  public isPathStrokeWidth: boolean = true;
  public isPathColor: boolean = true;
  public isActiveColor: boolean = true;
  public isSelectedColor: boolean = true;
  public isRegularColor: boolean = true;
  public isBackgroundColor: boolean = true;
  public isCircleRadius: boolean = true;
  public isSideLength: boolean = true;

  applyNormalAttribute(instance: PatternLockAttribute): void {
    instance
      .skipUnselectedPoint(this.isSkipUnselectedPoint ? true : undefined)
      .autoReset(this.isAutoReset ? false : undefined)
      .pathStrokeWidth(this.isPathStrokeWidth ? '5' : undefined)
      .pathColor(this.isPathColor ? '#ffdd3636' : undefined)
      .activeColor(this.isActiveColor ? '#ff11ee5c' : undefined)
      .selectedColor(this.isSelectedColor ? '#fa41c8ea' : undefined)
      .regularColor(this.isRegularColor ? '#ffd19ce0' : undefined)
      .backgroundColor(this.isBackgroundColor ? '#F5F5F5' : undefined)
      .circleRadius(this.isCircleRadius ? '9px' : undefined)
      .sideLength(this.isSideLength ? '180' : undefined)
      .activateCircleStyle(this.isActivateCircleStyle ? {
        color: '#ffd53eff',
        enableWaveEffect: false
      } as CircleStyleOptions : undefined)
  }
}


@Entry
@Component
struct PatternLockExample {
  private patternLockController: PatternLockController = new PatternLockController();
  @State modifier: MyPointModifier = new MyPointModifier()
  build() {
    Column() {
      PatternLock(this.patternLockController)
        .id('PatternLockM_Test')
        .sideLength('100')

      PatternLock(this.patternLockController)
        .id('PatternLockM')
        .attributeModifier(this.modifier)

      Row() {
        Button('isSkipUnselectedPoint: ' + this.modifier.isSkipUnselectedPoint)
          .id('PatternLockM_skipUnselectedPoint')
          .onClick((e: ClickEvent) => {
            this.modifier.isSkipUnselectedPoint = !this.modifier.isSkipUnselectedPoint
          })
        Button('isActivateCircleStyle: ' + this.modifier.isActivateCircleStyle)
          .id('PatternLockM_activateCircleStyle')
          .onClick((e: ClickEvent) => {
            this.modifier.isActivateCircleStyle = !this.modifier.isActivateCircleStyle
          })
      }

      Row() {
        Button('isAutoReset: ' + this.modifier.isAutoReset)
          .id('PatternLockM_autoReset')
          .onClick((e: ClickEvent) => {
            this.modifier.isAutoReset = !this.modifier.isAutoReset
          })
        Button('isPathStrokeWidth: ' + this.modifier.isPathStrokeWidth)
          .id('PatternLockM_pathStrokeWidth')
          .onClick((e: ClickEvent) => {
            this.modifier.isPathStrokeWidth = !this.modifier.isPathStrokeWidth
          })
      }

      Row() {
        Button('isPathColor: ' + this.modifier.isPathColor)
          .id('PatternLockM_pathColor')
          .onClick((e: ClickEvent) => {
            this.modifier.isPathColor = !this.modifier.isPathColor
          })
        Button('isActiveColor: ' + this.modifier.isActiveColor)
          .id('PatternLockM_activeColor')
          .onClick((e: ClickEvent) => {
            this.modifier.isActiveColor = !this.modifier.isActiveColor
          })
      }

      Row() {
        Button('isSelectedColor: ' + this.modifier.isSelectedColor)
          .id('PatternLockM_selectedColor')
          .onClick((e: ClickEvent) => {
            this.modifier.isSelectedColor = !this.modifier.isSelectedColor
          })
        Button('isRegularColor: ' + this.modifier.isRegularColor)
          .id('PatternLockM_regularColor')
          .onClick((e: ClickEvent) => {
            this.modifier.isRegularColor = !this.modifier.isRegularColor
          })
      }

      Row() {
        Button('isBackgroundColor: ' + this.modifier.isBackgroundColor)
          .id('PatternLockM_backgroundColor')
          .onClick((e: ClickEvent) => {
            this.modifier.isBackgroundColor = !this.modifier.isBackgroundColor
          })
        Button('isCircleRadius: ' + this.modifier.isCircleRadius)
          .id('PatternLockM_circleRadius')
          .onClick((e: ClickEvent) => {
            this.modifier.isCircleRadius = !this.modifier.isCircleRadius
          })
      }

      Row() {
        Button('isSideLength: ' + this.modifier.isSideLength)
          .id('PatternLockM_sideLength')
          .onClick((e: ClickEvent) => {
            this.modifier.isSideLength = !this.modifier.isSideLength
          })
      }
    }.width('100%').height('100%')
  }
}