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
struct TextInputXtsTest {
  @State changeValue: string = 'TextInput 组件测试'
  private scroller: Scroller = new Scroller()

  build(){
    Scroll(this.scroller) {
      Column() {
        Text('TextInput 组件测试 baselineOffset 属性值').fontColor('#006000').fontSize(16).width('90%').padding(20)
        TextInput({ text: this.changeValue })
          .key('key_textinput_textIndent')
          .textIndent(`${5}vp`)
          .textOverflow(TextOverflow.Clip)
          .width('100%')
          .height(40)
          .margin(20)
          .border({ width: 1 })
          .borderRadius(0)

        TextInput({ text: this.changeValue })
          .textIndent(`${5}vp`)
          .key('key_textinput_textOverflow')
          .textOverflow(TextOverflow.Clip)
          .width('100%')
          .height(40)
          .margin(20)
          .border({ width: 1 })
          .borderRadius(0)

        TextInput({ text: this.changeValue })
          .key('key_textinput_caretStyle')
          .caretStyle({width: 5, color:'#F5F5F5F5'})
          .textIndent(`${5}vp`)
          .textOverflow(TextOverflow.Clip)
          .width('100%')
          .height(40)
          .margin(20)
          .border({ width: 1 })
          .borderRadius(0)
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
