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
import fileio from '@ohos.fileio';
import {CustomContainer} from '../common/TimeExperienceCustomContainer';
import FirstDialog from '../model/FirstDialog';
import router from '@ohos.router';

let path = globalThis.dir;
let path1 = path + '/ExperienceData';
let Xpath = path1 + '/CompleteTimeKeyboard.log';

@Entry
@Component
struct CustomContainerUser {
  @State name: string = 'KeyboardDisplay';
  @State StepTips: string = '操作步骤：根据操作提示点击输入框等待键盘加载'+'\n'+'预期结果：输入键盘弹出时延小于1000ms测试通过';
  @State Vue: boolean = false;
  @State StartEnable: boolean = true;
  @State time: string = '0';
  scroller: Scroller = new Scroller();
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
    this.Vue = false;
  }

  @Builder specificNoParam() {
    Column() {
      Flex({direction:FlexDirection.Column,alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Scroll(this.scroller) {
          Column(){
            Row(){
              Text(`根据以下操作步骤完成测试`+ '\n' + '\n' + '\n' + '\n'+ '\n' + '\n' + '\n' + '\n')
                .fontColor(Color.White).fontSize('24fp')
            }
            Row(){
              Text(`测试步骤:`+ '\n' + '\n' + '1.测试设备通过USB连接工作台' + '\n' + '\n' + `2.点击开始键进入信息` + '\n' + '\n' +
              '3.新建一条信息显示输入框'+ '\n' + '\n' + `4.工作台运行’点击启动测试.bat‘选择完成时延>键盘按键弹出`+ '\n' + '\n' +
              `5.点击输入框等待键盘弹出` + '\n' + '\n' + '6.待脚本执行结束回到Validator点击结束键' + '\n' + '\n'
              + `7.若弹出键盘时延小于或等于1000ms则通过测试` + '\n' + '\n' + '\n' + '\n' )
                .fontColor(Color.White).fontSize('20fp')
            }
            Row(){
              Column(){
                Button(`开始`)
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .width('30%')
                  .enabled(this.StartEnable)
                  .opacity(this.StartEnable? 1 : 0.4)
                  .onClick(async () => {
                    this.StartEnable = !this.StartEnable;
                    let bundleName=new String("com.ohos.mms").toString();
                    let abilityName=new String("com.ohos.mms.MainAbility").toString();
                    let str = {
                      "bundleName": bundleName,
                      "abilityName": abilityName,
                    }

                    globalThis.abilityContext.startAbility(str, (err, data) => {
                      if(err) {
                        return;
                      }
                    })
                  })
              }
              Column(){
                Button(`结束`)
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .width('30%')
                  .enabled(!this.StartEnable)
                  .opacity(!this.StartEnable? 1 : 0.4)
                  .onClick(() => {
                    this.StartEnable = !this.StartEnable
                    let fd = fileio.openSync(Xpath, 0o100 | 0o2002, 0o664);
                    let buf = new ArrayBuffer(4096);
                    fileio.readSync(fd,buf);
                    let report = String.fromCharCode.apply(null,new Uint8Array(buf));
                    let head = report.indexOf(":");
                    this.time = report.substring(head+1);
                    let time = parseFloat(this.time)
                    if( 0 < time && time < 1000 ) {
                      this.Vue = true;
                    }
                  })
              }
            }
            Row(){
              Text('\n' + '\n' + '\n' + '\n'+ '\n' + '\n' + '\n' + '\n' + `输入键盘弹出时延：` + this.time + 'ms' )
                .fontColor(Color.White).fontSize('24fp')
            }
          }
        }
      }
    }.width('100%').height('80%').backgroundColor(Color.Black)
    .justifyContent(FlexAlign.SpaceEvenly)
  }
  build() {
    Column() {
      CustomContainer({
        title: this.name,
        Url:'pages/Experience/Experience_index',
        StepTips:this.StepTips,
        content: this.specificNoParam,
        name:$name,
        Vue: $Vue,
        StartEnable: $StartEnable,
        time: $time
      })
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
  onBackPress(){
    router.replaceUrl({
      url:'pages/Experience/Experience_index',
    })
  }
}