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
 import { SearchModifier } from "@ohos.arkui.modifier";

 class CustomModifier extends SearchModifier {
  applyNormalAttribute(instance: SearchAttribute): void {
    super.applyNormalAttribute?.(instance);
  }
  onChangeSearch() {
    this.copyOption( CopyOptions.InApp);
    this.fontColor( '0xff00ff00');
    this.placeholderColor('0xff00ff00');
    this.placeholderFont({ size: '32fp', weight: 500 });
    this.textFont({ size: '32fp', weight: 500 });
    this.textAlign(TextAlign.Center);
    this.enableKeyboardOnFocus(true);
    this.selectionMenuHidden(true);
    this.caretStyle({ width: 8, color: 'blue' });
    this.searchIcon({ size:8,color: "greed"});
    this.cancelButton({ style: CancelButtonStyle.INVISIBLE})
  }
}


@Entry
@Component
struct SearchPage {
  @State changeValue: string = ''
  @State submitValue: string = ''
  @State positionInfo: CaretOffset = { index: 0, x: 0, y: 0 }
  controller: SearchController = new SearchController()
  @State customModifier: SearchAttribute = new CustomModifier()
    .copyOption(CopyOptions.None)
    .fontColor('#4169E1')
    .placeholderColor('#4169E1')
    .placeholderFont({ size: 16, weight: 200, style:FontStyle.Italic })
    .textFont({ size: 16, weight: 200, style:FontStyle.Italic })
    .textAlign(TextAlign.Start)
    .enableKeyboardOnFocus(true)
    .selectionMenuHidden(true)
    .caretStyle({ width: '3.2fp', color: "#80FF64FF" })
    .searchIcon({ size:"15px",color: "red"})
    .searchButton( "SearchText")
    .cancelButton({style: CancelButtonStyle.CONSTANT})

  build() {
    Row(){
      Button("change value").onClick(() => {
        (this.customModifier as CustomModifier).onChangeSearch();
      }).key("changeButton")

    Search({ value: this.changeValue, placeholder: 'Type to search...', controller: this.controller })
      .width('95%')
      .height(40)
      .backgroundColor('#F5F5F5')
      .attributeModifier(this.customModifier as CustomModifier)
      .key('search')
      .onSubmit((value: string) => {
        this.submitValue = value
      })
      .margin(20)
    }
  }
}