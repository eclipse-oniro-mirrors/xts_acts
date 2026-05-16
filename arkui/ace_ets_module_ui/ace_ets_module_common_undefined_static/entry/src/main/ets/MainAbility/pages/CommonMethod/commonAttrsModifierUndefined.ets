'use static'

import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  $r,
  ImageRepeat,
  BackgroundImageOptions,
  ColumnOptions,
  BorderOptions,
  ResizableOptions,
  Color,
  HoverEffect,
  ImageSize,
  HitTestMode,
  Blank,
  AttributeModifier,
  ColumnAttribute,
  ButtonAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyModifier implements AttributeModifier<ColumnAttribute> {
  @State public isBackgroundImageResizableUndefined: boolean = true;
  @State public isHoverEffectUndefined: boolean = true;
  @State public isBackgroundImageSizeUndefined: boolean = true;
  @State public isHitTestBehaviorUndefined: boolean = true;

  applyNormalAttribute(instance: ColumnAttribute): void {
    instance
      .backgroundImageResizable(this.isBackgroundImageResizableUndefined ? {
        slice: {
          top: 8,
          bottom: 8,
          left: 8,
          right: 8
        }
      } as ResizableOptions : undefined)
      .hoverEffect(this.isHoverEffectUndefined ? HoverEffect.Scale : undefined)
      .backgroundImageSize(this.isBackgroundImageSizeUndefined ? ImageSize.Cover : undefined)
      .hitTestBehavior(this.isHitTestBehaviorUndefined ? HitTestMode.Block : undefined)
  }
}

@Observed
export class MyModifierButton implements AttributeModifier<ButtonAttribute> {
  @State public cnt : int = 0;
  @State public isOnClickUndefined: boolean = true;

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance
      .onClick(this.isOnClickUndefined ? (event: ClickEvent) => {
        this.cnt++;
      } : undefined)
  }
}

@Entry
@Component
struct CommonUndefined {
  @State myModifier: MyModifier = new MyModifier();
  @State myModifierButton: MyModifierButton = new MyModifierButton();

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Column() {}
      .width('100%')
      .height('12%')
      .border({ width: 1 } as BorderOptions)
      .id('MyColumnModifier')
      .backgroundColor(Color.Gray)
      .backgroundImage($r('app.media.startIcon'))
      .attributeModifier(this.myModifier)


      Blank().height(5)
      Column({ space: 5 } as ColumnOptions) {
        Button('isBackgroundImageResizableUndefined: ' + this.myModifier.isBackgroundImageResizableUndefined)
          .id('Common_BackgroundImageResizable')
          .onClick((e: ClickEvent) => {
            this.myModifier.isBackgroundImageResizableUndefined = !this.myModifier.isBackgroundImageResizableUndefined
          })
          .height(20)
        Button('isHoverEffectUndefined: ' + this.myModifier.isHoverEffectUndefined)
          .id('Common_HoverEffect')
          .onClick((e: ClickEvent) => {
            this.myModifier.isHoverEffectUndefined = !this.myModifier.isHoverEffectUndefined
          })
          .height(20)
        Button('isBackgroundImageSizeUndefined: ' + this.myModifier.isBackgroundImageSizeUndefined)
          .id('Common_BackgroundImageSize')
          .onClick((e: ClickEvent) => {
            this.myModifier.isBackgroundImageSizeUndefined = !this.myModifier.isBackgroundImageSizeUndefined
          })
          .height(20)
        Button('isHitTestBehaviorUndefined: ' + this.myModifier.isHitTestBehaviorUndefined)
          .id('Common_HitTestBehavior')
          .onClick((e: ClickEvent) => {
            this.myModifier.isHitTestBehaviorUndefined = !this.myModifier.isHitTestBehaviorUndefined
          })
          .height(20)
      }
      Button(`click:${this.myModifierButton.cnt}`).width(100).height(40).margin(30)
        .id('MyButton')
        .attributeModifier(this.myModifierButton)

      Blank().height(5)
      Column({ space: 5 } as ColumnOptions) {
        Button('isOnClickUndefined: ' + this.myModifierButton.isOnClickUndefined)
          .id('Common_OnClick')
          .onClick((e: ClickEvent) => {
            this.myModifierButton.isOnClickUndefined = !this.myModifierButton.isOnClickUndefined
          })
          .height(20)
      }
    }

  }
}