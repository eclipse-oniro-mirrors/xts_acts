'use static'

import {
  Entry,
  Text,
  Column,
  ColumnOptions,
  Component,
  Button,
  ClickEvent,
  Color,
  IndicatorComponent,
  DotIndicator,
  Row,
  IndicatorComponentController
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct Index {
  private indicatorController: IndicatorComponentController = new IndicatorComponentController();
  @State initialIndexUndefined: boolean = true;
  @State styleUndefined: boolean = true;
  @State loopUndefined: boolean = true;
  @State countUndefined: boolean = true;
  @State verticalUndefined: boolean = true;
  @State onChangeUndefined: boolean = true;
  @State cnt: int = 0;

  build() {
    Column({ space: 10 } as ColumnOptions) {
      IndicatorComponent(this.indicatorController)
        .id('IndicatorComponent_1')
        .initialIndex(this.initialIndexUndefined ? undefined : 1)
        .style(this.styleUndefined ? undefined :
          new DotIndicator()
            .itemWidth(15)
            .itemHeight(15)
            .selectedItemWidth(15)
            .selectedItemHeight(15)
            .color(Color.Gray)
            .selectedColor(Color.Blue))
        .loop(this.loopUndefined ? undefined : false)
        .count(this.countUndefined ? undefined : 3)
        .vertical(this.verticalUndefined ? undefined : true)
        .onChange(this.onChangeUndefined ? undefined : (index: int) => {
          this.cnt++;
        })
      Row() {
        Text(`next:${this.cnt}`)
          .id('IndicatorComponent_text')
        Button('next')
          .id('IndicatorComponent_next')
          .onClick((e: ClickEvent) => {
            this.indicatorController.showNext()
          })
      }

      Row() {
        Button('btn1 : ' + this.initialIndexUndefined)
          .id('IndicatorComponent_btn1')
          .onClick((e: ClickEvent) => {
            this.initialIndexUndefined = !this.initialIndexUndefined
          })
        Button('btn2 : ' + this.styleUndefined)
          .id('IndicatorComponent_btn2')
          .onClick((e: ClickEvent) => {
            this.styleUndefined = !this.styleUndefined
          })
        Button('btn3 : ' + this.loopUndefined)
          .id('IndicatorComponent_btn3')
          .onClick((e: ClickEvent) => {
            this.loopUndefined = !this.loopUndefined
          })
      }

      Row() {
        Button('btn4 : ' + this.countUndefined)
          .id('IndicatorComponent_btn4')
          .onClick((e: ClickEvent) => {
            this.countUndefined = !this.countUndefined
          })
        Button('btn5 : ' + this.verticalUndefined)
          .id('IndicatorComponent_btn5')
          .onClick((e: ClickEvent) => {
            this.verticalUndefined = !this.verticalUndefined
          })
        Button('btn6 : ' + this.onChangeUndefined)
          .id('IndicatorComponent_btn6')
          .onClick((e: ClickEvent) => {
            this.onChangeUndefined = !this.onChangeUndefined
          })
      }

    }

  }
}