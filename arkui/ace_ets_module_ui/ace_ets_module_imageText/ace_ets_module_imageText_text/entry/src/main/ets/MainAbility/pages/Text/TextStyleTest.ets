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
struct Text_ellipsisMode {
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
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .selection(0,1)
        .ellipsisMode(EllipsisMode.START)
        .height('5%')
      Text(this.text1)
        .fontSize(10)
        .copyOption(CopyOptions.InApp)
        .selection(this.start, this.end)
        .height('15%')
	.margin({top:50})
      Button('Set text selection')
        .onClick(() => {
          // 变更文本选中起始点、终点
          this.start = 10
          this.end = 30
        }).id('buttonSelect')
        .height('5%')
      Row(){
        Text(''+this.start).fontSize(12).margin(0).key('selectionStart').width('40%')
        Text(''+this.end).fontSize(12).margin(0).key('selectionEnd').width('40%')
      }.height('5%')
    }.height('100%')


  }

}