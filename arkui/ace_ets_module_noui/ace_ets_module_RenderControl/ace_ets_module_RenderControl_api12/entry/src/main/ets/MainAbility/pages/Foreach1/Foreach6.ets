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

//006 测试：if/else条件渲染ForEach组件
@Entry
@Component
struct Foreach006 {
  @State simpleList: Array<number> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @State tmp: number = 0;

  build() {
    Column() {
      Text('初始化数据')
        .id('init_for_each')
        .fontSize(9)
        .fontColor(Color.Red)
        .onClick(() => {
          this.simpleList = [1, 2, 3, 4, 5];
        })
      List({ initialIndex: 3 }) {
        if (this.tmp % 2 === 0) {
          ForEach(this.simpleList, (item: number, index: number) => {
            ListItem() {
              Text('tmp is even number:' + `${index}`).id('foreach' + index)
                .fontSize(9)
            }
          })
        } else {
          ForEach(this.simpleList, (item: number, index: number) => {
            ListItem() {
              Text('tmp is odd number:' + `${index}`).id('foreach' + index)
                .fontSize(9)
            }
          }
          )
        }
      };
      Button('修改IfElse显示').id('for_each_1')
        .fontSize(9)
        .onClick(() => {
          this.tmp = this.tmp + 1
        })
    }
  }
}