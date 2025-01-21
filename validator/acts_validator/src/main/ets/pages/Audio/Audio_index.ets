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
import xml from '@ohos.xml';
import fileIO from '@ohos.fileio';
import util from '@ohos.util';
import data_preferences from '@ohos.data.preferences';

const TAG = 'ParseXML';
let path = globalThis.dir;
let path1 = path + '/Audio';

let VarColor = [];
let ColorBackPath = path + '/AudioColorBack.txt';
let txtPath = path1 + '/AudioReport.txt';
let xmlPath =path1 + '/AudioTest.xml';

@Entry
@Component
struct IndexPage {
  @State ClearAll : boolean = false;
  private current : number = undefined;
  @State count : number = 0;
  @State result : string = '';
  @State TEST : number = 0;
  private TestCaseList = [
    {title:'AudioInputRoutingTest(WiredHeadset)',uri:'pages/Audio/AudioInputRoutingWiredHeadset'},
    {title:'AudioInputRoutingTest(TypeC)',uri:'pages/Audio/AudioInputRoutingTypeC'},
    {title:'AudioOutputRoutingTest(WiredHeadset)',uri:'pages/Audio/AudioOutputRoutingWiredHeadset'},
    {title:'AudioOutputRoutingTest(TypeC)',uri:'pages/Audio/AudioOutputRoutingTypeC'},
    {title:'AudioOutputRoutingTest(BT)',uri:'pages/Audio/AudioOutputRoutingBT'},
  ]
  @State ColorObject : string[] = VarColor;
  async onPageShow(){
    let Test = null;
    let context =null;
    context = globalThis.getContext();
    let preferences;

    let promise = data_preferences.getPreferences(context,'mystore');
    await promise.then((object) => {
      preferences = object;
    });
    promise = preferences.get('Audio', 0);
    await promise.then((data) => {
      Test = data;
      console.info("Succeeded in getting value of 'Audio'. Data: " + data);
    });

    if(Test != 1) {
      let fd = fileio.openSync(ColorBackPath, 0o102, 0o666);
      for(let i = 0; i < this.TestCaseList.length; i++) {
        let log = (this.TestCaseList[i].title+';'+'#ff808080'+';').toString();
        fileio.writeSync(fd,log);
      }
      fileio.closeSync(fd);
    }
    promise = preferences.put('Audio', 1);
    promise.then(() => {
      console.info("Succeeded in putting value of 'Audio'.");
    });
    promise = preferences.flush();
    promise.then(() => {
      console.info("Succeeded in flushing.");
    });
    this.TEST = Test;

    let opt = fileio.openSync(ColorBackPath, 0o100 | 0o2002, 0o664);
    let buff = new ArrayBuffer(40960);
    fileio.readSync(opt,buff);
    let ColorBack = String.fromCharCode.apply(null, new Uint8Array(buff));
    let TestList = ColorBack.split(';');
    for (let i = 0; i < Math.floor(TestList.length / 2); i++) {
      VarColor[i] = TestList[i*2+1];
    }
    fileio.closeSync(opt);

    if (this.count === 1){
      this.result = router.getParams()['result'];
      let titles = router.getParams()['title'];
      let name1 = '刚刚点进了哪个用例：'+ titles;
      let results = this.result;
      let WriteTitle = (titles).toString();
      let number = WriteTitle.length + 11;
      let Index = ColorBack.indexOf(WriteTitle);

      if (this.result === 'true '){
        this.ColorObject[this.current] = '#ff008000';
        let Log = (titles+';'+'#ff008000'+';');
        let key = ColorBack.substring(Index,Index+number);
        let FD = fileio.openSync(ColorBackPath, 0o102, 0o666);
        ColorBack = ColorBack.replace(key,Log);
        let buffer = new ArrayBuffer(4096);
        let rd = fileio.readSync(FD,buffer);
        let Report = ColorBack.substring(0,rd);
        fileio.closeSync(FD);
        let Fd = fileio.openSync(ColorBackPath, 0o102, 0o666);
        fileio.writeSync(Fd,Report);
        filewrite(name1,results,titles)
      }
      else if (this.result === 'false'){
        this.ColorObject[this.current] = '#ffff0000';
        let Log = (titles+';'+'#ffff0000'+';');
        let key = ColorBack.substring(Index,Index+number);
        let FD = fileio.openSync(ColorBackPath, 0o102, 0o666);
        ColorBack = ColorBack.replace(key,Log);
        let buffer = new ArrayBuffer(4096);
        let rd = fileio.readSync(FD,buffer);
        let Report = ColorBack.substring(0,rd);
        fileio.closeSync(FD);
        let Fd = fileio.openSync(ColorBackPath, 0o102, 0o666);
        fileio.writeSync(Fd,Report);
        filewrite(name1,results,titles);
      }
      else if (this.result === 'None'){
        this.ColorObject[this.current] = this.ColorObject[this.current];
      }
    }
  }
  build(){
    Column(){
      Row() {
        Button() {
          Image($r('app.media.ic_public_back')).width('20vp').height('18vp')
        }.backgroundColor(Color.Black).size({ width: '40vp', height: '30vp' })
        .onClick(() => {
          router.back();
        })
        Row(){
          Text('Audio SubSystem')
            .fontColor(Color.White)
            .fontSize('22fp')
        }.justifyContent(FlexAlign.SpaceAround).backgroundColor(Color.Black)
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
                    this.ClearAll = true;
                    this.ColorObject.forEach((value, index) => {
                      this.ColorObject[index] =  '#ff808080';
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
          Button(){
            Image($r('app.media.ic_public_save'))
              .width('30vp')
              .height('30vp')
              .margin({ left: 30 })
          }.backgroundColor(Color.Black)
          .onClick(() => {
            this.ReadTextParseXml();
            AlertDialog.show({
              message: "报告已生成，如需查看通过命令行输入'hdc_std file recv /data/app/el2/100/base/com.example.actsvalidator/haps/entry/files/Audio/AudioTest.xml -本地路径'",
              confirm:{
                value:'OK',
                action:()=>{
                  prompt.showToast({
                    message: '报告已生成', duration: 1000
                  })
                }
              },
              cancel: () => {
                prompt.showToast({
                  message: '报告已生成', duration: 1000
                });
              }
            })
          })
        }
      }.width('100%').justifyContent(FlexAlign.SpaceAround).margin({top:'15vp'}).height('6%').backgroundColor(Color.Black)
      List({space:5}){
        ForEach(this.TestCaseList,(item,index) => {
          ListItem(){
            Row(){
              Text(item.title).fontSize(16).fontColor(Color.Black)
            }.width('100%').height(50).alignItems(VerticalAlign.Center).backgroundColor(this.count===0&&this.TEST===0?'#ff808080':this.ColorObject[index])
            .onClick(( )=>{
              this.count = 1;
              this.ClearAll=false;
              this.current = index;
              router.push({
                url: item.uri,
              })
            })
          }
        },item  => item.title)
      }.width('100%').height('92%')
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
  ClearText(){
    fileio.rmdirSync(path1);
    fileio.mkdirSync(path1);
    let fd = fileio.openSync(ColorBackPath, 0o102, 0o666);
    for(let i = 0; i < this.TestCaseList.length; i++) {
      let log = (this.TestCaseList[i].title+';'+'#ff808080'+';').toString();
      fileio.writeSync(fd,log);
    }
  }
  ReadTextParseXml(){
    let ReportPath = path1 + '/AudioReport.txt';
    let dir = fileio.opendirSync(path1);
    console.info("ssssss"+dir);
    while (dir) {
      let OP = fileio.openSync(ReportPath, 0o100 | 0o2002, 0o664);
      let buf = new ArrayBuffer(40960);
      let RD = fileio.readSync(OP,buf);
      console.info("ddddd"+RD);
      let report;
      function ab2str(buf) {
        return report = String.fromCharCode.apply(null,new Uint8Array(buf));
      }
      ab2str(buf);
      let str1 = report.split(";");
      let title = [];
      let result = [];
      for(let i=0; i<Math.floor(str1.length/2); i++){
        title[i] = str1[i*2];
        result[i] = str1[i*2+1];
      }
      let FailIndex = report.indexOf('false');
      let FailNum = 0;
      while (FailIndex != -1) {
        console.log(FailIndex);
        FailNum++;
        FailIndex = report.indexOf('false',FailIndex + 1);
      }
      let failNum = (FailNum).toString();
      let PassIndex = report.indexOf('true ');
      let PassNum = 0;
      while (PassIndex != -1) {
        console.log(PassIndex);
        PassNum++;
        PassIndex = report.indexOf('true ',PassIndex + 1);
      }
      let TestNum = FailNum + PassNum;
      let testNum = (TestNum).toString();
      let arrayBuffer = new ArrayBuffer(40960);
      let bufView = new DataView(arrayBuffer);
      let serializer = new xml.XmlSerializer(bufView);
      serializer.setDeclaration();
      serializer.startElement("testsuite");
      serializer.setAttributes("name","ActsAudioTest");
      serializer.setAttributes("time", "*");
      serializer.setAttributes("errors", "0");
      serializer.setAttributes("disabled", "0");
      serializer.setAttributes("failures", failNum);
      serializer.setAttributes("ignored", "0");
      serializer.setAttributes("tests", testNum);
      serializer.setAttributes("message", "*");
      serializer.setAttributes("modulename", "ActsAudioTest");
      for (let i = 0; i < title.length; i++) {
        serializer.startElement("testcase");
        serializer.setAttributes("name", String(title[i]));
        serializer.setAttributes("status", "run");
        serializer.setAttributes("time", "*");
        serializer.setAttributes("classname", "ActsAudioTest");
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
      try{
        console.error(TAG,"write xmlPath =" +xmlPath);
        var xmlfd = fileIO.openSync(xmlPath, 0o102, 0o666);
        fileIO.writeSync(xmlfd,serializerStr);
      }catch(err){
        console.error(TAG,"read xmlPath =" + xmlPath + "error:" + err);
      }finally{
        fileIO.closeSync(xmlfd);
      }
      return;
    }
  }
}
function filewrite(name1,results,titles){
  let fd = fileio.openSync(txtPath, 0o100 | 0o2002, 0o664);
  let buf = new ArrayBuffer(4096);
  let RD = fileio.readSync(fd,buf);
  console.info("RRRRRRRRRRd"+RD);
  let report = String.fromCharCode.apply(null,new Uint8Array(buf));
  let WriteTitle = (titles).toString();
  let WriteResult = (results).toString();
  let number = WriteTitle.length + WriteResult.length + 2;
  let Index = report.indexOf(WriteTitle);
  let Log = (titles+";"+results+";").toString();
  if (Index == -1){
    fileio.writeSync(fd,Log);
  }
  else if (Index != -1){
    let key = report.substring(Index,Index+number);
    let FD = fileio.openSync(txtPath, 0o102, 0o666);
    report = report.replace(key,Log);
    let buffer = new ArrayBuffer(4096);
    let rd = fileio.readSync(FD,buffer);
    let Report = report.substring(0,rd);
    fileio.closeSync(FD);
    let Fd = fileio.openSync(txtPath, 0o102, 0o666);
    fileio.writeSync(Fd,Report);
  }
}