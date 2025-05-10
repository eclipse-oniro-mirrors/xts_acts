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

//005 测试：ForEach组件 itemGenerator包含if/else渲染
@Entry
@Component
struct Foreach005 {
  @State simpleList: Array<number> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  build() {
    Column() {
      List({ initialIndex: 3 }) {
        ForEach(this.simpleList, (item: number, index: number) => {
          if (index % 2 === 0) {
            ListItem() {
              Text('even numbers' + `${index}${item}`).id('even_numbers' + `${index}`)
                .fontSize(9)
            }
          } else {
            ListItem() {
              Text('odd numbers' + `${index}${item}`).id('odd_numbers' + `${index}`)
                .fontSize(9)
            }
          }
        })
      };
    }
  }
}