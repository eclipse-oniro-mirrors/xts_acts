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

import promptAction from '@ohos.promptAction'
import router from '@ohos.router';
import xml from '@ohos.xml';
import fs from '@ohos.file.fs';
import util from '@ohos.util';
import data_preferences from '@ohos.data.preferences';
import FlushData from '../model/FlushData';

const TAG: string = 'ParseXML';
let path: string = globalThis.dir;
let path1: string = path + '/Sensor';

let letColor: Object[] = [];
let ColorBackPath: string = path + '/SensorColorBack.txt';
let txtPath: string = path1 + '/SensorReport.txt';
let AccelerometerTxtPath: string = path1 + '/AccelerometerReport.txt';
let ColorTxtPath: string = path1 + '/ColorReport.txt';
let SarTxtPath: string = path1 + '/SarReport.txt';
let xmlPath: string = path1 + '/SensorTest.xml';

class TestCase {
  title: string = '';
  uri: string = '';
}

@Entry
@Component
struct IndexPage {
  @State ClearAll: boolean = false;
  private current: number = 0;
  @State count: number = 0;
  @State result: string = '';
  @State TEST: number = 0;
  private TestCaseList: TestCase[] = [
    { title: 'SensorAccelerometer', uri: 'pages/Sensor/SensorAccelerometer' },
    { title: 'AccelerometerUncalibrated', uri: 'pages/Sensor/AccelerometerUncalibrated' },
    { title: 'Barometer', uri: 'pages/Sensor/Barometer' },
    { title: 'Gravity', uri: 'pages/Sensor/Gravity' },
    { title: 'Gyroscope', uri: 'pages/Sensor/Gyroscope' },
    { title: 'GyroscopeUncalibrated', uri: 'pages/Sensor/GyroscopeUncalibrated' },
    { title: 'HeartRate', uri: 'pages/Sensor/HeartRate' },
    { title: 'Humidity', uri: 'pages/Sensor/Humidity' },
    { title: 'Light', uri: 'pages/Sensor/Light' },
    { title: 'LinearAccelerometer', uri: 'pages/Sensor/LinearAccelerometer' },
    { title: 'Orientation', uri: 'pages/Sensor/Orientation' },
    { title: 'Pedometer', uri: 'pages/Sensor/Pedometer' },
    { title: 'Proximity', uri: 'pages/Sensor/Proximity' },
    { title: 'SignificantMotion', uri: 'pages/Sensor/SignificantMotion' },
    { title: 'Temperature', uri: 'pages/Sensor/Temperature' }
  ]
  @State ColorObject: Object[] = letColor;
  @State ColorTrue: number[] = [];
  @State ColorTrue2: number[] = [];

