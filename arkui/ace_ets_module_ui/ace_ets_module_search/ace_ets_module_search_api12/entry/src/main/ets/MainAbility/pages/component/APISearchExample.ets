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
struct APISearchExample {
  @State onWillInsert_Text: string = 'init'
  @State onDidInsert_Text: string = 'init'
  @State onWillDelete_Text: string = 'init'
  @State onDidDelete_Text: string = 'init'

  build() {
    Column({space:10}) {
      Text(this.onWillInsert_Text).fontWeight(700).fontSize(24).key('APISearchExample_Text01')
      Text(this.onDidInsert_Text).fontWeight(700).fontSize(24).key('APISearchExample_Text02')
      Text(this.onWillDelete_Text).fontWeight(700).fontSize(24).key('APISearchExample_Text03')
      Text(this.onDidDelete_Text).fontWeight(700).fontSize(24).key('APISearchExample_Text04')
      Search({ value: "123del" }).key('APISearchExample_Search')
        .height(60)
        .onWillInsert(() => {
          this.onWillInsert_Text = 'done'
          return true;
        })
        .onDidInsert(() => {
          this.onDidInsert_Text = 'done'
        })
        .onWillDelete(() => {
          this.onWillDelete_Text = 'done'
          return true;
        })
        .onDidDelete(() => {
          this.onDidDelete_Text = 'done'
        })
    }
  }
}