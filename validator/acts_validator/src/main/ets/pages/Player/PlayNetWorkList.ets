/*
* Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
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

import promptAction from '@ohos.promptAction';
import router from '@ohos.router';
import fs from '@ohos.file.fs';
import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import data_preferences from '@ohos.data.preferences';
import MediaUtils from '../model/MediaUtils';

const TAG = 'ParseXML';
let path = globalThis.dir;
let path1 = path + '/Player';

let VarColor = [];
let ColorBackPath = path1 + '/PlayerNetWorkColorBack.txt';
let txtPath = path1 + '/PlayerNetWorkReport.txt';

class NetWork {
  nameStr: string;
  uriStr: string;
  isPass: boolean;

  constructor(nameStr: string, uriStr: string, isPass?: boolean) {
    this.nameStr = nameStr;
    this.uriStr = uriStr;
    this.isPass = isPass;
  }
}

@Entry
@Component
struct PlayNetWorkList {
  @State ClearAll: boolean = false;
  @State name: string = 'PlayerNetWork';
  @State Vue: boolean = false;
  private  TestCaseList: Array<NetWork>
    = [new NetWork('https', 'https:\/\/vd3.bdstatic.com\/mda-pdc2kmwtd2vxhiy4\/cae_h264\/1681502407203843413\/mda-pdc2kmwtd2vxhiy4.mp4')];
  private current: number = undefined;
  @State count: number = 0;
  @State result: string = '';
  @State Url: string = 'pages/Player/Player_index';
  @State TEST: number = 0;
  @State ColorObject: string[] = VarColor;

  async onPageShow() {
    let Test = null;
    let context = null;
    context = globalThis.getContext();
    let preferences;

    let promise = data_preferences.getPreferences(context, 'mystore');
    await promise.then((object) => {
      preferences = object;
    });
    promise = preferences.get('PlayerNetWork', 0);
    await promise.then((data) => {
      Test = data;
      console.info("Succeeded in getting value of 'PlayNetWork'. Data: " + data);
    });
    if (Test != 1) {
      let fd = fs.openSync(ColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      for (let i = 0; i < this.TestCaseList.length; i++) {
        let log = (this.TestCaseList[i].nameStr + ';' + '#ff808080' + ';').toString();
        fs.writeSync(fd.fd, log);
      }
      fs.closeSync(fd);
    }
    promise = preferences.put('PlayerNetWork', 1);
    promise.then(() => {
      console.info("Succeeded in putting value of 'PlayNetWork'.");
    });
    promise = preferences.flush();
    promise.then(() => {
      console.info("Succeeded in flushing.");
    });
    this.TEST = Test;

    let opt = fs.openSync(ColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let buff = new ArrayBuffer(40960);
    fs.readSync(opt.fd, buff);
    let ColorBack = String.fromCharCode.apply(null, new Uint8Array(buff));
    let TestList = ColorBack.split(';');
    for (let i = 0; i < Math.floor(TestList.length / 2); i++) {
      VarColor[i] = TestList[i * 2+1];
    }
    fs.closeSync(opt);

    if (this.count === 1) {
      this.result = router.getParams()['result'];
      let titles = router.getParams()['title'];
      let name1 = '刚刚点进了哪个用例：' + titles;
      let results = this.result;
      let WriteTitle = (titles).toString();
      let number = WriteTitle.length + 11;
      let Index = ColorBack.indexOf(WriteTitle);

      if (this.result === 'true ') {
        this.ColorObject[this.current] = '#ff008000';
        let Log = (titles + ';' + '#ff008000' + ';');
        let key = ColorBack.substring(Index, Index + number);
        let FD = fs.openSync(ColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        ColorBack = ColorBack.replace(key, Log);
        let buffer = new ArrayBuffer(4096);
        let rd = fs.readSync(FD.fd, buffer);
        let Report = ColorBack.substring(0, rd);
        fs.closeSync(FD);
        let Fd = fs.openSync(ColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        fs.writeSync(Fd.fd, Report);
        filewrite(name1, results, titles);
      }
      else if (this.result === 'false') {
        this.ColorObject[this.current] = '#ffff0000';
        let Log = (titles + ';' + '#ffff0000' + ';');
        let key = ColorBack.substring(Index, Index + number);
        let FD = fs.openSync(ColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        ColorBack = ColorBack.replace(key, Log);
        let buffer = new ArrayBuffer(4096);
        let rd = fs.readSync(FD.fd, buffer);
        let Report = ColorBack.substring(0, rd);
        fs.closeSync(FD);
        let Fd = fs.openSync(ColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        fs.writeSync(Fd.fd, Report);
        filewrite(name1, results, titles);
      }
      else if (this.result === 'None') {
        this.ColorObject[this.current] = this.ColorObject[this.current];
      }
    }
    // 所有测试项满足返回ture
    let color = '#ff008000';
    let colorBol = this.ColorObject.every((item) => item === color);
    this.Vue = colorBol;
  }

  build() {
    Column() {
      Row() {
        Button() {
          Image($r('app.media.ic_public_back'))
            .width('20vp')
            .height('18vp')
        }
        .backgroundColor(Color.Black)
        .size({ width: '40vp', height: '30vp' })
        .onClick(() => {
          router.back({
            url: 'pages/Player/Player_index',
            params: { result: 'None', }
          })
        })

        Row() {
          Text('PlayNetWorkList')
            .fontColor(Color.White)
            .fontSize('22fp')
        }.justifyContent(FlexAlign.SpaceAround).backgroundColor(Color.Black)

        Row() {
          Button() {
            Image($r('app.media.ic_public_delete'))
              .width('30vp')
              .height('30vp')
          }.backgroundColor(Color.Black)
          .onClick(() => {
            AlertDialog.show(
              {
                message: "是否删除所有记录",
                primaryButton: {
                  value: 'Yes',
                  action: () => {
                    this.ClearAll = true;
                    this.ColorObject.forEach((value, index) => {
                      this.ColorObject[index] = '#ff808080';
                    });
                    this.ClearText();
                    promptAction.showToast({
                      message: '结果已删除', duration: 1000
                    });
                  }
                },
                secondaryButton: {
                  value: 'No',
                  action: () => {

                  }
                },
                cancel: () => {

                }
              }
            )
          })
        }
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)
      .margin({ top: '15vp' })
      .height('6%')
      .backgroundColor(Color.Black)

      List({ space: 5 }) {
        ForEach(this.TestCaseList, (item, index) => {
          ListItem() {
            Row() {
              Text(item.nameStr)
                .fontSize(16)
                .fontColor(Color.Black)
            }
            .width('100%')
            .height(50)
            .alignItems(VerticalAlign.Center)
            .backgroundColor(this.count === 0 && this.TEST === 0 ? '#ff808080' : this.ColorObject[index])
            .onClick(() => {
              this.count = 1;
              this.ClearAll = false;
              this.current = index;
              router.push({
                url: 'pages/Player/PlayNetWork',
                params: {
                  url: item.uriStr,
                  title: item.nameStr
                }
              })
            })
          }
        }, item => item.title)
      }
      .width('100%')
      .height('80%')

      Row() {
        Blank()
        Button({ stateEffect: this.Vue }) {
          Image($r('app.media.ic_public_pass'))
            .width('20vp')
            .height('20vp')
        }
        .width('40%')
        .height('30vp')
        .backgroundColor(Color.Grey)
        .enabled(this.Vue)
        .opacity(this.Vue ? 1 : 0.4)
        .onClick(() => {
          router.back({
            url: this.Url,
            params: { result: 'true ', title: this.name }
          })
          promptAction.showToast({
            message: '通过', duration: 1000
          });
        })

        Blank().width(40)
        Button() {
          Image($r('app.media.ic_public_fail'))
            .width('20vp')
            .height('20vp')
        }
        .width('40%')
        .height('30vp')
        .backgroundColor(Color.Grey)
        .onClick(() => {
          router.back({
            url: 'pages/Player/Player_index',
            params: { result: 'false', title: this.name,
            }
          })
          console.log('wwwwwwwwww' + this.Url)
          promptAction.showToast({
            message: '失败', duration: 1000
          });
        })

        Blank()
      }.width('100%')
      .height('14%')
      .backgroundColor(Color.Black)
      .justifyContent(FlexAlign.Center)
    }.width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
  }

  ClearText() {
    fs.unlinkSync(txtPath);
    fs.unlinkSync(ColorBackPath);
    fs.openSync(txtPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let fd = fs.openSync(ColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    for (let i = 0; i < this.TestCaseList.length; i++) {
      let log = (this.TestCaseList[i].nameStr + ';' + '#ff808080' + ';').toString();
      fs.writeSync(fd.fd, log);
    }
  }

  onBackPress() {
    router.replaceUrl({
      url: 'pages/Player/Player_index',
    })
  }
}

function filewrite(name1, results, titles) {
  let fd = fs.openSync(txtPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  let buf = new ArrayBuffer(4096);
  let RD = fs.readSync(fd.fd, buf);
  console.info("RRRRRRRRRRd" + RD);
  let report = String.fromCharCode.apply(null, new Uint8Array(buf));
  let WriteTitle = (titles).toString();
  let WriteResult = (results).toString();
  let number = WriteTitle.length + WriteResult.length + 2;
  let Index = report.indexOf(WriteTitle);
  let Log = (titles + ";" + results + ";").toString();
  if (Index == -1) {
    fs.writeSync(fd.fd, Log);
  }
  else if (Index != -1) {
    let key = report.substring(Index, Index + number);
    let FD = fs.openSync(txtPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    report = report.replace(key, Log);
    let buffer = new ArrayBuffer(4096);
    let rd = fs.readSync(FD.fd, buffer);
    let Report = report.substring(0, rd);
    fs.closeSync(FD);
    let Fd = fs.openSync(txtPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.writeSync(Fd.fd, Report);
  }
}