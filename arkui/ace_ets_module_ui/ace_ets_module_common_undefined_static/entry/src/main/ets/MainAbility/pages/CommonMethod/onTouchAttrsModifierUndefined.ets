'use static'
import {
  Entry,
  Component,
  Column,
  Button,
  Text,
  ColumnOptions,
  ClickEvent,
  Margin,
  Color,
  SizeOptions,
  Blank,
  TouchEvent,
  AttributeModifier,
  ButtonAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyModifier implements AttributeModifier<ButtonAttribute> {
  @State public cnt : int = 0;
  @State public isOnTouchUndefined: boolean = true;

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance
      .onTouch(this.isOnTouchUndefined ? (event?: TouchEvent): void => {
        this.cnt++;
      } : undefined)
  }
}

@Entry
@Component
struct TouchExample {
  @State myModifier: MyModifier = new MyModifier();

  build() {
    Column() {
      Button(`onTouch:${this.myModifier.cnt}`).width(100).height(40).margin(30)
        .id('MyButtonTouchModifier')
        .attributeModifier(this.myModifier)
      Blank().height(5)
      Column({ space: 5 } as ColumnOptions) {
        Button('isOnTouchUndefined: ' + this.myModifier.isOnTouchUndefined)
          .id('Common_OnTouch')
          .onClick((e: ClickEvent) => {
            this.myModifier.isOnTouchUndefined = !this.myModifier.isOnTouchUndefined
          })
          .height(20)
      }
    }
    .width('100%').height('100%').margin({ top: 30 } as Margin)
  }
}