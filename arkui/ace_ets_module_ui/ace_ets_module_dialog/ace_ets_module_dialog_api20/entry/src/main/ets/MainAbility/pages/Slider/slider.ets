/*
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

import { UIContext } from '@ohos.arkui.UIContext';
import { NodeController, FrameNode, ComponentContent, typeNode } from '@kit.ArkUI';
import common from '@ohos.app.ability.common';

class Params {
  public text: ResourceStr = ""
  public type: number = 0

  constructor(text: ResourceStr, type: number) {
    this.text = text;
    this.type = type;
  }
}

@Builder
function buildTest(params: Params) {
    Text(params.text)
      .key('buildTest' + params.type)
}

@Entry
@Component
struct SliderTest {
  uiContext: UIContext = this.getUIContext()
  private prefixNode1: ComponentContent<Params> =
    new ComponentContent<Params>(this.uiContext, wrapBuilder(buildTest), new Params(
      'message1',1));
  private suffixNode1: ComponentContent<Params> =
    new ComponentContent(this.uiContext, wrapBuilder(buildTest), new Params('',2));
  private prefixNode2: ComponentContent<Params> =
    new ComponentContent<Params>(this.uiContext, wrapBuilder(buildTest), new Params(
      '😎😌👨‍👩‍👦‍👦👨👨‍👩‍👦‍👦👁‍🗨123',3));
  private suffixNode2: ComponentContent<Params> =
    new ComponentContent(this.uiContext, wrapBuilder(buildTest), new Params($r('app.string.maxFontSize'),4));
  private prefixNode3: ComponentContent<Params> =
    new ComponentContent<Params>(this.uiContext, wrapBuilder(buildTest), new Params(
      'message5',5));
  private suffixNode3: ComponentContent<Params> =
    new ComponentContent(this.uiContext, wrapBuilder(buildTest), new Params('message6',6));


  build() {
    Scroll() {
      Column() {
        Slider({
          value: 50,
          min: 0,
          max: 100,
          step: 10,
          style: SliderStyle.OutSet,
        })
          .prefix(this.prefixNode1)
          .suffix(this.suffixNode1)

        Slider({
          value: 50,
          min: 0,
          max: 100,
          step: 10,
          style: SliderStyle.OutSet,
        })
          .prefix(this.prefixNode2)
          .suffix(this.suffixNode2)

        Slider({
          value: 50,
          min: 0,
          max: 100,
          step: 10,
          style: SliderStyle.OutSet,
        })
          .prefix(this.prefixNode3)
          .suffix(this.suffixNode3)
       }
    }
  }
}