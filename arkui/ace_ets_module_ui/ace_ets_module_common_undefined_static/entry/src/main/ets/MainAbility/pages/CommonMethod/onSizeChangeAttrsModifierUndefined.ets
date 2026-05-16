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
  AttributeModifier,
  TextAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyModifier implements AttributeModifier<TextAttribute> {
  @State public cnt : int = 0;
  @State public isOnSizeChangeUndefined: boolean = false;

  applyNormalAttribute(instance: TextAttribute): void {
    instance
      .onSizeChange(this.isOnSizeChangeUndefined ? undefined : (oldValue: SizeOptions, newValue: SizeOptions) => {
        this.cnt++;
      })
  }
}

@Entry
@Component
struct AreaExample {
  @State value4: string = 'Text'
  @State myModifier: MyModifier = new MyModifier();

  build() {
    Column() {
      Text(this.value4)
        .margin(30)
        .fontSize(20)
        .onClick(() => {
          this.value4 = this.value4 + 'Text'
        })
        .attributeModifier(this.myModifier)
        .id('changeValue')

      Button(`onSizeChange:${this.myModifier.cnt}`).width(100).height(40).margin(30)
        .id('MyButtonModifier')

      Blank().height(5)
      Column({ space: 5 } as ColumnOptions) {
        Button('isOnSizeChangeUndefined: ' + this.myModifier.isOnSizeChangeUndefined)
          .id('Common_OnSizeChange')
          .onClick((e: ClickEvent) => {
            this.myModifier.isOnSizeChangeUndefined = !this.myModifier.isOnSizeChangeUndefined
          })
          .height(20)
      }


    }
    .width('100%').height('100%').margin({ top: 30 } as Margin)
  }
}