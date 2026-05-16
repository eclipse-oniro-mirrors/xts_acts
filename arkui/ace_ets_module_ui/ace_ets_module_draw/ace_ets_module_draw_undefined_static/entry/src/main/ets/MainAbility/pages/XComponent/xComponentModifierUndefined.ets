'use static'
import {
  Button,
  ClickEvent,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Flex,
  FlexOptions,
  FlexAlign,
  FlexDirection,
  ItemAlign,
  VerticalAlign,
  Row,
  State,
  SurfaceRect,
  SurfaceRotationOptions,
  Text,
  XComponent,
  XComponentType,
  XComponentOptions,
  XComponentController,
  Blank,
  DrawingCanvas,
  XComponentAttribute,
  AttributeModifier
} from '@kit.ArkUI';
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MyPointModifier implements AttributeModifier<XComponentAttribute> {
  public isOnLoad: boolean = true;
  public isOnDestroy: boolean = true;
  public isEnableSecure: boolean = true;
  public message: string = 'hello';

  applyNormalAttribute(instance: XComponentAttribute): void {
    instance
      .enableSecure(this.isEnableSecure ? true : undefined)
      .onLoad(this.isOnLoad ? () => {
        this.message = 'onLoad'
      } : undefined)
      .onDestroy(this.isOnDestroy ? () => {
        this.message = 'onDestroy'
      } : undefined)
  }
}

@Entry
@Component
struct Index {
  @State isShow: boolean = true;
  @State modifier: MyPointModifier = new MyPointModifier()
  public myXComponentController: XComponentController = new XComponentController();

  build() {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Start
    } as FlexOptions) {
      Text(this.modifier.message)
        .id('XComponentM_text')

      if (this.isShow) {
        XComponent({
          type: XComponentType.SURFACE,
          controller: this.myXComponentController
        } as XComponentOptions)
          .id('XComponentM')
          .attributeModifier(this.modifier)
          .width('50%')
          .height('25%')
      }

      Button('isOnLoad: ' + this.modifier.isOnLoad)
        .id('XComponentM_onLoad')
        .onClick((e: ClickEvent) => {
          this.modifier.isOnLoad = !this.modifier.isOnLoad
        })
      Button('isOnDestroy: ' + this.modifier.isOnDestroy)
        .id('XComponentM_onDestroy')
        .onClick((e: ClickEvent) => {
          this.modifier.isOnDestroy = !this.modifier.isOnDestroy
        })
      Button('isEnableSecure: ' + this.modifier.isEnableSecure)
        .id('XComponentM_enableSecure')
        .onClick((e: ClickEvent) => {
          this.modifier.isEnableSecure = !this.modifier.isEnableSecure
        })
      Button('isShow: ' + this.isShow)
        .id('XComponentM_show')
        .onClick((e: ClickEvent) => {
          this.isShow = !this.isShow
        })
      Button('resetText')
        .id('XComponentM_resetText')
        .onClick((e: ClickEvent) => {
          this.modifier.message = 'hello';
        })
    }.height('100%')
  }
}
