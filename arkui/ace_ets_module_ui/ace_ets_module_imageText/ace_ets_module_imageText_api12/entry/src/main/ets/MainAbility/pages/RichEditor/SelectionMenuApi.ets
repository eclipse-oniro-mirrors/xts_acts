/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { SelectionMenu, EditorMenuOptions, ExpandedMenuOptions, EditorEventInfo, SelectionMenuOptions } from '@ohos.arkui.advanced.SelectionMenu'

@Entry
@Component
struct Index {
  @State select: boolean = true
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller }
  @State message: string = 'Hello word'
  @State textSize: number = 30
  @State fontWeight: FontWeight = FontWeight.Normal
  @State start: number = -1
  @State end: number = -1
  @State visibleValue: Visibility = Visibility.Visible
  @State colorTransparent: Color = Color.Transparent
  @State textStyle: RichEditorTextStyle = {}
  private editorMenuOptions: Array<EditorMenuOptions> =
    [
      { icon: $r("app.media.icon"), action: () => {
        if (this.controller) {
          let selection = this.controller.getSelection();
          let spans = selection.spans
          spans.forEach((item: RichEditorTextSpanResult | RichEditorImageSpanResult, index) => {
            if (typeof (item as RichEditorTextSpanResult)['textStyle'] != 'undefined') {
              let span = item as RichEditorTextSpanResult
              this.textStyle = span.textStyle
              let start = span.offsetInSpan[0]
              let end = span.offsetInSpan[1]
              let offset = span.spanPosition.spanRange[0]
              if (this.textStyle.fontWeight != 11) {
                this.textStyle.fontWeight = FontWeight.Bolder
              } else {
                this.textStyle.fontWeight = FontWeight.Normal
              }
              this.controller.updateSpanStyle({
                start: offset + start,
                end: offset + end,
                textStyle: this.textStyle
              })
            }
          })
        }
      } },
      { icon: $r("app.media.icon"), action: () => {
        if (this.controller) {
          let selection = this.controller.getSelection();
          let spans = selection.spans
          spans.forEach((item: RichEditorTextSpanResult | RichEditorImageSpanResult, index) => {
            if (typeof (item as RichEditorTextSpanResult)['textStyle'] != 'undefined') {
              let span = item as RichEditorTextSpanResult
              this.textStyle = span.textStyle
              let start = span.offsetInSpan[0]
              let end = span.offsetInSpan[1]
              let offset = span.spanPosition.spanRange[0]
              if (this.textStyle.fontStyle == FontStyle.Italic) {
                this.textStyle.fontStyle = FontStyle.Normal
              } else {
                this.textStyle.fontStyle = FontStyle.Italic
              }
              this.controller.updateSpanStyle({
                start: offset + start,
                end: offset + end,
                textStyle: this.textStyle
              })
            }
          })
        }
      } },
      { icon: $r("app.media.icon"),
        action: () => {
          if (this.controller) {
            let selection = this.controller.getSelection();
            let spans = selection.spans
            spans.forEach((item: RichEditorTextSpanResult | RichEditorImageSpanResult, index) => {
              if (typeof (item as RichEditorTextSpanResult)['textStyle'] != 'undefined') {
                let span = item as RichEditorTextSpanResult
                this.textStyle = span.textStyle
                let start = span.offsetInSpan[0]
                let end = span.offsetInSpan[1]
                let offset = span.spanPosition.spanRange[0]
                if (this.textStyle.decoration) {
                  if (this.textStyle.decoration.type == TextDecorationType.Underline) {
                    this.textStyle.decoration.type = TextDecorationType.None
                  } else {
                    this.textStyle.decoration.type = TextDecorationType.Underline
                  }
                } else {
                  this.textStyle.decoration = { type: TextDecorationType.Underline, color: Color.Black }
                }
                this.controller.updateSpanStyle({
                  start: offset + start,
                  end: offset + end,
                  textStyle: this.textStyle
                })
              }
            })
          }
        }
      },
      { icon: $r("app.media.icon"), action: () => {
      }, builder: (): void => this.sliderPanel() },
      { icon: $r("app.media.icon"), action: () => {
        if (this.controller) {
          let selection = this.controller.getSelection();
          let spans = selection.spans
          spans.forEach((item: RichEditorTextSpanResult | RichEditorImageSpanResult, index) => {
            if (typeof (item as RichEditorTextSpanResult)['textStyle'] != 'undefined') {
              let span = item as RichEditorTextSpanResult
              this.textStyle = span.textStyle
              let start = span.offsetInSpan[0]
              let end = span.offsetInSpan[1]
              let offset = span.spanPosition.spanRange[0]
              if (this.textStyle.fontColor == Color.Orange || this.textStyle.fontColor == '#FFFFA500') {
                this.textStyle.fontColor = Color.Black
              } else {
                this.textStyle.fontColor = Color.Orange
              }
              this.controller.updateSpanStyle({
                start: offset + start,
                end: offset + end,
                textStyle: this.textStyle
              })
            }
          })
        }
      } }]
  private expandedMenuOptions: Array<ExpandedMenuOptions> =
    [{ startIcon: $r("app.media.icon"), content: '词典', action: () => {
    } }, { startIcon: $r("app.media.icon"), content: '翻译', action: () => {
    } }, { startIcon: $r("app.media.icon"), content: '搜索', action: () => {
    } }]
  private expandedMenuOptions1: Array<ExpandedMenuOptions> = []
  private editorMenuOptions1: Array<EditorMenuOptions> = []
  private selectionMenuOptions: SelectionMenuOptions = {
    editorMenuOptions: this.editorMenuOptions,
    expandedMenuOptions: this.expandedMenuOptions,
    controller: this.controller,
    onCut: (event?: EditorEventInfo) => {
      if (event && event.content) {
        event.content.spans.forEach((item: RichEditorTextSpanResult | RichEditorImageSpanResult, index) => {
          if (typeof (item as RichEditorTextSpanResult)['textStyle'] != 'undefined') {
            let span = item as RichEditorTextSpanResult
            console.info('test cut' + span.value)
            console.info('test start ' + span.offsetInSpan[0] + ' end: ' + span.offsetInSpan[1])
          }
        })
      }
    },
    onPaste: (event?: EditorEventInfo) => {
      if (event && event.content) {
        event.content.spans.forEach((item: RichEditorTextSpanResult | RichEditorImageSpanResult, index) => {
          if (typeof (item as RichEditorTextSpanResult)['textStyle'] != 'undefined') {
            let span = item as RichEditorTextSpanResult
            console.info('test onPaste' + span.value)
            console.info('test start ' + span.offsetInSpan[0] + ' end: ' + span.offsetInSpan[1])
          }
        })
      }
    },
    onCopy: (event?: EditorEventInfo) => {
      if (event && event.content) {
        event.content.spans.forEach((item: RichEditorTextSpanResult | RichEditorImageSpanResult, index) => {
          if (typeof (item as RichEditorTextSpanResult)['textStyle'] != 'undefined') {
            let span = item as RichEditorTextSpanResult
            console.info('test cut' + span.value)
            console.info('test start ' + span.offsetInSpan[0] + ' end: ' + span.offsetInSpan[1])
          }
        })
      }
    },
    onSelectAll: (event?: EditorEventInfo) => {
      if (event && event.content) {
        event.content.spans.forEach((item: RichEditorTextSpanResult | RichEditorImageSpanResult, index) => {
          if (typeof (item as RichEditorTextSpanResult)['textStyle'] != 'undefined') {
            let span = item as RichEditorTextSpanResult
            console.info('test onPaste' + span.value)
            console.info('test start ' + span.offsetInSpan[0] + ' end: ' + span.offsetInSpan[1])
          }
        })
      }
    }
  }

  @Builder sliderPanel() {
    Column() {
      Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
        Text('A').fontSize(15)
        Slider({ value: this.textSize, step: 10, style: SliderStyle.InSet })
          .width(210)
          .onChange((value: number, mode: SliderChangeMode) => {
            if (this.controller) {
              let selection = this.controller.getSelection();
              if (mode == SliderChangeMode.End) {
                if (this.textSize == undefined) {
                  this.textSize = 0
                }
                let spans = selection.spans
                spans.forEach((item: RichEditorTextSpanResult | RichEditorImageSpanResult, index) => {
                  if (typeof (item as RichEditorTextSpanResult)['textStyle'] != 'undefined') {
                    this.textSize = Math.max(this.textSize, (item as RichEditorTextSpanResult).textStyle.fontSize)
                  }
                })
              }
              if (mode == SliderChangeMode.Moving || mode == SliderChangeMode.Click) {
                this.start = selection.selection[0]
                this.end = selection.selection[1]
                this.textSize = value
                this.controller.updateSpanStyle({
                  start: this.start,
                  end: this.end,
                  textStyle: { fontSize: this.textSize }
                })
              }
            }
          })
        Text('A').fontSize(20).fontWeight(FontWeight.Medium)
      }.borderRadius($r('sys.float.ohos_id_corner_radius_card'))
    }
    .shadow(ShadowStyle.OUTER_DEFAULT_MD)
    .backgroundColor(Color.White)
    .borderRadius($r('sys.float.ohos_id_corner_radius_card'))
    .padding(15)
    .height(48)
  }

  @Builder
  MyMenu() {
    Column() {
      SelectionMenu(this.selectionMenuOptions)
    }
    .width(256)
    .backgroundColor(Color.Transparent)
  }

  @Builder
  MyMenu2() {
    Column() {
      SelectionMenu({
        editorMenuOptions: this.editorMenuOptions,
        expandedMenuOptions: this.expandedMenuOptions1,
        controller: this.controller,
      })
    }
    .width(256)
    .backgroundColor(Color.Transparent)
  }

  @Builder
  MyMenu3() {
    Column() {
      SelectionMenu({
        editorMenuOptions: this.editorMenuOptions1,
        expandedMenuOptions: this.expandedMenuOptions,
        controller: this.controller,
      })
    }
    .width(256)
    .backgroundColor(Color.Transparent)
  }

  build() {
    Column() {
      Button("SetSelection")
        .onClick((event: ClickEvent) => {
          if (this.controller) {
            this.controller.setSelection(0, 2)
          }
        })

      RichEditor(this.options)
        .key('SelectionMenuApi')
        .onReady(() => {
          this.controller.addTextSpan(this.message, { style: { fontColor: Color.Orange, fontSize: 30 } })
          this.controller.addTextSpan(this.message, { style: { fontColor: Color.Black, fontSize: 25 } })
        })
        .onSelect((value: RichEditorSelection) => {
          if (value.selection[0] == -1 && value.selection[1] == -1) {
            return
          }
          this.start = value.selection[0]
          this.end = value.selection[1]
        })
        .bindSelectionMenu(RichEditorSpanType.TEXT, this.MyMenu3(), RichEditorResponseType.RIGHT_CLICK)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width(200)
        .height(200)
    }
  }
}