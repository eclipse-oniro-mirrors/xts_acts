'use static'
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

import {
  CustomSpan,
  CustomSpanMetrics,
  AppStorage,
  DrawContext,
  CustomSpanDrawInfo,
  Entry,
  Component,
  TextController,
  StyledString,
  Scroll,
  Column,
  Text,
  CustomSpanMeasureInfo,
} from '@kit.ArkUI';

class TestCustomSpan extends CustomSpan {
  private id: string;
  private widthValue: int = 100;
  private heightValue: int = 50;

  constructor(id: string, width: int, height: int) {
    super();
    this.id = id;
    this.widthValue = width;
    this.heightValue = height;
  }

  onMeasure(measureInfo: CustomSpanMeasureInfo): CustomSpanMetrics {
    console.info('[TestCustomSpan-' + this.id + '] onMeasure called');
    console.info('[TestCustomSpan-' + this.id + '] fontSize: ' + measureInfo.fontSize);
    console.info('[TestCustomSpan-' + this.id + '] maxWidth: ' + measureInfo.maxWidth);
    console.info('[TestCustomSpan-' + this.id + '] layoutPolicy: ' + measureInfo.layoutPolicy);

    AppStorage.setOrCreate('customSpanMeasure_' + this.id, measureInfo);

    return {
      width: this.widthValue,
      height: this.heightValue
    };
  }

  onDraw(context: DrawContext, options: CustomSpanDrawInfo): void {
    let canvas = context.canvas;
    canvas.drawRect({
      left: options.x,
      right: options.x + this.widthValue,
      top: options.lineTop,
      bottom: options.baseline
    });
  }
}

@Entry
@Component
struct CustomSpanMeasureInfoTest {
  customSpan1: TestCustomSpan = new TestCustomSpan('maxWidth_300', 100, 50);
  customSpan2: TestCustomSpan = new TestCustomSpan('maxWidth_500', 100, 50);
  customSpan3: TestCustomSpan = new TestCustomSpan('maxWidth_full', 100, 50);
  customSpan4: TestCustomSpan = new TestCustomSpan('maxWidth_percent', 100, 50);
  customSpan5: TestCustomSpan = new TestCustomSpan('layoutPolicy_none', 100, 50);
  customSpan6: TestCustomSpan = new TestCustomSpan('layoutPolicy_set', 100, 50);
  customSpan7: TestCustomSpan = new TestCustomSpan('null_test', 100, 50);
  customSpan8: TestCustomSpan = new TestCustomSpan('undefined_test', 100, 50);

  controller1: TextController = new TextController();
  controller2: TextController = new TextController();
  controller3: TextController = new TextController();
  controller4: TextController = new TextController();
  controller5: TextController = new TextController();
  controller6: TextController = new TextController();
  controller7: TextController = new TextController();
  controller8: TextController = new TextController();

  aboutToAppear() {
    let styledString1 = new StyledString(this.customSpan1);
    this.controller1.setStyledString(styledString1);

    let styledString2 = new StyledString(this.customSpan2);
    this.controller2.setStyledString(styledString2);

    let styledString3 = new StyledString(this.customSpan3);
    this.controller3.setStyledString(styledString3);

    let styledString4 = new StyledString(this.customSpan4);
    this.controller4.setStyledString(styledString4);

    let styledString5 = new StyledString(this.customSpan5);
    this.controller5.setStyledString(styledString5);

    let styledString6 = new StyledString(this.customSpan6);
    this.controller6.setStyledString(styledString6);

    let styledString7 = new StyledString(this.customSpan7);
    this.controller7.setStyledString(styledString7);

    let styledString8 = new StyledString(this.customSpan8);
    this.controller8.setStyledString(styledString8);
  }

  build() {
    Scroll() {
      Column() {
        Text(undefined, { controller: this.controller1 })
          .width('10%')
          .height('7%')
          .id('customSpan_measure_maxWidth_300')
          .fontSize(20)

        Text(undefined, { controller: this.controller2 })
          .width('10%')
          .height('7%')
          .id('customSpan_measure_maxWidth_500')
          .fontSize(20)

        Text(undefined, { controller: this.controller3 })
          .width('100%')
          .height('7%')
          .id('customSpan_measure_maxWidth_full')
          .fontSize(20)

        Text(undefined, { controller: this.controller4 })
          .width('80%')
          .height('7%')
          .id('customSpan_measure_maxWidth_percent')
          .fontSize(20)

        Text(undefined, { controller: this.controller5 })
          .width('10%')
          .height('7%')
          .id('customSpan_measure_layoutPolicy_none')
          .fontSize(20)

        Text(undefined, { controller: this.controller6 })
          .width('10%')
          .height('7%')
          .id('customSpan_measure_layoutPolicy_set')
          .fontSize(20)

        Text(undefined, { controller: this.controller7 })
          .width('10%')
          .height('7%')
          .id('customSpan_measure_null')
          .fontSize(20)

        Text(undefined, { controller: this.controller8 })
          .width('10%')
          .height('7%')
          .id('customSpan_measure_undefined')
          .fontSize(20)
      }
      .width('100%')
    }
    .height('100%')
  }
}