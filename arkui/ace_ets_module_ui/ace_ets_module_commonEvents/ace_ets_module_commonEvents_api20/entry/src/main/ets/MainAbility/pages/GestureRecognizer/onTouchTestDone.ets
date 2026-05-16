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

@Entry
@Component
struct TouchTest {
  @State tagList: string[] = ['Null', 'Tap1', 'Tap2', 'Tap3', 'Tap4'];
  @State tagId: number = 0;
  @State textValue: string = '';

  build() {
    Column() {
      Column() {
        Text('Tap1')
          .height('5%')
        Column() {
          Text('Tap2')
            .height('5%')
          Column() {
            Text('Tap3')
              .height('5%')
            Column() {
              Text('Tap4')
                .height('5%')
            }
            .id('tap4')
            .backgroundColor('#D5D5D5')
            .width('80%')
            .height('80%')
            .gesture(TapGesture().tag('Tap4').onAction(() => {
              this.textValue = 'Tap4';
            }))
          }
          .id('tap3')
          .backgroundColor('#F7F7F7')
          .width('80%')
          .height('80%')
          .gesture(TapGesture().tag('Tap3').onAction(() => {
            this.textValue = 'Tap3';
          }))
        }
        .id('tap2')
        .backgroundColor('#707070')
        .width('80%')
        .height('80%')
        .gesture(TapGesture().tag('Tap2').onAction(() => {
          this.textValue = 'Tap2';
        }))
      }
      .id('tap1')
      .backgroundColor('#D5D5D5')
      .width('80%')
      .height('70%')
      .gesture(TapGesture().tag('Tap1').onAction(() => {
        this.textValue = 'Tap1';
      }))
      .onTouchTestDone((event, recognizers) => {
        console.info('event is ' + JSON.stringify(event));
        for (let i = 0; i < recognizers.length; i++) {
          let recognizer = recognizers[i];
          console.info('type is ' + JSON.stringify(recognizer.getType()))
          if (recognizer.getTag() == this.tagList[this.tagId]) {
            recognizer.preventBegin();
          }
        }
      })

      Text('Current Gesture: ' + this.textValue)
        .id('text')
        .height('5%')

      Button('Click to change preventGesture')
        .id('button')
        .height('5%')
        .onClick(() => {
          this.tagId++;
          this.tagId %= 5;
        })
      Text('Current prevent gesture tag: ' + this.tagList[this.tagId])
        .id('currentTag')
        .width('70%')
        .height('5%')

    }
    .width('100%')
    .height('100%')

  }
}