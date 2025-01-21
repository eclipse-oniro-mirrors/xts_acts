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
import prompt from '@ohos.prompt';
import router from '@ohos.router';
import fileio from '@ohos.fileio';
import xml from '@ohos.xml';
import fileIO from '@ohos.fileio';
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
let picturePath = path + '/screenshot';
let ExperienceDataPath = path + '/ExperienceData';
let ArkUIColorBackPath = path + '/ArkUIColorBack.txt';
let AudioColorBackPath = path + '/AudioColorBack.txt';
let CameraColorBackPath = path + '/CameraColorBack.txt';
let PlayerColorBackPath = path + '/PlayerColorBack.txt';
let PlayerAudioColorBackPath = path4 + '/PlayerAudioColorBack.txt';
let PlayerVideoColorBackPath = path4 + '/PlayerVideoColorBack.txt';
let ExperienceColorBackPath = path + '/ExperienceColorBack.txt';
fileio.openSync(ArkUIColorBackPath, 0o100 | 0o2002, 0o664);
fileio.openSync(AudioColorBackPath, 0o100 | 0o2002, 0o664);
fileio.openSync(CameraColorBackPath, 0o100 | 0o2002, 0o664);
fileio.openSync(PlayerColorBackPath, 0o100 | 0o2002, 0o664);
fileio.openSync(ExperienceColorBackPath, 0o100 | 0o2002, 0o664);
let TimePath = path + '/Time.txt';
fileio.openSync(TimePath, 0o100 | 0o2002, 0o664);
let xmlPath = path + '/Test.xml';
fileio.openSync(xmlPath, 0o100 | 0o2002, 0o664);
let path11 = path1 + '/ArkUIReport.txt';
let path22 = path2 + '/AudioReport.txt';
let path33 = path3 + '/CameraReport.txt';
let path44 = path4 + '/PlayerReport.txt';
let PlayerAudioTxtPath = path4 + '/PlayerAudioReport.txt';
let PlayerVideoTxtPath = path4 + '/PlayerVideoReport.txt';
let path55 = path5 + '/ExperienceReport.txt';

@Entry
@Component
struct IndexPage {
  private TestCaseList = [
    {title:'ArkUI',uri:'pages/ArkUI/ArkUI_index'},
    {title:'Audio',uri:'pages/Audio/Audio_index'},
    {title:'Camera',uri:'pages/Camera/Camera_index'},
    {title:'Player',uri:'pages/Player/Player_index'},
    {title:'Experience',uri:'pages/Experience/Experience_index'},
  ]
  @State ColorObject : string[] = ['#ff808080','#ff808080','#ff808080','#ff808080','#ff808080']
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
      fileio.mkdirSync(path1);
      fileio.mkdirSync(path2);
      fileio.mkdirSync(path3);
      fileio.mkdirSync(path4);
      fileio.mkdirSync(path5);
      fileio.mkdirSync(picturePath);
      fileio.mkdirSync(ExperienceDataPath);

