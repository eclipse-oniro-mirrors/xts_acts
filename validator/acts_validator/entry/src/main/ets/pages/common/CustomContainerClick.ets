/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import fs from '@ohos.file.fs';
import promptAction from '@ohos.promptAction';
import router from '@ohos.router';
import Logger from '../model/Logger';
import { BusinessError } from '@ohos.base';

export class RectValue {
  left: number = 0;
  top: number = 0;
  right: number = 0;
  bottom: number = 0;
}

export default class RangeFunc {
  static rect_left: number;
  static rect_top: number;
  static rect_right: number;
  static rect_bottom: number;
  static rect_value: RectValue;

  static getComponentRect(key: string) {
    let strJson = getInspectorByKey(key);
    let obj: Record<string, Object> = JSON.parse(strJson);
    let rectInfo: Array<string> = JSON.parse('[' + obj.$rect + ']');
    RangeFunc.rect_left = JSON.parse('[' + rectInfo[0] + ']')[0];
    RangeFunc.rect_top = JSON.parse('[' + rectInfo[0] + ']')[1];
    RangeFunc.rect_right = JSON.parse('[' + rectInfo[1] + ']')[0];
    RangeFunc.rect_bottom = JSON.parse('[' + rectInfo[1] + ']')[1];
    RangeFunc.rect_value = {
      left: RangeFunc.rect_left, top: RangeFunc.rect_top, right: RangeFunc.rect_right, bottom: RangeFunc.rect_bottom
    };
    console.info(JSON.stringify(RangeFunc.rect_value));
    return RangeFunc.rect_value;
  }
}

@Builder
function specificNoParam($$?: ABuilderParam) {
  Column() {
    Scroll() {
      Column() {
        Row() {
          Button('1')
            .fontSize(24)
            .width('100vp')
            .height('100vp')
            .backgroundColor($$ ? ($$.paramA1 ? Color.Green : Color.Blue) : Color.Blue)
            .key('btn1')

          Button('2')
            .fontSize(24)
            .width('100vp')
            .height('100vp')
            .backgroundColor($$ ? ($$.paramA2 ? Color.Green : Color.Blue) : Color.Blue)
            .key('btn2')
        }
        .justifyContent(FlexAlign.SpaceEvenly)
        .width('100%')
        .height('50%')

        Row() {
          Button('3')
            .fontSize(24)
            .width('100vp')
            .height('100vp')
            .backgroundColor($$ ? ($$.paramA3 ? Color.Green : Color.Blue) : Color.Blue)
            .key('btn3')

          Button('4')
            .fontSize(24)
            .width('100vp')
            .height('100vp')
            .backgroundColor($$ ? ($$.paramA4 ? Color.Green : Color.Blue) : Color.Blue)
            .key('btn4')
        }
        .justifyContent(FlexAlign.SpaceEvenly)
        .width('100%')
        .height('50%')
      }
    }
    .scrollBarWidth('6vp')
    .scrollBarColor('#cccccc')
  }
  .width('100%')
  .height('80%')
  .backgroundColor(Color.White)
}

class ABuilderParam {
  paramA1: boolean = false;
  paramA2: boolean = false;
  paramA3: boolean = false;
  paramA4: boolean = false;
}

@Component
export struct CustomContainerClick {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  @Link FillColor: string;
  @Link X: number;
  @Link name: string;
  @Link btnOne: boolean;
  @Link btnTwo: boolean;
  @Link btnThree: boolean;
  @Link btnFour: boolean;
  @Link Vue: boolean;
  Url: string = '';
  title: string = '';
  StepTips: string = '';

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.Vue == false) {
      Button({ stateEffect: this.Vue }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }
      .width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .opacity(0.4)
      .onClick(() => {

      })
    }
    else {
      Button({ stateEffect: this.Vue }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }
      .width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .onClick(() => {
        router.back({
          url: this.Url,
          params: {
            result: 'true ', title: this.name,
          }
        })
        promptAction.showToast({
          message: '通过', duration: 1000
        });
      })
    }
  }

  @Builder
  FailBtn(text: Resource, isFullScreen: boolean) {
    Button() {
      Image($r('app.media.ic_public_fail'))
        .width('20vp')
        .height('20vp')
    }
    .width('30%')
    .height('30vp')
    .backgroundColor(Color.Grey)
    .onClick(() => {
      router.back({
        url: this.Url,
        params: {
          result: 'false', title: this.name,
        }
      })
      promptAction.showToast({
        message: '失败', duration: 1000
      });
    })
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
            url: this.Url,
            params: { result: 'None', }
          })
        })

        Text(this.title)
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

      specificNoParam({ paramA1: this.btnOne, paramA2: this.btnTwo, paramA3: this.btnThree, paramA4: this.btnFour })
      Blank()

      Row() {
        this.PassBtn($r('app.string.btn_fullscreen'), true);
        Button() {
          Image($r('app.media.ic_public_help'))
            .width('20vp')
            .height('20vp')
        }
        .width('30%')
        .height('30vp')
        .backgroundColor(Color.Grey)
        .onClick(() => {
          AlertDialog.show(
            {
              title: '操作提示',
              message: this.StepTips,
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
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .backgroundColor(Color.Black)
    }
    .height('98%')
    .width('100%')
  }
}