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
struct styled_string_StyleString {
  fontStyleAttr1: TextStyle = new TextStyle({ fontColor: Color.Blue });
  clickGestureAttr: GestureStyle = new GestureStyle({
    onClick: () => {
      promptAction.showToast({ message: 'clickGestureAttr object trigger click event' })
      this.backgroundColor1 = Color.Yellow
    }
  })
  mutableStyledString2: MutableStyledString = new MutableStyledString("test hello world",
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
    }
    ]);
  @State fontColor1: ResourceColor = Color.Red;
  controller: TextController = new TextController();
  options: TextOptions = { controller: this.controller };
  controller2: TextController = new TextController();
  @State backgroundColor1: ResourceColor | undefined = undefined;
  @State styledKey1: StyledStringKey = StyledStringKey.DECORATION
  @State styledKey2: StyledStringKey = StyledStringKey.DECORATION
  @State styledKey3: StyledStringKey = StyledStringKey.DECORATION
  @State styledKey4: StyledStringKey = StyledStringKey.DECORATION
  @State styledKey5: StyledStringKey = StyledStringKey.DECORATION

  async onPageShow() {
    this.controller2.setStyledString(this.mutableStyledString2)
  }

  build() {
    Column() {
      Column({ space: 10 }) {
        // 显示配了字体各种样式的属性字符串，Text组件亦配置冲突部分生效属性字符串配置，未冲突区间生效Text组件属性设置值
        Text(this.styledKey1 + '').fontSize(12).id('gestureId')
        Text(this.styledKey2 + '').fontSize(12).id('decorationId')
        Text(this.styledKey3 + '').fontSize(12).id('textShadowId')
        Text(this.styledKey4 + '').fontSize(12).id('baselineOffsetId')
        Text(this.styledKey5 + '').fontSize(12).id('letterSpacingId')
        Text(undefined, this.options)
          .fontColor(this.fontColor1)
          .font({ size: 20, weight: 500, style: FontStyle.Normal })
        // 显示配置了文本阴影、划线、字符间距、基线偏移量的属性字符串，Text组件亦配置生效属性字符串配置
        Text(undefined, { controller: this.controller2 })
          .fontSize(30)
          .copyOption(CopyOptions.InApp)
          .draggable(true)
          .decoration({ type: TextDecorationType.Overline, color: Color.Pink })
          .textShadow({
            radius: 10,
            type: ShadowType.COLOR,
            color: Color.Green,
            offsetX: -10,
            offsetY: 10
          })

        Button('查询其他文本样式').id('searchStyle')
          .onClick(() => {
            let styles = this.mutableStyledString2.getStyles(0, this.mutableStyledString2.length)
            this.styledKey1 = styles[0].styledKey
            this.styledKey2 = styles[1].styledKey
            this.styledKey3 = styles[2].styledKey
            this.styledKey4 = styles[3].styledKey
            this.styledKey5 = styles[4].styledKey
          })
          .margin({ top: 10 })


      }.width('100%')

    }
  }
}