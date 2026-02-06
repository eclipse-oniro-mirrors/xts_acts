/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

class MutableTextContent {
  public text: string = '';
}

@Builder
function textBuilder001(p: MutableTextContent) {
  Text(p.text + 'text')
    .height('5%')
}

@Builder
function buttonBuilder001(p: MutableTextContent) {
  Button(p.text)
    .height('5%')
  Text('buttonBuilder')
    .height('5%')
}

@Entry
@Component
struct MutableBuilder001 {
  @State message: string = 'init';
  @State text: MutableBuilder<[MutableTextContent]> = mutableBuilder(textBuilder001); // 使用textBuilder001初始化

  build() {
    Column() {
      this.text.builder({ text: this.message })
      Button('change').onClick(() => {
        this.text = mutableBuilder(buttonBuilder001); // 点击Button，将textBuilder001替换为buttonBuilder001进行二次赋值
      })
        .id('MutableBuilder001')
    }
    .height('90%')
    
  }
}