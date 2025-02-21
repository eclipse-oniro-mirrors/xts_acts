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


@Entry
@Component
struct buttonExample {
  @State message: string = 'Hello World'
  @State text: string = '3145897936@QQ.COM'
  @State onCopy: string = ''
  @State text1: string = 'This is set selection to Selection text content This is set selection to Selection text content.111111'
  @State start: number = 0
  @State end: number = 20

  @Builder
  build() {
    Column({space:5}) {
      Text('TextDataDetectorType.EMAIL')
        .id('TextKeyAllNUMBER8898888888')
        .textAlign(TextAlign.End)
        .fontSize(12)
        .border({width:1})
        .padding(10)
        .width('100%')
        .copyOption(CopyOptions.InApp)
        .enableDataDetector(true)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .selection(0,1)
        .ellipsisMode(EllipsisMode.START)


      Button('OK')
        .id('buttonStyle')
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(90)
        .onClick(() => {
          console.log('ButtonType.Normal')
        })
        .buttonStyle(ButtonStyleMode.EMPHASIZED)
        .onClick(() => {
          console.log('TextKeyAllNUMBER8898888888' + JSON.stringify(JSON.parse(getInspectorByKey('TextKeyAllNUMBER8898888888')).$attrs))


        })


      Search({placeholder: 'Type to Search'})
        .searchButton('SEARCH')
        .width('90%')
        .height(40)
        .id('searchType777777')
        .backgroundColor('#F5F5F5')
        .placeholderColor(Color.Grey)
        .placeholderFont({size: 14,weight: 400})
        .type(SearchType.PHONE_NUMBER)

      Search({placeholder: 'Type 23222'})
        .searchButton('SEARCH')
        .width('90%')
        .height(40)
        .id('searchEMAIL66666666')
        .backgroundColor('#F5F5F5')
        .placeholderColor(Color.Grey)
        .placeholderFont({size: 14,weight: 400})
        .type(SearchType.EMAIL)




      TextArea({
        text: this.text,
        placeholder: 'The text area can hold an unlimited amount of text. input your word...',
      })
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .height(36)
        .fontSize(16)
        .id('TextAreaTypeEMAIL333333333')
        .fontColor('#182431')
        .backgroundColor('#FFFFFF')
        .type(TextAreaType.EMAIL)



      TextArea({
        placeholder: 'The text area can hold an unlimited amount of text. input your word...',
      })
        .placeholderFont({ size: 16, weight: 400 })
        .width(236)
        .height(36)
        .fontSize(16)
        .fontColor('#182431')
        .backgroundColor('#FFFFFF')
        .id('TextAreaTypeNUMBER44444444')
        .type(TextAreaType.PHONE_NUMBER)






      Text(this.text1)
        .fontSize(12)
        .border({ width: 1 })
        .lineHeight(20)
        .margin(30)
        .copyOption(CopyOptions.InApp)
        .selection(this.start, this.end)

      Button('Set text selection')
        .margin({left:20})
        .onClick(() => {
          // 变更文本选中起始点、终点
          this.start = 10
          this.end = 30
        }).id('buttonSelect')

      Text(''+this.start).fontSize(12).margin(10).key('selectionStart')
      Text(''+this.end).fontSize(12).margin(10).key('selectionEnd')



  }
}

}
