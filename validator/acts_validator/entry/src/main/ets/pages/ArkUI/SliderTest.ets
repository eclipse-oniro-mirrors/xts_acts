/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { UIContext } from '@ohos.arkui.UIContext';
import { NodeController, FrameNode, ComponentContent, typeNode } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import Logger from '../model/Logger';
import fs from '@ohos.file.fs';
import FirstDialog from '../model/FirstDialog';

const TAG = '[SliderTest]';

class Params {
  public text: ResourceStr = ''
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
    new ComponentContent(this.uiContext, wrapBuilder(buildTest), new Params($r('sys.string.ohos_id_menu_has_filter'),4));
  private prefixNode3: ComponentContent<Params> =
    new ComponentContent<Params>(this.uiContext, wrapBuilder(buildTest), new Params(
      'message5',5));
  private suffixNode3: ComponentContent<Params> =
    new ComponentContent(this.uiContext, wrapBuilder(buildTest), new Params('message6',6));

  @State name: string = 'SliderTest';
  @State stepTips: string = 
    '设备支持屏幕朗读时\n' + '操作步骤:\n' +
    '1、从上到下依次滑动观察屏幕朗读情况\n' + '\n' +
    '预期结果：1、滑动第一个滑动条到最左侧时，屏幕朗读"prefixText"\n' +
    '2、滑动第一个滑动条到最右侧时，屏幕朗读"suffixText"\n' +
    '3、滑动第二个滑动条到最左侧时，屏幕朗读"😎😌👨‍👩‍👦‍👦👨👨‍👩‍👦‍👦👁‍🗨123"\n' +
    '4、滑动第二个滑动条到最右侧时，屏幕朗读"100"\n' +
    '5、滑动第三个滑动条到最左侧时，屏幕朗读"description"\n' +
    '6、滑动第三个滑动条到最右侧时，屏幕朗读"description"\n'
  @State isOk: boolean = false;
  @State intervalNum: number = 0;
  @State uri: string = '';
  @State blockArr: string[] = [];
  udKey: string = '';

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

  aboutToAppear() {
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
        Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceAround }) {
          Column({space:30}){
            Slider({
            value: 50,
            min: 0,
            max: 100,
            step: 10,
            style: SliderStyle.OutSet,
            })
            .showSteps(true)
            .prefix(this.prefixNode1,{
                accessibilityText: 'prefixText',
                accessibilityDescription: 'prefixDescription',
                accessibilityLevel: 'auto',
                accessibilityGroup: true
            })
            .suffix(this.suffixNode1,{
                accessibilityText: 'suffixText',
                accessibilityDescription: 'suffixDescription',
                accessibilityLevel: '',
                accessibilityGroup: true
            })

            Slider({
            value: 50,
            min: 0,
            max: 100,
            step: 10,
            style: SliderStyle.OutSet,
            })
            .showSteps(true)
            .prefix(this.prefixNode2,{
                accessibilityText: '😎😌👨‍👩‍👦‍👦👨👨‍👩‍👦‍👦👁‍🗨123',
                accessibilityDescription: '😎😌👨‍👩‍👦‍👦👨👨‍👩‍👦‍👦👁‍🗨123',
                accessibilityLevel: 'yes',
                accessibilityGroup: false
            })
            .suffix(this.suffixNode2,{
                accessibilityText: '',
                accessibilityDescription: '',
                accessibilityLevel: 'no',
                accessibilityGroup: true
            })

            Slider({
            value: 50,
            min: 0,
            max: 100,
            step: 10,
            style: SliderStyle.OutSet,
            })
            .showSteps(true)
            .prefix(this.prefixNode3,{
                accessibilityText: $r('app.string.EntryAbility_desc'),
                accessibilityDescription: $r('app.string.EntryAbility_desc'),
                accessibilityLevel: 'no-hide-descendants',
                accessibilityGroup: undefined
            })
            .suffix(this.suffixNode3,{
                accessibilityText: $r('app.string.EntryAbility_desc'),
                accessibilityDescription: $r('app.string.EntryAbility_desc'),
                accessibilityLevel: 'none',
                accessibilityGroup: null
            })
          }
        }
      }.height('80%')
      .width('100%')
      .backgroundColor(Color.White)

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