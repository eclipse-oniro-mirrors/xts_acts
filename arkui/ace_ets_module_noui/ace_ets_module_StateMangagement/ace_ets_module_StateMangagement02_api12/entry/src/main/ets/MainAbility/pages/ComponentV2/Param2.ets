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
//@Param有本地初始值
@Entry
@ComponentV2
struct ParamValue {
  @Local count: number = 5;
  build() {
    Column() {
      ParamChild({
        param1: this.count
      })
      Button('change Param1').id('param_change')
        .onClick(()=>{
          this.count++;
        })
    }
  }
}
@ComponentV2
struct ParamChild {
  @Param param: number = 0;
  @Param param1: number = 0;
  build() {
    Column() {
      Text(`Param ${this.param}`).id('param_text')
      Text(`Param1 ${this.param1}`).id('param1_text')
    }
  }
}