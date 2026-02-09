/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { ColorMetrics, LengthMetrics, LengthUnit } from '@ohos.arkui.node';
import { ArcButton, ArcButtonOptions, ArcButtonPosition, ArcButtonStyleMode } from '@ohos.arkui.advanced.ArcButton';

@Entry
@ComponentV2
struct ArcButtonDemo {
  @Local options1: ArcButtonOptions = new ArcButtonOptions({
    label: 'arcbutton1',
    position: ArcButtonPosition.TOP_EDGE,
    styleMode: ArcButtonStyleMode.NORMAL_LIGHT,
    backgroundColor: ColorMetrics.resourceColor(Color.Blue),
    shadowColor: ColorMetrics.resourceColor('#FF4151'),
    shadowEnabled: true,
    fontSize: new LengthMetrics(19, LengthUnit.FP),
    fontColor: ColorMetrics.resourceColor(Color.Green),
    fontStyle: FontStyle.Italic,
    fontFamily: 'Roboto'
  })
  @Local options2: ArcButtonOptions = new ArcButtonOptions({
    label: 'arcbutton2',
  })
  @Local options3: ArcButtonOptions = new ArcButtonOptions({
    label: 'arcbutton3',
  })
  @Local options4: ArcButtonOptions = new ArcButtonOptions({
    label: 'arcbutton4',
    onClick: () => {
      this.options4.label = '白色风车'
    }
  })

  build() {
    Column() {
      Column() {
        ArcButton({ options: this.options1 })
          .key('arcbutton01')
          .borderWidth(5)
          .borderStyle(BorderStyle.Dashed)
          .borderColor(Color.Pink)
          .backgroundColor(Color.Blue)
          .align(Alignment.Center)
          .alignSelf(ItemAlign.Baseline)

        ArcButton({ options: this.options2 })
          .key('arcbutton02')

        ArcButton({ options: this.options3 })
          .key('arcbutton03')
          .borderWidth(-1)
          .borderStyle(-1)
          .borderColor(-1)
          .backgroundColor(-1)
          .align(-1)
          .alignSelf(-1)

        ArcButton({ options: this.options4 })
          .key('arcbutton04')
      }.width(200).borderWidth(5).key('arcbutton')
    }
  }
}