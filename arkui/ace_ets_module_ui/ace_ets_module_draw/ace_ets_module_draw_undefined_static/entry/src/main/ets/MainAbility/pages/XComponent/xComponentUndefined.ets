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
} from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State isOnLoad: boolean = true;
  @State isOnDestroy: boolean = true;
  @State isEnableSecure: boolean = true;
  @State isShow: boolean = true;
  @State message: string = 'hello';
  myXComponentController: XComponentController = new XComponentController();

  build() {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Start
    } as FlexOptions) {
      Text(this.message)
        .id('XComponent_text')

      if (this.isShow) {
        XComponent({
          type: XComponentType.SURFACE,
          controller: this.myXComponentController
        } as XComponentOptions)
          .id('XComponent')
          .enableSecure(this.isEnableSecure ? true : undefined)
          .onLoad(this.isOnLoad ? () => {
            this.message = 'onLoad'
          } : undefined)
          .onDestroy(this.isOnDestroy ? () => {
            this.message = 'onDestroy'
          } : undefined)
          .width('50%')
          .height('25%')
      }

      Button('isOnLoad: ' + this.isOnLoad)
        .id('XComponent_onLoad')
        .onClick((e: ClickEvent) => {
          this.isOnLoad = !this.isOnLoad
        })
      Button('isOnDestroy: ' + this.isOnDestroy)
        .id('XComponent_onDestroy')
        .onClick((e: ClickEvent) => {
          this.isOnDestroy = !this.isOnDestroy
        })
      Button('isEnableSecure: ' + this.isEnableSecure)
        .id('XComponent_enableSecure')
        .onClick((e: ClickEvent) => {
          this.isEnableSecure = !this.isEnableSecure
        })
      Button('isShow: ' + this.isShow)
        .id('XComponent_show')
        .onClick((e: ClickEvent) => {
          this.isShow = !this.isShow
        })
      Button('resetText')
        .id('XComponent_resetText')
        .onClick((e: ClickEvent) => {
          this.message = 'hello';
        })
    }.height('100%')
  }
}
