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
  CircleStyleOptions
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct PatternLockExample {
  private patternLockController: PatternLockController = new PatternLockController();
  @State isSkipUnselectedPoint: boolean = true;
  @State isActivateCircleStyle: boolean = true;
  @State isAutoReset: boolean = true;
  @State isPathStrokeWidth: boolean = true;
  @State isPathColor: boolean = true;
  @State isActiveColor: boolean = true;
  @State isSelectedColor: boolean = true;
  @State isRegularColor: boolean = true;
  @State isBackgroundColor: boolean = true;
  @State isCircleRadius: boolean = true;
  @State isSideLength: boolean = true;

  build() {
    Column() {
      PatternLock(this.patternLockController)
        .id('PatternLock_Test')
        .sideLength('100')
      PatternLock(this.patternLockController)
        .id('PatternLock')
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

      Row() {
        Button('isSkipUnselectedPoint: ' + this.isSkipUnselectedPoint)
          .id('PatternLock_skipUnselectedPoint')
          .onClick((e: ClickEvent) => {
            this.isSkipUnselectedPoint = !this.isSkipUnselectedPoint
          })
        Button('isActivateCircleStyle: ' + this.isActivateCircleStyle)
          .id('PatternLock_activateCircleStyle')
          .onClick((e: ClickEvent) => {
            this.isActivateCircleStyle = !this.isActivateCircleStyle
          })
      }

      Row() {
        Button('isAutoReset: ' + this.isAutoReset)
          .id('PatternLock_autoReset')
          .onClick((e: ClickEvent) => {
            this.isAutoReset = !this.isAutoReset
          })
        Button('isPathStrokeWidth: ' + this.isPathStrokeWidth)
          .id('PatternLock_pathStrokeWidth')
          .onClick((e: ClickEvent) => {
            this.isPathStrokeWidth = !this.isPathStrokeWidth
          })
      }

      Row() {
        Button('isPathColor: ' + this.isPathColor)
          .id('PatternLock_pathColor')
          .onClick((e: ClickEvent) => {
            this.isPathColor = !this.isPathColor
          })
        Button('isActiveColor: ' + this.isActiveColor)
          .id('PatternLock_activeColor')
          .onClick((e: ClickEvent) => {
            this.isActiveColor = !this.isActiveColor
          })
      }

      Row() {
        Button('isSelectedColor: ' + this.isSelectedColor)
          .id('PatternLock_selectedColor')
          .onClick((e: ClickEvent) => {
            this.isSelectedColor = !this.isSelectedColor
          })
        Button('isRegularColor: ' + this.isRegularColor)
          .id('PatternLock_regularColor')
          .onClick((e: ClickEvent) => {
            this.isRegularColor = !this.isRegularColor
          })
      }

      Row() {
        Button('isBackgroundColor: ' + this.isBackgroundColor)
          .id('PatternLock_backgroundColor')
          .onClick((e: ClickEvent) => {
            this.isBackgroundColor = !this.isBackgroundColor
          })
        Button('isCircleRadius: ' + this.isCircleRadius)
          .id('PatternLock_circleRadius')
          .onClick((e: ClickEvent) => {
            this.isCircleRadius = !this.isCircleRadius
          })
      }

      Row() {
        Button('isSideLength: ' + this.isSideLength)
          .id('PatternLock_sideLength')
          .onClick((e: ClickEvent) => {
            this.isSideLength = !this.isSideLength
          })
      }
    }.width('100%').height('100%')
  }
}