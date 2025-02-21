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

@Extend(Button) function bu(){
    .width('25%')
    .type(ButtonType.Capsule)
    .backgroundColor(Color.Orange)
    .fontSize(8)
}
import router from '@ohos.router';
import web_webview from '@ohos.web.webview'
import prompt from '@system.prompt'
import Utils from '../../test/Utils'
import events_emitter from '@ohos.events.emitter'

const phoneUserAgent: string = "Mozilla/5.0 (Linux;Android 9; VRD-AL10; HMSCore 6.3.0.331) AppleWebKit/537.36 (KHTML, like Gecko) CHrome/92.0.4515.105 HuaweuBrowser/12.0.4.1 Mobile Safari/537.36"
const pcUserAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27"

@CustomDialog
export struct NewWebViewComp {
    dialogController: CustomDialogController;
    url: string;
    @State text: string = '日志在这里显示'
    @State javaScriptAccess: boolean = true;
    @State multitAccess: boolean = true; 
    @State fileAccess: boolean = true; 
    @State onlineImageAccess: boolean = true; 
    @State domStorageAccess: boolean = true; 
    @State imageAccess: boolean = true; 
    @State zoomAccess: boolean = true; 
    @State geolocationAccess: boolean = true; 
    @State allowWindow: boolean = true;  
    private controller: web_webview.WebviewController = new web_webview.WebviewController();
    private dialog : any;
    build() {
        Column() {
            Row({ space: 5 }) {
                Web({ src: $rawfile('indexTwo.html'), controller: this.controller })
                .fileAccess(this.fileAccess)
                .onlineImageAccess(this.onlineImageAccess)
                .domStorageAccess(this.domStorageAccess)
                .imageAccess(this.imageAccess)
                .zoomAccess(this.zoomAccess)
                .geolocationAccess(this.geolocationAccess)
                .javaScriptAccess(true)
                .databaseAccess(true)
                .backgroundColor(Color.Orange)
                .onWindowExit(() => {
                    this.dialogController.close();
                })
            }
        }
    }
}

@Entry
@Component
struct indexTwo {
    @State gameLeft: string = "console.info('webgame gameLeft'); _main.paddle.moveLeft();"
    @State gameRight: string = "console.info('webgame gameRight'); _main.paddle.moveRight();"
    @State gameStart: string = "console.info('webgame gameStart'); _main.game.start = _main.game.start_RUNNING; _main.ball.fired = true"
    @State gameReset: string = "console.info('webgame gameReset'); if (_main.game.start === _main.game.start_GAMEOVER) { _main.game.start = _main.game.start_START; _main.start()}"
    @State removeDesc: string = "console.info('webgame removeDesc'); y=document.getElementsBytagName('div')[0]; y.parentNode.removeChild(y)"
    @State setJavaScriptOpenWindowFlagInZoom: boolean = true;
    @State setMultiWindowFlag: boolean = true;
    @State javaScriptAccess: boolean = true;
    @State multitAccess: boolean = true;
    controller: web_webview.WebviewController = new web_webview.WebviewController()
    dialogController: CustomDialogController = null;
    popController: web_webview.WebviewController = null;
    @State allowWindow: boolean = true

    @State str:string="emitAllowWindowOpenMethod"


    build() {
        Column() {
            Row() {
                Button("web click").key('webcomponentTwo').onClick(async ()=>{
                    console.info("key==>"+this.str)
                    switch(this.str){
                        case "emitAllowWindowOpenMethod":{ 
                            this.controller.loadUrl($rawfile("indexTwo.html"));
                            setTimeout(()=>{
                                this.controller.runJavaScript('openwindowAll()')
                                    .then(function (result) {
                                    console.log('result: ' + result);
                                 })
                            },3000)                                            
                            break;
                        }
                        
                        default:
                            console.info("can not match case")
                    }
                })
            }
            Web({ src: $rawfile('indexTwo.html'), controller: this.controller })
                .javaScriptAccess(true)
                .backgroundColor(Color.Orange)
                .userAgent(pcUserAgent)
                .domStorageAccess(true)
                .fileAccess(true)
                .onlineImageAccess(true)
                .imageAccess(true)
                .overviewModeAccess(true)
                .zoomAccess(true)
                .databaseAccess(true)
                .multiWindowAccess(true)
                .allowWindowOpenMethod(true)
                .onWindowNew((event) => {
                    Utils.emitEvent("openwindow",110)
                    console.info("zfh window ts onWindowNew isAlert: " + event.isAlert + ", isUserTrigger: " + event.isUserTrigger + ", targetUrl: " + event.targetUrl);
                    if (this.dialogController != null) {
                        console.info("zfh window this.dialogController != null")
                        this.dialogController.close();
                    }
                    var targetUrlNew: string = event.targetUrl;

                    this.popController = new web_webview.WebviewController();
                    console.info("zfh window onWindowNew start")
                    this.dialogController = new CustomDialogController({
                        builder: NewWebViewComp({ url: targetUrlNew, controller: this.popController }),
                        autoCancel: false,
                        customStyle: true
                    });
                    console.info("zfh window onWindowNew start2")
                    this.dialogController.open();

                    event.handler.setWebController(this.popController);
                    console.info("zfh window onWindowNew start3")
                    
                })
                .onWindowExit(() => {
                    console.info("closewindow")
                    this.dialogController.close();
                })
        }
    }
}