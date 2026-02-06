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
import { CustomContainer } from '../common/TimeExperienceCustomContainer';
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
  @State name: string = 'StartTaskManager';
  @State toSP_daemon: string = 'SP_daemon -editor completeTime com.ohos.launcher ohtest';
  @State StepTips: string = '操作步骤：根据操作提示打开任务管理器' + '\n' + '预期结果：打开任务管理器时延小于1000ms测试通过';
  @State Vue: boolean = false;
  @State StartEnable: boolean = true;
  @State time: number = 0;
  @State time1: string = '';
  @State select: number = 2;
  @State appName: string = '任务管理器';
  @State appBundleName: string = "com.ohos.launcher";
  @State appAbilityName: string = "com.ohos.launcher.MainAbility";
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
              Text(`测试步骤:` + '\n' + '\n' + '\n' + '\n' + `1.点击开始键进入桌面` + '\n' + '\n' + '2.点击悬浮球开始测试' + '\n' + '\n' +
                `3.点击右下角方框开启任务管理器` + '\n' + '\n' + '4.待悬浮球倒计时结束显示为done后返回validator应用' + '\n' + '\n' + `5.点击结束观察测试结果` + '\n' + '\n' +
                `6.若启动任务管理器时延小于1000ms则通过测试` + '\n' + '\n' + `注意事项:` + '\n' + '\n' +
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
                      bundleName: "com.ohos.launcher",
                      abilityName: "com.ohos.launcher.MainAbility",
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
                    let head: number = report.indexOf(":");
                    this.time1 = report.substring(head + 1);
                    this.time = parseFloat(this.time1);
                    let time = this.time;
                    if (0 < time && time < 1000) {
                      this.Vue = true;
                    } else if (isNaN(this.time)) {
                      this.time = -1000;
                    }
                    globalThis.HideFloatingWindow();
                  })
              }
            }

            Row() {
              Text('\n' + '\n' + `启动任务管理器时延：` + this.time + 'ms')
                .fontColor(Color.White)
                .fontSize('24fp')
            }
          }
        }.scrollBarColor(Color.White) // 滚动条颜色
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
        time: $time,
        time1: $time1,
        appName: $appName,
        appBundleName: $appBundleName,
        appAbilityName: $appAbilityName,
      }).margin({ bottom: '20vp' })
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