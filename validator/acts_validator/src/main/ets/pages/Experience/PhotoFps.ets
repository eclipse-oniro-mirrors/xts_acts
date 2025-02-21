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
import fileio from '@ohos.fileio';
import {CustomContainer} from '../common/ExperienceCustomContainer';
import FirstDialog from '../model/FirstDialog';

let path = globalThis.dir;
let path1 = path + '/ExperienceData';
let Xpath = path1 + '/PhotoFps.log';

@Entry
@Component
struct CustomContainerUser {
  @State name: string = 'PhotoFps';
  @State StepTips: string = '操作步骤：根据操作提示滑动图库测试帧率'+'\n'+'预期结果：帧率大于或等于55帧测试通过';
  @State Vue: boolean = false;
  @State StartEnable: boolean = true;
  @State Fps: string = '0';
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
              Text(`测试步骤:`+ '\n' + '\n' + '1.测试设备通过USB连接工作台' + '\n' + '\n' + `2.在图库中预置500张图片`+ '\n' + '\n'
              + `3.点击开始键进入图库`+ '\n' + '\n' + `4.工作台运行’点击启动测试.bat‘选择帧率>图库`+ '\n' + '\n' +
              `5.滑动图库缩略图界面连续10s以上` + '\n' + '\n' + '6.回到PhotoFps测试项点击结束键' + '\n' + '\n' +
              `7.若测试最高帧率大于或等于55帧则通过测试` + '\n' + '\n' + '\n' + '\n' + '\n' + '\n' + '\n' + '\n' )
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
                    let bundleName=new String("com.ohos.photos").toString();
                    let abilityName=new String("com.ohos.photos.MainAbility").toString();
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
                    let headList = new Array();
                    let endList = new Array();
                    let head = report.indexOf(":");
                    let end = report.indexOf('|');
                    let Fps = new Array();

                    while(head > -1){
                      headList.push(head);
                      head = report.indexOf(":",head + 1);
                    }
                    while(end > -1){
                      endList.push(end);
                      end = report.indexOf("|",end + 1);
                    }
                    for(let i = 0; i < headList.length; i++) {
                      Fps[i] = Number(report.substring(headList[i]+1,endList[i]));
                    }
                    let maxFps = Math.max(...Fps);
                    this.Fps = maxFps.toString();
                    if(maxFps >= 55) {
                      this.Vue = true;
                    }
                  })
              }
            }
            Row(){
              Text('\n' + '\n' + '\n' + '\n'+ '\n' + '\n' + '\n' + '\n' + `测试结果：` + this.Fps + '帧' )
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
        Fps: $Fps
      })
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
  onBackPress(){
    router.replaceUrl({
      url:'pages/Experience/Experience_index',
    })
  }
}