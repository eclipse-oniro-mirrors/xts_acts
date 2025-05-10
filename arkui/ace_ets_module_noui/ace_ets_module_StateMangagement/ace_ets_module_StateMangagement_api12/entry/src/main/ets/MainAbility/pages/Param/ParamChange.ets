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
struct Param5 {
  @Local count: number = 0;
  @Local message: string = 'Hello';
  @Local flag: boolean = false;

  build() {
    Column() {
      Text(`Local ${this.count}`).id('paramChangeText1')
      Text(`Local ${this.message}`).id('paramChangeText2')
      Text(`Local ${this.flag}`).id('paramChangeText3')
      Button('change Local')
        .onClick(() => {
          // 对数据源的更改会同步给子组件
          this.count++;
          this.message += ' World';
          this.flag = !this.flag;
        })
        .id('paramChangeButton')
      ParamChangeChild({
        count: this.count,
        message: this.message,
        flag: this.flag
      })
    }
  }
}

@ComponentV2
struct ParamChangeChild {
  @Require @Param count: number;
  @Require @Param message: string;
  @Require @Param flag: boolean;

  build() {
    Column() {
      Text(`Param ${this.count}`).id('paramChangeText4')
      Text(`Param ${this.message}`).id('paramChangeText5')
      Text(`Param ${this.flag}`).id('paramChangeText6')
    }
  }
}