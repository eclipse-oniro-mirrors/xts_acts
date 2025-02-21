/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import socket from '@ohos.net.socket';

let tcp = socket.constructTCPSocketInstance();
tcp.on('message', value => {
  let buffer = value.message;
  let dataView = new DataView(buffer);
  let messageView = '';
  for (var i = 0; i < dataView.byteLength; i++) {
    messageView += String.fromCharCode(dataView.getUint8(i));
  }
  console.log('123123123' + messageView);
  globalThis.resultNum = messageView;
});
@Entry
@Component
struct FloatBall {
  @State timerNum: number = 0;
  timerId: number = -1;
  @State windShowState: boolean = false;
  @State title: string = 'start';
  @State sec: number = 15;
  @State refreshSec: number = 3;
  offsetX: number = -1;
  offsetY: number = -1;
  COUNTS = 2;
  DURATION: number = 300;
  mHit = Array(this.COUNTS);
  isDoubleFlag = false;
  singleClickId = 0;

  private countDown() {
    this.title = 'count';
    var T = setInterval(() => {
      if (this.sec <= 0) {
        clearTimeout(T);
        this.title = 'done';
        this.sec = 15;
        this.refreshCount();
      } else if(this.title === 'start'){
        clearTimeout(T);
        this.sec = 15;
      } else if (this.title === 'done'){
        clearTimeout(T);
        this.sec = 15;
        this.refreshCount();
      }
      else {
        this.sec--;
      }
    }, 1000)
  }

  private refreshCount() {
    var Time = setInterval(() => {
      if (this.refreshSec <= 0) {
        clearTimeout(Time);
        this.title = 'start';
        this.refreshSec = 3;
      } else {
        this.refreshSec--;
      }
    }, 1000)
  }

  private TCPConnect(){


    tcp.bind({address: '0.0.0.0', port: 8284, family: 1}, err => {
      if (err) {
        console.log('bind fail');
        return;
      }
      console.log('bind success');
    })
    tcp.connect({ address: { address: '0.0.0.0', port: 8284, family: 1 } }, err => {
      if (err) {
        console.log('connect fail');
        this.title = 'connect fail';
        return;
      }
      console.log('connect success');
      tcp.getRemoteAddress((err, data) => {
        if (err) {
          console.log('getRemoteAddressfail');
          return;
        }
        console.log('getRemoteAddresssuccess:' + JSON.stringify(data));
        this.title = 'start';
      })
      tcp.getState((err, data) => {
        if (err) {
          console.log('getState fail');
          return;
        }
        console.log('getState success:' + JSON.stringify(data));
      });
    })
  }

  private TCPClose(){
    tcp.close((err) => {
      console.log('close socket.');
      console.log('ErrorError: ' + err)
    });
    tcp.off('message');
    tcp.off('connect');
    tcp.off('close');
  }

  aboutToAppear() {
    this.TCPConnect();
  }

  longEvent() {
    this.destroyAllWindow();
  }

  destroyAllWindow() {
    globalThis.DestroyFloatingWindow();
  }

  MoveWindow(offsetX: number, offsetY: number) {
    globalThis.MoveFloatingWindow(offsetX, offsetY);
  }

  SetWindowPosition(offsetX: number, offsetY: number) {
    globalThis.SetFloatingWindowPosition(offsetX, offsetY)
  }

