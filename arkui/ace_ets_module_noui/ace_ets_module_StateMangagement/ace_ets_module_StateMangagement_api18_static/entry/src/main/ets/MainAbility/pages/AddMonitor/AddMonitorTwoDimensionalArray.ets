'use static'

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
import { UIUtils, Local, Trace, ObservedV2, IMonitor, IMonitorDecoratedVariable, Param } from '@ohos.arkui.stateManagement';
import { ComponentV2, Entry, Column, Row, Button, Scroll, ForEach, Text, Divider, DatePicker, TextAlign, Margin } from '@ohos.arkui.component';
//二维数组
@ObservedV2
class MatrixData {
  @Trace public data: int[][]
  public dataMonitor?: IMonitorDecoratedVariable;
  public data1Monitor?: IMonitorDecoratedVariable;
  public data2Monitor?: IMonitorDecoratedVariable;
  @Trace public text: string = '';
  @Trace public text1: string = '';
  @Trace public text2: string = '';

  constructor(initialData: int[][]) {
    this.data = initialData;
    this.dataMonitor = UIUtils.addMonitor(() => this.data, this.dataChange, { path: ['二维数组'] });
    this.data1Monitor = UIUtils.addMonitor(() => this.data[0], this.data1Change, { path: ['二维数组下的数组'] });
    this.data2Monitor = UIUtils.addMonitor(() => this.data[1][1], this.data2Change,  { path: ['二维数组下的元素'] });
  }
  dataChange(m: IMonitor) {
    m.dirty.forEach((path: string) => {
      console.log(`[addMonitorTest] ${path} value has changed from ${m.value<int[][]>(path)?.before} to ${m.value<int[][]>(path)?.now}`);
      this.text = `[addMonitorTest] ${path} value has changed from ${m.value<int[][]>(path)?.before} to ${m.value<int[][]>(path)?.now}`
    })
  }
  data1Change(m: IMonitor) {
    m.dirty.forEach((path: string) => {
      console.log(`[addMonitorTest] ${path} value has changed from ${m.value<int[]>(path)?.before} to ${m.value<int[]>(path)?.now}`);
      this.text1 = `[addMonitorTest] ${path} value has changed from ${m.value<int[]>(path)?.before} to ${m.value<int[]>(path)?.now}`
    })
  }
  data2Change(m: IMonitor) {
    m.dirty.forEach((path: string) => {
      console.log(`[addMonitorTest] ${path} value has changed from ${m.value<int>(path)?.before} to ${m.value<int>(path)?.now}`);
      this.text2 = `[addMonitorTest] ${path} value has changed from ${m.value<int>(path)?.before} to ${m.value<int>(path)?.now}`
    })
  }
}

@Entry
@ComponentV2
struct Page {
  @Local matrix: MatrixData =  new MatrixData([
    UIUtils.makeObserved([1, 2, 3]),
    UIUtils.makeObserved([4, 5, 6]),
    UIUtils.makeObserved([7, 8, 9])
  ]);

  build() {
    Scroll(undefined) {
      Column(undefined) {
        Text(`${this.matrix.text}`)
          .id('matrixText1')
          .height('5%')
        Text(`${this.matrix.text1}`)
          .id('matrixText2')
          .height('5%')
        Text(`${this.matrix.text2}`)
          .id('matrixText3')
          .height('5%')
        Text(`${this.matrix.data[0]}`)
          .fontSize(20)
          .height('5%')
          .textAlign(TextAlign.Center)
        Text(`${this.matrix.data[1]}`)
          .fontSize(20)
          .height('5%')
          .textAlign(TextAlign.Center)
        Text(`${this.matrix.data[2]}`)
          .fontSize(20)
          .height('5%')
          .textAlign(TextAlign.Center)
        Row(undefined) {
          Button('修改元素1')
            .id('change111')
            .height('5%')
            .onClick(() => {
              this.matrix.data[1][1] = 999;
            })
          Button('修改元素2')
            .id('change222')
            .height('5%')
            .onClick(() => {
              this.matrix.data[1][1] = 888;
            })
          Button(`clear Monitor1`)
            .id('clearArrayMonitor111')
            .height('5%')
            .width('30%')
            .onClick((e) => {
              UIUtils.clearMonitor(this.matrix.data2Monitor!);
              console.info('[addMonitorTest]:clearMonitor success')
            })
        }.margin({ top: 10 } as Margin)
        Row(undefined) {
          Button('修改数组1')
            .id('change11')
            .height('5%')
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.matrix.data[0] = [11,22,33];
            })
          Button('修改数组2')
            .id('change22')
            .height('5%')
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.matrix.data[0] = [111,222,333];
            })
          Button(`clear Monitor2`)
            .id('clearArrayMonitor11')
            .height('5%')
            .width('30%')
            .onClick((e) => {
              UIUtils.clearMonitor(this.matrix.data1Monitor!);
              console.info('[addMonitorTest]:clearMonitor success')
            })
        }.margin({ top: 10 } as Margin)
        Row(undefined) {
          Button('修改二维数组1')
            .id('change1')
            .height('5%')
            .onClick((e) => {
              this.matrix.data = [
                UIUtils.makeObserved([12, 23, 34]),
                UIUtils.makeObserved([44, 55, 66]),
                UIUtils.makeObserved([77, 88, 99]),
              ];
            })
          Button('修改二维数组2')
            .id('change2')
            .height('5%')
            .onClick((e) => {
              this.matrix.data = [
                UIUtils.makeObserved([123, 234, 345]),
                UIUtils.makeObserved([444, 555, 666]),
                UIUtils.makeObserved([778, 889, 990]),
              ];
            })
          Button(`clear Monitor3`)
            .id('clearArrayMonitor1')
            .height('5%') 
            .width('30%')
            .onClick((e) => {
              UIUtils.clearMonitor(this.matrix.dataMonitor!);
              console.info('[addMonitorTest]:clearMonitor success')
            })
        }.margin({ top: 10 } as Margin)
      }
      .width('100%')
      .height('100%')
    }
  }
}