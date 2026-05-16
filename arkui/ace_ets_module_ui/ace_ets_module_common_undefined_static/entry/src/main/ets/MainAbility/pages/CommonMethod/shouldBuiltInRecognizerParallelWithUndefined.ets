'use static'
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Margin,
  Scroller,
  GestureRecognizer,
  Stack,
  GestureEvent,
  Scroll,
  BarState,
  TextAlign,
  ForEach,
  Color,
  GestureControl,
  BaseGestureEvent,
  GestureJudgeResult
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct FatherControlChild {
  scroller: Scroller = new Scroller();
  scroller2: Scroller = new Scroller();
  @State change: boolean = true;
  @State arr: Int[] = [0, 1, 2, 3];
  private childRecognizer: GestureRecognizer = new GestureRecognizer();
  private currentRecognizer: GestureRecognizer = new GestureRecognizer();
  @State count: Int = 0;

  build() {
      Scroll(this.scroller) {
        Column() {
          Text('Scroll Area')
            .width('92%')
            .height(100)
            .borderRadius(12)
            .fontSize(16)
            .margin({ top: 8 } as Margin)
            .id('commonmethod_shouldBuiltInRecognizerParallelWith1')
          Scroll(this.scroller2) {
            Column() {
              Text('Count' + this.count)
                .width('90%')
                .height(150)
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .margin({ top: 10 } as Margin)
                .id('commonmethod_shouldBuiltInRecognizerParallelWith3')
              Column() {
                ForEach(this.arr, (item: Int) => {
                  Text('item' + item)
                    .width('90%')
                    .height(150)
                    .borderRadius(15)
                    .fontSize(16)
                    .textAlign(TextAlign.Center)
                    .focusable(true)
                    .focusOnTouch(true)
                    .id('commonmethod_shouldBuiltInRecognizerParallelWith4' + item)
                })
              }.width('100%')
            }
          }
          .scrollBar(BarState.On)
          .id('inner')
          .width('100%')
        }.width('100%')
        .height('90%')
      }
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Gray)
      .scrollBarWidth(10)
      .shouldBuiltInRecognizerParallelWith(this.change ?
        (current: GestureRecognizer, others: Array<GestureRecognizer>) => {
          this.count += 1;
          for (let i = 0; i < others.length; i++) {
            let target = others[i].getEventTargetInfo();
            if (target) {
              if (target.getId() == 'inner' && others[i].isBuiltIn() &&
                others[i].getType() == GestureControl.GestureType.PAN_GESTURE) {
                this.currentRecognizer = current;
                this.childRecognizer = others[i];
                return others[i];
              }
            }
          }
        } : undefined)
        Button('undefined' + this.change)
          .onClick((e: ClickEvent) => {
            this.change = !this.change;
          })
          .id('button_shouldBuiltInRecognizerParallelWith')
  }
}