  build(){
    Stack({alignContent: Alignment.Center}) {
      if(this.title === 'connecting'){
        Circle()
          .width('90vp').height('90vp').fill(Color.White).fillOpacity(0).opacity(0.8)
          .border({radius:'90vp',width:'0.5vp',color:'#00ff00'})
          .linearGradient({
            angle: 135,
            direction: GradientDirection.Left,
            colors: [['#00ff00',1.0],['#00ff00',1.0]]
          })
        Text('连接中')
          .fontSize(14).textAlign(TextAlign.Center).fontColor($r('app.color.color_fff')).width('100%').height('100%')
          .gesture(
            GestureGroup(GestureMode.Exclusive,
              PanGesture({})
                .onActionStart(() => {})
                .onActionUpdate((event: GestureEvent) => {
                  this.offsetX = event.offsetX;
                  this.offsetY = event.offsetY;
                })
                .onActionEnd(() => {
                  this.MoveWindow(this.offsetX, this.offsetY);
                  this.SetWindowPosition(this.offsetX, this.offsetY)
                })
            )
          )
      }
      if(this.title === 'connect fail'){
        Circle()
          .width('90vp').height('90vp').fill(Color.White).fillOpacity(0).opacity(0.8)
          .border({radius:'90vp',width:'0.5vp',color:$r('app.color.colorPrimary')})
          .linearGradient({
            angle: 135,
            direction: GradientDirection.Left,
            colors: [[$r('app.color.colorPrimary'),1.0],[$r('app.color.colorPrimary'),1.0]]
          })
        Text('连接失败')
          .fontSize(14).textAlign(TextAlign.Center).fontColor($r('app.color.color_fff')).width('100%').height('100%')
          .onClick(() => {
            this.TCPClose();
            this.TCPConnect();
          })
          .gesture(
            GestureGroup(GestureMode.Exclusive,
              PanGesture({})
                .onActionStart(() => {})
                .onActionUpdate((event: GestureEvent) => {
                  this.offsetX = event.offsetX;
                  this.offsetY = event.offsetY;
                })
                .onActionEnd(() => {
                  this.MoveWindow(this.offsetX, this.offsetY);
                  this.SetWindowPosition(this.offsetX, this.offsetY)
                })
            )
          )
      }
      if(this.title === 'start'){
        Circle()
          .width('90vp').height('90vp').fill(Color.White).fillOpacity(0).opacity(0.8)
          .border({radius:'90vp',width:'0.5vp',color:('#00B2C6')})
          .linearGradient({
            angle: 135,
            direction: GradientDirection.Left,
            colors: [[('#00B2C6'),1.0],[('#00B2C6'),1.0]]
          })
        Text('start')
          .fontSize(18).textAlign(TextAlign.Center).fontColor($r('app.color.color_fff')).width('100%').height('100%')
          .onClick(() => {
            tcp.send({
              data: globalThis.SendMessage
              //此处省略encoding， 默认为utf-8编码格式
            }, err => {
              if (err) {
                console.log('send fail');
                return;
              }
              console.log('send success：' + tcp.send);
            })
            if (this.sec === 15) {
              this.countDown()
            }
          })
          .gesture(
            GestureGroup(GestureMode.Exclusive,
              LongPressGesture({fingers: 1, repeat: false, duration: 1000 })
                .onAction(() => {
                  this.TCPClose();
                }),

              PanGesture({})
                .onActionStart(() => {

                })
                .onActionUpdate((event: GestureEvent) => {
                  this.offsetX = event.offsetX;
                  this.offsetY = event.offsetY;
                })
                .onActionEnd(() => {
                  this.MoveWindow(this.offsetX, this.offsetY);
                  this.SetWindowPosition(this.offsetX, this.offsetY)
                })
            )
          )
      }
      if(this.title === 'count'){
        Circle()
          .width('90vp').height('90vp').fill(Color.White).fillOpacity(0).opacity(0.8)
          .border({radius:'90vp',width:'0.5vp',color:$r('app.color.color_666')})
          .linearGradient({
            angle: 135,
            direction: GradientDirection.Left,
            colors: [[$r('app.color.color_666'),1.0],[$r('app.color.color_666'),1.0]]
          })
        Text(`${this.sec}`)
          .fontSize(18).textAlign(TextAlign.Center).fontColor($r('app.color.color_fff')).width('100%').height('100%')
          .gesture(
            GestureGroup(GestureMode.Exclusive,
              TapGesture({ count: 2 })
                .onAction(() => {
                  this.title = 'start';
                }),

              LongPressGesture({fingers: 1, repeat: false, duration: 1000 })
                .onAction(() => {
                  this.title = 'done';
                }),

              PanGesture({})
                .onActionStart(() => {

                })
                .onActionUpdate((event: GestureEvent) => {
                  this.offsetX = event.offsetX;
                  this.offsetY = event.offsetY;
                })
                .onActionEnd(() => {
                  this.MoveWindow(this.offsetX, this.offsetY);
                  this.SetWindowPosition(this.offsetX, this.offsetY)
                })
            )
          )
      }
      if(this.title === 'done'){
        Circle()
          .width('90vp').height('90vp').fill(Color.White).fillOpacity(0).opacity(0.8)
          .border({radius:'90vp',width:'0.5vp',color:'#00ff00'})
          .linearGradient({
            angle: 135,
            direction: GradientDirection.Left,
            colors: [['#00ff00',1.0],['#00ff00',1.0]]
          })
        Text('done')
          .fontSize(18).textAlign(TextAlign.Center).fontColor($r('app.color.color_fff')).width('100%').height('100%')
          .onClick(async () => {
            this.title = 'start';
          })
          .gesture(
            GestureGroup(GestureMode.Exclusive,
              LongPressGesture({fingers: 1, repeat: false, duration: 1000 })
                .onAction(() => {
                }),

              PanGesture({})
                .onActionStart(() => {

                })
                .onActionUpdate((event: GestureEvent) => {
                  this.offsetX = event.offsetX;
                  this.offsetY = event.offsetY;
                })
                .onActionEnd(() => {
                  this.MoveWindow(this.offsetX, this.offsetY);
                  this.SetWindowPosition(this.offsetX, this.offsetY)
                })
            )
          )
      }
    }.width('100%').height('100%')
  }
}