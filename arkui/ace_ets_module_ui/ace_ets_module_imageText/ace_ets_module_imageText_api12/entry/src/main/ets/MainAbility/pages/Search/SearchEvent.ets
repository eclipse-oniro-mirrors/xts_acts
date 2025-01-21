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
struct SearchEvent {
  @State insertValue: string = ''
  @State insertValue2: string = ''
  @State insertValue3: string = ''
  @State insertValue4: string = ''
  @State insertValue5: string = ''
  @State insertValue6: string = ''
  @State text: string = ''

  build() {
    Column() {
      Text(this.insertValue).key('SearchEventText')
      Text(this.insertValue2).key('SearchEventText2')
      Text(this.insertValue3).key('SearchEventText3')
      Text(this.insertValue4).key('SearchEventText4')
      Text(this.insertValue5).key('SearchEventText5')
      Text(this.insertValue6).key('SearchEventText6')

      Search({ value: this.text })
        .height(60)
        .onWillInsert((info: InsertValue) => {
          this.insertValue = info.insertOffset + ''
          this.insertValue2 = info.insertValue
          return true;
        })
        .onDidInsert((info: InsertValue) => {
          this.insertValue3 = info.insertOffset + ''
          this.insertValue4 = info.insertValue
        })
        .onWillDelete((info: DeleteValue) => {
          this.insertValue5 = info.deleteOffset + ''
          this.insertValue6 = info.deleteValue
          return true;
        })
        .onChange((value: string) => {
          this.text = value
        })
        .key('SearchEvent')

      Search({ value: '0' })
        .height(60)
        .onWillInsert((info: InsertValue) => {
          this.insertValue = info.insertOffset + ''
          this.insertValue2 = info.insertValue
          return false;
        })
        .onDidInsert((info: InsertValue) => {
          this.insertValue3 = info.insertOffset + ''
          this.insertValue4 = info.insertValue
        })
        .key('SearchEvent2')

      Search({ value: '0' })
        .height(60)
        .onWillDelete((info: DeleteValue) => {
          this.insertValue5 = info.deleteOffset + ''
          this.insertValue6 = info.deleteValue
          return false;
        })
        .key('SearchEvent3')

      Button('change')
        .key('SearchEventBt')
        .onClick((event: ClickEvent) => {
          this.text = ''
        })


    }
    .height('100%')
  }
}