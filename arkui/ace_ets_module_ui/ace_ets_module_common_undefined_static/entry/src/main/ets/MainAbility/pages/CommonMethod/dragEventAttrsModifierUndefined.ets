'use static'
import {
  Entry,
  Component,
  Column,
  Button,
  Text,
  ColumnOptions,
  ClickEvent,
  Image,
  Row,
  TextAlign,
  Color,
  $r,
  DragEvent,
  AttributeModifier,
  ImageAttribute,
  HorizontalAlign
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyModifier1 implements AttributeModifier<ImageAttribute> {
  @State public isOnDragEndUndefined: boolean = true;
  @State public isOnDropUndefined: boolean = true;
  @State public message: string = 'Hello World';

  applyNormalAttribute(instance: ImageAttribute): void {
    instance
      .onDragEnd(this.isOnDragEndUndefined ? undefined : (dragEvent: DragEvent) => {
        this.message = 'onDragEnd';
        console.log(this.message)
      })
      .onDrop(this.isOnDropUndefined ? undefined : (dragEvent: DragEvent) => {
        this.message = 'onDrop';
        console.log(this.message)
      })
  }
}

@Observed
export class MyModifier2 implements AttributeModifier<ImageAttribute> {
  @State public isOnDragEnterUndefined: boolean = true;
  @State public isOnDragLeaveUndefined: boolean = true;
  @State public isOnDragMoveUndefined: boolean = true;
  @State public message: string = 'Hello World';

  applyNormalAttribute(instance: ImageAttribute): void {
    instance
      .onDragEnter(this.isOnDragEnterUndefined ? undefined : (dragEvent: DragEvent) => {
        this.message = 'onDragEnter';
        console.log(this.message)
      })
      .onDragLeave(this.isOnDragLeaveUndefined ? undefined : (dragEvent: DragEvent) => {
        this.message = 'onDragLeave';
        console.log(this.message)
      })
      .onDragMove(this.isOnDragMoveUndefined ? undefined : (dragEvent: DragEvent) => {
        this.message = 'onDragMove';
        console.log(this.message)
      })
      .onDrop((dragEvent: DragEvent) => {
        console.log('onDrop')
      })
  }
}

@Entry
@Component
struct DropAnimationExample {
  @State myModifier1: MyModifier1 = new MyModifier1();
  @State myModifier2: MyModifier2 = new MyModifier2();

  build() {
    Column() {
      Text(this.myModifier1.message)
        .id('Common_textModifier1')
      Text(this.myModifier2.message)
        .id('Common_text2')
      Column() {
        Image($r('app.media.startIcon'))
          .width(80)
          .height(80)
          .draggable(true)
          .id('ImageModifier1')
          .attributeModifier(this.myModifier1)
      }
      .id('Column1')
      .width(150)
      .height(150)

      Column() {
        Image($r('app.media.startIcon'))
          .width(80)
          .height(80)
          .draggable(true)
          .id('Image2')
          .attributeModifier(this.myModifier2)
      }
      .id('Column2')
      .width(150)
      .height(150)

      Column({ space: 5 } as ColumnOptions) {
        Button('resetText')
          .id('Common_resetText')
          .onClick((e: ClickEvent) => {
            this.myModifier1.message = 'Hello World';
            this.myModifier2.message = 'Hello World';
          })
        Button('isOnDragEndUndefined : ' + this.myModifier1.isOnDragEndUndefined)
          .onClick((e: ClickEvent) => {
            this.myModifier1.isOnDragEndUndefined = !this.myModifier1.isOnDragEndUndefined
          })
          .id('Common_OnDragEnd')
        Button('isOnDragEnterUndefined : ' + this.myModifier2.isOnDragEnterUndefined)
          .onClick((e: ClickEvent) => {
            this.myModifier2.isOnDragEnterUndefined = !this.myModifier2.isOnDragEnterUndefined
          })
          .id('Common_OnDragEnter')
        Button('isOnDragLeaveUndefined : ' + this.myModifier2.isOnDragLeaveUndefined)
          .onClick((e: ClickEvent) => {
            this.myModifier2.isOnDragLeaveUndefined = !this.myModifier2.isOnDragLeaveUndefined
          })
          .id('Common_OnDragLeave')
        Button('isOnDragMoveUndefined : ' + this.myModifier2.isOnDragMoveUndefined)
          .onClick((e: ClickEvent) => {
            this.myModifier2.isOnDragMoveUndefined = !this.myModifier2.isOnDragMoveUndefined
          })
          .id('Common_OnDragMove')
        Button('isOnDropUndefined : ' + this.myModifier1.isOnDropUndefined)
          .onClick((e: ClickEvent) => {
            this.myModifier1.isOnDropUndefined = !this.myModifier1.isOnDropUndefined
          })
          .id('Common_OnDrop')
      }
    }
    .alignItems(HorizontalAlign.Center)
    .width('80%')
    .height('100%')
  }
}