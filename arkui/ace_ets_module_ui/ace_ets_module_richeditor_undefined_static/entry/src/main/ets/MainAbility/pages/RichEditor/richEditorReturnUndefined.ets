'use static'

import {
  Entry,
  Text,
  Column,
  Row,
  Component,
  Button,
  ClickEvent,
  Scroll,
  RichEditor,
  RichEditorController,
  CutEvent,
  FlexAlign,
  RichEditorOptions,
  Color,
  EnterKeyType,
  Builder,
  $r,
  RichEditorStyledStringController,
  MutableStyledString,
  TextStyle
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct RichEditorExample {
  controller: RichEditorController = new RichEditorController();
  controllerNotBind: RichEditorController = new RichEditorController();
  controllerNotBind2: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorOptions = { controller: this.controller } as RichEditorOptions;
  mutableStyledStringNotBind: MutableStyledString = new MutableStyledString('');
  @State message: string = 'hello';
  @State messageAddBuilderSpan: string = 'hello';
  @State messageAddSymbolSpan: string = 'hello';
  @State messageAddTextSpan: string = 'hello';
  @State messageGetCaretOffset: string = 'hello';
  @State messageGetStyledString: string = 'hello';
  @State messageGetLayoutManager: string = 'hello';
  @State messageGetParagraphs: string = 'hello';
  @State messageGetPreviewText: string = 'hello';
  @State messageGetSelection: string = 'hello';
  @State messageGetSelection2: string = 'hello';
  @State messageGetSpans: string = 'hello';
  @State messageGetTypingStyle: string = 'hello';
  @State messageSetCaretOffset: string = 'hello';
  @State messageFromStyledString: string = 'hello';
  @State messageToStyledString: string = 'hello';
  @State messageIsEditing: string = 'hello';

  @Builder
  spanBuilder() {
    Row() {
      Text('0123456789')
        .fontSize(14)
        .fontColor(Color.Red)
        .margin(4)
    }
    .width('auto')
    .height(28)
    .backgroundColor(Color.Gray)
    .borderRadius(10)
  }

  build() {
    Column() {
      Column() {
        RichEditor(this.options)
          .borderWidth(1)
          .borderColor(Color.Green)
          .width('100%')
          .height('30%')
        Row() {
          Button('addBuilderSpan_not_bind')
            .id('Btn_addBuilderSpan')
            .onClick((e: ClickEvent) => {
              let ret = this.controllerNotBind.addBuilderSpan(this.spanBuilder)
              if (ret == undefined) {
                this.message = 'undefined'
              }
            })
          Button('addImageSpan_not_bind')
            .id('Btn_addImageSpan')
            .onClick((e: ClickEvent) => {
              let ret = this.controllerNotBind.addImageSpan($r('app.media.startIcon'))
              if (ret == undefined) {
                this.messageAddBuilderSpan = 'undefined'
              }
            })
        }
        Row() {
          Button('addSymbolSpan_not_bind')
            .id('Btn_addSymbolSpan')
            .onClick((e: ClickEvent) => {
              let ret = this.controllerNotBind.addSymbolSpan($r('sys.symbol.ohos_trash'))
              if (ret == undefined) {
                this.messageAddSymbolSpan = 'undefined'
              }
            })
          Button('addTextSpan_not_bind')
            .id('Btn_addTextSpan')
            .onClick((e: ClickEvent) => {
              let ret = this.controllerNotBind.addTextSpan('0123456789',
                {
                  style:
                  {
                    fontColor: Color.Orange,
                    fontSize: 30,
                    textShadow: {
                      radius: 10,
                      color: Color.Blue,
                      offsetX: 10,
                      offsetY: 0
                    }
                  }
                })
              if (ret == undefined) {
                this.messageAddTextSpan = 'undefined'
              }
            })
        }
        Row() {
          Button('getCaretOffset_not_bind')
            .id('Btn_getCaretOffset')
            .onClick((e: ClickEvent) => {
              let ret = this.controllerNotBind.getCaretOffset()
              if (ret == undefined) {
                this.messageGetCaretOffset = 'undefined'
              }
            })
          Button('getStyledString_not_bind')
            .id('Btn_getStyledString')
            .onClick((e: ClickEvent) => {
              let ret = this.controllerNotBind2.getStyledString()
              if (ret == undefined) {
                this.messageGetStyledString = 'undefined'
              }
            })
        }
        Row() {
          Button('getLayoutManager_not_bind')
            .id('Btn_getLayoutManager')
            .onClick((e: ClickEvent) => {
              let ret = this.controllerNotBind.getLayoutManager()
              if (ret == undefined) {
                this.messageGetLayoutManager = 'undefined'
              }
            })
          Button('getParagraphs_not_bind')
            .id('Btn_getParagraphs')
            .onClick((e: ClickEvent) => {
              let ret = this.controllerNotBind.getParagraphs()
              if (ret == undefined) {
                this.messageGetParagraphs = 'undefined'
              }
            })
        }
        Row() {
          Button('getPreviewText_not_bind')
            .id('Btn_getPreviewText')
            .onClick((e: ClickEvent) => {
              let ret = this.controllerNotBind.getPreviewText()
              if (ret == undefined) {
                this.messageGetPreviewText = 'undefined'
              }
            })
          Button('getSelection_not_bind')
            .id('Btn_getSelection')
            .onClick((e: ClickEvent) => {
              let ret = this.controllerNotBind.getSelection()
              if (ret == undefined) {
                this.messageGetSelection = 'undefined'
              }
            })
        }
        Row() {
          Button('getSelection2_not_bind')
            .id('Btn_getSelection2')
            .onClick((e: ClickEvent) => {
              let ret = this.controllerNotBind2.getSelection()
              if (ret == undefined) {
                this.messageGetSelection2 = 'undefined'
              }
            })
          Button('getSpans_not_bind')
            .id('Btn_getSpans')
            .onClick((e: ClickEvent) => {
              let ret = this.controllerNotBind.getSpans({start: -1, end: -1})
              if (ret == undefined) {
                this.messageGetSpans = 'undefined'
              }
            })
        }
        Row() {
          Button('getTypingStyle_not_bind')
            .id('Btn_getTypingStyle')
            .onClick((e: ClickEvent) => {
              let ret = this.controllerNotBind.getTypingStyle()
              if (ret == undefined) {
                this.messageGetTypingStyle = 'undefined'
              }
            })
          Button('setCaretOffset_not_bind')
            .id('Btn_setCaretOffset')
            .onClick((e: ClickEvent) => {
              let ret = this.controllerNotBind2.setCaretOffset(3)
              if (ret == undefined) {
                this.messageSetCaretOffset = 'undefined'
              }
            })
        }
        Row() {
          Button('fromStyledString_not_bind')
            .id('Btn_fromStyledString')
            .onClick((e: ClickEvent) => {
              let ret = this.controllerNotBind.fromStyledString(this.mutableStyledStringNotBind)
              if (ret == undefined) {
                this.messageFromStyledString = 'undefined'
              }
            })
          Button('toStyledString_not_bind')
            .id('Btn_toStyledString')
            .onClick((e: ClickEvent) => {
              let ret = this.controllerNotBind.toStyledString({ start: 0, end: 1 })
              if (ret == undefined) {
                this.messageToStyledString = 'undefined'
              }
            })
        }
        Row() {
          Button('isEditing_not_bind')
            .id('Btn_isEditing')
            .onClick((e: ClickEvent) => {
              let ret = this.controllerNotBind2.isEditing()
              if (ret == undefined) {
                this.messageIsEditing = 'undefined'
              }
            })
        }

        Row() {
          Text(this.message)
            .id('Text_addBuilderSpan')
          Text(this.messageAddBuilderSpan)
            .id('Text_addImageSpan')
          Text(this.messageAddSymbolSpan)
            .id('Text_addSymbolSpan')
          Text(this.messageAddTextSpan)
            .id('Text_addTextSpan')
        }
        Row() {
          Text(this.messageGetCaretOffset)
            .id('Text_getCaretOffset')
          Text(this.messageGetStyledString)
            .id('Text_getStyledString')
          Text(this.messageGetLayoutManager)
            .id('Text_getLayoutManager')
          Text(this.messageGetParagraphs)
            .id('Text_getParagraphs')
        }
        Row() {
          Text(this.messageGetPreviewText)
            .id('Text_getPreviewText')
          Text(this.messageGetSelection)
            .id('Text_getSelection')
          Text(this.messageGetSelection2)
            .id('Text_getSelection2')
          Text(this.messageGetSpans)
            .id('Text_getSpans')
        }
        Row() {
          Text(this.messageGetTypingStyle)
            .id('Text_getTypingStyle')
          Text(this.messageSetCaretOffset)
            .id('Text_setCaretOffset')
          Text(this.messageFromStyledString)
            .id('Text_fromStyledString')
          Text(this.messageToStyledString)
            .id('Text_toStyledString')
        }
        Row() {
          Text(this.messageIsEditing)
            .id('Text_isEditing')
        }
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('70%')
    }
  }
}