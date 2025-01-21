/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
@Entry
@Component
struct getOrigins {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str:string= "emitGetOriginsCallbackLoadWebkit01";
  @State userAgent:string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State testMultiWindowAccess:boolean = true;
  @State testAllowWindowOpenMethod:boolean = true;
  @State javaScriptAccess:boolean= true;
  @State fileAccess:boolean= true;
  @State domStorageAccess:boolean= true
  @State imageAccess:boolean= true
  @State onlineImageAccess:boolean= true
  @State databaseAccess:boolean= true
  @State origin:string= 'resource://rawfile/'
  onPageShow(){
    let valueChangeEvent={
      eventId:10,
      priority:events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent,this.valueChangeCallBack)
  }
  private valueChangeCallBack=(eventData)=>{
    console.info("web page valueChangeCallBack");
    if(eventData != null){
      console.info("valueChangeCallBack:"+   JSON.stringify(eventData));
      if(eventData.data.ACTION != null){
        this.str = eventData.data.ACTION;
      }
    }
  }
  build(){
    Column(){
      Row() {
        Button("web click").key('webStorage').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitGetOriginsCallbackLoadWebkit01": {
              let origin = '';
              try {
                web_webview.WebStorage.getOrigins((error, origins) => {
                  console.log(`getOrigins callback call`);
                  if (origins) {
                    origin = origins[0].origin;
                    console.log(`origin is: ${origins[0].origin}`);
                  }
                  Utils.emitEvent(origin, 7136);
                  console.log(`getOrigins callback call end`);
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(origin, 7136);
              }
              break;
            }
            case "emitGetOriginsCallbackLoadWebkit02": {
              let usage = -1;
              try {
                web_webview.WebStorage.getOrigins((error, origins) => {
                  console.log(`getOrigins callback call`);
                  if (origins) {
                    usage = origins[0].usage;
                    console.log(`usage is: ${origins[0].usage}`);
                  }
                  console.log(`getOrigins callback call end`);
                  Utils.emitEvent(usage, 7138);
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(usage, 7138);
              }
              break;
            }
            case "emitGetOriginsCallbackLoadWebkit03": {
              let quota = -1;
              try {
                web_webview.WebStorage.getOrigins((error, origins) => {
                  console.log(`getOrigins callback call`);
                  if (origins) {
                    quota = origins[0].quota;
                    console.log(`quota is: ${origins[0].quota}`);
                  }
                  console.log(`getOrigins callback call end`);
                  Utils.emitEventTwo(0, quota.toString(), 7140);
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEventTwo(0, quota.toString(), 7140);
              }
              break;
            }
            case "emitGetOriginsPromiseLoadWebkit01": {
              let origin = '';
              try {
                web_webview.WebStorage.getOrigins()
                  .then(origins => {
                    console.log(`getOrigins call`);
                    if (origins) {
                      origin = origins[0].origin;
                      console.log(`origin is: ${origins[0].origin}`);
                    }
                    Utils.emitEvent(origin, 7142);
                    console.log(`getOrigins call end`);
                  })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(origin, 7142);
              }
              break;
            }
            case "emitGetOriginsPromiseLoadWebkit02": {
              let usage = -1;
              try {
                web_webview.WebStorage.getOrigins()
                  .then(origins => {
                    console.log(`getOrigins call`);
                    if (origins) {
                      usage = origins[0].usage;
                      console.log(`usage is: ${origins[0].usage}`);
                    }
                    console.log(`getOrigins call end`);
                    Utils.emitEvent(usage, 7144);
                  })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(usage, 7144);
              }
              break;
            }
            case "emitGetOriginsPromiseLoadWebkit03": {
              let quota = -1;
              try {
                web_webview.WebStorage.getOrigins()
                  .then(origins => {
                    console.log(`getOrigins call`);
                    if (origins) {
                      quota = origins[0].quota;
                      console.log(`quota is: ${origins[0].quota}`);
                    }
                    console.log(`getOrigins  call end`);
                    Utils.emitEventTwo(0, quota.toString(), 7146);
                  })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEventTwo(0, quota.toString(), 7146);
              }
              break;
            }
            case "emitGetOriginsCallbackLoadBaidu01": {
              let length = -1;
              try {
                this.controller.loadUrl('www.baidu.com');
                web_webview.WebStorage.getOrigins((error, origins) => {
                  console.log(`getOrigins callback call`);
                  if (origins) {
                    length = origins.length;
                    console.log(`length is: ${length}`);
                  }
                  console.log(`getOrigins callback call end`);
                  Utils.emitEvent(length, 7148);
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(length, 7148);
              }
              break;
            }
            case "emitGetOriginsCallbackLoadBaidu02": {
              let usage = -1;
              try {
                this.controller.loadUrl('www.baidu.com');
                web_webview.WebStorage.getOrigins((error, origins) => {
                  console.log(`getOrigins callback call`);
                  if (origins) {
                    usage = origins[0].usage;
                    console.log(`usage is: ${usage}`);
                  }
                  console.log(`getOrigins callback call end`);
                  Utils.emitEvent(usage, 7150);
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(usage, 7150);
              }
              break;
            }
            case "emitGetOriginsCallbackLoadBaidu03": {
              let quota = -1;
              try {
                this.controller.loadUrl('www.baidu.com');
                web_webview.WebStorage.getOrigins((error, origins) => {
                  console.log(`getOrigins callback call`);
                  if (origins) {
                    quota = origins[0].quota;
                    console.log(`quota is: ${origins[0].quota}`);
                  }
                  console.log(`getOrigins callback call end`);
                  Utils.emitEventTwo(0, quota.toString(), 7152);
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                 Utils.emitEventTwo(0, quota.toString(), 7152);
              }
              break;
            }
            case "emitGetOriginsPromiseLoadBaidu01": {
              let length = -1;
              try {
                this.controller.loadUrl('www.baidu.com');
                web_webview.WebStorage.getOrigins()
                  .then(origins => {
                    console.log(`getOrigins callback call`);
                    if (origins) {
                      length = origins.length;
                      console.log(`length is: ${length}`);
                    }
                    console.log(`getOrigins callback call end`);
                    Utils.emitEvent(length, 7154);
                  })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(length, 7154);
              }
              break;
            }
            case "emitGetOriginsPromiseLoadBaidu02": {
              let usage = -1;
              try {
                this.controller.loadUrl('www.baidu.com');
                web_webview.WebStorage.getOrigins()
                  .then(origins => {
                    console.log(`getOrigins callback call`);
                    if (origins) {
                      usage = origins[0].usage;
                      console.log(`usage is: ${usage}`);
                    }
                    console.log(`getOrigins callback call end`);
                    Utils.emitEvent(usage, 7156);
                  })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(usage, 7156);
              }
              break;
            }
            case "emitGetOriginsPromiseLoadBaidu03": {
              let quota = -1;
              try {
                this.controller.loadUrl('www.baidu.com');
                web_webview.WebStorage.getOrigins()
                  .then(origins => {
                    console.log(`getOrigins callback call`);
                    if (origins) {
                      quota = origins[0].quota;
                      console.log(`quota is: ${origins[0].quota}`);
                    }
                    console.log(`getOrigins callback call end`);
                    Utils.emitEventTwo(0, quota.toString(), 7158);
                  })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEventTwo(0, quota.toString(), 7158);
              }
              break;
            }
            case "emitGetOriginsCallbackLoadLocalHtml01": {
              let length = -1;
              try {
                this.controller.loadUrl($rawfile('getOrigins.html'));
                web_webview.WebStorage.getOrigins((error, origins) => {
                  console.log(`getOrigins callback call`);
                  if (origins) {
                    length = origins.length;
                    console.log(`length is: ${length}`);
                  }
                  console.log(`getOrigins callback call end`);
                  Utils.emitEvent(length, 7160);
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(length, 7160);
              }
              break;
            }
            case "emitGetOriginsCallbackLoadLocalHtml02": {
              let usage = -1;
              try {
                this.controller.loadUrl($rawfile('getOrigins.html'));
                web_webview.WebStorage.getOrigins((error, origins) => {
                  console.log(`getOrigins callback call`);
                  if (origins) {
                    usage = origins[0].usage;
                    console.log(`usage is: ${origins[0].usage}`);
                  }
                  console.log(`getOrigins callback call end`);
                  Utils.emitEvent(usage, 7162);
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(usage, 7162);
              }
              break;
            }
            case "emitGetOriginsCallbackLoadLocalHtml03": {
              let quota = -1
              try {
                this.controller.loadUrl($rawfile('getOrigins.html'));
                web_webview.WebStorage.getOrigins((error, origins) => {
                  console.log(`getOrigins callback call`);
                  if (origins) {
                    quota = origins[0].quota;
                    console.log(`quota is: ${origins[0].quota}`);
                  }
                  console.log(`getOrigins callback call end`);
                  Utils.emitEventTwo(0, quota.toString(), 7164);
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEventTwo(0, quota.toString(), 7164);
              }
              break;
            }
            case "emitGetOriginsPromiseLoadLocalHtml02": {
              let usage = -1;
              try {
                this.controller.loadUrl($rawfile('getOrigins.html'));
                web_webview.WebStorage.getOrigins()
                  .then(origins => {
                    console.log(`getOrigins call`);
                    if (origins) {
                      usage = origins[0].usage;
                      console.log(`usage is: ${origins[0].usage}`);
                    }
                    console.log(`getOrigins call end`);
                    Utils.emitEvent(usage, 7168);
                  })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(usage, 7168);
              }
              break;
            }
            case "emitGetOriginsPromiseLoadLocalHtml03": {
              let quota = -1
              try {
                this.controller.loadUrl($rawfile('getOrigins.html'));
                web_webview.WebStorage.getOrigins()
                  .then(origins => {
                    console.log(`getOrigins call`);
                    if (origins) {
                      quota = origins[0].quota;
                      console.log(`quota is: ${origins[0].quota}`);
                      Utils.emitEventTwo(0, quota.toString(), 7170);
                    }
                    console.log(`getOrigins call end`);
                  }).catch(error => {
                    console.log('getOrigins error: ' + JSON.stringify(error));
                    Utils.emitEventTwo(0, quota.toString(), 7170);
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEventTwo(0, quota.toString(), 7170);
              }
              break;
            }
            case "emitDeleteOrigin": {
              let getUsage = -1
              try {
                web_webview.WebStorage.deleteOrigin(this.origin);
                setTimeout(()=> {
                  web_webview.WebStorage.getOriginUsage(this.origin)
                    .then(usage => {
                      console.log('usage is: ' + usage);
                      getUsage = usage;
                      Utils.emitEvent(getUsage, 7172);
                    })
                    .catch(error => {
                      console.log('getOriginUsage error: ' + JSON.stringify(error));
                      Utils.emitEvent(getUsage, 7172);
                    })
                },3000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(getUsage, 7172);
              }
              break;
            }
            case "emitDeleteAllData": {
              let getUsage = -1
              try {
                web_webview.WebStorage.deleteAllData();
                this.controller.loadUrl($rawfile('getOrigins.html'));
                web_webview.WebStorage.getOriginUsage(this.origin)
                  .then(usage => {
                    console.log('usage is: ' + usage);
                    getUsage = usage;
                    Utils.emitEvent(getUsage, 7174);
                  })
                  .catch(error => {
                    console.log('getOriginUsage error: ' + JSON.stringify(error));
                    Utils.emitEvent(getUsage, 7174);
                  })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(getUsage, 7174);
              }
              break;
            }
            case "emitGetOriginQuotaCallback": {
              let getQuota = -1
              try {
                this.controller.loadUrl($rawfile('getOrigins.html'));
                web_webview.WebStorage.getOriginQuota(this.origin, (error, quota) => {
                  if (quota) {
                    console.log('quota is: ' + quota);
                    getQuota = quota;
                  }
                  Utils.emitEventTwo(0, getQuota.toString(), 7176);
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEventTwo(0, getQuota.toString(), 7176);
              }
              break;
            }
            case "emitGetOriginQuotaPromise": {
              let getQuota = -1
              try {
                this.controller.loadUrl($rawfile('getOrigins.html'));
                web_webview.WebStorage.getOriginQuota(this.origin)
                  .then(quota => {
                    console.log('quota is: ' + quota);
                    getQuota = quota;
                    Utils.emitEventTwo(0, getQuota.toString(), 7178);
                  })
                  .catch(error => {
                    console.log('getOriginQuota error: ' + JSON.stringify(error));
                    Utils.emitEventTwo(0, getQuota.toString(), 7178);
                  })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEventTwo(0, getQuota.toString(), 7178);
              }
              break;
            }
            case "emitGetOriginUsageCallback": {
              let getUsage = -1
              try {
                this.controller.loadUrl($rawfile('getOrigins.html'));
                web_webview.WebStorage.getOriginUsage(this.origin, (error, usage) => {
                  if (usage) {
                    console.log('usage is: ' + usage);
                    getUsage = usage;
                  }
                  Utils.emitEvent(getUsage, 7180);
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(getUsage, 7180);
              }
              break;
            }
            case "emitGetOriginUsagePromise": {
              let getUsage = -1
              try {
                this.controller.loadUrl($rawfile('getOrigins.html'));
                web_webview.WebStorage.getOriginUsage(this.origin)
                  .then(usage => {
                    console.log('usage is: ' + usage);
                    getUsage = usage;
                    Utils.emitEvent(getUsage, 7182);
                  })
                  .catch(error => {
                    console.log('getOriginUsage error: ' + JSON.stringify(error));
                    Utils.emitEvent(getUsage, 7182);
                  })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(getUsage, 7182);
              }
              break;
            }
            case "emitGetOriginsDomStorageAccessFalse": {
              let quota = -1;
              try {
                this.domStorageAccess = false;
                web_webview.WebStorage.getOrigins((error, origins) => {
                  console.log(`getOrigins callback call`);
                  if (origins) {
                    quota = origins[0].quota;
                    console.log(`quota is: ${origins[0].quota}`);
                  }
                  console.log(`getOrigins callback call end`);
                  Utils.emitEventTwo(0, quota.toString(), 7184);
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEventTwo(0, quota.toString(), 7184);
              }
              break;
            }
          }
        })
      }
      Web({ src: 'https://webkit.org/demos/sticky-notes/index.html', controller: this.controller })
        .multiWindowAccess(this.testMultiWindowAccess)
        .allowWindowOpenMethod(this.testAllowWindowOpenMethod)
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
    }
  }
}