/*
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
struct StackChildAlignment {

  private stackAlignArr: Alignment[] = [
    Alignment.TopStart, Alignment.Top, Alignment.TopEnd,
    Alignment.Start, Alignment.Center, Alignment.End,
    Alignment.BottomStart, Alignment.Bottom, Alignment.BottomEnd];
  @State stackAlignIndex: number = 0;
  private directionArr: Direction[] = [Direction.Ltr, Direction.Rtl, Direction.Auto];
  @State directionIndex: number = 0;

  build() {
    Row(){
      Column(){
        Stack({
          alignContent: this.stackAlignArr[this.stackAlignIndex]
        }) {
          Text('TOP_START').width(60).height(60).fontSize(10).backgroundColor(Color.Yellow).id('AlignmentText1')
            .layoutGravity(LocalizedAlignment.TOP_START)
          Text('TOP').width(60).height(60).fontSize(10).backgroundColor(Color.Yellow).id('AlignmentText2')
            .layoutGravity(LocalizedAlignment.TOP)
          Text('TOP_END').width(60).height(60).fontSize(10).backgroundColor(Color.Yellow).id('AlignmentText3')
            .layoutGravity(LocalizedAlignment.TOP_END)

          Text('START').width(60).height(60).backgroundColor(Color.Yellow).fontSize(10).id('AlignmentText4')
            .layoutGravity(LocalizedAlignment.START)
          Text('CENTER').width(60).height(60).backgroundColor(Color.Yellow).fontSize(10).id('AlignmentText5')
            .layoutGravity(LocalizedAlignment.CENTER)
          Text('END').width(60).height(60).backgroundColor(Color.Yellow).fontSize(10).id('AlignmentText6')
            .layoutGravity(LocalizedAlignment.END)

          Text('BOTTOM_START').width(60).height(60).backgroundColor(Color.Yellow).id('AlignmentText7')
            .layoutGravity(LocalizedAlignment.BOTTOM_START).fontSize(10)
          Text('BOTTOM').width(60).height(60).backgroundColor(Color.Yellow).id('AlignmentText8')
            .layoutGravity(LocalizedAlignment.BOTTOM).fontSize(10)
          Text('BOTTOM_END').width(60).height(60).backgroundColor(Color.Yellow).id('AlignmentText9')
            .layoutGravity(LocalizedAlignment.BOTTOM_END).fontSize(10)
        }.width(190).height(190).backgroundColor(Color.Grey).margin({ top: 5, bottom: 5 })
            .direction(this.directionArr[this.directionIndex])

        Row(){
          Button('stackAlign: ' + this.stackAlignArr[this.stackAlignIndex])
            .width(95)
            .height(25)
            .fontSize(10)
            .onClick(() => {
              this.stackAlignIndex = ++this.stackAlignIndex % this.stackAlignArr.length;
            })
          Button('Direction: ' + this.directionArr[this.directionIndex])
            .width(95)
            .height(25)
            .fontSize(10)
            .onClick(() => {
              this.directionIndex = ++this.directionIndex % this.directionArr.length;
            })

        }

      }
      .width('100%')
    }
    .width('100%')
  }
}
