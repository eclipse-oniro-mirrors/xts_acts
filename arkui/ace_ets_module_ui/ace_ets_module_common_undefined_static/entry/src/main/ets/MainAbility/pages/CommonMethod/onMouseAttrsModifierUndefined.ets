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
  MouseEvent,
  AttributeModifier,
  ButtonAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyModifier implements AttributeModifier<ButtonAttribute> {
  @State public cnt: int = 0;
  @State public isOnMouseUndefined: boolean = true;

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance
      .onMouse(this.isOnMouseUndefined ? (event: MouseEvent): void => {
        this.cnt++;
      } : undefined)
  }
}

@Entry
@Component
struct MouseExample {
  @State myModifier: MyModifier = new MyModifier();

  build() {
    Column() {
      Button(`onMouse:${this.myModifier.cnt}`)
        .width(100)
        .height(40)
        .margin(30)
        .id('MyButtonMouseModifier')
        .attributeModifier(this.myModifier)

      Blank().height(5)
      Column({ space: 5 } as ColumnOptions) {
        Button('isOnMouseUndefined: ' + this.myModifier.isOnMouseUndefined)
          .id('Common_OnMouseModifier')
          .onClick((e: ClickEvent) => {
            this.myModifier.isOnMouseUndefined = !this.myModifier.isOnMouseUndefined
          })
          .height(20)
      }
    }
    .width('100%').height('100%').margin({ top: 30 } as Margin)
  }
}