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
  ForEach
} from '@ohos.arkui.component'
import { AttributeModifier, CommonAttribute, VisibleAreaChangeCallback } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class VisibleAreaChangeModifier implements AttributeModifier<CommonAttribute> {
  @State change: Boolean = true
  @State change2: Boolean = true
  @State testTextStr: string = 'test'
  @State testRowStr: string = 'test'

  applyNormalAttribute(instance: CommonAttribute): void {
    if (this.change && this.change2) {
      instance.onVisibleAreaApproximateChange({
        ratios: [0.0, 1.0],
        expectedUpdateInterval: 1000
      } as VisibleAreaEventOptions, (isExpanding: boolean, currentRatio: number): void => {
        if (isExpanding && currentRatio >= 1.0) {
          this.testTextStr = 'Test Text is fully visible'
        }
        if (!isExpanding && currentRatio <= 0.0) {
          this.testTextStr = 'Test Text is completely invisible'
        }
      } as VisibleAreaChangeCallback);
    } else if (this.change2) {
      instance.onVisibleAreaApproximateChange(undefined, (isExpanding: boolean, currentRatio: number): void => {
        if (isExpanding && currentRatio >= 1.0) {
          this.testTextStr = 'Test Text is fully visible'
        }
        if (!isExpanding && currentRatio <= 0.0) {
          this.testTextStr = 'Test Text is completely invisible'
        }
      } as VisibleAreaChangeCallback);
    } else if (this.change) {
      instance.onVisibleAreaApproximateChange({
        ratios: [0.0, 1.0],
        expectedUpdateInterval: 1000
      } as VisibleAreaEventOptions, undefined);
    } else {
      instance.onVisibleAreaApproximateChange(undefined, undefined);
    }
  }
}

@Entry
@Component
struct ScrollExample {
  scroller: Scroller = new Scroller()
  @State arr: Int[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @State visibleModifier: VisibleAreaChangeModifier =
    new VisibleAreaChangeModifier();

  aboutToAppear() {
    this.visibleModifier.change = true;
    this.visibleModifier.change2 = true;
    this.visibleModifier.testTextStr = 'test';
  }

  build() {
    Column() {
      Column() {
        Button('undefined1' + this.visibleModifier.change)
          .onClick((e: ClickEvent) => {
            this.visibleModifier.change = !this.visibleModifier.change;
          })
          .id('button_onVisibleAreaApproximateChangeModifier1')
        Button('undefined2' + this.visibleModifier.change2)
          .onClick((e: ClickEvent) => {
            this.visibleModifier.change2 = !this.visibleModifier.change2;
          })
          .id('button_onVisibleAreaApproximateChangeModifier1')
        Text(this.visibleModifier.testTextStr)
          .fontSize(20)
          .id('commonmethod_onVisibleAreaApproximateChangeModifier1')
      }
      .height(100)

      Scroll(this.scroller) {
        Column() {
          Text('Test Text Visible Change')
            .fontSize(20)
            .height(50)
            .margin({ top: 10, bottom: 10 } as Margin)
            .attributeModifier(this.visibleModifier)
          ForEach(this.arr, (item: Int) => {
            Text('item' + item)
              .width('90%')
              .height(150)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .margin({ top: 10 } as Margin)
              .id('commonmethod_onVisibleAreaApproximateChangeModifier2' + item)
          })
        }.width('100%')
      }
      .scrollBar(BarState.On)
    }.width('100%').height('100%')
  }
}