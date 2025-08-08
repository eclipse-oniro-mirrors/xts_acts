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

@Component
struct ChildProvideConsume0040 {
  @Consume numberValue: number

  build() {
    Column() {
      Text(this.numberValue.toString()).id('tvProvideConsume0040Child')
    }
  }
}

@Entry
@Component
struct ProvideConsume0040 {
  @Provide numberValue: string = 'helloWorld'

  build() {
    Column() {
      Text(this.numberValue.toString()).id('tvProvideConsume0040Parent')
      ChildProvideConsume0040()
      Button('ChangeMsg')
        .id('btnProvideConsume0040Change')
        .onClick(()=>{
          this.numberValue = 'ARKUI'
        })
    }
  }
}