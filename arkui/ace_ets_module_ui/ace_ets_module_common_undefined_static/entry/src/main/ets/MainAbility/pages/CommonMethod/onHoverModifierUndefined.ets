'use static'

import { AppStorage, State, Observed } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {
  Button,
  ClickEvent,
  Column,
  ColumnOptions,
  Row,
  Entry,
  Component,
  Text,
  Color,
  HoverEvent,
  ButtonAttribute,
  AttributeModifier
} from '@ohos.arkui.component'

@Observed
export class MyModifier implements AttributeModifier<ButtonAttribute> {
  public isUndefined: boolean = true;
  public cnt: int = 0;

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance
      .onHover(this.isUndefined ? undefined : (isHover: boolean, event: HoverEvent) => {
        this.cnt++;
      })
  }
}

@Entry
@Component
struct Index {
@State myModifier : MyModifier = new MyModifier();
  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button(`hover:${this.myModifier.cnt}`)
        .id('hoverM_btn1')
        .attributeModifier(this.myModifier)

      Button('btn : ' + this.myModifier.isUndefined)
        .id('hoverM_btn2')
        .onClick((e: ClickEvent) => {
          this.myModifier.isUndefined = !this.myModifier.isUndefined;
        })
    }.width('100%').height('100%')
  }
}