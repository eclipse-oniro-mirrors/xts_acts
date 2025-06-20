/**
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
import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct UnmarshallingErrorCode401 {
  @State textTitle: string = '序列化和反序列化接口'
  @State textResult: string = 'Hello world'
  @State serializeStr: string = '序列化'
  @State flag: boolean = false
  private textAreaController: TextAreaController = new TextAreaController()
  private buff: Uint8Array = new Uint8Array()

  fontStyle: TextStyle = new TextStyle({
    fontWeight: FontWeight.Lighter,
    fontFamily: 'HarmonyOS Sans',
    fontColor: Color.Green,
    fontSize: LengthMetrics.vp(30),
    fontStyle: FontStyle.Normal
  })
  // 创建属性字符串对象
  styledString: StyledString = new StyledString('Hello world',
    [{ start: 0, length: 11, styledKey: StyledStringKey.FONT, styledValue: this.fontStyle }]);

  @Builder
  controllableBuild() {
    Column(){
      TextArea({
        text: this.textResult,
        controller: this.textAreaController
      }).width('90%').height('20%')
        .id('Unmarshalling_GetCode401')
        .enableKeyboardOnFocus(false)

      Button(this.serializeStr)
        .id('Unmarshalling_button')
        .width('90%').height('5%').margin(1)
        .onClick(async ()=>{
          this.flag = !this.flag
          if (!this.flag) {
            console.info('Debug: 反序列化')
            try{
              let styles: StyledString = await StyledString.unmarshalling(undefined)
              if (styles == undefined) {
                console.error('Debug: styledString 获取失败！！！')
                return
              }
              this.textTitle = '调取decodeTlv接口后，反序列化的结果显示：'
              this.textResult =  styles.getString()
              console.info('Debug: this.textResult = ' + this.textResult)
              let stylesArr = styles.getStyles(0, this.textResult.length, StyledStringKey.FONT)
              console.info('Debug: stylesArr.length = ' + stylesArr.length)
              for (let i = 0; i < stylesArr.length; ++i) {
                console.info('Debug: style.start = ' + stylesArr[i].start)
                console.info('Debug: style.length = ' + stylesArr[i].length)
                console.info('Debug: style.styledKey = ' + stylesArr[i].styledKey)
                let font = stylesArr[i].styledValue as TextStyle
                console.info('Debug: style.fontColor = ' + font.fontColor)
                console.info('Debug: style.fontSize = ' + font.fontSize)
                console.info('Debug: style.fontFamily = ' + font.fontFamily)
                console.info('Debug: style.fontStyle = ' + font.fontStyle)
              }
              let subStr = styles.subStyledString(0, 2)
              console.info('Debug: subStr = ' + subStr.getString())
              this.serializeStr = '序列化'
              console.info('Succeeded unmarshalling.');
            } catch(err) {
              this.textResult = err.code
              console.info('Get error code: %{public}s', JSON.stringify(err.code));
            }
          } else {
            console.info('Debug: 序列化')
            let resultBuffer = StyledString.marshalling(this.styledString)
            this.buff = new Uint8Array(resultBuffer)
            this.textTitle = '调取encodeTlv接口后，序列化的结果显示：'
            this.textResult = this.buff.toString()
            console.info('Debug: buff = ' + this.buff.toString())
            this.serializeStr = '反序列化'
          }
        })
    }.margin(1)
  }

  build() {
    Column() {
      Text(this.textTitle).height('5%')
      this.controllableBuild()
    }
  }
}