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

//003 测试：ForEach组件 数组类型为数字
@Entry
@Component
struct Foreach003 {
  @State simpleList: Array<number> = [1, 2, 3, 4, 5];

  build() {
    Column() {
      Text('初始化数据')
        .id('init_for_each')
        .fontSize(9)
        .fontColor(Color.Red)
        .onClick(() => {
          this.simpleList = [1, 2, 3, 4, 5];
        })

      Button('点击添加值').id('for_each_1')
        .fontSize(9)
        .onClick(() => {
          this.simpleList.push(100);
        })

      Button('交换数组项1，2').id('for_each_2')
        .fontSize(9)
        .onClick(() => {
          let temp: number = this.simpleList[2]
          this.simpleList[2] = this.simpleList[1]
          this.simpleList[1] = temp
        })

      Button('点击删除第3个数组项的值').id('for_each_3')
        .fontSize(9)
        .onClick(() => {
          this.simpleList.splice(2, 1);
        })
      List({ initialIndex: 3 }) {
        ForEach(this.simpleList, (item: number, index: number) => {
          ListItem() {
            Text(`${index} ${item}`).id('foreach' + index)
              .fontSize(9)
          }
        })
      };
    }
  }
}