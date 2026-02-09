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
@ComponentV2
struct fuziIndex {
  @Local value: number = 0;

  build() {
    Column() {
      Text(`${this.value}`).id('V2bindText1')
      Button(`change value parent`).onClick(() => {
        this.value++;
      }).id('V2bindButton1')
      fuziStar({ value: this.value!! })
    }
  }
}


@ComponentV2
struct fuziStar {
  @Param value: number = 0;
  @Event $value: (val: number) => void = (val: number) => {};

  build() {
    Column() {
      Text(`${this.value}`).id('V2bindText2')
      Button(`change value child`).onClick(() => {
        this.$value(10);
      }).id('V2bindButton2')
    }
  }
}