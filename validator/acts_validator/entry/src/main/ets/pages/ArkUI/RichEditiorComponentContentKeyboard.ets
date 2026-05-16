/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import promptAction from '@ohos.promptAction';
import fs from '@ohos.file.fs';
import { router, ComponentContent } from '@kit.ArkUI';
import { matrix4 } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';
import FirstDialog from '../model/FirstDialog';
import Logger from '../model/Logger';
class BuilderParams {
public text: string | Resource;

  constructor(text: string | Resource) {
    this.text = text;
  }
}
@Builder
function itemBuilder1(params: BuilderParams) {
  Column() {
    Row() {
      Text(params.text).fontColor(Color.White).fontSize(20)
    }

    Grid() {
      ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9, '*', 0, '#'], (item: number | string) => {
        GridItem() {
          Button(item + '')
            .width(110).onClick(() => {
          })
        }
      })
    }.maxCount(3).columnsGap(10).rowsGap(10).padding(5)
  }.backgroundColor(Color.Gray)
}

@Builder
function itemBuilder2(params: BuilderParams) {
  Column() {
    Row() {
      Text(params.text).fontColor(Color.White).fontSize(20)
    }

    Grid() {
      ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9, '*', 0, '#'], (item: number | string) => {
        GridItem() {
          Button(item + '')
            .width(110).onClick(() => {
          })
        }
      })
    }.maxCount(3).columnsGap(10).rowsGap(10).padding(5)
  }.backgroundColor(Color.Gray)
}
@Entry
@Component
struct TabBarIndicatorPixmap {
  @State name: string = 'RichEditior ComponentContent Keyboard';
  @State stepTips: string = '操作步骤:\n' + '1.点击componentContent键盘1 文本框\n' +
    '2.点击componentContent键盘2 文本框\n' +
    '预期结果：\n' + '1.键盘呼出\n' +
    '2.键盘接续，始终存在\n'
  @State isOk: boolean = false;
  @State intervalNum: number = 0;
  @State isVertical: boolean = false;
  @State barOverlap: boolean = false;
  @State fadingEdge: boolean = false;
  @State currentIndex: number = 2;
  @State selectedIndex: number = 2;

  @State text: string = '文本';
  @State barMode: BarMode = BarMode.Fixed;

  // 声明DrawableDescriptor对象
  @State pixmapDesc: DrawableDescriptor | null = null;


  @State subTabBorderRadius: number = 20;
  @State selectedMode: SelectedMode = SelectedMode.INDICATOR;
  controller: RichEditorController = new RichEditorController();
  controller2: RichEditorController = new RichEditorController();
  builder1 ?: ComponentContent<BuilderParams> = undefined;
  builder2 ?: ComponentContent<BuilderParams> = undefined;
  builderParam1 = new BuilderParams('ComponentContent CustomKeyboard1');
  builderParam2 = new BuilderParams('ComponentContent CustomKeyboard2');
  @State supportAvoidance: boolean = true;

  // 自定义键盘组件
  @Builder
  CustomKeyboardBuilder() {
    Column() {
      Grid() {
        ForEach(['1', '2', '3', '4', '5', '6', '7', '8', '9', '*', '0', '#'], (item: string) => {
          GridItem() {
            Button(item).width(110).onClick(() => {
              this.controller.addTextSpan(item + '', {
                offset: this.controller.getCaretOffset(),
                style:
                {
                  fontColor: Color.Orange,
                  fontSize: 30
                }
              })
            })
          }
        })
      }.maxCount(3).columnsGap(10).rowsGap(10).padding(5)
    }.backgroundColor(Color.Gray)
  }

  aboutToAppear(): void {
    //创建ComponentContent
    this.builder1 = new ComponentContent(this.getUIContext(), wrapBuilder(itemBuilder1), this.builderParam1);
    this.builder2 = new ComponentContent(this.getUIContext(), wrapBuilder(itemBuilder2), this.builderParam2);
    FirstDialog.ChooseDialog(this.stepTips, this.name);
  }

  onPageHide() {
    clearInterval(this.intervalNum);
  }

  aboutToDisappear() {
    clearInterval(this.intervalNum);
  }

  build() {
    Column() {
      Text('componentContent键盘1')
      RichEditor({ controller: this.controller })// 绑定自定义键盘
        .customKeyboard(this.builder1)
        .border({ width: 1 })
        .borderWidth(1)
        .borderColor(Color.Red)
        .margin(10)
        .height(50)
        .width('100%')
      Text('componentContent键盘2')
      RichEditor({ controller: this.controller2 })// 绑定自定义键盘
        .customKeyboard(this.builder1)
        .border({ width: 1 })
        .borderWidth(1)
        .borderColor(Color.Red)
        .margin(10)
        .height(50)
        .width('100%')

    }.width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}