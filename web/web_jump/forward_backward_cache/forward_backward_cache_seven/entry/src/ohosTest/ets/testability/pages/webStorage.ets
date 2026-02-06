/**
 * Copyright (c) 2023-2025 iSoftStone Information Technology (Group) Co.,Ltd.
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
import { BusinessError } from '@ohos.base';
import { waitForExist } from '../../test/WaitTest.test';
import { Constants } from '../../test/Constants.test';


@Entry
@Component
struct getOrigins {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = 'emitGetOriginsCallbackLoadWebkit01';
  @State userAgent: string =
    'Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27';
  @State testMultiWindowAccess: boolean = true;
  @State testAllowWindowOpenMethod: boolean = true;
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true
  @State imageAccess: boolean = true
  @State onlineImageAccess: boolean = true
  @State databaseAccess: boolean = true
  @State origin: string = 'resource://rawfile/'
  @State isComplete: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 137850,
      priority: events_emitter.EventPriority.LOW,
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(137850)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Button('web click').key('webStorage').onClick(async () => {
        await waitForExist(() => this.isComplete, this.str, 0);
        await waitForExist(() => this.isReceive, this.str, 0);
        this.isReceive = -1;

        console.info('key==>' + this.str)
        switch (this.str) {
          case 'emitGetOriginsCallbackLoadWebkit01': {

            let origin = '';
            try {
              web_webview.WebStorage.getOrigins((error, origins) => {
                console.log(`PBBgetOrigins callback call999999999999` + origins);
                if (origins) {
                  origin = origins[0].origin;
                  console.log(`PBBorigin is: ${origins[0].origin}`);
                  for (let i = 0; i < origins.length; i++) {
                    console.log('origin: ' + origins[i].origin);
                    console.log('usage: ' + origins[i].usage);
                    console.log('quota: ' + origins[i].quota);
                  }
                }
                console.log(`PBBgetOrigins callback call end` + origin);
                Utils.emitEvent(origin, 137860);
              })
            } catch (error) {
              console.error(`PBBErrorCode: ${error.code},  Message: ${error.message}`);
              Utils.emitEvent(origin, 137860);
            }
            break;
          }
          case 'emitGetOriginsCallbackLoadWebkit02': {
            let usage = -1;
            try {
              web_webview.WebStorage.getOrigins((error, origins) => {
                console.log(`PBBgetOrigins callback call6666666666` + usage);
                if (origins) {
                  usage = origins[0].usage;
                  console.log(`PBBusage is: ${origins[0].usage}`);
                }
                console.log(`PBBgetOrigins callback call end` + usage);
                if (usage > 0) {
                  Utils.emitEvent(true, 137870);
                } else {
                  Utils.emitEvent(false, 137870);
                }

              })
            } catch (error) {
              console.error(`PBBErrorCode: ${error.code},  Message: ${error.message}`);
              Utils.emitEvent(usage, 137870);
            }
            break;
          }
          case 'emitGetOriginsCallbackLoadWebkit03': {
            let quota = -1;
            try {
              web_webview.WebStorage.getOrigins((error, origins) => {
                console.log(`PBBgetOrigins callback call`);
                if (origins) {
                  quota = origins[0].quota;
                  console.log(`PBBquota is: ${origins[0].quota}`);
                }
                console.log(`PBBgetOrigins callback call end`);
                Utils.emitEvent(quota > 0, 137880);
              })
            } catch (error) {
              console.error(`PBBErrorCode: ${error.code},  Message: ${error.message}`);
              Utils.emitEvent(quota > 0, 137880);
            }
            break;
          }
          case 'emitGetOriginsPromiseLoadWebkit01': {
            let origin = '';
            try {
              web_webview.WebStorage.getOrigins()
                .then(origins => {
                  console.log(`PBBgetOrigins call`);
                  if (origins) {
                    origin = origins[0].origin;
                    console.log(`PBBorigin is: ${origins[0].origin}`);
                  }
                  Utils.emitEvent(origin, 137890);
                  console.log(`PBBgetOrigins call end`);
                })
            } catch (error) {
              console.error(`PBBErrorCode: ${error.code},  Message: ${error.message}`);
              Utils.emitEvent(origin, 137890);
            }
            break;
          }
          case 'emitGetOriginsPromiseLoadWebkit02': {
            let usage = -1;
            try {
              web_webview.WebStorage.getOrigins()
                .then(origins => {
                  console.log(`PBBgetOrigins call`);
                  if (origins) {
                    usage = origins[0].usage;
                    console.log(`PBBusage is: ${origins[0].usage}`);
                  }
                  console.log(`PBBgetOrigins call end`);
                  if (usage > 0) {
                    Utils.emitEvent(true, 137900);
                  } else {
                    Utils.emitEvent(false, 137900);
                  }

                })
            } catch (error) {
              console.error(`PBBErrorCode: ${error.code},  Message: ${error.message}`);
              Utils.emitEvent(usage, 137900);
            }
            break;
          }
          case 'emitGetOriginsPromiseLoadWebkit03': {
            let quota = -1;
            try {
              web_webview.WebStorage.getOrigins()
                .then(origins => {
                  console.log(`PBBgetOrigins call`);
                  if (origins) {
                    quota = origins[0].quota;
                    console.log(`PBBquota is: ${origins[0].quota}`);
                  }
                  console.log(`PBBgetOrigins  call end`);
                  Utils.emitEvent(quota > 0, 137910);
                })
            } catch (error) {
              console.error(`PBBErrorCode: ${error.code},  Message: ${error.message}`);
              Utils.emitEvent(quota > 0, 137910);
            }
            break;
          }
          case 'emitGetOriginsCallbackLoadOnlineWebsite01': {
            let length = -1;
            try {
              this.isComplete = -1;
              this.controller.loadUrl(Constants.EXAMPLE_URL);
              await waitForExist(() => this.isComplete, this.str, 0);
              web_webview.WebStorage.getOrigins((error, origins) => {
                console.log(`PBBgetOrigins callback call`);
                if (origins) {
                  length = origins.length;
                  console.log(`PBBlength is: ${length}`);
                }
                console.log(`PBBgetOrigins callback call end`);
                Utils.emitEvent(length, 137920);
              })
            } catch (error) {
              console.error(`PBBErrorCode: ${error.code},  Message: ${error.message}`);
              Utils.emitEvent(length, 137920);
            }
            break;
          }
          case 'emitGetOriginsCallbackLoadOnlineWebsite02': {
            let usage = -1;
            try {
              this.isComplete = -1;
              this.controller.loadUrl(Constants.EXAMPLE_URL);
              await waitForExist(() => this.isComplete, this.str, 0);
              web_webview.WebStorage.getOrigins((error, origins) => {
                console.log(`PBBgetOrigins callback call`);
                if (origins) {
                  usage = origins[0].usage;
                  console.log(`PBBusage is: ${usage}`);
                  console.log(`PBBorigin is: ${origins[0].origin}`);
                }
                console.log(`PBBgetOrigins callback call end`);

                if (usage > 0) {
                  Utils.emitEvent(true, 137930);
                } else {
                  Utils.emitEvent(false, 137930);
                }

              })
            } catch (error) {
              console.error(`PBBErrorCode: ${error.code},  Message: ${error.message}`);
              Utils.emitEvent(false, 137930);
            }
            break;
          }
          case 'emitGetOriginsCallbackLoadOnlineWebsite03': {
            let quota = -1;
            try {
              this.isComplete = -1;
              this.controller.loadUrl(Constants.EXAMPLE_URL);
              await waitForExist(() => this.isComplete, this.str, 0);
              web_webview.WebStorage.getOrigins((error, origins) => {
                console.log(`PBBgetOrigins callback call`);
                if (origins) {
                  quota = origins[0].quota;
                  console.log(`PBBquota is: ${origins[0].quota}`);
                }
                console.log(`PBBgetOrigins callback call end`);
                Utils.emitEvent(quota > 0, 137940);
              })
            } catch (error) {
              console.error(`PBBErrorCode: ${error.code},  Message: ${error.message}`);
              Utils.emitEvent(quota > 0, 137940);
            }
            break;
          }
          case 'emitGetOriginsPromiseLoadOnlineWebsite01': {
            let length = -1;
            try {
              this.isComplete = -1;
              this.controller.loadUrl(Constants.EXAMPLE_URL);
              await waitForExist(() => this.isComplete, this.str, 0);
              web_webview.WebStorage.getOrigins()
                .then(origins => {
                  console.log(`PBBgetOrigins callback call`);
                  if (origins) {
                    length = origins.length;
                    console.log(`PBBlength is: ${length}`);
                  }
                  console.log(`PBBgetOrigins callback call end`);
                  Utils.emitEvent(length, 137950);
                })
            } catch (error) {
              console.error(`PBBErrorCode: ${error.code},  Message: ${error.message}`);
              Utils.emitEvent(length, 137950);
            }
            break;
          }
          case 'emitGetOriginsPromiseLoadOnlineWebsite02': {
            let usage = -1;
            try {
              this.isComplete = -1;
              this.controller.loadUrl(Constants.EXAMPLE_URL);
              await waitForExist(() => this.isComplete, this.str, 0);
              web_webview.WebStorage.getOrigins()
                .then(origins => {
                  console.log(`PBBgetOrigins callback call`);
                  if (origins) {
                    usage = origins[0].usage;
                    console.log(`PBBusage is: ${usage}`);
                  }
                  console.log(`PBBgetOrigins callback call end`);
                  if (usage > 0) {
                    Utils.emitEvent(true, 137960);
                  } else {
                    Utils.emitEvent(false, 137960);
                  }

                })
            } catch (error) {
              console.error(`PBBErrorCode: ${error.code},  Message: ${error.message}`);
              Utils.emitEvent(false, 137960);
            }
            break;
          }
          case 'emitGetOriginsPromiseLoadOnlineWebsite03': {
            let quota = -1;
            try {
              this.isComplete = -1;
              this.controller.loadUrl(Constants.EXAMPLE_URL);
              await waitForExist(() => this.isComplete, this.str, 0);
              web_webview.WebStorage.getOrigins()
                .then(origins => {
                  console.log(`PBBgetOrigins callback call`);
                  if (origins) {
                    quota = origins[0].quota;
                    console.log(`PBBquota is: ${origins[0].quota}`);
                  }
                  console.log(`PBBgetOrigins callback call end`);
                  Utils.emitEvent(quota > 0, 137970);
                })
            } catch (error) {
              console.error(`PBBErrorCode: ${error.code},  Message: ${error.message}`);
              Utils.emitEvent(quota > 0, 137970);
            }
            break;
          }
          case 'emitGetOriginsCallbackLoadLocalHtml01': {
            let length = -1;
            try {
              this.isComplete = -1;
              this.controller.loadUrl($rawfile('getOrigins.html'));
              await waitForExist(() => this.isComplete, this.str, 0);
              web_webview.WebStorage.getOrigins((error, origins) => {
                console.log(`PBBgetOrigins callback call`);
                if (origins) {
                  length = origins.length;
                  console.log(`PBBlength is: ${length}`);
                }
                console.log(`PBBgetOrigins callback call end`);
                Utils.emitEvent(length, 137980);
              })
            } catch (error) {
              console.error(`PBBErrorCode: ${error.code},  Message: ${error.message}`);
              Utils.emitEvent(length, 137980);
            }
            break;
          }
          case 'emitGetOriginsCallbackLoadLocalHtml02': {
            let usage = -1;
            try {
              this.isComplete = -1;
              this.controller.loadUrl($rawfile('getOrigins.html'));
              await waitForExist(() => this.isComplete, this.str, 0);
              web_webview.WebStorage.getOrigins((error, origins) => {
                console.log(`PBBgetOrigins callback call`);
                if (origins) {
                  usage = origins[0].usage;
                  console.log(`PBBusage is: ${origins[0].usage}`);
                }
                console.log(`PBBgetOrigins callback call end`);
                if (usage > 0) {
                  Utils.emitEvent(true, 137990);
                } else {
                  Utils.emitEvent(false, 137990);
                }
              })
            } catch (error) {
              console.error(`PBBErrorCode: ${error.code},  Message: ${error.message}`);
              Utils.emitEvent(false, 137990);
            }
            break;
          }
          case 'emitGetOriginsCallbackLoadLocalHtml03': {
            let quota = -1
            try {
              this.isComplete = -1;
              this.controller.loadUrl($rawfile('getOrigins.html'));
              await waitForExist(() => this.isComplete, this.str, 0);
              web_webview.WebStorage.getOrigins((error, origins) => {
                console.log(`PBBgetOrigins callback call`);
                if (origins) {
                  quota = origins[0].quota;
                  console.log(`PBBquota is: ${origins[0].quota}`);
                }
                console.log(`PBBgetOrigins callback call end`);
                Utils.emitEvent(quota > 0, 138000);
              })
            } catch (error) {
              console.error(`PBBErrorCode: ${error.code},  Message: ${error.message}`);
              Utils.emitEvent(quota > 0, 138000);
            }
            break;
          }
          case 'emitGetOriginsPromiseLoadLocalHtml02': {
            let usage = -1;
            try {
              this.isComplete = -1;
              this.controller.loadUrl($rawfile('getOrigins.html'));
              await waitForExist(() => this.isComplete, this.str, 0);
              web_webview.WebStorage.getOrigins()
                .then(origins => {
                  console.log(`PBBgetOrigins call`);
                  if (origins) {
                    usage = origins[0].usage;
                    console.log(`PBBusage is: ${origins[0].usage}`);
                  }
                  console.log(`PBBgetOrigins call end`);
                  if (usage > 0) {
                    Utils.emitEvent(true, 138010);
                  } else {
                    Utils.emitEvent(false, 138010);
                  }
                })
            } catch (error) {
              console.error(`PBBErrorCode: ${error.code},  Message: ${error.message}`);
              Utils.emitEvent(false, 138010);
            }
            break;
          }
          case 'emitGetOriginsPromiseLoadLocalHtml03': {
            let quota = -1
            try {
              this.isComplete = -1;
              this.controller.loadUrl($rawfile('getOrigins.html'));
              await waitForExist(() => this.isComplete, this.str, 0);
              web_webview.WebStorage.getOrigins()
                .then(origins => {
                  console.log(`PBBgetOrigins call`);
                  if (origins) {
                    quota = origins[0].quota;
                    console.log(`PBBquota is: ${origins[0].quota}`);
                    Utils.emitEvent(quota > 0, 138020);
                  }
                  console.log(`PBBgetOrigins call end`);
                }).catch((error: BusinessError) => {
                console.log('getOrigins error: ' + JSON.stringify(error));
                Utils.emitEvent(quota > 0, 138020);
              })
            } catch (error) {
              console.error(`PBBErrorCode: ${error.code},  Message: ${error.message}`);
              Utils.emitEvent(quota > 0, 138020);
            }
            break;
          }
          case 'emitDeleteOrigin': {
            let getUsage = -1
            try {
              web_webview.WebStorage.deleteOrigin(this.origin);
              web_webview.WebStorage.getOriginUsage(this.origin)
                .then(usage => {
                  console.log('usage is: ' + usage);
                  getUsage = usage;
                })
              await waitForExist(() => getUsage, this.str, 0, 100);
              web_webview.WebStorage.getOriginUsage(this.origin)
                .then(usage => {
                  console.log('usage is: ' + usage);
                  getUsage = usage;
                  Utils.emitEvent(getUsage, 138030);
                })
                .catch((error: BusinessError) => {
                  console.log('getOriginUsage error: ' + JSON.stringify(error));
                  Utils.emitEvent(getUsage, 138030);
                })
            } catch (error) {
              console.error(`PBBErrorCode: ${error.code},  Message: ${error.message}`);
              Utils.emitEvent(getUsage, 138030);
            }
            break;
          }
          case 'emitDeleteAllData': {
            let getUsage = -1
            try {
              web_webview.WebStorage.deleteAllData();
              web_webview.WebStorage.getOriginUsage(this.origin)
                .then(usage => {
                  console.log('usage is: ' + usage);
                  getUsage = usage;
                })
              await waitForExist(() => getUsage, this.str, 0, 100);
              web_webview.WebStorage.getOriginUsage(this.origin)
                .then(usage => {
                  console.log('usage is: ' + usage);
                  getUsage = usage;
                  Utils.emitEvent(getUsage, 138040);
                })
                .catch((error: BusinessError) => {
                  console.log('getOriginUsage error: ' + JSON.stringify(error));
                  Utils.emitEvent(getUsage, 138040);
                })
            } catch (error) {
              console.error(`PBBErrorCode: ${error.code},  Message: ${error.message}`);
              Utils.emitEvent(getUsage, 138040);
            }
            break;
          }
          case 'emitGetOriginQuotaCallback': {
            let getQuota = -1
            try {
              this.isComplete = -1;
              this.controller.loadUrl($rawfile('getOrigins.html'));
              await waitForExist(() => this.isComplete, this.str, 0);
              web_webview.WebStorage.getOriginQuota(this.origin, (error, quota) => {
                if (quota) {
                  console.log('quota is: ' + quota);
                  getQuota = quota;
                }
                Utils.emitEvent(getQuota > 0, 138050);
              })
            } catch (error) {
              console.error(`PBBErrorCode: ${error.code},  Message: ${error.message}`);
              Utils.emitEvent(getQuota > 0, 138050);
            }
            break;
          }
          case 'emitGetOriginQuotaPromise': {
            let getQuota = -1
            try {
              this.isComplete = -1;
              this.controller.loadUrl($rawfile('getOrigins.html'));
              await waitForExist(() => this.isComplete, this.str, 0);
              web_webview.WebStorage.getOriginQuota(this.origin)
                .then(quota => {
                  console.log('quota is: ' + quota);
                  getQuota = quota;
                  Utils.emitEvent(getQuota > 0, 138060);
                })
                .catch((error: BusinessError) => {
                  console.log('getOriginQuota error: ' + JSON.stringify(error));
                  Utils.emitEvent(getQuota > 0, 138060);
                })
            } catch (error) {
              console.error(`PBBErrorCode: ${error.code},  Message: ${error.message}`);
              Utils.emitEvent(getQuota > 0, 138060);
            }
            break;
          }
          case 'emitGetOriginUsageCallback': {
            let getUsage = -1
            try {
              this.isComplete = -1;
              this.controller.loadUrl($rawfile('getOrigins.html'));
              await waitForExist(() => this.isComplete, this.str, 0);
              web_webview.WebStorage.getOriginUsage(this.origin, (error, usage) => {
                if (usage) {
                  console.log('usage is: ' + usage);
                  getUsage = usage;
                }
                if (getUsage > 0) {
                  Utils.emitEvent(true, 138070);
                } else {
                  Utils.emitEvent(false, 138070);
                }

              })
            } catch (error) {
              console.error(`PBBErrorCode: ${error.code},  Message: ${error.message}`);
              Utils.emitEvent(false, 138070);
            }
            break;
          }
          case 'emitGetOriginUsagePromise': {
            let getUsage = -1
            try {
              this.isComplete = -1;
              this.controller.loadUrl($rawfile('getOrigins.html'));
              await waitForExist(() => this.isComplete, this.str, 0);
              web_webview.WebStorage.getOriginUsage(this.origin)
                .then(usage => {
                  console.log('usage is: ' + usage);
                  getUsage = usage;
                  if (getUsage > 0) {
                    Utils.emitEvent(true, 138080);
                  } else {
                    Utils.emitEvent(false, 138080);
                  }
                })
                .catch((error: BusinessError) => {
                  console.log('getOriginUsage error: ' + JSON.stringify(error));
                  Utils.emitEvent(false, 138080);
                })
            } catch (error) {
              console.error(`PBBErrorCode: ${error.code},  Message: ${error.message}`);
              Utils.emitEvent(false, 138080);
            }
            break;
          }
        }
      })

      Web({ src: Constants.ORIGIN_URL, controller: this.controller })
        .multiWindowAccess(this.testMultiWindowAccess)
        .allowWindowOpenMethod(this.testAllowWindowOpenMethod)
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isComplete = 0;
        })
    }
  }
}