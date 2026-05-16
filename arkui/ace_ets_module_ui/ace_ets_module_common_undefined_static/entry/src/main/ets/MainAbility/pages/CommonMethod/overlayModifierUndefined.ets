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
  RowOptions,
  ImageAttribute,
  AttributeModifier,
  HorizontalAlign,
  Margin
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyModifier implements AttributeModifier<ImageAttribute> {
  public isOverlay: boolean = true;

  applyNormalAttribute(instance: ImageAttribute): void {
    instance
      .overlay(this.isOverlay ? undefined : 'Overlay...')
  }
}

@Entry
@Component
struct Index {
  @State myModifier: MyModifier = new MyModifier();

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Image($r('app.media.startIcon'))
        .id('overlayM_image')
        .height('20%')
        .draggable(true)
        .attributeModifier(this.myModifier)

      Button('btn1 : ' + this.myModifier.isOverlay)
        .id('overlayM_btn1')
        .onClick((e: ClickEvent) => {
          this.myModifier.isOverlay = !this.myModifier.isOverlay
        })
    }
    .alignItems(HorizontalAlign.Center)
    .width('80%')
    .height('100%')
    .margin({ top: 30 } as Margin)
  }
}