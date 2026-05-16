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
struct TextEditMenuOptionsNull {

  build() {
    Column({ space: 2 }) {
      // EditMenuOptions onCreateMenu null test
      Text('EditMenuOptions onCreateMenu null')
        .id('text_editMenuOptions_onCreateMenu_null')
        .height('5%')
        .copyOption(CopyOptions.InApp)
        .editMenuOptions({
          onCreateMenu: null, onMenuItemClick: null
        })

      // EditMenuOptions onCreateMenu undefined test
      Text('EditMenuOptions onCreateMenu undefined')
        .id('text_editMenuOptions_onCreateMenu_undefined')
        .height('5%')
        .copyOption(CopyOptions.InApp)
        .editMenuOptions({
          onCreateMenu: undefined, onMenuItemClick: undefined
        })

      // IMEClient setExtraConfig null test
      TextInput({ text: 'IMEClient setExtraConfig null'})
        .id('TextInput_imeClient_setExtraConfig_null')
        .height('5%')
        .onWillAttachIME((client: IMEClient) => {
          client.setExtraConfig(null)
        })

      // IMEClient setExtraConfig undefined test
      TextInput({ text: 'IMEClient setExtraConfig undefined'})
        .id('TextInput_imeClient_setExtraConfig_undefined')
        .height('5%')
        .onWillAttachIME((client: IMEClient) => {
          client.setExtraConfig(undefined)
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
