'use static'
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  ColumnOptions,
  HorizontalAlign,
  FlexAlign,
  Color,
  Scroller,
  Scroll,
  ScrollState,
  Edge,
  Row,
  BarState,
  Margin,
  TextAlign,
  VisibleAreaChangeCallback,
  VisibleAreaEventOptions,
  Area,
  SizeOptions,
  ForEach,
  GestureRecognizer,
  Stack,
  GestureControl
} from '@ohos.arkui.component'
import { AttributeModifier, CommonAttribute, VisibleAreaChangeCallback } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class ShouldParallelModifier implements AttributeModifier<CommonAttribute> {
  @State public change: Boolean = true
  @State public count: Int = 0
  private childRecognizer: GestureRecognizer = new GestureRecognizer();
  private currentRecognizer: GestureRecognizer = new GestureRecognizer();

  applyNormalAttribute(instance: CommonAttribute): void {
    instance.shouldBuiltInRecognizerParallelWith(this.change ?
      (current: GestureRecognizer, others: Array<GestureRecognizer>) => {
        this.count += 1;
        for (let i = 0; i < others.length; i++) {
          let target = others[i].getEventTargetInfo();
          if (target) {
            if (target.getId() == 'ModifierInner' && others[i].isBuiltIn() &&
              others[i].getType() == GestureControl.GestureType.PAN_GESTURE) {
              this.currentRecognizer = current;
              this.childRecognizer = others[i];
              return others[i];
            }
          }
        }
      } : undefined)
  }
}

@Entry
@Component
struct DemoPage {
  @State modDynamic: ShouldParallelModifier = new ShouldParallelModifier()
  @State arr: Int[] = [0, 1, 2, 3, 4, 5];
  private scroller: Scroller = new Scroller()
  private scroller2: Scroller = new Scroller()

  aboutToAppear() {
    this.modDynamic.change = true
  }

  build() {
    Stack() {
      Scroll(this.scroller) {
        Column() {
          Text('Scroll Area')
            .width('90%')
            .height(150)
            .borderRadius(15)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .margin({ top: 10 } as Margin)
            .id('commonmethod_shouldBuiltInRecognizerParallelWithModifier1')
          Scroll(this.scroller2) {
            Column() {
              Text('Scroll Area2')
                .width('90%')
                .height(150)
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .margin({ top: 10 } as Margin)
                .id('commonmethod_shouldBuiltInRecognizerParallelWithModifier2')
              Column() {
                ForEach(this.arr, (item: Int) => {
                  Text('item' + item)
                    .width('90%')
                    .height(150)
                    .borderRadius(15)
                    .fontSize(16)
                    .textAlign(TextAlign.Center)
                    .margin({ top: 10 } as Margin)
                    .id('commonmethod_shouldBuiltInRecognizerParallelWithModifier4' + item)
                })
              }.width('100%')
            }
          }
          .id('ModifierInner')
          .width('100%')
          .height(800)
        }.width('100%')
      }
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Gray)
      .scrollBarWidth(10)
      .attributeModifier(this.modDynamic)

      Column() {
        Text('Count' + this.modDynamic.count)
          .id('commonmethod_shouldBuiltInRecognizerParallelWithModifier3')
        Button('undefined' + this.modDynamic.change)
          .onClick((e: ClickEvent) => {
            this.modDynamic.change = !this.modDynamic.change;
          })
          .id('button_shouldBuiltInRecognizerParallelWithModifier')
      }
    }.width('100%').height('100%')
  }
}