      let promise = preferences.put('index', 1);
      promise.then(() => {
        console.info("Succeeded in putting value of 'index'.");
      });
      promise = preferences.flush();
      promise.then(() => {
        console.info("Succeeded in flushing.");
      });
    }
    fileio.openSync(path11, 0o100 | 0o2002, 0o664);
    fileio.openSync(path22, 0o100 | 0o2002, 0o664);
    fileio.openSync(path33, 0o100 | 0o2002, 0o664);
    fileio.openSync(path44, 0o100 | 0o2002, 0o664);
    fileio.openSync(PlayerAudioColorBackPath, 0o100 | 0o2002, 0o664);
    fileio.openSync(PlayerVideoColorBackPath, 0o100 | 0o2002, 0o664);
    fileio.openSync(PlayerAudioTxtPath, 0o100 | 0o2002, 0o664);
    fileio.openSync(PlayerVideoTxtPath, 0o100 | 0o2002, 0o664);
    fileio.openSync(path55, 0o100 | 0o2002, 0o664);
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
          Button(){
            Image($r('app.media.ic_public_save'))
              .width('30vp')
              .height('30vp')
              .margin({ left: 30 })
          }.backgroundColor(Color.Black)
          .onClick(() => {
            this.SaveXml();
            AlertDialog.show({
              message: "报告已生成，如需查看通过命令行输入'hdc_std file recv hdc_std file recv /data/app/el2/100/base/com.example.actsvalidator/haps/entry/files/Test.xml -本地路径'",
              confirm:{
                value:'OK',
                action:()=>{
                  prompt.showToast({
                    message: '总报告已生成', duration: 1000
                  })
                }
              },
              cancel: () => {
                prompt.showToast({
                  message: '总报告已生成', duration: 1000
                });
              }
            })
          })
        }
      }.width('100%').justifyContent(FlexAlign.SpaceAround).margin({top:'15vp'}).height('6%')
      List({space:5}){
        ForEach(this.TestCaseList,(item,index) => {
          ListItem(){
            Row(){
              Text(item.title).fontSize(16).fontColor(Color.Black)
            }.width('100%').height(50).alignItems(VerticalAlign.Center).backgroundColor(this.ColorObject[index])
            .onClick(()=>{
              router.push({
                url: item.uri,
              })
              let dateTimeUtil = new DateTimeUtil();
              let time = `${dateTimeUtil.getFullYear()}-${dateTimeUtil.getMonth()}-${dateTimeUtil.getDay()} ${dateTimeUtil.getHour()}:${dateTimeUtil.getMinute()}:${dateTimeUtil.getSecond()}`;
              let TimePath = path + "/Time.txt";
              let OP = fileio.openSync(TimePath, 0o100 | 0o2002, 0o664);
              let buf = new ArrayBuffer(4096);
              fileio.readSync(OP,buf);
              let Log = (time + ";").toString();
              fileio.writeSync(OP,Log);
            })
          }
        },item  => item.title)
      }.width('100%').height('92%')
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
  ClearText(){
    fileio.unlinkSync(TimePath);
    fileio.unlinkSync(xmlPath);
    fileio.unlinkSync(path11);
    fileio.unlinkSync(path22);
    fileio.unlinkSync(path33);
    fileio.unlinkSync(path44);
    fileio.unlinkSync(PlayerAudioTxtPath);
    fileio.unlinkSync(PlayerVideoTxtPath);
    fileio.unlinkSync(path55);
    fileio.unlinkSync(ArkUIColorBackPath);
    fileio.unlinkSync(AudioColorBackPath);
    fileio.unlinkSync(CameraColorBackPath);
    fileio.unlinkSync(PlayerColorBackPath);
    fileio.unlinkSync(PlayerAudioColorBackPath);
    fileio.unlinkSync(PlayerVideoColorBackPath);
    fileio.unlinkSync(ExperienceColorBackPath);
    fileio.rmdirSync(picturePath);
    fileio.mkdirSync(picturePath);
    fileio.rmdirSync(ExperienceDataPath);
    fileio.mkdirSync(ExperienceDataPath);
    fileio.openSync(TimePath, 0o100 | 0o2002, 0o664);
    fileio.openSync(xmlPath, 0o100 | 0o2002, 0o664);
    fileio.openSync(path11, 0o100 | 0o2002, 0o664);
    fileio.openSync(path22, 0o100 | 0o2002, 0o664);
    fileio.openSync(path33, 0o100 | 0o2002, 0o664);
    fileio.openSync(path44, 0o100 | 0o2002, 0o664);
    fileio.openSync(PlayerAudioTxtPath, 0o100 | 0o2002, 0o664);
    fileio.openSync(PlayerVideoTxtPath, 0o100 | 0o2002, 0o664);
    fileio.openSync(path55, 0o100 | 0o2002, 0o664);
    fileio.openSync(ArkUIColorBackPath, 0o100 | 0o2002, 0o664);
    fileio.openSync(AudioColorBackPath, 0o100 | 0o2002, 0o664);
    fileio.openSync(CameraColorBackPath, 0o100 | 0o2002, 0o664);
    fileio.openSync(PlayerColorBackPath, 0o100 | 0o2002, 0o664);
    fileio.openSync(PlayerAudioColorBackPath, 0o100 | 0o2002, 0o664);
    fileio.openSync(PlayerVideoColorBackPath, 0o100 | 0o2002, 0o664);
    fileio.openSync(ExperienceColorBackPath, 0o100 | 0o2002, 0o664);
    FlushData.ResetArkUI();
    FlushData.ResetAudio();
    FlushData.ResetCamera();
    FlushData.ResetPlayer();
    FlushData.ResetExperience();
    FlushData.ResetPlayerAudio();
    FlushData.ResetPlayerVideo();
  }
  SaveXml() {
    let dateTimeUtil = new DateTimeUtil();
    let endtime = `${dateTimeUtil.getFullYear()}-${dateTimeUtil.getMonth()}-${dateTimeUtil.getDay()} ${dateTimeUtil.getHour()}:${dateTimeUtil.getMinute()}:${dateTimeUtil.getSecond()}`;
    let fd = fileio.openSync(TimePath, 0o100 | 0o2002, 0o664);
    let buf = new ArrayBuffer(40960);
    fileio.readSync(fd,buf);
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
    /*
     * ArkUI
     */
    let OP1 = fileio.openSync(path11, 0o100 | 0o2002, 0o664);
    let buf1 = new ArrayBuffer(40960);
    fileio.readSync(OP1,buf1);
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
    let OP2 = fileio.openSync(path22, 0o100 | 0o2002, 0o664);
    let buf2 = new ArrayBuffer(40960);
    fileio.readSync(OP2,buf2);
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
    let OP3 = fileio.openSync(path33, 0o100 | 0o2002, 0o664);
    let buf3 = new ArrayBuffer(40960);
    fileio.readSync(OP3,buf3);
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
    let OP4 = fileio.openSync(path44, 0o100 | 0o2002, 0o664);
    let buf4 = new ArrayBuffer(40960);
    fileio.readSync(OP4,buf4);
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
    let OP5 = fileio.openSync(path55, 0o100 | 0o2002, 0o664);
    let buf5 = new ArrayBuffer(40960);
    fileio.readSync(OP5,buf5);
    ExperienceReport = String.fromCharCode.apply(null, new Uint8Array(buf5));
    let str5 = ExperienceReport.split(";");
    let title5 = [];
    let result5 = [];
    for (let i = 0; i < Math.floor(str5.length / 2); i++) {
      title5[i] = str5[i * 2];
      result5[i] = str5[i * 2 + 1];
    }

    let report = ArkUIReport + AudioReport + CameraReport + PlayerReport + ExperienceReport;
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
    serializer.endElement();

    let that = new util.TextDecoder('utf-8');
    let array = new Uint8Array(arrayBuffer);
    let serializerStr = that.decode(array);
    console.info(xmlPath);
    try {
      console.error(TAG, "write xmlPath =" + xmlPath);
      var xmlfd = fileIO.openSync(xmlPath, 0o102, 0o666);
      fileIO.writeSync(xmlfd, serializerStr);
    } catch (err) {
      console.error(TAG, "read xmlPath =" + xmlPath + "error:" + err);
    } finally {
      fileIO.closeSync(xmlfd);
    }
  }
}
