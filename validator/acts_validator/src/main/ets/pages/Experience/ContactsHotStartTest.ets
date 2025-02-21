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
import {CustomContainer} from '../common/StartExperienceCustomContainer';
import FirstDialog from '../model/FirstDialog';
import context from '@ohos.app.ability.common';

let abilityContext = getContext(this) as context.UIAbilityContext;
let path = globalThis.dir;
let path1 = path + '/ExperienceData';
let ContactsColdPath = path1 + '/HotStartContacts.log';
@Entry
@Component
struct CustomContainerUser {
  @State name: string = 'ContactsHotStart';
  @State StepTips: string = '操作步骤：根据操作提示运行脚本文件，启动应用'+'\n'+'预期结果：所有应用热启动时延小于600ms则测试通过';
  @State Vue: boolean = false;
  @State StartEnable: boolean = true;
  @State num: number = 0;
  @State setNum: number = 0;
  @State photosNum: number = 0;
  @State mmsNum: number = 0;
  @State cameraNum: number = 0;
  @State contactsNum: number = 0;
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
              Text(`根据以下操作步骤完成测试`+ '\n' + '\n' )
                .fontColor(Color.White).fontSize('24fp')
            }
            Row(){
              Text(`测试步骤:`+ '\n' + '\n' + '1.测试设备通过USB连接工作台' + '\n' + '\n' + `2.点击开始键进入系统桌面`+ '\n' + '\n'
              + `3.开启联系人应用回退到桌面，保证此时后台应用存在` + '\n' + '\n' + `4.工作台运行’点击启动测试.bat‘选择热启动>联系人测试`+ '\n' + '\n' +
              `5.测试应用手动执行热启动返回validator界面` + '\n' + '\n' + '6.点击结束键观察测试结果' + '\n' + '\n'
              + `7.若所有热启动测试均在规定时延内完成则通过测试` + '\n' + '\n' + '\n' + '\n' )
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
                    this.num = 0;
                    this.StartEnable = !this.StartEnable;
                    let str = {
                      bundleName:"com.ohos.launcher",
                      abilityName: "com.ohos.launcher.MainAbility",
                    }
                    abilityContext.startAbility(str).then((data) => {

                    }).catch((error) => {

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
                    /*
                              Contacts
                     */
                    let ContactsFd = fileio.openSync(ContactsColdPath, 0o100 | 0o2002, 0o664);
                    let ContactsBuf = new ArrayBuffer(4096);
                    fileio.readSync(ContactsFd,ContactsBuf);
                    let ContactsReport = String.fromCharCode.apply(null,new Uint8Array(ContactsBuf));
                    let ContactsHead = ContactsReport.indexOf(':');
                    let ContactsTime = ContactsReport.substring(ContactsHead+1);
                    this.contactsNum = parseFloat(ContactsTime);
                    if( 0 < this.contactsNum && this.contactsNum < 600 ) {
                      this.num++
                    }
                    if( this.num === 1 ) {
                      this.Vue = true;
                    }
                  })
              }
            }
            Row(){
              Text('\n' + '\n' + '\n' + '\n' + `测试结果：` + '\n' + '\n' + '联系人热启动时延' + this.contactsNum + 'ms')
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
        num: $num,
        setNum: $setNum,
        photosNum: $photosNum,
        mmsNum: $mmsNum,
        cameraNum: $cameraNum,
        contactsNum: $contactsNum,
      })
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
  onBackPress(){
    router.replaceUrl({
      url:'pages/Experience/Experience_index',
    })
  }
}
