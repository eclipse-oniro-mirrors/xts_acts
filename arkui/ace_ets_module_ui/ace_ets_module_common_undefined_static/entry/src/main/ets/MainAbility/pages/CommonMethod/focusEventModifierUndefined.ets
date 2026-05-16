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
  ButtonAttribute,
  AttributeModifier,
  focusControl
} from '@ohos.arkui.component'

@Observed
export class MyModifier implements AttributeModifier<ButtonAttribute> {
  public isUndefined: boolean = true;
  public cnt: int = 0;

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance
      .onFocus(this.isUndefined ? undefined : () => {
        this.cnt++;
      })

  }
}

@Entry
@Component
struct Index {
  @State myModifier: MyModifier = new MyModifier();

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button(`focus:${this.myModifier.cnt}`)
        .id('FEM_btn1')
        .focusOnTouch(true)
        .attributeModifier(this.myModifier)

      Row(){
        Button('req')
          .id('FEM_req')
          .onClick((e: ClickEvent) => {
            focusControl.requestFocus('FEM_btn1')
          })
        Button('req2')
          .id('FEM_req2')
          .onClick((e: ClickEvent) => {
            focusControl.requestFocus('FEM_btn2')
          })
      }

      Button('Btn2 : ' + this.myModifier.isUndefined)
        .id('FEM_btn2')
        .onClick((e: ClickEvent) => {
          this.myModifier.isUndefined = !this.myModifier.isUndefined;
        }).defaultFocus(true)
    }.width('100%').height('100%')
  }
}