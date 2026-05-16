'use static'
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  $r,
  ColumnOptions,
  BorderOptions,
  Row,
  Image,
  Builder,
  Color,
  ClickEffect,
  ClickEffectLevel,
  RowOptions,
  ButtonAttribute,
  AttributeModifier
} from '@ohos.arkui.component'
import { AppStorage, State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyModifier1 implements AttributeModifier<ButtonAttribute> {
  public isClickEffect1: boolean = true;

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance
      .clickEffect(this.isClickEffect1 ? undefined : { level: ClickEffectLevel.LIGHT } as ClickEffect)
  }
}

@Observed
export class MyModifier2 implements AttributeModifier<ButtonAttribute> {
  public isClickEffect2: boolean = true;

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance
      .clickEffect(this.isClickEffect2 ? undefined : null)
  }
}


@Entry
@Component
struct Index {
  @State myModifier1: MyModifier1 = new MyModifier1();
  @State myModifier2: MyModifier2 = new MyModifier2();

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button('CEBtn1')
        .height(100)
        .width(100)
        .id('CEM_ClickBtn1')
        .attributeModifier(this.myModifier1)
      Button('CEBtn2')
        .height(100)
        .width(100)
        .id('CEM_ClickBtn2')
        .attributeModifier(this.myModifier2)

      Button('btn1:' + this.myModifier1.isClickEffect1)
        .id('CEM_btn1')
        .onClick((e: ClickEvent) => {
          this.myModifier1.isClickEffect1 = !this.myModifier1.isClickEffect1;
        })
      Button('btn2:' + this.myModifier2.isClickEffect2)
        .id('CEM_btn2')
        .onClick((e: ClickEvent) => {
          this.myModifier2.isClickEffect2 = !this.myModifier2.isClickEffect2;
        })
    }
  }
}