'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import pasteboard from '@ohos.pasteboard'
import CommonFunc from '../../common/Common'
import {
  Entry,
  Component,SliderChangeMode,ShadowStyle,ResourceColor,Resource,$r,RichEditorTextStyle,Builder,
  Column,ClickEvent,ResponseType,Length,FontStyle,FontWeight,ResourceStr,TextDecorationType,Flex,RichEditorImageSpanResult,
  Row,HoverEvent,Menu,RichEditorUpdateTextSpanStyleOptions,
  Text,
  ColumnOptions,
  TouchType,
  CustomBuilder,
  DragItemInfo,
  Color,
  Button,
  TouchEvent,
  Margin,
  Scroller,
  GestureRecognizer,MenuPolicy,RichEditorSelection,
  PanRecognizer,
  GestureEvent,
  ScrollableTargetInfo,
  Stack,
  Alignment,
  Scroll,
  TextAlign,
  ForEach,
  ScrollDirection,
  BarState,
  EdgeEffect,
  GestureControl,Visibility,RowOptions,SelectionOptions,Image,
  PanGesture,FlexAlign,ItemAlign,
  GestureRecognizerState,RichEditorController,RichEditor,RichEditorChangeValue,RichEditorTextSpanResult,RichEditorOptions,RichEditorLayoutStyle,LongPressGesture,Direction,RichEditorRange
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
export interface SelectionMenuTheme {
  imageSize: number;
  buttonSize: number;
  menuSpacing: number;
  editorOptionMargin: number;
  expandedOptionPadding: number;
  defaultMenuWidth: number;
  imageFillColor: Resource;
  backGroundColor: Resource;
  iconBorderRadius: Resource;
  containerBorderRadius: Resource;
  cutIcon: Resource;
  copyIcon: Resource;
  pasteIcon: Resource;
  selectAllIcon: Resource;
  shareIcon: Resource;
  translateIcon: Resource;
  searchIcon: Resource;
  arrowDownIcon: Resource;
  iconPanelShadowStyle: ShadowStyle;
  iconFocusBorderColor: Resource;
}

export const defaultTheme: SelectionMenuTheme = {
  imageSize: 24,
  buttonSize: 48,
  menuSpacing: 8,
  editorOptionMargin: 1,
  expandedOptionPadding: 3,
  defaultMenuWidth: 256,
  imageFillColor: $r('sys.color.ohos_id_color_primary'),
  backGroundColor: $r('sys.color.ohos_id_color_dialog_bg'),
  iconBorderRadius: $r('sys.float.ohos_id_corner_radius_default_m'),
  containerBorderRadius: $r('sys.float.ohos_id_corner_radius_card'),
  cutIcon: $r('sys.media.ohos_ic_public_cut'),
  copyIcon: $r('sys.media.ohos_ic_public_copy'),
  pasteIcon: $r('sys.media.ohos_ic_public_paste'),
  selectAllIcon: $r('sys.media.ohos_ic_public_select_all'),
  shareIcon: $r('sys.media.ohos_ic_public_share'),
  translateIcon: $r('sys.media.ohos_ic_public_translate_c2e'),
  searchIcon: $r('sys.media.ohos_ic_public_search_filled'),
  arrowDownIcon: $r('sys.media.ohos_ic_public_arrow_down'),
  iconPanelShadowStyle: ShadowStyle.OUTER_DEFAULT_MD,
  iconFocusBorderColor: $r('sys.color.ohos_id_color_focused_outline'),
}
@Entry
@Component
struct RichEditorInterFace001 {
  @State message: string = 'Hello World'
  @State textSize: number = 40
  @State sliderShow: boolean = false
  @State start: number = -1
  @State end: number = -1
  @State colorTransparent: Color = Color.Transparent
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller } as RichEditorOptions
  private iconArr: Array<Resource> =new Array<Resource>($r('app.media.icon'), $r('app.media.icon'), $r('app.media.icon'),
    $r('app.media.icon'), $r('app.media.icon'))
  @State iconBgColor: ResourceColor[] = new Array<ResourceColor>(this.iconArr.length).fill(this.colorTransparent)
  @State pasteEnable: boolean = false
  @State visibilityValue: Visibility = Visibility.Visible
  @State textStyle: RichEditorTextStyle = {} as RichEditorTextStyle
  private fontWeightTable: string[] = new Array<string>('100', '200', '300', '400', '500',
    '600', '700', '800', '900', 'bold', 'normal', 'bolder', 'lighter', 'medium', 'regular')
  private theme: SelectionMenuTheme = defaultTheme;
  private myOffset: int | undefined = undefined
  private myBuilder: CustomBuilder = ()=>{}
  @State onAppearCall: number = 0;
  @State disAppearCall: number = 0;
  @Builder
  placeholderBuilder() {
    Row({ space: 2 } as RowOptions as RowOptions) {
      Text('test').fontSize(10)
    }.width(100).height(50).padding(5)
  }


  build() {

    Column() {
      Text('onAppearCall:' + this.onAppearCall).id('onAppearCall')
      Text('disAppearCall:' + this.disAppearCall).id('disAppearCall')


      Button('select 1')
        .id('select1')
        .margin(10)
        .backgroundColor(Color.Orange)
        .onClick((e: ClickEvent) => {
          let options: SelectionOptions = {
            menuPolicy: MenuPolicy.SHOW
          };
          this.controller!.setSelection(1, 3, options);
        })
      Button('select 2')
        .id('select2')
        .margin(10)
        .backgroundColor(Color.Orange)
        .onClick((e: ClickEvent) => {
          let options: SelectionOptions = {
            menuPolicy: MenuPolicy.SHOW
          };
          this.controller!.setSelection(4, 5, options);
        })
      Button('select 3')
        .id('select3')
        .margin(10)
        .backgroundColor(Color.Orange)
        .onClick((e: ClickEvent) => {
          let options: SelectionOptions = {
            menuPolicy: MenuPolicy.SHOW
          };
          this.controller!.setSelection(5, 6, options);
        })

      Button('add span')
        .id('addSpan')
        .margin(10)
        .backgroundColor(Color.Orange)
        .onClick((e: ClickEvent) => {
          this.myBuilder = () => {
            this.placeholderBuilder();
          }
          this.controller!.addBuilderSpan(this.myBuilder, { offset: this.myOffset});
        })

      RichEditor(this.options)
        .height(100)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady((): void => {
          this.controller!.addTextSpan('abcd',
            {
              style:
              {
                fontColor: Color.Red,
                fontSize: 20
              }
            })
          this.controller!.addImageSpan($r('app.media.icon'),
            {
              imageStyle:
              {
                size: ['57px', '57px']
              }
            })
        })
          // .bindSelectionMenu(RichEditorSpanType.TEXT, this.panel, ResponseType.LongPress,
          //   { onDisappear: () => {
          //     console.log('RichEditorController onDisappear')
          //     this.sliderShow = false;
          //     this.disAppearCall += 1;
          //   }, onAppear: () => {
          //     console.log('RichEditorController onAppear')
          //     this.onAppearCall += 1;
          //     this.sliderShow = false;
          //   }})
        .id('RichEditorInterFace001')

    }
  }


  PushDataToPasteboard(richEditorSelection: RichEditorSelection) {
    let sysBoard = pasteboard.getSystemPasteboard()
    let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, '')
    if (richEditorSelection.spans && richEditorSelection.spans.length > 0) {
      let count = richEditorSelection.spans.length
      for (let i = count - 1; i >= 0; i--) {
        let item = richEditorSelection.spans[i]
        if ((item as RichEditorTextSpanResult)?.textStyle) {
          let span = item as RichEditorTextSpanResult
          let style = span.textStyle
          // let data = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN,
          //   span.value.substring(span.offsetInSpan[0], span.offsetInSpan[1]))
          let prop: pasteboard.PasteDataProperty = pasteData.getProperty()
          let temp: Record<string, Object> = {
            'color': style.fontColor,
            'size': style.fontSize,
            'style': style.fontStyle,
            'weight': this.fontWeightTable[style.fontWeight as int],
            'fontFamily': style.fontFamily,
            'decorationType': style.decoration.type,
            'decorationColor': style.decoration.color
          }
          // prop.additions[i] = temp;
          // pasteData.addRecord(data)
          pasteData.setProperty(prop)
        }
      }
    }
    sysBoard.clearData()
    sysBoard.setData(pasteData).then(() => {
      console.info('SelectionMenu copy option, Succeeded in setting PasteData.');
      this.pasteEnable = true;
    }).catch((err: Error) => {
      console.error('SelectionMenu copy option, Failed to set PasteData. Cause:' + err.message);
    })
  }

  // PopDataFromPasteboard(richEditorSelection: RichEditorSelection) {
  //   let start = richEditorSelection.selection[0]
  //   let end = richEditorSelection.selection[1]
  //   if (start == end && this.controller) {
  //     start = this.controller!.getCaretOffset()
  //     end = this.controller!.getCaretOffset()
  //   }
  //   let moveOffset = 0
  //   let sysBoard = pasteboard.getSystemPasteboard()
  //   sysBoard.getData((err, data) => {
  //     if (err) {
  //       return
  //     }
  //     let count = data.getRecordCount()
  //     for (let i = 0; i < count; i++) {
  //       const element = data.getRecord(i);
  //       let tex: RichEditorTextStyle = {
  //         fontSize: 16,
  //         fontColor: Color.Black,
  //         fontWeight: FontWeight.Normal,
  //         fontFamily: CommonFunc.FONT_FAMILY,
  //         fontStyle: FontStyle.Normal,
  //         decoration: { type: TextDecorationType.None, color: '#FF000000'}
  //       }
  //       if (data.getProperty() && data.getProperty().additions[i]) {
  //         const tmp = data.getProperty().additions[i] as Record<string, Object | undefined>;
  //         if (tmp.color) {
  //           tex.fontColor = tmp.color as ResourceColor;
  //         }
  //         if (tmp.size) {
  //           tex.fontSize = tmp.size as Length | number;
  //         }
  //         if (tmp.style) {
  //           tex.fontStyle = tmp.style as FontStyle;
  //         }
  //         if (tmp.weight) {
  //           tex.fontWeight = tmp.weight as number | FontWeight | string;
  //         }
  //         if (tmp.fontFamily) {
  //           tex.fontFamily = tmp.fontFamily as ResourceStr;
  //         }
  //         if (tmp.decorationType && tex.decoration) {
  //           tex.decoration.type = tmp.decorationType as TextDecorationType;
  //         }
  //         if (tmp.decorationColor && tex.decoration) {
  //           tex.decoration.color = tmp.decorationColor as ResourceColor;
  //         }
  //         if (tex.decoration) {
  //           tex.decoration = { type: tex.decoration.type, color: tex.decoration.color }
  //         }
  //       }
  //       if (element && element.plainText && element.mimeType === pasteboard.MIMETYPE_TEXT_PLAIN &&
  //       this.controller) {
  //         this.controller!.addTextSpan(element.plainText,
  //           {
  //             style: tex,
  //             offset: start + moveOffset
  //           }
  //         )
  //         moveOffset += element.plainText.length
  //       }
  //     }
  //     if (this.controller) {
  //       this.controller!.setCaretOffset(start + moveOffset)
  //       this.controller!.closeSelectionMenu()
  //     }
  //     if (start != end && this.controller) {
  //       this.controller!.deleteSpans({ start: start + moveOffset, end: end + moveOffset })
  //     }
  //   })
  // }

  // @Builder
  // panel() {
  //   Column() {
  //     // this.iconPanel()
  //     if (!this.sliderShow) {
  //       // this.SystemMenu()
  //     } else {
  //       // this.sliderPanel()
  //     }
  //   }.width(256)
  // }
  //
  // @Builder iconPanel() {
  //   Column() {
  //     Row({ space: 2 } as RowOptions) {
  //       ForEach(this.iconArr, (item:Resource, index ?: number) => {
  //         Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
  //           Image(item).fillColor(this.theme.imageFillColor).width(24).height(24).focusable(true).draggable(false)
  //         }
  //         .borderRadius(this.theme.iconBorderRadius)
  //         .width(this.theme.buttonSize)
  //         .height(this.theme.buttonSize)
  //         .onClick((e: ClickEvent) => {
  //           if (index as number == 0) {
  //             this.sliderShow = false
  //             if (this.controller) {
  //               let selection = this.controller!.getSelection()!;
  //               let spans = selection.spans
  //               spans!.forEach((item: RichEditorTextSpanResult | RichEditorImageSpanResult, index) => {
  //                 if (typeof (item as RichEditorTextSpanResult)?.textStyle != 'undefined') {
  //                   let span = item as RichEditorTextSpanResult
  //                   this.textStyle = span.textStyle
  //                   let start = span.offsetInSpan[0]
  //                   let end = span.offsetInSpan[1]
  //                   let offset = span.spanPosition.spanRange[0]
  //                   if (this.textStyle.fontWeight != 11) {
  //                     this.textStyle.fontWeight = FontWeight.Bolder
  //                   } else {
  //                     this.textStyle.fontWeight = FontWeight.Normal
  //                   }
  //                   this.controller!.updateSpanStyle({
  //                     start: offset + start,
  //                     end: offset + end,
  //                     textStyle: this.textStyle
  //                   } as RichEditorUpdateTextSpanStyleOptions)
  //                 }
  //               })
  //             }
  //           } else if (index as number == 1) {
  //             this.sliderShow = false
  //             if (this.controller) {
  //               let selection = this.controller.getSelection();
  //               let spans = selection.spans
  //               spans!.forEach((item: RichEditorTextSpanResult | RichEditorImageSpanResult, index) => {
  //                 if (typeof (item as RichEditorTextSpanResult)?.textStyle != 'undefined') {
  //                   let span = item as RichEditorTextSpanResult
  //                   this.textStyle = span.textStyle
  //                   let start = span.offsetInSpan[0]
  //                   let end = span.offsetInSpan[1]
  //                   let offset = span.spanPosition.spanRange[0]
  //                   if (this.textStyle.fontStyle == FontStyle.Italic) {
  //                     this.textStyle.fontStyle = FontStyle.Normal
  //                   } else {
  //                     this.textStyle.fontStyle = FontStyle.Italic
  //                   }
  //                   this.controller.updateSpanStyle({
  //                     start: offset + start,
  //                     end: offset + end,
  //                     textStyle: this.textStyle
  //                   } as RichEditorUpdateTextSpanStyleOptions)
  //                 }
  //               })
  //             }
  //           } else if (index as number == 2) {
  //             this.sliderShow = false
  //             if (this.controller) {
  //               let selection = this.controller.getSelection();
  //               let spans = selection.spans
  //               spans!.forEach((item: RichEditorTextSpanResult | RichEditorImageSpanResult, index) => {
  //                 if (typeof (item as RichEditorTextSpanResult)?.textStyle != 'undefined') {
  //                   let span = item as RichEditorTextSpanResult
  //                   this.textStyle = span.textStyle
  //                   let start = span.offsetInSpan[0]
  //                   let end = span.offsetInSpan[1]
  //                   let offset = span.spanPosition.spanRange[0]
  //                   if (this.textStyle.decoration) {
  //                     if (this.textStyle.decoration.type == TextDecorationType.Underline) {
  //                       this.textStyle.decoration.type = TextDecorationType.None
  //                     } else {
  //                       this.textStyle.decoration.type = TextDecorationType.Underline
  //                     }
  //                   } else {
  //                     this.textStyle.decoration = { type: TextDecorationType.Underline, color: Color.Black }
  //                   }
  //                   this.controller.updateSpanStyle({
  //                     start: offset + start,
  //                     end: offset + end,
  //                     textStyle: this.textStyle
  //                   } as RichEditorUpdateTextSpanStyleOptions)
  //                 }
  //               })
  //             }
  //           } else if (index as number == 3) {
  //             this.sliderShow = !this.sliderShow
  //           } else if (index as number == 4) {
  //             this.sliderShow = false
  //             if (this.controller) {
  //               let selection = this.controller.getSelection();
  //               let spans = selection.spans
  //               spans!.forEach((item: RichEditorTextSpanResult | RichEditorImageSpanResult, index) => {
  //                 if (typeof (item as RichEditorTextSpanResult)?.textStyle != 'undefined') {
  //                   let span = item as RichEditorTextSpanResult
  //                   this.textStyle = span.textStyle
  //                   let start = span.offsetInSpan[0]
  //                   let end = span.offsetInSpan[1]
  //                   let offset = span.spanPosition.spanRange[0]
  //                   if (this.textStyle.fontColor == Color.Orange || this.textStyle.fontColor == '#FFFFA500') {
  //                     this.textStyle.fontColor = Color.Black
  //                   } else {
  //                     this.textStyle.fontColor = Color.Orange
  //                   }
  //                   this.controller.updateSpanStyle({
  //                     start: offset + start,
  //                     end: offset + end,
  //                     textStyle: this.textStyle
  //                   } as RichEditorUpdateTextSpanStyleOptions)
  //                 }
  //               })
  //             }
  //           }
  //         })
  //         .onTouch((event?: TouchEvent | undefined) => {
  //           if(event != undefined){
  //             if (event.type === TouchType.Down) {
  //               this.iconBgColor[index as number] = $r('sys.color.ohos_id_color_click_effect')
  //             }
  //             if (event.type === TouchType.Up) {
  //               this.iconBgColor[index as number] = this.colorTransparent
  //             }
  //           }
  //         })
  //         .onHover((isHover?: boolean, event?: HoverEvent) => {
  //           this.iconBgColor!.forEach((icon:ResourceColor, index1) => {
  //             this.iconBgColor[index1] = this.colorTransparent
  //           })
  //           if(isHover != undefined) {
  //             this.iconBgColor[index as number] = $r('sys.color.ohos_id_color_hover')
  //           }
  //         })
  //         .backgroundColor(this.iconBgColor[index as number])
  //       })
  //     }
  //   }
  //   .clip(true)
  //   .width(this.theme.defaultMenuWidth)
  //   .padding(this.theme.expandedOptionPadding)
  //   .borderRadius(this.theme.containerBorderRadius)
  //   .margin({ bottom: this.theme.menuSpacing } as Margin)
  //   .backgroundColor(this.theme.backGroundColor)
  //   .shadow(this.theme.iconPanelShadowStyle)
  // }
  //
  // @Builder
  // SystemMenu() {
  //   Column() {
  //     Menu() {
  //       if (this.controller) {
  //         MenuItemGroup() {
  //           MenuItem({ startIcon: this.theme.cutIcon, content: '剪切', labelInfo: 'Ctrl+X' })
  //             .onClick((e: ClickEvent) => {
  //               if (!this.controller) {
  //                 return
  //               }
  //               let richEditorSelection = this.controller.getSelection()
  //               this.PushDataToPasteboard(richEditorSelection);
  //               this.controller.deleteSpans({
  //                 start: richEditorSelection.selection[0],
  //                 end: richEditorSelection.selection[1]
  //               })
  //             })
  //           MenuItem({ startIcon: this.theme.copyIcon, content: '复制', labelInfo: 'Ctrl+C' })
  //             .onClick((e: ClickEvent) => {
  //               if (!this.controller) {
  //                 return
  //               }
  //               let richEditorSelection = this.controller.getSelection()
  //               this.PushDataToPasteboard(richEditorSelection);
  //               this.controller.closeSelectionMenu()
  //             })
  //           MenuItem({ startIcon: this.theme.pasteIcon, content: '粘贴', labelInfo: 'Ctrl+V' })
  //             .enabled(this.pasteEnable)
  //             .onClick((e: ClickEvent) => {
  //               if (!this.controller) {
  //                 return
  //               }
  //               let richEditorSelection = this.controller.getSelection()
  //               this.PopDataFromPasteboard(richEditorSelection)
  //             })
  //           MenuItem({ startIcon: this.theme.selectAllIcon, content: '全选', labelInfo: 'Ctrl+A' })
  //             .visibility(this.visibilityValue)
  //             .onClick((e: ClickEvent) => {
  //               if (!this.controller) {
  //                 return
  //               }
  //               this.controller.setSelection(-1, -1)
  //               this.visibilityValue = Visibility.None
  //             })
  //           MenuItem({ startIcon: this.theme.shareIcon, content: '分享', labelInfo: '' })
  //             .enabled(false)
  //           MenuItem({ startIcon: this.theme.translateIcon, content: '翻译', labelInfo: '' })
  //             .enabled(false)
  //           MenuItem({ startIcon: this.theme.searchIcon, content: '搜索', labelInfo: '' })
  //             .enabled(false)
  //         }
  //       }
  //     }
  //     .onVisibleAreaChange([0.0, 1.0], () => {
  //       if (!this.controller) {
  //         return
  //       }
  //       let richEditorSelection = this.controller.getSelection()
  //       let start = richEditorSelection.selection[0]
  //       let end = richEditorSelection.selection[1]
  //       if (start === 0 && this.controller!.getSpans({ start: end + 1, end: end + 1 }).length === 0) {
  //         this.visibilityValue = Visibility.None
  //       } else {
  //         this.visibilityValue = Visibility.Visible
  //       }
  //     })
  //     .radius(this.theme.containerBorderRadius)
  //     .clip(true)
  //     .backgroundColor(Color.White)
  //     .width(this.theme.defaultMenuWidth)
  //   }
  //   .width(this.theme.defaultMenuWidth)
  // }
  //
  // @Builder sliderPanel() {
  //   Column() {
  //     Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
  //       Text('A').fontSize(15)
  //       Slider({ value: this.textSize, step: 10, style: SliderStyle.InSet })
  //         .width(210)
  //         .onChange((value: number, mode: SliderChangeMode) => {
  //           if (this.controller) {
  //             let selection = this.controller.getSelection();
  //             if (mode == SliderChangeMode.End) {
  //               if (this.textSize == undefined) {
  //                 this.textSize = 0
  //               }
  //               let spans = selection.spans
  //               spans!.forEach((item: RichEditorTextSpanResult | RichEditorImageSpanResult, index) => {
  //                 if (typeof (item as RichEditorTextSpanResult)?.textStyle != 'undefined') {
  //                   this.textSize = Math.max(this.textSize, (item as RichEditorTextSpanResult).textStyle.fontSize)
  //                 }
  //               })
  //             }
  //             if (mode == SliderChangeMode.Moving || mode == SliderChangeMode.Click) {
  //               this.start = selection.selection[0]
  //               this.end = selection.selection[1]
  //               this.textSize = value
  //               this.controller.updateSpanStyle({
  //                 start: this.start,
  //                 end: this.end,
  //                 textStyle: { fontSize: this.textSize }
  //               } as RichEditorUpdateTextSpanStyleOptions)
  //             }
  //           }
  //         })
  //       Text('A').fontSize(20).fontWeight(FontWeight.Medium)
  //     }.borderRadius(this.theme.containerBorderRadius)
  //   }
  //   .shadow(ShadowStyle.OUTER_DEFAULT_MD)
  //   .backgroundColor(Color.White)
  //   .borderRadius(this.theme.containerBorderRadius)
  //   .padding(15)
  //   .height(48)
  // }
}