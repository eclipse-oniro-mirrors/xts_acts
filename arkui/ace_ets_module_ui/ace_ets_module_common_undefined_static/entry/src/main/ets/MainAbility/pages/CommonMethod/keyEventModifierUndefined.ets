'use static'

import { AppStorage, State, Observed } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {
  Builder,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Row,
  RowOptions,
  Text,
  $r,
  Alignment,
  KeyEvent,
  KeyType,
  ModifierKey,
  ButtonAttribute,
  AttributeModifier
} from '@ohos.arkui.component'


@Observed
export class MyModifier implements AttributeModifier<ButtonAttribute> {
  public isUndefined: boolean = true;
  public count: int = 0;

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance
      .onKeyEvent(this.isUndefined ? undefined : (event?: KeyEvent) => {
        this.count++;
        return true;
      })

  }
}

@Entry
@Component
struct Index {
  @State myModifier : MyModifier = new MyModifier();
  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button(`click:${this.myModifier.count}`)
        .id('keventM_btn1')
        .defaultFocus(true)
        .attributeModifier(this.myModifier)
      Button('btn : ' + this.myModifier.isUndefined)
        .id('keventM_btn2')
        .focusable(false)
        .onClick((e: ClickEvent) => {
          this.myModifier.isUndefined = !this.myModifier.isUndefined;
        })
    }.width('100%').height('100%')
  }
}