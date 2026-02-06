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

@Entry
@Component
export default struct OnWillAttachIMETest {
  textInputController: TextInputController = new TextInputController();
  searchController: SearchController = new SearchController();

  build() {
    Column() {
      Search()
        .onWillAttachIME((client)=>{
          this.getUIContext().setKeyboardAppearanceConfig(client.nodeId,{
            gradientMode:KeyboardGradientMode.LINEAR_GRADIENT,
            fluidLightMode:KeyboardFluidLightMode.BACKGROUND_FLUID_LIGHT
          })
          console.log('Search client:'+JSON.stringify(client))
          AppStorage.SetOrCreate('SearchClient',JSON.stringify(client))
        })
        .id('OnWillAttachIMESearch')
      TextInput()
        .onWillAttachIME((client)=>{
          this.getUIContext().setKeyboardAppearanceConfig(client.nodeId,{
            gradientMode:KeyboardGradientMode.NONE,
            fluidLightMode:KeyboardFluidLightMode.NONE
          })
          console.log('TextInput client:'+JSON.stringify(client))
          AppStorage.SetOrCreate('TextInputClient',JSON.stringify(client))
        })
        .id('OnWillAttachIMETextInput')
    }.height('100%').width('100%')
  }
}