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
import { common, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { uiObserver } from '@kit.ArkUI';
import window from '@ohos.window';
import { CustomKeyboardContinueFeature } from '@ohos.arkui.UIContext';
import FirstDialog from '../model/FirstDialog';

class BuilderParams {
  public text: string | Resource;

  constructor(text: string | Resource) {
    this.text = text;
  }
}

@Builder
function itemBuilder(params: BuilderParams) {
  Column() {
    Row() {
      Button(params.text).margin('4vp')
      Button('Set').margin('4vp')
    }
    .backgroundColor(Color.Gray)
    .justifyContent(FlexAlign.SpaceEvenly)
    Grid() {
      ForEach(['1', '2', '3', '4', '5', '6', '7', '8', '9', '*', '0', '#'], (item: string) => {
        GridItem() {
          Button(item).width(110).onClick(() => {
            console.log('whw: 自定义键盘被点击')
          })
        }
      })
    }.maxCount(3).columnsGap(10).rowsGap(10).padding(5)
  }.backgroundColor(Color.Gray).height('30%')
}

@Observed
class MyRichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  public builder ?: ComponentContent<BuilderParams> | CustomBuilder = undefined;

  applyNormalAttribute(instance: RichEditorAttribute): void {
    instance.customKeyboard(this.builder)
    instance.border({ width: 1 })
    instance.borderWidth(1)
    instance.borderColor(Color.Red)
    instance.margin(10)
    instance.height(50)
    instance.width('100%')
  }
  setBuilder(builder: ComponentContent<BuilderParams> | CustomBuilder) {
    this.builder = builder;
  }
}
@Entry
@Component
struct SR20250916000370 {
  @State name: string = 'RichEditior ComponentContent Keyboard';
  @State stepTips: string = '操作步骤:\n' + '1.点击打开按钮 \n' +
    '2.分别点击下方的富文本.\n' +
    '预期结果：\n' + '点击富文本时键盘正常弹出，再点击其他富文本时，键盘接续正常\n'
  @State mod: MyRichEditorModifier = new MyRichEditorModifier();
  @State mod2: MyRichEditorModifier = new MyRichEditorModifier();
  controller: RichEditorController = new RichEditorController();
  controller1: RichEditorController = new RichEditorController();
  controller2: RichEditorController = new RichEditorController();
  styleStringController: RichEditorStyledStringController = new RichEditorStyledStringController()
  styleStringController1: RichEditorStyledStringController = new RichEditorStyledStringController()
  styleStringController2: RichEditorStyledStringController = new RichEditorStyledStringController()
  textController : TextController = new TextController()
  textAreaController: TextAreaController = new TextAreaController()
  builder ?: ComponentContent<BuilderParams> = undefined;
  builderParam = new BuilderParams('delete');
  @State isOk: boolean = false;
  @State intervalNum: number = 0;
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
    }.backgroundColor(Color.Gray).height('30%')
  }
  aboutToAppear(): void {
    this.builder = new ComponentContent(this.getUIContext(), wrapBuilder(itemBuilder), this.builderParam);
    this.mod.setBuilder(this.builder);
    this.mod2.setBuilder(this.builder);
    FirstDialog.ChooseDialog(this.stepTips, this.name);
  }

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    Button({ stateEffect: this.isOk }) {
      Image($r('app.media.ic_public_pass'))
        .width('20vp')
        .height('20vp')
    }
    .margin({ bottom: '20vp' })
    .width('30%')
    .height('30vp')
    .backgroundColor(Color.Grey)
    .onClick(() => {
      router.back({
        url: 'pages/ArkUI/ArkUI_index',
        params: {
          result: 'true ', title: this.name,
        }
      })
      promptAction.showToast({
        message: '通过', duration: 1000
      });
    })
  }

  @Builder
  FailBtn(text: Resource, isFullScreen: boolean) {
    Button() {
      Image($r('app.media.ic_public_fail'))
        .width('20vp')
        .height('20vp')
    }
    .margin({ bottom: '20vp' })
    .width('30%')
    .height('30vp')
    .backgroundColor(Color.Grey)
    .onClick(() => {
      router.back({
        url: 'pages/ArkUI/ArkUI_index',
        params: {
          result: 'false', title: this.name,
        }
      });
      promptAction.showToast({
        message: '失败', duration: 1000
      });
    })
  }

  onPageHide() {
    clearInterval(this.intervalNum);
  }

  aboutToDisappear() {
    clearInterval(this.intervalNum);

  }

  build() {
    Column() {
      Row() {
        Button() {
          Image($r('app.media.ic_public_back'))
            .width('20vp')
            .height('18vp')
            .margin({ left: '20vp' })
        }
        .backgroundColor(Color.Black)
        .size({ width: '40vp', height: '30vp' })
        .onClick(() => {
          router.back({
            url: 'pages/ArkUI/ArkUI_index',
            params: { result: 'None' }
          });
        })

        Text(this.name)
          .fontColor(Color.White)
          .fontSize('18fp')
          .margin({ left: '-20vp' })
        Text('hello')
          .fontColor(Color.White)
          .visibility(Visibility.Hidden)
      }
      .backgroundColor(Color.Black)
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Column() {
        Row(){
          Button('打开').onClick(() => {
            this.getUIContext().setCustomKeyboardContinueFeature(CustomKeyboardContinueFeature.ENABLED);
          }).fontSize(20).width('50%').key('button')
          Button('关闭').onClick(() => {
            this.getUIContext().setCustomKeyboardContinueFeature(CustomKeyboardContinueFeature.DISABLED);
          }).fontSize(20).width('50%').key('button')
        }
        RichEditor({ controller: this.controller })
          .id('RICH_1')
          .placeholder('非属性字符串RICH_1绑定自定义键盘1-ComponentContent')
          .customKeyboard(this.CustomKeyboardBuilder())

        RichEditor({ controller: this.controller1 })
          .id('RICH_2')
          .placeholder('非属性字符串RICH_2通过modifier绑定自定义键盘1-ComponentContent')
          .attributeModifier(this.mod)
        RichEditor({ controller: this.controller2 })
          .id('RICH_3')
          .placeholder('非属性字符串RICH_3绑定自定义键盘2-CustomBuilder')
          .customKeyboard(this.CustomKeyboardBuilder())

        RichEditor({ controller: this.styleStringController })
          .id('RICH_4')
          .placeholder('属性字符串RICH_4绑定自定义键盘1-ComponentContent')
          .customKeyboard(this.CustomKeyboardBuilder())

      }.width('100%')
      .height('80%')
      .backgroundColor('#F1F3F5')


        Row() {
          this.PassBtn($r('app.string.btn_fullscreen'), true);
          Button() {
            Image($r('app.media.ic_public_help'))
              .width('20vp')
              .height('20vp')
          }
          .margin({ bottom: '20vp' })
          .width('30%')
          .height('30vp')
          .backgroundColor(Color.Grey)
          .onClick(() => {
            AlertDialog.show(
              {
                title: '操作提示',
                message: this.stepTips,
                confirm: {
                  value: 'OK',
                  action: () => {
                  }
                }
              }
            )
          })
          this.FailBtn($r('app.string.btn_fullscreen'), true);
        }
        .height('10%')
        .width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .backgroundColor(Color.Black)
    }.width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
    
  }
}