'use static'

import {
  Entry,
  Text,
  Column,
  ColumnOptions,
  Component,
  Button,
  ClickEvent,
  Color,
  Row,
  Navigation,
  NavigationTitleMode,
  Builder,
  ToolbarItem,
  AttributeModifier,
  NavigationAttribute,
  Dimension
} from '@ohos.arkui.component'
import { State ,Observed} from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
type NavType = [Dimension, Dimension];

@Observed
export class MyModifier implements AttributeModifier<NavigationAttribute> {
  public isUndefined1: boolean = true;
  public isUndefined2: boolean = true;
  public isUndefined3: boolean = true;
  public isUndefined4: boolean = true;

  applyNormalAttribute(instance: NavigationAttribute): void {
    instance
      .titleMode(this.isUndefined1 ? undefined : NavigationTitleMode.Full)
      .toolbarConfiguration(this.isUndefined2 ? undefined : [
        {
          value: 'toolbar',
        }
      ] as Array<ToolbarItem>)
      .minContentWidth(this.isUndefined3 ? undefined : 150 as number)
      .navBarWidthRange(this.isUndefined4 ? undefined : ['310vp', '500vp'] as NavType)
  }
}

@Entry
@Component
struct Index {
@State myModifier : MyModifier = new MyModifier();
  build() {
    Navigation() {
      Button('btn1 : ' + this.myModifier.isUndefined1)
        .id('NavigationM_btn1')
        .onClick((e: ClickEvent) => {
          this.myModifier.isUndefined1 = !this.myModifier.isUndefined1
        })
      Button('btn2 : ' + this.myModifier.isUndefined2)
        .id('NavigationM_btn2')
        .onClick((e: ClickEvent) => {
          this.myModifier.isUndefined2 = !this.myModifier.isUndefined2
        })
      Button('btn3 : ' + this.myModifier.isUndefined3)
        .id('NavigationM_btn3')
        .onClick((e: ClickEvent) => {
          this.myModifier.isUndefined3 = !this.myModifier.isUndefined3
        })
      Button('btn4 : ' + this.myModifier.isUndefined4)
        .id('NavigationM_btn4')
        .onClick((e: ClickEvent) => {
          this.myModifier.isUndefined4 = !this.myModifier.isUndefined4
        })
    }
    .width('100%')
    .height('100%')
    .borderWidth(1)
    .id('NavigationM_1')
    .attributeModifier(this.myModifier)

  }

}