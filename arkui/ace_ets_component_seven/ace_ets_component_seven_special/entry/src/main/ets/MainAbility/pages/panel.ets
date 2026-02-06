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

class TestPanelModifier implements AttributeModifier<PanelAttribute> {
  applyNormalAttribute(instance: PanelAttribute): void {
    instance.backgroundMask('#ff000000');
    instance.customHeight(10);

  }
}

class TestPanelModifier1 implements AttributeModifier<PanelAttribute> {
  applyNormalAttribute(instance: PanelAttribute): void {
    instance.miniHeight(20);
    instance.halfHeight(300);
    instance.fullHeight(800);
    instance.type(PanelType.Foldable);
    instance.showCloseIcon(true);
    instance.show(true);
    instance.mode(PanelMode.Full);
    instance.dragBar(true);
  }
}

@Entry
@Component
struct TestPanelPage {
  @State modifier: TestPanelModifier = new TestPanelModifier()
  @State modifier1: TestPanelModifier1 = new TestPanelModifier1()

  build() {
    Column() {
      Panel(true)
        .key('PanelKey2')
        .attributeModifier(this.modifier).height('30%')
      Panel(true)
        .key('PanelKey3')
        .backgroundMask('#ff000000').height('30%')
      Panel(true)
        .key('PanelKey1')
        .attributeModifier(this.modifier1).height('30%')
    }
		.width('100%')
    .height('100%')
  }
}