  async onPageShow() {
    let Test : data_preferences.Preferences | number = 0;
    let context: Context | null;
    context = globalThis.getContext();
    let preferences: ESObject;

    let promise = data_preferences.getPreferences(context, 'mystore');
    await promise.then((object) => {
      preferences = object;
    });
    promise = preferences.get('Sensor', 0);
    await promise.then((data) => {
      Test = data;
      console.info("Succeeded in getting value of 'Sensor'. Data: " + data);
    });

    if (Test != 1) {
      let fd = fs.openSync(ColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      for (let i = 0; i < this.TestCaseList.length; i++) {
        let log = (this.TestCaseList[i].title + ';' + 'none ' + ';').toString();
        fs.writeSync(fd.fd, log);
      }
      fs.closeSync(fd);
    }
    promise = preferences.put('Sensor', 1);
    promise.then(() => {
      console.info("Succeeded in putting value of 'Sensor'.");
    });
    promise = preferences.flush();
    promise.then(() => {
      console.info("Succeeded in flushing.");
    });
    this.TEST = Test;

    let opt = fs.openSync(ColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let buff = new ArrayBuffer(40960);
    let RD = fs.readSync(opt.fd, buff);
    let uint8Array = new Uint8Array(buff, 0, RD);
    let ColorBack: string = String.fromCharCode(...uint8Array);
    let TestList: string[] = ColorBack.split(';');
    for (let i = 0; i < Math.floor(TestList.length / 2); i++) {
      letColor[i] = TestList[i * 2+1];
    }
    fs.closeSync(opt);

    if (this.count === 1) {

      let myRouter = router.getParams() as Record<string, string | number>
      this.result = myRouter.result as string
      let titles: string = myRouter.title as string;
      let name1: string = '刚刚点进了哪个用例：' + titles;
      let results = this.result;
      let WriteTitle = (titles).toString();
      let number = WriteTitle.length + 7;
      let Index = ColorBack.indexOf(WriteTitle);

      if (this.result === 'true ') {
        this.ColorObject[this.current] = 'true ';
        let Log = (titles + ';' + 'true ' + ';');
        let key = ColorBack.substring(Index, Index + number);
        let FD = fs.openSync(ColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        ColorBack = ColorBack.replace(key, Log);
        let buffer = new ArrayBuffer(4096);
        let rd = fs.readSync(FD.fd, buffer);
        let Report = ColorBack.substring(0, rd);
        fs.closeSync(FD);
        let Fd = fs.openSync(ColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        fs.writeSync(Fd.fd, Report);
        filewrite(name1, results, titles)
      }
      else if (this.result === 'false') {
        this.ColorObject[this.current] = 'false';
        let Log = (titles + ';' + 'false' + ';');
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
      else {
        this.ColorObject[this.current] = this.ColorObject[this.current];
      }
    }
    for (let i = 0; i < TestList.length; i++) {
      if (this.ColorObject[i] === 'true ') {
        this.ColorTrue[i] = 0x263526
        this.ColorTrue2[i] = 0x0CB60C

      }
      else if (this.ColorObject[i] === 'false') {
        this.ColorTrue[i] = 0x380303
        this.ColorTrue2[i] = 0xd60a0a
      }
      else {
        this.ColorTrue[i] = 0x000000
        this.ColorTrue2[i] = 0x000000
      }
    }
  }

  build() {
    Scroll() {
      Column() {
        Scroll(){
          Row({ space: 20 }) {
            Row({ space: 20 }) {
              Button() {
                Image($r('app.media.ic_public_back'))
                  .width('30vp')
                  .height('30vp')
              }
              .backgroundColor(Color.Black)
              .onClick(() => {
                router.back();
              })


              Row() {
                Text('Sensor')
                  .fontColor(Color.White)
                  .fontSize(15)
              }
            }




            Row({ space: 20 }) {
              Button() {
                Image($r('app.media.ic_public_delete'))
                  .width('30vp')
                  .height('30vp')
              }
              .backgroundColor(Color.Black)
              .onClick(() => {
                AlertDialog.show(
                  {
                    message: "是否删除所有记录",
                    primaryButton: {
                      value: 'Yes',
                      action: () => {
                        this.ClearAll = true;
                        this.ColorObject.forEach((value, index) => {
                          this.ColorObject[index] = 'none ';
                        });
                        this.ClearText();
                        router.replaceUrl({
                          url: 'pages/Sensor/Sensor_index',
                        })
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


              Button() {
                Image($r('app.media.ic_public_save'))
                  .width('30vp')
                  .height('30vp')
              }.backgroundColor(Color.Black)
              .onClick(() => {
                this.ReadTextParseXml();
                AlertDialog.show({
                  message: "报告已生成，如需查看通过命令行输入'hdc_std file recv /data/app/el2/100/base/com.example.actsvalidator/haps/entry/files/Sensor/SensorTest.xml -本地路径'",
                  confirm: {
                    value: 'OK',
                    action: () => {
                      promptAction.showToast({
                        message: '报告已生成', duration: 1000
                      })
                    }
                  },
                  cancel: () => {
                    promptAction.showToast({
                      message: '报告已生成', duration: 1000
                    });
                  }
                })
              })
            }












          }.width('130%').height('20%').justifyContent(FlexAlign.Center)
        }.scrollable(ScrollDirection.Horizontal).scrollBar(BarState.On).scrollBarColor(Color.Orange)




        List({}) {
          ForEach(this.TestCaseList, (item: TestCase, index) => {
            ListItem() {
              Row() {
                Text(item.title).fontSize(15).fontColor(Color.White)
              }
              .width('100%')
              .height(50)
              .alignItems(VerticalAlign.Center)
              .justifyContent(FlexAlign.Center)
              .linearGradient(this.count === 0 && this.TEST === 0 ? {
                angle: 90,
                colors: [[0x000000, 0.0], [0x000000, 1.0]]
              } : { angle: 90, colors: [[this.ColorTrue[index], 0.0], [this.ColorTrue2[index], 0.618]] })
              .onClick(() => {
                this.count = 1;
                this.ClearAll = false;
                this.current = index;
                router.push({
                  url: item.uri,
                })
              })
            }
          }, (item: TestCase) => item.title)
        }.width('100%').divider({ strokeWidth: 1, color: Color.Grey }).height('100%')




















      }
    }.backgroundColor(Color.Black)
    .border({width:1,color:Color.White})










































































    .width('100%')
    .height('100%')
    .scrollBar(BarState.On)
    .scrollable(ScrollDirection.Vertical)
    .scrollBarColor(Color.Orange)
  }

  ClearText() {
    fs.rmdirSync(path1);
    fs.mkdirSync(path1);
    fs.openSync(AccelerometerTxtPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(ColorTxtPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(SarTxtPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let fd = fs.openSync(ColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    for (let i = 0; i < this.TestCaseList.length; i++) {
      let log = (this.TestCaseList[i].title + ';' + 'none ' + ';').toString();
      fs.writeSync(fd.fd, log);
    }
    FlushData.ResetSensor();
  }

  ReadTextParseXml() {
    let ReportPath = path1 + '/SensorReport.txt';
    let dir = fs.listFileSync(path1);
    console.info("ssssss" + dir);
    while (dir) {
      let OP = fs.openSync(ReportPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let buf = new ArrayBuffer(40960);
      let RD = fs.readSync(OP.fd, buf);
      console.info("ddddd" + RD);
      let report: string = String.fromCharCode(...new Uint8Array(buf));
      let str1 = report.split(";");
      let title: string[] = [];
      let result: string[] = [];
      for (let i = 0; i < Math.floor(str1.length / 2); i++) {
        title[i] = str1[i*2];
        result[i] = str1[i * 2+1];
      }
      let FailIndex = report.indexOf('false');
      let FailNum = 0;
      while (FailIndex != -1) {
        console.log(FailIndex.toString());
        FailNum++;
        FailIndex = report.indexOf('false', FailIndex + 1);
      }
      let failNum = (FailNum).toString();
      let PassIndex = report.indexOf('true ');
      let PassNum = 0;
      while (PassIndex != -1) {
        console.log(PassIndex.toString());
        PassNum++;
        PassIndex = report.indexOf('true ', PassIndex + 1);
      }
      let TestNum = FailNum + PassNum;
      let testNum = (TestNum).toString();
      let arrayBuffer = new ArrayBuffer(40960);
      let bufView = new DataView(arrayBuffer);
      let serializer = new xml.XmlSerializer(bufView);
      serializer.setDeclaration();
      serializer.startElement("testsuite");
      serializer.setAttributes("name", "ActsSensorTest");
      serializer.setAttributes("time", "*");
      serializer.setAttributes("errors", "0");
      serializer.setAttributes("disabled", "0");
      serializer.setAttributes("failures", failNum);
      serializer.setAttributes("ignored", "0");
      serializer.setAttributes("tests", testNum);
      serializer.setAttributes("message", "*");
      serializer.setAttributes("modulename", "ActsSensorTest");
      for (let i = 0; i < title.length; i++) {
        serializer.startElement("testcase");
        serializer.setAttributes("name", String(title[i]));
        serializer.setAttributes("status", "run");
        serializer.setAttributes("time", "*");
        serializer.setAttributes("classname", "ActsSensorTest");
        serializer.setAttributes("result", String(result[i]));
        serializer.setAttributes("level", "*");
        serializer.setAttributes("message", "*");
        serializer.endElement();
      }
      serializer.endElement();

      let that = new util.TextDecoder('utf-8');
      let array = new Uint8Array(arrayBuffer);
      let serializerStr = that.decode(array);
      console.info(xmlPath);
      let xmlfd: fs.File | null = null;
      try {
        console.error(TAG, "write xmlPath =" + xmlPath);
        xmlfd = fs.openSync(xmlPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        fs.writeSync(xmlfd.fd, serializerStr);
      } catch (err) {
        console.error(TAG, "read xmlPath =" + xmlPath + "error:" + err);
      } finally {
        fs.closeSync(xmlfd);
      }
      return;
    }
  }
}

function filewrite(name1: string, results: string, titles: string) {
  let fd = fs.openSync(txtPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  let buf = new ArrayBuffer(4096);
  let RD = fs.readSync(fd.fd, buf);
  let uint8Array = new Uint8Array(buf, 0, RD);
  console.info("RRRRRRRRRRd" + RD);
  let report: ESObject = String.fromCharCode(...uint8Array);
  let WriteTitle = (titles).toString();
  let WriteResult = (results).toString();
  let number = WriteTitle.length + WriteResult.length + 2;
  let Index: number = report.indexOf(WriteTitle);
  let Log = (titles + ";" + results + ";").toString();
  if (Index == -1) {
    fs.writeSync(fd.fd, Log);
  }
  else if (Index != -1) {
    let key: string = report.substring(Index, Index + number);
    let FD = fs.openSync(txtPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    report = report.replace(key, Log);
    let buffer = new ArrayBuffer(4096);
    let rd = fs.readSync(FD.fd, buffer);
    let Report: string = report.substring(0, rd);
    fs.closeSync(FD);
    let Fd = fs.openSync(txtPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.writeSync(Fd.fd, Report);
  }
}