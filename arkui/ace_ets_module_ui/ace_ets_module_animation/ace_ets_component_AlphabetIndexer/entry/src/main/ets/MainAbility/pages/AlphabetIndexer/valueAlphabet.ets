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
struct AlphabetIndexerValueIndex {
  private arrayA: string[] = ['安']
  private arrayB: string[] = ['卜', '白', '包']
  private arrayC: string[] = ['曹', '成', '陈', '催']
  private arrayL: string[] = ['刘', '李', '梁']
  private value: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']
  @State num:number = 0
  @State t:string = '0'

  build() {
    Stack({ alignContent: Alignment.Start }) {
      Row() {
        List({ space: 20, initialIndex: 0 }) {
          ForEach(this.arrayA, (item: string) => {
            ListItem() {
              Text(item)
                .width('80%')
                .height('5%')
                .fontSize(30)
                .textAlign(TextAlign.Center)
            }
          }, (item: string) => item)

          ForEach(this.arrayB, (item: string) => {
            ListItem() {
              Text(item)
                .width('80%')
                .height('5%')
                .fontSize(30)
                .textAlign(TextAlign.Center)
            }
          }, (item: string) => item)

          ForEach(this.arrayC, (item: string) => {
            ListItem() {
              Text(item)
                .width('80%')
                .height('5%')
                .fontSize(30)
                .textAlign(TextAlign.Center)
            }
          }, (item: string) => item)

          ForEach(this.arrayL, (item: string) => {
            ListItem() {
              Text(item)
                .width('80%')
                .height('5%')
                .fontSize(30)
                .textAlign(TextAlign.Center)
            }
          }, (item: string) => item)
        }
        .width('50%')
        .height('100%')

        Column(){
          Column() {
            Text('index: '+this.num + ', ' + this.t)
              .id('alp_value_index')
          }.height('10%')
          AlphabetIndexer({ arrayValue: this.value, selected: -2 })
            .key('alp_outliers_value')
            .usingPopup(true) // 是否显示弹出框
            .itemSize(28) // 每一项的尺寸大小
            .alignStyle(IndexerAlign.Left) // 弹出框在索引条右侧弹出
            .itemBorderRadius(-10)
            .onSelect((index: number) => {
              console.info(this.value[index] + ' Selected!')
              this.num = index
              this.t = this.value[index]
            })
            .onRequestPopupData((index: number) => {
              if (this.value[index] == 'A') {
                return this.arrayA
              } else if (this.value[index] == 'B') {
                return this.arrayB
              } else if (this.value[index] == 'C') {
                return this.arrayC
              } else if (this.value[index] == 'L') {
                return this.arrayL
              } else {
                return [] // 选中其余子母项时，提示文本列表为空
              }
            })
            .onPopupSelect((index: number) => {
              console.info('onPopupSelected:' + index)
            })
        }
        .height('80%')
        .justifyContent(FlexAlign.Center)

      }
    }
    .width('100%')
    .height('100%')
  }
}