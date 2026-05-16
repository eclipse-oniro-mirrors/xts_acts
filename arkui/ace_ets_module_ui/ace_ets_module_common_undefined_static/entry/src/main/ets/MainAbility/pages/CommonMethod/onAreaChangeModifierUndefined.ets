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
  Position,
  Color,
  Area,
  TextAttribute,
  AttributeModifier
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MyModifier implements AttributeModifier<TextAttribute> {
  public isUndefined: boolean = true;
  public cnt: int = 0;
  public msg: string = 'a';

  applyNormalAttribute(instance: TextAttribute): void {
    instance
      .onAreaChange(this.isUndefined ? undefined : (oldValue: Area, newValue: Area) => {
        this.cnt = this.msg.length;
      })
  }
}

@Entry
@Component
struct Index {
  @State myModifier: MyModifier = new MyModifier();

  build() {
    Column({ space: 10 } as ColumnOptions) {

      Text(`change${this.myModifier.cnt}`)
        .id('OACM_text1')
      Text(this.myModifier.msg)
        .id('OACM_text2')
        .onClick((e: ClickEvent) => {
          this.myModifier.msg += 'a';
        })
        .attributeModifier(this.myModifier)

      Button('btn : ' + this.myModifier.isUndefined)
        .id('OACM_btn1')
        .onClick((e: ClickEvent) => {
          this.myModifier.isUndefined = !this.myModifier.isUndefined
        })
    }
  }
}
