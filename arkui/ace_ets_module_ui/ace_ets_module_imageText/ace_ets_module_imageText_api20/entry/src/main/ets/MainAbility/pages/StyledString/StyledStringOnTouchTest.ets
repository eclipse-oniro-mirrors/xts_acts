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
import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct StyledStringOnTouchTest {
  controller: TextController = new TextController();
  private uiContext: UIContext = this.getUIContext();
  @State backgroundColor1: ResourceColor | undefined = undefined;
  gestureStyleAttr: GestureStyle = new GestureStyle({
    onTouch: () => {
      this.uiContext.getPromptAction().showToast({ message: 'gestureStyleAttr object trigger touch event' });
      this.backgroundColor1 = Color.Red;
      AppStorage.SetOrCreate('StyledStringOnTouch','true')
    }
  });
  mutableStyledString1: MutableStyledString = new MutableStyledString('0123456789', [
    {
      start: 0,
      length: 10,
      styledKey: StyledStringKey.FONT,
      styledValue: new TextStyle({ fontColor: Color.Orange, fontSize: LengthMetrics.vp(10) })
    },
    {
      start: 0,
      length: 10,
      styledKey: StyledStringKey.GESTURE,
      styledValue: this.gestureStyleAttr
    },
  ]);
  aboutToAppear(): void {
    this.controller.setStyledString(this.mutableStyledString1)
  }
  build() {
    Column() {
      Text('',{controller:this.controller})
        .backgroundColor(this.backgroundColor1)
        .id('StyledStringOnTouchText_id')
    }
  }
}