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
import events_emitter from '@ohos.events.emitter'

@Entry
@Component
struct TextAreaXtsTest {
  @State changeValue: string = 'TextArea组件测试'
  controller: TextAreaController = new TextAreaController()
  private scroller: Scroller = new Scroller()

  build(){
    Scroll(this.scroller) {
      Column() {
        Text('TextArea 组件测试 baselineOffset 属性值').fontColor('#006000').fontSize(16).width('90%').padding(20)
        TextArea({
          text: this.changeValue,
          placeholder: 'The text area can hold an unlimited amount of text. input your word...',
          controller: this.controller
        })
          .key('key_textarea_selectedBackgroundColor')
          .selectedBackgroundColor('#F5F5F5F5')
          .textIndent(`${5}vp`)
          .textOverflow(TextOverflow.Clip)
          .caretStyle({width: 5})
          .placeholderFont({ size: 16, weight: 400 })
          .width('100%')
          .height(56)
          .margin(20)
          .fontSize(16)
          .fontColor('#182431')
          .maxLength(200)
          .showCounter(true)
          .border({ width: 1 })
          .backgroundColor('#FFFFFF')

        TextArea({
          text: this.changeValue,
          placeholder: 'The text area can hold an unlimited amount of text. input your word...',
          controller: this.controller
        })
          .selectedBackgroundColor('#F5F5F5F5')
          .textIndent(`${5}vp`)
          .textOverflow(TextOverflow.Clip)
          .key('key_textarea_caretStyle')
          .caretStyle({width: 5, color:'#F5F5F5F5'})
          .placeholderFont({ size: 16, weight: 400 })
          .width('100%')
          .height(56)
          .margin(20)
          .fontSize(16)
          .fontColor('#182431')
          .maxLength(200)
          .showCounter(true)
          .border({ width: 1 })
          .backgroundColor('#FFFFFF')

        TextArea({
          text: this.changeValue,
          placeholder: 'The text area can hold an unlimited amount of text. input your word...',
          controller: this.controller
        })
          .selectedBackgroundColor(Color.Blue)
          .key('key_textarea_textIndent')
          .textIndent(`${5}vp`)
          .textOverflow(TextOverflow.Clip)
          .caretStyle({width: 5})
          .placeholderFont({ size: 16, weight: 400 })
          .width('100%')
          .height(56)
          .margin(20)
          .fontSize(16)
          .fontColor('#182431')
          .maxLength(200)
          .showCounter(true)
          .border({ width: 1 })
          .backgroundColor('#FFFFFF')

        TextArea({
          text: this.changeValue,
          placeholder: 'The text area can hold an unlimited amount of text. input your word...',
          controller: this.controller
        })
          .selectedBackgroundColor(Color.Blue)
          .textIndent(`${5}vp`)
          .key('key_textarea_textOverflow')
          .textOverflow(TextOverflow.Clip)
          .caretStyle({width: 5})
          .placeholderFont({ size: 16, weight: 400 })
          .width('100%')
          .height(56)
          .margin(20)
          .fontSize(16)
          .fontColor('#182431')
          .maxLength(200)
          .showCounter(true)
          .border({ width: 1 })
          .backgroundColor('#FFFFFF')
      }
      .width('100%')
      .padding({ top: 5 })
    }
    .scrollable(ScrollDirection.Vertical) // 滚动方向纵向
    .scrollBar(BarState.On) // 滚动条常驻显示
    .scrollBarColor(Color.Gray) // 滚动条颜色
    .scrollBarWidth(10) // 滚动条宽度
    .friction(0.6)
    .edgeEffect(EdgeEffect.Fade)
  }
}
