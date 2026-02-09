/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
struct StateArrayNew {
  @State arr_every: Array<number> = [1,2,3,4,5,6,7,]
  @State res_every: boolean = true
  @State arr_some: Array<number> = [1,8,3,4,5,6,7,]
  @State res_some: boolean = true
  @State arr_filter: Array<string> = ['spray','limit','elite','exuberant','destruction','present']
  @State res_filter: Array<string> = []
  @State arr_reduce: Array<number> = [1,2,3,4]
  @State res_reduce: number = 0
  @State arr_reduceRight: Array<Array<number>> = [[0,1],[2,3],[4,5]]
  @State res_reduceRight: Array<number> = []

  build() {
    Column() {
      Text('Click to every value to the array ' + this.res_every).fontSize(9)
        .height('5%')
        .id("every_Array")
        .onClick(() => {
          this.res_every = this.arr_every.every((x, i, arr) => x >= 2)
        })

      Text('Click to some value to the array ' + this.res_some).fontSize(9)
        .height('5%')
        .id("some_Array")
        .onClick(() => {
          this.res_some = this.arr_some.some((x, i, arr) => x==2)
        })

      Text('Click to filter value to the array ' + this.res_filter).fontSize(9)
        .height('5%')
        .id("filter_Array")
        .onClick(() => {
          this.res_filter = this.arr_filter.filter((x, i, arr) => x.length > 6)
        })

      Text('Click to reduce value to the array ' + this.res_reduce).fontSize(9)
        .height('5%')
        .id("reduce_Array")
        .onClick(() => {
          this.res_reduce = this.arr_reduce.reduce((accumulator, currentValue) => accumulator + currentValue, 0)
        })

      Text('Click to reduceRight value to the array ' + this.res_reduceRight).fontSize(9)
        .height('5%')
        .id("reduceRight_Array")
        .onClick(() => {
          this.res_reduceRight = this.arr_reduceRight.reduceRight((accumulator, currentValue) => accumulator.concat(currentValue))
        })
    }.width('100%')
  }
}