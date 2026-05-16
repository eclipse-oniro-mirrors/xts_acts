/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
@Entry
@Component
struct bindTipsPopupNullUndefined {
  @State handlePopup: boolean = false;

  build() {
    Column() {
      // ========== bindTips tests ==========
      Text('bindTips')
      Button('enableArrow false')
        .id('bindTips_enableArrow_false')
        .bindTips('test bind tips', {
          enableArrow: false
        })

      Row(){
        Button('null1')
          .id('bindTips_message_null')
          .bindTips(null)

        Button('undefined1')
          .id('bindTips_message_undefined')
          .bindTips(undefined)
      }

      Row(){
        Button('null2')
          .id('bindTips_options_null')
          .bindTips(null)
          .bindTips('test bind tips', null)

        Button('undefined2')
          .id('bindTips_options_undefined')
          .bindTips('test bind tips', undefined)
      }

      // ========== bindPopup tests ==========
      Text('bindPopup')
      Row(){
        Button('null2')
          .id('bindPopup_popup_null')
          .onClick(() => {
            this.handlePopup = true;
          })
          .bindPopup(this.handlePopup, null)

        Button('undefined2')
          .id('bindPopup_popup_undefined')
          .onClick(() => {
            this.handlePopup = true;
          })
          .bindPopup(this.handlePopup, undefined)
      }

    }
    .width('100%')
  }
}