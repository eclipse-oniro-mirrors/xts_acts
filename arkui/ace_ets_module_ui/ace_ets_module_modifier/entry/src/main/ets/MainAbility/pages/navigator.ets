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
import { NavigatorModifier } from "@ohos.arkui.modifier";

class CustomModifier extends NavigatorModifier {
  applyNavigatorAttribute(instance: NavigatorAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.type(NavigationType.Replace)
  }
}

@Entry
@Component
struct NavigatorCode {
  @State active: boolean = false;
  @State Text: string = 'news';
  @State target: string = 'pages/NavigatorDetailCode';
  @State typeValue: NavigationType = NavigationType.Back;
  @State customModifier: NavigatorModifier = new CustomModifier()
    .active(true)
    .target('')
    .type(NavigationType.Push)
    .params({ text: this.Text })

  build() {
    Column() {
      Button("change value").onClick(() => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")

      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
        Navigator() {
          Text('Go to ' + this.Text + ' page').width('100%').textAlign(TextAlign.Center)
        }
        .attributeModifier(this.customModifier as CustomModifier)
        .key('Navigator1')
      }.height(150).width(350).padding(35)
    }
    .width('100%')
  }
}