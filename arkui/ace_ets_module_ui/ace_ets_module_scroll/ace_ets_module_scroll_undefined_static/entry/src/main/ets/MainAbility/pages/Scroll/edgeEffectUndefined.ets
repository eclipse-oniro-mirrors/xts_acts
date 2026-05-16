'use static'
import {
  Stack,
  Entry,
  Component,
  Column,
  Row,
  Button,
  ForEach,
  Text,
  TextAlign,
  BarState,
  Scroll,
  Color,
  Margin,
  EdgeEffect,
  EffectEdge,
  EdgeEffectOptions
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ScrollPage {
  @State arr: Int[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @State edgeEffectVal: EdgeEffect | undefined = EdgeEffect.Spring;

  build() {
    Stack() {
      Scroll() {
        Column() {
          ForEach(this.arr, (item: Int) => {
            Stack() {
              Text('item' + item)
                .width('90%')
                .height('20%')
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .focusable(true)
                .focusOnTouch(true)
            }
            .width('80%')
            .padding(20)
            .borderRadius(15)
            .margin({ top: 30, bottom: 30 } as Margin)
          })
        }.width('100%').backgroundColor('rgb(213,213,213)')
      }
      .backgroundColor('rgb(213,213,213)')
      .scrollBar(BarState.On)
      .edgeEffect(this.edgeEffectVal, { alwaysEnabled: false, effectEdge: EdgeEffect.None } as EdgeEffectOptions)
      .id('common_edgeEffect')

      Column() {
        Button('切换 EdgeEffect → ' + (this.edgeEffectVal === undefined ? 'undefined' : 'Spring'))
          .onClick(() => {
            this.edgeEffectVal = this.edgeEffectVal === undefined ? EdgeEffect.Spring : undefined
          }).margin({ top: 5 } as Margin)
          .id('button_edgeEffect')
      }
    }.width('100%').height('100%')
  }
}