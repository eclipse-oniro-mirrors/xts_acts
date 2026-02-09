/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct SearchTest {
  @State message: string = 'Hello World';
  @State contentAlign: TextContentAlign | undefined | number = TextContentAlign.TOP;
  @State clipBool: boolean = false;
  @State include: boolean|null|undefined = false;
  @State fallback: boolean|null|undefined = false;

  build() {
    Row() {
      Column() {
        Search({ value: 'ရှည်လျားသောသမိုင်းရှိရုံသာမကအလွန်ကြွယ်ဝ' })
          .includeFontPadding(this.include)
          .fallbackLineSpacing(this.fallback)
          .id('SearchTest')
          .lineHeight(10)
          .width('80%')
          .height('10%')

        Button('1')
          .onClick(()=>{
            this.include = !this.include;
            this.fallback = !this.fallback;
          })
          .id('SearchTestinclude')
        Button('2')
          .onClick(()=>{
            this.include = null;
            this.fallback = null;
          })
          .id('SearchTestnull')
        Button('3')
          .onClick(()=>{
            this.include = undefined;
            this.fallback = undefined;
          })
          .id('SearchTestundefined')
      }
      .width('100%')
    }
    .height('100%')
  }
}