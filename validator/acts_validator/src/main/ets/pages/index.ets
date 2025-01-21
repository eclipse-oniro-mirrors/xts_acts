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
import promptAction from '@ohos.promptAction';
import router from '@ohos.router';
import fs from '@ohos.file.fs';
import xml from '@ohos.xml';
import util from '@ohos.util';
import DateTimeUtil from './model/DateTimeUtil';
import data_preferences from '@ohos.data.preferences';
import FlushData from '../pages/model/FlushData';

const TAG = 'ParseXML';
let path=globalThis.dir;
let path1 = path + '/ArkUI';
let path2 = path + '/Audio';
let path3 = path + '/Camera';
let path4 = path + '/Player';
let path5 = path + '/Experience';
let path6 = path + '/Sensor';
let path8 = path + '/Screen';
let path9 = path + '/MultimodalInput';
let path10 = path + '/Power';
let path1_1 = path + '/Notification';
let path1_2 = path + '/Wifi';
let path1_3 = path + '/Bluetooth';
let picturePath = path + '/screenshot';
let ExperienceDataPath = path + '/ExperienceData';
let ArkUIColorBackPath = path + '/ArkUIColorBack.txt';
let AudioColorBackPath = path + '/AudioColorBack.txt';
let CameraColorBackPath = path + '/CameraColorBack.txt';
let PlayerColorBackPath = path + '/PlayerColorBack.txt';
let SensorColorBackPath = path + '/SensorColorBack.txt'; // 传感器
let ScreenColorBackPath = path + '/ScreenColorBack.txt'; // 屏幕
let MultimodalInputColorBackPath = path + '/MultimodalInputColorBack.txt'; // 多模输入
let PowerColorBackPath = path + '/PowerColorBack.txt'; // 电源管理
let NotificationColorBackPath = path + '/NotificationColorBack.txt'; // 通知管理
let WifiColorBackPath = path + '/WifiColorBack.txt'; // wifi管理
let BluetoothColorBackPath = path + '/BluetoothColorBack.txt'; // bluetooth管理
let PlayerNetWorkColorBackPath = path4 + '/PlayerNetWorkColorBack.txt'; // 播放网络视频
let PlayerAudioColorBackPath = path4 + '/PlayerAudioColorBack.txt';
let PlayerVideoColorBackPath = path4 + '/PlayerVideoColorBack.txt';
let ExperienceColorBackPath = path + '/ExperienceColorBack.txt';
fs.openSync(ArkUIColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
fs.openSync(AudioColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
fs.openSync(CameraColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
fs.openSync(PlayerColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
fs.openSync(ExperienceColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
fs.openSync(SensorColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
fs.openSync(ScreenColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
fs.openSync(MultimodalInputColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
fs.openSync(PowerColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
fs.openSync(NotificationColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
fs.openSync(WifiColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
fs.openSync(BluetoothColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
let TimePath = path + '/Time.txt';
fs.openSync(TimePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
let xmlPath = path + '/Test.xml';
fs.openSync(xmlPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
let path11 = path1 + '/ArkUIReport.txt';
let path22 = path2 + '/AudioReport.txt';
let path33 = path3 + '/CameraReport.txt';
let path44 = path4 + '/PlayerReport.txt';
let PlayerAudioTxtPath = path4 + '/PlayerAudioReport.txt';
let PlayerVideoTxtPath = path4 + '/PlayerVideoReport.txt';
let PlayerNetWorkTxtPath = path4 + '/PlayerNetWorkReport.txt';
let path55 = path5 + '/ExperienceReport.txt';
let path66 = path6 + '/SensorReport.txt';
let path88 = path8 + '/ScreenReport.txt'; // 屏幕
let path99 = path9 + '/MultimodalInputReport.txt'; // 多模输入
let pathPower = path10 + '/PowerReport.txt';
let pathNotification = path1_1 + '/NotificationReport.txt';
let pathWifi = path1_2 + '/WifiReport.txt';
let pathBluetooth = path1_3 + '/BluetoothReport.txt';
@Entry
@Component
struct IndexPage {
  private TestCaseList = [
    {title:'ArkUI',uri:'pages/ArkUI/ArkUI_index'},
    {title:'Audio',uri:'pages/Audio/Audio_index'},
    {title:'Camera',uri:'pages/Camera/Camera_index'},
    {title:'Player',uri:'pages/Player/Player_index'},
    {title:'Experience',uri:'pages/Experience/Experience_index'},
    {title:'Sensor',uri:'pages/Sensor/Sensor_index'},
    {title:'Screen',uri:'pages/Screen/Screen_index'},
    {title:'MultimodalInput',uri:'pages/MultimodalInput/MultimodalInput_index'},
    {title:'Power',uri:'pages/Power/Power_index'},
    {title:'Notification',uri:'pages/Notification/Notification_index'},
    {title:'Wifi',uri:'pages/Wifi/Wifi_index'},
    {title:'Bluetooth',uri:'pages/Bluetooth/BlueTooth_index'}
  ]
  @State ColorObject : string[] = ['#ff000000','#ff000000','#ff000000','#ff000000','#ff000000']
  async onPageShow(){
    let Test = null;
    let context =null;
    context = globalThis.getContext();
    let preferences;

    let promise = data_preferences.getPreferences(context,'mystore');
    await promise.then((object) => {
      preferences = object;
    });
    promise = preferences.get('index', 0);
    await promise.then((data) => {
      Test = data;
      console.info("Succeeded in getting value of 'index'. Data: " + data);
    });
    if(Test != 1) {
      fs.mkdirSync(path1);
      fs.mkdirSync(path2);
      fs.mkdirSync(path3);
      fs.mkdirSync(path4);
      fs.mkdirSync(path5);
      fs.mkdirSync(path6);
      // 屏幕
      fs.mkdirSync(path8);
      // 多模输入
      fs.mkdirSync(path9);
      // 电源管理
      fs.mkdirSync(path10);
      // 通知
      fs.mkdirSync(path1_1);
      // wifi管理
      fs.mkdirSync(path1_2);
      // 蓝牙
      fs.mkdirSync(path1_3);
      fs.mkdirSync(picturePath);
      fs.mkdirSync(ExperienceDataPath);

      let promise = preferences.put('index', 1);
      promise.then(() => {
        console.info("Succeeded in putting value of 'index'.");
      });
      promise = preferences.flush();
      promise.then(() => {
        console.info("Succeeded in flushing.");
      });
    }
    fs.openSync(path11, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(path22, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(path33, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(path44, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(PlayerAudioColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(PlayerVideoColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(PlayerNetWorkColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(PlayerAudioTxtPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(PlayerVideoTxtPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(PlayerNetWorkTxtPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(path55, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(path66, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(path88, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(path99, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(pathPower, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(pathNotification, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(pathWifi, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(pathBluetooth, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  }
  build(){
    Column(){
      Row() {
        Text('ActsValidator')
          .fontColor(Color.White)
          .fontSize('22fp')
        Row() {
          Button(){
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
          Button(){
            Image($r('app.media.ic_public_save'))
              .width('30vp')
              .height('30vp')
              .margin({ left: 30 })
          }.backgroundColor(Color.Black)
          .onClick(() => {
            this.SaveXml();
            AlertDialog.show({
              message: "报告已生成，请将设备连接pc，通过run.bat确认测试已结束，获取可视化报告",
              confirm:{
                value:'OK',
                action:()=>{
                  promptAction.showToast({
                    message: '总报告已生成', duration: 1000
                  })
                }
              },
              cancel: () => {
                promptAction.showToast({
                  message: '总报告已生成', duration: 1000
                });
              }
            })
          })
        }
      }.width('100%').justifyContent(FlexAlign.SpaceAround).margin({top:'15vp'}).height('6%')
      List({}){
        ForEach(this.TestCaseList,(item,index) => {
          ListItem(){
            Row(){
              Text(item.title).fontSize(20).fontColor(Color.White)
            }.width('100%').height(50).alignItems(VerticalAlign.Center).backgroundColor(this.ColorObject[index])
            .onClick(()=>{
              router.push({
                url: item.uri,
              })
              let dateTimeUtil = new DateTimeUtil();
              let time = `${dateTimeUtil.getFullYear()}-${dateTimeUtil.getMonth()}-${dateTimeUtil.getDay()} ${dateTimeUtil.getHour()}:${dateTimeUtil.getMinute()}:${dateTimeUtil.getSecond()}`;
              let TimePath = path + "/Time.txt";
              let OP = fs.openSync(TimePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
              let buf = new ArrayBuffer(4096);
              fs.readSync(OP.fd,buf);
              let Log = (time + ";").toString();
              fs.writeSync(OP.fd,Log);
            })
          }
        },item  => item.title)
      }.width('100%').height('92%').divider({strokeWidth:1,color:Color.Grey})
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
  ClearText(){
    fs.unlinkSync(TimePath);
    fs.unlinkSync(xmlPath);
    fs.unlinkSync(path11);
    fs.unlinkSync(path22);
    fs.unlinkSync(path33);
    fs.unlinkSync(path44);
    fs.unlinkSync(PlayerAudioTxtPath);
    fs.unlinkSync(PlayerVideoTxtPath);
    fs.unlinkSync(PlayerNetWorkTxtPath);
    fs.unlinkSync(path55);
    fs.unlinkSync(path66);
    fs.unlinkSync(path88);
    fs.unlinkSync(path99);
    fs.unlinkSync(pathPower);
    fs.unlinkSync(pathNotification);
    fs.unlinkSync(pathWifi);
    fs.unlinkSync(pathBluetooth);
    fs.unlinkSync(ArkUIColorBackPath);
    fs.unlinkSync(AudioColorBackPath);
    fs.unlinkSync(CameraColorBackPath);
    fs.unlinkSync(PlayerColorBackPath);
    fs.unlinkSync(PlayerAudioColorBackPath);
    fs.unlinkSync(PlayerVideoColorBackPath);
    fs.unlinkSync(PlayerNetWorkColorBackPath);
    fs.unlinkSync(ExperienceColorBackPath);
    fs.unlinkSync(SensorColorBackPath);
    fs.unlinkSync(ScreenColorBackPath);
    fs.unlinkSync(MultimodalInputColorBackPath);
    fs.unlinkSync(PowerColorBackPath);
    fs.unlinkSync(NotificationColorBackPath);
    fs.unlinkSync(WifiColorBackPath);
    fs.unlinkSync(BluetoothColorBackPath);
    fs.rmdirSync(picturePath);
    fs.mkdirSync(picturePath);
    fs.rmdirSync(ExperienceDataPath);
    fs.mkdirSync(ExperienceDataPath);
    fs.openSync(TimePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(xmlPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(path11, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(path22, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(path33, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(path44, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(PlayerAudioTxtPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(PlayerVideoTxtPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(PlayerNetWorkTxtPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(path55, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(path66, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(path88, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(path99, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(pathPower, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(pathNotification, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(pathWifi, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(pathBluetooth, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(ArkUIColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(AudioColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(CameraColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(PlayerColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(PlayerAudioColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(PlayerVideoColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(PlayerNetWorkColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(ExperienceColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(SensorColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(ScreenColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(MultimodalInputColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(PowerColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(NotificationColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(WifiColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.openSync(BluetoothColorBackPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    FlushData.ResetArkUI();
    FlushData.ResetAudio();
    FlushData.ResetCamera();
    FlushData.ResetPlayer();
    FlushData.ResetExperience();
    FlushData.ResetPlayerAudio();
    FlushData.ResetPlayerVideo();
    FlushData.ResetPlayNetworkVideo();
    FlushData.ResetSensor();
    FlushData.ResetMultimodalInput();
    FlushData.ResetPower();
    FlushData.ResetNotification();
    FlushData.ResetWifi();
    FlushData.ResetBluetooth();
  }
  SaveXml() {
    let dateTimeUtil = new DateTimeUtil();
    let endtime = `${dateTimeUtil.getFullYear()}-${dateTimeUtil.getMonth()}-${dateTimeUtil.getDay()} ${dateTimeUtil.getHour()}:${dateTimeUtil.getMinute()}:${dateTimeUtil.getSecond()}`;
    let fd = fs.openSync(TimePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let buf = new ArrayBuffer(40960);
    fs.readSync(fd.fd,buf);
    let StartTime = String.fromCharCode.apply(null, new Uint8Array(buf));
    let Index = StartTime.indexOf(';');
    let starttime = StartTime.substring(0,Index);
    if(starttime === ''){
      starttime = '*'
    }
    let ArkUIReport;
    let AudioReport;
    let CameraReport;
    let PlayerReport;
    let ExperienceReport;
    let SensorReport; // 传感器
    let ScreenReport; // 屏幕
    let MultimodalInputReport; // 多模输入
    let PowerReport; // 电源管理
    let NotificationReport; // 通知
    let WifiReport; // wifi管理
    let BluetoothReport; // bluetooth管理
    /*
     * ArkUI
     */
    let OP1 = fs.openSync(path11, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let buf1 = new ArrayBuffer(40960);
    fs.readSync(OP1.fd,buf1);
    ArkUIReport = String.fromCharCode.apply(null, new Uint8Array(buf1));
    let str1 = ArkUIReport.split(";");
    let title1 = [];
    let result1 = [];
    for (let i = 0; i < Math.floor(str1.length / 2); i++) {
      title1[i] = str1[i * 2];
      result1[i] = str1[i * 2 + 1];
    }
    /*
     * Audio
     */
    let OP2 = fs.openSync(path22, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let buf2 = new ArrayBuffer(40960);
    fs.readSync(OP2.fd,buf2);
    AudioReport = String.fromCharCode.apply(null, new Uint8Array(buf2));
    let str2 = AudioReport.split(";");
    let title2 = [];
    let result2 = [];
    for (let i = 0; i < Math.floor(str2.length / 2); i++) {
      title2[i] = str2[i * 2];
      result2[i] = str2[i * 2 + 1];
    }
    /*
     * Camera
     */
    let OP3 = fs.openSync(path33, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let buf3 = new ArrayBuffer(40960);
    fs.readSync(OP3.fd,buf3);
    CameraReport = String.fromCharCode.apply(null, new Uint8Array(buf3));
    let str3 = CameraReport.split(";");
    let title3 = [];
    let result3 = [];
    for (let i = 0; i < Math.floor(str3.length / 2); i++) {
      title3[i] = str3[i * 2];
      result3[i] = str3[i * 2 + 1];
    }
    /*
 * Player
 */
    let OP4 = fs.openSync(path44, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let buf4 = new ArrayBuffer(40960);
    fs.readSync(OP4.fd,buf4);
    PlayerReport = String.fromCharCode.apply(null, new Uint8Array(buf4));
    let str4 = PlayerReport.split(";");
    let title4 = [];
    let result4 = [];
    for (let i = 0; i < Math.floor(str4.length / 2); i++) {
      title4[i] = str4[i * 2];
      result4[i] = str4[i * 2 + 1];
    }
    /*
 * Experience
 */
    let OP5 = fs.openSync(path55, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let buf5 = new ArrayBuffer(40960);
    fs.readSync(OP5.fd,buf5);
    ExperienceReport = String.fromCharCode.apply(null, new Uint8Array(buf5));
    let str5 = ExperienceReport.split(";");
    let title5 = [];
    let result5 = [];
    for (let i = 0; i < Math.floor(str5.length / 2); i++) {
      title5[i] = str5[i * 2];
      result5[i] = str5[i * 2 + 1];
    }

    /**
     * Sensor 传感器
     */
    let OP6 = fs.openSync(path66, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let buf6 = new ArrayBuffer(40960);
    fs.readSync(OP6.fd,buf6);
    SensorReport = String.fromCharCode.apply(null, new Uint8Array(buf6));
    let str6 = SensorReport.split(";");
    let title6 = [];
    let result6 = [];
    for (let i = 0; i < Math.floor(str6.length / 2); i++) {
      title6[i] = str6[i * 2];
      result6[i] = str6[i * 2 + 1];
    }

    /**
     * Screen 屏幕
     */
    let OP8 = fs.openSync(path88, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let buf8 = new ArrayBuffer(40960);
    fs.readSync(OP8.fd,buf8);
    ScreenReport = String.fromCharCode.apply(null, new Uint8Array(buf8));
    let str8 = ScreenReport.split(";");
    let title8 = [];
    let result8 = [];
    for (let i = 0; i < Math.floor(str8.length / 2); i++) {
      title8[i] = str8[i * 2];
      result8[i] = str8[i * 2 + 1];
    }

    /**
     * MultimodalInput 多模输入
     */
    let OP9 = fs.openSync(path99, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let buf9 = new ArrayBuffer(40960);
    fs.readSync(OP9.fd,buf9);
    MultimodalInputReport = String.fromCharCode.apply(null, new Uint8Array(buf9));
    let str9 = MultimodalInputReport.split(";");
    let title9 = [];
    let result9 = [];
    for (let i = 0; i < Math.floor(str9.length / 2); i++) {
      title9[i] = str9[i * 2];
      result9[i] = str9[i * 2 + 1];
    }

    /**
     * Power 电源管理
     */
    let OP10 = fs.openSync(pathPower, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let buf10 = new ArrayBuffer(40960);
    fs.readSync(OP10.fd,buf10);
    PowerReport = String.fromCharCode.apply(null, new Uint8Array(buf10));
    let str10 = PowerReport.split(";");
    let title10 = [];
    let result10 = [];
    for (let i = 0; i < Math.floor(str10.length / 2); i++) {
      title10[i] = str10[i * 2];
      result10[i] = str10[i * 2 + 1];
    }

    /**
     * Notification 通知
     */
    let OP11 = fs.openSync(pathNotification, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let buf11 = new ArrayBuffer(40960);
    fs.readSync(OP11.fd,buf11);
    NotificationReport = String.fromCharCode.apply(null, new Uint8Array(buf11));
    let str11 = NotificationReport.split(";");
    let title11 = [];
    let result11 = [];
    for (let i = 0; i < Math.floor(str11.length / 2); i++) {
      title11[i] = str11[i * 2];
      result11[i] = str11[i * 2 + 1];
    }

    /**
     * wifi 通知
     */
    let OP12 = fs.openSync(pathWifi, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let buf12 = new ArrayBuffer(40960);
    fs.readSync(OP12.fd,buf12);
    WifiReport = String.fromCharCode.apply(null, new Uint8Array(buf12));
    let str12 = WifiReport.split(";");
    let title12 = [];
    let result12 = [];
    for (let i = 0; i < Math.floor(str12.length / 2); i++) {
      title12[i] = str12[i * 2];
      result12[i] = str12[i * 2 + 1];
    }

    /**
     * Bluetooth 通知
     */
    let OP13 = fs.openSync(pathBluetooth, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let buf13 = new ArrayBuffer(40960);
    fs.readSync(OP13.fd,buf13);
    BluetoothReport = String.fromCharCode.apply(null, new Uint8Array(buf13));
    let str13 = BluetoothReport.split(";");
    let title13 = [];
    let result13 = [];
    for (let i = 0; i < Math.floor(str13.length / 2); i++) {
      title13[i] = str13[i * 2];
      result13[i] = str13[i * 2 + 1];
    }

    let report = ArkUIReport + AudioReport + CameraReport + PlayerReport +
    ExperienceReport + SensorReport + ScreenReport + MultimodalInputReport
    + PowerReport + NotificationReport + BluetoothReport + WifiReport;
    let FailIndex = report.indexOf('false');
    let FailNum = 0;
    while(FailIndex != -1) {
      console.log(FailIndex);
      FailNum++;
      FailIndex = report.indexOf('false',FailIndex + 1);
    }
    let failNum = (FailNum).toString();
    let PassIndex = report.indexOf('true ');
    let PassNum = 0;
    while(PassIndex != -1) {
      console.log(PassIndex);
      PassNum++;
      PassIndex = report.indexOf('true ',PassIndex + 1);
    }
    let TestNum = FailNum + PassNum;
    let testNum = (TestNum).toString();
    /*
     * ArkUI
     */
    let ArkUIFailIndex = ArkUIReport.indexOf('false');
    let ArkUIFailNum = 0;
    while (ArkUIFailIndex != -1) {
      console.log(ArkUIFailIndex);
      ArkUIFailNum++;
      ArkUIFailIndex = ArkUIReport.indexOf('false',ArkUIFailIndex + 1);
    }
    let ArkuiFailNum = (ArkUIFailNum).toString();
    let ArkUIPassIndex = ArkUIReport.indexOf('true ');
    let ArkUIPassNum = 0;
    while (ArkUIPassIndex != -1) {
      console.log(ArkUIPassIndex);
      ArkUIPassNum++;
      ArkUIPassIndex = ArkUIReport.indexOf('true ',ArkUIPassIndex + 1);
    }
    let ArkUITestNum = ArkUIFailNum + ArkUIPassNum;
    let ArkuiTestNum = (ArkUITestNum).toString();
    /*
     * Audio
     */
    let AudioFailIndex = AudioReport.indexOf('false');
    let AudioFailNum = 0;
    while (AudioFailIndex != -1) {
      console.log(AudioFailIndex);
      AudioFailNum++;
      AudioFailIndex = AudioReport.indexOf('false',AudioFailIndex + 1);
    }
    let audioFailNum = (AudioFailNum).toString();
    let AudioPassIndex = AudioReport.indexOf('true ');
    let AudioPassNum = 0;
    while (AudioPassIndex != -1) {
      console.log(AudioPassIndex);
      AudioPassNum++;
      AudioPassIndex = AudioReport.indexOf('true ',AudioPassIndex + 1);
    }
    let AudioTestNum = AudioFailNum + AudioPassNum;
    let audioTestNum = (AudioTestNum).toString();
    /*
     * Camera
     */
    let CameraFailIndex = CameraReport.indexOf('false');
    let CameraFailNum = 0;
    while (CameraFailIndex != -1) {
      console.log(CameraFailIndex);
      CameraFailNum++;
      CameraFailIndex = CameraReport.indexOf('false',CameraFailIndex + 1);
    }
    let cameraFailNum = (CameraFailNum).toString();
    let CameraPassIndex = CameraReport.indexOf('true ');
    let CameraPassNum = 0;
    while (CameraPassIndex != -1) {
      console.log(CameraPassIndex);
      CameraPassNum++;
      CameraPassIndex = CameraReport.indexOf('true ',CameraPassIndex + 1);
    }
    let CameraTestNum = CameraFailNum + CameraPassNum;
    let cameraTestNum = (CameraTestNum).toString();
    /*
 * Player
 */
    let PlayerFailIndex = PlayerReport.indexOf('false');
    let PlayerFailNum = 0;
    while (PlayerFailIndex != -1) {
      console.log(PlayerFailIndex);
      PlayerFailNum++;
      PlayerFailIndex = PlayerReport.indexOf('false',PlayerFailIndex + 1);
    }
    let playerFailNum = (PlayerFailNum).toString();
    let PlayerPassIndex = PlayerReport.indexOf('true ');
    let PlayerPassNum = 0;
    while (PlayerPassIndex != -1) {
      console.log(PlayerPassIndex);
      PlayerPassNum++;
      PlayerPassIndex = PlayerReport.indexOf('true ',PlayerPassIndex + 1);
    }
    let PlayerTestNum = PlayerFailNum + PlayerPassNum;
    let playerTestNum = (PlayerTestNum).toString();
    /*
* Experience
*/
    let ExperienceFailIndex = ExperienceReport.indexOf('false');
    let ExperienceFailNum = 0;
    while (ExperienceFailIndex != -1) {
      console.log(ExperienceFailIndex);
      ExperienceFailNum++;
      ExperienceFailIndex = ExperienceReport.indexOf('false',ExperienceFailIndex + 1);
    }
    let experienceFailNum = (ExperienceFailNum).toString();
    let ExperiencePassIndex = ExperienceReport.indexOf('true ');
    let ExperiencePassNum = 0;
    while (ExperiencePassIndex != -1) {
      console.log(ExperiencePassIndex);
      ExperiencePassNum++;
      ExperiencePassIndex = ExperienceReport.indexOf('true ',ExperiencePassIndex + 1);
    }
    let ExperienceTestNum = ExperienceFailNum + ExperiencePassNum;
    let experienceTestNum = (ExperienceTestNum).toString();

    /**
     * Sensor
     */
    let SensorFailIndex = SensorReport.indexOf('false');
    let SensorFailNum = 0;
    while (SensorFailIndex != -1) {
      console.log(SensorFailIndex);
      SensorFailNum++;
      SensorFailIndex = SensorReport.indexOf('false',SensorFailIndex + 1);
    }
    let sensorFailNum = (SensorFailNum).toString();
    let SensorPassIndex = SensorReport.indexOf('true ');
    let SensorPassNum = 0;
    while (SensorPassIndex != -1) {
      console.log(SensorPassIndex);
      SensorPassNum++;
      SensorPassIndex = SensorReport.indexOf('true ',SensorPassIndex + 1);
    }
    let SensorTestNum = SensorFailNum + SensorPassNum;
    let sensorTestNum = (SensorTestNum).toString();

    /**
     * Screen
     */
    let ScreenFailIndex = ScreenReport.indexOf('false');
    let ScreenFailNum = 0;
    while (SensorFailIndex != -1) {
      console.log(SensorFailIndex);
      ScreenFailNum++;
      ScreenFailIndex = ScreenReport.indexOf('false',ScreenFailIndex + 1);
    }
    let screenFailNum = (ScreenFailNum).toString();
    let ScreenPassIndex = ScreenReport.indexOf('true ');
    let ScreenPassNum = 0;
    while (ScreenPassIndex != -1) {
      console.log(ScreenPassIndex);
      ScreenPassNum++;
      ScreenPassIndex = ScreenReport.indexOf('true ',ScreenPassIndex + 1);
    }
    let ScreenTestNum = ScreenFailNum + ScreenPassNum;
    let screenTestNum = (ScreenTestNum).toString();

    /**
     * MultimodalInput 多模输入
     */
    let MultimodalInputFailIndex = MultimodalInputReport.indexOf('false');
    let MultimodalInputFailNum = 0;
    while (MultimodalInputFailIndex != -1) {
      console.log(MultimodalInputFailIndex);
      MultimodalInputFailNum++;
      MultimodalInputFailIndex = MultimodalInputReport.indexOf('false',MultimodalInputFailIndex + 1);
    }
    let multimodalInputFailNum = (MultimodalInputFailNum).toString();
    let MultimodalInputPassIndex = MultimodalInputReport.indexOf('true ');
    let MultimodalInputPassNum = 0;
    while (MultimodalInputPassIndex != -1) {
      console.log(MultimodalInputPassIndex);
      MultimodalInputPassNum++;
      MultimodalInputPassIndex = MultimodalInputReport.indexOf('true ',MultimodalInputPassIndex + 1);
    }
    let MultimodalInputTestNum = MultimodalInputFailNum + MultimodalInputPassNum;
    let multimodalInputTestNum = (MultimodalInputTestNum).toString();

    /**
     * Power 电源管理
     */
    let PowerFailIndex = PowerReport.indexOf('false');
    let PowerFailNum = 0;
    while (PowerFailIndex != -1) {
      console.log(PowerFailIndex);
      PowerFailNum++;
      PowerFailIndex = PowerReport.indexOf('false',PowerFailIndex + 1);
    }
    let powerFailNum = (PowerFailNum).toString();
    let PowerPassIndex = PowerReport.indexOf('true ');
    let PowerPassNum = 0;
    while (PowerPassIndex != -1) {
      console.log(PowerPassIndex);
      PowerPassNum++;
      PowerPassIndex = PowerReport.indexOf('true ',PowerPassIndex + 1);
    }
    let PowerTestNum = PowerFailNum + PowerPassNum;
    let powerTestNum = (PowerTestNum).toString();

    /**
     * Notification 通知
     */
    let NotificationFailIndex = NotificationReport.indexOf('false');
    let NotificationFailNum = 0;
    while (NotificationFailIndex != -1) {
      console.log(NotificationFailIndex);
      NotificationFailNum++;
      NotificationFailIndex = NotificationReport.indexOf('false',NotificationFailIndex + 1);
    }
    let notificationFailNum = (NotificationFailNum).toString();
    let NotificationPassIndex = NotificationReport.indexOf('true ');
    let NotificationPassNum = 0;
    while (NotificationPassIndex != -1) {
      console.log(NotificationPassIndex);
      NotificationPassNum++;
      NotificationPassIndex = NotificationReport.indexOf('true ',NotificationPassIndex + 1);
    }
    let NotificationTestNum = NotificationFailNum + NotificationPassNum;
    let notificationTestNum = (NotificationTestNum).toString();

    /**
     * Wifi 管理
     */
    let WifiFailIndex = WifiReport.indexOf('false');
    let WifiFailNum = 0;
    while (WifiFailIndex != -1) {
      console.log(WifiFailIndex);
      WifiFailNum++;
      WifiFailIndex = WifiReport.indexOf('false',WifiFailIndex + 1);
    }
    let wifiFailNum = (WifiFailNum).toString();
    let WifiPassIndex = WifiReport.indexOf('true ');
    let WifiPassNum = 0;
    while (WifiPassIndex != -1) {
      console.log(WifiPassIndex);
      WifiPassNum++;
      WifiPassIndex = WifiReport.indexOf('true ',WifiPassIndex + 1);
    }
    let WifiTestNum = WifiFailNum + WifiPassNum;
    let wifiTestNum = (WifiTestNum).toString();

    /**
     * Bluetooth 蓝牙管理
     */
    let BluetoothFailIndex = BluetoothReport.indexOf('false');
    let BluetoothFailNum = 0;
    while (BluetoothFailIndex != -1) {
      console.log(BluetoothFailIndex);
      BluetoothFailNum++;
      BluetoothFailIndex = BluetoothReport.indexOf('false',BluetoothFailIndex + 1);
    }
    let bluetoothFailNum = (BluetoothFailNum).toString();
    let BluetoothPassIndex = BluetoothReport.indexOf('true ');
    let BluetoothPassNum = 0;
    while (BluetoothPassIndex != -1) {
      console.log(BluetoothPassIndex);
      BluetoothPassNum++;
      BluetoothPassIndex = BluetoothReport.indexOf('true ',BluetoothPassIndex + 1);
    }
    let BluetoothTestNum = BluetoothFailNum + BluetoothPassNum;
    let bluetoothTestNum = (BluetoothTestNum).toString();

    let arrayBuffer = new ArrayBuffer(40960);
    let bufView = new DataView(arrayBuffer);
    let serializer = new xml.XmlSerializer(bufView);
    serializer.setDeclaration();
    serializer.startElement("testsuites");
    serializer.setAttributes("name", "ActsValidator");
    serializer.setAttributes("starttime", starttime);
    serializer.setAttributes("endtime", endtime);
    serializer.setAttributes("errors", "0");
    serializer.setAttributes("disabled", "0");
    serializer.setAttributes("failures", failNum);
    serializer.setAttributes("tests", testNum);
    serializer.setAttributes("ignored", "0");
    serializer.setAttributes("unavailable", "0");
    serializer.setAttributes("productinfo", "{ }");
    serializer.setAttributes("modules", "ActsValidator");
    serializer.setAttributes("runmodules", "ActsValidator");
    /*
     * ArkUI
     */
    serializer.startElement("testsuite");
    serializer.setAttributes("name", "ActsArkUITest");
    serializer.setAttributes("time", "*");
    serializer.setAttributes("errors", "0");
    serializer.setAttributes("disabled", "0");
    serializer.setAttributes("failures", ArkuiFailNum);
    serializer.setAttributes("ignored", "0");
    serializer.setAttributes("tests", ArkuiTestNum);
    serializer.setAttributes("message", "*");
    serializer.setAttributes("modulename", "ActsValidator");
    for (let i = 0; i < title1.length; i++) {
      serializer.startElement("testcase");
      serializer.setAttributes("name", String(title1[i]));
      serializer.setAttributes("status", "run");
      serializer.setAttributes("time", "*");
      serializer.setAttributes("classname", "ActsArkUITest");
      serializer.setAttributes("result", String(result1[i]));
      serializer.setAttributes("level", "*");
      serializer.setAttributes("message", "*");
      serializer.endElement();
    }
    serializer.endElement();
    /*
     * Audio
     */
    serializer.startElement("testsuite");
    serializer.setAttributes("name", "ActsAudioTest");
    serializer.setAttributes("time", "*");
    serializer.setAttributes("errors", "0");
    serializer.setAttributes("disabled", "0");
    serializer.setAttributes("failures", audioFailNum);
    serializer.setAttributes("ignored", "0");
    serializer.setAttributes("tests", audioTestNum);
    serializer.setAttributes("message", "*");
    serializer.setAttributes("modulename", "ActsValidator");
    for (let i = 0; i < title2.length; i++) {
      serializer.startElement("testcase");
      serializer.setAttributes("name", String(title2[i]));
      serializer.setAttributes("status", "run");
      serializer.setAttributes("time", "*");
      serializer.setAttributes("classname", "ActsAudioTest");
      serializer.setAttributes("result", String(result2[i]));
      serializer.setAttributes("level", "*");
      serializer.setAttributes("message", "*");
      serializer.endElement();
    }
    serializer.endElement();
    /*
     * Camera
     */
    serializer.startElement("testsuite");
    serializer.setAttributes("name", "ActsCameraTest");
    serializer.setAttributes("time", "*");
    serializer.setAttributes("errors", "0");
    serializer.setAttributes("disabled", "0");
    serializer.setAttributes("failures", cameraFailNum);
    serializer.setAttributes("ignored", "0");
    serializer.setAttributes("tests", cameraTestNum);
    serializer.setAttributes("message", "*");
    serializer.setAttributes("modulename", "ActsValidator");
    for (let i = 0; i < title3.length; i++) {
      serializer.startElement("testcase");
      serializer.setAttributes("name", String(title3[i]));
      serializer.setAttributes("status", "run");
      serializer.setAttributes("time", "*");
      serializer.setAttributes("classname", "ActsCameraTest");
      serializer.setAttributes("result", String(result3[i]));
      serializer.setAttributes("level", "*");
      serializer.setAttributes("message", "*");
      serializer.endElement();
    }
    serializer.endElement();
    /*
 * Player
 */
    serializer.startElement("testsuite");
    serializer.setAttributes("name", "ActsPlayerTest");
    serializer.setAttributes("time", "*");
    serializer.setAttributes("errors", "0");
    serializer.setAttributes("disabled", "0");
    serializer.setAttributes("failures", playerFailNum);
    serializer.setAttributes("ignored", "0");
    serializer.setAttributes("tests", playerTestNum);
    serializer.setAttributes("message", "*");
    serializer.setAttributes("modulename", "ActsValidator");
    for (let i = 0; i < title4.length; i++) {
      serializer.startElement("testcase");
      serializer.setAttributes("name", String(title4[i]));
      serializer.setAttributes("status", "run");
      serializer.setAttributes("time", "*");
      serializer.setAttributes("classname", "ActsPlayerTest");
      serializer.setAttributes("result", String(result4[i]));
      serializer.setAttributes("level", "*");
      serializer.setAttributes("message", "*");
      serializer.endElement();
    }
    serializer.endElement();
    /*
* Experience
*/
    serializer.startElement("testsuite");
    serializer.setAttributes("name", "ActsExperienceTest");
    serializer.setAttributes("time", "*");
    serializer.setAttributes("errors", "0");
    serializer.setAttributes("disabled", "0");
    serializer.setAttributes("failures", experienceFailNum);
    serializer.setAttributes("ignored", "0");
    serializer.setAttributes("tests", experienceTestNum);
    serializer.setAttributes("message", "*");
    serializer.setAttributes("modulename", "ActsValidator");
    for (let i = 0; i < title5.length; i++) {
      serializer.startElement("testcase");
      serializer.setAttributes("name", String(title5[i]));
      serializer.setAttributes("status", "run");
      serializer.setAttributes("time", "*");
      serializer.setAttributes("classname", "ActsExperienceTest");
      serializer.setAttributes("result", String(result5[i]));
      serializer.setAttributes("level", "*");
      serializer.setAttributes("message", "*");
      serializer.endElement();
    }
    serializer.endElement();

    /**
     * Sensor
     */
    serializer.startElement("testsuite");
    serializer.setAttributes("name", "ActsSensorTest");
    serializer.setAttributes("time", "*");
    serializer.setAttributes("errors", "0");
    serializer.setAttributes("disabled", "0");
    serializer.setAttributes("failures", sensorFailNum);
    serializer.setAttributes("ignored", "0");
    serializer.setAttributes("tests", sensorTestNum);
    serializer.setAttributes("message", "*");
    serializer.setAttributes("modulename", "ActsValidator");
    for (let i = 0; i < title6.length; i++) {
      serializer.startElement("testcase");
      serializer.setAttributes("name", String(title6[i]));
      serializer.setAttributes("status", "run");
      serializer.setAttributes("time", "*");
      serializer.setAttributes("classname", "ActsSensorTest");
      serializer.setAttributes("result", String(result6[i]));
      serializer.setAttributes("level", "*");
      serializer.setAttributes("message", "*");
      serializer.endElement();
    }
    serializer.endElement();

    /**
     * Screen
     */
    serializer.startElement("testsuite");
    serializer.setAttributes("name", "ActsScreenTest");
    serializer.setAttributes("time", "*");
    serializer.setAttributes("errors", "0");
    serializer.setAttributes("disabled", "0");
    serializer.setAttributes("failures", screenFailNum);
    serializer.setAttributes("ignored", "0");
    serializer.setAttributes("tests", screenTestNum);
    serializer.setAttributes("message", "*");
    serializer.setAttributes("modulename", "ActsValidator");
    for (let i = 0; i < title8.length; i++) {
      serializer.startElement("testcase");
      serializer.setAttributes("name", String(title8[i]));
      serializer.setAttributes("status", "run");
      serializer.setAttributes("time", "*");
      serializer.setAttributes("classname", "ActsScreenTest");
      serializer.setAttributes("result", String(result8[i]));
      serializer.setAttributes("level", "*");
      serializer.setAttributes("message", "*");
      serializer.endElement();
    }
    serializer.endElement();

    /**
     * MultimodalInput
     */
    serializer.startElement("testsuite");
    serializer.setAttributes("name", "ActsMultimodalInputTest");
    serializer.setAttributes("time", "*");
    serializer.setAttributes("errors", "0");
    serializer.setAttributes("disabled", "0");
    serializer.setAttributes("failures", multimodalInputFailNum);
    serializer.setAttributes("ignored", "0");
    serializer.setAttributes("tests", multimodalInputTestNum);
    serializer.setAttributes("message", "*");
    serializer.setAttributes("modulename", "ActsValidator");
    for (let i = 0; i < title9.length; i++) {
      serializer.startElement("testcase");
      serializer.setAttributes("name", String(title9[i]));
      serializer.setAttributes("status", "run");
      serializer.setAttributes("time", "*");
      serializer.setAttributes("classname", "ActsMultimodalInputTest");
      serializer.setAttributes("result", String(result9[i]));
      serializer.setAttributes("level", "*");
      serializer.setAttributes("message", "*");
      serializer.endElement();
    }
    serializer.endElement();

    /**
     * Power
     */
    serializer.startElement("testsuite");
    serializer.setAttributes("name", "ActsPowerTest");
    serializer.setAttributes("time", "*");
    serializer.setAttributes("errors", "0");
    serializer.setAttributes("disabled", "0");
    serializer.setAttributes("failures", powerFailNum);
    serializer.setAttributes("ignored", "0");
    serializer.setAttributes("tests", powerTestNum);
    serializer.setAttributes("message", "*");
    serializer.setAttributes("modulename", "ActsValidator");
    for (let i = 0; i < title10.length; i++) {
      serializer.startElement("testcase");
      serializer.setAttributes("name", String(title10[i]));
      serializer.setAttributes("status", "run");
      serializer.setAttributes("time", "*");
      serializer.setAttributes("classname", "ActsPowerTest");
      serializer.setAttributes("result", String(result10[i]));
      serializer.setAttributes("level", "*");
      serializer.setAttributes("message", "*");
      serializer.endElement();
    }
    serializer.endElement();

    /**
     * Notification 通知
     */
    serializer.startElement("testsuite");
    serializer.setAttributes("name", "ActsNotificationTest");
    serializer.setAttributes("time", "*");
    serializer.setAttributes("errors", "0");
    serializer.setAttributes("disabled", "0");
    serializer.setAttributes("failures", notificationFailNum);
    serializer.setAttributes("ignored", "0");
    serializer.setAttributes("tests", notificationTestNum);
    serializer.setAttributes("message", "*");
    serializer.setAttributes("modulename", "ActsValidator");
    for (let i = 0; i < title11.length; i++) {
      serializer.startElement("testcase");
      serializer.setAttributes("name", String(title11[i]));
      serializer.setAttributes("status", "run");
      serializer.setAttributes("time", "*");
      serializer.setAttributes("classname", "ActsNotificationTest");
      serializer.setAttributes("result", String(result11[i]));
      serializer.setAttributes("level", "*");
      serializer.setAttributes("message", "*");
      serializer.endElement();
    }
    serializer.endElement();

    /**
     * Wifi 管理
     */
    serializer.startElement("testsuite");
    serializer.setAttributes("name", "ActsWifiTest");
    serializer.setAttributes("time", "*");
    serializer.setAttributes("errors", "0");
    serializer.setAttributes("disabled", "0");
    serializer.setAttributes("failures", wifiFailNum);
    serializer.setAttributes("ignored", "0");
    serializer.setAttributes("tests", wifiTestNum);
    serializer.setAttributes("message", "*");
    serializer.setAttributes("modulename", "ActsValidator");
    for (let i = 0; i < title12.length; i++) {
      serializer.startElement("testcase");
      serializer.setAttributes("name", String(title12[i]));
      serializer.setAttributes("status", "run");
      serializer.setAttributes("time", "*");
      serializer.setAttributes("classname", "ActsWifiTest");
      serializer.setAttributes("result", String(result12[i]));
      serializer.setAttributes("level", "*");
      serializer.setAttributes("message", "*");
      serializer.endElement();
    }
    serializer.endElement();

    /**
     * Bluetooth
     */
    serializer.startElement("testsuite");
    serializer.setAttributes("name", "ActsBluetoothTest");
    serializer.setAttributes("time", "*");
    serializer.setAttributes("errors", "0");
    serializer.setAttributes("disabled", "0");
    serializer.setAttributes("failures", bluetoothFailNum);
    serializer.setAttributes("ignored", "0");
    serializer.setAttributes("tests", bluetoothTestNum);
    serializer.setAttributes("message", "*");
    serializer.setAttributes("modulename", "ActsValidator");
    for (let i = 0; i < title13.length; i++) {
      serializer.startElement("testcase");
      serializer.setAttributes("name", String(title13[i]));
      serializer.setAttributes("status", "run");
      serializer.setAttributes("time", "*");
      serializer.setAttributes("classname", "ActsBluetoothTest");
      serializer.setAttributes("result", String(result13[i]));
      serializer.setAttributes("level", "*");
      serializer.setAttributes("message", "*");
      serializer.endElement();
    }
    serializer.endElement();

    serializer.endElement();

    let that = new util.TextDecoder('utf-8');
    let array = new Uint8Array(arrayBuffer);
    let serializerStr = that.decode(array);
    console.info(xmlPath);
    try {
      console.error(TAG, "write xmlPath =" + xmlPath);
      var xmlfd = fs.openSync(xmlPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.writeSync(xmlfd.fd, serializerStr);
    } catch (err) {
      console.error(TAG, "read xmlPath =" + xmlPath + "error:" + err);
    } finally {
      fs.closeSync(xmlfd);
    }
  }
}
