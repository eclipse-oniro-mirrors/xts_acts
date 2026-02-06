/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component'
import Utils from '../../src/test/Util.test';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { JsProxyObject } from '../../src/test/Interfaces';
import { BusinessError } from '@ohos.base';
import { State } from '@ohos.arkui.stateManagement'
import emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'

class testObj {
  constructor() {
  }

  test(): string {
    return 'ArkUI Web Component';
  }

  toString(): string {
    console.log('Web Component toString');
    return 'Web Component toString';
  }
}

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct Index {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  nativePort: webView.WebMessagePort | null = null;
  @State webResult: string = ' ';
  @State javaScriptAccess: boolean = true;
  @State ports: webView.WebMessagePort[] | null = null;
  @State testObj: testObj = new testObj();
  @State sourceID: string = 'test';
  @State message: webView.WebMessageExt = new webView.WebMessageExt();
  no_error: string = 'no error happened'
  stringObj: StringFields  = new StringFields ();

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.stringObj.str = strValue;
      }
    }
  }
  private jsObj: JsProxyObject = {
    test: (res: object) => {
      Utils.emitEvent(String(res), 102);
    },
    showString: (str: string) => {
      console.info('ets showString:' + String(str));
    },
    register: (res: object) => {
      Utils.emitEvent(String(res), 86);
      return 'web222'
    }
  } as JsProxyObject;

  build() {
    Column() {
      Row() {
        Button('JsMessageExtErrorCode click').key('JsMessageExtErrorCodeButton').onClick((e: ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {

            case 'testJsMessageExtGetStringError001': {
              try {
                this.controller.runJavaScriptExt(
                  'getNumber()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30400)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getString()
                        Utils.emitEvent(this.no_error, 30400)
                      } catch (error) {
                        error = error as BusinessError;
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                        Utils.emitEvent(String(error.code), 30400)
                      }
                    }
                  });
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 30400)
              }
              break;
            }

            case 'testJsMessageExtGetStringError002': {
              try {
                this.controller.runJavaScriptExt(
                  'getBoolean()',
                  (error, result) => {
                    if (error) {
                      console.info(`run JavaScript error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30401)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getString()
                        Utils.emitEvent(this.no_error, 30401)
                      } catch (error) {
                        error = error as BusinessError;
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                        Utils.emitEvent(String(error.code), 30401)
                      }
                    }
                  });
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 30401)
              }
              break;
            }

            case 'testJsMessageExtGetStringError003': {
              try {
                this.controller.runJavaScriptExt(
                  'getArrayBuffer()',
                  (error, result) => {
                    if (result) {
                      if (error) {
                        console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                        Utils.emitEvent(String(error.code), 30402)
                      }
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getString()
                        Utils.emitEvent(this.no_error, 30402)
                      } catch (error) {
                        error = error as BusinessError;
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                        Utils.emitEvent(String(error.code), 30402)
                      }
                    }
                  });

              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 30402)
              }
              break;
            }

            case 'testJsMessageExtGetStringError004': {
              try {
                this.controller.runJavaScriptExt(
                  'getArray()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30403)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getString()
                        Utils.emitEvent(this.no_error, 30403)
                      } catch (error) {
                         error = error as BusinessError;
                         
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                        Utils.emitEvent(String(error.code), 30403)
                      }
                    }
                  });
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 30403)
              }
              break;
            }

            case 'testJsMessageExtGetNumberError001': {
              try {
                this.controller.runJavaScriptExt(
                  'getString()',
                  (error, result) => {
                    if (result) {
                      if (error) {
                        console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                        Utils.emitEvent(String(error.code), 30410)
                      }
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getNumber()
                        Utils.emitEvent(this.no_error, 30410)
                      } catch (error) {
                        error = error as BusinessError;
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                        Utils.emitEvent(String(error.code), 30410)
                      }
                    }
                  });
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 30410)
              }
              break;
            }

            case 'testJsMessageExtGetNumberError002': {
              try {
                this.controller.runJavaScriptExt(
                  'getBoolean()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30411)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getNumber()
                        Utils.emitEvent(this.no_error, 30411)
                      } catch (error) {
                        error = error as BusinessError;
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                        Utils.emitEvent(String(error.code), 30411)
                      }
                    }
                  });
              } catch (error) {
                 error = error as BusinessError;
                 
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 30411)
              }
              break;
            }

            case 'testJsMessageExtGetNumberError003': {
              try {
                this.controller.runJavaScriptExt(
                  'getArrayBuffer()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30412)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getNumber()
                        Utils.emitEvent(this.no_error, 30412)
                      } catch (error) {
                        error = error as BusinessError;
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                        Utils.emitEvent(String(error.code), 30412)
                      }
                    }
                  });
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 30412)
              }
              break;
            }

            case 'testJsMessageExtGetNumberError004': {
              try {
                this.controller.runJavaScriptExt(
                  'getArray()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30413)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getNumber()
                        Utils.emitEvent(this.no_error, 30413)
                      } catch (error) {
                        error = error as BusinessError;
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                        Utils.emitEvent(String(error.code), 30413)
                      }
                    }
                  });

              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 30413)
              }
              break;
            }

            case 'testJsMessageExtGetBooleanError001': {
              try {
                this.controller.runJavaScriptExt(
                  'getString()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30420)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getBoolean()
                        Utils.emitEvent(this.no_error, 30420)
                      } catch (error) {
                        error = error as BusinessError;
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                        Utils.emitEvent(String(error.code), 30420)
                      }
                    }
                  });
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 30420)
              }
              break;
            }

            case 'testJsMessageExtGetBooleanError002': {
              try {
                this.controller.runJavaScriptExt(
                  'getNumber()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30421)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getBoolean()
                        Utils.emitEvent(this.no_error, 30421)
                      } catch (error) {
                        error = error as BusinessError;
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                        Utils.emitEvent(String(error.code), 30421)
                      }
                    }
                  });
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 30421)
              }
              break;
            }

            case 'testJsMessageExtGetBooleanError003': {
              try {
                this.controller.runJavaScriptExt(
                  'getArrayBuffer()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30422)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getBoolean()
                        Utils.emitEvent(this.no_error, 30422)
                      } catch (error) {
                         error = error as BusinessError;
                         
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                        Utils.emitEvent(String(error.code), 30422)
                      }
                    }
                  });
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 30422)
              }
              break;
            }
            case 'testJsMessageExtGetBooleanError004': {
              try {
                this.controller.runJavaScriptExt(
                  'getArray()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30423)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getBoolean()
                        Utils.emitEvent(this.no_error, 30423)
                      } catch (error) {
                        error = error as BusinessError;
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                        Utils.emitEvent(String(error.code), 30423)
                      }
                    }
                  });
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 30423)
              }
              break;
            }
            case 'testJsMessageExtGetArrayBufferError001': {
              try {
                this.controller.runJavaScriptExt(
                  'getString()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30430)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getArrayBuffer()
                        Utils.emitEvent(this.no_error, 30430)
                      } catch (error) {
                        error = error as BusinessError;
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                        Utils.emitEvent(String(error.code), 30430)
                      }
                    }
                  });
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 30430)
              }
              break;
            }

            case 'testJsMessageExtGetArrayBufferError002': {
              try {
                this.controller.runJavaScriptExt(
                  'getNumber()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30431)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getArrayBuffer()
                        Utils.emitEvent(this.no_error, 30431)
                      } catch (error) {
                        error = error as BusinessError;
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                        Utils.emitEvent(String(error.code), 30431)
                      }
                    }
                  });
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 30431)
              }
              break;
            }

            case 'testJsMessageExtGetArrayBufferError003': {
              try {
                this.controller.runJavaScriptExt(
                  'getBoolean()',
                  (error, result) => {
                    if (result) {
                      if (error) {
                        console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                        Utils.emitEvent(String(error.code), 30432)
                      }
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getArrayBuffer()
                        Utils.emitEvent(this.no_error, 30432)
                      } catch (error) {
                        error = error as BusinessError;
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                        Utils.emitEvent(String(error.code), 30432)
                      }
                    }
                  });
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 30432)
              }
              break;
            }

            case 'testJsMessageExtGetArrayBufferError004': {
              try {
                this.controller.runJavaScriptExt(
                  'getArray()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30433)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getArrayBuffer()
                        Utils.emitEvent(this.no_error, 30433)
                      } catch (error) {
                        error = error as BusinessError;
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                        Utils.emitEvent(String(error.code), 30433)
                      }
                    }
                  });
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 30433)
              }
              break;
            }

            case 'testJsMessageExtGetArrayError001': {
              try {
                this.controller.runJavaScriptExt(
                  'getString()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30440)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getArray()
                        Utils.emitEvent(this.no_error, 30440)
                      } catch (error) {
                        error = error as BusinessError;
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                        Utils.emitEvent(String(error.code), 30440)
                      }
                    }
                  });
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 30440)
              }
              break;
            }

            case 'testJsMessageExtGetArrayError002': {
              try {
                this.controller.runJavaScriptExt(
                  'getNumber()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30441)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getArray()
                        Utils.emitEvent(this.no_error, 30441)
                      } catch (error) {
                        error = error as BusinessError;
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                        Utils.emitEvent(String(error.code), 30441)
                      }
                    }
                  });
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 30441)
              }
              break;
            }

            case 'testJsMessageExtGetArrayError003': {
              try {
                this.controller.runJavaScriptExt(
                  'getBoolean()',
                  (error, result) => {
                    if (result) {
                      if (error) {
                        console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                        Utils.emitEvent(String(error.code), 30442)
                      }
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getArray()
                        Utils.emitEvent(this.no_error, 30442)
                      } catch (error) {
                        error = error as BusinessError;
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                        Utils.emitEvent(String(error.code), 30442)
                      }
                    }
                  });
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 30442)
              }
              break;
            }

            case 'testJsMessageExtGetArrayError004': {
              try {
                this.controller.runJavaScriptExt(
                  'getArrayBuffer()',
                  (error, result) => {
                    if (result) {
                      if (error) {
                        console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                        Utils.emitEvent(String(error.code), 30443)
                      }
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getArray()
                        Utils.emitEvent(this.no_error, 30443)
                      } catch (error) {
                        error = error as BusinessError;
                        console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                        Utils.emitEvent(String(error.code), 30443)
                      }
                    }
                  });
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 30443)
              }
              break;
            }

            case 'SwitchNextPageStatic' : {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webViewControllerErrorCode' })
              console.log('push URL success')
              break;
            }
          }
        })
      }

      Web({ src: 'resource://rawfile/getJsMessageExt.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .javaScriptProxy({
          jsObject: this.jsObj,
          name: 'backToEts',
          methodList: ['test', 'toString'],
          controller: this.controller
        })
    }
  }
}
