'use static';
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
import {
  Entry,
  Component,
  Row,
  List,
  ListItem,
  Text,
  Stack,
  Alignment,
  ForEach,
  AlphabetIndexer,
  TextAlign,
  FontWeight,
  IndexerAlign
} from '@ohos.arkui.component'

@Entry
@Component
struct outliersAlphabetIndexer {
  private arrayA: string[] = ['安']
  private arrayB: string[] = ['卜', '白', '包']
  private arrayC: string[] = ['曹', '成', '陈']
  private arrayL: string[] = ['刘', '李', '梁']
  private value: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
    'H', 'I', 'J', 'K', 'L', 'M', 'N']

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

        AlphabetIndexer({ arrayValue: this.value, selected: -1 })
          .key('alphabetIndexer_outliers')
          .autoCollapse(false) // 关闭自适应折叠模式
          .selectedColor('#FFF0FF0') // 选中项文本颜色
          .selectedBackgroundColor('#FF0F000') // 选中项背景颜色
          .usingPopup(true) // 是否显示弹出框
          .selectedFont({ size: '20%', weight: FontWeight.Bolder }) // 选中项字体样式
          .popupFont({ size: '16%', weight: FontWeight.Bolder }) // 弹出框内容的字体样式
          .popupPosition({ x: 'abc', y: 50.0 })
          .itemSize(28) // 每一项的尺寸大小
          .alignStyle(IndexerAlign.Left) // 弹出框在索引条右侧弹出
          .onSelect((index: int): void => {
            console.info(this.value[index.toInt()] + ' Selected!')
          })
          .onRequestPopupData((index: int): string[] => {
            if (this.value[index.toInt()] == 'A') {
              return this.arrayA // 当选中A时，弹出框里面的提示文本列表显示A对应的列表arrayA，选中B、C、L时也同样
            } else if (this.value[index.toInt()] == 'B') {
              return this.arrayB
            } else if (this.value[index.toInt()] == 'C') {
              return this.arrayC
            } else if (this.value[index.toInt()] == 'L') {
              return this.arrayL
            } else {
              return [] as string[] // 选中其余子母项时，提示文本列表为空
            }
          })
          .onPopupSelect((index: int): void => {
            console.info('onPopupSelected:' + index)
          })
      }
      .width('100%')
      .height('100%')
    }
  }
}