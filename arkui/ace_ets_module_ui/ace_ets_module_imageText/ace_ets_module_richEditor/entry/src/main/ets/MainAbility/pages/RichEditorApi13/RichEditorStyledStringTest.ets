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

import { LengthMetrics, LengthUnit } from '@ohos.arkui.node'
import promptAction from '@ohos.promptAction';

@Entry
@Component
struct RichEditorStyledStringTest {
  fontStyleAttr1: TextStyle = new TextStyle({ fontColor: Color.Blue });
  clickGestureAttr: GestureStyle = new GestureStyle({
    onClick: () => {
      promptAction.showToast({ message: 'clickGestureAttr object trigger click event' })
      this.backgroundColor1 = Color.Yellow
    }
  })
  mutableStyledString2: MutableStyledString = new MutableStyledString('test hello world',
    [{
      start: 0,
      length: 5,
      styledKey: StyledStringKey.GESTURE,
      styledValue: this.clickGestureAttr
    }, {
      start: 0,
      length: 5,
      styledKey: StyledStringKey.DECORATION,
      styledValue: new DecorationStyle({ type: TextDecorationType.LineThrough, color: Color.Blue })
    }, {
      start: 0,
      length: 5,
      styledKey: StyledStringKey.TEXT_SHADOW,
      styledValue: new TextShadowStyle({
        radius: 5,
        type: ShadowType.COLOR,
        color: Color.Yellow,
        offsetX: 10,
        offsetY: -10
      })
    }, {
      start: 6,
      length: 5,
      styledKey: StyledStringKey.BASELINE_OFFSET,
      styledValue: new BaselineOffsetStyle(LengthMetrics.fp(10))
    }, {
      start: 0,
      length: 5,
      styledKey: StyledStringKey.LETTER_SPACING,
      styledValue: new LetterSpacingStyle(new LengthMetrics(10, LengthUnit.VP))
    },
      {
        start: 0,
        length: 5,
        styledKey: StyledStringKey.URL,
        styledValue: new UrlStyle('www.spincast.org')
      }
    ]);
  @State fontColor1: ResourceColor = Color.Red;
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = {controller: this.controller};
  controller2: RichEditorStyledStringController = new RichEditorStyledStringController();
  @State backgroundColor1: ResourceColor | undefined = undefined;
  @State styledKey1: StyledStringKey = StyledStringKey.DECORATION
  @State styledKey2: StyledStringKey = StyledStringKey.DECORATION
  @State styledKey3: StyledStringKey = StyledStringKey.DECORATION
  @State styledKey4: StyledStringKey = StyledStringKey.DECORATION
  @State styledKey5: StyledStringKey = StyledStringKey.DECORATION
  @State styledKey6: StyledStringKey = StyledStringKey.DECORATION

  async onPageShow(){
    this.controller2.setStyledString(this.mutableStyledString2)
  }

  build(){
    Column() {
      Column({ space: 10 }) {
        Row(){
          Text(this.styledKey1 + '').fontSize(12).id('gestureId').width('33%')
          Text(this.styledKey2 + '').fontSize(12).id('decorationId').width('33%')
          Text(this.styledKey3 + '').fontSize(12).id('textShadowId').width('33%')
        }.height('5%')
        Row(){
          Text(this.styledKey4 + '').fontSize(12).id('baselineOffsetId').width('33%')
          Text(this.styledKey5 + '').fontSize(12).id('letterSpacingId').width('33%')
          Text(this.styledKey6 + '').fontSize(12).id('urlId').width('33%')
        }.height('5%')


        RichEditor(this.options).onReady(() => {
          this.controller.setStyledString(this.mutableStyledString2);
        }).padding(0)
          .height('20%')
          .width('100%')
          .borderWidth(1)
          .borderColor(Color.Black)
        Button('SearchOtherTextStyles').id('searchStyle')
          .onClick(() => {
            let styles = this.mutableStyledString2.getStyles(0, this.mutableStyledString2.length)
            this.styledKey1 = styles[0].styledKey
            this.styledKey2 = styles[1].styledKey
            this.styledKey3 = styles[2].styledKey
            this.styledKey4 = styles[3].styledKey
            this.styledKey5 = styles[4].styledKey
            this.styledKey6 = styles[5].styledKey
          })
          .margin({ top: 10 })
      }.width('100%')
    }
  }
}