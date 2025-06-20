/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import { CustomContainer } from '../common/ExperienceCustomContainer';
import FirstDialog from '../model/FirstDialog';
import context from '@ohos.app.ability.common';
import { AppInfoItem } from '../model/LocalConfigEntity';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import promptAction from '@ohos.promptAction';

let AppNameList = ['图库'];
let AppBundleNameList = ["com.ohos.photos"];
let AppAbilityNameList = ["com.ohos.photos.MainAbility"];

let abilityContext = getContext(this) as context.UIAbilityContext;

@Entry
@Component
struct CustomContainerUser {
  @State name: string = 'PhotoFps';
  @State toSP_daemon: string = 'SP_daemon -editor fpsohtest com.ohos.photos 图库';
  @State StepTips: string = '操作步骤：根据操作提示滑动图库测试帧率' + '\n' + '预期结果：帧率大于或等于55帧测试通过';
  @State Vue: boolean = false;
  @State StartEnable: boolean = true;
  @State Fps: number = 0;
  @State select: number = 2;
  @State appName: string = '图库';
  @State appBundleName: string = 'com.ohos.photos';
  @State appAbilityName: string = 'com.ohos.photos.MainAbility';
  @State appInfoList: Array<AppInfoItem> = globalThis.appList;
  scroller: Scroller = new Scroller();

  onPageShow() {
    for (let i = 1; i < this.appInfoList.length; i++) {
      AppNameList[i] = this.appInfoList[i].appName;
    }
    for (let i = 1; i < this.appInfoList.length; i++) {
      AppBundleNameList[i] = this.appInfoList[i].packageName;
    }
    for (let i = 1; i < this.appInfoList.length; i++) {
      AppAbilityNameList[i] = this.appInfoList[i].abilityName;
    }
  }

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name);
    this.Vue = false;
    globalThis.SendMessage = this.toSP_daemon;
    globalThis.HideFloatingWindow();
    globalThis.resultNum = '0';
  }

  @Builder
  specificNoParam() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Scroll(this.scroller) {
          Column() {
            Row() {
              Column() {
                Button(`选择测试应用`)
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .width('30%')
                  .margin('10vp')
                  .onClick(() => {
                    TextPickerDialog.show({

                      range: AppNameList,
                      selected: this.select,
                      onAccept: (value: TextPickerResult) => {
                        // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
                        this.select = Number(value.index)
                        console.info("TextPickerDialog:onAccept()" + JSON.stringify(value))
                        globalThis.AppNameCamera = AppNameList[Number(value.index)];
                        this.appName = globalThis.AppNameCamera;
                        globalThis.AppBundleNameCamera = AppBundleNameList[Number(value.index)];
                        this.appBundleName = globalThis.AppBundleNameCamera;
                        globalThis.AppAbilityNameCamera = AppAbilityNameList[Number(value.index)];
                        this.appAbilityName = globalThis.AppAbilityNameCamera;
                      },
                      onCancel: () => {
                        console.info("TextPickerDialog:onCancel()")
                      },
                      onChange: (value: TextPickerResult) => {
                        console.info("TextPickerDialog:onChange()" + JSON.stringify(value))
                      }
                    })

                  })
              }

              Column() {
                Button(`无可测试应用`)
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .width('30%')
                  .onClick(() => {
                    promptAction.showToast({
                      message: '无可测试应用'
                    })
                    router.back({
                      url: 'pages/Experience/Experience_index',
                      params: { result: 'false', title: this.name }
                    })
                  })
              }
            }

            Row() {
              Text('\n' + '\n' + `根据以下操作步骤完成测试` + '\n' + '\n' + '待测试应用为：' + this.appName + '\n' + '\n')
                .fontColor(Color.White)
                .fontSize('24fp')
            }

            Row() {
              Text(`测试步骤:` + '\n' + '\n' + '\n' + '\n' + `1.在图库中预置500张图片` + '\n' + '\n' + '2.点击开始键进入图库' + '\n' + '\n' +
                `3.点击悬浮球开始测试` + '\n' + '\n' + '4.滑动图库缩略图界面连续10s以上' + '\n' + '\n' + `5.待悬浮球倒计时结束显示为done后返回validator应用` + '\n' + '\n' +
                `6.点击结束观察测试结果` + '\n' + '\n' + `7.若测试最高帧率大于或等于55帧则通过测试` + '\n' + '\n' + `注意事项:` + '\n' + '\n' +
                `※1.若悬浮球显示连接失败，需重启设备并在run.bat中输入run validator拉起测试` + '\n' + '\n' + `※2.双击悬浮球中断测试，长按悬浮球提前结束测试` + '\n' + '\n' +
                `※3.若无可测试应用，点击无可测试应用按钮`)
                .fontColor(Color.White)
                .fontSize('20fp')
            }

            Row() {
              Column() {
                Button(`开始`)
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .width('30%')
                  .margin('10vp')
                  .enabled(this.StartEnable)
                  .opacity(this.StartEnable ? 1 : 0.4)
                  .onClick(async () => {
                    globalThis.ShowFloatingWindow();
                    this.StartEnable = !this.StartEnable;
                    let str: Want = {
                      bundleName: this.appBundleName,
                      abilityName: this.appAbilityName,
                    }

                    abilityContext.startAbility(str).then((data) => {

                    }).catch((error: BusinessError) => {

                    })
                  })
              }

              Column() {
                Button(`结束`)
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .width('30%')
                  .enabled(!this.StartEnable)
                  .opacity(!this.StartEnable ? 1 : 0.4)
                  .onClick(() => {
                    this.StartEnable = !this.StartEnable;
                    let report : string = globalThis.resultNum;
                    // let reg = /fps:(\d+)/g;
                    let regexp: RegExp = new RegExp('fps:(\\d+)', 'g')
                    if (regexp == null){
                      this.Fps = 0;
                    } else {
                      let matches = report.match(regexp);
                      if (matches == null) {
                        this.Fps = 0;
                      }
                      else {
                        let fpsValues = matches.map(match => parseInt(match.substring(4)));
                        let maxFps = Math.max(...fpsValues);
                        this.Fps = maxFps;
                        if (maxFps >= 55) {
                          this.Vue = true;
                        }
                      }
                    }
                    globalThis.HideFloatingWindow();
                  })
              }
            }

            Row() {
              Text('\n' + '\n' + `测试结果：` + this.Fps + '帧')
                .fontColor(Color.White)
                .fontSize('24fp')
            }
          }
        }
        .scrollBarColor(Color.White) // 滚动条颜色
        .scrollBarWidth(10)
      }
    }
    .width('100%')
    .height('80%')
    .backgroundColor(Color.Black)
    .justifyContent(FlexAlign.SpaceEvenly)
  }

  build() {
    Column() {
      CustomContainer({
        title: this.name,
        Url: 'pages/Experience/Experience_index',
        StepTips: this.StepTips,
        content: this.specificNoParam,
        name: $name,
        Vue: $Vue,
        StartEnable: $StartEnable,
        Fps: $Fps,
        appName: $appName,
        appBundleName: $appBundleName,
        appAbilityName: $appAbilityName,
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
  }

  onBackPress() {
    router.replaceUrl({
      url: 'pages/Experience/Experience_index',
    })
  }
}