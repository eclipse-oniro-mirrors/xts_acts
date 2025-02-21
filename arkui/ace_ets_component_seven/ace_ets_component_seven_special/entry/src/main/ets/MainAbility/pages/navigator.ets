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
class NavigatorModifier implements AttributeModifier<NavigatorAttribute> {
  applyNormalAttribute(instance: NavigatorAttribute): void {
    instance.params({ params: 'modifier' })
      .active(true)
      .target('')
      .type(NavigationType.Push)
  }
}

@Entry
@Component
struct NavigatorCode {
  @State active: boolean = false;
  @State Text: string = 'news';
  @State target: string = 'pages/NavigatorDetailCode';
  @State typeValue: NavigationType = NavigationType.Back;
  @State modifier: NavigatorModifier = new NavigatorModifier()

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
      Navigator() {
        Text('Go to ' + this.Text + ' page').width('100%').textAlign(TextAlign.Center)
      }
      .params({ text: this.Text })
      .active(this.active)
      .target(this.target)
      .type(this.typeValue)
      .key('Navigator')

      Navigator() {
        Text('Go to ' + this.Text + ' page').width('100%').textAlign(TextAlign.Center)
      }
      .attributeModifier(this.modifier)
      .key('Navigator1')
    }.height(150).width(350).padding(35)

  }
}