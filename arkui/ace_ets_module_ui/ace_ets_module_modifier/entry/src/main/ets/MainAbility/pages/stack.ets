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
import { StackModifier } from "@ohos.arkui.modifier";

 class CustomModifier extends StackModifier {
  applyNormalAttribute(instance: StackAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange() {
    this
      .alignContent(Alignment.Top)
  }
}
@Entry
@Component
struct RichEditorPage {
  @State customModifier: StackAttribute = new CustomModifier()
  .alignContent(Alignment.Center)


  build() {
    Row(){
      Button("change value").onClick(() => {
        (this.customModifier as CustomModifier).onChange();
      }).key("changeButton")

      Stack(){
        Text('First child, show in bottom').width('90%').height('100%').backgroundColor(0xd2cab3).align(Alignment.Top)
        Text('Second child, show in top').width('70%').height('60%').backgroundColor(0xc1cbac).align(Alignment.Top)
      }.attributeModifier(this.customModifier as CustomModifier).key('stack');
    }
  }
}