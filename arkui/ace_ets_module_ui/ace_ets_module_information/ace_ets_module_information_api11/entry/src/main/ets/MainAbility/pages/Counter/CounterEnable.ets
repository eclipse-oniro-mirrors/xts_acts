/*
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
struct CounterEnable {
  @State value: number = 0
  @State enable_inc: boolean = false
  @State enable_dec: boolean = false

  build() {
    Column() {
      Counter() {
        Text(this.value.toString())
      }
      .margin(20)
      .onInc(() => {
        this.value++
      })
      .onDec(() => {
        this.value--
      })
      .enableInc(this.enable_inc)
      .enableDec(this.enable_dec)
      .key('CounterEnable_Counter_1')

      Button("enable_inc_true")
        .onClick(() => {
          this.enable_inc = true;
        }).height(45)
        .key('CounterEnable_Button_1')
      Button("enable_dec_true")
        .onClick(() => {
          this.enable_dec = true;
        }).height(45)
        .key('CounterEnable_Button_2')
    }.width("100%")
  }
}