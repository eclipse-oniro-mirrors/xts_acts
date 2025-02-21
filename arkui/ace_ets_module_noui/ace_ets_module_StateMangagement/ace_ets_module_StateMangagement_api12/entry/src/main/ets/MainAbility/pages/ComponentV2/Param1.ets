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
//@Param无本地初始值
@Entry
@ComponentV2
struct nullParamValue {
  @Local count: number = 0;
  build() {
    Column() {
      Text(`Local ${this.count}`).id('param_local')
      Button('change Local').id('param_null')
        .onClick(()=>{
          this.count++;
        })
      nullParamChild({
        count: this.count
      })
    }
  }
}
@ComponentV2
struct nullParamChild {
  @Require @Param count: number;
  build() {
    Column() {
      Text(`Param ${this.count}`).id('param_count')
    }
  }
}