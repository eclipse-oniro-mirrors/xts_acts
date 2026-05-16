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

import { Filter, FilterParams, FilterResult, FilterType } from '@ohos.arkui.advanced.Filter';

@Entry
@Component
struct Index {
  private filterParam: Array<FilterParams> = [{
    name: '月份',
    options: ['全部', '1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
  },
    {
      name: '年份',
      options: ['全部', '2023', '2022', '2021', '2020', '2019', '2018', '2017', '2016', '2015', '2014', '2013', '2012',
        '2011', '2010', '2009', '2008']
    },
    {
      name: '节气',
      options: ['全部', '立春', '雨水', '惊蛰', '春分', '清明', '谷雨', '立夏', '小满', '芒种', '夏至', '小暑', '大暑', '立秋',
        '处暑', '白露', '秋分', '寒露', '霜降', '立冬', '小雪', '大雪', '冬至', '小寒', '大寒']
    }]
  private additionParam: FilterParams = {
    name: '您还可以搜',
    options: ['运营栏目1', '运营栏目2', '运营栏目3', '运营栏目4', '运营栏目5', '运营栏目6'],
  }
  private arr: number[] = [1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6,7,8,9,10];

  build() {
    Column() {
      Filter({
        multiFilters: this.filterParam,
        additionFilters: this.additionParam,
        filterType: FilterType.LIST_FILTER,
        onFilterChanged: (select: Array<FilterResult>) => {
          console.log('rec filter change');
          for (let filter of select) {
            console.log('name:' + filter.name + ',index:' + filter.index + ',value:' + filter.value)
          }
        },
        container: () => {},
      }){
        List({ initialIndex: 0 }) {
          ForEach(this.arr, (item:string, index: number) => {
            ListItem() {
              Text(item.toString())
                .width('100%')
                .height(100)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .borderRadius(10)
                .backgroundColor(Color.White)
                .margin({ top:10, bottom: 10 })
            }
          })
        }.backgroundColor(Color.Gray)
        .padding({ left: 20, right: 20 })
      }
    }
    .height('100%')
    .width('100%')
  }
}