/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Entry
@Component
struct RepeatParent {
  @State simpleList: Array<string> = ['one', 'two', 'three'];

  build() {
    Row() {
      Column() {
        Text('message: ' + this.simpleList[2]).id('mess_repeat')
          .height('3%')
          .fontSize(9)
        Text('length: ' + this.simpleList.length).id('length_repeat')
          .height('3%')
          .fontSize(9)

        Text('初始化数据')
          .id('init_repeat')
          .height('3%')
          .fontSize(9)
          .fontColor(Color.Red)
          .onClick(() => {
            this.simpleList = ['one', 'two', 'three'];
          })

        Button('点击修改第3个数组项的值')
          .id('repeat_modify')
          .width('10%')
          .height('3%')
          .fontSize(9)
          .onClick(() => {
            this.simpleList[2] = 'new three';
          })

        Button('点击添加值')
          .id('repeat_1')
          .width('10%')
          .height('3%')
          .fontSize(9)
          .onClick(() => {
            this.simpleList.push('five');
          })

        Button('交换数组项1，2')
          .id('repeat_2')
          .width('10%')
          .height('3%')
          .fontSize(9)
          .onClick(() => {
            let temp: string = this.simpleList[2]
            this.simpleList[2] = this.simpleList[1]
            this.simpleList[1] = temp
          })

        Button('点击删除第3个数组项的值')
          .id('repeat_3')
          .width('10%')
          .height('3%')
          .fontSize(9)
          .onClick(() => {
            this.simpleList.splice(2, 1);
          })

        Button('点击添加数据，并删除值')
          .id('repeat_4')
          .width('10%')
          .height('3%')
          .fontSize(9)
          .onClick(() => {
            this.simpleList.splice(1, 1);
            this.simpleList.push('我');
          })

        Button('点击添加两项数据，并删除第二个值')
          .id('repeat_5')
          .width('10%')
          .height('3%')
          .fontSize(9)
          .onClick(() => {
            this.simpleList.splice(1, 1);
            this.simpleList.push('你', '他');
          })

        Repeat<string>(this.simpleList)
          .each((obj: RepeatItem<string>) => {
            ChildItem({ item: obj.item })
          })
          .key((item: string) => item)
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .height('100%')
    }
    .height('100%')
    .backgroundColor(0xF1F3F5)
  }
}

@Component
struct ChildItem {
  @Prop item: string;

  build() {
    Text(this.item)
      .height('3%')
      .fontSize(9)
  }
}
