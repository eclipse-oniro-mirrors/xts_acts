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
// @ts-nocheck
import { describe, beforeEach, afterEach, it, expect } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.ets';
let emitKey = "emitUserAgent";
export default function webJsunit() {
  describe('ActsAceWebDevTest', function () {
    beforeEach(async function (done) {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })
    afterEach(async function (done) {
      console.info("web afterEach start:"+emitKey);
      try {
            let backData = {
                data: {
                    "ACTION": emitKey
                }
            }
            let backEvent = {
                eventId:10,
                priority:events_emitter.EventPriority.LOW
            }
            console.info("start send emitKey");
            events_emitter.emit(backEvent, backData);
      } catch (err) {
            console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      done();
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_001
     *tc.name userAgent
     *tc.desic Sets the Web's user agent
     */
    it('userAgent',0,async function(done){
      emitKey="emitJavaScriptProxy";
      let userAgent="\"Mozila/5.0 (Linux; Andriod 9; VRD-AL10; HMSCore 6.3.0.331) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.105 HuaweiBrowser/12.0.4.1 MobileSafari/537.36\"";
      Utils.registerEvent("",userAgent,100,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_002
     *tc.name javaScriptProxy                                                                                                                                                                                                                     *tc.desic Injects the JavaScript object into window and invoke the function in window
     */
    it('javaScriptProxy',0,async function(done){
      emitKey="emitOnUrlLoadIntercept";
      Utils.registerEvent("javaScriptProxy","backToEts",102,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_003
     *tc.name onUrlLoadIntercept                                                                                                                                                                                                                  *tc.desic Triggered when the URL loading is intercepted
     */
    it('onUrlLoadIntercept',0,async function(done){
      emitKey="emitOnRenderExited";
      Utils.registerEvent("onUrlLoadIntercept","https://gitee.com/",104,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_004
     *tc.name onRenderExited
     *tc.desic Triggered when the render process exits
     */
    it('onRenderExited',0,async function(done){
      Utils.commitKey("emitOnRenderExited")
      emitKey="emitOnResourceLoad";
      Utils.registerEvent("onRenderExited",2,106,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_005
     *tc.name onResourceLoad
     *tc.desic Triggered when the url loading
     */
    it('onResourceLoad',0,async function(done){
      emitKey="emitLoadUrl";
      Utils.registerContainEvent("onResourceLoad","second.html",108,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_006
     *tc.name loadUrl
     *tc.desic Loads the given URL
     */
    it('loadUrl',0,async function(done){
      emitKey="emitRunJavaScript";
      Utils.registerContainEvent("loadUrl","index",110,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_007
     *tc.name runJavaScript
     *tc.desic Loads a piece of code and execute JS code in the context of the currently displayed page
     */
    it('runJavaScript',0,async function(done){
      emitKey="emitOnProgressChange";
      Utils.registerEvent("runJavaScript","\"testRunJavaScript\"",112,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_008
     *tc.name onProgressChange                                                                                                                                                                                                                    *tc.desic Triggered when the page loading progress changes
     */
    it('onProgressChange',0,async function(done){
      emitKey="emitOnRefreshAccessedHistory";
      Utils.registerEvent("onProgressChange","100",114,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_009
     *tc.name onRefreshAccessedHistory                                                                                                                                                                                                            *tc.desic Triggered when the Web page refreshes accessed history
     */
    it('onRefreshAccessedHistory',0,async function(done){
      emitKey="emitGetHitTest";
      Utils.registerContainEvent("onRefreshAccessedHistory","second.html",116,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_010
     *tc.name getHitTest
     *tc.desic Gets the type of HitTest
     */
    it('getHitTest',0,async function(done){
      emitKey="emitGetWebId";
      Utils.registerEvent("getHitTest","7",118,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_011
     *tc.name getWebId
     *tc.desic Gets the id for the current Web
     */
    it('getWebId',0,async function(done){
      emitKey="emitGetRequestFocus";
      Utils.registerEvent("getWebId","webId",120,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_014
     *tc.name requestFocus
     *tc.desic Gets the request focus
     */
    it('requestFocus',0,async function(done){
      emitKey="emitAccessBackward";
      Utils.registerEvent("requestFocus","requestFocus",126,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_015
     *tc.name accessBackward
     *tc.desic Checks whether the web page can go back
     */
    it('accessBackward',0,async function(done){
      emitKey="emitAccessForward";
      Utils.registerEvent("accessBackward","true",128,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_016
     *tc.name accessForward
     *tc.desic Checks whether the web page can go forward
     */
    it('accessForward',0,async function(done){
      emitKey="emitAccessStep";
      Utils.registerEvent("accessForward","false",130,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_017
     *tc.name accessStep
     *tc.desic Checks whether the web page can go back or forward the given number of steps
     */
    it('accessStep',0,async function(done){
      emitKey="emitBackward";
      Utils.registerEvent("accessStep","true",132,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_018
     *tc.name backward
     *tc.desic Goes back in the history of the web page
     */
    it('backward',0,async function(done){
      emitKey="emitForward";
      Utils.registerEvent("backward","\"index\"",134,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_019
     *tc.name forward
     *tc.desic Goes forward in the history of the web page
     */
    it('forward',0,async function(done){
      emitKey="emitGeolocationAccessFalse";
      Utils.registerEvent("forward","resource://rawfile/index.html",136,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_021
     *tc.name geolocationAccessFalse
     *tc.desic Sets false not allow access to geographical locations
     */
    it('geolocationAccessFalse',0,async function(done){
      emitKey="emitInitialScale";
      Utils.registerContainEvent("geolocationAccessFalse","位置服务被拒绝",96,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_022
     *tc.name initialScale
     *tc.desic Sets the initial scale for the Web
     */
    it('initialScale',0,async function(done){
      emitKey="emitOnscaleChange";
      Utils.registerEvent("initialScale",120,97,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_023
     *tc.name onScaleChange
     *tc.desic Triggered when the scale of WebView changed
     */
    it('onScaleChange',0,async function(done){
      emitKey="emitOnGeolocationShow";
      Utils.registerContainEvent("onScaleChange","onScaleChange",98,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_024
     *tc.name onGeolocationShow
     *tc.desic Triggered when requesting to show the geolocation permission
     */
    it('onGeolocationShow',0,async function(done){
      emitKey="emitDomStorageAccessFalse";
      Utils.registerContainEvent("onGeolocationShow","onGeolocationShow",99,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_025
     *tc.name domStorageAccessFalse
     *tc.desic Sets not to enable the DOM Storage API permission
     */
    it('domStorageAccessFalse',0,async function(done){
      emitKey="emitDomStorageAccessTrue";
      Utils.registerContainEvent("domStorageAccessFalse","sorry",144,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_026
     *tc.name domStorageAccessTrue
     *tc.desic Sets  enable the DOM Storage API permission
     */
    it('domStorageAccessTrue',0,async function(done){
      emitKey="emitImageAccessFalse";
      Utils.registerContainEvent("domStorageAccessTrue","domapi",146,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_027
     *tc.name imageAccessFalse
     *tc.desic Sets Web can not automatically load image resources
     */
    it('imageAccessFalse',0,async function(done){
      emitKey="emitImageAccessTrue";
      Utils.registerEvent("imageAccessFalse","null",148,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_028
     *tc.name imageAccessTrue
     *tc.desic Sets Web can  automatically load image resources
     */
    it('imageAccessTrue',0,async function(done){
      emitKey="emitOnlineImageAccessFalse";
      Utils.registerContainEvent("imageAccessTrue","load complete",150,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_029
     *tc.name onlineImageAccessFalse
     *tc.desic Sets not to allow image resources to be loaded from the network
     */
    it('onlineImageAccessFalse',0,async function(done){
      emitKey="emitOnlineImageAccessTrue";
      Utils.registerEvent("onlineImageAccessFalse","null",156,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_030
     *tc.name onlineImageAccessTrue
     *tc.desic Sets  allow image resources to be loaded from the network
     */
    it('onlineImageAccessTrue',0,async function(done){
      emitKey="emitDatabaseAccessTrue";
      Utils.registerContainEvent("onlineImageAccessTrue","load image complete",158,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_031
     *tc.name databaseAccessTrue
     *tc.desic Sets allow the Web access the database
     */
    it('databaseAccessTrue',0,async function(done){
      emitKey="emitOnPrompt";
      Utils.registerContainEvent("databaseAccessTrue","openDatabase",164,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_032
     *tc.name onPrompt
     *tc.desic Triggered when the web page wants to display a JavaScript prompt() dialog
     */
    it('onPrompt',0,async function(done){
      emitKey="emitCacheModeOnly";
      Utils.registerEvent("onPrompt","age",178,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_033
     *tc.name cacheModeOnly
     *tc.desic load cache and not online
     */
    it('cacheModeOnly',0,async function(done){
      emitKey="emitCacheModeDefault";
      Utils.registerEvent("cacheModeOnly","cacheError",182,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_034
     *tc.name cacheModeDefault
     *tc.desic load cache when they are available and not expired, otherwise load online
     */
    it('cacheModeDefault',0,async function(done){
      emitKey="emitMixedModeNone";
      Utils.registerContainEvent("cacheModeDefault","index",184,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_035
     *tc.name mixedModeNone
     *tc.desic Sets Don't allow unsecure sources from a secure origin
     */
    it('mixedModeNone',0,async function(done){
      emitKey="emitMixedModeAll";
      Utils.registerContainEvent("mixedModeNone","insecure",186,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_036
     *tc.name mixedModeAll
     *tc.desic Sets Allows  all HTTP and HTTPS content can be loaded
     */
    it('mixedModeAll',0,async function(done){
      emitKey="emitFileAccessTrue";
      Utils.registerEvent("mixedModeAll",3,188,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_037
     *tc.name fileAccessTrue
     *tc.desic Sets  enable local file system access in Web
     */
    it('fileAccessTrue',0,async function(done){
      emitKey="emitOnPageBegin";
      Utils.registerContainEvent("fileAccessTrue","index",190,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_038
     *tc.name onPageBegin
     *tc.desic Triggered when the page loading progress changes
     */
    it('onPageBegin',0,async function(done){
      emitKey="emitOnPageEnd";
      Utils.registerContainEvent("onPageBegin","index.html",59,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_039
     *tc.name onPageEnd
     *tc.desic Triggered at the begin of web page loading
     */
    it('onPageEnd',0,async function(done){
      emitKey="emitOnConsole";
      Utils.registerContainEvent("onPageEnd","index.html",60,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_040
     *tc.name onConsole
     *tc.desic Triggered when the web page receives a JavaScript console message
     */
    it('onConsole',0,async function(done){
      emitKey="emitOnAlert";
      Utils.registerEvent("onConsole","console test",62,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_041
     *tc.name onAlert
     *tc.desic Triggered when the Web wants to display a JavaScript alert() dialog
     */
    it('onAlert',0,async function(done){
      emitKey="emitOnConfirm";
      Utils.registerEvent("onAlert","alert test",63,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_042
     *tc.name onConfirm
     *tc.desic Triggered when the web page wants to display a JavaScript confirm() dialog
     */
    it('onConfirm',0,async function(done){
      emitKey="emitOnErrorReceive";
      Utils.registerEvent("onConfirm","confirm test",64,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_043
     *tc.name onErrorReceive
     *tc.desic Triggered when the web page receives a web resource loading error
     */
    it('onErrorReceive',0,async function(done){
      emitKey="emitOnHttpErrorReceive";
      Utils.registerEvent("onErrorReceive","http://bianixnbo.com/",65,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_044
     *tc.name onHttpErrorReceive
     *tc.desic Triggered when the web page receives a web resource loading HTTP error
     */
    it('onHttpErrorReceive',0,async function(done){
      emitKey="emitOnTitleReceive";
      Utils.registerEvent("onHttpErrorReceive",true,66,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_045
     *tc.name onTitleReceive
     *tc.desic Triggered when the title of the main application document changes
     */
    it('onTitleReceive',0,async function(done){
      emitKey="emitOnDownloadStart";
      Utils.registerEvent("onTitleReceive","index",67,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_046
     *tc.name onDownloadStart
     *tc.desic Triggered when starting to download
     */
    it('onDownloadStart',0,async function(done){
      emitKey="emitZoom";
      Utils.registerEvent("onDownloadStart","https://consumer.huawei.com/content/dam/huawei-cbg-site/cn/mkt/mobileservices/2022/download/PC107f1b3947c942ffaa14334a879065d8.2107261020.exe",68,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_049
     *tc.name zoom
     *tc.desic Let the Web zoom by
     */
    it('zoom',0,async function(done){
      emitKey="emitClearHistory";
      Utils.registerEvent("zoom",true,77,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_054
     *tc.name clearHistory
     *tc.desic Clears the history in the Web
     */
    it('clearHistory',0,async function(done){
      emitKey="emitStop";
      Utils.registerEvent("clearHistory",false,82,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_055
     *tc.name stop
     *tc.desic  Stops the current load
     */
    it('stop',0,async function(done){
      emitKey="emitOnInactive";
      Utils.registerEvent("stop",true,83,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_056
     *tc.name onInactive
     *tc.desic Let the Web inactive.
     */
    it('onInactive',0,async function(done){
      emitKey="emitOnActive";
      Utils.registerEvent("onInactive",true,84,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_057
     *tc.name onActive
     *tc.desic Let the Web active
     */
    it('onActive',0,async function(done){
      emitKey="emitRegisterJavaScriptProxy";
      Utils.registerContainEvent("onActive","index.html",85,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_058
     *tc.name registerJavaScriptProxy
     *tc.desic Registers the JavaScript object and method list
     */
    it('registerJavaScriptProxy',0,async function(done){
      emitKey="emitDeleteJavaScriptRegister";
      Utils.registerEvent("registerJavaScriptProxy","backToEts",86,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_059
     *tc.name deleteJavaScriptRegister
     *tc.desic Deletes a registered JavaScript object with given name
     */
    it('deleteJavaScriptRegister',0,async function(done){
      emitKey="emitJavaScriptAccess";
      Utils.registerEvent("deleteJavaScriptRegister",true,87,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_060
     *tc.name javaScriptAccess
     *tc.desic Sets whether the Web allows JavaScript scripts to execute
     */
    it('javaScriptAccess',0,async function(done){
      emitKey="emitWebVisibility";
      Utils.registerEvent("javaScriptAccess",true,88,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_062
     *tc.name webVisibility
     *tc.desic Web Visibility test
     */
    it('webVisibility',0,async function(done){
      emitKey="emitWebVisibility";
      Utils.registerEvent("webVisibility", 0, 90, done);
      sendEventByKey('webcomponent',10,'');
    })
  })
}
