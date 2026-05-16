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
import router from '@system.router';

@Entry
@Component
struct SystemRouterReplaceNullUndefined {
  @State errorMessage: string = '';

  build() {
    Column() {
      Text('System Router Replace Null/Undefined Test')
        .fontSize(20)
        .height('3%')

      Button('Test replace with null')
        .id('SystemRouterReplaceNullUndefined_Button_ReplaceNull')
        .height('3%')
        .onClick(() => {
          try {
            router.replace(null);
            this.errorMessage = 'replace null success';
          } catch (e) {
            this.errorMessage = `replace null catch: ${e}`;
          }
          AppStorage.setOrCreate('replace_Null', this.errorMessage);
        })

      Button('Test replace with undefined')
        .id('SystemRouterReplaceNullUndefined_Button_ReplaceUndefined')
        .height('3%')
        .onClick(() => {
          try {
            router.replace(undefined);
            this.errorMessage = 'replace undefined success';
          } catch (e) {
            this.errorMessage = `replace undefined catch: ${e}`;
          }
          AppStorage.setOrCreate('replace_undefined', this.errorMessage);
        })

      Button('Test replace with empty uri')
        .id('SystemRouterReplaceNullUndefined_Button_ReplaceEmpty')
        .height('3%')
        .onClick(() => {
          try {
            router.replace({ uri: '' });
            this.errorMessage = 'replace empty uri success';
          } catch (e) {
            this.errorMessage = `replace empty uri catch: ${e}`;
          }
          AppStorage.setOrCreate('replace_empty', this.errorMessage);
        })

      Text(this.errorMessage)
        .id('SystemRouterReplaceNullUndefined_Text_ErrorMessage')
        .fontSize(16)
        .height('3%')
        .width('80%')
    }
    .width('100%')
    .height('100%')
  }
}
