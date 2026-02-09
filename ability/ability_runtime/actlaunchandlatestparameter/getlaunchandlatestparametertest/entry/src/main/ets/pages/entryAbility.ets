/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import testNapi from 'libentry.so';
@Entry
@Component

struct EntryAbilityB {
  @State message1: string = 'Launch Parameter';
  @State message2: string = 'Latest Parameter';
  @State result:string = '';
  build() {
    Row() {
      Column({space: 20}) {
        Text('EntryAbility1').fontColor(Color.Red).fontSize(16)
        Text(this.result).fontSize(16)
        Button(this.message1)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.result = testNapi.getLaunchParameter();
            if (this.result == '') {
              this.result =  'error'
            } else {
              this.result = 'EntryAbility1 getLaunchParameter: \n' + this.result;
            }
          })
        Button(this.message2)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.result = testNapi.getLatestParameter();
            if (this.result == '') {
              this.result =  'error'
            } else {
              this.result = 'EntryAbility1 getLatestParameter: \n' + this.result;
            }
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}