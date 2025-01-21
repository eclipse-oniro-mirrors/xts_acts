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

import prompt from '@ohos.prompt';
import router from '@ohos.router';
import fileio from '@ohos.fileio';
import mediaLibrary from '@ohos.multimedia.mediaLibrary'
import data_preferences from '@ohos.data.preferences';
import MediaUtils from '../model/MediaUtils'

const TAG = 'ParseXML';
let path = globalThis.dir;
let path1 = path + '/Player';

let VarColor = [];
let ColorBackPath = path1 + '/PlayerVideoColorBack.txt';
let txtPath = path1 + '/PlayerVideoReport.txt';

@Entry
@Component
struct videoNew {
  @State ClearAll: boolean = false;
  @State name: string = 'PlayerVideo';
  @State Vue: boolean = false;
  private current: number = undefined;
  @State MediaLib: MediaUtils = new MediaUtils();
  @State count: number = 0;
  @State result: string = '';
  @State TEST: number = 0;
  @State Url: string = 'pages/Player/Player_index';
  @State TestCaseList: Array<mediaLibrary.FileAsset> = [];
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
    promise = preferences.get('PlayerVideo', 0);
    await promise.then((data) => {
      Test = data;
      console.info("Succeeded in getting value of 'PlayerVideo'. Data: " + data);
    });
    this.TestCaseList = await this.MediaLib.getFileAssetsAlbum('Videos/ValidatorData/');

    if (Test != 1) {
      let fd = fileio.openSync(ColorBackPath, 0o102, 0o666);
      for (let i = 0; i < this.TestCaseList.length; i++) {
        let log = (this.TestCaseList[i].displayName + ';' + '#ff808080' + ';').toString();
        fileio.writeSync(fd, log);
      }
      fileio.closeSync(fd);
    }
    promise = preferences.put('PlayerVideo', 1);
    promise.then(() => {
      console.info("Succeeded in putting value of 'PlayerVideo'.");
    });
    promise = preferences.flush();
    promise.then(() => {
      console.info("Succeeded in flushing.");
    });
    this.TEST = Test;

    let opt = fileio.openSync(ColorBackPath, 0o100 | 0o2002, 0o664);
    let buff = new ArrayBuffer(40960);
    fileio.readSync(opt, buff);
    let ColorBack = String.fromCharCode.apply(null, new Uint8Array(buff));
    let TestList = ColorBack.split(';');
    for (let i = 0; i < Math.floor(TestList.length / 2); i++) {
      VarColor[i] = TestList[i * 2+1];
    }
    fileio.closeSync(opt);

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
        let FD = fileio.openSync(ColorBackPath, 0o102, 0o666);
        ColorBack = ColorBack.replace(key, Log);
        let buffer = new ArrayBuffer(4096);
        let rd = fileio.readSync(FD, buffer);
        let Report = ColorBack.substring(0, rd);
        fileio.closeSync(FD);
        let Fd = fileio.openSync(ColorBackPath, 0o102, 0o666);
        fileio.writeSync(Fd, Report);
        filewrite(name1, results, titles);
      }
      else if (this.result === 'false') {
        this.ColorObject[this.current] = '#ffff0000';
        let Log = (titles + ';' + '#ffff0000' + ';');
        let key = ColorBack.substring(Index, Index + number);
        let FD = fileio.openSync(ColorBackPath, 0o102, 0o666);
        ColorBack = ColorBack.replace(key, Log);
        let buffer = new ArrayBuffer(4096);
        let rd = fileio.readSync(FD, buffer);
        let Report = ColorBack.substring(0, rd);
        fileio.closeSync(FD);
        let Fd = fileio.openSync(ColorBackPath, 0o102, 0o666);
        fileio.writeSync(Fd, Report);
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
          Image($r('app.media.ic_public_back')).width('20vp').height('18vp')
        }.backgroundColor(Color.Black).size({ width: '40vp', height: '30vp' })
        .onClick(() => {
          router.back({
            url: 'pages/Player/Player_index',
            params: { result: 'None', }
          })
        })

        Row() {
          Text('Player Video')
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
                    prompt.showToast({
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
        ForEach(this.TestCaseList, (item: mediaLibrary.FileAsset, index) => {
          ListItem() {
            Row() {
              Text(item.displayName).fontSize(16).fontColor(Color.Black)
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
                url: 'pages/Player/PlayVideo',
                params: {
                  audioUrl: item.uri,
                  audioTitle: item.displayName
                }
              })
            })
          }
        }, item => item.title)
      }.width('100%').height('80%')

      Row() {
        Blank()
        Button({ stateEffect: this.Vue }) {
          Image($r('app.media.ic_public_pass')).width('20vp').height('20vp')
        }
        .width('40%')
        .height('30vp')
        .backgroundColor(Color.Grey)
        .enabled(this.Vue)
        .opacity(this.Vue ? 1 : 0.4)
        .onClick(() => {
          router.back({
            url: this.Url,
            params: { result: 'true ', title: this.name,
            }
          })
          prompt.showToast({
            message: '通过', duration: 1000
          });
        })

        Blank().width(40)
        Button() {
          Image($r('app.media.ic_public_fail')).width('20vp').height('20vp')
        }.width('40%').height('30vp').backgroundColor(Color.Grey)
        .onClick(() => {
          router.back({
            url: this.Url,
            params: { result: 'false', title: this.name,
            }
          })
          console.log('wwwwwwwwww' + this.Url)
          prompt.showToast({
            message: '失败', duration: 1000
          });
        })

        Blank()
      }.width('100%').height('14%').backgroundColor(Color.Black).justifyContent(FlexAlign.Center)
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }

  ClearText() {
    fileio.unlinkSync(txtPath);
    fileio.unlinkSync(ColorBackPath);
    fileio.openSync(txtPath, 0o100 | 0o2002, 0o664);
    let fd = fileio.openSync(ColorBackPath, 0o102, 0o666);
    for (let i = 0; i < this.TestCaseList.length; i++) {
      let log = (this.TestCaseList[i].displayName + ';' + '#ff808080' + ';').toString();
      fileio.writeSync(fd, log);
    }
  }

  onBackPress() {
    router.replaceUrl({
      url: 'pages/Player/Player_index',
    })
  }
}

function filewrite(name1, results, titles) {
  let fd = fileio.openSync(txtPath, 0o100 | 0o2002, 0o664);
  let buf = new ArrayBuffer(4096);
  let RD = fileio.readSync(fd, buf);
  console.info("RRRRRRRRRRd" + RD);
  let report = String.fromCharCode.apply(null, new Uint8Array(buf));
  let WriteTitle = (titles).toString();
  let WriteResult = (results).toString();
  let number = WriteTitle.length + WriteResult.length + 2;
  let Index = report.indexOf(WriteTitle);
  let Log = (titles + ";" + results + ";").toString();
  if (Index == -1) {
    fileio.writeSync(fd, Log);
  }
  else if (Index != -1) {
    let key = report.substring(Index, Index + number);
    let FD = fileio.openSync(txtPath, 0o102, 0o666);
    report = report.replace(key, Log);
    let buffer = new ArrayBuffer(4096);
    let rd = fileio.readSync(FD, buffer);
    let Report = report.substring(0, rd);
    fileio.closeSync(FD);
    let Fd = fileio.openSync(txtPath, 0o102, 0o666);
    fileio.writeSync(Fd, Report);
  }
}